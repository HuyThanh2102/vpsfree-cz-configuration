{ lib, config, pkgs, ... }:

with lib;

let
  cfg = config.web;
  domain = cfg.domain;
  pinned = import ../pinned.nix { inherit lib pkgs; };

  docs = pkgs.runCommand "docsroot" { buildInputs = [ pinned.nixpkgsVpsFree.mkdocs ]; } ''
    mkdir -p $out
    pushd ${pinned.vpsadminosGit}
    mkdocs build --site-dir $out
    popd
  '';

  buildMan = component: pkgs.runCommand "${replaceStrings ["/"] ["_"] component}_man" { buildInputs = [ pinned.vpsadminosDocsPkgs.osctl-env-exec pkgs.git ]; } ''
    mkdir man
    cp -R ${pinned.vpsadminosGit} vpsadminos
    chmod -R +w vpsadminos
    pushd vpsadminos/${component}
      touch man/style.css
      osctl-env-exec rake md2man:web
      mkdir $out
      cp -R man/* $out/
    popd
    # hack around md2man unable to generate style.css due to creating
    # it readonly, which we workaround with touch which results in empty style..
    rm -rf $out/style.css
    cp $(osctl-env-exec 'bash -c "echo $BUNDLE_PATH"')/gems/md2man-*/lib/md2man/rakefile/style.css $out/style.css
  '';

  man = pkgs.runCommand "manroot" { } ''
    mkdir $out
    ln -s ${buildMan "osctl"} $out/osctl
    ln -s ${buildMan "converter"} $out/converter
    ln -s ${buildMan "osup"} $out/osup
  '';

  ref = pkgs.runCommand "refroot" { buildInputs = [ pinned.vpsadminosDocsPkgs.osctl-env-exec pkgs.git ]; } ''
    cp -R ${pinned.vpsadminosGit} vpsadminos
    chmod -R +w vpsadminos
    mkdir $out
    pushd vpsadminos
      for gem in libosctl osctl osctld converter ; do
        pushd $gem
          mkdir $out/$gem
          YARD_OUTPUT=$out/$gem osctl-env-exec rake yard
          test -f $out/$gem/index.html || (echo "gem $gem didn't produce index.html" && exit 1);
        popd
      done
    popd
  '';

  # XXX: if we decide to sign templates as well
  #templates_root = pkgs.runCommand "templatesroot" { buildInputs = [ pkgs.openssl ]; } ''
  #  mkdir -pv $out

  #  function signit {
  #    openssl cms -sign -binary -noattr -in $1 -signer ${../static/ca/codesign.crt} -inkey ${../static/ca/codesign.key} -certfile ${../static/ca/root.pem} -outform DER -out ''${1}.sig
  #  }
  #  signit $out/XYZ
  #'';

in
{
  options = {
    web = rec {
      domain = mkOption {
        type = types.str;
        description = "Domain of the webserver";
        default = config.global.domain;
      };

      acmeSSL = mkOption {
        type = types.bool;
        description = "Enable ACME and SSL for nginx";
        default = false;
      };
    };
  };

  config = {
    services.nginx = {
      enable = true;
      recommendedTlsSettings = cfg.acmeSSL;
      recommendedProxySettings = true;
      commonHttpConfig = "server_names_hash_bucket_size 32;";
      virtualHosts = {
        "${domain}" = {
          root = docs;
          forceSSL = cfg.acmeSSL;
          enableACME = cfg.acmeSSL;
        };

        "templates.${domain}" = {
          root = "/srv/templates";
          forceSSL = cfg.acmeSSL;
          enableACME = cfg.acmeSSL;
          locations = {
            "/" = {
              extraConfig = "autoindex on;";
            };
          };
        };

        "man.${domain}" = {
          root = man;
          forceSSL = cfg.acmeSSL;
          enableACME = cfg.acmeSSL;
          locations = {
            "/" = {
              extraConfig = "autoindex on;";
            };
          };
        };

        "ref.${domain}" = {
          root = ref;
          forceSSL = cfg.acmeSSL;
          enableACME = cfg.acmeSSL;
          locations = {
            "/" = {
              extraConfig = "autoindex on;";
            };
          };
        };

        "hydra.${domain}" = {
          forceSSL = cfg.acmeSSL;
          enableACME = cfg.acmeSSL;
          locations = {
            "/" = {
              proxyPass = "http://172.16.0.7:8080";
              # XXX: hosts are sometimes missing this..
              #proxyPass = "http://hydra:8080";
            };
          };
        };

      };
    };

  };
}

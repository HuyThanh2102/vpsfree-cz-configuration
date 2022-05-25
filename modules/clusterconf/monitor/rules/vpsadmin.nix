{ lib }:
let
  chains = rec {
    backup = "TransactionChains::Dataset::Backup";
    fullDownload = "TransactionChains::Dataset::FullDownload";
    vpsStart = "TransactionChains::Vps::Start";
    vpsRestart = "TransactionChains::Vps::Restart";
    vpsStop = "TransactionChains::Vps::Stop";
    vpsMigrateVz = "TransactionChains::Vps::Migrate::VzToVz";
    vpsMigrateOs = "TransactionChains::Vps::Migrate::OsToOs";
    specials = [
      backup fullDownload
      vpsStart vpsRestart vpsStop
      vpsMigrateVz vpsMigrateOs
    ];
  };
in [
  {
    name = "vpsadmin";
    rules = [
      {
        alert = "VpsAdminApiNotActive";
        expr = ''node_systemd_unit_state{name="vpsadmin-api.service",state="active"} == 0'';
        for = "10m";
        labels = {
          severity = "warning";
          frequency = "15m";
        };
        annotations = {
          summary = "vpsadmin-api.service on {{ $labels.node_name }} is not active";
          description = ''
            vpsadmin-api.service on {{ $labels.node_name }} is not active

            LABELS: {{ $labels }}
          '';
        };
      }

      {
        alert = "VpsAdminWebuiNotActive";
        expr = ''node_systemd_unit_state{name="phpfpm-vpsadmin-webui.service",state="active"} == 0'';
        for = "10m";
        labels = {
          severity = "warning";
          frequency = "15m";
        };
        annotations = {
          summary = "phpfpm-vpsadmin-webui.service on {{ $labels.node_name }} is not active";
          description = ''
            phpfpm-vpsadmin-webui.service on {{ $labels.node_name }} is not active

            LABELS: {{ $labels }}
          '';
        };
      }

      {
        alert = "VpsAdminConsoleRouterNotActive";
        expr = ''node_systemd_unit_state{name="vpsadmin-console-router.service",state="active"} == 0'';
        for = "10m";
        labels = {
          severity = "warning";
          frequency = "15m";
        };
        annotations = {
          summary = "vpsadmin-console-router.service on {{ $labels.node_name }} is not active";
          description = ''
            vpsadmin-console-router.service on {{ $labels.node_name }} is not active

            LABELS: {{ $labels }}
          '';
        };
      }

      {
        alert = "NodeCtldUnresponsive";
        expr = ''vpsadmin_node_last_report_seconds{node_platform="vpsadminos"} >= 90'';
        labels = {
          severity = "warning";
          frequency = "15m";
        };
        annotations = {
          summary = "nodectld on {{ $labels.node_name }} is not responding";
          description = ''
            nodectld on {{ $labels.node_name }} is not responding

            LABELS: {{ $labels }}
          '';
        };
      }

      {
        alert = "VpsAdmindUnresponsive";
        expr = ''vpsadmin_node_last_report_seconds{node_platform="openvz"} >= 90'';
        labels = {
          severity = "warning";
          frequency = "15m";
        };
        annotations = {
          summary = "vpsAdmind on {{ $labels.node_name }} is not responding";
          description = ''
            vpsAdmind on {{ $labels.node_name }} is not responding

            LABELS: {{ $labels }}
          '';
        };
      }

      {
        alert = "TransactionChainFatal";
        expr = ''vpsadmin_transaction_chain_fatal == 1'';
        labels = {
          severity = "warning";
          frequency = "1h";
        };
        annotations = {
          summary = "Transaction chain {{ $labels.chain_id }} is in state fatal";
          description = ''
            Transaction chain {{ $labels.chain_id }} ({{ $labels.chain_type }})
            is in state fatal and needs to be resolved.

            LABELS: {{ $labels }}
          '';
        };
      }

      {
        alert = "VpsStartDelayed";
        expr = ''vpsadmin_transaction_chain_queued_seconds{chain_type="${chains.vpsStart}"} >= 15*60'';
        labels = {
          severity = "critical";
          frequency = "10m";
        };
        annotations = {
          summary = "Transaction chain {{ $labels.chain_id }} takes too long to start a VPS";
          description = ''
            Transaction chain {{ $labels.chain_id }} ({{ $labels.chain_type }})
            is in state {{ $labels.chain_state }} for too long and is potentially
            stuck.

            LABELS: {{ $labels }}
          '';
        };
      }

      {
        alert = "VpsRestartDelayed";
        expr = ''vpsadmin_transaction_chain_queued_seconds{chain_type="${chains.vpsRestart}"} >= 15*60'';
        labels = {
          severity = "critical";
          frequency = "10m";
        };
        annotations = {
          summary = "Transaction chain {{ $labels.chain_id }} takes too long to restart a VPS";
          description = ''
            Transaction chain {{ $labels.chain_id }} ({{ $labels.chain_type }})
            is in state {{ $labels.chain_state }} for too long and is potentially
            stuck.

            LABELS: {{ $labels }}
          '';
        };
      }

      {
        alert = "VpsStopDelayed";
        expr = ''vpsadmin_transaction_chain_queued_seconds{chain_type="${chains.vpsStop}"} >= 15*60'';
        labels = {
          severity = "critical";
          frequency = "10m";
        };
        annotations = {
          summary = "Transaction chain {{ $labels.chain_id }} takes too long to stop a VPS";
          description = ''
            Transaction chain {{ $labels.chain_id }} ({{ $labels.chain_type }})
            is in state {{ $labels.chain_state }} for too long and is potentially
            stuck.

            LABELS: {{ $labels }}
          '';
        };
      }

      {
        alert = "VpsMigrationDelayed";
        expr = ''vpsadmin_transaction_chain_queued_seconds{chain_type=~"${chains.vpsMigrateVz}|${chains.vpsMigrateOs}"} >= 24*60*60'';
        labels = {
          severity = "warning";
          frequency = "10m";
        };
        annotations = {
          summary = "Transaction chain {{ $labels.chain_id }} takes too long to migrate a VPS";
          description = ''
            Transaction chain {{ $labels.chain_id }} ({{ $labels.chain_type }})
            is in state {{ $labels.chain_state }} for too long and is potentially
            stuck.

            LABELS: {{ $labels }}
          '';
        };
      }

      {
        alert = "DatasetBackupDelayed";
        expr = ''vpsadmin_transaction_chain_queued_seconds{chain_type="${chains.backup}"} >= 12*60*60'';
        labels = {
          severity = "warning";
          frequency = "1h";
        };
        annotations = {
          summary = "Transaction chain {{ $labels.chain_id }} takes too long";
          description = ''
            Transaction chain {{ $labels.chain_id }} ({{ $labels.chain_type }})
            is in state {{ $labels.chain_state }} for too long and is potentially
            stuck.

            LABELS: {{ $labels }}
          '';
        };
      }

      {
        alert = "BackupDownloadDelayed";
        expr = ''vpsadmin_transaction_chain_queued_seconds{chain_type="${chains.fullDownload}"} >= 12*60*60'';
        labels = {
          severity = "warning";
          frequency = "1h";
        };
        annotations = {
          summary = "Transaction chain {{ $labels.chain_id }} takes too long";
          description = ''
            Transaction chain {{ $labels.chain_id }} ({{ $labels.chain_type }})
            is in state {{ $labels.chain_state }} for too long and is potentially
            stuck.

            LABELS: {{ $labels }}
          '';
        };
      }

      {
        alert = "TransactionChainDelayed";
        expr = ''vpsadmin_transaction_chain_queued_seconds{chain_type!~"${lib.concatStringsSep "|" chains.specials}"} >= 3*60*60'';
        labels = {
          severity = "warning";
          frequency = "15m";
        };
        annotations = {
          summary = "Transaction chain {{ $labels.chain_id }} takes too long";
          description = ''
            Transaction chain {{ $labels.chain_id }} ({{ $labels.chain_type }})
            is in state {{ $labels.chain_state }} for too long and is potentially
            stuck.

            LABELS: {{ $labels }}
          '';
        };
      }
    ];
  }
]

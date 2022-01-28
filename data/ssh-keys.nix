rec {
  admins =
    aither.all
    ++
    [ kerrycze martyet snajpa ];

  builders = [
    build-vpsfree-cz
  ];

  aither = rec {
    ws = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDJL5CEMBEQA704OIgyg8/1WX4Z63gVXvvaIrz1jLSMlBdnE0daUdeD7NLCsV+RIZGywQj44im6lW8ahGdj4ivXHeLxaCCaWfzYMa2Q9AmQwJFQIrA8l+9c5bFaesMugaHJcEbS/hykuuaCyq8G77WSZVvoYVsM8Hte0hasEi5c6BrDY+54N01gnRdlkZ6Kw2HhGsh8jddAppapR69kA16Qn0FK9JMMY4WhoV7vOawn+RbpmryUP8B7rKcUFMXo1Q9ULF7igRLMpFDdG0OD9dIDv/WaRh8NKMFMUKsot9zONKf2krsjRNVjwBtY2RId1zkTseNrvjXcOjrp0VudG1t97VBqwIUm0ISnysfUz73hmVBvNPhE8yQ8Qy0Z3LVHxDWxH2mN8uwVXG8F16Z7n+Lgu8m8C8P+1wTGTbZtrtVYNwF+SpRNGrfVxI+RKFAIa9K+rZDR8THhO4MRhJuQlIEwhIBw3vSPxGrYODZv6vaEse/3wdi4Sztcv+n5MxrAn9mqfycE3LNXE2ZBQtXyxnKEq/XnPAcWJeLoLqKe4zehXoKKPXl5TcaTuv2UWpVDywGGwGoNucVLulMiUVE0F7At1G5h83lq78uVz2cJyNEwi2VkW72sgSlSKZgGtFwmGHKX1MlEZl5W/A9Tz0InnqRQUsSHg5gwOIjV9d+0IGvnyw== aither@orion";

    ipad = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDCEmTs1coBrWSjDqwcVBx20OrA01PY6pV91mnp2+kPvmqF2xhWo8cJyXUwSHvkXf0lKt8l5VMx44CoGZC2IEDZQErmMKia2nPoyKKt2QUFu4niLyHdO1k6XiCDmxs7EW0Dc3q1VztnmjNdrpDi8Nt5bvkxB+eTxfgz4KCbSP9AgUYzCpB4A98sW36JVGhWnY3LLV8IRe6Ib2gnfFl5bRipjuNCc5+RffittmWdYuEaN/50QzTrsgNKOVd4rnq0k+yqY2A9//MVh6gCSEQ/KnU43ebE+hKD7Bj39/rlMKRBOm6fwOUc9wZ51FgVh7STxXH55I60n+fumbPnCZJHFzmoas7ueyhpMXSDrK79BJMR+FKK33z+NGl0r8MJX4FmJqzmhY34e2xxNlQEqVqGCv0J0kAXMtAqlube/TpvYuTj0rasTJtxbkhglrmF5+7YtWIkAsyh5lUOaaFazlgBWamDd2QpCOMjvEbjUbMM+lHGydWzV3HvRT6UA8YOkib1Gc8qu2m3rEEa6rjz1Oaw044InEjdQMrZzC0yA8ae1VZeNRFnpfcL4wRaI5R97KaB3eswp9SN8KfYWIa0wDsK8LRxLGmur8tnmrXpsmluEby+6pDgegZKEPY2t+yz6YMyBx5uZsddW6deNu2USgqyXjXDCXJFgeAHmFChvediVsw9Iw== aither@ipad";

    all = [ ws ipad ];
  };

  kerrycze = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCgP+2I9jKam2j11qLTsJ1X49LXvBVvlspBCdDfUosxPQcXLHNoKgUxRyG5OInu5QmTrzZtc0/urXvcJLPhBzUnWrVejK4uNQbbgy8BymUtCaVECNfimnsJAeJm8uMNuVFj0jFICoKq62onjdvya8c1fITkS/jPa3nFbMFDLA2p+LZqv6uzZSj5N0hKCiozPCIgtJAdvXtSVDHfOaPCuvo1ugwz/fLTbGPMYUYvaZ+5Wj6H3lH6MjXrCMVxSmKbn665MkmN6jS4oJA6L7KhvhFi+4tPoIfz59X1CKvUuXLrDJT/GB603+GnV0Zy2xgfaMswXK4OYFtTiWjsDLp5rwWogB06LPShVF0NRp7XcxNxvTkxMHlN/B0GGpfTPcC+ObZCdYbpeJ7g8HwQ5zJaLM6VTCfKCH4hHRXHVpPdONiUI0fDJL9Ywtq2qA/eByA0JYLepFfg1/HIx2L7rzBF1PUUzruCR1hvRMa2GcqzVuKeB9pwQZTP0azp0lXPdNLKqUhH/CSSlmcehXfz9asxamnp5oyF8/SDdrJqP9h/qq6w5KVUlH0yX/snhwyXs9vOR+1VKT178OrB/Zd/AcgLbLn/SUDI6v6HObCqr5rXd/g+gHqiDBCbvhmNaI9lKWOUcxxLf7umgQ+I5oIsOMO5KdWpj7EPYZjH+Id7zvFWpwYp9w== kerrycze@myDELL";

  martyet = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDP3Q9jQbk3X43Sv6yHFmnqzqBuYudbhdg/QHPbMaNBY5F9JPH0ThO4OdUI8nrMRaLhNFptEano/vSR+2/yPQJPtLoLArMBJHgWZ3NKgGsKuiCW8lIIWqagHVQQOsdUd/pizqTWI/G8yf4RIDllB6PDxGIcB++HIW9LVmOoGI0Fg+3LmnlhnQV81mPk2/9DKCQl2lnG1JQ3/e/851c0qaYVSW0KbQy5Br6JTh2mcUJO4FvtHCNsKW+s/bug23zMH/4rvo2CXsJbR+HNnAjS/OzPXz7BPunsU0GrJ3WpogSC4eFPN5Mtv4gz5pXZnAon0PAdyDxYoynRCd+ULjiSI6t1DOXg52SNFatdqUHVMKBi3+M7VTLSUgXtEEpA9cgRAyY4KYQ3SYfjuCP8DDNn/8s+k+tPdNHcafmE+iJ12IuFWXL+LCWvR0/K/iVbtLPBQW1Y5V0uoLXsmFeAVo8qny670sPJVl1a2AHkgccfw3tzC1Xk5bGBYgMEVxNLIQKu4DyPy1MiZi8oBgpAae1XDffrQ7hWWe3Tri+7VLrmJEC1/fRRzy7QwpTP9WOEMa8+ZQAf8ZNZvl9OcoS4axEhw7rnnJNTHWdetwxnhiqo7QsE7EL0+MC4geSadDnQKtzWdPBa3Z1N0XaxvWMhOTMpCaXnIy1wGfNnhe4xPvAyLr/a2Q== root@martyet-bjorn";

  snajpa = "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBK29/yHdxakVaJMYiIMBKb8nYGaj/gSQI4zErNVcbvsUpSiQuD+TLhIWYxR79D9rHFypMRm6aaEbeMHtw+TRjoI= snajpa@snajpaStation";

  build-vpsfree-cz = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC1qn/zZ6OUdlU23/yMG10c+BkqMKTNW1TUMwj8RqwfBaE4bAVeNfRGZdx/8VA0Wq50L09oPd+iVFI9BWXvpRwK31ZnaiIeoJUtBzqiBM1RXc+7Xj2L2NJlX1MHjcprxX6T5MBPRbimAT2/pcGPDwgedCmT3C9gPm6xo+bHZReD7fs8TWodU81lM4U3mOwprF50lhH3SFu6SDUuiksjS0IciL54fPQJm3FU0SaM8OinUBCpG327pMAiA87CneKM7PWI01k/q/2YDByQgwGA6CnLGYv6BRUpCxGXjm2FWQ2kgD6H8/g9Rlt2st2mtoBbMqBQHwCCdJklUra5zzn+ieItCHZpfQfxe/Gwn9+Eb21Joasn/K1N7Y+r+rQb/tZe7BnOoyV/f1kZBx5gSCQlv3tyqtpArurLlCZwJvG83IA56DH//ymJvlrckF/tQXdfOfk86Z5h/7uxMNvlhFeZXp0DjdTu9lh96ThXtiPt7mnDJFHjcsLiws/Szbs7IhdF+nh6Ai8PfYozZAIdRnxqa6kfL05NAsxiXcaY2SsBDok4KGfcZhJKMUanfO6i2tJ4Amy37Bz6wHU98dhoAE0o0Embogh+xuW0D8lPxeKYjpbF6m/pCDXDg1KX6SPd43NnLBC7WclBy4dLguviIPidZN0ejCGN3bxGg6y+/ZUa3+/ANQ== root@build";
}

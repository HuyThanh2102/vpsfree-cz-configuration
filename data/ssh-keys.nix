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

    ipad = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDgH5J3Wu48WaFzqnSzNpgoSa6RluosBC3CCpRNZDwb0/5nzs/YyES463vPbMqJEzcFt8KxeOFoWSZUruzgTTtTr4jRNqVG77XA7TN9mU8qullXiP91OPk9FYxLYh57Bi+FvIKmR8WAS5t0YMFecch9NVBY5WB8QxT8P2n1hA4jxjbVB42lgeAAsSmHshH3DUHGWnQw268FspS1fXbV8x8dOLlUoqCGtxUULGD6uXew4X4QN26PDe3+4ELY2ev+UK/BL0r8P/nNykm+QyqiSrpuZe+dG7x7ebqkrf1HpFvwioM5RUfnCzDkK2A+IfKlM3iopksdmc/6cRxXx7MquVo3hL1hYwPaJOwPlrBsPrJwVQ5NFPfXv2OjUYIDXPDadNFrGbC008I0g+1NUtrKwMwqeME6QMJfzwwcnQuig83xdSx6nekNp16nz6X/7ttT2X+HJFURlhdfNFpaxdRQaX0qlAeHV552qJNMcFpHwhsQRFePLcKob9HZH3W7jCueTD0TagbdOrvMFhYsVhkAjKFL07OKRAwc1O07uFxS8L5EmLJCqqEq5Di17k7XT8EKrzcBcF3SidrpJU+QJ/xMgVyHQXSxTgwQva2N4Bmi8jtKipoqQRWkAtiRvQqFargTpSnq+wxZL7i2EfyMMUPk55+2iork2my01M+L/7ct9ASOTw== mobile@ipad";

    all = [ ws ipad ];
  };

  kerrycze = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCgP+2I9jKam2j11qLTsJ1X49LXvBVvlspBCdDfUosxPQcXLHNoKgUxRyG5OInu5QmTrzZtc0/urXvcJLPhBzUnWrVejK4uNQbbgy8BymUtCaVECNfimnsJAeJm8uMNuVFj0jFICoKq62onjdvya8c1fITkS/jPa3nFbMFDLA2p+LZqv6uzZSj5N0hKCiozPCIgtJAdvXtSVDHfOaPCuvo1ugwz/fLTbGPMYUYvaZ+5Wj6H3lH6MjXrCMVxSmKbn665MkmN6jS4oJA6L7KhvhFi+4tPoIfz59X1CKvUuXLrDJT/GB603+GnV0Zy2xgfaMswXK4OYFtTiWjsDLp5rwWogB06LPShVF0NRp7XcxNxvTkxMHlN/B0GGpfTPcC+ObZCdYbpeJ7g8HwQ5zJaLM6VTCfKCH4hHRXHVpPdONiUI0fDJL9Ywtq2qA/eByA0JYLepFfg1/HIx2L7rzBF1PUUzruCR1hvRMa2GcqzVuKeB9pwQZTP0azp0lXPdNLKqUhH/CSSlmcehXfz9asxamnp5oyF8/SDdrJqP9h/qq6w5KVUlH0yX/snhwyXs9vOR+1VKT178OrB/Zd/AcgLbLn/SUDI6v6HObCqr5rXd/g+gHqiDBCbvhmNaI9lKWOUcxxLf7umgQ+I5oIsOMO5KdWpj7EPYZjH+Id7zvFWpwYp9w== kerrycze@myDELL";

  martyet = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDP3Q9jQbk3X43Sv6yHFmnqzqBuYudbhdg/QHPbMaNBY5F9JPH0ThO4OdUI8nrMRaLhNFptEano/vSR+2/yPQJPtLoLArMBJHgWZ3NKgGsKuiCW8lIIWqagHVQQOsdUd/pizqTWI/G8yf4RIDllB6PDxGIcB++HIW9LVmOoGI0Fg+3LmnlhnQV81mPk2/9DKCQl2lnG1JQ3/e/851c0qaYVSW0KbQy5Br6JTh2mcUJO4FvtHCNsKW+s/bug23zMH/4rvo2CXsJbR+HNnAjS/OzPXz7BPunsU0GrJ3WpogSC4eFPN5Mtv4gz5pXZnAon0PAdyDxYoynRCd+ULjiSI6t1DOXg52SNFatdqUHVMKBi3+M7VTLSUgXtEEpA9cgRAyY4KYQ3SYfjuCP8DDNn/8s+k+tPdNHcafmE+iJ12IuFWXL+LCWvR0/K/iVbtLPBQW1Y5V0uoLXsmFeAVo8qny670sPJVl1a2AHkgccfw3tzC1Xk5bGBYgMEVxNLIQKu4DyPy1MiZi8oBgpAae1XDffrQ7hWWe3Tri+7VLrmJEC1/fRRzy7QwpTP9WOEMa8+ZQAf8ZNZvl9OcoS4axEhw7rnnJNTHWdetwxnhiqo7QsE7EL0+MC4geSadDnQKtzWdPBa3Z1N0XaxvWMhOTMpCaXnIy1wGfNnhe4xPvAyLr/a2Q== root@martyet-bjorn";

  snajpa = "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBK29/yHdxakVaJMYiIMBKb8nYGaj/gSQI4zErNVcbvsUpSiQuD+TLhIWYxR79D9rHFypMRm6aaEbeMHtw+TRjoI= snajpa@snajpaStation";

  build-vpsfree-cz = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC1qn/zZ6OUdlU23/yMG10c+BkqMKTNW1TUMwj8RqwfBaE4bAVeNfRGZdx/8VA0Wq50L09oPd+iVFI9BWXvpRwK31ZnaiIeoJUtBzqiBM1RXc+7Xj2L2NJlX1MHjcprxX6T5MBPRbimAT2/pcGPDwgedCmT3C9gPm6xo+bHZReD7fs8TWodU81lM4U3mOwprF50lhH3SFu6SDUuiksjS0IciL54fPQJm3FU0SaM8OinUBCpG327pMAiA87CneKM7PWI01k/q/2YDByQgwGA6CnLGYv6BRUpCxGXjm2FWQ2kgD6H8/g9Rlt2st2mtoBbMqBQHwCCdJklUra5zzn+ieItCHZpfQfxe/Gwn9+Eb21Joasn/K1N7Y+r+rQb/tZe7BnOoyV/f1kZBx5gSCQlv3tyqtpArurLlCZwJvG83IA56DH//ymJvlrckF/tQXdfOfk86Z5h/7uxMNvlhFeZXp0DjdTu9lh96ThXtiPt7mnDJFHjcsLiws/Szbs7IhdF+nh6Ai8PfYozZAIdRnxqa6kfL05NAsxiXcaY2SsBDok4KGfcZhJKMUanfO6i2tJ4Amy37Bz6wHU98dhoAE0o0Embogh+xuW0D8lPxeKYjpbF6m/pCDXDg1KX6SPd43NnLBC7WclBy4dLguviIPidZN0ejCGN3bxGg6y+/ZUa3+/ANQ== root@build";
}

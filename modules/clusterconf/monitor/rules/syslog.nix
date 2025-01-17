[
  {
    name = "syslog";
    rules = [
      {
        alert = "SyslogExporterDown";
        expr = ''up{job="log"} == 0'';
        for = "10m";
        labels = {
          severity = "critical";
        };
        annotations = {
          summary = "Syslog-exporter down (instance {{ $labels.instance }})";
          description = ''
            Syslog-exporter down

            VALUE = {{ $value }}
            LABELS: {{ $labels }}
          '';
        };
      }

      {
        alert = "NodectldCrashed";
        expr = ''syslog_nodectld_crash == 1'';
        labels = {
          severity = "warning";
          frequency = "1m";
        };
        annotations = {
          summary = "nodectld has crashed (instance {{ $labels.instance }})";
          description = ''
            nodectld has crashed

            LABELS: {{ $labels }}
          '';
        };
      }

      {
        alert = "NodectldSegfault";
        expr = ''syslog_nodectld_segfault == 1'';
        labels = {
          severity = "warning";
          frequency = "1m";
        };
        annotations = {
          summary = "nodectld has segfaulted (instance {{ $labels.instance }})";
          description = ''
            nodectld has segfaulted

            LABELS: {{ $labels }}
          '';
        };
      }

      {
        alert = "NodectldZfsRecvError";
        expr = ''syslog_nodectld_zfs_stream_receive_error == 1'';
        labels = {
          severity = "warning";
          frequency = "1m";
        };
        annotations = {
          summary = "zfs recv stream receive error (instance {{ $labels.instance }})";
          description = ''
            zfs recv run by nodectld failed to receive stream

            LABELS: {{ $labels }}
          '';
        };
      }

      {
        alert = "OsctldInternalError";
        expr = ''syslog_osctld_internal_error == 1'';
        labels = {
          severity = "warning";
          frequency = "1m";
        };
        annotations = {
          summary = "osctld internal error occurred (instance {{ $labels.instance }})";
          description = ''
            An internal error has occurred in osctld

            LABELS: {{ $labels }}
          '';
        };
      }

      {
        alert = "KernelNullPointer";
        expr = ''syslog_kernel_bug{type="nullptr"} == 1'';
        labels = {
          severity = "fatal";
          frequency = "1m";
        };
        annotations = {
          summary = "Kernel NULL pointer dereference has occurred (instance {{ $labels.instance }})";
          description = ''
            Kernel NULL pointer dereference has occurred

            LABELS: {{ $labels }}
          '';
        };
      }

      {
        alert = "KernelGeneralProtectionFault";
        expr = ''syslog_kernel_gpf == 1'';
        labels = {
          severity = "fatal";
          frequency = "1m";
        };
        annotations = {
          summary = "Kernel general protection fault has occurred (instance {{ $labels.instance }})";
          description = ''
            Kernel general protection fault has occurred

            LABELS: {{ $labels }}
          '';
        };
      }

      {
        alert = "KernelEmergencyWarn";
        expr = ''syslog_kernel_emergency == 1'';
        labels = {
          severity = "warning";
          frequency = "1h";
        };
        annotations = {
          summary = "Kernel emergency message detected (instance {{ $labels.instance }})";
          description = ''
            Kernel emergency message has been detected

            LABELS: {{ $labels }}
          '';
        };
      }

      {
        alert = "ZfsPanic";
        expr = ''syslog_zfs_panic == 1'';
        labels = {
          severity = "fatal";
          frequency = "1m";
        };
        annotations = {
          summary = "ZFS panic has occurred (instance {{ $labels.instance }})";
          description = ''
            ZFS panic has occurred

            LABELS: {{ $labels }}
          '';
        };
      }
    ];
  }
]

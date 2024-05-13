listen {
  #port    = 9511      # Default is 9511 
  #address = "0.0.0.0" # Default is "0.0.0.0"
}

consul {
  #enable = true                        # Default is true
  #name = "IISLogExporter"              # Default is "IISLogExporter"
  #address = "http://localhost:8500"    # Default is "http://localhost:8500"
  #deregister_on_service_stop = true    # Default is false
}

metric {
  metric_prefix = "W3SVC1"
  labels        = ["app", "date", "time", "ip", "method", "status", "time_taken", "bytes_sent", "bytes_received", "uri"]
}

logger {
  #output_log_dir = "C:\iislog-prometheus-exporter\logs"    # Default is "<exeDirectory>\logs"
  #rotate_every_mb = 10           # Default is 10
  #number_of_files = 0            # Default is 0
  #files_max_age = 0              # Default is 0
}


site "Default Web Site" {
  logs_dir = "C:/inetpub/logs/LogFiles/W3SVC1"
  label_rules = [
    {
      label_name  = "app"    # Name pointing to label from metric section
      fixed_value = "W3SVC1" # This exact value will be set to label
    },
    {
      label_name = "date"
      source     = "date" # Field name from grok. Label value will be set basing on this field. Default is value of label_name.
      rules = [
        {
          pattern = "copyFromSource" # Exacly copy value from grok field to label
        }
      ]
    },
    {
      label_name = "time"
      source     = "time" # Field name from grok. Label value will be set basing on this field. Default is value of label_name.
      rules = [
        {
          pattern = "copyFromSource" # Exacly copy value from grok field to label
        }
      ]
    },
    {
      label_name = "ip"
      source     = "ip" # Field name from grok. Label value will be set basing on this field. Default is value of label_name.
      rules = [
        {
          pattern = "copyFromSource" # Exacly copy value from grok field to label
        }
      ]
    },
    {
      label_name = "method"
      source     = "method" # Field name from grok. Label value will be set basing on this field. Default is value of label_name.
      rules = [
        {
          pattern = "copyFromSource" # Exacly copy value from grok field to label
        }
      ]
    },
    {
      label_name = "status"
      source     = "status" # Field name from grok. Label value will be set basing on this field. Default is value of label_name.
      rules = [
        {
          pattern = "copyFromSource" # Exacly copy value from grok field to label
        }
      ]
    },
    {
      label_name = "time_taken"
      source     = "time_taken" # Field name from grok. Label value will be set basing on this field. Default is value of label_name.
      rules = [
        {
          pattern = "copyFromSource" # Exacly copy value from grok field to label
        }
      ]
    },
    {
      label_name = "bytes_sent"
      source     = "bytes_sent"
      rules = [
        {
          pattern = "copyFromSource"
        }
      ]
    },
    {
      label_name = "bytes_received"
      source     = "bytes_received"
      rules = [
        {
          pattern = "copyFromSource"
        }
      ]
    },
    {
      label_name = "uri"
      source     = "uri"
      rules = [
        {
          pattern = "copyFromSource"
        }
      ]
    }
  ]
  pattern = "%{TIMESTAMP_ISO8601 : logtime} %{WORD : sitename} %{NOTSPACE : computername} %{IPORHOST : ip} %{WORD : method} %{NOTSPACE : uri} %{NOTSPACE : query} %{NUMBER : port} %{NOTSPACE : username} %{IPORHOST : client_ip} %{NOTSPACE : useragent} %{NOTSPACE : referrer} %{NUMBER : status} %{NUMBER : substatus} %{NUMBER : win32_status} %{NUMBER : bytes_sent} %{NUMBER : bytes_received} %{NUMBER : time_taken}"
}

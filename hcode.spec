{
  "name": "ip-aes128",
  "type": "ip",
  "version": "0.2.0",
  "summary": "A 128bit AES encryptor IP.",
  "description": "An AES encryptor IP.",
  "homepage": "https://github.com/nkmctky/ip-aes128/",
  "license": "MIT",
  "authors": {
    "nkmctky": "nkmctky@arch.cs.kumamoto-u.ac.jp"
  },
  "source": {
    "git": "https://github.com/jonsonxp/ip-aes128.git",
    "tag": "0.2.0"
  },
  "interfaces": {
    "host": {
      "ports":{
        "ap_fifo": {
          "type": "ap_fifo",
          "data_width": "128"
        }
      }
    }
  },
  "shell": {
    "shell-vc707-xillybus-ap_fifo128": {
      "property": {
        "acceleration": 2,
        "throughput": 1400,
        "resource": {
	        "LUT": 4511,
	        "FF": 10193,
	        "BRAM": 52
        }
      },
      "ip_conf": {
        "clk": 200
      },
      "shell_conf": {
        "clk": 200,
        "reference": " $ip_name $instance_name (.ap_clk(ip_clk_$ch_num), .ap_rst(~ip_rst_n_$ch_num), .in_V_V_dout(in_r_dout_$ch_num), .in_V_V_empty_n(in_r_empty_n_$ch_num), .in_V_V_read(in_r_read_$ch_num), .out_V_V_din(out_r_din_$ch_num), .out_V_V_full_n(!out_r_full_$ch_num), .out_V_V_write(out_r_write_$ch_num));"
      }
    }
  }
}




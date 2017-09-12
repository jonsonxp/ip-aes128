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
      "ap_fifo": {
        "data_width": "128"
      }
    }
  },
  "shell": {
    "shell-vc707-xillybus-ap_fifo128": {
      "clk": 200,
      "reference": " ip_aes128 ip_aes128 (.ap_clk(ip_clk), .ap_rst(~ip_rst_n), .in_V_dout(in_r_dout), .in_V_empty_n(in_r_empty_n), .in_V_read(in_r_read), .out_V_din(out_r_din), .out_V_full_n(!out_r_full), .out_V_write(out_r_write));"
    }
  }
}




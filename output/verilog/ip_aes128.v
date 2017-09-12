`timescale 1ns / 1ps

module ip_aes128
#
(
parameter DATA_W = 128,      //data width
parameter KEY_L = 128,       //key length
parameter NO_ROUNDS = 10     //number of rounds
)
(
    input wire ap_clk,
    input wire ap_rst,
    input wire[127:0] in_V_dout,
    input wire in_V_empty_n,
    output wire in_V_read,
    output wire [127:0]out_V_din,
    input wire out_V_full_n,
    output wire out_V_write
    );

wire text_full_n;
wire text_write;
wire[DATA_W-1:0] text_data;

wire key_full_n;
wire key_write;
wire[KEY_L-1:0] key_data;
wire[DATA_W-1:0] enc_data;
wire enc_valid;

wire[127:0] t,k,e;

assign text_data = {t[7:0],t[15:8],t[23:16],t[31:24],t[39:32],t[47:40],t[55:48],t[63:56],
                    t[71:64],t[79:72],t[87:80],t[95:88],t[103:96],t[111:104],t[119:112],t[127:120]};
assign  key_data = {k[7:0],k[15:8],k[23:16],k[31:24],k[39:32],k[47:40],k[55:48],k[63:56],
                    k[71:64],k[79:72],k[87:80],k[95:88],k[103:96],k[111:104],k[119:112],k[127:120]};
assign  enc_data = {e[7:0],e[15:8],e[23:16],e[31:24],e[39:32],e[47:40],e[55:48],e[63:56],
                    e[71:64],e[79:72],e[87:80],e[95:88],e[103:96],e[111:104],e[119:112],e[127:120]};

assign text_full_n = 1;
assign key_full_n = 1;

Top_PipelinedCipher 
    #
    (
    .DATA_W(DATA_W),      //data width
    .KEY_L(KEY_L),       //key length
    .NO_ROUNDS(NO_ROUNDS)     //number of rounds
    ) aes_core (
    .clk(ap_clk),                       //system clock
    .reset(~ap_rst),                     //asynch reset
    .data_valid_in(text_write),             //data valid signal
    .cipherkey_valid_in(key_write),        //cipher key valid signal
    .cipher_key(key_data),    //cipher key
    .plain_text(text_data),   //plain text
    .valid_out(enc_valid),                //output valid signal
    .cipher_text(e)  //cipher text
    );

aes_mux am(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .in_V_V_dout(in_V_dout),
    .in_V_V_empty_n(in_V_empty_n),
    .in_V_V_read(in_V_read),
    .out_V_V_din(out_V_din),
    .out_V_V_full_n(out_V_full_n),
    .out_V_V_write(out_V_write),
    .text_V_V_din(t),
    .text_V_V_full_n(text_full_n),
    .text_V_V_write(text_write),
    .key_V_V_din(k),
    .key_V_V_full_n(key_full_n),
    .key_V_V_write(key_write),
    .enc_V(enc_data),
    .enc_valid_V(enc_valid)
);

endmodule


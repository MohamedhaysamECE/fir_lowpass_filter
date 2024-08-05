`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/27/2024 02:51:26 PM
// Design Name: 
// Module Name: transposed_filter_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module transposed_filter_tb();
reg signed [15:0] noisy_signal;
reg  clk, rst;
wire signed [31:0] filtered_signal;

  transposed_filter t0( .noisy_signal(noisy_signal),
  .clk(clk), .rst(rst),
  .filtered_signal(filtered_signal) 
  );
  
//clock generator 

always #20 clk = ~clk;

//get the noisy signal from the file 

reg [15:0] mem [0:63];

initial
$readmemb("D:/vivado/transposed_filter/transposed_filter.srcs/sources_1/new/binary_signal.txt",mem);

                       
//generate address counter                             
reg [7:0]address;
always@(posedge clk)
 begin 
  noisy_signal = 0;
   if(address == 8'd63)
   begin
    address <= 1;
    noisy_signal <= mem[0];
    end
   else
   begin
    address <= address+1;
    noisy_signal <= mem[address];
    end
 end
 //apply the input noisy signal   
/*always@(posedge clk) 
   noisy_signal <= mem[address]; */    
   
initial
 begin
 noisy_signal = 0;
  clk = 0;
  address = 0; 
  rst = 0;
  #200000 $stop;
 end  

endmodule

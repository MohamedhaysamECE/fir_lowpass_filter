module  transposed_filter(
  input signed [15:0] noisy_signal,
  input clk, rst,
  output reg signed [31:0] filtered_signal  
  );


  // the coefficients
 wire signed [15:0] coe0 = 16'b0000000000000000,
             coe1 = 16'b1111111111100101,
             coe2 = 16'b1111111110110111,
             coe3 = 16'b0000000010110100,
             coe4 = 16'b0000001000111010,
             coe5 = 16'b0000000000000000,
             coe6 = 16'b1111100110101011,
             coe7=  16'b1111100110101100,
             coe8 = 16'b0000101011010000,
             coe9 = 16'b0010010110111110,
             coe10 =16'b0011001100011111,
             coe11 =16'b0010010110111110,
             coe12= 16'b0000101011010000,
             coe13 =16'b1111100110101100,
             coe14 =16'b1111100110101011,
             coe15 =16'b0000000000000000,
             coe16 =16'b0000001000111010,
             coe17 =16'b0000000010110100,
             coe18 =16'b1111111110110111,
             coe19 =16'b1111111111100101,
             coe20 =16'b0000000000000000;

             
                   
                              
 // the multiplicatin                            
 wire signed [31:0] mul [1:21];
  assign mul[1] = coe20 * noisy_signal;
  assign mul[2] = coe19 * noisy_signal;
  assign mul[3] = coe18 * noisy_signal;
  assign mul[4] = coe17 * noisy_signal;
  assign mul[5] = coe16 * noisy_signal;
  assign mul[6] = coe15 * noisy_signal;
  assign mul[7] = coe14 * noisy_signal;
  assign mul[8] = coe13 * noisy_signal;
  assign mul[9] = coe12 * noisy_signal;
  assign mul[10] = coe11 * noisy_signal;
  assign mul[11] = coe10 * noisy_signal;
  assign mul[12] = coe9 * noisy_signal;
  assign mul[13] = coe8 * noisy_signal;
  assign mul[14] = coe7 * noisy_signal;
  assign mul[15] = coe6 * noisy_signal;
  assign mul[16] = coe5 * noisy_signal;
  assign mul[17] = coe4 * noisy_signal;
  assign mul[18] = coe3 * noisy_signal;
  assign mul[19] = coe2 * noisy_signal;
  assign mul[20] = coe1 * noisy_signal;
  assign mul[21] = coe0 * noisy_signal;
 
 

  
 // The addition signals
     reg signed [31:0] delayed [1:20];
     always@(posedge clk)
      begin 
      if(rst)
      begin
        delayed[1] <=0;
        delayed[2] <=0;
        delayed[3] <=0;
        delayed[4] <=0;
        delayed[5] <=0;
        delayed[6] <=0;
        delayed[7] <=0;
        delayed[8] <=0;
        delayed[9] <=0;
        delayed[10]<=0;
        delayed[11]<=0;
        delayed[12]<=0;
        delayed[13]<=0;
        delayed[14]<=0;
        delayed[15]<=0;
        delayed[16]<=0;
        delayed[17]<=0;
        delayed[18]<=0;
        delayed[19]<=0;
        delayed[20]<=0;
      end  
      else
      begin 
       delayed[1]  <= mul[1] ;  
       delayed[2]  <= delayed[1] + mul[2]; 
       delayed[3]  <= delayed[2] + mul[3]; 
       delayed[4]  <= delayed[3] + mul[4]; 
       delayed[5]  <= delayed[4] + mul[5]; 
       delayed[6]  <= delayed[5] + mul[6]; 
       delayed[7]  <= delayed[6] + mul[7]; 
       delayed[8]  <= delayed[7] + mul[8] ; 
       delayed[9]  <= delayed[8] + mul[9];
       delayed[10] <= delayed[9] + mul[10] ;
       delayed[11] <= delayed[10]+ mul[11];
       delayed[12] <= delayed[11]+ mul[12];
       delayed[13] <= delayed[12]+ mul[13];
       delayed[14] <= delayed[13]+ mul[14];
       delayed[15] <= delayed[14]+ mul[15];
       delayed[16] <= delayed[15]+ mul[16];
       delayed[17] <= delayed[16]+ mul[17];
       delayed[18] <= delayed[17]+ mul[18];
       delayed[19] <= delayed[18]+ mul[19];    
       delayed[20] <= delayed[19]+ mul[20];
       end
      end

always@(*)
 begin
 if(rst)
    filtered_signal = 16'd0; 
 else
   filtered_signal = delayed[20] + mul[21];  
 end
 
endmodule
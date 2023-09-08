
module calculator (ain,bin,fun,out);
input [3:0] ain;
input [3:0] bin;
input [2:0] fun;
output [7:0] out;

reg [7:0] out_sum, out_sub , out_mult, out_div;

assign out = out_sum | out_sub | out_mult | out_div;

always@(ain or bin)
begin
    case (fun)

        2'b00: begin
            out_sum <= ain + bin;
            out_sub <= 7'b0;
            out_mult <= 7'b0;
            out_div <= 7'b0;
         end
        2'b01: begin
            out_sub <= ain - bin;
            out_sum <= 7'b0;
            out_mult <= 7'b0;
            out_div <= 7'b0;

        end
        2'b10: begin
            out_mult <= ain * bin;
            out_sum <= 7'b0;
            out_sub <= 7'b0;
            out_div <= 7'b0;
        end
        default: begin
            out_div <= ain / bin;
            out_sum <= 7'b0;
            out_sub <= 7'b0;
            out_mult <= 7'b0;
        end

    endcase
end
endmodule

module text();
reg [3:0] a;
reg [3:0] b;
reg [2:0] f;
wire [7:0] out;
reg  count = 3'd0;
calculator module2(a,b,f,out);
initial
begin
  f  = 2'b0;
  a = 4'd0;
  b = 4'd0;
  #100;  
end
initial 
begin
  a = 4'd6;
  b= 4'd3;  
  for (count = 0; count < 4; count = count + 1'b1) 

  f = count;
   $monitor("inputa=%b,inputb=%b,result=%b",a,b,out);

   #50;

end

endmodule
 
    



    



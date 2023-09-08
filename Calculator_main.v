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

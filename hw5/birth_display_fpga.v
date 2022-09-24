module seven_seg_birthday(
	clk,
	rst,
	mod,
	CA,
	CB,
	CC,
	CD,
	CE,
	CF,
	CG,
	AN0,
	AN1,
	AN2,
	AN3,
	AN4,
	AN5,
	AN6,
	AN7,
);
    
input clk;
input rst;
input mod;
output CA,CB,CC,CD,CE,CF,CG;
output AN0,AN1,AN2,AN3,AN4,AN5,AN6,AN7;

reg clk_2hz=0;
reg [31:0] cnt_2hz=0;
reg [2:0] cnt=0;
reg [6:0] seg_data;
reg [3:0] seg_number;

////**YOUR_DESIGN**////


///////////////////////

//**CLK_DIV**//
always@ (posedge clk ) begin
	if (cnt_2hz >= 25000000) begin
                cnt_2hz <= 32'b0;
                clk_2hz <= ~clk_2hz;
            end
            else begin
                cnt_2hz <= cnt_2hz + 1;
            end
end


//**COUNTER**//
always@(posedge clk_2hz) begin
	cnt <= cnt + 3'd1;
end
 
assign {AN7,AN6,AN5,AN4,AN3,AN2,AN1,AN0} = 8'b1111_1110;

assign {CG,CF,CE,CD,CC,CB,CA} = seg_data;


always@(posedge clk_2hz) begin  
if(mod)
  case(cnt)
	3'b000:seg_number <= 4'd2;
	3'b001:seg_number <= 4'd0;
	3'b010:seg_number <= 4'd0;
	3'b011:seg_number <= 4'd1;
	3'b100:seg_number <= 4'd0;
	3'b101:seg_number <= 4'd8;
	3'b110:seg_number <= 4'd1;
	3'b111:seg_number <= 4'd2;
	 endcase
  else
   case(cnt)
     3'b000:seg_number <= 4'd0;
     3'b001:seg_number <= 4'd1;
     3'b010:seg_number <= 4'd2;
     3'b011:seg_number <= 4'd3;
     3'b100:seg_number <= 4'd4;
     3'b101:seg_number <= 4'd5;
     3'b110:seg_number <= 4'd6;
     3'b111:seg_number <= 4'd7;
      endcase
end
 //**BCD_to_7seg**//
always@(posedge clk) begin  
  case(seg_number)
	4'd0:seg_data <= 7'b100_0000;
	4'd1:seg_data <= 7'b111_1001;
	4'd2:seg_data <= 7'b010_0100;
	4'd3:seg_data <= 7'b011_0000;
	4'd4:seg_data <= 7'b001_1001;
	4'd5:seg_data <= 7'b001_0010;
	4'd6:seg_data <= 7'b000_0010;
	4'd7:seg_data <= 7'b101_1000;
	4'd8:seg_data <= 7'b000_0000;
	4'd9:seg_data <= 7'b001_0000;
	default: seg_number <= seg_number;
  endcase
  
end 

endmodule
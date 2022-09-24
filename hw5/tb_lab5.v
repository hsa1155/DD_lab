`timescale 1ns/1ps
`include "lab5.v"

module tb_lab5;
	reg clk;
	reg rst;
	reg clk_2hz;				
	reg [20:0] cnt_2hz;		//1KHz counter
	reg [2:0] cnt;
	wire [6:0] seg_data;
	wire [3:0] birth_num;
	reg [6:0] data;
reg [3:0] seg_number;

lab5_birth lab5(cnt, birth_num, seg_data);

	always #5 clk = ~clk;

always@ (posedge clk or negedge rst) begin
	if (~rst) begin
		cnt_2hz <= 21'b0;
		clk_2hz <= 1'b0;
	end
	else begin
		if (cnt_2hz >= 12499) begin
			cnt_2hz <= 21'b0;
			clk_2hz <= ~clk_2hz;
		end
		else begin
			cnt_2hz <= cnt_2hz + 1;
			clk_2hz <= clk_2hz;
		end
	end
end
always@(posedge clk) begin  
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
end
always@(posedge clk) begin  
  case(seg_number)
	4'd0:data <= 7'b100_0000;
	4'd1:data <= 7'b111_1001;
	4'd2:data <= 7'b010_0100;
	4'd3:data <= 7'b011_0000;
	4'd4:data <= 7'b001_1001;
	4'd5:data <= 7'b001_0010;
	4'd6:data <= 7'b000_0010;
	4'd7:data <= 7'b101_1000;
	4'd8:data <= 7'b000_0000;
	4'd9:data <= 7'b001_0000;
	default: seg_number <= seg_number;
  endcase
end

always@ (posedge clk_2hz or negedge rst) begin
	if (~rst)
		cnt <= 3'b0;
	else 
		cnt <= cnt + 3'b1;
end

	always @ (posedge clk)
	begin
		#250000	$display ($time, "  cnt = %d, ,birth = %d, output = %b", cnt, seg_number, data); //5個單位時間後顯示敘述
	end	

	initial begin	//僅執行一次
		$dumpfile("lab5.fsdb");  //產生波形檔
		$dumpvars; //產生波形檔
		clk = 0;
		rst = 0;
		@(posedge clk) rst = 1;

		#5000000 $finish; //模擬於160ns結束
	end
endmodule
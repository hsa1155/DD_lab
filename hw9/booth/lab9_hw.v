//以前者(1ns)為單位，以後者(1ps)的時間，查看一次電路的行為
`timescale 1ns/1ps

//宣告module名稱,輸出入名稱
module lab9_hw(
	CLK, 
	RST, 
	in_a, 
	in_b, 
	Product, 
	Product_Valid
);
// in_a * in_b = Product
// in_a is Multiplicand , in_b is Multiplier
					
//定義port, 包含input, output
input 			CLK, RST;
input 	[7:0]	in_a;			// Multiplicand
input 	[7:0]	in_b;			// Multiplier
output 	[15:0]  Product;
output  		Product_Valid;
reg  signed [17:0]	Product_booth;

reg 	[7:0]	Mplicand;		//被乘數
reg 	[7:0]	Mplier;			//乘數
//reg 	[15:0]	Product;
reg 			Product_Valid;
reg 	[5:0]	Counter ;
reg				sign;			//正負號判斷 (signed)
assign Product = Product_booth[16:1];
//Counter
always @(posedge CLK or posedge RST)
begin
	if (RST)begin
		Counter <= 6'b0;
	end
	else if (~Product_Valid)
		Counter <= Counter + 1'b1;
	else
		Counter <= Counter;

end

//Product
always @(posedge CLK or posedge RST)
begin
	//初始化數值
	if(RST) begin
		Product_booth  <= 17'b0;
		Mplicand <= 8'b0;	
	end 
	//輸入乘數與被乘數
	else if(Counter == 6'd0) begin
		Mplicand 	<= in_a;
		Product_booth <= {8'b0, in_b, 1'b0};		
	end 
	//乘法與數值移位
	else if(Counter <=6'd4) 
	begin
	if(Product_booth[2:0] == 3'b001 || Product_booth[2:0] == 3'b010)
			Product_booth = Product_booth+{Mplicand,9'b0};
		else if(Product_booth[2:0] == 3'b101 || Product_booth[2:0] == 3'b110)
			Product_booth = Product_booth-{Mplicand,9'b0};
		else if(Product_booth[2:0] == 3'b011)
		begin	Product_booth = Product_booth+{Mplicand,9'b0}+{Mplicand,9'b0};end
		else if(Product_booth[2:0] == 3'b100)
			Product_booth = Product_booth-{Mplicand,9'b0}-{Mplicand,9'b0};
		Product_booth = Product_booth >>>2;
	end
end

//Product_Valid
always @(posedge CLK or posedge RST)
begin
	if(RST)
		Product_Valid <=1'b0;
	else if(Counter==6'd4)
		Product_Valid <=1'b1;
	else
		Product_Valid <=1'b0;
end

endmodule

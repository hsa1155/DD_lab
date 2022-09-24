module moore_hw( input clk,
				 input reset,
				 input x,
				 output reg y );
		
	reg [2:0] current_state, next_state;
	
	parameter S0 = 2'd0;
	parameter S1 = 2'd1;
	parameter S2 = 2'd2; 
	parameter S3 = 2'd3;
	
	always@(*) begin
		case(current_state)
			S0://0
				if(x) begin
					next_state = S1;
				end
				else begin
					next_state = S0;
				end
			S1://1
				if(x) begin
					next_state = S1;
				end
				else begin
					next_state = S2;
				end
			S2://10
				if(~x) begin
					next_state = S3;
				end
				else begin
					next_state = S1;
				end
			S3://100
				if(x) begin
					next_state = 4;
				end
				else begin
					next_state = S0;
				end
			4://1001
				if(x) begin
					next_state = S1;
				end
				else begin
					next_state = 5;
				end
			5://10010
				if(x) begin
					next_state = S1;
				end
				else begin
					next_state = 3;
				end
			
			default:
				next_state = S0;
		endcase
	end

	always@(posedge clk) begin
		if(reset) begin
			current_state <= S0;
		end
		else begin
			current_state <= next_state;
		end
	end

	always@(*) begin
		case(current_state)
			S0:
				y = 1'b0;
			S1:
				y = 1'b0;
			S2:
				y = 1'b0;
			S3:
				y = 1'b0;
			4:
				y=0;
			5:
				y=1;
			default:
				y = 1'b0;
		endcase
	end
		
endmodule
		
	
	
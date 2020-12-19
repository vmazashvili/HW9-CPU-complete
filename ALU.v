module ALU(
		input[31:0] A,
		input[31:0] B,
		input[1:0] opcode,
		input[3:0] cmd,
		output reg [31:0] out,
		output reg[3:0] flags
    );
	 
	 always @(*) begin
		case(opcode) 
		0:begin
			case(cmd) 
			4'b0000: out = A&B;  
			4'b0001: out = A^B;  
			4'b0010: out = A-B;  
			4'b0011: out = B-A ;  
			4'b0100: out = A+B;  
			4'b1010: out = A-B;  
			4'b1100: out = A|B;  
			default: out = 0;
			endcase
			end
		1:begin
			case(cmd[3]) 
				0: out = A;
				1: out = A+B;
				default: out = A+B;
			endcase
			end
			
		2:begin
			out = A+B;
			end
			default: out = 0;
			endcase
		end
		
		 //flags
	 always @(*) begin
		//n
		if(out[31] == 1)   
			flags[3]=1;
		else
		//z
			flags[3]=0;
		if(out == 0)   
			flags[2]=1;
		else
			flags[2]=0;
		//c,o
		if((cmd == 0) | (cmd==10)) begin  
			flags[1] = A < B ? 1 : 0;
		
			flags[0] = ((A[31] != B[31]) & (B[31] != out[31])) ? 1 : 0;
		end
		
		else if(cmd == 3) begin  
			flags[1] = A>B ? 1 : 0;
			flags[0] = ((A[31] == B[31]) & (A[31] != out[31])) ? 1 : 0;
		end
		
		else if(cmd == 4) begin
			flags[1] = ((A > out) || (out < B)) ? 1:0;
			flags[0] = ((A[31] == B[31]) & (A[31] != out[31])) ? 1:0;
			
		end
		else begin
			flags[1] = 0;
			flags[0] = 0;
		end
		
	
	 end
	 
	


endmodule

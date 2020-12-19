`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:25:35 12/19/2020
// Design Name:   ALU
// Module Name:   C:/Users/Vano/Desktop/Verilog/hw7-ALU/alu_tb.v
// Project Name:  hw7-ALU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module alu_tb;

	// Inputs
	reg [31:0] A;
	reg [31:0] B;
	reg [1:0] opcode;
	reg [3:0] cmd;

	// Outputs
	wire [31:0] out;
	wire [3:0] flags;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.A(A), 
		.B(B), 
		.opcode(opcode), 
		.cmd(cmd), 
		.out(out), 
		.flags(flags)
	);

	initial begin
		A = 32'h11111;
		B = 32'h00111; 
		opcode=0;
		
		cmd = 1;
		#10;
		cmd = 2;
		#10;
		cmd = 3;
		#10;
		cmd = 4;
		#10;
		
		opcode=1;
		A = 32'h10011;
		B = 32'h00101;
		cmd=0;
		#10;
		cmd[3] = 1;
	end
      
endmodule


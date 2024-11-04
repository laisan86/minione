// Testbench for v0.1
// Generate clock by steps
module test_CPU();
  reg [7:0] sel;
  reg [7:0] op1;
  reg [7:0] op2;
  wire [7:0] acc;
  wire [7:0] mem [15:0];
  wire [15:0] pc;
  
  minione testMini(sel, op1, op2, acc, mem, pc);
  
  initial begin
    $monitor("X=%d, Y=%d, Function=%d so ACC=%d\n, PC=%d\nMemory:\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n", op1, op2, sel, acc, pc, mem[0], mem[1], mem[2], mem[3], mem[4], mem[5], mem[6], mem[7], mem[8], mem[9], mem[10], mem[11], mem[12], mem[13], mem[14], mem[15]);
    
    sel=0; op1=10; op2=0;	//LD #10
    #1;
    
    sel=6; op1=4; op2=0;	//MOV R4,ACC
    #1;
    
    sel=1; op1=15; op2=22;	//15+22 to ACC
    #1;
    
    sel=2; op1=33; op2=8;	//33-8 to ACC
    #1;
    
    op1=8'b01110011; op2=8'b00100000; sel=3;	//op1 & op2 to ACC
    #1;
    
    op1=8'b01110000; op2=8'b00001100; sel=4;	//op1 | op2 to ACC
    #1;
    
    op1=8'b11000011; op2=8'b11111100; sel=5;	//op1 ^ op2 to ACC
    #1;
    
    op1=6; op2=0; sel=6;	//MOV R6,ACC
    #1;
    
    sel=7; op1=4; op2=0;	//MOV ACC,R4
    #1;
    
    sel=9; op1=6; op2=0;	//Skip if ACC < R6
    #1;
    
    sel=11; op1=0; op2=3;	//JMP $3
  end
endmodule

// v0.1
module minione(mcode, opa, opb, acc, registers, pc);
  input [7:0] mcode;
  input [7:0] opa;
  input [7:0] opb;
  output reg [7:0] registers [15:0];
  output reg [7:0] acc;
  output reg [15:0] pc=16'b0000000000000000;
  
  always @(mcode) begin
    if (mcode == 0)
    	acc = opa;
  	else if (mcode == 6)
      	registers[ opa[3:0] ] = acc;
  	else if (mcode == 7)
      	acc = registers[ opa[3:0] ];
    else if (mcode == 8)
      begin
      if (acc > registers[ opa[3:0] ])
        pc=pc+3;
      end
    else if (mcode == 9)
      begin
      if (acc < registers[ opa[3:0] ])
        pc=pc+3;
      end
    else if (mcode == 10)
      begin
      if (acc == registers[ opa[3:0] ])
        pc=pc+3;
      end
    else if (mcode == 11)
        pc=opa << 8 + opb;
  	else
      	case(mcode)
      		1: acc=opa+opb;
      		2: acc=opa-opb;
      		3: acc=opa & opb;
      		4: acc=opa | opb;
      		5: acc=opa ^ opb;
    	endcase
    pc=pc+3;
  end
endmodule

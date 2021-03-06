module InstructionMemory(read_address, instruction);
  input [31:0] read_address;
  output [31:0] instruction;

  reg [31:0] mem [0:255];
  assign instruction = mem[read_address >> 2];

  // Initialize memory
  initial begin
    $readmemb("instruction-memory.mem", mem);
  end
endmodule

module InstructionMemory_testbench();
  reg [31:0] read_address;
  wire [31:0] instruction;

  InstructionMemory mem(read_address, instruction);

  initial begin
    #5 read_address <= 0;
    #5 read_address <= 4;
    #5 read_address <= 8;
    #5 read_address <= 12;
  end

  initial begin
    $dumpfile("InstructionMemory_testbench.vcd");
    $dumpvars(0, InstructionMemory_testbench);
  end
endmodule

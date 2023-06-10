package cpu_rtl_pkg;
// opcodes
typedef enum logic [2:0] {HLT, SKZ, ADD, AND, XOR, LDA, STO, JMP} opcode_t;
// sequential states of controller state machine
typedef enum {INST_ADDR, INST_FETCH, INST_LOAD, IDLE, OP_ADDR, OP_FETCH, ALU_OP, STORE} state_t; 

endpackage : cpu_rtl_pkg
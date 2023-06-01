# Processor conception and creation
The intention is to design a 32-bit processor, with support for a reduced number of instructions. the processor
is based on the Processing Unit (PU) of LAB1, although this has been extended
in order to support 32-bit operands. Thus, the registers, functional units and data memory now operate
about 32 bits. However, the structure of the circuit has been modified, and is now composed of the following stages:
- ***IF (Instruction Fetch)*** : Reading the instruction indicated by the PC (Program Counter) from the instruction memory;
- ***ID (Instruction Decode)***: Decoding the instruction and reading the operands;
- ***EX (Execute)*** : Executing the instruction, i.e. calculating the result (Functional Unit) or changing the flow of
instructions (condition test and performing a jump on the Jump Control Unit);
- ***MEM (Memory)*** : Reading or writing a value in the data memory;
- ***WB (Write-Back)*** : Writing the result of the instruction in the Storage Unit (Register File).

Check ***problem-statement*** to check the requirements for the implementation of the solution.
Check ***solution*** for the implemented code/reporting done.
-------------------------------------------------------------------------------------
              Single-Cycle RISC-V Processor Changes (in riscv_single_test.sv)
-------------------------------------------------------------------------------------

At line 44, we added:
```
  $readmemh(memfilename, dut.dmem.RAM);
```

At line 114, we changed:
```
  end else if (DataAdr !== 96) begin
```
to:
```
  end else if (DataAdr === 100 & WriteData === 17) begin
```

In the controller module, we created a case statement that determined branch for each instruction
(beq, bne, blt, bge, bltu, bgeu). Each of these are determined by Zero, Negative, Overflow, and 
Carry. These variables are all calculated in the alu module. This then determines whether PCSrc 
is true or false.

In the maindec module, we had to change a few things. We first increased ImmSrc to 3 bits to
create a new immext value for the U-type instructions. We also had to increase ALUSrc to two
bits, where the LSB is used for the SrcB and ImmExt mux, and the MSB is used as a mux for SrcA
and PC (for auipc instruction). We had to insert another bit into the controller for Branch, 
where it is only 1 for B-type. This is used in the controller to determine PCSrc as well.

Overall, the controls gained 3 extra bits for these changes.

In the aludec module, we increased ALUControl by 1 bit to add the rest of the R-type and I-type
instructions, where we added more if statements and case statements within the original case 
statement to determine which instruction will run. This is based on the ALUControl value, which 
then gets used in the alu module and executes the corresponding instruction.

In the datapath, there were some additions and changes:
  1: We created another 2-input mux for SrcA, where it determines whether to use SrcA normally 
  or use PC (This is for auipc)
  2: We added some output variables when calling alu, specifically the ones for the B-type 
  instructions as talked about on line 19 of this file.
  3. We changed the mux3 into a mux4 to determine whether Result returns as ALUResult, ReadData, 
  PCPlus4, or ResultFunny (which is a chunk of ReadData when calling a specific load instruction)
  4. We added two more mux2 into the datapath, updating PCNext and jumping/linking register
  (jalr)
  5. We called our module loadextend that handles what part of the ReadData should be loaded
  (This returns ResultFunny)

In the extend module, we made another case value for U-type instructions as talked about on
lines 24-25 of this file.

In our loadextend module, we input ALUResult, ReadData, funct3, and output into ResultFunny.
We read the last two bits of ALUResult and store it in loadchunk to determine which part of the 
ReadData should be loaded. We use the funct3 in a case statement to determine which instruction 
will execute. For lb and lbu, we use loadchunk in a case statement to determine which byte is 
being returned. For lh and lhu, we use the MSB of loadchunk to determine what half is returned.

In the alu, we added the other R-type and I-type instructions, as well as adding the B-type 
instructions. The alu also calculates the Overflow, Negative, Carry, and Zero for determining 
the branch for PCSrc

*Note* We were unable to get into the sb and sh instructions. All of the instructions that ran 
and didn't run properly are commented at the top of the document

-------------------------------------------------------------------------------------
                          FPGA Board Implementation
-------------------------------------------------------------------------------------


To begin, copy the riscv_single.sv and the setup.tcl files from the folder onto the Desktop

When implementing the design onto the FPGA, we start by opening a terminal and running "vivado" to open
Vivado

The following directory is used when opening a project in Vivado (from the submission):
```
	lab2/vivado/lab2.xpr
```
Once the project is opened, we select the TCL Console and move from the current directory to the Desktop,
where the riscv_single.sv and setup.tcl files are located.

Use the following command to ascend out of the current directory:
```
	cd ..
```
Use the following command to ascend into a folder:
```
	cd <folder name>
```
Using these commands, we ascend out of the current directory and descend into the Desktop

Once in the Desktop, use the following command to run the script located in the setup.tcl file:
```
	source setup.tcl
```
After the bitstream has generated, select the "Open Hardware Manager" option in the new window that appears

The Hardware Manager will open, and a message will appear at the top:
```
	No hardware target is open. Open target
```
Make sure to have the FPGA connected to the NI ELVIS board, powered on correctly, and connected to the
computer

Once this is complete, select the Open Target and select:
```
	Auto Connect
```
The board should connect to Vivado if opened correctly


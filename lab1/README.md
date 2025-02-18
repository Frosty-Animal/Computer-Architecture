These files are used for Laboratory 1 within ECEN 4243 : Computer
Architecture.  The C files need a compiler and it is recommended to
use the ECE file server to compile these files.

For Section 2 of the lab report you will need to start by cloning the repository as stated in 2.1. You can do this by opening the command prompt and entering in the following command:
```
git clone --recurse-submodules https://github.com/<yourgithubid>/cvw.
```
Be sure to update the command by switching out <yourgithubid> with your actual github ID. After you have done this you wil need to setup your Wally enviroment as seen in 2.2 which can be done by using the folloing command:
```
source ./setup.sh. 
```
Next, navagte to your cvw file in your directory by going to:
```
cd ecen4243S25/lab1/cvw
```
We will be going to the test program in Wally to practice compiling and running Wally programs. Go to:
```
cd examples/C/hello
```
compile the program by using:
```
make
```
Finally we will simulate using questa using the following command: 
```
wsim --sim questa rv64gc --elf hello.
```
The history of your commands should look like the screenshot below:

![Section 2 terminal history](https://github.com/user-attachments/assets/0d307778-0f70-4e0e-a2f2-2cc5e680d20f)

For Section 3 of the lab report you will need to start by going to the example assembly file by going to:

```
cd $WALLY/examples/asm/example
```
Now, we will assemble and link the link the program by using the following command:

```
riscv64-unknown-elf-gcc -o example -march=rv32i -mabi=ilp32 -mcmodel=medany \
-nostartfiles -T../../link/link.ld example.S
```
Next, disassemble the code using:
```
riscv64-unknown-elf-objdump -D example > example.objdump
```
Lastly, for 3.1 we will review the linker script by:
```
cat common/test.id
```
The list of commands used for 3.1 will look like the screenshot below:

![Screenshot from 2025-02-17 21-08-16](https://github.com/user-attachments/assets/9d826e92-048c-4934-9438-45183fab28a4)

For 3.2

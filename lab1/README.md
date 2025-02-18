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

For 3.2 we will be using make files to automate the building, cleaning, and simulation checks. First we will be inspecting the Makefile by:

```
cat Makefile
```
We will then build by using:
```
make
```
Finally, to clean the intermediate and output files, the following command is used:

```
make clean
```
The list of commands used for 3.2 will look like the screenshot below:

![Screenshot from 2025-02-17 21-15-12](https://github.com/user-attachments/assets/615d4b41-5318-43a1-9a9c-129419b72d4b)

In section 3.3 we will be simulating the RISCV files using spike. We will do this by going to the sumtest example file:

```
cd $WALLY/examples/asm/sumtest
```
Build the file:
```
make
```
Finally, simulate with spike and generate a signiture by:
```
spike +signature=sumtest.signature.output sumtest
```
now we can compare with a refernce file to check if your file has ran as expected by using:
```
diff sumtest.signature.output sumtest.reference_output
```
We can now review the sum file by using the next 3 commands and if all goes well then the signatures should be a match with the simulation:
```
make
```
```
make clean
```
```
make sim
```
As seen in the screenshot below the signature should match as expected:
![Screenshot from 2025-02-17 21-25-27](https://github.com/user-attachments/assets/d4449de0-d6c3-4ff3-903c-6faecafcbe1b)

For the final sectionf 3.3 we will compile C code by navigating to:
```
cd $WALLY/examples/C/sum
```
then we will build and simulate the code to verify that i will work:
```
make
```
```
spike sum
```
The list of commands used for 3.3 will loop like the screenshot below:
![Screenshot from 2025-02-17 21-28-47](https://github.com/user-attachments/assets/9ee49b00-0cad-45cd-ac6c-f72fe54e6706)

Section 3.6 requires us to optomise the sum files cycles and instructions by running various optimization levels. The Excel spreadsheet below is the fillout table of the outputs from our Spike and wsim simulations. Here is the table of the optimization times we recieved for sum and the history of the commands that i used to get the results:
![Screenshot file:///home/08-comp-arch-f/Pictures/Screenshots/Screenshot%20from%202025-02-17%2021-53-49.png
from 2025-02-17 21-55-14](https://github.com/user-attachments/assets/ed3b53ef-1641-4f97-99b8-1e6aad15578f)
![Screenshot from 2025-02-17 21-53-22](https://github.com/user-attachments/assets/fc9f3baa-1974-4d25-861d-71ca6aad6b5c)
![Screenshot from 2025-02-17 21-52-59](https://github.com/user-attachments/assets/76117076-b56b-4304-b109-c0370bf36a41)
![Screenshot from 2025-02-17 21-52-30](https://github.com/user-attachments/assets/f6ee0c82-ed61-48e0-b9f3-e8756f35747e)
![Screenshot from 2025-02-17 21-52-59](https://github.com/user-attachments/assets/f20b8456-5a15-4f35-8e0c-425362c0ee6d)





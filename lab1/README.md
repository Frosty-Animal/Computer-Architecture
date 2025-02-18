These files are used for Laboratory 1 within ECEN 4243 : Computer
Architecture.  The C files need a compiler and it is recommended to
use the ECE file server to compile these files.

To set up the envrionmental variable to use the GNU compiler.
These files should be available through cygwin (Windows) or Xtools
(Mac OS X).  You will also need the RISC-V tools which will be
available through docker if you want to add any more tests.  You can
also use the simple RISC-V intepreter available here:
https://www.cs.cornell.edu/courses/cs3410/2019sp/riscv/interpreter/.
However, the best way to compile something is using RISC-V toolchain
that we have available.

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
Finally we will sim
For Section 3 of the lab report you will need to use the following commands:




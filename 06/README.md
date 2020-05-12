Your 06 directory in your repository must contain a README file
with instructions for running your assembler (Which file is the
driver program? How does one use it?). 

assembler (Processing Source File) is the driver program. It is inside Projects>06>assembler. \

Instructions:
Provide the absolute path of the .asm file that you wanna convert to a .hack file as the value of
the String Variable filename.
example: String filename = "put the file path in between these quotes";
like this: String filename = "C:/SMU/Creative_Computing/Nand_to_Tetris/nand2tetris/projects/06/max/Max.asm";

Once provided absolute path of .asm file as tthe value of String Variable filename, run the program and wait until console prints "DONE SAVING FILE".
Now, you should have a .hack file (that contains the binary version of the .asm code) in the same directory and with the same name, but different extension.
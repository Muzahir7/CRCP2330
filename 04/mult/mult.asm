// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

//Initializing R2 and setting its value to zero since it is the sum of adding the val. in R0 times R1
@R2  //A=2
M=0 //R2 = 0

(LOOP) //to loop R1 val. times

//Check for the condition if the value in R1 is less than 0. If yes, make the program jum to end
@R1  //A=1
D=M  //D register holds the value of R1
@END  //label usage of the label END
D;JLE  //jump to Label END if val. of R1 =< 0

//RAM[2] = RAM[2] + RAM[0]
@R0
D=M  //D=RAM[0]
@R2
M=M+D  // RAM[2] = RAM[2] + RAM[0]

//Decrement the value in R1 which is serving as the counter for the LOOP
@R1
M=M-1 // R=R1-1

//make the program jump back to the LOOP
@LOOP
0;JMP //goto LOOP

(END) //infinite loop for the end of the program
@END
0;JMP

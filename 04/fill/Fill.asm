// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(INITIALIZE)
//initialize R0 to 8192 which is 32*256
@8192
D=A //D=8192
@R0
M=D  // R1 = 8192

(LOOP)  //loop that checks for whether to fill black or white in each pixel
//decremneting the index which is R0
@R0
M=M-1  // R0=R0-1
D=M
@INITIALIZE
D;JLT

@KBD	//loads the keyboard's address
D=M
@WHITE  
D;JEQ  //if no key pressed take the program to label WHITE
@BLACK
0;JMP  //if a key is pressed take the program to label BLACK


(WHITE)
@SCREEN  //loads first address of the screen
D=A
@R0
A=D+M  //to find the pixel to fill, adding the screen address with the index which is R0
M=0  //fills white in the pixels
@LOOP
0;JMP

(BLACK)
@SCREEN  //loads first address of the screen
D=A
@R0
A=D+M  //to find the pixel to fill, adding the screen address with the index which is R0
M=-1  //fills black in the pixels
@LOOP
0;JMP
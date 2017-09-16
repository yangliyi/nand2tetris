// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm
//
// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed.
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// LOOP:
//   if key input > 0
//     set color to -1
//   else
//     set color = 0
//
//   Write whole screen with above color
//
//   goto LOOP

(LOOP)
  @SCREEN
  D=A
  @screenaddress
  M=D

  @KBD
  D=M
  @SETBLACK
  D;JNE // Jump and set color to black if not 0 (key pressed)

  @color
  M=0	// SETWHITE

  @WRITECOLOR
  0;JMP

(SETBLACK)
  @color
  M=-1	// Set to black (1111111111111111)
  @WRITECOLOR
  0;JMP

(WRITECOLOR)
  @color
  D=M

  @screenaddress
  A=M
  M=D

  @screenaddress
  D=M+1	// move to next set
  @KBD
  D=A-D	// next pixel address - keybard address

  @screenaddress
  M=M+1	// move to next set
  A=M

  @WRITECOLOR
  D;JGT	// If D = 0, it means we finished writing screen memory map and moved to keyboard memory map

  @LOOP
  0;JMP // Jump back to top of the loop

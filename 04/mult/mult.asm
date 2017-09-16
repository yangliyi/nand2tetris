// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// i = 1
// n = R1
// number = R0
// sum = 0
// R2 = 0

// LOOP:
//   if i > n goto STOP
//   sum = sum + number
//   i = i + 1
//   goto LOOP
// STOP:
//   R2 = sum

  @i
  M=1

  @R1
  D=M
  @n
  M=D

  @R0
  D=M
  @number
  M=D

  @R2
  M=0 // Set R2 to 0 at the beginning since it's required in test cases...

  @sum
  M=0

(LOOP)
  @i
  D=M
  @n
  D=D-M
  @STOP
  D;JGT // if i > n goto STOP

  @number
  D=M

  @sum
  M=M+D // sum = sum + number

  @i
  M=M+1 // i = i + 1
  @LOOP
  0;JMP

(STOP)
  @sum
  D=M
  @R2
  M=D // R2 = sum

(END)
  @END
  0;JMP

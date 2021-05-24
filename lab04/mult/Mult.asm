// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.
//INICIALIZA R2 COM 0
@R2
M=0

(LOOP) //VOU SOMAR &R1, &RO VEZES
	@R0	//CARREGA R0 E CHECA SE R0 É 0 SE SIM VAI PARA END
	D=M
	@END
	D;JEQ

	@R1 //FAZ R2=R2+R1 POR &R0 VEZES
	D=M
	@R2
	M=M+D

	@R0 //ATUALIZA O &R0 (CONTADOR)
	M=M-1

	@LOOP //VOLTA PARA O INICIO DO LOOP
	0;JMP

(END) //ENCERRA O PROGRAMA
	@END
	0;JMP
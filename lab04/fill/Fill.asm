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
//NUMERO DE PALAVRAS PARA PREENCHER A TELA TODA SALVO EM R0
	@8192
	D=A
	@R0
	M=D
//VOU USAR R1 COMO UMA FLAG PARA SABER SE A TELA ESTA BRANCA OU PRETA (BRANCA=0, PRETA=1)
	@R1
	M=0
//VOU USAR R2 COMO ENDERECO ATUAL DA TELA
	@SCREEN
	D=A
	@R2
	M=D

(LOOP) //LOOP INFINITO
	@KBD //CARREGA O VALOR DA ENTRADA NO TECLADO
	D=M
	@TELA_PRETA //PULA PARA PREENCHER A TELA CASO TENHA UMA ENTRADA
	D; JNE

	@R1 //CASO NAO TENHA ENTRADA NO TECLADO CHECA SE A TELA JA ESTA BRANCA, SE SIM VOLTA PAR AO LOOP
	D=M
	@LOOP
	D; JEQ

	//CASO NÃO TENHA ENTRADA E A TELA ESTEJA PRETA
	@SCREEN //PASSA PARA R2 O INICIO DA TELA
	D=A
	@R2
	M=D
	@I //INICIALIZA O CONTADOR  I
	M=0
	@R1 //MARCA A TELA COMO BRANCA NA FLAG
	M=0 

(TELA_BRANCA) //PERCORRE AS PALAVRAS ATE PREENCHER TODAS PALAVRAS COM 0
	@R0		//CHECA SE I == R0
	D=M
	@I
	D=D-M 
	@LOOP	//ENCERRA
	D;JEQ
	@R2		//DEIXA A TELA BRANCA
	A=M
	M=0
	@R2		//ATUALIZA A POSICAO ATUAL
	M=M+1
	@I 		//ATUALIZA O CONTADOR I
	M=M+1
	@TELA_BRANCA
	0;JMP

(TELA_PRETA) //PERCORRE AS PALAVRAS ATE PREENCHER TODAS PALAVRAS COM -1
	@R1 //CASO TENHA ENTRADA NO TECLADO CHECA SE A TELA JA ESTA PRETA, SE SIM VOLTA PAR AO LOOP
	D=M
	@LOOP
	D; JGT

	//CASO TENHA ENTRADA E A TELA ESTEJA BRANCA
	@SCREEN //PASSA PARA R2 O INICIO DA TELA
	D=A
	@R2
	M=D
	@I //INICIALIZA O CONTADOR  I
	M=0
	@R1 //MARCA A TELA COMO PRETA NA FLAG
	M=1

(TELA_PRETA_LOOP)
	@R0		//CHECA SE I == R0
	D=M
	@I
	D=D-M 
	@LOOP	//ENCERRA
	D;JEQ
	@R2		//DEIXA A TELA PRETA
	A=M
	M=-1
	@R2		//ATUALIZA A POSICAO ATUAL
	M=M+1 	
	@I 		//ATUALIZA O CONTADOR I
	M=M+1
	@TELA_PRETA_LOOP
	0;JMP
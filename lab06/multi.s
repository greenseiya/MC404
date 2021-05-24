	#VOU USAR UM DESLOCAMENTO PARA A DIREITA E REMOVER 2^1 DO MULTIPLICADOR
	#CASO ELE SEJA IMPAR SOMO MAIS UMA VEZ O VALOR PARA FINALIZAR A MULTIPLICACAO
main:
	addi s2, zero, 1
	add t0, zero, s0
	add a0, zero, s1
loop:
	beq t0, s2, mult_impar
	beq t0, zero, fim

	slli a0, a0, 1
	addi t0, t0, -2
	j loop

mult_impar:
	add a0, a0, s1

fim:
	jr ra
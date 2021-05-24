main:
	#VERIFICANDO A CONDIÇÃO DE EXISTENCIA DO TRIANGULO
lado_um:
	#Lado em S0
	add t0, s1, s2
	blt s0, t0, lado_dois
	j nTriangulo

lado_dois:
	#Lado em S1
	add t0, s0, s2
	blt s1, t0, lado_tres
	j nTriangulo

lado_tres:
	#Lado em S2
	add t0, s0, s1
	blt s2, t0, eTriangulo
	j nTriangulo

nTriangulo:
	addi a0, zero, 0
	j fim

eTriangulo:
	addi a0, zero, 1
	j fim

fim: 
	jr ra
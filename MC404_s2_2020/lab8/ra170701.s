.text
.align 4
.globl _start

_start:                         @ main
        
        mov r0, #0              @ Velocidade do motor 0.
        mov r1, #0              @ Velocidade do motor 1.
        mov r7, #124            @ write_motors
        svc 0x0                
        ldr r6, =1200           @ r6 <- 1200 (Limiar para parar o robo)

walk:        
        mov r0, #3              @Define o sonar a ser consultado.
        mov r7, #125            @read_sonar
        svc 0x0                 
        mov r5, r0              @ Armazena o retorno da syscall.

        mov r0, #4              @ Define em r0 o sonar.
        mov r7, #125
        svc 0x0

        cmp r5, r0              @ Compara o retorno (em r0) com r5.
        bge min                 @ Se r5 > r0: Salta pra min
        mov r0, r5              @ Senao: r0 <- r5

min:


        cmp r0, r6              @ Compara r0 com r6
        blt obstaculo           @ Se r0 menor que o limiar: Salta para obstaculo

                                @ Senao define uma velocidade para os 2 motores
        mov r0, #36            
        mov r1, #36
        mov r7, #124        
        svc 0x0

        b walk                  @ Refaz toda a logica      

obstaculo:                      @ Escolhe para qual lado seguir
        mov r0, #0              
        mov r1, #0
        mov r7, #124
        svc 0x0

turnR:
	mov r0, #20		@faz uma curva para direita            
        mov r1, #-20
        mov r7, #124        
        svc 0x0	
	
	mov r0, #0            
        mov r1, #0
        mov r7, #124        
        svc 0x0
	
	mov r0, #3		@ Le valor do sensor frontal
	mov r7, #125
	svc 0x0
	
	cmp r6, r0 		@ vira ate poder andar novamente
	bge turnR

	b walk

end:
        mov r7, #1              @ syscall exit
     	svc 0x0      

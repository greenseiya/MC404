.org 0x000

  #CALCULA A VARIAVEL Y = g*X
  LOAD MQ, M(var_g)
  MUL M(var_x)
  LOAD MQ
  STOR M(var_y)

  #INICIALIZA O VALOR DE K=Y/2
  LOAD M(var_y)
  RSH
  STOR M(var_k)

  #LACO PARA CALCULAR A VELOCIDADE, 10 VEZES
  laco:
      LOAD M(var_y)
      DIV M(var_k)
      LOAD MQ
      ADD M(var_k)
      RSH
      STOR M(var_k)

      #ATUALIZA contador
      LOAD M(contador)
      SUB M(value_1)
      STOR M(contador)
      JUMP+ M(laco,0:19)

  LOAD M(var_k)
  JUMP M(0x400)
  .align 1

.org 0x110
  var_x:

.org 0x150
  var_g: .word 0x000000000A
.align 1
  var_k: .word 0x0000000000
.align 1
  var_y: .word 0x0000000000
.align 1
  value_1: .word 0x0000000001
.align 1
  contador: .word 0x0000000009

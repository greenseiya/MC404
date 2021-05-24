.org 0x000
  #ANTES DE INICIAR O LACO EU VOU REDUZIR O VALOR NA VARIAVEL QUE MARCA O TAMANHO DO VETOR
  LOAD M(var_tamanho)
  SUB M(value_1)
  STOR M(var_tamanho)

  laco:
      #PASSA PARA O ALGORITMO QUE CALCULA O PRODUTO ESCALAR O ENDERECO DO ELEMENTO I DO VETOR
      LOAD M(vetor_1)
      STA M(load_v1)
      LOAD M(vetor_2)
      STA M(mult_v2)

      #CARREGA O VALOR I DO VETOR 1 E MULTIPLICA PELA I DO VETOR 2
      load_v1:
      LOAD MQ, M(000)
      mult_v2:
      MUL M(000)

      #SOMA O VALOR NA VARIAVEL 'SOMA'
      LOAD MQ
      ADD M(var_soma)
      STOR M(var_soma)

      #ATUALIZA OS VALORES DOS ENDERECOS DE MEMORIA
      LOAD M(vetor_1)
      ADD M(value_1)
      STOR M(vetor_1)
      LOAD M(vetor_2)
      ADD M(value_1)
      STOR M(vetor_2)

      #ATUALIZA VALOR DO laco
      LOAD M(var_tamanho)
      SUB M(value_1)
      STOR M(var_tamanho)
      JUMP+ M(laco)

  LOAD M(var_soma)
  JUMP M(0x400)

  .align 1

.org 0x09E
  var_soma: .word 0x0000000000
  .align 1
  value_1: .word 0x0000000001

.org 0x3FF
  vetor_1:
.org 0x3FE
  vetor_2:
.org 0x3FD
  var_tamanho:

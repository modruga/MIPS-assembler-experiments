.data
	.word 1		#0x10010000

.text
	li $t3, -1		# invertedor de negativo
	li $t4, 1		# verificador de negativo
	li $v0, 5		# comando de leitura de inteiro
	syscall			# efetiva leitura de valor inteiro
	move $t0, $v0		# move valor lido pro $t0
	slt $t5, $t0, $zero	# se $t0 for menor que zero, $t5 resulta em 1
	beq $t5, $t4, inverter	# se o numero lido for negativo, pula pra label invertedora
fase2:
	ori $t1, $zero, 1 	# i condicional de for
	ori $s0, $zero, 1	# 1 condicional de casos especiais + aux
	beq $t0, $zero, end	# caso seja 0, vai direto pro end
	jal for			# chama funcao recursiva de fatorial
	j end			# termina o programa, indo pra label end
	
for: 
	beq $t1, $t0, return	# condicional pra n=1
	addi $t1, $t1, 1 	# i++
	mult $s0, $t1 		# i * (i+1)
	mflo $s0		# armazena em $s0
	j for			# reinicia
	
inverter:
	mult $t0, $t3		# inverte o valor lido
	mflo $t0		# envia numero invertido pro registrador original
	j fase2			# volta ao main
	
return:
	jr $ra			# volta pro main
	
end:
	li $v0, 10		# carrega funcao de termino de programa
	syscall			# mata o programa
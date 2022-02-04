.data				# armazenamento de dados
	.word 2			# 0x10010000
	.word 4			# 0x10010004
	.word 6			# 0x10010008
	.word 8			# 0x1001000C
	.word 10		# 0x10010010
	.word 5			# 0x10010014
	
.text				# instruções
	lui $t0, 0x1001		# armazzena endereço base da memória
	lw $t1, 4($t0)		# carrega 4 em $t1 vindo de 0x10010004
	lw $t2, 8($t0)		# carrega 6 em $t2 vindo de 0x10010008
	lw $t3, 12($t0)		# carrega 8 em $t3 vindo de 0x1001000C
	lw $t4, 16($t0)		# carrega 10 em $t4 vindo de 0x10010010
	lw $t6, 20($t0)		# carrega 5 em $t6 vindo de 0x10010014
	lw $t0, 0($t0)		# carrega 2 em $t0 vindo de 0x10010000
	
	or $t5, $zero, $t0	# soma 2 ao $t5
	add $t5, $t5, $t1	# soma 4 ao $t5
	add $t5, $t5, $t2	# soma 6 ao $t5
	add $t5, $t5, $t3	# soma 8 ao $t5
	add $t5, $t5, $t4	# soma 10 ao $t5, armazenando então o somatório de todos os números inseridos 			(resposta 2 em $t5)
	div $t5, $t6		# divide a soma dos numeros (em $t5) por 5 (em $t6)
	mflo $t7		# passa o quociente pro $t7 									(resposta 1 $t7)
	mult $t0, $t1		# t0 * t1
	mflo $t0		# armazena a multiplicação acima em $t0
	mult $t0, $t2		# t0 * t2
	mflo $t0		# armazena a multiplicação acima em $t0
	mult $t0, $t3		# t0 * t3
	mflo $t0		# armazena a multiplicação acima em $t0
	mult $t0, $t4		# t0 * t4
	mflo $t0		# armazena o produto final em $t0								(resposta 3 em $t0)
.data
	.word 1		#0x10010000

.text
	li $v0, 5		# comando de leitura de inteiro
	syscall			# roda leitura de inteiro
	
	ori $t1, $zero, 1 	# i condicional de for
	ori $s0, $zero, 1	# 1 condicional de casos especiais + aux
	beq $t0, $zero, end	# caso seja 0, vai direto pro end
	
for: 
	beq $t1, $t0, end	# condicional pra n=1
	addi $t1, $t1, 1 	# i++
	mult $s0, $t1 		# i * (i+1)
	mflo $s0		# armazena em $s0
	j for			# reinicia

end:

.data
	.word 22	# 0x10010000
	
.text
	lui $t1, 0x1001		# referencia em $t1
	lw $t2, 0($t1)		# carrega palavra em $t2
	ori $t5, $t5, 1		# 1 condicional
	slti $t4, $t2, 6	# se $t2 for menor que 6, envia 1 ao $t4
	beq $t4, $t5, end	# encerra o programa
	slti $t4, $t2, 17	# se $t2 for menor que 17, envia 1 ao $t4
	
	# percebeu-se que poderia ter cortado a funcao infantil atraves da insercao direta de 1 ao valor final porem
	# preguica pois ja acabei :) isso tiraria umas 3 instrucoes me perdoa meu cerebro nao aguenta mais
	
	beq $t4, $t5, infantil	# faz condicional do resultado da operacao acima
	bne $t4, $t5, adulto
	
	
infantil:
	addi $t0, $t0, 1	# insere valor 1 para indicar infantil
	j end			# fim de programa
	
adulto:
	addi $t0, $t0, 2	# insere valor 2 para indicar adulto	
	
end:
	
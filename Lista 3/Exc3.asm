.data
	.word 0		# 0x10010000
	
.text
	lui $t0, 0x1001			# referencia em $t0
	lw $t0, 0($t0)			# carrega palavra no proprio $t0
	ori $t4, $t4, 1			# 1 condicional
	andi $t1, $t0, 1		# se a operacao and com 1 and der 1, eh impar. se and for 0, eh par
	beq $t0, $zero, ifZero		# se $t0 for zero, pula pra ifZero
	bne $t0, $zero, ifNotZero	# se $t0 nao for zero, pula pra ifNotZero
	
ifZero:
	j end
ifNotZero:
	slt $t3, $t0, $zero		# se $t0 for menor que zero, envia 1 ao $t3
	beq $t3, $t4, ifNegative	# se $t3 receber 1, pula ao ifNegative
	addi $t2, $zero, 1		# caso nao seja negativo, acrescenta valor 1 ao $t2
	j end				# fim de programa
	
ifNegative:
	addi $t2, $zero, 2		# caso seja negativo, acrescenta 2 ao $t2
	j end				# fim de programa
	
end:
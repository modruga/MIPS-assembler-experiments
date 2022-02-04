.data
	.word 0 # 0x10010000
	
.text
	lui $t1, 0x1001 	# referencia no $t1
	lw $t2, 0($t1)		# load word no $t2
	beq $t2, $zero, ifZero
	bne $t2, $zero, ifNotZero
ifZero:
	ori $t0, $zero, 0	# se for igual a zero, $t0 recebe 0
	j end
ifNotZero:
	slt $t0, $t2, $zero	# se $t2 for menor que zero
	bne $t0, $zero, end	# envia 1 ao $t0 e termina o programa
	ori $t0, $zero, 2	# caso nao seja menor que zero, acrescenta valor 2 em $t0, indicando que eh positivo
end: 				# fim de programa
.data
	vetor: .word 2, 4, 6, 8, 10
	
.text
	la $t0, vetor		# ponteiro pro inicio do vetor
	la $t1, vetor+16	# ponteiro pro final do vetor
loop:
	beq $t0, $t1, end	# quando se cruzarem, acaba o programa
	lw $t6, 0($t0)		# carrega esquerda
	lw $t7, 0($t1)		# carrega direita
	move $t4, $t6		# swap
	move $t6, $t7		
	move $t7, $t4		
	sw $t6, 0($t0)		# guarda valores trocados na memória
	sw $t7, 0($t1)
	addi $t0, $t0, 4	# incrementa ponteiro do inicio
	addi $t1, $t1, -4	# decrementa ponteiro do fim
	j loop			# reseta
	
end:
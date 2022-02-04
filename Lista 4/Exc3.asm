.data
	vetor: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
	
.text

	la $t1, vetor		# base do vetor

main:
	beq $t7, 9, end		# se i = 9, sai do loop
	lw $t2, 0($t1)		# carrega vetor[i]
	lw $t3, 4($t1)		# carrega vetor[i+1]
	slt $t0, $t2, $t3	# se $t2 for menor que $t3, envia 1 ao $t0 atraves da funcao slt (set less than)
	beq $t0, $zero, end	# se nao estiver ordenado (se slt resultar em 0), fecha programa
	addi $t1, $t1, 4	# avança pra proxima word
	addi $t7, $t7, 1	# incrementa i
	j main
	
end:
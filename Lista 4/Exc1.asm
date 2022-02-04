.data 
	string: .asciiz "Eu passarei na disciplina de AOC-I."
	
.text
	la $t0, string		# base da string
	li $t5, 32		# salva valor da space bar
	
main:
	
	lbu $t1, 0($t0)			# carrega o char atual
	beq $t1, $zero, end		# nulo? se sim, fecha programa
	beq $t1, $t5, startaPuxa	# caso seja espaço, entra no loop de puxar
	addiu $t0, $t0, 1		# incrementa posicao de memoria do loop
	j main
	
startaPuxa:
	move $t3, $t0		# armazena posicao em que foi detectado space bar
	j puxa			# envia pra funcao de puxar
	
puxa:	
	lbu $t2, 1($t3)		# carrega o prox char
	sb $t2, 0($t3)		# guarda o prox char no char atual
	addiu $t3, $t3, 1	# incrementa posicao da base
	beq $t2, $zero, main	# se for nulo, volta ao main
	j puxa			# repete
	
end:
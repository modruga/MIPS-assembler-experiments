.data 
	string: .asciiz "eu  sou aluno do centro de desenvolvimento tecnologico da ufpel."
	
.text
	la $t0, string		# base da string
	li $t5, 32		# salva valor da space bar
	lbu $t1, 0($t0)		# hardcodando o primeiro caractere pra ser maiusculo
	addi $t1, $t1, -32	# etc etc
	sb $t1, 0($t0)		# primeiro caracter maiusculo na base da preguiça :)
	
main:
	
	lbu $t1, 0($t0)			# carrega o char atual
	beq $t1, $zero, end		# nulo? se sim, fecha programa
	beq $t1, $t5, startaCaps	# caso seja espaço, entra no pre Caps
	addiu $t0, $t0, 1		# incrementa posicao de memoria do loop
	j main				# repete
	
startaCaps:
	move $t3, $t0		# armazena posicao em que foi detectado space bar
	j Caps			# envia pra funcao de Caps
	
Caps:	
	lbu $t2, 1($t3)		# carrega o prox char
	beq $t2, $t5, skipa
	addi $t2, $t2, -32	# muda prox char p/ maiuscula
	sb $t2, 1($t3)		# guarda o prox char no char atual
	addi $t0, $t0, 1	# incrementa loop externo
	j main			# volta ao main
	
skipa:
	addi $t3, $t3, 1	# avanca em 1 o endereco de $t3 pra resolver space bar consecutiva
	addi $t0, $t0, 1	# avanca o loop externo tambem
	j Caps			# retorna a funcao caps
	
end:
.text

main:
	li $t0, 3	# 3 pra dividir a media
	
	li $v0, 5	# comando de ler inteiro
	syscall		# ativa comando 5 (ler inteiro)
	
	move $t1, $v0	# move 1o lido pro $t1
	
	li $v0, 5	# comando de ler inteiro
	syscall		# ativa comando 5 (ler inteiro)
	
	move $t2, $v0	# move 2o lido pro $t2
	
	li $v0, 5	# comando de ler inteiro
	syscall		# ativa comando 5 (ler inteiro)
	
	move $t3, $v0	# move 3o lido pro $t3
	jal media	# roda funcao de calculo de media
	
	li $v0, 10	# comando de termino de programa
	syscall		# roda termino de programa
	
media:
	
	add $t5, $t1, $t2	# soma t1 com t2
	add $t5, $t5, $t3	# soma resultado anterior com t3
	
	div $t5, $t0		# divide e faz a media
	mflo $t5		# move pro registrador solicitado
	
	li $v0, 1		# carrega syscall de impressao
	move $a0, $t5		# move conteudo do registrador $t5 pra ser impresso
	syscall			# ativa comando de impressao de inteiro
	jr $ra			# retorna pra funcao main
.data
	.word 7	# 0x10010000

.text
	lui $t0, 0x1001		# referencia em 0x1001
	lw $t0, 0($t0)		# load word em $t2 com a nota do aluno
	slti $t1, $t0, 3	# se $t0 menor que 3, $t1 resulta em 1
	ori $t3, $zero, 1	# 1 condicional
	beq $t1, $t3, reprovado	# se a nota for abaixo de 3, pula pra reprovado
	j secondTest
	
reprovado:
	and $t1, $t1, $zero	# reprovado resulta $t1 em zero
	j end
	
secondTest:
	slti $t1, $t0, 7	# se menor que sete verdadeiro, exame
	beq $t1, $t3, end	# se for menor, pula pro fim do programa (resultado sera 1)
	
	ori $t1, $t1, 2		# se ambas condicionais anteriores forem falsas, acrescenta 2 como "aprovado" em $t1
	
end:
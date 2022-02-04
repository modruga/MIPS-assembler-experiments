.data
	.word 5 		# 0x10010000
.text
	lui $t0, 0x1001		# referencia
	lw $t0, 0($t0)		# load em $t0
	ori $t3, $zero, 1	# condicional 1
	ori $t4, $zero, 11	# condicional fim de taboada
	ori $t5, $zero, 1	# i
	lui $s0, 0x1001 	# endereco base
	addi $s0, $s0, 4	# endereco base somado a 4 pra pegar o proximo slot de memoria e ser aceito pelo lui
for: 	
	beq $t5, $t4, end	# se i = 11, quebra o for
	slt $t6, $t4, $t0	# se valor lido > 11 retorna 1 em $t6
	beq $t6, $t3, end	# se o retorno = 1, quebra o for
	slt $t6, $t0, $t3	# se valor lido < 1 retorna 1 em $t6
	beq $t6, $t3, end	# se a condicional acima for verdadeira, sai do for
	mul $t7, $t0, $t5	# multiplicacao da taboada baseada em i
	sw  $t7, 0($s0)		# armazena resultado
	addi $s0, $s0, 4	# skipa um endereco
	addi $t5, $t5, 1	# i++
	j for			# reseta o for
end: 

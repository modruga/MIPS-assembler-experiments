.data
	.word 0 		# 0x10010000
	
.text
	ori $t2, $zero, 100	# i
	ori $t3, $zero, 200	# condicional de saida
	ori $t4, $zero, 2	# 2 usado pra verificacao de par ou impar	
	lui $t0, 0x1001 	#armazena endereço base
for: 	
	beq $t2, $t3, end	# caso condicional seja confirmado, sai do for
	divu $t2, $t4		# verificacao par ou impar
	mfhi $t5		# resto em $t5
	beq $t5, $zero, par	# evita pares
	sw $t2, 0($t0)		# salva o impar no endereco base
	addi $t0, $t0, 4	# skipa pro proximo endereco
	addi $t2, $t2, 1	# i++
	j for
par: 
	addi $t2, $t2, 1	# i++
	j for	
end: 

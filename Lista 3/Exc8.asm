.text
	ori $t2, $zero, 0 	# i inicial em 0
	ori $t3, $zero, 11	# condicao de quebra de loop
for:	
	beq $t2, $t3, end	# se i = 10, pula pro end
	andi $t5, $t2, 1	# andi verifica se e par ou impar
	bne $t5, $zero, isOdd	# se for impar, pula pro isOdd
	add $t6, $t6, $t2	# soma-se pares a si mesmo
	addi $t2, $t2, 1	# i++
	j for
isOdd: 
	addi $t1, $t1, 1	# contadorDeImpares++
	add $t8, $t8, $t2	# soma dos impares
	addi $t2, $t2, 1	# i++
	divu $t8, $t1		# opera divisao da media de impares
	mflo $t7		# puxa o quociente da media pro $t7
	j for			# repete o loop
end: 

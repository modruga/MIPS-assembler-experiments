addi $t1, $zero, 5	# valor de x
addi $t2, $zero, 10	# valor de y
addi $t5, $zero, 9	# valor 9 pra multiplicar x
addi $t6, $zero, 3	# valor 3 pra multiplicar y
addi $t7, $zero, 2	# valor 2 pra multiplicar y no denominador
mult $t5, $t1		# faz 9x
mflo $t5		# move 9x pro $t5
mult $t2, $t6		# faz 3y
mflo $t6		# move 3y pra $t6
add $t0, $t5, $t6	# (9x) + (3y)
addi $t0, $t0, -7	# adiciona -7 ao resultado anterior
mult $t7, $t1		# faz 2x
mflo $t5		# move 2x pra $t5
sub $t5, $t5, $t2	# subtrai y de 2x
addi $t5, $t5, 8	# adiciona 8 em (2x - y)
div $t0, $t5		# divide $t0 por $t5
mflo $t3		# armazena quociente em $t3
mfhi $t4		# armazena resto em $t4
			# 5c) quebra(?), o denominador, por ser zero, torna o resultado num número não-real (termo desconhecido pelo programador leigo).
			# ambos quociente e resto (#t3 e $t4) resultam em zero.

addi $t5, $zero, -5	# armazena valor de x como 5
addi $t1, $zero, 3	# armazena 3 pra multiplicar x
addi $t2, $zero, -5	# armazena -5 pra multiplicar x
mult $t5, $t5		# faz x * x (x^2)
mflo $t6		# move x^2 pra t6
mult $t6, $t1		# faz (x^2) * 3 --- resulta em (3x^2)
mflo $t6		# armazena resultado de 3x^2 em $t6
mult $t5, $t2		# faz x * -5 (-5x)
mflo $t7		# move resultado de (-5x) pra $t7
add $t6, $t6, $t7	# soma (3x^2) com (-5x)
addi $t6, $t6, 7	# soma resultado da anterior com valor inteiro 7
			# 4d) dá erro quando inputado um valor negativo, mas funciona com valor positivo, o erro indicado por um valor negativo é de que o or imediato
			# torna-se uma pseudo instrução.
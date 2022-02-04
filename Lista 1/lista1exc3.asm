addi $t1, $zero, 5	# teste com valor 5 em x
addi $t2, $zero, 10	# teste com valor 10 em y
addi $t3, $zero, 20	# teste com valor 20 em z
addi $t4, $zero, 8	# 8x
addi $t5, $zero, -4	# -4y
addi $t6, $zero, 6	# 6z
mult $t1, $t4		# resultado de 8 * x
mflo $t1		# move de lo pro proprio $t1
mult $t2, $t5		# resultado de -4 * y
mflo $t2		# move de lo pra $t2
mult $t3, $t6		# resultado de 6 * z
mflo $t3		# move de lo pra $t3
add $t7, $t1, $t2	# adiciona $t1 com $t2 e armazena em $t7
add $t7, $t7, $t3	# adiciona o resultado anterior com $t3 e armazena no proprio $t7 novamente

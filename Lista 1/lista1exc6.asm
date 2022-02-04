addi $t1, $zero, 5	# bzinho					em $t1
addi $t2, $zero, 10	# Bzao						em $t2
addi $t3, $zero, 7	# h						em $t3
addi $t5, $zero, 2	# divisor da formula				em $t5
add $t4, $zero, $t2	# Bzao no resultado
add $t4, $t4, $t1	# soma bzinho ao Bzao				em $t4
mult $t4, $t3		# multiplica (B + b) por h
mflo $t4		# armazena o produto em $t4
div $t4, $t5		# divide o produto anterior por 2
mflo $t4		# armazena o quociente da operação acima	em $t4
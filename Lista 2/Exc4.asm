.data
	a: .half 30	# 0x10010000
	b: .half 5	# 0x10010002
	Q: .space 2	# 0x10010004
	P: .space 4	# 0x10010008
	
.text 
	lui $t0, 0x1001		# referencia ao inicio da memoria
	lh $t1, 0($t0)		# $t1 = a
	lh $t2, 2($t0)		# $t2 = b
	div $t1, $t2		# a / b
	mflo $t3		# armazena a/b em $t3
	sw $t3, 4($t0)		# armazena quociente em 0x10010004
	mult $t1, $t2		# a * b
	mflo $t3		# armazena ab em $t3
	sw $t3, 8($t0)		# armazena produto em 0x10010006
	
	
	
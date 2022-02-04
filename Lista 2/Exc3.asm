.data
	a: .word -3	# 0x10010000
	b: .word 6	# 0x10010004
	c: .word 4	# 0x10010008
	d: .word -2	# 0x1001000C
	e: .word 8	# 0x10010010
	x: .word 3	# 0x10010014
	y: .space 4	# 0x10010018
	
.text
	# -a^4 (resultado em $t1)
	lui $t0, 0x1001
	lw $t1, 0($t0)		# $t1 = a
	addi $t2, $t2, -1	# $t2 = -1
	mult $t1, $t1
	mflo $t3		# $t3 = a^2
	mult $t3, $t1
	mflo $t3		# $t3 = a^3
	mult $t3, $t1
	mflo $t3		# $t3 = a^4
	mult $t3, $t2
	mflo $t1		# $t1 = -[(-3)^4] ou -a^4
	
	# +bx^3 (resultado em $t2)
	lw $t2, 4($t0)		# $t2 = b
	lw $t3, 20($t0)		# $t3 = x
	mult $t3, $t3
	mflo $t4		# $t4 = x^2
	mult $t4, $t3
	mflo $t4		# $t4 = x^3
	mult $t2, $t4
	mflo $t2		# $t2 = bx^3
	
	# -cx^2 (resultado em $t3)
				# $t3 ainda é x
	lw $t4, 8($t0)		# $t4 = c
	mult $t3, $t3
	mflo $t5		# $t5 = x^2
	addi $t6, $t6, -1	# $t6 = -1
	mult $t5, $t4
	mflo $t4		# $t4 = cx^2
	mult $t6, $t4
	mflo $t3		# $t3 = -cx^2
	
	# -dx
				# $t6 ainda é -1
	lw $t4, 12($t0)		# $t4 = d
	lw $t5, 20($t0)		# $t5 = x
	mult $t4, $t5
	mflo $t4		# $t4 = dx
	mult $t4, $t6
	mflo $t4		# $t4 = -dx
	
	#e
	lw $t5, 16($t0)		# $t5 = e
	
	and $t6, $zero, $t6	# anula registrador $t6 pra juntar resultados
	add $t6, $t6, $t1	# adiciona $t1
	add $t6, $t6, $t2	# adiciona $t2
	add $t6, $t6, $t3	# adiciona $t3
	add $t6, $t6, $t4	# adiciona $t4
	add $t6, $t6, $t5	# adiciona $t5
	sw $t6, 24($t0)		# armazena o resultado final no endereço reservado por y
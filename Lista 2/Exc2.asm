.data
	.word 2		# 0x10010000
	.word 4		# 0x10010004
	.word 8		# 0x10010008
	
.text
	ori $t0, $zero, 0x1001		# insere 1001 hex em $t0
	sll $t0, $t0, 16		# move 16 bits pra esquerda
	ori $t0, $t0, 0xD000		# adiciona D000 hex em $t0
	
	lui $t1, 0x1001			# puxa referencia no inicio da memoria em $t1
	lw $t2, 4($t1)			# armazena valor mediano em $t2
	sw $t2, 0($t0)			# store em 0x1001d000
	
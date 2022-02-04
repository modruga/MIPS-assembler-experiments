.data
string1: .asciiz "0 para triangulo, 1 para circulo, 2 para retangulo\n"
string2: .asciiz "insira o valor de a\n"
string3: .asciiz "insira o valor de b\n"
string4: .asciiz "insira o valor de r\n"
jtable: .word L0, L1, L2

pi: .float 3.14

.text
.globl main

main:

	li $v0, 4		# funcao de imprimir string
	la $a0, string1		# carrega a string1 "0 para triangulo, 1 para circulo, 2 para retangulo"
	syscall			# executa impressao
	
	li $v0, 5		# funcao de ler inteiro
	syscall			# executa scan
	
	move $s0, $v0		# move valor pra $s0
	
	sll $s0, $s0, 2		# multiplica por 4 baseado no valor inserido pelo usuario, resultando na label desejada, sendo assim, um switch
	la $t0, jtable		# endereço base de jtable
	add $s0, $s0, $t0	# a soma baseada no valor inserido resulta no label desejado
	
	lw $s0, ($s0)		# carrega o endereço do resultado da somatoria armazenado em $s0
	jr $s0			# pula pro endereço registrado acima
	
	j main				# caso nao atenda requisitos, reinicia programa
	
L0:					# executa area do triangulo e mata programa em seguida
	jal triangulo
	j end
	
L1:					# executa area do circulo e mata programa em seguida
	jal circulo
	j end
	
L2:
	jal retangulo			# executa area do retangulo e mata programa em seguida
	j end
	
triangulo:
	
	li $t2, 2		# divisor da area do triangulo
	li $v0, 4		# funcao de imprimir string
	la $a0, string2		# carrega a string2 "insira o valor de a"
	syscall			# executa impressao
	
	li $v0, 5		# funcao de ler inteiro
	syscall			# executa scan
	move $t0, $v0		# move valor de A pra $t0
	
	li $v0, 4		# funcao de imprimir string
	la $a0, string3		# carrega a string2 "insira o valor de b"
	syscall			# executa impressao
	
	li $v0, 5		# funcao de ler inteiro
	syscall			# executa scan
	move $t1, $v0		# move valor de B pra $t1
	
	add $t3, $t0, $t1	# soma $t0 e $t1 e armazena em $t3
	div $t3, $t2		# divide soma anterior por 2 (armazenado em $t2)
	mflo $t3		# resultado final em $t3
	
	li $v0, 1		# carrega funcao de impressao de inteiro
	move $a0, $t3		# coloca resultado final em $a0
	syscall			# imprime resultado
	
	jr $ra
	
	
circulo:

	li $t7, 3		# pi inteiro 3
	
	li $v0, 4		# funcao de imprimir string
	la $a0, string4		# carrega a string2 "insira o valor de r"
	syscall			# executa impressao
	
	li $v0, 5		# funcao de ler inteiro
	syscall			# executa scan
	move $t0, $v0		# move valor de r pra $t0
	
	mult $t0, $t0		# multiplica r*r
	mflo $t3		# armazena r^2 no registrador $t3
	mult $t3, $t7		# pi * r^2
	mflo $t3		# armazena pir^2 no registrador $t3
	
	li $v0, 1		# carrega funcao de impressao de inteiro
	move $a0, $t3		# coloca resultado final em $a0
	syscall			# imprime resultado
	
	jr $ra
	
retangulo:

	li $v0, 4		# funcao de imprimir string
	la $a0, string2		# carrega a string2 "insira o valor de a"
	syscall			# executa impressao
	
	li $v0, 5		# funcao de ler inteiro
	syscall			# executa scan
	move $t0, $v0		# move valor de A pra $t0
	
	li $v0, 4		# funcao de imprimir string
	la $a0, string3		# carrega a string2 "insira o valor de b"
	syscall			# executa impressao
	
	li $v0, 5		# funcao de ler inteiro
	syscall			# executa scan
	move $t1, $v0		# move valor de B pra $t1
	
	mult $t0, $t1		# multiplica os lados para resultar na area do retangulo
	mflo $t3		# armazena resultado final em $t3
	
	li $v0, 1		# carrega funcao de impressao de inteiro
	move $a0, $t3		# coloca resultado final em $a0
	syscall			# imprime resultado
	
	jr $ra
	
end:

	li $v0, 10		# funcao de termino de programa
	syscall			# mata o programa

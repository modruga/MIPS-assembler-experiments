.data	
	title: .asciiz        				"informe a operacao desejada:\n"
	facString: .asciiz    				"1) fatorial\n"
	fiboString: .asciiz   				"2) fibonacci\n"
	qualNumero: .asciiz   				"insira o valor: "
	result: .asciiz 				"resultado: "
	space:  .asciiz 				" "
	
.text
	ori $s1, $zero, 1
	ori $s2, $zero, 2
	
main:
	li $v0, 4 					# main que inicia programa e consiste de uma seleção de inteiros + comparação pra transição de label
	la $a0, title
	syscall
	li $v0, 4 					
	la $a0, facString
	syscall
	li $v0, 4 					
	la $a0, fiboString
	syscall
	li $v0, 5 					
	syscall
	move $t1, $v0 					
	
	beq $t1, $s1, fatorial
	beq $t1, $s2, fibonacci
	
segundoInput:						# função complementar que pede a segunda parte de inserção de dados usada tanto pelo fib quanto fat
	li $v0, 4 					
	la $a0, qualNumero
	syscall
	li $v0, 5 					
	syscall
	jr $ra	
	
fibonacci: 						# IO + cálculo de elementos
	jal	segundoInput	
	move	$t1, $v0
	ori	$t4, $zero, 0
	ori	$t5, $zero, 1
	
	move	$t7, $t4
	li	$v0, 4
	la	$a0, result		
	syscall
	slt	$t2, $s1, $t1
	bne 	$t2, $zero, prox
	j	end
	
prox: 							# opera e transfere p prox
	move	$t7, $t5
	jal	second
	slt	$t2, $s2, $t1
	bne	$t2, $zero, calc
	j	end
	
calc: 	
	ori 	$t2, $zero, 2
	
loop: 							# somatorio da formula
	beq 	$t2, $t1, end
	add	$t7, $t4, $t5
	move	$t4, $t5
	move	$t5, $t7
	jal	second
	addi	$t2, $t2, 1
	j 	loop

second: 						# impressão formatada
	li	$v0, 1	
	move	$a0, $t7		
	syscall
	li	$v0, 4
	la	$a0, space				# uso da string space pra separar os resultados		
	syscall
	jr	$ra
	
fatorial: 						# IO + cálculo de fatorial
	jal segundoInput
	move $a0, $v0
	jal calcFatorial
	move $t1, $v0
	j fimFatorial
	
calcFatorial: 						# operação base, chama recursão pra trabalhar na pilha usando os endereços fornecidos
	addi	$sp, $sp, -8
	sw	$ra, 4($sp) 
	sw	$a0, 0($sp)
	slti	$t1, $a0, 1
	beq	$t1, $zero, recursao
	ori	$v0, $zero, 1
	addi	$sp, $sp, 8
	jr	$ra
	
recursao:						# recursão através do uso da pilha
	addi	$a0, $a0, -1
	jal	calcFatorial
	lw	$a0, 0($sp)
	lw	$ra, 4($sp)
	addi	$sp, $sp, 8
	mult	$a0, $v0
	mflo	$v0
	jr	$ra
	
fimFatorial: 						# resultado fatorial
	li	$v0, 4
	la	$a0, result		
	syscall
	li	$v0, 1
	move	$a0, $t1
	syscall
	j	end
	
end:							# fim de programa
	li $v0, 10
	syscall

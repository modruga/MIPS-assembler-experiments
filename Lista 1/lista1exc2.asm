lui $t0, 0x7		# inserção de 0x7
sll $t0, $t0, 12	# shift pra esquerda de 12 bits pra alcançar o valor desejado no exercício
addu $t0, $t0, $t0	# adição a si mesmo conforme pedido
			# 2b) resultado incorreto. deu overflow e resultou num número negativo duma soma de dois positivos
			# 2c) ocorre o erro "Arithmetic Overflow", indicando overflow (deu pau)
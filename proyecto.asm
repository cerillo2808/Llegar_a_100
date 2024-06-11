.data
	turno_humano: .asciiz "\n\nTurno del usuario\nIngrese un número del 1 al 10: "
	numero_ingresado: .asciiz "Se ingresó el: "
	turno_maquina: .asciiz "\n\nTurno de la máquina\nNúmero ingresado: "
	contador: .asciiz "\nEl contador actual es: "
	linea: .asciiz "\n"
	gana_humano: .asciiz "\nFelicidades. El usuario gana."
	gana_maquina: .asciiz "\nHas perdido. Gana la máquina. ¡Mejor suerte la próxima!"

.text

	li $a1, 0 #el contador empieza en 0
	li $t1, 0 #la cantidad de turnos
	
	jal MANEJO_TURNOS 
	bltu $a1, 100, MANEJO_TURNOS
	
	li $t2, 2
	div $t1, $t2
	mfhi $t0
	bne $t0, 0, GANADOR_HUMANO
	j GANADOR_MAQUINA
		
MANEJO_TURNOS:
	
	li $t2, 2
	div  $t1, $t2 #cantidad de turnos / 2
	mfhi $t0 #residuo de la division
	beq $t0, 0, TURNO_HUMANO #es turno del humano si el turno es par
	j TURNO_MAQUINA
	

TURNO_HUMANO:

	addi $t1, $t1, 1 #sumarle 1 al contador de turnos

	la $a0, turno_humano
	li $v0, 4
	syscall
	
	li $v0, 5 #lee el numero ingresado PRECAUCION: Si ingresa algo que no es un numero, se cae. Acepta núemros fuera del rango.
	syscall #el numero ingresado está en $v0
	move $a2, $v0 #el numero ingresado se mueve a $a2
	
	la $a0, numero_ingresado
	li $v0, 4
	syscall
	
	move $a0, $a2
	li $v0, 1
	syscall
	
	la $a0, contador
	li $v0, 4
	syscall
	
	add $a1, $a1, $a2 #le sumo el contador lo que se ingresó
	move $a0, $a1
	li $v0, 1
	syscall
	
	jr $ra
	
TURNO_MAQUINA:

	addi $t1, $t1, 1 #sumarle 1 al contador de turnos

	beq $a1, 1, TIRADA_RANDOM
	beq $a1, 12, TIRADA_RANDOM
	beq $a1, 23, TIRADA_RANDOM
	beq $a1, 34, TIRADA_RANDOM
	beq $a1, 45, TIRADA_RANDOM
	beq $a1, 56, TIRADA_RANDOM
	beq $a1, 67, TIRADA_RANDOM
	beq $a1, 78, TIRADA_RANDOM
	beq $a1, 89, TIRADA_RANDOM
	
	bge $a1, 90, MOVIMIENTO_GANADOR
	
	la $a0, turno_maquina
	li $v0, 4
	syscall
	
	#TODO: AGARRAR EL MULTIPLO DE 11
	
	la $a0, contador
	li $v0, 4
	syscall
	
	move $a0, $a1
	li $v0, 1
	syscall
	
	jr $ra
	
	
TIRADA_RANDOM:

	la $a0, turno_maquina
	li $v0, 4
	syscall
	
	move $s0, $a1 #muevo temporalmente al contador a s0 porque ocupo usar a1
	
	li $a1, 9 #genera random con restriccion hasta 9
	li $v0, 42
	syscall #el random creado esta en $a0
	addi $a0, $a0, 1
	li $v0, 1
	syscall
	
	move $a1, $s0 #devuelvo al contador a a1
	add $a1, $a1, $a0 #sumo el numero random al contador
	
	la $a0, contador
	li $v0, 4
	syscall
	
	move $a0, $a1
	li $v0, 1
	syscall
	
	jr $ra
		
MOVIMIENTO_GANADOR:

	li $t3, 100
	sub $t2, $t3, $a1
	
	la $a0, turno_maquina
	li $v0, 4
	syscall
	
	move $a0, $t2
	li $v0, 1
	syscall
	
	add $a1, $a1, $t2
	
	la $a0, contador
	li $v0, 4
	syscall
	
	move $a0, $a1
	li $v0, 1
	syscall
	
	jr $ra

GANADOR_HUMANO:

	la $a0, gana_humano
	li $v0, 4
	syscall
	
	li $v0, 10
	syscall #exit

GANADOR_MAQUINA:

	la $a0, gana_maquina
	li $v0, 4
	syscall

	li $v0, 10
	syscall #exit

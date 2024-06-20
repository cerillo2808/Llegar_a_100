# Proyecto Final de Fundamentos de Arquitectura: Llegar a 100

Universidad de Costa Rica <br />
Escuela de Ciencias de la Computación e Informática <br />
CI-0114 Fundamentos de Arquitectura de Computadoras <br />
Profesor: Luis Araya Carballo <br />
Estudiantes:
- Amber Villarreal Campos - C28481
- Liqing Yosery Zheng Lu - C38680

## Descripcion
Este proyecto ha sido programado en ensamblador MIPS <br />

“Llegar a 100” es un juego de dos jugadores, en donde en cada turno, se le puede sumar al contador un número del 1 al 10. El ganador es el jugador que, en su turno, logra llegar a 100. <br />
En el caso de este programa, el jugador competirá contra una máquina, la cual estará programada con la intención de ganar la mayoría de partidas posibles.

## Instrucciones para Ejecutar el Programa
1. Descargar MARS disponible en `https://courses.missouristate.edu/kenvollmar/mars/download.htm`.
2. Descargar código fuente `proyecto.asm`.
3. En MARS, abrir el .asm descargado del paso anterior.
4. Abrir 'Tools' y presionar la opción Bitmpa Display para la interfaz gráfica.
5. Ajustar el tamaño de Bitmap Display a: `32, 32, 512, 512`.
6. Presionar el botón 'Connect to MIPS' antes de iniciar la partida.
7. Presione el botón de esamblar.
8. Usar el botón de ejecutar.
9. Seguir instrucciones durante el juego.

## Consideraciones Técnicas
- El programa será desarrollado para que el usuario juegue contra una máquina.
- El usuario tomará el primer turno.
- Sólo hay una partida conocida en la que la máquina no gana: entradas del usuario en orden = `(1, 12, 23, 34, 45, 56, 67, 78, 89, 100)`.
- En la interfaz gráfica se mostrará en una ventana el estado actual del contador y el número de turnos que ha durado la partida.
- El programa se terminará de ejecutar una vez el contador llegue a 100.
- Si se le ingresa un caracter diferente a entero, ocurrirá un error de syscall y el programa terminará de ejecutarse.
- Si no se siguen las instrucciones durante el juego y/o el programa deja de responder: Terminar la tarea desde 'Task Manager' 

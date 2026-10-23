; 9.- PUSH y POP
; Materia: Lenguajes de Interfaz
; Nombre: Jose Angel Garcia Chavez
; Horario: 9:00 am - 10:00 am
; Docente: Jose Luis Medina Jimenez
; Descripcion: Manipulacion de la pila de memoria para guardar temporalmente y recuperar datos o estados de los registros
INCLUDE Irvine32.inc

.code
main PROC  
    ; BLOQUE 1: Push y Pop
	mov eax, 40

	push eax

	nop

	mov eax, 0
	pop ebx

	nop

	; BLOQUE 2: Orden de LIFO
	mov eax, 10
	push eax

	mov eax, 20
	push eax

	mov eax, 30
	push eax

	pop eax
	pop ebx
	pop ecx

	nop

	;BLOQUE 3: Conservar los registros

	mov eax, 100
	mov ebx, 200

	push eax
	push ebx

	mov eax, 999
	mov ebx, 666


	nop

	; BLOQUE 4: CALL y RET

	mov eax, 50
	mov ebx, 100

	call aumentarDiez
	
	nop
	exit

main ENDP

aumentarDiez PROC ; En esta función se aumenta el valor de EAX en 10
    push ebx

	mov ebx, 10 
	add eax, ebx

	pop ebx

	ret
aumentarDiez ENDP

END main

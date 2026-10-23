; 12.- Desplazamiento y Rotacion
; Materia: Lenguajes de Interfaz
; Nombre: Jose Angel Garcia Chavez
; Horario: 9:00 am - 10:00 am
; Docente: Jose Luis Medina Jimenez
; Descripcion: Manipulacion de bits utilizando instrucciones de desplazamiento SHL y SHR y para rotacion ROL y ROR
INCLUDE Irvine32.inc

.code
main PROC  

    mov eax, 0
	mov ebx, 0
	mov ecx, 0
	mov edx, 0

; 1 SHL: Desplazar un bit a la izquierda
    mov al, 10000110b
	shl al, 1

	call DumpRegs
	call WriteBin
	
; 2 SHR: Desplazar un bit a la derecha
    mov al, 00001101b
	shr al, 1

	call DumpRegs
	call WriteBin

; 3 SAR: Desplazamiento con signo
    mov eax, 0
	mov al, -8
	sar al, 1

	call DumpRegs
	call WriteBin

; 4 SAR: Desplazamiento con valor impar
    mov eax, 0
	mov al, -9
	sar al, 1

; 5 Conteo constante: desplazar dos posiciones
    mov al, 00001100b
	shl al, 2

	call DumpRegs
	call WriteBin

; 6 Conteo con CL: desplazar utilizndo un registro
    mov al, 00001100b
	mov cl, 2
	shr al, cl

; 7 ROR, ROL, RCR, RCL: Rotaciones
; 10000001b

; ROR
	mov al, 10000001b
	ror al, 1

	call DumpRegs
	call WriteBin

; ROL
    mov al, 10000001b
	rol al, 1

	call DumpRegs
	call WriteBin

	exit

main ENDP

END main

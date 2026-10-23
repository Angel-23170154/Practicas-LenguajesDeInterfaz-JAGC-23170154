; 11.- Operaciones logicas
; Materia: Lenguajes de Interfaz
; Nombre: Jose Angel Garcia Chavez
; Horario: 9:00 am - 10:00 am
; Docente: Jose Luis Medina Jimenez
; Descripcion: Useo de operadores a nivel de bits AND, OR, XOR, NOT. Para el filtrado y manipulacion de datos.
INCLUDE Irvine32.inc
; ESTADOS DE COMPUTADORA
; 0 = Computadora encendida      0: No 1: Si
; 1 = Alarma                     0: No 1: Si
; 2 = Computadora esta conectada
; Condiciones iniciales: 000 0101

.data
    msgEncendida BYTE "Alarma esta encendida", 0
    msgApagada BYTE "Alarma esta apagada", 0

.code
main PROC  

; 1 AND: Evaluacion d e alarma
    mov al, 00000101b
    and al, 00000010b

    call WriteBin

; 2 OR: Encender alarma
    mov eax, 0
    mov al, 00000101b
    or al, 00000010b

    call WriteBin

; 3 XOR: Apagar computadora y encenderla
; Estado inicial: 000 0101
    mov eax, 0
    mov al, 00000101b
    xor al, 00000101b

    call WriteBin
    call Crlf
    
; 4 TEST: Evaluar alarma encendida y apagada
; Realizar salto y mostrar mensaje de: "Alarma esta encendida" o "Alarma esta apagada"
    mov al, 00000101b
    test al, 00000010b
    jz alarmaApagada

    mov edx, OFFSET msgEncendida ; Aquí se almacena la dirección del mensaje en el registro EDX
    call WriteString
    call Crlf
    jmp FinPrograma

AlarmaApagada: ; Se ejecuta si la alarma está apagada
    mov edx, OFFSET msgApagada
    call WriteString
    call Crlf

FinPrograma:
	exit

main ENDP

END main

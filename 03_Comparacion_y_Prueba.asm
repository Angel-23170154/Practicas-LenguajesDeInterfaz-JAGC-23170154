; 3.- Comparacion y prueba
;Materia: Lenguajes de Interfaz
;Nombre: Jose Angel Garcia Chavez
;Horario: 9:00 - 10:00
;Docente: Ing. Jose Luis Medina Jimenez
;Descripcion: Uso de instrucciones de comparacion para evaluar datos y modificar las banderas del procesador
INCLUDE C:\irvine\Irvine32.inc

.code 
;CONDICION 1: ZERO FLAGS
    main PROC 
    mov EBX , 1
    cmp ebx, 1
    call dumpRegs 

    mov EAX, 01h
    cmp EAX, EBX
    call dumpRegs

    mov cl, 1111111b
    cmp cl, cl
    call dumpRegs

; CONDICION 2 : SING FLAG
    mov Eax, 0
    mov EBX, 0

    mov al, -5
    mov bl, 1
    cmp al, bl
    call dumpRegs

; CONDICION 3 : CARRY FLAG
    mov EAX, 0
    mov EBX, 0

    mov al, 255
    add al, 1

    call dumpRegs

; CASO 4 : OVERFLOW FLAG 
    mov EAX,0
    mov EBX, 0

    mov al, -128
    mov bl, 1

    cmp al, bl
    call dumpRegs


; CASO 5 : TEST

    mov EAX, 0
    mov EAX, 5 ; 00000101b
    test EAX, 1
    call dumpRegs

    mov EAX, 0 
    mov al, 10000000b
    test al, al
    call dumpRegs

exit
main ENDP

END main


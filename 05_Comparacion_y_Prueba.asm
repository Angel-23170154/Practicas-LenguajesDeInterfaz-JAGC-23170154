;5.- CONDICIONALES
;MATERIA: LENGUAJES DE INTERFAZ
;ALUMNO: JOSE ANGEL GARCIA CHAVEZ
;HORARIO: 9:00 - 10:00
;DOCENTE: JOSE LUIS MEDINA JIMENEZ
;DESCRIPCION: APLICACION DE ESTRUCTURAS DE CONTROL PARA REPETIR UN BLOQUE DE CODIGO HASTA QUE SE DETECTE EL INGRESO DE UN CERO
INCLUDE Irvine32.inc

.code
main PROC

; WHILE
    mov ebx, 1 

cicloWhile:
    cmp ebx, 100 

    jg fin 

    mov eax, ebx
    call WriteDec 
    call Crlf 

    inc ebx 
    jmp cicloWhile 

fin:
    call Crlf 

    mov ebx, 1 

cicloDoWhile:

    mov eax, ebx 
    call WriteDec 
    call Crlf 

    inc ebx
    cmp ebx, 100 

    jle cicloDoWhile 

    exit 
main ENDP

END main
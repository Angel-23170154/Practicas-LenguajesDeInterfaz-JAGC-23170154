;6.- DECREMENTO E INCREMENTO
;MATERIA: LENGUAJES DE INTERFAZ
;ALUMNO: JOSE ANGEL GARCIA CHAVEZ
;HORARIO: 9:00 - 10:00
;DOCENTE: JOSE LUIS MEDINA JIMENEZ
;DESCRIPCION: USO DE LAS INSTRUCCIONES INC Y DEC APLICADAS A UN CONTADOR PARA SIMULAR LA ENTRADA Y SALIDA DE VEHICULOS DE UN ESTACIONAMIENTO
INCLUDE Irvine32.inc 
.data 
    msgPIN BYTE "Ingrese la clave: ",0  
    msgError BYTE "Clave Incorrecta.",0
    msgAcceso BYTE "Acceso permitido",0
    msgBloqueo BYTE "Sistema Bloqueado",0
    msgIntentos BYTE "Intentos restantes: ",0

    claveCorrecta = 1234

.code
main PROC
    mov ebx, 3 
    intentar:
    mov edx, OFFSET msgPIN
    call WriteString 
    call ReadInt 

    cmp eax, claveCorrecta

    je acceso ;si son iguales brinca a acceso, SALTA A LA ETIQUETA DE ACCESO PARA MOSTRAR MENSAJE DE ACCESO


    mov edx, OFFSET msgError 
    call WriteString
    call crlf

    dec ebx ; DESCUENTA/DISMINUYE EN UN VALOR DE 1 AL NUMERO DE INTENTOS.

    jz bloqueado

    mov edx, OFFSET msgIntentos
    call WriteString

    mov eax, ebx
    call WriteDec
    call crlf

    jmp intentar
acceso:
    mov edx, OFFSET msgAcceso
    call WriteString
    jmp fin

bloqueado:
    mov edx, OFFSET msgBloqueo
    call WriteString
    jmp fin
fin:
    exit 
main ENDP

END main
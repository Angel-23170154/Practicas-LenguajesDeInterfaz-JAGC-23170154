; 2.- Ingreso de datos
; Materia: Lenguajes de Interfaz
; Nombre: Jose Angel Garcia Chavez
; Horario: 9:00 am - 10:00 am
; Docente: Jose Luis Medina Jimenez
; Descripcion: Lectura de texto desde el teclado y su impresion en la pantalla de la consola
TITLE Plantilla
INCLUDE C:\irvine\Irvine32.inc

.data ; Declaración de datos
mensaje BYTE "Escribe tu nombre: ",0

nombre Byte 15 DUP(0) ; Array de 15 bytes para almacenar el nombre

.code  
main PROC 
    mov edx, OFFSET mensaje ; Asigna la dirección del mensaje a edx
    call WriteString


    mov edx, OFFSET nombre
    mov ecx, SIZEOF nombre  ; Asigna el tamaño 

    call ReadString
    call Crlf

    mov edx, OFFSET nombre ; Asigna la dirección del nombre a edx
    call WriteString
    call Crlf
    exit

main ENDP
END main
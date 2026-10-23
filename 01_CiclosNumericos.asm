; 1.- Ciclos Numericos
; Materia: Lenguajes de Interfaz
; Nombre: Jose Angel Garcia Chavez
; Horario: 9:00 am - 10:00 am
; Docente: Jose Luis Medina Jimenez
; Descripcion: Implementacion de bucles e iteraciones para el manejo de secuencias de numeros
INCLUDE Irvine32.inc

.data

.code 
main PROC 

    mov ecx, 5 

ciclo: ; Aqui en ciclo hacemos que se repita el bloque de instrucciones hasta que ecx sea 0
    mov eax, ecx  
    call WriteDec 
    call Crlf 

    loop ciclo 

    exit
main ENDP
END main
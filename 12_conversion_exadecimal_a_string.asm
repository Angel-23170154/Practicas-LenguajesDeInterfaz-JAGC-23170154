; 13.- Obtencion de una cadena hexadecimal
; Materia: Lenguajes de Interfaz
; Nombre: Jose Angel Garcia Chavez
; Horario: 9:00 am - 10:00 am
; Docente: Jose Luis Medina Jimenez
; Descripcion: Lectura, conversion y formateo de datos para su representacion en base a 16
INCLUDE Irvine32.inc

.data ; Pedimos un número hexadecimal y lo convertimos a string
    numero    DWORD 12AB34CDh
    bufferHex BYTE 8 DUP('?'), 0    
    mensaje   BYTE "Hexadecimal: ", 0
     
.code ; El programa principal muestra el número hexadecimal y su representación en string
main PROC
    mov edx, OFFSET mensaje
    call WriteString

    mov eax, numero
    mov esi, OFFSET bufferHex
    call ConvertirAHex

    mov edx, OFFSET bufferHex
    call WriteString
    call Crlf

    exit
main ENDP

ConvertirAHex PROC ; Lo que hace esta función es convertir un número hexadecimal en una cadena de caracteres
    pushad
    
    add esi, 7              
    mov ecx, 8             

CicloHex: ; Aqui convertimos cada dígito hexadecimal a su representación en ASCII
    mov edx, eax
    and dl, 0Fh             

    cmp dl, 9
    jbe EsNumero
    add dl, 37h             
    jmp GuardarDigito

EsNumero: ; Vemos si el dígito es un número o una letra y lo convertimos a su representación en ASCII
    add dl, 30h             

GuardarDigito: ; Aqui guardamos el dígito convertido en la cadena de caracteres
    mov [esi], dl           
    shr eax, 4              
    dec esi                
    loop CicloHex

    popad
    ret
ConvertirAHex ENDP

END main
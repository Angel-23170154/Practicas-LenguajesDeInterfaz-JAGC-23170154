; 10.- Obtencion de una cadena decimal
; Materia: Lenguajes de Interfaz
; Nombre: Jose Angel Garcia Chavez
; Horario: 9:00 am - 10:00 am
; Docente: Jose Luis Medina Jimenez
; Descripcion: Lectura, conversion y formateo de datos para su representacion en base 10
; PD: El nombre del archivo esta mal XD
INCLUDE Irvine32.inc

.data ; En esta sección se definen las variables y mensajes que se utilizarán en el programa
    descargados DWORD ?
    pendientes  DWORD ?
    porcentaje  DWORD ?
    grupos      DWORD ?
    residuo     DWORD ? 

    buffer BYTE 11 DUP(?), 0

    msgDesc BYTE "Bytes descargados: ", 0
    msgPend BYTE "Bytes pendientes: ", 0
    msgPorc BYTE "Porcentaje de avance: ", 0
    msgGrup BYTE "Grupos completos de 1024 bytes: ", 0
    msgResi BYTE "Residuo del agrupamiento: ", 0

.code 
main PROC 
    mov eax, 125 ; Se define el número de sectores descargados
    mov ebx, 512 ; Se define el tamaño de cada sector en bytes
    mul ebx ; Almacena el resultado de la multiplicación en EAX (descargados = sectores * tamaño_sector)
    mov descargados, eax ; Los bytes descargados se almacenan en la variable descargados

    mov ebx, 100000
    sub ebx, eax
    mov pendientes, ebx

    mov eax, descargados ; Aquí se calcula el porcentaje de avance
    mov ebx, 100
    mul ebx
    mov ebx, 100000
    xor edx, edx
    div ebx
    mov porcentaje, eax

    mov eax, descargados ; Aquí se calcula el número de grupos completos de 1024 bytes y el residuo
    mov ebx, 1024
    xor edx, edx
    div ebx
    mov grupos, eax
    mov residuo, edx

    mov edx, OFFSET msgDesc ; Aquí se imprimen los resultados en pantalla
    call WriteString
    mov eax, descargados
    mov esi, OFFSET buffer
    call convertirDecimal
    mov edx, OFFSET buffer
    call WriteString
    call Crlf

    mov edx, OFFSET msgPend ; Se imprimen los bytes pendientes
    call WriteString
    mov eax, pendientes
    mov esi, OFFSET buffer
    call convertirDecimal
    mov edx, OFFSET buffer
    call WriteString
    call Crlf

    mov edx, OFFSET msgPorc ; Se imprime el porcentaje de avance
    call WriteString
    mov eax, porcentaje
    mov esi, OFFSET buffer
    call convertirDecimal
    mov edx, OFFSET buffer
    call WriteString

    mov al, '%'         ; Aqui imprimimos el simbolo de porcentaje para que se muestre del lado correcto
    call WriteChar      
    call Crlf

    mov edx, OFFSET msgGrup ; Se imprimen los grupos completos de 1024 bytes
    call WriteString
    mov eax, grupos
    mov esi, OFFSET buffer
    call convertirDecimal
    mov edx, OFFSET buffer
    call WriteString
    call Crlf

    mov edx, OFFSET msgResi ; Se imprime el residuo del agrupamiento
    call WriteString
    mov eax, residuo
    mov esi, OFFSET buffer
    call convertirDecimal
    mov edx, OFFSET buffer
    call WriteString
    call Crlf

    exit
main ENDP

convertirDecimal PROC ; Esta función convierte un número decimal en una cadena de caracteres
    pushad
    mov ecx, 0
    mov ebx, 10

DividirLoop: ; Se divide el número entre 10 para obtener cada dígito
    xor edx, edx
    div ebx
    add dl, 30h
    push dx
    inc ecx
    cmp eax, 0
    jne DividirLoop

ExtraerLoop: ; Se extraen los dígitos de la pila y se almacenan en el buffer
    pop dx
    mov [esi], dl
    inc esi
    loop ExtraerLoop

    mov BYTE PTR [esi], 0
    popad
    ret
convertirDecimal ENDP

END main
; 8.- Operaciones Aritmeticas
; Materia: Lenguajes de Interfaz
; Nombre: Jose Angel Garcia Chavez
; Horario: 9:00 am - 10:00 am
; Docente: Jose Luis Medina Jimenez
; Descripcion: Ejecucion de instrucciones matematicas basicas como la suma, resta, multiplicacion y division. Utilizando registros y variables.
INCLUDE Irvine32.inc


.code
main PROC  

     ; 01 -ADO y SUB: Operacion de suma y resta

     mov eax, 50
     mov ebx, 20

     add eax, ebx
     sub eax, 15

     nop

      call DumpRegs

     ; 02 CF: Acarreo de una suma sin signo

     mov eax, 0
     mov al, 255
     add al, 1

     nop
     call DumpRegs

     ; 03 OF: Desbordamiento de una suma con signo

     mov eax,0
     mov al, 127
     add al, 1

     call DumpRegs

     ; 04 MUL: Producto dentro de 32 Bits

     mov eax, 25
     mov ebx, 3
     
     mul ebx

     call DumpRegs

     ; 05 MUL: Producto fuera de 32 Bits

     mov eax, 65537
     mov ebx, 65537

     mul ebx

     ;06 IMUL: Producto con signo

     mov eax, -5
     mov ebx, 3

     imul ebx, eax, 3

     nop

     ;07 DIV: Dividiendo valores pequeños sin signo

     mov eax, 125
     mov edx, 0
     mov ebx, 12

     div ebx

     nop

     ;08 IDIV: Division con signo

     mov eax, -125
     cdq
     mov ebx, 12

     idiv ebx

     nop

     exit


main ENDP

END main

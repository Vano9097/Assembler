.486
.model flat, stdcall
INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.DATA
  len equ 3
  ar1 dw -11, 11, 222
  ar2 db len dup(?)
 .CODE
main:   
  mov ecx, len
  mov esi, offset ar1  
  mov edi, offset ar2
start:
  dec ecx
  jl stop

  mov ax, [esi]
  cmp ax, 0
  jg ok
  neg ax
  
ok:
  
  xor dx, dx 
  mov bx, 10
  
  div bx    
  mov [edi],dx
  
  add esi, type ar1
  add edi, type ar2
  jmp start
    
stop:
  call exit
END main

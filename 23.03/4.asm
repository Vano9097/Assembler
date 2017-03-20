.486
.model flat, stdcall
INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.DATA
  len equ 6
  ar1 dw 1200, -1804, 1805, 1912, -1915, 2000
  ar2 db len dup(?)
 .CODE
main:   
  mov ecx, len
  mov esi, offset ar1  
  mov edi, offset ar2
start:
  dec ecx
  jl stop
  
  mov dx,0
  mov ax, [esi] 
  mov bx, 10
  
  cmp ax,0
  jg ok
  neg ax
ok:
  
  div bx    
  mov [edi],dx
  
  add esi, type ar1
  add edi, type ar2
  jmp start
    
stop:

  call exit
END main

.486
.model flat, stdcall
INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.DATA
  len equ 4
  years dw 2000, 1900, 2004, 1999 
  leaps db len dup(?)
 .CODE
main:   
  mov ecx, len
  mov esi, offset years  
  mov edi, offset leaps
start:
  dec ecx
  jl stop
  
  xor dx, dx
  mov ax, [esi] 
  mov bx, 4
  div bx    
  cmp dx, 0 
  jz mod4
  
mod400?:  
  xor dx, dx
  mov ax, [esi] 
  mov bx, 400
  div bx    
  cmp dx, 0 
  jz yes
  
  mov bl,0
  mov [edi],bl
  add esi, type years
  add edi, type leaps
  jmp start

yes:
  mov bl,1
  mov [edi],bl  
  add esi, type years
  add edi, type leaps
  jmp start

mod4:
  xor dx, dx
  mov ax, [esi] 
  mov bx, 100
  div bx 
  cmp dx, 0 
  jnz yes
  jmp mod400?

stop:
  call exit
END main

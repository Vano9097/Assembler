.486
.model flat, stdcall
INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.DATA
  len equ 6
  years dw 1200, 1804, 1805, 1912, 1915, 2000
  leaps db len dup(?)
 .CODE
main:   
  mov ecx, len
  mov esi, offset years  
  mov edi, offset leaps
start:
  dec ecx
  jl stop
  
  mov dx,0
  mov eax, [esi] 
  mov bx, 4
  div bx    
  cmp dx, 0 
  jz ok
  
vtor:  
  mov dx,0
  mov eax, [esi] 
  mov bx, 400
  div bx    
  cmp dx, 0 
  jz ex
  
  mov bl,0
  mov [edi],bl
  add esi, type years
  add edi, type leaps
  jmp start
ex:
  mov bl,1
  mov [edi],bl  
  add esi, type years
  add edi, type leaps
  jmp start
ok:
  mov dx,0
  mov eax, [esi] 
  mov bx, 100
  div bx 
  cmp dx, 0 
  ; jnz okk
  jnz ex
  jmp vtor
; okk: 
  ; jmp ex 
    
stop:

  call exit
END main

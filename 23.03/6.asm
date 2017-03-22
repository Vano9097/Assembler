.486
.model flat, stdcall
INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.DATA
  len equ 5
  ar1 dd 200, -100, 333, -200, 330
  k dd 100
  len2 dd 0
  ar2 dd len dup(?) 
 .CODE
main:   
  mov ecx, len
  mov esi, offset ar1  
  mov edi, offset ar2
start:
  dec ecx
  jl stop
 
  mov eax, [esi] 
  mov ebx, k

  cdq
  idiv ebx    
  cmp edx, 0
  jnz ok
  
  mov eax, [esi]
  mov [edi], eax
  add edi, type ar2
  inc len2
ok:
  add esi, type ar1
  jmp start
    
stop:

  call exit
END main

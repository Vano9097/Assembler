.486
.model flat, stdcall
INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.DATA
  len equ 7
  ar1 dd 1200, -1804, 1805, -200, 1912, -1915, 2000
  ar2 dd len dup(?) 
 .CODE
main:   
  mov ecx, len
  mov esi, offset ar1  
  mov edi, offset ar2
  
  
  
  mov eax, len
  dec eax
  mov ebx, type ar2
  mul ebx
  add edi, eax
  
  
  
start:
  dec ecx
  jl stop
  
  
  mov eax, [esi] 
  mov [edi], eax
  
  add esi, type ar1
  sub edi, type ar2
  jmp start
    
stop:

  call exit
END main

.486
.model flat, stdcall
INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.DATA
  LEN_AR EQU 12
  facts dd (LEN_AR+1) dup(?)

  
  ; произведение в edx
  
.CODE
main:
  mov ecx, LEN_AR
  mov esi, offset facts
  mov ebx, 1
  mov [esi], ebx
  

start:  
  dec ecx
  jl stop
  
  mul ebx
  add esi, TYPE facts
  
  inc ebx
  mov [esi], eax

  
  jmp start
  
stop:
  call exit
END main

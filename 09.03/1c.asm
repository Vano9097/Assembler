.486
.model flat, stdcall
INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.DATA
  a dd 13 
.CODE
main:
  mov eax, a
  not eax
  mov edx, 1
  
start_loop:

  mov ebx, eax
  and ebx, edx
  jz add1
  not edx
  and eax, edx
  not edx
  shl edx, 1
  jmp start_loop
  
  
add1:
  or eax, edx
  mov a, eax
  
  call exit
END main







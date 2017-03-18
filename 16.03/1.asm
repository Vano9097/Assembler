.486
.model flat, stdcall
INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.DATA
  a dd 19    
  n db 1
.CODE
main:
  
  mov eax, a
  mov ebx, 11111111111111111111111111111111b
  mov cl, n
  shl ebx, cl
  and eax, ebx
  mov a, eax
  
  call exit
END main

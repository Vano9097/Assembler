.486
.model flat, stdcall
INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.DATA
  a dd -140
  s db ?
.CODE
main:
  mov eax, a
  mov ebx, 10
  mov cl, 0
  
  cmp eax, 0
  jge start
  neg eax
  
start:
  cmp eax, 0
  jz ex
  cdq
  div ebx
  add cl, dl
  jmp start 
  
ex:
  mov s, cl
  call exit
END main

.486
.model flat, stdcall
INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.DATA
  a dd 3 
  b dd 17
  k dd ?
.CODE
main:
  mov ebx, 1
  mov ecx, 0
  
  
start:
  mov eax, ebx
  mul eax
  
  inc ebx
  
  cmp eax, b
  ja ex
  
  cmp eax, a
  jb start
  
  add ecx, eax
  

  jmp start 
ex:
  mov k, ecx
  call exit
END main

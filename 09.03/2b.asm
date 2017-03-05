.486

.model flat, stdcall
INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.DATA
  a dd 10
  b dd 8 
  varC dd 30
  d dd 4
  rez dd ?
.CODE
main:
  mov eax, varC
  cdq
  div d
  mov rez, edx
  mov eax,a
  imul b
  sub eax, rez
  mov rez, eax
END main
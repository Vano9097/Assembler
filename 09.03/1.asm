.486
.model flat, stdcall
INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.DATA
  a db 13  

.CODE
main:
  not a
  inc a
  
  call exit
END main







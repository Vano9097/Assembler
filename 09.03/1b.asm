.486
.model flat, stdcall
INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.DATA
  a dw 13 
.CODE
main:
  mov ax, a
  not ax
  mov dx, 1
  
start_loop:

  mov bx, ax
  and bx, dx
  jz add1
  not dx
  and ax, dx
  not dx
  shl dx, 1
  jmp start_loop
  
  
add1:
  or ax, dx
  mov a, ax
  
  call exit
END main







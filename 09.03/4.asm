.486
.model flat, stdcall
INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.DATA
; y=(5x-2)(x-1)
  ; x dd 2
  ; y dd 8
  
  ; x dd 2
  ; y dd 10
  
  ; x dd 1
  ; y dd 0
  
  x dd -2
  y dd 36
.CODE
main:
  mov eax, x
  mov ebx, 5
  imul ebx
  sub eax, 2
  mov ebx, x
  dec ebx
  imul ebx
  cmp eax, y
  jz False
  mov al, 0
  jmp Ext
False:
  mov al,1 
Ext:
  call exit
END main







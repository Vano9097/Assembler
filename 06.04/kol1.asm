.486
.model flat, stdcall
INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.DATA
  s db "KSENIA", 0 ; 0 - терминатор
  a db 'S'
  rez db 0  
.CODE
main:
  mov esi, offset s
  mov edi, offset a
  mov al, byte ptr [edi] 
start:  
  cmp byte ptr [esi], 0
  je exi
  
  cmp byte ptr [esi], al
  jz ex
  
  add esi, type s
  inc rez  
  jmp start
  
exi:
  mov rez, -1
ex:  
  call exit
END main


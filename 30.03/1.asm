.486
.model flat, stdcall
INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.DATA
  s db "kIsS", 0 ; 0 - терминатор
    
.CODE
main:
  mov esi, offset s
  
  cmp byte ptr [esi], 90
  jbe vtor
  sub byte ptr [esi], 32 
vtor:
  add esi, type s
  
start:  
  cmp byte ptr [esi], 0
  je that_s_all
  
  cmp byte ptr [esi], 97
  jae vtor
  
  add byte ptr [esi], 32 
  
  
  
  jmp vtor
 
that_s_all: 
  call exit
END main


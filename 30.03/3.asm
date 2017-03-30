.486
.model flat, stdcall
INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.DATA
  s db "aBcBA", 0 ; 0 - терминатор
  res db ?  
.CODE
main:
   mov esi, offset s
start_UP:  
  cmp byte ptr [esi], 0
  je find_end
  
  cmp byte ptr [esi], 97
  jnae next
  
  sub byte ptr [esi], 32 
next:
  add esi, type s
  
  jmp start_UP
  
find_end:
  dec esi
  mov edi, offset s
  
  
start:
  cmp esi, edi
  jb ok
  mov al, byte ptr [edi]
  cmp byte ptr [esi], al
  jne break
  
  inc edi
  dec esi
  jmp start
 
break:
  mov res, 0
  jmp that_s_all
 
ok:
	mov res, 1
 
that_s_all: 
  call exit
END main


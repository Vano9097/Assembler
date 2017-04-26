.486
.model flat, stdcall
INCLUDE stdlib.inc

; Функции ввода-вывода
INCLUDE stdio.inc
INCLUDELIB msvcrt.lib

.DATA
  f_mess db "Enter string: ", 0
  f_ret db 13, 10, 0
  
  s dd 100 dup(?)
  s1 dd 51 dup(?)
  s2 dd 51 dup(?)
  f_out db "%s",13, 10, 0

.CODE
main:
  push offset f_mess
  call printf
  add esp, 4

  push offset s
  call gets
  add esp, 8
  
mov esi, offset s
mov eax, offset s1
mov ebx, offset s2
mov cl, 0  
start:
  mov dl, [esi]
  cmp dl, 0
  jz print
  
  cmp cl, 0
  jne nch
  
  mov [eax], dl
  inc eax
  inc esi
  mov cl, 1
  jmp start
  nch:
  mov [ebx], dl
  inc ebx
  inc esi
  mov cl, 0
  
  jmp start
  
print:
  push offset s1
  push offset f_out
  call printf 
  add esp, 8
  
  
  push offset s2
  push offset f_out
  call printf 
  add esp, 8

  
  call exit
  
END main
	  







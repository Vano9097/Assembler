.486
.model flat, stdcall
INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.DATA
  LENA EQU 3
  a dd 1,1,1
  LENX EQU 3
  xs dd 0,2,1
  res dd ?
.CODE
main:
  mov esi, offset a
  mov edi, offset xs
  mov ecx, LENX
  mov eax, LENA
  call gorner
  mov res, eax
  dec ecx
  add edi, type xs
start:
  cmp ecx, 0
  je stop
  
  mov eax, LENA
  mov esi, offset a
  call gorner
  cmp eax, res
  jl next
  mov res, eax
next:
  dec ecx
  add edi, type xs
  
  
  jmp start
   
  
  
stop:
  

  call exit
  
gorner:
  ; edi - адрес x
  ; esi - коэфиценты 32бит знак
  ; eax - длина
  push edx
  push eax
  mov eax, 0
gorner_start:
  cmp dword ptr [esp], 0
  je gorner_stop
  
  imul dword ptr [edi]
  add eax, [esi]
  add esi, 4
  dec dword ptr [esp]
  
  jmp gorner_start
gorner_stop:
  add esp, 4
  pop edx
  ret
  
END main





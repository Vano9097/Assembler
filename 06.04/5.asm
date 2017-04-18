.486
.model flat, stdcall
INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.DATA
  LENA EQU 4
  a dw 1,2,1,1
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
  ; edi - x
  ; esi - коэфиценты
  ; eax - длина
  push edx
  push eax
  mov eax, 0
gorner_start:
  cmp dword ptr [esp], 0
  je gorner_stop
  
  imul dword ptr [edi]
  add eax, [esi]
  add esi, type a
  dec dword ptr [esp]
  
  jmp gorner_start
gorner_stop:
  add esp, 4
  pop edx
  ret
  
END main





.486
.model flat, stdcall
INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.DATA
  a dd 5
  ind dd 2
  ar dd 3, 2, 6, 9
  LEN EQU 4
  

.CODE
main:
  mov esi, offset ar
  mov ecx, LEN
  sub ecx,ind
  inc ecx
obrabotka:
  cmp ecx, 0
  je stop
  
  cmp ind, 0
  jnz dalee
  mov ebx,a
  mov eax, dword ptr [esi]
  mov dword ptr [esi], ebx
  mov edx, dword ptr [esi+(type ar)]
  call cdvig_xvocta

dalee:
  add esi, type ar
  dec ind
  jmp obrabotka

stop:
call exit

cdvig_xvocta:
  cmp ecx,0 
  jz stop
  add esi, type ar
  mov dword ptr [esi], eax
  mov eax,edx
  mov edx, dword ptr [esi+(type ar)]
   
  dec ecx
  jmp cdvig_xvocta
  

END main





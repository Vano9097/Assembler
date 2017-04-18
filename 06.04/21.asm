.486
.model flat, stdcall
INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.DATA
  a dd 5
  ind dd 2
  ar dd 3, 2, 6, 9, ?
  LEN EQU 4
  

.CODE
main:
  mov esi, offset ar
  mov ecx, LEN
  sub ecx,ind
  inc ecx
  mov ebx, a
  push ebx
  mov edi, ind
  push edi
  push ecx
  push esi
  call procedura
  call exit

procedura:
  pop eax ; адресс возврата
  pop esi
  pop ecx
  pop edi ; ind
  pop ebx ; a
  push eax
  
obrabotka:
  cmp ecx, 0
  je stop
  
  cmp edi, 0 ; тут был 1
  jnz dalee
  mov eax, dword ptr [esi]
  mov dword ptr [esi], ebx
  mov edx, dword ptr [esi+(type ar)]
  jmp cdvig_xvocta

dalee:
  add esi, type ar
  dec edi
  jmp obrabotka

stop:
  ret

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





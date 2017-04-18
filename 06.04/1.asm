.486
.model flat, stdcall
INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.DATA
  
  LEN EQU 4
  a dd 28, -70, 154, 98

.CODE
main:
  mov eax, LEN
  mov esi, offset a
  call compute_array
  
  call exit
  
NOD:
  push ecx
  push edx
  push ebx
  ; push eax
  ; push ebx
  ; не надо спасать
gcd:
  cmp ebx, 0
  jz stop 
  mov ecx, ebx
  cdq
  div ebx 
  mov ebx, edx
  mov eax, ecx
  jmp gcd  
stop:
  pop ebx
  pop edx
  pop ecx
  
 ; ответ eax
 ret
  
  
re:
   cmp ebx, 0
   jge re_exit
   not ebx
   inc ebx
re_exit:
  ret
  
  
compute_array:
  push eax
  mov eax, [esi]
  add esi, 4
  dec dword ptr [esp]
  
  cmp eax, 0
  jge start
  not eax
  inc eax
  

start:
  cmp dword ptr [esp], 0
  je compute_array_exit
  mov ebx, [esi]
  call re
  call NOD
  dec dword ptr [esp]
  add esi, 4
  jmp start
compute_array_exit:
  ret

  
END main





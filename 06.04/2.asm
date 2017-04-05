.486
.model flat, stdcall
INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.DATA
  a dd 3
  LEN EQU 3
  pow db 0,2,4

.CODE
main:
  mov eax, LEN
  mov esi, offset pow
  call compute_array
  
  call exit
  
power:
  ; eax - число
  ; bl - степень
  push ebx
  push edx
  push eax
  mov eax, 1
power_start:
  cmp bl, 0
  je power_stop
  dec bl
  mul dword ptr [esp]
  jmp power_start
power_stop:
  add esp, 4
  pop edx
  pop ebx
  ; eax  ответ
  ret
  
  
  
compute_array:
  PUSH ECX
  push ebx
  push eax
  mov ecx, 0
start:
  cmp dword ptr [esp], 0
  je compute_array_exit
  mov bl, [esi]
  mov eax, a
  call power
  add ecx, eax
  inc esi
  dec dword ptr [esp]
  
  jmp start
compute_array_exit:
  add esp, 4
  mov eax, ecx
  pop ebx
  pop ecx
  ret

  
END main





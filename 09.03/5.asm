.486

.model flat, stdcall
INCLUDE stdlib.inc
INCLUDELIB msvcrt.lib

.DATA
  a dd 12
  b dd 8  
  rez dd ?
.CODE
main:
  mov eax, a
  mov ebx, b
gcd:
  cmp eax,ebx ; сравниваем числа
  jz  stop    ; если они равны, то заканчиваем поиск, переходим на метку stop
  jl  less    ; если eax < ebx, переходим на метку less
  sub eax,ebx ; eax = eax - ebx
  jmp gcd     ; продолжаем поиск
less:
  sub ebx,eax ; ebx = ebx - eax
  jmp gcd     ; продолжаем поиск
stop:
  mov rez, eax
  call exit
END main
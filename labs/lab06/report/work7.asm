%include 'in_out.asm'
SECTION .data
msg: DB 'Введите x: ',0
rem: DB 'Результат: ',0
SECTION .bss
x: RESB 80
SECTION .text
GLOBAL _start
_start:
mov eax, msg
call sprintLF
mov ecx, x
mov edx, 80
call sread
mov eax,x ; eax=x
call atoi ; ASCII кода в число, `eax=x`
add eax,-1 ; eax=eax-1=x-1
mov ebx,eax ; ebx=eax=x-1
mul ebx ; eax=eax*ebx=(x-1)*(x-1)
mov ebx,5 ; ebx=5
mul ebx ; eax=eax*ebx=5*(x-1)(x-1)
mov edi,eax ;edi=eax=5*(x-1)(x-1)
mov eax,rem
call sprint
mov eax,edi
call iprintLF
call quit

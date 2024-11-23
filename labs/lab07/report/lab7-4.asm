%include 'in_out.asm'
section .data
msg1 db 'Введите x: ',0h
msg2 db 'Введите a: ',0h
msg3 db "Значение: ",0h
section .bss
x resb 10
a resb 10
answer resb 10
section .text
global _start
_start:
; ---------- Вывод сообщения 'Введите x: '
mov eax,msg1
call sprint
; ---------- Ввод 'x'
mov ecx,x
mov edx,10
call sread
; ---------- Преобразование 'x' из символа в число
mov eax,x
call atoi ; Вызов подпрограммы перевода символа в число
mov [x],eax ; запись преобразованного числа в 'x'
; ---------- Вывод сообщения 'Введите a: '
mov eax,msg2
call sprint
; ---------- Ввод 'a'
mov ecx,a
mov edx,10
call sread
; ---------- Преобразование 'a' из символа в число
mov eax,a
call atoi ; Вызов подпрограммы перевода символа в число
mov [a],eax ; запись преобразованного числа в 'a'
; ---------- Записываем 'x' в регистр 'ecx'
mov ecx,[x] ; 'ecx = A'
; ---------- Сравниваем 'x' и 'a' (как числа)
cmp ecx,[a] ; Сравниваем 'x' и 'a'
je next ; если 'x=a', то переход на метку 'next',
mov eax,[a] ; иначе 'eax = a'
mov ebx,[x] ; 'ebx = x'
add eax,ebx ; 'eax=eax+ebx=a+x'
jp fin ; 'Переход к концу программы'
; ---------- Если 'x=a', то
next:
mov eax,6 ; иначе 'eax = 6'
mov ebx,[a] ; 'ebx = a'
mul ebx ; 'eax=eax*ebx=6a'
; ---------- Вывод результата
fin:
mov [answer],eax
mov eax, msg3
call sprint ; Вывод сообщения 'Наименьшее число: '
mov eax,[answer]
call iprintLF ; Вывод 'min(A,B,C)'
call quit ; Выход

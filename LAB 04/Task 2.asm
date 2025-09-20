include irvine32.inc

.data
BASE equ 10
HEIGHT = 6
AREA dword ?

.code
main proc
mov eax, BASE
mov ebx, HEIGHT
mul ebx
mov ebx, 2
mov edx, 0
div ebx
mov AREA, eax

mov eax, AREA
call writeint
call crlf

exit
main endp
end main

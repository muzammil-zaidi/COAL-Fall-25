include irvine32.inc

.data
varA dword 5
varB dword 10
varC dword 3
RESULT dword ?

.code
main PROC
mov eax, varA
add eax, varB
mov ecx,eax

mov eax, varC
mov ebx, 2
mul ebx

sub ecx, eax
mov RESULT, ecx

mov eax, RESULT
call writeInt
call crLf

exit
main ENDP
end main

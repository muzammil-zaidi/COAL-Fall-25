include irvine32.inc

.data
a dword 3
b dword 5
var_c dword ?
d dword ?
msg byte "Value of d = ", 0

.code
main proc
    call function_1
    call function_2

    mov edx, offset msg
    call writestring
    mov eax, d
    call writeint
    call crlf

    exit
main endp

function_1 proc  
    mov eax, b
    add eax, 20
    mov ebx, a
    imul eax, ebx
    mov var_c, eax
    ret
function_1 endp

function_2 proc 
    mov eax, var_c
    imul eax, 10
    mov ebx, a
    add ebx, b
    sub ebx, 10
    cdq
    idiv ebx
    mov d, eax
    ret
function_2 endp

end main

include irvine32.inc

.data
    msg1   byte "Enter a string: ", 0
    msg2   byte "String without spaces: ", 0

    input       byte 80 dup(0)
    output      byte 80 dup(0)
    maxlength   dword 79

.code
main proc

    mov  edx, offset msg1
    call writestring

    mov  edx, offset input
    mov  ecx, maxlength
    call readstring

    mov  esi, offset input
    mov  edi, offset output
    mov  ecx, eax

remove_spaces:
    lodsb
    cmp  al, 0
    je   next
    cmp  al, ' '
    je   skip_space
    stosb

skip_space:
    loop remove_spaces

next:
    mov  al, 0
    stosb

    call crlf
    mov  edx, offset msg2
    call writestring

    mov  edx, offset output
    call writestring

    call crlf
    exit

main endp
end main

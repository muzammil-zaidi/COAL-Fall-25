include irvine32.inc

.data
    msg1        byte "Enter a string: ", 0
    msg2        byte "Word count: ", 0
    buffer      byte 256 dup(0)
    maxlength   dword 255

.code
main proc
    mov edx, offset msg1
    call writestring

    mov ecx, maxlength
    mov edx, offset buffer
    call readstring

    mov esi, offset buffer
    xor ebx, ebx
    xor ecx, ecx

count_loop:
    mov al, [esi]
    cmp al, 0
    je next
    cmp al, 13
    je next
    cmp al, 10
    je next

    cmp al, ' '
    je is_space

    cmp bl, 1
    je advance_char
    inc ecx
    mov bl, 1
    jmp advance_char

is_space:
    mov bl, 0

advance_char:
    inc esi
    jmp count_loop

next:
    mov edx, offset msg2
    call writestring

    mov eax, ecx
    call writedec
    call crlf

    exit
main endp
end main

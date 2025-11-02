include irvine32.inc

.data
    msg1 byte "Enter a number (0-12): ", 0
    msg2 byte "Factorial is: ", 0
    msg3 byte "Number is too big!", 0

.code
main proc
    mov edx, offset msg1
    call writestring
    call readint
    mov ecx, eax

    cmp ecx, 12
    ja toobig

    mov eax, 1
    cmp ecx, 0
    je result

loop_1:
    mul ecx
    dec ecx
    jnz loop_1

result:
    mov edx, offset msg2
    call writestring
    call writeint
    call crlf
    exit

toobig:
    mov edx, offset msg3
    call writestring
    call crlf
    exit

main endp
end main

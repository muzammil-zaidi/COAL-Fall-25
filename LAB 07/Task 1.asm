include irvine32.inc

.data
    prompt byte "enter a number (0 to stop): ", 0
    resultmsg byte "sum of entered numbers: ", 0
    input dword ?
    sum dword 0
    count dword 0

.code
main proc
    mov sum, 0
    mov count, 0

input_loop:
    mov eax, count
    cmp eax, 10
    je done_input

    mov edx, offset prompt
    call writestring
    call readint
    mov input, eax

    cmp eax, 0
    je done_input

    add sum, eax
    inc count

    jmp input_loop

done_input:
    mov edx, offset resultmsg
    call writestring
    mov eax, sum
    call writeint
    call crlf

    exit
main endp
end main

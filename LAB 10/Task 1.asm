include irvine32.inc

.data
    msg1   byte "Enter your password: ", 0
    msg2   byte "Password is strong.", 0
    msg3   byte "Password must include at least 1 digit.", 0

    password    byte 50 dup(0)
    max_length  dword 49

.code
main proc

    mov  edx, offset msg1
    call writestring

    mov  edx, offset password
    mov  ecx, max_length
    call readstring

    mov  esi, offset password
    mov  ecx, eax
    mov  ebx, 0

check_loop:
    lodsb
    cmp  al, 0
    je   done_check

    cmp  al, '0'
    jb   next_char
    cmp  al, '9'
    ja   next_char

    mov  ebx, 1
    jmp  done_check

next_char:
    loop check_loop

done_check:
    cmp  ebx, 1
    je   strong
    mov  edx, offset msg3
    call writestring
    jmp  next

strong:
    mov  edx, offset msg2
    call writestring

next:
    call crlf
    exit

main endp
end main

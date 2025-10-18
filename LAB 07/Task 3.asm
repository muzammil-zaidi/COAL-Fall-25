include irvine32.inc

.data
    prompt      byte "Enter 8-bit status code (decimal 0 to 255): ", 0
    abnormalmsg byte "Abnormal vitals:", 0
    vitalsmsg   byte " Vitals abnormal", 0

    v1 byte "1. Blood sugar", 0
    v2 byte "2. Systolic blood pressure", 0
    v3 byte "3. Diastolic blood pressure", 0
    v4 byte "4. Pulse", 0
    v5 byte "5. Hemoglobin", 0
    v6 byte "6. Body temperature", 0
    v7 byte "7. Respiration rate", 0
    v8 byte "8. Pain level", 0

    urgentmsg byte "Patient status: urgent", 0
    intermsg  byte "Patient status: intermediate", 0
    trivialmsg byte "Patient status: trivial", 0

    codeval byte ?
    bitcount dword 0

.code
main proc
    mov edx, offset prompt
    call writestring
    call readint
    mov codeval, al

    movzx ebx, codeval
    xor ecx, ecx

    call crlf
    mov edx, offset abnormalmsg
    call writestring
    call crlf

    mov esi, 0

check_loop:
    cmp esi, 8
    je done_bits

    mov al, bl
    and al, 1
    cmp al, 1
    jne next_bit

    inc ecx

    mov eax, esi
    call printvital

next_bit:
    shr bl, 1
    inc esi
    jmp check_loop

done_bits:
    call crlf

    mov eax, ecx
    call writeint
    mov edx, offset vitalsmsg
    call writestring
    call crlf

    cmp ecx, 6
    jge urgent

    cmp ecx, 3
    jge intermediate

    jmp trivial

urgent:
    mov edx, offset urgentmsg
    jmp show_status

intermediate:
    mov edx, offset intermsg
    jmp show_status

trivial:
    mov edx, offset trivialmsg

show_status:
    call writestring
    call crlf

printvital proc
    push edx
    cmp eax, 0
    je l1
    cmp eax, 1
    je l2
    cmp eax, 2
    je l3
    cmp eax, 3
    je l4
    cmp eax, 4
    je l5
    cmp eax, 5
    je l6
    cmp eax, 6
    je l7
    cmp eax, 7
    je l8
    jmp exitprint

l1:
    mov edx, offset v1
    jmp printnow
l2:
    mov edx, offset v2
    jmp printnow
l3:
    mov edx, offset v3
    jmp printnow
l4:
    mov edx, offset v4
    jmp printnow
l5:
    mov edx, offset v5
    jmp printnow
l6:
    mov edx, offset v6
    jmp printnow
l7:
    mov edx, offset v7
    jmp printnow
l8:
    mov edx, offset v8

printnow:
    call writestring
    call crlf
exitprint:
    pop edx
    ret
printvital endp

exit
main endp
end main

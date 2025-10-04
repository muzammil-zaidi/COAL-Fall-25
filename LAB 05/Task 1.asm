include irvine32.inc

.data
    salaries dword 50000, 45000, 40000, 55000, 60000

    total_bytes dword ?
    sum         dword ?
    average     dword ?

.code
main proc
    mov eax, sizeof salaries
    mov total_bytes, eax

    mov eax, salaries[0*type salaries]
    add eax, salaries[1*type salaries]
    add eax, salaries[2*type salaries]
    add eax, salaries[3*type salaries]
    add eax, salaries[4*type salaries]
    mov sum, eax

    mov ebx, lengthof salaries
    cdq
    idiv ebx
    mov average, eax

    mov eax, total_bytes
    call writeint
    call crlf

    mov eax, average
    call writeint
    call crlf

    mov eax, sum
    call writeint
    call crlf

    exit
main endp
end main

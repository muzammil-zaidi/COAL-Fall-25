include irvine32.inc

.data
    arrayr  dword 45, 55, 70, 3 dup(95), 100, 115

    length_array dword lengthof arrayr 
    element_size dword type arrayr
    total_bytes dword sizeof arrayr

    sum_result      dword ?
    product_result  dword ?

    msgA   byte "a) Length (elements): ", 0
    msgB   byte "b) Size of one element: ", 0
    msgC   byte "c) Total bytes used: ", 0
    msgD   byte "d) Sum of 3rd, 4th, and 7th elements: ", 0
    msgE   byte "e) Product of 2nd and 5th elements: ", 0

.code
main proc
    mov edx, offset msgA
    call writestring
    mov eax, length_array
    call writeint
    call crlf

    mov edx, offset msgB
    call writestring
    mov eax, element_size
    call writeint
    call crlf

    mov edx, offset msgC
    call writestring
    mov eax, total_bytes
    call writeint
    call crlf

    mov eax, arrayr[2 * 4]
    add eax, arrayr[3 * 4]
    add eax, arrayr[6 * 4]
    mov sum_result, eax

    mov edx, offset msgD
    call writestring
    mov eax, sum_result
    call writeint
    call crlf

    mov eax, arrayr[1 * 4]
    imul eax, arrayr[4 * 4]
    mov product_result, eax

    mov edx, offset msgE
    call writestring
    mov eax, product_result
    call writeint
    call crlf

    exit
main endp
end main

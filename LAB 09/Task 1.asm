include irvine32.inc

.data
msg1    byte "Enter a 16-bit value: ", 0
msg2    byte "Enter the rotation key (1-7): ", 0
msg3    byte "Encrypted value (after left rotation): ", 0
msg4    byte "Decrypted value (after right rotation): ", 0

.code
main proc
 
    mov edx, offset msg1
    call writestring
    call readint
    mov bx, ax               

    mov edx, offset msg2
    call writestring
    call readint
    mov cl, al


    mov ax, bx
    rol ax, cl

    mov edx, offset msg3
    call writestring
    call writedec
    call crlf

    mov ax, bx               
    rol ax, cl               
    ror ax, cl               

    mov edx, offset msg4
    call writestring
    call writedec
    call crlf

    exit
main endp
end main

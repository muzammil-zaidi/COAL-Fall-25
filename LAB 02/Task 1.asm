include irvine32.inc
 
.data
n1 word 15
n2 dword 8
n3 Byte 12
 
.code
main Proc
 
mov ax, n1
mov ebx, n2
mov cl, n3
 
call dumpregs
exit
main ENDP
end main

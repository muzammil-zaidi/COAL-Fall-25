include irvine32.inc

.code
main Proc
 
mov eax,5
mov ebx,16
mov ecx,11
mov edx,18
 
call dumpregs
exit
main ENDP
end main

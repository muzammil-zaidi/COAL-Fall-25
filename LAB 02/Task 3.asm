include irvine32.inc

.data 
num1 dd 24 
num2 dd 12 
num3 dd 3

.code 
main Proc
mov eax,num1
mov ebx,4
mov edx,0

div ebx   

mov eax,edx

mov ebx,num3

div ebx

mov ecx,eax

mov eax,num3

mov ebx,3

mul ebx

add eax,num2

mul ecx

mov num1,eax

call writedec

exit
main ENDP 
end main

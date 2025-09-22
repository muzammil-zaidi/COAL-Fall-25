include irvine32.inc

.data
BASE_SALARY equ 25000
DAY_SALARY equ (25000/30)
OVERTIME equ 600

prompt1 byte "Enter number of leaves: ", 0
prompt2 byte "Enter overtime hours: ", 0
prompt3 byte "Net Salary: ", 0

LEAVES dword ?
EXTRA_H dword ?
NETSAL dword ?

.code
main PROC
mov edx, OFFSET prompt1
call WriteString
call ReadInt
mov LEAVES, eax

mov edx, OFFSET prompt2
call WriteString
call ReadInt
mov EXTRA_H, eax

mov ebx, BASE_SALARY      

mov eax, LEAVES
mov ecx, DAY_SALARY
mul ecx
sub ebx, eax

mov eax, EXTRA_H
mov ecx, OVERTIME
mul ecx
add ebx, eax

mov NETSAL, ebx
mov edx, OFFSET prompt3
call WriteString
mov eax, NETSAL
call WriteInt
call crLf

exit
main ENDP
end main

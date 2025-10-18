include irvine32.inc

.data
    prompt  byte "Enter student's marks: ", 0
    gradeA  byte "Grade: A", 0
    gradeB  byte "Grade: B", 0
    gradeC  byte "Grade: C", 0
    gradeD  byte "Grade: D", 0
    gradeF  byte "Grade: F", 0
    marks   dword ?

.code
main proc
    mov edx, offset prompt
    call writestring
    call readint
    mov marks, eax

    cmp eax, 90
    jge print_A

    cmp eax, 70
    jge print_B

    cmp eax, 60
    jge print_C

    cmp eax, 50
    jge print_D

    jmp print_F

print_A:
    mov edx, offset gradeA
    jmp display

print_B:
    mov edx, offset gradeB
    jmp display

print_C:
    mov edx, offset gradeC
    jmp display

print_D:
    mov edx, offset gradeD
    jmp display

print_F:
    mov edx, offset gradeF

display:
    call writestring
    call crlf

    exit
main endp
end main

include irvine32.inc

.data
    msg1   byte "no multiples of 3 found.", 0
    msg2   byte "the smallest multiple of 3 is: ", 0
    smallest_num      dword 0

.code
main proc
    push 1      
    push 2      
    push 3       
    push 4    
    push 5    
    push 6    
    push 7     
    push 8     
    push 9     
    push 10      

    mov esi, 10          
    mov smallest_num, 0ffffffffh 
    
find_loop:
    pop eax         

    mov edx, 0
    mov ebx, 3
    div ebx               

    cmp edx, 0           
    jne not_multiple

   
    mov ebx, smallest_num
    cmp ebx, 0ffffffffh   
    je update_smallest

    cmp eax, ebx         
    jge not_smaller       

update_smallest:
    mov smallest_num, eax 

not_smaller:
not_multiple:
    dec esi
    jnz find_loop

    mov eax, smallest_num
    cmp eax, 0ffffffffh
    je no_multiples_found

    
    mov edx, offset msg2
    call writestring
    mov eax, smallest_num
    call writeint
    call crlf
    jmp done

no_multiples_found:
    mov edx, offset msg1
    call writestring
    call crlf

done:
    exit
main endp
end main

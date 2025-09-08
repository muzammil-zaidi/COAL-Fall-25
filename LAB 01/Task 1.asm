include irvine32.inc
 
.data 
msg Byte "Hello World",0
 
.code
main Proc
mov edx, offset msg
 
call writestring
call crlf
exit
main ENDP
end main

.model small
.data
msg1 db "Quotient for 27 divided by 10 = $"
msg2 db 10,13,"Remainder for 27 divided by 10 = $"

.code
main proc

mov ax,@data
mov ds,ax

mov ax,27
mov bl,10
div bl          

mov cl,al
mov ch,ah

mov dx,offset msg1
mov ah,9
int 21h

mov dl,cl
add dl,48
mov ah,2
int 21h

mov dx,offset msg2
mov ah,9
int 21h

mov dl,ch
add dl,48
mov ah,2
int 21h

mov ah,4ch
int 21h

main endp
end main
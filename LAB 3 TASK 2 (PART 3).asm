.model small
.stack 100h
.data
.code
main proc

    mov si, 2000h      

    mov al, 3
    mov [si], al       

    mov bl, 6
    add [si], bl       

    mov al, [si]       

    add al, 30h        

    mov dl, al
    mov ah, 2
    int 21h

    mov ah, 4ch
    int 21h

main endp
end main

.model small
.stack 100h
.data
.code
main proc

    mov al, 2
    add al, 5      

    add al, 30h    

    mov dl, al
    mov ah, 2
    int 21h

    mov ah, 4ch
    int 21h

main endp
end main

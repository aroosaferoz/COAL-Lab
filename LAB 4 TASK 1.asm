.model small
.stack 100h
.data

num1 db 05h
num2 db 03h
result db ?
msg db 'Result: $'

.code
main proc

    mov ax, @data
    mov ds, ax
    
    mov al, num1
    mov bl, num2
    add al, bl
    mov result, al
    
    mov dx, offset msg
    mov ah, 09h
    int 21h
    
    mov dl, result
    add dl, 30h
    mov ah, 02h
    int 21h
    
    mov ah, 4ch
    int 21h

main endp
end main
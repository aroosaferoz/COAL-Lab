.model small
.stack 100h
.data
arr db 5 dup(?)     
msg db "Enter 5 numbers:$"
msg2 db 0Dh,0Ah,"Reversed array: $"

.code
main:
    mov ax, @data
    mov ds, ax

    ; input message
    lea dx, msg
    mov ah, 09h
    int 21h

    mov si, 0
    mov cx, 5

input_loop:
    mov ah, 01h
    int 21h
    sub al, 30h
    mov arr[si], al
    inc si
    loop input_loop

    ; print message
    lea dx, msg2
    mov ah, 09h
    int 21h

    ; reverse print
    mov si, 4
    mov cx, 5

rev_loop:
    mov dl, arr[si]
    add dl, 30h
    mov ah, 02h
    int 21h

    ; spacING
    mov dl, ' '
    int 21h

    dec si
    loop rev_loop

    mov ah, 4Ch
    int 21h

end main
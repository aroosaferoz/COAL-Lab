.model small
.stack 100h
.data
arr db 5 dup(?)     
msg db "Enter 5 numbers:$"

.code
main:
    mov ax, @data
    mov ds, ax

    ; display message
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

    ; calculate sum
    mov si, 0
    mov cx, 5
    mov al, 0

sum_loop:
    add al, arr[si]
    inc si
    loop sum_loop

    mov bl, al

    ; NEW LINE
    mov dl, 0Dh
    mov ah, 02h
    int 21h

    mov dl, 0Ah
    int 21h

    mov al, bl

    ; PRINT SUM (single digit)
    add al, 30h
    mov dl, al
    mov ah, 02h
    int 21h

    mov ah, 4Ch
    int 21h

end main
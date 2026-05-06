.model small
.stack 100h
.data

.code
main:
    mov ax, @data
    mov ds, ax

    mov ch, 4        ; total rows
    mov cl, 1        ; current row

row_loop:
    mov bl, 1        ; start from 1

col_loop:
    mov dl, bl
    add dl, 30h
    mov ah, 02h
    int 21h

    inc bl
    cmp bl, cl
    jle col_loop

    ; new line
    mov dl, 0Dh
    mov ah, 02h
    int 21h
    mov dl, 0Ah
    int 21h

    inc cl
    cmp cl, ch
    jle row_loop

    mov ah, 4Ch
    int 21h

end main
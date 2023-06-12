.stack 256

.data

forwardArray DW 1111h,2222h,3333h,4444h,5555h,6666h,7777h,8888h
reversedArray DW 8 DUP(?)

.code
main proc
    mov ax,@data
    mov ds,ax
    
    ; Start with the last of the forward
    ; and put it into the first of the reversed
    ; Forward Array:
    ; 12 34 56 78 90 12 34 56-78 90 12 34 56 78 90 12
    ; Reversed Array:
    ; 90 12 56 78 12 34 78 90-34 56 90 12 56 78 12 34
    
    mov ax,forwardArray+14
    mov reversedArray,ax
    mov ax,forwardArray+12
    mov reversedArray+2,ax
    mov ax,forwardArray+10
    mov reversedArray+4,ax
    mov ax,forwardArray+8
    mov reversedArray+6,ax
    mov ax,forwardArray+6
    mov reversedArray+8,ax
    mov ax,forwardArray+4
    mov reversedArray+10,ax
    mov ax,forwardArray+2
    mov reversedArray+12,ax
    mov ax,forwardArray
    mov reversedArray+14,ax
    
    
    
    mov ah,4ch
    int 21h
    main endp
end main
.MODEL SMALL
.STACK 256
.DATA
ARRAY       DW 01H, 02H, 03H, 04H, 05H, 06H, 07H, 08H 
EVENARRAY   DW 8 DUP(?)
ODDARRAY    DW 8 DUP(?)
TWO         DW 02H

.CODE
MAIN    PROC FAR 
        MOV AX, @DATA  ;set up data segment
        MOV DS, AX

        SUB CX, CX           ; clear CX for counting
        ADD CX, 7            ; CX initialized to 7
        SUB DI, DI           ; even counter
        SUB SI, SI           ; odd counter

SORT:             
        MOV BX, DI           ; move even counter to BX
        ADD BX, SI           ; add odd counter to BX to 
                             ; get increment
        MOV AX, ARRAY+BX     ; move current iteration in array 
                             ; to AX
        MOV BX, AX           ; store original number in BX
        DIV TWO              ; divide
        SUB DX, 0            ; check if remainder 0
        JZ EVEN              ; if zero, jump to even
        MOV ODDARRAY+SI, BX  ; move original number to current
                             ; iteration of odd array
        ADD SI, 2            ; increment odd counter
        JMP CONT             ; jump to continue loop

EVEN:   MOV EVENARRAY+DI, BX ; move original number to current
                             ; iteration of even array
        ADD DI, 2            ; increment even counter
        JMP CONT             ; jump to continue loop

CONT:   SUB CX, 1            ; decrement counter
        JZ FINISH            ; if zero, jump to finish
        JMP SORT             ; loop to sort

FINISH: SUB AX, AX           ; dummy code to end it
        
        MOV AH, 4CH ;return to OS
        INT 21H
MAIN    ENDP
        END MAIN
    
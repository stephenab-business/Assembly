.MODEL SMALL
.STACK 64
.DATA
FIRSTNUM DW 0Fh
SECONDNUM DW 24h

.CODE  
MAIN    PROC FAR 
        MOV AX, @DATA  ;set up data segment
        MOV DS, AX 
        
GCD:    MOV AX, SECONDNUM         ; second num is numerator 
        SUB DX, DX                ; clear DX
        MOV BX, FIRSTNUM          ; first num is denominator
        DIV BX                    ; divide
        SUB DX, 0                 ; subtract 0 from DX 
        JZ FINISH                 ; jump if DX is 0                   
        MOV CX, FIRSTNUM          ; temp. move first num to CX
        MOV SECONDNUM, CX         ; second num becomes first num
        MOV FIRSTNUM, DX          ; first num becomes DX
        JNZ GCD                   ; loop
                                
FINISH: SUB BX, BX                ; clear all registers
        SUB CX, CX                ;
        SUB DX, DX                ;
        MOV BX, FIRSTNUM          ; gcd in BX              
                                
        MOV AH, 4CH ;return to OS
        INT 21H
MAIN    ENDP
        END MAIN
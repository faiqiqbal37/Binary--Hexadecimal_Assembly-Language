; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.MODEL SMALL
.STACK 100H
.DATA
.CODE

    MAIN PROC

XOR BX, BX


MOV CL, 4
MOV AH, 1
INT 21H

WHILE:
    CMP AL, 0DH
    JE END
    
    CMP AL, 39H
    JG LETTER
    
    AND AL, 39H
    JMP SHIFT
    
    LETTER: 
        SUB AL, 37H
        
    SHIFT:
        SHL BX, CL
        OR BL, AL
        INT 21H
        JMP WHILE
        
    END:

    MAIN ENDP
    
    
 END MAIN
    
    

ret




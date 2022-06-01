
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt
include emu8086.inc
.MODEL SMALL
.DATA   
        ;I    DB 0d
        SIZE EQU 10
        HEAD DB '________________Security lock________________','$'
        MSG1 DB 13, 10, 'Enter your ID:$'
        MSG2 DB 13, 10, 'Enter your Password:$'
        MSG3 DB 13, 10, 'ERROR ID not Found!$'
        MSG4 DB 13, 10, 'Wrong Password! Access denied$'
        MSG5 DB 13, 10, 'Correct! Welocome to the Safe$'
        MSG6 DB 13, 10, 'Too Long password!$'
        TEMP_ID DW 1 DUP(?),0
        TEMP_Pass DB 1 DUP(?)
        IDSize = $-TEMP_ID
        PassSize = $-Temp_Pass
        ID  DW        'A150', 'B255', 'CE20', 'BB71', 'D111', 'E500', 'F432', 'EC12', '5321', '9876' 
        Password DB   1,      2,      3,      4,       7,     10,     11,     13,     12,      14
    
.CODE
MAIN        PROC
            MOV AX,@DATA   ;In
            MOV DS,AX
            MOV AX,0000H
            

Title:      LEA DX,HEAD
            MOV AH,09H
            INT 21H

ID_PROMPT:  LEA DX,MSG1
            MOV AH,09H
            INT 21H
            
            
ID_INPUT:   MOV BX,0
            MOV DX,0
            LEA DI,TEMP_ID
            MOV DX,IDSize
            CALL get_string
            

CheckID:    MOV BL,0
            MOV SI,0

AGAIN:      MOV AX,ID[SI] 
            MOV DX,TEMP_ID
            CMP DX,AX
            JE  PASS_PROMPT
            INC BL
            ADD SI,4
            CMP BL,SIZE
            JB  AGAIN
            
ERRORMSG:   LEA DX,MSG3
            MOV AH,09H
            INT 21H
            JMP ID_PROMPT
             
            
PASS_PROMPT:LEA DX,MSG2
            MOV AH,09H
            INT 21H
            
Pass_INPUT: CALL   scan_num
            CMP    CL,0FH
            JAE    TooLong
            MOV    BH,00H
            MOV    DL,Password[BX]
            CMP    CL,DL
            JE     CORRECT 

            
INCORRECT:  LEA DX,MSG4
            MOV AH,09H
            INT 21H
            JMP ID_PROMPT
            
CORRECT:    LEA DX,MSG5
            MOV AH,09H
            INT 21H
            JMP Terminate

TooLong:    LEA DX,MSG6
            MOV AH,09H
            INT 21H
            JMP PASS_PROMPT
            

DEFINE_SCAN_NUM
DEFINE_GET_STRING
Terminate:        
END MAIN        
        
    
     
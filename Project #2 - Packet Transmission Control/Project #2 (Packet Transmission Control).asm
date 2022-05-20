
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

JMP START

DATA SEGMENT
    PACKET  DB    130       ;NUMBER OF PACKETS TO BE TRANSMITTED
    N       DB    0         ;NUMBER OF TRANSMITTED PACKETS AND DETECT 128 CYCLE
    N2      DB    0         ;NUMBER OF TRANSMISSION
DATA ENDS  

CODE SEGMENT

ASSUME DS:DATA CS:CODE 

START: MOV AX, DATA         ;DECLARATION OF DATA SEGEMENT
	   MOV DS, AX

LOOP2: INC N2               ;INCREASING NUMBER OF TRANSMISSOIN MADE
       INC N                ;INCREASING NUMBER OF PACKETS TRANSMITTED
       DEC PACKET           ;DECREASING NUMBER OF PACKETS TO BE TRANSMITTED
       
       CMP N,64
       JB  ELSE             ;IF NUMBER OF PACKETS TRANSMITTED IS LESS THAN 64     
       
       INC N
       DEC PACKET 
       JMP DONE 
       
ELSE:  
       MOV AL,N
       SHL N,1
       SUB N,AL             ;EL VALUE EL GDEDA - EL ADEMA
       MOV AL,N 
       CMP AL,PACKET        ;CHECK IF NUMBER OF LEFT TO BE TRANSMITTED IS SMALLER THAN TRANSFERRED PACKETS AT THAT TIME
       JA  BREAK
       JE  BREAK
       SUB PACKET,AL
       ADD N,AL             ; RESTORE THE OLD VALUE OF N
       
       



DONE:  CMP  PACKET,0
       JB   BREAK
       JE   BREAK
       CMP  N,128
       JNE  END
       MOV  N,0
END:   JMP  LOOP2  

BREAK:        
	   
CODE ENDS

END START

ret





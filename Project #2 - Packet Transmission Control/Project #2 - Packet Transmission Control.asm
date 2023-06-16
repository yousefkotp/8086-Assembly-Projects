INCLUDE "emu8086.inc"

JMP START

DATA SEGMENT
    PACKET  DW    0      ;NUMBER OF PACKETS TO BE TRANSMITTED
    N       DW    0         ;NUMBER OF TRANSMITTED PACKETS AND DETECT 128 CYCLE
    N2      DW    0         ;NUMBER OF TRANSMISSION  
    MSG1    DW   "Enter number of packets: ",0
    MSG2    DW    "Number of Transmissions: ",0
   
DATA ENDS  

CODE SEGMENT

ASSUME DS:DATA CS:CODE 

START:
       MOV CX, DATA         ;DECLARATION OF DATA SEGEMENT
	   MOV DS, CX   
	   DEFINE_SCAN_NUM
       DEFINE_PRINT_STRING
       DEFINE_PRINT_NUM
       DEFINE_PRINT_NUM_UNS 
       DEFINE_CLEAR_SCREEN  
       
	   LEA SI,MSG1
	   CAll PRINT_STRING
	   CALL SCAN_NUM
	   MOV PACKET,CX
	   

LOOP1: INC N2               ;INCREASING NUMBER OF TRANSMISSOIN MADE
       INC N                ;INCREASING NUMBER OF PACKETS TRANSMITTED
       DEC PACKET           ;DECREASING NUMBER OF PACKETS TO BE TRANSMITTED
       JMP DONE

LOOP2: CMP N,64
       JB  FUNC1             ;IF NUMBER OF PACKETS TRANSMITTED IS LESS THAN 64     

loop_start:
       cmp N,128            ; compare loop counter with 10
       JGE loop_end         ; jump out of loop if counter >= 10
       JMP LOOP1
       JMP loop_start       ; jump back to the start of the loop
loop_end:
       MOV N,0
       JMP LOOP1            

FUNC1: MOV CX,N 
       CMP CX,PACKET        ;CHECK IF NUMBER OF LEFT TO BE TRANSMITTED IS SMALLER THAN TRANSFERRED PACKETS AT THAT TIME
       JAE  BREAK  
       SHL N,1   
       SUB PACKET,CX
       INC N2

DONE:  CMP  PACKET,0
       JBE  BREAK
       CMP  N,64
       JB   FUNC1             ;IF NUMBER OF PACKETS TRANSMITTED IS LESS THAN 64
       JMP  loop_start

BREAK:
       PRINT 0AH
       PRINT 0DH
       LEA  SI,MSG2
       CALL PRINT_STRING
       MOV  AX,N2   
       CALL PRINT_NUM_UNS       
	        
	       
CODE ENDS

END START

ret
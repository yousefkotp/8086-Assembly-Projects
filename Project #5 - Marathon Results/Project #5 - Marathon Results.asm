include 'emu8086.inc'

JMP START

DATA SEGMENT 
    	N         DW      25                                                              
	NUMBERS   DB  25 DUP (?)
	TIME      DB  25 DUP (?)    
	MSG1      DB 'Enter the numbers of players: ',0
	MSG2      DB 0DH,0AH,'Enter the time of players: ',0 
	MSG3      DB 0DH,0AH,'Times after sorting: ',0AH,0DH,0
	                               
DATA ENDS  

CODE SEGMENT   
    
        	ASSUME DS:DATA CS:CODE     
START:	MOV AX, DATA
	    	MOV DS, AX                    
	   
	    	DEFINE_SCAN_NUM           
       	DEFINE_PRINT_STRING 
        	DEFINE_PRINT_NUM
        	DEFINE_PRINT_NUM_UNS

	     
	    	LEA SI,MSG1
	    	CALL PRINT_STRING
	    	MOV SI, 0
	   
LOOP1:  	CALL SCAN_NUM 
        	MOV NUMBERS[SI],CL
        	INC SI  
        	PRINT 0AH      
        	PRINT 0DH        
        	CMP SI,N 
        	JNE LOOP1
       
        
        
	    	LEA SI,MSG2
	    	CALL PRINT_STRING
	    	MOV SI, 0
	   
LOOP2:  	CALL SCAN_NUM 
        	MOV TIME[SI],CL
        	INC SI  
        	PRINT 0AH       
        	PRINT 0DH         
        	CMP SI,N 
        	JNE LOOP2  
       
        
        
	    	;SORTING
	    	DEC N            
	    	MOV CX, N                
OUTER:  	MOV SI, 0       
	    
	   
INNER:  	MOV  AL, TIME[SI]
	    	MOV  DL, NUMBERS[SI]
	    	INC  SI
	    	CMP  TIME[SI], AL
	    	JA   SKIP
	    	XCHG AL, TIME[SI]
	    	MOV  TIME[SI-1], AL
	    	XCHG DL, NUMBERS[SI]
        	MOV  NUMBERS[SI-1], DL  
        
SKIP:   	CMP  SI, CX
	    	JL   INNER 
	    	LOOP OUTER
	    
	    	INC N  

	    	LEA SI,MSG3
	    	CALL PRINT_STRING
	    	MOV SI, 0   
	    	MOV AH,0 
	    
LOOP3:  	MOV AL,NUMBERS[SI]     
        	CALL PRINT_NUM_UNS    
        	PRINT 09H            
        	MOV AL,TIME[SI]
        	CALL PRINT_NUM_UNS
        	PRINT 0AH             
        	PRINT 0DH   
        	INC SI 
        	CMP SI,N 
        	JNE LOOP3
       
CODE ENDS
 
END START
  

ret





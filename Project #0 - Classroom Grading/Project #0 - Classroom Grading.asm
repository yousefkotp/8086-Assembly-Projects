include 'emu8086.inc'

JMP START

DATA SEGMENT 
   	N   DW      ?                                                              
	MARKS DB 1000 DUP (?)           ;1000 IS THE MAXIMYM NUMBER OF STUDENTS
	ID    DB  1000 DUP (?)
	         
	MSG1    DB 'Enter the number of students(DONT EXCEED 1000): ',0                                   ;0 INDICATES THAT THE MESSAGE ENDS HERE
	MSG2    DB 0Dh,0Ah, 0Dh,0Ah,'Enter the IDs of students: ',0                                       ;0Dh,0Ah, 0Dh,0Ah MEANS NEW LINE AND RETURN CURSOR TO ITS BEGINNING ACCORDING TO ASCI CODES 
	MSG3    DB 0Dh,0Ah, 0Dh,0Ah,'Enter the marks of students: ',0    
    	HR      DB 0Dh,0Ah, 0Dh,0Ah,'*******************Sorted Marks***********************',0            ;HORIZONTAL ROW  
    	MSG4    DB 0Dh,0Ah, 0Dh,0Ah,'ID: ',09H,'MARKS:',0                                
DATA ENDS  

CODE SEGMENT
        	ASSUME DS:DATA CS:CODE     

        	;SETTING DATA SEGMENT  
START:  	MOV AX, DATA
	  	MOV DS, AX                    
	   
	    	;DEFINING FUNCTIONS FOR THE LIBRARY EMU8086 WHICH WILL BE USED LATER
	    	DEFINE_SCAN_NUM           
        	DEFINE_PRINT_STRING 
        	DEFINE_PRINT_NUM
        	DEFINE_PRINT_NUM_UNS
        
        
        	;READING NUMBER OF STUDENTS
        
        	LEA SI,MSG1              ;PRINT_STRING FUNCTION PRINTS WHAT'S IN SI   
	    	CALL PRINT_STRING                                                        
	    	CALL SCAN_NUM            ;THE FUNCTION PUTS THE INPUT IN CX
	   	MOV N,CX
	    
	    
	    
	    	;READING IDs OF STUDENTS  
	    	LEA SI,MSG2
	    	CALL PRINT_STRING
	    	MOV SI, 0
	   
LOOP1:  	CALL SCAN_NUM 
        	MOV ID[SI],CL
        	INC SI  
        	PRINT 0AH        ;PRINT NEW LINE
        	PRINT 0DH        ;RETURN CURSOR TO THE BEGINNING 
        	CMP SI,N 
        	JNE LOOP1
       
        
        
	    	;READING MARKS OF STUDENTS
	    	LEA SI,MSG3
	    	CALL PRINT_STRING
	    	MOV SI, 0
	   
LOOP2:  	CALL SCAN_NUM 
        	MOV MARKS[SI],CL
        	INC SI  
        	PRINT 0AH        ;PRINT NEW LINE
        	PRINT 0DH        ;RETURN CURSOR TO THE BEGINNING 
        	CMP SI,N 
        	JNE LOOP2  
       
        
        
	    	;SORTING THEM ACCORDING TO MARKS USING BUBBLE SORT 
	    
	    	DEC N            ;BECAUSE WE WON'T COMPARE THE LAST ELEMENT 
	   	MOV CX, N       ;CX AS I          
OUTER:  	MOV SI, 0       ;SI AS J
	    
	   
INNER:  	MOV  AL, MARKS[SI]
	    	MOV  DL, ID[SI]
	    	INC  SI
	    	CMP  MARKS[SI], AL
	    	JB   SKIP
	    	XCHG AL, MARKS[SI]
	    	MOV  MARKS[SI-1], AL
	    	XCHG DL, ID[SI]
        	MOV  ID[SI-1], DL  
        
SKIP:   	CMP  SI, CX
	    	JL   INNER 
	    	LOOP OUTER
	    
	    
	    	INC N                   ;WE INCREMENT N AGAIN BECAUSE WE DECREASED IT BEFORE    
	    
	   	   
	    	;PRINT TABLE OF THEIR IDs AND MARKS AFTER SORTING
	    	LEA SI,HR   
	    	CALL PRINT_STRING
	    	LEA SI,MSG4
	    	CALL PRINT_STRING
        	PRINT 0AH            ;PRINT NEW LINE 
        	PRINT 0DH            ;RETURN CURSORT TO THE BEGGINING
	   
	    	MOV SI, 0
LOOP3:  	MOV AX,0
        	MOV AL,ID[SI]     
       
        	CALL PRINT_NUM_UNS    
        	PRINT 09H            ;PRINT TAB
        	MOV AL,MARKS[SI]
        	CALL PRINT_NUM_UNS
        	PRINT 0AH            ;PRINT NEW LINE 
        	PRINT 0DH            ;RETURN CURSORT TO THE BEGGINING
        	INC SI 
        	CMP SI,N 
        	JNE LOOP3
       
CODE ENDS
 
END START
  

ret





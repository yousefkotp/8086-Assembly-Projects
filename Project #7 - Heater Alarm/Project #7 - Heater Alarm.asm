JMP  DONE                       ;jump to done
        
LOW:      PRINT 'GREEN LED IS TURNED ON'  ;Prints an indication message
          JMP  DONE                       ;jump to done
        
HIGH:     PRINT 'RED LED IS TURNED ON'    ;Prints an indication message

DONE:     PRINTN 
          PRINT '-----------------------------------------------------'
          PRINTN 
          PRINT 'Another Reading in 3 minutes Please Wait'
          PRINTN
          CALL DELAY3MIN     ;calls the delay function 
          JMP  START         ;jumps to start

          RET             ;Returns to the main caller (Operating System)  
          

          DELAY3MIN PROC  ;Procedure for the 3 minutes delay 
              
          MOV  AL, 3      ;Loop Counter
                          ;The resolution of the wait period is in microseconds (60 million microseconds --> 1 minute) equivalent to 03938700H
REPEAT:   MOV  CX, 0393H  ;Upper two bytes (0393H)
          MOV  DX, 8700H  ;Lower two bytes (8700H)
          MOV  AH, 86H    ;Auxulary Register with 86H for INT 15H
          INT  15H        ;BIOS wait function, Inputs are CX:DX, waits for a specific number of microseconds before returning control to caller
          DEC  AL         ;Decrement AL
          JNZ  REPEAT     ;Loop 3 times to generate 3 minutes delay  
        
          RET             ;Returns to the caller 
        
DELAY3MIN ENDP  
          
          
DEFINE_SCAN_NUM           ;A macro that scan input from user defined before end 
END                       ;Stop the Program
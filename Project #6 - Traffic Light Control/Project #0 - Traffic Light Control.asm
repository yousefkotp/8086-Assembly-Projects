#start=Traffic_Lights.exe#
;Red is the least significant of each consecutive 3 bits : 0,3,6,9
;Yellow is the middle significant of each 3 consecutive bits: 1,4,7,A
;Green is the most significant of each 3 consecutive bits: 2,5,8,B
;the last 4 bits are unused C,D,E,F

name "traffic"
mov ax, 249h  ; 249h means all are red 0,3,6,9 bits are all ones
out 4, ax     ;4 is the output number for the traffic (built-in)

; wait 5 seconds for the initial movement
mov     cx, 4Ch    ;    004C4B40h = 5,000,000 micro seconds calculated by calculator from decimal to hexa
mov     dx, 4B40h
mov     ah, 86h         ;ah is loaded with 86 (maps to interrupt 15 so it's constant) is needed  for interrupt 15
int     15h         ;intterupt 15 checks cx:dx and is used to delay



lop:
mov ax, transition1   ;1st iteration
out 4, ax

; wait 120 seconds (120 million microseconds)
;mov     cx, 0727h    ;    07270E00H=120 million microseconds, 120 not 180 because we will need yellow to be active for 60 seconds (red and greed active with yellow so total for red and green is 180 seconds)
;mov     dx, 0E00h              
;mov     ah, 86h
;int     15h                 
;THIS CODE SHOULD CAUSE DELAY 2 MINS BUT IT ONLY CAUSES 1 MIN FOR SOME REASON so I delayed 60 secs twice
; wait 60 seconds (60 million microseconds)
mov     cx, 0393h    ;    03938700H=60 million microseconds
mov     dx, 8700h
mov     ah, 86h
int     15h
; wait 60 seconds (60 million microseconds)
mov     cx, 0393h    ;    03938700H=60 million microseconds
mov     dx, 8700h
mov     ah, 86h
int     15h


mov ax,transition2    ;2nd iteration
out 4,ax


; wait 60 seconds (60 million microseconds)
mov     cx, 0393h    ;    03938700H=60 million microseconds
mov     dx, 8700h
mov     ah, 86h
int     15h 


;mov ax, 249h  ; 249h means all are red 0,3,6,9 bits are all ones
;out 4, ax     ;4 is the output number for the traffic (built-in)

; wait 5 seconds for the initial movement
;mov     cx, 4Ch    ;    004C4B40h = 5,000,000 micro seconds calculated by calculator from decimal to hexa
;mov     dx, 4B40h
;mov     ah, 86h         ;ah is loaded with 86 (maps to interrupt 15 so it's constant) is needed  for interrupt 15
;int     15h         ;intterupt 15 checks cx:dx and is used to delay

mov ax, transition3     ;3rd iteration
out 4, ax

; wait 60 seconds (60 million microseconds)
mov     cx, 0393h    ;    03938700H=60 million microseconds
mov     dx, 8700h
mov     ah, 86h
int     15h
; wait 60 seconds (60 million microseconds)
mov     cx, 0393h    ;    03938700H=60 million microseconds
mov     dx, 8700h
mov     ah, 86h
int     15h

mov ax,transition4     ;4th iteration
out 4,ax

; wait 60 seconds
mov     cx, 0393h    
mov     dx, 8700h
mov     ah, 86h
int     15h

mov ax, 249h  ; 249h means all are red 0,3,6,9 bits are all ones
out 4, ax     ;4 is the output number for the traffic (built-in)

; wait 5 seconds for the initial movement
mov     cx, 4Ch    ;    004C4B40h = 5,000,000 micro seconds calculated by calculator from decimal to hexa
mov     dx, 4B40h
mov     ah, 86h         ;ah is loaded with 86 (maps to interrupt 15 so it's constant) is needed  for interrupt 15
int     15h         ;intterupt 15 checks cx:dx and is used to delay


jmp lop

;                                 FEDC_BA98_7654_3210
transition1               equ     0000_0011_0000_1100b ;2 Red and 2 Green(north and south are green)
transition2               equ     0000_0111_1001_1110b ;all 4 are Yellow (two will begin to move soon and two will stop moving soon) and the red and green remain)
transition3               equ     0000_1000_0110_0001b ;2 Red and 2 Green(east and west are green)
transition4               equ     0000_1100_1111_0011b ;all 4 are Yellow (two will begin to move soon and two will stop moving soon) and the red and green remain)
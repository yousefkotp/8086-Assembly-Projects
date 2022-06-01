include 'emu8086.inc'
org 100h
jmp start
Buffer db 81 dup(00h) ; e7gezly 81 makan w gowahom 00H
Buffer2 db 81 dup(00h) ; dup = 7a7ot fl amaken el ma7gooza di eh
bzbt?
msg1 db 0ah,0dh, 'Please choose the method you want , 1-encrypt 2-
decrypt: $',0ah,0dh
msg2 db 0ah,0dh, 'Enter your text: $'
msg3 db 0ah,0dh, 'Your text after encryption is: $'
msg4 db 0ah,0dh, 'Your text after decryption is: $'
msg5 db 0ah,0dh, 'Enter your number: $'
table1 db 97 dup ('
'),1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25
,26 ; db = define byte
table2 db ' ','abcdefghijklmnopqrstuvwxyz'
start:
; Print ( bytala3 output 3la el screen ) awl message el heya 1-
encrypt , 2- decrypt
 mov DX,offset msg1
 mov AH,09h ; to output any string on screen must move 09h into
AH register , zy print fl c
 int 21h ; interrupt for output & input string
; take input from user
 mov AH,01h ; by2ra one character from the user zy scan fl c ,
momken tkon 1 or 2 ( encrypt or decrypt )
 int 21h
 CMP AL,'1' ; el input taken mn el user is automatically
inserted in AL
 JZ encrypt
 CMP AL,'2'
 JZ decrypt
encrypt:
; Print tany message ( Enter yout text to be encrypted )
 mov DX,offset msg2
 mov AH,09h ; b print out el m7toot fl DX
 int 21h

 mov BX,offset Buffer ; Takes the address of the buffer &
moves it to BX register
 mov byte [BX],81 ; the string is max 80 chars long + enter , so
we put them in the first byte of the buffer

 mov DX,BX
 mov AH,0Ah ; scanf for the buffer , take input string & store
it in buffer
 int 21h

 mov AL,[BX+1] ; move the length of the string into AL ,
[BX+1] 3shan ana 7agazt f awl makan el size bta3 el buffer
 add AL,02 ; 02 3shan el buffer msh bybtedy mn awl makan

 mov AH,00h ; can not put an 8-bit register into a 16 bit
register, so we must clear out AH first
 mov SI,AX ; Then we need another index register to hold
this value which is the size of the string
 mov byte [BX+SI],'$' ; Now we can put the '$' at this position
( last position ), obtained by buffer address+size of string
; Encrypt
 lea BX, table1 ; table 1 feeha el numbers w 7at el address
bta3 el table f BX
 lea SI, Buffer+2 ; 7at el address bta3 awl character fl SI
 call encryption ; 7aro7 l encryption

; Print el message el talta ( text after encryption )
 mov DX, offset msg3
 mov AH, 09h
 int 21h
; Show result:
 mov SI, 2
 mov CL, [Buffer+1]
 mov CH,0
 lea BX, Buffer
again:
 mov AL, [BX+SI]
 mov AH,0
 CALL PRINT_NUM_UNS
 inc SI
 loop again
 jmp start

decrypt:
 mov DX,offset msg5
 mov AH,09h
 int 21h
 mov BX,offset Buffer
 mov byte [BX],81

;Take string from user and store it in buffer
 mov DX,BX
 mov AH,0Ah
 int 21h

 mov AL,[BX+1]
 add AL,02

 mov AH,00h
 mov SI,AX
 mov byte [BX+SI],'$'
 mov CL,[BX+1]
 mov CH,0
 mov SI,2
 lea DX,Buffer2
 mov DI,2
; betkhaly el decimal numbers el f table 1 hex w store it in buffer2
redo:
 CLC
 mov AL,[BX+SI]
 sub AL,30h
 mov AH,10
 mul AH
 inc SI
 mov AH,[BX+SI]
 sub AH,30h
 add AH,AL
 XCHG BX,DX
 mov [BX+DI],ah
 XCHG BX,DX
 inc SI
 inc DI
 cmp [BX+SI], '$'
 jnz redo

 XCHG BX,DX
 mov byte [BX+DI],'$'
; decrypt
 lea BX, table2
 lea SI, Buffer2+2
 call decryption
; print el kelma after decryption
 mov DX, offset msg4
 mov AH, 09H
 int 21h
; show result:
mov DX,offset Buffer2+2
mov AH,09H ; (output string)
int 21h
jmp start
; wait for any key...
exit:
mov AH, 0
int 16h

ret
encryption proc near
next_char:
cmp [SI], '$' ; end of string?
je end_of_string
mov AL, [SI]
cmp AL, 'a'
jb skip
cmp AL, 'z'
ja skip
xlatb ; encrypt using table2 by xlat algorithm: al =
ds:[bx + unsigned al]
mov [SI], AL ; now el al feeha el 7arf f 7roo7 ry7a buffer
w shyla el 7arf dah w 7ta makano el number corresponding to it
skip:
inc SI
jmp next_char
end_of_string:
ret
encryption endp
; this procedure prints out an unsigned
; number in AX (not just a single digit)
; allowed values are from 0 to 65535 (FFFF)
PRINT_NUM_UNS PROC NEAR
 PUSH AX
 PUSH BX
 PUSH CX
 PUSH DX
 ; flag to prevent printing zeros before number:
 MOV CX, 1
 ; (result of "/ 10000" is always less or equal to 9).
 MOV BX, 10000 ; 2710h - divider.
 CMP AX, 0
 JZ print_zero

 CMP AX,20h
 JZ print_space

 CMP AX,10
 JB print_zero
 jmp begin_print

 print_zero:
 PUTC '0'

 jmp begin_print

print_space:
 PUTC ' '
 Jmp end_print

begin_print:

 ; check divider (if zero go to end_print):
 CMP BX,0
 JZ end_print
 ; avoid printing zeros before number:
 CMP CX, 0
 JE calc
 ; if AX<BX then result of DIV will be zero:
 CMP AX, BX
 JB skip2
calc:
 MOV CX, 0 ; set flag.
 MOV DX, 0
 DIV BX ; AX = DX:AX / BX (DX=remainder).
 ; print last digit
 ; AH is always ZERO, so it's ignored
 ADD AL, 30h ; convert to ASCII code.
 PUTC AL
 MOV AX, DX ; get remainder from last div.
skip2:
 ; calculate BX=BX/10
 PUSH AX
 MOV DX, 0
 MOV AX, BX
 DIV CS:ten ; AX = DX:AX / 10 (DX=remainder).
 MOV BX, AX
 POP AX
 JMP begin_print

end_print:
 POP DX
 POP CX
 POP BX
 POP AX
 RET
PRINT_NUM_UNS ENDP
decryption proc near
next_num:
 cmp [SI] , '$'
 je end_of_string_1
 mov AL, [SI]
 cmp AL, 1
 jb skip_1
 cmp AL, 26
 ja skip_1
 ; xlat algorithm: al = ds:[bx + unsigned al]
 xlatb ; encrypt using table2.
 mov [SI], AL
 ;mov ah,0
skip_1:
 inc SI
 jmp next_num
end_of_string_1:
ret
decryption ENDP
ten DW 10 ; used as multiplier/divider by
PRINT_NUM_UNS.
end
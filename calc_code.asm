org 0
	num1 EQU 30H
	num2 EQU 31H	
	num3 EQU 32H	
	op EQU 33H
	num4 EQU 34H
	num5 EQU 35H	
	num6 EQU 36H
	RS bit P2.4
	RW bit P2.5
	E bit P2.6
	commandOrData EQU P3
	MOV P2,#0FFH ;make P2 an input port
	;********************************8
	aa:Lcall waitForKey
	CJNE A,#'c',aa
	Lcall lcdInitial
	lcall starr
	;//////////////////////////////////////////////////////////////////////////////////////////
	main:
	Lcall waitForKey
	Lcall DELAY
	lcall cleaar 
	lcall cheak_cleaar
	CJNE A, #03DH,work1
	ljmp erorrr
	work1:lcall cheack_mot_sigm
	Lcall print_lcd
	Mov num1,20H
	;----------------------------------------------------------------------------------------
	Lcall waitForKey 
	Lcall DELAY
	mov A,20H
	lcall cheak_cleaar
	CJNE A, #03DH,not_equa_num2
	lcall write_equal
	mov 20H,num1 
	Lcall print_lcd
	ljmp main
	not_equa_num2:CJNE A, #02FH, NOT_EQUAL_2f_num2
    ljmp design_num_1
    NOT_EQUAL_2f_num2: JNC GREATER_2f_num2
    ljmp design_num_1
    GREATER_2f_num2: CJNE A, #03AH, NOT_EQUAL_3A_num2 
    ljmp design_num_1
    NOT_EQUAL_3A_num2: JC work2 
    ljmp design_num_1
	
	work2:mov 20H,A 
	Lcall print_lcd
	Mov num2,20H
	;-------------------------------------------------------------------------
	Lcall waitForKey
	Lcall DELAY	
	mov A,20H
	lcall cheak_cleaar
	CJNE A, #03DH,not_equa_num3
	lcall write_equal
	mov 20H,num1 
	Lcall print_lcd
	mov 20H,num2 
	Lcall print_lcd
	ljmp main
	not_equa_num3:CJNE A, #02FH, NOT_EQUAL_2f_num3
    ljmp design_num_2
    NOT_EQUAL_2f_num3: JNC GREATER_2f_num3
    ljmp design_num_2
    GREATER_2f_num3: CJNE A, #03AH, NOT_EQUAL_3A_num3
    ljmp design_num_2
    NOT_EQUAL_3A_num3: JC work3
    ljmp design_num_2
	
	work3:mov 20H,A 
	Lcall print_lcd
	Mov num3,20H
	;-------------------------------------------------------------------------
	Lcall waitForKey 
	Lcall DELAY
	mov A,20H
	Lcall DELAY
	lcall cheak_cleaar
	CJNE A, #03DH,not_equa_op
	lcall write_equal
	mov 20H,num1 
	Lcall print_lcd
	mov 20H,num2 
	Lcall print_lcd
	mov 20H,num3
	Lcall print_lcd
	ljmp main
	not_equa_op:
	work_op:
	Lcall lcdWrite ;20H
	Lcall DELAY
	Mov op,20H
	;-------------------------------------------------------------------------
	Lcall waitForKey 
	Lcall DELAY
	mov A,20H
	lcall cheak_cleaar
	CJNE A, #03DH,not_equa_num4
	ljmp cheack_op_erorrr
	cheack_op_erorrr_dom:lcall write_equal
	mov 20H,num1 
	Lcall print_lcd
	mov 20H,num2 
	Lcall print_lcd
	mov 20H,num3
	Lcall print_lcd
	mov 20H,op
	Lcall print_lcd
	ljmp main
   not_equa_num4:lcall cheack_mot_sigm
   work4:mov 20H,A 
	Lcall print_lcd
	Mov num4,20H
	;-------------------------------------------------------------------------
	Lcall waitForKey 
	Lcall DELAY
	mov A,20H
	lcall cheak_cleaar
	CJNE A, #03DH,not_equa_num5
	lcall write_equal
	mov A,op
	CJNE A, #02FH, NOT_EQUAL_cheak_op_num5
    ljmp design_num_3
    NOT_EQUAL_cheak_op_num5: JNC GREATER_2f_cheak_op_num5
	ljmp design_num_3
    GREATER_2f_cheak_op_num5: CJNE A, #03AH, NOT_EQUAL_3A_cheak_op_num5
    ljmp design_num_3
    NOT_EQUAL_3A_cheak_op_num5: JC rsult_is_num5
	ljmp design_num_3
	rsult_is_num5:
	mov 20H,num1 
	Lcall print_lcd
	mov 20H,num2 
	Lcall print_lcd
	mov 20H,num3                              ;
	Lcall print_lcd
	mov 20H,op
	Lcall print_lcd
	mov 20H,num4
	Lcall print_lcd
	ljmp main
	not_equa_num5:lcall cheack_mot_sigm
	work5:mov 20H,A 
	Lcall print_lcd
	Mov num5,20H
	;-------------------------------------------------------------------------
	Lcall waitForKey
	Lcall DELAY	
	mov A,20H
	Lcall DELAY
	lcall cheak_cleaar
	CJNE A, #03DH,not_equa_num6
	lcall write_equal
	mov A,op
	CJNE A, #02FH, NOT_EQUAL_cheak_op_num6
    ljmp design_num_4  
    NOT_EQUAL_cheak_op_num6: JNC GREATER_2f_cheak_op_num6
	ljmp design_num_4
    GREATER_2f_cheak_op_num6: CJNE A, #03AH, NOT_EQUAL_3A_cheak_op_num6
    ljmp design_num_4
    NOT_EQUAL_3A_cheak_op_num6: JC rsult_is_num6
	ljmp design_num_4
	rsult_is_num6:
	mov 20H,num1 
	Lcall print_lcd
	mov 20H,num2 
	Lcall print_lcd
	mov 20H,num3                              ;
	Lcall print_lcd
	mov 20H,op
	Lcall print_lcd
	mov 20H,num4
	Lcall print_lcd
	mov 20H,num5
	Lcall print_lcd
	ljmp main
	
	not_equa_num6:lcall cheack_mot_sigm
	work6:Lcall print_lcd ;20h
	Mov num6,20H
	;-------------------------------------------------------------------------
	Process:
	ljmp equal
	rus_of_om:
	ANl num1,#0FH
	ANl num2,#0FH
	ANl num3,#0FH
	ANl num4,#0FH
	ANl num5,#0FH
	ANl num6,#0FH
	mov A,num1
    mov b,#100
	mul Ab
	mov R2,A
	mov A,num2
	mov b,#10
	mul Ab
	add A,R2
	add A,num3		
	mov num1,A

	mov A,num4
    mov b,#100
	mul Ab
	mov R2,A
	mov A,num5
	mov b,#10
	mul Ab
	add A,R2
	add A,num6
	mov num2,A
	;--------------------------------------------------
	mov A,op
	N4:CJNE A, #'+',N1
	ljmp sum
	N1:CJNE A, #'-',N2
	ljmp sub
	N2:CJNE A, #'*', N3
	ljmp produ
	N3:CJNE A, #'/', N4
	ljmp divid
sum:
        Mov A,num1
		ADD A,num2
		jnc sum_normal  ;jmp if 8 bit
		mov b,#100
		div Ab
		mov r2,A   ;;;
		mov A,b
		mov b,#10
		div Ab
		mov r3,A  ;;
		mov r4,b  ;
		mov A,R4
		add A,#6
		CJNE A,#10,cheak_a_cary
		sjmp have_carry
		cheak_a_cary:JC mot_have_carry
		have_carry:mov b,#10
		div Ab
		mov r4,b
		mov r5,A
		lcall mext1
		mot_have_carry:mov r4,A
		mext1:mov A,r3
		add A,R5
		add A,#5
		CJNE A,#10,cheak_a_cary_2
		lcall have_carry_2
		cheak_a_cary_2:JC mot_have_carry_2
		have_carry_2:mov b,#10
		div Ab
		mov r3,b
		mov r6,A
		lcall mext2
		mot_have_carry_2:mov R3,A
		mext2:mov A,r2
		add A,r6 
		add A,#2
		lcall print
		mov A,r3
		ORL A,#30H
		Mov 20H,A
		Lcall lcdWrite
		Lcall DELAY
		mov A,r4
		lcall print
		ljmp main
		
sum_normal:mov b,#100
		div Ab
	    mov r5,a ;--
		CJNE A,#0H,contt11
		sjmp with_out_first_digt_add
		contt11:
		lcall print
		with_out_first_digt_add:mov A,b
		mov b,#10
		div Ab
		mov r6,a ;---
		CJNE A,#0H,nOot
		mov a,r5
		CJNE A,#0H,nOot
		sjmp with_out_first_dt_ad
		nOot:
		mov a,r6  ;---
		lcall print
		with_out_first_dt_ad:mov A,b
		lcall print
		ljmp main
sub:
		Mov A,num1
		mov b,num2
		CJNE A,b,nooot
		mov A,#0
		lcall print
		Ljmp main
		nooot:jnc mot_neg
		mov 20H,#'-'
		Lcall lcdWrite
		Lcall DELAY
		xch a,b
		subb A,num1
		inc A
		sjmp ssub
		mot_neg:subb A,num2
		ssub:mov b,#100
		div Ab
	    mov r5,a ;*
		CJNE A,#0H,contt11_sup
		sjmp with_out_first_digt_sup
		contt11_sup:
		lcall print
		with_out_first_digt_sup:mov A,b
		mov b,#10
		div Ab
		mov r7,a ;---
		CJNE A,#0H,contt_sup
		mov a,r5  ;*
		CJNE A,#0H,contt_sup
		sjmp with_out_first_dt_sup_sup
		contt_sup:
		mov a,r7   ;---
		lcall print
		with_out_first_dt_sup_sup:mov A,b
		lcall print
		ljmp main
produ:;*******************************************88
Mov A,num1
mov b,num2
mul Ab
		
MOV R6,#0                   
SJMP sup_10000
coumt_1000:
INC R6
sup_10000:
CLR C
SUBB A,#010H
XCH A,B
SUBB A,#027H
XCH A,B 
JNC coumt_1000
MOV R7,A            
MOV r2,B             
MOV A,R6 ;******
mov 50h,a;----==============
jz aa1
lcall print
aa1:CLR C
MOV A,R7            
ADD A,#010H
XCH A,r2            
ADDC A,#027H
XCH A,r2             
MOV R6,#0
MOV B,r2             
SJMP SUB_1000
INC_COUNT:
INC R6
SUB_1000:
CLR C
SUBB A,#0E8H
XCH A,B
SUBB A,#03H
XCH A,B 
JNC INC_COUNT
MOV R7,A            
MOV r2,B             
MOV A,R6 ;****
mov 51h,a
jz p31
lcall print;print counter
sjmp prr
p31:
mov a,50h
jz prr
mov a,51h
lcall print
prr:
CLR C
MOV A,R7            
ADD A,#0E8H
XCH A,r2          
ADDC A,#03H
XCH A,r2          
MOV R6,#0
MOV B,r2            
SJMP SUB_100
SUB_INC_2:
INC R6
SUB_100:
CLR C      ;1007
SUBB A,#100
XCH A,B
SUBB A,#0
XCH A,B
JNC SUB_INC_2
MOV R4,A                           
MOV A,R6   
mov 52h,a;====
jnz hh
mov a,51h
jnz hh
mov a,50h
jnz hh
sjmp no_prin
hh:
mov a,52h
lcall print
no_prin:
MOV 20H,#0
MOV A,R4          
ADD A,#100     
MOV B,#10
div  AB
mov 53h,a;--========
jnz f11 
mov a,52
jnz f11 
mov a,51
jnz f11 
mov a,50
jnz f11 
sjmp sss
f11:MOV A,53h
lcall print
sss:
MOV A,b
lcall print
Ljmp main
divid:
		mov A,num2
		CJNE A,#00H,divdiv
		ljmp erorrr
		ljmp main
divdiv:
		mov A,num1
		mov b,num2
		div Ab
		mov r2,b
		mov b,#100
		div Ab
		mov R3,b
		mov r7,a     ;'''''
		CJNE A,#0H,contt_div_11
		sjmp with_out_first_digt_div
		contt_div_11:
		lcall print
		with_out_first_digt_div:mov A,R3
		mov b,#10
		div Ab
		mov r3,a
	    CJNE A,#0H,contt_div
		mov a,r7   ;''''
		CJNE A,#0H,contt_div
	    sjmp xxx
		contt_div:
		mov a,r3
		lcall print
		xxx:mov A,b
		lcall print
		mov A,r2
		CJNE A,#0H,goto_sigN
		ljmp main
goto_sigN:
		Mov 20H,#2EH
		Lcall lcdWrite
		Lcall DELAY
		mov A,r2
		mov b,#10
		mul Ab
		mov b,num2
		div Ab
		lcall print
		ljmp main
equal:
		Lcall waitForKey
		Mov A,20H
		CJNE A,#63H,this_placeeee
		lcall cleaar 
		ljmp main
		this_placeeee:cjne A,#03DH ,this_place
		Lcall lcdWrite
		Lcall DELAY
		ljmp rus_of_om
		this_place:lcall cleaar 
		ljmp main
		 
		
write_equal:
		mov 20H,#03DH 
		Lcall lcdWrite
		ret
cleaar:
		Mov A,#01H
		Lcall COMNWRT ;20H
		Lcall DELAY
		ret
cheak_cleaar:
	mov A,20H
	CJNE A,#63H,back
	lcall cleaar 
	ljmp main
	back:ret
print_lcd:	
	Lcall lcdWrite
	Lcall DELAY
	ret
	
erorrr:
		lcall cleaar
		mov 20H,#65H
		Lcall lcdWrite
		Lcall DELAY
		mov 20H,#72H
		Lcall lcdWrite
		Lcall DELAY
		mov 20H,#72H
		Lcall lcdWrite
		Lcall DELAY
		mov 20H,#6FH
		Lcall lcdWrite
		Lcall DELAY
		mov 20H,#72H
		Lcall lcdWrite
		lcall cleaar	
		ljmp main
cheack_op_erorrr:	
	mov A,op
	CJNE A, #02FH, NOT_EQUAL_2f_op_cheack_op_erorrr
    sjmp erorrr
    NOT_EQUAL_2f_op_cheack_op_erorrr: JNC GREATER_2fcheack_op_erorrr
    sjmp erorrr
    GREATER_2fcheack_op_erorrr: CJNE A, #03AH, NOT_EQUAL_3A_opcheack_op_erorrr
    sjmp erorrr
    NOT_EQUAL_3A_opcheack_op_erorrr: JC pack_op
    sjmp erorrr
	pack_op:ljmp cheack_op_erorrr_dom
	
cheack_mot_sigm:CJNE A, #02FH, NOT_EQUAL_2f_num
    sjmp erorrr
    NOT_EQUAL_2f_num: JNC GREATER_2f_num               
    sjmp erorrr
    GREATER_2f_num: CJNE A, #03AH, NOT_EQUAL_3A_num
    sjmp erorrr
    NOT_EQUAL_3A_num: JC packck
    sjmp erorrr
	packck: ret

design_num_1:
	mov num3,num1
	mov num2,#0H
	mov num1,#0H
	ljmp work_op
design_num_2:
	mov num3,num2
	mov num2,num1
	mov num1,#0H
	ljmp work_op
design_num_3:	
	mov num6,num4
	mov num5,#0
	mov num4,#0
	ljmp rus_of_om
design_num_4:
	mov num6,num5
	mov num5,num4
	mov num4,#0
	ljmp rus_of_om
print:
        ORL A,#30H
		Mov 20H,A
		Lcall lcdWrite
		Lcall DELAY	
	ret
starr:
		lcall cleaar
		mov 20H,#'W'
		Lcall lcdWrite
		mov 20H,#'E'
		Lcall lcdWrite
		mov 20H,#'L'
		Lcall lcdWrite
		Lcall DELAY
		mov 20H,#'C'
		Lcall lcdWrite
		mov 20H,#'O'
		Lcall lcdWrite
		mov 20H,#'M'
		Lcall lcdWrite
		mov 20H,#'E'
		Lcall lcdWrite
		lcall cleaar	
		ret
waitForKey:
	K1: MOV P1,#0 ;ground all rows at once
	MOV A,P2 ;read all col
	;(ensure keys open)
	ANL A,#00001111B ;masked unused bits
	CJNE A,#00001111B,K1 ;till all keys release
	;K2: LCALL DELAY ;call 20 msec delay
	;MOV A,P2 ;see if any key is pressed 
	;ANL A,#00001111B ;mask unused bits
	;CJNE A,#00001111B,OVER;key pressed, find row
	;SJMP K2 ;check till key pressed
	OVER: LCALL DELAY ;wait 20 msec debounce time 
	MOV A,P2 ;check key closure
	ANL A,#00001111B ;mask unused bits
	CJNE A,#00001111B,OVER1;key pressed, find row
	SJMP over ;if none, keep polling
	
	OVER1: MOV P1, #11111110B ;ground row 0
	MOV A,P2 ;read all columns
	ANL A,#00001111B ;mask unused bits
	CJNE A,#00001111B,ROW_0 ;key row 0, find col.
	MOV P1,#11111101B ;ground row 1
	MOV A,P2 ;read all columns
	ANL A,#00001111B ;mask unused bits
	CJNE A,#00001111B,ROW_1 ;key row 1, find col.
	MOV P1,#11111011B ;ground row 2
	MOV A,P2 ;read all columns
	ANL A,#00001111B ;mask unused bits
	CJNE A,#00001111B,ROW_2 ;key row 2, find col.
	MOV P1,#11110111B ;ground row 3
	MOV A,P2 ;read all columns
	ANL A,#00001111B ;mask unused bits
	CJNE A,#00001111B,ROW_3 ;key row 3, find col.
	LJMP over ;if none, false input, ;repeat
	
	
	ROW_0: MOV DPTR,#KCODE0 ;set DPTR=start of row 0
	SJMP FIND ;find col. Key belongs to 
	ROW_1: MOV DPTR,#KCODE1 ;set DPTR=start of row
	SJMP FIND ;find col. Key belongs to 
	ROW_2: MOV DPTR,#KCODE2 ;set DPTR=start of row 2 
	SJMP FIND ;find col. Key belongs to 
	ROW_3: MOV DPTR,#KCODE3 ;set DPTR=start of row 3
	FIND: RRC A ;see if any CY bit low 
	JNC MATCH ;if zero, get ASCII code
	INC DPTR ;point to next col. addr
	SJMP FIND ;keep searching
	MATCH: CLR A ;set A=0 (match is found)
	MOVC A,@A+DPTR ;get ASCII from table
	MOV P3,A ;display pressed key
	Mov 20H,A
	;LCALL lcdWrite
	;LCALL Delay
	ret
	; ASCII LOOK-UP TABLE FOR EACH ROW
	ORG 4000H
	KCODE0: DB '1','2','3','+' ;ROW 0
	KCODE1: DB '4','5','6','-' ;ROW 1
	KCODE2: DB '7','8','9','*' ;ROW 2
	KCODE3: DB 'c','0','=','/' ;ROW 3
	
;		prots
;	KCODE0: DB '/','9','8','7' ;ROW 0
;	KCODE1: DB '*','6','5','4' ;ROW 1
;	KCODE2: DB '-','3','2','1' ;ROW 2
;	KCODE3: DB '+','=','0','c' ;ROW 3
		
		
		Delay:Mov R0,#255
		here1:Mov R1,#255
		here:DJNZ R1,here
		DJNZ R0,here1
		ret
			lcdInitial:MOV A,#38H ;INIT. LCD 2 LINES, 5X7 MATRIX
			LCALL COMNWRT ;call command subroutine
			LCALL DELAY ;give LCD some time
			MOV A,#0EH ;display on, cursor on
			LCALL COMNWRT ;call command subroutine
			LCALL DELAY ;give LCD some time
			ret
			
			lcdWrite:
			MOV A,20H ;display letter N
			LCALL DATAWRT ;call display subroutine
			LCALL DELAY ;give LCD some time
			ret
			COMNWRT: ;send command to LCD
				MOV commandOrData,A ;copy reg A to port 1
				CLR RS ;RS=0 for command
				CLR RW ;R/W=0 for write
				SETB E ;E=1 for high pulse
				CLR E ;E=0 for H-to-L pulse
				RET	
				
	DATAWRT: ;write data to LCD
			MOV commandOrData,A ;copy reg A to port 1
			SETB RS ;RS=1 for DATA
			CLR RW;R/W=0 for write
			SETB E ;E=1 for high pulse
			CLR E ;E=0 for H-to-L pulse	
	RET
	
End
	



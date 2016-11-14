TITLE andy		(arrayweek.asm)
INCLUDE Irvine32.inc
.data
; board is 31X28; err now 31X56 
winning byte 0
line1 db "#######################################################",0
line2 db "# o o o o o o o o o o o o ### o o o o o o o o o o o o #",0
line3 db "# o ####### o ######### o ### o ######### o ####### o #",0
line4 db "# 0 #     # o #       # o ### o #       # o #     # 0 #",0
line5 db "# o ####### o ######### o ### o ######### o ####### o #",0
line6 db "# o o o o o o o o o o o o o o o o o o o o o o o o o o #",0
line7 db "# o # # # # o # # o ############### o ### o ####### o #",0
line8 db "# o # # # # o # # o ############### o ### o ####### o #",0
line9 db "# o o o o o o # # o o o o ### o o o o ### o o o o o o #",0
lineA db "# o o o o o o # # o o o o ### o o o o ### o o o o o o #",0
lineB db "########### o # # # # # o ### o # # # ### o ###########",0
lineC db "#         # o # # o o o o o o o o o o # # o #         #",0
lineD db "#         # o # # o #####     ##### o ### o #         #",0
lineE db "#         # o # # o #             # o ### o #         #",0
lineF db "########### o # # o #             # o ### o ###########",0
line10 db "            o o o o #             # o o o o            ",0
line11 db "########### o # # o ############### o ### o ###########",0
line12 db "#         # o # # o o o o o o o o o o ### o #         #",0
line13 db "#         # o # # o # # # # # # # # o ### o #         #",0
line14 db "########### o # # o # # # # # # # # o ### o ###########",0
line15 db "# o o o o o o o o o o o o ### o o o o o o o o o o o o #",0
line16 db "# o ####### o ######### o ### o ######### o ####### o #",0
line17 db "# o ####### o ######### o ### o ######### o ####### o #",0
line18 db "# 0 o o ### o o o o o o o o o o o o o o o o ### o o 0 #",0
line19 db "##### o ### o ### o ############### o ### o ### o #####",0
line1A db "##### o ### o ### o ############### o ### o ### o #####",0
line1B db "# o o o o o o ### o o o o ### o o o o ### o o o o o o #",0
line1C db "# o ################### o ### o ################### o #",0
line1D db "# o ################### o ### o ################### o #",0
line1E db "# o o o o o o o o o o o o o o o o o o o o o o o o o o #",0
line1F db "#######################################################",0

CaseTable BYTE 1 ; lookup Value
	DWORD Process_1 ;address of procedure
EntrySize = ($ - CaseTable)
		BYTE 2
	DWORD Process_2
		BYTE 3
	DWORD Process_3
		BYTE 4
	DWORD Process_4
		BYTE 5
	DWORD Process_5
		BYTE 6
	DWORD Process_6
		BYTE 7
	DWORD Process_7
		BYTE 8
	DWORD Process_8
		BYTE 9
	DWORD Process_9
		BYTE 10
	DWORD Process_10
		BYTE 11
	DWORD Process_11
		BYTE 12
	DWORD Process_12
		BYTE 13
	DWORD Process_13
		BYTE 14
	DWORD Process_14
		BYTE 15
	DWORD Process_15
		BYTE 16
	DWORD Process_16
		BYTE 17
	DWORD Process_17
		BYTE 18
	DWORD Process_18
		BYTE 19
	DWORD Process_19
		BYTE 20
	DWORD Process_20
		BYTE 21
	DWORD Process_21
		BYTE 22
	DWORD Process_22
		BYTE 23
	DWORD Process_23
		BYTE 24
	DWORD Process_24
		BYTE 25
	DWORD Process_25
		BYTE 26
	DWORD Process_26
		BYTE 27
	DWORD Process_27
		BYTE 28
	DWORD Process_28
		BYTE 29
	DWORD Process_29
		BYTE 30
	DWORD Process_30
		BYTE 31
	DWORD Process_31


NumberOfEntries = ($-CaseTable) / EntrySize

temptest db ?
.code
main PROC
	mov eax, 0
	mov ebx, 0
	call drawstart
	call spawnpac
	call drawstart
	call movpacup
	call drawstart
	call movpacright
	call drawstart
	call movpacup
	call drawstart
	call movpacleft
	call drawstart
	call movpacright
	call drawstart
	call movpacdown
	call drawstart
	call movpacdown
	call drawstart
	
	call movpacright
	call drawstart
	call movpacright
	call drawstart
	call movpacright
	call drawstart
	call movpacdown
	call drawstart
	call movpacdown
	call drawstart
	call movpacdown
	call drawstart
	call movpacdown
	call drawstart
	call movpacright
	call drawstart
	call movpacright
	call drawstart
	call movpacright
	call drawstart

	call movpacright
	call drawstart
	call movpacright
	call drawstart
	call movpacright
	call drawstart
	call movpacright
	call drawstart
	call movpacright
	call drawstart
	call movpacright
	call drawstart

	call movpacright
	call drawstart

	call movpacright
	call drawstart
	call movpacright
	call drawstart
	
	call movpacleft
	call drawstart
	call movpacleft
	call drawstart
	call movpacleft
	call drawstart


mainloop:
	call drawdots
	call drawpac
	call updatedots
	call input
	cmp winning, 0
;	je mainloop
exit
main ENDP

input proc
	;this should get the player's input and change pacman's xy coordinates. Doesn't actually change where the picture is tho.
	ret
input endp

drawdots proc
	;put code to draw the dots here
	ret
drawdots endp

drawpac proc
	;put code to draw pacman at a specific xy coordinate here
	ret
drawpac endp

updatedots proc
	;code to remove any dots in the same square as pacman goes here
	;this should also increment the score
	ret
updatedots endp

Drawstart Proc
mov edx , offset line1
call writestring
call crlf
mov edx , offset line2
call writestring
call crlf
mov edx , offset line3
call writestring
call crlf
mov edx , offset line4
call writestring
call crlf
mov edx , offset line5
call writestring
call crlf
mov edx , offset line6
call writestring
call crlf
mov edx , offset line7
call writestring
call crlf
mov edx , offset line8
call writestring
call crlf
mov edx , offset line9
call writestring
call crlf
mov edx , offset lineA
call writestring
call crlf
mov edx , offset lineB
call writestring
call crlf
mov edx , offset lineC
call writestring
call crlf
mov edx , offset lineD
call writestring
call crlf
mov edx , offset lineE
call writestring
call crlf
mov edx , offset lineF
call writestring
call crlf
mov edx , offset line10
call writestring
call crlf
mov edx , offset line11
call writestring
call crlf
mov edx , offset line12
call writestring
call crlf
mov edx , offset line13
call writestring
call crlf
mov edx , offset line14
call writestring
call crlf
mov edx , offset line15
call writestring
call crlf
mov edx , offset line16
call writestring
call crlf
mov edx , offset line17
call writestring
call crlf
mov edx , offset line18
call writestring
call crlf
mov edx , offset line19
call writestring
call crlf
mov edx , offset line1A
call writestring
call crlf
mov edx , offset line1B
call writestring
call crlf
mov edx , offset line1C
call writestring
call crlf
mov edx , offset line1D
call writestring
call crlf
mov edx , offset line1E
call writestring
call crlf
mov edx , offset line1F
call writestring
call crlf
ret
Drawstart endp

spawnpac proc USES esi eax
; pac man uses <, >, ^, v  depending which direction he's heading starts heading right
.data 
pacX dd 0
pacY db 0
pacDir db 0
.code
; this will just put pacman into the board at 12X13 aka lineC at index 14
	mov pacY, 12
	;mov esi, offset lineC
	Call setline
	mov pacx, 28
	add esi, pacx
	mov al, '<'
	mov [esi], al
	ret
spawnpac endp

movpacright proc USES esi eax
; need to check if the next spot is open or not
; set pacDir = 0 to rep pac heading right, replace pacX, pacY with _ to represent pellet eaten, then inc pacX, move pac to pacX, pacY 
	
;checks for teleport	
	call setline
	cmp pacX, 54
	je teleport
	jmp check
teleport:
	add esi, pacX
	mov al, '_'
	mov [esi], al
	mov pacX, 0
	call setline
	add esi, pacX
	mov al, '<'
	mov [esi], al
	jmp collision
check:
;checks for collision
	call setline
	add esi, pacX
	inc esi
	inc esi
	mov ah, [esi]
	cmp ah, '#'
	je collision
	
	mov pacDir, 0
	Call setline
	add esi, pacX
	mov al, '_'
	mov [esi], al
	inc esi
	inc esi
	inc pacX
	inc pacX
	mov al, '<'
	mov [esi], al
collision:
ret
movpacright endp

movpacleft proc USES esi eax
; need to check if the next spot is open or not
; set pacDir = 1 to rep pac heading left, replace pacX, pacY with _ to represent pellet eaten, then dec pacX, move pac to pacX, pacY 

;checks for teleport	
	call setline
	cmp pacX, 0
	je teleport
	jmp check
teleport:
	add esi, pacX
	mov al, '_'
	mov [esi], al
	mov pacX, 54
	call setline
	add esi, pacX
	mov al, '>'
	mov [esi], al
	jmp collision
check:
;checks for collision
	call setline
	add esi, pacX
	dec esi
	dec esi
	mov ah, [esi]
	cmp ah, '#'
	je collision
;moves pacman normally
	mov pacDir, 1
	Call setline
	add esi, pacX
	mov al, '_'
	mov [esi], al
	dec esi
	dec esi
	dec pacX
	dec pacX
	mov al, '>'
	mov [esi], al
collision:
ret
movpacleft endp

movpacup proc USES esi eax
; need to check if the next spot is open still
; set pacDir = 2 to rep pac heading up, replace pacX, pacY with _, then dec pacY, mov pac to pacX, pacY	
	dec pacY
	call setline
	inc pacY
	add esi, pacX
	mov ah, [esi]
	cmp ah, '#'
	je collision	
	
	mov pacDir, 2
	Call setline
	add esi, pacX
	mov al,'_'
	mov [esi], al
	dec pacY
	Call setline
	add esi, pacX
	mov al, '^'
	mov [esi], al
collision:
ret
movpacup endp

movpacdown proc USES esi eax
; need to check if the next spot is open still
; set pacDir = 4 to rep pac heading down, replace pacX, pacY with _, then inc pacY, mov pac to pacX, pacY
	inc pacY
	call setline
	dec pacY
	add esi, pacX
	mov ah, [esi]
	cmp ah, '#'
	je collision	
	
	mov pacDir, 3
	Call setline
	add esi, pacX
	mov al,'_'
	mov [esi], al
	inc pacY
	Call setline
	add esi, pacX
	mov al, 'v'
	mov [esi], al
collision:
ret
movpacdown endp

;used to set the esi to the line of PacY
setline proc
;call readchar	;read char to AL
	mov al, PacY				; so you have the right column get selected
	mov ebx, offset CaseTable ; point ebx to the table
	mov ecx, NumberOfEntries ; loop counter
L1:
mov ah, [ebx]
	mov temptest, ah
	cmp al, [ebx]	;match found?
	jne L2			; no: continue
	call NEAR PTR [ebx+1]	;yes: call procedure
	call crlf
	jmp L3	;exit search
L2:
	add ebx, EntrySize	; point to the next entry
	loop L1				; repeat until ECX =0
L3:

ret
setline endp

Process_1 PROC
	mov esi, offset line1
	ret
Process_1 ENDP

Process_2 PROC
	mov esi, offset line2
	ret
Process_2 ENDP
Process_3 PROC
	mov esi, offset line3
	ret
Process_3 ENDP
Process_4 PROC
	mov esi, offset line4
	ret
Process_4 ENDP
Process_5 PROC
	mov esi, offset line5
	ret
Process_5 ENDP
Process_6 PROC
	mov esi, offset line6
	ret
Process_6 ENDP
Process_7 PROC
	mov esi, offset line7
	ret
Process_7 ENDP
Process_8 PROC
	mov esi, offset line8
	ret
Process_8 ENDP
Process_9 PROC
	mov esi, offset line9
	ret
Process_9 ENDP
Process_10 PROC
	mov esi, offset lineA
	ret
Process_10 ENDP
Process_11 PROC
	mov esi, offset lineB
	ret
Process_11 ENDP
Process_12 PROC
	mov esi, offset lineC
	ret
Process_12 ENDP
Process_13 PROC
	mov esi, offset lineD
	ret
Process_13 ENDP
Process_14 PROC
	mov esi, offset lineE
	ret
Process_14 ENDP
Process_15 PROC
	mov esi, offset lineF
	ret
Process_15 ENDP
Process_16 PROC
	mov esi, offset line10
	ret
Process_16 ENDP
Process_17 PROC
	mov esi, offset line11
	ret
Process_17 ENDP
Process_18 PROC
	mov esi, offset line12
	ret
Process_18 ENDP
Process_19 PROC
	mov esi, offset line13
	ret
Process_19 ENDP
Process_20 PROC
	mov esi, offset line14
	ret
Process_20 ENDP
Process_21 PROC
	mov esi, offset line15
	ret
Process_21 ENDP
Process_22 PROC
	mov esi, offset line16
	ret
Process_22 ENDP
Process_23 PROC
	mov esi, offset line17
	ret
Process_23 ENDP
Process_24 PROC
	mov esi, offset line18
	ret
Process_24 ENDP
Process_25 PROC
	mov esi, offset line19
	ret
Process_25 ENDP
Process_26 PROC
	mov esi, offset line1A
	ret
Process_26 ENDP
Process_27 PROC
	mov esi, offset line1B
	ret
Process_27 ENDP
Process_28 PROC
	mov esi, offset line1C
	ret
Process_28 ENDP
Process_29 PROC
	mov esi, offset line1D
	ret
Process_29 ENDP
Process_30 PROC
	mov esi, offset line1E
	ret
Process_30 ENDP
Process_31 PROC
	mov esi, offset line1F
	ret
Process_31 ENDP



END main

TITLE andy		(arrayweek.asm)
INCLUDE Irvine32.inc
.data
; board is 31X28; err now 31X55 
;command console should be height=35(so gotoxy doesn't shift the console)
;							 width 56+scoredboard and other stuff
winning byte 0
score word 0
line1 db "#######################################################",0
line2 db "# o o o o o o o o o o o o ### o o o o o o o o o o o o #",0
line3 db "# o ####### o ######### o ### o ######### o ####### o #",0
line4 db "# 0 #     # o #       # o ### o #       # o #     # 0 #",0
line5 db "# o ####### o ######### o ### o ######### o ####### o #",0
line6 db "# o o o o o o o o o o o o o o o o o o o o o o o o o o #",0
line7 db "# o # # # # o # # o ############### o ### o ####### o #",0
line8 db "# o # # # # o # # o ############### o ### o ####### o #",0
;line9 db "# o o o o o o # # o o o o ### o o o o ### o o o o o o #",0
line9 db "# o o o o o o # # o o o o ### o o o o ### o o o o o o #",0
lineA db "########### o # # # # # o ### o # # # ### o ###########",0
lineB db "#         # o # # o o o o o o o o o o # # o #         #",0
lineC db "#         # o # # o #####_____##### o ### o #         #",0
lineD db "#         # o # # o #             # o ### o #         #",0
lineE db "########### o # # o #             # o ### o ###########",0
lineF db "            o o o o #             # o o o o            ",0
line10 db "########### o # # o ############### o ### o ###########",0
line11 db "#         # o # # o o o o o o o o o o ### o #         #",0
line12 db "#         # o # # o # # # # # # # # o ### o #         #",0
line13 db "########### o # # o # # # # # # # # o ### o ###########",0
line14 db "# o o o o o o o o o o o o ### o o o o o o o o o o o o #",0
line15 db "# o ####### o ######### o ### o ######### o ####### o #",0
line16 db "# o ####### o ######### o ### o ######### o ####### o #",0
line17 db "# 0 o o ### o o o o o o o o o o o o o o o o ### o o 0 #",0
line18 db "##### o ### o ### o ############### o ### o ### o #####",0
line19 db "##### o ### o ### o ############### o ### o ### o #####",0
line1A db "# o o o o o o ### o o o o ### o o o o ### o o o o o o #",0
line1B db "# o ################### o ### o ################### o #",0
line1C db "# o ################### o ### o ################### o #",0
line1D db "# o o o o o o o o o o o o o o o o o o o o o o o o o o #",0
line1E db "#######################################################",0
line20 db "Score: ", 0

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
;		BYTE 31
;	DWORD Process_31


NumberOfEntries = ($-CaseTable) / EntrySize

temptest db ?

title1 db " ########     ###     ######                ##     ##    ###    ##    ##",0
title2 db " ##     ##   ## ##   ##    ##               ###   ###   ## ##   ###   ##",0
title3 db " ##     ##  ##   ##  ##                     #### ####  ##   ##  ####  ##",0	
title4 db " ########  ##     ## ##          #######    ## ### ## ##     ## ## ## ##",0
title5 db " ##        ######### ##                     ##     ## ######### ##  ####",0	
title6 db " ##        ##     ## ##    ##               ##     ## ##     ## ##   ###",0
title7 db " ##        ##     ##  ######                ##     ## ##     ## ##    ##",0

endmsg1 db " ######      ###    ##     ## ########     #######  ##     ## ######## ########", 0
endmsg2 db "##    ##    ## ##   ###   ### ##          ##     ## ##     ## ##       ##     ##",0
endmsg3 db "##         ##   ##  #### #### ##          ##     ## ##     ## ##       ##     ##", 0
endmsg4 db "##   #### ##     ## ## ### ## ######      ##     ## ##     ## ######   ########", 0
endmsg5 db "##    ##  ######### ##     ## ##          ##     ##  ##   ##  ##       ##   ##", 0
endmsg6 db "##    ##  ##     ## ##     ## ##          ##     ##   ## ##   ##       ##    ##", 0
endmsg7 db " ######   ##     ## ##     ## ########     #######     ###    ######## ##     ##", 0

winmsg1 db "__     ______  _    _  __          _______ _   _   _ ", 0
winmsg2 db "\ \   / / __ \| |  | | \ \        / /_   _| \ | | | |", 0
winmsg3 db " \ \_/ / |  | | |  | |  \ \  /\  / /  | | |  \| | | |", 0
winmsg4 db "  \   /| |  | | |  | |   \ \/  \/ /   | | | . ` | | |", 0
winmsg5 db "   | | | |__| | |__| |    \  /\  /   _| |_| |\  | |_|", 0
winmsg6 db "   |_|  \____/ \____/      \/  \/   |_____|_| \_| (_)", 0

ghosts1a db " ###", 0
ghosts1b db "#0#0#", 0
ghosts1c db "#####", 0
ghosts1d db "# # #", 0
ghosts1e db "Andy", 0

ghosts2a db " ###", 0
ghosts2b db "#0#0#", 0
ghosts2c db "#####", 0
ghosts2d db "# # #", 0
ghosts2e db "Khadija", 0

ghosts3a db " ###", 0
ghosts3b db "#0#0#", 0
ghosts3c db "#####", 0
ghosts3d db "# # #", 0
ghosts3e db "Khalil", 0

ghosts4a db " ###", 0
ghosts4b db "#0#0#", 0
ghosts4c db "#####", 0
ghosts4d db "# # #", 0
ghosts4e db "Matt", 0

instructions1 db "Use the A, S, D, and W keys to move Pacman",0
instructions2 db "A is left, S is down, D is right, W is up",0
instructions3 db "Press space bar to start",0
goodluckmsg db "GOOD LUCK",0

ghost1 db "G", 0
ghost2 db "G", 0
ghost3 db "G", 0
ghost4 db "G", 0

ghost1x dd 0
ghost1y dd 0
ghost1dir db 0
ghost2x db ?
ghost2y db ?
ghost3x db ?
ghost3y db ?

ghostx		dd   24
ghosty		db   16
prevx		BYTE   11
prevy		BYTE   16
deltax		SBYTE  0
deltay		SBYTE  0
ghostdir byte 0

buffer BYTE 1000 DUP(?)
saveBuffer BYTE 1000 DUP(?)
temploc byte ?


.code
main PROC
	call randomize
	call buildSplashScreen
	call readchar
	cmp al, 20h
	je startGame
	jmp youWin
	startGame:
	call clrscr
	mov eax, 0
	mov ebx, 0
	call spawnpac
	call drawstart

gameloop:
	;call spawnGhosts
	mov eax, 100
	call delay
	call readkey
	
	cmp score, 310
	;cmp score, 20 ;for testing purposes only
	jge youWin
	

	cmp al,'d'
	je right
	cmp al,'w'
	je up
	cmp al, 'a'
	je left
	cmp al, 's'
	je down
	cmp dx,VK_ESCAPE
	je quit

	mov al, pacdir
	cmp al,'d'
	je right
	cmp al,'w'
	je up
	cmp al, 'a'
	je left
	cmp al, 's'
	je down

	add ecx, 1
	loop gameloop
right:
	call movpacright
	jmp gameloop
left:
	call movpacleft
	jmp gameloop
down:
	call movpacdown
	jmp gameloop
up:
	call movpacup
	jmp gameloop
quit:
	



	
	;Call movpacright
	;Call movpacright
	;Call movpacright
	;Call movpacright
	;Call movpacdown
	;Call movpacdown
	;Call movpacdown
	;Call movpacdown
	;Call movpacright
	;Call movpacright
	;Call movpacright
	;Call movpacright
	;Call movpacright
	;Call movpacright
	;Call movpacright
	;Call movpacright
	;Call movpacright
	;Call movpacright
	;Call movpacright
	;
	;
	;call movpacleft
	;call movpacleft
	;call movpacleft

youWin:
call clrscr
call buildYouWin
call updateScore

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

Drawstart Proc uses eax
	mov dh, 10
	mov dl, 60
	call gotoxy
mov edx, offset line20
call writestring
mov eax, 0
mov ax, score
call writeint
mov dh, 1
mov dl, 0
call gotoxy
call crlf
mov edx , offset line1
call writegameline
call crlf
mov edx , offset line2
call writegameline
call crlf
mov edx , offset line3
call writegameline
call crlf
mov edx , offset line4
call writegameline
call crlf
mov edx , offset line5
call writegameline
call crlf
mov edx , offset line6
call writegameline
call crlf
mov edx , offset line7
call writegameline
call crlf
mov edx , offset line8
call writegameline
call crlf
mov edx , offset line9
call writegameline
call crlf
mov edx , offset lineA
call writegameline
call crlf
mov edx , offset lineB
call writegameline
call crlf
mov edx , offset lineC
call writegameline
call crlf
mov edx , offset lineD
call writegameline
call crlf
mov edx , offset lineE
call writegameline
call crlf
mov edx , offset lineF
call writegameline
call crlf
mov edx , offset line10
call writegameline
call crlf
mov edx , offset line11
call writegameline
call crlf
mov edx , offset line12
call writegameline
call crlf
mov edx , offset line13
call writegameline
call crlf
mov edx , offset line14
call writegameline
call crlf
mov edx , offset line15
call writegameline
call crlf
mov edx , offset line16
call writegameline
call crlf
mov edx , offset line17
call writegameline
call crlf
mov edx , offset line18
call writegameline
call crlf
mov edx , offset line19
call writegameline
call crlf
mov edx , offset line1A
call writegameline
call crlf
mov edx , offset line1B
call writegameline
call crlf
mov edx , offset line1C
call writegameline
call crlf
mov edx , offset line1D
call writegameline
call crlf
mov edx , offset line1E
call writegameline
call crlf
;mov edx , offset line1F
;call writegameline
;call crlf
ret
Drawstart endp

;---------------------
;spawnpac
;sets up pacX and pacY at (28,12) also places pacman at that location
;Needs line#, pacX, pacY
;Returns pacX, pacY
;Uses esi eax
;---------------------
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
	mov al, PacY
	Call setline
	mov pacx, 28
	add esi, pacx
	mov al, '<'
	mov [esi], al
	ret
spawnpac endp

;---------------------
;movpacright
;moves pacX up 2 and shifts the pacman icon 2 to the right in the line index. 
;Also replaces where pacman was with'_'. 
;Checks for collision with '#' in two spaces ahead and doesn't move if a wall does exist
;Will wrap around the array if it move right from the 54 index will move to 0 index
;Needs line#, pacX, pacY
;Returns pacX, line#
;Uses esi eax
;---------------------
movpacright proc USES esi eax
; need to check if the next spot is open or not
; set pacDir = 'd' to rep pac heading right, replace pacX, pacY with _ to represent pellet eaten, then inc pacX, move pac to pacX, pacY 
	
;checks for teleport	
	mov al, PacY
	call setline
	cmp pacX, 54
	je teleport
	jmp check
teleport:
	add esi, pacX
	call checkdot ;I think this is where I should put it? Please tell me if I'm wrong
	mov al, ' '
	mov [esi], al
	call printgotoxy
	mov pacX, 0
	mov al, PacY
	call setline
	add esi, pacX
	mov al, '<'
	mov [esi], al
	call printgotoxy
	jmp collision
check:
;checks for collision
	mov al, PacY
	call setline
	add esi, pacX
	inc esi
	inc esi
	call checkdot ;I think this is where I should put it? Please tell me if I'm wrong
	mov ah, [esi]
	cmp ah, '#'
	je collision
	
	mov pacDir, 'd'
	mov al, PacY
	Call setline
	add esi, pacX
	mov al, ' '
	mov [esi], al
	call printgotoxy
	inc esi
	inc esi
	inc pacX
	inc pacX
	mov al, '<'
	mov [esi], al
	call printgotoxy
collision:
ret
movpacright endp

;---------------------
;movpacleft
;moves pacX down 2 and shifts the pacman icon 2 to the right in the line index. 
;Also replaces where pacman was with'_'. 
;Checks for collision with '#' in two spaces ahead and doesn't move if a wall does exist
;Will wrap around the array if pac moves left from the 0 index will move to 54 index
;Needs line#, pacX, pacY
;Returns pacX, line#
;Uses esi eax
;---------------------
movpacleft proc USES esi eax
; need to check if the next spot is open or not
; set pacDir = 'a' to rep pac heading left, replace pacX, pacY with _ to represent pellet eaten, then dec pacX, move pac to pacX, pacY 

;checks for teleport
	mov al, PacY	
	call setline
	cmp pacX, 0
	je teleport
	jmp check
teleport:
	add esi, pacX
	call checkdot ;I think this is where I should put it? Please tell me if I'm wrong
	mov al, ' '
	mov [esi], al
	call printgotoxy
	mov pacX, 54
	mov al, PacY
	call setline
	add esi, pacX
	mov al, '>'
	mov [esi], al
	call printgotoxy
	jmp collision
check:
;checks for collision
	mov al, PacY
	call setline
	add esi, pacX
	dec esi
	dec esi
	call checkdot ;I think this is where I should put it? Please tell me if I'm wrong
	mov ah, [esi]
	cmp ah, '#'
	je collision
;moves pacman normally
	mov pacDir, 'a'
	mov al, PacY
	Call setline
	add esi, pacX
	mov al, ' '
	mov [esi], al
	call printgotoxy
	dec esi
	dec esi
	dec pacX
	dec pacX
	mov al, '>'
	mov [esi], al
	call printgotoxy
collision:
ret
movpacleft endp

;---------
;checks to see if there is a dot
;if there is a dot, inc score
;if there is a big dot, add 5 to score
;----------
checkdot proc USES eax
	mov ah, [esi]
	cmp ah, 'o'
	je islittledot
	cmp ah, '0'
	je isbigdot
	jmp nodot
	islittledot:
	inc score
	jmp nodot
	isbigdot:
	add score, 5
	nodot:
	;cmp score, 310
	;jge youWin
	call updatescore
	ret
checkdot endp

;---------------------
;movpacup
;moves pacY up 1 and shifts the pacman icon 1 up in lines
;Also replaces where pacman was with'_'. 
;Checks for collision with '#' in two spaces ahead and doesn't move if a wall does exist
;Needs line#, pacX, pacY
;Returns pacY, line#
;Uses esi eax
;---------------------
movpacup proc USES esi eax
; need to check if the next spot is open still
; set pacDir = 'w' to rep pac heading up, replace pacX, pacY with _, then dec pacY, mov pac to pacX, pacY	
	dec pacY
	mov al, PacY
	call setline
	inc pacY
	add esi, pacX
	call checkdot ;I think this is where I should put it? Please tell me if I'm wrong
	mov ah, [esi]
	cmp ah, '#'
	je collision	
	
	mov pacDir, 'w'
	mov al, PacY
	Call setline
	add esi, pacX
	mov al,' '
	mov [esi], al
	call printgotoxy
	dec pacY
	mov al, PacY
	Call setline
	add esi, pacX
	mov al, 'v'
	mov [esi], al
	call printgotoxy
collision:
ret
movpacup endp

;---------------------
;movpacdown
;moves pacY down 1 and shifts the pacman icon 1 down in lines
;Also replaces where pacman was with'_'. 
;Checks for collision with '#' in two spaces ahead and doesn't move if a wall does exist
;Needs line#, pacX, pacY
;Returns pacY, line#
;Uses esi eax
;---------------------
movpacdown proc USES esi eax
; need to check if the next spot is open still
; set pacDir = 's' to rep pac heading down, replace pacX, pacY with _, then inc pacY, mov pac to pacX, pacY
	inc pacY
	mov al, PacY
	call setline
	dec pacY
	add esi, pacX
	call checkdot ;I think this is where I should put it? Please tell me if I'm wrong
	mov ah, [esi]
	cmp ah, '#'
	je collision	
	
	mov pacDir, 's'
	mov al, PacY
	Call setline
	add esi, pacX
	mov al,' '
	mov [esi], al
	call printgotoxy
	inc pacY
	mov al, PacY
	Call setline
	add esi, pacX
	mov al, '^'
	mov [esi], al
	call printgotoxy
collision:
ret
movpacdown endp

;---------------------
;setline
;used to set the esi to the line of PacY
;Needs line#, pacY
;Returns esi 
;Uses esi eax
;---------------------
setline proc
;call readchar	;read char to AL
	;mov al, PacY				; so you have the right column get selected
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
;Process_31 PROC
;	mov esi, offset line1F
;	ret
;Process_31 ENDP

;------
;update score
;updates the score that is shown on the screen
;-------
updatescore proc USES edx eax
	mov dh, 10
	mov dl, 60
	call gotoxy
	mov edx, offset line20
	call writestring
	mov eax, 0
	mov ax, score
	call writeint
	ret
updatescore endp
;---------------------
;printgotoxy
;moves the cursor to pacX and pacY then writes a char
;then moves the curosr to the bottom of the screen
;Needs pacX, pacY
;Returns nothing
;Uses esi ebx
;---------------------
printgotoxy proc USES edx ebx
;note to self use dl=pacX+1 dh=pacY+1
;gotoXY takes in dl:column(aka which column X), dh:row(aka which row Y)
;then call Gotoxy

	mov ebx, 0
	mov ebx, pacX
	mov dl, bl
	inc pacy
	mov dh, pacY
	dec pacY
	call Gotoxy
	call writechar

;calls gotoxy a 2nd time so there's no flickering '_' cursor marker 
;also so that"press any key" is at the bottom of the screen.
	mov dh, 0
	mov dl, 0
	call gotoxy
	cmp al, ' '			;if printing '_' don't bother with the delay
	je skipdelay
	push eax
	mov eax, 300
	call delay
	pop eax
skipdelay:
ret
printgotoxy endp

buildYouWin proc

	mov dh, 17
	mov dl, 35
	call gotoxy
	mov edx, offset winmsg1
	call writestring
	call slowdown

	mov dh, 18
	mov dl, 35
	call gotoxy
	mov edx, offset winmsg2
	call writestring
	call slowdown

	mov dh, 19
	mov dl, 35
	call gotoxy
	mov edx, offset winmsg3
	call writestring
	call slowdown

	mov dh, 20
	mov dl, 35
	call gotoxy
	mov edx, offset winmsg4
	call writestring
	call slowdown

	mov dh, 21
	mov dl, 35
	call gotoxy
	mov edx, offset winmsg5
	call writestring
	call slowdown

	mov dh, 22
	mov dl, 35
	call gotoxy
	mov edx, offset winmsg6
	call writestring
	call slowdown


ret
buildYouWin endp

buildGameOver proc

	mov dh, 17
	mov dl, 35
	call gotoxy
	mov edx, offset endmsg1
	call writestring
	call slowdown

	mov dh, 18
	mov dl, 35
	call gotoxy
	mov edx, offset endmsg2
	call writestring
	call slowdown

	mov dh, 19
	mov dl, 35
	call gotoxy
	mov edx, offset endmsg3
	call writestring
	call slowdown

	mov dh, 20
	mov dl, 35
	call gotoxy
	mov edx, offset endmsg4
	call writestring
	call slowdown

	mov dh, 21
	mov dl, 35
	call gotoxy
	mov edx, offset endmsg5
	call writestring
	call slowdown

	mov dh, 22
	mov dl, 35
	call gotoxy
	mov edx, offset endmsg6
	call writestring
	call slowdown

	mov dh, 23
	mov dl, 35
	call gotoxy
	mov edx, offset endmsg7
	call writestring
	call slowdown

	ret
buildGameOver endp

buildSplashScreen proc

	mov eax, 14
	call settextcolor

	mov dh, 17
	mov dl, 35
	call gotoxy
	mov edx, offset title1
	call writestring
	call slowdown
	mov dh, 18
	mov dl, 35
	call gotoxy
	mov edx, offset title2
	call writestring
	call slowdown
	mov dh, 19
	mov dl, 35
	call gotoxy
	mov edx, offset title3
	call writestring
	call slowdown
	mov dh, 20
	mov dl, 35
	call gotoxy
	mov edx, offset title4
	call writestring
	call slowdown
	mov dh, 21
	mov dl, 35
	call gotoxy
	mov edx, offset title5
	call writestring
	call slowdown
	mov dh, 22
	mov dl, 35
	call gotoxy
	mov edx, offset title6
	call writestring
	call slowdown
	mov dh, 23
	mov dl, 35
	call gotoxy
	mov edx, offset title7
	call writestring
	call slowdown
	mov eax, 13
	call settextcolor
	mov dh, 25
	mov dl, 50
	call gotoxy
	mov edx, offset instructions1
	call writestring
	call slowdown
	mov dh, 26
	mov dl, 52
	call gotoxy
	mov edx, offset instructions2
	call writestring
	call slowdown
	mov dh, 27
	mov dl, 58
	call gotoxy
	mov edx, offset instructions3
	call writestring
	call slowdown
	mov eax, 15
	call settextcolor
	mov dh, 28
	mov dl, 65
	call gotoxy
	mov edx, offset goodluckmsg
	call writestring
	call slowdown

	mov eax, 14; yellow
	call settextcolor
	mov dh, 29
	mov dl, 37
	call gotoxy
	mov edx, offset ghosts1a
	call writestring
	call crlf

	call slowdown
	mov dh, 30
	mov dl, 37
	call gotoxy
	mov edx, offset ghosts1b
	call writestring
	call crlf
	call slowdown
	mov dh, 31
	mov dl, 37
	call gotoxy
	mov edx, offset ghosts1c
	call writestring
	call crlf
	call slowdown
	mov dh, 32
	mov dl, 37
	call gotoxy
	mov edx, offset ghosts1d
	call writestring
	call crlf

	call slowdown

	mov dh, 33
	mov dl, 37
	call gotoxy
	mov edx, offset ghosts1e
	call writestring
	call crlf
	call slowdown
	mov eax, 13; light magenta
	call settextcolor

	mov dh, 29
	mov dl, 57
	call gotoxy
	mov edx, offset ghosts2a
	call writestring
	call crlf
	call slowdown
	mov dh, 30
	mov dl, 57
	call gotoxy
	mov edx, offset ghosts2b
	call writestring
	call crlf
	call slowdown
	mov dh, 31
	mov dl, 57
	call gotoxy
	mov edx, offset ghosts2c
	call writestring
	call crlf
	call slowdown
	mov dh, 32
	mov dl, 57
	call gotoxy
	mov edx, offset ghosts2d
	call writestring
	call crlf

	call slowdown

	mov dh, 33
	mov dl, 57
	call gotoxy
	mov edx, offset ghosts2e
	call writestring
	call crlf
	call slowdown
	mov eax, 12;  light red
	call settextcolor

	mov dh, 29
	mov dl, 77
	call gotoxy
	mov edx, offset ghosts3a
	call writestring
	call crlf
	call slowdown
	mov dh, 30
	mov dl, 77
	call gotoxy
	mov edx, offset ghosts3b
	call writestring
	call crlf
	call slowdown
	mov dh, 31
	mov dl, 77
	call gotoxy
	mov edx, offset ghosts3c
	call writestring
	call crlf
	call slowdown
	mov dh, 32
	mov dl, 77
	call gotoxy
	mov edx, offset ghosts3d
	call writestring
	call crlf

	call slowdown

	mov dh, 33
	mov dl, 77
	call gotoxy
	mov edx, offset ghosts3e
	call writestring
	call crlf

	mov eax, 11 ; light cyan
	call settextcolor
	call slowdown
	mov dh, 29
	mov dl, 97
	call gotoxy
	mov edx, offset ghosts4a
	call writestring
	call crlf
	call slowdown
	mov dh, 30
	mov dl, 97
	call gotoxy
	mov edx, offset ghosts4b
	call writestring
	call crlf

	call slowdown

	mov dh, 31
	mov dl, 97
	call gotoxy
	mov edx, offset ghosts4c
	call writestring
	call crlf

	call slowdown

	mov dh, 32
	mov dl, 97
	call gotoxy
	mov edx, offset ghosts4d
	call writestring
	call crlf
	
	call slowdown

	mov dh, 33
	mov dl, 97
	call gotoxy
	mov edx, offset ghosts4e
	call writestring
	call crlf

	mov eax, 15
	call settextcolor

ret
buildSplashScreen ENDP

slowdown PROC
	push eax
	mov  eax, 100 ; 100 milliseconds
	call delay
	pop  eax
	ret
slowdown ENDP

;spawnGhosts proc 
;	call getDirection
;	;call movGhosts
;	;call checkMapLoc
;	;call DrawGhosts
;	ret
;spawnGhosts endp
;
;
;getDirection proc
;	mov deltax, 0
;	mov deltay, 0
;	mov eax, 5
;	call randomrange
;
;	cmp eax, 1
;	je right
;	cmp eax, 2
;	je left
;	cmp eax, 3
;	je up
;	cmp eax, 4
;	je down
;
;	right:
;		mov deltax, 1
;		mov deltay, 0
;		call movghostright
;	left:
;		mov deltax, -1
;		mov deltay, 0
;		call movghostleft
;	up:
;		mov deltax, 0
;		mov deltay, -1
;		call movghostup
;	down:
;		mov deltax, 0
;		mov deltay, 1
;		call movghostdown
;	stop:
;		ret
;
;getDirection endp
;
;;movGhosts proc uses eax ebx
;;	;get previous location
;;	mov bl, ghostx
;;	mov prevx, bl
;;	mov bl, ghosty
;;	mov prevy, bl
;;	
;;	;mov to new location
;;	mov al, deltax
;;	add ghostx, al
;;	mov al, deltay
;;	add ghosty, al
;;	
;;	ret
;;movGhosts endp
;
;
;movghostright proc USES esi eax	
;;checks for teleport	
;	mov al, ghosty
;	call setline
;	cmp ghostx, 54
;	je teleport
;	jmp check
;teleport:
;	; trying to make sure the dots stay dots after it moves
;	mov ghostx, 0
;	mov al, ghosty 
;	call setline
;	add esi, ghostx
;	mov al, [esi]
;	mov temploc, al
;	add esi, ghostx
;	mov al, temploc
;	mov [esi], al
;	call DrawGhosts
;
;	mov ghostx, 0
;	mov al, ghosty
;	call setline
;	add esi, ghostx
;	mov al, 'G'
;	mov [esi], al
;	call DrawGhosts
;	jmp collision
;check:
;;checks for collision
;	mov al, ghosty
;	call setline
;	add esi, ghostx
;	inc esi
;	inc esi
;	mov ah, [esi]
;	cmp ah, '#'
;	je collision
;
;	inc esi
;	inc esi
;	inc ghostx
;	inc ghostx
;	mov al, [esi]
;	mov temploc, al
;	mov ghostdir, 'd'
;	mov al, ghosty
;	Call setline
;	add esi, ghostx
;	mov al, temploc
;	mov [esi], al
;	call DrawGhosts
;
;
;	inc esi
;	inc esi
;	inc ghostx
;	inc ghostx
;	mov al, 'G'
;	mov [esi], al
;	call DrawGhosts
;collision:
;ret
;movghostright endp
;
;movghostleft proc USES esi eax
;; need to check if the next spot is open or not
;; set pacDir = 'a' to rep pac heading left, replace pacX, pacY with _ to represent pellet eaten, then dec pacX, move pac to pacX, pacY 
;
;;checks for teleport
;	mov al, ghosty	
;	call setline
;	cmp ghostx, 0
;	je teleport
;	jmp check
;teleport:
;	mov ghostx, 54
;	mov al, ghosty
;	call setline
;	add esi, ghostx
;	mov al, [esi]
;	mov temploc, al
;	add esi, ghostx
;	mov al, temploc
;	mov [esi], al
;	call DrawGhosts
;
;
;	mov ghostx, 54
;	mov al, ghosty
;	call setline
;	add esi, ghostx
;	mov al, 'G'
;	mov [esi], al
;	call DrawGhosts
;	jmp collision
;check:
;;checks for collision
;	mov al, ghosty
;	call setline
;	add esi, ghostx
;	dec esi
;	dec esi
;	mov ah, [esi]
;	cmp ah, '#'
;	je collision
;;moves pacman normally
;	mov ghostDir, 'a'
;	dec esi
;	dec esi
;	dec ghostx
;	mov al, [esi]
;	mov temploc, al
;	mov al, ghosty
;	Call setline
;	add esi, ghostx
;	mov al, temploc
;	mov [esi], al
;	call DrawGhosts
;
;
;	dec esi
;	dec esi
;	dec ghostx
;	dec ghostx
;	mov al, 'G'
;	mov [esi], al
;	call DrawGhosts
;collision:
;ret
;movghostleft endp
;
;movghostup proc USES esi eax
;; need to check if the next spot is open still
;; set pacDir = 'w' to rep pac heading up, replace pacX, pacY with _, then dec pacY, mov pac to pacX, pacY	
;	dec ghosty
;	mov al, ghosty
;	call setline
;	inc ghosty
;	add esi, ghostx
;	mov ah, [esi]
;	cmp ah, '#'
;	je collision	
;	
;	mov ghostDir, 'w'
;
;	dec ghosty
;	mov al, ghosty
;	Call setline
;	add esi, ghostx
;	mov al, [esi]
;	mov temploc, al
;	add esi, ghostx
;	mov al, temploc
;	mov [esi], al
;	call DrawGhosts
;
;
;	dec ghosty
;	mov al, ghosty
;	Call setline
;	add esi, ghostx
;	mov al, 'G'
;	mov [esi], al
;	call DrawGhosts
;collision:
;ret
;movghostup endp
;
;movghostdown proc USES esi eax
;; need to check if the next spot is open still
;; set pacDir = 's' to rep pac heading down, replace pacX, pacY with _, then inc pacY, mov pac to pacX, pacY
;	inc ghosty
;	mov al, ghosty
;	call setline
;	dec ghosty
;	add esi, ghostx
;	mov ah, [esi]
;	cmp ah, '#'
;	je collision	
;	
;	mov ghostDir, 's'
;	inc ghosty
;	mov al, ghosty
;	Call setline
;	add esi, ghostx
;	mov al, [esi]
;	mov temploc, al
;	add esi, ghostx
;	mov al, temploc
;	mov [esi], al
;	call DrawGhosts
;
;
;	inc ghosty
;	mov al, ghosty
;	Call setline
;	add esi, ghostx
;	mov al, 'G'
;	mov [esi], al
;	call DrawGhosts
;collision:
;ret
;movghostdown endp
;
;;MoveBack proc USES eax
;;	mov eax, 0
;;	mov al, prevx
;;	mov ghostx, al
;;	mov al, prevy
;;	mov ghosty, al
;;	ret
;;MoveBack endp
;
;DrawGhosts proc USES eax edx ecx
;;note to self use dl=pacX+1 dh=pacY+1
;;gotoXY takes in dl:column(aka which column X), dh:row(aka which row Y)
;;then call Gotoxy
;
;	mov ebx, 0
;	mov ebx, ghostx
;	mov dl, bl
;	inc ghosty
;	mov dh, ghosty
;	dec ghosty
;	call Gotoxy
;	mov bl, al
;	mov eax, 14
;	call settextcolor
;	mov al, bl
;	call writechar
;	mov eax, 15 
;	call settextcolor
;
;skipdelay:
;ret
;
;DrawGhosts endp

WriteGameLine PROC
mov esi , edx
push ecx
push eax
push ebx

mov ecx , 55
writegamelineloop:
mov bl , [esi]
cmp bl , 35
je wallwrite

cmp bl , 111
je dotwrite

cmp bl , 48
je bigdotwrite

cmp bl , 32
je writethechar

cmp bl , 95
je wallwrite

jmp writethechar

wallwrite:
mov eax , 9
call settextcolor
jmp writethechar

dotwrite:
mov eax , 14
call settextcolor
jmp writethechar

bigdotwrite:
mov eax, 10
jmp writethechar






writethechar:
mov al, bl
call writechar
inc esi
mov eax , 15
call settextcolor
loop writegamelineloop

pop ebx
pop eax
pop ecx
ret
WriteGameLine endp

END main

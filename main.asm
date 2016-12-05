TITLE andy		(arrayweek.asm)
INCLUDE Irvine32.inc
.data
; board is 31X28; err now 31X55 
;command console should be height=35(so gotoxy doesn't shift the console)
;							 width 56+scoredboard and other stuff
winning byte 0
dead byte 0
score word 1
lives byte 3
dotseaten word 1
line1 db "#######################################################",0
line2 db "# o o o o o o o o o o o o ### o o o o o o o o o o o o #",0
line3 db "# o ####### o ######### o ### o ######### o ####### o #",0
line4 db "# 0 #     # o #       # o ### o #       # o #     # 0 #",0
line5 db "# o ####### o ######### o ### o ######### o ####### o #",0
line6 db "# o o o o o o o o o o o o o o o o o o o o o o o o o o #",0
line7 db "# o ####### o ### o ############### o ### o ####### o #",0
line8 db "# o ####### o ### o ############### o ### o ####### o #",0
;line9 db "# o o o o o o # # o o o o ### o o o o ### o o o o o o #",0
line9 db "# o o o o o o ### o o o o ### o o o o ### o o o o o o #",0
lineA db "########### o #########   ###   ######### o ###########",0
lineB db "#         # o ###                     ### o #         #",0
lineC db "#         # o ###   #####_____#####   ### o #         #",0
lineD db "#         # o ###   #             #   ### o #         #",0
lineE db "########### o ###   #             #   ### o ###########",0
lineF db "            o       #             #       o            ",0
line10 db "########### o ###   ###############   ### o ###########",0
line11 db "#         # o ###                     ### o #         #",0
line12 db "#         # o ###   ###############   ### o #         #",0
line13 db "########### o ###   ###############   ### o ###########",0
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
line20 db "|  Score:", 0
line21 db "|  Lives:",0


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

endmsg1 db "  #####                          #######                      ", 0
endmsg2 db " #     #   ##   #    # ######    #     # #    # ###### #####  ",0
endmsg3 db " #        #  #  ##  ## #         #     # #    # #      #    # ", 0
endmsg4 db " #  #### #    # # ## # #####     #     # #    # #####  #    # ", 0
endmsg5 db " #     # ###### #    # #         #     # #    # #      #####  ", 0
endmsg6 db " #     # #    # #    # #         #     #  #  #  #      #   #  ", 0
endmsg7 db "  #####  #    # #    # ######    #######   ##   ###### #    # ", 0

winmsg1 db "__     ______  _    _  __          _______ _   _   _ ", 0
winmsg2 db "\ \   / / __ \| |  | | \ \        / /_   _| \ | | | |", 0
winmsg3 db " \ \_/ / |  | | |  | |  \ \  /\  / /  | | |  \| | | |", 0
winmsg4 db "  \   /| |  | | |  | |   \ \/  \/ /   | | | . ` | | |", 0
winmsg5 db "   | | | |__| | |__| |    \  /\  /   _| |_| |\  | |_|", 0
winmsg6 db "   |_|  \____/ \____/      \/  \/   |_____|_| \_| (_)", 0

border1 db "---------------", 0
bordersides db "|             |", 0
border30 db "---------------", 0
side db "|",0
row db 2;

fireworks1 db "*''*", 0
fireworks2 db "*_\/_*", 0
fireworks3 db "* /\ *", 0
fireworks4 db "*..*", 0

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
displayscoremsg db "Your Score Was: ",0
losemsg db "You lose!!", 0

;ghost1 db "G", 0
;ghost2 db "G", 0
;ghost3 db "G", 0
;ghost4 db "G", 0

;ghost1x dd 0
;ghost1y dd 0
;ghost1dir db 0
;ghost2x db ?
;ghost2y db ?
;ghost3x db ?
;ghost3y db ?


prevx		BYTE   11
prevy		BYTE   16
deltax		SBYTE  0
deltay		SBYTE  0

ghosttimer db 0
ghosthold db 0
ghostpreserve db ' '
ghostcol db 0
ghost1hold db 0
ghost1preserve db ' '
ghost1col db 0
ghost2hold db 0
ghost2preserve db ' '
ghost2col db 0
ghost3hold db 0
ghost3preserve db ' '
ghost3col db 0

ghost2x dd 0
ghost2y db 0
ghost3x dd 0
ghost3y db 0
startdone0 db 0
startdone1 db 0

ghostchoice db 0

endgameloop db 0


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
	call spawnghost
	call spawnghost1
	call drawstart
	call drawborder
	call updatelives

gameloop:
	
	mov eax, 200
	call delay
	;if score = 10 spawn the ghost outside of the pen at corrdinatines 28, 12
	cmp dotseaten, 10
	jge go0
	
	jmp continuelooping
go0:
	call startghost
	cmp dotseaten, 20
	jge go1
	jmp continuelooping
go1:
	call startghost1
	jmp continuelooping
continuelooping:
	cmp dotseaten, 244
	jge youWin
	cmp dead, 1
	je LoseLife
	;move ghosts here
	call movghostrand
	call movghost1rand

	call movpac

	cmp endgameloop,1
	je quit
	add ecx, 1
	loop gameloop


quit:
;if endgameloop=0 keepgoing
;if endgameloop=1 stop

	
youWin:
call clrscr
call buildYouWin
mov eax , 9999
call delay
jmp gameend


LoseLife:
mov eax , 0
mov al , lives
dec al
mov lives , al
mov al , 0
mov dead , al
mov ax , score
cmp ax , 50
jle setscorezero
sub ax , 50
jmp con
setscorezero:
mov ax , 0
con:
mov score , ax
cmp lives , 0
je youLose
call updatelives
call spawnpac
jmp gameloop
youLose:
call clrscr
call buildGameOver
mov eax , 9999
call delay

gameend:

;mainloop:
;	call drawdots
;	call drawpac
;	call updatedots
;	call input
;	cmp winning, 0
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
	mov dl, 57
	call gotoxy
mov edx, offset line20
call writestring
mov eax, 0
mov ax, score
call writedec
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
pacDir db 'd'
pacCol db 0
.code
; this will just put pacman into the board at 24X13 aka line11 at index 14
	mov pacY, 23
	;mov esi, offset lineC
	mov al, PacY
	Call setline
	mov pacx, 26
	add esi, pacx
	mov al, '<'
	mov [esi], al
	ret
spawnpac endp

;---------------------
;movpacright
;moves pacX up 2 and shifts the pacman icon 2 to the right in the line index. 
;Also replaces where pacman was with' '. 
;Checks for collision with '#' in two spaces ahead and doesn't move if a wall does exist
;Will wrap around the array if it move right from the 54 index will move to 0 index
;Needs line#, pacX, pacY
;Returns pacX, line#
;Uses esi eax
;---------------------
movpacright proc USES esi eax
; need to check if the next spot is open or not
; set pacDir = 'd' to rep pac heading right, replace pacX, pacY with _ to represent pellet eaten, then inc pacX, move pac to pacX, pacY 

	mov paccol, 0
	
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
	jmp done
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
	cmp ah, '_'
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
	jmp done
collision:
	mov paccol, 1
done:
ret
movpacright endp

;---------------------
;movpacleft
;moves pacX down 2 and shifts the pacman icon 2 to the right in the line index. 
;Also replaces where pacman was with' '. 
;Checks for collision with '#' in two spaces ahead and doesn't move if a wall does exist
;Will wrap around the array if pac moves left from the 0 index will move to 54 index
;Needs line#, pacX, pacY
;Returns pacX, line#
;Uses esi eax
;---------------------
movpacleft proc USES esi eax
; need to check if the next spot is open or not
; set pacDir = 'a' to rep pac heading left, replace pacX, pacY with _ to represent pellet eaten, then dec pacX, move pac to pacX, pacY 

	mov paccol, 0

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
	jmp done
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
	cmp ah, '_'
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
	jmp done
collision:
	mov paccol, 1
done:
ret
movpacleft endp

;---------
;checks to see if there is a dot
;if there is a dot, inc score
;if there is a big dot, add 5 to score
;----------
checkdot proc USES eax
	mov ah, [esi]
	cmp ah, 'C'
	je isfruit
	cmp ah, 'o'
	je islittledot
	cmp ah, '0'
	je isbigdot
	cmp ah, 'G'
	je isghost
	jmp nodot
	islittledot:
	inc score
	inc dotseaten
	jmp nodot
	isbigdot:
	add score, 5
	inc dotseaten
	jmp nodot
	isghost:
	mov dead, 1
	jmp nodot
	isfruit:
	add score, 50
	jmp nodot
	nodot:
	;cmp score, 310
	;jge youWin
	call updatescore
	;; spawn fruit
	call spawnfruits
	ret
checkdot endp

spawnfruits proc USES eax edx ecx esi
mov dx, 0
mov ax, dotseaten
mov cx, 100
div cx
cmp dx, 0
je drawfruit
jmp done
drawfruit:
	mov al, 17
	call setline
	add esi, 30
	mov al, 'C'
	mov [esi], al
	mov eax, lightred
	call settextcolor
	mov al, 'C'
	mov dh, 18
	mov dl, 30
	call gotoxy
	call writechar
done:
	ret
spawnfruits endp


;---------------------
;movpacup
;moves pacY up 1 and shifts the pacman icon 1 up in lines
;Also replaces where pacman was with' '. 
;Checks for collision with '#' in two spaces ahead and doesn't move if a wall does exist
;Needs line#, pacX, pacY
;Returns pacY, line#
;Uses esi eax
;---------------------
movpacup proc USES esi eax
; need to check if the next spot is open still
; set pacDir = 'w' to rep pac heading up, replace pacX, pacY with _, then dec pacY, mov pac to pacX, pacY	
	
	mov paccol, 0
	
	dec pacY
	mov al, PacY
	call setline
	inc pacY
	add esi, pacX
	call checkdot ;I think this is where I should put it? Please tell me if I'm wrong
	mov ah, [esi]
	cmp ah, '#'
	je collision	
	cmp ah, '_'
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
	jmp done
collision:
	mov paccol, 1
done:
ret
movpacup endp

;---------------------
;movpacdown
;moves pacY down 1 and shifts the pacman icon 1 down in lines
;Also replaces where pacman was with' '. 
;Checks for collision with '#' in two spaces ahead and doesn't move if a wall does exist
;Needs line#, pacX, pacY
;Returns pacY, line#
;Uses esi eax
;---------------------
movpacdown proc USES esi eax
; need to check if the next spot is open still
; set pacDir = 's' to rep pac heading down, replace pacX, pacY with _, then inc pacY, mov pac to pacX, pacY
	
	mov paccol,0
	
	inc pacY
	mov al, PacY
	call setline
	dec pacY
	add esi, pacX
	call checkdot ;I think this is where I should put it? Please tell me if I'm wrong
	mov ah, [esi]
	cmp ah, '#'
	je collision	
	cmp ah, '_'
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
	jmp done
collision:
	mov paccol,1
done:
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
	mov dl, 57
	call gotoxy
	mov edx, offset line20
	call writestring
	mov eax, 0
	mov ax, score
	call writedec
	ret
updatescore endp
;---------------------
;printgotoxy
;moves the cursor to pacX and pacY then writes a char
;then moves the curosr to the bottom of the screen
;Needs pacX, pacY, takes al to determine what color char is now needs ghostchoice for which ghost 0,1,2,3
;Returns nothing
;Uses esi ebx
;---------------------
printgotoxy proc USES edx ebx
;note to self use dl=pacX+1 dh=pacY+1
;gotoXY takes in dl:column(aka which column X), dh:row(aka which row Y)
;then call Gotoxy
	
	cmp al,'G'
	je colorghost
	;cmp al,' '
	;je printpac
	cmp al, '<'
	je colorpac
	cmp al, '>'
	je colorpac
	cmp al, '^'
	je colorpac
	cmp al, 'v'
	je colorpac
	jmp printpac
colorghost:
	cmp ghostchoice,0
	je ghost0
	cmp ghostchoice,1
	je ghost1
	cmp ghostchoice,2
	je ghost2
	cmp ghostchoice,3
	je ghost3
ghost0:
	push eax
	mov eax, lightgreen
	call settextcolor
	pop eax
;print
	mov ebx, 0
	mov ebx, ghostX
	mov dl, bl
	inc ghosty
	mov dh, ghostY
	dec ghostY
	call Gotoxy
	call writechar
	jmp done

ghost1:
	push eax
	mov eax, red
	call settextcolor
	pop eax
	mov ebx, 0
	mov ebx, ghost1X
	mov dl, bl
	inc ghost1y
	mov dh, ghost1Y
	dec ghost1Y
	call Gotoxy
	call writechar
	jmp done
ghost2:
	push eax
	mov eax, lightred
	call settextcolor
	pop eax
	mov ebx, 0
	mov ebx, ghost2X
	mov dl, bl
	inc ghost2y
	mov dh, ghost2Y
	dec ghost2Y
	call Gotoxy
	call writechar
	jmp done
ghost3:
	push eax
	mov eax, gray
	call settextcolor
	pop eax
	mov ebx, 0
	mov ebx, ghost3X
	mov dl, bl
	inc ghost3y
	mov dh, ghost3Y
	dec ghost3Y
	call Gotoxy
	call writechar
	jmp done
colorpac: 
	push eax
	mov eax, yellow
	call settextcolor
	pop eax
printpac:
	mov ebx, 0
	mov ebx, pacX
	mov dl, bl
	inc pacy
	mov dh, pacY
	dec pacY
	call Gotoxy
	call writechar
	jmp done

done:
;calls gotoxy a 2nd time so there's no flickering ' ' cursor marker 
;also so that"press any key" is at the bottom of the screen.
	mov dh, 0
	mov dl, 0
	call gotoxy
	cmp al, ' '			;if printing ' ' don't bother with the delay
	je skipdelay
	cmp al, 'G'
	je skipdelay
	push eax
	mov eax, 300
	;call delay
	pop eax
skipdelay:
push eax
mov eax, white
call settextcolor
pop eax
ret
printgotoxy endp

buildYouWin proc
	mov eax, 12
 	call settextcolor
	mov dh, 12
	mov dl, 1
	call gotoxy
	mov edx, offset winmsg1
	call writestring
	call slowdown

	mov eax, 12
 	call settextcolor
	mov dh, 13
	mov dl, 1
	call gotoxy
	mov edx, offset winmsg2
	call writestring
	call slowdown

	mov eax, 14
 	call settextcolor
	mov dh, 14
	mov dl, 1
	call gotoxy
	mov edx, offset winmsg3
	call writestring
	call slowdown

	mov eax,9
 	call settextcolor
	mov dh, 15
	mov dl, 1
	call gotoxy
	mov edx, offset winmsg4
	call writestring
	call slowdown

	mov eax, 13
 	call settextcolor
	mov dh, 16
	mov dl, 1
	call gotoxy
	mov edx, offset winmsg5
	call writestring
	call slowdown

	mov eax, 10
	call settextcolor
	mov dh, 17
	mov dl, 1
	call gotoxy
	mov edx, offset winmsg6
	call writestring
	call slowdown

	mov eax, 14
	call randomrange
	inc eax
	call settextcolor

	mov eax , 2000
	call delay
	mov dh, 5
	mov dl, 3
	call gotoxy
	mov edx, offset fireworks1
	call writestring

	mov dh, 6
	mov dl, 2
	call gotoxy
	mov edx, offset fireworks2
	call writestring

	mov dh, 7
	mov dl, 2
	call gotoxy
	mov edx, offset fireworks3
	call writestring

	mov dh, 8
	mov dl, 3
	call gotoxy
	mov edx, offset fireworks4
	call writestring

	mov eax , 500
	call delay

	mov eax, 14
	call randomrange
	inc eax
	call settextcolor

	mov dh, 2
	mov dl, 27
	call gotoxy
	mov edx, offset fireworks1
	call writestring

	mov dh, 3
	mov dl, 26
	call gotoxy
	mov edx, offset fireworks2
	call writestring

	mov dh, 4
	mov dl, 26
	call gotoxy
	mov edx, offset fireworks3
	call writestring

	mov dh, 5
	mov dl, 27
	call gotoxy
	mov edx, offset fireworks4
	call writestring

	mov eax , 750
	call delay

	mov eax, 14
	call randomrange
	inc eax
	call settextcolor

	mov dh, 7
	mov dl, 50
	call gotoxy
	mov edx, offset fireworks1
	call writestring

	mov dh, 8
	mov dl, 49
	call gotoxy
	mov edx, offset fireworks2
	call writestring

	mov dh, 9
	mov dl, 49
	call gotoxy
	mov edx, offset fireworks3
	call writestring

	mov dh, 10
	mov dl, 50
	call gotoxy
	mov edx, offset fireworks4
	call writestring

	mov eax , 750
	call delay

	mov eax, 14
	call randomrange
	inc eax
	call settextcolor

	mov dh, 20
	mov dl, 60
	call gotoxy
	mov edx, offset fireworks1
	call writestring

	mov dh, 21
	mov dl, 59
	call gotoxy
	mov edx, offset fireworks2
	call writestring

	mov dh, 22
	mov dl, 59
	call gotoxy
	mov edx, offset fireworks3
	call writestring

	mov dh, 23
	mov dl, 60
	call gotoxy
	mov edx, offset fireworks4
	call writestring

	mov eax , 750
	call delay

	mov eax, 14
	call randomrange
	inc eax
	call settextcolor

	mov dh, 19
	mov dl, 24
	call gotoxy
	mov edx, offset fireworks1
	call writestring

	mov dh, 20
	mov dl, 23
	call gotoxy
	mov edx, offset fireworks2
	call writestring

	 mov dh, 21
	 mov dl, 23
	 call gotoxy
	 mov edx, offset fireworks3
	 call writestring

	 mov dh, 22
	 mov dl, 24
	 call gotoxy
	 mov edx, offset fireworks4
	 call writestring

	 mov eax , 750
	 call delay

	 mov eax, 14
	call randomrange
	inc eax
	call settextcolor

	 mov dh, 22
	 mov dl, 9
	 call gotoxy
	 mov edx, offset fireworks1
	 call writestring

	 mov dh, 23
	 mov dl, 8
	 call gotoxy
	 mov edx, offset fireworks2
	 call writestring

	 mov dh, 24
	 mov dl, 8
	 call gotoxy
	 mov edx, offset fireworks3
	 call writestring

	 mov dh, 25
	 mov dl, 9
	 call gotoxy
	 mov edx, offset fireworks4
	 call writestring
	 
	 call slowdown

	 mov eax, 12
	 call settextcolor
	 mov dh, 18
	 mov dl, 13
	 call gotoxy
	 mov edx, offset displayscoremsg
	 call writestring
	 mov eax , 0
	 mov ax, score
	 call writedec


	mov eax, 15
	call settextcolor


ret
buildYouWin endp

buildGameOver proc
	mov eax, 14
	call settextcolor
	
	mov dh, 12
	mov dl, 1
	call gotoxy
	mov edx, offset endmsg1
	call writestring
	call slowdown

	mov dh, 13
	mov dl, 1
	call gotoxy
	mov edx, offset endmsg2
	call writestring
	call slowdown

	mov dh, 14
	mov dl, 1
	call gotoxy
	mov edx, offset endmsg3
	call writestring
	call slowdown

	mov dh, 15
	mov dl, 1
	call gotoxy
	mov edx, offset endmsg4
	call writestring
	call slowdown

	mov dh, 16
	mov dl, 1
	call gotoxy
	mov edx, offset endmsg5
	call writestring
	call slowdown

	mov dh, 17
	mov dl, 1
	call gotoxy
	mov edx, offset endmsg6
	call writestring
	call slowdown

	mov dh, 18
	mov dl, 1
	call gotoxy
	mov edx, offset endmsg7
	call writestring
	call slowdown

	mov eax, 11
 	call settextcolor
 	mov dh, 19
 	mov dl, 25
 	call gotoxy
 	mov edx, offset losemsg
 	call writestring
 
 	mov eax, 12
 	call settextcolor
 	mov dh, 20
 	mov dl, 18
 	call gotoxy
 	mov edx, offset displayscoremsg
	call writestring
	mov eax ,0
	mov ax, score
	call writedec
 
 	mov eax, 15
 	call settextcolor
 

	ret
buildGameOver endp

buildSplashScreen proc

	mov eax, 14
	call settextcolor

	mov dh, 12
	mov dl, 0
	call gotoxy
	mov edx, offset title1
	call writestring
	call slowdown
	mov dh, 13
	mov dl, 0
	call gotoxy
	mov edx, offset title2
	call writestring
	call slowdown
	mov dh, 14
	mov dl, 0
	call gotoxy
	mov edx, offset title3
	call writestring
	call slowdown
	mov dh, 15
	mov dl, 0
	call gotoxy
	mov edx, offset title4
	call writestring
	call slowdown
	mov dh, 16
	mov dl, 0
	call gotoxy
	mov edx, offset title5
	call writestring
	call slowdown
	mov dh, 17
	mov dl, 0
	call gotoxy
	mov edx, offset title6
	call writestring
	call slowdown
	mov dh, 18
	mov dl, 0
	call gotoxy
	mov edx, offset title7
	call writestring
	call slowdown
	mov eax, 13
	call settextcolor
	mov dh, 20
	mov dl, 13
	call gotoxy
	mov edx, offset instructions1
	call writestring
	call slowdown
	mov dh, 21
	mov dl, 15
	call gotoxy
	mov edx, offset instructions2
	call writestring
	call slowdown
	mov dh, 22
	mov dl, 21
	call gotoxy
	mov edx, offset instructions3
	call writestring
	call slowdown
	mov eax, 15
	call settextcolor
	mov dh, 23
	mov dl, 28
	call gotoxy
	mov edx, offset goodluckmsg
	call writestring
	call slowdown

	mov eax, 14; yellow
	call settextcolor
	mov dh, 24
	mov dl, 0
	call gotoxy
	mov edx, offset ghosts1a
	call writestring
	call crlf

	call slowdown
	mov dh, 25
	mov dl, 0
	call gotoxy
	mov edx, offset ghosts1b
	call writestring
	call crlf
	call slowdown
	mov dh, 26
	mov dl, 0
	call gotoxy
	mov edx, offset ghosts1c
	call writestring
	call crlf
	call slowdown
	mov dh, 27
	mov dl, 0
	call gotoxy
	mov edx, offset ghosts1d
	call writestring
	call crlf

	call slowdown

	mov dh, 28
	mov dl, 0
	call gotoxy
	mov edx, offset ghosts1e
	call writestring
	call crlf
	call slowdown
	mov eax, 13; light magenta
	call settextcolor

	mov dh, 24
	mov dl, 20
	call gotoxy
	mov edx, offset ghosts2a
	call writestring
	call crlf
	call slowdown
	mov dh, 25
	mov dl, 20
	call gotoxy
	mov edx, offset ghosts2b
	call writestring
	call crlf
	call slowdown
	mov dh, 26
	mov dl, 20
	call gotoxy
	mov edx, offset ghosts2c
	call writestring
	call crlf
	call slowdown
	mov dh, 27
	mov dl, 20
	call gotoxy
	mov edx, offset ghosts2d
	call writestring
	call crlf

	call slowdown

	mov dh, 28
	mov dl, 20
	call gotoxy
	mov edx, offset ghosts2e
	call writestring
	call crlf
	call slowdown
	mov eax, 12;  light red
	call settextcolor

	mov dh, 24
	mov dl, 40
	call gotoxy
	mov edx, offset ghosts3a
	call writestring
	call crlf
	call slowdown
	mov dh, 25
	mov dl, 40
	call gotoxy
	mov edx, offset ghosts3b
	call writestring
	call crlf
	call slowdown
	mov dh, 26
	mov dl, 40
	call gotoxy
	mov edx, offset ghosts3c
	call writestring
	call crlf
	call slowdown
	mov dh, 27
	mov dl, 40
	call gotoxy
	mov edx, offset ghosts3d
	call writestring
	call crlf

	call slowdown

	mov dh, 28
	mov dl, 40
	call gotoxy
	mov edx, offset ghosts3e
	call writestring
	call crlf

	mov eax, 11 ; light cyan
	call settextcolor
	call slowdown
	mov dh, 24
	mov dl, 60
	call gotoxy
	mov edx, offset ghosts4a
	call writestring
	call crlf
	call slowdown
	mov dh, 25
	mov dl, 60
	call gotoxy
	mov edx, offset ghosts4b
	call writestring
	call crlf

	call slowdown

	mov dh, 26
	mov dl, 60
	call gotoxy
	mov edx, offset ghosts4c
	call writestring
	call crlf

	call slowdown

	mov dh, 27
	mov dl, 60
	call gotoxy
	mov edx, offset ghosts4d
	call writestring
	call crlf
	
	call slowdown

	mov dh, 28
	mov dl, 60
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

drawborder proc

mov dh, row
mov dl, 57
call gotoxy
mov edx, offset border1
call writestring
inc row

mov dh, row
mov dl, 57
call gotoxy
mov edx, offset bordersides
call writestring
inc row

mov dh, row
mov dl, 57
call gotoxy
mov edx, offset bordersides
call writestring
inc row

mov dh, row
mov dl, 57
call gotoxy
mov edx, offset bordersides
call writestring
inc row

mov dh, row
mov dl, 57
call gotoxy
mov edx, offset bordersides
call writestring
inc row

mov dh, row
mov dl, 57
call gotoxy
mov edx, offset bordersides
call writestring
inc row

mov dh, row
mov dl, 57
call gotoxy
mov edx, offset bordersides
call writestring
inc row

mov dh, row
mov dl, 57
call gotoxy
mov edx, offset bordersides
call writestring
inc row


mov dh, row
mov dl, 71
call gotoxy
mov edx, offset side
call writestring
inc row


mov dh, row
mov dl, 57
call gotoxy
mov edx, offset bordersides
call writestring
inc row

mov dh, row
mov dl, 57
call gotoxy
mov edx, offset bordersides
call writestring
inc row

mov dh, row
mov dl, 57
call gotoxy
mov edx, offset bordersides
call writestring
inc row

mov dh, row
mov dl, 57
call gotoxy
mov edx, offset bordersides
call writestring
inc row

mov dh, row
mov dl, 57
call gotoxy
mov edx, offset bordersides
call writestring
inc row

mov dh, row
mov dl, 57
call gotoxy
mov edx, offset bordersides
call writestring
inc row

mov dh, row
mov dl, 57
call gotoxy
mov edx, offset bordersides
call writestring
inc row

mov dh, row
mov dl, 57
call gotoxy
mov edx, offset bordersides
call writestring
inc row

mov dh, row
mov dl, 57
call gotoxy
mov edx, offset bordersides
call writestring
inc row

mov dh, row
mov dl, 57
call gotoxy
mov edx, offset bordersides
call writestring
inc row

mov dh, row
mov dl, 57
call gotoxy
mov edx, offset bordersides
call writestring
inc row

mov dh, row
mov dl, 57
call gotoxy
mov edx, offset bordersides
call writestring
inc row

mov dh, row
mov dl, 57
call gotoxy
mov edx, offset bordersides
call writestring
inc row

mov dh, row
mov dl, 57
call gotoxy
mov edx, offset bordersides
call writestring
inc row
mov dh, row
mov dl, 57
call gotoxy
mov edx, offset bordersides
call writestring
inc row

mov dh, row
mov dl, 57
call gotoxy
mov edx, offset bordersides
call writestring
inc row

mov dh, row
mov dl, 57
call gotoxy
mov edx, offset bordersides
call writestring
inc row

mov dh, row
mov dl, 57
call gotoxy
mov edx, offset bordersides
call writestring
inc row

mov dh, row
mov dl, 57
call gotoxy
mov edx, offset bordersides
call writestring
inc row

mov dh, row
mov dl, 57
call gotoxy
mov edx, offset bordersides
call writestring
inc row


mov dh, row
mov dl, 57
call gotoxy
mov edx, offset border30
call writestring



ret
drawborder endp


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

cmp bl, 60
je pacwrite

cmp bl , 48
je bigdotwrite

cmp bl , 32
je writethechar

cmp bl , 95
je wallwrite

cmp bl, 'G'
je ghostwrite

jmp writethechar

wallwrite:
mov eax , 9
call settextcolor
jmp writethechar

dotwrite:
mov eax , white
call settextcolor
jmp writethechar

pacwrite:
mov eax , 14
call settextcolor
jmp writethechar

ghostwrite:
mov eax, lightgreen
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

;---------------------
;spawnghost
;sets up ghostX and ghostY at (28,12) also places ghostman at that location
;Needs line#, ghostX, ghostY
;Returns ghostX, ghostY
;Uses esi eax
;---------------------
spawnghost proc USES esi eax
; ghost man uses <, >, ^, v  depending which direction he's heading starts heading right
.data 
ghostX dd 0
ghostY db 0
ghostDir db 'd'
.code
; this will just put ghostman into the board at 12X13 aka lineC at index 14
	mov ghostY, 14
	;mov esi, offset lineC
	mov al, ghostY
	Call setline
	mov ghostx, 26
	add esi, ghostx
	mov al, 'G'
	mov [esi], al
	ret
spawnghost endp

;---------------------
;movghostright
;moves ghostX up 2 and shifts the ghostman icon 2 to the right in the line index. 
;Also replaces where ghostman was with' '. 
;Checks for collision with '#' in two sghostes ahead and doesn't move if a wall does exist
;Will wrap around the array if it move right from the 54 index will move to 0 index
;Needs line#, ghostX, ghostY
;Returns ghostX, line#
;Uses esi eax
;---------------------
movghostright proc USES esi eax
; need to check if the next spot is open or not
; set ghostDir = 'd' to rep ghost heading right, replace ghostX, ghostY with _ to represent pellet eaten, then inc ghostX, move ghost to ghostX, ghostY 
	
	;set thing to 0 for ghost collisions
	mov ghostcol, 0

	;setts which ghost is moving
	mov ghostchoice,0

;checks for teleport	
	mov al, ghostY
	call setline
	cmp ghostX, 54
	je teleport
	jmp check
teleport:
	add esi, ghostX
	
	mov al, ' '
	mov [esi], al
	call printghostblank
	mov ghostX, 0
	mov al, ghostY
	call setline
	add esi, ghostX
	mov al, 'G'
	mov [esi], al
	call printgotoxy
	jmp done
	
check:
;checks for collision
	mov al, ghostY
	call setline
	add esi, ghostX
	inc esi
	inc esi
	
	mov ah, [esi]
	cmp ah, '#'
	je collision
	cmp ah, '_'
	je collision
	cmp ah, 'G'
	je collision
	cmp ah, 'v'
	je pachit
	cmp ah, '<'
	je pachit
	cmp ah, '>'
	je pachit
	cmp ah, '^'
	je pachit
	;ghosts don't leave blanks they just leave what ever was there before in ghost hold
	mov ghosthold, ah
	
	mov ghostDir, 'd'
	mov al, ghostY
	Call setline
	add esi, ghostX
	mov al, ghostpreserve
	mov [esi], al
	call printghostblank
	inc esi
	inc esi
	inc ghostX
	inc ghostX
	mov al, 'G'
	mov [esi], al
	call printgotoxy
	mov al, ghosthold
	mov ghostpreserve, al
	jmp done
collision:
	mov ghostcol, 1
	jmp done
pachit:
	mov dead, 1
	jmp done
done:
ret
movghostright endp

;---------------------
;movghostleft
;moves ghostX down 2 and shifts the ghostman icon 2 to the right in the line index. 
;Also replaces where ghostman was with' '. 
;Checks for collision with '#' in two sghostes ahead and doesn't move if a wall does exist
;Will wrap around the array if ghost moves left from the 0 index will move to 54 index
;Needs line#, ghostX, ghostY
;Returns ghostX, line#
;Uses esi eax
;---------------------
movghostleft proc USES esi eax
; need to check if the next spot is open or not
; set ghostDir = 'a' to rep ghost heading left, replace ghostX, ghostY with _ to represent pellet eaten, then dec ghostX, move ghost to ghostX, ghostY 

	mov ghostcol, 0

	;setts which ghost is moving
	mov ghostchoice,0

;checks for teleport
	mov al, ghostY	
	call setline
	cmp ghostX, 0
	je teleport
	jmp check
teleport:
	add esi, ghostX
	
	mov al, ' '
	mov [esi], al
	call printghostblank
	mov ghostX, 54
	mov al, ghostY
	call setline
	add esi, ghostX
	mov al, 'G'
	mov [esi], al
	call printgotoxy
	jmp done
	

check:
;checks for collision
	mov al, ghostY
	call setline
	add esi, ghostX
	dec esi
	dec esi
	
	mov ah, [esi]
	cmp ah, '#'
	je collision
	cmp ah, '_'
	je collision
	cmp ah, 'G'
	je collision
	cmp ah, 'v'
	je pachit
	cmp ah, '<'
	je pachit
	cmp ah, '>'
	je pachit
	cmp ah, '^'
	je pachit
	;ghosts don't leave blanks they just leave what ever was there before in ghost hold
	mov ghosthold, ah

;moves ghostman normally
	mov ghostDir, 'a'

	mov al, ghostY
	Call setline
	add esi, ghostX
	mov al, ghostpreserve
	mov [esi], al
	call printghostblank
	dec esi
	dec esi
	dec ghostX
	dec ghostX
	mov al, 'G'
	mov [esi], al
	call printgotoxy
	mov al, ghosthold
	mov ghostpreserve, al
	jmp done
collision:
	mov ghostcol, 1
	jmp done
pachit:
	mov dead, 1
	jmp done
done:
ret
movghostleft endp

;---------------------
;movghostdown
;moves ghostY down 1 and shifts the ghostman icon 1 down in lines
;Also replaces where ghostman was with' '. 
;Checks for collision with '#' in two sghostes ahead and doesn't move if a wall does exist
;Needs line#, ghostX, ghostY
;Returns ghostY, line#
;Uses esi eax
;---------------------
movghostdown proc USES esi eax
; need to check if the next spot is open still
; set ghostDir = 's' to rep ghost heading down, replace ghostX, ghostY with _, then inc ghostY, mov ghost to ghostX, ghostY
	
	mov ghostcol, 0

	;setts which ghost is moving
	mov ghostchoice,0
	
	inc ghostY
	mov al, ghostY
	call setline
	dec ghostY
	add esi, ghostX
	
	mov ah, [esi]
	cmp ah, '#'
	je collision	
	cmp ah, '_'
	je collision
	cmp ah, 'G'
	je collision
	cmp ah, 'v'
	je pachit
	cmp ah, '<'
	je pachit
	cmp ah, '>'
	je pachit
	cmp ah, '^'
	je pachit
	;ghosts don't leave blanks they just leave what ever was there before in ghost hold
	mov ghosthold, ah
	
	mov ghostDir, 's'
	mov al, ghostY
	Call setline
	add esi, ghostX
	mov al, ghostpreserve
	mov [esi], al
	call printghostblank
	inc ghostY
	mov al, ghostY
	Call setline
	add esi, ghostX
	mov al, 'G'
	mov [esi], al
	call printgotoxy
	mov al, ghosthold
	mov ghostpreserve, al
	jmp done
collision:
	mov ghostcol, 1
	jmp done
pachit:
	mov dead, 1
	jmp done
done:

ret
movghostdown endp

;---------------------
;movghostup
;moves ghostY up 1 and shifts the ghostman icon 1 up in lines
;Also replaces where ghostman was with' '. 
;Checks for collision with '#' in two sghostes ahead and doesn't move if a wall does exist
;Needs line#, ghostX, ghostY
;Returns ghostY, line#
;Uses esi eax
;---------------------
movghostup proc USES esi eax
; need to check if the next spot is open still
; set ghostDir = 'w' to rep ghost heading up, replace ghostX, ghostY with _, then dec ghostY, mov ghost to ghostX, ghostY	
	
	mov ghostcol, 0

	;setts which ghost is moving
	mov ghostchoice,0

	dec ghostY
	mov al, ghostY
	call setline
	inc ghostY
	add esi, ghostX
	
	mov ah, [esi]
	cmp ah, '#'
	je collision	
	cmp ah, '_'
	je collision
	cmp ah, 'G'
	je collision
	cmp ah, 'v'
	je pachit
	cmp ah, '<'
	je pachit
	cmp ah, '>'
	je pachit
	cmp ah, '^'
	je pachit
	;ghosts don't leave blanks they just leave what ever was there before in ghost hold
	mov ghosthold, ah
	
	mov ghostDir, 'w'
	mov al, ghostY
	Call setline
	add esi, ghostX
	mov al, ghostpreserve
	mov [esi], al
	call printghostblank
	dec ghostY
	mov al, ghostY
	Call setline
	add esi, ghostX
	mov al, 'G'
	mov [esi], al
	call printgotoxy

	mov al, ghosthold
	mov ghostpreserve, al

	jmp done


collision:
	mov ghostcol, 1
	jmp done
pachit:
	mov dead, 1
	jmp done
done:
ret
movghostup endp

;---------------------
;spawnghost1
;sets up ghost1x and ghost1y at (28,12) also places ghostman at that location
;Needs line#, ghost1x, ghost1y
;Returns ghost1x, ghost1y
;Uses esi eax
;---------------------
spawnghost1 proc USES esi eax
; ghost man uses <, >, ^, v  depending which direction he's heading starts heading right
.data 
ghost1x dd 0
ghost1y db 0
ghost1Dir db 'd'
.code
; this will just put ghostman into the board at 12X13 aka lineC at index 14
	mov ghost1y, 14
	;mov esi, offset lineC
	mov al, ghost1y
	Call setline
	mov ghost1x, 30
	add esi, ghost1x
	mov al, 'G'
	mov [esi], al
	ret
spawnghost1 endp

;---------------------
;movghost1right
;moves ghost1x up 2 and shifts the ghostman icon 2 to the right in the line index. 
;Also replaces where ghostman was with' '. 
;Checks for collision with '#' in two sghostes ahead and doesn't move if a wall does exist
;Will wrap around the array if it move right from the 54 index will move to 0 index
;Needs line#, ghost1x, ghost1y
;Returns ghost1x, line#
;Uses esi eax
;---------------------
movghost1right proc USES esi eax
; need to check if the next spot is open or not
; set ghost1Dir = 'd' to rep ghost heading right, replace ghost1x, ghost1y with _ to represent pellet eaten, then inc ghost1x, move ghost to ghost1x, ghost1y 
	
	;set thing to 0 for ghost collisions
	mov ghost1col, 0

	;for printing purpose
	mov ghostchoice, 1

;checks for teleport	
	mov al, ghost1y
	call setline
	cmp ghost1x, 54
	je teleport
	jmp check
teleport:
	add esi, ghost1x
	
	mov al, ' '
	mov [esi], al
	call printghostblank
	mov ghost1x, 0
	mov al, ghost1y
	call setline
	add esi, ghost1x
	mov al, 'G'
	mov [esi], al
	call printgotoxy
	jmp done
	
check:
;checks for collision
	mov al, ghost1y
	call setline
	add esi, ghost1x
	inc esi
	inc esi
	
	mov ah, [esi]
	cmp ah, '#'
	je collision
	cmp ah, '_'
	je collision
	cmp ah, 'G'
	je collision
	cmp ah, 'v'
	je pachit
	cmp ah, '<'
	je pachit
	cmp ah, '>'
	je pachit
	cmp ah, '^'
	je pachit
	;ghosts don't leave blanks they just leave what ever was there before in ghost hold
	mov ghost1hold, ah
	
	mov ghost1Dir, 'd'
	mov al, ghost1y
	Call setline
	add esi, ghost1x
	mov al, ghost1preserve
	mov [esi], al
	call printghostblank
	inc esi
	inc esi
	inc ghost1x
	inc ghost1x
	mov al, 'G'
	mov [esi], al
	call printgotoxy
	mov al, ghost1hold
	mov ghost1preserve, al
	jmp done
collision:
	mov ghost1col, 1
	jmp done
pachit:
	mov dead, 1
	jmp done
done:
ret
movghost1right endp

;---------------------
;movghost1left
;moves ghost1x down 2 and shifts the ghostman icon 2 to the right in the line index. 
;Also replaces where ghostman was with' '. 
;Checks for collision with '#' in two sghostes ahead and doesn't move if a wall does exist
;Will wrap around the array if ghost moves left from the 0 index will move to 54 index
;Needs line#, ghost1x, ghost1y
;Returns ghost1x, line#
;Uses esi eax
;---------------------
movghost1left proc USES esi eax
; need to check if the next spot is open or not
; set ghost1Dir = 'a' to rep ghost heading left, replace ghost1x, ghost1y with _ to represent pellet eaten, then dec ghost1x, move ghost to ghost1x, ghost1y 

	mov ghost1col, 0

	;for printing purpose
	mov ghostchoice, 1

;checks for teleport
	mov al, ghost1y	
	call setline
	cmp ghost1x, 0
	je teleport
	jmp check
teleport:
	add esi, ghost1x
	
	mov al, ' '
	mov [esi], al
	call printghostblank
	mov ghost1x, 54
	mov al, ghost1y
	call setline
	add esi, ghost1x
	mov al, 'G'
	mov [esi], al
	call printgotoxy
	jmp done
	

check:
;checks for collision
	mov al, ghost1y
	call setline
	add esi, ghost1x
	dec esi
	dec esi
	
	mov ah, [esi]
	cmp ah, '#'
	je collision
	cmp ah, '_'
	je collision
	cmp ah, 'G'
	je collision
	cmp ah, 'v'
	je pachit
	cmp ah, '<'
	je pachit
	cmp ah, '>'
	je pachit
	cmp ah, '^'
	je pachit
	;ghosts don't leave blanks they just leave what ever was there before in ghost hold
	mov ghost1hold, ah

;moves ghostman normally
	mov ghost1Dir, 'a'

	mov al, ghost1y
	Call setline
	add esi, ghost1x
	mov al, ghost1preserve
	mov [esi], al
	call printghostblank
	dec esi
	dec esi
	dec ghost1x
	dec ghost1x
	mov al, 'G'
	mov [esi], al
	call printgotoxy
	mov al, ghost1hold
	mov ghost1preserve, al
	jmp done
collision:
	mov ghost1col, 1
	jmp done
pachit:
	mov dead, 1
	jmp done
done:
ret
movghost1left endp

;---------------------
;movghost1down
;moves ghost1y down 1 and shifts the ghostman icon 1 down in lines
;Also replaces where ghostman was with' '. 
;Checks for collision with '#' in two sghostes ahead and doesn't move if a wall does exist
;Needs line#, ghost1x, ghost1y
;Returns ghost1y, line#
;Uses esi eax
;---------------------
movghost1down proc USES esi eax
; need to check if the next spot is open still
; set ghost1Dir = 's' to rep ghost heading down, replace ghost1x, ghost1y with _, then inc ghost1y, mov ghost to ghost1x, ghost1y
	
	mov ghost1col, 0

	;for printing purpose
	mov ghostchoice, 1
	
	inc ghost1y
	mov al, ghost1y
	call setline
	dec ghost1y
	add esi, ghost1x
	
	mov ah, [esi]
	cmp ah, '#'
	je collision	
	cmp ah, '_'
	je collision
	cmp ah, 'G'
	je collision
	cmp ah, 'v'
	je pachit
	cmp ah, '<'
	je pachit
	cmp ah, '>'
	je pachit
	cmp ah, '^'
	je pachit
	;ghosts don't leave blanks they just leave what ever was there before in ghost hold
	mov ghost1hold, ah
	
	mov ghost1Dir, 's'
	mov al, ghost1y
	Call setline
	add esi, ghost1x
	mov al, ghost1preserve
	mov [esi], al
	call printghostblank
	inc ghost1y
	mov al, ghost1y
	Call setline
	add esi, ghost1x
	mov al, 'G'
	mov [esi], al
	call printgotoxy
	mov al, ghost1hold
	mov ghost1preserve, al
	jmp done
collision:
	mov ghost1col, 1
	jmp done
pachit:
	mov dead, 1
	jmp done
done:

ret
movghost1down endp

;---------------------
;movghost1up
;moves ghost1y up 1 and shifts the ghostman icon 1 up in lines
;Also replaces where ghostman was with' '. 
;Checks for collision with '#' in two sghostes ahead and doesn't move if a wall does exist
;Needs line#, ghost1x, ghost1y
;Returns ghost1y, line#
;Uses esi eax
;---------------------
movghost1up proc USES esi eax
; need to check if the next spot is open still
; set ghost1Dir = 'w' to rep ghost heading up, replace ghost1x, ghost1y with _, then dec ghost1y, mov ghost to ghost1x, ghost1y	
	
	mov ghost1col, 0

	;for printing purpose
	mov ghostchoice, 1

	dec ghost1y
	mov al, ghost1y
	call setline
	inc ghost1y
	add esi, ghost1x
	
	mov ah, [esi]
	cmp ah, '#'
	je collision	
	cmp ah, '_'
	je collision
	cmp ah, 'G'
	je collision
	cmp ah, 'v'
	je pachit
	cmp ah, '<'
	je pachit
	cmp ah, '>'
	je pachit
	cmp ah, '^'
	je pachit
	;ghosts don't leave blanks they just leave what ever was there before in ghost hold
	mov ghost1hold, ah
	
	mov ghost1Dir, 'w'
	mov al, ghost1y
	Call setline
	add esi, ghost1x
	mov al, ghost1preserve
	mov [esi], al
	call printghostblank
	dec ghost1y
	mov al, ghost1y
	Call setline
	add esi, ghost1x
	mov al, 'G'
	mov [esi], al
	call printgotoxy

	mov al, ghost1hold
	mov ghost1preserve, al

	jmp done


collision:
	mov ghost1col, 1
	jmp done
pachit:
	mov dead, 1
	jmp done
done:
ret
movghost1up endp

;---------------------
;startghost
;sets up ghostX and ghostY at (28,12) also places ghostman at that location
;Needs line#, ghostX, ghostY
;Returns ghostX, ghostY
;Uses esi eax
;---------------------
startghost proc USES esi eax
; ghost man uses G depending which direction he's heading starts heading right
; this will just put ghostman into the board at 12X13 aka lineC at index 14
	;if already happened once then ret

	cmp startdone0, 0
	je go
	ret
go:
	mov startdone0, 1
	mov eax, ' '
	mov ghostchoice, 0
	call printghostblank 
	
	mov ghostY, 11
	;mov esi, offset lineC
	mov al, ghostY
	Call setline
	mov ghostx, 28
	add esi, ghostx
	mov al, 'G'
	mov [esi], al
	call printgotoxy
	ret
startghost endp

;---------------------
;startghost1
;sets up ghostX and ghostY at (28,12) also places ghostman at that location
;Needs line#, ghostX, ghostY
;Returns ghostX, ghostY
;Uses esi eax
;---------------------
startghost1 proc USES esi eax
; ghost man uses G depending which direction he's heading starts heading right
; this will just put ghostman into the board at 12X13 aka lineC at index 14
	;if already happened once then ret

	cmp startdone1, 0
	je go
	ret
go:
	mov startdone1, 1
	mov eax, ' '
	mov ghostchoice, 1
	call printghostblank 
	
	mov ghost1Y, 11
	;mov esi, offset lineC
	mov al, ghost1Y
	Call setline
	mov ghost1x, 30
	add esi, ghost1x
	mov al, 'G'
	mov [esi], al
	call printgotoxy
	ret
startghost1 endp

;---------------------
;printghostblank
;takes in the ussual ghost x and ghost y and makes a blank where ghost was also takes in ghost choice as what ghost is coming 0,1,2,3
;Needs line#, ghostX, ghostY
;Returns nothing
;Uses eax
;---------------------
printghostblank proc uses eax 

	cmp ghostchoice,0
	je ghost0
	cmp ghostchoice,1
	je ghost1
	cmp ghostchoice,2
	je ghost2
	cmp ghostchoice,3
	je ghost3
	;jmp done
ghost0:
	;mov eax, ' '
	mov ebx, 0
	mov ebx, ghostx
	mov dl, bl
	inc ghosty
	mov dh, ghostY
	dec ghostY
	call Gotoxy
	call writechar
	ret
ghost1:
	mov ebx, 0
	mov ebx, ghost1x
	mov dl, bl
	inc ghost1y
	mov dh, ghost1Y
	dec ghost1Y
	call Gotoxy
	call writechar
	ret
ghost2:
ghost3:

	done:
ret
printghostblank endp

movghostrand proc
doitagain:
	mov eax, 16
	call randomrange
	cmp al, 1
	je ghostright
	cmp al, 2
	je ghostleft
	cmp al, 3
	je ghostdown
	cmp al, 4
	je ghostup
	; if not 1-4 keep same direction
	;need to add a check if hitting wall to just recall this thing
	cmp ghostdir, 'd'
	je ghostright
	cmp ghostdir, 'w'
	je ghostup
	cmp ghostdir, 'a'
	je ghostleft
	cmp ghostdir, 's'
	je ghostdown
ghostright:
	call movghostright
	jmp ghostdone
ghostleft:
	call movghostleft
	jmp ghostdone
ghostdown:
	call movghostdown
	jmp ghostdone
ghostup:
	call movghostup
	jmp ghostdone

ghostdone:
	;if ghostcol = 1 do it again
	cmp ghostcol, 1
	je doitagain

ret
movghostrand endp

movghost1rand proc
doitagain:
	mov eax, 16
	call randomrange
	cmp al, 1
	je ghost1right
	cmp al, 2
	je ghost1left
	cmp al, 3
	je ghost1down
	cmp al, 4
	je ghost1up
	; if not 1-4 keep same direction
	;need to add a check if hitting wall to just recall this thing
	cmp ghost1dir, 'd'
	je ghost1right
	cmp ghost1dir, 'w'
	je ghost1up
	cmp ghost1dir, 'a'
	je ghost1left
	cmp ghost1dir, 's'
	je ghost1down
ghost1right:
	call movghost1right
	jmp ghost1done
ghost1left:
	call movghost1left
	jmp ghost1done
ghost1down:
	call movghost1down
	jmp ghost1done
ghost1up:
	call movghost1up
	jmp ghost1done

ghost1done:
	;if ghost1col = 1 do it again
	cmp ghost1col, 1
	je doitagain

ret
movghost1rand endp

updatelives PROC USES edx eax
	mov dh, 11
	mov dl, 57
	call gotoxy
	mov edx, offset line21
	call writestring
	mov eax, 0
	mov al, lives
	call writedec
	ret
updatelives endp

movpac proc

	call readkey
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
	
	;jmp done
automove:
	mov al, pacdir
	cmp al,'d'
	je right
	cmp al,'w'
	je up
	cmp al, 'a'
	je left
	cmp al, 's'
	je down

right:
	;call movghostright
	call movpacright
	;cmp paccol, 1
	;je automove
	ret
left:
	;call movghostleft
	call movpacleft
	;cmp paccol, 1
	;je automove
	ret
down:
	;call movghostdown
	call movpacdown
	;cmp paccol, 1
	;je automove
	ret
up:
	;call movghostup
	call movpacup
	;cmp paccol, 1
	;je automove
	ret
quit:
	mov endgameloop, 1
done:
ret
movpac endp

END main

TITLE andy		(arrayweek.asm)
INCLUDE Irvine32.inc
.data
winning byte 0
line1 db "############################",0
line2 db "#oooooooooooo##oooooooooooo#",0
line3 db "#o####o#####o##o#####o####o#",0
line4 db "#o####o#####o##o#####o####o#",0
line5 db "#o####o#####o##o#####o####o#",0
line6 db "#oooooooooooooooooooooooooo#",0
line7 db "#o####o##o########o##o####o#",0
line8 db "#o####o##o########o##o####o#",0
line9 db "#oooooo##oooo##oooo##oooooo#",0
lineA db "######o#####o##o#####o######",0
lineB db "######o#####o##o#####o######",0
lineC db "######o##oooooooooo##o######",0
lineD db "######o##o###__###o##o######",0
lineE db "######o##o#______#o##o######",0
lineF db "______oooo#______#oooo______",0
line10 db "######o##o#______#o##o######",0
line11 db "######o##o########o##o######",0
line12 db "######o##oooooooooo##o######",0
line13 db "######o##o########o##o######",0
line14 db "######o##o########o##o######",0
line15 db "#oooooooooooo##oooooooooooo#",0
line16 db "#o####o#####o##o#####o####o#",0
line17 db "#o####o#####o##o#####o####o#",0
line18 db "#ooo##oooooooooooooooo##ooo#",0
line19 db "###o##o##o########o##o##o###",0
line1A db "###o##o##o########o##o##o###",0
line1B db "#oooooo##oooo##oooo##oooooo#",0
line1C db "#o##########o##o##########o#",0
line1D db "#o##########o##o##########o#",0
line1E db "#oooooooooooooooooooooooooo#",0
line1F db "############################",0
.code
main PROC
	mainloop:
	call drawstart
	call drawdots
	call drawpac
	call updatedots
	call input
	cmp winning, 0
	je mainloop
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
END main
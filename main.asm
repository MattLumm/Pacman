TITLE andy		(arrayweek.asm)
INCLUDE Irvine32.inc
.data
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

authormsg db "Created By: Matt Lum, Khadija Panirwala, Khalil Sheehan-Miles, Andy Tenhagen", 0
title1 db  "_______  _______  _______  __   __  _______  __    _", 0
title2 db "|       ||   _   ||       ||  |_|  ||   _   ||  |  | |", 0
title3 db "|    _  ||  |_|  ||       ||       ||  |_|  ||   |_| |", 0
title4 db "|   |_| ||       ||       ||       ||       ||       |", 0
title5 db "|    ___||       ||      _||       ||       ||  _    |", 0
title6 db "|   |    |   _   ||     |_ | ||_|| ||   _   || | |   |", 0
title7 db "|___|    |__| |__||_______||_|   |_||__| |__||_|  |__|", 0
instructions1 db "Use the A, S, D, and W keys to move Pacman", 0
instructions2 db "A is left, S is down, D is right, W is up ", 0
instructions3 db "Press space bar to start", 0
goodluckmsg db "GOOD LUCK", 0



.code
main PROC
call drawstart
call buildSplashScreen
exit
main ENDP

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

buildSplashScreen proc
mov edx, offset authormsg
call writestring
call crlf
mov edx, offset title1
call writestring
call crlf
mov edx, offset title2
call writestring
call crlf
mov edx, offset title3
call writestring
call crlf
mov edx, offset title4
call writestring
call crlf
mov edx, offset title5
call writestring
call crlf
mov edx, offset title6
call writestring
call crlf
mov edx, offset title7
call writestring
call crlf
mov edx, offset instructions1
call writestring
call crlf
mov edx, offset instructions2
call writestring
call crlf
mov edx, offset instructions3
call writestring
call crlf
mov edx, offset goodluckmsg
call writestring
call crlf
ret
buildSplashScreen ENDP




END main
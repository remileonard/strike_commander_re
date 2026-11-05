ovr300		segment	para public 'OVERLAY' use16
		assume cs:ovr300
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 18 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Input_ReadJoystickButtonsExtended_7ACD0 (sub_7ACD0 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle Joystick_TestButtonMasked_67B6C 4 fois (150 lignes) — teste plusieurs boutons
; joystick.
; ==============================================================================================
Input_ReadJoystickButtonsExtended_AC010		proc far

var_4		= word ptr -4
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0
		mov	[bp+var_2], 0
		push	1
		push	0
		call	sub_5235
		add	sp, 4
		mov	ah, 0
		mov	di, ax
		push	2
		push	0
		call	sub_5235
		add	sp, 4
		mov	ah, 0
		add	di, ax
		push	1
		push	1
		call	sub_5235
		add	sp, 4
		mov	ah, 0
		shl	ax, 2
		add	di, ax
		push	2
		push	1
		call	sub_5235
		add	sp, 4
		mov	ah, 0
		shl	ax, 2
		add	di, ax
		mov	[bp+var_4], di
		mov	bx, [bp+var_4]
		sub	bx, 3
		cmp	bx, 0Ch
		ja	short loc_AC0EC
		shl	bx, 1
		jmp	cs:off_AC122[bx]	; switch jump

loc_AC07E:
		cmp	word ptr [si+14Ch], 0
		jge	short loc_AC087
		jmp	short loc_AC09F

loc_AC087:
		cmp	word ptr [si+14Ch], 10h
		jge	short loc_AC092
		inc	word ptr [si+14Ch]

loc_AC092:
		mov	[bp+var_1], 1
		jmp	short loc_AC0EC

loc_AC098:
		cmp	word ptr [si+14Ch], 0
		jle	short loc_AC0A7

loc_AC09F:
		mov	word ptr [si+14Ch], 0
		jmp	short loc_AC092

loc_AC0A7:
		cmp	word ptr [si+14Ch], 0FFF0h
		jle	short loc_AC092
		dec	word ptr [si+14Ch]
		jmp	short loc_AC092
		jmp	short loc_AC092

loc_AC0B6:
		cmp	word ptr [si+14Eh], 0
		jge	short loc_AC0C5

loc_AC0BD:
		mov	word ptr [si+14Eh], 0
		jmp	short loc_AC0E8

loc_AC0C5:
		cmp	word ptr [si+14Eh], 10h
		jge	short loc_AC0E8
		inc	word ptr [si+14Eh]
		jmp	short loc_AC0E8
		jmp	short loc_AC0E8

loc_AC0D4:
		cmp	word ptr [si+14Eh], 0
		jle	short loc_AC0DD
		jmp	short loc_AC0BD

loc_AC0DD:
		cmp	word ptr [si+14Eh], 0FFF0h
		jle	short loc_AC0E8
		dec	word ptr [si+14Eh]

loc_AC0E8:
		mov	[bp+var_2], 1

loc_AC0EC:
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_AC0FB
		mov	word ptr [si+14Ch], 0

loc_AC0FB:
		mov	al, [bp+var_2]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_AC10A
		mov	word ptr [si+14Eh], 0

loc_AC10A:
		push	[bp+arg_2]
		push	word ptr [si+14Eh]
		push	word ptr [si+14Ch]
		push	si
		call	sub_16738
		add	sp, 8
		pop	di
		pop	si
		leave
		retf
Input_ReadJoystickButtonsExtended_AC010		endp

; START OF FUNCTION CHUNK FOR Input_ReadJoystickButtonsExtended_AC010
off_AC122	dw offset loc_AC0D4
		dw offset loc_AC0EC
		dw offset loc_AC0EC
		dw offset loc_AC0EC
		dw offset loc_AC098
		dw offset loc_AC0EC
		dw offset loc_AC0EC
		dw offset loc_AC0EC
		dw offset loc_AC0B6
		dw offset loc_AC0EC
		dw offset loc_AC0EC
		dw offset loc_AC0EC
		dw offset loc_AC07E
; END OF FUNCTION CHUNK FOR Input_ReadJoystickButtonsExtended_AC010

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AC13C		proc far

var_4		= word ptr -4
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0
		mov	[bp+var_2], 0
		push	1
		call	sub_52BE
		pop	cx
		cwd
		idiv	word_775E9
		mov	[bp+var_4], ax
		mov	bx, [bp+var_4]
		cmp	bx, 3
		ja	short loc_AC1DB
		shl	bx, 1
		jmp	cs:off_AC210[bx]	; switch jump

loc_AC16D:
		cmp	word ptr [si+14Ch], 0
		jge	short loc_AC176
		jmp	short loc_AC18E

loc_AC176:
		cmp	word ptr [si+14Ch], 10h
		jge	short loc_AC181
		inc	word ptr [si+14Ch]

loc_AC181:
		mov	[bp+var_1], 1
		jmp	short loc_AC1DB

loc_AC187:
		cmp	word ptr [si+14Ch], 0
		jle	short loc_AC196

loc_AC18E:
		mov	word ptr [si+14Ch], 0
		jmp	short loc_AC181

loc_AC196:
		cmp	word ptr [si+14Ch], 0FFF0h
		jle	short loc_AC181
		dec	word ptr [si+14Ch]
		jmp	short loc_AC181
		jmp	short loc_AC181

loc_AC1A5:
		cmp	word ptr [si+14Eh], 0
		jge	short loc_AC1B4

loc_AC1AC:
		mov	word ptr [si+14Eh], 0
		jmp	short loc_AC1D7

loc_AC1B4:
		cmp	word ptr [si+14Eh], 10h
		jge	short loc_AC1D7
		inc	word ptr [si+14Eh]
		jmp	short loc_AC1D7
		jmp	short loc_AC1D7

loc_AC1C3:
		cmp	word ptr [si+14Eh], 0
		jle	short loc_AC1CC
		jmp	short loc_AC1AC

loc_AC1CC:
		cmp	word ptr [si+14Eh], 0FFF0h
		jle	short loc_AC1D7
		dec	word ptr [si+14Eh]

loc_AC1D7:
		mov	[bp+var_2], 1

loc_AC1DB:
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_AC1EA
		mov	word ptr [si+14Ch], 0

loc_AC1EA:
		mov	al, [bp+var_2]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_AC1F9
		mov	word ptr [si+14Eh], 0

loc_AC1F9:
		push	[bp+arg_2]
		push	word ptr [si+14Eh]
		push	word ptr [si+14Ch]
		push	si
		call	sub_16738
		add	sp, 8
		pop	si
		leave
		retf
sub_AC13C		endp

; START OF FUNCTION CHUNK FOR sub_AC13C
off_AC210	dw offset loc_AC16D
		dw offset loc_AC1A5
		dw offset loc_AC187
		dw offset loc_AC1C3
; END OF FUNCTION CHUNK FOR sub_AC13C
ovr300		ends

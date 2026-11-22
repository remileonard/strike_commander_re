seg047		segment	para public 'CODE' use16
		assume cs:seg047
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0E9h, 32h, 0F7h, 0B8h, 0C1h, 0, 0E9h, 2Ch, 0F7h, 0B8h, 0C2h, 0, 0E9h, 26h, 0F7h

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CRT_ReadTypedValue_8ECC0 (sub_8ECC0 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, appelle
; StreamReader_ReadTyped_63FA1 (seg190).
; ==============================================================================================
CRT_ReadTypedValue_1DC7F		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	large [si+5Dh]
		push	large 5Ah
		push	ds
		mov	ax, si
		add	ax, 0A3h
		push	ax
		push	si
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		mov	[bp+var_2], ax
		mov	word ptr [si+61h], 0
		jmp	short loc_1DCCA

loc_1DCAA:
		mov	bx, [si+61h]
		mov	al, [bx+si+0A3h]
		cbw
		mov	[bp+var_4], ax
		cmp	[bp+var_4], 0Dh
		jnz	short loc_1DCC7
		mov	byte ptr [bx+si+0A5h], 0
		add	dword ptr [si+5Dh], 2
		jmp	short loc_1DCD2

loc_1DCC7:
		inc	word ptr [si+61h]

loc_1DCCA:
		mov	ax, [si+61h]
		cmp	ax, [bp+var_2]
		jl	short loc_1DCAA

loc_1DCD2:
		movsx	eax, word ptr [si+61h]
		add	[si+5Dh], eax
		pop	si
		leave
		retf
CRT_ReadTypedValue_1DC7F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CRT_StringLengthHelper_8ED1F (sub_8ED1F de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine CRT_Strlen et CRT_MemFamily_Prologue.
; ==============================================================================================
CRT_StringLengthHelper_1DCDE		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		call	CRT_Strlen
		pop	cx
		mov	[bp+var_2], ax
		xor	di, di
		jmp	short loc_1DD1D

loc_1DCF9:
		push	[bp+var_2]
		push	[bp+arg_2]
		mov	ax, si
		add	ax, di
		add	ax, 0A3h
		push	ax
		call	sub_2F4A
		add	sp, 6
		or	ax, ax
		jnz	short loc_1DD1C
		mov	ax, si
		add	ax, di
		add	ax, 0A3h
		jmp	short loc_1DD29

loc_1DD1C:
		inc	di

loc_1DD1D:
		mov	ax, [si+61h]
		sub	ax, [bp+var_2]
		cmp	ax, di
		jg	short loc_1DCF9
		xor	ax, ax

loc_1DD29:
		pop	di
		pop	si
		leave
		retf
CRT_StringLengthHelper_1DCDE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CRT_FormatAndValidateStream_8ED6E (sub_8ED6E de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine CRT_Msg_Sprintf3, CRT_Strupr, StreamReader_ValidateState_63DB5/GetCapacity_64062
; (seg190).
; ==============================================================================================
CRT_FormatAndValidateStream_1DD2D		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0FFFFh
		jmp	loc_1DDCE

loc_1DD40:
		push	si
		push	cs
		call	near ptr CRT_ReadTypedValue_1DC7F
		pop	cx
		push	0D9Ah
		push	si
		push	cs
		call	near ptr CRT_StringLengthHelper_1DCDE
		add	sp, 4
		mov	di, ax
		or	di, di
		jz	short loc_1DD6A
		lea	ax, [bp+var_2]
		push	ax
		push	0D9Dh
		push	di
		call	CRT_Msg_Sprintf3
		add	sp, 6
		jmp	loc_1DDF7

loc_1DD6A:
		push	0DA0h
		push	si
		push	cs
		call	near ptr CRT_StringLengthHelper_1DCDE
		add	sp, 4
		mov	di, ax
		or	di, di
		jz	short loc_1DDCE
		add	di, 4
		jmp	short loc_1DD81

loc_1DD80:
		inc	di

loc_1DD81:
		cmp	byte ptr [di], 3Ah
		jz	short loc_1DD80
		cmp	byte ptr [di], 20h
		jz	short loc_1DD80
		cmp	byte ptr [di], 9
		jz	short loc_1DD80
		mov	[bp+var_4], 0
		jmp	short loc_1DDA3

loc_1DD97:
		mov	al, [di]
		mov	bx, [bp+var_4]
		mov	[bx+si+63h], al
		inc	di
		inc	[bp+var_4]

loc_1DDA3:
		cmp	[bp+var_4], 40h
		jge	short loc_1DDBB
		mov	ax, [si+61h]
		cmp	ax, [bp+var_4]
		jle	short loc_1DDBB
		cmp	byte ptr [di], 20h
		jz	short loc_1DDBB
		cmp	byte ptr [di], 0Dh
		jnz	short loc_1DD97

loc_1DDBB:
		mov	ax, si
		add	ax, 63h
		push	ax
		call	CRT_Strupr_30EF
		pop	cx
		mov	bx, [bp+var_4]
		mov	byte ptr [bx+si+63h], 0

loc_1DDCE:
		mov	di, 1
		push	si
		call	StreamReader_ValidateState_6C307
		pop	cx
		or	al, al
		jz	short loc_1DDF0
		push	si
		call	StreamReader_GetCapacity_6C5B4
		push	dx
		push	ax
		pop	eax
		pop	cx
		cmp	eax, [si+5Dh]
		jle	short loc_1DDF0
		dec	di
		jmp	short loc_1DDF0

loc_1DDF0:
		or	di, di
		jnz	short loc_1DDF7
		jmp	loc_1DD40

loc_1DDF7:
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
CRT_FormatAndValidateStream_1DD2D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1DDFE		proc far

var_352		= word ptr -352h
var_15E		= word ptr -15Eh
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 352h
		push	si
		mov	si, [bp+arg_0]
		mov	ax, ss
		mov	ds, ax
		mov	ax, seg seg002
		mov	es, ax
		mov	byte ptr es:4, 0
		cmp	si, 1209h
		jnz	short loc_1DE43
		mov	byte_774C9, 1
		call	sub_682F1
		push	seg seg008
		push	offset loc_5CFF
		push	0DA5h

loc_1DE31:
		call	CRT_Msg_NullPtrAssign
		add	sp, 6
		push	1
		call	CRT_Exit
		pop	cx
		jmp	short loc_1DE95

loc_1DE43:
		cmp	si, 0EEEEh
		jz	short loc_1DE56
		cmp	si, 150Bh
		jz	short loc_1DE56
		cmp	byte_774C9, 0
		jz	short loc_1DE6B

loc_1DE56:
		mov	byte_774C9, 1
		call	sub_682F1
		push	seg seg008
		push	offset loc_5D3C
		push	0DA9h
		jmp	short loc_1DE31

loc_1DE6B:
		push	seg seg008
		push	offset loc_5BAD
		lea	ax, [bp+var_352]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	word_774C7
		push	si
		lea	ax, [bp+var_352]
		push	ax
		lea	ax, [bp+var_15E]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 8

loc_1DE95:
		lea	ax, [bp+var_15E]
		push	ax
		call	Runtime_FatalErrorHandler_68BA2
		pop	cx
sub_1DDFE		endp
seg047		ends

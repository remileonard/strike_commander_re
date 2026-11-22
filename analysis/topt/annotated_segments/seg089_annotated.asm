seg089		segment	para public 'CODE' use16
		assume cs:seg089
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à Video_PrintString_2F848
; (sub_2F848 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; Video_PrintString_5EFD3 (sub_5EFD3 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, référencée via vtable (DATA XREF seg216) — parcourt une
; chaîne terminée par zéro et envoie chaque caractère via sub_1811 (encodage, seg120/142),
; avec conversion LF→CRLF (0x0A injecte un 0x0D avant). Référencée par
; Video_SetModeIfChanged_5E7EA (seg150) et seg158.
; ==============================================================================================
Video_PrintString_2F880		proc far

var_22		= word ptr -22h
var_12		= word ptr -12h
var_10		= byte ptr -10h
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 22h
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [bp+var_12+1], 0Eh
		mov	[bp+var_10], 0
		jmp	short loc_2F8B8

loc_2F894:
		mov	al, [bp+var_1]
		mov	byte ptr [bp+var_12], al
		lea	ax, [bp+var_22]
		push	ax
		lea	ax, [bp+var_12]
		push	ax
		push	10h
		call	CRT_InstallProtectedHandler
		add	sp, 6
		cmp	[bp+var_1], 0Ah
		jnz	short loc_2F8B8
		mov	[bp+var_1], 0Dh
		jmp	short loc_2F894

loc_2F8B8:
		mov	bx, si
		inc	si
		mov	al, [bx]
		mov	[bp+var_1], al
		or	al, al
		jnz	short loc_2F894
		pop	si
		leave
		retf
Video_PrintString_2F880		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2F8C7		proc far

var_10		= word ptr -10h

		push	bp
		mov	bp, sp
		sub	sp, 10h
		mov	byte ptr [bp+var_10+1], 0
		lea	ax, [bp+var_10]
		push	ax
		push	ax
		push	16h
		call	CRT_InstallProtectedHandler
		add	sp, 6
		mov	al, byte ptr [bp+var_10]
		mov	ah, 0
		mov	dx, ax
		or	dx, dx
		jnz	short loc_2F8F5
		mov	al, byte ptr [bp+var_10+1]
		mov	ah, 0
		or	ax, 100h
		mov	dx, ax

loc_2F8F5:
		mov	ax, dx
		leave
		retf
sub_2F8C7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2F8F9		proc far

var_20		= word ptr -20h
var_1A		= byte ptr -1Ah
var_19		= byte ptr -19h
var_10		= word ptr -10h
var_D		= byte ptr -0Dh
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 20h
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [bp+var_10+1], 3
		mov	al, [bp+arg_2]
		mov	[bp+var_D], al
		lea	ax, [bp+var_20]
		push	ax
		lea	ax, [bp+var_10]
		push	ax
		push	10h
		call	CRT_InstallProtectedHandler
		add	sp, 6
		mov	al, [bp+var_19]
		mov	[si], al
		mov	al, [bp+var_1A]
		mov	[si+1], al
		pop	si
		leave
		retf
sub_2F8F9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2F92D		proc far

var_20		= word ptr -20h
var_10		= word ptr -10h
var_D		= byte ptr -0Dh
var_A		= byte ptr -0Ah
var_9		= byte ptr -9
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 20h
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [bp+var_10+1], 2
		mov	al, [bp+arg_2]
		mov	[bp+var_D], al
		mov	al, [si]
		mov	[bp+var_9], al
		mov	al, [si+1]
		mov	[bp+var_A], al
		lea	ax, [bp+var_20]
		push	ax
		lea	ax, [bp+var_10]
		push	ax
		push	10h
		call	CRT_InstallProtectedHandler
		add	sp, 6
		pop	si
		leave
		retf
sub_2F92D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2F961		proc far

var_6		= byte ptr -6
var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 6
		mov	[bp+var_6], 2
		push	0
		lea	ax, [bp+var_2]
		push	ax
		push	cs
		call	near ptr sub_2F8F9
		add	sp, 4
		mov	byte ptr [bp+var_4+1], 0
		mov	byte ptr [bp+var_4], 31h
		push	0
		lea	ax, [bp+var_4]
		push	ax
		push	cs
		call	near ptr sub_2F92D
		add	sp, 4
		push	0
		lea	ax, [bp+var_4]
		push	ax
		push	cs
		call	near ptr sub_2F8F9
		add	sp, 4
		cmp	byte ptr [bp+var_4], 31h
		jz	short loc_2F9CC
		mov	[bp+var_6], 1
		mov	byte ptr [bp+var_4], 27h
		push	0
		lea	ax, [bp+var_4]
		push	ax
		push	cs
		call	near ptr sub_2F92D
		add	sp, 4
		push	0
		lea	ax, [bp+var_4]
		push	ax
		push	cs
		call	near ptr sub_2F8F9
		add	sp, 4
		cmp	byte ptr [bp+var_4], 31h
		jz	short loc_2F9CC
		mov	[bp+var_6], 0

loc_2F9CC:
		push	0
		lea	ax, [bp+var_2]
		push	ax
		push	cs
		call	near ptr sub_2F92D
		add	sp, 4
		mov	al, [bp+var_6]
		leave
		retf
sub_2F961		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2F9DE		proc far

var_20		= word ptr -20h
var_10		= word ptr -10h
var_E		= byte ptr -0Eh
arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 20h
		mov	byte ptr [bp+var_10+1], 12h
		mov	[bp+var_E], 30h
		mov	al, [bp+arg_0]
		mov	byte ptr [bp+var_10], al
		lea	ax, [bp+var_20]
		push	ax
		lea	ax, [bp+var_10]
		push	ax
		push	10h
		call	CRT_InstallProtectedHandler
		add	sp, 6
		leave
		retf
sub_2F9DE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2FA06		proc far

var_22		= word ptr -22h
var_12		= word ptr -12h
var_C		= byte ptr -0Ch
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 22h
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [bp+var_12+1], 2
		jmp	short loc_2FA3A

loc_2FA16:
		mov	al, [bp+var_1]
		mov	[bp+var_C], al
		lea	ax, [bp+var_22]
		push	ax
		lea	ax, [bp+var_12]
		push	ax
		push	21h
		call	CRT_InstallProtectedHandler
		add	sp, 6
		cmp	[bp+var_1], 0Ah
		jnz	short loc_2FA3A
		mov	[bp+var_1], 0Dh
		jmp	short loc_2FA16

loc_2FA3A:
		mov	bx, si
		inc	si
		mov	al, [bx]
sub_2FA06		endp

; START OF FUNCTION CHUNK FOR sub_2FA06
		db 88h
; END OF FUNCTION CHUNK FOR sub_2FA06
seg089		ends

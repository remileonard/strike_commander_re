seg100		segment	byte public 'CODE' use16
		assume cs:seg100
		;org 8
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Video_PrintString_5EFD3
; (sub_5EFD3 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, référencée via vtable (DATA XREF seg216) — parcourt une chaîne terminée par zéro
; et envoie chaque caractère via sub_1811 (encodage, seg120/142), avec conversion LF→CRLF
; (0x0A injecte un 0x0D avant). Référencée par Video_SetModeIfChanged_5E7EA (seg150) et
; seg158.
; ==============================================================================================
Video_PrintString_2F848	proc far		; CODE XREF: Video_SetModeIfChanged_2F05F+27P
					; seg103:007BP	...

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
		mov	byte ptr [bp+var_12+1],	0Eh
		mov	[bp+var_10], 0
		jmp	short loc_2F880
; ���������������������������������������������������������������������������

loc_2F85C:				; CODE XREF: Video_PrintString_2F848+36j
					; Video_PrintString_2F848+42j
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
		jnz	short loc_2F880
		mov	[bp+var_1], 0Dh
		jmp	short loc_2F85C
; ���������������������������������������������������������������������������

loc_2F880:				; CODE XREF: Video_PrintString_2F848+12j
					; Video_PrintString_2F848+30j
		mov	bx, si
		inc	si
		mov	al, [bx]
		mov	[bp+var_1], al
		or	al, al
		jnz	short loc_2F85C
		pop	si
		leave
		retf
Video_PrintString_2F848	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 10h
		mov	byte ptr [bp-0Fh], 0
		lea	ax, [bp-10h]
		push	ax
		push	ax
		push	16h
		call	CRT_InstallProtectedHandler
		add	sp, 6
		mov	al, [bp-10h]
		mov	ah, 0
		mov	dx, ax
		or	dx, dx
		jnz	short loc_2F8BD
		mov	al, [bp-0Fh]
		mov	ah, 0
		or	ax, 100h
		mov	dx, ax

loc_2F8BD:				; CODE XREF: seg100:0071j
		mov	ax, dx
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Video_PrintChar_5F04C
; (sub_5F04C de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, appelle sub_1811 — impression d'un caractère unique.
; ==============================================================================================
Video_PrintChar_2F8C1	proc far		; CODE XREF: seg100:00FAp seg100:011Cp ...

var_20		= word ptr -20h
var_1A		= byte ptr -1Ah
var_19		= byte ptr -19h
var_F		= byte ptr -0Fh
var_D		= byte ptr -0Dh
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 20h
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_F], 3
		mov	al, [bp+arg_2]
		mov	[bp+var_D], al
		lea	ax, [bp+var_20]
		push	ax
		lea	ax, [bp-10h]
		push	ax
		push	10h
		call	CRT_InstallProtectedHandler
		add	sp, 6
		mov	al, [bp+var_19]
		mov	[si], al
		mov	al, [bp+var_1A]
		mov	[si+1],	al
		pop	si
		leave
		retf
Video_PrintChar_2F8C1	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Video_PrintCharVariant_5F080 (sub_5F080 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, appelle sub_1811 — variante d'impression de
; caractère.
; ==============================================================================================
Video_PrintCharVariant_2F8F5	proc far		; CODE XREF: seg100:010Fp seg100:0137p ...

var_20		= word ptr -20h
var_F		= byte ptr -0Fh
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
		mov	[bp+var_F], 2
		mov	al, [bp+arg_2]
		mov	[bp+var_D], al
		mov	al, [si]
		mov	[bp+var_9], al
		mov	al, [si+1]
		mov	[bp+var_A], al
		lea	ax, [bp+var_20]
		push	ax
		lea	ax, [bp-10h]
		push	ax
		push	10h
		call	CRT_InstallProtectedHandler
		add	sp, 6
		pop	si
		leave
		retf
Video_PrintCharVariant_2F8F5	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 6
		mov	byte ptr [bp-6], 2
		push	0
		lea	ax, [bp-2]
		push	ax
		push	cs
		call	near ptr Video_PrintChar_2F8C1
		add	sp, 4
		mov	byte ptr [bp-3], 0
		mov	byte ptr [bp-4], 31h ; '1'
		push	0
		lea	ax, [bp-4]
		push	ax
		push	cs
		call	near ptr Video_PrintCharVariant_2F8F5
		add	sp, 4
		push	0
		lea	ax, [bp-4]
		push	ax
		push	cs
		call	near ptr Video_PrintChar_2F8C1
		add	sp, 4
		cmp	byte ptr [bp-4], 31h ; '1'
		jz	short loc_2F994
		mov	byte ptr [bp-6], 1
		mov	byte ptr [bp-4], 27h ; '''
		push	0
		lea	ax, [bp-4]
		push	ax
		push	cs
		call	near ptr Video_PrintCharVariant_2F8F5
		add	sp, 4
		push	0
		lea	ax, [bp-4]
		push	ax
		push	cs
		call	near ptr Video_PrintChar_2F8C1
		add	sp, 4
		cmp	byte ptr [bp-4], 31h ; '1'
		jz	short loc_2F994
		mov	byte ptr [bp-6], 0

loc_2F994:				; CODE XREF: seg100:0126j seg100:014Ej
		push	0
		lea	ax, [bp-2]
		push	ax
		push	cs
		call	near ptr Video_PrintCharVariant_2F8F5
		add	sp, 4
		mov	al, [bp-6]
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 20h
		mov	byte ptr [bp-0Fh], 12h
		mov	byte ptr [bp-0Eh], 30h ; '0'
		mov	al, [bp+6]
		mov	[bp-10h], al
		lea	ax, [bp-20h]
		push	ax
		lea	ax, [bp-10h]
		push	ax
		push	10h
		call	CRT_InstallProtectedHandler
		add	sp, 6
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 22h
		push	si
		mov	si, [bp+6]
		mov	byte ptr [bp-11h], 2
		jmp	short loc_2FA02
; ���������������������������������������������������������������������������

loc_2F9DE:				; CODE XREF: seg100:01C0j seg100:01CCj
		mov	al, [bp-1]
		mov	[bp-0Ch], al
		lea	ax, [bp-22h]
		push	ax
		lea	ax, [bp-12h]
		push	ax
		push	21h ; '!'
		call	CRT_InstallProtectedHandler
		add	sp, 6
		cmp	byte ptr [bp-1], 0Ah
		jnz	short loc_2FA02
		mov	byte ptr [bp-1], 0Dh
		jmp	short loc_2F9DE
; ���������������������������������������������������������������������������

loc_2FA02:				; CODE XREF: seg100:019Cj seg100:01BAj
		mov	bx, si
		inc	si
		mov	al, [bx]
		mov	[bp-1],	al
		or	al, al
		jnz	short loc_2F9DE
		pop	si
		leave
		retf
seg100		ends

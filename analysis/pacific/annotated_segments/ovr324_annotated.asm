ovr324		segment	para public 'OVERLAY' use16
		assume cs:ovr324
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B1C00		proc far

var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= dword ptr -1Ch
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= dword ptr -14h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 20h
		push	si
		push	di
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0A4h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_B1C45
		push	ax
		call	sub_3B1B6
		pop	cx
		mov	word ptr [si], 2A22h
		mov	word ptr [si+53h], 0
		mov	word ptr [si+55h], 0
		push	large [bp+var_4]
		push	si
		nop
		push	cs
		call	near ptr sub_B1DD9
		add	sp, 6
		mov	ax, si
		jmp	short loc_B1C47

loc_B1C45:
		mov	ax, si

loc_B1C47:
		mov	si, ax
		push	ax
		push	large [bp+arg_0]
		call	sub_741DE
		add	sp, 6
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 49h
		mov	[bp+var_6], ax
		mov	[bp+var_8], dx
		les	bx, [bp+var_8]
		mov	eax, es:[bx]
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	[si+8Bh], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 4Dh
		mov	[bp+var_E], ax
		mov	[bp+var_10], dx
		les	bx, [bp+var_10]
		mov	eax, es:[bx]
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	[si+8Fh], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 51h
		mov	[bp+var_16], ax
		mov	[bp+var_18], dx
		les	bx, [bp+var_18]
		mov	eax, es:[bx]
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		mov	[si+93h], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 55h
		mov	[bp+var_1E], ax
		mov	[bp+var_20], dx
		les	di, [bp+var_20]
		mov	eax, es:[di]
		mov	[si+97h], eax
		mov	eax, es:[di+4]
		mov	[si+9Bh], eax
		mov	eax, es:[di+8]
		mov	[si+9Fh], eax
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
sub_B1C00		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B1CF4		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		push	si
		push	large [bp+arg_0]
		call	sub_3B14C
		add	sp, 6
		push	0
		push	large 444F534Ch
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_B1D20
		jmp	loc_B1DCD

loc_B1D20:
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+49h], eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+4Dh], eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+51h], eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+55h], eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+59h], eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+5Dh], eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+61h], eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+65h], eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+69h], eax
		jmp	short loc_B1DD6

loc_B1DCD:
		push	0C075h
		call	sub_1DDFE
		pop	cx

loc_B1DD6:
		pop	si
		pop	bp
		retf
sub_B1CF4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B1DD9		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	0
		mov	ax, si
		add	ax, 55h
		push	ax
		call	SetReference16
		add	sp, 4
		push	0
		mov	ax, si
		add	ax, 53h
		push	ax
		call	SetReference16
		add	sp, 4
		xor	eax, eax
		mov	[si+63h], eax
		mov	[si+5Fh], eax
		mov	[si+5Bh], eax
		mov	ax, si
		add	ax, 5Bh
		xor	eax, eax
		mov	[si+6Fh], eax
		mov	[si+6Bh], eax
		mov	[si+67h], eax
		mov	ax, si
		add	ax, 67h
		mov	byte ptr [si+52h], 0
		mov	byte ptr [si+0A3h], 0
		mov	eax, [bp+arg_2]
		mov	[bp+var_4], eax
		push	large [bp+var_4]
		push	si
		call	sub_36985
		add	sp, 6
		mov	ax, si
		add	ax, 2Dh
		push	ax
		call	Matrix_BuildFromAngle_58B3B
		pop	cx
		push	0
		push	si
		call	sub_7434A
		add	sp, 4
		or	byte ptr [si+2], 10h
		les	bx, word ptr [bp+var_4]
		mov	al, es:[bx+48h]
		push	ax
		push	si
		call	sub_7434A
		add	sp, 4
		pop	si
		leave
		retf
sub_B1DD9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Targeting_DestructWithWeakRefs (sub_433B7 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,45L
; — destructeur (type 0x28FC) invalidant deux références faibles (+0x57/+0x55 via
; WeakRef_InvalidateIfSet) puis destructeur parent (sub_3DC8D) : destructeur composé du
; système de verrouillage de cible (avec références faibles).
; ==============================================================================================
Targeting_DestructWithWeakRefs		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_B1EBB
		mov	word ptr [si], 2A22h
		mov	ax, si
		add	ax, 55h
		push	ax
		call	WeakRef_InvalidateIfSet
		pop	cx
		mov	ax, si
		add	ax, 53h
		push	ax
		call	WeakRef_InvalidateIfSet
		pop	cx
		push	0
		push	si
		call	sub_3B2B9
		add	sp, 4
		test	di, 1
		jz	short loc_B1EBB
		push	si
		call	sub_3B2
		pop	cx

loc_B1EBB:
		pop	di
		pop	si
		pop	bp
		retf
Targeting_DestructWithWeakRefs		endp
ovr324		ends

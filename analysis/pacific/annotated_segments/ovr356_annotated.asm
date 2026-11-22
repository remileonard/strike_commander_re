ovr356		segment	para public 'OVERLAY' use16
		assume cs:ovr356
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C5DE0		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		push	[bp+arg_2]
		call	CRT_Strdup
		pop	cx
		mov	[bp+var_2], ax
		mov	si, [bp+var_2]
		mov	[bp+var_4], 4
		jmp	short loc_C5E37

loc_C5DFE:
		cmp	dx, 28h
		jle	short loc_C5E15
		mov	di, 28h
		jmp	short loc_C5E09

loc_C5E08:
		dec	di

loc_C5E09:
		mov	bx, di
		cmp	byte ptr [bx+si], 20h
		jnz	short loc_C5E08
		mov	byte ptr [bx+si], 0
		jmp	short loc_C5E18

loc_C5E15:
		mov	di, dx
		dec	di

loc_C5E18:
		push	si
		push	2
		push	[bp+var_4]
		push	39D8h
		push	[bp+arg_0]
		call	sub_75D4A
		add	sp, 0Ah
		add	[bp+var_4], 0Fh
		mov	ax, di
		add	ax, si
		inc	ax
		mov	si, ax

loc_C5E37:
		push	si
		call	CRT_Strlen
		pop	cx
		mov	dx, ax
		or	ax, ax
		jnz	short loc_C5DFE
		push	[bp+var_2]
		call	sub_65A86
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_C5DE0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C5E51		proc far

var_2C		= word ptr -2Ch
var_F		= word ptr -0Fh
var_D		= byte ptr -0Dh
var_9		= byte ptr -9
var_8		= word ptr -8
var_6		= byte ptr -6
var_2		= word ptr -2
arg_0		= dword ptr  6
arg_4		= byte ptr  0Ah
arg_5		= byte ptr  0Bh
arg_A		= dword ptr  10h
arg_E		= byte ptr  14h
arg_F		= byte ptr  15h
arg_10		= dword ptr  16h
arg_14		= word ptr  1Ah
arg_16		= word ptr  1Ch
arg_18		= word ptr  1Eh
arg_1A		= word ptr  20h
arg_1C		= word ptr  22h
arg_1E		= word ptr  24h
arg_20		= word ptr  26h
arg_22		= word ptr  28h
arg_24		= word ptr  2Ah
arg_26		= word ptr  2Ch
arg_28		= byte ptr  2Eh

		push	bp
		mov	bp, sp
		sub	sp, 2Ch
		push	si
		push	di
		mov	si, [bp+arg_22]
		push	[bp+arg_20]
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_2C]
		push	ax
		call	sub_60273
		add	sp, 8
		push	large 0
		lea	ax, word ptr [bp+arg_0]
		push	ax
		push	0
		call	Layer_Construct_66985
		add	sp, 8
		mov	[bp+var_2], ax
		push	80h
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 5
		mov	ebx, 8000h
		cdq
		idiv	ebx
		add	ax, 9Eh
		push	ax
		lea	ax, word ptr [bp+arg_A]
		push	ax
		push	0
		call	sub_61AAE
		add	sp, 8
		mov	di, ax
		push	[bp+arg_14]
		push	ax
		call	TalkingHead_SetBaseFrame_61EF1
		add	sp, 4
		push	[bp+arg_16]
		push	di
		call	PlayerComponent_LoadFieldsWithRetryEWrapper_61E18
		add	sp, 4
		push	[bp+var_2]
		lea	ax, [bp+var_2C]
		push	ax
		call	LayerGroup_Add_6656E
		add	sp, 4
		push	di
		lea	ax, [bp+var_2C]
		push	ax
		call	LayerGroup_Add_6656E
		add	sp, 4
		push	100h
		push	0
		lea	ax, [bp+var_8]
		push	ax
		call	sub_76245
		add	sp, 6
		mov	di, [bp+arg_24]
		push	word ptr [di]
		mov	al, [di+2]
		push	ax
		push	di
		lea	ax, [bp+var_8]
		push	ax
		call	sub_76272
		add	sp, 8
		mov	di, [bp+arg_26]
		push	word ptr [di]
		mov	al, [di+2]
		push	ax
		push	di
		lea	ax, [bp+var_8]
		push	ax
		call	sub_76272
		add	sp, 8
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	0
		push	[bp+var_8]
		mov	al, [bp+var_6]
		push	ax
		lea	ax, [bp+var_8]
		push	ax
		call	sub_76259
		add	sp, 8
		mov	al, [bp+arg_28]
		push	ax
		push	word ptr [si+14h]
		mov	bx, [si+14h]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		push	[bp+arg_18]
		push	si
		push	cs
		call	near ptr sub_C5DE0
		jmp	short loc_C5FB8

loc_C5F63:
		call	sub_7575F
		or	al, al
		jnz	short loc_C5FD6
		cmp	[bp+arg_1C], 0
		jle	short loc_C5FAD
		mov	ax, [bp+var_F]
		cmp	ax, [bp+arg_1C]
		jnz	short loc_C5F90
		push	0
		push	si
		mov	bx, [si]
		call	dword ptr [bx+1Ch]
		add	sp, 4
		push	[bp+arg_1A]
		push	si
		push	cs
		call	near ptr sub_C5DE0
		add	sp, 4

loc_C5F90:
		mov	al, byte_7CAC3
		mov	ah, 0
		mov	[bp+var_9], al
		cmp	[bp+var_9], 10h
		jnz	short loc_C5FA7
		push	0CCDEh
		call	sub_1DDFE
		pop	cx

loc_C5FA7:
		cmp	[bp+var_9], 31h
		jz	short loc_C5FD6

loc_C5FAD:
		push	1
		lea	ax, [bp+var_2C]
		push	ax
		call	sub_75BF0

loc_C5FB8:
		add	sp, 4
		mov	ax, [bp+var_F]
		cmp	ax, [bp+arg_1E]
		jnb	short loc_C5FC9
		cmp	[bp+var_D], 0
		jz	short loc_C5FCE

loc_C5FC9:
		mov	ax, 1
		jmp	short loc_C5FD0

loc_C5FCE:
		xor	ax, ax

loc_C5FD0:
		mov	ah, 0
		or	ax, ax
		jz	short loc_C5F63

loc_C5FD6:
		lea	ax, [bp+var_8]
		push	ax
		call	sub_7627C
		pop	cx
		push	0
		lea	ax, [bp+var_2C]
		push	ax
		call	Scene_Destruct_666E6
		add	sp, 4
		cmp	[bp+arg_F], 0
		jz	short loc_C6012
		cmp	[bp+arg_A], 0
		jz	short loc_C6012
		push	0
		mov	al, [bp+arg_E]
		push	ax
		lea	ax, word ptr [bp+arg_A]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_C6012

loc_C6012:
		mov	[bp+arg_A], 0
		mov	[bp+arg_F], 0
		mov	[bp+arg_10], 0
		cmp	[bp+arg_5], 0
		jz	short loc_C604A
		cmp	[bp+arg_0], 0
		jz	short loc_C604A
		push	0
		mov	al, [bp+arg_4]
		push	ax
		lea	ax, word ptr [bp+arg_0]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_C604A

loc_C604A:
		pop	di
		pop	si
		leave
		retf
sub_C5E51		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C604E		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	0
		push	[bp+arg_0]
		mov	al, [bp+arg_2]
		push	ax
		lea	ax, [bp+arg_0]
		push	ax
		call	sub_76259
		add	sp, 8
		lea	ax, [bp+arg_0]
		push	ax
		call	sub_7627C
		pop	cx
		pop	bp
		retf
sub_C604E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C6080		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_4]
		mov	[si], dx
		mov	ax, dx
		imul	[bp+arg_2]
		push	ax
		call	sub_6596D
		pop	cx
		mov	[si+2], ax
		pop	si
		pop	bp
		retf
sub_C6080		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Palette_Destruct_2D048 (sub_2D048 de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-17.
; Libère le tableau RVB, puis l'objet si bit 1 de l'argument.
; ==============================================================================================
Palette_Destruct_C609E		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_C60C9
		cmp	word ptr [si+2], 0
		jz	short loc_C60BC
		push	word ptr [si+2]
		call	sub_65A86
		pop	cx

loc_C60BC:
		test	di, 1
		jz	short loc_C60C9
		push	si
		call	sub_3B2
		pop	cx

loc_C60C9:
		pop	di
		pop	si
		pop	bp
		retf
Palette_Destruct_C609E		endp
ovr356		ends

ovr261		segment	para public 'OVERLAY' use16
		assume cs:ovr261
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Controller_InitStructDefault (sub_28C99 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far,30L — remplit une zone mémoire (0x19 octets)
; de zéros et pré-remplit une sous-zone (offset+0x19) avec la constante 0x7D00000 (memset via
; sub_22E1) : initialisation d'une structure de contrôleur/axe avec valeur de calibration par
; défaut.
; ==============================================================================================
Controller_InitStructDefault		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	large 7D00000h
		mov	ax, si
		add	ax, 19h
		push	ax
		call	CRT_Memset_Public
		add	sp, 6
		xor	ax, ax
		jmp	short loc_9DDD5

loc_9DDCF:
		mov	bx, ax
		mov	byte ptr [bx+si], 0
		inc	ax

loc_9DDD5:
		cmp	ax, 19h
		jl	short loc_9DDCF
		pop	si
		pop	bp
		retf
Controller_InitStructDefault		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9DDDD		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	di, 19h
		jnb	short loc_9DE0D
		push	large 500000h
		mov	ax, di
		imul	ax, ax, 50h
		mov	dx, si
		add	dx, ax
		add	dx, 19h
		push	dx
		call	CRT_Memset_Public
		add	sp, 6
		mov	bx, di
		mov	byte ptr [bx+si], 0

loc_9DE0D:
		pop	di
		pop	si
		pop	bp
		retf
sub_9DDDD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9DE11		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_6]
		cmp	word_77535, 0
		jz	short loc_9DE70
		or	di, di
		jz	short loc_9DE70
		cmp	byte ptr [di], 0
		jz	short loc_9DE70
		cmp	[bp+arg_4], 19h
		jnb	short loc_9DE70
		cmp	[bp+arg_2], 50h
		jnb	short loc_9DE70
		push	di
		call	CRT_Strlen
		pop	cx
		mov	dx, ax
		mov	bx, 50h
		sub	bx, [bp+arg_2]
		cmp	dx, bx
		jle	short loc_9DE4D
		mov	dx, bx

loc_9DE4D:
		push	dx
		push	di
		mov	ax, [bp+arg_4]
		imul	ax, ax, 50h
		add	ax, [bp+arg_2]
		mov	dx, si
		add	dx, ax
		add	dx, 19h
		push	dx
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	bx, si
		add	bx, [bp+arg_4]
		mov	byte ptr [bx], 1

loc_9DE70:
		pop	di
		pop	si
		pop	bp
		retf
sub_9DE11		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9DE74		proc far

var_70		= word ptr -70h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_11		= byte ptr -11h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 70h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_1E], 0
		mov	[bp+var_1C], 0
		mov	[bp+var_11], 0
		cmp	[bp+arg_2], 0
		jz	short loc_9DED6
		mov	ax, word_77535
		add	ax, 2
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	TextFormat_ApplyStyleAttribute_67C41
		add	sp, 4
		mov	bx, word_77535
		mov	al, [bx+17h]
		mov	ah, 0
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		push	ax
		mov	ax, word_77535
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_67C41
		add	sp, 4
		push	0
		push	word_77535
		call	sub_75D09
		add	sp, 4

loc_9DED6:
		mov	[bp+var_6], 0
		mov	ax, si
		add	ax, 19h
		mov	[bp+var_8], ax
		mov	[bp+var_A], 0
		jmp	loc_9DF82

loc_9DEEB:
		mov	bx, [bp+var_A]
		cmp	byte ptr [bx+si], 0
		jnz	short loc_9DEF6
		jmp	loc_9DF77

loc_9DEF6:
		mov	di, [bp+var_8]
		mov	[bp+var_C], 0
		jmp	short loc_9DF71

loc_9DF00:
		cmp	byte ptr [di], 0
		jz	short loc_9DF6D
		mov	ax, [bp+var_C]
		shl	ax, 2
		mov	[bp+var_E], ax
		mov	[bp+var_10], 0
		inc	[bp+var_C]
		jmp	short loc_9DF23

loc_9DF18:
		inc	[bp+var_C]
		mov	ax, [bp+var_C]
		cmp	ax, 50h
		jz	short loc_9DF2E

loc_9DF23:
		inc	[bp+var_10]
		mov	bx, [bp+var_10]
		cmp	byte ptr [bx+di], 0
		jnz	short loc_9DF18

loc_9DF2E:
		push	[bp+var_6]
		push	[bp+var_E]
		push	word_77535
		call	sub_75D27
		add	sp, 6
		push	[bp+var_10]
		push	di
		lea	ax, [bp+var_70]
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		add	di, [bp+var_10]
		lea	ax, [bp+var_70]
		mov	bx, [bp+var_10]
		add	bx, ax
		mov	byte ptr [bx], 0
		push	ax
		push	word_77535
		call	sub_75D4A
		add	sp, 4
		jmp	short loc_9DF71

loc_9DF6D:
		inc	[bp+var_C]
		inc	di

loc_9DF71:
		cmp	[bp+var_C], 50h
		jl	short loc_9DF00

loc_9DF77:
		inc	[bp+var_A]
		add	[bp+var_6], 8
		add	[bp+var_8], 50h

loc_9DF82:
		cmp	[bp+var_A], 19h
		jge	short loc_9DF8B
		jmp	loc_9DEEB

loc_9DF8B:
		push	si
		push	cs
		call	near ptr Controller_InitStructDefault
		pop	cx
		cmp	[bp+arg_2], 0
		jz	short loc_9DFBA
		lea	ax, [bp+var_1E]
		push	ax
		mov	ax, word_77535
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_67C41
		add	sp, 4
		mov	al, byte ptr [bp+var_2]
		push	ax
		push	word_77535
		call	sub_75D09
		add	sp, 4

loc_9DFBA:
		lea	ax, [bp+var_1E]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_9DE74		endp
ovr261		ends

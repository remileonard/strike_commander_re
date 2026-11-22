ovr369		segment	para public 'OVERLAY' use16
		assume cs:ovr369
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_CE310		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	di, [bp+arg_2]
		mov	si, 1
		jmp	short loc_CE37E

loc_CE320:
		mov	bx, si
		shl	bx, 1
		mov	bx, [bx+di]
		mov	ax, [bx]
		mov	[bp+var_2], ax
		mov	cx, 6
		mov	bx, offset word_CE387

loc_CE331:
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_2]
		jz	short loc_CE340
		add	bx, 2
		loop	short loc_CE331
		jmp	short loc_CE37D

loc_CE340:
		jmp	word ptr cs:[bx+0Ch] ; switch jump

loc_CE344:
		push	1B39h
		call	GameVar_SetFlag_5646D
		pop	cx
		jmp	short loc_CE37D

loc_CE34F:
		push	1B38h
		call	GameVar_SetFlag_5646D
		pop	cx
		mov	bx, si
		shl	bx, 1
		mov	bx, [bx+di]
		mov	al, [bx+2]
		add	al, 0D0h
		push	ax
		push	word_7D14D
		call	sub_757F4
		jmp	short loc_CE37A

loc_CE36F:
		push	1
		push	word_7D14D
		call	sub_75D85

loc_CE37A:
		add	sp, 4

loc_CE37D:
		inc	si

loc_CE37E:
		cmp	si, [bp+arg_0]
		jl	short loc_CE320
		pop	di
		pop	si
		leave
		retf
sub_CE310		endp

; START OF FUNCTION CHUNK FOR sub_CE310
word_CE387	dw 432Ah
		dw 4B2Ah
		dw 4D2Ah
		dw 632Ah
		dw 6B2Ah
		dw 6D2Ah
off_CE393	dw offset loc_CE344
		dw offset loc_CE36F
		dw offset loc_CE34F
		dw offset loc_CE344
		dw offset loc_CE36F
		dw offset loc_CE34F
; END OF FUNCTION CHUNK FOR sub_CE310

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_CE39F		proc far

var_5E		= word ptr -5Eh
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 5Eh
		push	si
		push	di
		cmp	word_79E6F, 0
		jz	short loc_CE3BF
		push	0FFFFh
		push	3C3Ch
		push	word_79E6F
		call	sub_75419
		add	sp, 6

loc_CE3BF:
		mov	byte_7D13E, 0
		mov	word_7D146, 13Fh
		mov	word_7D148, 63h
		xor	ax, ax
		mov	word_7D190, ax
		mov	word_7D18E, ax
		push	53h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	offset aOptfont
		push	3
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_5E]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	2
		lea	ax, [bp+var_5E]
		push	ax
		call	TextRenderer_LoadResourceFile_6E338
		add	sp, 4
		mov	word ptr [bp+var_E+2], dx
		mov	word ptr [bp+var_E], ax
		mov	eax, [bp+var_E]
		mov	[bp+var_A], eax
		mov	[bp+var_6], 2
		mov	[bp+var_5], 1
		mov	[bp+var_4], 0
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	0
		call	GlyphObject_ConstructWithBuffer_69161
		add	sp, 4
		mov	di, ax
		mov	word ptr [di+10h], 0
		mov	word ptr [di+12h], 0
		push	2Dh
		push	ax
		mov	bx, [di]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	[di+14h], ax
		push	7C7h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_CE46C
		jmp	loc_CE50E

loc_CE46C:
		mov	word ptr [si], 909h
		xor	ax, ax
		mov	[si+4], ax
		mov	[si+2], ax
		mov	word ptr [si], 3C62h
		push	seg stub369
		push	offset sub_75AAA
		push	large 10005h
		push	3
		mov	ax, si
		add	ax, 556h
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		push	seg stub369
		push	offset sub_75AA5
		push	large 10009h
		push	1Bh
		mov	ax, si
		add	ax, 56Bh
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	byte ptr [si+65Eh], 0
		mov	byte ptr [si+65Fh], 0
		mov	byte ptr [si+673h], 0
		mov	byte ptr [si+687h], 0
		push	100h
		push	0
		mov	ax, si
		add	ax, 6A9h
		push	ax
		call	sub_76245
		add	sp, 6
		push	100h
		push	0
		mov	ax, si
		add	ax, 6AEh
		push	ax
		call	sub_76245
		add	sp, 6
		push	100h
		push	0
		mov	ax, si
		add	ax, 6B3h
		push	ax
		call	sub_76245
		add	sp, 6
		push	3C4Dh
		call	sub_51B93
		pop	cx
		mov	ax, si
		jmp	short loc_CE510

loc_CE50E:
		mov	ax, si

loc_CE510:
		mov	word_7D14D, ax
		push	0
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	di
		push	ax
		call	sub_75845
		add	sp, 0Ah
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_CE310
		add	sp, 4
		push	word_7D14D
		call	sub_61606
		pop	cx
		cmp	word_7D14D, 0
		jz	short loc_CE5A8
		push	word_7D14D
		call	sub_603AB
		pop	cx
		push	word_7D14D
		call	sub_7580D
		pop	cx
		mov	ax, word_7D14D
		add	ax, 6B3h
		push	ax
		call	sub_7627C
		pop	cx
		mov	ax, word_7D14D
		add	ax, 6AEh
		push	ax
		call	sub_7627C
		pop	cx
		mov	ax, word_7D14D
		add	ax, 6A9h
		push	ax
		call	sub_7627C
		pop	cx
		mov	bx, word_7D14D
		mov	word ptr [bx], 3C62h
		push	bx
		call	sub_603AB
		pop	cx
		mov	bx, word_7D14D
		mov	word ptr [bx], 909h
		push	bx
		call	sub_68B0D
		pop	cx
		push	word_7D14D
		call	sub_3B2
		pop	cx
		jmp	short loc_CE5A8

loc_CE5A8:
		or	di, di
		jz	short loc_CE5B8
		push	3
		push	di
		mov	bx, [di]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_CE5B8

loc_CE5B8:
		cmp	word_7D190, 0
		jz	short loc_CE5C9
		push	word_7D190
		call	sub_3B2
		pop	cx

loc_CE5C9:
		cmp	word_7D18E, 0
		jz	short loc_CE5DA
		push	word_7D18E
		call	sub_3B2
		pop	cx

loc_CE5DA:
		cmp	[bp+var_5], 0
		jz	short loc_CE5FE
		cmp	[bp+var_A], 0
		jz	short loc_CE5FE
		push	0
		mov	al, [bp+var_6]
		push	ax
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_CE5FE

loc_CE5FE:
		mov	[bp+var_A], 0
		mov	[bp+var_5], 0
		mov	[bp+var_4], 0
		mov	byte_79E75, 0
		cmp	word_79E71, 0
		jz	short loc_CE628
		push	word_79E71
		call	sub_754BE
		pop	cx

loc_CE628:
		cmp	word_79E6F, 0
		jz	short loc_CE639
		push	word_79E6F
		call	sub_7541E
		pop	cx

loc_CE639:
		cmp	[bp+var_5], 0
		jz	short loc_CE65D
		cmp	[bp+var_A], 0
		jz	short loc_CE65D
		push	0
		mov	al, [bp+var_6]
		push	ax
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_CE65D

loc_CE65D:
		pop	di
		pop	si
		leave
		retf
sub_CE39F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TextCycler_AllocateA_A7566 (sub_A7566 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, alloue
; (sub_658).
; ==============================================================================================
TextCycler_AllocateA_CE661		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_CE67A
		push	3
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_CE682

loc_CE67A:
		mov	word ptr [si+1], 0
		mov	byte ptr [si], 0FFh

loc_CE682:
		mov	ax, si
		pop	si
		pop	bp
		retf
TextCycler_AllocateA_CE661		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_CE687		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_CE6A0
		push	1Bh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_CE6B2

loc_CE6A0:
		xor	ax, ax
		mov	[si+18h], ax
		mov	[si+16h], ax
		mov	[si+14h], ax
		mov	byte ptr [si+1Ah], 0
		mov	byte ptr [si], 0

loc_CE6B2:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_CE687		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_CE6B7		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_CE6E9
		mov	word ptr [si], 3C62h
		push	si
		call	sub_603AB
		pop	cx
		mov	word ptr [si], 909h
		push	si
		call	sub_68B0D
		pop	cx
		test	di, 1
		jz	short loc_CE6E9
		push	si
		call	sub_3B2
		pop	cx

loc_CE6E9:
		pop	di
		pop	si
		pop	bp
		retf
sub_CE6B7		endp
ovr369		ends

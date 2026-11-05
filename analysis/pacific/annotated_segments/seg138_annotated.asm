seg138		segment	para public 'CODE' use16
		assume cs:seg138
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5E240		proc far

var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= dword ptr -0Eh
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= dword ptr -6
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_1], 0
		mov	ax, [di+5Dh]
		cmp	ax, [bp+arg_4]
		jg	short loc_5E25F
		mov	al, 0
		jmp	loc_5E351

loc_5E25F:
		push	[bp+arg_4]
		push	di
		call	sub_7844
		add	sp, 4
		mov	ax, [di+6Dh]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_5E27C
		mov	eax, [di+61h]
		jmp	short loc_5E280

loc_5E27C:
		mov	eax, [di+71h]

loc_5E280:
		mov	[bp+var_6], eax
		cmp	[bp+var_6], 0
		jnz	short loc_5E28E
		jmp	loc_5E34E

loc_5E28E:
		cmp	byte ptr [si+10h], 0
		jz	short loc_5E2BF
		mov	ax, [si+0Bh]
		or	ax, [si+0Dh]
		jz	short loc_5E2BF
		push	0
		mov	al, [si+0Fh]
		push	ax
		mov	ax, [si+0Dh]
		mov	dx, [si+0Bh]
		mov	[bp+var_8], ax
		mov	[bp+var_A], dx
		lea	ax, [bp+var_A]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_5E2BF

loc_5E2BF:
		mov	word ptr [si+0Dh], 0
		mov	word ptr [si+0Bh], 0
		mov	byte ptr [si+10h], 0
		mov	dword ptr [si+11h], 0
		mov	eax, [bp+var_6]
		add	eax, 100h
		mov	[bp+var_E], eax
		push	1
		push	0
		push	3
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_10], dx
		mov	[bp+var_12], ax
		mov	ax, [bp+var_10]
		mov	dx, [bp+var_12]
		mov	[si+0Dh], ax
		mov	[si+0Bh], dx
		mov	byte ptr [si+0Fh], 3
		mov	byte ptr [si+10h], 1
		mov	dword ptr [si+11h], 0
		mov	eax, [bp+var_E]
		mov	[si+11h], eax
		cmp	dword ptr [si+0Bh], 0
		jz	short loc_5E34E
		mov	[bp+var_1], 1
		push	0
		mov	al, [si+0Fh]
		push	ax
		push	large [si+0Bh]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+arg_4]
		push	di
		call	sub_75C8
		add	sp, 8

loc_5E34E:
		mov	al, [bp+var_1]

loc_5E351:
		pop	di
		pop	si
		leave
		retf
sub_5E240		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5E355		proc far

var_112		= word ptr -112h
var_9A		= word ptr -9Ah
var_72		= word ptr -72h
var_39		= dword ptr -39h
var_35		= dword ptr -35h
var_2D		= word ptr -2Dh
var_29		= dword ptr -29h
var_22		= word ptr -22h
var_20		= dword ptr -20h
var_1E		= dword ptr -1Eh
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_13		= byte ptr -13h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= byte ptr  0Eh
arg_A		= byte ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 112h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0
		mov	[bp+var_6], 0
		cmp	word ptr [si+9], 0
		jnz	short loc_5E376
		jmp	loc_5E73C

loc_5E376:
		push	1
		push	si
		nop
		push	cs
		call	near ptr AudioQueue_OpcodeHelper_5E9BC
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jz	short loc_5E392
		mov	al, [si+15h]
		cmp	al, [bp+arg_8]
		jb	short loc_5E392
		jmp	loc_5E73C

loc_5E392:
		xor	di, di
		jmp	short loc_5E3FE

loc_5E396:
		mov	ax, [si+7]
		mov	dx, [si+5]
		mov	bx, di
		imul	bx, bx, 0Ch
		add	dx, bx
		mov	word ptr [bp+var_1C+2], ax
		mov	word ptr [bp+var_1C], dx
		les	bx, word ptr [bp+var_1C]
		push	large es:[bx+4]
		push	ss
		lea	ax, [bp+var_72]
		push	ax
		call	sub_38D6
		add	sp, 8
		push	[bp+arg_2]
		lea	ax, [bp+var_72]
		push	ax
		call	CRT_Stricmp
		add	sp, 4
		or	ax, ax
		jnz	short loc_5E3FD
		les	bx, word ptr [bp+var_1C]
		mov	ax, es:[bx+8]
		cmp	ax, [bp+arg_4]
		jnz	short loc_5E3FD
		mov	ax, es:[bx+0Ah]
		cmp	ax, [bp+arg_6]
		jle	short loc_5E3FD
		mov	ax, es:[bx+2]
		mov	dx, es:[bx]
		mov	bx, [bp+arg_6]
		imul	bx, bx, 0Ah
		add	dx, bx
		mov	word ptr [bp+var_6+2], ax
		mov	word ptr [bp+var_6], dx
		jmp	short loc_5E403

loc_5E3FD:
		inc	di

loc_5E3FE:
		cmp	[si+16h], di
		jg	short loc_5E396

loc_5E403:
		cmp	[bp+var_6], 0
		jz	short loc_5E40D
		jmp	loc_5E4E5

loc_5E40D:
		push	ds
		push	[bp+arg_2]
		call	Config_LoadOrCreate
		add	sp, 4
		or	al, al
		jnz	short loc_5E420
		jmp	loc_5E4E5

loc_5E420:
		lea	ax, [bp+var_9A]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_7407
		pop	cx
		push	1
		push	[bp+arg_2]
		lea	ax, [bp+var_9A]
		push	ax
		mov	bx, [bp+var_9A]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	[bp+arg_4]
		lea	ax, [bp+var_9A]
		push	ax
		call	sub_7844
		add	sp, 4
		mov	eax, [bp+var_35]
		mov	[bp+var_1C], eax
		mov	ax, [bp+var_2D]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_5E468
		mov	eax, [bp+var_39]
		jmp	short loc_5E46C

loc_5E468:
		mov	eax, [bp+var_29]

loc_5E46C:
		mov	edx, [bp+var_1C]
		add	edx, eax
		mov	[bp+var_20], edx
		mov	eax, [bp+var_1C]
		cmp	eax, [bp+var_20]
		jz	short loc_5E4D6
		lea	ax, [bp+var_112]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_7407
		pop	cx
		push	0
		push	large [bp+var_20]
		push	large [bp+var_1C]
		lea	ax, [bp+var_9A]
		push	ax
		lea	ax, [bp+var_112]
		push	ax
		call	sub_6C024
		add	sp, 0Eh
		push	[bp+arg_6]
		lea	ax, [bp+var_112]
		push	ax
		push	si
		push	cs
		call	near ptr sub_5E240
		add	sp, 6
		or	al, al
		jz	short loc_5E4C7
		mov	ax, si
		add	ax, 0Bh
		mov	word ptr [bp+var_6+2], ds
		mov	word ptr [bp+var_6], ax

loc_5E4C7:
		push	2
		lea	ax, [bp+var_112]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4

loc_5E4D6:
		push	2
		lea	ax, [bp+var_9A]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4

loc_5E4E5:
		cmp	[bp+var_6], 0
		jnz	short loc_5E4EF
		jmp	loc_5E73C

loc_5E4EF:
		les	bx, word ptr [bp+var_6]
		cmp	dword ptr es:[bx], 0
		jnz	short loc_5E4FC
		jmp	loc_5E73C

loc_5E4FC:
		cmp	byte ptr [si+1Dh], 0
		jz	short loc_5E522
		cmp	dword ptr [si+18h], 0
		jz	short loc_5E522
		push	0
		mov	al, [si+1Ch]
		push	ax
		mov	ax, si
		add	ax, 18h
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_5E522

loc_5E522:
		mov	dword ptr [si+18h], 0
		mov	byte ptr [si+1Dh], 0
		mov	dword ptr [si+1Eh], 0
		les	bx, word ptr [bp+var_6]
		mov	eax, es:[bx+6]
		mov	[bp+var_A], eax
		push	0
		push	8
		push	2
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_E+2], dx
		mov	word ptr [bp+var_E], ax
		mov	eax, [bp+var_E]
		mov	[si+18h], eax
		mov	byte ptr [si+1Ch], 2
		mov	byte ptr [si+1Dh], 1
		mov	dword ptr [si+1Eh], 0
		mov	eax, [bp+var_A]
		mov	[si+1Eh], eax
		cmp	dword ptr [si+18h], 0
		jnz	short loc_5E585
		jmp	loc_5E699

loc_5E585:
		mov	di, si
		add	di, 18h
		les	bx, word ptr [bp+var_6]
		cmp	dword ptr es:[bx], 0
		jnz	short loc_5E597
		jmp	loc_5E697

loc_5E597:
		cmp	dword ptr [di], 0
		jz	short loc_5E5AB
		mov	eax, [di+6]
		cmp	eax, es:[bx+6]
		jl	short loc_5E5AB
		jmp	loc_5E62E

loc_5E5AB:
		cmp	byte ptr [di+5], 0
		jz	short loc_5E5CB
		cmp	dword ptr [di], 0
		jz	short loc_5E5CB
		push	0
		mov	al, [di+4]
		push	ax
		push	di
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_5E5CB

loc_5E5CB:
		mov	dword ptr [di], 0
		mov	byte ptr [di+5], 0
		mov	dword ptr [di+6], 0
		les	bx, word ptr [bp+var_6]
		mov	eax, es:[bx+6]
		mov	[bp+var_12], eax
		mov	al, es:[bx+4]
		mov	[bp+var_13], al
		push	1
		push	0
		push	ax
		push	large [bp+var_12]
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_18+2], dx
		mov	word ptr [bp+var_18], ax
		mov	eax, [bp+var_18]
		mov	[di], eax
		mov	al, [bp+var_13]
		mov	[di+4], al
		mov	byte ptr [di+5], 1
		mov	dword ptr [di+6], 0
		mov	eax, [bp+var_12]
		mov	[di+6], eax
		jmp	short loc_5E62E

loc_5E62E:
		cmp	byte ptr [di+4], 3
		jnz	short loc_5E65B
		les	bx, word ptr [bp+var_6]
		cmp	byte ptr es:[bx+4], 3
		jnz	short loc_5E65B
		push	0
		push	3
		push	large es:[bx+6]
		push	large es:[bx]
		push	large [di]

loc_5E64E:
		push	6B04h
		call	Memory_TypedAllocDispatch_6530C
		add	sp, 12h
		jmp	short loc_5E6B8

loc_5E65B:
		push	0
		push	2
		les	bx, word ptr [bp+var_6]
		push	large es:[bx+6]
		push	0
		mov	al, es:[bx+4]
		push	ax
		push	large es:[bx]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		mov	al, [di+4]
		push	ax
		push	large [di]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		jmp	short loc_5E64E

loc_5E697:
		jmp	short loc_5E6B8

loc_5E699:
		les	bx, word ptr [bp+var_6]
		mov	eax, es:[bx]
		mov	[si+18h], eax
		mov	al, es:[bx+4]
		mov	[si+1Ch], al
		mov	eax, es:[bx+6]
		mov	[si+1Eh], eax
		mov	byte ptr [si+1Dh], 0

loc_5E6B8:
		mov	[bp+var_22], 0D7Ch
		mov	ax, word_7AFA2
		mov	word ptr [bp+var_20], ax
		lea	ax, [bp+var_22]
		mov	word_7AFA2, ax
		mov	[bp+var_22], 0D84h
		mov	[bp+var_1E], 0
		mov	byte ptr [bp+var_1C+2], 0
		mov	ax, si
		add	ax, 18h
		push	ax
		lea	ax, [bp+var_22]
		push	ax
		call	sub_1CDA5
		add	sp, 4
		cmp	dword ptr [si+18h], 0
		jz	short loc_5E72E
		mov	bx, [si+9]
		mov	di, [bx+4]
		push	0FFFFh
		lea	ax, [bp+var_22]
		push	ax
		call	sub_1CE74
		pop	cx
		push	dx
		push	ax
		push	di
		call	sub_1DB77
		add	sp, 8
		mov	al, [bp+arg_A]
		mov	ah, 0
		push	ax
		push	di
		call	sub_1DB89
		add	sp, 4
		mov	[bp+var_1], 1
		mov	al, [bp+arg_8]
		mov	[si+15h], al
		mov	word ptr [si+26h], 0

loc_5E72E:
		push	2
		lea	ax, [bp+var_22]
		push	ax
		call	sub_1CD03
		add	sp, 4

loc_5E73C:
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
sub_5E355		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5E743		proc far

var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= dword ptr -1Ah
var_16		= byte ptr -16h
var_14		= dword ptr -14h
var_F		= byte ptr -0Fh
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 1Eh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0
		cmp	word ptr [si+9], 0
		jnz	short loc_5E75B
		jmp	loc_5E9B5

loc_5E75B:
		push	1
		push	si
		nop
		push	cs
		call	near ptr AudioQueue_OpcodeHelper_5E9BC
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jz	short loc_5E777
		mov	al, [si+15h]
		cmp	al, [bp+arg_4]
		jb	short loc_5E777
		jmp	loc_5E9B5

loc_5E777:
		mov	bx, [bp+arg_2]
		cmp	dword ptr [bx], 0
		jnz	short loc_5E783
		jmp	loc_5E9B5

loc_5E783:
		cmp	byte ptr [si+1Dh], 0
		jz	short loc_5E7A9
		cmp	dword ptr [si+18h], 0
		jz	short loc_5E7A9
		push	0
		mov	al, [si+1Ch]
		push	ax
		mov	ax, si
		add	ax, 18h
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_5E7A9

loc_5E7A9:
		mov	dword ptr [si+18h], 0
		mov	byte ptr [si+1Dh], 0
		mov	dword ptr [si+1Eh], 0
		mov	bx, [bp+arg_2]
		mov	eax, [bx+6]
		mov	[bp+var_6], eax
		push	0
		push	8
		push	2
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_A+2], dx
		mov	word ptr [bp+var_A], ax
		mov	eax, [bp+var_A]
		mov	[si+18h], eax
		mov	byte ptr [si+1Ch], 2
		mov	byte ptr [si+1Dh], 1
		mov	dword ptr [si+1Eh], 0
		mov	eax, [bp+var_6]
		mov	[si+1Eh], eax
		cmp	dword ptr [si+18h], 0
		jnz	short loc_5E80B
		jmp	loc_5E915

loc_5E80B:
		mov	di, si
		add	di, 18h
		mov	bx, [bp+arg_2]
		cmp	dword ptr [bx], 0
		jnz	short loc_5E81C
		jmp	loc_5E913

loc_5E81C:
		cmp	dword ptr [di], 0
		jz	short loc_5E82F
		mov	eax, [di+6]
		cmp	eax, [bx+6]
		jl	short loc_5E82F
		jmp	loc_5E8B0

loc_5E82F:
		cmp	byte ptr [di+5], 0
		jz	short loc_5E84F
		cmp	dword ptr [di], 0
		jz	short loc_5E84F
		push	0
		mov	al, [di+4]
		push	ax
		push	di
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_5E84F

loc_5E84F:
		mov	dword ptr [di], 0
		mov	byte ptr [di+5], 0
		mov	dword ptr [di+6], 0
		mov	bx, [bp+arg_2]
		mov	eax, [bx+6]
		mov	[bp+var_E], eax
		mov	al, [bx+4]
		mov	[bp+var_F], al
		push	1
		push	0
		push	ax
		push	large [bp+var_E]
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_14+2], dx
		mov	word ptr [bp+var_14], ax
		mov	eax, [bp+var_14]
		mov	[di], eax
		mov	al, [bp+var_F]
		mov	[di+4], al
		mov	byte ptr [di+5], 1
		mov	dword ptr [di+6], 0
		mov	eax, [bp+var_E]
		mov	[di+6], eax
		jmp	short loc_5E8B0

loc_5E8B0:
		cmp	byte ptr [di+4], 3
		jnz	short loc_5E8DA
		mov	bx, [bp+arg_2]
		cmp	byte ptr [bx+4], 3
		jnz	short loc_5E8DA
		push	0
		push	3
		push	large [bx+6]
		push	large [bx]
		push	large [di]

loc_5E8CD:
		push	6B04h
		call	Memory_TypedAllocDispatch_6530C
		add	sp, 12h
		jmp	short loc_5E931

loc_5E8DA:
		push	0
		push	2
		mov	bx, [bp+arg_2]
		push	large [bx+6]
		push	0
		mov	al, [bx+4]
		push	ax
		push	large [bx]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		mov	al, [di+4]
		push	ax
		push	large [di]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		jmp	short loc_5E8CD

loc_5E913:
		jmp	short loc_5E931

loc_5E915:
		mov	bx, [bp+arg_2]
		mov	eax, [bx]
		mov	[si+18h], eax
		mov	al, [bx+4]
		mov	[si+1Ch], al
		mov	eax, [bx+6]
		mov	[si+1Eh], eax
		mov	byte ptr [si+1Dh], 0

loc_5E931:
		mov	[bp+var_1E], 0D7Ch
		mov	ax, word_7AFA2
		mov	[bp+var_1C], ax
		lea	ax, [bp+var_1E]
		mov	word_7AFA2, ax
		mov	[bp+var_1E], 0D84h
		mov	[bp+var_1A], 0
		mov	[bp+var_16], 0
		mov	ax, si
		add	ax, 18h
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	sub_1CDA5
		add	sp, 4
		cmp	dword ptr [si+18h], 0
		jz	short loc_5E9A7
		mov	bx, [si+9]
		mov	di, [bx+4]
		push	0FFFFh
		lea	ax, [bp+var_1E]
		push	ax
		call	sub_1CE74
		pop	cx
		push	dx
		push	ax
		push	di
		call	sub_1DB77
		add	sp, 8
		mov	al, [bp+arg_6]
		mov	ah, 0
		push	ax
		push	di
		call	sub_1DB89
		add	sp, 4
		mov	[bp+var_1], 1
		mov	al, [bp+arg_4]
		mov	[si+15h], al
		mov	word ptr [si+26h], 0

loc_5E9A7:
		push	2
		lea	ax, [bp+var_1E]
		push	ax
		call	sub_1CD03
		add	sp, 4

loc_5E9B5:
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
sub_5E743		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à AudioQueue_OpcodeHelper_ABDAF (sub_ABDAF de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle AIL_VOC_playback_status_6035A (seg161).
; ==============================================================================================
AudioQueue_OpcodeHelper_5E9BC		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	dl, 0
		cmp	word ptr [si+9], 0
		jz	short loc_5E9F4
		mov	bx, [si+9]
		push	word ptr [bx+4]
		call	sub_1DB83
		pop	cx
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 2
		jnz	short loc_5E9F0
		mov	al, [si+15h]
		cmp	al, [bp+arg_2]
		jb	short loc_5E9F0
		mov	ax, 1
		jmp	short loc_5E9F2

loc_5E9F0:
		xor	ax, ax

loc_5E9F2:
		mov	dl, al

loc_5E9F4:
		mov	al, dl
		pop	si
		leave
		retf
AudioQueue_OpcodeHelper_5E9BC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5E9F9		proc far

var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= dword ptr -10h
var_C		= byte ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+9], 0
		jnz	short loc_5EA0D
		jmp	loc_5EB26

loc_5EA0D:
		mov	bx, [si+9]
		push	word ptr [bx+4]
		call	sub_1DB83
		pop	cx
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 2
		jnz	short loc_5EA25
		jmp	loc_5EB26

loc_5EA25:
		cmp	word ptr [si+26h], 0
		jz	short loc_5EAA1
		mov	bx, [si+9]
		mov	di, [bx+4]
		mov	[bp+var_14], 0D7Ch
		mov	ax, word_7AFA2
		mov	[bp+var_12], ax
		lea	ax, [bp+var_14]
		mov	word_7AFA2, ax
		mov	[bp+var_14], 0D84h
		mov	[bp+var_10], 0
		mov	[bp+var_C], 0
		mov	ax, si
		add	ax, 18h
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	sub_1CDA5
		add	sp, 4
		lea	ax, [bp+var_14]
		push	ax
		call	sub_1CE74
		pop	cx
		mov	[bp+var_8], dx
		mov	[bp+var_A], ax
		push	0FFFFh
		push	dx
		push	ax
		push	di
		call	sub_1DB77
		add	sp, 8
		push	0
		push	di
		call	sub_1DB89
		add	sp, 4
		dec	word ptr [si+26h]
		push	2
		lea	ax, [bp+var_14]
		push	ax
		call	sub_1CD03
		add	sp, 4
		jmp	loc_5EB26

loc_5EAA1:
		cmp	byte ptr [si+1Dh], 0
		jz	short loc_5EAC7
		cmp	dword ptr [si+18h], 0
		jz	short loc_5EAC7
		push	0
		mov	al, [si+1Ch]
		push	ax
		mov	ax, si
		add	ax, 18h
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_5EAC7

loc_5EAC7:
		mov	dword ptr [si+18h], 0
		mov	byte ptr [si+1Dh], 0
		mov	dword ptr [si+1Eh], 0
		cmp	byte ptr [si+10h], 0
		jz	short loc_5EB0C
		mov	ax, [si+0Bh]
		or	ax, [si+0Dh]
		jz	short loc_5EB0C
		push	0
		mov	al, [si+0Fh]
		push	ax
		mov	ax, [si+0Dh]
		mov	dx, [si+0Bh]
		mov	[bp+var_4], ax
		mov	[bp+var_6], dx
		lea	ax, [bp+var_6]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_5EB0C

loc_5EB0C:
		mov	word ptr [si+0Dh], 0
		mov	word ptr [si+0Bh], 0
		mov	byte ptr [si+10h], 0
sub_5E9F9		endp

; START OF FUNCTION CHUNK FOR sub_5E9F9
		db 66h
		mov	word ptr [si+11h], 0
; END OF FUNCTION CHUNK FOR sub_5E9F9
seg138		ends

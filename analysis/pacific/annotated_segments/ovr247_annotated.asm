ovr247		segment	para public 'OVERLAY' use16
		assume cs:ovr247
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8C860		proc far

var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 16h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	byte ptr [si+1Ah], 0
		mov	[bp+var_A], 0
		mov	[bp+var_6], 2
		mov	[bp+var_5], 0
		mov	[bp+var_4], 0
		mov	eax, [di+72h]
		mov	[bp+var_E], eax
		mov	[bp+var_12], eax
		push	1
		push	0
		push	2
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_16+2], dx
		mov	word ptr [bp+var_16], ax
		mov	eax, [bp+var_16]
		mov	[bp+var_A], eax
		mov	[bp+var_6], 2
		mov	[bp+var_5], 1
		mov	[bp+var_4], 0
		mov	eax, [bp+var_12]
		mov	[bp+var_4], eax
		push	large [bp+var_E]
		push	0
		mov	al, [bp+var_6]
		push	ax
		push	large [bp+var_A]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	si
		call	sub_690A8
		add	sp, 4
		push	69h
		push	si
		mov	bx, [si]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	dx, ax
		mov	word ptr [si+10h], 0
		mov	word ptr [si+12h], 0
		cmp	dx, 0FFFFh
		jnz	short loc_8C92C
		push	2Dh
		push	si
		mov	bx, [si]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	[si+14h], ax
		jmp	short loc_8C92F

loc_8C92C:
		mov	[si+14h], dx

loc_8C92F:
		push	41h
		push	si
		nop
		push	cs
		call	near ptr GlyphObject_MeasureAndAllocate_8C966
		add	sp, 4
		mov	byte ptr [si+19h], 1Ch
		cmp	[bp+var_5], 0
		jz	short loc_8C962
		cmp	[bp+var_A], 0
		jz	short loc_8C962
		push	0
		mov	al, [bp+var_6]
		push	ax
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_8C962

loc_8C962:
		pop	di
		pop	si
		leave
		retf
sub_8C860		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GlyphObject_MeasureAndAllocate_7DF7F (sub_7DF7F de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine allocateur typé et Font_ComputeGlyphBoundingBox_5E74E (seg148).
; ==============================================================================================
GlyphObject_MeasureAndAllocate_8C966		proc far

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_0]
		push	ss
		lea	ax, [bp+var_8]
		push	ax
		push	large 0
		push	0
		mov	al, [si+6]
		push	ax
		push	large [si+2]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+arg_2]
		call	Font_ComputeGlyphBoundingBox_680A8
		mov	ax, [bp+var_6]
		mov	[bp+var_A], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		mov	[si+17h], ax
		mov	ax, [si+17h]
		mov	[bp+var_C], ax
		mov	[si+0Eh], ax
		pop	si
		leave
		retf
GlyphObject_MeasureAndAllocate_8C966		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8C9B1		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		mov	[bp+var_4], 0
		jmp	short loc_8C9E1

loc_8C9C5:
		mov	ax, [bp+var_2]
		mov	[bp+var_6], ax
		mov	al, byte ptr [bp+var_6]
		push	ax
		push	si
		call	GlyphObject_MeasureChar_692A4
		add	sp, 4
		mov	[bp+var_8], ax
		add	di, [bp+var_8]
		inc	[bp+var_4]

loc_8C9E1:
		les	bx, [bp+arg_2]
		add	bx, [bp+var_4]
		mov	al, es:[bx]
		cbw
		mov	[bp+var_2], ax
		or	ax, ax
		jnz	short loc_8C9C5
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
sub_8C9B1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8C9F8		proc far

var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		mov	[bp+var_2], di
		mov	ax, [si+17h]
		inc	ax
		mov	[bp+var_4], ax
		mov	[bp+var_8], 0
		jmp	loc_8CA9F

loc_8CA18:
		mov	dx, [bp+var_6]
		cmp	byte ptr [si+1Ah], 0
		jz	short loc_8CA4F
		mov	cx, 61h
		cmp	dx, cx
		jge	short loc_8CA2D
		mov	cx, 41h
		jmp	short loc_8CA2D

loc_8CA2D:
		mov	ax, dx
		sub	ax, cx
		mov	[bp+var_A], ax
		cmp	[bp+var_A], 1Ah
		jnb	short loc_8CA4F
		mov	al, [si+1Ah]
		mov	ah, 0
		cmp	ax, cx
		jz	short loc_8CA4F
		mov	al, [si+1Ah]
		mov	ah, 0
		add	ax, [bp+var_A]
		mov	dx, ax
		jmp	short loc_8CA4F

loc_8CA4F:
		mov	[bp+var_6], dx
		cmp	[bp+var_6], 0Ah
		jnz	short loc_8CA63
		mov	di, [bp+var_2]
		mov	ax, [bp+var_4]
		add	[bp+arg_6], ax
		jmp	short loc_8CA9C

loc_8CA63:
		push	0FFh
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		add	sp, 4
		push	[bp+arg_6]
		push	di
		mov	al, byte ptr [bp+var_6]
		push	ax
		push	[bp+arg_2]
		push	si
		call	GlyphObject_ResolveAndCache_69228
		add	sp, 0Ah
		mov	ax, [bp+var_6]
		mov	[bp+var_C], ax
		mov	al, byte ptr [bp+var_C]
		push	ax
		push	si
		call	GlyphObject_MeasureChar_692A4
		add	sp, 4
		mov	[bp+var_E], ax
		dec	ax
		add	di, ax

loc_8CA9C:
		inc	[bp+var_8]

loc_8CA9F:
		les	bx, [bp+arg_8]
		add	bx, [bp+var_8]
		mov	al, es:[bx]
		cbw
		mov	[bp+var_6], ax
		or	ax, ax
		jz	short loc_8CAB3
		jmp	loc_8CA18

loc_8CAB3:
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
sub_8C9F8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8CAB9		proc far

var_10E		= word ptr -10Eh
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 10Eh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		xor	dx, dx
		jmp	short loc_8CAD8

loc_8CACC:
		lea	ax, [bp+var_10E]
		mov	bx, dx
		add	bx, ax
		mov	byte ptr [bx], 0E6h
		inc	dx

loc_8CAD8:
		cmp	dx, 100h
		jl	short loc_8CACC
		mov	[bp+var_2], di
		mov	ax, [si+17h]
		inc	ax
		mov	[bp+var_4], ax
		mov	[bp+var_8], 0
		jmp	loc_8CBAC

loc_8CAF0:
		mov	dx, [bp+var_6]
		cmp	byte ptr [si+1Ah], 0
		jz	short loc_8CB27
		mov	cx, 61h
		cmp	dx, cx
		jge	short loc_8CB05
		mov	cx, 41h
		jmp	short loc_8CB05

loc_8CB05:
		mov	ax, dx
		sub	ax, cx
		mov	[bp+var_A], ax
		cmp	[bp+var_A], 1Ah
		jnb	short loc_8CB27
		mov	al, [si+1Ah]
		mov	ah, 0
		cmp	ax, cx
		jz	short loc_8CB27
		mov	al, [si+1Ah]
		mov	ah, 0
		add	ax, [bp+var_A]
		mov	dx, ax
		jmp	short loc_8CB27

loc_8CB27:
		mov	[bp+var_6], dx
		cmp	[bp+var_6], 0Ah
		jnz	short loc_8CB3B
		mov	di, [bp+var_2]
		mov	ax, [bp+var_4]
		add	[bp+arg_6], ax
		jmp	short loc_8CBA9

loc_8CB3B:
		push	[bp+arg_6]
		push	di
		mov	al, byte ptr [bp+var_6]
		push	ax
		push	[bp+arg_2]
		push	si
		call	GlyphObject_ResolveAndCache_69228
		add	sp, 0Ah
		push	1
		mov	al, [si+19h]
		mov	ah, 0
		push	ax
		push	ss
		lea	ax, [bp+var_10E]
		push	ax
		push	large 1000100h
		push	[bp+var_6]
		push	0
		mov	al, [si+6]
		push	ax
		push	large [si+2]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		mov	ax, [bp+arg_6]
		add	ax, [si+0Eh]
		push	ax
		push	di
		push	[bp+arg_2]
		call	sub_6A762
		add	sp, 18h
		mov	ax, [bp+var_6]
		mov	[bp+var_C], ax
		mov	al, byte ptr [bp+var_C]
		push	ax
		push	si
		call	GlyphObject_MeasureChar_692A4
		add	sp, 4
		mov	[bp+var_E], ax
		add	di, [bp+var_E]

loc_8CBA9:
		inc	[bp+var_8]

loc_8CBAC:
		les	bx, [bp+arg_8]
		add	bx, [bp+var_8]
		mov	al, es:[bx]
		cbw
		mov	[bp+var_6], ax
		or	ax, ax
		jz	short loc_8CBC0
		jmp	loc_8CAF0

loc_8CBC0:
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
sub_8CAB9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8CBC6		proc far

var_E0		= word ptr -0E0h
var_83		= dword ptr -83h
var_7F		= dword ptr -7Fh
var_7B		= dword ptr -7Bh
var_6E		= word ptr -6Eh
var_6A		= dword ptr -6Ah
var_66		= word ptr -66h
var_64		= word ptr -64h
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_15		= byte ptr -15h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= word ptr -0Ch
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0E0h
		push	si
		push	di
		mov	di, [bp+arg_0]
		lea	ax, [bp+var_E0]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_E0], 508h
		mov	[bp+var_7F], 100h
		mov	[bp+var_83], 0
		mov	[bp+var_E0], 520h
		mov	[bp+var_64], 0
		xor	ax, ax
		mov	[bp+var_66], ax
		movsx	eax, ax
		mov	[bp+var_7B], eax
		push	large 50414D4Eh
		push	[bp+arg_2]
		lea	ax, [bp+var_E0]
		push	ax
		call	ResourceRecord_InitAndValidate_6D646
		add	sp, 8
		or	ax, ax
		jnz	short loc_8CC29
		jmp	loc_8D096

loc_8CC29:
		push	0
		push	large 4F464E49h
		lea	ax, [bp+var_E0]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_8CC45
		jmp	loc_8CCD3

loc_8CC45:
		lea	ax, [bp+var_E0]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[di], ax
		lea	ax, [bp+var_E0]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[di+2], ax
		lea	ax, [bp+var_E0]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[di+4], ax
		lea	ax, [bp+var_E0]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[di+6], ax
		lea	ax, [bp+var_E0]
		push	ax
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[di+14h], eax
		mov	ax, [di+4]
		sar	ax, 1
		mov	[bp+var_2], ax
		movsx	ebx, [bp+var_2]
		mov	eax, [di+14h]
		cdq
		idiv	ebx
		mov	[bp+var_6], eax
		mov	[bp+var_A], eax
		mov	[di+18h], eax
		mov	ax, [di+6]
		sar	ax, 1
		mov	[bp+var_C], ax
		movsx	ebx, [bp+var_C]
		mov	eax, [di+14h]
		cdq
		idiv	ebx
		mov	[bp+var_10], eax
		mov	[bp+var_14], eax
		mov	[di+1Ch], eax

loc_8CCD3:
		push	0
		push	large 544E4F46h
		lea	ax, [bp+var_E0]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_8CD1D
		push	1Bh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_8CD16
		push	ax
		call	GlyphObject_AllocateBuffer_69123
		pop	cx
		mov	word ptr [si], 764h
		lea	ax, [bp+var_E0]
		push	ax
		push	si
		push	cs
		call	near ptr sub_8C860
		add	sp, 4
		mov	ax, si
		jmp	short loc_8CD18

loc_8CD16:
		mov	ax, si

loc_8CD18:
		mov	[di+34h], ax
		jmp	short loc_8CD26

loc_8CD1D:
		push	700Eh
		call	sub_1DDFE
		pop	cx

loc_8CD26:
		push	0
		push	large 54584554h
		lea	ax, [bp+var_E0]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_8CD42
		jmp	loc_8CDF4

loc_8CD42:
		lea	ax, [bp+var_E0]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	si, ax
		cmp	si, 1
		jl	short loc_8CD86
		lea	ax, [bp+var_E0]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[di+8], ax
		lea	ax, [bp+var_E0]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[di+0Ah], ax
		lea	ax, [bp+var_E0]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		lea	ax, [bp+var_E0]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx

loc_8CD86:
		cmp	si, 2
		jl	short loc_8CDBD
		lea	ax, [bp+var_E0]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[di+0Ch], ax
		lea	ax, [bp+var_E0]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[di+0Eh], ax
		lea	ax, [bp+var_E0]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		lea	ax, [bp+var_E0]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx

loc_8CDBD:
		cmp	si, 3
		jl	short loc_8CDF4
		lea	ax, [bp+var_E0]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[di+10h], ax
		lea	ax, [bp+var_E0]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[di+12h], ax
		lea	ax, [bp+var_E0]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		lea	ax, [bp+var_E0]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx

loc_8CDF4:
		push	0
		push	large 50414853h
		lea	ax, [bp+var_E0]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_8CE10
		jmp	loc_8CF31

loc_8CE10:
		lea	ax, word ptr [bp+var_1E]
		push	ax
		call	String_ConstructEmpty
		pop	cx
		mov	bx, word_77696
		mov	si, [bx+1DCh]
		mov	eax, [si+6]
		mov	[bp+var_22], eax
		jmp	loc_8CF00

loc_8CE2D:
		lea	ax, [bp+var_E0]
		push	ax
		lea	ax, word ptr [bp+var_1E]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		lea	ax, word ptr [bp+var_1E]
		push	ax
		call	CRT_Strupr_30EF
		pop	cx
		cmp	[bp+var_22], 0
		jz	short loc_8CE6F
		les	bx, word ptr [bp+var_22]
		mov	al, es:[bx]
		cbw
		push	ax
		call	CRT_CtypeLookup
		pop	cx
		push	ax
		mov	al, ds:[bp-1Eh]
		cbw
		push	ax
		call	CRT_CtypeLookup
		pop	cx
		pop	dx
		cmp	dx, ax
		jnz	short loc_8CEE9

loc_8CE6F:
		lea	ax, [bp+var_E0]
		push	ax
		call	ResourceRecord_ReadDwordField_6DB27
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_26], eax
		mov	[bp+var_2A], eax
		push	1
		push	0
		push	3
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_2E+2], dx
		mov	word ptr [bp+var_2E], ax
		mov	eax, [bp+var_2E]
		mov	[di+20h], eax
		mov	byte ptr [di+24h], 3
		mov	byte ptr [di+25h], 1
		mov	dword ptr [di+26h], 0
		mov	eax, [bp+var_2A]
		mov	[di+26h], eax
		push	large [bp+var_26]
		push	0
		mov	al, [di+24h]
		push	ax
		push	large [di+20h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_E0]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		jmp	short loc_8CF31

loc_8CEE9:
		lea	ax, [bp+var_E0]
		push	ax
		call	ResourceRecord_ReadDwordField_6DB27
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_26], eax
		add	[bp+var_7B], eax

loc_8CF00:
		test	[bp+var_6E], 1
		jz	short loc_8CF19
		mov	eax, [bp+var_6A]
		dec	eax
		cmp	eax, [bp+var_7B]
		jnz	short loc_8CF19
		inc	[bp+var_7B]
		jmp	short loc_8CF19

loc_8CF19:
		mov	eax, [bp+var_7B]
		cmp	eax, [bp+var_6A]
		jl	short loc_8CF28
		mov	ax, 1
		jmp	short loc_8CF2A

loc_8CF28:
		xor	ax, ax

loc_8CF2A:
		or	ax, ax
		jnz	short loc_8CF31
		jmp	loc_8CE2D

loc_8CF31:
		push	0
		push	large 5350414Dh
		lea	ax, [bp+var_E0]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		mov	[bp+var_15], al
		cmp	[bp+var_15], 0
		jnz	short loc_8CF52
		jmp	loc_8D091

loc_8CF52:
		mov	[bp+var_1A], 0
		mov	word ptr [bp+var_1E+2], ds
		mov	word ptr [bp+var_1E], 68B3h
		mov	eax, [bp+var_1E]
		mov	[bp+var_1A], eax
		lea	ax, word ptr [bp+var_1A]
		push	ax
		call	Path_NormalizeUppercase8
		pop	cx
		lea	ax, word ptr [bp+var_2A+2]
		push	ax
		call	String_ConstructEmpty
		pop	cx
		jmp	loc_8D05E

loc_8CF81:
		lea	ax, [bp+var_E0]
		push	ax
		lea	ax, word ptr [bp+var_2A+2]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		lea	ax, word ptr [bp+var_2A+2]
		push	ax
		call	CRT_Strupr_30EF
		pop	cx
		cmp	[bp+var_1A], 0
		jz	short loc_8CFCD
		lea	ax, word ptr [bp+var_2A+2]
		mov	word ptr [bp+var_2A], ds
		mov	word ptr [bp+var_2E+2], ax
		push	8
		push	word ptr [bp+var_2A]
		push	ax
		push	large [bp+var_1A]
		call	CRT_MemFamily_Extra7
		add	sp, 0Ah
		or	ax, ax
		jnz	short loc_8CFC7
		mov	ax, 1
		jmp	short loc_8CFC9

loc_8CFC7:
		xor	ax, ax

loc_8CFC9:
		or	al, al
		jz	short loc_8D047

loc_8CFCD:
		lea	ax, [bp+var_E0]
		push	ax
		call	ResourceRecord_ReadDwordField_6DB27
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_30], eax
		mov	[bp+var_34], eax
		push	1
		push	0
		push	3
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_38+2], dx
		mov	word ptr [bp+var_38], ax
		mov	eax, [bp+var_38]
		mov	[di+2Ah], eax
		mov	byte ptr [di+2Eh], 3
		mov	byte ptr [di+2Fh], 1
		mov	dword ptr [di+30h], 0
		mov	eax, [bp+var_34]
		mov	[di+30h], eax
		push	large [bp+var_30]
		push	0
		mov	al, [di+2Eh]
		push	ax
		push	large [di+2Ah]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_E0]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		jmp	short loc_8D09F

loc_8D047:
		lea	ax, [bp+var_E0]
		push	ax
		call	ResourceRecord_ReadDwordField_6DB27
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_30], eax
		add	[bp+var_7B], eax

loc_8D05E:
		test	[bp+var_6E], 1
		jz	short loc_8D077
		mov	eax, [bp+var_6A]
		dec	eax
		cmp	eax, [bp+var_7B]
		jnz	short loc_8D077
		inc	[bp+var_7B]
		jmp	short loc_8D077

loc_8D077:
		mov	eax, [bp+var_7B]
		cmp	eax, [bp+var_6A]
		jl	short loc_8D086
		mov	ax, 1
		jmp	short loc_8D088

loc_8D086:
		xor	ax, ax

loc_8D088:
		or	ax, ax
		jnz	short loc_8D08F
		jmp	loc_8CF81

loc_8D08F:
		jmp	short loc_8D09F

loc_8D091:
		push	7010h
		jmp	short loc_8D099

loc_8D096:
		push	700Fh

loc_8D099:
		call	sub_1DDFE
		pop	cx

loc_8D09F:
		mov	[bp+var_E0], 520h
		lea	ax, [bp+var_E0]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		push	0
		lea	ax, [bp+var_E0]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_8CBC6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GlyphObject_ResolveHierarchyOffset_7E5F2 (sub_7E5F2 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle AreaRelPos_ToWorld_50EEB (seg114).
; ==============================================================================================
GlyphObject_ResolveHierarchyOffset_8D0C3		proc far

var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_1], 0
		mov	bx, [si+138h]
		mov	al, [bx+6]
		mov	ah, 0
		mov	dx, ax
		xor	eax, eax
		mov	[di+8], eax
		mov	[di+4], eax
		mov	[di], eax
		cmp	dx, 0A5h
		jz	short loc_8D100
		cmp	dx, 0A4h
		jz	short loc_8D100
		cmp	dx, 0A6h
		jnz	short loc_8D15A

loc_8D100:
		mov	bx, [si+138h]
		mov	al, [bx+7]
		mov	ah, 0
		mov	cx, ax
		mov	bx, word_79B8C
		cmp	[bx+1Eh], cx
		jbe	short loc_8D123
		mov	dx, [bx+22h]
		mov	ax, [bx+20h]
		mov	bx, cx
		shl	bx, 4
		add	ax, bx
		jmp	short loc_8D127

loc_8D123:
		xor	dx, dx
		xor	ax, ax

loc_8D127:
		mov	word ptr [bp+var_6+2], dx
		mov	word ptr [bp+var_6], ax
		cmp	[bp+var_6], 0
		jz	short loc_8D15A
		push	dx
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_12]
		push	ax
		call	sub_51C99
		add	sp, 8
		mov	eax, [bp+var_12]
		mov	[di], eax
		mov	eax, [bp+var_E]
		mov	[di+4], eax
		mov	eax, [bp+var_A]
		mov	[di+8], eax

loc_8D15A:
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
GlyphObject_ResolveHierarchyOffset_8D0C3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GlyphObject_StoreComputedPosition_7E690 (sub_7E690 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle Expr_Node_StoreResultVector_52C9C (seg114).
; ==============================================================================================
GlyphObject_StoreComputedPosition_8D161		proc far

var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	si
		mov	ax, [bp+arg_0]
		mov	si, [bp+arg_2]
		push	si
		push	ax
		push	cs
		call	near ptr GlyphObject_ResolveHierarchyOffset_8D0C3
		add	sp, 4
		mov	[bp+var_1], al
		cmp	[bp+var_1], 0
		jz	short loc_8D1AC
		mov	bx, word_79B8C
		push	large [bx+65h]
		push	ss
		lea	ax, word ptr [bp+var_E]
		push	ax
		call	sub_544F5
		add	sp, 8
		mov	eax, [bp+var_E]
		sub	[si], eax
		mov	eax, [bp+var_A]
		sub	[si+4], eax
		mov	eax, [bp+var_6]
		sub	[si+8], eax

loc_8D1AC:
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
GlyphObject_StoreComputedPosition_8D161		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; GlyphObject_Helper_7E6E1 (sub_7E6E1 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, aucun appel externe visible (35 lignes).
; ==============================================================================================
GlyphObject_Helper_8D1B2		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= dword ptr  0Eh
arg_C		= byte ptr  12h

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, [bp+arg_C]
		push	ax
		push	large [bp+arg_8]
		mov	ax, [bp+arg_6]
		inc	ax
		push	ax
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	word ptr [si+34h]
		push	cs
		call	near ptr sub_8CAB9
		add	sp, 0Eh
		pop	si
		pop	bp
		retf
GlyphObject_Helper_8D1B2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; GlyphObject_Helper2_7E708 (sub_7E708 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, aucun appel externe visible (26 lignes).
; ==============================================================================================
GlyphObject_Helper2_8D1D9		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= dword ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	large [bp+arg_8]
		mov	ax, [bp+arg_6]
		inc	ax
		push	ax
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	word ptr [si+34h]
		push	cs
		call	near ptr sub_8C9F8
		add	sp, 0Ch
		pop	si
		pop	bp
		retf
GlyphObject_Helper2_8D1D9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; NavMap_WorldToScreen_7E72B (sub_7E72B de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, 70L, LUE 2026-10-31. Position monde → écran
; de la carte de navigation (arguments : carte, vecteur position 3× i32 24.8, sorties x et y).
; x = [carte+0] + (c0 + [carte+20]) / [carte+24] ; y = [carte+2] + [carte+6] − (c1 +
; [carte+20]) / [carte+28] (division 24.8 : sar edx, 18h / shl eax, 8 / idiv ecx, puis partie
; entière). [carte+0], [carte+2], [carte+6] = gauche, haut, hauteur de la fenêtre et
; [carte+20] = demi-taille du monde, lus dans le chunk INFO de NAVMAP.IFF ; [carte+24] et
; [carte+28] = échelles (Font_LoadDefinitionFromIFF_7E1B4).
; ==============================================================================================
NavMap_WorldToScreen_8D1FC		proc far

var_E		= dword ptr -0Eh
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_6], di
		mov	bx, [bp+var_6]
		mov	eax, [bx]
		mov	[bp+var_4], eax
		mov	ax, si
		add	ax, 14h
		mov	[bp+var_8], ax
		mov	bx, [bp+var_8]
		mov	eax, [bx]
		add	[bp+var_4], eax
		mov	ax, si
		add	ax, 18h
		mov	[bp+var_A], ax
		mov	eax, [bp+var_4]
		mov	edx, eax
		mov	bx, [bp+var_A]
		mov	ecx, [bx]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_4], eax
		mov	ax, [si]
		add	ax, word ptr [bp+var_4+1]
		mov	bx, [bp+arg_4]
		mov	[bx], ax
		add	di, 4
		mov	eax, [di]
		mov	[bp+var_E], eax
		mov	di, si
		add	di, 14h
		mov	eax, [di]
		add	[bp+var_E], eax
		mov	di, si
		add	di, 1Ch
		mov	eax, [bp+var_E]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_E], eax
		mov	ax, [si+2]
		add	ax, [si+6]
		sub	ax, word ptr [bp+var_E+1]
		mov	bx, [bp+arg_6]
		mov	[bx], ax
		pop	di
		pop	si
		leave
		retf
NavMap_WorldToScreen_8D1FC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8D29D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	0
		mov	al, [si+2Eh]
		push	ax
		push	large [si+2Ah]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		or	ax, dx
		jz	short loc_8D2EA
		push	large 0
		mov	al, [si+2Eh]
		push	ax
		push	large [si+2Ah]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	di
		call	sub_6A514
		add	sp, 0Ch
		jmp	short loc_8D2F5

loc_8D2EA:
		push	0
		push	di
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4

loc_8D2F5:
		pop	di
		pop	si
		pop	bp
		retf
sub_8D29D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8D2F9		proc far

var_72		= word ptr -72h
var_22		= word ptr -22h
var_19		= byte ptr -19h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 72h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	bx, [si+34h]
		mov	al, 61h
		mov	[bx+1Ah], al
		mov	ah, 0
		push	ax
		push	bx
		push	cs
		call	near ptr GlyphObject_MeasureAndAllocate_8C966
		add	sp, 4
		mov	bx, [si+34h]
		mov	ax, [bx+17h]
		inc	ax
		mov	[bp+var_2], ax
		mov	di, [si+0Ah]
		add	di, 6
		push	seg seg008
		push	offset loc_637A
		lea	ax, [bp+var_72]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	ss
		lea	ax, [bp+var_72]
		push	ax
		push	di
		push	word ptr [si+8]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr GlyphObject_Helper2_8D1D9
		add	sp, 0Ch
		add	di, [bp+var_2]
		mov	ax, word_79B8C
		add	ax, 9
		mov	[bp+var_4], ds
		mov	[bp+var_6], ax
		push	[bp+var_4]
		push	ax
		push	di
		mov	ax, [si+8]
		add	ax, 8
		push	ax
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr GlyphObject_Helper2_8D1D9
		add	sp, 0Ch
		add	di, [bp+var_2]
		add	di, 2
		push	seg seg008
		push	offset loc_6383
		lea	ax, [bp+var_72]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	ss
		lea	ax, [bp+var_72]
		push	ax
		push	di
		push	word ptr [si+8]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr GlyphObject_Helper2_8D1D9
		add	sp, 0Ch
		add	di, [bp+var_2]
		mov	word ptr [bp+var_A+2], ds
		mov	word ptr [bp+var_A], 0FBCh
		push	word_79B8C
		call	sub_75294
		pop	cx
		mov	word ptr [bp+var_12+2], dx
		mov	word ptr [bp+var_12], ax
		cmp	[bp+var_12], 0
		jz	short loc_8D3E1
		mov	bx, word_79B8C
		mov	eax, [bx+65h]
		cmp	eax, [bp+var_12]
		jz	short loc_8D3E1
		push	dx
		push	word ptr [bp+var_12]
		call	Mission_GetCastName_544B8
		add	sp, 4
		mov	word ptr [bp+var_A+2], dx
		mov	word ptr [bp+var_A], ax

loc_8D3E1:
		push	10h
		push	large [bp+var_A]
		push	ss
		lea	ax, [bp+var_22]
		push	ax
		call	sub_39E1
		add	sp, 0Ah
		mov	[bp+var_19], 0
		push	ss
		lea	ax, [bp+var_22]
		push	ax
		push	di
		mov	ax, [si+8]
		add	ax, 8
		push	ax
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr GlyphObject_Helper2_8D1D9
		add	sp, 0Ch
		add	di, [bp+var_2]
		add	di, 2
		push	seg seg008
		push	offset loc_638B
		lea	ax, [bp+var_72]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	ss
		lea	ax, [bp+var_72]
		push	ax
		push	di
		push	word ptr [si+8]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr GlyphObject_Helper2_8D1D9
		add	sp, 0Ch
		add	di, [bp+var_2]
		mov	word ptr [bp+var_E+2], ds
		mov	word ptr [bp+var_E], 74Fh
		push	word_79B8C
		call	sub_75299
		pop	cx
		mov	word ptr [bp+var_12+2], dx
		mov	word ptr [bp+var_12], ax
		cmp	[bp+var_12], 0
		jz	short loc_8D49F
		les	bx, word ptr [bp+var_12]
		mov	dx, es:[bx+56h]
		or	dx, dx
		jz	short loc_8D48D
		cmp	dx, word_7CADA
		jnz	short loc_8D479
		mov	word ptr [bp+var_E+2], ds
		mov	word ptr [bp+var_E], 0FBCh
		jmp	short loc_8D49F

loc_8D479:
		mov	bx, dx
		mov	ax, [bx+5Ch]
		mov	dx, [bx+5Ah]
		add	dx, 8Eh
		mov	word ptr [bp+var_E+2], ax
		mov	word ptr [bp+var_E], dx
		jmp	short loc_8D49F

loc_8D48D:
		push	large [bp+var_12]
		call	Mission_GetCastName_544B8
		add	sp, 4
		mov	word ptr [bp+var_E+2], dx
		mov	word ptr [bp+var_E], ax

loc_8D49F:
		push	10h
		push	large [bp+var_E]
		push	ss
		lea	ax, [bp+var_22]
		push	ax
		call	sub_39E1
		add	sp, 0Ah
		mov	[bp+var_19], 0
		push	ss
		lea	ax, [bp+var_22]
		push	ax
		push	di
		mov	ax, [si+8]
		add	ax, 8
		push	ax
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr GlyphObject_Helper2_8D1D9
		add	sp, 0Ch
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr sub_8D4DE
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_8D2F9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8D4DE		proc far

var_A2		= word ptr -0A2h
var_52		= word ptr -52h
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0A2h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	bx, [si+34h]
		mov	al, 61h
		mov	[bx+1Ah], al
		mov	ah, 0
		push	ax
		push	bx
		push	cs
		call	near ptr GlyphObject_MeasureAndAllocate_8C966
		add	sp, 4
		mov	bx, [si+34h]
		mov	ax, [bx+17h]
		inc	ax
		mov	[bp+var_2], ax
		mov	di, [si+0Eh]
		push	seg seg008
		push	offset loc_5D69
		lea	ax, [bp+var_A2]
		push	ax
		call	sub_54BE
		add	sp, 6
		mov	bx, [si+138h]
		mov	al, [bx+6]
		mov	ah, 0
		sub	ax, 0A1h
		mov	bx, ax
		cmp	bx, 0Ch
		ja	short loc_8D58A
		shl	bx, 1
		jmp	cs:off_8D614[bx]	; switch jump

loc_8D537:
		push	seg seg008
		push	offset loc_5D71
		jmp	short loc_8D57D

loc_8D53F:
		push	seg seg008
		push	offset loc_5D7A
		jmp	short loc_8D57D

loc_8D547:
		push	seg seg008
		push	offset loc_5D82
		jmp	short loc_8D57D

loc_8D54F:
		push	seg seg008
		push	offset loc_5D96
		jmp	short loc_8D57D

loc_8D557:
		push	seg seg008
		push	offset loc_5DA8
		jmp	short loc_8D57D

loc_8D55F:
		push	seg seg008
		push	offset loc_5DB9
		jmp	short loc_8D57D

loc_8D567:
		push	seg seg008
		push	offset loc_5DC9
		jmp	short loc_8D57D

loc_8D56F:
		push	seg seg008
		push	offset loc_5DD6
		jmp	short loc_8D57D

loc_8D577:
		push	seg seg008
		push	offset loc_5DE4

loc_8D57D:
		lea	ax, [bp+var_A2]
		push	ax
		call	sub_54BE
		add	sp, 6

loc_8D58A:
		push	seg seg008
		push	offset loc_5DF3
		lea	ax, [bp+var_52]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	ss
		lea	ax, [bp+var_52]
		push	ax
		push	di
		push	word ptr [si+0Ch]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr GlyphObject_Helper2_8D1D9
		add	sp, 0Ch
		add	di, [bp+var_2]
		push	ss
		lea	ax, [bp+var_A2]
		push	ax
		push	di
		push	word ptr [si+0Ch]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr GlyphObject_Helper2_8D1D9
		add	sp, 0Ch
		push	seg seg008
		push	offset loc_5DFE
		lea	ax, [bp+var_52]
		push	ax
		call	sub_54BE
		add	sp, 6
		mov	di, [si+12h]
		push	ss
		lea	ax, [bp+var_52]
		push	ax
		push	di
		push	word ptr [si+10h]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr GlyphObject_Helper2_8D1D9
		add	sp, 0Ch
		add	di, [bp+var_2]
		cmp	dword ptr [si+142h], 0
		jz	short loc_8D610
		push	large [si+142h]
		push	di
		push	word ptr [si+10h]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr GlyphObject_Helper2_8D1D9
		add	sp, 0Ch

loc_8D610:
		pop	di
		pop	si
		leave
		retf
sub_8D4DE		endp

; START OF FUNCTION CHUNK FOR sub_8D4DE
off_8D614	dw offset loc_8D537
		dw offset loc_8D53F
		dw offset loc_8D58A
		dw offset loc_8D547
		dw offset loc_8D54F
		dw offset loc_8D557
		dw offset loc_8D55F
		dw offset loc_8D567
		dw offset loc_8D56F
		dw offset loc_8D577
		dw offset loc_8D58A
		dw offset loc_8D58A
		dw offset loc_8D55F
; END OF FUNCTION CHUNK FOR sub_8D4DE

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; GlyphObject_Helper4_7EB0D (sub_7EB0D de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, 13L, LUE 2026-10-31. Vide la table des rectangles
; occupés de la carte de navigation ([carte+54] = 0) ; appelée au début de
; NavMap_DrawMissionObjects_7EDCA.
; ==============================================================================================
GlyphObject_Helper4_8D62E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word ptr [si+36h], 0
		pop	si
		pop	bp
		retf
GlyphObject_Helper4_8D62E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à NavMap_ReserveBox_7EB1C
; (sub_7EB1C de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, 64L, LUE 2026-10-31. Réserve un rectangle (gauche, haut, largeur, hauteur) dans
; la table des rectangles occupés de la carte de navigation : nombre en [carte+54], gauches
; [carte+56+2i], hauts [carte+120+2i], droites [carte+184+2i], bas [carte+248+2i] (droite =
; gauche + largeur − 1, bas = haut + hauteur − 1) ; au plus 32 (cmp word ptr [si+36h], 20h).
; Appelée pour le repère 3 × 3 de chaque objet et pour chaque texte placé
; (NavMap_PlaceLabel_7EC45).
; ==============================================================================================
NavMap_ReserveBox_8D63D		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	cx, [bp+arg_4]
		mov	ax, dx
		add	ax, [bp+arg_6]
		dec	ax
		mov	[bp+var_2], ax
		mov	ax, cx
		add	ax, [bp+arg_8]
		dec	ax
		mov	[bp+var_4], ax
		cmp	word ptr [si+36h], 20h
		jge	short loc_8D690
		mov	bx, [si+36h]
		shl	bx, 1
		mov	[bx+si+38h], dx
		mov	bx, [si+36h]
		shl	bx, 1
		mov	[bx+si+78h], cx
		mov	bx, [si+36h]
		shl	bx, 1
		mov	ax, [bp+var_2]
		mov	[bx+si+0B8h], ax
		mov	bx, [si+36h]
		shl	bx, 1
		mov	ax, [bp+var_4]
		mov	[bx+si+0F8h], ax
		inc	word ptr [si+36h]

loc_8D690:
		pop	si
		leave
		retf
NavMap_ReserveBox_8D63D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à NavMap_ClampBox_7EB72 (sub_7EB72 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, 58L, LUE
; 2026-10-31. Ramène le rectangle d'un texte de la carte de navigation dans la fenêtre des
; textes : si droite > 241 (cmp …, 0F1h), gauche = 241 − largeur + 1 ; si bas > 177 (0B1h),
; haut = 177 − hauteur + 1 ; puis gauche au moins 25 (19h) et haut au moins 23 (17h).
; ==============================================================================================
NavMap_ClampBox_8D693		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	dx, [bp+arg_4]
		mov	cx, [bp+arg_6]
		mov	ax, [si]
		add	ax, dx
		dec	ax
		mov	[bp+var_2], ax
		mov	ax, [di]
		add	ax, cx
		dec	ax
		mov	[bp+var_4], ax
		cmp	[bp+var_2], 0DCh
		jle	short loc_8D6C6
		mov	ax, 0DCh
		sub	ax, dx
		inc	ax
		mov	[si], ax

loc_8D6C6:
		cmp	[bp+var_4], 0B1h
		jle	short loc_8D6D5
		mov	ax, 0B1h
		sub	ax, cx
		inc	ax
		mov	[di], ax

loc_8D6D5:
		cmp	word ptr [si], 19h
		jge	short loc_8D6DE
		mov	word ptr [si], 19h

loc_8D6DE:
		cmp	word ptr [di], 17h
		jge	short loc_8D6E7
		mov	word ptr [di], 17h

loc_8D6E7:
		pop	di
		pop	si
		leave
		retf
NavMap_ClampBox_8D693		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à NavMap_IsBoxFree_7EBCA (sub_7EBCA de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, 103L, LUE
; 2026-10-31. Vrai si le rectangle (gauche, haut, largeur, hauteur) est dans la fenêtre des
; textes (x de 25 à 241, y de 23 à 177) et ne recouvre aucun rectangle réservé
; (NavMap_ReserveBox_7EB1C) ; recouvrement, bornes incluses : droite réservée ≥ gauche, gauche
; réservée ≤ droite, bas réservé ≥ haut et haut réservé ≤ bas.
; ==============================================================================================
NavMap_IsBoxFree_8D6EB		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	cx, [bp+arg_2]
		mov	di, [bp+arg_4]
		mov	ax, cx
		add	ax, [bp+arg_6]
		dec	ax
		mov	[bp+var_2], ax
		mov	ax, di
		add	ax, [bp+arg_8]
		dec	ax
		mov	[bp+var_4], ax
		cmp	cx, 19h
		jl	short loc_8D726
		cmp	[bp+var_2], 0DCh
		jg	short loc_8D726
		cmp	di, 17h
		jl	short loc_8D726
		cmp	[bp+var_4], 0B1h
		jle	short loc_8D72A

loc_8D726:
		mov	al, 0
		jmp	short loc_8D762

loc_8D72A:
		xor	dx, dx
		jmp	short loc_8D75B

loc_8D72E:
		mov	bx, dx
		shl	bx, 1
		cmp	[bx+si+0B8h], cx
		jl	short loc_8D75A
		mov	bx, dx
		shl	bx, 1
		mov	ax, [bx+si+38h]
		cmp	ax, [bp+var_2]
		jg	short loc_8D75A
		mov	bx, dx
		shl	bx, 1
		cmp	[bx+si+0F8h], di
		jl	short loc_8D75A
		mov	bx, dx
		shl	bx, 1
		mov	ax, [bx+si+78h]
		cmp	ax, [bp+var_4]
		jle	short loc_8D726

loc_8D75A:
		inc	dx

loc_8D75B:
		cmp	[si+36h], dx
		jg	short loc_8D72E
		mov	al, 1

loc_8D762:
		pop	di
		pop	si
		leave
		retf
NavMap_IsBoxFree_8D6EB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à NavMap_PlaceLabel_7EC45
; (sub_7EC45 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, 256L, LUE 2026-10-31. Écrit un texte près d'un point de la carte de navigation
; (arguments : carte, surface, x, y, texte, couleur), en majuscules (lettre de base « A » de
; la police, [police+26]). L = largeur du texte (GlyphObject_MeasureWrapper_7DFCA), H =
; [police+23] + 1. Essais dans l'ordre, coin haut-gauche : 0 (x − L/2, y + H/4) ; 1 (x − L/2,
; y − H − H/4) ; 2 (x + 3, y − H/2) ; 3 (x − L − 3, y − H/2) ; 4 (x − L/2, y + H) ; 5 (x −
; L/2, y − 2H) ; ensuite (x + 3, y − H/2) sans contrôle. Chaque essai est ramené dans la
; fenêtre (NavMap_ClampBox_7EB72) et gardé s'il est libre (NavMap_IsBoxFree_7EBCA), puis
; réservé (NavMap_ReserveBox_7EB1C). Si byte_6D5DE n'est pas nul et que l'essai 0 est pris,
; rien n'est écrit (le drapeau reste posé) ; sinon le texte est écrit par
; GlyphObject_Helper_7E6E1 en (gauche, haut + 1) et byte_6D5DE est remis à 0.
; ==============================================================================================
NavMap_PlaceLabel_8D766		proc far

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_5		= byte ptr -5
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= dword ptr  0Eh
arg_C		= byte ptr  12h

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	bx, [si+34h]
		mov	al, 41h
		mov	[bx+1Ah], al
		mov	ah, 0
		push	ax
		push	bx
		push	cs
		call	near ptr GlyphObject_MeasureAndAllocate_8C966
		add	sp, 4
		push	large [bp+arg_8]
		push	word ptr [si+34h]
		push	cs
		call	near ptr sub_8C9B1
		add	sp, 6
		mov	[bp+var_2], ax
		mov	bx, [si+34h]
		mov	di, [bx+17h]
		inc	di
		sar	ax, 1
		mov	[bp+var_4], ax
		mov	[bp+var_5], 0
		mov	[bp+var_8], 0
		mov	ax, [bp+arg_4]
		mov	[bp+var_A], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_C], ax
		jmp	loc_8D8B1

loc_8D7B9:
		mov	bx, [bp+var_8]
		cmp	bx, 5
		jbe	short loc_8D7C4
		jmp	loc_8D844

loc_8D7C4:
		shl	bx, 1
		jmp	cs:off_8D8DF[bx]	; switch jump

loc_8D7CB:
		mov	ax, [bp+arg_4]
		sub	ax, [bp+var_4]
		mov	[bp+var_A], ax
		mov	ax, di
		sar	ax, 1
		cwd
		sub	ax, dx
		sar	ax, 1
		mov	dx, [bp+arg_6]
		add	dx, ax

loc_8D7E2:
		mov	[bp+var_C], dx
		jmp	short loc_8D85D

loc_8D7E7:
		mov	ax, [bp+arg_4]
		sub	ax, [bp+var_4]
		mov	[bp+var_A], ax
		mov	ax, di
		sar	ax, 1
		cwd
		sub	ax, dx
		sar	ax, 1
		mov	dx, [bp+arg_6]
		sub	dx, di
		jmp	short loc_8D81B

loc_8D800:
		mov	ax, [bp+arg_4]
		add	ax, 3
		jmp	short loc_8D811

loc_8D808:
		mov	ax, [bp+arg_4]
		sub	ax, [bp+var_2]
		add	ax, 0FFFDh

loc_8D811:
		mov	[bp+var_A], ax
		mov	ax, di
		sar	ax, 1
		mov	dx, [bp+arg_6]

loc_8D81B:
		sub	dx, ax
		jmp	short loc_8D7E2

loc_8D81F:
		mov	ax, [bp+arg_4]
		sub	ax, [bp+var_4]
		mov	[bp+var_A], ax
		mov	ax, [bp+arg_6]
		add	ax, di
		jmp	short loc_8D83F

loc_8D82F:
		mov	ax, [bp+arg_4]
		sub	ax, [bp+var_4]
		mov	[bp+var_A], ax
		mov	ax, [bp+arg_6]
		sub	ax, di
		sub	ax, di

loc_8D83F:
		mov	[bp+var_C], ax
		jmp	short loc_8D85D

loc_8D844:
		mov	ax, [bp+arg_4]
		add	ax, 3
		mov	[bp+var_A], ax
		mov	ax, di
		sar	ax, 1
		mov	dx, [bp+arg_6]
		sub	dx, ax
		mov	[bp+var_C], dx
		mov	[bp+var_5], 1

loc_8D85D:
		mov	al, [bp+var_5]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8D8B1
		push	di
		push	[bp+var_2]
		lea	ax, [bp+var_C]
		push	ax
		lea	ax, [bp+var_A]
		push	ax
		push	cs
		call	near ptr NavMap_ClampBox_8D693
		add	sp, 8
		push	di
		push	[bp+var_2]
		push	[bp+var_C]
		push	[bp+var_A]
		push	si
		push	cs
		call	near ptr NavMap_IsBoxFree_8D6EB
		add	sp, 0Ah
		or	al, al
		jz	short loc_8D8A7
		push	di
		push	[bp+var_2]
		push	[bp+var_C]
		push	[bp+var_A]
		push	si
		push	cs
		call	near ptr NavMap_ReserveBox_8D63D
		add	sp, 0Ah
		mov	[bp+var_5], 1
		jmp	short loc_8D8B1

loc_8D8A7:
		cmp	byte_76E7E, 0
		jnz	short loc_8D8DB
		inc	[bp+var_8]

loc_8D8B1:
		mov	al, [bp+var_5]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8D8BD
		jmp	loc_8D7B9

loc_8D8BD:
		mov	al, [bp+arg_C]
		push	ax
		push	large [bp+arg_8]
		push	[bp+var_C]
		push	[bp+var_A]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr GlyphObject_Helper_8D1B2
		add	sp, 0Eh
		mov	byte_76E7E, 0

loc_8D8DB:
		pop	di
		pop	si
		leave
		retf
NavMap_PlaceLabel_8D766		endp

; START OF FUNCTION CHUNK FOR NavMap_PlaceLabel_8D766
off_8D8DF	dw offset loc_8D7CB
		dw offset loc_8D7E7
		dw offset loc_8D800
		dw offset loc_8D808
		dw offset loc_8D81F
		dw offset loc_8D82F
; END OF FUNCTION CHUNK FOR NavMap_PlaceLabel_8D766

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8D8EB		proc far

var_6E		= dword ptr -6Eh
var_6A		= dword ptr -6Ah
var_66		= dword ptr -66h
var_62		= dword ptr -62h
var_5E		= dword ptr -5Eh
var_5A		= word ptr -5Ah
var_58		= dword ptr -58h
var_54		= word ptr -54h
var_52		= word ptr -52h
var_50		= word ptr -50h
var_4E		= dword ptr -4Eh
var_4A		= dword ptr -4Ah
var_46		= word ptr -46h
var_44		= dword ptr -44h
var_40		= word ptr -40h
var_3E		= word ptr -3Eh
var_3C		= word ptr -3Ch
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_30		= dword ptr -30h
var_2C		= word ptr -2Ch
var_2A		= word ptr -2Ah
var_28		= dword ptr -28h
var_26		= dword ptr -26h
var_24		= dword ptr -24h
var_22		= dword ptr -22h
var_20		= dword ptr -20h
var_1E		= dword ptr -1Eh
var_1A		= word ptr -1Ah
var_18		= dword ptr -18h
var_16		= dword ptr -16h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= dword ptr -0Ah
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 6Eh
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr GlyphObject_Helper4_8D62E
		pop	cx
		mov	ax, word_79B8C
		mov	[bp+var_2], ax
		mov	[bp+var_4], 0
		cmp	[bp+var_2], 0
		jnz	short loc_8D910
		jmp	loc_8DD41

loc_8D910:
		jmp	loc_8DD1C

loc_8D913:
		mov	eax, [di+4]
		mov	[bp+var_8], eax
		cmp	[bp+var_8], 0
		jnz	short loc_8D925
		jmp	loc_8DD19

loc_8D925:
		cmp	byte ptr [di], 0
		jz	short loc_8D94B
		cmp	dword ptr [di+4], 0
		jz	short loc_8D94B
		les	bx, [di+4]
		cmp	byte ptr es:[bx+2], 2Eh
		jz	short loc_8D940
		mov	ax, 1
		jmp	short loc_8D942

loc_8D940:
		xor	ax, ax

loc_8D942:
		or	al, al
		jz	short loc_8D94B
		mov	ax, 1
		jmp	short loc_8D94D

loc_8D94B:
		xor	ax, ax

loc_8D94D:
		or	al, al
		jnz	short loc_8D954
		jmp	loc_8DD19

loc_8D954:
		mov	word ptr [bp+var_A], 77h
		mov	eax, [si+13Ah]
		cmp	eax, [bp+var_8]
		jnz	short loc_8D969
		mov	word ptr [bp+var_A], 0E7h

loc_8D969:
		lea	ax, [bp+var_E]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		mov	ax, word ptr [bp+var_8+2]
		mov	dx, word ptr [bp+var_8]
		add	dx, 22h
		mov	[bp+var_10], ax
		mov	[bp+var_12], dx
		les	di, [bp+var_12]
		mov	eax, es:[di]
		mov	[bp+var_6E], eax
		mov	eax, es:[di+4]
		mov	[bp+var_6A], eax
		mov	eax, es:[di+8]
		mov	[bp+var_66], eax
		lea	ax, word ptr [bp+var_6E]
		push	ax
		push	si
		push	cs
		call	near ptr NavMap_WorldToScreen_8D1FC
		add	sp, 8
		mov	ax, [bp+arg_4]
		add	[bp+var_C], ax
		mov	ax, [bp+arg_6]
		add	[bp+var_E], ax
		mov	al, byte ptr [bp+var_A]
		push	ax
		push	[bp+var_E]
		push	[bp+var_C]
		push	[bp+arg_2]
		call	Render_SetPixelClipped_6A11A
		add	sp, 8
		push	large [bp+var_8]
		les	bx, word ptr [bp+var_8]
		mov	bx, es:[bx]
		call	dword ptr [bx]
		add	sp, 4
		cbw
		cmp	ax, 42h
		jnz	short loc_8D9E2
		jmp	loc_8DB42

loc_8D9E2:
		cmp	ax, 43h
		jnz	short loc_8D9EA
		jmp	loc_8DAA1

loc_8D9EA:
		cmp	ax, 53h
		jz	short loc_8D9F2
		jmp	loc_8DD19

loc_8D9F2:
		mov	eax, [bp+var_8]
		mov	[bp+var_16], eax
		mov	ax, word ptr [bp+var_16+2]
		mov	dx, word ptr [bp+var_16]
		add	dx, 2Eh
		mov	[bp+var_1A], ax
		mov	word ptr [bp+var_1E+2], dx
		les	bx, word ptr [bp+var_1E+2]
		mov	eax, es:[bx]
		mov	[bp+var_20], eax
		mov	di, si
		add	di, 18h
		mov	eax, [bp+var_20]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_24], eax
		mov	eax, [bp+var_24]
		mov	[bp+var_28], eax
		mov	ax, word ptr [bp+var_28+1]
		mov	word ptr [bp+var_18], ax
		mov	ax, word ptr [bp+var_16+2]
		mov	dx, word ptr [bp+var_16]
		add	dx, 2Eh
		mov	[bp+var_2C], ax
		mov	word ptr [bp+var_30+2], dx
		les	bx, word ptr [bp+var_30+2]
		mov	eax, es:[bx]
		mov	[bp+var_32], eax
		mov	di, si
		add	di, 1Ch
		mov	eax, [bp+var_32]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_36], eax
		mov	eax, [bp+var_36]
		mov	[bp+var_3A], eax
		mov	ax, word ptr [bp+var_3A+1]
		mov	[bp+var_2A], ax
		mov	al, byte ptr [bp+var_A]
		push	ax
		push	[bp+var_2A]
		push	word ptr [bp+var_18]

loc_8DA90:
		push	[bp+var_E]
		push	[bp+var_C]
		push	[bp+arg_2]
		call	sub_69BD4
		jmp	loc_8DD16

loc_8DAA1:
		mov	eax, [bp+var_8]
		mov	[bp+var_16], eax
		mov	ax, word ptr [bp+var_16+2]
		mov	dx, word ptr [bp+var_16]
		add	dx, 32h
		mov	[bp+var_1A], ax
		mov	word ptr [bp+var_1E+2], dx
		les	bx, word ptr [bp+var_1E+2]
		mov	eax, es:[bx]
		mov	[bp+var_20], eax
		mov	di, si
		add	di, 18h
		mov	eax, [bp+var_20]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_24], eax
		mov	eax, [bp+var_24]
		mov	[bp+var_28], eax
		mov	ax, word ptr [bp+var_28+1]
		mov	word ptr [bp+var_18], ax
		mov	ax, word ptr [bp+var_16+2]
		mov	dx, word ptr [bp+var_16]
		add	dx, 32h
		mov	[bp+var_2C], ax
		mov	word ptr [bp+var_30+2], dx
		les	bx, word ptr [bp+var_30+2]
		mov	eax, es:[bx]
		mov	[bp+var_32], eax
		mov	di, si
		add	di, 1Ch
		mov	eax, [bp+var_32]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_36], eax
		mov	eax, [bp+var_36]
		mov	[bp+var_3A], eax
		mov	ax, word ptr [bp+var_3A+1]
		mov	[bp+var_2A], ax
		mov	al, byte ptr [bp+var_A]
		push	ax
		push	[bp+var_2A]
		push	word ptr [bp+var_18]
		jmp	loc_8DA90

loc_8DB42:
		mov	eax, [bp+var_8]
		mov	[bp+var_16], eax
		mov	ax, word ptr [bp+var_16+2]
		mov	dx, word ptr [bp+var_16]
		add	dx, 32h
		mov	word ptr [bp+var_18], ax
		mov	[bp+var_1A], dx
		les	bx, [bp+var_1A]
		mov	eax, es:[bx]
		mov	[bp+var_1E], eax
		mov	di, si
		add	di, 18h
		mov	eax, [bp+var_1E]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_22], eax
		mov	eax, [bp+var_22]
		mov	[bp+var_26], eax
		mov	di, word ptr [bp+var_26+1]
		mov	ax, word ptr [bp+var_16+2]
		mov	dx, word ptr [bp+var_16]
		add	dx, 2Eh
		mov	[bp+var_2A], ax
		mov	[bp+var_2C], dx
		les	bx, [bp+var_2C]
		mov	eax, es:[bx]
		mov	[bp+var_30], eax
		mov	ax, si
		add	ax, 18h
		mov	word ptr [bp+var_32], ax
		mov	eax, [bp+var_30]
		mov	edx, eax
		mov	bx, word ptr [bp+var_32]
		mov	ecx, [bx]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_36], eax
		mov	eax, [bp+var_36]
		mov	[bp+var_3A], eax
		mov	ax, word ptr [bp+var_3A+1]
		mov	word ptr [bp+var_28], ax
		mov	ax, word ptr [bp+var_16+2]
		mov	dx, word ptr [bp+var_16]
		add	dx, 36h
		mov	[bp+var_3E], ax
		mov	[bp+var_40], dx
		les	bx, [bp+var_40]
		mov	eax, es:[bx]
		mov	[bp+var_44], eax
		mov	ax, si
		add	ax, 1Ch
		mov	[bp+var_46], ax
		mov	eax, [bp+var_44]
		mov	edx, eax
		mov	bx, [bp+var_46]
		mov	ecx, [bx]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_4A], eax
		mov	eax, [bp+var_4A]
		mov	[bp+var_4E], eax
		mov	ax, word ptr [bp+var_4E+1]
		mov	[bp+var_3C], ax
		mov	ax, word ptr [bp+var_16+2]
		mov	dx, word ptr [bp+var_16]
		add	dx, 3Ah
		mov	[bp+var_52], ax
		mov	[bp+var_54], dx
		les	bx, [bp+var_54]
		mov	eax, es:[bx]
		mov	[bp+var_58], eax
		mov	ax, si
		add	ax, 1Ch
		mov	[bp+var_5A], ax
		mov	eax, [bp+var_58]
		mov	edx, eax
		mov	bx, [bp+var_5A]
		mov	ecx, [bx]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_5E], eax
		mov	eax, [bp+var_5E]
		mov	[bp+var_62], eax
		mov	ax, word ptr [bp+var_62+1]
		mov	[bp+var_50], ax
		mov	al, byte ptr [bp+var_A]
		push	ax
		mov	ax, [bp+var_E]
		sub	ax, [bp+var_3C]
		push	ax
		mov	ax, [bp+var_C]
		add	ax, word ptr [bp+var_28]
		push	ax
		mov	ax, [bp+var_E]
		sub	ax, [bp+var_3C]
		push	ax
		mov	ax, [bp+var_C]
		sub	ax, di
		push	ax
		push	[bp+arg_2]
		call	sub_69F22
		add	sp, 0Ch
		mov	al, byte ptr [bp+var_A]
		push	ax
		mov	ax, [bp+var_E]
		add	ax, [bp+var_50]
		push	ax
		mov	ax, [bp+var_C]
		add	ax, word ptr [bp+var_28]
		push	ax
		mov	ax, [bp+var_E]
		add	ax, [bp+var_50]
		push	ax
		mov	ax, [bp+var_C]
		sub	ax, di
		push	ax
		push	[bp+arg_2]
		call	sub_69F22
		add	sp, 0Ch
		mov	al, byte ptr [bp+var_A]
		push	ax
		mov	ax, [bp+var_E]
		add	ax, [bp+var_50]
		push	ax
		mov	ax, [bp+var_C]
		sub	ax, di
		push	ax
		mov	ax, [bp+var_E]
		sub	ax, [bp+var_3C]
		push	ax
		mov	ax, [bp+var_C]
		sub	ax, di
		push	ax
		push	[bp+arg_2]
		call	sub_69F22
		add	sp, 0Ch
		mov	al, byte ptr [bp+var_A]
		push	ax
		mov	ax, [bp+var_E]
		add	ax, [bp+var_50]
		push	ax
		mov	ax, [bp+var_C]
		add	ax, word ptr [bp+var_28]
		push	ax
		mov	ax, [bp+var_E]
		sub	ax, [bp+var_3C]
		push	ax
		mov	ax, [bp+var_C]
		add	ax, word ptr [bp+var_28]
		push	ax
		push	[bp+arg_2]
		call	sub_69F22

loc_8DD16:
		add	sp, 0Ch

loc_8DD19:
		inc	[bp+var_4]

loc_8DD1C:
		mov	bx, [bp+var_2]
		mov	ax, [bx+3Ah]
		cmp	ax, [bp+var_4]
		jbe	short loc_8DD36
		mov	ax, [bp+var_4]
		imul	ax, ax, 27h
		push	ax
		mov	ax, [bx+3Ch]
		pop	dx
		add	ax, dx
		jmp	short loc_8DD38

loc_8DD36:
		xor	ax, ax

loc_8DD38:
		mov	di, ax
		or	ax, ax
		jz	short loc_8DD41
		jmp	loc_8D913

loc_8DD41:
		mov	word ptr [bp+var_8+2], 0

loc_8DD46:
		mov	ax, word ptr [bp+var_8+2]
		inc	word ptr [bp+var_8+2]
		push	ax
		mov	ax, word_79B8C
		add	ax, 34h
		push	ax
		call	Expr_LookupTableEntry85B_54612
		add	sp, 4
		mov	word ptr [bp+var_8], dx
		mov	word ptr [bp+var_A], ax
		cmp	[bp+var_A], 0
		jnz	short loc_8DD6C
		jmp	loc_8DF06

loc_8DD6C:
		les	bx, word ptr [bp+var_A]
		cmp	word ptr es:[bx+56h], 0
		jz	short loc_8DD7B
		mov	ax, 1
		jmp	short loc_8DD7D

loc_8DD7B:
		xor	ax, ax

loc_8DD7D:
		or	ax, ax
		jnz	short loc_8DD84
		jmp	loc_8DF06

loc_8DD84:
		les	bx, word ptr [bp+var_A]
		mov	al, es:[bx+39h]
		shl	ax, 0Bh
		sar	ax, 0Fh
		or	ax, ax
		jnz	short loc_8DD98
		jmp	loc_8DF06

loc_8DD98:
		mov	di, es:[bx+56h]
		mov	[bp+var_C], 0
		push	di
		mov	bx, [di]
		call	dword ptr [bx]
		pop	cx
		or	ax, dx
		jz	short loc_8DDB4
		push	di
		mov	bx, [di]
		call	dword ptr [bx+34h]
		pop	cx
		jmp	short loc_8DDB6

loc_8DDB4:
		mov	al, 1Ch

loc_8DDB6:
		cmp	al, 6
		jnz	short loc_8DDBD
		mov	[bp+var_C], di

loc_8DDBD:
		lea	ax, [bp+var_10]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		mov	ax, di
		add	ax, 12h
		push	ax
		push	si
		push	cs
		call	near ptr NavMap_WorldToScreen_8D1FC
		add	sp, 8
		mov	ax, [bp+arg_4]
		add	[bp+var_E], ax
		mov	ax, [bp+arg_6]
		add	[bp+var_10], ax
		mov	[bp+var_12], 1Ch
		cmp	[bp+var_12], 0FFFFh
		jnz	short loc_8DDED
		jmp	loc_8DEB5

loc_8DDED:
		mov	al, byte ptr [bp+var_12]
		push	ax
		push	[bp+var_10]
		push	[bp+var_E]
		push	[bp+arg_2]
		call	Render_SetPixelClipped_6A11A
		add	sp, 8
		push	large 30003h
		mov	ax, [bp+var_10]
		dec	ax
		push	ax
		mov	ax, [bp+var_E]
		dec	ax
		push	ax
		push	si
		push	cs
		call	near ptr NavMap_ReserveBox_8D63D
		add	sp, 0Ah
		mov	[bp+var_1A], 1
		mov	word ptr [bp+var_1E+2], 0
		test	byte ptr [di+2], 4
		jz	short loc_8DE98
		push	di
		mov	bx, [di]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	word ptr [bp+var_1E], ax
		mov	bx, word ptr [bp+var_1E]
		mov	eax, [bx]
		mov	[bp+var_6E], eax
		mov	eax, [bx+4]
		mov	[bp+var_6A], eax
		mov	eax, [bx+8]
		mov	[bp+var_66], eax
		cmp	[bp+var_6E], 40h
		jle	short loc_8DE5F
		mov	[bp+var_1A], 0FFFFh
		jmp	short loc_8DE72

loc_8DE5F:
		cmp	[bp+var_6E], 0FFFFFFC0h
		jge	short loc_8DE6D
		mov	[bp+var_1A], 1
		jmp	short loc_8DE72

loc_8DE6D:
		mov	[bp+var_1A], 0

loc_8DE72:
		cmp	[bp+var_6A], 40h
		jle	short loc_8DE80
		mov	word ptr [bp+var_1E+2], 1
		jmp	short loc_8DE93

loc_8DE80:
		cmp	[bp+var_6A], 0FFFFFFC0h
		jge	short loc_8DE8E
		mov	word ptr [bp+var_1E+2], 0FFFFh
		jmp	short loc_8DE93

loc_8DE8E:
		mov	word ptr [bp+var_1E+2], 0

loc_8DE93:
		mov	[bp+var_12], 0

loc_8DE98:
		mov	al, byte ptr [bp+var_12]
		push	ax
		mov	ax, [bp+var_10]
		add	ax, word ptr [bp+var_1E+2]
		push	ax
		mov	ax, [bp+var_E]
		add	ax, [bp+var_1A]
		push	ax
		push	[bp+arg_2]
		call	Render_SetPixelClipped_6A11A
		add	sp, 8

loc_8DEB5:
		mov	word ptr [bp+var_16+2], 1Ch
		cmp	[bp+var_C], 0
		jz	short loc_8DEE5
		cmp	di, word_7CADA
		jnz	short loc_8DED0
		mov	word ptr [bp+var_16], ds
		mov	word ptr [bp+var_18], 0FBCh
		jmp	short loc_8DEED

loc_8DED0:
		mov	bx, [bp+var_C]
		mov	ax, [bx+5Ch]
		mov	dx, [bx+5Ah]
		add	dx, 8Eh
		mov	word ptr [bp+var_16], ax
		mov	word ptr [bp+var_18], dx
		jmp	short loc_8DEED

loc_8DEE5:
		mov	eax, [di+6]
		mov	[bp+var_18], eax

loc_8DEED:
		mov	al, byte ptr [bp+var_16+2]
		push	ax
		push	large [bp+var_18]
		push	[bp+var_10]
		push	[bp+var_E]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr NavMap_PlaceLabel_8D766
		add	sp, 0Eh

loc_8DF06:
		cmp	[bp+var_A], 0
		jz	short loc_8DF10
		jmp	loc_8DD46

loc_8DF10:
		mov	[bp+var_4], 0
		cmp	[bp+var_2], 0
		jnz	short loc_8DF1E
		jmp	loc_8E09A

loc_8DF1E:
		jmp	loc_8E075

loc_8DF21:
		mov	eax, [di+4]
		mov	[bp+var_8], eax
		cmp	[bp+var_8], 0
		jnz	short loc_8DF33
		jmp	loc_8E072

loc_8DF33:
		cmp	byte ptr [di], 0
		jz	short loc_8DF59
		cmp	dword ptr [di+4], 0
		jz	short loc_8DF59
		les	bx, [di+4]
		cmp	byte ptr es:[bx+2], 2Eh
		jz	short loc_8DF4E
		mov	ax, 1
		jmp	short loc_8DF50

loc_8DF4E:
		xor	ax, ax

loc_8DF50:
		or	al, al
		jz	short loc_8DF59
		mov	ax, 1
		jmp	short loc_8DF5B

loc_8DF59:
		xor	ax, ax

loc_8DF5B:
		or	al, al
		jnz	short loc_8DF62
		jmp	loc_8E072

loc_8DF62:
		push	large [bp+var_8]
		mov	ax, [bp+var_2]
		add	ax, 79h
		push	ax
		call	Parser_FindDuplicateSymbol
		add	sp, 6
		mov	eax, [si+13Ah]
		cmp	eax, [bp+var_8]
		mov	word ptr [bp+var_A], 254h
		lea	ax, [bp+var_E]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		mov	ax, word ptr [bp+var_8+2]
		mov	dx, word ptr [bp+var_8]
		add	dx, 22h
		mov	[bp+var_10], ax
		mov	[bp+var_12], dx
		les	di, [bp+var_12]
		mov	eax, es:[di]
		mov	[bp+var_6E], eax
		mov	eax, es:[di+4]
		mov	[bp+var_6A], eax
		mov	eax, es:[di+8]
		mov	[bp+var_66], eax
		lea	ax, word ptr [bp+var_6E]
		push	ax
		push	si
		push	cs
		call	near ptr NavMap_WorldToScreen_8D1FC
		add	sp, 8
		mov	ax, [bp+arg_4]
		add	[bp+var_C], ax
		mov	ax, [bp+arg_6]
		add	[bp+var_E], ax
		mov	byte_76E7E, 1
		mov	al, byte ptr [bp+var_A]
		push	ax
		mov	ax, word ptr [bp+var_8]
		add	ax, 2
		push	word ptr [bp+var_8+2]
		push	ax
		push	[bp+var_E]
		push	[bp+var_C]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr NavMap_PlaceLabel_8D766
		add	sp, 0Eh
		cmp	byte_76E7E, 0
		jz	short loc_8E01D
		mov	al, byte ptr [bp+var_A]
		push	ax
		mov	ax, word ptr [bp+var_8]
		add	ax, 2
		push	word ptr [bp+var_8+2]
		push	ax
		mov	ax, [bp+var_E]
		add	ax, 0Ah
		push	ax
		push	[bp+var_C]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr NavMap_PlaceLabel_8D766
		add	sp, 0Eh

loc_8E01D:
		cmp	byte_76E7E, 0
		jz	short loc_8E047
		mov	al, byte ptr [bp+var_A]
		push	ax
		mov	ax, word ptr [bp+var_8]
		add	ax, 2
		push	word ptr [bp+var_8+2]
		push	ax
		mov	ax, [bp+var_E]
		add	ax, 0FFF6h
		push	ax
		push	[bp+var_C]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr NavMap_PlaceLabel_8D766
		add	sp, 0Eh

loc_8E047:
		cmp	byte_76E7E, 0
		jz	short loc_8E072
		mov	byte_76E7E, 0
		mov	al, byte ptr [bp+var_A]
		push	ax
		mov	ax, word ptr [bp+var_8]
		add	ax, 2
		push	word ptr [bp+var_8+2]
		push	ax
		push	[bp+var_E]
		push	[bp+var_C]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr NavMap_PlaceLabel_8D766
		add	sp, 0Eh

loc_8E072:
		inc	[bp+var_4]

loc_8E075:
		mov	bx, [bp+var_2]
		mov	ax, [bx+3Ah]
		cmp	ax, [bp+var_4]
		jbe	short loc_8E08F
		mov	ax, [bp+var_4]
		imul	ax, ax, 27h
		push	ax
		mov	ax, [bx+3Ch]
		pop	dx
		add	ax, dx
		jmp	short loc_8E091

loc_8E08F:
		xor	ax, ax

loc_8E091:
		mov	di, ax
		or	ax, ax
		jz	short loc_8E09A
		jmp	loc_8DF21

loc_8E09A:
		pop	di
		pop	si
		leave
		retf
sub_8D8EB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8E09E		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	large 0
		push	di
		push	si
		push	cs
		call	near ptr sub_8D29D
		add	sp, 8
		push	large 0
		push	di
		push	si
		push	cs
		call	near ptr sub_8D8EB
		add	sp, 8
		push	large 0
		mov	al, [si+24h]
		push	ax
		push	large [si+20h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 0
		push	di
		call	sub_6A514
		add	sp, 0Ch
		push	di
		push	si
		push	cs
		call	near ptr sub_8D2F9
		add	sp, 4
		pop	di
		pop	si
		pop	bp
		retf
sub_8E09E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8E0F2		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	di
		push	si
		push	cs
		call	near ptr sub_8D29D
		add	sp, 8
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	di
		push	si
		push	cs
		call	near ptr sub_8D8EB
		add	sp, 8
		pop	di
		pop	si
		pop	bp
		retf
sub_8E0F2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à NavMap_SetObjective_7F5D5 (sub_7F5D5 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, 106L, LUE
; 2026-10-31 (ex-NavMap_SetObjective_7F5D5). Prépare l'objectif affiché sur la carte de
; navigation à partir de l'ordre de navigation courant (enregistrement bx : +6 ordre, +7
; argument, +8 numéro de message). [carte+314], [carte+318] et [carte+322] remis à 0 ; message
; ≠ −1 : [carte+322] = texte du message (Str_GetNthEntry_50EC8, liste MSGS) ; ordres 164, 165
; (OP_SET_OBJ_FLY_TO_WP) et 166 (OP_SET_OBJ_FLY_TO_AREA) : [carte+314] = zone du SPOT de
; l'argument (premier champ de l'enregistrement de 16 octets, liste à scénario+30) ; ordres
; 167 à 170 : [carte+318] = objet visé (Expr_LookupNamedValue_52DDB). Appelée par
; Lexer_AdvanceWrapper_7F69C et les autres déplacements dans la liste des ordres de
; navigation.
; ==============================================================================================
NavMap_SetObjective_8E11F		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	bx, [si+138h]
		mov	al, [bx+6]
		mov	ah, 0
		mov	[bp+var_2], ax
		mov	al, [bx+7]
		mov	ah, 0
		mov	di, ax
		mov	dword ptr [si+13Ah], 0
		mov	dword ptr [si+13Eh], 0
		mov	dword ptr [si+142h], 0
		mov	dx, [bx+8]
		cmp	dx, 0FFFFh
		jz	short loc_8E178
		push	dx
		mov	ax, word_79B8C
		add	ax, 28h
		push	ax
		call	Str_GetNthEntry_51C76
		add	sp, 4
		mov	[si+144h], dx
		mov	[si+142h], ax

loc_8E178:
		mov	bx, [bp+var_2]
		sub	bx, 0A4h
		cmp	bx, 9
		ja	short loc_8E1D4
		shl	bx, 1
		jmp	cs:off_8E1D8[bx]	; switch jump

loc_8E18B:
		mov	bx, word_79B8C
		cmp	[bx+1Eh], di
		jbe	short loc_8E1A3
		mov	dx, [bx+22h]
		mov	ax, [bx+20h]
		mov	bx, di
		shl	bx, 4
		add	ax, bx
		jmp	short loc_8E1A7

loc_8E1A3:
		xor	dx, dx
		xor	ax, ax

loc_8E1A7:
		mov	bx, ax
		mov	es, dx
		mov	ax, es:[bx+2]
		mov	dx, es:[bx]
		mov	[si+13Ch], ax
		mov	[si+13Ah], dx
		jmp	short loc_8E1D4

loc_8E1BC:
		push	di
		mov	ax, word_79B8C
		add	ax, 34h
		push	ax
		call	Expr_LookupNamedValue_546A8
		add	sp, 4
		mov	[si+140h], dx
		mov	[si+13Eh], ax

loc_8E1D4:
		pop	di
		pop	si
		leave
		retf
NavMap_SetObjective_8E11F		endp

; START OF FUNCTION CHUNK FOR NavMap_SetObjective_8E11F
off_8E1D8	dw offset loc_8E18B
		dw offset loc_8E18B
		dw offset loc_8E18B
		dw offset loc_8E1BC
		dw offset loc_8E1BC
		dw offset loc_8E1BC
		dw offset loc_8E1BC
		dw offset loc_8E1D4
		dw offset loc_8E1D4
		dw offset loc_8E1BC
; END OF FUNCTION CHUNK FOR NavMap_SetObjective_8E11F

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Lexer_AdvanceWrapper_7F69C (sub_7F69C de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, appelle Lexer_Advance.
; ==============================================================================================
Lexer_AdvanceWrapper_8E1EC		proc far

var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+138h]
		call	Lexer_Advance
		pop	cx
		mov	[bp+var_1], al
		cmp	[bp+var_1], 0
		jz	short loc_8E20F
		push	si
		push	cs
		call	near ptr NavMap_SetObjective_8E11F
		pop	cx

loc_8E20F:
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
Lexer_AdvanceWrapper_8E1EC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Lexer_RewindWrapper_7F6C5 (sub_7F6C5 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, appelle Lexer_Rewind.
; ==============================================================================================
Lexer_RewindWrapper_8E215		proc far

var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+138h]
		call	Lexer_Rewind
		pop	cx
		mov	[bp+var_1], al
		cmp	[bp+var_1], 0
		jz	short loc_8E238
		push	si
		push	cs
		call	near ptr NavMap_SetObjective_8E11F
		pop	cx

loc_8E238:
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
Lexer_RewindWrapper_8E215		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8E23E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		push	large 0FFF2FFE4h
		cmp	byte_7C9F0, 1
		jnz	short loc_8E256
		mov	ax, 62B2h
		jmp	short loc_8E259

loc_8E256:
		mov	ax, word_7C9E0

loc_8E259:
		push	ax
		push	dx
		push	cs
		call	near ptr sub_8E0F2
		add	sp, 8
		push	62B0h
		call	sub_1E055
		pop	cx
		pop	bp
		retf
sub_8E23E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8E26D		proc far

var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_F		= byte ptr -0Fh
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_5		= byte ptr -5
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 16h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_4], 100h
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	64DEh
		call	Cockpit_PanAzimuthUpdate_2E46C
		add	sp, 4
		mov	[bp+var_5], 0
		cmp	byte_7C9F0, 1
		jnz	short loc_8E29F
		mov	ax, 62B2h
		jmp	short loc_8E2A2

loc_8E29F:
		mov	ax, word_7C9E0

loc_8E2A2:
		push	ax
		push	si
		push	cs
		call	near ptr sub_8E09E
		add	sp, 4
		push	62B0h
		call	sub_1E055
		pop	cx
		xor	eax, eax
		mov	[bp+var_A], eax
		mov	[bp+var_E], eax
		mov	[bp+var_A], 0
		mov	eax, dword_7B29D
		mov	[bp+var_E], eax
		mov	[bp+var_F], 1
		jmp	loc_8E412

loc_8E2D6:
		mov	eax, [bp+var_E]
		add	eax, [bp+var_A]
		cmp	eax, dword_7B29D
		ja	short loc_8E2EA
		mov	ax, 1
		jmp	short loc_8E2EC

loc_8E2EA:
		xor	ax, ax

loc_8E2EC:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8E2F5
		jmp	loc_8E412

loc_8E2F5:
		mov	[bp+var_A], 6
		mov	eax, dword_7B29D
		mov	[bp+var_E], eax
		push	633Eh
		call	sub_227FE
		pop	cx
		mov	[bp+var_F], al
		cmp	word_7CB03, 4
		jnz	short loc_8E332
		push	1
		push	1
		call	sub_5235
		add	sp, 4
		or	al, al
		jz	short loc_8E332
		push	si
		push	cs
		call	near ptr NavMap_SetObjective_8E11F
		pop	cx
		mov	[bp+var_5], 1

loc_8E332:
		cmp	word_7CB03, 3
		jnz	short loc_8E392
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
		mov	[bp+var_14], di
		cmp	[bp+var_14], 4
		jnz	short loc_8E392
		push	si
		push	cs
		call	near ptr NavMap_SetObjective_8E11F
		pop	cx
		mov	[bp+var_5], 1

loc_8E392:
		call	Input_ReadAxis1Deadzone
		mov	dx, ax
		or	dx, dx
		jz	short loc_8E412
		mov	[bp+var_12], dx
		mov	cx, 9
		mov	bx, offset word_8E465

loc_8E3A6:
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_12]
		jz	short loc_8E3B5
		add	bx, 2
		loop	short loc_8E3A6
		jmp	short loc_8E412

loc_8E3B5:
		jmp	word ptr cs:[bx+12h] ; switch jump

loc_8E3B9:
		push	si
		push	cs
		call	near ptr NavMap_SetObjective_8E11F
		pop	cx
		mov	[bp+var_5], 1
		jmp	short loc_8E412

loc_8E3C5:
		push	si
		push	cs
		call	near ptr Lexer_RewindWrapper_8E215
		pop	cx
		or	al, al
		jz	short loc_8E412
		cmp	byte_7C9F0, 1
		jnz	short loc_8E3DB
		mov	ax, 62B2h
		jmp	short loc_8E3DE

loc_8E3DB:
		mov	ax, word_7C9E0

loc_8E3DE:
		mov	[bp+var_14], ax
		push	ax
		jmp	short loc_8E401

loc_8E3E4:
		push	si
		push	cs
		call	near ptr Lexer_AdvanceWrapper_8E1EC
		pop	cx
		or	al, al
		jz	short loc_8E412
		cmp	byte_7C9F0, 1
		jnz	short loc_8E3FA
		mov	ax, 62B2h
		jmp	short loc_8E3FD

loc_8E3FA:
		mov	ax, word_7C9E0

loc_8E3FD:
		mov	[bp+var_16], ax
		push	ax

loc_8E401:
		push	si
		push	cs
		call	near ptr sub_8E09E
		add	sp, 4
		push	62B0h
		call	sub_1E055
		pop	cx

loc_8E412:
		mov	al, [bp+var_5]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8E424
		cmp	[bp+var_F], 0
		jz	short loc_8E424
		jmp	loc_8E2D6

loc_8E424:
		push	0
		cmp	byte_7C9F0, 1
		jnz	short loc_8E432
		mov	ax, 62B2h
		jmp	short loc_8E435

loc_8E432:
		mov	ax, word_7C9E0

loc_8E435:
		push	ax
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	62B0h
		call	sub_1E055
		pop	cx
		push	0
		cmp	byte_7C9F0, 1
		jnz	short loc_8E455
		mov	ax, 62B2h
		jmp	short loc_8E458

loc_8E455:
		mov	ax, word_7C9E0

loc_8E458:
		push	ax
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_8E26D		endp

; START OF FUNCTION CHUNK FOR sub_8E26D
word_8E465	dw 1
		dw 1Ch
		dw 31h
		dw 39h
		dw 3Bh
		dw 48h
		dw 4Bh
		dw 4Dh
		dw 50h
off_8E477	dw offset loc_8E3B9
		dw offset loc_8E3B9
		dw offset loc_8E3E4
		dw offset loc_8E3B9
		dw offset loc_8E3B9
		dw offset loc_8E3C5
		dw offset loc_8E3C5
		dw offset loc_8E3E4
		dw offset loc_8E3E4
; END OF FUNCTION CHUNK FOR sub_8E26D

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8E489		proc far

var_50		= word ptr -50h
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 50h
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_8E4A9
		push	146h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_8E4A9
		jmp	loc_8E5B0

loc_8E4A9:
		mov	ax, si
		add	ax, 14h
		mov	ax, si
		add	ax, 18h
		mov	ax, si
		add	ax, 1Ch
		mov	dword ptr [si+20h], 0
		mov	byte ptr [si+24h], 2
		mov	byte ptr [si+25h], 0
		mov	dword ptr [si+26h], 0
		mov	dword ptr [si+2Ah], 0
		mov	byte ptr [si+2Eh], 2
		mov	byte ptr [si+2Fh], 0
		mov	dword ptr [si+30h], 0
		mov	word ptr [si+34h], 0
		push	seg seg225
		push	0
		push	ds
		push	offset aNAVMAP
		push	ds
		push	offset aCOCKPITS
		lea	ax, [bp+var_50]
		push	ax
		call	sub_29540
		add	sp, 0Eh
		lea	ax, [bp+var_50]
		push	ax
		push	si
		push	cs
		call	near ptr sub_8CBC6
		add	sp, 4
		mov	ax, word_79B8C
		add	ax, 79h
		mov	[si+138h], ax
		push	word ptr [si+138h]
		call	Lexer_NextToken
		pop	cx
		push	si
		push	cs
		call	near ptr NavMap_SetObjective_8E11F
		pop	cx
		mov	al, [bp+arg_2]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8E5B0
		push	si
		push	cs
		call	near ptr sub_8E26D
		pop	cx
		cmp	byte ptr [si+25h], 0
		jz	short loc_8E562
		cmp	dword ptr [si+20h], 0
		jz	short loc_8E562
		push	0
		mov	al, [si+24h]
		push	ax
		mov	ax, si
		add	ax, 20h
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_8E562

loc_8E562:
		mov	dword ptr [si+20h], 0
		mov	byte ptr [si+25h], 0
		mov	dword ptr [si+26h], 0
		cmp	byte ptr [si+2Fh], 0
		jz	short loc_8E59C
		cmp	dword ptr [si+2Ah], 0
		jz	short loc_8E59C
		push	0
		mov	al, [si+2Eh]
		push	ax
		mov	ax, si
		add	ax, 2Ah
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_8E59C

loc_8E59C:
		mov	dword ptr [si+2Ah], 0
		mov	byte ptr [si+2Fh], 0
		mov	dword ptr [si+30h], 0

loc_8E5B0:
		mov	ax, si
		pop	si
		leave
		retf
sub_8E489		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GlyphObject_ReleaseMultiple_7FA32 (sub_7FA32 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; libère 2 blocs typés (Memory_TypedFree_5C7B6 ×2, CRT_FreeNear_Wrap).
; ==============================================================================================
GlyphObject_ReleaseMultiple_8E5B5		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_8E5C7
		jmp	loc_8E65F

loc_8E5C7:
		cmp	word ptr [si+34h], 0
		jz	short loc_8E5DE
		push	3
		push	word ptr [si+34h]
		mov	bx, [si+34h]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_8E5DE

loc_8E5DE:
		cmp	byte ptr [si+2Fh], 0
		jz	short loc_8E604
		cmp	dword ptr [si+2Ah], 0
		jz	short loc_8E604
		push	0
		mov	al, [si+2Eh]
		push	ax
		mov	ax, si
		add	ax, 2Ah
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_8E604

loc_8E604:
		mov	dword ptr [si+2Ah], 0
		mov	byte ptr [si+2Fh], 0
		mov	dword ptr [si+30h], 0
		cmp	byte ptr [si+25h], 0
		jz	short loc_8E63E
		cmp	dword ptr [si+20h], 0
		jz	short loc_8E63E
		push	0
		mov	al, [si+24h]
		push	ax
		mov	ax, si
		add	ax, 20h
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_8E63E

loc_8E63E:
		mov	dword ptr [si+20h], 0
		mov	byte ptr [si+25h], 0
		mov	dword ptr [si+26h], 0
		test	di, 1
		jz	short loc_8E65F
		push	si
		call	sub_3B2
		pop	cx

loc_8E65F:
		pop	di
		pop	si
		pop	bp
		retf
GlyphObject_ReleaseMultiple_8E5B5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8E663		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_8E68C
		push	0
		push	si
		call	sub_69368
		add	sp, 4
		test	di, 1
		jz	short loc_8E68C
		push	si
		call	sub_3B2
		pop	cx
		jmp	short loc_8E68C

loc_8E68C:
		pop	di
		pop	si
		pop	bp
		retf
sub_8E663		endp
ovr247		ends

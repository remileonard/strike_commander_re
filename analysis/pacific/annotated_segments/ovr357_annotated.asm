ovr357		segment	para public 'OVERLAY' use16
		assume cs:ovr357
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C60D0		proc far

var_C		= word ptr -0Ch
var_4		= word ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		mov	byte ptr [bp+var_C], 0
		mov	ax, 0C00h
		int	21h

loc_C60DF:
		lea	ax, [bp+var_C]
		push	ax
		call	TextScroll_FormatAndApply_6F343
		pop	cx
		cmp	byte ptr [bp+var_C], 0
		jnz	short loc_C6111
		lea	ax, [bp+var_C]
		push	ax
		call	Input_ReadCombinedAxes
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_C6111
		lea	ax, [bp+var_4]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	Input_ReadAxis2Deadzone
		add	sp, 4
		jmp	short loc_C6111

loc_C6111:
		cmp	byte ptr [bp+var_C], 0
		jnz	short loc_C60DF
		cmp	byte ptr [bp+var_4], 0
		jnz	short loc_C60DF
		leave
		retf
sub_C60D0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C611F		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_2]
		mov	di, [si+3]
		mov	bx, [bp+arg_4]
		mov	ax, [bx+3]
		mov	[bp+var_2], ax
		xor	cx, cx
		jmp	short loc_C61AD

loc_C613A:
		mov	bx, cx
		imul	bx, bx, 3
		mov	al, [bx+di]
		mov	ah, 0
		imul	ax, ax, 0Bh
		mov	[bp+var_4], ax
		mov	bx, cx
		imul	bx, bx, 3
		mov	al, [bx+di+1]
		mov	ah, 0
		imul	ax, ax, 3Bh
		mov	[bp+var_6], ax
		mov	bx, cx
		imul	bx, bx, 3
		mov	al, [bx+di+2]
		mov	ah, 0
		imul	ax, ax, 1Eh
		mov	[bp+var_8], ax
		mov	ax, [bp+var_4]
		add	ax, [bp+var_6]
		add	ax, [bp+var_8]
		mov	bx, 64h
		cwd
		idiv	bx
		mov	bx, [bp+arg_0]
		add	bx, cx
		mov	[bx], al
		mov	ax, cx
		imul	ax, ax, 3
		mov	bx, [bp+var_2]
		add	bx, ax
		mov	si, [bp+arg_0]
		add	si, cx
		mov	al, [si]
		mov	[bx+2], al
		mov	dx, cx
		imul	dx, dx, 3
		mov	bx, [bp+var_2]
		add	bx, dx
		mov	[bx+1], al
		mov	dx, cx
		imul	dx, dx, 3
		mov	bx, [bp+var_2]
		add	bx, dx
		mov	[bx], al
		inc	cx

loc_C61AD:
		cmp	cx, 100h
		jl	short loc_C613A
		pop	di
		pop	si
		leave
		retf
sub_C611F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C61B7		proc far

var_198		= word ptr -198h
var_16E		= word ptr -16Eh
var_147		= word ptr -147h
var_13B		= dword ptr -13Bh
var_137		= dword ptr -137h
var_132		= word ptr -132h
var_11D		= dword ptr -11Dh
var_119		= byte ptr -119h
var_118		= byte ptr -118h
var_117		= dword ptr -117h
var_113		= word ptr -113h
var_FF		= word ptr -0FFh
var_FD		= word ptr -0FDh
var_FA		= word ptr -0FAh
var_EA		= word ptr -0EAh
var_E8		= word ptr -0E8h
var_E6		= word ptr -0E6h
var_E2		= word ptr -0E2h
var_92		= word ptr -92h
var_42		= dword ptr -42h
var_40		= dword ptr -40h
var_3E		= dword ptr -3Eh
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_33		= byte ptr -33h
var_32		= word ptr -32h
var_30		= word ptr -30h
var_2E		= dword ptr -2Eh
var_2A		= byte ptr -2Ah
var_29		= byte ptr -29h
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= byte ptr -20h
var_1F		= byte ptr -1Fh
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= dword ptr -0Eh
var_A		= byte ptr -0Ah
var_9		= byte ptr -9
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 198h
		push	si
		mov	[bp+var_2], 0
		mov	[bp+var_4], 0
		mov	[bp+var_E], 0
		mov	[bp+var_A], 2
		mov	[bp+var_9], 0
		mov	[bp+var_8], 0
		mov	[bp+var_16], 0
		mov	[bp+var_14], 0
		mov	[bp+var_12], 13Fh
		mov	[bp+var_10], 0C7h
		cmp	byte_76D40, 0
		jz	short loc_C6262
		push	1
		push	0
		push	3
		push	large 0FA00h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_1A+2], dx
		mov	word ptr [bp+var_1A], ax
		mov	eax, [bp+var_1A]
		mov	[bp+var_E], eax
		mov	[bp+var_A], 3
		mov	[bp+var_9], 1
		mov	[bp+var_8], 0
		mov	[bp+var_8], 0FA00h
		lea	ax, [bp+var_16]
		push	ax
		push	0
		mov	al, [bp+var_A]
		push	ax
		push	large [bp+var_E]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	word_7AF7E
		call	sub_6AEF8
		add	sp, 8
		jmp	short loc_C6271

loc_C6262:
		push	large dword_7CC11
		push	0
		call	sub_74A87
		add	sp, 6

loc_C6271:
		mov	[bp+var_24], 0
		mov	[bp+var_20], 2
		mov	[bp+var_1F], 0
		mov	[bp+var_1E], 0
		mov	[bp+var_2E], 0
		mov	[bp+var_2A], 2
		mov	[bp+var_29], 0
		mov	[bp+var_28], 0
		push	seg seg008
		push	offset loc_6221
		lea	ax, [bp+var_92]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	seg seg008
		push	offset loc_6217
		lea	ax, [bp+var_E2]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	ss
		lea	ax, [bp+var_E2]
		push	ax
		push	ss
		lea	ax, [bp+var_92]
		push	ax
		push	seg dseg
		push	0ECDh
		lea	ax, [bp+var_132]
		push	ax
		call	sub_29540
		add	sp, 0Eh
		lea	ax, [bp+var_198]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_198], 508h
		mov	[bp+var_137], 100h
		mov	[bp+var_13B], 0
		mov	[bp+var_198], 0E61h
		push	1
		lea	ax, [bp+var_132]
		push	ax
		lea	ax, [bp+var_198]
		push	ax
		mov	bx, [bp+var_198]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_198]
		push	ax
		call	StreamReader_GetCapacity_6C5B4
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_38], eax
		mov	[bp+var_3C], eax
		push	1
		push	0
		push	3
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_3E], dx
		mov	word ptr [bp+var_40], ax
		mov	eax, [bp+var_40]
		mov	[bp+var_24], eax
		mov	[bp+var_20], 3
		mov	[bp+var_1F], 1
		mov	[bp+var_1E], 0
		mov	eax, [bp+var_3C]
		mov	[bp+var_1E], eax
		push	large 0FFFFFFFFh
		push	large [bp+var_38]
		push	0
		mov	al, [bp+var_20]
		push	ax
		push	large [bp+var_24]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_198]
		push	ax
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		lea	ax, [bp+var_198]
		push	ax
		call	sub_6C2A4
		pop	cx
		push	0
		lea	ax, [bp+var_198]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		push	seg seg008
		push	offset loc_621C
		lea	ax, [bp+var_92]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	seg seg008
		push	offset loc_6217
		lea	ax, [bp+var_E2]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	ss
		lea	ax, [bp+var_E2]
		push	ax
		push	ss
		lea	ax, [bp+var_92]
		push	ax
		push	seg dseg
		push	0ECDh
		lea	ax, [bp+var_132]
		push	ax
		call	sub_29540
		add	sp, 0Eh
		lea	ax, [bp+var_198]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_198], 508h
		mov	[bp+var_137], 100h
		mov	[bp+var_13B], 0
		mov	[bp+var_198], 0E61h
		push	1
		lea	ax, [bp+var_132]
		push	ax
		lea	ax, [bp+var_198]
		push	ax
		mov	bx, [bp+var_198]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_198]
		push	ax
		call	StreamReader_GetCapacity_6C5B4
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_38], eax
		mov	[bp+var_3C], eax
		push	1
		push	0
		push	3
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_3E], dx
		mov	word ptr [bp+var_40], ax
		mov	eax, [bp+var_40]
		mov	[bp+var_2E], eax
		mov	[bp+var_2A], 3
		mov	[bp+var_29], 1
		mov	[bp+var_28], 0
		mov	eax, [bp+var_3C]
		mov	[bp+var_28], eax
		push	large 0FFFFFFFFh
		push	large [bp+var_38]
		push	0
		mov	al, [bp+var_2A]
		push	ax
		push	large [bp+var_2E]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_198]
		push	ax
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		lea	ax, [bp+var_198]
		push	ax
		call	sub_6C2A4
		pop	cx
		push	0
		lea	ax, [bp+var_198]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		lea	ax, [bp+var_FA]
		push	ax
		call	GlyphObject_AllocateBuffer_69123
		pop	cx
		lea	ax, word ptr [bp+var_2E]
		push	ax
		lea	ax, [bp+var_FA]
		push	ax
		call	sub_690A8
		add	sp, 4
		mov	[bp+var_EA], 1
		mov	[bp+var_E8], 0
		mov	[bp+var_E6], 3
		mov	bx, word_79260
		mov	ax, [bx+14h]
		mov	[bp+var_30], ax
		lea	ax, [bp+var_FA]
		mov	[bx+14h], ax
		push	0FFh
		push	bx
		call	sub_75D09
		add	sp, 4
		push	large 320082h
		push	large 750042h
		lea	ax, [bp+var_16E]
		push	ax
		call	sub_74C99
		add	sp, 0Ah
		mov	[bp+var_FF], 0
		mov	[bp+var_FD], 1
		mov	eax, [bp+var_24]
		mov	[bp+var_38], eax
		mov	al, [bp+var_20]
		mov	byte ptr [bp+var_3C+3], al
		mov	eax, [bp+var_38]
		mov	[bp+var_11D], eax
		mov	al, byte ptr [bp+var_3C+3]
		mov	[bp+var_119], al
		mov	[bp+var_118], 0
		mov	[bp+var_117], 0
		mov	eax, [bp+var_1E]
		mov	[bp+var_117], eax
		mov	[bp+var_113], 0
		push	seg seg008
		push	offset loc_5917
		lea	ax, [bp+var_92]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	large 2Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_C6600
		lea	ax, [bp+var_92]
		mov	word ptr [bp+var_3C], ds
		mov	word ptr [bp+var_3E], ax
		push	large 0B001Eh
		push	large 380038h
		push	si
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [si+0Eh], 0C9Ah
		mov	dword ptr [si+24h], 0
		push	large [bp+var_3E]
		push	si
		call	sub_74B18
		add	sp, 6
		mov	word ptr [si+1Eh], 0
		mov	word ptr [si+20h], 0
		mov	ax, word_7921A
		mov	[si+2Ah], ax
		mov	[si+28h], ax
		mov	word ptr [si+22h], 0FFFFh
		mov	word ptr [si+0Eh], 0E2Dh
		lea	ax, [bp+var_4]
		mov	[si+2Ch], ax
		mov	ax, si
		jmp	short loc_C6602

loc_C6600:
		mov	ax, si

loc_C6602:
		push	ax
		lea	ax, [bp+var_16E]
		push	ax
		call	sub_74C8A
		add	sp, 6
		mov	bx, [bp+var_147]
		mov	word ptr [bx+18h], 0
		mov	word ptr [bx+22h], 0FFFEh
		mov	word ptr [bx+28h], 0FFFFh
		mov	word ptr [bx+2Ah], 0FFFFh
		push	bx
		push	15h
		lea	ax, [bp+var_16E]
		push	ax
		call	sub_74C76
		add	sp, 6
		push	seg seg008
		push	offset loc_591B
		lea	ax, [bp+var_92]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	large 2Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_C66BA
		lea	ax, [bp+var_92]
		mov	word ptr [bp+var_40], ds
		mov	word ptr [bp+var_42], ax
		push	large 0B001Eh
		push	large 380060h
		push	si
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [si+0Eh], 0C9Ah
		mov	dword ptr [si+24h], 0
		push	large [bp+var_42]
		push	si
		call	sub_74B18
		add	sp, 6
		mov	word ptr [si+1Eh], 0
		mov	word ptr [si+20h], 0
		mov	ax, word_7921A
		mov	[si+2Ah], ax
		mov	[si+28h], ax
		mov	word ptr [si+22h], 0FFFFh
		mov	word ptr [si+0Eh], 0E2Dh
		lea	ax, [bp+var_2]
		mov	[si+2Ch], ax
		mov	ax, si
		jmp	short loc_C66BC

loc_C66BA:
		mov	ax, si

loc_C66BC:
		push	ax
		lea	ax, [bp+var_16E]
		push	ax
		call	sub_74C8A
		add	sp, 6
		mov	bx, [bp+var_147]
		mov	word ptr [bx+18h], 0
		mov	word ptr [bx+22h], 0FFFEh
		mov	word ptr [bx+28h], 0FFFFh
		mov	word ptr [bx+2Ah], 0FFFFh
		push	bx
		push	31h
		lea	ax, [bp+var_16E]
		push	ax
		call	sub_74C76
		add	sp, 6
		lea	ax, [bp+var_16E]
		push	ax
		call	sub_74CC6
		pop	cx
		lea	ax, [bp+var_16E]
		push	ax
		call	sub_74AD7
		pop	cx
		push	seg seg008
		push	offset loc_6229
		lea	ax, [bp+var_92]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	word_79260
		push	0FFFFh
		lea	ax, [bp+var_92]
		push	ax
		push	large 8B0070h
		call	sub_74BA9
		add	sp, 0Ah
		lea	ax, [bp+var_16E]
		push	ax
		call	sub_74ADC
		pop	cx
		jmp	short loc_C6750

loc_C6741:
		push	0
		lea	ax, [bp+var_16E]
		push	ax
		call	sub_74CE4
		add	sp, 4

loc_C6750:
		cmp	[bp+var_2], 0
		jnz	short loc_C675C
		cmp	[bp+var_4], 0
		jz	short loc_C6741

loc_C675C:
		lea	ax, [bp+var_16E]
		push	ax
		call	sub_74CEE
		pop	cx
		lea	ax, [bp+var_16]
		push	ax
		push	0
		mov	al, [bp+var_A]
		push	ax
		push	large [bp+var_E]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	word_7AF7E
		call	sub_6ACDA
		add	sp, 8
		push	2
		lea	ax, [bp+var_16E]
		push	ax
		call	sub_74CA8
		add	sp, 4
		push	2
		lea	ax, [bp+var_FA]
		push	ax
		call	sub_69368
		add	sp, 4
		call	TextScrollDisplayB_ApplyHelperD_6FAF5
		mov	ax, [bp+var_30]
		mov	[bp+var_32], ax
		mov	bx, word_79260
		mov	[bx+14h], ax
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		mov	al, byte ptr [bp+var_4]
		mov	[bp+var_33], al
		cmp	[bp+var_29], 0
		jz	short loc_C67F6
		cmp	[bp+var_2E], 0
		jz	short loc_C67F6
		push	0
		mov	al, [bp+var_2A]
		push	ax
		lea	ax, word ptr [bp+var_2E]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_C67F6

loc_C67F6:
		mov	[bp+var_2E], 0
		mov	[bp+var_29], 0
		mov	[bp+var_28], 0
		cmp	[bp+var_1F], 0
		jz	short loc_C682E
		cmp	[bp+var_24], 0
		jz	short loc_C682E
		push	0
		mov	al, [bp+var_20]
		push	ax
		lea	ax, word ptr [bp+var_24]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_C682E

loc_C682E:
		mov	[bp+var_24], 0
		mov	[bp+var_1F], 0
		mov	[bp+var_1E], 0
		cmp	[bp+var_9], 0
		jz	short loc_C6866
		cmp	[bp+var_E], 0
		jz	short loc_C6866
		push	0
		mov	al, [bp+var_A]
		push	ax
		lea	ax, word ptr [bp+var_E]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_C6866

loc_C6866:
		mov	al, [bp+var_33]
		pop	si
		leave
		retf
sub_C61B7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C686C		proc far

var_90		= word ptr -90h
var_40		= word ptr -40h
var_3E		= word ptr -3Eh
var_3B		= word ptr -3Bh
var_38		= word ptr -38h
var_34		= word ptr -34h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= dword ptr -12h
var_E		= byte ptr -0Eh
var_D		= byte ptr -0Dh
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 90h
		push	si
		push	di
		push	100h
		push	0
		lea	ax, [bp+var_3E]
		push	ax
		call	sub_76245
		add	sp, 6
		lea	ax, [bp+var_3E]
		push	ax
		call	sub_7625E
		pop	cx
		mov	ax, [bp+var_3B]
		mov	[bp+var_40], ax
		push	large 320032h
		push	32h
		push	ds
		push	ax
		call	sub_74B4F
		add	sp, 0Ah
		mov	[bp+var_2], ax
		lea	ax, [bp+var_3E]
		push	ax
		call	sub_7627C
		pop	cx
		mov	bx, word_77533
		mov	al, [bx+16h]
		mov	ah, 0
		mov	[bp+var_3], al
		mov	al, byte ptr [bp+var_2]
		push	ax
		push	bx
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_12], 0
		mov	[bp+var_E], 2
		mov	[bp+var_D], 0
		mov	[bp+var_C], 0
		mov	ax, word_7AF7E
		mov	[bp+var_14], ax
		push	ax
		mov	ax, word_77535
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_67C41
		add	sp, 4
		push	[bp+arg_0]
		push	word_77535
		call	sub_75D4F
		add	sp, 4
		mov	[bp+var_16], ax
		mov	bx, [bp+var_16]
		add	bx, 14h
		mov	cx, 14h
		mov	ax, bx
		sar	ax, 1
		mov	di, 0A0h
		sub	di, ax
		mov	ax, cx
		sar	ax, 1
		mov	si, 64h
		sub	si, ax
		mov	ax, di
		add	ax, bx
		dec	ax
		mov	[bp+var_6], ax
		mov	ax, si
		add	ax, cx
		dec	ax
		mov	[bp+var_8], ax
		mov	[bp+var_20], di
		mov	[bp+var_22], si
		mov	ax, [bp+var_6]
		mov	[bp+var_24], ax
		mov	ax, [bp+var_8]
		mov	[bp+var_26], ax
		mov	ax, [bp+var_20]
		mov	[bp+var_1E], ax
		mov	ax, [bp+var_22]
		mov	[bp+var_1C], ax
		mov	ax, [bp+var_24]
		mov	[bp+var_1A], ax
		mov	ax, [bp+var_26]
		mov	[bp+var_18], ax
		mov	ax, bx
		imul	cx
		movsx	eax, ax
		mov	[bp+var_2A], eax
		mov	[bp+var_2E], eax
		push	1
		push	0
		push	2
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_32+2], dx
		mov	word ptr [bp+var_32], ax
		mov	eax, [bp+var_32]
		mov	[bp+var_12], eax
		mov	[bp+var_E], 2
		mov	[bp+var_D], 1
		mov	[bp+var_C], 0
		mov	eax, [bp+var_2E]
		mov	[bp+var_C], eax
		lea	ax, [bp+var_1E]
		push	ax
		push	0
		mov	al, [bp+var_E]
		push	ax
		push	large [bp+var_12]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	word_7AF7E
		call	sub_6AEF8
		add	sp, 8
		push	0
		push	[bp+var_8]
		push	[bp+var_6]
		push	si
		push	di
		push	word_7AF7E
		call	sub_69728
		add	sp, 0Ch
		mov	ax, [bp+var_16]
		sar	ax, 1
		mov	dx, 0A0h
		sub	dx, ax
		mov	[bp+var_34], dx
		push	seg seg008
		push	offset loc_60F1
		lea	ax, [bp+var_90]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	[bp+arg_0]
		mov	ax, si
		add	ax, 5
		push	ax
		push	[bp+var_34]
		lea	ax, [bp+var_90]
		push	ax
		push	word_77535
		call	sub_75D4A
		add	sp, 0Ah
		push	cs
		call	near ptr sub_C60D0

loc_C6A2A:
		push	0FFh
		lea	ax, [bp+var_38]
		push	ax
		call	sub_6EF5A
		add	sp, 4
		cmp	byte ptr [bp+var_38], 1
		jnz	short loc_C6A2A
		lea	ax, [bp+var_1E]
		push	ax
		push	0
		mov	al, [bp+var_E]
		push	ax
		push	large [bp+var_12]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	word_7AF7E
		call	sub_6ACDA
		add	sp, 8
		mov	al, [bp+var_3]
		push	ax
		push	word_77533
		mov	bx, word_77533
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		cmp	[bp+var_D], 0
		jz	short loc_C6A9E
		cmp	[bp+var_12], 0
		jz	short loc_C6A9E
		push	0
		mov	al, [bp+var_E]
		push	ax
		lea	ax, word ptr [bp+var_12]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_C6A9E

loc_C6A9E:
		pop	di
		pop	si
		leave
		retf
sub_C686C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C6AA2		proc far

var_78		= word ptr -78h
var_28		= word ptr -28h

		push	bp
		mov	bp, sp
		sub	sp, 78h
		push	seg seg008
		push	offset loc_6236
		lea	ax, [bp+var_78]
		push	ax
		call	sub_54BE
		add	sp, 6
		mov	bx, word_7D14D
		mov	al, [bx+4EEh]
		mov	ah, 0
		push	ax
		push	word_7D14A
		mov	al, byte_7D14C
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_78]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 0Ah
		lea	ax, [bp+var_28]
		push	ax
		push	cs
		call	near ptr sub_C686C
		pop	cx
		leave
		retf
sub_C6AA2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C6AEA		proc far

var_78		= word ptr -78h
var_28		= word ptr -28h

		push	bp
		mov	bp, sp
		sub	sp, 78h
		push	seg seg008
		push	offset loc_6241
		lea	ax, [bp+var_78]
		push	ax
		call	sub_54BE
		add	sp, 6
		mov	bx, word_7D14D
		push	large [bx+567h]
		lea	ax, [bp+var_78]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 8
		lea	ax, [bp+var_28]
		push	ax
		push	cs
		call	near ptr sub_C686C
		pop	cx
		leave
		retf
sub_C6AEA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C6B26		proc far

var_78		= word ptr -78h
var_28		= word ptr -28h

		push	bp
		mov	bp, sp
		sub	sp, 78h
		push	seg seg008
		push	offset loc_624C
		lea	ax, [bp+var_78]
		push	ax
		call	sub_54BE
		add	sp, 6
		mov	bx, word_7D14D
		mov	al, [bx+4EFh]
		mov	ah, 0
		push	ax
		push	word_76D18
		push	word_76D16
		lea	ax, [bp+var_78]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 0Ah
		lea	ax, [bp+var_28]
		push	ax
		push	cs
		call	near ptr sub_C686C
		pop	cx
		leave
		retf
sub_C6B26		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C6B6C		proc far

var_78		= word ptr -78h
var_28		= word ptr -28h

		push	bp
		mov	bp, sp
		sub	sp, 78h
		push	seg seg008
		push	offset loc_625F
		lea	ax, [bp+var_78]
		push	ax
		call	sub_54BE
		add	sp, 6
		lea	ax, [bp+var_78]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 4
		lea	ax, [bp+var_28]
		push	ax
		push	cs
		call	near ptr sub_C686C
		pop	cx
		leave
		retf
sub_C6B6C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C6B9F		proc far

var_52		= word ptr -52h
var_1		= byte ptr -1

		push	bp
		mov	bp, sp
		sub	sp, 52h
		mov	al, byte_7B29A
		mov	[bp+var_1], al
		call	TextScrollDisplayB_ApplyHelperD_6FAF5
		push	word_7D14D
		call	sub_60DA5
		pop	cx
		push	cs
		call	near ptr sub_C61B7
		or	al, al
		jnz	short loc_C6BC5
		jmp	loc_C6C9F

loc_C6BC5:
		mov	bx, word_7D14D
		cmp	byte ptr [bx+7C5h], 0
		jz	short loc_C6C19
		push	58h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	33h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	0
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_52]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		lea	ax, [bp+var_52]
		push	ax
		push	word_7D14D
		call	sub_759F5
		add	sp, 4

loc_C6C19:
		mov	bx, word_7D14D
		cmp	word ptr [bx+7B8h], 0
		jz	short loc_C6C9A
		mov	bx, [bx+7B8h]
		cmp	byte ptr [bx+5], 0
		jz	short loc_C6C5F
		mov	bx, word_7D14D
		mov	bx, [bx+7B8h]
		cmp	dword ptr [bx], 0
		jz	short loc_C6C5F
		push	0
		mov	bx, word_7D14D
		mov	bx, [bx+7B8h]
		mov	al, [bx+4]
		push	ax
		mov	bx, word_7D14D
		push	word ptr [bx+7B8h]
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_C6C5F

loc_C6C5F:
		mov	bx, word_7D14D
		mov	bx, [bx+7B8h]
		mov	dword ptr [bx], 0
		mov	bx, word_7D14D
		mov	bx, [bx+7B8h]
		mov	byte ptr [bx+5], 0
		mov	bx, word_7D14D
		mov	bx, [bx+7B8h]
		mov	dword ptr [bx+6], 0
		mov	bx, word_7D14D
		push	word ptr [bx+7B8h]
		call	sub_3B2
		pop	cx
		jmp	short loc_C6C9A

loc_C6C9A:
		nop
		push	cs
		call	near ptr sub_C6D68

loc_C6C9F:
		call	TextScrollDisplayB_ApplyHelperD_6FAF5
		push	word_7D14D
		call	sub_60ED7
		pop	cx
		cmp	[bp+var_1], 0
		jz	short loc_C6CB9
		call	TextScrollDisplayB_ApplyHelperC_6FABB

loc_C6CB9:
		leave
		retf
sub_C6B9F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C6CBB		proc far

var_1		= byte ptr -1

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		cmp	byte_7D348, 1
		jz	short loc_C6CD0
		cmp	byte_7D369, 1
		jnz	short loc_C6CD5

loc_C6CD0:
		mov	ax, 1
		jmp	short loc_C6CD7

loc_C6CD5:
		xor	ax, ax

loc_C6CD7:
		mov	[bp+var_1], al
		cmp	[bp+var_1], 0
		jnz	short loc_C6CE3
		jmp	loc_C6D65

loc_C6CE3:
		cmp	byte_7D334, 1
		jnz	short loc_C6D10
		mov	byte_775FC, 0
		xor	si, si
		jmp	short loc_C6D09

loc_C6CF3:
		cmp	byte ptr [si+6398h], 0
		jz	short loc_C6D08
		push	1
		push	si
		push	6343h
		call	sub_738BF
		add	sp, 6

loc_C6D08:
		inc	si

loc_C6D09:
		cmp	si, 2
		jl	short loc_C6CF3
		jmp	short loc_C6D65

loc_C6D10:
		cmp	byte_7D33F, 1
		jnz	short loc_C6D1D
		push	cs
		call	near ptr sub_C6B26
		jmp	short loc_C6D65

loc_C6D1D:
		cmp	byte_7D33D, 1
		jnz	short loc_C6D38
		mov	bx, word_7D14D
		mov	al, [bx+7C6h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_C6D65
		push	cs
		call	near ptr sub_C6B9F
		jmp	short loc_C6D65

loc_C6D38:
		cmp	byte_7D32F, 1
		jnz	short loc_C6D45
		push	cs
		call	near ptr sub_C6AEA
		jmp	short loc_C6D65

loc_C6D45:
		cmp	byte_7752E, 0
		jz	short loc_C6D65
		cmp	byte_7D327, 1
		jnz	short loc_C6D59
		push	cs
		call	near ptr sub_C6AA2
		jmp	short loc_C6D65

loc_C6D59:
		cmp	byte_7D331, 1
		jnz	short loc_C6D65
		call	sub_757B0

loc_C6D65:
		pop	si
		leave
		retf
sub_C6CBB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C6D68		proc far
		push	bp
		mov	bp, sp
		mov	byte_79E75, 1
		call	sub_682F1
		push	6996h
		call	sub_7562A
		pop	cx
		push	39E0h
		call	CRT_Msg_NullPtrAssign
		pop	cx
		push	1
		call	CRT_Exit
		pop	cx
		pop	bp
		retf
sub_C6D68		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C6D91		proc far

var_C		= word ptr -0Ch
var_4		= word ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	cs
		call	near ptr sub_C6CBB
		cmp	byte_7D13E, 0
		jz	short loc_C6DA6

loc_C6DA2:
		mov	al, 1
		jmp	short loc_C6DFD

loc_C6DA6:
		mov	byte ptr [bp+var_C], 0
		lea	ax, [bp+var_C]
		push	ax
		call	TextScroll_FormatAndApply_6F343
		pop	cx
		cmp	byte ptr [bp+var_C], 0
		jnz	short loc_C6DDC
		lea	ax, [bp+var_C]
		push	ax
		call	Input_ReadCombinedAxes
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_C6DDC
		lea	ax, [bp+var_4]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	Input_ReadAxis2Deadzone
		add	sp, 4
		jmp	short loc_C6DDC

loc_C6DDC:
		cmp	byte ptr [bp+var_4], 2
		jnz	short loc_C6DF5
		cmp	byte ptr [bp+var_4+1], 1
		jnz	short loc_C6DEF
		mov	byte_7D13E, 1
		jmp	short loc_C6DA2

loc_C6DEF:
		cmp	byte ptr [bp+var_4+1], 39h
		jz	short loc_C6DA2

loc_C6DF5:
		cmp	byte ptr [bp+var_C], 2
		jz	short loc_C6DA2
		mov	al, 0

loc_C6DFD:
		leave
		retf
sub_C6D91		endp
ovr357		ends

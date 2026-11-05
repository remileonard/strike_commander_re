ovr238		segment	para public 'OVERLAY' use16
		assume cs:ovr238
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_877A0		proc far

var_FE		= word ptr -0FEh
var_E4		= word ptr -0E4h
var_E0		= word ptr -0E0h
var_DA		= word ptr -0DAh
var_D6		= word ptr -0D6h
var_D0		= word ptr -0D0h
var_CE		= dword ptr -0CEh
var_CA		= word ptr -0CAh
var_C4		= word ptr -0C4h
var_BE		= word ptr -0BEh
var_85		= word ptr -85h
var_7F		= byte ptr -7Fh
var_5F		= word ptr -5Fh
var_5E		= word ptr -5Eh
var_34		= word ptr -34h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_C		= byte ptr -0Ch
var_B		= byte ptr -0Bh
var_A		= word ptr -0Ah
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0FEh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_1], 1
		mov	byte_79B64, 1
		push	61Dh
		call	sub_51B93
		pop	cx
		mov	byte_79B64, 0
		mov	byte_7C87C, 0
		lea	ax, [bp+var_A]
		push	ax
		call	String_ConstructEmpty
		pop	cx
		push	8
		push	623h
		lea	ax, [bp+var_A]
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	[bp+var_2], 0
		mov	[bp+var_B], 1
		mov	[bp+var_C], 0
		push	0
		call	CRT_Time_FBB
		pop	cx
		push	ax
		call	CRT_Srand_80E
		pop	cx
		push	ds
		push	offset aSHP
		push	ds
		push	offset aSMFONT
		push	ds
		push	offset aFONTS
		lea	ax, [bp+var_5E]
		push	ax
		call	sub_29540
		add	sp, 0Eh
		lea	ax, [bp+var_5E]
		push	ax
		push	di
		push	si
		push	633Eh
		call	sub_73856
		add	sp, 8
		push	0
		push	large 100h
		push	ds
		push	offset byte_76730
		push	6B20h
		call	FontStyle_ApplyVariantB_68651
		add	sp, 0Ch
		push	0
		push	large 1000h
		push	large 0
		push	6B20h
		call	FontStyle_ApplyVariantB_68651
		add	sp, 0Ch
		push	0FFFFh
		call	PagedResourceB_Helper_66268
		pop	cx
		push	0FFh
		call	sub_64C31
		pop	cx
		cmp	si, 1
		jle	short loc_87875
		mov	[bp+var_1], 0
		mov	byte_77537, 1

loc_87875:
		push	63B4h
		call	sub_7396E
		pop	cx
		jmp	loc_87A07

loc_87881:
		cmp	[bp+var_B], 0
		jz	short loc_878FA
		mov	byte_76D40, 1
		mov	[bp+var_C], 1
		cmp	byte_7C9F0, 2
		jnz	short loc_878A6
		push	0
		push	62B0h
		call	sub_1E034
		add	sp, 4
		jmp	short loc_878A6

loc_878A6:
		push	di
		push	si
		call	sub_75AB4
		add	sp, 4
		mov	[bp+var_B], 0
		cmp	byte_7C9F0, 2
		jnz	short loc_878F7
		push	62B0h
		call	sub_1DF08
		pop	cx
		mov	[bp+var_E], ax
		push	1
		push	62B0h
		call	sub_1E034
		add	sp, 4
		push	large 20000h
		push	62B0h
		call	sub_1DF2E
		add	sp, 6
		cmp	[bp+var_E], 0
		jnz	short loc_878F7
		push	62B0h
		call	sub_1DF1C
		pop	cx
		jmp	loc_87A02

loc_878F7:
		jmp	loc_87A02

loc_878FA:
		mov	byte_76D40, 0
		lea	ax, [bp+var_FE]
		push	ax
		call	String_ConstructEmpty
		pop	cx
		lea	ax, [bp+var_E4]
		push	ax
		call	sub_75332
		pop	cx
		lea	ax, [bp+var_E0]
		push	ax
		call	sub_75341
		pop	cx
		lea	ax, [bp+var_DA]
		push	ax
		call	sub_75350
		pop	cx
		lea	ax, [bp+var_D6]
		push	ax
		call	sub_7535F
		pop	cx
		mov	[bp+var_D0], 0
		mov	[bp+var_CE], 0
		lea	ax, [bp+var_CA]
		push	ax
		call	sub_75391
		pop	cx
		lea	ax, [bp+var_C4]
		push	ax
		call	sub_753AF
		pop	cx
		lea	ax, [bp+var_BE]
		push	ax
		call	sub_7530A
		pop	cx
		mov	[bp+var_85], 0
		mov	[bp+var_7F], 0
		push	seg seg067
		push	offset String_ConstructEmpty
		push	large 10003h
		push	9
		lea	ax, [bp+var_5F]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[bp+var_34], 0
		mov	[bp+var_12], 0
		lea	ax, [bp+var_FE]
		push	ax
		call	sub_752A3
		pop	cx
		cmp	[bp+var_C], 0
		jz	short loc_879B5
		lea	ax, [bp+var_FE]
		push	ax
		call	sub_752BC
		pop	cx
		jmp	short loc_879CB

loc_879B5:
		mov	byte_79C9E, 1
		lea	ax, [bp+var_A]
		push	ax
		lea	ax, [bp+var_FE]
		push	ax
		call	sub_752A8
		add	sp, 4

loc_879CB:
		lea	ax, [bp+var_FE]
		push	ax
		call	sub_55100
		pop	cx
		lea	ax, [bp+var_FE]
		push	ax
		call	sub_752B2
		pop	cx
		push	65D0h
		call	sub_741E8
		pop	cx
		mov	[bp+var_B], 1
		mov	byte_7C87C, 1
		push	2
		lea	ax, [bp+var_FE]
		push	ax
		call	sub_752AD
		add	sp, 4

loc_87A02:
		mov	byte_76D40, 1

loc_87A07:
		mov	al, byte_77537
		mov	ah, 0
		or	ax, ax
		jnz	short loc_87A13
		jmp	loc_87881

loc_87A13:
		cmp	byte_77537, 0
		jz	short loc_87A4A
		mov	byte_79E75, 1
		call	sub_682F1
		push	6996h
		call	sub_7562A
		pop	cx
		cmp	[bp+var_1], 0
		jz	short loc_87A38
		push	63Eh
		jmp	short loc_87A3B

loc_87A38:
		push	675h

loc_87A3B:
		call	CRT_Msg_NullPtrAssign
		pop	cx
		push	1
		call	CRT_Exit
		jmp	short loc_87A5C

loc_87A4A:
		mov	byte_79E75, 0
		mov	al, byte_7CA9D
		mov	byte_7CA9C, al
		push	0
		call	PagedResourceC_RefreshAndFinalize_68315

loc_87A5C:
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_877A0		endp
ovr238		ends

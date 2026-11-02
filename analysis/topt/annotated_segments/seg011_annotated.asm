seg011		segment	para public 'CODE' use16
		assume cs:seg011
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 56h, 9Ah, 9Ch, 3, 0, 0, 83h, 0C4h, 2

loc_71B9:
		db 5Fh, 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_71BD		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word ptr [si+1Ch], 0
		mov	word ptr [si+6], 0
		xor	dx, dx
		jmp	short loc_71DC

loc_71D2:
		mov	bx, dx
		shl	bx, 1
		mov	word ptr [bx+si+8], 0
		inc	dx

loc_71DC:
		cmp	dx, 0Ah
		jl	short loc_71D2
		pop	si
		pop	bp
		retf
sub_71BD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_71E4		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		call	sub_36702
		add	sp, 2
		xor	di, di
		jmp	short loc_7212

loc_71F9:
		mov	bx, di
		shl	bx, 1
		push	word ptr [bx+si+8]
		call	sub_330E8
		add	sp, 2
		mov	bx, di
		shl	bx, 1
		mov	word ptr [bx+si+8], 0
		inc	di

loc_7212:
		cmp	di, 0Ah
		jl	short loc_71F9
		pop	di
		pop	si
		pop	bp
		retf
sub_71E4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_721B		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_2], 0
		mov	word ptr [si+1Ch], 0
		mov	[bp+var_4], 0
		jmp	short loc_7265

loc_723A:
		push	di
		mov	bx, [bp+var_4]
		push	word ptr [bx+0Eh]
		call	CRT_Stricmp
		add	sp, 4
		or	ax, ax
		jnz	short loc_7265
		mov	bx, [bp+var_4]
		mov	ax, [bx+10h]
		cmp	ax, [bp+arg_4]
		jnz	short loc_7265
		mov	ax, [bp+var_4]
		mov	[si+1Ch], ax
		mov	[bp+var_2], 1
		jmp	short loc_7276

loc_7265:
		lea	ax, [bp+var_4]
		push	ax
		push	si
		call	LinkedList_Helper_36740
		add	sp, 4
		or	ax, ax
		jnz	short loc_723A

loc_7276:
		mov	al, byte ptr [bp+var_2]
		pop	di
		pop	si
		leave
		retf
sub_721B		endp

; START OF FUNCTION CHUNK FOR sub_721B
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_721B

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_7281		proc far

var_B4		= word ptr -0B4h
var_53		= dword ptr -53h
var_47		= word ptr -47h
var_43		= dword ptr -43h
var_3C		= word ptr -3Ch
var_3A		= dword ptr -3Ah
var_35		= byte ptr -35h
var_34		= dword ptr -34h
var_2F		= byte ptr -2Fh
var_2E		= word ptr -2Eh
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= word ptr -24h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_11		= byte ptr -11h
var_10		= word ptr -10h
var_E		= dword ptr -0Eh
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0B4h
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_721B
		add	sp, 6
		or	al, al
		jz	short loc_72CE
		mov	ax, [si+1Ch]
		cmp	ax, [si+2]
		jz	short loc_72C1
		push	0
		push	word ptr [si+1Ch]
		push	si
		call	LinkedListB_FindByKey_3669B
		add	sp, 6
		push	word ptr [si+1Ch]
		push	si
		call	sub_365EE
		add	sp, 4

loc_72C1:
		mov	ax, [si+1Ch]
		add	ax, 4
		pop	di
		pop	si
		leave
		retf
		jmp	loc_76C5

loc_72CE:
		cmp	word ptr [si+6], 0Ah
		jl	short loc_72D7
		jmp	loc_76B8

loc_72D7:
		mov	[bp+var_2], 0
		mov	[bp+var_4], 0
		jmp	short loc_730A

loc_72E3:
		mov	bx, [bp+var_4]
		shl	bx, 1
		push	word ptr [bx+si+8]
		push	[bp+arg_2]
		call	CRT_Stricmp
		add	sp, 4
		or	ax, ax
		jnz	short loc_7307
		mov	bx, [bp+var_4]
		shl	bx, 1
		mov	ax, [bx+si+8]
		mov	[bp+var_2], ax
		jmp	short loc_7312

loc_7307:
		inc	[bp+var_4]

loc_730A:
		mov	ax, [si+6]
		cmp	ax, [bp+var_4]
		jg	short loc_72E3

loc_7312:
		cmp	[bp+var_2], 0
		jnz	short loc_7331
		push	[bp+arg_2]
		call	CRT_Strdup
		add	sp, 2
		mov	bx, [si+6]
		shl	bx, 1
		mov	[bx+si+8], ax
		mov	[bp+var_2], ax
		inc	word ptr [si+6]

loc_7331:
		mov	ax, [bp+var_2]
		mov	[bp+var_6], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_8], ax
		push	12h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_A], ax
		or	ax, ax
		jz	short loc_739F
		mov	bx, [bp+var_A]
		mov	word ptr [bx], 4F8h
		mov	bx, [bp+var_A]
		mov	word ptr [bx+2], 0
		mov	bx, [bp+var_A]
		mov	word ptr [bx], 12E7h
		mov	bx, [bp+var_A]
		mov	dword ptr [bx+4], 0
		mov	bx, [bp+var_A]
		mov	byte ptr [bx+8], 2
		mov	bx, [bp+var_A]
		mov	byte ptr [bx+9], 0
		mov	bx, [bp+var_A]
		mov	dword ptr [bx+0Ah], 0
		mov	bx, [bp+var_A]
		mov	ax, [bp+var_6]
		mov	[bx+0Eh], ax
		mov	bx, [bp+var_A]
		mov	ax, [bp+var_8]
		mov	[bx+10h], ax
		mov	ax, [bp+var_A]
		jmp	short loc_73A2

loc_739F:
		mov	ax, [bp+var_A]

loc_73A2:
		mov	di, ax
		push	di
		push	si
		call	sub_365EE
		add	sp, 4
		push	1
		push	[bp+arg_2]
		lea	ax, [bp+var_B4]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		push	[bp+arg_4]
		lea	ax, [bp+var_B4]
		push	ax
		call	IndexedRecordReader_AdvanceIndex_436B6
		add	sp, 4
		mov	ax, [bp+var_47]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_73E1
		mov	eax, [bp+var_53]
		jmp	short loc_73E5

loc_73E1:
		mov	eax, [bp+var_43]

loc_73E5:
		mov	[bp+var_E], eax
		cmp	[bp+var_E], 0
		jnz	short loc_73F3
		jmp	loc_7689

loc_73F3:
		mov	[bp+var_11], 1
		cmp	[bp+var_E], 0FFFCh
		jle	short loc_7405
		mov	[bp+var_11], 0

loc_7405:
		push	0
		push	3
		push	6C14h
		call	Memory_TypedAllocDispatchC_329EC
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 6
		mov	[bp+var_16], eax
		push	0
		push	2
		push	6C14h
		call	Memory_TypedAllocDispatchC_329EC
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 6
		mov	[bp+var_1A], eax
		cmp	[bp+var_11], 0
		jnz	short loc_7446
		jmp	loc_74F8

loc_7446:
		mov	eax, [bp+var_E]
		cmp	eax, [bp+var_16]
		jl	short loc_7453
		jmp	loc_74F8

loc_7453:
		mov	eax, [bp+var_E]
		mov	[bp+var_1E], eax
		push	0
		push	0
		push	3
		push	large [bp+var_1E]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word ptr [bp+var_22+2], dx
		mov	word ptr [bp+var_22], ax
		mov	eax, [bp+var_22]
		mov	[di+4], eax
		mov	byte ptr [di+8], 3
		mov	byte ptr [di+9], 1
		mov	dword ptr [di+0Ah], 0
		mov	eax, [bp+var_1E]
		mov	[di+0Ah], eax
		push	0
		mov	al, [di+8]
		push	ax
		push	word ptr [di+6]
		push	word ptr [di+4]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		or	ax, dx
		jz	short loc_74F8
		push	0
		mov	al, [di+8]
		push	ax
		push	word ptr [di+6]
		push	word ptr [di+4]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+arg_4]
		lea	ax, [bp+var_B4]
		push	ax
		call	sub_43519
		add	sp, 8
		mov	ax, di
		add	ax, 4
		mov	[bp+var_24], ax
		push	2
		lea	ax, [bp+var_B4]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		mov	ax, [bp+var_24]
		pop	di
		pop	si
		leave
		retf

loc_74F8:
		mov	eax, [bp+var_E]
		cmp	eax, [bp+var_1A]
		jl	short loc_7505
		jmp	loc_75AA

loc_7505:
		mov	eax, [bp+var_E]
		mov	[bp+var_28], eax
		push	0
		push	0
		push	2
		push	large [bp+var_28]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word ptr [bp+var_2C+2], dx
		mov	word ptr [bp+var_2C], ax
		mov	eax, [bp+var_2C]
		mov	[di+4], eax
		mov	byte ptr [di+8], 2
		mov	byte ptr [di+9], 1
		mov	dword ptr [di+0Ah], 0
		mov	eax, [bp+var_28]
		mov	[di+0Ah], eax
		push	0
		mov	al, [di+8]
		push	ax
		push	word ptr [di+6]
		push	word ptr [di+4]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		or	ax, dx
		jz	short loc_75AA
		push	0
		mov	al, [di+8]
		push	ax
		push	word ptr [di+6]
		push	word ptr [di+4]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+arg_4]
		lea	ax, [bp+var_B4]
		push	ax
		call	sub_43519
		add	sp, 8
		mov	ax, di
		add	ax, 4
		mov	[bp+var_2E], ax
		push	2
		lea	ax, [bp+var_B4]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		mov	ax, [bp+var_2E]
		pop	di
		pop	si
		leave
		retf

loc_75AA:
		mov	[bp+var_2F], 2
		cmp	[bp+var_11], 0
		jz	short loc_75B8
		mov	[bp+var_2F], 3

loc_75B8:
		mov	al, [bp+var_2F]
		push	ax
		push	large [bp+var_E]
		push	si
		nop
		push	cs
		call	near ptr sub_76C9
		add	sp, 8
		mov	eax, [bp+var_E]
		mov	[bp+var_34], eax
		mov	al, [bp+var_2F]
		mov	[bp+var_35], al
		push	1
		push	0
		mov	al, [bp+var_35]
		push	ax
		push	large [bp+var_34]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word ptr [bp+var_3A+2], dx
		mov	word ptr [bp+var_3A], ax
		mov	eax, [bp+var_3A]
		mov	[di+4], eax
		mov	al, [bp+var_35]
		mov	[di+8], al
		mov	byte ptr [di+9], 1
		mov	dword ptr [di+0Ah], 0
		mov	eax, [bp+var_34]
		mov	[di+0Ah], eax
		push	0
		mov	al, [di+8]
		push	ax
		push	word ptr [di+6]
		push	word ptr [di+4]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		or	ax, dx
		jz	short loc_767A
		push	0
		mov	al, [di+8]
		push	ax
		push	word ptr [di+6]
		push	word ptr [di+4]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+arg_4]
		lea	ax, [bp+var_B4]
		push	ax
		call	sub_43519
		add	sp, 8
		mov	ax, di
		add	ax, 4
		mov	[bp+var_3C], ax
		push	2
		lea	ax, [bp+var_B4]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		mov	ax, [bp+var_3C]
		pop	di
		pop	si
		leave
		retf
		jmp	short loc_7687

loc_767A:
		push	0
		push	12D8h
		call	Runtime_FatalErrorHandler_36797
		add	sp, 4

loc_7687:
		jmp	short loc_76A7

loc_7689:
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_10], ax
		push	2
		lea	ax, [bp+var_B4]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		mov	ax, [bp+var_10]
		pop	di
		pop	si
		leave
		retf

loc_76A7:
		push	2
		lea	ax, [bp+var_B4]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		jmp	short loc_76C5

loc_76B8:
		push	1
		push	12D8h
		call	Runtime_FatalErrorHandler_36797
		add	sp, 4

loc_76C5:
		pop	di
		pop	si
		leave
		retf
sub_7281		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_76C9		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_4], 0
		jmp	short loc_771D

loc_76DD:
		cmp	word ptr [si+4], 0
		jz	short loc_7710
		push	0
		push	word ptr [si+4]
		push	si
		call	LinkedListB_FindAndDispatch_3663B
		add	sp, 6
		push	0
		push	0
		mov	al, [bp+arg_6]
		push	ax
		push	large [bp+arg_2]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		jmp	short loc_771D

loc_7710:
		push	2
		push	12D8h
		call	Runtime_FatalErrorHandler_36797
		add	sp, 4

loc_771D:
		cmp	[bp+var_4], 0
		jz	short loc_76DD
		push	0
		mov	al, [bp+arg_6]
		push	ax
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		pop	si
		leave
		retf
sub_76C9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_773C		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_779D
		mov	word ptr [si], 12E7h
		mov	word ptr [si+0Eh], 0
		cmp	byte ptr [si+9], 0
		jz	short loc_777A
		cmp	dword ptr [si+4], 0
		jz	short loc_777A
		push	0
		mov	al, [si+8]
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_777A

loc_777A:
		mov	dword ptr [si+4], 0
		mov	byte ptr [si+9], 0
		mov	dword ptr [si+0Ah], 0
		test	di, 1
		jz	short loc_779D
		push	si
		call	sub_39C
		add	sp, 2

loc_779D:
		pop	di
		pop	si
		pop	bp
sub_773C		endp
seg011		ends

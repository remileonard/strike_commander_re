seg097		segment	para public 'CODE' use16
		assume cs:seg097
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 8, 0

loc_428E2:
		db 8Bh, 0C2h, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_428E6		proc far

var_82		= word ptr -82h
var_25		= dword ptr -25h
var_21		= dword ptr -21h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 82h
		lea	ax, [bp+var_82]
		push	ax
		call	StreamReader_ConstructVariantA_52440
		pop	cx
		mov	[bp+var_82], 9B5h
		mov	[bp+var_21], 100h
		mov	[bp+var_25], 0
		mov	[bp+var_82], 0B2Ch
		push	large 2Ah
		call	CRT_Malloc32_Retry
		add	sp, 4
		mov	[bp+var_6], dx
		mov	[bp+var_8], ax
		or	ax, dx
		jz	short loc_4294D
		les	bx, [bp+var_8]
		mov	dword ptr es:[bx+20h], 0
		mov	byte ptr es:[bx+24h], 2
		mov	byte ptr es:[bx+25h], 0
		mov	dword ptr es:[bx+26h], 0
		mov	ax, [bp+var_8]
		jmp	short loc_42953

loc_4294D:
		mov	dx, [bp+var_6]
		mov	ax, [bp+var_8]

loc_42953:
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_42963
		jmp	loc_42A32

loc_42963:
		push	1
		push	[bp+arg_0]
		lea	ax, [bp+var_82]
		push	ax
		mov	bx, [bp+var_82]
		call	dword ptr [bx+14h]
		add	sp, 6
		or	al, al
		jnz	short loc_4297E
		jmp	loc_42A32

loc_4297E:
		mov	[bp+var_10], 20h
		lea	ax, [bp+var_82]
		push	ax
		call	StreamReader_GetCapacity_52ABA
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_C], eax
		mov	eax, [bp+var_10]
		sub	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_14], eax
		push	1
		push	0
		push	3
		push	eax
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	word ptr [bp+var_18+2], dx
		mov	word ptr [bp+var_18], ax
		les	bx, word ptr [bp+var_4]
		mov	eax, [bp+var_18]
		mov	es:[bx+20h], eax
		mov	byte ptr es:[bx+24h], 3
		mov	byte ptr es:[bx+25h], 1
		mov	dword ptr es:[bx+26h], 0
		mov	eax, [bp+var_14]
		mov	es:[bx+26h], eax
		push	large 0FFFFFFFFh
		push	large [bp+var_10]
		push	word ptr [bp+var_4+2]
		push	bx
		lea	ax, [bp+var_82]
		push	ax
		call	StreamReader_ReadTyped_529F9
		add	sp, 0Eh
		push	large 0FFFFFFFFh
		push	large [bp+var_C]
		push	0
		les	bx, word ptr [bp+var_4]
		mov	al, es:[bx+24h]
		push	ax
		push	large es:[bx+20h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_82]
		push	ax
		call	StreamReader_ReadTyped_529F9
		add	sp, 0Eh

loc_42A32:
		mov	eax, [bp+var_4]
		mov	[bp+var_1C], eax
		push	0
		lea	ax, [bp+var_82]
		push	ax
		call	StreamReader_ReleaseBuffer_544B1
		add	sp, 4
		mov	dx, word ptr [bp+var_1C+2]
		mov	ax, word ptr [bp+var_1C]
		leave
		retf
sub_428E6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_42A51		proc far

var_4		= dword ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	[bp+var_4], 0
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		leave
		retf
sub_42A51		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_42A67		proc far
		push	bp
		mov	bp, sp
		sub	sp, 2
sub_42A67		endp

; START OF FUNCTION CHUNK FOR sub_42A67
		db 0C6h, 46h, 0FFh
; END OF FUNCTION CHUNK FOR sub_42A67
seg097		ends

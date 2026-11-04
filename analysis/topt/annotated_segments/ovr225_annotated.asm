ovr225		segment	para public 'OVERLAY' use16
		assume cs:ovr225
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BA480		proc far

var_11E		= word ptr -11Eh
var_CE		= word ptr -0CEh
var_71		= dword ptr -71h
var_6D		= dword ptr -6Dh
var_69		= dword ptr -69h
var_61		= dword ptr -61h
var_54		= word ptr -54h
var_52		= word ptr -52h
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_6		= byte ptr -6
arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 11Eh
		push	si
		mov	si, [bp+arg_0]
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_49DEF, cl
		lea	ax, [bp+var_CE]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_CE], 480h
		mov	[bp+var_6D], 100h
		mov	[bp+var_71], 0
		mov	[bp+var_CE], 498h
		mov	[bp+var_52], 0
		xor	ax, ax
		mov	[bp+var_54], ax
		movsx	eax, ax
		mov	[bp+var_69], eax
		mov	eax, [bp+arg_2]
		mov	[bp+var_12], eax
		push	8
		push	word ptr [bp+var_12+2]
		push	word ptr [bp+var_12]
		push	ss
		lea	ax, [bp+var_E]
		push	ax
		call	sub_36A8
		add	sp, 0Ah
		mov	[bp+var_6], 0
		push	ss
		lea	ax, [bp+var_E]
		push	ax
		push	si
		call	sub_266C3
		add	sp, 6
		mov	word ptr [bp+var_16+2], dx
		mov	word ptr [bp+var_16], ax
		cmp	[bp+var_16], 0
		jz	short loc_BA515
		jmp	loc_BA801

loc_BA515:
		mov	byte_4C34C, 0
		push	seg seg182
		push	0
		push	ss
		lea	ax, [bp+var_E]
		push	ax
		push	ds
		push	offset aOBJECTS_3
		lea	ax, [bp+var_11E]
		push	ax
		call	Path_BuildWithFolder_11166
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_11E]
		push	ax
		lea	ax, [bp+var_CE]
		push	ax
		mov	bx, [bp+var_CE]
		call	dword ptr [bx+14h]
		add	sp, 6
		cmp	[bp+var_61], 4C414552h
		jnz	short loc_BA55B
		mov	ax, 1
		jmp	short loc_BA55D

loc_BA55B:
		xor	ax, ax

loc_BA55D:
		or	ax, ax
		jnz	short loc_BA564
		jmp	loc_BA7F6

loc_BA564:
		lea	ax, [bp+var_CE]
		push	ax
		call	sub_42C34
		add	sp, 2
		push	0
		push	large 544A424Fh
		lea	ax, [bp+var_CE]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		or	ax, ax
		jnz	short loc_BA58D
		jmp	loc_BA7C8

loc_BA58D:
		push	0
		push	large 4A424F42h
		lea	ax, [bp+var_CE]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		or	ax, ax
		jz	short loc_BA61D
		push	1
		push	0
		push	2
		push	large 23h
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	[bp+var_1C], dx
		mov	[bp+var_1E], ax
		or	ax, dx
		jz	short loc_BA601
		les	bx, [bp+var_1E]
		mov	word ptr es:[bx], 38A8h
		xor	eax, eax
		les	bx, [bp+var_1E]
		mov	es:[bx+1Dh], eax
		les	bx, [bp+var_1E]
		mov	es:[bx+19h], eax
		les	bx, [bp+var_1E]
		mov	es:[bx+21h], al
		lea	ax, [bp+var_CE]
		push	ax
		push	[bp+var_1C]
		push	[bp+var_1E]
		call	sub_4830A
		add	sp, 6
		mov	dx, [bp+var_1C]
		mov	ax, [bp+var_1E]
		jmp	short loc_BA607

loc_BA601:
		mov	dx, [bp+var_1C]
		mov	ax, [bp+var_1E]

loc_BA607:
		mov	word ptr [bp+var_16+2], dx
		mov	word ptr [bp+var_16], ax
		lea	ax, [bp+var_CE]
		push	ax
		call	ResourceRecord_ReleaseAndClear_42D38
		add	sp, 2
		jmp	loc_BA771

loc_BA61D:
		push	0
		push	large 544E524Fh
		lea	ax, [bp+var_CE]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		or	ax, ax
		jnz	short loc_BA639
		jmp	loc_BA6C6

loc_BA639:
		push	1
		push	0
		push	2
		push	large 24h
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	[bp+var_20], dx
		mov	[bp+var_22], ax
		or	ax, dx
		jz	short loc_BA6AA
		les	bx, [bp+var_22]
		mov	word ptr es:[bx], 38A8h
		xor	eax, eax
		les	bx, [bp+var_22]
		mov	es:[bx+1Dh], eax
		les	bx, [bp+var_22]
		mov	es:[bx+19h], eax
		les	bx, [bp+var_22]
		mov	es:[bx+21h], al
		push	[bp+var_20]
		push	[bp+var_22]
		call	sub_48305
		add	sp, 4
		les	bx, [bp+var_22]
		mov	word ptr es:[bx], 38BCh
		lea	ax, [bp+var_CE]
		push	ax
		push	[bp+var_20]
		push	[bp+var_22]
		call	sub_26A5E
		add	sp, 6
		mov	dx, [bp+var_20]
		mov	ax, [bp+var_22]
		jmp	short loc_BA6B0

loc_BA6AA:
		mov	dx, [bp+var_20]
		mov	ax, [bp+var_22]

loc_BA6B0:
		mov	word ptr [bp+var_16+2], dx
		mov	word ptr [bp+var_16], ax
		lea	ax, [bp+var_CE]
		push	ax
		call	ResourceRecord_ReleaseAndClear_42D38
		add	sp, 2
		jmp	loc_BA771

loc_BA6C6:
		lea	ax, [bp+var_CE]
		push	ax
		call	sub_4832D
		add	sp, 2
		or	al, al
		jnz	short loc_BA6DA
		jmp	loc_BA766

loc_BA6DA:
		push	1
		push	0
		push	2
		push	large 24h
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	[bp+var_24], dx
		mov	[bp+var_26], ax
		or	ax, dx
		jz	short loc_BA74B
		les	bx, [bp+var_26]
		mov	word ptr es:[bx], 38A8h
		xor	eax, eax
		les	bx, [bp+var_26]
		mov	es:[bx+1Dh], eax
		les	bx, [bp+var_26]
		mov	es:[bx+19h], eax
		les	bx, [bp+var_26]
		mov	es:[bx+21h], al
		push	[bp+var_24]
		push	[bp+var_26]
		call	sub_48305
		add	sp, 4
		les	bx, [bp+var_26]
		mov	word ptr es:[bx], 38BCh
		lea	ax, [bp+var_CE]
		push	ax
		push	[bp+var_24]
		push	[bp+var_26]
		call	sub_26A5E
		add	sp, 6
		mov	dx, [bp+var_24]
		mov	ax, [bp+var_26]
		jmp	short loc_BA751

loc_BA74B:
		mov	dx, [bp+var_24]
		mov	ax, [bp+var_26]

loc_BA751:
		mov	word ptr [bp+var_16+2], dx
		mov	word ptr [bp+var_16], ax
		lea	ax, [bp+var_CE]
		push	ax
		call	ResourceRecord_ReleaseAndClear_42D38
		add	sp, 2
		jmp	short loc_BA771

loc_BA766:
		push	0C015h
		call	sub_13451
		add	sp, 2

loc_BA771:
		cmp	[bp+var_16], 0
		jz	short loc_BA7BD
		lea	ax, [bp+var_CE]
		push	ax
		push	word ptr [bp+var_16+2]
		push	word ptr [bp+var_16]
		call	sub_4830F
		add	sp, 6
		push	word ptr [bp+var_16+2]
		push	word ptr [bp+var_16]
		push	si
		call	sub_4831E
		add	sp, 6
		push	8
		push	ss
		lea	ax, [bp+var_E]
		push	ax
		mov	ax, word ptr [bp+var_16]
		add	ax, 19h
		push	word ptr [bp+var_16+2]
		push	ax
		call	sub_36A8
		add	sp, 0Ah
		les	bx, word ptr [bp+var_16]
		mov	byte ptr es:[bx+21h], 0
		jmp	short loc_BA7C8

loc_BA7BD:
		push	0C014h
		call	sub_13451
		add	sp, 2

loc_BA7C8:
		lea	ax, [bp+var_CE]
		push	ax
		call	ResourceRecord_ReleaseAndClear_42D38
		add	sp, 2
		cmp	[bp+var_16], 0
		jz	short loc_BA7F4
		lea	ax, [bp+var_CE]
		push	ax
		call	sub_1E786
		add	sp, 2
		les	bx, word ptr [bp+var_16]
		mov	es:[bx+17h], dx
		mov	es:[bx+15h], ax

loc_BA7F4:
		jmp	short loc_BA801

loc_BA7F6:
		push	0C016h
		call	sub_13451
		add	sp, 2

loc_BA801:
		les	bx, word ptr [bp+var_16]
		mov	al, [bp+arg_6]
		mov	es:[bx+2], al
		mov	eax, [bp+var_16]
		mov	[bp+var_1A], eax
		mov	[bp+var_CE], 498h
		lea	ax, [bp+var_CE]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_CE]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4
		mov	dx, word ptr [bp+var_1A+2]
		mov	ax, word ptr [bp+var_1A]
		pop	si
		leave
		retf
sub_BA480		endp

; START OF FUNCTION CHUNK FOR sub_BA480
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_BA480

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BA841		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_BA887
		push	0
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		call	sub_48314
		add	sp, 6
		test	si, 1
		jz	short loc_BA885
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_BA885

loc_BA885:
		jmp	short loc_BA887

loc_BA887:
		pop	si
		leave
		retf
sub_BA841		endp

; START OF FUNCTION CHUNK FOR sub_BA841
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_BA841
ovr225		ends

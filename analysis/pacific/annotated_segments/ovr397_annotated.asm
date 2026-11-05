ovr397		segment	para public 'OVERLAY' use16
		assume cs:ovr397
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E4BD0		proc far

var_CA		= word ptr -0CAh
var_6D		= word ptr -6Dh
var_52		= word ptr -52h
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0CAh
		push	si
		push	di
		push	50h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	offset aFuneral
		push	4
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_52]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_52]
		push	ax
		lea	ax, [bp+var_CA]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_7437
		add	sp, 6
		mov	di, [bp+var_6D]
		xor	si, si
		jmp	short loc_E4C3D

loc_E4C21:
		push	3
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	dx, [bp+arg_0]
		add	dx, ax
		push	dx
		push	si
		lea	ax, [bp+var_CA]
		push	ax
		call	sub_75B60
		add	sp, 8
		inc	si

loc_E4C3D:
		cmp	si, di
		jl	short loc_E4C21
		mov	[bp+var_2], di
		push	2
		lea	ax, [bp+var_CA]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
sub_E4BD0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E4C5A		proc far

var_56		= word ptr -56h
var_37		= byte ptr -37h
var_34		= word ptr -34h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= byte ptr -4
var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 56h
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	[bp+var_3], 1
		mov	[bp+var_4], 0
		push	[bp+arg_4]
		push	0FFh
		push	0Ch
		lea	ax, [bp+var_56]
		push	ax
		call	sub_60273
		add	sp, 8
		push	di
		push	cs
		call	near ptr sub_E4BD0
		pop	cx
		mov	[bp+var_2], ax
		xor	si, si
		jmp	short loc_E4CB4

loc_E4C8E:
		push	large 180000h
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	dx, di
		add	dx, ax
		push	dx
		push	0
		call	AnimLayer_Construct_66FB9
		add	sp, 8
		mov	bx, si
		shl	bx, 1
		lea	dx, [bp+var_34]
		add	bx, dx
		mov	[bx], ax
		inc	si

loc_E4CB4:
		cmp	si, [bp+var_2]
		jl	short loc_E4C8E
		xor	si, si
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_34]
		add	bx, ax
		push	word ptr [bx]
		lea	ax, [bp+var_56]
		push	ax
		call	LayerGroup_Add_6656E
		add	sp, 4
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	0
		mov	bx, [bp+arg_2]
		push	word ptr [bx]
		mov	al, [bx+2]
		push	ax
		push	bx
		call	sub_76259
		add	sp, 8
		push	large 50003h
		call	sub_75E53
		add	sp, 4
		xor	eax, eax
		mov	[bp+var_8], eax
		mov	[bp+var_C], eax
		jmp	loc_E4DF8

loc_E4D10:
		mov	[bp+var_8], 0Ah
		mov	eax, dword_7B29D
		mov	[bp+var_C], eax
		push	1
		lea	ax, [bp+var_56]
		push	ax
		call	sub_75BF0
		add	sp, 4
		push	word_7AF7E
		push	[bp+arg_4]
		call	UI_ApplyEncodingHelper_67EE7
		add	sp, 4
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_34]
		add	bx, ax
		push	word ptr [bx]
		call	AnimLayer_IsFinished_6703E
		pop	cx
		or	al, al
		jz	short loc_E4D8C
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_34]
		add	bx, ax
		push	word ptr [bx]
		lea	ax, [bp+var_56]
		push	ax
		call	sub_665AB
		add	sp, 4
		inc	si
		cmp	si, [bp+var_2]
		jnz	short loc_E4D75
		mov	[bp+var_4], 1
		jmp	short loc_E4D8C

loc_E4D75:
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_34]
		add	bx, ax
		push	word ptr [bx]
		lea	ax, [bp+var_56]
		push	ax
		call	LayerGroup_Add_6656E
		add	sp, 4

loc_E4D8C:
		mov	eax, [bp+var_C]
		add	eax, [bp+var_8]
		cmp	eax, dword_7B29D
		ja	short loc_E4DA0
		mov	ax, 1
		jmp	short loc_E4DA2

loc_E4DA0:
		xor	ax, ax

loc_E4DA2:
		mov	ah, 0
		or	ax, ax
		jz	short loc_E4D8C
		cmp	[bp+var_3], 0
		jz	short loc_E4DCE
		push	1
		call	sub_5EFBF
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_E4DCE
		push	large 60003h
		call	sub_75E53
		add	sp, 4
		mov	[bp+var_3], 0

loc_E4DCE:
		call	sub_7575F
		or	al, al
		jnz	short loc_E4DDD
		cmp	[bp+var_37], 0
		jz	short loc_E4DF8

loc_E4DDD:
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_34]
		add	bx, ax
		push	word ptr [bx]
		lea	ax, [bp+var_56]
		push	ax
		call	sub_665AB
		add	sp, 4
		mov	[bp+var_4], 1

loc_E4DF8:
		mov	al, [bp+var_4]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_E4E04
		jmp	loc_E4D10

loc_E4E04:
		xor	si, si
		jmp	loc_E4E90

loc_E4E09:
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_34]
		add	bx, ax
		cmp	word ptr [bx], 0
		jz	short loc_E4E32
		push	3
		mov	bx, si
		shl	bx, 1
		add	bx, ax
		push	word ptr [bx]
		mov	bx, si
		shl	bx, 1
		add	bx, ax
		mov	bx, [bx]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_E4E32

loc_E4E32:
		mov	bx, si
		imul	bx, bx, 0Ah
		cmp	byte ptr [bx+di+5], 0
		jz	short loc_E4E6B
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	ax, [bx+di]
		or	ax, [bx+di+2]
		jz	short loc_E4E6B
		push	0
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	al, [bx+di+4]
		push	ax
		mov	ax, si
		imul	ax, ax, 0Ah
		mov	dx, di
		add	dx, ax
		push	dx
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_E4E6B

loc_E4E6B:
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	word ptr [bx+di+2], 0
		mov	word ptr [bx+di], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	byte ptr [bx+di+5], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		mov	dword ptr [bx+di+6], 0
		inc	si

loc_E4E90:
		cmp	si, [bp+var_2]
		jge	short loc_E4E98
		jmp	loc_E4E09

loc_E4E98:
		push	1
		call	sub_5EFBF
		pop	cx
		or	al, al
		jz	short loc_E4EA9
		call	sub_5EFE1

loc_E4EA9:
		push	0
		lea	ax, [bp+var_56]
		push	ax
		call	Scene_Destruct_666E6
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_E4C5A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E4EBB		proc far

var_132		= word ptr -132h
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_4		= byte ptr -4
var_3		= byte ptr -3
var_2		= byte ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 132h
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+7C5h], 0
		call	Keyboard_DrainBufferBIOS_701E1
		mov	[bp+var_4], 0
		mov	[bp+var_3], 0
		mov	[bp+var_2], 0
		mov	[bp+var_1A], 0
		mov	[bp+var_18], 0
		mov	[bp+var_16], 0
		mov	[bp+var_14], 0
		mov	[bp+var_12], 13Fh
		mov	[bp+var_10], 0C7h
		push	0
		lea	ax, [bp+var_1A]
		push	ax
		call	TextRenderer_ApplyFormatChange_67CBE
		add	sp, 4
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	seg stub381
		push	offset sub_75E3F
		push	large 10001h
		push	5
		lea	ax, [bp+var_A]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		push	seg stub253
		push	offset sub_735A5
		push	large 10014h
		push	0Ah
		lea	ax, [bp+var_132]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		push	1
		push	4300h
		lea	ax, [bp+var_A]
		mov	[bp+var_C], ax
		lea	ax, [bp+var_C]
		push	ax
		call	sub_75E5D
		add	sp, 6
		mov	al, byte_7D13E
		mov	ah, 0
		or	ax, ax
		jnz	short loc_E4F7F
		lea	ax, [bp+var_1A]
		push	ax
		lea	ax, [bp+var_A]
		push	ax
		lea	ax, [bp+var_132]
		push	ax
		push	cs
		call	near ptr sub_E4C5A
		add	sp, 6

loc_E4F7F:
		mov	byte ptr [si+7C5h], 1
		push	seg stub253
		push	offset sub_735A0
		push	large 10014h
		push	0Ah
		lea	ax, [bp+var_132]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg stub381
		push	offset sub_75E30
		push	large 10001h
		push	5
		lea	ax, [bp+var_A]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		lea	ax, [bp+var_1A]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		pop	si
		leave
		retf
sub_E4EBB		endp
ovr397		ends

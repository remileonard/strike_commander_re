ovr385		segment	para public 'OVERLAY' use16
		assume cs:ovr385
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DA5B0		proc far

var_69C		= word ptr -69Ch
var_67E		= word ptr -67Eh
var_65C		= word ptr -65Ch
var_648		= word ptr -648h
var_634		= word ptr -634h
var_5D0		= word ptr -5D0h
var_544		= word ptr -544h
var_4E0		= word ptr -4E0h
var_4DC		= word ptr -4DCh
var_4DB		= word ptr -4DBh
var_4DA		= word ptr -4DAh
var_2D8		= word ptr -2D8h
var_2D6		= word ptr -2D6h
var_2D4		= word ptr -2D4h
var_2D2		= word ptr -2D2h
var_2D0		= word ptr -2D0h
var_2CE		= word ptr -2CEh
var_2CA		= word ptr -2CAh
var_2C8		= word ptr -2C8h
var_2C6		= word ptr -2C6h
var_2C4		= word ptr -2C4h
var_2C2		= word ptr -2C2h
var_2C0		= word ptr -2C0h
var_2BC		= word ptr -2BCh
var_244		= word ptr -244h
var_1E7		= word ptr -1E7h
var_1CC		= word ptr -1CCh
var_16F		= word ptr -16Fh
var_154		= word ptr -154h
var_F7		= word ptr -0F7h
var_DC		= word ptr -0DCh
var_8C		= word ptr -8Ch
var_3C		= word ptr -3Ch
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_2C		= word ptr -2Ch
var_2A		= word ptr -2Ah
var_27		= byte ptr -27h
var_26		= dword ptr -26h
var_22		= byte ptr -22h
var_21		= byte ptr -21h
var_20		= dword ptr -20h
var_1C		= word ptr -1Ch
var_1A		= byte ptr -1Ah
var_19		= word ptr -19h
var_16		= dword ptr -16h
var_12		= byte ptr -12h
var_11		= byte ptr -11h
var_10		= dword ptr -10h
var_C		= word ptr -0Ch
var_A		= byte ptr -0Ah
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 69Ch
		push	si
		push	di
		cmp	byte_7D13E, 0
		jz	short loc_DA5C3
		jmp	loc_DAEA8

loc_DA5C3:
		push	100h
		push	0
		lea	ax, [bp+var_C]
		push	ax
		call	sub_76245
		add	sp, 6
		push	50h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	offset aBackgrnd_1
		push	4
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_8C]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_8C]
		push	ax
		lea	ax, [bp+var_154]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_7437
		add	sp, 6
		mov	ax, [bp+var_F7]
		mov	[bp+var_6], ax
		push	50h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	offset aElevator_1
		push	4
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_8C]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_8C]
		push	ax
		lea	ax, [bp+var_1CC]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_7437
		add	sp, 6
		mov	ax, [bp+var_16F]
		mov	[bp+var_4], ax
		mov	bx, [bp+arg_0]
		cmp	bx, 8
		jbe	short loc_DA673
		jmp	loc_DA72C

loc_DA673:
		shl	bx, 1
		jmp	cs:off_DAEAC[bx]	; switch jump

loc_DA67A:
		push	50h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	offset aF4f_1

loc_DA68D:
		push	4
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_DC]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		jmp	loc_DA735

loc_DA6AC:
		push	50h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	offset aSbd5_1
		jmp	short loc_DA68D

loc_DA6C1:
		push	50h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	offset aTbd_1
		jmp	short loc_DA68D

loc_DA6D6:
		push	50h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	offset aHellcat_1
		jmp	short loc_DA68D

loc_DA6EB:
		push	50h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	offset aCorsair_1
		jmp	short loc_DA68D

loc_DA700:
		push	50h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	offset aTbf_1
		jmp	loc_DA68D

loc_DA716:
		push	50h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	offset aSb2c_1
		jmp	loc_DA68D

loc_DA72C:
		push	0B002h
		call	sub_1DDFE
		pop	cx

loc_DA735:
		push	1
		lea	ax, [bp+var_DC]
		push	ax
		lea	ax, [bp+var_244]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_7437
		add	sp, 6
		mov	ax, [bp+var_1E7]
		mov	[bp+var_2], ax
		push	50h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	offset aSkywise_1
		push	4
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_8C]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_8C]
		push	ax
		lea	ax, [bp+var_2BC]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_7437
		add	sp, 6
		mov	[bp+var_16], 0
		mov	[bp+var_12], 2
		mov	[bp+var_11], 0
		mov	[bp+var_10], 0
		push	2
		lea	ax, word ptr [bp+var_16]
		push	ax
		push	0
		lea	ax, [bp+var_2BC]
		push	ax
		call	sub_75B60
		add	sp, 8
		mov	[bp+var_19], 0
		lea	ax, word ptr [bp+var_16]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		call	sub_7624F
		add	sp, 4
		push	[bp+var_1C]
		mov	al, [bp+var_1A]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	sub_76272
		add	sp, 8
		push	0
		push	[bp+var_C]
		mov	al, [bp+var_A]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	sub_76259
		add	sp, 8
		mov	[bp+var_2CA], 0
		mov	[bp+var_2C8], 0
		mov	[bp+var_2C6], 0
		mov	[bp+var_2C4], 0
		mov	[bp+var_2C2], 13Fh
		mov	[bp+var_2C0], 0C7h
		push	0
		lea	ax, [bp+var_2CA]
		push	ax
		call	TextRenderer_ApplyFormatChange_67CBE
		add	sp, 4
		mov	[bp+var_2D8], 0
		mov	[bp+var_2D6], 0
		mov	[bp+var_2D4], 0
		mov	[bp+var_2D2], 0
		mov	[bp+var_2D0], 13Fh
		mov	[bp+var_2CE], 0C7h
		push	0
		lea	ax, [bp+var_2D8]
		push	ax
		call	TextRenderer_ApplyFormatChange_67CBE
		add	sp, 4
		push	seg stub253
		push	offset sub_735A5
		push	large 10034h
		push	0Ah
		lea	ax, [bp+var_4E0]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[bp+var_26], 0
		mov	[bp+var_22], 2
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		push	seg stub253
		push	offset sub_735A5
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_544]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		push	seg stub253
		push	offset sub_735A5
		push	large 1000Eh
		push	0Ah
		lea	ax, [bp+var_5D0]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		push	seg stub253
		push	offset sub_735A5
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_634]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		lea	ax, [bp+var_2CA]
		push	ax
		push	0FFh
		push	0Ch
		lea	ax, [bp+var_67E]
		push	ax
		call	sub_60273
		add	sp, 8
		mov	[bp+var_27], 0
		mov	[bp+var_2A], 0
		mov	[bp+var_2C], 0
		xor	si, si
		jmp	short loc_DA984

loc_DA914:
		push	1
		push	0
		push	3
		push	large 0FA00h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_2E], dx
		mov	[bp+var_30], ax
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_4E0]
		add	bx, ax
		mov	ax, [bp+var_2E]
		mov	dx, [bp+var_30]
		mov	[bx+2], ax
		mov	[bx], dx
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_4DC]
		add	bx, ax
		mov	byte ptr [bx], 3
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_4DB]
		add	bx, ax
		mov	byte ptr [bx], 1
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_4DA]
		add	bx, ax
		mov	dword ptr [bx], 0
		mov	bx, si
		imul	bx, bx, 0Ah
		add	bx, ax
		mov	dword ptr [bx], 0FA00h
		inc	si

loc_DA984:
		cmp	si, 1Ah
		jl	short loc_DA914
		xor	di, di
		jmp	short loc_DA9AA

loc_DA98D:
		push	3
		mov	ax, di
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_544]
		add	ax, dx
		push	ax
		push	di
		lea	ax, [bp+var_244]
		push	ax
		call	sub_75B60
		add	sp, 8
		inc	di

loc_DA9AA:
		cmp	di, [bp+var_2]
		jl	short loc_DA98D
		xor	si, si
		jmp	short loc_DA9D9

loc_DA9B3:
		push	large 0
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_544]
		add	ax, dx
		push	ax
		push	0
		call	AnimLayer_Construct_66FB9
		add	sp, 8
		mov	bx, si
		shl	bx, 1
		lea	dx, [bp+var_648]
		add	bx, dx
		mov	[bx], ax
		inc	si

loc_DA9D9:
		cmp	si, [bp+var_2]
		jl	short loc_DA9B3
		xor	di, di
		jmp	short loc_DA9FF

loc_DA9E2:
		push	3
		mov	ax, di
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_634]
		add	ax, dx
		push	ax
		push	di
		lea	ax, [bp+var_1CC]
		push	ax
		call	sub_75B60
		add	sp, 8
		inc	di

loc_DA9FF:
		cmp	di, [bp+var_4]
		jl	short loc_DA9E2
		xor	si, si
		jmp	short loc_DAA2E

loc_DAA08:
		push	large 0
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_634]
		add	ax, dx
		push	ax
		push	0
		call	AnimLayer_Construct_66FB9
		add	sp, 8
		mov	bx, si
		shl	bx, 1
		lea	dx, [bp+var_65C]
		add	bx, dx
		mov	[bx], ax
		inc	si

loc_DAA2E:
		cmp	si, [bp+var_4]
		jl	short loc_DAA08
		xor	si, si
		push	large 20004h
		call	sub_75E53
		add	sp, 4
		xor	di, di
		jmp	loc_DAC50

loc_DAA48:
		push	3
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	di
		lea	ax, [bp+var_154]
		push	ax
		call	sub_75B60
		add	sp, 8
		push	large 0
		lea	ax, word ptr [bp+var_26]
		push	ax
		lea	ax, [bp+var_69C]
		push	ax
		call	AnimLayer_Construct_66FB9
		add	sp, 8
		lea	ax, [bp+var_69C]
		push	ax
		lea	ax, [bp+var_67E]
		push	ax
		call	LayerGroup_Add_6656E
		add	sp, 4
		jmp	loc_DABE2

loc_DAA85:
		lea	ax, [bp+var_2CA]
		push	ax
		lea	ax, [bp+var_3C]
		push	ax
		call	sub_6735D
		add	sp, 4
		push	1
		lea	ax, [bp+var_67E]
		push	ax
		call	sub_75BF0
		add	sp, 4
		lea	ax, [bp+var_3C]
		push	ax
		call	sub_67383
		pop	cx
		lea	ax, [bp+var_2D8]
		push	ax
		lea	ax, [bp+var_2CA]
		push	ax
		call	UI_ApplyEncodingHelper_67EE7
		add	sp, 4
		lea	ax, [bp+var_2D8]
		push	ax
		lea	ax, [bp+var_3C]
		push	ax
		call	sub_6735D
		add	sp, 4
		mov	al, [bp+var_27]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_DAB4B
		mov	bx, [bp+var_2C]
		shl	bx, 1
		lea	ax, [bp+var_65C]
		add	bx, ax
		push	word ptr [bx]
		mov	bx, [bp+var_2C]
		shl	bx, 1
		add	bx, ax
		mov	bx, [bx]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		pop	cx
		mov	bx, [bp+var_2C]
		shl	bx, 1
		lea	ax, [bp+var_65C]
		add	bx, ax
		push	word ptr [bx]
		mov	bx, [bp+var_2C]
		shl	bx, 1
		add	bx, ax
		mov	bx, [bx]
		mov	bx, [bx]
		call	dword ptr [bx+1Ch]
		pop	cx
		mov	bx, [bp+var_2A]
		shl	bx, 1
		lea	ax, [bp+var_648]
		add	bx, ax
		push	word ptr [bx]
		mov	bx, [bp+var_2A]
		shl	bx, 1
		add	bx, ax
		mov	bx, [bx]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		pop	cx
		mov	bx, [bp+var_2A]
		shl	bx, 1
		lea	ax, [bp+var_648]
		add	bx, ax
		push	word ptr [bx]
		mov	bx, [bp+var_2A]
		shl	bx, 1
		add	bx, ax
		mov	bx, [bx]
		mov	bx, [bx]
		call	dword ptr [bx+1Ch]
		pop	cx

loc_DAB4B:
		lea	ax, [bp+var_3C]
		push	ax
		call	sub_67383
		pop	cx
		push	0FA00h
		push	[bp+var_2D8]
		mov	bx, [bp+var_2D6]
		push	word ptr [bx]
		push	0
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_4DC]
		add	bx, ax
		mov	al, [bx]
		push	ax
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_4E0]
		add	bx, ax
		push	large [bx]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		call	sub_37C3
		add	sp, 0Ah
		inc	si
		mov	bx, [bp+var_2A]
		shl	bx, 1
		lea	ax, [bp+var_648]
		add	bx, ax
		push	word ptr [bx]
		call	AnimLayer_IsFinished_6703E
		pop	cx
		or	al, al
		jz	short loc_DABBC
		inc	[bp+var_2A]
		mov	ax, [bp+var_2A]
		cmp	ax, [bp+var_2]
		jnz	short loc_DABBC
		mov	[bp+var_27], 1

loc_DABBC:
		mov	bx, [bp+var_2C]
		shl	bx, 1
		lea	ax, [bp+var_65C]
		add	bx, ax
		push	word ptr [bx]
		call	AnimLayer_IsFinished_6703E
		pop	cx
		or	al, al
		jz	short loc_DABE2
		inc	[bp+var_2C]
		mov	ax, [bp+var_2C]
		cmp	ax, [bp+var_4]
		jnz	short loc_DABE2
		mov	[bp+var_27], 1

loc_DABE2:
		lea	ax, [bp+var_69C]
		push	ax
		call	AnimLayer_IsFinished_6703E
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_DABF6
		jmp	loc_DAA85

loc_DABF6:
		lea	ax, [bp+var_69C]
		push	ax
		lea	ax, [bp+var_67E]
		push	ax
		call	sub_665AB
		add	sp, 4
		cmp	[bp+var_21], 0
		jz	short loc_DAC2C
		cmp	[bp+var_26], 0
		jz	short loc_DAC2C
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_DAC2C

loc_DAC2C:
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		push	2
		lea	ax, [bp+var_69C]
		push	ax
		call	Scene_Destruct_6708D
		add	sp, 4
		inc	di

loc_DAC50:
		cmp	di, [bp+var_6]
		jge	short loc_DAC58
		jmp	loc_DAA48

loc_DAC58:
		xor	eax, eax
		mov	[bp+var_34], eax
		mov	[bp+var_38], eax
		mov	si, 18h
		jmp	loc_DACE8

loc_DAC69:
		mov	[bp+var_34], 4
		mov	eax, dword_7B29D
		mov	[bp+var_38], eax
		push	large 0FA000000h
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_4DC]
		add	bx, ax
		mov	al, [bx]
		push	ax
		mov	bx, si
		imul	bx, bx, 0Ah
		lea	ax, [bp+var_4E0]
		add	bx, ax
		push	large [bx]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_2CA]
		mov	bx, [bp+var_2C8]
		push	word ptr [bx]
		call	sub_37C3
		add	sp, 0Ah
		push	word_7AF7E
		lea	ax, [bp+var_2CA]
		push	ax
		call	UI_ApplyEncodingHelper_67EE7
		add	sp, 4

loc_DACCB:
		mov	eax, [bp+var_38]
		add	eax, [bp+var_34]
		cmp	eax, dword_7B29D
		ja	short loc_DACDF
		mov	ax, 1
		jmp	short loc_DACE1

loc_DACDF:
		xor	ax, ax

loc_DACE1:
		mov	ah, 0
		or	ax, ax
		jz	short loc_DACCB
		dec	si

loc_DACE8:
		or	si, si
		jl	short loc_DACEF
		jmp	loc_DAC69

loc_DACEF:
		xor	si, si
		jmp	short loc_DAD1E

loc_DACF3:
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_648]
		add	bx, ax
		cmp	word ptr [bx], 0
		jz	short loc_DAD1D
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
		jmp	short loc_DAD1D

loc_DAD1D:
		inc	si

loc_DAD1E:
		cmp	si, [bp+var_2]
		jl	short loc_DACF3
		xor	si, si
		jmp	short loc_DAD52

loc_DAD27:
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_65C]
		add	bx, ax
		cmp	word ptr [bx], 0
		jz	short loc_DAD51
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
		jmp	short loc_DAD51

loc_DAD51:
		inc	si

loc_DAD52:
		cmp	si, [bp+var_4]
		jl	short loc_DAD27
		push	0
		lea	ax, [bp+var_67E]
		push	ax
		call	Scene_Destruct_666E6
		add	sp, 4
		push	seg stub253
		push	offset sub_735A0
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_634]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg stub253
		push	offset sub_735A0
		push	large 1000Eh
		push	0Ah
		lea	ax, [bp+var_5D0]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg stub253
		push	offset sub_735A0
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_544]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		cmp	[bp+var_21], 0
		jz	short loc_DADDB
		cmp	[bp+var_26], 0
		jz	short loc_DADDB
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_DADDB

loc_DADDB:
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		push	seg stub253
		push	offset sub_735A0
		push	large 10034h
		push	0Ah
		lea	ax, [bp+var_4E0]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		lea	ax, [bp+var_2D8]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		lea	ax, [bp+var_2CA]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		lea	ax, [bp+var_1C]
		push	ax
		call	sub_7627C
		pop	cx
		cmp	[bp+var_11], 0
		jz	short loc_DAE4E
		cmp	[bp+var_16], 0
		jz	short loc_DAE4E
		push	0
		mov	al, [bp+var_12]
		push	ax
		lea	ax, word ptr [bp+var_16]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_DAE4E

loc_DAE4E:
		mov	[bp+var_16], 0
		mov	[bp+var_11], 0
		mov	[bp+var_10], 0
		push	2
		lea	ax, [bp+var_2BC]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		push	2
		lea	ax, [bp+var_244]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		push	2
		lea	ax, [bp+var_1CC]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		push	2
		lea	ax, [bp+var_154]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		lea	ax, [bp+var_C]
		push	ax
		call	sub_7627C
		pop	cx

loc_DAEA8:
		pop	di
		pop	si
		leave
		retf
sub_DA5B0		endp

; START OF FUNCTION CHUNK FOR sub_DA5B0
off_DAEAC	dw offset loc_DA67A
		dw offset loc_DA67A
		dw offset loc_DA6D6
		dw offset loc_DA6D6
		dw offset loc_DA6EB
		dw offset loc_DA6C1
		dw offset loc_DA6AC
		dw offset loc_DA700
		dw offset loc_DA716
; END OF FUNCTION CHUNK FOR sub_DA5B0
ovr385		ends

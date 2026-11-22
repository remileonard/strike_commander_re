ovr384		segment	para public 'OVERLAY' use16
		assume cs:ovr384
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D9630		proc far

var_C8		= word ptr -0C8h
var_50		= word ptr -50h
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0C8h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	50h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	offset aOptshps
		push	1
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_50]
		push	ax
		lea	ax, [bp+var_C8]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_7437
		add	sp, 6
		push	84Ch
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_D96CD
		cmp	[bp+arg_4], 4
		jz	short loc_D96CD
		push	84Fh
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_D96CD
		push	2
		mov	ax, si
		add	ax, 3Ch
		push	ax
		push	2Ah
		lea	ax, [bp+var_C8]
		push	ax
		call	sub_75B60
		add	sp, 8
		push	large 0
		mov	ax, si
		add	ax, 3Ch
		push	ax
		push	0
		call	Layer_Construct_66985
		add	sp, 8
		mov	[di+0Ch], ax

loc_D96CD:
		push	84Bh
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_D9720
		cmp	[bp+arg_4], 2
		jz	short loc_D9720
		cmp	[bp+arg_4], 3
		jz	short loc_D9720
		push	84Fh
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_D9720
		push	2
		mov	ax, si
		add	ax, 14h
		push	ax
		push	27h
		lea	ax, [bp+var_C8]
		push	ax
		call	sub_75B60
		add	sp, 8
		push	large 0
		mov	ax, si
		add	ax, 14h
		push	ax
		push	0
		call	Layer_Construct_66985
		add	sp, 8
		mov	[di+4], ax

loc_D9720:
		push	848h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_D9773
		cmp	[bp+arg_4], 0
		jz	short loc_D9773
		cmp	[bp+arg_4], 1
		jz	short loc_D9773
		push	84Fh
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_D9773
		push	2
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	14h
		lea	ax, [bp+var_C8]
		push	ax
		call	sub_75B60
		add	sp, 8
		push	large 0
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	0
		call	Layer_Construct_66985
		add	sp, 8
		mov	[di+6], ax

loc_D9773:
		push	849h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_D97B5
		cmp	[bp+arg_4], 6
		jz	short loc_D97B5
		push	84Fh
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_D97B5
		push	2
		push	si
		push	13h
		lea	ax, [bp+var_C8]
		push	ax
		call	sub_75B60
		add	sp, 8
		push	large 0
		push	si
		push	0
		call	Layer_Construct_66985
		add	sp, 8
		mov	[di], ax

loc_D97B5:
		push	84Dh
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_D9802
		cmp	[bp+arg_4], 8
		jz	short loc_D9802
		push	84Fh
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_D9802
		push	2
		mov	ax, si
		add	ax, 0Ah
		push	ax
		push	28h
		lea	ax, [bp+var_C8]
		push	ax
		call	sub_75B60
		add	sp, 8
		push	large 0
		mov	ax, si
		add	ax, 0Ah
		push	ax
		push	0
		call	Layer_Construct_66985
		add	sp, 8
		mov	[di+2], ax

loc_D9802:
		push	84Eh
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_D984F
		cmp	[bp+arg_4], 5
		jz	short loc_D984F
		push	84Fh
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_D984F
		push	2
		mov	ax, si
		add	ax, 28h
		push	ax
		push	29h
		lea	ax, [bp+var_C8]
		push	ax
		call	sub_75B60
		add	sp, 8
		push	large 0
		mov	ax, si
		add	ax, 28h
		push	ax
		push	0
		call	Layer_Construct_66985
		add	sp, 8
		mov	[di+8], ax

loc_D984F:
		push	84Ah
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_D989C
		cmp	[bp+arg_4], 5
		jz	short loc_D989C
		push	84Fh
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_D989C
		push	2
		mov	ax, si
		add	ax, 32h
		push	ax
		push	12h
		lea	ax, [bp+var_C8]
		push	ax
		call	sub_75B60
		add	sp, 8
		push	large 0
		mov	ax, si
		add	ax, 32h
		push	ax
		push	0
		call	Layer_Construct_66985
		add	sp, 8
		mov	[di+0Ah], ax

loc_D989C:
		push	6Fh
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_D98E2
		push	83Eh
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jnz	short loc_D98E2
		push	2
		mov	ax, si
		add	ax, 46h
		push	ax
		push	18h
		lea	ax, [bp+var_C8]
		push	ax
		call	sub_75B60
		add	sp, 8
		push	large 0
		mov	ax, si
		add	ax, 46h
		push	ax
		push	0
		call	Layer_Construct_66985
		add	sp, 8
		mov	[di+0Eh], ax

loc_D98E2:
		push	70h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_D9928
		push	83Fh
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jnz	short loc_D9928
		push	2
		mov	ax, si
		add	ax, 50h
		push	ax
		push	19h
		lea	ax, [bp+var_C8]
		push	ax
		call	sub_75B60
		add	sp, 8
		push	large 0
		mov	ax, si
		add	ax, 50h
		push	ax
		push	0
		call	Layer_Construct_66985
		add	sp, 8
		mov	[di+10h], ax

loc_D9928:
		push	74h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_D996E
		push	840h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jnz	short loc_D996E
		push	2
		mov	ax, si
		add	ax, 5Ah
		push	ax
		push	1Ah
		lea	ax, [bp+var_C8]
		push	ax
		call	sub_75B60
		add	sp, 8
		push	large 0
		mov	ax, si
		add	ax, 5Ah
		push	ax
		push	0
		call	Layer_Construct_66985
		add	sp, 8
		mov	[di+12h], ax

loc_D996E:
		push	73h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_D99B4
		push	843h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jnz	short loc_D99B4
		push	2
		mov	ax, si
		add	ax, 64h
		push	ax
		push	1Dh
		lea	ax, [bp+var_C8]
		push	ax
		call	sub_75B60
		add	sp, 8
		push	large 0
		mov	ax, si
		add	ax, 64h
		push	ax
		push	0
		call	Layer_Construct_66985
		add	sp, 8
		mov	[di+14h], ax

loc_D99B4:
		push	72h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_D99FA
		push	842h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jnz	short loc_D99FA
		push	2
		mov	ax, si
		add	ax, 6Eh
		push	ax
		push	1Ch
		lea	ax, [bp+var_C8]
		push	ax
		call	sub_75B60
		add	sp, 8
		push	large 0
		mov	ax, si
		add	ax, 6Eh
		push	ax
		push	0
		call	Layer_Construct_66985
		add	sp, 8
		mov	[di+16h], ax

loc_D99FA:
		push	71h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_D9A40
		push	841h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jnz	short loc_D9A40
		push	2
		mov	ax, si
		add	ax, 78h
		push	ax
		push	1Bh
		lea	ax, [bp+var_C8]
		push	ax
		call	sub_75B60
		add	sp, 8
		push	large 0
		mov	ax, si
		add	ax, 78h
		push	ax
		push	0
		call	Layer_Construct_66985
		add	sp, 8
		mov	[di+18h], ax

loc_D9A40:
		push	2
		mov	ax, si
		add	ax, 82h
		push	ax
		push	6
		lea	ax, [bp+var_C8]
		push	ax
		call	sub_75B60
		add	sp, 8
		push	large 0
		mov	ax, si
		add	ax, 82h
		push	ax
		push	0
		call	Layer_Construct_66985
		add	sp, 8
		mov	[di+1Ah], ax
		push	2
		lea	ax, [bp+var_C8]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_D9630		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D9A80		proc far

var_5F4		= word ptr -5F4h
var_5D5		= byte ptr -5D5h
var_5D2		= word ptr -5D2h
var_5BE		= word ptr -5BEh
var_5AA		= word ptr -5AAh
var_596		= word ptr -596h
var_57C		= word ptr -57Ch
var_57A		= word ptr -57Ah
var_516		= word ptr -516h
var_48A		= word ptr -48Ah
var_426		= word ptr -426h
var_41E		= word ptr -41Eh
var_3C2		= word ptr -3C2h
var_3C0		= word ptr -3C0h
var_3BE		= word ptr -3BEh
var_3BC		= word ptr -3BCh
var_3BA		= word ptr -3BAh
var_3B8		= word ptr -3B8h
var_3B4		= word ptr -3B4h
var_3B2		= word ptr -3B2h
var_3B0		= word ptr -3B0h
var_3AE		= word ptr -3AEh
var_3AC		= word ptr -3ACh
var_3AA		= word ptr -3AAh
var_3A6		= word ptr -3A6h
var_32E		= word ptr -32Eh
var_2D1		= word ptr -2D1h
var_2B6		= word ptr -2B6h
var_259		= word ptr -259h
var_23E		= word ptr -23Eh
var_1E1		= word ptr -1E1h
var_1C6		= word ptr -1C6h
var_176		= word ptr -176h
var_126		= word ptr -126h
var_C5		= dword ptr -0C5h
var_C1		= dword ptr -0C1h
var_B9		= word ptr -0B9h
var_B5		= dword ptr -0B5h
var_AE		= word ptr -0AEh
var_5E		= word ptr -5Eh
var_54		= word ptr -54h
var_40		= word ptr -40h
var_3E		= word ptr -3Eh
var_3B		= byte ptr -3Bh
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_32		= word ptr -32h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_2B		= byte ptr -2Bh
var_2A		= word ptr -2Ah
var_26		= word ptr -26h
var_24		= byte ptr -24h
var_23		= word ptr -23h
var_20		= dword ptr -20h
var_1C		= byte ptr -1Ch
var_1B		= byte ptr -1Bh
var_1A		= dword ptr -1Ah
var_16		= word ptr -16h
var_14		= byte ptr -14h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 5F4h
		push	si
		push	di
		push	seg stub253
		push	offset sub_735A5
		push	large 10003h
		push	0Ah
		lea	ax, [bp+var_5E]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		push	50h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	offset aStrtspch_4
		push	1
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_AE]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_AE]
		push	ax
		lea	ax, [bp+var_126]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_7437
		add	sp, 6
		push	4
		lea	ax, [bp+var_126]
		push	ax
		call	sub_7844
		add	sp, 4
		mov	eax, [bp+var_C1]
		mov	[bp+var_4], eax
		mov	ax, [bp+var_B9]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_D9B11
		mov	eax, [bp+var_C5]
		jmp	short loc_D9B16

loc_D9B11:
		mov	eax, [bp+var_B5]

loc_D9B16:
		mov	edx, [bp+var_4]
		add	edx, eax
		mov	[bp+var_8], edx
		mov	eax, [bp+var_4]
		cmp	eax, [bp+var_8]
		jz	short loc_D9B86
		lea	ax, [bp+var_41E]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_7407
		pop	cx
		push	0
		push	large [bp+var_8]
		push	large [bp+var_4]
		lea	ax, [bp+var_126]
		push	ax
		lea	ax, [bp+var_41E]
		push	ax
		call	sub_6C024
		add	sp, 0Eh
		xor	si, si
		jmp	short loc_D9B72

loc_D9B56:
		push	3
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_5E]
		add	ax, dx
		push	ax
		push	si
		lea	ax, [bp+var_41E]
		push	ax
		call	sub_75B60
		add	sp, 8
		inc	si

loc_D9B72:
		cmp	si, 2
		jle	short loc_D9B56
		push	2
		lea	ax, [bp+var_41E]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4

loc_D9B86:
		cmp	byte_7D13E, 0
		jz	short loc_D9B90
		jmp	loc_DA566

loc_D9B90:
		mov	byte_7D13E, 0
		push	100h
		push	0
		lea	ax, [bp+var_16]
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
		push	offset aBackgrnd
		push	4
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_176]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_176]
		push	ax
		lea	ax, [bp+var_23E]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_7437
		add	sp, 6
		mov	ax, [bp+var_1E1]
		mov	[bp+var_E], ax
		push	50h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	offset aElevator
		push	4
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_176]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_176]
		push	ax
		lea	ax, [bp+var_2B6]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_7437
		add	sp, 6
		mov	ax, [bp+var_259]
		mov	[bp+var_C], ax
		mov	bx, [bp+arg_0]
		cmp	bx, 8
		jbe	short loc_D9C45
		jmp	loc_D9CFE

loc_D9C45:
		shl	bx, 1
		jmp	cs:off_DA593[bx]	; switch jump

loc_D9C4C:
		push	50h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	offset aF4f

loc_D9C5F:
		push	4
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_1C6]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		jmp	loc_D9D07

loc_D9C7E:
		push	50h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	offset aSbd5
		jmp	short loc_D9C5F

loc_D9C93:
		push	50h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	offset aTbd
		jmp	short loc_D9C5F

loc_D9CA8:
		push	50h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	offset aHellcat
		jmp	short loc_D9C5F

loc_D9CBD:
		push	50h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	offset aCorsair
		jmp	short loc_D9C5F

loc_D9CD2:
		push	50h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	offset aTbf
		jmp	loc_D9C5F

loc_D9CE8:
		push	50h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	offset aSb2c
		jmp	loc_D9C5F

loc_D9CFE:
		push	0B002h
		call	sub_1DDFE
		pop	cx

loc_D9D07:
		push	1
		lea	ax, [bp+var_1C6]
		push	ax
		lea	ax, [bp+var_32E]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_7437
		add	sp, 6
		mov	ax, [bp+var_2D1]
		mov	[bp+var_A], ax
		push	50h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	offset aSkywise
		push	4
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_176]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_176]
		push	ax
		lea	ax, [bp+var_3A6]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_7437
		add	sp, 6
		mov	[bp+var_20], 0
		mov	[bp+var_1C], 2
		mov	[bp+var_1B], 0
		mov	[bp+var_1A], 0
		push	2
		lea	ax, word ptr [bp+var_20]
		push	ax
		push	0
		lea	ax, [bp+var_3A6]
		push	ax
		call	sub_75B60
		add	sp, 8
		mov	[bp+var_23], 0
		lea	ax, word ptr [bp+var_20]
		push	ax
		lea	ax, [bp+var_26]
		push	ax
		call	sub_7624F
		add	sp, 4
		push	[bp+var_26]
		mov	al, [bp+var_24]
		push	ax
		lea	ax, [bp+var_26]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	sub_76272
		add	sp, 8
		push	0
		push	[bp+var_16]
		mov	al, [bp+var_14]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	sub_76259
		add	sp, 8
		mov	[bp+var_3B4], 0
		mov	[bp+var_3B2], 0
		mov	[bp+var_3B0], 0
		mov	[bp+var_3AE], 0
		mov	[bp+var_3AC], 13Fh
		mov	[bp+var_3AA], 0C7h
		push	0
		lea	ax, [bp+var_3B4]
		push	ax
		call	TextRenderer_ApplyFormatChange_67CBE
		add	sp, 4
		mov	[bp+var_3C2], 0
		mov	[bp+var_3C0], 0
		mov	[bp+var_3BE], 0
		mov	[bp+var_3BC], 0
		mov	[bp+var_3BA], 13Fh
		mov	[bp+var_3B8], 0C7h
		push	0
		lea	ax, [bp+var_3C2]
		push	ax
		call	TextRenderer_ApplyFormatChange_67CBE
		add	sp, 4
		lea	ax, [bp+var_3C2]
		push	ax
		lea	ax, [bp+var_2A]
		push	ax
		call	sub_6735D
		add	sp, 4
		push	seg stub253
		push	offset sub_735A5
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_426]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		push	seg stub253
		push	offset sub_735A5
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_48A]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		push	seg stub253
		push	offset sub_735A5
		push	large 1000Eh
		push	0Ah
		lea	ax, [bp+var_516]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		push	seg stub253
		push	offset sub_735A5
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_57A]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		lea	ax, [bp+var_3C2]
		push	ax
		push	0FFh
		push	0Ch
		lea	ax, [bp+var_5F4]
		push	ax
		call	sub_60273
		add	sp, 8
		mov	[bp+var_2B], 0
		xor	di, di
		mov	[bp+var_2E], 0
		mov	[bp+var_30], 0
		xor	si, si
		jmp	short loc_D9EF0

loc_D9EE1:
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_596]
		add	bx, ax
		mov	word ptr [bx], 0
		inc	si

loc_D9EF0:
		cmp	si, 0Eh
		jl	short loc_D9EE1
		cmp	[bp+var_E], 0Ah
		jle	short loc_D9F04
		push	2222h
		call	sub_1DDFE
		pop	cx

loc_D9F04:
		cmp	[bp+var_C], 0Ah
		jle	short loc_D9F13
		push	2223h
		call	sub_1DDFE
		pop	cx

loc_D9F13:
		xor	si, si
		jmp	short loc_D9F34

loc_D9F17:
		push	3
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_426]
		add	ax, dx
		push	ax
		push	si
		lea	ax, [bp+var_23E]
		push	ax
		call	sub_75B60
		add	sp, 8
		inc	si

loc_D9F34:
		cmp	si, [bp+var_E]
		jl	short loc_D9F17
		push	0
		push	2
		lea	ax, [bp+var_5E]
		push	ax
		call	sub_5EF3D
		add	sp, 6
		xor	si, si
		jmp	short loc_D9F6A

loc_D9F4D:
		push	3
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_48A]
		add	ax, dx
		push	ax
		push	si
		lea	ax, [bp+var_32E]
		push	ax
		call	sub_75B60
		add	sp, 8
		inc	si

loc_D9F6A:
		cmp	si, [bp+var_A]
		jl	short loc_D9F4D
		xor	si, si
		jmp	short loc_D9F90

loc_D9F73:
		push	3
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_57A]
		add	ax, dx
		push	ax
		push	si
		lea	ax, [bp+var_2B6]
		push	ax
		call	sub_75B60
		add	sp, 8
		inc	si

loc_D9F90:
		cmp	si, [bp+var_C]
		jl	short loc_D9F73
		push	[bp+arg_0]
		lea	ax, [bp+var_596]
		push	ax
		lea	ax, [bp+var_516]
		push	ax
		push	cs
		call	near ptr sub_D9630
		add	sp, 6
		mov	bx, [bp+var_57C]
		mov	word ptr [bx+1Bh], 0
		mov	[bp+var_10], 5
		mov	[bp+var_32], 0
		xor	si, si
		jmp	short loc_D9FE6

loc_D9FC0:
		push	large 0
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_426]
		add	ax, dx
		push	ax
		push	0
		call	AnimLayer_Construct_66FB9
		add	sp, 8
		mov	bx, si
		shl	bx, 1
		lea	dx, [bp+var_5AA]
		add	bx, dx
		mov	[bx], ax
		inc	si

loc_D9FE6:
		cmp	si, [bp+var_E]
		jl	short loc_D9FC0
		xor	si, si
		jmp	short loc_DA015

loc_D9FEF:
		push	large 0
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_48A]
		add	ax, dx
		push	ax
		push	0
		call	AnimLayer_Construct_66FB9
		add	sp, 8
		mov	bx, si
		shl	bx, 1
		lea	dx, [bp+var_5BE]
		add	bx, dx
		mov	[bx], ax
		inc	si

loc_DA015:
		cmp	si, [bp+var_A]
		jl	short loc_D9FEF
		xor	si, si
		jmp	short loc_DA044

loc_DA01E:
		push	large 0
		mov	ax, si
		imul	ax, ax, 0Ah
		lea	dx, [bp+var_57A]
		add	ax, dx
		push	ax
		push	0
		call	AnimLayer_Construct_66FB9
		add	sp, 8
		mov	bx, si
		shl	bx, 1
		lea	dx, [bp+var_5D2]
		add	bx, dx
		mov	[bx], ax
		inc	si

loc_DA044:
		cmp	si, [bp+var_C]
		jl	short loc_DA01E
		mov	bx, [bp+var_2E]
		shl	bx, 1
		lea	ax, [bp+var_5AA]
		add	bx, ax
		push	word ptr [bx]
		lea	ax, [bp+var_5F4]
		push	ax
		call	LayerGroup_Add_6656E
		add	sp, 4
		xor	eax, eax
		mov	[bp+var_36], eax
		mov	[bp+var_3A], eax
		jmp	loc_DA2FA

loc_DA071:
		mov	[bp+var_36], 7
		mov	eax, dword_7B29D
		mov	[bp+var_3A], eax
		inc	[bp+var_32]
		lea	ax, [bp+var_3C2]
		push	ax
		lea	ax, [bp+var_3E]
		push	ax
		call	sub_6735D
		add	sp, 4
		push	1
		lea	ax, [bp+var_5F4]
		push	ax
		call	sub_75BF0
		add	sp, 4
		lea	ax, [bp+var_3E]
		push	ax
		call	sub_67383
		pop	cx
		mov	al, [bp+var_5D5]
		mov	[bp+var_3B], al
		mov	ah, 0
		or	ax, ax
		jz	short loc_DA0BE
		jmp	loc_DA2DC

loc_DA0BE:
		lea	ax, [bp+var_3B4]
		push	ax
		lea	ax, [bp+var_3C2]
		push	ax
		call	UI_ApplyEncodingHelper_67EE7
		add	sp, 4
		lea	ax, [bp+var_3B4]
		push	ax
		lea	ax, [bp+var_3E]
		push	ax
		call	sub_6735D
		add	sp, 4
		xor	si, si
		jmp	loc_DA167

loc_DA0E6:
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_596]
		add	bx, ax
		cmp	word ptr [bx], 0
		jz	short loc_DA166
		mov	bx, si
		shl	bx, 1
		add	bx, ax
		push	word ptr [bx]
		mov	bx, si
		shl	bx, 1
		add	bx, ax
		mov	bx, [bx]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		pop	cx
		cmp	si, 0Dh
		jnz	short loc_DA166
		mov	ax, [bp+var_10]
		mov	[bp+var_40], ax
		mov	bx, [bp+var_57C]
		mov	[bx+1Bh], ax
		push	bx
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		pop	cx
		mov	bx, [bp+var_57C]
		mov	word ptr [bx+1Bh], 0
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 64h
		mov	ebx, 8000h
		cdq
		idiv	ebx
		cmp	ax, 55h
		jle	short loc_DA166
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 0Ah
		mov	ebx, 8000h
		cdq
		idiv	ebx
		inc	ax
		mov	[bp+var_10], ax

loc_DA166:
		inc	si

loc_DA167:
		cmp	si, 0Eh
		jge	short loc_DA16F
		jmp	loc_DA0E6

loc_DA16F:
		cmp	[bp+var_32], 0Eh
		jl	short loc_DA18F
		mov	bx, di
		shl	bx, 1
		lea	ax, [bp+var_5BE]
		add	bx, ax
		push	word ptr [bx]
		mov	bx, di
		shl	bx, 1
		add	bx, ax
		mov	bx, [bx]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		pop	cx

loc_DA18F:
		mov	bx, [bp+var_30]
		shl	bx, 1
		lea	ax, [bp+var_5D2]
		add	bx, ax
		push	word ptr [bx]
		mov	bx, [bp+var_30]
		shl	bx, 1
		add	bx, ax
		mov	bx, [bx]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		pop	cx
		mov	bx, [bp+var_30]
		shl	bx, 1
		lea	ax, [bp+var_5D2]
		add	bx, ax
		push	word ptr [bx]
		mov	bx, [bp+var_30]
		shl	bx, 1
		add	bx, ax
		mov	bx, [bx]
		mov	bx, [bx]
		call	dword ptr [bx+1Ch]
		pop	cx
		cmp	[bp+var_32], 0Eh
		jge	short loc_DA1E7
		mov	bx, di
		shl	bx, 1
		lea	ax, [bp+var_5BE]
		add	bx, ax
		push	word ptr [bx]
		mov	bx, di
		shl	bx, 1
		add	bx, ax
		mov	bx, [bx]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		pop	cx

loc_DA1E7:
		mov	bx, di
		shl	bx, 1
		lea	ax, [bp+var_5BE]
		add	bx, ax
		push	word ptr [bx]
		mov	bx, di
		shl	bx, 1
		add	bx, ax
		mov	bx, [bx]
		mov	bx, [bx]
		call	dword ptr [bx+1Ch]
		pop	cx
		lea	ax, [bp+var_3E]
		push	ax
		call	sub_67383
		pop	cx
		push	word_7AF7E
		lea	ax, [bp+var_3B4]
		push	ax
		call	UI_ApplyEncodingHelper_67EE7
		add	sp, 4
		mov	bx, [bp+var_2E]
		shl	bx, 1
		lea	ax, [bp+var_5AA]
		add	bx, ax
		push	word ptr [bx]
		call	AnimLayer_IsFinished_6703E
		pop	cx
		or	al, al
		jz	short loc_DA278
		mov	bx, [bp+var_2E]
		shl	bx, 1
		lea	ax, [bp+var_5AA]
		add	bx, ax
		push	word ptr [bx]
		lea	ax, [bp+var_5F4]
		push	ax
		call	sub_665AB
		add	sp, 4
		inc	[bp+var_2E]
		mov	ax, [bp+var_2E]
		cmp	ax, [bp+var_E]
		jnz	short loc_DA25E
		mov	[bp+var_2B], 1
		jmp	short loc_DA278

loc_DA25E:
		mov	bx, [bp+var_2E]
		shl	bx, 1
		lea	ax, [bp+var_5AA]
		add	bx, ax
		push	word ptr [bx]
		lea	ax, [bp+var_5F4]
		push	ax
		call	LayerGroup_Add_6656E
		add	sp, 4

loc_DA278:
		mov	bx, di
		shl	bx, 1
		lea	ax, [bp+var_5BE]
		add	bx, ax
		push	word ptr [bx]
		call	AnimLayer_IsFinished_6703E
		pop	cx
		or	al, al
		jz	short loc_DA298
		inc	di
		cmp	di, [bp+var_A]
		jnz	short loc_DA298
		mov	[bp+var_2B], 1

loc_DA298:
		mov	bx, [bp+var_30]
		shl	bx, 1
		lea	ax, [bp+var_5D2]
		add	bx, ax
		push	word ptr [bx]
		call	AnimLayer_IsFinished_6703E
		pop	cx
		or	al, al
		jz	short loc_DA2BE
		inc	[bp+var_30]
		mov	ax, [bp+var_30]
		cmp	ax, [bp+var_C]
		jnz	short loc_DA2BE
		mov	[bp+var_2B], 1

loc_DA2BE:
		mov	eax, [bp+var_3A]
		add	eax, [bp+var_36]
		cmp	eax, dword_7B29D
		ja	short loc_DA2D2
		mov	ax, 1
		jmp	short loc_DA2D4

loc_DA2D2:
		xor	ax, ax

loc_DA2D4:
		mov	ah, 0
		or	ax, ax
		jz	short loc_DA2BE
		jmp	short loc_DA2FA

loc_DA2DC:
		mov	bx, [bp+var_2E]
		shl	bx, 1
		lea	ax, [bp+var_5AA]
		add	bx, ax
		push	word ptr [bx]
		lea	ax, [bp+var_5F4]
		push	ax
		call	sub_665AB
		add	sp, 4
		mov	[bp+var_2B], 1

loc_DA2FA:
		mov	al, [bp+var_2B]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_DA306
		jmp	loc_DA071

loc_DA306:
		mov	al, [bp+var_3B]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_DA339

loc_DA30F:
		push	1
		call	sub_5EFBF
		pop	cx
		or	al, al
		jnz	short loc_DA30F
		push	0
		push	2
		lea	ax, [bp+var_54]
		push	ax
		call	sub_5EF3D
		add	sp, 6

loc_DA32B:
		push	1
		call	sub_5EFBF
		pop	cx
		or	al, al
		jnz	short loc_DA32B
		jmp	short loc_DA33E

loc_DA339:
		call	sub_5EFE1

loc_DA33E:
		lea	ax, [bp+var_3C2]
		push	ax
		lea	ax, [bp+var_3E]
		push	ax
		call	sub_6735D
		add	sp, 4
		push	1
		lea	ax, [bp+var_5F4]
		push	ax
		call	sub_75BF0
		add	sp, 4
		lea	ax, [bp+var_3E]
		push	ax
		call	sub_67383
		pop	cx
		xor	si, si
		jmp	short loc_DA397

loc_DA36C:
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_5AA]
		add	bx, ax
		cmp	word ptr [bx], 0
		jz	short loc_DA396
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
		jmp	short loc_DA396

loc_DA396:
		inc	si

loc_DA397:
		cmp	si, [bp+var_E]
		jl	short loc_DA36C
		xor	si, si
		jmp	short loc_DA3CB

loc_DA3A0:
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_5BE]
		add	bx, ax
		cmp	word ptr [bx], 0
		jz	short loc_DA3CA
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
		jmp	short loc_DA3CA

loc_DA3CA:
		inc	si

loc_DA3CB:
		cmp	si, [bp+var_A]
		jl	short loc_DA3A0
		xor	si, si
		jmp	short loc_DA3FF

loc_DA3D4:
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_5D2]
		add	bx, ax
		cmp	word ptr [bx], 0
		jz	short loc_DA3FE
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
		jmp	short loc_DA3FE

loc_DA3FE:
		inc	si

loc_DA3FF:
		cmp	si, [bp+var_C]
		jl	short loc_DA3D4
		xor	si, si
		jmp	short loc_DA43E

loc_DA408:
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_596]
		add	bx, ax
		cmp	word ptr [bx], 0
		jz	short loc_DA43D
		mov	bx, si
		shl	bx, 1
		add	bx, ax
		cmp	word ptr [bx], 0
		jz	short loc_DA43D
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
		jmp	short loc_DA43D

loc_DA43D:
		inc	si

loc_DA43E:
		cmp	si, 0Eh
		jl	short loc_DA408
		push	0
		lea	ax, [bp+var_5F4]
		push	ax
		call	Scene_Destruct_666E6
		add	sp, 4
		push	seg stub253
		push	offset sub_735A0
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_57A]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg stub253
		push	offset sub_735A0
		push	large 1000Eh
		push	0Ah
		lea	ax, [bp+var_516]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg stub253
		push	offset sub_735A0
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_48A]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg stub253
		push	offset sub_735A0
		push	large 1000Ah
		push	0Ah
		lea	ax, [bp+var_426]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		lea	ax, [bp+var_2A]
		push	ax
		call	sub_67383
		pop	cx
		lea	ax, [bp+var_3C2]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		lea	ax, [bp+var_3B4]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		lea	ax, [bp+var_26]
		push	ax
		call	sub_7627C
		pop	cx
		cmp	[bp+var_1B], 0
		jz	short loc_DA50C
		cmp	[bp+var_20], 0
		jz	short loc_DA50C
		push	0
		mov	al, [bp+var_1C]
		push	ax
		lea	ax, word ptr [bp+var_20]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_DA50C

loc_DA50C:
		mov	[bp+var_20], 0
		mov	[bp+var_1B], 0
		mov	[bp+var_1A], 0
		push	2
		lea	ax, [bp+var_3A6]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		push	2
		lea	ax, [bp+var_32E]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		push	2
		lea	ax, [bp+var_2B6]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		push	2
		lea	ax, [bp+var_23E]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		lea	ax, [bp+var_16]
		push	ax
		call	sub_7627C
		pop	cx

loc_DA566:
		push	2
		lea	ax, [bp+var_126]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		push	seg stub253
		push	offset sub_735A0
		push	large 10003h
		push	0Ah
		lea	ax, [bp+var_5E]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		pop	di
		pop	si
		leave
		retf
sub_D9A80		endp

; START OF FUNCTION CHUNK FOR sub_D9A80
off_DA593	dw offset loc_D9C4C
		dw offset loc_D9C4C
		dw offset loc_D9CA8
		dw offset loc_D9CA8
		dw offset loc_D9CBD
		dw offset loc_D9C93
		dw offset loc_D9C7E
		dw offset loc_D9CD2
		dw offset loc_D9CE8
; END OF FUNCTION CHUNK FOR sub_D9A80
ovr384		ends

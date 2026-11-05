ovr253		segment	para public 'OVERLAY' use16
		assume cs:ovr253
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_95190		proc far

var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	byte ptr [si+1E3h], 0
		mov	word ptr [si+102h], 0
		mov	word ptr [si+0E4h], 0
		mov	word ptr [si+1Eh], 0
		mov	word ptr [si+0E8h], 0
		mov	word ptr [si+0F4h], 0
		mov	word ptr [si+1DCh], 0
		mov	byte ptr [si+17Ah], 0
		mov	word ptr [si+0E6h], 0FFFFh
		mov	word ptr [si+1E1h], 0
		mov	word ptr [si+0E2h], 0
		mov	dword ptr [si+17Eh], 700h
		mov	[bp+var_4], 80h
		mov	eax, [bp+var_4]
		mov	[si+182h], eax
		mov	dword ptr [si+186h], 0FFFFFE00h
		mov	dword ptr [si+18Ah], 0FFFFFF00h
		mov	dword ptr [si+18Eh], 300h
		mov	dword ptr [si+192h], 0A00h
		mov	eax, [si+192h]
		mov	[si+196h], eax
		mov	dword ptr [si+19Ah], 500h
		mov	byte ptr [si+1A0h], 20h
		mov	byte ptr [si+1A1h], 5
		mov	byte ptr [si+1A2h], 0
		mov	byte ptr [si+19Eh], 0
		mov	byte ptr [si+19Fh], 0
		call	Video_ClearTextPage
		mov	byte ptr [si+1B3h], 0
		mov	byte ptr [si+1B4h], 3Fh
		mov	byte ptr [si+1B5h], 3Fh
		mov	byte ptr [si+1B6h], 3Fh
		mov	word ptr [si+1C5h], 4
		mov	word ptr [si+1C3h], 0
		mov	word ptr [si+1C1h], 4
		mov	word ptr [si+1BFh], 1
		mov	word ptr [si+1BDh], 3
		mov	word ptr [si+1BBh], 2
		mov	word ptr [si+1B9h], 1
		mov	word ptr [si+1B7h], 0
		mov	byte ptr [si+1A3h], 0
		mov	byte ptr [si+1A4h], 3Fh
		mov	byte ptr [si+1A5h], 3Fh
		mov	byte ptr [si+1A6h], 27h
		mov	[bp+var_8], 0C0h
		mov	eax, [bp+var_8]
		mov	[si+1A7h], eax
		mov	[bp+var_C], 1E00h
		mov	eax, [bp+var_C]
		mov	[si+1ABh], eax
		mov	eax, [si+1A7h]
		neg	eax
		mov	[bp+var_10], eax
		mov	[bp+var_14], eax
		mov	[si+1AFh], eax
		mov	di, si
		add	di, 1ABh
		mov	eax, [si+1AFh]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[si+1AFh], eax
		mov	byte ptr [si+1DBh], 0FFh
		push	si
		mov	ax, si
		add	ax, 32h
		push	ax
		call	sub_1B7E4
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_95190		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_95311		proc far

var_108		= word ptr -108h
var_A7		= dword ptr -0A7h
var_9B		= word ptr -9Bh
var_97		= dword ptr -97h
var_90		= word ptr -90h
var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 108h
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr sub_95190
		pop	cx
		mov	byte ptr [si+101h], 0
		mov	ax, [bp+arg_2]
		mov	[si+1Eh], ax
		push	seg seg225
		push	0
		push	ds
		push	[bp+arg_4]
		push	ds
		push	offset aOBJECTS
		lea	ax, [bp+var_90]
		push	ax
		call	sub_29540
		add	sp, 0Eh
		mov	di, si
		add	di, 1E4h
		push	large 54504B43h
		lea	ax, [bp+var_90]
		push	ax
		push	di
		call	ResourceRecord_InitAndValidate_6D646
		add	sp, 8
		or	ax, ax
		jnz	short loc_95370
		push	7001h
		call	sub_1DDFE
		pop	cx

loc_95370:
		push	0
		push	large 4F464E49h
		push	di
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_953DB
		push	di
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	[si+0E4h], ax
		push	di
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	[si+100h], al
		mov	byte ptr [si+100h], 0
		push	seg stub253
		push	offset sub_735AA
		push	1
		push	word ptr [si+0E4h]
		push	large 1D0000h
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[si+0F4h], ax
		mov	ax, [si+0E4h]
		imul	ax, ax, 1Dh
		movzx	eax, ax
		push	eax
		push	ds
		push	word ptr [si+0F4h]
		push	di
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		jmp	short loc_953E4

loc_953DB:
		push	7002h
		call	sub_1DDFE
		pop	cx

loc_953E4:
		push	0
		push	large 50545241h
		push	di
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_953FC
		jmp	loc_9553A

loc_953FC:
		call	sub_64B0E
		push	dx
		push	ax
		pop	eax
		cmp	eax, 16E360h
		jnb	short loc_95410
		jmp	loc_95505

loc_95410:
		push	large [di+76h]
		push	large [di+65h]
		mov	ax, si
		add	ax, 1E4h
		push	ax
		lea	ax, [bp+var_108]
		push	ax
		call	IndexedRecordReader_ConstructVariantC_7477
		add	sp, 0Ch
		push	seg stub253
		push	offset sub_735A5
		push	11h
		push	word ptr [si+0E4h]
		push	large 0A0000h
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[si+0E8h], ax
		mov	word ptr [bp+var_14+2], ax
		mov	word ptr [bp+var_14], 0
		jmp	loc_954E8

loc_95454:
		push	word ptr [bp+var_14]
		lea	ax, [bp+var_108]
		push	ax
		call	sub_7844
		add	sp, 4
		mov	ax, [bp+var_9B]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_95477
		mov	eax, [bp+var_A7]
		jmp	short loc_9547C

loc_95477:
		mov	eax, [bp+var_97]

loc_9547C:
		mov	[bp+var_18], eax
		push	1
		push	0
		push	3
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_1C+2], dx
		mov	word ptr [bp+var_1C], ax
		mov	bx, word ptr [bp+var_14+2]
		mov	eax, [bp+var_1C]
		mov	[bx], eax
		mov	byte ptr [bx+4], 3
		mov	byte ptr [bx+5], 1
		mov	dword ptr [bx+6], 0
		mov	eax, [bp+var_18]
		mov	[bx+6], eax
		push	0
		mov	al, [bx+4]
		push	ax
		push	large [bx]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [bp+var_14]
		lea	ax, [bp+var_108]
		push	ax
		call	sub_75C8
		add	sp, 8
		inc	word ptr [bp+var_14]
		add	word ptr [bp+var_14+2], 0Ah

loc_954E8:
		mov	ax, [si+0E4h]
		cmp	ax, word ptr [bp+var_14]
		jle	short loc_954F4
		jmp	loc_95454

loc_954F4:
		push	2
		lea	ax, [bp+var_108]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		jmp	short loc_95535

loc_95505:
		cmp	word ptr [si+102h], 0
		jnz	short loc_95535
		push	large [di+76h]
		push	large [di+65h]
		mov	ax, si
		add	ax, 1E4h
		push	ax
		push	0
		call	IndexedRecordReader_ConstructVariantC_7477
		add	sp, 0Ch
		mov	[si+102h], ax
		or	ax, ax
		jnz	short loc_95535
		push	7003h
		call	sub_1DDFE
		pop	cx

loc_95535:
		mov	byte ptr [si+1E0h], 1

loc_9553A:
		push	0
		push	large 504D5456h
		push	di
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_955B7
		mov	eax, [di+72h]
		mov	[bp+var_4], eax
		push	1
		push	0
		push	3
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		mov	eax, [bp+var_8]
		mov	[si+0EAh], eax
		mov	byte ptr [si+0EEh], 3
		mov	byte ptr [si+0EFh], 1
		mov	dword ptr [si+0F0h], 0
		mov	eax, [bp+var_4]
		mov	[si+0F0h], eax
		push	0
		mov	al, [si+0EEh]
		push	ax
		push	large [si+0EAh]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		call	ResourceRecord_ReadDwordFieldB_6DB78
		add	sp, 6

loc_955B7:
		push	0
		push	large 464E5547h
		push	di
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_95634
		mov	eax, [di+72h]
		mov	[bp+var_C], eax
		push	1
		push	0
		push	3
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_10+2], dx
		mov	word ptr [bp+var_10], ax
		mov	eax, [bp+var_10]
		mov	[si+1C7h], eax
		mov	byte ptr [si+1CBh], 3
		mov	byte ptr [si+1CCh], 1
		mov	dword ptr [si+1CDh], 0
		mov	eax, [bp+var_C]
		mov	[si+1CDh], eax
		push	0
		mov	al, [si+1CBh]
		push	ax
		push	large [si+1C7h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		call	ResourceRecord_ReadDwordFieldB_6DB78
		add	sp, 6

loc_95634:
		push	0
		push	large 4C414552h
		push	di
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_9564C
		jmp	loc_95716

loc_9564C:
		push	0
		push	large 4F464E49h
		push	di
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_956BD
		push	di
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+134h], eax
		push	di
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+138h], eax
		push	di
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+13Ch], eax
		push	di
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[si+140h], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[si+142h], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[si+144h], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[si+146h], ax

loc_956BD:
		push	0
		push	large 534A424Fh
		push	di
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_9570F
		mov	ax, si
		add	ax, 1E4h
		mov	word ptr [bp+var_1C], ax
		push	ax
		lea	ax, word ptr [bp+var_1C+2]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		lea	ax, word ptr [bp+var_1C+2]
		mov	word ptr [bp+var_20+2], ds
		mov	word ptr [bp+var_20], ax
		push	1
		push	1
		push	word ptr [bp+var_20+2]
		push	ax
		push	65D0h
		call	sub_379D2
		add	sp, 0Ah
		mov	[si+1DCh], ax
		mov	bx, [si+1DCh]
		and	byte ptr [bx+2], 0FDh

loc_9570F:
		push	di
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx

loc_95716:
		push	0
		push	large 54534E49h
		push	di
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jz	short loc_95747
		mov	ax, si
		add	ax, 1E4h
		push	ax
		push	si
		mov	ax, si
		add	ax, 22h
		push	ax
		call	sub_73664
		add	sp, 6
		push	di
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx

loc_95747:
		push	0
		push	large 45444146h
		push	di
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_9575F
		jmp	loc_95950

loc_9575F:
		push	di
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+17Eh], eax
		push	di
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_14], eax
		push	di
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+186h], eax
		push	di
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_18], eax
		push	di
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_1C], eax
		push	di
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+18Eh], eax
		push	di
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+192h], eax
		push	di
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+19Ah], eax
		push	di
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	[si+1A0h], al
		push	di
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	[si+1A1h], al
		push	di
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	[si+1A2h], al
		push	di
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+1A7h], eax
		push	di
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+1ABh], eax
		push	di
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	[si+1A4h], al
		push	di
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	[si+1A5h], al
		push	di
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	[si+1A6h], al
		mov	eax, [bp+var_1C]
		mov	[si+182h], eax
		mov	di, si
		add	di, 17Eh
		mov	eax, [bp+var_14]
		sub	eax, [di]
		mov	[bp+var_20], eax
		mov	[bp+var_24], eax
		mov	eax, [si+182h]
		mov	edx, eax
		mov	ecx, [bp+var_24]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[si+182h], eax
		mov	eax, [bp+var_1C]
		mov	[si+18Ah], eax
		mov	di, si
		add	di, 186h
		mov	eax, [bp+var_18]
		sub	eax, [di]
		mov	[bp+var_28], eax
		mov	[bp+var_2C], eax
		mov	eax, [si+18Ah]
		mov	edx, eax
		mov	ecx, [bp+var_2C]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[si+18Ah], eax
		cmp	dword ptr [si+19Ah], 0
		jg	short loc_958BF
		mov	ax, 1
		jmp	short loc_958C1

loc_958BF:
		xor	ax, ax

loc_958C1:
		or	al, al
		jz	short loc_958D6
		mov	[bp+var_30], 500h
		mov	eax, [bp+var_30]
		mov	[si+19Ah], eax

loc_958D6:
		cmp	dword ptr [si+192h], 0
		jg	short loc_958E3
		mov	ax, 1
		jmp	short loc_958E5

loc_958E3:
		xor	ax, ax

loc_958E5:
		or	al, al
		jz	short loc_95901
		mov	eax, [si+19Ah]
		add	eax, 0A00h
		mov	[bp+var_34], eax
		mov	[bp+var_38], eax
		mov	[si+192h], eax

loc_95901:
		mov	eax, [si+192h]
		mov	[si+196h], eax
		mov	byte ptr [si+19Eh], 0
		mov	byte ptr [si+19Fh], 0
		mov	byte ptr [si+1A3h], 0
		mov	eax, [si+1A7h]
		neg	eax
		mov	[bp+var_3C], eax
		mov	[bp+var_40], eax
		mov	[si+1AFh], eax
		mov	di, si
		add	di, 1ABh
		mov	eax, [si+1AFh]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[si+1AFh], eax

loc_95950:
		push	0
		push	large 474D4144h
		mov	ax, si
		add	ax, 1E4h
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jz	short loc_95989
		push	0
		call	sub_1BEB1
		pop	cx
		mov	[si+0E2h], ax
		mov	ax, si
		add	ax, 1E4h
		push	ax
		push	si
		push	word ptr [si+0E2h]
		call	sub_1BF5C
		add	sp, 6

loc_95989:
		pop	di
		pop	si
		leave
		retf
sub_95311		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9598D		proc far

var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_5		= byte ptr -5
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	byte ptr [si+0FBh], 0
		jz	short loc_959C4
		cmp	dword ptr [si+0F6h], 0
		jz	short loc_959C4
		push	0
		mov	al, [si+0FAh]
		push	ax
		mov	ax, si
		add	ax, 0F6h
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_959C4

loc_959C4:
		mov	dword ptr [si+0F6h], 0
		mov	byte ptr [si+0FBh], 0
		mov	dword ptr [si+0FCh], 0
		cmp	word ptr [si+0E8h], 0
		jz	short loc_95A24
		mov	ax, di
		imul	ax, ax, 0Ah
		mov	di, [si+0E8h]
		add	di, ax
		mov	eax, [di]
		mov	[bp+var_4], eax
		mov	al, [di+4]
		mov	[bp+var_5], al
		mov	eax, [bp+var_4]
		mov	[si+0F6h], eax
		mov	al, [bp+var_5]
		mov	[si+0FAh], al
		mov	byte ptr [si+0FBh], 0
		mov	dword ptr [si+0FCh], 0
		mov	eax, [di+6]
		mov	[si+0FCh], eax
		jmp	loc_95ACB

loc_95A24:
		cmp	word ptr [si+102h], 0
		jz	short loc_95A37
		push	di
		push	word ptr [si+102h]
		call	sub_7844
		jmp	short loc_95A43

loc_95A37:
		push	word ptr [si+102h]
		push	99Ah
		call	Runtime_FatalErrorHandler_68BA2

loc_95A43:
		add	sp, 4
		mov	bx, [si+102h]
		mov	ax, [bx+6Dh]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_95A5B
		mov	eax, [bx+61h]
		jmp	short loc_95A63

loc_95A5B:
		mov	bx, [si+102h]
		mov	eax, [bx+71h]

loc_95A63:
		mov	[bp+var_A], eax
		push	1
		push	0
		push	3
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_E+2], dx
		mov	word ptr [bp+var_E], ax
		mov	eax, [bp+var_E]
		mov	[si+0F6h], eax
		mov	byte ptr [si+0FAh], 3
		mov	byte ptr [si+0FBh], 1
		mov	dword ptr [si+0FCh], 0
		mov	eax, [bp+var_A]
		mov	[si+0FCh], eax
		push	0
		mov	al, [si+0FAh]
		push	ax
		push	large [si+0F6h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		push	word ptr [si+102h]
		call	sub_75C8
		add	sp, 8

loc_95ACB:
		mov	byte ptr [si+1E0h], 1
		pop	di
		pop	si
		leave
		retf
sub_9598D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_95AD4		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	sub_73DBA
		pop	cx
		mov	ax, si
		add	ax, 22h
		push	ax
		call	sub_7366E
		pop	cx
		cmp	byte ptr [si+0FBh], 0
		jz	short loc_95B17
		cmp	dword ptr [si+0F6h], 0
		jz	short loc_95B17
		push	0
		mov	al, [si+0FAh]
		push	ax
		mov	ax, si
		add	ax, 0F6h
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_95B17

loc_95B17:
		mov	dword ptr [si+0F6h], 0
		mov	byte ptr [si+0FBh], 0
		mov	dword ptr [si+0FCh], 0
		mov	word ptr [si+0E6h], 0FFFFh
		cmp	byte ptr [si+17Bh], 0
		jz	short loc_95B54
		push	word ptr [si+1DCh]
		push	67ADh
		call	sub_1E642
		add	sp, 4
		mov	byte ptr [si+17Bh], 0
		mov	byte ptr [si+17Ch], 0

loc_95B54:
		mov	byte ptr [si+17Ah], 0
		push	word_7C882
		push	ds
		push	offset unk_7CEFE
		call	Text_TypewriterDrawChar
		add	sp, 6
		pop	si
		pop	bp
		retf
sub_95AD4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_95B6C		proc far

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_95B81
		jmp	loc_95DFC

loc_95B81:
		mov	word ptr [si], 911h
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		pop	cx
		mov	word_79754, 1
		mov	[bp+var_6], 0
		jmp	short loc_95BBC

loc_95B99:
		mov	ax, [bp+var_6]
		imul	ax, ax, 0Eh
		mov	dx, word_7CB22
		mov	bx, word_7CB20
		add	bx, ax
		mov	[bp+var_2], dx
		mov	[bp+var_4], bx
		push	dx
		push	bx
		call	sub_7516F
		add	sp, 4
		inc	[bp+var_6]

loc_95BBC:
		cmp	[bp+var_6], 0Fh
		jl	short loc_95B99
		mov	word_79754, 0
		cmp	word ptr [si+102h], 0
		jz	short loc_95BFA
		push	word ptr [si+102h]
		call	sub_6C2A4
		pop	cx
		cmp	word ptr [si+102h], 0
		jz	short loc_95BF4
		push	3
		push	word ptr [si+102h]
		mov	bx, [si+102h]
		mov	bx, [bx]
		call	dword ptr [bx+4]
		add	sp, 4
		jmp	short loc_95BF4

loc_95BF4:
		mov	word ptr [si+102h], 0

loc_95BFA:
		push	seg stub253
		push	offset sub_735A0
		push	large 190000h
		push	0Ah
		push	word ptr [si+0E8h]
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	word ptr [si+0F4h]
		call	sub_3B2
		pop	cx
		cmp	word ptr [si+1DCh], 0
		jz	short loc_95C39
		push	3
		push	word ptr [si+1DCh]
		mov	bx, [si+1DCh]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 4
		jmp	short loc_95C39

loc_95C39:
		cmp	word ptr [si+0E2h], 0
		jz	short loc_95C4E
		push	3
		push	word ptr [si+0E2h]
		call	sub_1C0E9
		add	sp, 4

loc_95C4E:
		mov	word ptr [si+1E4h], 520h
		mov	ax, si
		add	ax, 1E4h
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		push	0
		mov	ax, si
		add	ax, 1E4h
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		cmp	byte ptr [si+1D6h], 0
		jz	short loc_95C99
		cmp	dword ptr [si+1D1h], 0
		jz	short loc_95C99
		push	0
		mov	al, [si+1D5h]
		push	ax
		mov	ax, si
		add	ax, 1D1h
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_95C99

loc_95C99:
		mov	dword ptr [si+1D1h], 0
		mov	byte ptr [si+1D6h], 0
		mov	dword ptr [si+1D7h], 0
		cmp	byte ptr [si+1CCh], 0
		jz	short loc_95CD9
		cmp	dword ptr [si+1C7h], 0
		jz	short loc_95CD9
		push	0
		mov	al, [si+1CBh]
		push	ax
		mov	ax, si
		add	ax, 1C7h
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_95CD9

loc_95CD9:
		mov	dword ptr [si+1C7h], 0
		mov	byte ptr [si+1CCh], 0
		mov	dword ptr [si+1CDh], 0
		cmp	byte ptr [si+0FBh], 0
		jz	short loc_95D19
		cmp	dword ptr [si+0F6h], 0
		jz	short loc_95D19
		push	0
		mov	al, [si+0FAh]
		push	ax
		mov	ax, si
		add	ax, 0F6h
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_95D19

loc_95D19:
		mov	dword ptr [si+0F6h], 0
		mov	byte ptr [si+0FBh], 0
		mov	dword ptr [si+0FCh], 0
		cmp	byte ptr [si+0EFh], 0
		jz	short loc_95D59
		cmp	dword ptr [si+0EAh], 0
		jz	short loc_95D59
		push	0
		mov	al, [si+0EEh]
		push	ax
		mov	ax, si
		add	ax, 0EAh
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_95D59

loc_95D59:
		mov	dword ptr [si+0EAh], 0
		mov	byte ptr [si+0EFh], 0
		mov	dword ptr [si+0F0h], 0
		mov	ax, si
		add	ax, 44h
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		mov	ax, si
		add	ax, 36h
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		mov	word ptr [si+22h], 90Dh
		mov	ax, si
		add	ax, 22h
		push	ax
		call	sub_73678
		pop	cx
		cmp	byte ptr [si+2Dh], 0
		jz	short loc_95DBF
		cmp	dword ptr [si+28h], 0
		jz	short loc_95DBF
		push	0
		mov	al, [si+2Ch]
		push	ax
		mov	ax, si
		add	ax, 28h
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_95DBF

loc_95DBF:
		mov	dword ptr [si+28h], 0
		mov	byte ptr [si+2Dh], 0
		mov	dword ptr [si+2Eh], 0
		mov	word ptr [si+22h], 909h
		mov	ax, si
		add	ax, 22h
		push	ax
		call	sub_68B0D
		pop	cx
		push	0
		push	si
		call	sub_73DBF
		add	sp, 4
		test	di, 1
		jz	short loc_95DFC
		push	si
		call	sub_3B2
		pop	cx

loc_95DFC:
		pop	di
		pop	si
		leave
		retf
sub_95B6C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_95E00		proc far

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
		mov	si, [bp+arg_0]
		mov	ax, si
		add	ax, 2
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		push	word_7AF7E
		mov	ax, si
		add	ax, 10h
		push	ax
		call	TextFormat_ApplyStyleAttribute_67C41
		add	sp, 4
		cmp	byte ptr [si+17Bh], 0
		jnz	short loc_95E38
		mov	al, byte_7709E
		mov	ah, 0
		or	ax, ax
		jnz	short loc_95E4E

loc_95E38:
		mov	word ptr [si+14h], 0
		mov	word ptr [si+16h], 0
		mov	word ptr [si+18h], 13Fh
		mov	word ptr [si+1Ah], 0C7h
		jmp	short loc_95E78

loc_95E4E:
		push	[bp+arg_2]
		push	0
		mov	al, [si+0EEh]
		push	ax
		push	large [si+0EAh]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		mov	ax, si
		add	ax, 10h
		push	ax
		call	sub_5ADA8
		add	sp, 8

loc_95E78:
		push	6324h
		mov	ax, si
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_67C41
		add	sp, 4
		mov	ax, [si+14h]
		mov	[bp+var_2], ax
		mov	ax, [si+16h]
		mov	[bp+var_4], ax
		mov	ax, [si+18h]
		mov	[bp+var_6], ax
		mov	ax, [si+1Ah]
		mov	[bp+var_8], ax
		mov	ax, [bp+var_2]
		mov	[si+6], ax
		mov	ax, [bp+var_4]
		mov	[si+8], ax
		mov	ax, [bp+var_6]
		mov	[si+0Ah], ax
		mov	ax, [bp+var_8]
		mov	[si+0Ch], ax
		pop	si
		leave
		retf
sub_95E00		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_95EBC		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		cmp	word_7750E, 0
		jnz	short loc_95ED1
		mov	word_7750E, si

loc_95ED1:
		mov	ax, word_7CF9A
		mov	word_7C882, ax
		push	0
		push	ds
		push	offset unk_7CEFE
		call	Text_TypewriterDrawChar
		add	sp, 6
		mov	byte ptr [si+17Bh], 0
		mov	byte ptr [si+17Ch], 0
		cmp	word ptr [si+0E6h], 0FFFFh
		jnz	short loc_95EFF
		push	si
		call	sub_73495
		pop	cx
		jmp	short loc_95F16

loc_95EFF:
		mov	ax, [si+0E6h]
		mov	[bp+var_2], ax
		mov	word ptr [si+0E6h], 0FFFFh
		push	ax
		push	si
		call	sub_7349A
		add	sp, 4

loc_95F16:
		mov	ax, si
		add	ax, 22h
		push	ax
		call	sub_73669
		pop	cx
		pop	si
		leave
		retf
sub_95EBC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_95F25		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+1DBh], 0FFh
		push	0
		call	sub_1B9E8
		pop	cx
		mov	byte ptr [si+1E3h], 1
		pop	si
		pop	bp
		retf
sub_95F25		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_95F41		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+101h], 0
		push	0
		call	sub_1B9E8
		pop	cx
		pop	si
		pop	bp
		retf
sub_95F41		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à TextScroll_Helper_878EC
; (sub_878EC de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, aucun appel externe visible (19 lignes).
; ==============================================================================================
TextScroll_Helper_95F58		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	ax, dx
		add	ax, 3
		mov	ax, dx
		add	ax, 11h
		mov	ax, dx
		add	ax, 15h
		mov	ax, dx
		add	ax, 19h
		mov	ax, dx
		pop	bp
		retf
TextScroll_Helper_95F58		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; MissionRecord_Helper_7D249 (sub_7D249 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, alloue (CRT_Malloc16_Retry, 29 lignes).
; ==============================================================================================
MissionRecord_Helper_95F76		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_95F8F
		push	0Ah
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_95FA6

loc_95F8F:
		mov	dword ptr [si], 0
		mov	byte ptr [si+4], 2
		mov	byte ptr [si+5], 0
		mov	dword ptr [si+6], 0

loc_95FA6:
		mov	ax, si
		pop	si
		pop	bp
		retf
MissionRecord_Helper_95F76		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à MissionRecord_ReleaseEntry_7D27E (sub_7D27E de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; libère (Memory_TypedFree_5C7B6, CRT_FreeNear_Wrap).
; ==============================================================================================
MissionRecord_ReleaseEntry_95FAB		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_95FFA
		cmp	byte ptr [si+5], 0
		jz	short loc_95FDA
		cmp	dword ptr [si], 0
		jz	short loc_95FDA
		push	0
		mov	al, [si+4]
		push	ax
		push	si
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_95FDA

loc_95FDA:
		mov	dword ptr [si], 0
		mov	byte ptr [si+5], 0
		mov	dword ptr [si+6], 0
		test	di, 1
		jz	short loc_95FFA
		push	si
		call	sub_3B2
		pop	cx

loc_95FFA:
		pop	di
		pop	si
		pop	bp
		retf
MissionRecord_ReleaseEntry_95FAB		endp
ovr253		ends

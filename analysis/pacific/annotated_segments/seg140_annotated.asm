seg140		segment	para public 'CODE' use16
		assume cs:seg140
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0FFh, 59h, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5F4A4		proc far

var_28C		= dword ptr -28Ch
var_288		= dword ptr -288h
var_284		= dword ptr -284h
var_280		= dword ptr -280h
var_27C		= word ptr -27Ch
var_17C		= word ptr -17Ch
var_104		= word ptr -104h
var_8C		= word ptr -8Ch
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= word ptr -2Ch
var_2A		= word ptr -2Ah
var_28		= word ptr -28h
var_26		= dword ptr -26h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1E		= dword ptr -1Eh
var_1C		= dword ptr -1Ch
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_14		= dword ptr -14h
var_10		= byte ptr -10h
var_F		= byte ptr -0Fh
var_E		= word ptr -0Eh
var_C		= byte ptr -0Ch
var_B		= word ptr -0Bh
var_8		= word ptr -8
var_6		= byte ptr -6
var_5		= word ptr -5
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 28Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_8], 0
		mov	[bp+var_5], 0
		push	51h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	36h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	1
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
		push	si
		mov	bx, [si]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	si
		call	sub_6DC9A
		pop	cx
		push	50h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	37h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	1
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
		lea	ax, [bp+var_104]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_7437
		add	sp, 6
		push	50h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	38h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	1
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
		lea	ax, [bp+var_17C]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_7437
		add	sp, 6
		jmp	short loc_5F5E6

loc_5F5A9:
		push	0
		push	large 4F464E49h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		push	si
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	[bp+var_10], al
		mov	al, [si+0ECh]
		cmp	al, [bp+var_10]
		jnz	short loc_5F5D7
		mov	eax, [si+76h]
		mov	[si+65h], eax
		jmp	short loc_5F5FB

loc_5F5D7:
		mov	eax, [si+76h]
		mov	[si+65h], eax
		push	si
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx

loc_5F5E6:
		push	1
		push	large 4E454353h
		push	si
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_5F5A9

loc_5F5FB:
		push	0
		push	large 524C4F43h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_5F625
		push	si
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	[si+0D7h], al
		mov	eax, [si+76h]
		mov	[si+65h], eax
		jmp	short loc_5F631

loc_5F625:
		push	0FECEh
		push	si
		call	sub_76675
		add	sp, 4

loc_5F631:
		push	0
		push	large 454E5554h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_5F659
		push	si
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	[si+115h], al
		mov	eax, [si+76h]
		mov	[si+65h], eax

loc_5F659:
		push	0
		push	large 50435345h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_5F681
		push	si
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	[si+0DAh], al
		mov	eax, [si+76h]
		mov	[si+65h], eax

loc_5F681:
		push	0
		push	large 4B434142h
		push	si
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_5F699
		jmp	loc_5F808

loc_5F699:
		push	0
		push	large 544C4150h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_5F6BA
		push	0FECCh
		push	si
		call	sub_76675
		add	sp, 4

loc_5F6BA:
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[bp+var_2], ax
		mov	[bp+var_1A], 0
		mov	byte ptr [bp+var_16], 2
		mov	byte ptr [bp+var_16+1], 0
		mov	[bp+var_14], 0
		push	2
		lea	ax, word ptr [bp+var_1A]
		push	ax
		push	[bp+var_2]
		lea	ax, [bp+var_17C]
		push	ax
		call	sub_75B60
		add	sp, 8
		lea	ax, word ptr [bp+var_1A]
		push	ax
		lea	ax, [bp+var_8]
		push	ax
		call	sub_7624F
		add	sp, 4
		mov	eax, [si+76h]
		mov	[si+65h], eax
		jmp	loc_5F7AF

loc_5F70D:
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[bp+var_2], ax
		mov	[bp+var_24], 0
		mov	byte ptr [bp+var_20], 2
		mov	byte ptr [bp+var_20+1], 0
		mov	[bp+var_1E], 0
		push	3
		lea	ax, word ptr [bp+var_24]
		push	ax
		push	[bp+var_2]
		lea	ax, [bp+var_104]
		push	ax
		call	sub_75B60
		add	sp, 8
		push	large 0
		lea	ax, word ptr [bp+var_24]
		push	ax
		push	0
		call	Layer_Construct_66985
		add	sp, 8
		mov	di, ax
		mov	byte ptr [bp+var_20+1], 0
		mov	byte ptr [di+16h], 1
		push	ax
		mov	ax, si
		add	ax, 0A8h
		push	ax
		call	LayerGroup_Add_6656E
		add	sp, 4
		mov	eax, [si+76h]
		mov	[si+65h], eax
		cmp	byte ptr [bp+var_20+1], 0
		jz	short loc_5F79B
		cmp	[bp+var_24], 0
		jz	short loc_5F79B
		push	0
		mov	al, byte ptr [bp+var_20]
		push	ax
		lea	ax, word ptr [bp+var_24]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_5F79B

loc_5F79B:
		mov	[bp+var_24], 0
		mov	byte ptr [bp+var_20+1], 0
		mov	[bp+var_1E], 0

loc_5F7AF:
		push	1
		push	large 50414853h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_5F7C7
		jmp	loc_5F70D

loc_5F7C7:
		push	si
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx
		cmp	byte ptr [bp+var_16+1], 0
		jz	short loc_5F7F2
		cmp	[bp+var_1A], 0
		jz	short loc_5F7F2
		push	0
		mov	al, byte ptr [bp+var_16]
		push	ax
		lea	ax, word ptr [bp+var_1A]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_5F7F2

loc_5F7F2:
		mov	[bp+var_1A], 0
		mov	byte ptr [bp+var_16+1], 0
		mov	[bp+var_14], 0
		jmp	short loc_5F814

loc_5F808:
		push	0FECDh
		push	si
		call	sub_76675
		add	sp, 4

loc_5F814:
		mov	[bp+var_E], 0
		mov	[bp+var_B], 0
		mov	[bp+var_F], 0
		push	0
		push	large 45524F46h
		push	si
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_5F83A
		jmp	loc_5FC51

loc_5F83A:
		mov	[bp+var_F], 1
		push	0
		push	large 544C4150h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[bp+var_2], ax
		mov	eax, [si+76h]
		mov	[si+65h], eax
		mov	[bp+var_1A], 0
		mov	byte ptr [bp+var_16], 2
		mov	byte ptr [bp+var_16+1], 0
		mov	[bp+var_14], 0
		push	2
		lea	ax, word ptr [bp+var_1A]
		push	ax
		push	[bp+var_2]
		lea	ax, [bp+var_17C]
		push	ax
		call	sub_75B60
		add	sp, 8
		lea	ax, word ptr [bp+var_1A]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	sub_7624F
		add	sp, 4
		jmp	loc_5FBFA

loc_5F8A2:
		push	0
		push	large 50414853h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_5F8C3
		push	si
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	byte ptr [bp+var_1C+1], al
		jmp	short loc_5F8CF

loc_5F8C3:
		push	0FECEh
		push	si
		call	sub_76675
		add	sp, 4

loc_5F8CF:
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[bp+var_2], ax
		mov	eax, [si+76h]
		mov	[si+65h], eax
		mov	[bp+var_26], 0
		mov	byte ptr [bp+var_24+2], 2
		mov	byte ptr [bp+var_24+3], 0
		mov	[bp+var_20], 0
		push	3
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	[bp+var_2]
		lea	ax, [bp+var_104]
		push	ax
		call	sub_75B60
		add	sp, 8
		push	2Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_5F941
		push	large 0
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	di
		call	Layer_Construct_66985
		add	sp, 8
		mov	word ptr [di], 37B0h
		mov	word ptr [di+0Ah], 37D0h
		push	di
		call	sub_75A25
		pop	cx
		mov	ax, di
		jmp	short loc_5F943

loc_5F941:
		mov	ax, di

loc_5F943:
		mov	di, ax
		cmp	[bp+var_2], 11h
		jnz	short loc_5F96F
		push	117Dh
		call	GameVar_SetFlag_5646D
		pop	cx
		mov	word ptr [di+20h], 0Bh
		mov	word_7A2DC, di
		push	1B45h
		call	GameVar_ClearFlag_56520
		pop	cx
		push	1B46h
		call	GameVar_ClearFlag_56520
		pop	cx

loc_5F96F:
		mov	byte ptr [bp+var_24+3], 0
		mov	byte ptr [di+16h], 1
		push	0
		push	large 4F464E49h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_5F9AD
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	word ptr [bp+var_30+2], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	word ptr [bp+var_30], ax
		push	ax
		push	word ptr [bp+var_30+2]
		push	di
		call	sub_75A34
		add	sp, 6

loc_5F9AD:
		mov	[bp+var_2A], 0
		mov	[bp+var_28], 0
		push	0
		push	large 4B434C43h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_5F9D4
		mov	byte ptr [di+1Dh], 0
		mov	byte ptr [di+1Eh], 1

loc_5F9D4:
		push	0
		push	large 4C42414Ch
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_5FA1F
		mov	ax, [si+72h]
		mov	word ptr [bp+var_30+2], ax
		movsx	eax, word ptr [bp+var_30+2]
		push	eax
		push	ss
		lea	ax, [bp+var_27C]
		push	ax
		push	si
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		push	ss
		lea	ax, [bp+var_27C]
		push	ax
		lea	ax, [bp+var_2A]
		push	ax
		call	sub_765A5
		add	sp, 6
		mov	eax, [si+76h]
		mov	[si+65h], eax

loc_5FA1F:
		push	0
		push	large 55514553h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_5FA92
		mov	eax, [si+72h]
		sar	eax, 1
		mov	[bp+var_2C], ax
		shl	ax, 1
		push	ax
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[di+26h], ax
		mov	ax, [bp+var_2C]
		mov	[di+2Ah], ax
		mov	word ptr [bp+var_30+2], 0
		jmp	short loc_5FA79

loc_5FA57:
		mov	ax, word ptr [bp+var_30+2]
		mov	word ptr [bp+var_30], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	word ptr [bp+var_34+2], ax
		mov	ax, word ptr [bp+var_30]
		shl	ax, 1
		mov	bx, [di+26h]
		add	bx, ax
		mov	ax, word ptr [bp+var_34+2]
		mov	[bx], ax
		inc	word ptr [bp+var_30+2]

loc_5FA79:
		movsx	eax, word ptr [bp+var_30+2]
		mov	edx, [si+72h]
		sar	edx, 1
		cmp	eax, edx
		jl	short loc_5FA57
		mov	eax, [si+76h]
		mov	[si+65h], eax

loc_5FA92:
		push	0
		push	large 54434552h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_5FAFF
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	word ptr [bp+var_30], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	word ptr [bp+var_30+2], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	word ptr [bp+var_3C], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	word ptr [bp+var_3C+2], ax
		mov	ax, word ptr [bp+var_3C]
		mov	word ptr [bp+var_38], ax
		mov	ax, word ptr [bp+var_30+2]
		mov	word ptr [bp+var_38+2], ax
		mov	ax, word ptr [bp+var_30]
		mov	word ptr [bp+var_34], ax
		mov	ax, word ptr [bp+var_3C+2]
		mov	word ptr [bp+var_34+2], ax
		push	[bp+var_2A]
		mov	al, byte ptr [bp+var_1C+1]
		push	ax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		lea	ax, word ptr [bp+var_34]
		push	ax
		lea	ax, word ptr [bp+var_38]
		push	ax
		lea	ax, word ptr [bp+var_30]
		jmp	short loc_5FB60

loc_5FAFF:
		push	0
		push	large 44415551h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_5FB8A
		push	large 10h
		push	ss
		lea	ax, word ptr [bp+var_28C]
		push	ax
		push	si
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		mov	eax, [bp+var_28C]
		mov	[bp+var_30], eax
		mov	eax, [bp+var_288]
		mov	[bp+var_38], eax
		mov	eax, [bp+var_284]
		mov	[bp+var_34], eax
		mov	eax, [bp+var_280]
		mov	[bp+var_3C], eax
		push	[bp+var_2A]
		mov	al, byte ptr [bp+var_1C+1]
		push	ax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		lea	ax, word ptr [bp+var_34]
		push	ax
		lea	ax, word ptr [bp+var_38]
		push	ax
		lea	ax, word ptr [bp+var_30]

loc_5FB60:
		push	ax
		mov	ax, si
		add	ax, 0A8h
		push	ax
		call	sub_5FFF0
		add	sp, 0Eh
		mov	al, byte ptr [bp+var_1C+1]
		push	ax
		push	di
		mov	ax, si
		add	ax, 0A8h
		push	ax
		call	sub_75A6B
		add	sp, 6
		mov	eax, [si+76h]
		mov	[si+65h], eax

loc_5FB8A:
		push	0
		push	large 454E5554h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_5FBB1
		push	si
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	[di+2Dh], al
		mov	eax, [si+76h]
		mov	[si+65h], eax

loc_5FBB1:
		push	si
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx
		lea	ax, [bp+var_2A]
		push	ax
		call	sub_765E5
		pop	cx
		cmp	byte ptr [bp+var_24+3], 0
		jz	short loc_5FBE6
		cmp	[bp+var_26], 0
		jz	short loc_5FBE6
		push	0
		mov	al, byte ptr [bp+var_24+2]
		push	ax
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_5FBE6

loc_5FBE6:
		mov	[bp+var_26], 0
		mov	byte ptr [bp+var_24+3], 0
		mov	[bp+var_20], 0

loc_5FBFA:
		push	1
		push	large 54525053h
		push	si
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jz	short loc_5FC12
		jmp	loc_5F8A2

loc_5FC12:
		push	si
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx
		cmp	byte ptr [bp+var_16+1], 0
		jz	short loc_5FC3D
		cmp	[bp+var_1A], 0
		jz	short loc_5FC3D
		push	0
		mov	al, byte ptr [bp+var_16]
		push	ax
		lea	ax, word ptr [bp+var_1A]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_5FC3D

loc_5FC3D:
		mov	[bp+var_1A], 0
		mov	byte ptr [bp+var_16+1], 0
		mov	[bp+var_14], 0

loc_5FC51:
		push	0
		push	large 52545845h
		push	si
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_5FC69
		jmp	loc_5FE42

loc_5FC69:
		jmp	loc_5FD1C

loc_5FC6C:
		push	si
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	[bp+var_10], al
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[bp+var_2], ax
		mov	[bp+var_1A], 0
		mov	byte ptr [bp+var_16], 2
		mov	byte ptr [bp+var_16+1], 0
		mov	[bp+var_14], 0
		push	3
		lea	ax, word ptr [bp+var_1A]
		push	ax
		push	[bp+var_2]
		lea	ax, [bp+var_104]
		push	ax
		call	sub_75B60
		add	sp, 8
		push	large 0
		lea	ax, word ptr [bp+var_1A]
		push	ax
		push	0
		call	Layer_Construct_66985
		add	sp, 8
		mov	di, ax
		mov	byte ptr [bp+var_16+1], 0
		mov	byte ptr [di+16h], 1
		push	ax
		mov	al, [bp+var_10]
		push	ax
		mov	ax, si
		add	ax, 10Fh
		push	ax
		call	sub_6177F
		add	sp, 6
		mov	eax, [si+76h]
		mov	[si+65h], eax
		cmp	byte ptr [bp+var_16+1], 0
		jz	short loc_5FD08
		cmp	[bp+var_1A], 0
		jz	short loc_5FD08
		push	0
		mov	al, byte ptr [bp+var_16]
		push	ax
		lea	ax, word ptr [bp+var_1A]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_5FD08

loc_5FD08:
		mov	[bp+var_1A], 0
		mov	byte ptr [bp+var_16+1], 0
		mov	[bp+var_14], 0

loc_5FD1C:
		push	1
		push	large 50414853h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_5FD34
		jmp	loc_5FC6C

loc_5FD34:
		push	si
		call	ResourceRecord_SeekToStart_6DC71
		pop	cx
		jmp	loc_5FE23

loc_5FD3E:
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[bp+var_2], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	word ptr [bp+var_14+2], ax
		mov	[bp+var_1C], 0
		mov	byte ptr [bp+var_1A+2], 2
		mov	byte ptr [bp+var_1A+3], 0
		mov	[bp+var_16], 0
		push	3
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	[bp+var_2]
		lea	ax, [bp+var_104]
		push	ax
		call	sub_75B60
		add	sp, 8
		mov	ax, word ptr [bp+var_14+2]
		mov	word ptr [bp+var_1E], ax
		push	21h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_5FDC8
		push	large 0
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	di
		call	Layer_Construct_66985
		add	sp, 8
		mov	word ptr [di], 3750h
		mov	word ptr [di+0Ah], 3770h
		mov	byte ptr [di+1Dh], 0
		mov	word ptr [di], 3780h
		mov	word ptr [di+0Ah], 37A0h
		mov	ax, word ptr [bp+var_1E]
		mov	[di+1Eh], ax
		mov	byte ptr [di+20h], 0
		mov	ax, di
		jmp	short loc_5FDCA

loc_5FDC8:
		mov	ax, di

loc_5FDCA:
		mov	di, ax
		mov	byte ptr [bp+var_1A+3], 0
		mov	byte ptr [di+16h], 1
		push	ax
		mov	ax, si
		add	ax, 0A8h
		push	ax
		call	LayerGroup_Add_6656E
		add	sp, 4
		mov	eax, [si+76h]
		mov	[si+65h], eax
		cmp	byte ptr [bp+var_1A+3], 0
		jz	short loc_5FE0F
		cmp	[bp+var_1C], 0
		jz	short loc_5FE0F
		push	0
		mov	al, byte ptr [bp+var_1A+2]
		push	ax
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_5FE0F

loc_5FE0F:
		mov	[bp+var_1C], 0
		mov	byte ptr [bp+var_1A+3], 0
		mov	[bp+var_16], 0

loc_5FE23:
		push	1
		push	large 52505352h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_5FE3B
		jmp	loc_5FD3E

loc_5FE3B:
		push	si
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx

loc_5FE42:
		push	si
		call	ResourceRecord_Helper_6D61E
		pop	cx
		push	[bp+var_8]
		mov	al, [bp+var_6]
		push	ax
		lea	ax, [bp+var_8]
		push	ax
		mov	ax, si
		add	ax, 0E1h
		push	ax
		call	sub_76272
		add	sp, 8
		cmp	[bp+var_F], 0
		jz	short loc_5FE81
		push	[bp+var_E]
		mov	al, [bp+var_C]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		mov	ax, si
		add	ax, 0E1h
		push	ax
		call	sub_76272
		add	sp, 8

loc_5FE81:
		lea	ax, [bp+var_E]
		push	ax
		call	sub_7627C
		pop	cx
		push	2
		lea	ax, [bp+var_17C]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		push	2
		lea	ax, [bp+var_104]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		lea	ax, [bp+var_8]
		push	ax
		call	sub_7627C
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_5F4A4		endp

; ----------------------------------------------------------------------

sub_5FEB7		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	sub_66C19
sub_5FEB7		endp

; ----------------------------------------------------------------------

sub_5FEC3		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_66C88
sub_5FEC3		endp

; ----------------------------------------------------------------------

sub_5FECF		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_DrawAtOwnPos_66BEC
sub_5FECF		endp

; ----------------------------------------------------------------------

sub_5FEDB		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	sub_63217
sub_5FEDB		endp

; ----------------------------------------------------------------------

sub_5FEE7		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_66C88
sub_5FEE7		endp

; ----------------------------------------------------------------------

sub_5FEF3		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	sub_63236
sub_5FEF3		endp

; ----------------------------------------------------------------------

sub_5FEFF		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	sub_75A39
sub_5FEFF		endp

; ----------------------------------------------------------------------

sub_5FF0B		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_66C88
sub_5FF0B		endp

; ----------------------------------------------------------------------

sub_5FF17		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
sub_5FF17		endp

; START OF FUNCTION CHUNK FOR sub_5FF17
		db 0EAh, 3Ch
; END OF FUNCTION CHUNK FOR sub_5FF17
seg140		ends

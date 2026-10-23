seg026		segment	byte public 'CODE' use16
		assume cs:seg026
		;org 1
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_11F61	proc far		; CODE XREF: sub_137FA+8Bp

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_11F7D
		push	0D1h ; '�'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_11FF6

loc_11F7D:				; CODE XREF: sub_11F61+9j
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		call	sub_DAEB
		add	sp, 0Ah
		mov	word ptr [si+0Eh], 2D69h
		mov	ax, si
		add	ax, 97h	; '�'
		mov	ax, si
		add	ax, 9Bh	; '�'
		mov	ax, si
		add	ax, 9Fh	; '�'
		mov	ax, si
		add	ax, 0A3h ; '�'
		mov	ax, si
		add	ax, 0ABh ; '�'
		mov	ax, si
		add	ax, 0AFh ; '�'
		mov	dword ptr [si+0B9h], 0
		mov	byte ptr [si+0BDh], 2
		mov	byte ptr [si+0BEh], 0
		mov	dword ptr [si+0BFh], 0
		mov	dword ptr [si+0C3h], 0
		mov	byte ptr [si+0C7h], 2
		mov	byte ptr [si+0C8h], 0
		mov	dword ptr [si+0C9h], 0
		push	si
		nop
		push	cs
		call	near ptr sub_1220C
		add	sp, 2

loc_11FF6:				; CODE XREF: sub_11F61+1Aj
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_11F61	endp

; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_11FFE	proc far		; CODE XREF: sub_137FA+127p
					; DATA XREF: dseg:2D99o

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_12010
		jmp	loc_12144
; ���������������������������������������������������������������������������

loc_12010:				; CODE XREF: sub_11FFE+Dj
		mov	word ptr [si+0Eh], 2D69h
		push	27Eh
		push	0
		call	sub_3EC18
		add	sp, 4
		push	0C7h ; '�'
		push	0
		call	sub_3EC47
		add	sp, 4
		cmp	byte_492EB, 0
		jz	short loc_12054
		cmp	dword_492E6, 0
		jz	short loc_12054
		push	0
		mov	al, byte_492EA
		push	ax
		push	62C6h
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_12054:				; CODE XREF: sub_11FFE+36j
					; sub_11FFE+3Ej
		mov	dword_492E6, 0
		mov	byte_492EB, 0
		mov	dword_492EC, 0
		push	62D0h
		call	sub_4291B
		add	sp, 2
		call	sub_42B19
		cmp	word ptr [si+0B7h], 0
		jz	short loc_12095
		push	3
		push	word ptr [si+0B7h]
		mov	bx, [si+0B7h]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short $+2

loc_12095:				; CODE XREF: sub_11FFE+82j
		push	0
		push	2
		mov	ax, si
		add	ax, 93h	; '�'
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		cmp	byte ptr [si+0C8h], 0
		jz	short loc_120D3
		cmp	dword ptr [si+0C3h], 0
		jz	short loc_120D3
		push	0
		mov	al, [si+0C7h]
		push	ax
		mov	ax, si
		add	ax, 0C3h ; '�'
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_120D3:				; CODE XREF: sub_11FFE+B1j
					; sub_11FFE+B9j
		mov	dword ptr [si+0C3h], 0
		mov	byte ptr [si+0C8h], 0
		mov	dword ptr [si+0C9h], 0
		cmp	byte ptr [si+0BEh], 0
		jz	short loc_12113
		cmp	dword ptr [si+0B9h], 0
		jz	short loc_12113
		push	0
		mov	al, [si+0BDh]
		push	ax
		mov	ax, si
		add	ax, 0B9h ; '�'
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_12113:				; CODE XREF: sub_11FFE+F1j
					; sub_11FFE+F9j
		mov	dword ptr [si+0B9h], 0
		mov	byte ptr [si+0BEh], 0
		mov	dword ptr [si+0BFh], 0
		push	0
		push	si
		call	sub_DC89
		add	sp, 4
		test	di, 1
		jz	short loc_12144
		push	si
		call	sub_308
		add	sp, 2

loc_12144:				; CODE XREF: sub_11FFE+Fj
					; sub_11FFE+13Bj
		pop	di
		pop	si
		pop	bp
		retf
sub_11FFE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_12148	proc far		; CODE XREF: sub_1220C+14Ep
					; seg026:145Bp	...

var_10		= dword	ptr -10h
var_C		= word ptr -0Ch
var_A		= dword	ptr -0Ah
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+95h]
		mov	dx, [si+93h]
		push	ax
		mov	ax, [si+8Fh]
		mov	bx, 21h	; '!'
		push	dx
		imul	bx
		pop	dx
		add	dx, ax
		pop	ax
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	ds
		mov	ax, si
		add	ax, 74h	; 't'
		push	ax
		call	CRT_MemFamily_Extra5
		add	sp, 8
		mov	ax, word ptr [bp+var_4]
		add	ax, 9
		push	word ptr [bp+var_4+2]
		push	ax
		push	ds
		mov	ax, si
		add	ax, 7Dh	; '}'
		push	ax
		call	CRT_MemFamily_Extra5
		add	sp, 8
		les	bx, [bp+var_4]
		mov	al, es:[bx+1Ah]
		mov	[si+8Eh], al
		les	bx, [bp+var_4]
		mov	ax, es:[bx+1Bh]
		mov	[bp+var_6], ax
		movsx	eax, [bp+var_6]
		shl	eax, 8
		mov	[bp+var_A], eax
		mov	eax, [bp+var_A]
		mov	[si+0ABh], eax
		les	bx, [bp+var_4]
		mov	ax, es:[bx+1Dh]
		mov	[bp+var_C], ax
		movsx	eax, [bp+var_C]
		shl	eax, 8
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		mov	[si+0AFh], eax
		les	bx, [bp+var_4]
		mov	ax, es:[bx+1Fh]
		mov	[si+0A7h], ax
		pop	si
		leave
		retf
sub_12148	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_121F6	proc far		; CODE XREF: sub_1220C+2B1p
					; seg026:1541p	...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word ptr [si+0B5h], 0
		mov	word ptr [si+0B3h], 3Ch	; '<'
		pop	si
		pop	bp
		retf
sub_121F6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1220C	proc far		; CODE XREF: sub_11F61+8Fp

var_266		= dword	ptr -266h
var_262		= dword	ptr -262h
var_25E		= dword	ptr -25Eh
var_25A		= dword	ptr -25Ah
var_256		= dword	ptr -256h
var_252		= dword	ptr -252h
var_24E		= dword	ptr -24Eh
var_24A		= dword	ptr -24Ah
var_246		= dword	ptr -246h
var_242		= word ptr -242h
var_1CA		= dword	ptr -1CAh
var_1C6		= dword	ptr -1C6h
var_1C2		= dword	ptr -1C2h
var_1BE		= word ptr -1BEh
var_161		= dword	ptr -161h
var_15D		= dword	ptr -15Dh
var_159		= dword	ptr -159h
var_151		= dword	ptr -151h
var_14C		= dword	ptr -14Ch
var_144		= word ptr -144h
var_142		= word ptr -142h
var_116		= word ptr -116h
var_C6		= dword	ptr -0C6h
var_C2		= dword	ptr -0C2h
var_BE		= dword	ptr -0BEh
var_BA		= dword	ptr -0BAh
var_B6		= dword	ptr -0B6h
var_B2		= dword	ptr -0B2h
var_AE		= dword	ptr -0AEh
var_AA		= word ptr -0AAh
var_A8		= word ptr -0A8h
var_A6		= word ptr -0A6h
var_A4		= word ptr -0A4h
var_A1		= byte ptr -0A1h
var_A0		= dword	ptr -0A0h
var_9C		= word ptr -9Ch
var_9A		= word ptr -9Ah
var_98		= word ptr -98h
var_95		= byte ptr -95h
var_94		= dword	ptr -94h
var_90		= word ptr -90h
var_8E		= word ptr -8Eh
var_8C		= word ptr -8Ch
var_89		= byte ptr -89h
var_88		= dword	ptr -88h
var_84		= word ptr -84h
var_82		= word ptr -82h
var_80		= word ptr -80h
var_7D		= byte ptr -7Dh
var_7C		= dword	ptr -7Ch
var_78		= word ptr -78h
var_76		= word ptr -76h
var_74		= word ptr -74h
var_71		= byte ptr -71h
var_70		= dword	ptr -70h
var_6C		= word ptr -6Ch
var_6A		= word ptr -6Ah
var_68		= word ptr -68h
var_65		= byte ptr -65h
var_64		= dword	ptr -64h
var_60		= word ptr -60h
var_5E		= word ptr -5Eh
var_5C		= word ptr -5Ch
var_59		= byte ptr -59h
var_58		= dword	ptr -58h
var_54		= word ptr -54h
var_52		= word ptr -52h
var_50		= word ptr -50h
var_4D		= byte ptr -4Dh
var_4C		= dword	ptr -4Ch
var_48		= word ptr -48h
var_46		= word ptr -46h
var_44		= word ptr -44h
var_42		= word ptr -42h
var_40		= word ptr -40h
var_3D		= byte ptr -3Dh
var_3C		= dword	ptr -3Ch
var_38		= word ptr -38h
var_36		= dword	ptr -36h
var_32		= byte ptr -32h
var_31		= byte ptr -31h
var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 266h
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	ds
		push	offset a_iff	; ".iff"
		push	ds
		push	offset aObjworld ; "objworld"
		push	ds
		push	offset a____DataGamefl ; "..\\..\\data\\gameflow\\"
		lea	ax, [bp+var_116]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_116]
		push	ax
		call	sub_42B28
		add	sp, 2
		push	6369h
		call	sub_1FD9C
		add	sp, 2
		mov	word ptr [si+91h], 0
		mov	word ptr [si+8Fh], 0
		push	ds
		push	offset a_iff	; ".iff"
		push	ds
		push	offset aObjview	; "objview"
		push	ds
		push	offset a____DataGamefl ; "..\\..\\data\\gameflow\\"
		lea	ax, [bp+var_116]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_1BE]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_1BE], 556h
		mov	[bp+var_15D], 100h
		mov	[bp+var_161], 0
		mov	[bp+var_1BE], 56Eh
		mov	[bp+var_142], 0
		xor	ax, ax
		mov	[bp+var_144], ax
		movsx	eax, ax
		mov	[bp+var_159], eax
		push	1
		lea	ax, [bp+var_116]
		push	ax
		lea	ax, [bp+var_1BE]
		push	ax
		mov	bx, [bp+var_1BE]
		call	dword ptr [bx+14h]
		add	sp, 6
		mov	eax, [bp+var_151]
		cmp	eax, dword_45C73
		jnz	short loc_122D5
		mov	ax, 1
		jmp	short loc_122D7
; ���������������������������������������������������������������������������

loc_122D5:				; CODE XREF: sub_1220C+C2j
		xor	ax, ax

loc_122D7:				; CODE XREF: sub_1220C+C7j
		or	ax, ax
		jz	short loc_12351
		lea	ax, [bp+var_1BE]
		push	ax
		call	sub_3C491
		add	sp, 2
		push	0
		push	large [dword_45C78]
		lea	ax, [bp+var_1BE]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jz	short loc_12351
		mov	eax, [bp+var_14C]
		mov	[bp+var_C6], eax
		mov	eax, [bp+var_C6]
		mov	ebx, 21h ; '!'
		cdq
		idiv	ebx
		mov	[si+91h], ax
		push	1
		push	0
		push	2
		push	large [bp+var_C6]
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	[si+95h], dx
		mov	[si+93h], ax
		push	word ptr [si+95h]
		push	word ptr [si+93h]
		lea	ax, [bp+var_1BE]
		push	ax
		call	ResourceRecord_ReadDwordFieldB_3C36F
		add	sp, 6

loc_12351:				; CODE XREF: sub_1220C+CDj
					; sub_1220C+F2j
		cmp	word ptr [si+91h], 0
		jz	short loc_12362
		push	si
		push	cs
		call	near ptr sub_12148
		add	sp, 2
		jmp	short loc_1236F
; ���������������������������������������������������������������������������

loc_12362:				; CODE XREF: sub_1220C+14Aj
		push	1
		push	2C32h
		call	Fatal_Error_310B
		add	sp, 4

loc_1236F:				; CODE XREF: sub_1220C+154j
		mov	ax, si
		add	ax, 74h	; 't'
		mov	[bp+var_2], ds
		mov	[bp+var_4], ax
		push	1
		push	1
		push	[bp+var_2]
		push	[bp+var_4]
		push	6350h
		call	sub_21BA2
		add	sp, 0Ah
		mov	[si+72h], ax
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		mov	[bp+var_1CA], eax
		mov	[bp+var_C], 0
		mov	eax, [bp+var_C]
		mov	[bp+var_1C6], eax
		mov	[bp+var_10], 0
		mov	eax, [bp+var_10]
		mov	[bp+var_1C2], eax
		mov	bx, [si+72h]
		mov	eax, [bp+var_1CA]
		mov	[bx+12h], eax
		mov	bx, [si+72h]
		mov	eax, [bp+var_1C6]
		mov	[bx+16h], eax
		mov	bx, [si+72h]
		mov	eax, [bp+var_1C2]
		mov	[bx+1Ah], eax
		mov	ax, [si+72h]
		add	ax, 12h
		push	word ptr [si+72h]
		mov	bx, [si+72h]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 2
		push	word ptr [si+72h]
		mov	bx, [si+72h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		add	sp, 2
		push	ax
		call	Matrix_BuildFromAngle_2574E
		add	sp, 2
		push	word ptr [si+72h]
		push	6369h
		call	sub_1FEED
		add	sp, 4
		call	sub_42B32
		mov	[bp+var_14], 200h
		mov	eax, [bp+var_14]
		mov	[si+97h], eax
		mov	bx, [si+72h]
		mov	eax, [bx+20h]
		mov	[si+9Bh], eax
		mov	[bp+var_18], 180h
		mov	eax, [si+9Bh]
		mov	edx, [bp+var_18]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+9Bh], eax
		mov	eax, [si+9Bh]
		shl	eax, 4
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_20], eax
		mov	eax, [bp+var_20]
		mov	[si+9Fh], eax
		mov	ax, [si+0A7h]
		mov	[si+0A9h], ax
		mov	ax, [si+0A7h]
		mov	[bp+var_22], ax
		mov	ax, si
		add	ax, 97h	; '�'
		mov	[bp+var_24], ax
		movsx	eax, [bp+var_22]
		mov	bx, [bp+var_24]
		mov	edx, [bx]
		imul	edx, eax
		mov	[bp+var_28], edx
		mov	eax, [bp+var_28]
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_2C]
		mov	[si+0A3h], eax
		push	si
		push	cs
		call	near ptr sub_121F6
		add	sp, 2
		mov	word ptr [si+0CDh], 0
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aObjview_0 ; "objview"
		push	ds
		push	offset a____DataGamefl ; "..\\..\\data\\gameflow\\"
		lea	ax, [bp+var_116]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_116]
		push	ax
		lea	ax, [bp+var_242]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		push	2
		push	62C6h
		push	8
		lea	ax, [bp+var_242]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_36], 0
		mov	[bp+var_32], 2
		mov	[bp+var_31], 0
		mov	[bp+var_30], 0
		push	2
		lea	ax, [bp+var_36]
		push	ax
		push	9
		lea	ax, [bp+var_242]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_36]
		push	ax
		push	0
		call	GlyphObject_ConstructWithBuffer_311CF
		add	sp, 4
		mov	[si+0B7h], ax
		mov	bx, [si+0B7h]
		mov	word ptr [bx+10h], 1
		mov	bx, [si+0B7h]
		mov	word ptr [bx+12h], 0
		push	2Dh ; '-'
		push	word ptr [si+0B7h]
		mov	bx, [si+0B7h]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	bx, [si+0B7h]
		mov	[bx+14h], ax
		push	word ptr [si+0B7h]
		push	word_46F46
		call	sub_11233
		add	sp, 4
		push	2
		mov	ax, si
		add	ax, 0B9h ; '�'
		push	ax
		push	0
		lea	ax, [bp+var_242]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	ax, si
		add	ax, 0B9h ; '�'
		mov	[bp+var_38], ax
		mov	bx, [bp+var_38]
		mov	eax, [bx]
		mov	[bp+var_3C], eax
		mov	bx, [bp+var_38]
		mov	al, [bx+4]
		mov	[bp+var_3D], al
		mov	eax, [bp+var_3C]
		mov	[si+50h], eax
		mov	al, [bp+var_3D]
		mov	[si+54h], al
		mov	byte ptr [si+55h], 0
		mov	dword ptr [si+56h], 0
		mov	bx, [bp+var_38]
		mov	eax, [bx+6]
		mov	[si+56h], eax
		mov	word ptr [si+5Ah], 0
		push	2
		mov	ax, si
		add	ax, 0C3h ; '�'
		push	ax
		push	4
		lea	ax, [bp+var_242]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_40], si
		mov	ax, si
		add	ax, 7Dh	; '}'
		mov	[bp+var_44], ax
		mov	ax, si
		add	ax, 0C3h ; '�'
		mov	[bp+var_46], ax
		mov	ax, [bp+var_40]
		mov	[bp+var_48], ax
		push	38h ; '8'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jnz	short loc_12623
		jmp	loc_126C3
; ���������������������������������������������������������������������������

loc_12623:				; CODE XREF: sub_1220C+412j
		push	0Ch
		push	4Dh ; 'M'
		push	0AAh ; '�'
		push	0Eh
		push	di
		call	sub_FED6
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 2CCDh
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	word ptr [di+2Eh], 0
		push	[bp+var_44]
		push	di
		call	sub_1119E
		add	sp, 4
		mov	bx, [bp+var_46]
		mov	eax, [bx]
		mov	[bp+var_4C], eax
		mov	bx, [bp+var_46]
		mov	al, [bx+4]
		mov	[bp+var_4D], al
		mov	eax, [bp+var_4C]
		mov	[di+1Eh], eax
		mov	al, [bp+var_4D]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_46]
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0
		mov	word ptr [di+0Eh], 2D01h
		mov	word ptr [di+34h], 1
		mov	ax, [bp+var_48]
		mov	[di+30h], ax
		mov	word ptr [di+32h], 0
		mov	word ptr [di+0Eh], 2D35h
		mov	word ptr [di+36h], 1
		mov	ax, di
		jmp	short loc_126C5
; ���������������������������������������������������������������������������

loc_126C3:				; CODE XREF: sub_1220C+414j
		mov	ax, di

loc_126C5:				; CODE XREF: sub_1220C+4B5j
		mov	[si+0CFh], ax
		push	0
		push	word ptr [si+0CFh]
		push	si
		call	sub_E1FF
		add	sp, 6
		mov	ax, si
		add	ax, 0C3h ; '�'
		mov	[bp+var_50], ax
		mov	ax, [bp+var_40]
		mov	[bp+var_52], ax
		push	32h ; '2'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_54], ax
		or	ax, ax
		jnz	short loc_126FA
		jmp	loc_127C0
; ���������������������������������������������������������������������������

loc_126FA:				; CODE XREF: sub_1220C+4E9j
		push	0Ch
		push	16h
		push	0A1h ; '�'
		push	0CAh ; '�'
		push	[bp+var_54]
		call	sub_FED6
		add	sp, 0Ah
		mov	bx, [bp+var_54]
		mov	word ptr [bx+0Eh], 7A8h
		mov	bx, [bp+var_54]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_54]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_54]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_54]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_50]
		mov	eax, [bx]
		mov	[bp+var_58], eax
		mov	bx, [bp+var_50]
		mov	al, [bx+4]
		mov	[bp+var_59], al
		mov	bx, [bp+var_54]
		mov	eax, [bp+var_58]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_54]
		mov	al, [bp+var_59]
		mov	[bx+22h], al
		mov	bx, [bp+var_54]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_54]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_50]
		mov	eax, [bx+6]
		mov	bx, [bp+var_54]
		mov	[bx+24h], eax
		mov	bx, [bp+var_54]
		mov	word ptr [bx+28h], 6
		mov	bx, [bp+var_54]
		mov	word ptr [bx+0Eh], 2C65h
		mov	bx, [bp+var_54]
		mov	word ptr [bx+2Eh], 7
		mov	bx, [bp+var_54]
		mov	ax, [bp+var_52]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_54]
		mov	word ptr [bx+2Ch], 2
		mov	bx, [bp+var_54]
		mov	word ptr [bx+0Eh], 2C99h
		mov	bx, [bp+var_54]
		mov	word ptr [bx+30h], 3
		mov	ax, [bp+var_54]
		jmp	short loc_127C3
; ���������������������������������������������������������������������������

loc_127C0:				; CODE XREF: sub_1220C+4EBj
		mov	ax, [bp+var_54]

loc_127C3:				; CODE XREF: sub_1220C+5B2j
		mov	[bp+var_42], ax
		push	0
		push	5
		push	[bp+var_42]
		call	Widget_SetFlagBit4AndOffsets_FF96
		add	sp, 6
		push	0
		push	[bp+var_42]
		push	si
		call	sub_E1FF
		add	sp, 6
		mov	ax, si
		add	ax, 0C3h ; '�'
		mov	[bp+var_5C], ax
		mov	ax, [bp+var_40]
		mov	[bp+var_5E], ax
		push	32h ; '2'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_60], ax
		or	ax, ax
		jnz	short loc_12805
		jmp	loc_128CB
; ���������������������������������������������������������������������������

loc_12805:				; CODE XREF: sub_1220C+5F4j
		push	0Ch
		push	16h
		push	0B3h ; '�'
		push	0CAh ; '�'
		push	[bp+var_60]
		call	sub_FED6
		add	sp, 0Ah
		mov	bx, [bp+var_60]
		mov	word ptr [bx+0Eh], 7A8h
		mov	bx, [bp+var_60]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_60]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_60]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_60]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_5C]
		mov	eax, [bx]
		mov	[bp+var_64], eax
		mov	bx, [bp+var_5C]
		mov	al, [bx+4]
		mov	[bp+var_65], al
		mov	bx, [bp+var_60]
		mov	eax, [bp+var_64]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_60]
		mov	al, [bp+var_65]
		mov	[bx+22h], al
		mov	bx, [bp+var_60]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_60]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_5C]
		mov	eax, [bx+6]
		mov	bx, [bp+var_60]
		mov	[bx+24h], eax
		mov	bx, [bp+var_60]
		mov	word ptr [bx+28h], 8
		mov	bx, [bp+var_60]
		mov	word ptr [bx+0Eh], 2C65h
		mov	bx, [bp+var_60]
		mov	word ptr [bx+2Eh], 9
		mov	bx, [bp+var_60]
		mov	ax, [bp+var_5E]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_60]
		mov	word ptr [bx+2Ch], 4
		mov	bx, [bp+var_60]
		mov	word ptr [bx+0Eh], 2C99h
		mov	bx, [bp+var_60]
		mov	word ptr [bx+30h], 5
		mov	ax, [bp+var_60]
		jmp	short loc_128CE
; ���������������������������������������������������������������������������

loc_128CB:				; CODE XREF: sub_1220C+5F6j
		mov	ax, [bp+var_60]

loc_128CE:				; CODE XREF: sub_1220C+6BDj
		mov	[bp+var_42], ax
		push	0
		push	5
		push	[bp+var_42]
		call	Widget_SetFlagBit4AndOffsets_FF96
		add	sp, 6
		push	0
		push	[bp+var_42]
		push	si
		call	sub_E1FF
		add	sp, 6
		mov	ax, si
		add	ax, 0C3h ; '�'
		mov	[bp+var_68], ax
		mov	ax, [bp+var_40]
		mov	[bp+var_6A], ax
		push	32h ; '2'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_6C], ax
		or	ax, ax
		jnz	short loc_12910
		jmp	loc_129D6
; ���������������������������������������������������������������������������

loc_12910:				; CODE XREF: sub_1220C+6FFj
		push	13h
		push	0Dh
		push	0A7h ; '�'
		push	0B2h ; '�'
		push	[bp+var_6C]
		call	sub_FED6
		add	sp, 0Ah
		mov	bx, [bp+var_6C]
		mov	word ptr [bx+0Eh], 7A8h
		mov	bx, [bp+var_6C]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_6C]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_6C]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_6C]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_68]
		mov	eax, [bx]
		mov	[bp+var_70], eax
		mov	bx, [bp+var_68]
		mov	al, [bx+4]
		mov	[bp+var_71], al
		mov	bx, [bp+var_6C]
		mov	eax, [bp+var_70]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_6C]
		mov	al, [bp+var_71]
		mov	[bx+22h], al
		mov	bx, [bp+var_6C]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_6C]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_68]
		mov	eax, [bx+6]
		mov	bx, [bp+var_6C]
		mov	[bx+24h], eax
		mov	bx, [bp+var_6C]
		mov	word ptr [bx+28h], 0Ah
		mov	bx, [bp+var_6C]
		mov	word ptr [bx+0Eh], 2C65h
		mov	bx, [bp+var_6C]
		mov	word ptr [bx+2Eh], 0Bh
		mov	bx, [bp+var_6C]
		mov	ax, [bp+var_6A]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_6C]
		mov	word ptr [bx+2Ch], 6
		mov	bx, [bp+var_6C]
		mov	word ptr [bx+0Eh], 2C99h
		mov	bx, [bp+var_6C]
		mov	word ptr [bx+30h], 7
		mov	ax, [bp+var_6C]
		jmp	short loc_129D9
; ���������������������������������������������������������������������������

loc_129D6:				; CODE XREF: sub_1220C+701j
		mov	ax, [bp+var_6C]

loc_129D9:				; CODE XREF: sub_1220C+7C8j
		mov	[bp+var_42], ax
		push	0
		push	5
		push	[bp+var_42]
		call	Widget_SetFlagBit4AndOffsets_FF96
		add	sp, 6
		push	0
		push	[bp+var_42]
		push	si
		call	sub_E1FF
		add	sp, 6
		mov	ax, si
		add	ax, 0C3h ; '�'
		mov	[bp+var_74], ax
		mov	ax, [bp+var_40]
		mov	[bp+var_76], ax
		push	32h ; '2'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_78], ax
		or	ax, ax
		jnz	short loc_12A1B
		jmp	loc_12AE1
; ���������������������������������������������������������������������������

loc_12A1B:				; CODE XREF: sub_1220C+80Aj
		push	13h
		push	0Dh
		push	0A7h ; '�'
		push	0ECh ; '�'
		push	[bp+var_78]
		call	sub_FED6
		add	sp, 0Ah
		mov	bx, [bp+var_78]
		mov	word ptr [bx+0Eh], 7A8h
		mov	bx, [bp+var_78]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_78]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_78]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_78]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_74]
		mov	eax, [bx]
		mov	[bp+var_7C], eax
		mov	bx, [bp+var_74]
		mov	al, [bx+4]
		mov	[bp+var_7D], al
		mov	bx, [bp+var_78]
		mov	eax, [bp+var_7C]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_78]
		mov	al, [bp+var_7D]
		mov	[bx+22h], al
		mov	bx, [bp+var_78]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_78]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_74]
		mov	eax, [bx+6]
		mov	bx, [bp+var_78]
		mov	[bx+24h], eax
		mov	bx, [bp+var_78]
		mov	word ptr [bx+28h], 0Ch
		mov	bx, [bp+var_78]
		mov	word ptr [bx+0Eh], 2C65h
		mov	bx, [bp+var_78]
		mov	word ptr [bx+2Eh], 0Dh
		mov	bx, [bp+var_78]
		mov	ax, [bp+var_76]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_78]
		mov	word ptr [bx+2Ch], 8
		mov	bx, [bp+var_78]
		mov	word ptr [bx+0Eh], 2C99h
		mov	bx, [bp+var_78]
		mov	word ptr [bx+30h], 9
		mov	ax, [bp+var_78]
		jmp	short loc_12AE4
; ���������������������������������������������������������������������������

loc_12AE1:				; CODE XREF: sub_1220C+80Cj
		mov	ax, [bp+var_78]

loc_12AE4:				; CODE XREF: sub_1220C+8D3j
		mov	[bp+var_42], ax
		push	0
		push	5
		push	[bp+var_42]
		call	Widget_SetFlagBit4AndOffsets_FF96
		add	sp, 6
		push	0
		push	[bp+var_42]
		push	si
		call	sub_E1FF
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 0C3h ; '�'
		mov	[bp+var_80], ax
		mov	ax, si
		add	ax, 0CDh ; '�'
		mov	[bp+var_82], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_84], ax
		or	ax, ax
		jnz	short loc_12B2C
		jmp	loc_12C01
; ���������������������������������������������������������������������������

loc_12B2C:				; CODE XREF: sub_1220C+91Bj
		push	0Dh
		push	21h ; '!'
		push	0AAh ; '�'
		push	110h
		push	[bp+var_84]
		call	sub_FED6
		add	sp, 0Ah
		mov	bx, [bp+var_84]
		mov	word ptr [bx+0Eh], 7A8h
		mov	bx, [bp+var_84]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_84]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_84]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_84]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_80]
		mov	eax, [bx]
		mov	[bp+var_88], eax
		mov	bx, [bp+var_80]
		mov	al, [bx+4]
		mov	[bp+var_89], al
		mov	bx, [bp+var_84]
		mov	eax, [bp+var_88]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_84]
		mov	al, [bp+var_89]
		mov	[bx+22h], al
		mov	bx, [bp+var_84]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_84]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_80]
		mov	eax, [bx+6]
		mov	bx, [bp+var_84]
		mov	[bx+24h], eax
		mov	bx, [bp+var_84]
		mov	word ptr [bx+28h], 0Eh
		mov	bx, [bp+var_84]
		mov	word ptr [bx+0Eh], 7DCh
		mov	bx, [bp+var_84]
		mov	ax, [bp+var_82]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_84]
		mov	word ptr [bx+2Ch], 1
		mov	bx, [bp+var_84]
		mov	word ptr [bx+0Eh], 810h
		mov	bx, [bp+var_84]
		mov	word ptr [bx+2Eh], 0Fh
		mov	ax, [bp+var_84]
		jmp	short loc_12C05
; ���������������������������������������������������������������������������

loc_12C01:				; CODE XREF: sub_1220C+91Dj
		mov	ax, [bp+var_84]

loc_12C05:				; CODE XREF: sub_1220C+9F3j
		push	ax
		push	si
		call	sub_E1FF
		add	sp, 6
		mov	ax, si
		add	ax, 0C3h ; '�'
		mov	[bp+var_8C], ax
		mov	ax, [bp+var_40]
		mov	[bp+var_8E], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_90], ax
		or	ax, ax
		jnz	short loc_12C34
		jmp	loc_12D02
; ���������������������������������������������������������������������������

loc_12C34:				; CODE XREF: sub_1220C+A23j
		push	0Ah
		push	14h
		push	0A2h ; '�'
		push	7Dh ; '}'
		push	[bp+var_90]
		call	sub_FED6
		add	sp, 0Ah
		mov	bx, [bp+var_90]
		mov	word ptr [bx+0Eh], 7A8h
		mov	bx, [bp+var_90]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_90]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_90]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_90]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_8C]
		mov	eax, [bx]
		mov	[bp+var_94], eax
		mov	bx, [bp+var_8C]
		mov	al, [bx+4]
		mov	[bp+var_95], al
		mov	bx, [bp+var_90]
		mov	eax, [bp+var_94]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_90]
		mov	al, [bp+var_95]
		mov	[bx+22h], al
		mov	bx, [bp+var_90]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_90]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_8C]
		mov	eax, [bx+6]
		mov	bx, [bp+var_90]
		mov	[bx+24h], eax
		mov	bx, [bp+var_90]
		mov	word ptr [bx+28h], 2
		mov	bx, [bp+var_90]
		mov	word ptr [bx+0Eh], 2C65h
		mov	bx, [bp+var_90]
		mov	word ptr [bx+2Eh], 3
		mov	bx, [bp+var_90]
		mov	ax, [bp+var_8E]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_90]
		mov	word ptr [bx+2Ch], 0Ah
		mov	ax, [bp+var_90]
		jmp	short loc_12D06
; ���������������������������������������������������������������������������

loc_12D02:				; CODE XREF: sub_1220C+A25j
		mov	ax, [bp+var_90]

loc_12D06:				; CODE XREF: sub_1220C+AF4j
		mov	[bp+var_42], ax
		push	0
		push	5
		push	[bp+var_42]
		call	Widget_SetFlagBit4AndOffsets_FF96
		add	sp, 6
		push	0
		push	[bp+var_42]
		push	si
		call	sub_E1FF
		add	sp, 6
		mov	ax, si
		add	ax, 0C3h ; '�'
		mov	[bp+var_98], ax
		mov	ax, [bp+var_40]
		mov	[bp+var_9A], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_9C], ax
		or	ax, ax
		jnz	short loc_12D4B
		jmp	loc_12E19
; ���������������������������������������������������������������������������

loc_12D4B:				; CODE XREF: sub_1220C+B3Aj
		push	0Ah
		push	14h
		push	0B4h ; '�'
		push	7Eh ; '~'
		push	[bp+var_9C]
		call	sub_FED6
		add	sp, 0Ah
		mov	bx, [bp+var_9C]
		mov	word ptr [bx+0Eh], 7A8h
		mov	bx, [bp+var_9C]
		mov	dword ptr [bx+1Eh], 0
		mov	bx, [bp+var_9C]
		mov	byte ptr [bx+22h], 2
		mov	bx, [bp+var_9C]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_9C]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_98]
		mov	eax, [bx]
		mov	[bp+var_A0], eax
		mov	bx, [bp+var_98]
		mov	al, [bx+4]
		mov	[bp+var_A1], al
		mov	bx, [bp+var_9C]
		mov	eax, [bp+var_A0]
		mov	[bx+1Eh], eax
		mov	bx, [bp+var_9C]
		mov	al, [bp+var_A1]
		mov	[bx+22h], al
		mov	bx, [bp+var_9C]
		mov	byte ptr [bx+23h], 0
		mov	bx, [bp+var_9C]
		mov	dword ptr [bx+24h], 0
		mov	bx, [bp+var_98]
		mov	eax, [bx+6]
		mov	bx, [bp+var_9C]
		mov	[bx+24h], eax
		mov	bx, [bp+var_9C]
		mov	word ptr [bx+28h], 4
		mov	bx, [bp+var_9C]
		mov	word ptr [bx+0Eh], 2C65h
		mov	bx, [bp+var_9C]
		mov	word ptr [bx+2Eh], 5
		mov	bx, [bp+var_9C]
		mov	ax, [bp+var_9A]
		mov	[bx+2Ah], ax
		mov	bx, [bp+var_9C]
		mov	word ptr [bx+2Ch], 0Bh
		mov	ax, [bp+var_9C]
		jmp	short loc_12E1D
; ���������������������������������������������������������������������������

loc_12E19:				; CODE XREF: sub_1220C+B3Cj
		mov	ax, [bp+var_9C]

loc_12E1D:				; CODE XREF: sub_1220C+C0Bj
		mov	[bp+var_42], ax
		push	0
		push	5
		push	[bp+var_42]
		call	Widget_SetFlagBit4AndOffsets_FF96
		add	sp, 6
		push	0
		push	[bp+var_42]
		push	si
		call	sub_E1FF
		add	sp, 6
		push	0
		push	0
		mov	al, byte_492EA
		push	ax
		push	word ptr dword_492E6+2
		push	word ptr dword_492E6
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		push	0
		push	word_46F46
		call	Shape_DrawSpans_32CD8
		add	sp, 0Ch
		push	274h
		push	0Ah
		call	sub_3EC18
		add	sp, 4
		push	0C4h ; '�'
		push	9Ch ; '�'
		call	sub_3EC47
		add	sp, 4
		push	0B0h ; '�'
		push	9Fh ; '�'
		call	TextScrollDisplay_RegisterEntries_3EBDD
		add	sp, 4
		push	0B0h ; '�'
		push	9Fh ; '�'
		push	0
		push	0
		call	TextScrollDisplayB_ApplyHelperB_3F704
		add	sp, 8
		mov	ax, word_493A5
		mov	[bp+var_A4], ax
		mov	ax, [si+72h]
		add	ax, 12h
		mov	[bp+var_A6], ax
		mov	ax, [bp+var_A4]
		add	ax, 2Ch	; ','
		mov	[bp+var_A8], ax
		mov	ax, si
		add	ax, 0A3h ; '�'
		mov	[bp+var_AA], ax
		mov	bx, [bp+var_A8]
		mov	eax, [bx]
		mov	bx, [bp+var_AA]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_AE], eax
		mov	eax, [bp+var_AE]
		mov	[bp+var_B2], eax
		mov	bx, [bp+var_A8]
		mov	eax, [bx+4]
		mov	bx, [bp+var_AA]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_B6], eax
		mov	eax, [bp+var_B6]
		mov	[bp+var_BA], eax
		mov	bx, [bp+var_A8]
		mov	eax, [bx+8]
		mov	bx, [bp+var_AA]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_BE], eax
		mov	eax, [bp+var_BE]
		mov	[bp+var_C2], eax
		mov	eax, [bp+var_B2]
		mov	[bp+var_24E], eax
		mov	eax, [bp+var_BA]
		mov	[bp+var_24A], eax
		mov	eax, [bp+var_C2]
		mov	[bp+var_246], eax
		mov	bx, [bp+var_A6]
		mov	eax, [bx]
		sub	eax, [bp+var_24E]
		mov	[bp+var_25A], eax
		mov	bx, [bp+var_A6]
		mov	eax, [bx+4]
		sub	eax, [bp+var_24A]
		mov	[bp+var_256], eax
		mov	bx, [bp+var_A6]
		mov	eax, [bx+8]
		sub	eax, [bp+var_246]
		mov	[bp+var_252], eax
		mov	eax, [bp+var_25A]
		mov	[bp+var_266], eax
		mov	eax, [bp+var_256]
		mov	[bp+var_262], eax
		mov	eax, [bp+var_252]
		mov	[bp+var_25E], eax
		mov	bx, [bp+var_A4]
		mov	eax, [bp+var_266]
		mov	[bx+14h], eax
		mov	bx, [bp+var_A4]
		mov	eax, [bp+var_262]
		mov	[bx+18h], eax
		mov	bx, [bp+var_A4]
		mov	eax, [bp+var_25E]
		mov	[bx+1Ch], eax
		cmp	[bp+var_31], 0
		jz	short loc_12FF7
		cmp	[bp+var_36], 0
		jz	short loc_12FF7
		push	0
		mov	al, [bp+var_32]
		push	ax
		lea	ax, [bp+var_36]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_12FF7:				; CODE XREF: sub_1220C+DCBj
					; sub_1220C+DD2j
		mov	[bp+var_36], 0
		mov	[bp+var_31], 0
		mov	[bp+var_30], 0
		push	2
		lea	ax, [bp+var_242]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		mov	[bp+var_1BE], 56Eh
		lea	ax, [bp+var_1BE]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_1BE]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_1220C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_13040	proc far		; CODE XREF: seg026:1878p
					; sub_137FA+F9p

var_5E		= dword	ptr -5Eh
var_5A		= dword	ptr -5Ah
var_56		= dword	ptr -56h
var_52		= dword	ptr -52h
var_4E		= dword	ptr -4Eh
var_4A		= dword	ptr -4Ah
var_46		= dword	ptr -46h
var_42		= dword	ptr -42h
var_3E		= dword	ptr -3Eh
var_3A		= dword	ptr -3Ah
var_36		= dword	ptr -36h
var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_2A		= dword	ptr -2Ah
var_26		= dword	ptr -26h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= word ptr -10h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 5Eh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, word_493A5
		mov	ax, [si+0B3h]
		mov	[bp+var_6], ax
		movsx	eax, [bp+var_6]
		mov	edx, dword_4645E
		imul	edx, eax
		mov	[bp+var_A], edx
		mov	eax, [bp+var_A]
		mov	[bp+var_4], eax
		mov	ax, [si+0B5h]
		mov	[bp+var_10], ax
		movsx	eax, [bp+var_10]
		mov	edx, dword_4645E
		imul	edx, eax
		mov	[bp+var_14], edx
		mov	eax, [bp+var_14]
		mov	[bp+var_E], eax
		mov	eax, [bp+var_4]
		add	[si+0ABh], eax
		mov	eax, [bp+var_E]
		add	[si+0AFh], eax
		cmp	dword ptr [si+0ABh], 0
		jge	short loc_130B0
		mov	ax, 1
		jmp	short loc_130B2
; ���������������������������������������������������������������������������

loc_130B0:				; CODE XREF: sub_13040+69j
		xor	ax, ax

loc_130B2:				; CODE XREF: sub_13040+6Ej
		or	al, al
		jz	short loc_130C1
		add	dword ptr [si+0ABh], 16800h
		jmp	short loc_130E0
; ���������������������������������������������������������������������������

loc_130C1:				; CODE XREF: sub_13040+74j
		cmp	dword ptr [si+0ABh], 16800h
		jl	short loc_130D1
		mov	ax, 1
		jmp	short loc_130D3
; ���������������������������������������������������������������������������

loc_130D1:				; CODE XREF: sub_13040+8Aj
		xor	ax, ax

loc_130D3:				; CODE XREF: sub_13040+8Fj
		or	al, al
		jz	short loc_130E0
		sub	dword ptr [si+0ABh], 16800h

loc_130E0:				; CODE XREF: sub_13040+7Fj
					; sub_13040+95j
		cmp	dword ptr [si+0AFh], 0B400h
		jle	short loc_130F0
		mov	ax, 1
		jmp	short loc_130F2
; ���������������������������������������������������������������������������

loc_130F0:				; CODE XREF: sub_13040+A9j
		xor	ax, ax

loc_130F2:				; CODE XREF: sub_13040+AEj
		or	al, al
		jz	short loc_13101
		sub	dword ptr [si+0AFh], 16800h
		jmp	short loc_13120
; ���������������������������������������������������������������������������

loc_13101:				; CODE XREF: sub_13040+B4j
		cmp	dword ptr [si+0AFh], 0FFFF4C00h
		jg	short loc_13111
		mov	ax, 1
		jmp	short loc_13113
; ���������������������������������������������������������������������������

loc_13111:				; CODE XREF: sub_13040+CAj
		xor	ax, ax

loc_13113:				; CODE XREF: sub_13040+CFj
		or	al, al
		jz	short loc_13120
		add	dword ptr [si+0AFh], 16800h

loc_13120:				; CODE XREF: sub_13040+BFj
					; sub_13040+D5j
		test	byte ptr [si+8Eh], 1
		jz	short loc_13174
		cmp	dword ptr [si+0AFh], 0
		jle	short loc_13134
		mov	ax, 1
		jmp	short loc_13136
; ���������������������������������������������������������������������������

loc_13134:				; CODE XREF: sub_13040+EDj
		xor	ax, ax

loc_13136:				; CODE XREF: sub_13040+F2j
		or	al, al
		jz	short loc_13174
		cmp	dword ptr [si+0AFh], 5A00h
		jge	short loc_1314A
		mov	ax, 1
		jmp	short loc_1314C
; ���������������������������������������������������������������������������

loc_1314A:				; CODE XREF: sub_13040+103j
		xor	ax, ax

loc_1314C:				; CODE XREF: sub_13040+108j
		or	al, al
		jz	short loc_13163
		mov	[bp+var_18], 0
		mov	eax, [bp+var_18]
		mov	[si+0AFh], eax
		jmp	short loc_13174
; ���������������������������������������������������������������������������

loc_13163:				; CODE XREF: sub_13040+10Ej
		mov	[bp+var_1C], 0B400h
		mov	eax, [bp+var_1C]
		mov	[si+0AFh], eax

loc_13174:				; CODE XREF: sub_13040+E5j
					; sub_13040+F8j ...
		push	word ptr [si+72h]
		mov	bx, [si+72h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		add	sp, 2
		push	ax
		call	Matrix_BuildFromAngle_2574E
		add	sp, 2
		mov	ax, si
		add	ax, 0ABh ; '�'
		push	ax
		push	word ptr [si+72h]
		mov	bx, [si+72h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		add	sp, 2
		push	ax
		call	sub_23E83
		add	sp, 4
		mov	ax, si
		add	ax, 0ABh ; '�'
		push	ax
		push	word ptr [si+72h]
		mov	bx, [si+72h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		add	sp, 2
		add	ax, 0Ch
		push	ax
		call	sub_23E83
		add	sp, 4
		mov	ax, si
		add	ax, 0ABh ; '�'
		push	ax
		push	word ptr [si+72h]
		mov	bx, [si+72h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		add	sp, 2
		add	ax, 18h
		push	ax
		call	sub_23E83
		add	sp, 4
		push	word ptr [si+72h]
		mov	bx, [si+72h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		add	sp, 2
		push	ax
		call	sub_26101
		add	sp, 2
		mov	ax, si
		add	ax, 0AFh ; '�'
		push	ax
		push	word ptr [si+72h]
		mov	bx, [si+72h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		add	sp, 2
		push	ax
		call	sub_23CDD
		add	sp, 4
		mov	ax, si
		add	ax, 0AFh ; '�'
		push	ax
		push	word ptr [si+72h]
		mov	bx, [si+72h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		add	sp, 2
		add	ax, 0Ch
		push	ax
		call	sub_23CDD
		add	sp, 4
		mov	ax, si
		add	ax, 0AFh ; '�'
		push	ax
		push	word ptr [si+72h]
		mov	bx, [si+72h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		add	sp, 2
		add	ax, 18h
		push	ax
		call	sub_23CDD
		add	sp, 4
		push	word ptr [si+72h]
		mov	bx, [si+72h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		add	sp, 2
		push	ax
		call	sub_26101
		add	sp, 2
		mov	ax, [si+72h]
		add	ax, 12h
		mov	[bp+var_1E], ax
		mov	ax, di
		add	ax, 2Ch	; ','
		mov	[bp+var_20], ax
		mov	ax, si
		add	ax, 0A3h ; '�'
		mov	[bp+var_22], ax
		mov	bx, [bp+var_20]
		mov	eax, [bx]
		mov	bx, [bp+var_22]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_26], eax
		mov	eax, [bp+var_26]
		mov	[bp+var_2A], eax
		mov	bx, [bp+var_20]
		mov	eax, [bx+4]
		mov	bx, [bp+var_22]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_2E], eax
		mov	eax, [bp+var_2E]
		mov	[bp+var_32], eax
		mov	bx, [bp+var_20]
		mov	eax, [bx+8]
		mov	bx, [bp+var_22]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_36], eax
		mov	eax, [bp+var_36]
		mov	[bp+var_3A], eax
		mov	eax, [bp+var_2A]
		mov	[bp+var_46], eax
		mov	eax, [bp+var_32]
		mov	[bp+var_42], eax
		mov	eax, [bp+var_3A]
		mov	[bp+var_3E], eax
		mov	bx, [bp+var_1E]
		mov	eax, [bx]
		sub	eax, [bp+var_46]
		mov	[bp+var_52], eax
		mov	bx, [bp+var_1E]
		mov	eax, [bx+4]
		sub	eax, [bp+var_42]
		mov	[bp+var_4E], eax
		mov	bx, [bp+var_1E]
		mov	eax, [bx+8]
		sub	eax, [bp+var_3E]
		mov	[bp+var_4A], eax
		mov	eax, [bp+var_52]
		mov	[bp+var_5E], eax
		mov	eax, [bp+var_4E]
		mov	[bp+var_5A], eax
		mov	eax, [bp+var_4A]
		mov	[bp+var_56], eax
		mov	eax, [bp+var_5E]
		mov	[di+14h], eax
		mov	eax, [bp+var_5A]
		mov	[di+18h], eax
		mov	eax, [bp+var_56]
		mov	[di+1Ch], eax
		call	sub_22487
		call	sub_2278A
		pop	di
		pop	si
		leave
		retf
sub_13040	endp

; ���������������������������������������������������������������������������

loc_13370:				; DATA XREF: dseg:2D75o
		push	bp
		mov	bp, sp
		sub	sp, 7Eh
		push	si
		push	di
		mov	si, [bp+6]
		mov	bx, [bp+8]
		cmp	bx, 0Bh		; switch 12 cases
		jbe	short loc_13386
		jmp	loc_13721	; default
; ���������������������������������������������������������������������������

loc_13386:				; CODE XREF: seg026:1421j
		shl	bx, 1
		jmp	cs:off_137E2[bx] ; switch jump

loc_1338D:				; DATA XREF: seg026:off_137E2o
		cmp	word ptr [si+91h], 0 ; case 0x0
		jnz	short loc_13397
		jmp	loc_134F0
; ���������������������������������������������������������������������������

loc_13397:				; CODE XREF: seg026:1432j
		push	word ptr [si+72h]
		push	6369h
		call	sub_2039A
		add	sp, 4
		inc	word ptr [si+8Fh]
		mov	ax, [si+8Fh]
		cmp	ax, [si+91h]
		jl	short loc_133B9
		mov	word ptr [si+8Fh], 0

loc_133B9:				; CODE XREF: seg026:1451j
		push	si
		push	cs
		call	near ptr sub_12148
		add	sp, 2
		mov	ax, si
		add	ax, 74h	; 't'
		mov	word ptr [bp-2], ds
		mov	[bp-4],	ax
		push	1
		push	1
		push	word ptr [bp-2]
		push	word ptr [bp-4]
		push	6350h
		call	sub_21BA2
		add	sp, 0Ah
		mov	[si+72h], ax
		mov	dword ptr [bp-8], 0
		mov	eax, [bp-8]
		mov	[bp-72h], eax
		mov	dword ptr [bp-0Ch], 0
		mov	eax, [bp-0Ch]
		mov	[bp-6Eh], eax
		mov	dword ptr [bp-10h], 0
		mov	eax, [bp-10h]
		mov	[bp-6Ah], eax
		mov	bx, [si+72h]
		mov	eax, [bp-72h]
		mov	[bx+12h], eax
		mov	bx, [si+72h]
		mov	eax, [bp-6Eh]
		mov	[bx+16h], eax
		mov	bx, [si+72h]
		mov	eax, [bp-6Ah]
		mov	[bx+1Ah], eax
		mov	ax, [si+72h]
		add	ax, 12h
		push	word ptr [si+72h]
		mov	bx, [si+72h]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 2
		mov	bx, [si+72h]
		mov	eax, [bx+20h]
		mov	[si+9Bh], eax
		mov	dword ptr [bp-14h], 180h
		mov	eax, [si+9Bh]
		mov	edx, [bp-14h]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+9Bh], eax
		mov	eax, [si+9Bh]
		shl	eax, 4
		mov	[bp-18h], eax
		mov	eax, [bp-18h]
		mov	[bp-1Ch], eax
		mov	eax, [bp-1Ch]
		mov	[si+9Fh], eax
		push	word ptr [si+72h]
		push	6369h
		call	sub_1FEED
		add	sp, 4
		push	si
		push	cs
		call	near ptr sub_121F6
		add	sp, 2
		mov	ax, [si+0A7h]
		mov	[si+0A9h], ax
		mov	ax, [si+0A7h]
		mov	[bp-1Eh], ax
		mov	ax, si
		add	ax, 97h	; '�'
		mov	di, ax
		movsx	eax, word ptr [bp-1Eh]
		mov	edx, [di]
		imul	edx, eax
		mov	[bp-22h], edx
		mov	eax, [bp-22h]
		mov	[bp-26h], eax
		mov	eax, [bp-26h]
		mov	[si+0A3h], eax
		mov	ax, si
		add	ax, 7Dh	; '}'
		push	ax
		push	word ptr [si+0CFh]
		call	sub_1119E
		add	sp, 4

loc_134F0:				; CODE XREF: seg026:1434j
		jmp	loc_13723
; ���������������������������������������������������������������������������

loc_134F3:				; CODE XREF: seg026:1428j
					; DATA XREF: seg026:off_137E2o
		cmp	word ptr [si+91h], 0 ; case 0x1
		jnz	short loc_134FD
		jmp	loc_1365A
; ���������������������������������������������������������������������������

loc_134FD:				; CODE XREF: seg026:1598j
		push	word ptr [si+72h]
		push	6369h
		call	sub_2039A
		add	sp, 4
		dec	word ptr [si+8Fh]
		cmp	word ptr [si+8Fh], 0
		jge	short loc_1351F
		mov	ax, [si+91h]
		dec	ax
		mov	[si+8Fh], ax

loc_1351F:				; CODE XREF: seg026:15B4j
		push	si
		push	cs
		call	near ptr sub_12148
		add	sp, 2
		mov	ax, si
		add	ax, 74h	; 't'
		mov	word ptr [bp-28h], ds
		mov	[bp-2Ah], ax
		push	1
		push	1
		push	word ptr [bp-28h]
		push	word ptr [bp-2Ah]
		push	6350h
		call	sub_21BA2
		add	sp, 0Ah
		mov	[si+72h], ax
		mov	dword ptr [bp-2Eh], 0
		mov	eax, [bp-2Eh]
		mov	[bp-7Eh], eax
		mov	dword ptr [bp-32h], 0
		mov	eax, [bp-32h]
		mov	[bp-7Ah], eax
		mov	dword ptr [bp-36h], 0
		mov	eax, [bp-36h]
		mov	[bp-76h], eax
		mov	bx, [si+72h]
		mov	eax, [bp-7Eh]
		mov	[bx+12h], eax
		mov	bx, [si+72h]
		mov	eax, [bp-7Ah]
		mov	[bx+16h], eax
		mov	bx, [si+72h]
		mov	eax, [bp-76h]
		mov	[bx+1Ah], eax
		mov	ax, [si+72h]
		add	ax, 12h
		push	word ptr [si+72h]
		mov	bx, [si+72h]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 2
		mov	bx, [si+72h]
		mov	eax, [bx+20h]
		mov	[si+9Bh], eax
		mov	dword ptr [bp-3Ah], 180h
		mov	eax, [si+9Bh]
		mov	edx, [bp-3Ah]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+9Bh], eax
		mov	eax, [si+9Bh]
		shl	eax, 4
		mov	[bp-3Eh], eax
		mov	eax, [bp-3Eh]
		mov	[bp-42h], eax
		mov	eax, [bp-42h]
		mov	[si+9Fh], eax
		push	word ptr [si+72h]
		push	6369h
		call	sub_1FEED
		add	sp, 4
		push	si
		push	cs
		call	near ptr sub_121F6
		add	sp, 2
		mov	ax, [si+0A7h]
		mov	[si+0A9h], ax
		mov	ax, [si+0A7h]
		mov	[bp-44h], ax
		mov	ax, si
		add	ax, 97h	; '�'
		mov	[bp-46h], ax
		movsx	eax, word ptr [bp-44h]
		mov	bx, [bp-46h]
		mov	edx, [bx]
		imul	edx, eax
		mov	[bp-4Ah], edx
		mov	eax, [bp-4Ah]
		mov	[bp-4Eh], eax
		mov	eax, [bp-4Eh]
		mov	[si+0A3h], eax
		mov	ax, si
		add	ax, 7Dh	; '}'
		push	ax
		push	word ptr [si+0CFh]
		call	sub_1119E
		add	sp, 4

loc_1365A:				; CODE XREF: seg026:159Aj
		jmp	loc_13723
; ���������������������������������������������������������������������������

loc_1365D:				; CODE XREF: seg026:1428j
					; DATA XREF: seg026:off_137E2o
		cmp	word ptr [si+0B5h], 0 ;	case 0x2
		jz	short loc_1366C
		mov	word ptr [si+0B5h], 0
		jmp	short loc_13675
; ���������������������������������������������������������������������������

loc_1366C:				; CODE XREF: seg026:1702j
		sub	dword ptr [si+0AFh], 0A00h

loc_13675:				; CODE XREF: seg026:170Aj
		jmp	loc_13723
; ���������������������������������������������������������������������������

loc_13678:				; CODE XREF: seg026:1428j
					; DATA XREF: seg026:off_137E2o
		mov	al, [si+8Eh]	; case 0x3
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		test	ax, 1
		jz	short loc_1368E
		mov	word ptr [si+0B5h], 0FFC4h

loc_1368E:				; CODE XREF: seg026:1726j
		jmp	loc_13723
; ���������������������������������������������������������������������������

loc_13691:				; CODE XREF: seg026:1428j
					; DATA XREF: seg026:off_137E2o
		cmp	word ptr [si+0B5h], 0 ;	case 0x4
		jz	short loc_136A0
		mov	word ptr [si+0B5h], 0
		jmp	short loc_136A9
; ���������������������������������������������������������������������������

loc_136A0:				; CODE XREF: seg026:1736j
		add	dword ptr [si+0AFh], 0A00h

loc_136A9:				; CODE XREF: seg026:173Ej
		jmp	short loc_13723
; ���������������������������������������������������������������������������

loc_136AB:				; CODE XREF: seg026:1428j
					; DATA XREF: seg026:off_137E2o
		mov	al, [si+8Eh]	; case 0x5
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		test	ax, 1
		jz	short loc_136C1
		mov	word ptr [si+0B5h], 3Ch	; '<'

loc_136C1:				; CODE XREF: seg026:1759j
		jmp	short loc_13723
; ���������������������������������������������������������������������������

loc_136C3:				; CODE XREF: seg026:1428j
					; DATA XREF: seg026:off_137E2o
		cmp	word ptr [si+0B3h], 0 ;	case 0x6
		jz	short loc_136D2
		mov	word ptr [si+0B3h], 0
		jmp	short loc_136DB
; ���������������������������������������������������������������������������

loc_136D2:				; CODE XREF: seg026:1768j
		sub	dword ptr [si+0ABh], 0A00h

loc_136DB:				; CODE XREF: seg026:1770j
		jmp	short loc_13723
; ���������������������������������������������������������������������������

loc_136DD:				; CODE XREF: seg026:1428j
					; DATA XREF: seg026:off_137E2o
		mov	word ptr [si+0B3h], 0FFC4h ; case 0x7
		jmp	short loc_13723
; ���������������������������������������������������������������������������

loc_136E5:				; CODE XREF: seg026:1428j
					; DATA XREF: seg026:off_137E2o
		cmp	word ptr [si+0B3h], 0 ;	case 0x8
		jz	short loc_136F4
		mov	word ptr [si+0B3h], 0
		jmp	short loc_136FD
; ���������������������������������������������������������������������������

loc_136F4:				; CODE XREF: seg026:178Aj
		add	dword ptr [si+0ABh], 0A00h

loc_136FD:				; CODE XREF: seg026:1792j
		jmp	short loc_13723
; ���������������������������������������������������������������������������

loc_136FF:				; CODE XREF: seg026:1428j
					; DATA XREF: seg026:off_137E2o
		mov	word ptr [si+0B3h], 3Ch	; '<' ; case 0x9
		jmp	short loc_13723
; ���������������������������������������������������������������������������

loc_13707:				; CODE XREF: seg026:1428j
					; DATA XREF: seg026:off_137E2o
		cmp	word ptr [si+0A7h], 64h	; 'd' ; case 0xA
		jge	short loc_13712
		inc	word ptr [si+0A7h]

loc_13712:				; CODE XREF: seg026:17ACj
		jmp	short loc_13723
; ���������������������������������������������������������������������������

loc_13714:				; CODE XREF: seg026:1428j
					; DATA XREF: seg026:off_137E2o
		cmp	word ptr [si+0A7h], 0 ;	case 0xB
		jle	short loc_1371F
		dec	word ptr [si+0A7h]

loc_1371F:				; CODE XREF: seg026:17B9j
		jmp	short loc_13723
; ���������������������������������������������������������������������������

loc_13721:				; CODE XREF: seg026:1423j
		jmp	short $+2	; default

loc_13723:				; CODE XREF: seg026:loc_134F0j
					; seg026:loc_1365Aj ...
		mov	ax, [si+0A7h]
		cmp	ax, [si+0A9h]
		jnz	short loc_13730
		jmp	loc_137D6
; ���������������������������������������������������������������������������

loc_13730:				; CODE XREF: seg026:17CBj
		mov	ax, [si+0A7h]
		mov	[bp-50h], ax
		mov	ax, si
		add	ax, 97h	; '�'
		mov	[bp-52h], ax
		movsx	eax, word ptr [bp-50h]
		mov	bx, [bp-52h]
		mov	edx, [bx]
		imul	edx, eax
		mov	[bp-56h], edx
		mov	eax, [bp-56h]
		mov	[bp-5Ah], eax
		mov	eax, [bp-5Ah]
		mov	[si+0A3h], eax
		mov	eax, [si+0A3h]
		cmp	eax, [si+9Fh]
		jle	short loc_13774
		mov	ax, 1
		jmp	short loc_13776
; ���������������������������������������������������������������������������

loc_13774:				; CODE XREF: seg026:180Dj
		xor	ax, ax

loc_13776:				; CODE XREF: seg026:1812j
		or	al, al
		jnz	short loc_13791
		mov	eax, [si+0A3h]
		cmp	eax, [si+9Bh]
		jge	short loc_1378B
		mov	ax, 1
		jmp	short loc_1378D
; ���������������������������������������������������������������������������

loc_1378B:				; CODE XREF: seg026:1824j
		xor	ax, ax

loc_1378D:				; CODE XREF: seg026:1829j
		or	al, al
		jz	short loc_137CE

loc_13791:				; CODE XREF: seg026:1818j
		mov	ax, [si+0A9h]
		mov	[si+0A7h], ax
		mov	ax, [si+0A7h]
		mov	[bp-5Ch], ax
		mov	ax, si
		add	ax, 97h	; '�'
		mov	[bp-5Eh], ax
		movsx	eax, word ptr [bp-5Ch]
		mov	bx, [bp-5Eh]
		mov	edx, [bx]
		imul	edx, eax
		mov	[bp-62h], edx
		mov	eax, [bp-62h]
		mov	[bp-66h], eax
		mov	eax, [bp-66h]
		mov	[si+0A3h], eax
		jmp	short loc_137D6
; ���������������������������������������������������������������������������

loc_137CE:				; CODE XREF: seg026:182Fj
		mov	ax, [si+0A7h]
		mov	[si+0A9h], ax

loc_137D6:				; CODE XREF: seg026:17CDj seg026:186Cj
		push	si
		push	cs
		call	near ptr sub_13040
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
off_137E2	dw offset loc_1338D	; DATA XREF: seg026:1428r
		dw offset loc_134F3	; jump table for switch	statement
		dw offset loc_1365D
		dw offset loc_13678
		dw offset loc_13691
		dw offset loc_136AB
		dw offset loc_136C3
		dw offset loc_136DD
		dw offset loc_136E5
		dw offset loc_136FF
		dw offset loc_13707
		dw offset loc_13714

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_137FA	proc far		; CODE XREF: Gameflow_MainLoop_3D2E+247P

var_124		= word ptr -124h
var_120		= word ptr -120h
var_11E		= word ptr -11Eh
var_116		= word ptr -116h
var_BE		= word ptr -0BEh
var_BC		= word ptr -0BCh
var_BA		= word ptr -0BAh
var_B8		= word ptr -0B8h
var_B6		= word ptr -0B6h
var_B4		= word ptr -0B4h
var_57		= byte ptr -57h
var_52		= word ptr -52h
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 124h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	byte_49084, 0
		mov	byte_49085, 0
		mov	[bp+var_1], 0
		mov	al, byte_46848
		mov	ah, 0
		cmp	ax, 1
		jz	short loc_13825
		cmp	ax, 2
		jz	short loc_13843
		jmp	short loc_13861
; ���������������������������������������������������������������������������

loc_13825:				; CODE XREF: sub_137FA+22j
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aRmusic	; "rmusic"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_52]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		mov	[bp+var_1], 1
		jmp	short loc_13861
; ���������������������������������������������������������������������������

loc_13843:				; CODE XREF: sub_137FA+27j
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aAmusic	; "amusic"
		push	ds
		push	offset a____DataMidgam ; "..\\..\\data\\midgames\\"
		lea	ax, [bp+var_52]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		mov	[bp+var_1], 1
		jmp	short $+2

loc_13861:				; CODE XREF: sub_137FA+29j
					; sub_137FA+47j
		cmp	[bp+var_1], 0
		jz	short loc_13875
		push	19h
		lea	ax, [bp+var_52]
		push	ax
		call	Speech_LoadBank_28D24
		add	sp, 4

loc_13875:				; CODE XREF: sub_137FA+6Bj
		push	0C7h ; '�'
		push	13Fh
		push	0
		push	0
		lea	ax, [bp+var_124]
		push	ax
		push	cs
		call	near ptr sub_11F61
		add	sp, 0Ah
		mov	[bp+var_B6], 0
		mov	[bp+var_B4], 1
		lea	ax, [bp+var_124]
		push	ax
		call	sub_DF9F
		add	sp, 2
		jmp	short loc_138F9
; ���������������������������������������������������������������������������

loc_138A6:				; CODE XREF: sub_137FA+106j
		push	0
		push	1
		lea	ax, [bp+var_124]
		push	ax
		call	sub_E328
		add	sp, 6
		mov	di, ax
		or	di, di
		jz	short loc_138ED
		cmp	[bp+var_BA], 0
		jz	short loc_138ED
		push	[bp+var_B8]
		push	[bp+var_BA]
		mov	ax, [bp+var_BC]
		sub	ax, [bp+var_11E]
		push	ax
		mov	ax, [bp+var_BE]
		sub	ax, [bp+var_120]
		push	ax
		lea	ax, [bp+var_124]
		push	ax
		mov	bx, [bp+var_116]
		call	dword ptr [bx+28h]
		add	sp, 0Ah

loc_138ED:				; CODE XREF: sub_137FA+C1j
					; sub_137FA+C8j
		lea	ax, [bp+var_124]
		push	ax
		push	cs
		call	near ptr sub_13040
		add	sp, 2

loc_138F9:				; CODE XREF: sub_137FA+AAj
		mov	al, [bp+var_57]
		mov	ah, 0
		or	ax, ax
		jz	short loc_138A6
		lea	ax, [bp+var_124]
		push	ax
		call	sub_DFCA
		add	sp, 2
		call	sub_28D49
		call	TextScrollDisplayB_ApplyHelperD_3F784
		push	2
		lea	ax, [bp+var_124]
		push	ax
		push	cs
		call	near ptr sub_11FFE
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_137FA	endp

; ���������������������������������������������������������������������������

loc_1392B:				; DATA XREF: dseg:2C95o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_13990
		cmp	byte ptr [si+23h], 0
		jz	short loc_13960
		cmp	dword ptr [si+1Eh], 0
		jz	short loc_13960
		push	0
		mov	al, [si+22h]
		push	ax
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_13960:				; CODE XREF: seg026:19DEj seg026:19E5j
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		push	si
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		test	di, 1
		jz	short loc_1398E
		push	si
		call	sub_308
		add	sp, 2
		jmp	short $+2

loc_1398E:				; CODE XREF: seg026:1A21j
		jmp	short $+2

loc_13990:				; CODE XREF: seg026:19D8j
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_13998:				; DATA XREF: dseg:2CC9o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_139FD
		cmp	byte ptr [si+23h], 0
		jz	short loc_139CD
		cmp	dword ptr [si+1Eh], 0
		jz	short loc_139CD
		push	0
		mov	al, [si+22h]
		push	ax
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_139CD:				; CODE XREF: seg026:1A4Bj seg026:1A52j
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		push	si
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		test	di, 1
		jz	short loc_139FB
		push	si
		call	sub_308
		add	sp, 2
		jmp	short $+2

loc_139FB:				; CODE XREF: seg026:1A8Ej
		jmp	short $+2

loc_139FD:				; CODE XREF: seg026:1A45j
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_13A05:				; DATA XREF: dseg:2CFDo
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_13A7B
		mov	word ptr [si+0Eh], 2CCDh
		push	word ptr [si+2Eh]
		call	sub_308
		add	sp, 2
		mov	word ptr [si+2Eh], 0
		cmp	byte ptr [si+23h], 0
		jz	short loc_13A4F
		cmp	dword ptr [si+1Eh], 0
		jz	short loc_13A4F
		push	0
		mov	al, [si+22h]
		push	ax
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_13A4F:				; CODE XREF: seg026:1ACDj seg026:1AD4j
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		push	si
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		test	di, 1
		jz	short loc_13A7B
		push	si
		call	sub_308
		add	sp, 2

loc_13A7B:				; CODE XREF: seg026:1AB2j seg026:1B10j
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_13A7F:				; DATA XREF: dseg:2D31o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_13AF9
		mov	word ptr [si+0Eh], 2CCDh
		push	word ptr [si+2Eh]
		call	sub_308
		add	sp, 2
		mov	word ptr [si+2Eh], 0
		cmp	byte ptr [si+23h], 0
		jz	short loc_13AC9
		cmp	dword ptr [si+1Eh], 0
		jz	short loc_13AC9
		push	0
		mov	al, [si+22h]
		push	ax
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_13AC9:				; CODE XREF: seg026:1B47j seg026:1B4Ej
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		push	si
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		test	di, 1
		jz	short loc_13AF7
		push	si
		call	sub_308
		add	sp, 2
		jmp	short $+2

loc_13AF7:				; CODE XREF: seg026:1B8Aj
		jmp	short $+2

loc_13AF9:				; CODE XREF: seg026:1B2Cj
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_13B01:				; DATA XREF: dseg:2D65o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_13B7B
		mov	word ptr [si+0Eh], 2CCDh
		push	word ptr [si+2Eh]
		call	sub_308
		add	sp, 2
		mov	word ptr [si+2Eh], 0
		cmp	byte ptr [si+23h], 0
		jz	short loc_13B4B
		cmp	dword ptr [si+1Eh], 0
		jz	short loc_13B4B
		push	0
		mov	al, [si+22h]
		push	ax
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_13B4B:				; CODE XREF: seg026:1BC9j seg026:1BD0j
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		push	si
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		test	di, 1
		jz	short loc_13B79
		push	si
		call	sub_308
		add	sp, 2
		jmp	short $+2

loc_13B79:				; CODE XREF: seg026:1C0Cj
		jmp	short $+2

loc_13B7B:				; CODE XREF: seg026:1BAEj
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf
seg026		ends

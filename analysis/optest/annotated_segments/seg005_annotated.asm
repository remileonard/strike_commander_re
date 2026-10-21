seg005		segment	byte public 'CODE' use16
		assume cs:seg005
		;org 0Bh
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_563B	proc far		; CODE XREF: sub_3B0B+F1P
					; sub_51AB3+332P ...

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp

loc_563C:				; DATA XREF: seg170:00E6o
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, [si+0FCh]
		mov	ah, 0
		mov	dl, [bp+arg_2]
		mov	bx, ax
		mov	[bx+si+0E8h], dl
		inc	byte ptr [si+0FCh]
		pop	si
		pop	bp
		retf
sub_563B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_5658	proc far		; CODE XREF: sub_523F3+D2P

var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+0FCh], 0
		jz	short loc_56B3
		mov	[bp+var_1], 0
		xor	cx, cx
		jmp	short loc_5683
; ���������������������������������������������������������������������������

loc_5671:				; CODE XREF: sub_5658+33j
		mov	bx, cx
		mov	al, [bx+si+0E8h]
		cmp	al, [bp+arg_2]
		jnz	short loc_5682
		mov	[bp+var_1], 1
		jmp	short loc_568D
; ���������������������������������������������������������������������������

loc_5682:				; CODE XREF: sub_5658+22j
		inc	cx

loc_5683:				; CODE XREF: sub_5658+17j
		mov	al, [si+0FCh]
		mov	ah, 0
		cmp	ax, cx
		jg	short loc_5671

loc_568D:				; CODE XREF: sub_5658+28j
		cmp	[bp+var_1], 0
		jz	short loc_56B3
		mov	dx, cx
		jmp	short loc_56A4
; ���������������������������������������������������������������������������

loc_5697:				; CODE XREF: sub_5658+55j
		mov	bx, dx
		mov	al, [bx+si+0E9h]
		mov	bx, dx
		mov	[bx+si+0E8h], al
		inc	dx

loc_56A4:				; CODE XREF: sub_5658+3Dj
		mov	al, [si+0FCh]
		mov	ah, 0
		dec	ax
		cmp	ax, dx
		jg	short loc_5697
		dec	byte ptr [si+0FCh]

loc_56B3:				; CODE XREF: sub_5658+Fj sub_5658+39j
		pop	si
		leave
		retf
sub_5658	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_56B6	proc far		; CODE XREF: sub_51AB3+323P
					; sub_52662+DD5P ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+0FCh], 0
		pop	si
		pop	bp
		retf
sub_56B6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_56C5	proc far		; CODE XREF: sub_51AB3+35AP
					; sub_51AB3+463P

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, [si+107h]
		mov	ah, 0
		mov	dl, [bp+arg_2]
		mov	bx, ax
		mov	[bx+si+0FDh], dl
		inc	byte ptr [si+107h]
		pop	si
		pop	bp
		retf
sub_56C5	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+6]
		cmp	byte ptr [si+107h], 0
		jz	short loc_573D
		mov	byte ptr [bp-1], 0
		xor	cx, cx
		jmp	short loc_570D
; ���������������������������������������������������������������������������

loc_56FB:				; CODE XREF: seg005:00E5j
		mov	bx, cx
		mov	al, [bx+si+0FDh]
		cmp	al, [bp+8]
		jnz	short loc_570C
		mov	byte ptr [bp-1], 1
		jmp	short loc_5717
; ���������������������������������������������������������������������������

loc_570C:				; CODE XREF: seg005:00D4j
		inc	cx

loc_570D:				; CODE XREF: seg005:00C9j
		mov	al, [si+107h]
		mov	ah, 0
		cmp	ax, cx
		jg	short loc_56FB

loc_5717:				; CODE XREF: seg005:00DAj
		cmp	byte ptr [bp-1], 0
		jz	short loc_573D
		mov	dx, cx
		jmp	short loc_572E
; ���������������������������������������������������������������������������

loc_5721:				; CODE XREF: seg005:0107j
		mov	bx, dx
		mov	al, [bx+si+0FEh]
		mov	bx, dx
		mov	[bx+si+0FDh], al
		inc	dx

loc_572E:				; CODE XREF: seg005:00EFj
		mov	al, [si+107h]
		mov	ah, 0
		dec	ax
		cmp	ax, dx
		jg	short loc_5721
		dec	byte ptr [si+107h]

loc_573D:				; CODE XREF: seg005:00C1j seg005:00EBj
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	byte ptr [si+107h], 0
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_574F	proc far		; CODE XREF: sub_51AB3+2F2P

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_577C
; ���������������������������������������������������������������������������

loc_5760:				; CODE XREF: sub_574F+41j
		mov	bx, [bp+var_2]
		mov	al, [bx+6]
		cmp	al, [bp+arg_2]
		jnz	short loc_577C
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		add	sp, 2
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_577C:				; CODE XREF: sub_574F+Fj sub_574F+1Aj
		lea	ax, [bp+var_2]
		push	ax
		mov	ax, si
		add	ax, 0E1h ; '�'
		push	ax
		call	sub_2FF1E
		add	sp, 4
		or	ax, ax
		jnz	short loc_5760
		xor	ax, ax
		pop	si
		leave
		retf
sub_574F	endp

; ���������������������������������������������������������������������������
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_579A	proc far		; CODE XREF: sub_51AB3+3E1P
					; sub_51AB3+4FCP ...

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		mov	[bp+var_2], 0
		jmp	short loc_57E9
; ���������������������������������������������������������������������������

loc_57AF:				; CODE XREF: sub_579A+63j
		mov	bx, [bp+var_2]
		mov	al, [bx+6]
		cmp	al, [bp+arg_2]
		jnz	short loc_57E9
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		add	sp, 2
		push	ax
		call	Heap_FreeAndCoalesce_2C3FC
		add	sp, 2
		push	di
		call	CRT_Strdup
		add	sp, 2
		push	ax
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 4

loc_57E9:				; CODE XREF: sub_579A+13j sub_579A+1Ej
		lea	ax, [bp+var_2]
		push	ax
		mov	ax, si
		add	ax, 0E1h ; '�'
		push	ax
		call	sub_2FF1E
		add	sp, 4
		or	ax, ax
		jnz	short loc_57AF
		pop	di
		pop	si
		leave
		retf
sub_579A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_5803	proc far		; CODE XREF: sub_3B0B+10FP
					; sub_51AB3+2BBP ...

var_290		= word ptr -290h
var_190		= word ptr -190h
var_118		= word ptr -118h
var_A0		= word ptr -0A0h
var_50		= word ptr -50h
var_4E		= word ptr -4Eh
var_4C		= word ptr -4Ch
var_4A		= word ptr -4Ah
var_48		= word ptr -48h
var_46		= word ptr -46h
var_44		= word ptr -44h
var_42		= word ptr -42h
var_40		= word ptr -40h
var_3E		= word ptr -3Eh
var_3C		= word ptr -3Ch
var_3A		= word ptr -3Ah
var_38		= word ptr -38h
var_36		= word ptr -36h
var_34		= word ptr -34h
var_32		= word ptr -32h
var_30		= dword	ptr -30h
var_2C		= byte ptr -2Ch
var_2B		= byte ptr -2Bh
var_2A		= dword	ptr -2Ah
var_26		= word ptr -26h
var_24		= dword	ptr -24h
var_20		= byte ptr -20h
var_1F		= byte ptr -1Fh
var_1E		= dword	ptr -1Eh
var_1A		= byte ptr -1Ah
var_19		= byte ptr -19h
var_18		= word ptr -18h
var_16		= byte ptr -16h
var_15		= word ptr -15h
var_12		= word ptr -12h
var_10		= byte ptr -10h
var_F		= word ptr -0Fh
var_C		= dword	ptr -0Ch
var_8		= byte ptr -8
var_7		= byte ptr -7
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 290h
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	ds
		push	offset a_iff	; ".iff"
		push	ds
		push	offset aOptions	; "options"
		push	ds
		push	offset a____DataGamefl ; "..\\..\\data\\gameflow\\"
		lea	ax, [bp+var_A0]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_A0]
		push	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	si
		call	sub_3C491
		add	sp, 2
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aOptshps_0 ; "optshps"
		push	ds
		push	offset a____DataGamefl ; "..\\..\\data\\gameflow\\"
		lea	ax, [bp+var_A0]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_A0]
		push	ax
		lea	ax, [bp+var_118]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aOptpals_0 ; "optpals"
		push	ds
		push	offset a____DataGamefl ; "..\\..\\data\\gameflow\\"
		lea	ax, [bp+var_A0]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_A0]
		push	ax
		lea	ax, [bp+var_190]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		jmp	short loc_58E9
; ���������������������������������������������������������������������������

loc_589D:				; CODE XREF: sub_5803+107j
		push	si
		call	sub_3C491
		add	sp, 2
		push	0
		push	large 4F464E49h
		push	si
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		push	si
		call	ResourceRecord_ReadFinalField_3C3C1
		add	sp, 2
		mov	[bp+var_1A], al
		mov	al, [si+0E7h]
		cmp	al, [bp+var_1A]
		jnz	short loc_58D8
		mov	eax, [si+76h]
		mov	[si+65h], eax
		jmp	short loc_590C
; ���������������������������������������������������������������������������
		jmp	short loc_58E9
; ���������������������������������������������������������������������������

loc_58D8:				; CODE XREF: sub_5803+C7j
		mov	eax, [si+76h]
		mov	[si+65h], eax
		push	si
		call	ResourceRecord_ReleaseAndClear_3C595
		add	sp, 2

loc_58E9:				; CODE XREF: sub_5803+98j sub_5803+D3j
		push	si
		call	ResourceRecord_ComputeRecordBounds_3BF4B
		add	sp, 2
		or	ax, ax
		jz	short loc_590C
		mov	eax, [si+6Dh]
		cmp	eax, dword_44349
		jnz	short loc_5906
		mov	ax, 1
		jmp	short loc_5908
; ���������������������������������������������������������������������������

loc_5906:				; CODE XREF: sub_5803+FCj
		xor	ax, ax

loc_5908:				; CODE XREF: sub_5803+101j
		or	ax, ax
		jnz	short loc_589D

loc_590C:				; CODE XREF: sub_5803+D1j sub_5803+F1j
		push	0
		push	large 524C4F43h
		push	si
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jz	short loc_5938
		push	si
		call	ResourceRecord_ReadFinalField_3C3C1
		add	sp, 2
		mov	[si+0D7h], al
		mov	eax, [si+76h]
		mov	[si+65h], eax
		jmp	short loc_5946
; ���������������������������������������������������������������������������

loc_5938:				; CODE XREF: sub_5803+11Cj
		push	0
		push	1310h
		push	si
		call	DisplayContext_CommitFrame_2FCD5
		add	sp, 6

loc_5946:				; CODE XREF: sub_5803+133j
		push	0
		push	large 454E5554h
		push	si
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jz	short loc_5970
		push	si
		call	ResourceRecord_ReadFinalField_3C3C1
		add	sp, 2
		mov	[si+115h], al
		mov	eax, [si+76h]
		mov	[si+65h], eax

loc_5970:				; CODE XREF: sub_5803+156j
		push	0
		push	large 50435345h
		push	si
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jz	short loc_599A
		push	si
		call	ResourceRecord_ReadFinalField_3C3C1
		add	sp, 2
		mov	[si+0DAh], al
		mov	eax, [si+76h]
		mov	[si+65h], eax

loc_599A:				; CODE XREF: sub_5803+180j
		push	0
		push	large 4B434142h
		push	si
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		push	0
		push	large 544C4150h
		push	si
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		push	si
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	[bp+var_2], ax
		mov	eax, [si+76h]
		mov	[si+65h], eax
		mov	[bp+var_C], 0
		mov	[bp+var_8], 2
		mov	[bp+var_7], 0
		mov	[bp+var_6], 0
		push	2
		lea	ax, [bp+var_C]
		push	ax
		push	[bp+var_2]
		lea	ax, [bp+var_190]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		mov	[bp+var_12], 0
		mov	[bp+var_F], 0
		lea	ax, [bp+var_C]
		push	ax
		lea	ax, [bp+var_12]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		jmp	loc_5AE8
; ���������������������������������������������������������������������������

loc_5A1B:				; CODE XREF: sub_5803+2FAj
		push	si
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	[bp+var_2], ax
		mov	[bp+var_24], 0
		mov	[bp+var_20], 2
		mov	[bp+var_1F], 0
		mov	[bp+var_1E], 0
		push	3
		lea	ax, [bp+var_24]
		push	ax
		push	[bp+var_2]
		lea	ax, [bp+var_118]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	1Eh
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jz	short loc_5A87
		push	0
		push	0
		lea	ax, [bp+var_24]
		push	ax
		push	di
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [di], 135Eh
		mov	word ptr [di+0Ah], 137Eh
		mov	byte ptr [di+1Dh], 0
		mov	ax, di
		jmp	short loc_5A89
; ���������������������������������������������������������������������������

loc_5A87:				; CODE XREF: sub_5803+260j
		mov	ax, di

loc_5A89:				; CODE XREF: sub_5803+282j
		mov	[bp+var_26], ax
		mov	[bp+var_1F], 0
		mov	bx, [bp+var_26]
		mov	byte ptr [bx+16h], 1
		push	[bp+var_26]
		mov	ax, si
		add	ax, 0A8h ; '�'
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		mov	eax, [si+76h]
		mov	[si+65h], eax
		cmp	[bp+var_1F], 0
		jz	short loc_5AD4
		cmp	[bp+var_24], 0
		jz	short loc_5AD4
		push	0
		mov	al, [bp+var_20]
		push	ax
		lea	ax, [bp+var_24]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_5AD4:				; CODE XREF: sub_5803+2B1j
					; sub_5803+2B8j
		mov	[bp+var_24], 0
		mov	[bp+var_1F], 0
		mov	[bp+var_1E], 0

loc_5AE8:				; CODE XREF: sub_5803+215j
		push	1
		push	large 50414853h
		push	si
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jz	short loc_5B00
		jmp	loc_5A1B
; ���������������������������������������������������������������������������

loc_5B00:				; CODE XREF: sub_5803+2F8j
		push	si
		call	ResourceRecord_ReleaseAndClear_3C595
		add	sp, 2
		mov	[bp+var_18], 0
		mov	[bp+var_15], 0
		mov	[bp+var_19], 0
		push	0
		push	large 45524F46h
		push	si
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		or	ax, ax
		jnz	short loc_5B2F
		jmp	loc_5FBA
; ���������������������������������������������������������������������������

loc_5B2F:				; CODE XREF: sub_5803+327j
		mov	[bp+var_19], 1
		push	0
		push	large 544C4150h
		push	si
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		push	si
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	[bp+var_2], ax
		mov	eax, [si+76h]
		mov	[si+65h], eax
		mov	[bp+var_24], 0
		mov	[bp+var_20], 2
		mov	[bp+var_1F], 0
		mov	[bp+var_1E], 0
		push	2
		lea	ax, [bp+var_24]
		push	ax
		push	[bp+var_2]
		lea	ax, [bp+var_190]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		lea	ax, [bp+var_24]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		jmp	loc_5F61
; ���������������������������������������������������������������������������

loc_5B99:				; CODE XREF: sub_5803+773j
		push	0
		push	large 50414853h
		push	si
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jz	short loc_5BBC
		push	si
		call	ResourceRecord_ReadFinalField_3C3C1
		add	sp, 2
		mov	byte ptr [bp+var_26+1],	al
		jmp	short loc_5BCA
; ���������������������������������������������������������������������������

loc_5BBC:				; CODE XREF: sub_5803+3A9j
		push	1
		push	1310h
		push	si
		call	DisplayContext_CommitFrame_2FCD5
		add	sp, 6

loc_5BCA:				; CODE XREF: sub_5803+3B7j
		push	si
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	[bp+var_2], ax
		mov	eax, [si+76h]
		mov	[si+65h], eax
		mov	[bp+var_30], 0
		mov	[bp+var_2C], 2
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		push	3
		lea	ax, [bp+var_30]
		push	ax
		push	[bp+var_2]
		lea	ax, [bp+var_118]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	2Eh ; '.'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_32], ax
		or	ax, ax
		jz	short loc_5C4F
		push	0
		push	0
		lea	ax, [bp+var_30]
		push	ax
		push	[bp+var_32]
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	bx, [bp+var_32]
		mov	word ptr [bx], 132Eh
		mov	bx, [bp+var_32]
		mov	word ptr [bx+0Ah], 134Eh
		push	[bp+var_32]
		call	sub_4A1D
		add	sp, 2
		mov	ax, [bp+var_32]
		jmp	short loc_5C52
; ���������������������������������������������������������������������������

loc_5C4F:				; CODE XREF: sub_5803+418j
		mov	ax, [bp+var_32]

loc_5C52:				; CODE XREF: sub_5803+44Aj
		mov	di, ax
		mov	[bp+var_2B], 0
		mov	byte ptr [di+16h], 1
		push	0
		push	large 4F464E49h
		push	si
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jz	short loc_5C98
		push	si
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	[bp+var_3A], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	[bp+var_3C], ax
		push	[bp+var_3C]
		push	[bp+var_3A]
		push	di
		call	sub_4AD9
		add	sp, 6

loc_5C98:				; CODE XREF: sub_5803+46Cj
		mov	[bp+var_36], 0
		mov	[bp+var_34], 0
		push	0
		push	large 4B434C43h
		push	si
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jz	short loc_5CBF
		mov	byte ptr [di+1Dh], 0
		mov	byte ptr [di+1Eh], 1

loc_5CBF:				; CODE XREF: sub_5803+4B2j
		push	0
		push	large 4C42414Ch
		push	si
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jz	short loc_5D0A
		mov	ax, [si+72h]
		mov	[bp+var_3A], ax
		movsx	eax, [bp+var_3A]
		push	eax
		push	ss
		lea	ax, [bp+var_290]
		push	ax
		push	si
		call	ResourceRecord_ReadFieldGroupA_3C289
		add	sp, 0Ah
		push	ss
		lea	ax, [bp+var_290]
		push	ax
		lea	ax, [bp+var_36]
		push	ax
		call	DisplaySurface_Construct_2F08E
		add	sp, 6
		mov	eax, [si+76h]
		mov	[si+65h], eax

loc_5D0A:				; CODE XREF: sub_5803+4CFj
		push	0
		push	large 55514553h
		push	si
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jz	short loc_5D84
		mov	eax, [si+72h]
		sar	eax, 1
		mov	[bp+var_38], ax
		mov	ax, [bp+var_38]
		shl	ax, 1
		push	ax
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[di+26h], ax
		mov	ax, [bp+var_38]
		mov	[di+2Ah], ax
		mov	[bp+var_3A], 0
		jmp	short loc_5D6B
; ���������������������������������������������������������������������������

loc_5D47:				; CODE XREF: sub_5803+577j
		mov	ax, [bp+var_3A]
		mov	[bp+var_3C], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	[bp+var_3E], ax
		mov	ax, [bp+var_3C]
		shl	ax, 1
		mov	bx, [di+26h]
		add	bx, ax
		mov	ax, [bp+var_3E]
		mov	[bx], ax
		inc	[bp+var_3A]

loc_5D6B:				; CODE XREF: sub_5803+542j
		movsx	eax, [bp+var_3A]
		mov	edx, [si+72h]
		sar	edx, 1
		cmp	eax, edx
		jl	short loc_5D47
		mov	eax, [si+76h]
		mov	[si+65h], eax

loc_5D84:				; CODE XREF: sub_5803+51Aj
		push	0
		push	large 54434552h
		push	si
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jnz	short loc_5D9C
		jmp	loc_5E33
; ���������������������������������������������������������������������������

loc_5D9C:				; CODE XREF: sub_5803+594j
		push	si
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	[bp+var_3A], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	[bp+var_3C], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	[bp+var_3E], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	[bp+var_40], ax
		mov	ax, [bp+var_3A]
		mov	[bp+var_4A], ax
		mov	ax, [bp+var_3C]
		mov	[bp+var_4C], ax
		mov	ax, [bp+var_3E]
		mov	[bp+var_4E], ax
		mov	ax, [bp+var_40]
		mov	[bp+var_50], ax
		mov	ax, [bp+var_4A]
		mov	[bp+var_48], ax
		mov	ax, [bp+var_4C]
		mov	[bp+var_46], ax
		mov	ax, [bp+var_4E]
		mov	[bp+var_44], ax
		mov	ax, [bp+var_50]
		mov	[bp+var_42], ax
		push	[bp+var_36]
		mov	al, byte ptr [bp+var_26+1]
		push	ax
		lea	ax, [bp+var_48]
		push	ax
		mov	ax, si
		add	ax, 0A8h ; '�'
		push	ax
		call	sub_4CDF
		add	sp, 8
		mov	al, byte ptr [bp+var_26+1]
		push	ax
		push	di
		mov	ax, si
		add	ax, 0A8h ; '�'
		push	ax
		call	sub_4EA1
		add	sp, 6
		mov	eax, [si+76h]
		mov	[si+65h], eax
		jmp	loc_5EEB
; ���������������������������������������������������������������������������

loc_5E33:				; CODE XREF: sub_5803+596j
		push	0
		push	large 44415551h
		push	si
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jnz	short loc_5E4B
		jmp	loc_5EEB
; ���������������������������������������������������������������������������

loc_5E4B:				; CODE XREF: sub_5803+643j
		push	si
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	[bp+var_3C], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	[bp+var_3A], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	[bp+var_44], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	[bp+var_42], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	[bp+var_40], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	[bp+var_3E], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	[bp+var_48], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	[bp+var_46], ax
		push	[bp+var_36]
		mov	al, byte ptr [bp+var_26+1]
		push	ax
		lea	ax, [bp+var_48]
		push	ax
		lea	ax, [bp+var_40]
		push	ax
		lea	ax, [bp+var_44]
		push	ax
		lea	ax, [bp+var_3C]
		push	ax
		mov	ax, si
		add	ax, 0A8h ; '�'
		push	ax
		call	sub_4DD3
		add	sp, 0Eh
		mov	al, byte ptr [bp+var_26+1]
		push	ax
		push	di
		mov	ax, si
		add	ax, 0A8h ; '�'
		push	ax
		call	sub_4EA1
		add	sp, 6
		mov	eax, [si+76h]
		mov	[si+65h], eax

loc_5EEB:				; CODE XREF: sub_5803+62Dj
					; sub_5803+645j
		push	0
		push	large 454E5554h
		push	si
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jz	short loc_5F14
		push	si
		call	ResourceRecord_ReadFinalField_3C3C1
		add	sp, 2
		mov	[di+2Dh], al
		mov	eax, [si+76h]
		mov	[si+65h], eax

loc_5F14:				; CODE XREF: sub_5803+6FBj
		push	si
		call	ResourceRecord_ReleaseAndClear_3C595
		add	sp, 2
		lea	ax, [bp+var_36]
		push	ax
		call	Member_ClearAndFree_2F278
		add	sp, 2
		cmp	[bp+var_2B], 0
		jz	short loc_5F4D
		cmp	[bp+var_30], 0
		jz	short loc_5F4D
		push	0
		mov	al, [bp+var_2C]
		push	ax
		lea	ax, [bp+var_30]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_5F4D:				; CODE XREF: sub_5803+72Aj
					; sub_5803+731j
		mov	[bp+var_30], 0
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0

loc_5F61:				; CODE XREF: sub_5803+393j
		push	1
		push	large 54525053h
		push	si
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		or	ax, ax
		jz	short loc_5F79
		jmp	loc_5B99
; ���������������������������������������������������������������������������

loc_5F79:				; CODE XREF: sub_5803+771j
		push	si
		call	ResourceRecord_ReleaseAndClear_3C595
		add	sp, 2
		cmp	[bp+var_1F], 0
		jz	short loc_5FA6
		cmp	[bp+var_24], 0
		jz	short loc_5FA6
		push	0
		mov	al, [bp+var_20]
		push	ax
		lea	ax, [bp+var_24]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_5FA6:				; CODE XREF: sub_5803+783j
					; sub_5803+78Aj
		mov	[bp+var_24], 0
		mov	[bp+var_1F], 0
		mov	[bp+var_1E], 0

loc_5FBA:				; CODE XREF: sub_5803+329j
		push	0
		push	large 52545845h
		push	si
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		or	ax, ax
		jnz	short loc_5FD2
		jmp	loc_60AB
; ���������������������������������������������������������������������������

loc_5FD2:				; CODE XREF: sub_5803+7CAj
		jmp	loc_608A
; ���������������������������������������������������������������������������

loc_5FD5:				; CODE XREF: sub_5803+89Cj
		push	si
		call	ResourceRecord_ReadFinalField_3C3C1
		add	sp, 2
		mov	[bp+var_1A], al
		push	si
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	[bp+var_2], ax
		mov	[bp+var_24], 0
		mov	[bp+var_20], 2
		mov	[bp+var_1F], 0
		mov	[bp+var_1E], 0
		push	3
		lea	ax, [bp+var_24]
		push	ax
		push	[bp+var_2]
		lea	ax, [bp+var_118]
		push	ax
		call	Pak_LoadEntry_C40A
		add	sp, 8
		push	0
		push	0
		lea	ax, [bp+var_24]
		push	ax
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	di, ax
		mov	[bp+var_1F], 0
		mov	byte ptr [di+16h], 1
		push	di
		mov	al, [bp+var_1A]
		push	ax
		mov	ax, si
		add	ax, 10Ah
		push	ax
		call	sub_409A
		add	sp, 6
		mov	eax, [si+76h]
		mov	[si+65h], eax
		cmp	[bp+var_1F], 0
		jz	short loc_6076
		cmp	[bp+var_24], 0
		jz	short loc_6076
		push	0
		mov	al, [bp+var_20]
		push	ax
		lea	ax, [bp+var_24]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_6076:				; CODE XREF: sub_5803+853j
					; sub_5803+85Aj
		mov	[bp+var_24], 0
		mov	[bp+var_1F], 0
		mov	[bp+var_1E], 0

loc_608A:				; CODE XREF: sub_5803:loc_5FD2j
		push	1
		push	large 50414853h
		push	si
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jz	short loc_60A2
		jmp	loc_5FD5
; ���������������������������������������������������������������������������

loc_60A2:				; CODE XREF: sub_5803+89Aj
		push	si
		call	ResourceRecord_ReleaseAndClear_3C595
		add	sp, 2

loc_60AB:				; CODE XREF: sub_5803+7CCj
		push	si
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	[bp+var_12]
		mov	al, [bp+var_10]
		push	ax
		lea	ax, [bp+var_12]
		push	ax
		mov	ax, si
		add	ax, 110h
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		cmp	[bp+var_19], 0
		jz	short loc_60EC
		push	[bp+var_18]
		mov	al, [bp+var_16]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		mov	ax, si
		add	ax, 110h
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8

loc_60EC:				; CODE XREF: sub_5803+8CEj
		push	2
		lea	ax, [bp+var_18]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_12]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	[bp+var_7], 0
		jz	short loc_612C
		cmp	[bp+var_C], 0
		jz	short loc_612C
		push	0
		mov	al, [bp+var_8]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_612C:				; CODE XREF: sub_5803+909j
					; sub_5803+910j
		mov	[bp+var_C], 0
		mov	[bp+var_7], 0
		mov	[bp+var_6], 0
		push	2
		lea	ax, [bp+var_190]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		push	2
		lea	ax, [bp+var_118]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_5803	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_6162	proc far		; CODE XREF: sub_3B0B+138P
					; sub_51AB3+52BP ...

var_6		= word ptr -6
var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_61A3
; ���������������������������������������������������������������������������

loc_6174:				; CODE XREF: sub_6162+55j
		xor	dx, dx
		jmp	short loc_6199
; ���������������������������������������������������������������������������

loc_6178:				; CODE XREF: sub_6162+3Fj
		mov	bx, [bp+var_2]
		mov	al, [bx+6]
		mov	bx, dx
		cmp	al, [bx+si+0E8h]
		jnz	short loc_6191
		mov	bx, [bp+var_2]
		mov	byte ptr [bx+7], 1
		jmp	short loc_61A3
; ���������������������������������������������������������������������������
		jmp	short loc_6198
; ���������������������������������������������������������������������������

loc_6191:				; CODE XREF: sub_6162+22j
		mov	bx, [bp+var_2]
		mov	byte ptr [bx+7], 0

loc_6198:				; CODE XREF: sub_6162+2Dj
		inc	dx

loc_6199:				; CODE XREF: sub_6162+14j
		mov	al, [si+0FCh]
		mov	ah, 0
		cmp	ax, dx
		jg	short loc_6178

loc_61A3:				; CODE XREF: sub_6162+10j sub_6162+2Bj
		lea	ax, [bp+var_2]
		push	ax
		mov	ax, si
		add	ax, 0E1h ; '�'
		push	ax
		call	sub_2FF1E
		add	sp, 4
		or	ax, ax
		jnz	short loc_6174
		xor	di, di
		jmp	short loc_61E7
; ���������������������������������������������������������������������������

loc_61BD:				; CODE XREF: sub_6162+8Dj
		mov	bx, di
		mov	al, [bx+si+0FDh]
		push	ax
		mov	ax, si
		add	ax, 10Ah
		push	ax
		call	sub_4055
		add	sp, 4
		mov	[bp+var_6], ax
		push	[bp+var_6]
		mov	ax, si
		add	ax, 0A8h ; '�'
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		inc	di

loc_61E7:				; CODE XREF: sub_6162+59j
		mov	al, [si+107h]
		mov	ah, 0
		cmp	ax, di
		jg	short loc_61BD
		push	0
		push	word ptr [si+110h]
		mov	al, [si+112h]
		push	ax
		mov	ax, si
		add	ax, 110h
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		mov	ax, si
		add	ax, 0A8h ; '�'
		push	ax
		call	sub_502B
		add	sp, 2
		mov	[bp+var_3], al
		call	sub_3ECA5
		mov	word_44345, ax
		call	sub_3ECBD
		mov	word_44347, ax
		xor	di, di
		jmp	short loc_6259
; ���������������������������������������������������������������������������

loc_622F:				; CODE XREF: sub_6162+FFj
		mov	bx, di
		mov	al, [bx+si+0FDh]
		push	ax
		mov	ax, si
		add	ax, 10Ah
		push	ax
		call	sub_4055
		add	sp, 4
		mov	[bp+var_6], ax
		push	[bp+var_6]
		mov	ax, si
		add	ax, 0A8h ; '�'
		push	ax
		call	LayerGroup_Remove_2DBC1
		add	sp, 4
		inc	di

loc_6259:				; CODE XREF: sub_6162+CBj
		mov	al, [si+107h]
		mov	ah, 0
		cmp	ax, di
		jg	short loc_622F
		mov	byte ptr [si+107h], 0
		mov	al, [bp+var_3]
		pop	di
		pop	si
		leave
		retf
sub_6162	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_6273:				; DATA XREF: dseg:132Eo
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_62B9
		mov	word ptr [si], 132Eh
		mov	word ptr [si+0Ah], 134Eh
		push	si
		mov	bx, [si]
		call	dword ptr [bx+14h]
		add	sp, 2
		push	word ptr [si+26h]
		call	sub_308
		add	sp, 2
		push	0
		push	si
		call	sub_2E0C3
		add	sp, 4
		test	di, 1
		jz	short loc_62B9
		push	si
		call	sub_308
		add	sp, 2

loc_62B9:				; CODE XREF: seg005:0C50j seg005:0C7Ej
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_62BD:				; DATA XREF: dseg:135Ao
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	far ptr	loc_4AEF
; ���������������������������������������������������������������������������

loc_62C9:				; DATA XREF: dseg:1356o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_2E29E
; ���������������������������������������������������������������������������

loc_62D5:				; DATA XREF: dseg:134Eo
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_DrawAtOwnPos_2E202
; ���������������������������������������������������������������������������

loc_62E1:				; DATA XREF: dseg:138Ao
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	far ptr	Layer_Draw_2E22F
; ���������������������������������������������������������������������������

loc_62ED:				; DATA XREF: dseg:1386o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_2E29E
; ���������������������������������������������������������������������������

loc_62F9:				; DATA XREF: dseg:137Eo
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_DrawAtOwnPos_2E202
seg005		ends

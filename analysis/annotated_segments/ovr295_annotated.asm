ovr295		segment	para public 'OVERLAY' use16
		assume cs:ovr295
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine Registry_LookupForTextRenderer_5B5D9 (seg126), CRT_Memset_Public.
; ==============================================================================================
TextRenderer_LookupAndClear_99F70	proc far		; CODE XREF: VROOMM_StubThunk_6BE38J TerrainSector_LoadFieldMix_99FF4+1Dp
		push	bp

loc_99F71:
		mov	bp, sp

loc_99F73:
		mov	byte_6EA75, 0
		call	Registry_LookupForTextRenderer_5B5D9
		push	dx
		push	ax
		pop	eax

loc_99F81:
		cmp	eax, 2DC6C0h

loc_99F87:
		jnb	short loc_99F8E

loc_99F89:
		mov	byte_6EA75, 1

loc_99F8E:				; CODE XREF: TextRenderer_LookupAndClear_99F70:loc_99F87j
		push	large 0FF0000h

loc_99F94:
		push	553Eh
		call	CRT_Memset_Public
		add	sp, 6
		pop	bp
		retf
TextRenderer_LookupAndClear_99F70	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (56 lignes).
; ==============================================================================================
TerrainSector_Helper_99FA1	proc far		; CODE XREF: VROOMM_StubThunk_6BE3DJ
					; TerrainSector_LoadFieldMix_99FF4:loc_9A133p	...

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	bx, [bp+arg_0]
		mov	dx, bx
		cmp	dx, word_727BA
		jnb	short loc_99FC1
		mov	ax, dx
		imul	ax, 6
		push	ax
		mov	ax, word_727BE
		pop	dx
		add	ax, dx
		jmp	short loc_99FDB
; ���������������������������������������������������������������������������

loc_99FC1:				; CODE XREF: TerrainSector_Helper_99FA1+10j
		sub	dx, word_727BA
		cmp	dx, word_727BC
		jnb	short loc_99FD9
		mov	ax, dx
		imul	ax, 0Ch
		push	ax
		mov	ax, word_727C0
		pop	dx
		add	ax, dx
		jmp	short loc_99FDB
; ���������������������������������������������������������������������������

loc_99FD9:				; CODE XREF: TerrainSector_Helper_99FA1+28j
		xor	ax, ax

loc_99FDB:				; CODE XREF: TerrainSector_Helper_99FA1+1Ej
					; TerrainSector_Helper_99FA1+36j
		mov	si, ax
		or	si, si
		jz	short loc_99FF1
		mov	[bp+var_2], bx
		mov	ax, [bp+var_2]
		cwd
		mov	[si+2],	dx
		mov	[si], ax
		mov	byte ptr [si+4], 0FFh

loc_99FF1:				; CODE XREF: TerrainSector_Helper_99FA1+3Ej
		pop	si
		leave
		retf
TerrainSector_Helper_99FA1	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 320 lignes, NON DÉTAILLÉE — combine
; ResourceRecord_SeekAndReadB_647B2/ReadFieldGroupB_64A54 répétés.
; ==============================================================================================
TerrainSector_LoadFieldMix_99FF4	proc far		; CODE XREF: VROOMM_StubThunk_6BE1AJ

var_E8		= word ptr -0E8h
var_DA		= word ptr -0DAh
var_D8		= word ptr -0D8h
var_CF		= byte ptr -0CFh
var_CE		= word ptr -0CEh
var_56		= word ptr -56h
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0E8h
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_6E33B, cl
		push	cs
		call	near ptr TextRenderer_LookupAndClear_99F70
		push	0
		push	large 534D5854h
		push	si

loc_9A01D:
		call	ResourceRecord_SeekAndReadB_647B2

loc_9A022:
		add	sp, 8
		or	ax, ax

loc_9A027:
		jnz	short loc_9A02C
		jmp	loc_9A211
; ���������������������������������������������������������������������������

loc_9A02C:				; CODE XREF: TerrainSector_LoadFieldMix_99FF4:loc_9A027j
		push	0

loc_9A02E:
		push	large 4F464E49h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_9A05E
		push	si

loc_9A042:
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54

loc_9A054:
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+2], ax
		jmp	short loc_9A067
; ���������������������������������������������������������������������������

loc_9A05E:				; CODE XREF: TerrainSector_LoadFieldMix_99FF4+4Bj
		push	0E006h
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_9A067:				; CODE XREF: TerrainSector_LoadFieldMix_99FF4+68j
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+2]

loc_9A06E:
		push	word ptr es:[bx]
		push	word ptr [bp+arg_0+2]
		push	bx
		call	VROOMM_StubThunk_6CD62
		add	sp, 8
		push	ds
		push	offset a_pak_1	; ".PAK"

loc_9A081:
		push	ds
		push	offset aTxmpack	; "TXMPACK"
		push	ds
		push	offset unk_70432
		lea	ax, [bp+var_56]
		push	ax
		call	Path_ResolveDataFile
		add	sp, 0Eh
		lea	ax, [bp+var_CE]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_65A1A
		pop	cx
		push	1
		lea	ax, [bp+var_56]
		push	ax
		lea	ax, [bp+var_CE]
		push	ax
		mov	bx, [bp+var_CE]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 5350414Dh
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_9A0CD
		jmp	loc_9A1FB
; ���������������������������������������������������������������������������

loc_9A0CD:				; CODE XREF: TerrainSector_LoadFieldMix_99FF4+D4j
		mov	eax, [si+72h]
		mov	ebx, 0Ch
		cdq
		idiv	ebx
		mov	[bp+var_2], ax
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+4], 0
		jnz	short loc_9A0EC
		jmp	loc_9A1FB
; ���������������������������������������������������������������������������

loc_9A0EC:				; CODE XREF: TerrainSector_LoadFieldMix_99FF4+F3j
		mov	[bp+var_4], 0
		jmp	loc_9A1F0
; ���������������������������������������������������������������������������

loc_9A0F4:				; CODE XREF: TerrainSector_LoadFieldMix_99FF4+204j
		push	large 0Ch
		push	ss
		lea	ax, [bp+var_DA]
		push	ax
		push	si
		call	ResourceRecord_ReadFieldGroupA_64A19
		add	sp, 0Ah
		cmp	[bp+var_CF], 1
		jnz	short loc_9A15B
		cmp	[bp+var_DA], 0FFh

loc_9A113:
		jz	short loc_9A15B

loc_9A115:
		cmp	byte_6EA6C, 0
		jnz	short loc_9A127

loc_9A11C:
		cmp	[bp+var_DA], 0D7h ; '�'

loc_9A122:
		jg	short loc_9A127

loc_9A124:
		jmp	loc_9A1ED
; ���������������������������������������������������������������������������

loc_9A127:				; CODE XREF: TerrainSector_LoadFieldMix_99FF4+126j
					; TerrainSector_LoadFieldMix_99FF4:loc_9A122j
		cmp	byte_6EA75, 0
		jz	short loc_9A13A
		push	[bp+var_DA]
		push	cs

loc_9A133:
		call	near ptr TerrainSector_Helper_99FA1

loc_9A136:
		pop	cx

loc_9A137:
		jmp	loc_9A1ED
; ���������������������������������������������������������������������������

loc_9A13A:				; CODE XREF: TerrainSector_LoadFieldMix_99FF4+138j
		push	[bp+var_DA]

loc_9A13E:
		lea	ax, [bp+var_CE]
		push	ax

loc_9A143:
		lea	ax, [bp+var_D8]
		push	ax

loc_9A148:
		push	[bp+var_DA]

loc_9A14C:
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6CD67
		add	sp, 0Ch
		jmp	loc_9A1ED
; ���������������������������������������������������������������������������

loc_9A15B:				; CODE XREF: TerrainSector_LoadFieldMix_99FF4+117j
					; TerrainSector_LoadFieldMix_99FF4:loc_9A113j
		mov	al, [bp+var_CF]
		mov	ah, 0

loc_9A161:
		and	ax, 7Fh
		mov	[bp+var_6], ax
		test	[bp+var_CF], 80h

loc_9A16C:
		jz	short loc_9A191
		push	[bp+var_DA]
		lea	ax, [bp+var_CE]
		push	ax
		push	[bp+var_6]
		lea	ax, [bp+var_D8]
		push	ax

loc_9A17F:
		push	[bp+var_DA]
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6CD6C
		add	sp, 0Eh
		jmp	short loc_9A1ED
; ���������������������������������������������������������������������������

loc_9A191:				; CODE XREF: TerrainSector_LoadFieldMix_99FF4:loc_9A16Cj
		mov	di, 1

loc_9A194:
		jmp	short loc_9A1E8
; ���������������������������������������������������������������������������

loc_9A196:				; CODE XREF: TerrainSector_LoadFieldMix_99FF4+1F7j
		push	di
		lea	ax, [bp+var_D8]
		push	ax
		push	19C6h
		lea	ax, [bp+var_E8]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 8
		mov	dx, di
		add	dx, [bp+var_DA]
		dec	dx
		cmp	byte_6EA6C, 0
		jnz	short loc_9A1C0
		cmp	dx, 0D7h ; '�'
		jle	short loc_9A1E7

loc_9A1C0:				; CODE XREF: TerrainSector_LoadFieldMix_99FF4+1C4j
		cmp	byte_6EA75, 0
		jz	short loc_9A1CF
		push	dx
		push	cs
		call	near ptr TerrainSector_Helper_99FA1
		pop	cx
		jmp	short loc_9A1E7
; ���������������������������������������������������������������������������

loc_9A1CF:				; CODE XREF: TerrainSector_LoadFieldMix_99FF4+1D1j
		push	dx

loc_9A1D0:
		lea	ax, [bp+var_CE]
		push	ax

loc_9A1D5:
		lea	ax, [bp+var_E8]
		push	ax
		push	dx
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6CD67
		add	sp, 0Ch

loc_9A1E7:				; CODE XREF: TerrainSector_LoadFieldMix_99FF4+1CAj
					; TerrainSector_LoadFieldMix_99FF4+1D9j
		inc	di

loc_9A1E8:				; CODE XREF: TerrainSector_LoadFieldMix_99FF4:loc_9A194j
		cmp	di, [bp+var_6]
		jle	short loc_9A196

loc_9A1ED:				; CODE XREF: TerrainSector_LoadFieldMix_99FF4:loc_9A124j
					; TerrainSector_LoadFieldMix_99FF4:loc_9A137j	...
		inc	[bp+var_4]

loc_9A1F0:				; CODE XREF: TerrainSector_LoadFieldMix_99FF4+FDj
		mov	ax, [bp+var_4]
		cmp	ax, [bp+var_2]
		jge	short loc_9A1FB
		jmp	loc_9A0F4
; ���������������������������������������������������������������������������

loc_9A1FB:				; CODE XREF: TerrainSector_LoadFieldMix_99FF4+D6j
					; TerrainSector_LoadFieldMix_99FF4+F5j ...
		push	si
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx
		push	2
		lea	ax, [bp+var_CE]
		push	ax
		call	IndexedRecordReader_Destruct_659D0
		add	sp, 4

loc_9A211:				; CODE XREF: TerrainSector_LoadFieldMix_99FF4+35j
		pop	di

loc_9A212:
		pop	si

locret_9A213:
		leave
		retf
TerrainSector_LoadFieldMix_99FF4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 297 lignes, NON DÉTAILLÉE — alloue 3 blocs (CRT_Malloc16_Retry ×3) et des blocs
; typés.
; ==============================================================================================
TerrainSector_AllocateMultiBuffer_9A215	proc far		; CODE XREF: VROOMM_StubThunk_6BE24J

var_30		= dword	ptr -30h
var_2C		= word ptr -2Ch
var_2A		= word ptr -2Ah
var_28		= word ptr -28h
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= dword	ptr -22h
var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh
arg_C		= dword	ptr  12h

		push	bp

loc_9A216:
		mov	bp, sp
		sub	sp, 30h
		push	si
		push	di

loc_9A21D:
		mov	di, [bp+arg_0]

loc_9A220:
		mov	al, [di]
		mov	ah, 0

loc_9A224:
		or	ax, ax
		jz	short loc_9A22B
		jmp	loc_9A463
; ���������������������������������������������������������������������������

loc_9A22B:				; CODE XREF: TerrainSector_AllocateMultiBuffer_9A215+11j
		mov	ax, [bp+arg_2]
		mov	[di+15h], ax
		mov	eax, [bp+arg_4]
		mov	[di+9],	eax
		mov	eax, [bp+arg_8]
		mov	[bp+var_A], eax
		shl	eax, 8
		mov	[bp+var_E], eax
		mov	eax, [bp+var_E]
		mov	[di+5],	eax
		mov	eax, [bp+arg_C]
		mov	[bp+var_12], eax
		shl	eax, 8
		mov	[bp+var_16], eax
		mov	eax, [bp+var_16]
		mov	[di+1],	eax

loc_9A269:
		mov	[bp+var_1A], 0
		mov	ax, [di+15h]
		imul	word ptr [di+15h]
		mov	[di+23h], ax
		mov	ax, word ptr [bp+var_1A]
		mov	[bp+var_2], ax
		mov	ax, [di+23h]

loc_9A283:
		imul	ax, 15h

loc_9A286:
		movzx	eax, ax

loc_9A28A:
		add	[bp+var_1A], eax

loc_9A28E:
		mov	ax, [di+15h]

loc_9A291:
		mov	[di+27h], ax

loc_9A294:
		mov	ax, [di+27h]

loc_9A297:
		imul	word ptr [di+27h]
		mov	[di+27h], ax
		mov	ax, [di+27h]
		imul	ax, 3
		mov	dx, [di+15h]
		shl	dx, 2
		sub	ax, dx
		inc	ax
		mov	[di+27h], ax
		mov	ax, [di+27h]
		shl	ax, 1
		mov	[di+27h], ax
		mov	ax, word ptr [bp+var_1A]
		mov	[bp+var_6], ax
		mov	ax, [di+27h]
		imul	ax, 11h
		movzx	eax, ax
		add	[bp+var_1A], eax
		mov	ax, [di+15h]
		shl	ax, 1
		push	ax
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[di+3Bh], ax
		mov	ax, [di+15h]
		shl	ax, 1

loc_9A2DF:
		push	ax

loc_9A2E0:
		call	CRT_Malloc16_Retry
		pop	cx

loc_9A2E6:
		mov	[di+3Dh], ax
		mov	ax, [di+23h]
		shl	ax, 2
		push	ax
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[di+17h], ax
		mov	ax, [di+15h]
		dec	ax
		mov	[di+2Bh], ax
		mov	ax, [di+2Bh]
		imul	word ptr [di+2Bh]
		shl	ax, 1
		mov	[di+2Bh], ax
		mov	ax, word ptr [bp+var_1A]
		mov	[bp+var_4], ax

loc_9A311:
		mov	ax, [di+2Bh]
		imul	ax, 16h
		movzx	eax, ax

loc_9A31B:
		add	[bp+var_1A], eax
		mov	eax, [bp+var_1A]

loc_9A323:
		mov	[bp+var_1E], eax
		push	19CBh
		push	1
		push	0
		push	3
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapperB_5C774
		add	sp, 0Eh
		mov	word ptr [bp+var_22+2],	dx
		mov	word ptr [bp+var_22], ax

loc_9A343:
		mov	eax, [bp+var_22]
		mov	[di+19h], eax
		mov	byte ptr [di+1Dh], 3
		mov	byte ptr [di+1Eh], 1
		mov	dword ptr [di+1Fh], 0
		mov	eax, [bp+var_1E]
		mov	[di+1Fh], eax

loc_9A363:
		push	0
		mov	al, [di+1Dh]

loc_9A368:
		push	ax

loc_9A369:
		push	large dword ptr	[di+19h]
		push	5C44h

loc_9A370:
		call	Memory_TypedAllocDispatchB_5C832

loc_9A375:
		add	sp, 0Ah
		mov	word ptr dword_6EA68+2,	dx
		mov	word ptr dword_6EA68, ax
		push	0
		mov	al, [di+1Dh]
		push	ax

loc_9A385:
		push	large dword ptr	[di+19h]
		push	5C44h

loc_9A38C:
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	[bp+var_24], dx
		mov	[bp+var_26], ax
		mov	ax, [bp+var_2]
		add	ax, [bp+var_26]
		mov	[bp+var_28], ax
		mov	[di+25h], ax
		mov	ax, [bp+var_4]
		add	ax, [bp+var_26]
		mov	[bp+var_2A], ax
		mov	[di+2Fh], ax
		mov	ax, [bp+var_6]
		add	ax, [bp+var_26]
		mov	[bp+var_2C], ax
		mov	[di+29h], ax
		push	0
		mov	al, byte_727C6
		push	ax
		push	large [dword_727C2]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		or	ax, dx
		jnz	short loc_9A41C

loc_9A3D8:
		push	19FFh

loc_9A3DB:
		push	1
		push	0
		push	2

loc_9A3E1:
		push	large 2580h
		push	5C44h
		call	Memory_TypedFreeWrapperB_5C774
		add	sp, 0Eh
		mov	word ptr [bp+var_30+2],	dx
		mov	word ptr [bp+var_30], ax
		mov	eax, [bp+var_30]
		mov	dword_727C2, eax
		mov	byte_727C6, 2
		mov	byte_727C7, 1
		mov	dword_727C8, 0

loc_9A413:
		mov	dword_727C8, 2580h

loc_9A41C:				; CODE XREF: TerrainSector_AllocateMultiBuffer_9A215+1C1j
		push	0
		mov	al, byte_727C6
		push	ax

loc_9A422:
		push	large [dword_727C2]
		push	5C44h

loc_9A42A:
		call	Memory_TypedAllocDispatchB_5C832

loc_9A42F:
		add	sp, 0Ah

loc_9A432:
		mov	word ptr dword_6EB0C+2,	dx

loc_9A436:
		mov	word ptr dword_6EB0C, ax
		mov	eax, dword_727C8
		add	ax, word ptr dword_6EB0C

loc_9A441:
		add	ax, 0FF6Ah

loc_9A444:
		mov	word_6EB12, dx
		mov	word_6EB10, ax
		mov	dword_6EA68, 0
		push	word ptr [di+15h]
		push	di
		nop
		push	cs
		call	near ptr TerrainSector_AllocateArray_9A566
		add	sp, 4

loc_9A460:
		mov	byte ptr [di], 1

loc_9A463:				; CODE XREF: TerrainSector_AllocateMultiBuffer_9A215+13j
		pop	di
		pop	si
		leave
		retf
TerrainSector_AllocateMultiBuffer_9A215	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, libère 3 blocs (CRT_FreeNear_Wrap ×3).
; ==============================================================================================
TerrainSector_ReleaseTriple_9A467	proc far		; CODE XREF: VROOMM_StubThunk_6BE2EJ TerrainSector_ReleaseDouble_9A4A3+14p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si], 0
		jz	short loc_9A4A0
		push	word ptr [si+3Bh]
		call	CRT_FreeNear_Wrap
		pop	cx
		mov	word ptr [si+3Bh], 0

loc_9A481:
		push	word ptr [si+3Dh]
		call	CRT_FreeNear_Wrap
		pop	cx

loc_9A48A:
		mov	word ptr [si+3Dh], 0
		push	word ptr [si+17h]

loc_9A492:
		call	CRT_FreeNear_Wrap
		pop	cx
		mov	word ptr [si+17h], 0
		mov	byte ptr [si], 0

loc_9A4A0:				; CODE XREF: TerrainSector_ReleaseTriple_9A467+Aj
		pop	si
		pop	bp
		retf
TerrainSector_ReleaseTriple_9A467	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, libère 2 blocs typés et un bloc générique (96 lignes).
; ==============================================================================================
TerrainSector_ReleaseDouble_9A4A3	proc far		; CODE XREF: VROOMM_StubThunk_6BE29J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_9A4B5
		jmp	loc_9A53C
; ���������������������������������������������������������������������������

loc_9A4B5:				; CODE XREF: TerrainSector_ReleaseDouble_9A4A3+Dj
		push	si
		push	cs
		call	near ptr TerrainSector_ReleaseTriple_9A467
		pop	cx
		cmp	byte ptr [si+36h], 0
		jz	short loc_9A4E1
		cmp	dword ptr [si+31h], 0
		jz	short loc_9A4E1
		push	0
		mov	al, [si+35h]
		push	ax
		mov	ax, si

loc_9A4D0:
		add	ax, 31h	; '1'

loc_9A4D3:
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6

loc_9A4DC:
		add	sp, 8

loc_9A4DF:
		jmp	short $+2

loc_9A4E1:				; CODE XREF: TerrainSector_ReleaseDouble_9A4A3+1Cj
					; TerrainSector_ReleaseDouble_9A4A3+23j
		mov	dword ptr [si+31h], 0
		mov	byte ptr [si+36h], 0
		mov	dword ptr [si+37h], 0
		cmp	byte ptr [si+1Eh], 0
		jz	short loc_9A51B
		cmp	dword ptr [si+19h], 0
		jz	short loc_9A51B
		push	0
		mov	al, [si+1Dh]
		push	ax
		mov	ax, si
		add	ax, 19h
		push	ax
		push	5C44h

loc_9A511:
		call	Memory_TypedFree_5C7B6

loc_9A516:
		add	sp, 8

loc_9A519:
		jmp	short $+2

loc_9A51B:				; CODE XREF: TerrainSector_ReleaseDouble_9A4A3+56j
					; TerrainSector_ReleaseDouble_9A4A3+5Dj
		mov	dword ptr [si+19h], 0

loc_9A523:
		mov	byte ptr [si+1Eh], 0

loc_9A527:
		mov	dword ptr [si+1Fh], 0

loc_9A52F:
		test	di, 1

loc_9A533:
		jz	short loc_9A53C
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_9A53C:				; CODE XREF: TerrainSector_ReleaseDouble_9A4A3+Fj
					; TerrainSector_ReleaseDouble_9A4A3:loc_9A533j
		pop	di
		pop	si
		pop	bp
		retf
TerrainSector_ReleaseDouble_9A4A3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (37 lignes).
; ==============================================================================================
TerrainSector_Helper2_9A540	proc far		; CODE XREF: VROOMM_StubThunk_6BE33J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		cmp	[si+11h], dx
		jz	short loc_9A563

loc_9A54F:
		cmp	dx, 1

loc_9A552:
		jle	short loc_9A563
		cmp	[si+15h], dx

loc_9A557:
		jl	short loc_9A563
		push	dx
		push	si
		nop
		push	cs
		call	near ptr TerrainSector_AllocateArray_9A566

loc_9A560:
		add	sp, 4

loc_9A563:				; CODE XREF: TerrainSector_Helper2_9A540+Dj
					; TerrainSector_Helper2_9A540:loc_9A552j	...
		pop	si
		pop	bp
		retf
TerrainSector_Helper2_9A540	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 463 lignes, NON DÉTAILLÉE — alloue via Memory_TypedAllocDispatchB_5C832 uniquement
; (probable grand tableau de secteurs de terrain).
; ==============================================================================================
TerrainSector_AllocateArray_9A566	proc far		; CODE XREF: VROOMM_StubThunk_6BE1FJ TerrainSector_AllocateMultiBuffer_9A215+245p ...

var_82		= word ptr -82h
var_80		= word ptr -80h
var_7E		= word ptr -7Eh
var_7C		= word ptr -7Ch
var_7A		= word ptr -7Ah
var_78		= word ptr -78h
var_76		= word ptr -76h
var_74		= word ptr -74h
var_72		= word ptr -72h
var_70		= word ptr -70h
var_6E		= word ptr -6Eh
var_6C		= word ptr -6Ch
var_6A		= word ptr -6Ah
var_68		= dword	ptr -68h
var_64		= word ptr -64h
var_62		= dword	ptr -62h
var_5E		= word ptr -5Eh
var_5C		= word ptr -5Ch
var_5A		= word ptr -5Ah
var_58		= word ptr -58h
var_56		= word ptr -56h
var_54		= word ptr -54h
var_52		= word ptr -52h
var_50		= dword	ptr -50h
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
var_32		= dword	ptr -32h
var_2E		= word ptr -2Eh
var_2C		= dword	ptr -2Ch
var_28		= word ptr -28h
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 82h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	[si+11h], dx
		mov	ax, dx
		sar	ax, 1
		mov	[si+13h], ax
		mov	di, [si+11h]
		dec	di
		mov	ax, di

loc_9A585:
		imul	di
		shl	ax, 1

loc_9A589:
		mov	[si+2Dh], ax
		push	0
		mov	al, [si+1Dh]
		push	ax
		push	large dword ptr	[si+19h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	word ptr dword_6EA68+2,	dx
		mov	word ptr dword_6EA68, ax
		mov	ax, [si+2Fh]
		mov	dx, word ptr dword_6EA68+2
		mov	word ptr [bp+var_6+2], dx

loc_9A5B2:
		mov	word ptr [bp+var_6], ax

loc_9A5B5:
		mov	ax, [si+25h]
		mov	word ptr [bp+var_A+2], dx

loc_9A5BB:
		mov	word ptr [bp+var_A], ax

loc_9A5BE:
		mov	ax, [si+11h]

loc_9A5C1:
		imul	di

loc_9A5C3:
		mov	cx, ax
		shl	ax, 1

loc_9A5C7:
		mov	cx, ax
		mov	ax, [si+29h]
		mov	dx, word ptr dword_6EA68+2
		mov	word ptr [bp+var_E+2], dx
		mov	word ptr [bp+var_E], ax
		mov	ax, cx
		imul	ax, 11h
		mov	bx, word ptr [bp+var_E]
		add	bx, ax
		mov	word ptr [bp+var_12+2],	dx

loc_9A5E3:
		mov	word ptr [bp+var_12], bx
		mov	ax, cx
		imul	ax, 11h
		add	bx, ax
		mov	word ptr [bp+var_16+2],	dx
		mov	word ptr [bp+var_16], bx
		mov	[bp+var_2], 0
		jmp	loc_9A82F
; ���������������������������������������������������������������������������

loc_9A5FB:				; CODE XREF: TerrainSector_AllocateArray_9A566:loc_9A834j
		xor	cx, cx
		jmp	loc_9A81D
; ���������������������������������������������������������������������������

loc_9A600:				; CODE XREF: TerrainSector_AllocateArray_9A566:loc_9A821j
		mov	eax, [bp+var_A]
		mov	[bp+var_1A], eax
		mov	ax, word ptr [bp+var_1A]
		mov	[bp+var_1C], ax
		mov	ax, [si+11h]

loc_9A611:
		imul	ax, 15h
		mov	dx, word ptr [bp+var_A+2]

loc_9A617:
		mov	bx, word ptr [bp+var_A]
		add	bx, ax
		add	bx, 15h
		mov	[bp+var_1E], dx

loc_9A622:
		mov	[bp+var_20], bx
		mov	ax, [bp+var_20]
		mov	[bp+var_22], ax

loc_9A62B:
		mov	ax, [si+11h]
		imul	ax, 15h
		mov	bx, word ptr [bp+var_A]
		add	bx, ax
		mov	[bp+var_24], dx
		mov	[bp+var_26], bx
		mov	ax, [bp+var_26]
		mov	[bp+var_28], ax
		les	bx, [bp+var_6]
		mov	ax, [bp+var_1C]

loc_9A648:
		mov	es:[bx+2], ax

loc_9A64C:
		mov	ax, [bp+var_22]

loc_9A64F:
		mov	es:[bx+4], ax
		mov	ax, [bp+var_28]
		mov	es:[bx+6], ax
		mov	eax, [bp+var_E]
		mov	[bp+var_2C], eax

loc_9A662:
		mov	ax, word ptr [bp+var_2C]
		mov	[bp+var_2E], ax
		mov	ax, [bp+var_2E]
		mov	es:[bx+8], ax
		mov	eax, [bp+var_16]

loc_9A673:
		mov	[bp+var_32], eax
		mov	ax, word ptr [bp+var_32]
		mov	[bp+var_34], ax
		mov	ax, [bp+var_34]
		mov	es:[bx+0Eh], ax

loc_9A684:
		mov	ax, word ptr [bp+var_16+2]

loc_9A687:
		mov	dx, word ptr [bp+var_16]

loc_9A68A:
		add	dx, 11h
		mov	[bp+var_36], ax

loc_9A690:
		mov	[bp+var_38], dx
		mov	ax, [bp+var_38]

loc_9A696:
		mov	[bp+var_3A], ax
		mov	ax, [bp+var_3A]
		mov	es:[bx+0Ah], ax
		mov	ax, di
		shl	ax, 1
		imul	ax, 11h
		mov	dx, word ptr [bp+var_12+2]
		mov	bx, word ptr [bp+var_12]
		add	bx, ax
		add	bx, 11h
		mov	[bp+var_3C], dx

loc_9A6B5:
		mov	[bp+var_3E], bx
		mov	ax, [bp+var_3E]
		mov	[bp+var_40], ax

loc_9A6BE:
		mov	ax, [bp+var_40]
		mov	bx, word ptr [bp+var_6]
		mov	es:[bx+10h], ax
		mov	ax, di
		shl	ax, 1
		imul	ax, 11h
		mov	bx, word ptr [bp+var_12]

loc_9A6D2:
		add	bx, ax

loc_9A6D4:
		mov	[bp+var_42], dx
		mov	[bp+var_44], bx

loc_9A6DA:
		mov	ax, [bp+var_44]

loc_9A6DD:
		mov	[bp+var_46], ax

loc_9A6E0:
		mov	ax, [bp+var_46]

loc_9A6E3:
		mov	bx, word ptr [bp+var_6]

loc_9A6E6:
		mov	es:[bx+0Ch], ax
		mov	ax, word ptr [bp+var_E+2]
		mov	dx, word ptr [bp+var_E]
		add	dx, 11h
		mov	[bp+var_48], ax
		mov	[bp+var_4A], dx
		mov	ax, [bp+var_4A]
		mov	[bp+var_4C], ax
		mov	ax, [bp+var_4C]
		mov	es:[bx+12h], ax
		mov	byte ptr es:[bx+1], 0
		add	word ptr [bp+var_6], 16h

loc_9A70F:
		mov	eax, [bp+var_A]
		mov	[bp+var_50], eax
		mov	ax, word ptr [bp+var_50]
		mov	[bp+var_52], ax
		mov	ax, word ptr [bp+var_A+2]
		mov	dx, word ptr [bp+var_A]

loc_9A723:
		add	dx, 15h

loc_9A726:
		mov	[bp+var_54], ax

loc_9A729:
		mov	[bp+var_56], dx

loc_9A72C:
		mov	ax, [bp+var_56]

loc_9A72F:
		mov	[bp+var_58], ax

loc_9A732:
		mov	ax, [si+11h]

loc_9A735:
		imul	ax, 15h
		mov	dx, word ptr [bp+var_A+2]
		mov	bx, word ptr [bp+var_A]
		add	bx, ax

loc_9A740:
		add	bx, 15h

loc_9A743:
		mov	[bp+var_5A], dx
		mov	[bp+var_5C], bx
		mov	ax, [bp+var_5C]

loc_9A74C:
		mov	[bp+var_5E], ax

loc_9A74F:
		les	bx, [bp+var_6]

loc_9A752:
		mov	ax, [bp+var_52]
		mov	es:[bx+2], ax
		mov	ax, [bp+var_58]
		mov	es:[bx+4], ax
		mov	ax, [bp+var_5E]

loc_9A763:
		mov	es:[bx+6], ax

loc_9A767:
		mov	eax, [bp+var_16]

loc_9A76B:
		mov	[bp+var_62], eax
		mov	ax, word ptr [bp+var_62]
		mov	[bp+var_64], ax
		mov	ax, [bp+var_64]
		mov	es:[bx+8], ax
		mov	eax, [bp+var_12]

loc_9A780:
		mov	[bp+var_68], eax
		mov	ax, word ptr [bp+var_68]

loc_9A787:
		mov	[bp+var_6A], ax
		mov	ax, [bp+var_6A]
		mov	es:[bx+0Eh], ax

loc_9A791:
		mov	ax, word ptr [bp+var_12+2]

loc_9A794:
		mov	dx, word ptr [bp+var_12]
		add	dx, 11h

loc_9A79A:
		mov	[bp+var_6C], ax

loc_9A79D:
		mov	[bp+var_6E], dx

loc_9A7A0:
		mov	ax, [bp+var_6E]

loc_9A7A3:
		mov	[bp+var_70], ax

loc_9A7A6:
		mov	ax, [bp+var_70]
		mov	es:[bx+0Ah], ax
		mov	ax, word ptr [bp+var_E+2]
		mov	dx, word ptr [bp+var_E]

loc_9A7B3:
		add	dx, 22h	; '"'
		mov	[bp+var_72], ax
		mov	[bp+var_74], dx

loc_9A7BC:
		mov	ax, [bp+var_74]
		mov	[bp+var_76], ax
		mov	ax, [bp+var_76]
		mov	es:[bx+10h], ax
		mov	ax, word ptr [bp+var_E+2]
		mov	dx, word ptr [bp+var_E]

loc_9A7CF:
		add	dx, 33h	; '3'

loc_9A7D2:
		mov	[bp+var_78], ax

loc_9A7D5:
		mov	[bp+var_7A], dx

loc_9A7D8:
		mov	ax, [bp+var_7A]
		mov	[bp+var_7C], ax

loc_9A7DE:
		mov	ax, [bp+var_7C]

loc_9A7E1:
		mov	es:[bx+0Ch], ax
		mov	ax, word ptr [bp+var_16+2]
		mov	dx, word ptr [bp+var_16]
		add	dx, 11h
		mov	[bp+var_7E], ax
		mov	[bp+var_80], dx
		mov	ax, [bp+var_80]
		mov	[bp+var_82], ax
		mov	ax, [bp+var_82]
		mov	es:[bx+12h], ax
		mov	byte ptr es:[bx+1], 1
		add	word ptr [bp+var_6], 16h
		add	word ptr [bp+var_E], 22h ; '"'

loc_9A810:
		add	word ptr [bp+var_12], 22h ; '"'

loc_9A814:
		add	word ptr [bp+var_16], 22h ; '"'

loc_9A818:
		add	word ptr [bp+var_A], 15h
		inc	cx

loc_9A81D:				; CODE XREF: TerrainSector_AllocateArray_9A566+97j
		cmp	cx, di
		jge	short loc_9A824

loc_9A821:
		jmp	loc_9A600
; ���������������������������������������������������������������������������

loc_9A824:				; CODE XREF: TerrainSector_AllocateArray_9A566+2B9j
		add	word ptr [bp+var_E], 22h ; '"'

loc_9A828:
		add	word ptr [bp+var_A], 15h
		inc	[bp+var_2]

loc_9A82F:				; CODE XREF: TerrainSector_AllocateArray_9A566+92j
		cmp	[bp+var_2], di

loc_9A832:
		jge	short loc_9A837

loc_9A834:
		jmp	loc_9A5FB
; ���������������������������������������������������������������������������

loc_9A837:				; CODE XREF: TerrainSector_AllocateArray_9A566:loc_9A832j
		mov	dword_6EA68, 0
		pop	di
		pop	si
		leave
		retf
TerrainSector_AllocateArray_9A566	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle CRT_Doscan_Core (parsing type scanf) 3 fois.
; ==============================================================================================
TerrainSector_ParseTriple_9A844	proc far		; CODE XREF: VROOMM_StubThunk_6BE42J
		push	bp
		mov	bp, sp
		push	seg stub295
		push	offset VROOMM_StubThunk_6BE15
		push	5
		push	large 3

loc_9A852:
		push	2
		push	ds
		push	offset unk_725DA
		call	CRT_Doscan_Core
		add	sp, 10h
		push	seg stub295
		push	offset VROOMM_StubThunk_6BE10
		push	5
		push	large 3
		push	2
		push	ds
		push	offset unk_725E0
		call	CRT_Doscan_Core
		add	sp, 10h
		push	seg stub295
		push	offset VROOMM_StubThunk_6BE10
		push	5

loc_9A881:
		push	large 3
		push	2
		push	ds
		push	offset unk_725E6
		call	CRT_Doscan_Core
		add	sp, 10h

loc_9A892:
		mov	byte_725D9, 1

loc_9A897:
		pop	bp
		retf
TerrainSector_ParseTriple_9A844	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue via CRT_Malloc32_Retry.
; ==============================================================================================
TerrainSector_AllocateExtended_9A899	proc far		; CODE XREF: VROOMM_StubThunk_6BE15J

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp

loc_9A89C:
		cmp	[bp+arg_0], 0

loc_9A8A1:
		jnz	short loc_9A8B6

loc_9A8A3:
		push	large 2

loc_9A8A6:
		call	CRT_Malloc32_Retry
		add	sp, 4
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx

loc_9A8B6:				; CODE XREF: TerrainSector_AllocateExtended_9A899:loc_9A8A1j
		mov	dx, word ptr [bp+arg_0+2]

loc_9A8B9:
		mov	ax, word ptr [bp+arg_0]
		pop	bp
		retf
TerrainSector_AllocateExtended_9A899	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue via CRT_Malloc32_Retry.
; ==============================================================================================
TerrainSector_AllocateExtendedB_9A8BE	proc far		; CODE XREF: VROOMM_StubThunk_6BE10J

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		cmp	[bp+arg_0], 0
		jnz	short loc_9A8DB
		push	large 2
		call	CRT_Malloc32_Retry

loc_9A8D0:
		add	sp, 4

loc_9A8D3:
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx

loc_9A8DB:				; CODE XREF: TerrainSector_AllocateExtendedB_9A8BE+8j
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	bp
		retf
TerrainSector_AllocateExtendedB_9A8BE	endp

ovr295		ends

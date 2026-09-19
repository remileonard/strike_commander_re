ovr249		segment	para public 'OVERLAY' use16
		assume cs:ovr249
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine Video_ClearTextPage, Path_ResolveDataFile, Widget_Helper_5AAB2 (seg125).
; ==============================================================================================
UIScreen_ClearAndLoadResource_869C0	proc far		; CODE XREF: VROOMM_StubThunk_6B204J Cockpit_LoadViewTable_86B53+1Ep

var_64		= word ptr -64h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 64h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	word ptr [si+123h], 0
		mov	byte ptr [si+21Dh], 0
		mov	word ptr [si+1Eh], 0
		mov	word ptr [si+127h], 0
		mov	word ptr [si+133h], 0
		mov	word ptr [si+173h], 0
		mov	byte ptr [si+1BBh], 0
		mov	word ptr [si+125h], 0FFFFh
		mov	word ptr [si+20h], 0
		xor	ax, ax
		mov	[si+22h], ax
		mov	[si+24h], ax
		mov	dword ptr [si+1BFh], 700h
		mov	[bp+var_4], 80h	; '�'
		mov	eax, [bp+var_4]
		mov	[si+1C3h], eax
		mov	dword ptr [si+1C7h], 0FFFFFE00h
		mov	dword ptr [si+1CBh], 0FFFFFF00h
		mov	dword ptr [si+1CFh], 300h
		mov	dword ptr [si+1D3h], 0A00h
		mov	eax, [si+1D3h]
		mov	[si+1D7h], eax
		mov	dword ptr [si+1DBh], 500h
		mov	byte ptr [si+1E1h], 20h	; ' '
		mov	byte ptr [si+1E2h], 5
		mov	byte ptr [si+1E3h], 0
		mov	byte ptr [si+1DFh], 0
		mov	byte ptr [si+1E0h], 0
		call	Video_ClearTextPage
		mov	byte ptr [si+1F4h], 0
		mov	byte ptr [si+1F5h], 3Fh	; '?'
		mov	byte ptr [si+1F6h], 3Fh	; '?'
		mov	byte ptr [si+1F7h], 3Fh	; '?'
		mov	word ptr [si+206h], 4
		mov	word ptr [si+204h], 0
		mov	word ptr [si+202h], 4
		mov	word ptr [si+200h], 1
		mov	word ptr [si+1FEh], 3
		mov	word ptr [si+1FCh], 2
		mov	word ptr [si+1FAh], 1
		mov	word ptr [si+1F8h], 0
		mov	byte ptr [si+1E4h], 0
		mov	byte ptr [si+1E5h], 3Fh	; '?'
		mov	byte ptr [si+1E6h], 3Fh	; '?'
		mov	byte ptr [si+1E7h], 27h	; '''
		mov	[bp+var_8], 0C0h ; '�'
		mov	eax, [bp+var_8]
		mov	[si+1E8h], eax
		mov	[bp+var_C], 1E00h
		mov	eax, [bp+var_C]
		mov	[si+1ECh], eax
		mov	eax, [si+1E8h]
		neg	eax
		mov	[bp+var_10], eax
		mov	[bp+var_14], eax
		mov	[si+1F0h], eax
		mov	di, si
		add	di, 1ECh
		mov	eax, [si+1F0h]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[si+1F0h], eax
		mov	byte ptr [si+21Ch], 0FFh
		push	ds
		push	offset a_pak_4	; ".PAK"
		push	ds
		push	offset aBetty_0	; "BETTY"
		push	ds
		push	offset aCockpits_1 ; "COCKPITS"
		lea	ax, [bp+var_64]
		push	ax
		call	Path_ResolveDataFile
		add	sp, 0Eh
		push	0
		lea	ax, [bp+var_64]
		push	ax
		call	Widget_Helper_5AAB2
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
UIScreen_ClearAndLoadResource_869C0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 816L (ex-'MissionRecord_LoadFullDatabase', NON DÉTAILLÉE — nom FAUX). CHARGE LA TABLE
; DES VUES COCKPIT depuis OBJECTS\<nom>.IFF. Path_Resolve('OBJECTS', arg_4, '.IFF') via
; sub_2B06C ; [si+0x1E] = arg_2 ; ResourceRecord_InitAndValidate_645CD(si+0x220, path,
; 'CKPT'=0x54504B43) ; SeekAndRead('INFO'=0x4F464E49) ; ResourceRecord_ReadFinalField_64B51 ×2
; -> [si+0x123] = count, [si+0x13F] = byte ; alloc count*0x1D (sub_1069, taille élément
; 0x1D0000h) -> [si+0x133] ; ResourceRecord_ReadFieldGroupA_64A19([si+0x133], count*0x1D) =
; LIT LA TABLE BRUTE (count enregistrements de 29 o). Puis SeekAndRead('PART'=0x50545241) ->
; suite (instruments/MFD/...). Enregistrement de 29 o : +0x00 u8 id (scancode ; 0xFF = non
; lié), +0x01 i16 FOV, +0x03 i32 (921), +0x07/+0x09 u16, +0x0B/0D/0F i16 angles de visée
; (degrés ; rot X,Y,Z), +0x11/15/19 i32 offset œil pilote (24.8). F16-CKPT : 5 records =
; défaut / F4 gauche(-90) / F3 droite(+90) / F5 arrière(180) / défaut zoom(FOV 30). Consommé
; par Cockpit_ApplyViewRecord_84EC0. Voir CAMERA_SYSTEM.md §3bis.
; ==============================================================================================
Cockpit_LoadViewTable_86B53	proc far		; CODE XREF: VROOMM_StubThunk_6B209J

var_118		= word ptr -118h
var_B7		= dword	ptr -0B7h
var_AB		= word ptr -0ABh
var_A7		= dword	ptr -0A7h
var_A0		= word ptr -0A0h
var_50		= dword	ptr -50h
var_4C		= dword	ptr -4Ch
var_48		= dword	ptr -48h
var_44		= dword	ptr -44h
var_40		= dword	ptr -40h
var_3C		= dword	ptr -3Ch
var_38		= dword	ptr -38h
var_34		= dword	ptr -34h
var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 118h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_6E33B, cl
		push	si
		push	cs
		call	near ptr UIScreen_ClearAndLoadResource_869C0
		pop	cx
		mov	byte ptr [si+140h], 0
		mov	ax, [bp+arg_2]
		mov	[si+1Eh], ax
		push	seg seg215
		push	offset a_iff	; ".IFF"
		push	ds
		push	[bp+arg_4]
		push	ds
		push	offset aObjects	; "OBJECTS"
		lea	ax, [bp+var_A0]
		push	ax
		call	Path_ResolveDataFile
		add	sp, 0Eh
		mov	di, si
		add	di, 220h
		push	large 54504B43h
		lea	ax, [bp+var_A0]
		push	ax
		push	di
		call	ResourceRecord_InitAndValidate_645CD
		add	sp, 8
		or	ax, ax
		jnz	short loc_86BC2
		push	7001h
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_86BC2:				; CODE XREF: Cockpit_LoadViewTable_86B53+64j
		push	0
		push	large 4F464E49h
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_86C28
		push	di
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		mov	[si+123h], ax
		push	di
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		mov	[si+13Fh], al
		push	seg stub249
		push	offset VROOMM_StubThunk_6B1F5
		push	1
		push	word ptr [si+123h]
		push	large 1D0000h
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[si+133h], ax
		mov	ax, [si+123h]
		imul	ax, 1Dh
		movzx	eax, ax
		push	eax
		push	ds
		push	word ptr [si+133h]
		push	di
		call	ResourceRecord_ReadFieldGroupA_64A19
		add	sp, 0Ah
		jmp	short loc_86C31
; ���������������������������������������������������������������������������

loc_86C28:				; CODE XREF: Cockpit_LoadViewTable_86B53+82j
		push	7002h
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_86C31:				; CODE XREF: Cockpit_LoadViewTable_86B53+D3j
		push	0
		push	large 50545241h
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_86C49
		jmp	loc_86D80
; ���������������������������������������������������������������������������

loc_86C49:				; CODE XREF: Cockpit_LoadViewTable_86B53+F1j
		call	Registry_LookupForTextRenderer_5B5D9
		push	dx
		push	ax
		pop	eax
		cmp	eax, 1E8480h
		jnb	short loc_86C5D
		jmp	loc_86D52
; ���������������������������������������������������������������������������

loc_86C5D:				; CODE XREF: Cockpit_LoadViewTable_86B53+105j
		push	large dword ptr	[di+76h]
		push	large dword ptr	[di+65h]
		mov	ax, si
		add	ax, 220h
		push	ax
		lea	ax, [bp+var_118]
		push	ax
		call	IndexedRecordReader_ConstructVariantC_65A8A
		add	sp, 0Ch
		push	seg stub239
		push	offset VROOMM_StubThunk_6ADAA
		push	11h
		push	word ptr [si+123h]
		push	large 0A0000h
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[si+127h], ax
		mov	word ptr [bp+var_24+2],	ax
		mov	word ptr [bp+var_24], 0
		jmp	loc_86D35
; ���������������������������������������������������������������������������

loc_86CA1:				; CODE XREF: Cockpit_LoadViewTable_86B53+1EBj
		push	word ptr [bp+var_24]
		lea	ax, [bp+var_118]
		push	ax
		call	IndexedRecordReader_AdvanceIndex_65E2C
		add	sp, 4
		mov	ax, [bp+var_AB]
		and	ax, 0C0h
		cmp	ax, 0C0h ; '�'
		jnz	short loc_86CC4
		mov	eax, [bp+var_B7]

loc_86CC2:
		jmp	short loc_86CC9
; ���������������������������������������������������������������������������

loc_86CC4:				; CODE XREF: Cockpit_LoadViewTable_86B53+168j
		mov	eax, [bp+var_A7]

loc_86CC9:				; CODE XREF: Cockpit_LoadViewTable_86B53:loc_86CC2j
		mov	[bp+var_28], eax

loc_86CCD:
		push	1

loc_86CCF:
		push	0

loc_86CD1:
		push	3

loc_86CD3:
		push	eax

loc_86CD5:
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_2C+2],	dx
		mov	word ptr [bp+var_2C], ax
		mov	bx, word ptr [bp+var_24+2]
		mov	eax, [bp+var_2C]
		mov	[bx], eax
		mov	byte ptr [bx+4], 3
		mov	byte ptr [bx+5], 1
		mov	dword ptr [bx+6], 0
		mov	eax, [bp+var_28]
		mov	[bx+6],	eax
		push	0
		mov	al, [bx+4]
		push	ax
		push	large dword ptr	[bx]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [bp+var_24]
		lea	ax, [bp+var_118]
		push	ax
		call	IndexedRecordReader_SeekToIndex_65C6D
		add	sp, 8
		inc	word ptr [bp+var_24]
		add	word ptr [bp+var_24+2],	0Ah

loc_86D35:				; CODE XREF: Cockpit_LoadViewTable_86B53+14Bj
		mov	ax, [si+123h]
		cmp	ax, word ptr [bp+var_24]
		jle	short loc_86D41
		jmp	loc_86CA1
; ���������������������������������������������������������������������������

loc_86D41:				; CODE XREF: Cockpit_LoadViewTable_86B53+1E9j
		push	2
		lea	ax, [bp+var_118]
		push	ax
		call	IndexedRecordReader_Destruct_659D0
		add	sp, 4
		jmp	short loc_86D7B
; ���������������������������������������������������������������������������

loc_86D52:				; CODE XREF: Cockpit_LoadViewTable_86B53+107j
		push	large dword ptr	[di+76h]
		push	large dword ptr	[di+65h]
		mov	ax, si
		add	ax, 220h
		push	ax
		push	0
		call	IndexedRecordReader_ConstructVariantC_65A8A
		add	sp, 0Ch
		mov	[si+141h], ax
		or	ax, ax
		jnz	short loc_86D7B
		push	7003h
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_86D7B:				; CODE XREF: Cockpit_LoadViewTable_86B53+1FDj
					; Cockpit_LoadViewTable_86B53+21Dj
		mov	byte ptr [si+21Fh], 1

loc_86D80:				; CODE XREF: Cockpit_LoadViewTable_86B53+F3j
		push	0
		push	large 504D5456h
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_86DFD
		mov	eax, [di+72h]
		mov	[bp+var_4], eax
		push	1
		push	0
		push	3
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		mov	eax, [bp+var_8]
		mov	[si+129h], eax
		mov	byte ptr [si+12Dh], 3

loc_86DC4:
		mov	byte ptr [si+12Eh], 1

loc_86DC9:
		mov	dword ptr [si+12Fh], 0
		mov	eax, [bp+var_4]
		mov	[si+12Fh], eax
		push	0
		mov	al, [si+12Dh]
		push	ax
		push	large dword ptr	[si+129h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		call	ResourceRecord_ReadDwordFieldB_64AFF
		add	sp, 6

loc_86DFD:				; CODE XREF: Cockpit_LoadViewTable_86B53+240j
		push	0
		push	large 464E5547h
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_86E7A
		mov	eax, [di+72h]
		mov	[bp+var_C], eax
		push	1
		push	0
		push	3
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_10+2],	dx
		mov	word ptr [bp+var_10], ax
		mov	eax, [bp+var_10]
		mov	[si+208h], eax
		mov	byte ptr [si+20Ch], 3
		mov	byte ptr [si+20Dh], 1
		mov	dword ptr [si+20Eh], 0
		mov	eax, [bp+var_C]
		mov	[si+20Eh], eax
		push	0
		mov	al, [si+20Ch]
		push	ax
		push	large dword ptr	[si+208h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		call	ResourceRecord_ReadDwordFieldB_64AFF
		add	sp, 6

loc_86E7A:				; CODE XREF: Cockpit_LoadViewTable_86B53+2BDj
		push	0
		push	large 44554847h
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_86EF7
		mov	eax, [di+72h]
		mov	[bp+var_14], eax
		push	1
		push	0
		push	3
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_18+2],	dx
		mov	word ptr [bp+var_18], ax
		mov	eax, [bp+var_18]
		mov	[si+212h], eax
		mov	byte ptr [si+216h], 3
		mov	byte ptr [si+217h], 1

loc_86EC3:
		mov	dword ptr [si+218h], 0

loc_86ECC:
		mov	eax, [bp+var_14]
		mov	[si+218h], eax
		push	0
		mov	al, [si+216h]
		push	ax
		push	large dword ptr	[si+212h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		call	ResourceRecord_ReadDwordFieldB_64AFF
		add	sp, 6

loc_86EF7:				; CODE XREF: Cockpit_LoadViewTable_86B53+33Aj
		push	0
		push	large 'LAER'    ; REAL
		push	di
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jnz	short loc_86F0F
		jmp	loc_86FD9
; ���������������������������������������������������������������������������

loc_86F0F:				; CODE XREF: Cockpit_LoadViewTable_86B53+3B7j
		push	0
		push	large 'OFNI'    ; INFO
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_86F80
		push	di
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+175h], eax
		push	di
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+179h], eax
		push	di
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+17Dh], eax
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+181h], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+183h], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+185h], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+187h], ax

loc_86F80:				; CODE XREF: Cockpit_LoadViewTable_86B53+3CFj
		push	0
		push	large 'SJBO'    ; OBJS
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_86FD2
		mov	ax, si
		add	ax, 220h
		mov	word ptr [bp+var_2C], ax
		push	ax
		lea	ax, [bp+var_2C+2]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		lea	ax, [bp+var_2C+2]
		mov	word ptr [bp+var_30+2],	ds
		mov	word ptr [bp+var_30], ax
		push	1
		push	1
		push	word ptr [bp+var_30+2]
		push	ax
		push	571Ch
		call	ObjectPrototype_FindOrLoadAndInstantiate_38B70
		add	sp, 0Ah
		mov	[si+173h], ax

loc_86FCA:
		mov	bx, [si+173h]
		and	byte ptr [bx+4], 0FDh

loc_86FD2:				; CODE XREF: Cockpit_LoadViewTable_86B53+440j
		push	di
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx

loc_86FD9:				; CODE XREF: Cockpit_LoadViewTable_86B53+3B9j
		mov	[bp+var_1A], si
		push	97h ; '�'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp+var_1C], ax
		or	ax, ax
		jnz	short loc_86FEF
		jmp	loc_8708A
; ���������������������������������������������������������������������������

loc_86FEF:				; CODE XREF: Cockpit_LoadViewTable_86B53+497j
		add	ax, 10h
		push	ax
		call	Formation_ComputeGeometryHelper_56D43
		pop	cx
		mov	bx, [bp+var_1C]
		mov	word ptr [bx+5Ch], 0
		mov	word ptr [bx+5Eh], 0
		mov	ax, [bp+var_1A]
		mov	[bx], ax
		xor	eax, eax
		mov	[bx+4Ch], eax
		mov	[bx+48h], eax
		mov	[bx+44h], eax
		mov	ax, [bp+var_1C]
		add	ax, 44h	; 'D'
		xor	eax, eax
		mov	[bx+0Ch], eax
		mov	[bx+8],	eax
		mov	[bx+4],	eax
		mov	ax, [bp+var_1C]
		add	ax, 4
		mov	ax, [bp+var_1C]
		add	ax, 10h
		push	ax
		call	Matrix_BuildFromAngle_56D72
		pop	cx
		mov	[bp+var_20], 0
		mov	eax, [bp+var_20]
		mov	bx, [bp+var_1C]
		mov	[bx+34h], eax
		mov	word ptr [bx+2], 0
		mov	dword ptr [bx+91h], 0
		push	0
		mov	ax, [bp+var_1C]
		add	ax, 5Ch	; '\'
		push	ax
		call	SetReference16
		add	sp, 4
		push	0
		mov	ax, [bp+var_1C]
		add	ax, 5Eh	; '^'
		push	ax
		call	SetReference16
		add	sp, 4
		mov	ax, [bp+var_1C]
		jmp	short loc_8708D
; ���������������������������������������������������������������������������

loc_8708A:				; CODE XREF: Cockpit_LoadViewTable_86B53+499j
		mov	ax, [bp+var_1C]

loc_8708D:				; CODE XREF: Cockpit_LoadViewTable_86B53+535j
		mov	[si+20h], ax
		push	0
		push	word ptr [si+20h]
		push	si
		push	0
		call	VROOMM_StubThunk_6B35B
		add	sp, 8
		mov	[si+24h], ax
		push	1
		push	word ptr [si+20h]
		push	si
		push	0
		call	VROOMM_StubThunk_6B35B
		add	sp, 8
		mov	[si+22h], ax
		push	0
		push	large 'INOM'    ; MONI
		push	di
		call	ResourceRecord_SeekAndReadB_647B2

loc_870C4:
		add	sp, 8

loc_870C7:
		or	ax, ax

loc_870C9:
		jz	short loc_870E7
		mov	ax, si
		add	ax, 220h
		push	ax
		push	si

loc_870D2:
		mov	ax, si

loc_870D4:
		add	ax, 2Ch	; ','

loc_870D7:
		push	ax
		call	VROOMM_StubThunk_6B5C0
		add	sp, 6
		push	di
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx

loc_870E7:				; CODE XREF: Cockpit_LoadViewTable_86B53:loc_870C9j
		push	0
		push	large 'TSNI'    ; INST
		push	di
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_87118
		mov	ax, si
		add	ax, 220h
		push	ax
		push	si
		mov	ax, si
		add	ax, 26h	; '&'
		push	ax
		call	VROOMM_StubThunk_6B29F
		add	sp, 6
		push	di
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx

loc_87118:				; CODE XREF: Cockpit_LoadViewTable_86B53+5A7j
		push	0
		push	large 'EDAF'    ; FADE
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_87130
		jmp	loc_87321
; ���������������������������������������������������������������������������

loc_87130:				; CODE XREF: Cockpit_LoadViewTable_86B53+5D8j
		push	di
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+1BFh], eax
		push	di
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_24], eax
		push	di
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+1C7h], eax
		push	di
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_28], eax
		push	di
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_2C], eax
		push	di
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+1CFh], eax
		push	di
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+1D3h], eax
		push	di
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+1DBh], eax
		push	di
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		mov	[si+1E1h], al
		push	di
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx

loc_871BF:
		mov	[si+1E2h], al
		push	di

loc_871C4:
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		mov	[si+1E3h], al
		push	di
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+1E8h], eax
		push	di
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+1ECh], eax
		push	di
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		mov	[si+1E5h], al
		push	di
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		mov	[si+1E6h], al
		push	di
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		mov	[si+1E7h], al
		mov	eax, [bp+var_2C]
		mov	[si+1C3h], eax
		mov	di, si
		add	di, 1BFh
		mov	eax, [bp+var_24]
		sub	eax, [di]
		mov	[bp+var_30], eax
		mov	[bp+var_34], eax
		mov	eax, [si+1C3h]
		mov	edx, eax
		mov	ecx, [bp+var_34]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[si+1C3h], eax
		mov	eax, [bp+var_2C]
		mov	[si+1CBh], eax
		mov	di, si
		add	di, 1C7h
		mov	eax, [bp+var_28]
		sub	eax, [di]
		mov	[bp+var_38], eax
		mov	[bp+var_3C], eax
		mov	eax, [si+1CBh]
		mov	edx, eax
		mov	ecx, [bp+var_3C]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[si+1CBh], eax
		cmp	dword ptr [si+1DBh], 0
		jg	short loc_87290
		mov	ax, 1
		jmp	short loc_87292
; ���������������������������������������������������������������������������

loc_87290:				; CODE XREF: Cockpit_LoadViewTable_86B53+736j
		xor	ax, ax

loc_87292:				; CODE XREF: Cockpit_LoadViewTable_86B53+73Bj
		or	al, al
		jz	short loc_872A7
		mov	[bp+var_40], 500h
		mov	eax, [bp+var_40]
		mov	[si+1DBh], eax

loc_872A7:				; CODE XREF: Cockpit_LoadViewTable_86B53+741j
		cmp	dword ptr [si+1D3h], 0
		jg	short loc_872B4
		mov	ax, 1
		jmp	short loc_872B6
; ���������������������������������������������������������������������������

loc_872B4:				; CODE XREF: Cockpit_LoadViewTable_86B53+75Aj
		xor	ax, ax

loc_872B6:				; CODE XREF: Cockpit_LoadViewTable_86B53+75Fj
		or	al, al
		jz	short loc_872D2
		mov	eax, [si+1DBh]

loc_872BF:
		add	eax, 0A00h
		mov	[bp+var_44], eax
		mov	[bp+var_48], eax
		mov	[si+1D3h], eax

loc_872D2:				; CODE XREF: Cockpit_LoadViewTable_86B53+765j
		mov	eax, [si+1D3h]
		mov	[si+1D7h], eax
		mov	byte ptr [si+1DFh], 0
		mov	byte ptr [si+1E0h], 0
		mov	byte ptr [si+1E4h], 0
		mov	eax, [si+1E8h]
		neg	eax
		mov	[bp+var_4C], eax
		mov	[bp+var_50], eax
		mov	[si+1F0h], eax
		mov	di, si
		add	di, 1ECh
		mov	eax, [si+1F0h]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[si+1F0h], eax

loc_87321:				; CODE XREF: Cockpit_LoadViewTable_86B53+5DAj
		pop	di
		pop	si
		leave
		retf
Cockpit_LoadViewTable_86B53	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 118 lignes, NON DÉTAILLÉE — combine Memory_TypedFree_5C7B6,
; IndexedRecordReader_AdvanceIndex_65E2C/SeekToIndex_65C6D (seg196).
; ==============================================================================================
IndexedRecordReader_ReleaseAndAdvance_87325	proc far		; CODE XREF: VROOMM_StubThunk_6B1FAJ

var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_5		= byte ptr -5
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	byte ptr [si+13Ah], 0
		jz	short loc_8735C
		cmp	dword ptr [si+135h], 0
		jz	short loc_8735C
		push	0
		mov	al, [si+139h]
		push	ax
		mov	ax, si
		add	ax, 135h
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_8735C:				; CODE XREF: IndexedRecordReader_ReleaseAndAdvance_87325+13j
					; IndexedRecordReader_ReleaseAndAdvance_87325+1Bj
		mov	dword ptr [si+135h], 0
		mov	byte ptr [si+13Ah], 0
		mov	dword ptr [si+13Bh], 0
		cmp	word ptr [si+127h], 0
		jz	short loc_873BC
		mov	ax, di
		imul	ax, 0Ah
		mov	di, [si+127h]
		add	di, ax
		mov	eax, [di]
		mov	[bp+var_4], eax
		mov	al, [di+4]
		mov	[bp+var_5], al
		mov	eax, [bp+var_4]
		mov	[si+135h], eax
		mov	al, [bp+var_5]
		mov	[si+139h], al
		mov	byte ptr [si+13Ah], 0
		mov	dword ptr [si+13Bh], 0
		mov	eax, [di+6]
		mov	[si+13Bh], eax
		jmp	loc_8744E
; ���������������������������������������������������������������������������

loc_873BC:				; CODE XREF: IndexedRecordReader_ReleaseAndAdvance_87325+53j
		push	di
		push	word ptr [si+141h]

loc_873C1:
		call	IndexedRecordReader_AdvanceIndex_65E2C
		add	sp, 4
		mov	bx, [si+141h]
		mov	ax, [bx+6Dh]
		and	ax, 0C0h

loc_873D3:
		cmp	ax, 0C0h ; '�'
		jnz	short loc_873DE
		mov	eax, [bx+61h]
		jmp	short loc_873E6
; ���������������������������������������������������������������������������

loc_873DE:				; CODE XREF: IndexedRecordReader_ReleaseAndAdvance_87325+B1j
		mov	bx, [si+141h]
		mov	eax, [bx+71h]

loc_873E6:				; CODE XREF: IndexedRecordReader_ReleaseAndAdvance_87325+B7j
		mov	[bp+var_A], eax
		push	1
		push	0
		push	3
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_E+2], dx
		mov	word ptr [bp+var_E], ax
		mov	eax, [bp+var_E]
		mov	[si+135h], eax
		mov	byte ptr [si+139h], 3
		mov	byte ptr [si+13Ah], 1
		mov	dword ptr [si+13Bh], 0
		mov	eax, [bp+var_A]
		mov	[si+13Bh], eax
		push	0
		mov	al, [si+139h]
		push	ax
		push	large dword ptr	[si+135h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		push	word ptr [si+141h]
		call	IndexedRecordReader_SeekToIndex_65C6D
		add	sp, 8

loc_8744E:				; CODE XREF: IndexedRecordReader_ReleaseAndAdvance_87325+94j
		mov	byte ptr [si+21Fh], 1
		pop	di
		pop	si
		leave
		retf
IndexedRecordReader_ReleaseAndAdvance_87325	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine thunks voisins, Memory_TypedFree_5C7B6, une opération de conteneur,
; Text_TypewriterDrawChar — dessin d'une frame de texte façon machine à écrire (dialogue/sous-
; titre).
; ==============================================================================================
TextScroll_DrawTypewriterFrame_87457	proc far		; CODE XREF: VROOMM_StubThunk_6B213J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	VROOMM_StubThunk_6BBEA
		pop	cx
		mov	ax, si
		add	ax, 26h	; '&'
		push	ax
		call	VROOMM_StubThunk_6B2A9
		pop	cx
		cmp	byte ptr [si+13Ah], 0
		jz	short loc_8749A
		cmp	dword ptr [si+135h], 0
		jz	short loc_8749A
		push	0
		mov	al, [si+139h]
		push	ax
		mov	ax, si
		add	ax, 135h
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_8749A:				; CODE XREF: TextScroll_DrawTypewriterFrame_87457+1Fj
					; TextScroll_DrawTypewriterFrame_87457+27j
		mov	dword ptr [si+135h], 0
		mov	byte ptr [si+13Ah], 0
		mov	dword ptr [si+13Bh], 0
		mov	word ptr [si+125h], 0FFFFh
		cmp	byte ptr [si+1BCh], 0
		jz	short loc_874D7
		push	word ptr [si+173h]

loc_874C2:
		push	59C3h

loc_874C5:
		call	Container_Op_223F0
		add	sp, 4

loc_874CD:
		mov	byte ptr [si+1BCh], 0
		mov	byte ptr [si+1BDh], 0

loc_874D7:				; CODE XREF: TextScroll_DrawTypewriterFrame_87457+65j
		mov	byte ptr [si+1BBh], 0
		push	word_720E2
		push	ds
		push	offset word_72A94
		call	Text_TypewriterDrawChar
		add	sp, 6
		pop	si
		pop	bp
		retf
TextScroll_DrawTypewriterFrame_87457	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 206 lignes, NON DÉTAILLÉE — combine CRT_Doprnt_Core (formatage type printf),
; invalidation de références faibles (×2).
; ==============================================================================================
TextScroll_FormatAndReleaseRefs_874EF	proc far		; CODE XREF: VROOMM_StubThunk_6B218J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_87501
		jmp	loc_87714
; ���������������������������������������������������������������������������

loc_87501:				; CODE XREF: TextScroll_FormatAndReleaseRefs_874EF+Dj
		mov	word ptr [si], 764h
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		pop	cx
		push	seg stub239
		push	offset VROOMM_StubThunk_6ADA5
		push	large 190000h
		push	0Ah
		push	word ptr [si+127h]
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	word ptr [si+133h]
		call	CRT_FreeNear_Wrap
		pop	cx
		cmp	word ptr [si+173h], 0
		jz	short loc_8754B
		push	3
		push	word ptr [si+173h]
		mov	bx, [si+173h]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 4
		jmp	short $+2

loc_8754B:				; CODE XREF: TextScroll_FormatAndReleaseRefs_874EF+46j
		cmp	word ptr [si+20h], 0
		jz	short loc_87576
		mov	ax, [si+20h]
		add	ax, 5Eh	; '^'
		push	ax
		call	WeakRef_InvalidateIfSet
		pop	cx
		mov	ax, [si+20h]
		add	ax, 5Ch	; '\'
		push	ax
		call	WeakRef_InvalidateIfSet
		pop	cx
		push	word ptr [si+20h]
		call	CRT_FreeNear_Wrap
		pop	cx
		jmp	short $+2

loc_87576:				; CODE XREF: TextScroll_FormatAndReleaseRefs_874EF+60j
		push	3
		push	word ptr [si+24h]
		call	VROOMM_StubThunk_6B383
		add	sp, 4
		push	3
		push	word ptr [si+22h]
		call	VROOMM_StubThunk_6B383
		add	sp, 4
		mov	word ptr [si+220h], 2E0h
		mov	ax, si
		add	ax, 220h
		push	ax
		call	ResourceRecord_Helper_645A5
		pop	cx
		push	0
		mov	ax, si
		add	ax, 220h
		push	ax
		call	StreamReader_ReleaseBuffer_65643
		add	sp, 4
		cmp	byte ptr [si+217h], 0
		jz	short loc_875DB
		cmp	dword ptr [si+212h], 0
		jz	short loc_875DB
		push	0
		mov	al, [si+216h]
		push	ax
		mov	ax, si
		add	ax, 212h
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_875DB:				; CODE XREF: TextScroll_FormatAndReleaseRefs_874EF+C8j
					; TextScroll_FormatAndReleaseRefs_874EF+D0j
		mov	dword ptr [si+212h], 0
		mov	byte ptr [si+217h], 0
		mov	dword ptr [si+218h], 0
		cmp	byte ptr [si+20Dh], 0
		jz	short loc_8761B
		cmp	dword ptr [si+208h], 0
		jz	short loc_8761B
		push	0
		mov	al, [si+20Ch]
		push	ax
		mov	ax, si
		add	ax, 208h
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_8761B:				; CODE XREF: TextScroll_FormatAndReleaseRefs_874EF+108j
					; TextScroll_FormatAndReleaseRefs_874EF+110j
		mov	dword ptr [si+208h], 0
		mov	byte ptr [si+20Dh], 0
		mov	dword ptr [si+20Eh], 0
		cmp	byte ptr [si+13Ah], 0
		jz	short loc_8765B
		cmp	dword ptr [si+135h], 0
		jz	short loc_8765B
		push	0
		mov	al, [si+139h]
		push	ax
		mov	ax, si
		add	ax, 135h
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_8765B:				; CODE XREF: TextScroll_FormatAndReleaseRefs_874EF+148j
					; TextScroll_FormatAndReleaseRefs_874EF+150j
		mov	dword ptr [si+135h], 0
		mov	byte ptr [si+13Ah], 0
		mov	dword ptr [si+13Bh], 0
		cmp	byte ptr [si+12Eh], 0
		jz	short loc_8769B
		cmp	dword ptr [si+129h], 0
		jz	short loc_8769B
		push	0
		mov	al, [si+12Dh]
		push	ax
		mov	ax, si
		add	ax, 129h
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_8769B:				; CODE XREF: TextScroll_FormatAndReleaseRefs_874EF+188j
					; TextScroll_FormatAndReleaseRefs_874EF+190j
		mov	dword ptr [si+129h], 0
		mov	byte ptr [si+12Eh], 0
		mov	dword ptr [si+12Fh], 0
		mov	ax, si
		add	ax, 107h
		push	ax
		call	TextFormat_ReleaseStyleList_5E526
		pop	cx
		mov	ax, si
		add	ax, 0F9h ; '�'
		push	ax
		call	TextFormat_ReleaseStyleList_5E526
		pop	cx
		push	2
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	VROOMM_StubThunk_6B5B6
		add	sp, 4
		mov	word ptr [si+26h], 760h
		mov	ax, si
		add	ax, 26h	; '&'
		push	ax
		call	VROOMM_StubThunk_6B2B3
		pop	cx
		mov	word ptr [si+26h], 75Ch
		mov	ax, si
		add	ax, 26h	; '&'
		push	ax
		call	LinkedListB_Helper_5F66B
		pop	cx
		push	0
		push	si
		call	VROOMM_StubThunk_6BBEF
		add	sp, 4
		test	di, 1
		jz	short loc_87714
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_87714:				; CODE XREF: TextScroll_FormatAndReleaseRefs_874EF+Fj
					; TextScroll_FormatAndReleaseRefs_874EF+21Cj
		pop	di
		pop	si
		pop	bp
		retf
TextScroll_FormatAndReleaseRefs_874EF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine TextFormat_ReleaseStyleList_5E526/ApplyStyleAttribute_5E2D0 (×2, seg143),
; Font_GetGlyphMetrics_58DFE (seg120).
; ==============================================================================================
Font_ApplyStyleAndMeasure_87718	proc far		; CODE XREF: VROOMM_StubThunk_6B1FFJ

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_0]
		mov	ax, si
		add	ax, 2
		push	ax
		call	TextFormat_ReleaseStyleList_5E526
		pop	cx
		push	word_70E62
		mov	ax, si
		add	ax, 10h
		push	ax
		call	TextFormat_ApplyStyleAttribute_5E2D0
		add	sp, 4
		cmp	byte ptr [si+1BCh], 0
		jz	short loc_8775D
		mov	word ptr [si+14h], 0
		mov	word ptr [si+16h], 0
		mov	word ptr [si+18h], 13Fh
		mov	word ptr [si+1Ah], 0C7h	; '�'
		jmp	short loc_87787
; ���������������������������������������������������������������������������

loc_8775D:				; CODE XREF: Font_ApplyStyleAndMeasure_87718+2Dj
		push	[bp+arg_2]
		push	0
		mov	al, [si+12Dh]
		push	ax
		push	large dword ptr	[si+129h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		mov	ax, si
		add	ax, 10h
		push	ax
		call	Font_GetGlyphMetrics_58DFE
		add	sp, 8

loc_87787:				; CODE XREF: Font_ApplyStyleAndMeasure_87718+43j
		cmp	word_6E1C2, si
		jnz	short loc_877D0
		push	5196h
		mov	ax, si
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_5E2D0
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
		mov	[si+6],	ax
		mov	ax, [bp+var_4]

loc_877BF:
		mov	[si+8],	ax

loc_877C2:
		mov	ax, [bp+var_6]

loc_877C5:
		mov	[si+0Ah], ax
		mov	ax, [bp+var_8]
		mov	[si+0Ch], ax
		jmp	short loc_87817
; ���������������������������������������������������������������������������

loc_877D0:				; CODE XREF: Font_ApplyStyleAndMeasure_87718+73j
		mov	ax, [si+18h]
		sub	ax, [si+14h]
		mov	[bp+var_A], ax
		mov	ax, [si+1Ah]
		sub	ax, [si+16h]
		mov	[bp+var_C], ax
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	ax, [bp+var_A]
		mov	[si+0Ah], ax
		mov	ax, [bp+var_C]
		mov	[si+0Ch], ax
		push	0
		mov	ax, si
		add	ax, 2
		push	ax
		call	TextRenderer_ApplyFormatChange_5E34D
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_87817
		push	7004h
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_87817:				; CODE XREF: Font_ApplyStyleAndMeasure_87718+B6j
					; Font_ApplyStyleAndMeasure_87718+F4j
		pop	si
		leave
		retf
Font_ApplyStyleAndMeasure_87718	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle Text_TypewriterDrawChar et des thunks voisins.
; ==============================================================================================
TextScroll_DrawTypewriterFrameB_8781A	proc far		; CODE XREF: VROOMM_StubThunk_6B20EJ

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		cmp	word_6E1C2, 0
		jnz	short loc_8782F
		mov	word_6E1C2, si

loc_8782F:				; CODE XREF: TextScroll_DrawTypewriterFrameB_8781A+Fj
		mov	ax, word_72B30
		mov	word_720E2, ax
		push	0
		push	ds
		push	offset word_72A94
		call	Text_TypewriterDrawChar
		add	sp, 6
		mov	byte ptr [si+1BCh], 0
		mov	byte ptr [si+1BDh], 0
		cmp	word ptr [si+125h], 0FFFFh
		jnz	short loc_8785D
		push	si
		call	VROOMM_StubThunk_6B085
		pop	cx
		jmp	short loc_87874
; ���������������������������������������������������������������������������

loc_8785D:				; CODE XREF: TextScroll_DrawTypewriterFrameB_8781A+38j
		mov	ax, [si+125h]
		mov	[bp+var_2], ax
		mov	word ptr [si+125h], 0FFFFh
		push	ax
		push	si
		call	VROOMM_StubThunk_6B08A
		add	sp, 4

loc_87874:				; CODE XREF: TextScroll_DrawTypewriterFrameB_8781A+41j
		mov	ax, si
		add	ax, 26h	; '&'
		push	ax
		call	VROOMM_StubThunk_6B2A4
		pop	cx
		pop	si
		leave
		retf
TextScroll_DrawTypewriterFrameB_8781A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle Video_SetHorizontalShake.
; ==============================================================================================
Video_ShakeEffectWrapper_87883	proc far		; CODE XREF: VROOMM_StubThunk_6B21DJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+21Ch], 0FFh
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		nop
		push	cs
		call	near ptr TextScroll_Helper2_8790A
		pop	cx
		push	0
		call	Video_SetHorizontalShake
		pop	cx
		pop	si
		pop	bp
		retf
Video_ShakeEffectWrapper_87883	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle Video_SetHorizontalShake via thunk voisin.
; ==============================================================================================
Video_ShakeEffectWrapperB_878A6	proc far		; CODE XREF: VROOMM_StubThunk_6B222J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	bx, [si+20h]
		mov	word ptr [bx+2], 0
		mov	word ptr [bx+93h], 0
		mov	word ptr [bx+91h], 0
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	VROOMM_StubThunk_6B5CF
		pop	cx

loc_878CD:
		mov	byte ptr [si+21Dh], 0

loc_878D2:
		mov	byte ptr [si+140h], 0

loc_878D7:
		push	0
		call	Video_SetHorizontalShake
		pop	cx
		mov	eax, [si+1D3h]
		mov	[si+1D7h], eax
		pop	si
		pop	bp
		retf
Video_ShakeEffectWrapperB_878A6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (19 lignes).
; ==============================================================================================
TextScroll_Helper_878EC	proc far		; CODE XREF: VROOMM_StubThunk_6B1F5J

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
TextScroll_Helper_878EC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (26 lignes).
; ==============================================================================================
TextScroll_Helper2_8790A	proc far		; CODE XREF: VROOMM_StubThunk_6B1F0J Video_ShakeEffectWrapper_87883+14p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		xor	dx, dx
		jmp	short loc_87926
; ���������������������������������������������������������������������������

loc_87915:				; CODE XREF: TextScroll_Helper2_8790A+20j
		mov	bx, dx
		shl	bx, 1
		mov	bx, [bx+si+0B2h]
		mov	dword ptr [bx+9], 0
		inc	dx

loc_87926:				; CODE XREF: TextScroll_Helper2_8790A+9j
		cmp	[si+0C2h], dx
		jg	short loc_87915
		pop	si
		pop	bp
		retf
TextScroll_Helper2_8790A	endp

ovr249		ends

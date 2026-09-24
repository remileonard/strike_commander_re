ovr244		segment	para public 'OVERLAY' use16
		assume cs:ovr244
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue (0xBA octets), même motif que HUDSymbol_ConstructVariantA_804F0
; (Formation_ComputeGeometryHelper_56D43, sub_2AFB5, ReadFieldGroupA_64A19) — appelle aussi
; HUDSymbol_ConstructVariantC_82C2E.
; ==============================================================================================
HUDSymbol_ConstructVariantQ_82B80	proc far		; CODE XREF: VROOMM_StubThunk_6AFBFJ

var_34		= word ptr -34h
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 34h
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_82BA0
		push	0BAh ; '�'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_82BA0
		jmp	loc_82C29
; ���������������������������������������������������������������������������

loc_82BA0:				; CODE XREF: HUDSymbol_ConstructVariantQ_82B80+Cj
					; HUDSymbol_ConstructVariantQ_82B80+1Bj
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	Formation_ComputeGeometryHelper_56D43
		pop	cx
		mov	word ptr [si+50h], 484h
		mov	ax, si
		add	ax, 53h	; 'S'
		push	ax
		call	String_ConstructEmpty
		pop	cx
		push	si
		call	VROOMM_StubThunk_6BC0D
		pop	cx
		mov	word ptr [si+50h], 67Eh
		mov	ax, si
		add	ax, 80h	; '�'
		push	ax
		call	String_ConstructEmpty
		pop	cx
		mov	word ptr [si+89h], 0

loc_82BDB:
		mov	word ptr [si+50h], 717h

loc_82BE0:
		mov	word ptr [si+8Bh], 0
		mov	ax, si

loc_82BE8:
		add	ax, 8Dh	; '�'
		mov	ax, si
		add	ax, 99h	; '�'
		mov	ax, si
		add	ax, 0A5h ; '�'
		mov	ax, si
		add	ax, 0A9h ; '�'
		mov	ax, si
		add	ax, 0ADh ; '�'
		mov	ax, si
		add	ax, 0B1h ; '�'
		mov	ax, si
		add	ax, 0B5h ; '�'
		push	large 34h ; '4'
		push	ss
		lea	ax, [bp+var_34]
		push	ax
		push	[bp+arg_2]
		call	ResourceRecord_ReadFieldGroupA_64A19
		add	sp, 0Ah
		lea	ax, [bp+var_34]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr HUDSymbol_ConstructAndInitAngleB_82CDC
		add	sp, 4

loc_82C29:				; CODE XREF: HUDSymbol_ConstructVariantQ_82B80+1Dj
		mov	ax, si
		pop	si
		leave
		retf
HUDSymbol_ConstructVariantQ_82B80	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, même motif que HUDSymbol_ConstructVariantA_804F0 (variante de symbole HUD).
; ==============================================================================================
HUDSymbol_ConstructVariantC_82C2E	proc far		; CODE XREF: VROOMM_StubThunk_6AFC9J

var_34		= word ptr -34h
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 34h
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_82C4E
		push	0BAh ; '�'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_82C4E
		jmp	loc_82CD7
; ���������������������������������������������������������������������������

loc_82C4E:				; CODE XREF: HUDSymbol_ConstructVariantC_82C2E+Cj
					; HUDSymbol_ConstructVariantC_82C2E+1Bj
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax

loc_82C54:
		call	Formation_ComputeGeometryHelper_56D43
		pop	cx
		mov	word ptr [si+50h], 484h
		mov	ax, si
		add	ax, 53h	; 'S'
		push	ax
		call	String_ConstructEmpty
		pop	cx
		push	si
		call	VROOMM_StubThunk_6BC0D
		pop	cx
		mov	word ptr [si+50h], 67Eh
		mov	ax, si
		add	ax, 80h	; '�'
		push	ax
		call	String_ConstructEmpty
		pop	cx
		mov	word ptr [si+89h], 0
		mov	word ptr [si+50h], 717h
		mov	word ptr [si+8Bh], 0
		mov	ax, si
		add	ax, 8Dh	; '�'
		mov	ax, si
		add	ax, 99h	; '�'
		mov	ax, si
		add	ax, 0A5h ; '�'
		mov	ax, si
		add	ax, 0A9h ; '�'
		mov	ax, si
		add	ax, 0ADh ; '�'
		mov	ax, si
		add	ax, 0B1h ; '�'
		mov	ax, si
		add	ax, 0B5h ; '�'
		push	34h ; '4'
		push	large [bp+arg_2]
		push	ss
		lea	ax, [bp+var_34]
		push	ax
		call	CRT_MemFamily_Extra1
		add	sp, 0Ah
		lea	ax, [bp+var_34]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr HUDSymbol_ConstructAndInitAngleB_82CDC
		add	sp, 4

loc_82CD7:				; CODE XREF: HUDSymbol_ConstructVariantC_82C2E+1Dj
		mov	ax, si

loc_82CD9:
		pop	si
		leave
		retf
HUDSymbol_ConstructVariantC_82C2E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, même motif que HUDSymbol_ConstructAndInitAngle_80701 (121 lignes).
; ==============================================================================================
HUDSymbol_ConstructAndInitAngleB_82CDC	proc far		; CODE XREF: VROOMM_StubThunk_6AFC4J HUDSymbol_ConstructVariantQ_82B80+A3p	...

var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_11		= byte ptr -11h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
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
		sub	sp, 12h

loc_82CE2:
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [di+1Ch]
		mov	[bp+var_2], ax
		mov	ax, [di+1Eh]
		mov	[bp+var_4], ax
		mov	ax, [di+20h]
		mov	[bp+var_6], ax
		mov	ax, [di+22h]
		mov	[bp+var_8], ax
		push	1Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp+var_A], ax
		or	ax, ax
		jz	short loc_82D4E
		mov	bx, [bp+var_A]
		mov	word ptr [bx], 44Ch
		mov	word ptr [bx+2], 0
		mov	word ptr [bx+4], 0
		mov	byte ptr [bx+0Fh], 0
		mov	word ptr [bx+10h], 0
		mov	word ptr [bx+12h], 0
		mov	byte ptr [bx+1Dh], 0
		push	[bp+var_8]
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		push	ax
		call	VROOMM_StubThunk_6BBE0
		add	sp, 0Ah
		mov	ax, [bp+var_A]
		jmp	short loc_82D51
; ���������������������������������������������������������������������������

loc_82D4E:				; CODE XREF: HUDSymbol_ConstructAndInitAngleB_82CDC+33j
		mov	ax, [bp+var_A]

loc_82D51:				; CODE XREF: HUDSymbol_ConstructAndInitAngleB_82CDC+70j
		mov	[si+5Ch], ax
		sub	sp, 4
		mov	ax, di
		add	ax, 18h
		mov	[bp+var_C], ax
		mov	bx, [bp+var_C]
		mov	eax, [bx]
		mov	[bp+var_1A], eax
		sub	sp, 4
		mov	ax, [di+16h]
		mov	[bp+var_E], ax
		movsx	eax, [bp+var_E]
		shl	eax, 8
		mov	[bp+var_1E], eax
		push	large dword ptr	[di+12h]
		mov	ax, di
		add	ax, 0Ah
		push	ax
		push	word ptr [si+5Ch]
		push	si
		call	VROOMM_StubThunk_6B0EE
		add	sp, 12h
		mov	[bp+var_10], di
		push	8
		push	[bp+var_10]
		mov	ax, si
		add	ax, 53h	; 'S'
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	byte ptr [si+5Bh], 0
		mov	al, [di+8]
		mov	[bp+var_11], al
		and	ax, 1
		and	byte ptr [si+52h], 0FDh
		shl	al, 1
		or	[si+52h], al
		mov	eax, [di+24h]
		mov	[si+0A5h], eax
		add	di, 28h	; '('
		mov	eax, [di]

loc_82DD0:
		mov	[si+99h], eax
		mov	eax, [di+4]

loc_82DD9:
		mov	[si+9Dh], eax

loc_82DDE:
		mov	eax, [di+8]

loc_82DE2:
		mov	[si+0A1h], eax
		pop	di
		pop	si
		leave
		retf
HUDSymbol_ConstructAndInitAngleB_82CDC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 619 lignes, NON DÉTAILLÉE — variante de HUDSymbol_RenderWithClipTest_80B74 (seg243).
; Candidat pour session dédiée.
; ==============================================================================================
HUDSymbol_RenderWithClipTestD_82DEB	proc far		; CODE XREF: VROOMM_StubThunk_6AFD8J

var_190		= dword	ptr -190h
var_186		= dword	ptr -186h
var_182		= dword	ptr -182h
var_17E		= dword	ptr -17Eh
var_17A		= dword	ptr -17Ah
var_176		= dword	ptr -176h
var_172		= dword	ptr -172h
var_16E		= dword	ptr -16Eh
var_16A		= dword	ptr -16Ah
var_166		= dword	ptr -166h
var_162		= dword	ptr -162h
var_15E		= dword	ptr -15Eh
var_15A		= dword	ptr -15Ah
var_156		= dword	ptr -156h
var_152		= dword	ptr -152h
var_14E		= dword	ptr -14Eh
var_14A		= dword	ptr -14Ah
var_146		= dword	ptr -146h
var_142		= dword	ptr -142h
var_13E		= dword	ptr -13Eh
var_13A		= dword	ptr -13Ah
var_136		= dword	ptr -136h
var_132		= dword	ptr -132h
var_12E		= dword	ptr -12Eh
var_12A		= dword	ptr -12Ah
var_126		= dword	ptr -126h
var_122		= dword	ptr -122h
var_11E		= dword	ptr -11Eh
var_11A		= dword	ptr -11Ah
var_116		= dword	ptr -116h
var_112		= dword	ptr -112h
var_10E		= word ptr -10Eh
var_EA		= dword	ptr -0EAh
var_E6		= dword	ptr -0E6h
var_E2		= dword	ptr -0E2h
var_DE		= dword	ptr -0DEh
var_DA		= dword	ptr -0DAh
var_D6		= dword	ptr -0D6h
var_D2		= dword	ptr -0D2h
var_CE		= dword	ptr -0CEh
var_CA		= dword	ptr -0CAh
var_C6		= dword	ptr -0C6h
var_C2		= dword	ptr -0C2h
var_BE		= dword	ptr -0BEh
var_BA		= dword	ptr -0BAh
var_B6		= dword	ptr -0B6h
var_B2		= dword	ptr -0B2h
var_AE		= dword	ptr -0AEh
var_AA		= dword	ptr -0AAh
var_A6		= dword	ptr -0A6h
var_A2		= dword	ptr -0A2h
var_9E		= dword	ptr -9Eh
var_9A		= dword	ptr -9Ah
var_96		= dword	ptr -96h
var_92		= dword	ptr -92h
var_8E		= dword	ptr -8Eh
var_8A		= dword	ptr -8Ah
var_86		= dword	ptr -86h
var_82		= dword	ptr -82h
var_7E		= dword	ptr -7Eh
var_7A		= dword	ptr -7Ah
var_76		= dword	ptr -76h
var_72		= dword	ptr -72h
var_6E		= dword	ptr -6Eh
var_6A		= dword	ptr -6Ah
var_66		= dword	ptr -66h
var_62		= dword	ptr -62h
var_5E		= dword	ptr -5Eh
var_5A		= dword	ptr -5Ah
var_56		= dword	ptr -56h
var_52		= dword	ptr -52h
var_4E		= dword	ptr -4Eh
var_4A		= dword	ptr -4Ah
var_46		= dword	ptr -46h
var_42		= dword	ptr -42h
var_3E		= dword	ptr -3Eh
var_3A		= word ptr -3Ah
var_38		= dword	ptr -38h
var_34		= dword	ptr -34h
var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= word ptr -24h
var_22		= dword	ptr -22h
var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 186h
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+89h], 0
		jnz	short loc_82E01
		jmp	loc_83492
; ���������������������������������������������������������������������������

loc_82E01:				; CODE XREF: HUDSymbol_RenderWithClipTestD_82DEB+11j
		mov	eax, dword_70458
		sub	[si+0A9h], eax
		cmp	dword ptr [si+0A9h], 0
		jle	short loc_82E17
		mov	ax, 1
		jmp	short loc_82E19
; ���������������������������������������������������������������������������

loc_82E17:				; CODE XREF: HUDSymbol_RenderWithClipTestD_82DEB+25j
		xor	ax, ax

loc_82E19:				; CODE XREF: HUDSymbol_RenderWithClipTestD_82DEB+2Aj
		or	al, al
		jnz	short loc_82E20
		jmp	loc_83492
; ���������������������������������������������������������������������������

loc_82E20:				; CODE XREF: HUDSymbol_RenderWithClipTestD_82DEB+30j
		cmp	word ptr [si+8Bh], 0
		jnz	short loc_82E2A
		jmp	loc_832F3
; ���������������������������������������������������������������������������

loc_82E2A:				; CODE XREF: HUDSymbol_RenderWithClipTestD_82DEB+3Aj
		push	word ptr [si+8Bh]
		mov	bx, [si+8Bh]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		cmp	al, 6
		jz	short loc_82E3F
		jmp	loc_83250
; ���������������������������������������������������������������������������

loc_82E3F:				; CODE XREF: HUDSymbol_RenderWithClipTestD_82DEB+4Fj
		mov	di, si
		add	di, 99h	; '�'
		mov	eax, [di]
		mov	[bp+var_DE], eax
		mov	eax, [di+4]
		mov	[bp+var_DA], eax
		mov	eax, [di+8]
		mov	[bp+var_D6], eax
		mov	di, si
		add	di, 0ADh ; '�'
		mov	eax, [bp+var_DE]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_DE], eax
		mov	eax, [bp+var_DA]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_DA], eax
		mov	eax, [bp+var_D6]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_D6], eax
		push	word ptr [si+89h]
		mov	bx, [si+89h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	di, ax
		mov	eax, [di]
		mov	[bp+var_EA], eax
		mov	eax, [di+4]
		mov	[bp+var_E6], eax
		mov	eax, [di+8]
		mov	[bp+var_E2], eax
		lea	ax, [bp+var_10E]
		push	ax
		call	Formation_ComputeGeometryHelper_56D43
		pop	cx
		lea	ax, [bp+var_EA]
		push	ax

loc_82EE1:
		lea	ax, [bp+var_10E]
		push	ax
		call	UI_ApplyLineOfSightAndTransform_57DAE
		add	sp, 4
		lea	ax, [bp+var_10E]
		push	ax
		lea	ax, [bp+var_DE]
		push	ax
		call	Matrix_LocalToWorld_58828
		add	sp, 4
		lea	ax, [bp+var_DE]
		push	ax
		push	word ptr [si+8Bh]
		push	si
		call	Camera_ClipTestWrapper
		add	sp, 6
		mov	di, [si+8Bh]
		add	di, 12h
		mov	eax, [di]
		add	[bp+var_DE], eax
		mov	eax, [di+4]
		add	[bp+var_DA], eax
		mov	eax, [di+8]
		add	[bp+var_D6], eax
		mov	di, si
		add	di, 14h
		mov	eax, [bp+var_DE]
		sub	eax, [di]
		mov	[bp+var_126], eax
		mov	eax, [bp+var_DA]
		sub	eax, [di+4]
		mov	[bp+var_122], eax
		mov	eax, [bp+var_D6]
		sub	eax, [di+8]
		mov	[bp+var_11E], eax
		mov	eax, [bp+var_126]
		mov	[bp+var_11A], eax
		mov	eax, [bp+var_122]
		mov	[bp+var_116], eax
		mov	eax, [bp+var_11E]
		mov	[bp+var_112], eax
		push	eax
		push	large [bp+var_116]
		push	large [bp+var_11A]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_30], eax
		mov	[bp+var_34], eax
		mov	eax, [si+0B1h]
		cmp	eax, [bp+var_34]
		jge	short loc_82FAF
		mov	ax, 1
		jmp	short loc_82FB1
; ���������������������������������������������������������������������������

loc_82FAF:				; CODE XREF: HUDSymbol_RenderWithClipTestD_82DEB+1BDj
		xor	ax, ax

loc_82FB1:				; CODE XREF: HUDSymbol_RenderWithClipTestD_82DEB+1C2j
		or	al, al
		jz	short loc_83030
		mov	ax, si
		add	ax, 0B1h ; '�'
		push	ax
		lea	ax, [bp+var_11A]
		push	ax
		call	UI_ApplyLineOfSightCheck_55A9E
		add	sp, 4
		mov	eax, [bp+var_DE]
		sub	eax, [bp+var_11A]
		mov	[bp+var_132], eax
		mov	eax, [bp+var_DA]
		sub	eax, [bp+var_116]
		mov	[bp+var_12E], eax
		mov	eax, [bp+var_D6]
		sub	eax, [bp+var_112]
		mov	[bp+var_12A], eax
		mov	eax, [bp+var_132]
		mov	[bp+var_13E], eax
		mov	eax, [bp+var_12E]
		mov	[bp+var_13A], eax
		mov	eax, [bp+var_12A]
		mov	[bp+var_136], eax
		mov	eax, [bp+var_13E]
		mov	[si+14h], eax
		mov	eax, [bp+var_13A]
		mov	[si+18h], eax
		mov	eax, [bp+var_136]
		mov	[si+1Ch], eax
		jmp	short loc_830A7
; ���������������������������������������������������������������������������

loc_83030:				; CODE XREF: HUDSymbol_RenderWithClipTestD_82DEB+1C8j
		mov	[bp+var_38], 400h
		mov	eax, [bp+var_11A]
		mov	edx, eax
		mov	ecx, [bp+var_38]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_11A], eax
		mov	eax, [bp+var_116]
		mov	edx, eax
		mov	ecx, [bp+var_38]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_116], eax
		mov	eax, [bp+var_112]
		mov	edx, eax
		mov	ecx, [bp+var_38]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_112], eax
		mov	eax, [bp+var_11A]
		add	[si+14h], eax
		mov	eax, [bp+var_116]
		add	[si+18h], eax
		mov	eax, [bp+var_112]
		add	[si+1Ch], eax

loc_830A7:				; CODE XREF: HUDSymbol_RenderWithClipTestD_82DEB+243j
		mov	di, [si+8Bh]
		add	di, 12h
		mov	ax, si
		add	ax, 14h
		mov	[bp+var_3A], ax
		mov	eax, [di]
		mov	bx, [bp+var_3A]
		sub	eax, [bx]
		mov	[bp+var_156], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp+var_152], eax

loc_830D1:
		mov	eax, [di+8]

loc_830D5:
		sub	eax, [bx+8]

loc_830D9:
		mov	[bp+var_14E], eax

loc_830DE:
		mov	eax, [bp+var_156]

loc_830E3:
		mov	[bp+var_14A], eax
		mov	eax, [bp+var_152]
		mov	[bp+var_146], eax
		mov	eax, [bp+var_14E]
		mov	[bp+var_142], eax
		mov	di, si
		add	di, 2Ch	; ','
		push	eax
		push	large [bp+var_146]
		push	large [bp+var_14A]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_3E], eax
		mov	[bp+var_42], eax
		mov	eax, [di]
		mov	edx, [bp+var_42]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_46], eax
		mov	eax, [bp+var_46]
		mov	[bp+var_4A], eax
		mov	eax, [di+4]
		mov	edx, [bp+var_42]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4E], eax
		mov	eax, [bp+var_4E]
		mov	[bp+var_52], eax
		mov	eax, [di+8]
		mov	edx, [bp+var_42]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_56], eax
		mov	eax, [bp+var_56]
		mov	[bp+var_5A], eax
		mov	eax, [bp+var_4A]
		mov	[bp+var_16E], eax
		mov	eax, [bp+var_52]
		mov	[bp+var_16A], eax
		mov	eax, [bp+var_5A]
		mov	[bp+var_166], eax
		mov	eax, [bp+var_14A]
		mov	ebx, 0Ah
		cdq
		idiv	ebx
		mov	[bp+var_5E], eax
		mov	[bp+var_62], eax
		mov	eax, [bp+var_146]
		cdq
		idiv	ebx
		mov	[bp+var_66], eax
		mov	[bp+var_6A], eax
		mov	eax, [bp+var_142]
		cdq
		idiv	ebx
		mov	[bp+var_6E], eax
		mov	[bp+var_72], eax
		mov	eax, [bp+var_62]

loc_831CF:
		mov	[bp+var_17A], eax
		mov	eax, [bp+var_6A]
		mov	[bp+var_176], eax
		mov	eax, [bp+var_72]
		mov	[bp+var_172], eax
		mov	eax, [bp+var_16E]
		add	eax, [bp+var_17A]
		mov	[bp+var_186], eax
		mov	eax, [bp+var_16A]
		add	eax, [bp+var_176]
		mov	[bp+var_182], eax
		mov	eax, [bp+var_166]
		add	eax, [bp+var_172]
		mov	[bp+var_17E], eax
		mov	eax, [bp+var_186]
		mov	[bp+var_162], eax
		mov	eax, [bp+var_182]
		mov	[bp+var_15E], eax
		mov	eax, [bp+var_17E]
		mov	[bp+var_15A], eax
		lea	ax, [bp+var_162]
		push	ax
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	UI_ApplyLineOfSightAndTransform_57DAE
		add	sp, 4
		push	si
		call	Camera_ComputeViewMatrix
		pop	cx
		mov	al, 1
		jmp	loc_8349B
; ���������������������������������������������������������������������������

loc_83250:				; CODE XREF: HUDSymbol_RenderWithClipTestD_82DEB+51j
		mov	di, [si+8Bh]
		add	di, 12h
		mov	eax, [di]
		mov	[si+8Dh], eax
		mov	eax, [di+4]
		mov	[si+91h], eax
		mov	eax, [di+8]
		mov	[si+95h], eax
		mov	di, [si+8Bh]
		add	di, 12h
		mov	ax, si
		add	ax, 14h
		mov	[bp+var_2], ax
		mov	eax, [di]
		mov	bx, [bp+var_2]
		sub	eax, [bx]
		mov	[bp+var_8A], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp+var_86], eax
		mov	eax, [di+8]
		sub	eax, [bx+8]
		mov	[bp+var_82], eax
		mov	eax, [bp+var_8A]
		mov	[bp+var_96], eax
		mov	eax, [bp+var_86]
		mov	[bp+var_92], eax
		mov	eax, [bp+var_82]
		mov	[bp+var_8E], eax
		mov	eax, [bp+var_96]
		mov	[bp+var_7E], eax

loc_832CF:
		mov	eax, [bp+var_92]
		mov	[bp+var_7A], eax
		mov	eax, [bp+var_8E]
		mov	[bp+var_76], eax

loc_832E1:
		lea	ax, [bp+var_7E]

loc_832E4:
		push	ax
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	UI_ApplyLineOfSightAndTransform_57DAE
		add	sp, 4

loc_832F3:				; CODE XREF: HUDSymbol_RenderWithClipTestD_82DEB+3Cj
		mov	di, si
		add	di, 2Ch	; ','
		mov	eax, [si+0ADh]
		neg	eax
		mov	[bp+var_6], eax
		mov	[bp+var_A], eax
		mov	eax, [di]
		mov	edx, [bp+var_A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_E], eax
		mov	eax, [bp+var_E]
		mov	[bp+var_12], eax
		mov	eax, [di+4]
		mov	edx, [bp+var_A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_16], eax
		mov	eax, [bp+var_16]
		mov	[bp+var_1A], eax
		mov	eax, [di+8]
		mov	edx, [bp+var_A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_1E], eax
		mov	eax, [bp+var_1E]
		mov	[bp+var_22], eax
		mov	eax, [bp+var_12]
		mov	[bp+var_A2], eax
		mov	eax, [bp+var_1A]
		mov	[bp+var_9E], eax
		mov	eax, [bp+var_22]
		mov	[bp+var_9A], eax
		lea	ax, [bp+var_A2]
		push	ax
		sub	sp, 4
		mov	di, si
		add	di, 95h	; '�'
		mov	eax, [di]
		mov	[bp+var_190], eax
		push	si
		call	Camera_FrustumClipTest
		add	sp, 8
		mov	di, si
		add	di, 8Dh	; '�'
		mov	eax, [di]
		add	eax, [bp+var_A2]
		mov	[bp+var_AE], eax
		mov	eax, [di+4]
		add	eax, [bp+var_9E]
		mov	[bp+var_AA], eax
		mov	eax, [di+8]
		add	eax, [bp+var_9A]
		mov	[bp+var_A6], eax
		mov	eax, [bp+var_AE]
		mov	[bp+var_BA], eax
		mov	eax, [bp+var_AA]

loc_833D3:
		mov	[bp+var_B6], eax

loc_833D8:
		mov	eax, [bp+var_A6]

loc_833DD:
		mov	[bp+var_B2], eax

loc_833E2:
		mov	eax, [bp+var_BA]
		mov	[si+14h], eax
		mov	eax, [bp+var_B6]
		mov	[si+18h], eax
		mov	eax, [bp+var_B2]
		mov	[si+1Ch], eax
		mov	di, si
		add	di, 8Dh	; '�'
		mov	ax, si
		add	ax, 14h
		mov	[bp+var_24], ax
		mov	eax, [di]
		mov	bx, [bp+var_24]
		sub	eax, [bx]
		mov	[bp+var_D2], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp+var_CE], eax
		mov	eax, [di+8]
		sub	eax, [bx+8]
		mov	[bp+var_CA], eax
		mov	eax, [bp+var_D2]
		mov	[bp+var_C6], eax
		mov	eax, [bp+var_CE]
		mov	[bp+var_C2], eax
		mov	eax, [bp+var_CA]
		mov	[bp+var_BE], eax
		lea	ax, [bp+var_C6]
		push	ax
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	UI_ApplyLineOfSightAndTransform_57DAE
		add	sp, 4
		mov	eax, [si+0B5h]
		mov	edx, dword_70458
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_28], eax
		mov	eax, [bp+var_28]
		mov	[bp+var_2C], eax
		sub	[si+0ADh], eax
		push	si
		call	Camera_ComputeViewMatrix
		pop	cx
		mov	al, 1
		jmp	short loc_8349B
; ���������������������������������������������������������������������������

loc_83492:				; CODE XREF: HUDSymbol_RenderWithClipTestD_82DEB+13j
					; HUDSymbol_RenderWithClipTestD_82DEB+32j
		mov	al, [si+0B9h]
		mov	byte_72A8E, al
		mov	al, 0

loc_8349B:				; CODE XREF: HUDSymbol_RenderWithClipTestD_82DEB+462j
					; HUDSymbol_RenderWithClipTestD_82DEB+6A5j
		pop	di
		pop	si
		leave
		retf
HUDSymbol_RenderWithClipTestD_82DEB	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, thunk voisin uniquement (13 lignes).
; ==============================================================================================
HUDSymbol_Helper4_8349F	proc far		; CODE XREF: VROOMM_StubThunk_6AFCEJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		call	VROOMM_StubThunk_6BC26
		pop	cx
		pop	bp
		retf
HUDSymbol_Helper4_8349F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (11 lignes).
; ==============================================================================================
HUDSymbol_Helper5_834AE	proc far		; CODE XREF: VROOMM_StubThunk_6AFE2J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 7
		pop	bp
		retf
HUDSymbol_Helper5_834AE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, invalide une référence faible (WeakRef_InvalidateIfSet, 20 lignes).
; ==============================================================================================
HUDSymbol_ReleaseRefConditional_834B8	proc far		; CODE XREF: VROOMM_StubThunk_6AFD3J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	VROOMM_StubThunk_6B107
		pop	cx
		mov	ax, si
		add	ax, 8Bh	; '�'
		push	ax
		call	WeakRef_InvalidateIfSet
		pop	cx
		pop	si
		pop	bp
		retf
HUDSymbol_ReleaseRefConditional_834B8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 296 lignes, NON DÉTAILLÉE — combine SetReference16 (×2), longueur vectorielle,
; UI_ApplyLineOfSightAndTransform_57DAE.
; ==============================================================================================
HUDSymbol_ComputeTransformB_834D5	proc far		; CODE XREF: VROOMM_StubThunk_6AFDDJ

var_90		= dword	ptr -90h
var_8C		= dword	ptr -8Ch
var_88		= dword	ptr -88h
var_84		= dword	ptr -84h
var_80		= dword	ptr -80h
var_7C		= dword	ptr -7Ch
var_78		= dword	ptr -78h
var_74		= dword	ptr -74h
var_70		= dword	ptr -70h
var_6C		= dword	ptr -6Ch
var_68		= dword	ptr -68h
var_64		= dword	ptr -64h
var_60		= dword	ptr -60h
var_5C		= dword	ptr -5Ch
var_58		= dword	ptr -58h
var_54		= dword	ptr -54h
var_50		= dword	ptr -50h
var_4C		= dword	ptr -4Ch
var_48		= dword	ptr -48h
var_44		= dword	ptr -44h
var_40		= dword	ptr -40h
var_3C		= dword	ptr -3Ch
var_38		= dword	ptr -38h
var_34		= dword	ptr -34h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= word ptr -1Ch
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= word ptr -12h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 90h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		or	di, di
		jnz	short loc_834EB
		jmp	loc_837B7
; ���������������������������������������������������������������������������

loc_834EB:				; CODE XREF: HUDSymbol_ComputeTransformB_834D5+11j
		cmp	[bp+arg_2], 0
		jnz	short loc_834F4
		jmp	loc_837B7
; ���������������������������������������������������������������������������

loc_834F4:				; CODE XREF: HUDSymbol_ComputeTransformB_834D5+1Aj
		push	di
		mov	bx, [di]
		call	dword ptr [bx+38h]
		pop	cx
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0
		jnz	short loc_83507
		jmp	loc_837B7
; ���������������������������������������������������������������������������

loc_83507:				; CODE XREF: HUDSymbol_ComputeTransformB_834D5+2Dj
		mov	[bp+var_4], ax
		push	ax
		mov	ax, si
		add	ax, 89h	; '�'
		push	ax
		call	SetReference16
		add	sp, 4
		mov	ax, [bp+arg_2]
		mov	[bp+var_6], ax
		push	ax
		mov	ax, si
		add	ax, 8Bh	; '�'
		push	ax
		call	SetReference16
		add	sp, 4
		mov	ax, [si+8Bh]
		add	ax, 12h
		mov	[bp+var_8], ax
		mov	bx, [bp+var_8]
		mov	eax, [bx]
		mov	[si+8Dh], eax
		mov	eax, [bx+4]
		mov	[si+91h], eax
		mov	eax, [bx+8]
		mov	[si+95h], eax
		mov	eax, [si+0A5h]
		mov	[si+0A9h], eax
		mov	bx, [si+8Bh]
		mov	eax, [bx+20h]
		mov	[si+0ADh], eax
		cmp	dword ptr [si+0ADh], 0FA00h
		jge	short loc_8357C
		mov	ax, 1
		jmp	short loc_8357E
; ���������������������������������������������������������������������������

loc_8357C:				; CODE XREF: HUDSymbol_ComputeTransformB_834D5+A0j
		xor	ax, ax

loc_8357E:				; CODE XREF: HUDSymbol_ComputeTransformB_834D5+A5j
		or	al, al
		jz	short loc_83590
		mov	eax, [si+0ADh]
		shl	eax, 2
		mov	[si+0ADh], eax

loc_83590:				; CODE XREF: HUDSymbol_ComputeTransformB_834D5+ABj
		mov	eax, [si+0ADh]
		shl	eax, 1
		mov	[bp+var_C], eax
		mov	[bp+var_10], eax
		mov	[si+0B1h], eax
		mov	ax, si
		add	ax, 0ADh ; '�'
		mov	[bp+var_12], ax
		mov	eax, [si+0B1h]
		mov	bx, [bp+var_12]
		sub	eax, [bx]
		mov	[bp+var_16], eax
		mov	[bp+var_1A], eax
		mov	ax, si
		add	ax, 0A5h ; '�'
		mov	[bp+var_1C], ax
		mov	eax, [bp+var_1A]
		mov	edx, eax
		mov	bx, [bp+var_1C]
		mov	ecx, [bx]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx

loc_835E0:
		mov	[bp+var_20], eax
		mov	eax, [bp+var_20]
		mov	[bp+var_24], eax
		mov	[si+0B5h], eax
		push	di
		push	ss
		lea	ax, [bp+var_6C]
		push	ax
		mov	bx, [di]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		mov	eax, [bp+var_6C]
		mov	[bp+var_60], eax
		mov	eax, [bp+var_68]
		mov	[bp+var_5C], eax
		mov	eax, [bp+var_64]
		mov	[bp+var_58], eax
		push	eax
		push	large [bp+var_5C]
		push	large [bp+var_60]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_28], eax
		mov	[bp+var_2C], eax
		cmp	[bp+var_2C], 80h ; '�'
		jg	short loc_836A6
		mov	di, [si+8Bh]
		add	di, 12h
		mov	ax, [bp+var_2]
		add	ax, 12h
		mov	[bp+var_2E], ax
		mov	eax, [di]
		mov	bx, [bp+var_2E]
		sub	eax, [bx]
		mov	[bp+var_78], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp+var_74], eax
		mov	eax, [di+8]
		sub	eax, [bx+8]
		mov	[bp+var_70], eax
		mov	eax, [bp+var_78]
		mov	[bp+var_84], eax
		mov	eax, [bp+var_74]
		mov	[bp+var_80], eax
		mov	eax, [bp+var_70]
		mov	[bp+var_7C], eax
		mov	eax, [bp+var_84]
		mov	[bp+var_60], eax
		mov	eax, [bp+var_80]
		mov	[bp+var_5C], eax
		mov	eax, [bp+var_7C]
		mov	[bp+var_58], eax

loc_836A6:				; CODE XREF: HUDSymbol_ComputeTransformB_834D5+168j
		lea	ax, [bp+var_60]
		push	ax
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	UI_ApplyLineOfSightAndTransform_57DAE
		add	sp, 4
		mov	di, [si+8Bh]
		add	di, 12h
		mov	eax, [di]
		mov	[si+14h], eax
		mov	eax, [di+4]
		mov	[si+18h], eax
		mov	eax, [di+8]

loc_836D2:
		mov	[si+1Ch], eax
		mov	di, si
		add	di, 2Ch	; ','
		mov	ax, si
		add	ax, 0B1h ; '�'
		mov	[bp+var_30], ax
		mov	eax, [di]
		mov	bx, [bp+var_30]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_34], eax
		mov	eax, [bp+var_34]
		mov	[bp+var_38], eax
		mov	eax, [di+4]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_3C]
		mov	[bp+var_40], eax
		mov	eax, [di+8]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_44], eax
		mov	eax, [bp+var_44]
		mov	[bp+var_48], eax
		mov	eax, [bp+var_38]
		mov	[bp+var_90], eax
		mov	eax, [bp+var_40]
		mov	[bp+var_8C], eax
		mov	eax, [bp+var_48]
		mov	[bp+var_88], eax
		mov	eax, [bp+var_90]
		sub	[si+14h], eax
		mov	eax, [bp+var_8C]
		sub	[si+18h], eax
		mov	eax, [bp+var_88]
		sub	[si+1Ch], eax
		push	word ptr [si+8Bh]
		mov	bx, [si+8Bh]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		cmp	al, 6
		jnz	short loc_837A6
		mov	eax, [si+0A9h]
		shl	eax, 1
		mov	[bp+var_4C], eax
		mov	[bp+var_50], eax
		mov	[si+0A9h], eax
		mov	[bp+var_54], 0
		mov	eax, [bp+var_54]
		mov	[si+0B5h], eax
		jmp	short loc_837B0
; ���������������������������������������������������������������������������

loc_837A6:				; CODE XREF: HUDSymbol_ComputeTransformB_834D5+2A7j
		mov	eax, [si+0B1h]
		mov	[si+0ADh], eax

loc_837B0:				; CODE XREF: HUDSymbol_ComputeTransformB_834D5+2CFj
		mov	al, [bp+arg_6]
		mov	[si+0B9h], al

loc_837B7:				; CODE XREF: HUDSymbol_ComputeTransformB_834D5+13j
					; HUDSymbol_ComputeTransformB_834D5+1Cj ...
		pop	di
		pop	si
		leave
		retf
HUDSymbol_ComputeTransformB_834D5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, même motif que HUDSymbol_ConstructVariantA_804F0.
; ==============================================================================================
HUDSymbol_ConstructVariantD_837BB	proc far		; CODE XREF: VROOMM_StubThunk_6AFE7J

var_52		= word ptr -52h
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 52h
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_837D8
		push	0ADh ; '�'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_837D4:
		or	ax, ax
		jz	short loc_83838

loc_837D8:				; CODE XREF: HUDSymbol_ConstructVariantD_837BB+Cj
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	Formation_ComputeGeometryHelper_56D43
		pop	cx
		mov	word ptr [si+50h], 484h
		mov	ax, si
		add	ax, 53h	; 'S'
		push	ax
		call	String_ConstructEmpty
		pop	cx
		push	si
		call	VROOMM_StubThunk_6BC0D
		pop	cx
		mov	word ptr [si+50h], 67Eh
		mov	ax, si
		add	ax, 80h	; '�'
		push	ax
		call	String_ConstructEmpty
		pop	cx
		mov	word ptr [si+89h], 0
		mov	word ptr [si+50h], 6F3h
		push	large 52h ; 'R'
		push	ss
		lea	ax, [bp+var_52]
		push	ax
		push	[bp+arg_2]
		call	ResourceRecord_ReadFieldGroupA_64A19
		add	sp, 0Ah
		lea	ax, [bp+var_52]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr HUDSymbol_ConstructAndInitAngleC_838BF
		add	sp, 4

loc_83838:				; CODE XREF: HUDSymbol_ConstructVariantD_837BB+1Bj
		mov	ax, si
		pop	si
		leave
		retf
HUDSymbol_ConstructVariantD_837BB	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, même motif que HUDSymbol_ConstructVariantA_804F0.
; ==============================================================================================
HUDSymbol_ConstructVariantE_8383D	proc far		; CODE XREF: VROOMM_StubThunk_6AFF1J

var_52		= word ptr -52h
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 52h
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_8385A
		push	0ADh ; '�'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_838BA

loc_8385A:				; CODE XREF: HUDSymbol_ConstructVariantE_8383D+Cj
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	Formation_ComputeGeometryHelper_56D43
		pop	cx
		mov	word ptr [si+50h], 484h
		mov	ax, si
		add	ax, 53h	; 'S'
		push	ax
		call	String_ConstructEmpty
		pop	cx
		push	si
		call	VROOMM_StubThunk_6BC0D
		pop	cx
		mov	word ptr [si+50h], 67Eh
		mov	ax, si
		add	ax, 80h	; '�'
		push	ax
		call	String_ConstructEmpty
		pop	cx
		mov	word ptr [si+89h], 0
		mov	word ptr [si+50h], 6F3h
		push	52h ; 'R'
		push	large [bp+arg_2]
		push	ss
		lea	ax, [bp+var_52]
		push	ax
		call	CRT_MemFamily_Extra1
		add	sp, 0Ah
		lea	ax, [bp+var_52]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr HUDSymbol_ConstructAndInitAngleC_838BF
		add	sp, 4

loc_838BA:				; CODE XREF: HUDSymbol_ConstructVariantE_8383D+1Bj
		mov	ax, si
		pop	si
		leave
		retf
HUDSymbol_ConstructVariantE_8383D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine allocation, copie de chaîne, Utility_Helper_55E11 (seg116).
; ==============================================================================================
HUDSymbol_ConstructAndInitAngleC_838BF	proc far		; CODE XREF: VROOMM_StubThunk_6AFECJ HUDSymbol_ConstructVariantD_837BB+77p	...

var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_F		= byte ptr -0Fh
var_E		= word ptr -0Eh
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
		sub	sp, 10h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [di+4Ah]
		mov	[bp+var_2], ax
		mov	ax, [di+4Ch]
		mov	[bp+var_4], ax
		mov	ax, [di+4Eh]
		mov	[bp+var_6], ax
		mov	ax, [di+50h]
		mov	[bp+var_8], ax
		push	1Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp+var_A], ax
		or	ax, ax
		jz	short loc_83931
		mov	bx, [bp+var_A]
		mov	word ptr [bx], 44Ch
		mov	word ptr [bx+2], 0
		mov	word ptr [bx+4], 0
		mov	byte ptr [bx+0Fh], 0
		mov	word ptr [bx+10h], 0
		mov	word ptr [bx+12h], 0
		mov	byte ptr [bx+1Dh], 0
		push	[bp+var_8]
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		push	ax
		call	VROOMM_StubThunk_6BBE0
		add	sp, 0Ah
		mov	ax, [bp+var_A]
		jmp	short loc_83934
; ���������������������������������������������������������������������������

loc_83931:				; CODE XREF: HUDSymbol_ConstructAndInitAngleC_838BF+33j
		mov	ax, [bp+var_A]

loc_83934:				; CODE XREF: HUDSymbol_ConstructAndInitAngleC_838BF+70j
		mov	[si+5Ch], ax
		sub	sp, 4
		mov	ax, di
		add	ax, 46h	; 'F'
		mov	[bp+var_C], ax
		mov	bx, [bp+var_C]
		mov	eax, [bx]
		mov	[bp+var_18], eax
		sub	sp, 4
		mov	ax, [di+44h]
		mov	[bp+var_E], ax
		movsx	eax, [bp+var_E]
		shl	eax, 8
		mov	[bp+var_1C], eax
		push	large dword ptr	[di+40h]
		mov	ax, di
		add	ax, 16h
		push	ax
		push	word ptr [si+5Ch]
		push	si
		call	VROOMM_StubThunk_6B0EE
		add	sp, 12h
		push	large dword ptr	[di+12h]
		push	large dword ptr	[di+0Eh]
		push	large dword ptr	[di+0Ah]
		mov	ax, si
		add	ax, 14h
		push	ax
		call	Utility_Helper_55E11
		add	sp, 0Eh
		mov	al, [di+8]
		mov	[bp+var_F], al
		and	ax, 1
		and	byte ptr [si+52h], 0FDh
		shl	al, 1
		or	[si+52h], al
		mov	ax, [di+1Eh]
		mov	[si+8Bh], ax
		push	20h ; ' '
		mov	ax, di
		add	ax, 20h	; ' '
		push	ax
		mov	ax, si
		add	ax, 8Dh	; '�'
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	byte ptr [si+0ACh], 0
		pop	di
		pop	si
		leave
		retf
HUDSymbol_ConstructAndInitAngleC_838BF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine une opération de conteneur, SetReference16, Matrix_BuildFromAngle_56D72
; (seg116).
; ==============================================================================================
HUDSymbol_ConstructWithMatrix_839CA	proc far		; CODE XREF: VROOMM_StubThunk_6AFF6J

var_C		= dword	ptr -0Ch
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	si, [bp+arg_0]
		mov	ax, si
		add	ax, 80h	; '�'
		mov	[bp+var_2], ds
		mov	[bp+var_4], ax
		push	[bp+var_2]
		push	ax
		push	59C3h
		call	Container_Op_2241B
		add	sp, 6
		mov	[bp+var_6], ax
		push	ax
		mov	ax, si
		add	ax, 89h	; '�'
		push	ax
		call	SetReference16
		add	sp, 4
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	Matrix_BuildFromAngle_56D72
		pop	cx
		sub	sp, 4
		mov	[bp+var_C], 200h
		push	ds
		mov	ax, si
		add	ax, 8Dh	; '�'
		push	ax
		push	ds
		push	offset word_72A94
		call	VROOMM_StubThunk_6AEF3
		add	sp, 0Ch
		cmp	word ptr [si+5Ch], 0
		jz	short loc_83A39
		push	si
		call	VROOMM_StubThunk_6BC26
		pop	cx
		jmp	short loc_83A3F
; ���������������������������������������������������������������������������

loc_83A39:				; CODE XREF: HUDSymbol_ConstructWithMatrix_839CA+64j
		mov	al, [si+52h]
		and	ax, 1

loc_83A3F:				; CODE XREF: HUDSymbol_ConstructWithMatrix_839CA+6Dj
		pop	si
		leave
		retf
HUDSymbol_ConstructWithMatrix_839CA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 140 lignes, NON DÉTAILLÉE — combine longueur vectorielle,
; UI_ApplyLineOfSightAndTransform_57DAE, Camera_ComputeViewMatrix,
; Missile_ComputeDirectionVector2D_556D4 (×2, seg116) — probable affichage d'un vecteur de
; direction de missile sur le HUD.
; ==============================================================================================
HUDSymbol_RenderMissileDirection_83A42	proc far		; CODE XREF: VROOMM_StubThunk_6AFFBJ

var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_2A		= dword	ptr -2Ah
var_26		= dword	ptr -26h
var_22		= dword	ptr -22h
var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= word ptr -0Eh
var_C		= dword	ptr -0Ch
var_8		= word ptr -8
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 32h
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+89h], 0
		jnz	short loc_83A57
		jmp	loc_83AF0
; ���������������������������������������������������������������������������

loc_83A57:				; CODE XREF: HUDSymbol_RenderMissileDirection_83A42+10j
		mov	di, [si+89h]
		add	di, 12h
		mov	dx, si
		add	dx, 14h
		mov	eax, [di]
		mov	bx, dx
		sub	eax, [bx]
		mov	[bp+var_32], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp+var_2E], eax
		mov	eax, [di+8]
		sub	eax, [bx+8]
		mov	[bp+var_2A], eax
		mov	eax, [bp+var_32]
		mov	[bp+var_26], eax
		mov	eax, [bp+var_2E]
		mov	[bp+var_22], eax
		mov	eax, [bp+var_2A]
		mov	[bp+var_1E], eax
		push	eax
		push	large [bp+var_22]
		push	large [bp+var_26]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_16], eax
		mov	[bp+var_1A], eax
		cmp	[bp+var_1A], 3E800h
		jge	short loc_83ACC
		mov	ax, 1
		jmp	short loc_83ACE
; ���������������������������������������������������������������������������

loc_83ACC:				; CODE XREF: HUDSymbol_RenderMissileDirection_83A42+83j
		xor	ax, ax

loc_83ACE:				; CODE XREF: HUDSymbol_RenderMissileDirection_83A42+88j
		or	al, al
		jz	short loc_83AF0
		lea	ax, [bp+var_26]
		push	ax
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	UI_ApplyLineOfSightAndTransform_57DAE
		add	sp, 4
		push	si
		call	Camera_ComputeViewMatrix
		pop	cx
		mov	al, 1
		jmp	loc_83B77
; ���������������������������������������������������������������������������

loc_83AF0:				; CODE XREF: HUDSymbol_RenderMissileDirection_83A42+12j
					; HUDSymbol_RenderMissileDirection_83A42+8Ej
		mov	ax, [si+8Bh]
		mov	[bp+var_2], ax
		movsx	eax, [bp+var_2]
		shl	eax, 8
		mov	[bp+var_6], eax
		lea	ax, [bp+var_6]
		push	ax
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	Missile_ComputeDirectionVector2D_556D4
		add	sp, 4
		mov	ax, [si+8Bh]
		mov	[bp+var_8], ax
		movsx	eax, [bp+var_8]
		shl	eax, 8
		mov	[bp+var_C], eax
		lea	ax, [bp+var_C]
		push	ax
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	Missile_ComputeDirectionVector2D_556D4
		add	sp, 4
		mov	ax, [si+8Bh]
		mov	[bp+var_E], ax
		movsx	eax, [bp+var_E]
		shl	eax, 8
		mov	[bp+var_12], eax
		lea	ax, [bp+var_12]
		push	ax
		mov	ax, si
		add	ax, 38h	; '8'
		push	ax
		call	Missile_ComputeDirectionVector2D_556D4
		add	sp, 4
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	Matrix_OrthonormalizeKeepRow1_57660
		pop	cx
		push	si
		call	Camera_ComputeViewMatrix
		pop	cx
		mov	al, 1

loc_83B77:				; CODE XREF: HUDSymbol_RenderMissileDirection_83A42+ABj
		pop	di
		pop	si
		leave
		retf
HUDSymbol_RenderMissileDirection_83A42	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (11 lignes).
; ==============================================================================================
HUDSymbol_Helper6_83B7B	proc far		; CODE XREF: VROOMM_StubThunk_6B000J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 6
		pop	bp
		retf
HUDSymbol_Helper6_83B7B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle UIScreen_RenderGraphVGA_509EE (seg113).
; ==============================================================================================
HUDSymbol_RenderGraphWrapper_83B85	proc far		; CODE XREF: VROOMM_StubThunk_6B005J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	UIScreen_RenderGraphVGA_509EE
		pop	cx
		cmp	word ptr [si+89h], 0
		jz	short loc_83BAE
		mov	bx, [si+89h]
		cmp	byte ptr [bx+5], 0
		jz	short loc_83BAE
		push	si
		push	bx
		mov	bx, [bx]
		call	dword ptr [bx+1Ch]
		add	sp, 4

loc_83BAE:				; CODE XREF: HUDSymbol_RenderGraphWrapper_83B85+13j
					; HUDSymbol_RenderGraphWrapper_83B85+1Dj
		pop	si
		pop	bp
		retf
HUDSymbol_RenderGraphWrapper_83B85	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, même motif que HUDSymbol_ConstructVariantA_804F0.
; ==============================================================================================
HUDSymbol_ConstructVariantF_83BB1	proc far		; CODE XREF: VROOMM_StubThunk_6B00FJ

var_24		= word ptr -24h
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 24h
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_83BCE
		push	9Eh ; '�'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_83C48

loc_83BCE:				; CODE XREF: HUDSymbol_ConstructVariantF_83BB1+Cj
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	Formation_ComputeGeometryHelper_56D43
		pop	cx
		mov	word ptr [si+50h], 484h
		mov	ax, si
		add	ax, 53h	; 'S'
		push	ax
		call	String_ConstructEmpty
		pop	cx
		push	si
		call	VROOMM_StubThunk_6BC0D
		pop	cx
		mov	word ptr [si+50h], 67Eh
		mov	ax, si
		add	ax, 80h	; '�'
		push	ax
		call	String_ConstructEmpty
		pop	cx
		mov	word ptr [si+89h], 0
		mov	word ptr [si+50h], 6A2h
		mov	ax, si
		add	ax, 8Ch	; '�'
		mov	ax, si
		add	ax, 90h	; '�'
		mov	ax, si
		add	ax, 94h	; '�'
		mov	word ptr [si+98h], 0
		mov	ax, si
		add	ax, 9Ah	; '�'
		push	large 24h ; '$'
		push	ss
		lea	ax, [bp+var_24]
		push	ax
		push	[bp+arg_2]
		call	ResourceRecord_ReadFieldGroupA_64A19
		add	sp, 0Ah
		lea	ax, [bp+var_24]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr HUDSymbol_ConstructAndInitAngleD_83CE9
		add	sp, 4

loc_83C48:				; CODE XREF: HUDSymbol_ConstructVariantF_83BB1+1Bj
		mov	ax, si
		pop	si
		leave
		retf
HUDSymbol_ConstructVariantF_83BB1	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, même motif que HUDSymbol_ConstructVariantA_804F0.
; ==============================================================================================
HUDSymbol_ConstructVariantG_83C4D	proc far		; CODE XREF: VROOMM_StubThunk_6B019J

var_24		= word ptr -24h
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 24h

loc_83C53:
		push	si

loc_83C54:
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_83C6A

loc_83C5B:
		push	9Eh ; '�'

loc_83C5E:
		call	CRT_Malloc16_Retry
		pop	cx

loc_83C64:
		mov	si, ax

loc_83C66:
		or	ax, ax
		jz	short loc_83CE4

loc_83C6A:				; CODE XREF: HUDSymbol_ConstructVariantG_83C4D+Cj
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	Formation_ComputeGeometryHelper_56D43
		pop	cx
		mov	word ptr [si+50h], 484h
		mov	ax, si
		add	ax, 53h	; 'S'
		push	ax
		call	String_ConstructEmpty
		pop	cx
		push	si
		call	VROOMM_StubThunk_6BC0D
		pop	cx
		mov	word ptr [si+50h], 67Eh
		mov	ax, si
		add	ax, 80h	; '�'
		push	ax
		call	String_ConstructEmpty
		pop	cx
		mov	word ptr [si+89h], 0
		mov	word ptr [si+50h], 6A2h
		mov	ax, si
		add	ax, 8Ch	; '�'
		mov	ax, si
		add	ax, 90h	; '�'
		mov	ax, si
		add	ax, 94h	; '�'
		mov	word ptr [si+98h], 0
		mov	ax, si
		add	ax, 9Ah	; '�'
		push	24h ; '$'
		push	large [bp+arg_2]
		push	ss
		lea	ax, [bp+var_24]
		push	ax
		call	CRT_MemFamily_Extra1
		add	sp, 0Ah
		lea	ax, [bp+var_24]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr HUDSymbol_ConstructAndInitAngleD_83CE9
		add	sp, 4

loc_83CE4:				; CODE XREF: HUDSymbol_ConstructVariantG_83C4D+1Bj
		mov	ax, si
		pop	si
		leave
		retf
HUDSymbol_ConstructVariantG_83C4D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, même motif que HUDSymbol_ConstructAndInitAngle_80701.
; ==============================================================================================
HUDSymbol_ConstructAndInitAngleD_83CE9	proc far		; CODE XREF: VROOMM_StubThunk_6B014J HUDSymbol_ConstructVariantF_83BB1+91p	...

var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_11		= byte ptr -11h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
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
		sub	sp, 12h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [di+1Ch]
		mov	[bp+var_2], ax
		mov	ax, [di+1Eh]
		mov	[bp+var_4], ax
		mov	ax, [di+20h]
		mov	[bp+var_6], ax
		mov	ax, [di+22h]
		mov	[bp+var_8], ax
		push	1Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp+var_A], ax
		or	ax, ax
		jz	short loc_83D5B
		mov	bx, [bp+var_A]
		mov	word ptr [bx], 44Ch
		mov	word ptr [bx+2], 0
		mov	word ptr [bx+4], 0
		mov	byte ptr [bx+0Fh], 0
		mov	word ptr [bx+10h], 0
		mov	word ptr [bx+12h], 0
		mov	byte ptr [bx+1Dh], 0
		push	[bp+var_8]
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		push	ax
		call	VROOMM_StubThunk_6BBE0
		add	sp, 0Ah

loc_83D56:
		mov	ax, [bp+var_A]
		jmp	short loc_83D5E
; ���������������������������������������������������������������������������

loc_83D5B:				; CODE XREF: HUDSymbol_ConstructAndInitAngleD_83CE9+33j
		mov	ax, [bp+var_A]

loc_83D5E:				; CODE XREF: HUDSymbol_ConstructAndInitAngleD_83CE9+70j
		mov	[si+5Ch], ax
		sub	sp, 4
		mov	ax, di
		add	ax, 18h
		mov	[bp+var_C], ax
		mov	bx, [bp+var_C]
		mov	eax, [bx]
		mov	[bp+var_1A], eax
		sub	sp, 4
		mov	ax, [di+16h]
		mov	[bp+var_E], ax
		movsx	eax, [bp+var_E]
		shl	eax, 8
		mov	[bp+var_1E], eax
		push	large dword ptr	[di+12h]
		mov	ax, di
		add	ax, 0Ah
		push	ax
		push	word ptr [si+5Ch]
		push	si
		call	VROOMM_StubThunk_6B0EE
		add	sp, 12h
		mov	[bp+var_10], di
		push	8
		push	[bp+var_10]
		mov	ax, si
		add	ax, 53h	; 'S'
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	byte ptr [si+5Bh], 0
		mov	al, [di+8]
		mov	[bp+var_11], al
		and	ax, 1
		and	byte ptr [si+52h], 0FDh
		shl	al, 1
		or	[si+52h], al
		mov	byte ptr [si+8Bh], 1
		pop	di
		pop	si
		leave
		retf
HUDSymbol_ConstructAndInitAngleD_83CE9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 189 lignes, NON DÉTAILLÉE — combine SetReference16, Matrix_BuildFromAngle_56D72,
; Matrix_BuildAxisZ_572BC, Matrix_BuildAxisX_56EC3, Matrix_OrthonormalizeKeepRow1_57660
; (seg116) — construction de matrice d'orientation complète pour un symbole HUD.
; ==============================================================================================
HUDSymbol_ConstructWithFullMatrix_83DD7	proc far		; CODE XREF: VROOMM_StubThunk_6B02DJ HUDSymbol_Helper7_84337+59p	...

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
var_26		= word ptr -26h
var_24		= dword	ptr -24h
var_20		= word ptr -20h
var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 4Eh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		push	ax
		mov	ax, si
		add	ax, 89h	; '�'
		push	ax
		call	SetReference16
		add	sp, 4
		mov	bx, [si+89h]
		mov	eax, [bx+20h]
		mov	[si+94h], eax
		cmp	dword ptr [si+94h], 0FA00h
		jge	short loc_83E14
		mov	ax, 1
		jmp	short loc_83E16
; ���������������������������������������������������������������������������

loc_83E14:				; CODE XREF: HUDSymbol_ConstructWithFullMatrix_83DD7+36j
		xor	ax, ax

loc_83E16:				; CODE XREF: HUDSymbol_ConstructWithFullMatrix_83DD7+3Bj
		or	al, al
		jz	short loc_83E64
		mov	[bp+var_6], 180h
		mov	eax, [si+94h]
		mov	edx, [bp+var_6]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+94h], eax
		mov	eax, [si+94h]
		shl	eax, 1
		mov	[bp+var_A], eax
		mov	[bp+var_E], eax
		mov	[si+8Ch], eax
		mov	eax, [si+8Ch]

loc_83E52:
		shl	eax, 1
		mov	[bp+var_12], eax

loc_83E59:
		mov	[bp+var_16], eax
		mov	[si+90h], eax
		jmp	short loc_83E83
; ���������������������������������������������������������������������������

loc_83E64:				; CODE XREF: HUDSymbol_ConstructWithFullMatrix_83DD7+41j
		mov	eax, [si+94h]
		mov	[si+8Ch], eax
		mov	eax, [si+8Ch]
		shl	eax, 1
		mov	[bp+var_1A], eax
		mov	[bp+var_1E], eax
		mov	[si+90h], eax

loc_83E83:				; CODE XREF: HUDSymbol_ConstructWithFullMatrix_83DD7+8Bj
		mov	ax, [bp+arg_4]
		mov	[bp+var_20], ax
		movsx	eax, [bp+var_20]
		shl	eax, 8
		mov	[bp+var_24], eax
		mov	eax, [bp+var_24]
		mov	dword_6D777, eax
		mov	ax, [bp+arg_6]
		mov	[bp+var_26], ax
		movsx	eax, [bp+var_26]
		shl	eax, 8
		mov	[bp+var_2A], eax
		mov	eax, [bp+var_2A]
		mov	dword_6D77B, eax
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	Matrix_BuildFromAngle_56D72
		pop	cx
		push	6CBh
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	Matrix_BuildAxisZ_572BC
		add	sp, 4
		push	6C7h
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	Matrix_BuildAxisX_56EC3
		add	sp, 4
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	Matrix_OrthonormalizeKeepRow1_57660
		pop	cx
		mov	eax, [si+2Ch]
		neg	eax
		mov	[bp+var_42], eax
		mov	eax, [si+30h]
		neg	eax
		mov	[bp+var_3E], eax
		mov	eax, [si+34h]
		neg	eax
		mov	[bp+var_3A], eax
		mov	eax, [bp+var_42]
		mov	[bp+var_4E], eax
		mov	eax, [bp+var_3E]
		mov	[bp+var_4A], eax
		mov	eax, [bp+var_3A]
		mov	[bp+var_46], eax
		mov	eax, [bp+var_4E]
		mov	[bp+var_36], eax
		mov	eax, [bp+var_4A]
		mov	[bp+var_32], eax
		mov	eax, [bp+var_46]
		mov	[bp+var_2E], eax
		mov	di, si
		add	di, 8Ch	; '�'
		mov	eax, [bp+var_36]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8

loc_83F59:
		mov	[bp+var_36], eax
		mov	eax, [bp+var_32]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_32], eax
		mov	eax, [bp+var_2E]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_2E], eax
		mov	di, [si+89h]
		add	di, 12h
		mov	eax, [di]
		add	[bp+var_36], eax
		mov	eax, [di+4]
		add	[bp+var_32], eax
		mov	eax, [di+8]
		add	[bp+var_2E], eax
		mov	eax, [bp+var_36]
		mov	[si+14h], eax
		mov	eax, [bp+var_32]
		mov	[si+18h], eax
		mov	eax, [bp+var_2E]
		mov	[si+1Ch], eax
		push	si
		call	Camera_DetachParent
		pop	cx
		mov	byte ptr [si+8Bh], 1
		pop	di
		pop	si
		leave
		retf
HUDSymbol_ConstructWithFullMatrix_83DD7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 207 lignes, NON DÉTAILLÉE — combine SetReference16 (×2),
; Math_VectorLength3D_Scaled_54F57, Math_ElevationAngle_552E1, Math_HeadingAngle_553CF
; (seg116) — affichage HUD d'angle d'approche.
; ==============================================================================================
HUDSymbol_ComputeApproachDisplay_83FC9	proc far		; CODE XREF: VROOMM_StubThunk_6B032J

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
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 50h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_2], di
		push	[bp+var_2]
		mov	ax, si
		add	ax, 89h	; '�'
		push	ax
		call	SetReference16
		add	sp, 4
		mov	[bp+var_4], di
		push	[bp+var_4]
		mov	ax, si
		add	ax, 98h	; '�'
		push	ax
		call	SetReference16
		add	sp, 4
		mov	bx, [si+89h]
		mov	eax, [bx+20h]
		mov	[si+94h], eax
		cmp	dword ptr [si+94h], 0FA00h
		jge	short loc_8401C
		mov	ax, 1
		jmp	short loc_8401E
; ���������������������������������������������������������������������������

loc_8401C:				; CODE XREF: HUDSymbol_ComputeApproachDisplay_83FC9+4Cj
		xor	ax, ax

loc_8401E:				; CODE XREF: HUDSymbol_ComputeApproachDisplay_83FC9+51j
		or	al, al
		jz	short loc_84058
		mov	[bp+var_8], 180h
		mov	eax, [si+94h]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+94h], eax
		mov	eax, [si+94h]
		shl	eax, 2
		mov	[bp+var_C], eax
		mov	[bp+var_10], eax

loc_84051:
		mov	[si+90h], eax
		jmp	short loc_8406D
; ���������������������������������������������������������������������������

loc_84058:				; CODE XREF: HUDSymbol_ComputeApproachDisplay_83FC9+57j
		mov	eax, [si+94h]
		shl	eax, 1

loc_84060:
		mov	[bp+var_14], eax

loc_84064:
		mov	[bp+var_18], eax
		mov	[si+90h], eax

loc_8406D:				; CODE XREF: HUDSymbol_ComputeApproachDisplay_83FC9+8Dj
		add	di, 12h
		mov	cx, [bp+arg_4]
		mov	eax, [di]
		mov	bx, cx
		sub	eax, [bx]
		mov	[bp+var_50], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp+var_4C], eax
		mov	eax, [di+8]
		sub	eax, [bx+8]
		mov	[bp+var_48], eax
		mov	eax, [bp+var_50]
		mov	[bp+var_44], eax
		mov	eax, [bp+var_4C]
		mov	[bp+var_40], eax
		mov	eax, [bp+var_48]
		mov	[bp+var_3C], eax
		lea	ax, [bp+var_44]
		push	ax
		push	ss
		lea	ax, [bp+var_1C]
		push	ax
		call	Math_VectorLength3D_Scaled_54F57
		add	sp, 6
		mov	eax, [bp+var_1C]
		mov	[si+8Ch], eax
		mov	di, si
		add	di, 90h	; '�'
		mov	eax, [di]
		mov	[bp+var_20], eax
		mov	di, si
		add	di, 94h	; '�'
		mov	eax, [di]
		mov	[bp+var_24], eax
		mov	di, si
		add	di, 8Ch	; '�'
		mov	eax, [di]
		mov	[bp+var_28], eax
		mov	eax, [bp+var_24]
		cmp	eax, [bp+var_28]
		jle	short loc_840FF
		mov	ax, 1
		jmp	short loc_84101
; ���������������������������������������������������������������������������

loc_840FF:				; CODE XREF: HUDSymbol_ComputeApproachDisplay_83FC9+12Fj
		xor	ax, ax

loc_84101:				; CODE XREF: HUDSymbol_ComputeApproachDisplay_83FC9+134j
		or	al, al
		jz	short loc_8410A
		lea	ax, [bp+var_24]
		jmp	short loc_8410D
; ���������������������������������������������������������������������������

loc_8410A:				; CODE XREF: HUDSymbol_ComputeApproachDisplay_83FC9+13Aj
		lea	ax, [bp+var_28]

loc_8410D:				; CODE XREF: HUDSymbol_ComputeApproachDisplay_83FC9+13Fj
		mov	di, ax
		mov	eax, [di]
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_20]
		cmp	eax, [bp+var_2C]
		jge	short loc_84125
		mov	ax, 1
		jmp	short loc_84127
; ���������������������������������������������������������������������������

loc_84125:				; CODE XREF: HUDSymbol_ComputeApproachDisplay_83FC9+155j
		xor	ax, ax

loc_84127:				; CODE XREF: HUDSymbol_ComputeApproachDisplay_83FC9+15Aj
		or	al, al
		jz	short loc_84130
		lea	ax, [bp+var_20]
		jmp	short loc_84133
; ���������������������������������������������������������������������������

loc_84130:				; CODE XREF: HUDSymbol_ComputeApproachDisplay_83FC9+160j
		lea	ax, [bp+var_2C]

loc_84133:				; CODE XREF: HUDSymbol_ComputeApproachDisplay_83FC9+165j
		mov	di, ax
		mov	eax, [di]
		mov	[bp+var_30], eax
		mov	[si+8Ch], eax
		lea	ax, [bp+var_44]
		push	ax
		push	ss
		lea	ax, [bp+var_34]
		push	ax
		call	Math_ElevationAngle_552E1

loc_8414F:
		add	sp, 6
		mov	eax, [bp+var_34]

loc_84156:
		mov	dword_6D777, eax
		lea	ax, [bp+var_44]
		push	ax
		push	ss
		lea	ax, [bp+var_38]
		push	ax
		call	Math_HeadingAngle_553CF
		add	sp, 6
		mov	eax, [bp+var_38]
		mov	dword_6D77B, eax
		mov	byte ptr [si+8Bh], 1
		pop	di
		pop	si
		leave
		retf
HUDSymbol_ComputeApproachDisplay_83FC9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 217 lignes, NON DÉTAILLÉE — combine Math_SinDeg_54876, Camera_TransformPoint,
; Math_AsinOfRatio_54A76 (seg115) — affichage HUD de gisement. ⚠️ (2026-09-24) Math_Sin_5483F
; / Math_Cos_54876 et leurs versions brutes sont INVERSEES (voir Math_CosDeg_5483F) : toute
; mention de sinus/cosinus tiree de ces noms dans ce resume est a relire.
; ==============================================================================================
HUDSymbol_ComputeBearingDisplay_8417C	proc far		; CODE XREF: VROOMM_StubThunk_6B00AJ HUDSymbol_ProcessJoystickAndFilter_843B5+25Dp

var_4C		= dword	ptr -4Ch
var_48		= dword	ptr -48h
var_44		= dword	ptr -44h
var_40		= dword	ptr -40h
var_3C		= dword	ptr -3Ch
var_38		= dword	ptr -38h
var_34		= dword	ptr -34h
var_30		= dword	ptr -30h
var_2C		= word ptr -2Ch
var_2A		= word ptr -2Ah
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	eax, [di]
		neg	eax
		mov	[bp+var_8], eax
		mov	[bp+var_C], eax
		lea	ax, [bp+var_C]
		push	ax
		push	ss
		lea	ax, [bp+var_4]
		push	ax
		call	Math_SinDeg_54876
		add	sp, 6
		mov	ax, si
		add	ax, 8Ch	; '�'
		mov	[bp+var_12], ax
		mov	bx, [bp+var_12]
		mov	eax, [bx]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_10], eax
		mov	ax, [si+89h]
		add	ax, 1Ah
		mov	[bp+var_14], ax
		mov	bx, [bp+var_14]
		mov	eax, [bx]
		add	[bp+var_10], eax
		push	si
		call	Camera_TransformPoint
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_1C], eax
		shl	eax, 8
		mov	[bp+var_18], eax
		mov	eax, [si]
		shl	eax, 2
		mov	[bp+var_20], eax
		mov	[bp+var_24], eax
		add	[bp+var_18], eax
		mov	eax, [bp+var_18]
		cmp	eax, [bp+var_10]
		jle	short loc_8421C
		mov	ax, 1
		jmp	short loc_8421E
; ���������������������������������������������������������������������������

loc_8421C:				; CODE XREF: HUDSymbol_ComputeBearingDisplay_8417C+99j
		xor	ax, ax

loc_8421E:				; CODE XREF: HUDSymbol_ComputeBearingDisplay_8417C+9Ej
		or	al, al
		jnz	short loc_84225
		jmp	loc_84333
; ���������������������������������������������������������������������������

loc_84225:				; CODE XREF: HUDSymbol_ComputeBearingDisplay_8417C+A4j
		mov	ax, si
		add	ax, 8Ch	; '�'
		mov	[bp+var_2A], ax
		mov	bx, [bp+var_2A]
		mov	eax, [bx]
		mov	[bp+var_28], eax
		mov	ax, [si+89h]
		add	ax, 1Ah
		mov	[bp+var_2C], ax
		mov	bx, [bp+var_2C]
		mov	eax, [bx]
		sub	[bp+var_18], eax
		mov	eax, [bp+var_4]

loc_8424F:
		cmp	eax, dword_6E9AE
		jle	short loc_8425B
		mov	ax, 1
		jmp	short loc_8425D
; ���������������������������������������������������������������������������

loc_8425B:				; CODE XREF: HUDSymbol_ComputeBearingDisplay_8417C+D8j
		xor	ax, ax

loc_8425D:				; CODE XREF: HUDSymbol_ComputeBearingDisplay_8417C+DDj
		or	al, al
		jz	short loc_84287
		mov	eax, [bp+var_18]
		mov	edx, eax
		mov	ecx, [bp+var_4]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_30], eax
		mov	eax, [bp+var_30]
		mov	[bp+var_34], eax
		mov	[bp+var_28], eax

loc_84287:				; CODE XREF: HUDSymbol_ComputeBearingDisplay_8417C+E3j
		mov	eax, [si+8Ch]
		cmp	eax, [bp+var_18]
		jle	short loc_84297
		mov	ax, 1
		jmp	short loc_84299
; ���������������������������������������������������������������������������

loc_84297:				; CODE XREF: HUDSymbol_ComputeBearingDisplay_8417C+114j
		xor	ax, ax

loc_84299:				; CODE XREF: HUDSymbol_ComputeBearingDisplay_8417C+119j
		or	al, al
		jz	short loc_842FB
		mov	eax, [bp+var_4]
		cmp	eax, dword_6E9AE
		jg	short loc_842AD
		mov	ax, 1
		jmp	short loc_842AF
; ���������������������������������������������������������������������������

loc_842AD:				; CODE XREF: HUDSymbol_ComputeBearingDisplay_8417C+12Aj
		xor	ax, ax

loc_842AF:				; CODE XREF: HUDSymbol_ComputeBearingDisplay_8417C+12Fj
		or	al, al
		jnz	short loc_842C5
		cmp	[bp+var_28], 0
		jg	short loc_842BF
		mov	ax, 1
		jmp	short loc_842C1
; ���������������������������������������������������������������������������

loc_842BF:				; CODE XREF: HUDSymbol_ComputeBearingDisplay_8417C+13Cj
		xor	ax, ax

loc_842C1:				; CODE XREF: HUDSymbol_ComputeBearingDisplay_8417C+141j
		or	al, al
		jz	short loc_842F0

loc_842C5:				; CODE XREF: HUDSymbol_ComputeBearingDisplay_8417C+135j
		mov	ax, si
		add	ax, 8Ch	; '�'
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		push	ss
		lea	ax, [bp+var_38]
		push	ax
		call	Math_AsinOfRatio_54A76
		add	sp, 8
		mov	eax, [bp+var_38]
		neg	eax
		mov	[bp+var_3C], eax
		mov	[bp+var_40], eax
		mov	[di], eax
		jmp	short loc_84333
; ���������������������������������������������������������������������������

loc_842F0:				; CODE XREF: HUDSymbol_ComputeBearingDisplay_8417C+147j
		mov	eax, [bp+var_28]
		mov	[si+8Ch], eax
		jmp	short loc_84333
; ���������������������������������������������������������������������������

loc_842FB:				; CODE XREF: HUDSymbol_ComputeBearingDisplay_8417C+11Fj
		mov	[bp+var_44], 0FFFFEC00h
		mov	eax, [bp+var_44]
		mov	dword_6D777, eax
		mov	eax, [bp+var_18]
		mov	edx, eax
		mov	ecx, dword_6E9AE
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_48], eax
		mov	eax, [bp+var_48]
		mov	[bp+var_4C], eax
		mov	[si+8Ch], eax

loc_84333:				; CODE XREF: HUDSymbol_ComputeBearingDisplay_8417C+A6j
					; HUDSymbol_ComputeBearingDisplay_8417C+172j ...
		pop	di
		pop	si
		leave
		retf
HUDSymbol_ComputeBearingDisplay_8417C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, invalide/pose une référence (58 lignes).
; ==============================================================================================
HUDSymbol_Helper7_84337	proc far		; CODE XREF: VROOMM_StubThunk_6B01EJ

var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	VROOMM_StubThunk_6B102
		pop	cx
		cmp	word ptr [si+89h], 0
		jz	short loc_843AC
		mov	ax, [si+89h]

loc_84353:
		mov	[bp+var_2], ax
		push	ax
		mov	ax, si
		add	ax, 98h	; '�'
		push	ax
		call	SetReference16

loc_84362:
		add	sp, 4
		mov	al, byte_6D776
		mov	ah, 0
		or	ax, ax
		jnz	short loc_84387
		mov	[bp+var_6], 0
		mov	eax, [bp+var_6]
		mov	dword_6D77B, eax
		mov	dword_6D777, eax
		mov	byte_6D776, 1

loc_84387:				; CODE XREF: HUDSymbol_Helper7_84337+35j
		push	large 0
		push	word ptr [si+89h]
		push	si
		push	cs
		call	near ptr HUDSymbol_ConstructWithFullMatrix_83DD7
		add	sp, 8
		mov	byte ptr [si+8Bh], 1
		mov	[bp+var_A], 200h
		mov	eax, [bp+var_A]
		mov	[si+9Ah], eax

loc_843AC:				; CODE XREF: HUDSymbol_Helper7_84337+16j
		mov	al, [si+52h]
		and	ax, 1
		pop	si
		leave
		retf
HUDSymbol_Helper7_84337	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 460 lignes, NON DÉTAILLÉE — combine Joystick_TestButtonMasked_67B6C,
; Joystick_GetAxisMin_67BC9/Max_67BD8 (seg208), Container_IterateFiltered — traitement des
; entrées joystick avec filtrage de conteneur pour un symbole HUD interactif. Candidat pour
; session dédiée.
; ==============================================================================================
HUDSymbol_ProcessJoystickAndFilter_843B5	proc far		; CODE XREF: VROOMM_StubThunk_6B023J

var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
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
		sub	sp, 30h
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+89h], 0
		jnz	short loc_843CA
		jmp	loc_84723
; ���������������������������������������������������������������������������

loc_843CA:				; CODE XREF: HUDSymbol_ProcessJoystickAndFilter_843B5+10j
		push	word ptr [si+89h]
		mov	bx, [si+89h]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		or	ax, dx
		jz	short loc_843EB
		push	word ptr [si+89h]
		mov	bx, [si+89h]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		jmp	short loc_843ED
; ���������������������������������������������������������������������������

loc_843EB:				; CODE XREF: HUDSymbol_ProcessJoystickAndFilter_843B5+24j
		mov	al, 17h

loc_843ED:				; CODE XREF: HUDSymbol_ProcessJoystickAndFilter_843B5+34j
		cmp	al, 6
		jnz	short loc_84401
		mov	bx, [si+89h]
		push	large dword ptr	[bx+5Ah]
		call	VROOMM_StubThunk_6C42A
		add	sp, 4

loc_84401:				; CODE XREF: HUDSymbol_ProcessJoystickAndFilter_843B5+3Aj
		push	2
		push	0
		call	Joystick_TestButtonMasked_67B6C
		add	sp, 4
		or	al, al
		jnz	short loc_84414
		jmp	loc_844D3
; ���������������������������������������������������������������������������

loc_84414:				; CODE XREF: HUDSymbol_ProcessJoystickAndFilter_843B5+5Aj
		push	0
		call	Joystick_GetAxisMin_67BC9
		pop	cx
		neg	ax
		sar	ax, 1
		mov	[bp+var_2], ax
		movsx	eax, [bp+var_2]
		shl	eax, 8
		add	dword_6D77B, eax
		cmp	dword_6D77B, 0
		jge	short loc_8443E
		mov	ax, 1
		jmp	short loc_84440
; ���������������������������������������������������������������������������

loc_8443E:				; CODE XREF: HUDSymbol_ProcessJoystickAndFilter_843B5+82j
		xor	ax, ax

loc_84440:				; CODE XREF: HUDSymbol_ProcessJoystickAndFilter_843B5+87j
		or	al, al
		jz	short loc_8444D
		add	dword_6D77B, 16800h

loc_8444D:				; CODE XREF: HUDSymbol_ProcessJoystickAndFilter_843B5+8Dj
		cmp	dword_6D77B, 16800h
		jl	short loc_8445D

loc_84458:
		mov	ax, 1
		jmp	short loc_8445F
; ���������������������������������������������������������������������������

loc_8445D:				; CODE XREF: HUDSymbol_ProcessJoystickAndFilter_843B5+A1j
		xor	ax, ax

loc_8445F:				; CODE XREF: HUDSymbol_ProcessJoystickAndFilter_843B5+A6j
		or	al, al
		jz	short loc_8446C
		sub	dword_6D77B, 16800h

loc_8446C:				; CODE XREF: HUDSymbol_ProcessJoystickAndFilter_843B5+ACj
		push	0
		call	Joystick_GetAxisMax_67BD8
		pop	cx
		sar	ax, 1
		mov	[bp+var_4], ax
		movsx	eax, [bp+var_4]
		shl	eax, 8
		add	dword_6D777, eax
		cmp	dword_6D777, 0FFFFA600h
		jge	short loc_84497
		mov	ax, 1
		jmp	short loc_84499
; ���������������������������������������������������������������������������

loc_84497:				; CODE XREF: HUDSymbol_ProcessJoystickAndFilter_843B5+DBj
		xor	ax, ax

loc_84499:				; CODE XREF: HUDSymbol_ProcessJoystickAndFilter_843B5+E0j
		or	al, al
		jz	short loc_844AD
		mov	[bp+var_8], 0FFFFA600h
		mov	eax, [bp+var_8]
		mov	dword_6D777, eax

loc_844AD:				; CODE XREF: HUDSymbol_ProcessJoystickAndFilter_843B5+E6j
		cmp	dword_6D777, 5A00h
		jle	short loc_844BD
		mov	ax, 1
		jmp	short loc_844BF
; ���������������������������������������������������������������������������

loc_844BD:				; CODE XREF: HUDSymbol_ProcessJoystickAndFilter_843B5+101j
		xor	ax, ax

loc_844BF:				; CODE XREF: HUDSymbol_ProcessJoystickAndFilter_843B5+106j
		or	al, al
		jz	short loc_844D3
		mov	[bp+var_C], 5A00h
		mov	eax, [bp+var_C]
		mov	dword_6D777, eax

loc_844D3:				; CODE XREF: HUDSymbol_ProcessJoystickAndFilter_843B5+5Cj
					; HUDSymbol_ProcessJoystickAndFilter_843B5+10Cj
		cmp	byte_72DE3, 1
		jnz	short loc_844DE
		mov	al, 1
		jmp	short loc_844E0
; ���������������������������������������������������������������������������

loc_844DE:				; CODE XREF: HUDSymbol_ProcessJoystickAndFilter_843B5+123j
		mov	al, 0

loc_844E0:				; CODE XREF: HUDSymbol_ProcessJoystickAndFilter_843B5+127j
		or	al, al
		jz	short loc_84510
		mov	eax, dword_70448
		add	[si+8Ch], eax
		mov	eax, [si+8Ch]
		cmp	eax, [si+90h]
		jle	short loc_844FE
		mov	ax, 1
		jmp	short loc_84500
; ���������������������������������������������������������������������������

loc_844FE:				; CODE XREF: HUDSymbol_ProcessJoystickAndFilter_843B5+142j
		xor	ax, ax

loc_84500:				; CODE XREF: HUDSymbol_ProcessJoystickAndFilter_843B5+147j
		or	al, al
		jz	short loc_8454B
		mov	eax, [si+90h]
		mov	[si+8Ch], eax
		jmp	short loc_8454B
; ���������������������������������������������������������������������������

loc_84510:				; CODE XREF: HUDSymbol_ProcessJoystickAndFilter_843B5+12Dj
		cmp	byte_72DE2, 1
		jnz	short loc_8451B
		mov	al, 1
		jmp	short loc_8451D
; ���������������������������������������������������������������������������

loc_8451B:				; CODE XREF: HUDSymbol_ProcessJoystickAndFilter_843B5+160j
		mov	al, 0

loc_8451D:				; CODE XREF: HUDSymbol_ProcessJoystickAndFilter_843B5+164j
		or	al, al
		jz	short loc_8454B
		mov	eax, dword_70448
		sub	[si+8Ch], eax
		mov	eax, [si+8Ch]
		cmp	eax, [si+94h]
		jge	short loc_8453B
		mov	ax, 1
		jmp	short loc_8453D
; ���������������������������������������������������������������������������

loc_8453B:				; CODE XREF: HUDSymbol_ProcessJoystickAndFilter_843B5+17Fj
		xor	ax, ax

loc_8453D:				; CODE XREF: HUDSymbol_ProcessJoystickAndFilter_843B5+184j
		or	al, al
		jz	short loc_8454B
		mov	eax, [si+94h]
		mov	[si+8Ch], eax

loc_8454B:				; CODE XREF: HUDSymbol_ProcessJoystickAndFilter_843B5+14Dj
					; HUDSymbol_ProcessJoystickAndFilter_843B5+159j ...
		mov	al, byte_70471
		mov	ah, 0
		or	ax, ax
		jz	short loc_84557
		jmp	loc_845FF
; ���������������������������������������������������������������������������

loc_84557:				; CODE XREF: HUDSymbol_ProcessJoystickAndFilter_843B5+19Dj
		mov	al, [si+8Bh]
		mov	ah, 0
		or	ax, ax
		jz	short loc_84564
		jmp	loc_845FF
; ���������������������������������������������������������������������������

loc_84564:				; CODE XREF: HUDSymbol_ProcessJoystickAndFilter_843B5+1AAj
		mov	al, byte_722D1
		mov	ah, 0
		cmp	ax, word_6E46F
		jz	short loc_84576
		mov	al, byte_722D1
		mov	ah, 0
		jmp	short loc_84578
; ���������������������������������������������������������������������������

loc_84576:				; CODE XREF: HUDSymbol_ProcessJoystickAndFilter_843B5+1B8j
		xor	ax, ax

loc_84578:				; CODE XREF: HUDSymbol_ProcessJoystickAndFilter_843B5+1BFj
		cmp	ax, 40h	; '@'
		jz	short loc_84580
		jmp	loc_845FF
; ���������������������������������������������������������������������������

loc_84580:				; CODE XREF: HUDSymbol_ProcessJoystickAndFilter_843B5+1C6j
		mov	bx, [si+89h]
		cmp	byte_722D0, 1
		jnz	short loc_8459B
		test	byte_722D3, 30h
		jz	short loc_84597
		mov	ax, 1
		jmp	short loc_84599
; ���������������������������������������������������������������������������

loc_84597:				; CODE XREF: HUDSymbol_ProcessJoystickAndFilter_843B5+1DBj
		xor	ax, ax

loc_84599:				; CODE XREF: HUDSymbol_ProcessJoystickAndFilter_843B5+1E0j
		jmp	short loc_845B0
; ���������������������������������������������������������������������������

loc_8459B:				; CODE XREF: HUDSymbol_ProcessJoystickAndFilter_843B5+1D4j
		cmp	byte_72DE5, 1
		jz	short loc_845A9
		cmp	byte_72E1D, 1
		jnz	short loc_845AE

loc_845A9:				; CODE XREF: HUDSymbol_ProcessJoystickAndFilter_843B5+1EBj
		mov	ax, 1
		jmp	short loc_845B0
; ���������������������������������������������������������������������������

loc_845AE:				; CODE XREF: HUDSymbol_ProcessJoystickAndFilter_843B5+1F2j
		xor	ax, ax

loc_845B0:				; CODE XREF: HUDSymbol_ProcessJoystickAndFilter_843B5:loc_84599j
					; HUDSymbol_ProcessJoystickAndFilter_843B5+1F7j
		or	al, al
		jz	short loc_845D0
		push	2
		push	large 9C40h
		push	bx
		push	word ptr [si+98h]
		push	59C3h
		call	Container_IterateFiltered
		add	sp, 0Ch
		mov	bx, ax
		jmp	short loc_845EA
; ���������������������������������������������������������������������������

loc_845D0:				; CODE XREF: HUDSymbol_ProcessJoystickAndFilter_843B5+1FDj
		push	1
		push	large 9C40h
		push	bx
		push	word ptr [si+98h]
		push	59C3h
		call	Container_IterateFiltered
		add	sp, 0Ch
		mov	bx, ax

loc_845EA:				; CODE XREF: HUDSymbol_ProcessJoystickAndFilter_843B5+219j
		or	bx, bx
		jz	short loc_845FF
		push	word ptr dword_6D77B+1
		push	word ptr dword_6D777+1
		push	bx
		push	si
		push	cs
		call	near ptr HUDSymbol_ConstructWithFullMatrix_83DD7
		add	sp, 8

loc_845FF:				; CODE XREF: HUDSymbol_ProcessJoystickAndFilter_843B5+19Fj
					; HUDSymbol_ProcessJoystickAndFilter_843B5+1ACj ...
		cmp	byte ptr [si+8Bh], 0
		jz	short loc_8460D
		mov	byte ptr [si+8Bh], 0
		jmp	short loc_84618
; ���������������������������������������������������������������������������

loc_8460D:				; CODE XREF: HUDSymbol_ProcessJoystickAndFilter_843B5+24Fj
		push	6C7h
		push	si
		push	cs
		call	near ptr HUDSymbol_ComputeBearingDisplay_8417C
		add	sp, 4

loc_84618:				; CODE XREF: HUDSymbol_ProcessJoystickAndFilter_843B5+256j
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	Matrix_BuildFromAngle_56D72
		pop	cx
		push	6CBh
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	Matrix_BuildAxisZ_572BC

loc_84632:
		add	sp, 4

loc_84635:
		push	6C7h
		mov	ax, si

loc_8463A:
		add	ax, 20h	; ' '

loc_8463D:
		push	ax

loc_8463E:
		call	Matrix_BuildAxisX_56EC3

loc_84643:
		add	sp, 4

loc_84646:
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	Matrix_OrthonormalizeKeepRow1_57660
		pop	cx
		mov	eax, [si+2Ch]
		neg	eax
		mov	[bp+var_24], eax
		mov	eax, [si+30h]
		neg	eax
		mov	[bp+var_20], eax
		mov	eax, [si+34h]
		neg	eax
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_24]
		mov	[bp+var_30], eax
		mov	eax, [bp+var_20]
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_28], eax
		mov	eax, [bp+var_30]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_2C]
		mov	[bp+var_14], eax
		mov	eax, [bp+var_28]
		mov	[bp+var_10], eax
		mov	di, si
		add	di, 8Ch	; '�'
		mov	eax, [bp+var_18]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_18], eax
		mov	eax, [bp+var_14]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_14], eax
		mov	eax, [bp+var_10]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_10], eax
		mov	di, [si+89h]
		add	di, 12h
		mov	eax, [di]
		add	[bp+var_18], eax
		mov	eax, [di+4]
		add	[bp+var_14], eax
		mov	eax, [di+8]
		add	[bp+var_10], eax
		mov	eax, [bp+var_18]
		mov	[si+14h], eax
		mov	eax, [bp+var_14]
		mov	[si+18h], eax
		mov	eax, [bp+var_10]
		mov	[si+1Ch], eax
		push	si
		call	Camera_ComputeViewMatrix
		pop	cx
		mov	al, 1
		jmp	short loc_84745
; ���������������������������������������������������������������������������

loc_84723:				; CODE XREF: HUDSymbol_ProcessJoystickAndFilter_843B5+12j
		mov	eax, dword_70458
		sub	[si+9Ah], eax
		cmp	dword ptr [si+9Ah], 0
		jle	short loc_84739
		mov	ax, 1

loc_84737:
		jmp	short loc_8473B
; ���������������������������������������������������������������������������

loc_84739:				; CODE XREF: HUDSymbol_ProcessJoystickAndFilter_843B5+37Dj
		xor	ax, ax

loc_8473B:				; CODE XREF: HUDSymbol_ProcessJoystickAndFilter_843B5:loc_84737j
		or	al, al
		jz	short loc_84743

loc_8473F:
		mov	al, 1
		jmp	short loc_84745
; ���������������������������������������������������������������������������

loc_84743:				; CODE XREF: HUDSymbol_ProcessJoystickAndFilter_843B5+388j
		mov	al, 0

loc_84745:				; CODE XREF: HUDSymbol_ProcessJoystickAndFilter_843B5+36Cj
					; HUDSymbol_ProcessJoystickAndFilter_843B5+38Cj
		pop	di
		pop	si
		leave
		retf
HUDSymbol_ProcessJoystickAndFilter_843B5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (13 lignes).
; ==============================================================================================
HUDSymbol_Helper8_84749	proc far		; CODE XREF: VROOMM_StubThunk_6B028J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 8

loc_84751:
		pop	bp
		retf
HUDSymbol_Helper8_84749	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, même motif que HUDSymbol_ConstructVariantA_804F0.
; ==============================================================================================
HUDSymbol_ConstructVariantH_84753	proc far		; CODE XREF: VROOMM_StubThunk_6B037J

var_24		= word ptr -24h
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp

loc_84756:
		sub	sp, 24h
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_84770
		push	8Dh ; '�'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_847D6

loc_84770:				; CODE XREF: HUDSymbol_ConstructVariantH_84753+Cj
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	Formation_ComputeGeometryHelper_56D43
		pop	cx
		mov	word ptr [si+50h], 484h
		mov	ax, si
		add	ax, 53h	; 'S'
		push	ax
		call	String_ConstructEmpty
		pop	cx
		push	si
		call	VROOMM_StubThunk_6BC0D
		pop	cx
		mov	word ptr [si+50h], 67Eh
		mov	ax, si
		add	ax, 80h	; '�'
		push	ax
		call	String_ConstructEmpty
		pop	cx
		mov	word ptr [si+89h], 0
		mov	word ptr [si+50h], 6CFh
		mov	word ptr [si+8Bh], 0
		push	large 24h ; '$'
		push	ss
		lea	ax, [bp+var_24]
		push	ax
		push	[bp+arg_2]
		call	ResourceRecord_ReadFieldGroupA_64A19
		add	sp, 0Ah
		lea	ax, [bp+var_24]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr HUDSymbol_ConstructAndInitAngleE_84863
		add	sp, 4

loc_847D6:				; CODE XREF: HUDSymbol_ConstructVariantH_84753+1Bj
		mov	ax, si
		pop	si
		leave
		retf
HUDSymbol_ConstructVariantH_84753	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, même motif que HUDSymbol_ConstructVariantA_804F0.
; ==============================================================================================
HUDSymbol_ConstructVariantI_847DB	proc far		; CODE XREF: VROOMM_StubThunk_6B041J

var_24		= word ptr -24h
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 24h
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_847F8
		push	8Dh ; '�'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_8485E

loc_847F8:				; CODE XREF: HUDSymbol_ConstructVariantI_847DB+Cj
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	Formation_ComputeGeometryHelper_56D43
		pop	cx
		mov	word ptr [si+50h], 484h
		mov	ax, si
		add	ax, 53h	; 'S'
		push	ax
		call	String_ConstructEmpty
		pop	cx
		push	si
		call	VROOMM_StubThunk_6BC0D
		pop	cx
		mov	word ptr [si+50h], 67Eh
		mov	ax, si
		add	ax, 80h	; '�'
		push	ax
		call	String_ConstructEmpty
		pop	cx
		mov	word ptr [si+89h], 0

loc_84833:
		mov	word ptr [si+50h], 6CFh

loc_84838:
		mov	word ptr [si+8Bh], 0
		push	24h ; '$'
		push	large [bp+arg_2]
		push	ss
		lea	ax, [bp+var_24]
		push	ax
		call	CRT_MemFamily_Extra1
		add	sp, 0Ah
		lea	ax, [bp+var_24]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr HUDSymbol_ConstructAndInitAngleE_84863
		add	sp, 4

loc_8485E:				; CODE XREF: HUDSymbol_ConstructVariantI_847DB+1Bj
		mov	ax, si
		pop	si
		leave
		retf
HUDSymbol_ConstructVariantI_847DB	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, même motif que HUDSymbol_ConstructAndInitAngle_80701 (sans copie finale de chaîne).
; ==============================================================================================
HUDSymbol_ConstructAndInitAngleE_84863	proc far		; CODE XREF: VROOMM_StubThunk_6B03CJ HUDSymbol_ConstructVariantH_84753+7Dp	...

var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_B		= byte ptr -0Bh
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp

loc_84866:
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	bx, [bp+arg_2]
		mov	ax, [bx+1Ch]
		mov	[bp+var_2], ax
		mov	ax, [bx+1Eh]
		mov	[bp+var_4], ax
		mov	ax, [bx+20h]
		mov	[bp+var_6], ax
		mov	ax, [bx+22h]
		mov	[bp+var_8], ax
		push	1Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_848D0
		mov	word ptr [di], 44Ch
		mov	word ptr [di+2], 0
		mov	word ptr [di+4], 0
		mov	byte ptr [di+0Fh], 0
		mov	word ptr [di+10h], 0
		mov	word ptr [di+12h], 0
		mov	byte ptr [di+1Dh], 0
		push	[bp+var_8]
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		push	ax
		call	VROOMM_StubThunk_6BBE0
		add	sp, 0Ah
		mov	ax, di
		jmp	short loc_848D2
; ���������������������������������������������������������������������������

loc_848D0:				; CODE XREF: HUDSymbol_ConstructAndInitAngleE_84863+32j
		mov	ax, di

loc_848D2:				; CODE XREF: HUDSymbol_ConstructAndInitAngleE_84863+6Bj
		mov	[si+5Ch], ax
		sub	sp, 4
		mov	di, [bp+arg_2]
		add	di, 18h
		mov	eax, [di]
		mov	[bp+var_14], eax
		sub	sp, 4
		mov	bx, [bp+arg_2]
		mov	ax, [bx+16h]
		mov	[bp+var_A], ax
		movsx	eax, [bp+var_A]
		shl	eax, 8
		mov	[bp+var_18], eax
		push	large dword ptr	[bx+12h]
		mov	ax, [bp+arg_2]
		add	ax, 0Ah
		push	ax
		push	word ptr [si+5Ch]
		push	si
		call	VROOMM_StubThunk_6B0EE
		add	sp, 12h
		mov	bx, [bp+arg_2]
		mov	al, [bx+8]
		mov	[bp+var_B], al
		and	ax, 1
		and	byte ptr [si+52h], 0FDh
		shl	al, 1
		or	[si+52h], al
		pop	di
		pop	si
		leave
		retf
HUDSymbol_ConstructAndInitAngleE_84863	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine une opération de conteneur et SetReference16 (×2).
; ==============================================================================================
HUDSymbol_ConstructWithContainerOp_8492E	proc far		; CODE XREF: VROOMM_StubThunk_6B046J

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]

loc_84938:
		cmp	word ptr [si+89h], 0
		jnz	short loc_8496B
		mov	ax, si
		add	ax, 80h	; '�'
		mov	[bp+var_2], ds
		mov	[bp+var_4], ax
		push	[bp+var_2]
		push	ax
		push	59C3h
		call	Container_Op_2241B
		add	sp, 6

loc_84959:
		mov	[bp+var_6], ax

loc_8495C:
		push	ax
		mov	ax, si
		add	ax, 89h	; '�'

loc_84962:
		push	ax
		call	SetReference16
		add	sp, 4

loc_8496B:				; CODE XREF: HUDSymbol_ConstructWithContainerOp_8492E+Fj
		cmp	word ptr [si+89h], 0
		jz	short loc_849AD
		mov	bx, [si+89h]
		les	bx, [bx+5Ah]
		mov	ax, es:[bx+0Dh]
		mov	[bp+var_8], ax
		push	ax
		mov	ax, si
		add	ax, 8Bh	; '�'
		push	ax
		call	SetReference16
		add	sp, 4
		cmp	word ptr [si+8Bh], 0
		jz	short loc_849AD
		push	si
		call	VROOMM_StubThunk_6BC26
		pop	cx
		or	al, al
		jz	short loc_849AD
		push	si
		mov	bx, [si+50h]
		call	dword ptr [bx+10h]
		pop	cx
		mov	al, 1
		jmp	short loc_849AF
; ���������������������������������������������������������������������������

loc_849AD:				; CODE XREF: HUDSymbol_ConstructWithContainerOp_8492E+42j
					; HUDSymbol_ConstructWithContainerOp_8492E+66j ...
		mov	al, 0

loc_849AF:				; CODE XREF: HUDSymbol_ConstructWithContainerOp_8492E+7Dj
		pop	si
		leave
		retf
HUDSymbol_ConstructWithContainerOp_8492E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 408 lignes, NON DÉTAILLÉE — variante de HUDSymbol_RenderWithClipTest_80B74 combinant
; aussi Camera_ComputeViewMatrix. Candidat pour session dédiée.
; ==============================================================================================
HUDSymbol_RenderWithClipTestE_849B2	proc far		; CODE XREF: VROOMM_StubThunk_6B04BJ

var_10A		= dword	ptr -10Ah
var_106		= dword	ptr -106h
var_102		= dword	ptr -102h
var_FE		= dword	ptr -0FEh
var_FA		= dword	ptr -0FAh
var_F6		= dword	ptr -0F6h
var_F2		= dword	ptr -0F2h
var_EE		= dword	ptr -0EEh
var_EA		= dword	ptr -0EAh
var_E6		= dword	ptr -0E6h
var_E2		= dword	ptr -0E2h
var_DE		= dword	ptr -0DEh
var_DA		= dword	ptr -0DAh
var_D6		= dword	ptr -0D6h
var_D2		= dword	ptr -0D2h
var_CE		= dword	ptr -0CEh
var_CA		= dword	ptr -0CAh
var_C6		= dword	ptr -0C6h
var_C2		= dword	ptr -0C2h
var_BE		= dword	ptr -0BEh
var_BA		= dword	ptr -0BAh
var_B6		= dword	ptr -0B6h
var_B2		= dword	ptr -0B2h
var_AE		= dword	ptr -0AEh
var_AA		= dword	ptr -0AAh
var_A6		= dword	ptr -0A6h
var_A2		= dword	ptr -0A2h
var_9E		= dword	ptr -9Eh
var_9A		= dword	ptr -9Ah
var_96		= dword	ptr -96h
var_92		= dword	ptr -92h
var_8E		= dword	ptr -8Eh
var_8A		= dword	ptr -8Ah
var_86		= dword	ptr -86h
var_82		= dword	ptr -82h
var_7E		= dword	ptr -7Eh
var_7A		= word ptr -7Ah
var_78		= word ptr -78h
var_76		= word ptr -76h
var_74		= dword	ptr -74h
var_70		= dword	ptr -70h
var_6C		= dword	ptr -6Ch
var_68		= dword	ptr -68h
var_64		= dword	ptr -64h
var_60		= dword	ptr -60h
var_5C		= dword	ptr -5Ch
var_58		= dword	ptr -58h
var_54		= dword	ptr -54h
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
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 10Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+89h], 0
		jnz	short loc_849C8
		jmp	loc_84DCB
; ���������������������������������������������������������������������������

loc_849C8:				; CODE XREF: HUDSymbol_RenderWithClipTestE_849B2+11j
		cmp	word ptr [si+8Bh], 0
		jnz	short loc_849D2
		jmp	loc_84DCB
; ���������������������������������������������������������������������������

loc_849D2:				; CODE XREF: HUDSymbol_RenderWithClipTestE_849B2+1Bj
		mov	di, [si+89h]
		add	di, 20h	; ' '
		mov	eax, [di]
		mov	[bp+var_4], eax
		mov	di, [si+8Bh]
		add	di, 12h
		mov	cx, [si+89h]
		add	cx, 12h
		mov	eax, [di]
		mov	bx, cx
		sub	eax, [bx]
		mov	[bp+var_92], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp+var_8E], eax
		mov	eax, [di+8]
		sub	eax, [bx+8]
		mov	[bp+var_8A], eax
		mov	eax, [bp+var_92]
		mov	[bp+var_86], eax
		mov	eax, [bp+var_8E]
		mov	[bp+var_82], eax
		mov	eax, [bp+var_8A]
		mov	[bp+var_7E], eax

loc_84A32:
		lea	ax, [bp+var_86]
		push	ax

loc_84A37:
		mov	ax, si

loc_84A39:
		add	ax, 20h	; ' '
		push	ax
		call	UI_ApplyLineOfSightAndTransform_57DAE

loc_84A42:
		add	sp, 4

loc_84A45:
		mov	di, si

loc_84A47:
		add	di, 20h	; ' '
		mov	eax, [di]
		mov	edx, [bp+var_4]

loc_84A51:
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_8], eax

loc_84A5D:
		mov	eax, [bp+var_8]

loc_84A61:
		mov	[bp+var_C], eax
		mov	eax, [di+4]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_14], eax
		mov	eax, [di+8]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_AA], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_A6], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_A2], eax
		mov	[bp+var_20], 80h ; '�'
		mov	eax, [bp+var_AA]
		mov	edx, [bp+var_20]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_24], eax
		mov	eax, [bp+var_24]
		mov	[bp+var_28], eax
		mov	eax, [bp+var_A6]
		mov	edx, [bp+var_20]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_2C]
		mov	[bp+var_30], eax
		mov	eax, [bp+var_A2]
		mov	edx, [bp+var_20]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_34], eax
		mov	eax, [bp+var_34]
		mov	[bp+var_38], eax
		mov	eax, [bp+var_28]
		mov	[bp+var_9E], eax
		mov	eax, [bp+var_30]
		mov	[bp+var_9A], eax
		mov	eax, [bp+var_38]

loc_84B2D:
		mov	[bp+var_96], eax
		mov	eax, [bp+var_4]

loc_84B36:
		neg	eax
		mov	[bp+var_3C], eax
		mov	[bp+var_40], eax
		mov	di, si
		add	di, 2Ch	; ','
		mov	eax, [di]
		mov	edx, [bp+var_40]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_44], eax
		mov	eax, [bp+var_44]
		mov	[bp+var_48], eax

loc_84B61:
		mov	eax, [di+4]
		mov	edx, [bp+var_40]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_4C]
		mov	[bp+var_50], eax
		mov	eax, [di+8]
		mov	edx, [bp+var_40]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_54], eax
		mov	eax, [bp+var_54]
		mov	[bp+var_58], eax
		mov	eax, [bp+var_48]
		mov	[bp+var_C2], eax
		mov	eax, [bp+var_50]
		mov	[bp+var_BE], eax
		mov	eax, [bp+var_58]
		mov	[bp+var_BA], eax
		mov	[bp+var_5C], 1CCh
		mov	eax, [bp+var_C2]
		mov	edx, [bp+var_5C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_60], eax
		mov	eax, [bp+var_60]
		mov	[bp+var_64], eax
		mov	eax, [bp+var_BE]
		mov	edx, [bp+var_5C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_68], eax
		mov	eax, [bp+var_68]
		mov	[bp+var_6C], eax
		mov	eax, [bp+var_BA]
		mov	edx, [bp+var_5C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_70], eax
		mov	eax, [bp+var_70]
		mov	[bp+var_74], eax
		mov	eax, [bp+var_64]
		mov	[bp+var_B6], eax
		mov	eax, [bp+var_6C]
		mov	[bp+var_B2], eax
		mov	eax, [bp+var_74]
		mov	[bp+var_AE], eax

loc_84C2E:
		mov	eax, [bp+var_B6]
		add	eax, [bp+var_9E]
		mov	[bp+var_DA], eax
		mov	eax, [bp+var_B2]
		add	eax, [bp+var_9A]
		mov	[bp+var_D6], eax
		mov	eax, [bp+var_AE]
		add	eax, [bp+var_96]
		mov	[bp+var_D2], eax
		mov	eax, [bp+var_DA]
		mov	[bp+var_CE], eax
		mov	eax, [bp+var_D6]
		mov	[bp+var_CA], eax
		mov	eax, [bp+var_D2]
		mov	[bp+var_C6], eax
		lea	ax, [bp+var_CE]
		push	ax
		push	word ptr [si+89h]
		push	si
		call	Camera_ClipTestWrapper
		add	sp, 6
		mov	di, [si+89h]
		add	di, 12h
		mov	eax, [di]
		add	eax, [bp+var_CE]
		mov	[bp+var_E6], eax
		mov	eax, [di+4]
		add	eax, [bp+var_CA]
		mov	[bp+var_E2], eax
		mov	eax, [di+8]
		add	eax, [bp+var_C6]
		mov	[bp+var_DE], eax
		mov	eax, [bp+var_E6]
		mov	[bp+var_F2], eax
		mov	eax, [bp+var_E2]
		mov	[bp+var_EE], eax
		mov	eax, [bp+var_DE]
		mov	[bp+var_EA], eax
		mov	eax, [bp+var_F2]
		mov	[si+14h], eax
		mov	eax, [bp+var_EE]
		mov	[si+18h], eax
		mov	eax, [bp+var_EA]
		mov	[si+1Ch], eax
		mov	di, [si+8Bh]
		add	di, 12h
		mov	cx, si
		add	cx, 14h
		mov	eax, [di]
		mov	bx, cx
		sub	eax, [bx]
		mov	[bp+var_FE], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp+var_FA], eax
		mov	eax, [di+8]
		sub	eax, [bx+8]
		mov	[bp+var_F6], eax
		mov	eax, [bp+var_FE]
		mov	[bp+var_10A], eax

loc_84D31:
		mov	eax, [bp+var_FA]
		mov	[bp+var_106], eax
		mov	eax, [bp+var_F6]

loc_84D40:
		mov	[bp+var_102], eax
		mov	eax, [bp+var_10A]
		mov	[bp+var_86], eax

loc_84D4F:
		mov	eax, [bp+var_106]

loc_84D54:
		mov	[bp+var_82], eax

loc_84D59:
		mov	eax, [bp+var_102]

loc_84D5E:
		mov	[bp+var_7E], eax

loc_84D62:
		lea	ax, [bp+var_86]
		push	ax
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	UI_ApplyLineOfSightAndTransform_57DAE
		add	sp, 4
		push	si
		call	Camera_ComputeViewMatrix
		pop	cx
		mov	al, byte_722D1
		mov	ah, 0
		cmp	ax, word_6E46F
		jz	short loc_84D8E
		mov	al, byte_722D1
		mov	ah, 0
		jmp	short loc_84D90
; ���������������������������������������������������������������������������

loc_84D8E:				; CODE XREF: HUDSymbol_RenderWithClipTestE_849B2+3D3j
		xor	ax, ax

loc_84D90:				; CODE XREF: HUDSymbol_RenderWithClipTestE_849B2+3DAj
		cmp	ax, 41h	; 'A'
		jnz	short loc_84DC7
		mov	ax, [si+89h]
		mov	[bp+var_76], ax
		mov	ax, [si+8Bh]
		mov	[bp+var_78], ax
		push	ax
		mov	ax, si
		add	ax, 89h	; '�'
		push	ax
		call	SetReference16
		add	sp, 4
		mov	ax, [bp+var_76]
		mov	[bp+var_7A], ax
		push	ax
		mov	ax, si
		add	ax, 8Bh	; '�'
		push	ax
		call	SetReference16
		add	sp, 4

loc_84DC7:				; CODE XREF: HUDSymbol_RenderWithClipTestE_849B2+3E1j
		mov	al, 1
		jmp	short loc_84DCD
; ���������������������������������������������������������������������������

loc_84DCB:				; CODE XREF: HUDSymbol_RenderWithClipTestE_849B2+13j
					; HUDSymbol_RenderWithClipTestE_849B2+1Dj
		mov	al, 0

loc_84DCD:				; CODE XREF: HUDSymbol_RenderWithClipTestE_849B2+417j
		pop	di
		pop	si
		leave
		retf
HUDSymbol_RenderWithClipTestE_849B2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (11 lignes).
; ==============================================================================================
HUDSymbol_Helper9_84DD1	proc far		; CODE XREF: VROOMM_StubThunk_6B050J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 9
		pop	bp
		retf
HUDSymbol_Helper9_84DD1	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (8 lignes).
; ==============================================================================================
HUDSymbol_Helper10_84DDB	proc far		; CODE XREF: VROOMM_StubThunk_6B055J
		push	bp
		mov	bp, sp
		mov	dword_6D777, 0
		mov	dword_6D77B, 0
		pop	bp
		retf
HUDSymbol_Helper10_84DDB	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, invalide 2 références faibles.
; ==============================================================================================
HUDSymbol_ReleaseTwoRefsB_84DF2	proc far		; CODE XREF: VROOMM_StubThunk_6AFBAJ

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_84E35
		mov	ax, si
		add	ax, 8Bh	; '�'
		push	ax
		call	WeakRef_InvalidateIfSet
		pop	cx
		mov	ax, si
		add	ax, 89h	; '�'
		push	ax
		call	WeakRef_InvalidateIfSet
		pop	cx
		push	0
		push	si
		call	VROOMM_StubThunk_6BC35
		add	sp, 4
		test	di, 1
		jz	short loc_84E33
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx
		jmp	short loc_84E35
; ���������������������������������������������������������������������������

loc_84E33:				; CODE XREF: HUDSymbol_ReleaseTwoRefsB_84DF2+36j
		jmp	short $+2

loc_84E35:				; CODE XREF: HUDSymbol_ReleaseTwoRefsB_84DF2+Dj
					; HUDSymbol_ReleaseTwoRefsB_84DF2+3Fj
		pop	di
		pop	si
		pop	bp

locret_84E38:
		retf
HUDSymbol_ReleaseTwoRefsB_84DF2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, invalide une référence faible.
; ==============================================================================================
HUDSymbol_ReleaseSingleRefB_84E39	proc far		; CODE XREF: VROOMM_StubThunk_6AFB5J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si

loc_84E3D:
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_84E70
		mov	ax, si
		add	ax, 89h	; '�'
		push	ax

loc_84E4E:
		call	WeakRef_InvalidateIfSet
		pop	cx
		push	0
		push	si
		call	VROOMM_StubThunk_6BC35
		add	sp, 4
		test	di, 1
		jz	short loc_84E6E
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx
		jmp	short loc_84E70
; ���������������������������������������������������������������������������

loc_84E6E:				; CODE XREF: HUDSymbol_ReleaseSingleRefB_84E39+2Aj
		jmp	short $+2

loc_84E70:				; CODE XREF: HUDSymbol_ReleaseSingleRefB_84E39+Dj
					; HUDSymbol_ReleaseSingleRefB_84E39+33j
		pop	di
		pop	si
		pop	bp
		retf
HUDSymbol_ReleaseSingleRefB_84E39	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, invalide 2 références faibles.
; ==============================================================================================
HUDSymbol_ReleaseTwoRefsC_84E74	proc far		; CODE XREF: VROOMM_StubThunk_6AFB0J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_84EB7
		mov	ax, si
		add	ax, 8Bh	; '�'
		push	ax
		call	WeakRef_InvalidateIfSet
		pop	cx
		mov	ax, si
		add	ax, 89h	; '�'
		push	ax
		call	WeakRef_InvalidateIfSet
		pop	cx
		push	0
		push	si
		call	VROOMM_StubThunk_6BC35
		add	sp, 4
		test	di, 1
		jz	short loc_84EB5
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx
		jmp	short loc_84EB7
; ���������������������������������������������������������������������������

loc_84EB5:				; CODE XREF: HUDSymbol_ReleaseTwoRefsC_84E74+36j
		jmp	short $+2

loc_84EB7:				; CODE XREF: HUDSymbol_ReleaseTwoRefsC_84E74+Dj
					; HUDSymbol_ReleaseTwoRefsC_84E74+3Fj
		pop	di
		pop	si
		pop	bp
		retf
HUDSymbol_ReleaseTwoRefsC_84E74	endp

ovr244		ends

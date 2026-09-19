ovr287		segment	para public 'OVERLAY' use16
		assume cs:ovr287
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, applique deux styles de texte (TextFormat_ApplyStyleAttribute_5E2D0 ×2).
; ==============================================================================================
MissionText_ApplyDualStyle_97540	proc far		; CODE XREF: VROOMM_StubThunk_6BBE0J MissionText_ConstructFullOrientation_97A2D+D3p

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	word_70E62
		mov	ax, si
		add	ax, 10h
		push	ax
		call	TextFormat_ApplyStyleAttribute_5E2D0
		add	sp, 4
		mov	[bp+var_2], di
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_6], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_8], ax
		mov	ax, [bp+var_2]
		mov	[si+14h], ax
		mov	ax, [bp+var_4]
		mov	[si+16h], ax
		mov	ax, [bp+var_6]
		mov	[si+18h], ax
		mov	ax, [bp+var_8]
		mov	[si+1Ah], ax
		mov	ax, si
		add	ax, 10h
		push	ax
		mov	ax, si
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_5E2D0
		add	sp, 4

loc_975A1:
		mov	ax, [bp+arg_6]
		sub	ax, di
		mov	[bp+var_A], ax
		mov	ax, [bp+arg_8]
		sub	ax, [bp+arg_4]
		mov	[bp+var_C], ax
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	ax, [bp+var_A]
		mov	[si+0Ah], ax
		mov	ax, [bp+var_C]
		mov	[si+0Ch], ax
		pop	di
		pop	si
		leave
		retf
MissionText_ApplyDualStyle_97540	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⭐⚠️ far, 293 lignes, NON DÉTAILLÉE — combine Text_TypewriterDrawChar et AV_SyncComputeOffset
; (répétés) — affichage de sous-titre façon machine à écrire synchronisé avec l'audio/vidéo
; (dialogue de mission). Candidat pour session dédiée si le mécanisme de synchronisation doit
; être confirmé.
; ==============================================================================================
MissionText_DrawTypewriterSynced_975CC	proc far		; CODE XREF: VROOMM_StubThunk_6BBE5J

var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 20h
		push	si
		mov	si, [bp+arg_0]
		cmp	word_6E1C2, 0
		jz	short loc_975E0
		jmp	loc_97867
; ���������������������������������������������������������������������������

loc_975E0:				; CODE XREF: MissionText_DrawTypewriterSynced_975CC+Fj
		push	5196h
		mov	ax, si
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttributeB_5E329
		add	sp, 4
		mov	word ptr [si+14h], 0
		mov	word ptr [si+16h], 0
		mov	word ptr [si+18h], 13Fh
		mov	word ptr [si+1Ah], 0C7h	; '�'
		mov	word_7236F, 0B1h ; '�'
		mov	ax, word_7234E
		or	ax, ax
		jnz	short loc_97615
		jmp	loc_9774B
; ���������������������������������������������������������������������������

loc_97615:				; CODE XREF: MissionText_DrawTypewriterSynced_975CC+44j
		cmp	ax, 1
		jz	short loc_9766D
		cmp	ax, 2
		jz	short loc_97622
		jmp	loc_97863
; ���������������������������������������������������������������������������

loc_97622:				; CODE XREF: MissionText_DrawTypewriterSynced_975CC+51j
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
		mov	[si+8],	ax
		mov	ax, [bp+var_6]
		mov	[si+0Ah], ax
		mov	ax, [bp+var_8]
		mov	[si+0Ch], ax
		push	0B1h ; '�'
		push	ds
		push	offset word_72A94
		call	Text_TypewriterDrawChar
		add	sp, 6
		push	0BCh ; '�'
		call	AV_SyncComputeOffset
		pop	cx
		jmp	loc_97863
; ���������������������������������������������������������������������������

loc_9766D:				; CODE XREF: MissionText_DrawTypewriterSynced_975CC+4Cj
		add	word ptr [si+16h], 10h
		sub	word ptr [si+1Ah], 10h
		mov	ax, [si+14h]
		mov	[bp+var_A], ax
		mov	ax, [si+16h]
		mov	[bp+var_C], ax
		mov	ax, [si+18h]
		mov	[bp+var_E], ax
		mov	ax, [si+1Ah]
		mov	[bp+var_10], ax
		mov	ax, [bp+var_A]
		mov	[si+6],	ax
		mov	ax, [bp+var_C]
		mov	[si+8],	ax
		mov	ax, [bp+var_E]
		mov	[si+0Ah], ax
		mov	ax, [bp+var_10]

loc_976A2:
		mov	[si+0Ch], ax
		push	0A1h ; '�'
		push	ds
		push	offset word_72A94
		call	Text_TypewriterDrawChar
		add	sp, 6

loc_976B4:
		push	0BCh ; '�'
		call	AV_SyncComputeOffset
		pop	cx
		cmp	byte_721F0, 2
		jnz	short loc_976E2
		cmp	word_721F1, 0
		jz	short loc_976E2
		mov	ax, word_721F1
		mov	[bp+var_12], ax
		xor	dx, dx
		mov	cl, 0
		mov	ch, byte ptr [bp+var_12]
		mov	bx, 4355h
		mov	ax, 1209h
		int	15h
		jmp	short $+2

loc_976E2:				; CODE XREF: MissionText_DrawTypewriterSynced_975CC+F6j
					; MissionText_DrawTypewriterSynced_975CC+FDj
		push	0
		mov	ax, [si+16h]
		dec	ax
		push	ax
		push	large 13F0000h
		push	0
		push	word_70E62
		call	Rect_ComputeIntersection_60F02
		add	sp, 0Ch
		push	0
		push	large 0C7013Fh
		mov	ax, [si+1Ah]
		inc	ax
		push	ax
		push	0
		push	word_70E62
		call	Rect_ComputeIntersection_60F02
		add	sp, 0Ch
		push	5130h
		call	Resource_AccessUnified
		pop	cx
		cmp	byte_721F0, 2
		jz	short loc_9772B
		jmp	loc_97863
; ���������������������������������������������������������������������������

loc_9772B:				; CODE XREF: MissionText_DrawTypewriterSynced_975CC+15Aj
		cmp	word_721F1, 0
		jnz	short loc_97735
		jmp	loc_97863
; ���������������������������������������������������������������������������

loc_97735:				; CODE XREF: MissionText_DrawTypewriterSynced_975CC+164j
		mov	ax, word_721F1
		mov	[bp+var_14], ax
		xor	dx, dx
		mov	cl, 0
		mov	ch, byte ptr [bp+var_14]
		jmp	loc_97859
; ���������������������������������������������������������������������������
		jmp	loc_97863
; ���������������������������������������������������������������������������
		jmp	loc_97863
; ���������������������������������������������������������������������������

loc_9774B:				; CODE XREF: MissionText_DrawTypewriterSynced_975CC+46j
		add	word ptr [si+14h], 10h
		sub	word ptr [si+18h], 10h
		add	word ptr [si+16h], 10h
		sub	word ptr [si+1Ah], 10h
		mov	ax, [si+14h]
		mov	[bp+var_16], ax
		mov	ax, [si+16h]
		mov	[bp+var_18], ax
		mov	ax, [si+18h]
		mov	[bp+var_1A], ax
		mov	ax, [si+1Ah]
		mov	[bp+var_1C], ax
		mov	ax, [bp+var_16]
		mov	[si+6],	ax
		mov	ax, [bp+var_18]
		mov	[si+8],	ax
		mov	ax, [bp+var_1A]
		mov	[si+0Ah], ax
		mov	ax, [bp+var_1C]
		mov	[si+0Ch], ax
		push	0A1h ; '�'
		push	ds
		push	offset word_72A94
		call	Text_TypewriterDrawChar
		add	sp, 6
		push	0BCh ; '�'
		call	AV_SyncComputeOffset
		pop	cx

loc_977A3:
		cmp	byte_721F0, 2

loc_977A8:
		jnz	short loc_977C8

loc_977AA:
		cmp	word_721F1, 0
		jz	short loc_977C8
		mov	ax, word_721F1
		mov	[bp+var_1E], ax
		xor	dx, dx
		mov	cl, 0
		mov	ch, byte ptr [bp+var_1E]
		mov	bx, 4355h
		mov	ax, 1209h
		int	15h
		jmp	short $+2

loc_977C8:				; CODE XREF: MissionText_DrawTypewriterSynced_975CC:loc_977A8j
					; MissionText_DrawTypewriterSynced_975CC+1E3j
		push	0
		mov	ax, [si+16h]
		dec	ax
		push	ax
		push	large 13F0000h
		push	0
		push	word_70E62
		call	Rect_ComputeIntersection_60F02
		add	sp, 0Ch
		push	0
		push	large 0C7013Fh
		mov	ax, [si+1Ah]
		inc	ax
		push	ax
		push	0
		push	word_70E62
		call	Rect_ComputeIntersection_60F02
		add	sp, 0Ch
		push	0
		push	word ptr [si+1Ah]
		mov	ax, [si+14h]
		dec	ax
		push	ax
		push	word ptr [si+16h]
		push	0
		push	word_70E62
		call	Rect_ComputeIntersection_60F02
		add	sp, 0Ch
		push	0
		push	word ptr [si+1Ah]
		push	13Fh
		push	word ptr [si+16h]
		mov	ax, [si+18h]
		inc	ax
		push	ax
		push	word_70E62
		call	Rect_ComputeIntersection_60F02
		add	sp, 0Ch
		push	5130h
		call	Resource_AccessUnified
		pop	cx
		cmp	byte_721F0, 2
		jnz	short loc_97863
		cmp	word_721F1, 0
		jz	short loc_97863
		mov	ax, word_721F1
		mov	[bp+var_20], ax
		xor	dx, dx
		mov	cl, 0
		mov	ch, byte ptr [bp+var_20]

loc_97859:				; CODE XREF: MissionText_DrawTypewriterSynced_975CC+176j
		mov	bx, 4355h
		mov	ax, 1209h
		int	15h
		jmp	short $+2

loc_97863:				; CODE XREF: MissionText_DrawTypewriterSynced_975CC+53j
					; MissionText_DrawTypewriterSynced_975CC+9Ej ...
		mov	word_6E1C2, si

loc_97867:				; CODE XREF: MissionText_DrawTypewriterSynced_975CC+11j
		pop	si
		leave
		retf
MissionText_DrawTypewriterSynced_975CC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle TextFormat_ReleaseStyleList_5E526.
; ==============================================================================================
MissionText_ReleaseStyleWrapper_9786A	proc far		; CODE XREF: VROOMM_StubThunk_6BBEAJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		cmp	word_6E1C2, dx
		jnz	short loc_9787E
		mov	word_6E1C2, 0
		jmp	short loc_9788A
; ���������������������������������������������������������������������������

loc_9787E:				; CODE XREF: MissionText_ReleaseStyleWrapper_9786A+Aj
		mov	ax, dx
		add	ax, 2
		push	ax
		call	TextFormat_ReleaseStyleList_5E526
		pop	cx

loc_9788A:				; CODE XREF: MissionText_ReleaseStyleWrapper_9786A+12j
		pop	bp
		retf
MissionText_ReleaseStyleWrapper_9786A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, libère 2 listes de style et un bloc (CRT_FreeNear_Wrap).
; ==============================================================================================
MissionText_ReleaseStyles_9788C	proc far		; CODE XREF: VROOMM_StubThunk_6BBEFJ

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_978D0
		mov	word ptr [si], 44Ch
		cmp	word_6E1C2, si
		jnz	short loc_978AB
		mov	word_6E1C2, 0

loc_978AB:				; CODE XREF: MissionText_ReleaseStyles_9788C+17j
		mov	ax, si
		add	ax, 10h
		push	ax
		call	TextFormat_ReleaseStyleList_5E526
		pop	cx
		mov	ax, si
		add	ax, 2
		push	ax
		call	TextFormat_ReleaseStyleList_5E526
		pop	cx
		test	di, 1
		jz	short loc_978D0
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_978D0:				; CODE XREF: MissionText_ReleaseStyles_9788C+Dj
					; MissionText_ReleaseStyles_9788C+3Bj
		pop	di
		pop	si
		pop	bp
		retf
MissionText_ReleaseStyles_9788C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle CRT_Strncpy_Pad.
; ==============================================================================================
MissionText_CopyStringField_978D4	proc far		; CODE XREF: VROOMM_StubThunk_6BC0DJ MissionText_Helper_97939+Cp

var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_0]
		push	8
		push	1902h
		mov	ax, si
		add	ax, 53h	; 'S'
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	byte ptr [si+5Bh], 0
		mov	[bp+var_4], 4E2000h
		mov	eax, [bp+var_4]
		mov	[si+44h], eax
		mov	[bp+var_8], 2D00h
		mov	eax, [bp+var_8]
		mov	[si+60h], eax
		mov	[bp+var_C], 2800h
		mov	eax, [bp+var_C]
		mov	[si], eax
		mov	word ptr [si+5Ch], 0
		mov	word ptr [si+5Eh], 0
		and	byte ptr [si+52h], 0FDh
		and	byte ptr [si+52h], 0FEh
		pop	si
		leave
		retf
MissionText_CopyStringField_978D4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (35 lignes).
; ==============================================================================================
MissionText_Helper_97939	proc far		; CODE XREF: VROOMM_StubThunk_6BC12J MissionText_ConstructFullOrientation_97A2D+118p

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh
arg_C		= dword	ptr  12h

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr MissionText_CopyStringField_978D4
		pop	cx
		mov	eax, [bp+arg_4]
		mov	[bp+var_4], eax
		shl	eax, 8
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	[si+44h], eax
		mov	eax, [bp+arg_8]
		mov	[si+60h], eax
		mov	eax, [bp+arg_C]
		mov	[si], eax
		mov	ax, [bp+arg_2]
		mov	[si+5Ch], ax
		pop	si
		leave
		retf
MissionText_Helper_97939	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine Formation_ComputeGeometryHelper_56D43, String_ConstructEmpty,
; ReadFieldGroupA_64A19.
; ==============================================================================================
MissionText_LoadFormationLabel_97979	proc far		; CODE XREF: VROOMM_StubThunk_6BC17J

var_2E		= word ptr -2Eh
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2Eh
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_97996
		push	80h ; '�'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_979FB

loc_97996:				; CODE XREF: MissionText_LoadFormationLabel_97979+Cj
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
		mov	ax, si
		add	ax, 60h	; '`'
		mov	ax, si
		add	ax, 64h	; 'd'
		mov	ax, si
		add	ax, 68h	; 'h'
		mov	ax, si
		add	ax, 6Ch	; 'l'
		mov	ax, si
		add	ax, 70h	; 'p'
		mov	ax, si
		add	ax, 74h	; 't'
		mov	ax, si
		add	ax, 78h	; 'x'
		mov	ax, si
		add	ax, 7Ch	; '|'
		push	large 2Eh ; '.'
		push	ss
		lea	ax, [bp+var_2E]
		push	ax
		push	[bp+arg_2]
		call	ResourceRecord_ReadFieldGroupA_64A19
		add	sp, 0Ah
		lea	ax, [bp+var_2E]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr MissionText_ConstructFullOrientation_97A2D
		add	sp, 4

loc_979FB:				; CODE XREF: MissionText_LoadFormationLabel_97979+1Bj
		mov	ax, si
		pop	si
		leave
		retf
MissionText_LoadFormationLabel_97979	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle CRT_MemFamily_Extra1.
; ==============================================================================================
MissionText_Helper2_97A00	proc far		; CODE XREF: VROOMM_StubThunk_6BC21J

var_2E		= word ptr -2Eh
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2Eh
		push	si
		mov	si, [bp+arg_0]
		push	2Eh ; '.'
		push	large [bp+arg_2]
		push	ss
		lea	ax, [bp+var_2E]
		push	ax
		call	CRT_MemFamily_Extra1
		add	sp, 0Ah
		lea	ax, [bp+var_2E]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr MissionText_ConstructFullOrientation_97A2D
		add	sp, 4
		pop	si
		leave
		retf
MissionText_Helper2_97A00	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 138 lignes, NON DÉTAILLÉE — combine Matrix_BuildFullOrientation_575B2 (seg116),
; Utility_Helper_55E11, allocation, copie de chaîne.
; ==============================================================================================
MissionText_ConstructFullOrientation_97A2D	proc far		; CODE XREF: VROOMM_StubThunk_6BC1CJ MissionText_LoadFormationLabel_97979+7Cp	...

var_2E		= dword	ptr -2Eh
var_2A		= dword	ptr -2Ah
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= dword	ptr -12h
var_E		= word ptr -0Eh
var_C		= dword	ptr -0Ch
var_8		= word ptr -8
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 22h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [di+18h]
		mov	[bp+var_2], ax
		movsx	eax, [bp+var_2]
		shl	eax, 8
		mov	[bp+var_6], eax
		lea	ax, [bp+var_6]
		push	ax
		mov	ax, [di+1Ah]
		mov	[bp+var_8], ax
		movsx	eax, [bp+var_8]
		shl	eax, 8
		mov	[bp+var_C], eax
		lea	ax, [bp+var_C]
		push	ax
		mov	ax, [di+16h]
		mov	[bp+var_E], ax
		movsx	eax, [bp+var_E]
		shl	eax, 8
		mov	[bp+var_12], eax
		lea	ax, [bp+var_12]
		push	ax
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	Matrix_BuildFullOrientation_575B2
		add	sp, 8
		push	large dword ptr	[di+12h]
		push	large dword ptr	[di+0Eh]
		push	large dword ptr	[di+0Ah]
		mov	ax, si
		add	ax, 14h
		push	ax

loc_97AA0:
		call	Utility_Helper_55E11

loc_97AA5:
		add	sp, 0Eh
		mov	ax, [di+26h]
		mov	[bp+var_14], ax
		mov	ax, [di+28h]
		mov	[bp+var_16], ax
		mov	ax, [di+2Ah]
		mov	[bp+var_18], ax
		mov	ax, [di+2Ch]
		mov	[bp+var_1A], ax
		push	1Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp+var_1C], ax
		or	ax, ax
		jz	short loc_97B0B
		mov	bx, [bp+var_1C]
		mov	word ptr [bx], 44Ch
		mov	word ptr [bx+2], 0
		mov	word ptr [bx+4], 0
		mov	byte ptr [bx+0Fh], 0
		mov	word ptr [bx+10h], 0
		mov	word ptr [bx+12h], 0
		mov	byte ptr [bx+1Dh], 0
		push	[bp+var_1A]
		push	[bp+var_18]
		push	[bp+var_16]
		push	[bp+var_14]
		push	ax
		push	cs
		call	near ptr MissionText_ApplyDualStyle_97540
		add	sp, 0Ah
		mov	ax, [bp+var_1C]
		jmp	short loc_97B0E
; ���������������������������������������������������������������������������

loc_97B0B:				; CODE XREF: MissionText_ConstructFullOrientation_97A2D+A0j
		mov	ax, [bp+var_1C]

loc_97B0E:				; CODE XREF: MissionText_ConstructFullOrientation_97A2D+DCj
		mov	[si+5Ch], ax
		sub	sp, 4
		mov	ax, di
		add	ax, 22h	; '"'
		mov	[bp+var_1E], ax
		mov	bx, [bp+var_1E]
		mov	eax, [bx]
		mov	[bp+var_2A], eax
		sub	sp, 4
		mov	ax, [di+20h]
		mov	[bp+var_20], ax
		movsx	eax, [bp+var_20]
		shl	eax, 8
		mov	[bp+var_2E], eax
		push	large dword ptr	[di+1Ch]
		push	word ptr [si+5Ch]
		push	si
		push	cs
		call	near ptr MissionText_Helper_97939
		add	sp, 10h
		mov	[bp+var_22], di
		push	8
		push	[bp+var_22]
		mov	ax, si
		add	ax, 53h	; 'S'
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	byte ptr [si+5Bh], 0
		pop	di
		pop	si
		leave
		retf
MissionText_ConstructFullOrientation_97A2D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (22 lignes).
; ==============================================================================================
MissionText_Helper3_97B69	proc far		; CODE XREF: VROOMM_StubThunk_6BC30J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+5Ch], 0
		jz	short loc_97B82
		push	word ptr [si+5Ch]
		mov	bx, [si+5Ch]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		pop	cx

loc_97B82:				; CODE XREF: MissionText_Helper3_97B69+Bj
		and	byte ptr [si+52h], 0FEh
		pop	si
		pop	bp
		retf
MissionText_Helper3_97B69	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle CRT_FreeNear_Wrap.
; ==============================================================================================
MissionText_ReleaseFree_97B89	proc far		; CODE XREF: VROOMM_StubThunk_6BC35J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_97BCF
		mov	word ptr [si+50h], 484h
		push	si
		mov	bx, [si+50h]
		call	dword ptr [bx+4]
		pop	cx
		cmp	word ptr [si+5Ch], 0
		jz	short loc_97BBD
		push	3

loc_97BAD:
		push	word ptr [si+5Ch]
		mov	bx, [si+5Ch]

loc_97BB3:
		mov	bx, [bx]
		call	dword ptr [bx+10h]

loc_97BB8:
		add	sp, 4
		jmp	short $+2

loc_97BBD:				; CODE XREF: MissionText_ReleaseFree_97B89+20j
		mov	word ptr [si+5Ch], 0
		test	di, 1
		jz	short loc_97BCF
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_97BCF:				; CODE XREF: MissionText_ReleaseFree_97B89+Dj
					; MissionText_ReleaseFree_97B89+3Dj
		pop	di
		pop	si
		pop	bp
		retf
MissionText_ReleaseFree_97B89	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle CRT_Fmemcpy.
; ==============================================================================================
MissionText_CopyBuffer_97BD3	proc far		; CODE XREF: VROOMM_StubThunk_6BC26J

var_8		= dword	ptr -8
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+5Ch], 0
		jz	short loc_97C2F
		push	word ptr [si+5Ch]
		mov	bx, [si+5Ch]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		sub	sp, 4
		mov	di, si
		add	di, 60h	; '`'
		mov	eax, [di]
		mov	[bp+var_8], eax
		push	si
		nop
		push	cs
		call	near ptr EntityScreenLayout_PrepareAndCompute
		add	sp, 6
		or	byte ptr [si+52h], 1
		mov	ax, si
		add	ax, 48h	; 'H'
		push	ds
		push	ax
		mov	ax, [si+5Ch]
		add	ax, 2
		jz	short loc_97C1F
		mov	ax, [si+5Ch]
		add	ax, 6
		jmp	short loc_97C25
; ���������������������������������������������������������������������������

loc_97C1F:				; CODE XREF: MissionText_CopyBuffer_97BD3+42j
		mov	ax, [si+5Ch]
		add	ax, 2

loc_97C25:				; CODE XREF: MissionText_CopyBuffer_97BD3+4Aj
		push	ds
		push	ax
		mov	cx, 8
		call	CRT_Fmemcpy

loc_97C2F:				; CODE XREF: MissionText_CopyBuffer_97BD3+Cj
		mov	al, [si+52h]
		and	ax, 1
		pop	di
		pop	si
		pop	bp
		retf
MissionText_CopyBuffer_97BD3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle Camera_DetachParent.
; ==============================================================================================
Camera_DetachParentWrapper_97C39	proc far		; CODE XREF: VROOMM_StubThunk_6BC2BJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, [si+52h]
		and	ax, 1
		or	al, al
		jz	short loc_97C59
		push	si
		call	Camera_DetachParent
		pop	cx
		push	si
		mov	bx, [si+50h]
		call	dword ptr [bx+8]
		pop	cx

loc_97C59:				; CODE XREF: Camera_DetachParentWrapper_97C39+Fj
		pop	si
		pop	bp
		retf
Camera_DetachParentWrapper_97C39	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle CRT_Fmemcpy.
; ==============================================================================================
MissionText_CopyBufferB_97C5C	proc far		; CODE XREF: VROOMM_StubThunk_6BBF4J MissionText_Helper4_97CB7+10p

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [di+8]
		sub	ax, [di+4]
		inc	ax
		mov	[si+4],	ax
		mov	ax, [di+0Ah]
		sub	ax, [di+6]
		inc	ax
		mov	[si+6],	ax
		mov	ax, [si+4]
		sar	ax, 1
		mov	dx, [di+4]
		add	dx, ax
		mov	[si+8],	dx
		mov	ax, [si+6]
		sar	ax, 1
		mov	dx, [di+6]
		add	dx, ax
		mov	[si+0Ah], dx
		mov	ax, si
		add	ax, 48h	; 'H'
		push	ds
		push	ax
		or	di, di
		jz	short loc_97CA7
		mov	ax, di
		add	ax, 4
		jmp	short loc_97CA9
; ���������������������������������������������������������������������������

loc_97CA7:				; CODE XREF: MissionText_CopyBufferB_97C5C+42j
		mov	ax, di

loc_97CA9:				; CODE XREF: MissionText_CopyBufferB_97C5C+49j
		push	ds
		push	ax

loc_97CAB:
		mov	cx, 8

loc_97CAE:
		call	CRT_Fmemcpy
		pop	di
		pop	si
		pop	bp
		retf
MissionText_CopyBufferB_97C5C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (19 lignes).
; ==============================================================================================
MissionText_Helper4_97CB7	proc far		; CODE XREF: VROOMM_StubThunk_6BBF9J EntityScreenLayout_PrepareAndCompute+Cp

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+5Ch]
		add	ax, 2
		push	ax
		push	si
		push	cs
		call	near ptr MissionText_CopyBufferB_97C5C
		add	sp, 4
		pop	si
		pop	bp
		retf
MissionText_Helper4_97CB7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (25 lignes).
; ==============================================================================================
MissionText_Helper5_97CD0	proc far		; CODE XREF: VROOMM_StubThunk_6BC08J

var_6		= dword	ptr -6
arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= dword	ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [bp+arg_6]
		mov	[si], eax
		sub	sp, 4
		mov	eax, [bp+arg_2]
		mov	[bp+var_6], eax
		push	si
		nop
		push	cs
		call	near ptr EntityScreenLayout_PrepareAndCompute
		add	sp, 6
		pop	si
		pop	bp
		retf
MissionText_Helper5_97CD0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 43L, LUE INTEGRALEMENT. RENOMMEE (ancien 'MissionText_Helper6' — aucune preuve que ce
; soit lie a du texte, garde generique en attendant confirmation). Appelle
; EntityScreenLayout_Helper4 (non lue), clampe une valeur d'angle/distance a 0x100 si non
; positive, la stocke sur l'entite (+0x60), puis appelle
; EntityScreenLayout_ComputeAngularPosition.
; ==============================================================================================
EntityScreenLayout_PrepareAndCompute	proc far		; CODE XREF: VROOMM_StubThunk_6BC03J MissionText_CopyBuffer_97BD3+2Bp	...

var_C		= dword	ptr -0Ch
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr MissionText_Helper4_97CB7
		pop	cx
		cmp	[bp+arg_2], 0
		jg	short loc_97D11
		mov	ax, 1
		jmp	short loc_97D13
; ���������������������������������������������������������������������������

loc_97D11:				; CODE XREF: EntityScreenLayout_PrepareAndCompute+15j
		xor	ax, ax

loc_97D13:				; CODE XREF: EntityScreenLayout_PrepareAndCompute+1Aj
		or	al, al
		jz	short loc_97D27
		mov	[bp+var_C], 100h
		mov	eax, [bp+var_C]
		mov	[bp+arg_2], eax

loc_97D27:				; CODE XREF: EntityScreenLayout_PrepareAndCompute+20j
		mov	eax, [bp+arg_2]
		mov	[si+60h], eax
		push	si
		nop
		push	cs
		call	near ptr EntityScreenLayout_ComputeAngularPosition
		pop	cx
		pop	si
		leave
		retf
EntityScreenLayout_PrepareAndCompute	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 207L, LUE INTEGRALEMENT. RENOMMEE (ancien 'MissionText_ComputeTrigonometricLayout' — le
; calcul trigonometrique est reel et verifie, mais RIEN ne confirme un rendu de texte : garde
; 'EntityScreenLayout' generique, pas 'Text', en attendant de tracer qui consomme le resultat
; +0xC/+0x10). Calcule une position ecran a partir d'un angle (+0x60) et des dimensions de
; l'entite (+4/+6) : plusieurs Sin/Tan/ArcTan enchaines, division par les dimensions, mise a
; l'echelle finale via dword_6E9AA. Ecrit le resultat en +0xC/+0x10 (coordonnees finales) et
; +0x64/0x68/0x6C/0x70/0x74 (valeurs intermediaires). NE DESSINE RIEN elle-meme — calcule
; seulement une position, stockee sur l'objet, consommee ailleurs (non trace).
; ==============================================================================================
EntityScreenLayout_ComputeAngularPosition	proc far		; CODE XREF: VROOMM_StubThunk_6BBFEJ EntityScreenLayout_PrepareAndCompute+3Dp

var_7C		= dword	ptr -7Ch
var_78		= dword	ptr -78h
var_74		= dword	ptr -74h
var_70		= dword	ptr -70h
var_6C		= dword	ptr -6Ch
var_68		= dword	ptr -68h
var_64		= dword	ptr -64h
var_60		= dword	ptr -60h
var_5C		= word ptr -5Ch
var_58		= dword	ptr -58h
var_54		= dword	ptr -54h
var_50		= dword	ptr -50h
var_4C		= dword	ptr -4Ch
var_48		= word ptr -48h
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
var_14		= word ptr -14h
var_12		= dword	ptr -12h
var_E		= word ptr -0Eh
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 7Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, si
		add	ax, 60h	; '`'
		push	ax
		push	ss
		lea	ax, [bp+var_4]
		push	ax
		call	Math_Sin_5483F
		add	sp, 6
		mov	eax, [bp+var_4]
		mov	[si+64h], eax
		mov	ax, [si+4]
		sar	ax, 1
		mov	[bp+var_E], ax
		movsx	eax, [bp+var_E]
		shl	eax, 8
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		mov	[bp+var_C], eax
		mov	ax, [si+6]
		sar	ax, 1
		mov	[bp+var_14], ax
		movsx	eax, [bp+var_14]
		shl	eax, 8
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_8], eax
		push	large 0
		push	eax
		push	large [bp+var_C]

loc_97DA2:
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax

loc_97DAB:
		add	sp, 0Ch

loc_97DAE:
		mov	[bp+var_20], eax

loc_97DB2:
		mov	[bp+var_24], eax
		mov	ax, si
		add	ax, 60h	; '`'
		push	ax
		push	ss
		lea	ax, [bp+var_28]
		push	ax
		call	Math_Tan_548AD
		add	sp, 6
		mov	di, si
		mov	eax, [bp+var_28]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_2C]
		mov	[bp+var_30], eax
		mov	eax, [bp+var_24]
		mov	edx, eax
		mov	ecx, [bp+var_30]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_34], eax
		mov	eax, [bp+var_34]
		mov	[bp+var_1C], eax
		mov	di, si
		mov	eax, [bp+var_8]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_38], eax
		mov	eax, [bp+var_38]
		mov	[bp+var_3C], eax
		mov	[si+70h], eax
		mov	di, si
		mov	eax, [bp+var_C]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_40], eax
		mov	eax, [bp+var_40]
		mov	[bp+var_44], eax
		mov	[si+74h], eax
		mov	ax, si
		add	ax, 70h	; 'p'
		push	ax
		push	ss
		lea	ax, [bp+var_48]
		push	ax
		call	Math_ArcTan_54ADE
		add	sp, 6
		lea	ax, [bp+var_48]
		push	ax
		push	ss
		lea	ax, [bp+var_4C]
		push	ax
		call	Math_Sin_5483F
		add	sp, 6
		mov	[bp+var_50], 100h
		mov	eax, [bp+var_50]
		mov	edx, eax
		mov	ecx, [bp+var_4C]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_54], eax
		mov	eax, [bp+var_54]
		mov	[bp+var_58], eax
		mov	[si+68h], eax
		mov	ax, si
		add	ax, 74h	; 't'
		push	ax
		push	ss
		lea	ax, [bp+var_5C]
		push	ax

loc_97EB3:
		call	Math_ArcTan_54ADE
		add	sp, 6
		lea	ax, [bp+var_5C]
		push	ax
		push	ss
		lea	ax, [bp+var_60]
		push	ax
		call	Math_Sin_5483F
		add	sp, 6
		mov	[bp+var_64], 100h
		mov	eax, [bp+var_64]
		mov	edx, eax
		mov	ecx, [bp+var_60]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_68], eax
		mov	eax, [bp+var_68]
		mov	[bp+var_6C], eax
		mov	[si+6Ch], eax
		mov	eax, [si]
		mov	edx, [bp+var_1C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_70], eax
		mov	eax, [bp+var_70]
		mov	[bp+var_74], eax
		mov	[si+0Ch], eax
		mov	eax, [si+0Ch]
		mov	edx, dword_6E9AA
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_78], eax
		mov	eax, [bp+var_78]
		mov	[bp+var_7C], eax
		mov	[si+10h], eax
		pop	di
		pop	si
		leave
		retf
EntityScreenLayout_ComputeAngularPosition	endp

ovr287		ends

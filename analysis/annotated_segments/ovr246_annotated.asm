ovr246		segment	para public 'OVERLAY' use16
		assume cs:ovr246
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine thunk voisin et copie de chaîne (42 lignes).
; ==============================================================================================
HUDSymbol_Helper14_853B0	proc far		; CODE XREF: VROOMM_StubThunk_6B0EEJ HUDSymbol_ConstructAndInitAngleF_854F9+B2p	...

var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= dword	ptr  0Ch
arg_A		= dword	ptr  10h
arg_E		= dword	ptr  14h

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		sub	sp, 4
		mov	eax, [bp+arg_E]
		mov	[bp+var_8], eax
		sub	sp, 4
		mov	eax, [bp+arg_A]
		mov	[bp+var_C], eax
		push	large [bp+arg_6]
		push	[bp+arg_2]
		push	si
		call	VROOMM_StubThunk_6BC12
		add	sp, 10h
		mov	ax, [bp+arg_4]
		mov	[bp+var_2], ax
		push	8
		push	ax
		mov	ax, si
		add	ax, 80h	; '�'
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	byte ptr [si+88h], 0
		pop	si
		leave
		retf
HUDSymbol_Helper14_853B0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, même motif que HUDSymbol_ConstructVariantA_804F0.
; ==============================================================================================
HUDSymbol_ConstructVariantJ_853FF	proc far		; CODE XREF: VROOMM_StubThunk_6B0F3J

var_24		= word ptr -24h
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 24h
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_8541C
		push	8Bh ; '�'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_85477

loc_8541C:				; CODE XREF: HUDSymbol_ConstructVariantJ_853FF+Cj
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	Formation_ComputeGeometryHelper_56D43
		pop	cx
		mov	word ptr [si+50h], 484h
		mov	ax, si
		add	ax, 53h	; 'S'

loc_85432:
		push	ax

loc_85433:
		call	String_ConstructEmpty
		pop	cx
		push	si

loc_8543A:
		call	VROOMM_StubThunk_6BC0D
		pop	cx

loc_85440:
		mov	word ptr [si+50h], 67Eh
		mov	ax, si
		add	ax, 80h	; '�'
		push	ax
		call	String_ConstructEmpty
		pop	cx

loc_85451:
		mov	word ptr [si+89h], 0
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
		call	near ptr HUDSymbol_ConstructAndInitAngleF_854F9
		add	sp, 4

loc_85477:				; CODE XREF: HUDSymbol_ConstructVariantJ_853FF+1Bj
		mov	ax, si
		pop	si
		leave
		retf
HUDSymbol_ConstructVariantJ_853FF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, même motif que HUDSymbol_ConstructVariantA_804F0.
; ==============================================================================================
HUDSymbol_ConstructVariantK_8547C	proc far		; CODE XREF: VROOMM_StubThunk_6B0FDJ

var_24		= word ptr -24h
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 24h
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_85499
		push	8Bh ; '�'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_854F4

loc_85499:				; CODE XREF: HUDSymbol_ConstructVariantK_8547C+Cj
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
		call	near ptr HUDSymbol_ConstructAndInitAngleF_854F9
		add	sp, 4

loc_854F4:				; CODE XREF: HUDSymbol_ConstructVariantK_8547C+1Bj
		mov	ax, si
		pop	si
		leave
		retf
HUDSymbol_ConstructVariantK_8547C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, même motif que HUDSymbol_ConstructAndInitAngle_80701.
; ==============================================================================================
HUDSymbol_ConstructAndInitAngleF_854F9	proc far		; CODE XREF: VROOMM_StubThunk_6B0F8J HUDSymbol_ConstructVariantJ_853FF+72p	...

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
		jz	short loc_8556B
		mov	bx, [bp+var_A]
		mov	word ptr [bx], 44Ch
		mov	word ptr [bx+2], 0
		mov	word ptr [bx+4], 0
		mov	byte ptr [bx+0Fh], 0

loc_85543:
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
		jmp	short loc_8556E
; ���������������������������������������������������������������������������

loc_8556B:				; CODE XREF: HUDSymbol_ConstructAndInitAngleF_854F9+33j
		mov	ax, [bp+var_A]

loc_8556E:				; CODE XREF: HUDSymbol_ConstructAndInitAngleF_854F9+70j
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
		push	cs
		call	near ptr HUDSymbol_Helper14_853B0
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
		pop	di
		pop	si
		leave
		retf
HUDSymbol_ConstructAndInitAngleF_854F9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine une opération de conteneur et SetReference16.
; ==============================================================================================
HUDSymbol_ConstructWithContainerOpB_855E1	proc far		; CODE XREF: VROOMM_StubThunk_6B102J Camera_OrbitReset_85878+Dp

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+89h], 0
		jnz	short loc_8561E
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

loc_8561E:				; CODE XREF: HUDSymbol_ConstructWithContainerOpB_855E1+Fj
		cmp	word ptr [si+89h], 0
		jz	short loc_85634
		cmp	word ptr [si+5Ch], 0
		jz	short loc_85634
		push	si
		call	VROOMM_StubThunk_6BC26
		pop	cx
		jmp	short loc_85636
; ���������������������������������������������������������������������������

loc_85634:				; CODE XREF: HUDSymbol_ConstructWithContainerOpB_855E1+42j
					; HUDSymbol_ConstructWithContainerOpB_855E1+48j
		mov	al, 0

loc_85636:				; CODE XREF: HUDSymbol_ConstructWithContainerOpB_855E1+51j
		pop	si
		leave
		retf
HUDSymbol_ConstructWithContainerOpB_855E1	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, invalide une référence faible (20 lignes).
; ==============================================================================================
HUDSymbol_ReleaseRefConditionalB_85639	proc far		; CODE XREF: VROOMM_StubThunk_6B107J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	VROOMM_StubThunk_6BC30
		pop	cx
		mov	ax, si
		add	ax, 89h	; '�'
		push	ax
		call	WeakRef_InvalidateIfSet
		pop	cx
		pop	si
		pop	bp
		retf
HUDSymbol_ReleaseRefConditionalB_85639	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, même motif que HUDSymbol_ConstructVariantA_804F0.
; ==============================================================================================
HUDSymbol_ConstructVariantL_85656	proc far		; CODE XREF: VROOMM_StubThunk_6B10CJ

var_30		= word ptr -30h
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 30h
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_85673
		push	0BBh ; '�'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_856EE

loc_85673:				; CODE XREF: HUDSymbol_ConstructVariantL_85656+Cj
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
		mov	word ptr [si+50h], 79Ch
		mov	ax, si
		add	ax, 8Bh	; '�'
		push	ax
		call	Formation_ComputeGeometryHelper_56D43
		pop	cx
		mov	ax, si
		add	ax, 0AFh ; '�'
		mov	ax, si
		add	ax, 0B3h ; '�'
		mov	ax, si
		add	ax, 0B7h ; '�'
		push	large 30h ; '0'
		push	ss
		lea	ax, [bp+var_30]
		push	ax
		push	[bp+arg_2]
		call	ResourceRecord_ReadFieldGroupA_64A19
		add	sp, 0Ah
		lea	ax, [bp+var_30]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr HUDSymbol_ConstructAndInitAngleG_85790
		add	sp, 4

loc_856EE:				; CODE XREF: HUDSymbol_ConstructVariantL_85656+1Bj
		mov	ax, si
		pop	si
		leave
		retf
HUDSymbol_ConstructVariantL_85656	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, CONSTRUCTEUR DE L'ENTRÉE CAMR 'CHAS' (ex-'HUDSymbol_ConstructVariantM' — FAUX). Appelé
; depuis Cinematic_LoadCameraDef_23E7D (case CHAS) via stub 6B116. Alloc 0xBB o -> si ;
; Formation_ComputeGeometryHelper_56D43(si+0x20) (matrice 3x3) ; [si+0x50]=0x484 ->
; String_ConstructEmpty(si+0x53) -> thunk 6BC0D -> [si+0x50]=0x67E ->
; String_ConstructEmpty(si+0x80) -> [si+0x89]=0 -> [si+0x50]=0x79C (VTABLE FINALE, tag encode
; le type de caméra ; CKPT=0x778 cf. sub_859C7) ->
; Formation_ComputeGeometryHelper_56D43(si+0x8B) (2e matrice) ; CRT_MemFamily_Extra1(&buf,
; payload, 0x30) ; HUDSymbol_ConstructAndInitAngleG_85790(si,&buf). Champs de l'entrée :
; +0x14/18/1C position caméra monde 24.8, +0x20 & +0x8B matrices, +0x50 vtable (0x79C :
; [0x14]=Camera_ExternalViewComputeMain_1519E), +0x53 nom caméra, +0x5C sous-objet viewport
; (rect payload[+0x28..0x2F]), +0x60 dword param (seuil chase = queue des params du chunk),
; +0x89 pointeur entité sujet (lié par nom via HUDSymbol_Helper14_853B0 depuis payload+0x16),
; +0x80 string nom sujet. Payload 0x30 o : [0x00]char8 nom, [0x08]14o gap, [0x16]char8 sujet,
; [0x1E]u32 farClip, [0x22]u16 fov, [0x24]u32 nearClip, [0x28]u16x4 rect viewport.
; ==============================================================================================
Cinematic_CamEntryConstruct_CHAS_856F3	proc far		; CODE XREF: VROOMM_StubThunk_6B116J

var_30		= word ptr -30h
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 30h
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_85710
		push	0BBh ; '�'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_8578B

loc_85710:				; CODE XREF: Cinematic_CamEntryConstruct_CHAS_856F3+Cj
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

loc_8572E:
		call	VROOMM_StubThunk_6BC0D

loc_85733:
		pop	cx

loc_85734:
		mov	word ptr [si+50h], 67Eh

loc_85739:
		mov	ax, si
		add	ax, 80h	; '�'
		push	ax

loc_8573F:
		call	String_ConstructEmpty

loc_85744:
		pop	cx
		mov	word ptr [si+89h], 0
		mov	word ptr [si+50h], 79Ch
		mov	ax, si
		add	ax, 8Bh	; '�'
		push	ax
		call	Formation_ComputeGeometryHelper_56D43
		pop	cx
		mov	ax, si
		add	ax, 0AFh ; '�'
		mov	ax, si
		add	ax, 0B3h ; '�'
		mov	ax, si
		add	ax, 0B7h ; '�'
		push	30h ; '0'
		push	large [bp+arg_2]
		push	ss
		lea	ax, [bp+var_30]
		push	ax
		call	CRT_MemFamily_Extra1
		add	sp, 0Ah
		lea	ax, [bp+var_30]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr HUDSymbol_ConstructAndInitAngleG_85790
		add	sp, 4

loc_8578B:				; CODE XREF: Cinematic_CamEntryConstruct_CHAS_856F3+1Bj
		mov	ax, si
		pop	si
		leave
		retf
Cinematic_CamEntryConstruct_CHAS_856F3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, même motif que HUDSymbol_ConstructAndInitAngle_80701.
; ==============================================================================================
HUDSymbol_ConstructAndInitAngleG_85790	proc far		; CODE XREF: VROOMM_StubThunk_6B111J HUDSymbol_ConstructVariantL_85656+92p	...

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
		mov	ax, [di+28h]
		mov	[bp+var_2], ax
		mov	ax, [di+2Ah]
		mov	[bp+var_4], ax
		mov	ax, [di+2Ch]
		mov	[bp+var_6], ax
		mov	ax, [di+2Eh]
		mov	[bp+var_8], ax
		push	1Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp+var_A], ax
		or	ax, ax
		jz	short loc_85802
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
		jmp	short loc_85805
; ���������������������������������������������������������������������������

loc_85802:				; CODE XREF: HUDSymbol_ConstructAndInitAngleG_85790+33j
		mov	ax, [bp+var_A]

loc_85805:				; CODE XREF: HUDSymbol_ConstructAndInitAngleG_85790+70j
		mov	[si+5Ch], ax
		sub	sp, 4
		mov	ax, di
		add	ax, 24h	; '$'
		mov	[bp+var_C], ax
		mov	bx, [bp+var_C]
		mov	eax, [bx]
		mov	[bp+var_1A], eax
		sub	sp, 4
		mov	ax, [di+22h]
		mov	[bp+var_E], ax
		movsx	eax, [bp+var_E]
		shl	eax, 8

loc_8582F:
		mov	[bp+var_1E], eax
		push	large dword ptr	[di+1Eh]
		mov	ax, di
		add	ax, 16h
		push	ax
		push	word ptr [si+5Ch]
		push	si
		push	cs
		call	near ptr HUDSymbol_Helper14_853B0
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
		pop	di
		pop	si
		leave
		retf
HUDSymbol_ConstructAndInitAngleG_85790	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 125L (ex-'HUDSymbol_ComputeAndClipTest', NON DÉTAILLÉE). RESET/INIT DE LA CAMÉRA
; ORBITALE (CHASE/ROTA/TARGET). Slot [0x1C] de la vtable d'entrée caméra (CODE XREF
; sub_6B11B). si = objet entrée. (1) sub_855E1(si) ; bail si si[+0x89] (sujet) == 0. (2)
; Matrix_BuildFromAngle_56D72(si+0x8B) -> RÉINITIALISE LA MATRICE D'ORBITE à l'identité. (3) R
; = si[+0x89]->vtable[0x3C]() ; AI_ComputeGeometryHelper_56E29(&R, si+0x20) -> sème la matrice
; de visée si[+0x20] depuis l'orientation du sujet. (4) DISTANCES D'ORBITE dérivées de la
; taille du sujet : e = subject[+0x20] (dword) ; si[+0xB7] (min) = e ; si[+0xAF] (recul
; courant) = e*2 ; si[+0xB3] (max) = e*4. (5) lit si[+0x2C]... (suite non détaillée).
; subject[+0x20] = champ dword du WorldObject sujet (= parent[+8][+0x10] via
; Debris_BodyAttachToSubpart_37C89 ; probable rayon englobant / taille caractéristique de
; l'avion, 24.8). => recul chase = taille_avion * 2 ; zoom entre *1 et *4. Consommé par
; Camera_OrbitTrackCompute_1493A (§4bis). Voir CAMERA_SYSTEM.md §4bis.
; ==============================================================================================
Camera_OrbitReset_85878	proc far		; CODE XREF: VROOMM_StubThunk_6B11BJ

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
		sub	sp, 1Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr HUDSymbol_ConstructWithContainerOpB_855E1
		pop	cx
		cmp	word ptr [si+89h], 0
		jnz	short loc_85893
		jmp	loc_859BD
; ���������������������������������������������������������������������������

loc_85893:				; CODE XREF: Camera_OrbitReset_85878+16j
		mov	ax, si
		add	ax, 8Bh	; '�'
		push	ax
		call	Matrix_BuildFromAngle_56D72
		pop	cx
		push	word ptr [si+89h]
		mov	bx, [si+89h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	AI_ComputeGeometryHelper_56E29
		add	sp, 4
		mov	bx, [si+89h]
		mov	eax, [bx+20h]
		mov	[si+0B7h], eax
		mov	eax, [si+0B7h]
		shl	eax, 1
		mov	[bp+var_4], eax
		mov	[bp+var_8], eax
		mov	[si+0AFh], eax
		mov	eax, [si+0AFh]
		shl	eax, 1
		mov	[bp+var_C], eax
		mov	[bp+var_10], eax
		mov	[si+0B3h], eax
		mov	di, si
		add	di, 2Ch	; ','
		mov	eax, [di]
		mov	[bp+var_1C], eax
		mov	eax, [di+4]
		mov	[bp+var_18], eax
		mov	eax, [di+8]
		mov	[bp+var_14], eax
		lea	ax, [bp+var_1C]
		push	ax
		call	Utility_Helper_55A37
		pop	cx
		mov	di, si
		add	di, 0B3h ; '�'
		mov	eax, [bp+var_1C]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8

loc_8592E:
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_18]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8

loc_85941:
		mov	[bp+var_18], eax
		mov	eax, [bp+var_14]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_14], eax
		mov	di, [si+89h]
		add	di, 12h
		mov	eax, [di]
		mov	[si+14h], eax
		mov	eax, [di+4]
		mov	[si+18h], eax
		mov	eax, [di+8]
		mov	[si+1Ch], eax
		lea	ax, [bp+var_1C]
		push	ax
		push	word ptr [si+89h]
		push	si
		call	Camera_ClipTestWrapper
		add	sp, 6
		mov	di, [si+89h]
		add	di, 12h
		mov	eax, [di]
		add	[bp+var_1C], eax
		mov	eax, [di+4]
		add	[bp+var_18], eax
		mov	eax, [di+8]
		add	[bp+var_14], eax
		mov	eax, [bp+var_1C]
		mov	[si+14h], eax
		mov	eax, [bp+var_18]
		mov	[si+18h], eax
		mov	eax, [bp+var_14]
		mov	[si+1Ch], eax

loc_859BD:				; CODE XREF: Camera_OrbitReset_85878+18j
		mov	al, [si+52h]
		and	ax, 1
		pop	di
		pop	si
		leave
		retf
Camera_OrbitReset_85878	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, CONSTRUCTEUR DE L'ENTRÉE CAMR 'CKPT' (ex-'HUDSymbol_ConstructVariantN' — FAUX). Appelé
; depuis Cinematic_LoadCameraDef_23E7D (case CKPT) via stub 6B120. Même motif que sub_856F3
; mais [si+0x50] FINAL = 0x778 (vtable CKPT, distincte de CHAS 0x79C) ; payload lu sur 0x24 o
; via ResourceRecord_ReadFieldGroupA_64A19 ; finalise par
; TextScrollDisplay_FormatAndCache_85ACB. Vue première personne : pas de rect viewport.
; ==============================================================================================
Cinematic_CamEntryConstruct_CKPT_859C7	proc far		; CODE XREF: VROOMM_StubThunk_6B120J

var_24		= word ptr -24h
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 24h
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_859E4
		push	8Bh ; '�'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_85A44

loc_859E4:				; CODE XREF: Cinematic_CamEntryConstruct_CKPT_859C7+Cj
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
		mov	word ptr [si+50h], 778h
		push	large 24h ; '$'
		push	ss
		lea	ax, [bp+var_24]
		push	ax
		push	[bp+arg_2]
		call	ResourceRecord_ReadFieldGroupA_64A19

loc_85A34:
		add	sp, 0Ah

loc_85A37:
		lea	ax, [bp+var_24]
		push	ax
		push	si
		nop
		push	cs

loc_85A3E:
		call	near ptr TextScrollDisplay_FormatAndCache_85ACB

loc_85A41:
		add	sp, 4

loc_85A44:				; CODE XREF: Cinematic_CamEntryConstruct_CKPT_859C7+1Bj
		mov	ax, si
		pop	si
		leave
		retf
Cinematic_CamEntryConstruct_CKPT_859C7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, même motif que HUDSymbol_ConstructVariantA_804F0.
; ==============================================================================================
HUDSymbol_ConstructVariantO_85A49	proc far		; CODE XREF: VROOMM_StubThunk_6B12AJ

var_24		= word ptr -24h
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 24h
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_85A66
		push	8Bh ; '�'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_85AC6

loc_85A66:				; CODE XREF: HUDSymbol_ConstructVariantO_85A49+Cj
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
		mov	word ptr [si+50h], 778h
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
		call	near ptr TextScrollDisplay_FormatAndCache_85ACB
		add	sp, 4

loc_85AC6:				; CODE XREF: HUDSymbol_ConstructVariantO_85A49+1Bj
		mov	ax, si
		pop	si
		leave
		retf
HUDSymbol_ConstructVariantO_85A49	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 197 lignes, NON DÉTAILLÉE — combine copie de chaîne,
; CachedObject_Allocate_5DA48/ConstructVariantB_5DB0D (seg141), CRT_Doprnt_Dispatch —
; formatage et mise en cache de texte défilant.
; ==============================================================================================
TextScrollDisplay_FormatAndCache_85ACB	proc far		; CODE XREF: VROOMM_StubThunk_6B125J
					; Cinematic_CamEntryConstruct_CKPT_859C7:loc_85A3Ep	...

var_40		= dword	ptr -40h
var_3C		= dword	ptr -3Ch
var_34		= word ptr -34h
var_13		= byte ptr -13h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_2		= byte ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 34h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		add	ax, 12h
		mov	[bp+var_C], ax
		push	8
		push	ax
		lea	ax, [bp+var_A]
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	[bp+var_2], 0
		mov	[bp+var_E], si
		push	2C8h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_85B07
		jmp	loc_85CAA
; ���������������������������������������������������������������������������

loc_85B07:				; CODE XREF: TextScrollDisplay_FormatAndCache_85ACB+37j
		mov	word ptr [di], 44Ch
		mov	word ptr [di+2], 0
		mov	word ptr [di+4], 0
		mov	byte ptr [di+0Fh], 0
		mov	word ptr [di+10h], 0
		mov	word ptr [di+12h], 0
		mov	byte ptr [di+1Dh], 0
		mov	word ptr [di], 764h
		mov	word ptr [di+26h], 75Ch
		xor	ax, ax
		mov	[di+2Ah], ax
		mov	[di+28h], ax
		mov	word ptr [di+26h], 760h
		mov	ax, di
		add	ax, 2Ch	; ','
		push	ax
		call	CachedObject_Allocate_5DA48
		pop	cx
		push	seg stub258
		push	offset VROOMM_StubThunk_6B584
		push	large 10002h
		push	48h ; 'H'
		mov	ax, di
		add	ax, 4Ch	; 'L'
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	ax, di
		add	ax, 2Ch	; ','
		push	ds
		push	ax
		push	1
		push	2
		push	large 0
		lea	ax, [bp+var_34]
		push	ax
		call	CachedObject_ConstructVariantB_5DB0D
		add	sp, 0Ah
		push	ds
		push	ax
		mov	cx, 20h	; ' '
		call	CRT_Fmemcpy
		mov	word ptr [di+0DCh], 0
		mov	word ptr [di+0EEh], 0
		push	2
		lea	ax, [bp+var_34]
		push	ax
		call	CachedObject_Destruct_5DC87
		add	sp, 4
		mov	word ptr [di+0F5h], 73Ch
		mov	word ptr [di+0F9h], 0
		mov	word ptr [di+0FBh], 0
		mov	byte ptr [di+106h], 0
		mov	word ptr [di+107h], 0
		mov	word ptr [di+109h], 0
		mov	byte ptr [di+114h], 0
		mov	byte ptr [di+115h], 1
		mov	byte ptr [di+116h], 0
		mov	word ptr [di+0F5h], 74Ch
		mov	dword ptr [di+129h], 0
		mov	byte ptr [di+12Dh], 2
		mov	byte ptr [di+12Eh], 0
		mov	dword ptr [di+12Fh], 0
		mov	dword ptr [di+135h], 0
		mov	byte ptr [di+139h], 2
		mov	byte ptr [di+13Ah], 0
		mov	dword ptr [di+13Bh], 0
		mov	ax, di
		add	ax, 143h
		push	ax
		call	Formation_ComputeGeometryHelper_56D43
		pop	cx
		mov	dword ptr [di+208h], 0
		mov	byte ptr [di+20Ch], 2
		mov	byte ptr [di+20Dh], 0
		mov	dword ptr [di+20Eh], 0

loc_85C3B:
		mov	dword ptr [di+212h], 0
		mov	byte ptr [di+216h], 2
		mov	byte ptr [di+217h], 0
		mov	dword ptr [di+218h], 0
		mov	ax, di
		add	ax, 220h
		push	ax
		call	StreamReader_ConstructVariantA_63A39
		pop	cx
		mov	word ptr [di+220h], 2C8h
		mov	dword ptr [di+281h], 100h
		mov	dword ptr [di+27Dh], 0
		mov	word ptr [di+220h], 2E0h
		mov	word ptr [di+29Ch], 0
		xor	ax, ax
		mov	[di+29Ah], ax
		movsx	eax, ax
		mov	[di+285h], eax
		lea	ax, [bp+var_A]
		push	ax
		push	[bp+var_E]
		push	di
		call	VROOMM_StubThunk_6B209
		add	sp, 6
		mov	ax, di
		jmp	short loc_85CAC
; ���������������������������������������������������������������������������

loc_85CAA:				; CODE XREF: TextScrollDisplay_FormatAndCache_85ACB+39j
		mov	ax, di

loc_85CAC:				; CODE XREF: TextScrollDisplay_FormatAndCache_85ACB+1DDj
		mov	[si+5Ch], ax
		sub	sp, 4
		mov	di, [bp+arg_2]
		add	di, 20h	; ' '
		mov	eax, [di]
		mov	[bp+var_3C], eax
		sub	sp, 4
		mov	bx, [bp+arg_2]
		mov	ax, [bx+1Eh]
		mov	[bp+var_10], ax
		movsx	eax, [bp+var_10]
		shl	eax, 8
		mov	[bp+var_40], eax
		push	large dword ptr	[bx+1Ah]
		mov	ax, [bp+arg_2]
		add	ax, 0Ah
		push	ax
		push	word ptr [si+5Ch]
		push	si
		push	cs
		call	near ptr HUDSymbol_Helper14_853B0
		add	sp, 12h
		mov	ax, [bp+arg_2]
		mov	[bp+var_12], ax
		push	8
		push	ax
		mov	ax, si
		add	ax, 53h	; 'S'
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	byte ptr [si+5Bh], 0
		mov	bx, [bp+arg_2]
		mov	al, [bx+8]
		mov	[bp+var_13], al
		and	ax, 1
		and	byte ptr [si+52h], 0FDh
		shl	al, 1
		or	[si+52h], al
		pop	di
		pop	si
		leave
		retf
TextScrollDisplay_FormatAndCache_85ACB	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine une opération de conteneur et SetReference16.
; ==============================================================================================
HUDSymbol_ConstructWithContainerOpC_85D22	proc far		; CODE XREF: VROOMM_StubThunk_6B12FJ

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

loc_85D34:
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
		cmp	word ptr [si+89h], 0
		jz	short loc_85D88
		cmp	word ptr [si+5Ch], 0
		jz	short loc_85D88
		push	word ptr [si+5Ch]
		mov	bx, [si+5Ch]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		or	byte ptr [si+52h], 1
		push	word_6E4B2
		call	VROOMM_StubThunk_6B21D
		pop	cx
		push	si
		mov	bx, [si+50h]
		call	dword ptr [bx+10h]
		pop	cx
		jmp	short loc_85D8C
; ���������������������������������������������������������������������������

loc_85D88:				; CODE XREF: HUDSymbol_ConstructWithContainerOpC_85D22+3Bj
					; HUDSymbol_ConstructWithContainerOpC_85D22+41j
		and	byte ptr [si+52h], 0FEh

loc_85D8C:				; CODE XREF: HUDSymbol_ConstructWithContainerOpC_85D22+64j
		mov	al, [si+52h]
		and	ax, 1
		pop	si
		leave
		retf
HUDSymbol_ConstructWithContainerOpC_85D22	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine Resource_InitTwoChannels et Video_SetHorizontalShake — initialisation d'un
; effet de tremblement d'écran (impact/explosion).
; ==============================================================================================
Video_InitShakeEffect_85D95	proc far		; CODE XREF: VROOMM_StubThunk_6B134J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		call	Resource_InitTwoChannels
		push	si
		call	VROOMM_StubThunk_6BC2B
		pop	cx
		push	0
		call	Video_SetHorizontalShake
		pop	cx
		pop	si
		pop	bp
		retf
Video_InitShakeEffect_85D95	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle UI_PositionListLabels (13 lignes).
; ==============================================================================================
UI_PositionListLabelsWrapper_85DB3	proc far		; CODE XREF: VROOMM_StubThunk_6B0E9J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		call	UI_PositionListLabels
		pop	cx
		pop	bp
		retf
UI_PositionListLabelsWrapper_85DB3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (10 lignes).
; ==============================================================================================
HUDSymbol_Helper15_85DC2	proc far		; CODE XREF: VROOMM_StubThunk_6B0E4J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
HUDSymbol_Helper15_85DC2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle LinkedListB_Helper_5F66B (seg159).
; ==============================================================================================
HUDSymbol_ReleaseListEntry_85DCA	proc far		; CODE XREF: VROOMM_StubThunk_6B0DFJ

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_85DF1
		mov	word ptr [si], 75Ch
		push	si
		call	LinkedListB_Helper_5F66B
		pop	cx
		test	di, 1
		jz	short loc_85DF1
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_85DF1:				; CODE XREF: HUDSymbol_ReleaseListEntry_85DCA+Dj
					; HUDSymbol_ReleaseListEntry_85DCA+1Ej
		pop	di
		pop	si
		pop	bp
		retf
HUDSymbol_ReleaseListEntry_85DCA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle LinkedListB_Helper_5F66B via thunk voisin.
; ==============================================================================================
HUDSymbol_ReleaseListEntryB_85DF5	proc far		; CODE XREF: VROOMM_StubThunk_6B0DAJ

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_85E27
		mov	word ptr [si], 760h
		push	si
		call	VROOMM_StubThunk_6B2B3
		pop	cx
		mov	word ptr [si], 75Ch
		push	si
		call	LinkedListB_Helper_5F66B
		pop	cx
		test	di, 1
		jz	short loc_85E27
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_85E27:				; CODE XREF: HUDSymbol_ReleaseListEntryB_85DF5+Dj
					; HUDSymbol_ReleaseListEntryB_85DF5+29j
		pop	di
		pop	si
		pop	bp
		retf
HUDSymbol_ReleaseListEntryB_85DF5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, invalide une référence faible.
; ==============================================================================================
HUDSymbol_ReleaseSingleRefC_85E2B	proc far		; CODE XREF: VROOMM_StubThunk_6B0D5J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]

loc_85E33:
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_85E62
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
		jz	short loc_85E60
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx
		jmp	short loc_85E62
; ���������������������������������������������������������������������������

loc_85E60:				; CODE XREF: HUDSymbol_ReleaseSingleRefC_85E2B+2Aj
		jmp	short $+2

loc_85E62:				; CODE XREF: HUDSymbol_ReleaseSingleRefC_85E2B+Dj
					; HUDSymbol_ReleaseSingleRefC_85E2B+33j
		pop	di
		pop	si
		pop	bp
		retf
HUDSymbol_ReleaseSingleRefC_85E2B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, invalide une référence faible.
; ==============================================================================================
HUDSymbol_ReleaseSingleRefD_85E66	proc far		; CODE XREF: VROOMM_StubThunk_6B0D0J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_85E9D
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
		jz	short loc_85E9B
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx
		jmp	short loc_85E9D
; ���������������������������������������������������������������������������

loc_85E9B:				; CODE XREF: HUDSymbol_ReleaseSingleRefD_85E66+2Aj
		jmp	short $+2

loc_85E9D:				; CODE XREF: HUDSymbol_ReleaseSingleRefD_85E66+Dj
					; HUDSymbol_ReleaseSingleRefD_85E66+33j
		pop	di
		pop	si
		pop	bp
		retf
HUDSymbol_ReleaseSingleRefD_85E66	endp

ovr246		ends

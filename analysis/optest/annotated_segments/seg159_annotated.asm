seg159		segment	byte public 'CODE' use16
		assume cs:seg159
		;org 0Bh
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; TextScrollDisplay_Construct_67267 (sub_67267 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, alloue (sub_658), initialise via
; TextScrollDisplay_ComputeLayout_672AF.
; ==============================================================================================
TextScrollDisplay_Construct_3EA8B	proc far		; CODE XREF: sub_5E851+8FP

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_3EAA4
		push	1
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_3EAA9

loc_3EAA4:				; CODE XREF: TextScrollDisplay_Construct_3EA8B+9j
		nop
		push	cs
		call	near ptr TextScrollDisplay_ComputeLayout_3EAD3

loc_3EAA9:				; CODE XREF: TextScrollDisplay_Construct_3EA8B+17j
		mov	ax, si
		pop	si
		pop	bp
		retf
TextScrollDisplay_Construct_3EA8B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; TextScrollDisplay_Destruct_6728A (sub_6728A de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, appelle TextScrollDisplay_Cleanup_67384 puis
; libère l'objet (sub_338).
; ==============================================================================================
TextScrollDisplay_Destruct_3EAAE	proc far		; CODE XREF: sub_5E9CD+4FP

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_3EACF
		nop
		push	cs
		call	near ptr TextScrollDisplay_Cleanup_3EBA8
		test	di, 1
		jz	short loc_3EACF
		push	si
		call	sub_308
		pop	cx

loc_3EACF:				; CODE XREF: TextScrollDisplay_Destruct_3EAAE+Dj
					; TextScrollDisplay_Destruct_3EAAE+18j
		pop	di
		pop	si
		pop	bp
		retf
TextScrollDisplay_Destruct_3EAAE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TextScrollDisplay_ComputeLayout_672AF (sub_672AF de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 65 lignes, NON DÉTAILLÉE — calcule le layout d'affichage du défilement de texte.
; ==============================================================================================
TextScrollDisplay_ComputeLayout_3EAD3	proc far		; CODE XREF: TextScrollDisplay_Construct_3EA8B+1Bp

var_28		= word ptr -28h
var_26		= word ptr -26h
var_18		= word ptr -18h
var_8		= word ptr -8

		push	bp
		mov	bp, sp
		sub	sp, 28h
		mov	[bp+var_18], 0
		lea	ax, [bp+var_8]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		push	33h ; '3'
		call	CRT_Int86
		add	sp, 8
		cmp	[bp+var_28], 0FFFFh
		jnz	short loc_3EB01
		mov	byte_497BC, 1
		jmp	short loc_3EB06
; ���������������������������������������������������������������������������

loc_3EB01:				; CODE XREF: TextScrollDisplay_ComputeLayout_3EAD3+25j
		mov	byte_497BC, 0

loc_3EB06:				; CODE XREF: TextScrollDisplay_ComputeLayout_3EAD3+2Cj
		mov	ax, [bp+var_26]
		mov	word_497BD, ax
		push	large 0
		nop
		push	cs
		call	near ptr TextScrollDisplay_RegisterEntries_3EBDD
		add	sp, 4
		push	large 100000h
		push	6780h
		call	CRT_Memset_Public
		add	sp, 6
		push	large 80000h
		push	6790h
		call	CRT_Memset_Public
		add	sp, 6
		nop
		push	cs
		call	near ptr TextScrollDisplay_InitState_3EB63
		leave
		retf
TextScrollDisplay_ComputeLayout_3EAD3	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 28h
		mov	word ptr [bp-18h], 0
		lea	ax, [bp-8]
		push	ax
		lea	ax, [bp-28h]
		push	ax
		lea	ax, [bp-18h]
		push	ax
		push	33h ; '3'
		call	CRT_Int86
		add	sp, 8
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TextScrollDisplay_InitState_6733F (sub_6733F de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine sub_1839 (externe), TextScrollDisplay_RegisterEntries_673B9 et sub_22E1 (×2).
; ==============================================================================================
TextScrollDisplay_InitState_3EB63	proc far		; CODE XREF: TextScrollDisplay_ComputeLayout_3EAD3+68p

var_28		= word ptr -28h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_18		= word ptr -18h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_8		= word ptr -8

		push	bp
		mov	bp, sp
		sub	sp, 28h
		mov	[bp+var_12], 5
		mov	[bp+var_8], seg	seg164
		mov	[bp+var_18], 14h
		mov	[bp+var_14], 3Fh ; '?'
		lea	ax, [bp+var_8]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		push	33h ; '3'
		call	CRT_Int86
		add	sp, 8
		mov	ax, [bp+var_24]
		mov	word_47A98, ax
		mov	ax, [bp+var_8]
		mov	dx, [bp+var_22]
		mov	word_47A9C, ax
		mov	word_47A9A, dx
		leave
		retf
TextScrollDisplay_InitState_3EB63	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; TextScrollDisplay_Cleanup_67384 (sub_67384 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, appelle sub_1839. Appelée par
; TextScrollDisplay_Destruct_6728A.
; ==============================================================================================
TextScrollDisplay_Cleanup_3EBA8	proc far		; CODE XREF: TextScrollDisplay_Destruct_3EAAE+11p

var_28		= word ptr -28h
var_18		= word ptr -18h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_8		= word ptr -8

		push	bp
		mov	bp, sp
		sub	sp, 28h
		mov	ax, word_47A9A
		mov	[bp+var_12], ax
		mov	ax, word_47A9C
		mov	[bp+var_8], ax
		mov	[bp+var_18], 14h
		mov	ax, word_47A98
		mov	[bp+var_14], ax
		lea	ax, [bp+var_8]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		push	33h ; '3'
		call	CRT_Int86
		add	sp, 8
		leave
		retf
TextScrollDisplay_Cleanup_3EBA8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; TextScrollDisplay_RegisterEntries_673B9 (sub_673B9 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, appelle sub_1839. Appelée par
; TextScrollDisplay_InitState_6733F.
; ==============================================================================================
TextScrollDisplay_RegisterEntries_3EBDD	proc far		; CODE XREF: sub_69B8+8P sub_6BFB+176P ...

var_28		= word ptr -28h
var_18		= word ptr -18h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_8		= word ptr -8
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 28h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_18], 4
		mov	[bp+var_14], si
		mov	[bp+var_12], di
		lea	ax, [bp+var_8]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		push	33h ; '3'
		call	CRT_Int86
		add	sp, 8
		mov	word_497B8, si
		mov	word_497BA, di
		pop	di
		pop	si
		leave
		retf
TextScrollDisplay_RegisterEntries_3EBDD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_3EC18	proc far		; CODE XREF: sub_11FFE+1CP
					; sub_1220C+C63P

var_28		= word ptr -28h
var_18		= word ptr -18h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_8		= word ptr -8
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 28h
		mov	[bp+var_18], 7
		mov	ax, [bp+arg_0]
		mov	[bp+var_14], ax
		mov	ax, [bp+arg_2]
		mov	[bp+var_12], ax
		lea	ax, [bp+var_8]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		push	33h ; '3'
		call	CRT_Int86
		add	sp, 8
		leave
		retf
sub_3EC18	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_3EC47	proc far		; CODE XREF: sub_11FFE+29P
					; sub_1220C+C71P

var_28		= word ptr -28h
var_18		= word ptr -18h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_8		= word ptr -8
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 28h
		mov	[bp+var_18], 8
		mov	ax, [bp+arg_0]
		mov	[bp+var_14], ax
		mov	ax, [bp+arg_2]
		mov	[bp+var_12], ax
		lea	ax, [bp+var_8]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		push	33h ; '3'
		call	CRT_Int86
		add	sp, 8
		leave
		retf
sub_3EC47	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 28h
		mov	word ptr [bp-18h], 0Fh
		mov	ax, [bp+6]
		mov	[bp-14h], ax
		mov	ax, [bp+8]
		mov	[bp-12h], ax
		lea	ax, [bp-8]
		push	ax
		lea	ax, [bp-28h]
		push	ax
		lea	ax, [bp-18h]
		push	ax
		push	33h ; '3'
		call	CRT_Int86
		add	sp, 8
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_3ECA5	proc far		; CODE XREF: sub_6162+B9P sub_69B8+15P ...
		push	bp
		mov	bp, sp
		cmp	word_47CEE, 0
		jz	short loc_3ECB8
		push	4A7Eh
		call	sub_310B
		pop	cx

loc_3ECB8:				; CODE XREF: sub_3ECA5+8j
		mov	ax, word_497B8
		pop	bp
		retf
sub_3ECA5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_3ECBD	proc far		; CODE XREF: sub_6162+C1P sub_69B8+1DP ...
		push	bp
		mov	bp, sp
		cmp	word_47CEE, 0
		jz	short loc_3ECD0
		push	4A7Eh
		call	sub_310B
		pop	cx

loc_3ECD0:				; CODE XREF: sub_3ECBD+8j
		mov	ax, word_497BA
		pop	bp
		retf
sub_3ECBD	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	ax, 3
		int	33h		; - MS MOUSE - RETURN POSITION AND BUTTON STATUS
					; Return: BX = button status, CX = column, DX =	row
		mov	[bp-2],	cx
		mov	[bp-4],	dx
		mov	ax, 7
		mov	cx, [bp-2]
		mov	dx, [bp-2]
		int	33h		; - MS MOUSE - DEFINE HORIZONTAL CURSOR	RANGE
					; CX = minimum column, DX = maximum column
		mov	ax, 8
		mov	cx, [bp-4]
		mov	dx, [bp-4]
		int	33h		; - MS MOUSE - DEFINE VERTICAL CURSOR RANGE
					; CX = minimum row, DX = maximum row
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		mov	ax, 7
		mov	cx, 0
		mov	dx, 27Fh
		int	33h		; - MS MOUSE - DEFINE HORIZONTAL CURSOR	RANGE
					; CX = minimum column, DX = maximum column
		mov	ax, 8
		mov	cx, 0
		mov	dx, 0C7h ; '�'
		int	33h		; - MS MOUSE - DEFINE VERTICAL CURSOR RANGE
					; CX = minimum row, DX = maximum row
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_3ED19	proc far		; CODE XREF: TextScroll_Construct_3E7E8+1AP
					; seg158:005AP	...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_3ED32
		push	2
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_3ED36

loc_3ED32:				; CODE XREF: sub_3ED19+9j
		mov	word ptr [si], 0FFFFh

loc_3ED36:				; CODE XREF: sub_3ED19+17j
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_3ED19	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à HandlerRegistry4Slot_Register_67517 (sub_67517 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; enregistre un gestionnaire dans une table à capacité de 4 emplacements (word_711A8, tables à
; 0x5DA0/0x5DB0), avec repli sur PagedResourceB_RegistryLookupForUIScreen (sub_5F508, seg158)
; si pleine. Référencée par TextScroll_RegisterHandler_671CA (seg204) et sub_67E34.
; ==============================================================================================
HandlerRegistry4Slot_Register_3ED3B	proc far		; CODE XREF: TextScroll_RegisterHandler_3E9EE+10P
					; TextScrollDisplayB_InitAndRegister_3F658+5CP

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word_47A96, 4
		jl	short loc_3ED51
		push	0
		call	PagedResourceC_RefreshAndFinalize_2FD7D
		pop	cx

loc_3ED51:				; CODE XREF: HandlerRegistry4Slot_Register_3ED3B+Cj
		mov	ax, word_47A96
		mov	[si], ax
		mov	bx, word_47A96
		shl	bx, 2
		mov	ax, [bp+arg_4]
		mov	dx, [bp+arg_2]
		mov	[bx+6782h], ax
		mov	[bx+6780h], dx
		mov	bx, word_47A96
		shl	bx, 1
		mov	ax, [bp+arg_6]
		mov	[bx+6790h], ax
		inc	word_47A96
		pop	si
		pop	bp
		retf
HandlerRegistry4Slot_Register_3ED3B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 6 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ResourceHandle_IsValid_6755B (sub_6755B de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; teste si un handle est valide (≠0xFFFF). Référencée depuis seg047 et seg049 (proches de
; TextRenderer_Main).
; ==============================================================================================
ResourceHandle_IsValid_3ED7F	proc far		; CODE XREF: seg007:01F3P seg008:06C5P ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0FFFFh
		jz	short loc_3ED90
		mov	ax, 1
		jmp	short loc_3ED92
; ���������������������������������������������������������������������������

loc_3ED90:				; CODE XREF: ResourceHandle_IsValid_3ED7F+Aj
		xor	ax, ax

loc_3ED92:				; CODE XREF: ResourceHandle_IsValid_3ED7F+Fj
		mov	ah, 0
		or	ax, ax
		jz	short loc_3EDD5
		mov	cx, [si]
		jmp	short loc_3EDC7
; ���������������������������������������������������������������������������

loc_3ED9C:				; CODE XREF: ResourceHandle_IsValid_3ED7F+4Cj
		mov	bx, cx
		shl	bx, 2
		mov	ax, [bx+6786h]
		mov	dx, [bx+6784h]
		mov	bx, cx
		shl	bx, 2
		mov	[bx+6782h], ax
		mov	[bx+6780h], dx
		mov	bx, cx
		shl	bx, 1
		mov	ax, [bx+6792h]
		mov	bx, cx
		shl	bx, 1
		mov	[bx+6790h], ax
		inc	cx

loc_3EDC7:				; CODE XREF: ResourceHandle_IsValid_3ED7F+1Bj
		cmp	cx, word_47A96
		jl	short loc_3ED9C
		dec	word_47A96
		mov	word ptr [si], 0FFFFh

loc_3EDD5:				; CODE XREF: ResourceHandle_IsValid_3ED7F+17j
		pop	si
		pop	bp
		retf
ResourceHandle_IsValid_3ED7F	endp

seg159		ends

seg096		segment	byte public 'CODE' use16
		assume cs:seg096
		;org 0Eh
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; DisplaySurface_Construct_5E819 (sub_5E819 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, construit un objet surface/tampon
; (sub_5EA03/5EA23 pour les sous-objets, sub_2E1D, sub_5EAB4, sub_5EA65). Référencée par
; sub_5E9A9.
; ==============================================================================================
DisplaySurface_Construct_2F08E	proc far		; CODE XREF: sub_5803+4F7P
					; DisplaySurface_ConstructWithMode_2F21E+35p

arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp

loc_2F08F:				; DATA XREF: seg170:03D6o
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	[bp+arg_2], 0
		jnz	short loc_2F0B1
		push	si
		call	Member_ClearAndFree_2F278
		pop	cx
		push	0
		push	si
		call	Member_AllocateAndCopy_2F298
		add	sp, 4
		jmp	short loc_2F0BF
; ���������������������������������������������������������������������������

loc_2F0B1:				; CODE XREF: DisplaySurface_Construct_2F08E+Dj
		mov	ax, [si]
		mov	dx, ds
		cmp	dx, word ptr [bp+arg_2+2]
		jnz	short loc_2F0BF
		cmp	ax, word ptr [bp+arg_2]
		jz	short loc_2F10D

loc_2F0BF:				; CODE XREF: DisplaySurface_Construct_2F08E+21j
					; DisplaySurface_Construct_2F08E+2Aj
		push	large [bp+arg_2]
		call	CRT_MemFamily_Extra6
		add	sp, 4
		inc	ax
		mov	di, ax
		cmp	word ptr [si], 0
		jz	short loc_2F0D8
		cmp	[si+2],	di
		jnb	short loc_2F0E9

loc_2F0D8:				; CODE XREF: DisplaySurface_Construct_2F08E+43j
		push	si
		call	Member_ClearAndFree_2F278
		pop	cx
		push	di
		push	si
		call	Member_AllocateAndCopy_2F298
		add	sp, 4

loc_2F0E9:				; CODE XREF: DisplaySurface_Construct_2F08E+48j
		cmp	word ptr [si], 0
		jz	short loc_2F10D
		push	si
		call	Member_NullTerminateIfSet_2F329
		pop	cx
		push	large [bp+arg_2]
		push	si
		call	Member_CopyRaw_2F2DA
		add	sp, 6
		mov	ax, [si+2]
		dec	ax
		mov	bx, [si]
		add	bx, ax
		mov	byte ptr [bx], 0

loc_2F10D:				; CODE XREF: DisplaySurface_Construct_2F08E+2Fj
					; DisplaySurface_Construct_2F08E+5Ej
		mov	ax, [si]
		pop	di
		pop	si
		pop	bp
		retf
DisplaySurface_Construct_2F08E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; DisplaySurface_CloneOrResize_5E89E (sub_5E89E de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — ⚠️ far, 111 lignes, NON DÉTAILLÉE — combine
; sub_2E1D/sub_2B1C, DisplayCache_GetHeadValue_5D469 (seg137), et plusieurs
; constructions/copies de sous-objets (5EA23/5EA65 ×3/5EA03). Référencée par
; CachedObject_DestructSubobjects_5E95A (via appel indirect).
; ==============================================================================================
DisplaySurface_CloneOrResize_2F113	proc far		; CODE XREF: CachedObject_DestructSubobjects_2F1CF+12p

var_6		= word ptr -6
var_4		= word ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	[bp+arg_2], 0
		jnz	short loc_2F128
		jmp	loc_2F1C9
; ���������������������������������������������������������������������������

loc_2F128:				; CODE XREF: DisplaySurface_CloneOrResize_2F113+10j
		push	large [bp+arg_2]
		call	CRT_MemFamily_Extra6
		add	sp, 4
		mov	di, ax
		cmp	word ptr [si], 0
		jnz	short loc_2F13E
		inc	di
		jmp	short loc_2F159
; ���������������������������������������������������������������������������

loc_2F13E:				; CODE XREF: DisplaySurface_CloneOrResize_2F113+26j
		push	word ptr [si]
		call	CRT_Strlen
		pop	cx
		add	ax, di
		inc	ax
		mov	dx, ax
		cmp	[si+2],	dx
		jle	short loc_2F155
		mov	ax, [si+2]
		jmp	short loc_2F157
; ���������������������������������������������������������������������������

loc_2F155:				; CODE XREF: DisplaySurface_CloneOrResize_2F113+3Bj
		mov	ax, dx

loc_2F157:				; CODE XREF: DisplaySurface_CloneOrResize_2F113+40j
		mov	di, ax

loc_2F159:				; CODE XREF: DisplaySurface_CloneOrResize_2F113+29j
		cmp	[si+2],	di
		jnb	short loc_2F1BC
		call	DisplayCache_GetHeadValue_2C557
		cmp	ax, [si+2]
		jbe	short loc_2F1BC
		mov	[bp+var_6], di
		mov	[bp+var_4], 0
		push	[bp+var_6]
		lea	ax, [bp+var_4]
		push	ax
		call	Member_AllocateAndCopy_2F298
		add	sp, 4
		cmp	word ptr [si], 0
		jz	short loc_2F193
		push	ds
		push	word ptr [si]
		lea	ax, [bp+var_4]
		push	ax
		call	Member_CopyRaw_2F2DA
		add	sp, 6

loc_2F193:				; CODE XREF: DisplaySurface_CloneOrResize_2F113+6Fj
		push	large [bp+arg_2]
		lea	ax, [bp+var_4]
		push	ax
		call	Member_CopyRaw_2F2DA
		add	sp, 6
		lea	ax, [bp+var_4]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr DisplaySurface_Helper_2F1EC
		add	sp, 4
		lea	ax, [bp+var_4]
		push	ax
		call	Member_ClearAndFree_2F278
		pop	cx
		jmp	short loc_2F1C9
; ���������������������������������������������������������������������������

loc_2F1BC:				; CODE XREF: DisplaySurface_CloneOrResize_2F113+49j
					; DisplaySurface_CloneOrResize_2F113+53j
		push	large [bp+arg_2]
		push	si
		call	Member_CopyRaw_2F2DA
		add	sp, 6

loc_2F1C9:				; CODE XREF: DisplaySurface_CloneOrResize_2F113+12j
					; DisplaySurface_CloneOrResize_2F113+A7j
		mov	ax, [si]
		pop	di
		pop	si
		leave
		retf
DisplaySurface_CloneOrResize_2F113	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; CachedObject_DestructSubobjects_5E95A (sub_5E95A de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, si un paramètre non nul est fourni, appelle
; DisplaySurface_CloneOrResize_5E89E ; retourne toujours le premier champ de l'objet. Appelée
; massivement par TextObjectCluster_DestructSubobjects_5C579 (seg130) et
; Memory_AllocatorTable_PopulateSlots_5CB99 (seg133).
; ==============================================================================================
CachedObject_DestructSubobjects_2F1CF	proc far		; CODE XREF: TextObjectCluster_DestructSubobjects_2B667+23P
					; TextObjectCluster_DestructSubobjects_2B667+45P ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		or	ax, ax
		jz	short loc_2F1E7
		push	ds
		push	ax
		push	si
		push	cs
		call	near ptr DisplaySurface_CloneOrResize_2F113
		add	sp, 6

loc_2F1E7:				; CODE XREF: CachedObject_DestructSubobjects_2F1CF+Cj
		mov	ax, [si]
		pop	si
		pop	bp
		retf
CachedObject_DestructSubobjects_2F1CF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; DisplaySurface_Helper_5E977 (sub_5E977 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, référencée par
; DisplaySurface_ConstructWithMode_5E9A9.
; ==============================================================================================
DisplaySurface_Helper_2F1EC	proc far		; CODE XREF: DisplaySurface_CloneOrResize_2F113+97p

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [si]
		mov	[bp+var_2], ax
		mov	ax, [si+2]
		mov	[bp+var_4], ax
		mov	ax, [di]
		mov	[si], ax
		mov	ax, [di+2]
		mov	[si+2],	ax
		mov	ax, [bp+var_2]
		mov	[di], ax
		mov	ax, [bp+var_4]
		mov	[di+2],	ax
		pop	di
		pop	si
		leave
		retf
DisplaySurface_Helper_2F1EC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; DisplaySurface_ConstructWithMode_5E9A9 (sub_5E9A9 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine Video_SetModeIfChanged
; (sub_2962, seg150), sub_5EAB4 et DisplaySurface_Construct_5E819 — construction d'une surface
; d'affichage liée à un mode vidéo donné. Appelée massivement par
; TextObjectCluster_DestructSubobjects_5C579 (seg130) et
; Memory_AllocatorTable_PopulateSlots_5CB99 (seg133).
; ==============================================================================================
DisplaySurface_ConstructWithMode_2F21E	proc far		; CODE XREF: TextObjectCluster_DestructSubobjects_2B667+7CP
					; TextObjectCluster_DestructSubobjects_2B667+A4P ...

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		cmp	dx, word_47034
		jz	short loc_2F245
		lea	ax, [bp+arg_4]
		mov	[bp+var_2], ax
		push	ax
		push	dx
		push	word_47034
		call	CRT_Msg_Sprintf2
		add	sp, 6

loc_2F245:				; CODE XREF: DisplaySurface_ConstructWithMode_2F21E+11j
		push	si
		call	Member_NullTerminateIfSet_2F329
		pop	cx
		push	ds
		push	word_47034
		push	si
		push	cs
		call	near ptr DisplaySurface_Construct_2F08E
		add	sp, 6
		mov	ax, [si]
		pop	si
		leave
		retf
DisplaySurface_ConstructWithMode_2F21E	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		dec	word ptr [si+2]
		mov	ax, [si+2]
		dec	ax
		mov	bx, [si]
		add	bx, ax
		mov	byte ptr [bx], 0
		mov	ax, [si]
		pop	si
		pop	bp
		retf
seg096		ends

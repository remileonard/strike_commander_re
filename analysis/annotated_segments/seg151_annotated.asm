seg151		segment	byte public 'CODE' use16
		assume cs:seg151
		;org 9
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, construit un objet surface/tampon (sub_5EA03/5EA23 pour les sous-objets, sub_2E1D,
; sub_5EAB4, sub_5EA65). Référencée par sub_5E9A9.
; ==============================================================================================
DisplaySurface_Construct_5E819	proc far		; CODE XREF: DisplaySurface_ConstructWithMode_5E9A9+35p

arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp

loc_5E81A:				; DATA XREF: seg216:off_6A35Eo
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	[bp+arg_2], 0
		jnz	short loc_5E83C
		push	si
		call	Member_ClearAndFree_5EA03
		pop	cx
		push	0

loc_5E831:
		push	si
		call	Member_AllocateAndCopy_5EA23
		add	sp, 4
		jmp	short loc_5E84A
; ���������������������������������������������������������������������������

loc_5E83C:				; CODE XREF: DisplaySurface_Construct_5E819+Dj
		mov	ax, [si]
		mov	dx, ds
		cmp	dx, word ptr [bp+arg_2+2]
		jnz	short loc_5E84A
		cmp	ax, word ptr [bp+arg_2]
		jz	short loc_5E898

loc_5E84A:				; CODE XREF: DisplaySurface_Construct_5E819+21j
					; DisplaySurface_Construct_5E819+2Aj
		push	large [bp+arg_2]
		call	CRT_MemFamily_Extra6

loc_5E853:
		add	sp, 4
		inc	ax

loc_5E857:
		mov	di, ax
		cmp	word ptr [si], 0

loc_5E85C:
		jz	short loc_5E863
		cmp	[si+2],	di
		jnb	short loc_5E874

loc_5E863:				; CODE XREF: DisplaySurface_Construct_5E819:loc_5E85Cj
		push	si
		call	Member_ClearAndFree_5EA03
		pop	cx
		push	di
		push	si
		call	Member_AllocateAndCopy_5EA23
		add	sp, 4

loc_5E874:				; CODE XREF: DisplaySurface_Construct_5E819+48j
		cmp	word ptr [si], 0
		jz	short loc_5E898
		push	si
		call	Member_NullTerminateIfSet_5EAB4
		pop	cx
		push	large [bp+arg_2]
		push	si
		call	Member_CopyRaw_5EA65
		add	sp, 6
		mov	ax, [si+2]
		dec	ax
		mov	bx, [si]
		add	bx, ax
		mov	byte ptr [bx], 0

loc_5E898:				; CODE XREF: DisplaySurface_Construct_5E819+2Fj
					; DisplaySurface_Construct_5E819+5Ej
		mov	ax, [si]
		pop	di
		pop	si
		pop	bp
		retf
DisplaySurface_Construct_5E819	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 111 lignes, NON DÉTAILLÉE — combine sub_2E1D/sub_2B1C,
; DisplayCache_GetHeadValue_5D469 (seg137), et plusieurs constructions/copies de sous-objets
; (5EA23/5EA65 ×3/5EA03). Référencée par CachedObject_DestructSubobjects_5E95A (via appel
; indirect).
; ==============================================================================================
DisplaySurface_CloneOrResize_5E89E	proc far		; CODE XREF: CachedObject_DestructSubobjects_5E95A+12p

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
		jnz	short loc_5E8B3
		jmp	loc_5E954
; ���������������������������������������������������������������������������

loc_5E8B3:				; CODE XREF: DisplaySurface_CloneOrResize_5E89E+10j
		push	large [bp+arg_2]
		call	CRT_MemFamily_Extra6
		add	sp, 4
		mov	di, ax
		cmp	word ptr [si], 0
		jnz	short loc_5E8C9
		inc	di
		jmp	short loc_5E8E4
; ���������������������������������������������������������������������������

loc_5E8C9:				; CODE XREF: DisplaySurface_CloneOrResize_5E89E+26j
		push	word ptr [si]
		call	CRT_Strlen
		pop	cx
		add	ax, di
		inc	ax
		mov	dx, ax
		cmp	[si+2],	dx
		jle	short loc_5E8E0
		mov	ax, [si+2]
		jmp	short loc_5E8E2
; ���������������������������������������������������������������������������

loc_5E8E0:				; CODE XREF: DisplaySurface_CloneOrResize_5E89E+3Bj
		mov	ax, dx

loc_5E8E2:				; CODE XREF: DisplaySurface_CloneOrResize_5E89E+40j
		mov	di, ax

loc_5E8E4:				; CODE XREF: DisplaySurface_CloneOrResize_5E89E+29j
		cmp	[si+2],	di
		jnb	short loc_5E947
		call	DisplayCache_GetHeadValue_5D469
		cmp	ax, [si+2]
		jbe	short loc_5E947

loc_5E8F3:
		mov	[bp+var_6], di
		mov	[bp+var_4], 0
		push	[bp+var_6]
		lea	ax, [bp+var_4]
		push	ax
		call	Member_AllocateAndCopy_5EA23
		add	sp, 4
		cmp	word ptr [si], 0
		jz	short loc_5E91E
		push	ds
		push	word ptr [si]
		lea	ax, [bp+var_4]
		push	ax
		call	Member_CopyRaw_5EA65
		add	sp, 6

loc_5E91E:				; CODE XREF: DisplaySurface_CloneOrResize_5E89E+6Fj
		push	large [bp+arg_2]
		lea	ax, [bp+var_4]
		push	ax
		call	Member_CopyRaw_5EA65
		add	sp, 6
		lea	ax, [bp+var_4]
		push	ax
		push	si

loc_5E933:
		nop
		push	cs
		call	near ptr DisplaySurface_Helper_5E977
		add	sp, 4
		lea	ax, [bp+var_4]
		push	ax
		call	Member_ClearAndFree_5EA03

loc_5E944:
		pop	cx
		jmp	short loc_5E954
; ���������������������������������������������������������������������������

loc_5E947:				; CODE XREF: DisplaySurface_CloneOrResize_5E89E+49j
					; DisplaySurface_CloneOrResize_5E89E+53j
		push	large [bp+arg_2]
		push	si
		call	Member_CopyRaw_5EA65
		add	sp, 6

loc_5E954:				; CODE XREF: DisplaySurface_CloneOrResize_5E89E+12j
					; DisplaySurface_CloneOrResize_5E89E+A7j
		mov	ax, [si]
		pop	di
		pop	si
		leave
		retf
DisplaySurface_CloneOrResize_5E89E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, si un paramètre non nul est fourni, appelle DisplaySurface_CloneOrResize_5E89E ;
; retourne toujours le premier champ de l'objet. Appelée massivement par
; TextObjectCluster_DestructSubobjects_5C579 (seg130) et
; Memory_AllocatorTable_PopulateSlots_5CB99 (seg133).
; ==============================================================================================
CachedObject_DestructSubobjects_5E95A	proc far		; CODE XREF: TextObjectCluster_DestructSubobjects_5C579+23P
					; TextObjectCluster_DestructSubobjects_5C579+45P ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		or	ax, ax
		jz	short loc_5E972
		push	ds
		push	ax
		push	si
		push	cs
		call	near ptr DisplaySurface_CloneOrResize_5E89E
		add	sp, 6

loc_5E972:				; CODE XREF: CachedObject_DestructSubobjects_5E95A+Cj
		mov	ax, [si]
		pop	si
		pop	bp
		retf
CachedObject_DestructSubobjects_5E95A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, référencée par DisplaySurface_ConstructWithMode_5E9A9.
; ==============================================================================================
DisplaySurface_Helper_5E977	proc far		; CODE XREF: DisplaySurface_CloneOrResize_5E89E+97p

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
DisplaySurface_Helper_5E977	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine Video_SetModeIfChanged (sub_2962, seg150), sub_5EAB4 et
; DisplaySurface_Construct_5E819 — construction d'une surface d'affichage liée à un mode vidéo
; donné. Appelée massivement par TextObjectCluster_DestructSubobjects_5C579 (seg130) et
; Memory_AllocatorTable_PopulateSlots_5CB99 (seg133).
; ==============================================================================================
DisplaySurface_ConstructWithMode_5E9A9	proc far		; CODE XREF: TextObjectCluster_DestructSubobjects_5C579+7CP
					; TextObjectCluster_DestructSubobjects_5C579+A4P ...

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
		cmp	dx, word_70EA2
		jz	short loc_5E9D0
		lea	ax, [bp+arg_4]
		mov	[bp+var_2], ax
		push	ax

loc_5E9C3:
		push	dx

loc_5E9C4:
		push	word_70EA2

loc_5E9C8:
		call	CRT_Msg_Sprintf2

loc_5E9CD:
		add	sp, 6

loc_5E9D0:				; CODE XREF: DisplaySurface_ConstructWithMode_5E9A9+11j
		push	si

loc_5E9D1:
		call	Member_NullTerminateIfSet_5EAB4
		pop	cx

loc_5E9D7:
		push	ds
		push	word_70EA2
		push	si
		push	cs
		call	near ptr DisplaySurface_Construct_5E819
		add	sp, 6
		mov	ax, [si]
		pop	si
		leave
		retf
DisplaySurface_ConstructWithMode_5E9A9	endp

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

loc_5EA00:
		pop	si
		pop	bp
		retf
seg151		ends

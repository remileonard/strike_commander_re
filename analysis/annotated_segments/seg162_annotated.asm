seg162		segment	byte public 'CODE' use16
		assume cs:seg162
		;org 6
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, dispatch vtable ([bx+0x24]/[bx+0x18]) — calcul de métriques d'un objet glyphe.
; ==============================================================================================
GlyphObject_ComputeMetrics_60456	proc far		; CODE XREF: GlyphObject_ConstructWithBuffer_60507+3Ep
					; GlyphObject_LoadMetricsFromIFF_7DE90+98P ...

var_5		= byte ptr -5
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	di, dx
		mov	eax, [di]
		mov	[bp+var_4], eax
		mov	al, [di+4]
		mov	[bp+var_5], al
		mov	eax, [bp+var_4]
		mov	[si+2],	eax
		mov	al, [bp+var_5]
		mov	[si+6],	al
		mov	byte ptr [si+7], 0
		mov	dword ptr [si+8], 0
		mov	eax, [di+6]
		mov	[si+8],	eax
		mov	di, dx
		mov	byte ptr [di+5], 0
		mov	byte ptr [si+7], 1
		push	si
		mov	bx, [si]
		call	dword ptr [bx+24h]
		pop	cx
		mov	[si+0Eh], ax
		mov	byte ptr [si+16h], 0FFh
		mov	word ptr [si+10h], 2
		mov	word ptr [si+12h], 0
		push	2Dh ; '-'
		push	si
		mov	bx, [si]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	[si+14h], ax
		pop	di
		pop	si
		leave
		retf
GlyphObject_ComputeMetrics_60456	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue (sub_658). Référencée par sub_60507.
; ==============================================================================================
GlyphObject_AllocateBuffer_604C9	proc far		; CODE XREF: Font_LoadDefinitionFromIFF_7E1B4+137P
					; Font_LoadGlyphTable_7FF90+4FP ...

arg_0		= word ptr  6

		push	bp

loc_604CA:
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_604E2
		push	17h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_60502

loc_604E2:				; CODE XREF: GlyphObject_AllocateBuffer_604C9+9j
		mov	word ptr [si], 3E40h
		mov	dword ptr [si+2], 0
		mov	byte ptr [si+6], 2
		mov	byte ptr [si+7], 0

loc_604F6:
		mov	dword ptr [si+8], 0

loc_604FE:
		mov	word ptr [si], 3E68h

loc_60502:				; CODE XREF: GlyphObject_AllocateBuffer_604C9+17j
		mov	ax, si
		pop	si
		pop	bp
		retf
GlyphObject_AllocateBuffer_604C9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue (sub_658) puis GlyphObject_AllocateBuffer_604C9 puis
; GlyphObject_ComputeMetrics_60456.
; ==============================================================================================
GlyphObject_ConstructWithBuffer_60507	proc far		; CODE XREF: TextRenderer_Main+740P
					; MissionRecord_LoadFieldGroupSequence_8939A+C9P

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_60520
		push	17h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_6054B

loc_60520:				; CODE XREF: GlyphObject_ConstructWithBuffer_60507+9j
		mov	word ptr [si], 3E40h
		mov	dword ptr [si+2], 0
		mov	byte ptr [si+6], 2
		mov	byte ptr [si+7], 0
		mov	dword ptr [si+8], 0

loc_6053C:
		mov	word ptr [si], 3E68h
		push	[bp+arg_2]

loc_60543:
		push	si
		push	cs
		call	near ptr GlyphObject_ComputeMetrics_60456

loc_60548:
		add	sp, 4

loc_6054B:				; CODE XREF: GlyphObject_ConstructWithBuffer_60507+17j
		mov	ax, si
		pop	si
		pop	bp
		retf
GlyphObject_ConstructWithBuffer_60507	endp

; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg339) — récupère un bloc mémoire typé
; (Memory_TypedAllocDispatchB_5C832, tag 5C44h) puis mesure la largeur du caractère 'A'
; (Font_ComputeGlyphBoundingBox_5E74E) comme référence de mise à l'échelle. Probable duplicat
; partiel de GlyphObject_Method_MeasureRefCharB_6058F — non vérifié.
; ==============================================================================================
GlyphObject_Method_MeasureRefCharA_60550:				; DATA XREF: seg339:0614o
					; seg339:off_6D702o ...
		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		mov	si, [bp+6]
		push	ss
		lea	ax, [bp-8]
		push	ax
		push	large 0

loc_60562:
		push	0

loc_60564:
		mov	al, [si+6]
		push	ax
		push	large dword ptr	[si+2]

loc_6056C:
		push	5C44h

loc_6056F:
		call	Memory_TypedAllocDispatchB_5C832

loc_60574:
		add	sp, 0Ah

loc_60577:
		push	dx
		push	ax
		push	41h ; 'A'
		call	Font_ComputeGlyphBoundingBox_5E74E
		mov	ax, [bp-6]
		mov	[bp-0Ah], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		inc	ax
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg339) — quasi identique à
; GlyphObject_Method_MeasureRefCharA_60550 (même séquence d'appels). Probable duplicat — non
; vérifié.
; ==============================================================================================
GlyphObject_Method_MeasureRefCharB_6058F:				; DATA XREF: seg339:0618o seg339:0656o ...
		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		mov	si, [bp+6]
		push	ss
		lea	ax, [bp-8]
		push	ax
		push	large 0
		push	0

loc_605A3:
		mov	al, [si+6]
		push	ax
		push	large dword ptr	[si+2]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	41h ; 'A'
		call	Font_ComputeGlyphBoundingBox_5E74E
		mov	ax, [bp-6]

loc_605C2:
		mov	[bp-0Ah], ax
		cwd
		xor	ax, dx

loc_605C8:
		sub	ax, dx

loc_605CA:
		inc	ax
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 84 lignes, NON DÉTAILLÉE — combine Memory_TypedAllocDispatchB_5C832 ×2, sub_61CD2,
; sub_61F52.
; ==============================================================================================
GlyphObject_ResolveAndCache_605CE	proc far		; CODE XREF: GlyphObject_ResolveAndMeasure_7E00D+76P
					; GlyphObject_ResolveAndMeasureB_7FC92+3CP
					; DATA XREF: ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si

loc_605D2:
		push	di
		mov	si, [bp+arg_0]

loc_605D6:
		mov	di, [bp+arg_2]
		mov	dl, [bp+arg_4]
		cmp	byte ptr [si+16h], 0FFh
		jz	short loc_60617
		mov	al, [si+16h]
		push	ax
		mov	al, dl
		mov	ah, 0
		push	ax
		push	0
		mov	al, [si+6]
		push	ax

loc_605F1:
		push	large dword ptr	[si+2]
		push	5C44h

loc_605F8:
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		mov	ax, [bp+arg_8]
		add	ax, [si+0Eh]
		push	ax
		push	[bp+arg_6]
		push	di
		call	Render_DrawTextString_61CD2
		add	sp, 0Eh
		jmp	short loc_60646
; ���������������������������������������������������������������������������

loc_60617:				; CODE XREF: GlyphObject_ResolveAndCache_605CE+12j
		mov	al, dl
		mov	ah, 0
		push	ax
		push	0
		mov	al, [si+6]
		push	ax
		push	large dword ptr	[si+2]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		mov	ax, [bp+arg_8]
		add	ax, [si+0Eh]

loc_60639:
		push	ax

loc_6063A:
		push	[bp+arg_6]
		push	di

loc_6063E:
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch

loc_60646:				; CODE XREF: GlyphObject_ResolveAndCache_605CE+47j
		pop	di
		pop	si
		pop	bp
		retf
GlyphObject_ResolveAndCache_605CE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine Memory_TypedAllocDispatchB_5C832 et Font_ComputeGlyphBoundingBox_5E74E — mesure
; un caractère donné (variante paramétrable de MeasureRefCharA/B).
; ==============================================================================================
GlyphObject_MeasureChar_6064A	proc far		; CODE XREF: GlyphObject_MeasureWrapper_7DFCA+1FP
					; GlyphObject_ResolveAndMeasure_7E00D+89P ...

var_8		= word ptr -8
var_4		= word ptr -4
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		cmp	[bp+arg_2], 20h	; ' '
		jnz	short loc_6065F
		mov	ax, [si+14h]
		jmp	short loc_6068D
; ���������������������������������������������������������������������������

loc_6065F:				; CODE XREF: GlyphObject_MeasureChar_6064A+Ej
		push	ss
		lea	ax, [bp+var_8]
		push	ax
		push	large 0

loc_60667:
		push	0
		mov	al, [si+6]
		push	ax

loc_6066D:
		push	large dword ptr	[si+2]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		mov	al, [bp+arg_2]
		mov	ah, 0
		push	ax
		call	Font_ComputeGlyphBoundingBox_5E74E
		mov	ax, [bp+var_4]
		inc	ax

loc_6068D:				; CODE XREF: GlyphObject_MeasureChar_6064A+13j
		pop	si
		leave
		retf
GlyphObject_MeasureChar_6064A	endp

; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg339) — variante paramétrée de mesure de caractère
; (le caractère à mesurer est un argument, pas 'A' fixe).
; ==============================================================================================
GlyphObject_Method_MeasureCharParam_60690:				; DATA XREF: seg339:0610o
					; seg339:off_6D6FEo ...
		push	bp
		mov	bp, sp

loc_60693:
		sub	sp, 0Ah
		push	si
		mov	si, [bp+6]
		push	ss
		lea	ax, [bp-8]
		push	ax
		push	large 0
		push	0
		mov	al, [si+6]
		push	ax
		push	large dword ptr	[si+2]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		mov	al, [bp+8]
		mov	ah, 0
		push	ax

loc_606BF:
		call	Font_ComputeGlyphBoundingBox_5E74E
		mov	ax, [bp-8]

loc_606C7:
		mov	[bp-0Ah], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg339) — écrit un octet dans le champ +0x16 de
; l'objet, retourne 0.
; ==============================================================================================
GlyphObject_Method_SetFlagField_606D2:				; DATA XREF: seg339:05FCo seg339:063Ao ...
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	al, [bp+8]
		mov	[si+16h], al
		xor	ax, ax
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg339) — stub retournant 0.
; ==============================================================================================
GlyphObject_Method_ReturnZero_606E4:				; DATA XREF: seg339:0600o seg339:063Eo ...
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		xor	ax, ax
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg339) — copie un octet depuis un pointeur source
; dans le champ +0x16, retourne 0.
; ==============================================================================================
GlyphObject_Method_CopyFlagField_606EE:				; DATA XREF: seg339:0604o
					; seg339:off_6D6F2o ...
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]

loc_606F9:
		mov	al, [di]
		mov	[si+16h], al
		xor	ax, ax
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg339) — stub retournant 0 (identique à
; GlyphObject_Method_ReturnZero_606E4).
; ==============================================================================================
GlyphObject_Method_ReturnZeroB_60704:				; DATA XREF: seg339:0608o
					; seg339:off_6D6F6o ...
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		xor	ax, ax
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, destructeur scalar-deleting (tag 3E68h) : pose le tag, libère le buffer via
; Memory_TypedFree_5C7B6 (tag 5C44h) si présent, réinitialise les champs, libère l'objet si
; demandé (sub_338). Référencée par sub_7FAE0 et sub_804BF.
; ==============================================================================================
GlyphObject_ScalarDeletingDtorA_6070E	proc far		; CODE XREF: GlyphObject_DestructWrapper_7FAE0+12P
					; GlyphObject_DestructWrapperB_804BF+12P
					; DATA XREF: ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_6077F
		mov	word ptr [si], 3E68h
		push	0
		mov	al, [si+6]
		push	ax
		push	large dword ptr	[si+2]
		push	5C44h

loc_6072E:
		call	Memory_TypedAllocDispatchB_5C832

loc_60733:
		add	sp, 0Ah
		or	ax, dx
		cmp	byte ptr [si+7], 0

loc_6073C:
		jz	short loc_6075E

loc_6073E:
		cmp	dword ptr [si+2], 0

loc_60743:
		jz	short loc_6075E
		push	0
		mov	al, [si+6]
		push	ax
		mov	ax, si
		add	ax, 2
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_6075E:				; CODE XREF: GlyphObject_ScalarDeletingDtorA_6070E:loc_6073Cj
					; GlyphObject_ScalarDeletingDtorA_6070E:loc_60743j
		mov	dword ptr [si+2], 0
		mov	byte ptr [si+7], 0

loc_6076A:
		mov	dword ptr [si+8], 0
		test	di, 1
		jz	short loc_6077F
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_6077F:				; CODE XREF: GlyphObject_ScalarDeletingDtorA_6070E+Dj
					; GlyphObject_ScalarDeletingDtorA_6070E+68j
		pop	di
		pop	si
		pop	bp
		retf
GlyphObject_ScalarDeletingDtorA_6070E	endp

; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg339) — destructeur scalar-deleting (tag 3E40h),
; même motif que GlyphObject_ScalarDeletingDtorA_6070E pour une classe sœur/apparentée.
; ==============================================================================================
GlyphObject_ScalarDeletingDtorB_60783:				; DATA XREF: seg339:off_70EF0o
		push	bp
		mov	bp, sp

loc_60786:
		push	si
		push	di
		mov	si, [bp+6]

loc_6078B:
		mov	di, [bp+8]
		or	si, si

loc_60790:
		jz	short loc_607DD

loc_60792:
		mov	word ptr [si], 3E40h

loc_60796:
		cmp	byte ptr [si+7], 0
		jz	short loc_607BC
		cmp	dword ptr [si+2], 0
		jz	short loc_607BC
		push	0
		mov	al, [si+6]
		push	ax
		mov	ax, si
		add	ax, 2
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_607BC:				; CODE XREF: seg162:034Aj seg162:0351j
		mov	dword ptr [si+2], 0
		mov	byte ptr [si+7], 0
		mov	dword ptr [si+8], 0
		test	di, 1
		jz	short loc_607DD
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_607DD:				; CODE XREF: seg162:loc_60790j
					; seg162:0384j
		pop	di
		pop	si
		pop	bp

locret_607E0:
		retf
seg162		ends

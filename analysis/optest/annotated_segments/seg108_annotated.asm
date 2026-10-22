seg108		segment	byte public 'CODE' use16
		assume cs:seg108
		;org 0Eh
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; GlyphObject_ComputeMetrics_60456 (sub_60456 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, dispatch vtable ([bx+0x24]/[bx+0x18]) —
; calcul de métriques d'un objet glyphe.
; ==============================================================================================
GlyphObject_ComputeMetrics_3111E	proc far		; CODE XREF: sub_3166+180P
					; GlyphObject_ConstructWithBuffer_311CF+3Ep ...

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
GlyphObject_ComputeMetrics_3111E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GlyphObject_AllocateBuffer_604C9 (sub_604C9 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; alloue (sub_658). Référencée par sub_60507.
; ==============================================================================================
GlyphObject_AllocateBuffer_31191	proc far		; CODE XREF: seg001:02CFP
					; Conv_Construct_59B67+52P ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_311AA
		push	17h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_311CA

loc_311AA:				; CODE XREF: GlyphObject_AllocateBuffer_31191+9j
		mov	word ptr [si], 408Ah
		mov	dword ptr [si+2], 0
		mov	byte ptr [si+6], 2
		mov	byte ptr [si+7], 0
		mov	dword ptr [si+8], 0
		mov	word ptr [si], 40B2h

loc_311CA:				; CODE XREF: GlyphObject_AllocateBuffer_31191+17j
		mov	ax, si
		pop	si
		pop	bp
		retf
GlyphObject_AllocateBuffer_31191	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GlyphObject_ConstructWithBuffer_60507 (sub_60507 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; alloue (sub_658) puis GlyphObject_AllocateBuffer_604C9 puis
; GlyphObject_ComputeMetrics_60456.
; ==============================================================================================
GlyphObject_ConstructWithBuffer_311CF	proc far		; CODE XREF: sub_3166+113P
					; sub_1220C+331P ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_311E8
		push	17h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_31213

loc_311E8:				; CODE XREF: GlyphObject_ConstructWithBuffer_311CF+9j
		mov	word ptr [si], 408Ah
		mov	dword ptr [si+2], 0
		mov	byte ptr [si+6], 2
		mov	byte ptr [si+7], 0
		mov	dword ptr [si+8], 0
		mov	word ptr [si], 40B2h
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr GlyphObject_ComputeMetrics_3111E
		add	sp, 4

loc_31213:				; CODE XREF: GlyphObject_ConstructWithBuffer_311CF+17j
		mov	ax, si
		pop	si
		pop	bp
		retf
GlyphObject_ConstructWithBuffer_311CF	endp

; ���������������������������������������������������������������������������

loc_31218:				; DATA XREF: dseg:1DCDo dseg:3820o ...
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
		mov	al, [si+6]
		push	ax
		push	large dword ptr	[si+2]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	41h ; 'A'
		call	Font_ComputeGlyphBoundingBox_2EF02
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

loc_31257:				; DATA XREF: dseg:1DD1o dseg:3824o ...
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
		mov	al, [si+6]
		push	ax
		push	large dword ptr	[si+2]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	41h ; 'A'
		call	Font_ComputeGlyphBoundingBox_2EF02
		mov	ax, [bp-6]
		mov	[bp-0Ah], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		inc	ax
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GlyphObject_ResolveAndCache_605CE (sub_605CE de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 84 lignes, NON DÉTAILLÉE — combine Memory_TypedAllocDispatchB_5C832 ×2, sub_61CD2,
; sub_61F52.
; ==============================================================================================
GlyphObject_ResolveAndCache_31296	proc far		; CODE XREF: GlyphObject_ResolveAndMeasureB_C758E+3CP
					; DATA XREF: dseg:3804o ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	dl, [bp+arg_4]
		cmp	byte ptr [si+16h], 0FFh
		jz	short loc_312DF
		mov	al, [si+16h]
		push	ax
		mov	al, dl
		mov	ah, 0
		push	ax
		push	0
		mov	al, [si+6]
		push	ax
		push	large dword ptr	[si+2]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		mov	ax, [bp+arg_8]
		add	ax, [si+0Eh]
		push	ax
		push	[bp+arg_6]
		push	di
		call	Render_DrawTextString_32A58
		add	sp, 0Eh
		jmp	short loc_3130E
; ���������������������������������������������������������������������������

loc_312DF:				; CODE XREF: GlyphObject_ResolveAndCache_31296+12j
		mov	al, dl
		mov	ah, 0
		push	ax
		push	0
		mov	al, [si+6]
		push	ax
		push	large dword ptr	[si+2]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		mov	ax, [bp+arg_8]
		add	ax, [si+0Eh]
		push	ax
		push	[bp+arg_6]
		push	di
		call	Render_MeasureOrDrawTextString_32CD8
		add	sp, 0Ch

loc_3130E:				; CODE XREF: GlyphObject_ResolveAndCache_31296+47j
		pop	di
		pop	si
		pop	bp
		retf
GlyphObject_ResolveAndCache_31296	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GlyphObject_MeasureChar_6064A (sub_6064A de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine Memory_TypedAllocDispatchB_5C832 et Font_ComputeGlyphBoundingBox_5E74E — mesure un
; caractère donné (variante paramétrable de MeasureRefCharA/B).
; ==============================================================================================
GlyphObject_MeasureChar_31312	proc far		; CODE XREF: GlyphObject_MeasureWrapperB_C754D+19P
					; GlyphObject_ResolveAndMeasureB_C758E+49P
					; DATA XREF: ...

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
		jnz	short loc_31327
		mov	ax, [si+14h]
		jmp	short loc_31355
; ���������������������������������������������������������������������������

loc_31327:				; CODE XREF: GlyphObject_MeasureChar_31312+Ej
		push	ss
		lea	ax, [bp+var_8]
		push	ax
		push	large 0
		push	0
		mov	al, [si+6]
		push	ax
		push	large dword ptr	[si+2]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		mov	al, [bp+arg_2]
		mov	ah, 0
		push	ax
		call	Font_ComputeGlyphBoundingBox_2EF02
		mov	ax, [bp+var_4]
		inc	ax

loc_31355:				; CODE XREF: GlyphObject_MeasureChar_31312+13j
		pop	si
		leave
		retf
GlyphObject_MeasureChar_31312	endp

; ���������������������������������������������������������������������������

loc_31358:				; DATA XREF: dseg:1DC9o dseg:381Co ...
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
		mov	al, [si+6]
		push	ax
		push	large dword ptr	[si+2]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		mov	al, [bp+8]
		mov	ah, 0
		push	ax
		call	Font_ComputeGlyphBoundingBox_2EF02
		mov	ax, [bp-8]
		mov	[bp-0Ah], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_3139A	proc far		; CODE XREF: Midgame1_PlayPart1_5FCF0+6497P
					; sub_BDE10+DDDP
					; DATA XREF: ...

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, [bp+arg_2]
		mov	[si+16h], al
		xor	ax, ax
		pop	si
		pop	bp
		retf
sub_3139A	endp

; ���������������������������������������������������������������������������

loc_313AC:				; DATA XREF: dseg:1DB9o dseg:380Co ...
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		xor	ax, ax
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_313B6:				; DATA XREF: dseg:1DBDo dseg:3810o ...
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		mov	al, [di]
		mov	[si+16h], al
		xor	ax, ax
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_313CC:				; DATA XREF: dseg:1DC1o dseg:3814o ...
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		xor	ax, ax
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GlyphObject_ScalarDeletingDtorA_6070E (sub_6070E de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; destructeur scalar-deleting (tag 3E68h) : pose le tag, libère le buffer via
; Memory_TypedFree_5C7B6 (tag 5C44h) si présent, réinitialise les champs, libère l'objet si
; demandé (sub_338). Référencée par sub_7FAE0 et sub_804BF.
; ==============================================================================================
GlyphObject_ScalarDeletingDtorA_313D6	proc far		; CODE XREF: seg001:0364P
					; sub_4E660+A75P ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_31447
		mov	word ptr [si], 40B2h
		push	0
		mov	al, [si+6]
		push	ax
		push	large dword ptr	[si+2]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		or	ax, dx
		cmp	byte ptr [si+7], 0
		jz	short loc_31426
		cmp	dword ptr [si+2], 0
		jz	short loc_31426
		push	0
		mov	al, [si+6]
		push	ax
		mov	ax, si
		add	ax, 2
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_31426:				; CODE XREF: GlyphObject_ScalarDeletingDtorA_313D6+2Ej
					; GlyphObject_ScalarDeletingDtorA_313D6+35j
		mov	dword ptr [si+2], 0
		mov	byte ptr [si+7], 0
		mov	dword ptr [si+8], 0
		test	di, 1
		jz	short loc_31447
		push	si
		call	sub_308
		pop	cx

loc_31447:				; CODE XREF: GlyphObject_ScalarDeletingDtorA_313D6+Dj
					; GlyphObject_ScalarDeletingDtorA_313D6+68j
		pop	di
		pop	si
		pop	bp
		retf
GlyphObject_ScalarDeletingDtorA_313D6	endp

seg108		ends

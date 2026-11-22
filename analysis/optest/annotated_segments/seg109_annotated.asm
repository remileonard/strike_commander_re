seg109		segment	byte public 'CODE' use16
		assume cs:seg109
		;org 0Bh
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Widget_ApplyStyleAndAllocate_607E1 (sub_607E1 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; alloue (sub_658) et applique un style (TextFormat_ApplyStyleAttribute_5E2D0, seg143).
; ==============================================================================================
Widget_ApplyStyleAndAllocate_3144B	proc far		; CODE XREF: sub_4C1F+8EP
					; sub_11233+6EP ...

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp

loc_3144E:				; DATA XREF: seg170:043Eo
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_31467
		push	19h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_314A4

loc_31467:				; CODE XREF: Widget_ApplyStyleAndAllocate_3144B+Cj
		mov	word ptr [si], 40DAh
		mov	word ptr [si+2], 0
		mov	word ptr [si+4], 0
		mov	byte ptr [si+0Fh], 0
		mov	ax, si
		add	ax, 10h
		push	[bp+arg_2]
		mov	ax, si
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_2E9A4
		add	sp, 4
		mov	ax, [bp+arg_4]
		mov	[bp+var_2], ax
		mov	[si+14h], ax
		mov	byte ptr [si+16h], 4
		xor	ax, ax
		mov	[si+12h], ax
		mov	[si+10h], ax

loc_314A4:				; CODE XREF: Widget_ApplyStyleAndAllocate_3144B+1Aj
		mov	ax, si
		pop	si
		leave
		retf
Widget_ApplyStyleAndAllocate_3144B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Widget_Method_Dispatch8_6083F (sub_6083F de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, dispatch vtable [bx+8].
; ==============================================================================================
Widget_Method_Dispatch8_314A9	proc far		; CODE XREF: sub_11233+7FP
					; seg024:0105P	...

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, [bp+arg_2]
		push	ax
		push	word ptr [si+14h]
		mov	bx, [si+14h]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	al, [bp+arg_2]
		mov	[si+17h], al
		pop	si
		pop	bp
		retf
Widget_Method_Dispatch8_314A9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Widget_Method_DispatchC_60861 (sub_60861 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, dispatch vtable [bx+0Ch].
; ==============================================================================================
Widget_Method_DispatchC_314CB	proc far		; CODE XREF: sub_6B9C0+1BEP
					; sub_768F0+1A3P ...

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, [bp+arg_2]
		push	ax
		push	word ptr [si+14h]
		mov	bx, [si+14h]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		mov	al, [bp+arg_2]
		mov	[si+18h], al
		pop	si
		pop	bp
		retf
Widget_Method_DispatchC_314CB	endp

; ���������������������������������������������������������������������������

loc_314ED:				; DATA XREF: dseg:40EAo
		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+6]
		mov	ax, [bp+8]
		mov	[bp-2],	ax
		mov	ax, [bp+0Ah]
		mov	[bp-4],	ax
		mov	ax, [bp+0Ch]
		mov	[bp-6],	ax
		mov	ax, [bp+0Eh]
		mov	[bp-8],	ax
		mov	ax, [bp-2]
		mov	[si+6],	ax
		mov	ax, [bp-4]
		mov	[si+8],	ax
		mov	ax, [bp-6]
		mov	[si+0Ah], ax
		mov	ax, [bp-8]
		mov	[si+0Ch], ax
		push	large 0
		push	si
		nop
		push	cs
		call	near ptr Widget_ComputeBoundsExtent_31755
		add	sp, 6
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_31536:				; DATA XREF: dseg:40F6o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	dl, [bp+8]
		cmp	dl, 0FFh
		jnz	short loc_31548
		mov	dl, [si+18h]

loc_31548:				; CODE XREF: seg109:0103j
		push	dx
		mov	ax, si
		add	ax, 2
		push	ax
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	dl, [bp+8]
		mov	si, [bp+6]
		cmp	word ptr [si+14h], 0
		jz	short loc_3156F
		mov	ax, 1
		jmp	short loc_31571
; ���������������������������������������������������������������������������

loc_3156F:				; CODE XREF: seg109:0128j
		xor	ax, ax

loc_31571:				; CODE XREF: seg109:012Dj
		or	al, al
		jz	short loc_31598
		cmp	dl, 0FFh
		jnz	short loc_3157D
		mov	dl, [si+18h]

loc_3157D:				; CODE XREF: seg109:0138j
		push	dx
		mov	ax, si
		add	ax, 2
		push	ax
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	large 0
		push	si
		nop
		push	cs
		call	near ptr Widget_ComputeBoundsExtent_31755
		add	sp, 6

loc_31598:				; CODE XREF: seg109:0133j
		pop	si
		pop	bp
		retf	4

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Widget_RenderWithAttributes_60933 (sub_60933 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — ⚠️ far, 99 lignes, NON DÉTAILLÉE — combine
; dispatch vtable multiple ([bx+4]/[bx+0x20]/[bx+0xC]/[bx+8]/[bx]) et UI_Helper_5E5F4
; (seg143). Référencée par sub_5E5F4.
; ==============================================================================================
Widget_RenderWithAttributes_3159D	proc far		; CODE XREF: seg109:0213p

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+14h], 0
		jz	short loc_315B3
		mov	ax, 1
		jmp	short loc_315B5
; ���������������������������������������������������������������������������

loc_315B3:				; CODE XREF: Widget_RenderWithAttributes_3159D+Fj
		xor	ax, ax

loc_315B5:				; CODE XREF: Widget_RenderWithAttributes_3159D+14j
		or	al, al
		jz	short loc_31622
		cmp	[bp+arg_2], 0FFh
		jnz	short loc_315C5
		mov	al, [si+18h]
		mov	[bp+arg_2], al

loc_315C5:				; CODE XREF: Widget_RenderWithAttributes_3159D+20j
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		pop	cx
		mov	dx, [si+12h]
		sub	dx, ax
		mov	di, dx
		push	word ptr [si+14h]
		mov	bx, [si+14h]
		mov	bx, [bx]
		call	dword ptr [bx+20h]
		pop	cx
		mov	dx, di
		add	dx, ax
		dec	dx
		mov	bx, [si+14h]
		add	dx, [bx+12h]
		mov	[bp+var_2], dx
		push	si
		mov	bx, [si]
		call	dword ptr [bx+0Ch]
		pop	cx
		cmp	ax, di
		jl	short loc_31622
		mov	al, [bp+arg_2]
		push	ax
		push	[bp+var_2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		pop	cx
		push	ax
		push	di
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		mov	dx, [si+10h]
		sub	dx, ax
		push	dx
		mov	ax, si
		add	ax, 2
		push	ax
		call	UI_Helper_2ECC8
		add	sp, 0Ch

loc_31622:				; CODE XREF: Widget_RenderWithAttributes_3159D+1Aj
					; Widget_RenderWithAttributes_3159D+59j
		pop	di
		pop	si
		leave
		retf	4
Widget_RenderWithAttributes_3159D	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		cmp	word ptr [si+14h], 0
		jz	short loc_3163B
		mov	ax, 1
		jmp	short loc_3163D
; ���������������������������������������������������������������������������

loc_3163B:				; CODE XREF: seg109:01F4j
		xor	ax, ax

loc_3163D:				; CODE XREF: seg109:01F9j
		or	al, al
		jz	short loc_316A4
		cmp	byte ptr [bp+8], 0FFh
		jnz	short loc_3164D
		mov	al, [si+18h]
		mov	[bp+8],	al

loc_3164D:				; CODE XREF: seg109:0205j
		mov	al, [bp+8]
		push	ax
		push	si
		push	cs
		call	near ptr Widget_RenderWithAttributes_3159D
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		pop	cx
		mov	dx, [si+12h]
		sub	dx, ax
		mov	di, dx
		push	word ptr [si+14h]
		mov	bx, [si+14h]
		mov	bx, [bx]
		call	dword ptr [bx+20h]
		pop	cx
		mov	bx, [si+14h]
		add	ax, [bx+12h]
		add	ax, di
		mov	di, ax
		mov	al, [bp+8]
		push	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+0Ch]
		pop	cx
		push	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		pop	cx
		push	ax
		push	di
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		push	ax
		mov	ax, si
		add	ax, 2
		push	ax
		call	UI_Helper_2ECC8
		add	sp, 0Ch

loc_316A4:				; CODE XREF: seg109:01FFj
		pop	di
		pop	si
		pop	bp
		retf	4
; ���������������������������������������������������������������������������

loc_316AA:				; DATA XREF: dseg:40EEo
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	ax, [bp+8]
		mov	[si+6],	ax
		mov	ax, [bp+0Ah]
		mov	[si+0Ah], ax
		push	large 0
		push	si
		nop
		push	cs
		call	near ptr Widget_ComputeBoundsExtent_31755
		add	sp, 6
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_316CC:				; DATA XREF: dseg:40F2o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	ax, [bp+8]
		mov	[si+8],	ax
		mov	ax, [bp+0Ah]
		mov	[si+0Ch], ax
		push	large 0
		push	si
		nop
		push	cs
		call	near ptr Widget_ComputeBoundsExtent_31755
		add	sp, 6
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Widget_Method_DispatchChain_60A84 (sub_60A84 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, dispatch vtable en chaîne
; ([bx+4]/[bx]/[bx+0x18]/[bx]). Référencée par sub_60B1D.
; ==============================================================================================
Widget_Method_DispatchChain_316EE	proc far		; CODE XREF: Widget_UpdateLayoutAndBounds_31787+73p

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		cmp	[bp+arg_2], 1Fh
		jle	short loc_31752
		push	word ptr [si+12h]
		push	word ptr [si+10h]
		mov	al, [bp+arg_2]
		push	ax
		mov	ax, si
		add	ax, 2
		push	ax
		push	word ptr [si+14h]
		mov	bx, [si+14h]
		mov	bx, [bx]
		call	dword ptr [bx+4]
		add	sp, 0Ah
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		mov	dx, [si+10h]
		sub	dx, ax
		push	dx
		mov	al, [bp+arg_2]
		push	ax
		push	word ptr [si+14h]
		mov	bx, [si+14h]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 4
		pop	dx
		add	dx, ax
		mov	bx, [si+14h]
		add	dx, [bx+10h]
		mov	[bp+var_2], dx
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		add	ax, [bp+var_2]
		mov	[si+10h], ax

loc_31752:				; CODE XREF: Widget_Method_DispatchChain_316EE+Ej
		pop	si
		leave
		retf
Widget_Method_DispatchChain_316EE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Widget_ComputeBoundsExtent_60AEB (sub_60AEB de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, calcule les bornes d'un widget (dispatch
; vtable [bx]/[bx+4] pour la position de base, additionne des décalages, stocke dans les
; champs +0x10/+0x12). Référencée massivement depuis seg016 et par de nombreuses fonctions de
; ce segment.
; ==============================================================================================
Widget_ComputeBoundsExtent_31755	proc far		; CODE XREF: PaletteScreen_DispatchWidgetLayoutB_11363+31P
					; seg109:00EDp	...

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		add	ax, [bp+var_2]
		mov	[si+10h], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		pop	cx
		add	ax, [bp+var_4]
		mov	[si+12h], ax
		pop	si
		leave
		retf
Widget_ComputeBoundsExtent_31755	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Widget_UpdateLayoutAndBounds_60B1D (sub_60B1D de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — ⚠️ far, 103 lignes, NON DÉTAILLÉE — combine
; dispatch vtable, GlyphObject-related sub_60E60 et Widget_Method_DispatchChain_60A84.
; Référencée par sub_60BA6 (×2).
; ==============================================================================================
Widget_UpdateLayoutAndBounds_31787	proc far		; CODE XREF: Widget_RenderComplexLayout_31810+196p
					; Widget_RenderComplexLayout_31810+1E9p

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	word ptr [si+14h]
		mov	bx, [si+14h]
		mov	bx, [bx]
		call	dword ptr [bx+20h]
		pop	cx
		dec	ax
		mov	bx, [si+14h]
		add	ax, [bx+12h]
		add	ax, [bx+10h]
		mov	[bp+var_2], ax

loc_317AE:				; CODE XREF: Widget_UpdateLayoutAndBounds_31787+6Ej
		push	di
		push	si
		nop
		push	cs
		call	near ptr GlyphObject_LayoutAndRenderAll_31ACA
		jmp	short loc_317FD
; ���������������������������������������������������������������������������

loc_317B7:				; CODE XREF: Widget_UpdateLayoutAndBounds_31787+83j
		cmp	dx, 0Dh
		jz	short loc_317C1
		cmp	dx, 0Ah
		jnz	short loc_317F7

loc_317C1:				; CODE XREF: Widget_UpdateLayoutAndBounds_31787+33j
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		pop	cx
		mov	dx, [si+12h]
		sub	dx, ax
		add	dx, [bp+var_2]
		mov	[bp+var_4], dx
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		pop	cx
		add	ax, [bp+var_4]
		mov	[si+12h], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		mov	[bp+var_6], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		add	ax, [bp+var_6]
		mov	[si+10h], ax
		jmp	short loc_317AE
; ���������������������������������������������������������������������������

loc_317F7:				; CODE XREF: Widget_UpdateLayoutAndBounds_31787+38j
		push	dx
		push	si
		push	cs
		call	near ptr Widget_Method_DispatchChain_316EE

loc_317FD:				; CODE XREF: Widget_UpdateLayoutAndBounds_31787+2Ej
		add	sp, 4
		mov	bx, di
		inc	di
		mov	al, [bx]
		cbw
		mov	dx, ax
		or	ax, ax
		jnz	short loc_317B7
		pop	di
		pop	si
		leave
		retf
Widget_UpdateLayoutAndBounds_31787	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Widget_RenderComplexLayout_60BA6 (sub_60BA6 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — ⚠️ far, 331 lignes, NON DÉTAILLÉE — la plus grosse
; fonction du segment, combine de nombreux utilitaires bas niveau
; (sub_22E1/2235/225D/2277/2B99/29E4) avec Widget_UpdateLayoutAndBounds_60B1D (×2) et dispatch
; vtable. Candidat pour session dédiée.
; ==============================================================================================
Widget_RenderComplexLayout_31810	proc far		; CODE XREF: Widget_RenderComplexLayoutWrapper_31A3B+1Cp

var_198		= word ptr -198h
var_D0		= word ptr -0D0h
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 198h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]

loc_3181F:				; CODE XREF: Widget_RenderComplexLayout_31810+1B5j
		push	large 0C80000h
		lea	ax, [bp+var_D0]
		push	ax
		call	CRT_Memset_Public
		add	sp, 6
		push	large 0C80000h
		lea	ax, [bp+var_198]
		push	ax
		call	CRT_Memset_Public
		add	sp, 6
		jmp	loc_319E3
; ���������������������������������������������������������������������������

loc_31848:				; CODE XREF: Widget_RenderComplexLayout_31810+1DFj
		mov	ax, dx
		cmp	ax, 25h	; '%'
		jz	short loc_31852
		jmp	loc_319C8	; default
; ���������������������������������������������������������������������������

loc_31852:				; CODE XREF: Widget_RenderComplexLayout_31810+3Dj
		mov	al, [di]
		cbw
		mov	[bp+var_2], ax
		inc	di
		mov	[bp+var_8], ax
		mov	cx, 0Eh		; switch 14 cases
		mov	bx, offset word_31A03

loc_31862:				; CODE XREF: Widget_RenderComplexLayout_31810+5Dj
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_8]
		jz	short loc_31872
		add	bx, 2
		loop	loc_31862
		jmp	loc_319C8	; default
; ���������������������������������������������������������������������������

loc_31872:				; CODE XREF: Widget_RenderComplexLayout_31810+58j
		jmp	word ptr cs:[bx+1Ch] ; switch jump

loc_31876:				; DATA XREF: seg109:05DFo
		push	0Ah		; case 0x64
		lea	ax, [bp+var_198]
		push	ax
		add	[bp+arg_4], 2
		mov	bx, [bp+arg_4]
		push	word ptr [bx-2]
		call	CRT_Itoa_Signed10
		add	sp, 6
		jmp	loc_319D5
; ���������������������������������������������������������������������������

loc_31892:				; CODE XREF: Widget_RenderComplexLayout_31810:loc_31872j
					; DATA XREF: seg109:05DFo
		push	0Ah		; case 0x75
		lea	ax, [bp+var_198]
		push	ax
		add	[bp+arg_4], 2
		mov	bx, [bp+arg_4]
		movzx	eax, word ptr [bx-2]
		push	eax
		call	CRT_Itoa_Unsigned
		add	sp, 8
		jmp	loc_319D5
; ���������������������������������������������������������������������������

loc_318B2:				; CODE XREF: Widget_RenderComplexLayout_31810:loc_31872j
					; DATA XREF: seg109:05DFo
		push	0Ah		; case 0x44
		lea	ax, [bp+var_198]
		push	ax
		add	[bp+arg_4], 4
		mov	bx, [bp+arg_4]
		push	large dword ptr	[bx-4]
		call	CRT_Itoa_BaseVariant
		add	sp, 8
		jmp	loc_319D5
; ���������������������������������������������������������������������������

loc_318CF:				; CODE XREF: Widget_RenderComplexLayout_31810:loc_31872j
					; DATA XREF: seg109:05DFo
		push	0Ah		; case 0x55
		lea	ax, [bp+var_198]
		push	ax
		add	[bp+arg_4], 4
		mov	bx, [bp+arg_4]
		push	large dword ptr	[bx-4]
		call	CRT_Itoa_Unsigned
		add	sp, 8
		jmp	loc_319D5
; ���������������������������������������������������������������������������

loc_318EC:				; CODE XREF: Widget_RenderComplexLayout_31810:loc_31872j
					; DATA XREF: seg109:05DFo
		push	10h		; case 0x78
		lea	ax, [bp+var_198]
		push	ax
		add	[bp+arg_4], 2
		mov	bx, [bp+arg_4]
		movzx	eax, word ptr [bx-2]
		push	eax
		call	CRT_Itoa_Unsigned
		add	sp, 8
		push	ax
		call	CRT_Strupr
		pop	cx
		jmp	loc_319D5
; ���������������������������������������������������������������������������

loc_31913:				; CODE XREF: Widget_RenderComplexLayout_31810:loc_31872j
					; DATA XREF: seg109:05DFo
		add	[bp+arg_4], 2	; case 0x63
		mov	bx, [bp+arg_4]
		mov	al, [bx-2]
		mov	byte ptr [bp+var_198], al
		jmp	loc_319CC
; ���������������������������������������������������������������������������

loc_31924:				; CODE XREF: Widget_RenderComplexLayout_31810:loc_31872j
					; DATA XREF: seg109:05DFo
		add	[bp+arg_4], 2	; case 0x53
		mov	bx, [bp+arg_4]
		push	word ptr [bx-2]
		jmp	loc_319D6
; ���������������������������������������������������������������������������

loc_31931:				; CODE XREF: Widget_RenderComplexLayout_31810:loc_31872j
					; DATA XREF: seg109:05DFo
		add	[bp+arg_4], 2	; case 0x58
		mov	bx, [bp+arg_4]
		mov	ax, [bx-2]
		mov	[bp+var_4], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		add	ax, [bp+var_4]
		mov	[si+10h], ax
		jmp	loc_319E3
; ���������������������������������������������������������������������������

loc_3194D:				; CODE XREF: Widget_RenderComplexLayout_31810:loc_31872j
					; DATA XREF: seg109:05DFo
		add	[bp+arg_4], 2	; case 0x59
		mov	bx, [bp+arg_4]
		mov	ax, [bx-2]
		mov	[bp+var_6], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		pop	cx
		add	ax, [bp+var_6]
		mov	[si+12h], ax
		jmp	short loc_319E3
; ���������������������������������������������������������������������������

loc_31969:				; CODE XREF: Widget_RenderComplexLayout_31810:loc_31872j
					; DATA XREF: seg109:05DFo
		add	[bp+arg_4], 2	; case 0x42
		mov	bx, [bp+arg_4]
		mov	al, [bx-2]
		mov	[si+18h], al
		jmp	short loc_319E3
; ���������������������������������������������������������������������������

loc_31978:				; CODE XREF: Widget_RenderComplexLayout_31810:loc_31872j
					; DATA XREF: seg109:05DFo
		add	[bp+arg_4], 2	; case 0x46
		mov	bx, [bp+arg_4]
		mov	al, [bx-2]
		mov	[si+17h], al
		jmp	short loc_319E3
; ���������������������������������������������������������������������������

loc_31987:				; CODE XREF: Widget_RenderComplexLayout_31810:loc_31872j
					; DATA XREF: seg109:05DFo
		push	si		; case 0x50
		nop
		push	cs
		call	near ptr sub_31A60
		pop	cx
		jmp	short loc_319E3
; ���������������������������������������������������������������������������

loc_31990:				; CODE XREF: Widget_RenderComplexLayout_31810:loc_31872j
					; DATA XREF: seg109:05DFo
		add	[bp+arg_4], 2	; case 0x4A
		mov	bx, [bp+arg_4]
		mov	al, [bx-2]
		mov	[si+16h], al
		jmp	short loc_319E3
; ���������������������������������������������������������������������������

loc_3199F:				; CODE XREF: Widget_RenderComplexLayout_31810:loc_31872j
					; DATA XREF: seg109:05DFo
		lea	ax, [bp+var_D0]	; case 0x5A
		push	ax
		push	si
		push	cs
		call	near ptr Widget_UpdateLayoutAndBounds_31787
		add	sp, 4
		add	[bp+arg_4], 2
		mov	bx, [bp+arg_4]
		mov	al, [bx-2]
		push	ax
		push	word ptr [si+14h]
		mov	bx, [si+14h]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		jmp	loc_3181F
; ���������������������������������������������������������������������������

loc_319C8:				; CODE XREF: Widget_RenderComplexLayout_31810+3Fj
					; Widget_RenderComplexLayout_31810+5Fj
		mov	byte ptr [bp+var_198], dl ; default

loc_319CC:				; CODE XREF: Widget_RenderComplexLayout_31810+111j
		mov	byte ptr [bp+var_198+1], 0
		lea	ax, [bp+var_198]

loc_319D5:				; CODE XREF: Widget_RenderComplexLayout_31810+7Fj
					; Widget_RenderComplexLayout_31810+9Fj ...
		push	ax

loc_319D6:				; CODE XREF: Widget_RenderComplexLayout_31810+11Ej
		lea	ax, [bp+var_D0]
		push	ax
		call	CRT_Strcat
		add	sp, 4

loc_319E3:				; CODE XREF: Widget_RenderComplexLayout_31810+35j
					; Widget_RenderComplexLayout_31810+13Aj ...
		mov	bx, di
		inc	di
		mov	al, [bx]
		cbw
		mov	dx, ax
		or	ax, ax
		jz	short loc_319F2
		jmp	loc_31848
; ���������������������������������������������������������������������������

loc_319F2:				; CODE XREF: Widget_RenderComplexLayout_31810+1DDj
		lea	ax, [bp+var_D0]
		push	ax
		push	si
		push	cs
		call	near ptr Widget_UpdateLayoutAndBounds_31787
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
Widget_RenderComplexLayout_31810	endp

; ���������������������������������������������������������������������������
word_31A03	dw    42h,   44h,   46h,   4Ah ; DATA XREF: Widget_RenderComplexLayout_31810+4Fo
		dw    50h,   53h,   55h,   58h ; value table for switch	statement
		dw    59h,   5Ah,   63h,   64h
		dw    75h,   78h
		dw offset loc_31969	; jump table for switch	statement
		dw offset loc_318B2
		dw offset loc_31978
		dw offset loc_31990
		dw offset loc_31987
		dw offset loc_31924
		dw offset loc_318CF
		dw offset loc_31931
		dw offset loc_3194D
		dw offset loc_3199F
		dw offset loc_31913
		dw offset loc_31876
		dw offset loc_31892
		dw offset loc_318EC

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Widget_RenderComplexLayoutWrapper_60DD1 (sub_60DD1 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, enveloppe appelant
; Widget_RenderComplexLayout_60BA6.
; ==============================================================================================
Widget_RenderComplexLayoutWrapper_31A3B	proc far		; CODE XREF: sub_4FFF+20P
					; sub_502B+195P ...

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+14h], 0
		jz	short loc_31A5D
		lea	ax, [bp+arg_4]
		mov	[bp+var_2], ax
		push	ax
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr Widget_RenderComplexLayout_31810
		add	sp, 6

loc_31A5D:				; CODE XREF: Widget_RenderComplexLayoutWrapper_31A3B+Ej
		pop	si
		leave
		retf
Widget_RenderComplexLayoutWrapper_31A3B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_31A60	proc far		; CODE XREF: Widget_RenderComplexLayout_31810+17Ap

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_31A60	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; GlyphObject_RenderToWidget_60DFE (sub_60DFE de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — ⚠️ far, 67 lignes, NON DÉTAILLÉE — dispatch
; vtable, référencée deux fois par sub_60E60.
; ==============================================================================================
GlyphObject_RenderToWidget_31A68	proc far		; CODE XREF: sub_CE2C+15FP
					; GlyphObject_LayoutAndRenderAll_31ACA+40p ...

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
		mov	[bp+var_2], 0
		mov	[bp+var_4], 0
		jmp	short loc_31A9F
; ���������������������������������������������������������������������������

loc_31A82:				; CODE XREF: GlyphObject_RenderToWidget_31A68+3Fj
		mov	al, [di]
		push	ax
		push	word ptr [si+14h]
		mov	bx, [si+14h]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	dx, [bp+var_2]
		add	dx, ax
		mov	[bp+var_2], dx
		inc	di
		inc	[bp+var_4]

loc_31A9F:				; CODE XREF: GlyphObject_RenderToWidget_31A68+18j
		cmp	byte ptr [di], 0Ah
		jz	short loc_31AA9
		cmp	byte ptr [di], 0
		jnz	short loc_31A82

loc_31AA9:				; CODE XREF: GlyphObject_RenderToWidget_31A68+3Aj
		cmp	[bp+var_4], 0
		jz	short loc_31AC3
		mov	dx, [bp+var_4]
		dec	dx
		mov	bx, [si+14h]
		mov	ax, [bx+10h]
		imul	dx
		mov	dx, [bp+var_2]
		add	dx, ax
		mov	[bp+var_2], dx

loc_31AC3:				; CODE XREF: GlyphObject_RenderToWidget_31A68+45j
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
GlyphObject_RenderToWidget_31A68	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; GlyphObject_LayoutAndRenderAll_60E60 (sub_60E60 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — ⚠️ far, 131 lignes, NON DÉTAILLÉE — orchestre
; GlyphObject_RenderToWidget_60DFE (×2) et dispatch vtable multiple. Référencée par
; Widget_UpdateLayoutAndBounds_60B1D.
; ==============================================================================================
GlyphObject_LayoutAndRenderAll_31ACA	proc far		; CODE XREF: Widget_UpdateLayoutAndBounds_31787+2Bp

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	al, [si+16h]
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 3		; switch 4 cases
		ja	short loc_31B5F	; default
		shl	bx, 1
		jmp	cs:off_31B63[bx] ; switch jump

loc_31AEB:				; DATA XREF: seg109:off_31B63o
		push	si		; case 0x0
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		mov	[bp+var_2], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		add	ax, [bp+var_2]
		jmp	short loc_31B5C
; ���������������������������������������������������������������������������

loc_31AFF:				; CODE XREF: GlyphObject_LayoutAndRenderAll_31ACA+1Cj
					; DATA XREF: seg109:off_31B63o
		push	si		; case 0x1
		mov	bx, [si]
		call	dword ptr [bx+8]
		pop	cx
		push	ax
		push	di
		push	si
		push	cs
		call	near ptr GlyphObject_RenderToWidget_31A68
		add	sp, 4
		pop	dx
		sub	dx, ax
		mov	[bp+var_4], dx
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		add	ax, [bp+var_4]
		jmp	short loc_31B5C
; ���������������������������������������������������������������������������

loc_31B21:				; CODE XREF: GlyphObject_LayoutAndRenderAll_31ACA+1Cj
					; DATA XREF: seg109:off_31B63o
		push	si		; case 0x2
		mov	bx, [si]
		call	dword ptr [bx+8]
		pop	cx
		push	ax
		push	di
		push	si
		push	cs
		call	near ptr GlyphObject_RenderToWidget_31A68
		add	sp, 4
		pop	dx
		sub	dx, ax
		mov	ax, dx
		cwd
		sub	ax, dx
		sar	ax, 1
		mov	[bp+var_6], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		add	ax, [bp+var_6]
		jmp	short loc_31B5C
; ���������������������������������������������������������������������������

loc_31B4A:				; CODE XREF: GlyphObject_LayoutAndRenderAll_31ACA+1Cj
					; DATA XREF: seg109:off_31B63o
		push	si		; case 0x3
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		mov	[bp+var_8], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		add	ax, [bp+var_8]

loc_31B5C:				; CODE XREF: GlyphObject_LayoutAndRenderAll_31ACA+33j
					; GlyphObject_LayoutAndRenderAll_31ACA+55j ...
		mov	[si+10h], ax

loc_31B5F:				; CODE XREF: GlyphObject_LayoutAndRenderAll_31ACA+18j
		pop	di		; default
		pop	si
		leave
		retf
GlyphObject_LayoutAndRenderAll_31ACA	endp

; ���������������������������������������������������������������������������
off_31B63	dw offset loc_31AEB	; DATA XREF: GlyphObject_LayoutAndRenderAll_31ACA+1Cr
		dw offset loc_31AFF	; jump table for switch	statement
		dw offset loc_31B21
		dw offset loc_31B4A
; ���������������������������������������������������������������������������

loc_31B6B:				; DATA XREF: dseg:40DAo
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	ax, [si+6]
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_31B78:				; DATA XREF: dseg:40DEo
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	ax, [si+8]
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_31B85:				; DATA XREF: dseg:40E2o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	ax, [si+0Ah]
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_31B92:				; DATA XREF: dseg:40E6o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	ax, [si+0Ch]
		pop	si
		pop	bp
		retf
seg109		ends

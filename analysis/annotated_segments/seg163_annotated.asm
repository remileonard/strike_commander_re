seg163		segment	byte public 'CODE' use16
		assume cs:seg163
		;org 1
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue (sub_658) et applique un style (TextFormat_ApplyStyleAttribute_5E2D0, seg143).
; ==============================================================================================
Widget_ApplyStyleAndAllocate_607E1	proc far		; CODE XREF: seg027:01A8P
					; TextRenderer_Main+7AAP ...

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp

loc_607E4:				; DATA XREF: seg216:05DEo
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_607FD
		push	19h

loc_607F1:
		call	CRT_Malloc16_Retry
		pop	cx

loc_607F7:
		mov	si, ax

loc_607F9:
		or	ax, ax
		jz	short loc_6083A

loc_607FD:				; CODE XREF: Widget_ApplyStyleAndAllocate_607E1+Cj
		mov	word ptr [si], 0D56h

loc_60801:
		mov	word ptr [si+2], 0

loc_60806:
		mov	word ptr [si+4], 0
		mov	byte ptr [si+0Fh], 0
		mov	ax, si
		add	ax, 10h
		push	[bp+arg_2]
		mov	ax, si
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_5E2D0
		add	sp, 4
		mov	ax, [bp+arg_4]
		mov	[bp+var_2], ax
		mov	[si+14h], ax
		mov	byte ptr [si+16h], 4
		xor	ax, ax
		mov	[si+12h], ax
		mov	[si+10h], ax

loc_6083A:				; CODE XREF: Widget_ApplyStyleAndAllocate_607E1+1Aj
		mov	ax, si
		pop	si
		leave
		retf
Widget_ApplyStyleAndAllocate_607E1	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, dispatch vtable [bx+8].
; ==============================================================================================
Widget_Method_Dispatch8_6083F	proc far		; CODE XREF: seg016:05B6P seg016:0604P ...

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si

loc_60843:
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
Widget_Method_Dispatch8_6083F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, dispatch vtable [bx+0Ch].
; ==============================================================================================
Widget_Method_DispatchC_60861	proc far		; CODE XREF: seg016:05C6P seg016:0614P ...

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]

loc_60868:
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
Widget_Method_DispatchC_60861	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle Widget_ComputeBoundsExtent_60AEB.
; ==============================================================================================
Widget_ComputeAndStoreBounds_60883	proc far		; CODE XREF: UIWidget_ApplyStyleAndBounds_8D577+62P
					; DATA XREF: seg339:off_6DE16o	...

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

loc_60886:
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]

loc_6088D:
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_6], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_8], ax
		mov	ax, [bp+var_2]
		mov	[si+6],	ax
		mov	ax, [bp+var_4]
		mov	[si+8],	ax
		mov	ax, [bp+var_6]
		mov	[si+0Ah], ax
		mov	ax, [bp+var_8]
		mov	[si+0Ch], ax
		push	large 0
		push	si
		nop
		push	cs

loc_608C3:
		call	near ptr Widget_ComputeBoundsExtent_60AEB
		add	sp, 6
		pop	si
		leave
		retf
Widget_ComputeAndStoreBounds_60883	endp

; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg339 implicite) — libère un attribut de style deux
; fois (TextFormat_ReleaseAttribute_5E5AC, seg143) puis recalcule les bornes
; (Widget_ComputeBoundsExtent_60AEB).
; ==============================================================================================
Widget_Method_ReleaseAttrAndBounds_608CC:				; DATA XREF: seg339:0D72o seg339:0DD2o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]

loc_608D3:
		mov	dl, [bp+8]
		cmp	dl, 0FFh
		jnz	short loc_608DE
		mov	dl, [si+18h]

loc_608DE:				; CODE XREF: seg163:00F9j
		push	dx
		mov	ax, si
		add	ax, 2
		push	ax
		call	TextFormat_ReleaseAttribute_5E5AC
		add	sp, 4
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp

loc_608F1:
		mov	bp, sp
		push	si
		mov	dl, [bp+8]

loc_608F7:
		mov	si, [bp+6]
		cmp	word ptr [si+14h], 0
		jz	short loc_60905
		mov	ax, 1
		jmp	short loc_60907
; ���������������������������������������������������������������������������

loc_60905:				; CODE XREF: seg163:011Ej
		xor	ax, ax

loc_60907:				; CODE XREF: seg163:0123j
		or	al, al
		jz	short loc_6092E
		cmp	dl, 0FFh
		jnz	short loc_60913
		mov	dl, [si+18h]

loc_60913:				; CODE XREF: seg163:012Ej
		push	dx
		mov	ax, si
		add	ax, 2
		push	ax
		call	TextFormat_ReleaseAttribute_5E5AC
		add	sp, 4
		push	large 0
		push	si
		nop
		push	cs
		call	near ptr Widget_ComputeBoundsExtent_60AEB
		add	sp, 6

loc_6092E:				; CODE XREF: seg163:0129j
		pop	si
		pop	bp
		retf	4

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 99 lignes, NON DÉTAILLÉE — combine dispatch vtable multiple
; ([bx+4]/[bx+0x20]/[bx+0xC]/[bx+8]/[bx]) et UI_Helper_5E5F4 (seg143). Référencée par
; sub_5E5F4.
; ==============================================================================================
Widget_RenderWithAttributes_60933	proc far		; CODE XREF: seg163:0209p

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
		jz	short loc_60949
		mov	ax, 1
		jmp	short loc_6094B
; ���������������������������������������������������������������������������

loc_60949:				; CODE XREF: Widget_RenderWithAttributes_60933+Fj
		xor	ax, ax

loc_6094B:				; CODE XREF: Widget_RenderWithAttributes_60933+14j
		or	al, al
		jz	short loc_609B8
		cmp	[bp+arg_2], 0FFh
		jnz	short loc_6095B
		mov	al, [si+18h]
		mov	[bp+arg_2], al

loc_6095B:				; CODE XREF: Widget_RenderWithAttributes_60933+20j
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		pop	cx

loc_60962:
		mov	dx, [si+12h]
		sub	dx, ax

loc_60967:
		mov	di, dx

loc_60969:
		push	word ptr [si+14h]
		mov	bx, [si+14h]
		mov	bx, [bx]

loc_60971:
		call	dword ptr [bx+20h]
		pop	cx

loc_60975:
		mov	dx, di

loc_60977:
		add	dx, ax
		dec	dx
		mov	bx, [si+14h]
		add	dx, [bx+12h]
		mov	[bp+var_2], dx

loc_60983:
		push	si
		mov	bx, [si]
		call	dword ptr [bx+0Ch]
		pop	cx
		cmp	ax, di

loc_6098C:
		jl	short loc_609B8
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
		call	UI_Helper_5E5F4
		add	sp, 0Ch

loc_609B8:				; CODE XREF: Widget_RenderWithAttributes_60933+1Aj
					; Widget_RenderWithAttributes_60933:loc_6098Cj
		pop	di
		pop	si
		leave
		retf	4
Widget_RenderWithAttributes_60933	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		push	di

loc_609C3:
		mov	si, [bp+6]

loc_609C6:
		cmp	word ptr [si+14h], 0
		jz	short loc_609D1

loc_609CC:
		mov	ax, 1
		jmp	short loc_609D3
; ���������������������������������������������������������������������������

loc_609D1:				; CODE XREF: seg163:01EAj
		xor	ax, ax

loc_609D3:				; CODE XREF: seg163:01EFj
		or	al, al
		jz	short loc_60A3A
		cmp	byte ptr [bp+8], 0FFh
		jnz	short loc_609E3
		mov	al, [si+18h]
		mov	[bp+8],	al

loc_609E3:				; CODE XREF: seg163:01FBj
		mov	al, [bp+8]
		push	ax
		push	si
		push	cs
		call	near ptr Widget_RenderWithAttributes_60933
		push	si
		mov	bx, [si]

loc_609EF:
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

loc_60A31:
		push	ax

loc_60A32:
		call	UI_Helper_5E5F4

loc_60A37:
		add	sp, 0Ch

loc_60A3A:				; CODE XREF: seg163:01F5j
		pop	di
		pop	si
		pop	bp

locret_60A3D:
		retf	4
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg339) — écrit deux champs (+6/+0xA) puis recalcule
; les bornes (Widget_ComputeBoundsExtent_60AEB).
; ==============================================================================================
Widget_Method_SetBoundsA_60A40:				; DATA XREF: seg339:0D6Ao seg339:0DCAo
		push	bp
		mov	bp, sp
		push	si

loc_60A44:
		mov	si, [bp+6]
		mov	ax, [bp+8]
		mov	[si+6],	ax
		mov	ax, [bp+0Ah]
		mov	[si+0Ah], ax
		push	large 0
		push	si
		nop
		push	cs
		call	near ptr Widget_ComputeBoundsExtent_60AEB
		add	sp, 6
		pop	si
		pop	bp

locret_60A61:
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg339) — variante écrivant les champs +8/+0xC.
; ==============================================================================================
Widget_Method_SetBoundsB_60A62:				; DATA XREF: seg339:0D6Eo seg339:0DCEo
		push	bp
		mov	bp, sp
		push	si

loc_60A66:
		mov	si, [bp+6]
		mov	ax, [bp+8]
		mov	[si+8],	ax
		mov	ax, [bp+0Ah]
		mov	[si+0Ch], ax
		push	large 0
		push	si
		nop
		push	cs
		call	near ptr Widget_ComputeBoundsExtent_60AEB
		add	sp, 6
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, dispatch vtable en chaîne ([bx+4]/[bx]/[bx+0x18]/[bx]). Référencée par sub_60B1D.
; ==============================================================================================
Widget_Method_DispatchChain_60A84	proc far		; CODE XREF: Widget_UpdateLayoutAndBounds_60B1D:loc_60B90p

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2

loc_60A8A:
		push	si
		mov	si, [bp+arg_0]
		cmp	[bp+arg_2], 1Fh
		jle	short loc_60AE8
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

loc_60AE8:				; CODE XREF: Widget_Method_DispatchChain_60A84+Ej
		pop	si
		leave
		retf
Widget_Method_DispatchChain_60A84	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, calcule les bornes d'un widget (dispatch vtable [bx]/[bx+4] pour la position de base,
; additionne des décalages, stocke dans les champs +0x10/+0x12). Référencée massivement depuis
; seg016 et par de nombreuses fonctions de ce segment.
; ==============================================================================================
Widget_ComputeBoundsExtent_60AEB	proc far		; CODE XREF: seg016:05D8P seg016:0622P ...

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si

loc_60AF2:
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		add	ax, [bp+var_2]

loc_60B04:
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
Widget_ComputeBoundsExtent_60AEB	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 103 lignes, NON DÉTAILLÉE — combine dispatch vtable, GlyphObject-related sub_60E60
; et Widget_Method_DispatchChain_60A84. Référencée par sub_60BA6 (×2).
; ==============================================================================================
Widget_UpdateLayoutAndBounds_60B1D	proc far		; CODE XREF: Widget_RenderComplexLayout_60BA6:loc_60D3Cp
					; Widget_RenderComplexLayout_60BA6+1E9p

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

loc_60B31:
		mov	bx, [bx]
		call	dword ptr [bx+20h]
		pop	cx
		dec	ax
		mov	bx, [si+14h]
		add	ax, [bx+12h]
		add	ax, [bx+10h]
		mov	[bp+var_2], ax

loc_60B44:				; CODE XREF: Widget_UpdateLayoutAndBounds_60B1D+6Ej
		push	di
		push	si
		nop
		push	cs
		call	near ptr GlyphObject_LayoutAndRenderAll_60E60
		jmp	short loc_60B93
; ���������������������������������������������������������������������������

loc_60B4D:				; CODE XREF: Widget_UpdateLayoutAndBounds_60B1D+83j
		cmp	dx, 0Dh
		jz	short loc_60B57
		cmp	dx, 0Ah
		jnz	short loc_60B8D

loc_60B57:				; CODE XREF: Widget_UpdateLayoutAndBounds_60B1D+33j
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		pop	cx
		mov	dx, [si+12h]

loc_60B61:
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

loc_60B84:
		pop	cx
		add	ax, [bp+var_6]

loc_60B88:
		mov	[si+10h], ax
		jmp	short loc_60B44
; ���������������������������������������������������������������������������

loc_60B8D:				; CODE XREF: Widget_UpdateLayoutAndBounds_60B1D+38j
		push	dx
		push	si
		push	cs

loc_60B90:
		call	near ptr Widget_Method_DispatchChain_60A84

loc_60B93:				; CODE XREF: Widget_UpdateLayoutAndBounds_60B1D+2Ej
		add	sp, 4

loc_60B96:
		mov	bx, di
		inc	di
		mov	al, [bx]
		cbw
		mov	dx, ax
		or	ax, ax
		jnz	short loc_60B4D
		pop	di
		pop	si
		leave
		retf
Widget_UpdateLayoutAndBounds_60B1D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 331 lignes, NON DÉTAILLÉE — la plus grosse fonction du segment, combine de nombreux
; utilitaires bas niveau (sub_22E1/2235/225D/2277/2B99/29E4) avec
; Widget_UpdateLayoutAndBounds_60B1D (×2) et dispatch vtable. Candidat pour session dédiée.
; ==============================================================================================
Widget_RenderComplexLayout_60BA6	proc far		; CODE XREF: Widget_RenderComplexLayoutWrapper_60DD1+1Cp

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

loc_60BB5:				; CODE XREF: Widget_RenderComplexLayout_60BA6+1B5j
		push	large 0C80000h
		lea	ax, [bp+var_D0]
		push	ax
		call	CRT_Memset_Public
		add	sp, 6
		push	large 0C80000h
		lea	ax, [bp+var_198]
		push	ax

loc_60BD3:
		call	CRT_Memset_Public
		add	sp, 6

loc_60BDB:
		jmp	loc_60D79
; ���������������������������������������������������������������������������

loc_60BDE:				; CODE XREF: Widget_RenderComplexLayout_60BA6+1DFj
		mov	ax, dx

loc_60BE0:
		cmp	ax, 25h	; '%'

loc_60BE3:
		jz	short loc_60BE8

loc_60BE5:				; default
		jmp	loc_60D5E
; ���������������������������������������������������������������������������

loc_60BE8:				; CODE XREF: Widget_RenderComplexLayout_60BA6:loc_60BE3j
		mov	al, [di]
		cbw
		mov	[bp+var_2], ax
		inc	di
		mov	[bp+var_8], ax

loc_60BF2:				; switch 14 cases
		mov	cx, 0Eh
		mov	bx, offset word_60D99

loc_60BF8:				; CODE XREF: Widget_RenderComplexLayout_60BA6+5Dj
		mov	ax, cs:[bx]

loc_60BFB:
		cmp	ax, [bp+var_8]
		jz	short loc_60C08
		add	bx, 2
		loop	loc_60BF8
		jmp	loc_60D5E	; default
; ���������������������������������������������������������������������������

loc_60C08:				; CODE XREF: Widget_RenderComplexLayout_60BA6+58j
		jmp	word ptr cs:[bx+1Ch] ; switch jump

loc_60C0C:				; DATA XREF: seg163:off_60DB5o
		push	0Ah		; case 0x64
		lea	ax, [bp+var_198]
		push	ax
		add	[bp+arg_4], 2
		mov	bx, [bp+arg_4]
		push	word ptr [bx-2]
		call	CRT_Itoa_Signed10
		add	sp, 6
		jmp	loc_60D6B
; ���������������������������������������������������������������������������

loc_60C28:				; CODE XREF: Widget_RenderComplexLayout_60BA6:loc_60C08j
					; DATA XREF: seg163:off_60DB5o
		push	0Ah		; case 0x75
		lea	ax, [bp+var_198]
		push	ax

loc_60C2F:
		add	[bp+arg_4], 2
		mov	bx, [bp+arg_4]
		movzx	eax, word ptr [bx-2]
		push	eax
		call	CRT_Itoa_Unsigned

loc_60C42:
		add	sp, 8
		jmp	loc_60D6B
; ���������������������������������������������������������������������������

loc_60C48:				; CODE XREF: Widget_RenderComplexLayout_60BA6:loc_60C08j
					; DATA XREF: seg163:off_60DB5o
		push	0Ah		; case 0x44
		lea	ax, [bp+var_198]
		push	ax
		add	[bp+arg_4], 4
		mov	bx, [bp+arg_4]
		push	large dword ptr	[bx-4]
		call	CRT_Itoa_BaseVariant
		add	sp, 8

loc_60C62:
		jmp	loc_60D6B
; ���������������������������������������������������������������������������

loc_60C65:				; CODE XREF: Widget_RenderComplexLayout_60BA6:loc_60C08j
					; DATA XREF: seg163:off_60DB5o
		push	0Ah		; case 0x55
		lea	ax, [bp+var_198]
		push	ax
		add	[bp+arg_4], 4
		mov	bx, [bp+arg_4]

loc_60C73:
		push	large dword ptr	[bx-4]
		call	CRT_Itoa_Unsigned
		add	sp, 8

loc_60C7F:
		jmp	loc_60D6B
; ���������������������������������������������������������������������������

loc_60C82:				; CODE XREF: Widget_RenderComplexLayout_60BA6:loc_60C08j
					; DATA XREF: seg163:off_60DB5o
		push	10h		; case 0x78

loc_60C84:
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
		jmp	loc_60D6B
; ���������������������������������������������������������������������������

loc_60CA9:				; CODE XREF: Widget_RenderComplexLayout_60BA6:loc_60C08j
					; DATA XREF: seg163:off_60DB5o
		add	[bp+arg_4], 2	; case 0x63
		mov	bx, [bp+arg_4]
		mov	al, [bx-2]
		mov	byte ptr [bp+var_198], al
		jmp	loc_60D62
; ���������������������������������������������������������������������������

loc_60CBA:				; CODE XREF: Widget_RenderComplexLayout_60BA6:loc_60C08j
					; DATA XREF: seg163:off_60DB5o
		add	[bp+arg_4], 2	; case 0x53
		mov	bx, [bp+arg_4]

loc_60CC1:
		push	word ptr [bx-2]

loc_60CC4:
		jmp	loc_60D6C
; ���������������������������������������������������������������������������

loc_60CC7:				; CODE XREF: Widget_RenderComplexLayout_60BA6:loc_60C08j
					; DATA XREF: seg163:off_60DB5o
		add	[bp+arg_4], 2	; case 0x58
		mov	bx, [bp+arg_4]
		mov	ax, [bx-2]

loc_60CD1:
		mov	[bp+var_4], ax
		push	si

loc_60CD5:
		mov	bx, [si]

loc_60CD7:
		call	dword ptr [bx]
		pop	cx

loc_60CDA:
		add	ax, [bp+var_4]

loc_60CDD:
		mov	[si+10h], ax

loc_60CE0:
		jmp	loc_60D79
; ���������������������������������������������������������������������������

loc_60CE3:				; CODE XREF: Widget_RenderComplexLayout_60BA6:loc_60C08j
					; DATA XREF: seg163:off_60DB5o
		add	[bp+arg_4], 2	; case 0x59

loc_60CE7:
		mov	bx, [bp+arg_4]
		mov	ax, [bx-2]
		mov	[bp+var_6], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		pop	cx
		add	ax, [bp+var_6]
		mov	[si+12h], ax
		jmp	short loc_60D79
; ���������������������������������������������������������������������������

loc_60CFF:				; CODE XREF: Widget_RenderComplexLayout_60BA6:loc_60C08j
					; DATA XREF: seg163:off_60DB5o
		add	[bp+arg_4], 2	; case 0x42
		mov	bx, [bp+arg_4]
		mov	al, [bx-2]
		mov	[si+18h], al
		jmp	short loc_60D79
; ���������������������������������������������������������������������������

loc_60D0E:				; CODE XREF: Widget_RenderComplexLayout_60BA6:loc_60C08j
					; DATA XREF: seg163:off_60DB5o
		add	[bp+arg_4], 2	; case 0x46
		mov	bx, [bp+arg_4]
		mov	al, [bx-2]
		mov	[si+17h], al
		jmp	short loc_60D79
; ���������������������������������������������������������������������������

loc_60D1D:				; CODE XREF: Widget_RenderComplexLayout_60BA6:loc_60C08j
					; DATA XREF: seg163:off_60DB5o
		push	si		; case 0x50
		nop
		push	cs
		call	near ptr Widget_Method_Dispatch18_60DF6
		pop	cx
		jmp	short loc_60D79
; ���������������������������������������������������������������������������

loc_60D26:				; CODE XREF: Widget_RenderComplexLayout_60BA6:loc_60C08j
					; DATA XREF: seg163:off_60DB5o
		add	[bp+arg_4], 2	; case 0x4A
		mov	bx, [bp+arg_4]
		mov	al, [bx-2]
		mov	[si+16h], al

loc_60D33:
		jmp	short loc_60D79
; ���������������������������������������������������������������������������

loc_60D35:				; CODE XREF: Widget_RenderComplexLayout_60BA6:loc_60C08j
					; DATA XREF: seg163:off_60DB5o
		lea	ax, [bp+var_D0]	; case 0x5A
		push	ax
		push	si
		push	cs

loc_60D3C:
		call	near ptr Widget_UpdateLayoutAndBounds_60B1D
		add	sp, 4

loc_60D42:
		add	[bp+arg_4], 2
		mov	bx, [bp+arg_4]
		mov	al, [bx-2]
		push	ax
		push	word ptr [si+14h]
		mov	bx, [si+14h]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		jmp	loc_60BB5
; ���������������������������������������������������������������������������

loc_60D5E:				; CODE XREF: Widget_RenderComplexLayout_60BA6:loc_60BE5j
					; Widget_RenderComplexLayout_60BA6+5Fj
		mov	byte ptr [bp+var_198], dl ; default

loc_60D62:				; CODE XREF: Widget_RenderComplexLayout_60BA6+111j
		mov	byte ptr [bp+var_198+1], 0

loc_60D67:
		lea	ax, [bp+var_198]

loc_60D6B:				; CODE XREF: Widget_RenderComplexLayout_60BA6+7Fj
					; Widget_RenderComplexLayout_60BA6+9Fj ...
		push	ax

loc_60D6C:				; CODE XREF: Widget_RenderComplexLayout_60BA6:loc_60CC4j
		lea	ax, [bp+var_D0]
		push	ax
		call	CRT_Strcat
		add	sp, 4

loc_60D79:				; CODE XREF: Widget_RenderComplexLayout_60BA6:loc_60BDBj
					; Widget_RenderComplexLayout_60BA6:loc_60CE0j	...
		mov	bx, di
		inc	di
		mov	al, [bx]
		cbw
		mov	dx, ax

loc_60D81:
		or	ax, ax
		jz	short loc_60D88
		jmp	loc_60BDE
; ���������������������������������������������������������������������������

loc_60D88:				; CODE XREF: Widget_RenderComplexLayout_60BA6+1DDj
		lea	ax, [bp+var_D0]
		push	ax
		push	si
		push	cs
		call	near ptr Widget_UpdateLayoutAndBounds_60B1D
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
Widget_RenderComplexLayout_60BA6	endp

; ���������������������������������������������������������������������������
word_60D99	dw    42h,   44h,   46h,   4Ah ; DATA XREF: Widget_RenderComplexLayout_60BA6+4Fo
		dw    50h,   53h,   55h,   58h ; value table for switch	statement
		dw    59h,   5Ah,   63h,   64h
		dw    75h,   78h
off_60DB5	dw offset loc_60CFF	; jump table for switch	statement
		dw offset loc_60C48
		dw offset loc_60D0E
		dw offset loc_60D26
		dw offset loc_60D1D
		dw offset loc_60CBA
		dw offset loc_60C65
		dw offset loc_60CC7
		dw offset loc_60CE3
		dw offset loc_60D35
		dw offset loc_60CA9
		dw offset loc_60C0C
		dw offset loc_60C28
		dw offset loc_60C82

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, enveloppe appelant Widget_RenderComplexLayout_60BA6.
; ==============================================================================================
Widget_RenderComplexLayoutWrapper_60DD1	proc far		; CODE XREF: seg026:01F5P seg026:02A8P ...

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp

loc_60DD2:
		mov	bp, sp
		sub	sp, 2

loc_60DD7:
		push	si

loc_60DD8:
		mov	si, [bp+arg_0]

loc_60DDB:
		cmp	word ptr [si+14h], 0

loc_60DDF:
		jz	short loc_60DF3
		lea	ax, [bp+arg_4]
		mov	[bp+var_2], ax
		push	ax
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr Widget_RenderComplexLayout_60BA6
		add	sp, 6

loc_60DF3:				; CODE XREF: Widget_RenderComplexLayoutWrapper_60DD1:loc_60DDFj
		pop	si
		leave
		retf
Widget_RenderComplexLayoutWrapper_60DD1	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, dispatch vtable [bx+0x18]. Appelée par Widget_RenderComplexLayout_60BA6.
; ==============================================================================================
Widget_Method_Dispatch18_60DF6	proc far		; CODE XREF: Widget_RenderComplexLayout_60BA6+17Ap

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]

loc_60DFC:
		pop	bp

locret_60DFD:
		retf
Widget_Method_Dispatch18_60DF6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 67 lignes, NON DÉTAILLÉE — dispatch vtable, référencée deux fois par sub_60E60.
; ==============================================================================================
GlyphObject_RenderToWidget_60DFE	proc far		; CODE XREF: seg026:0276P
					; seg026:loc_1B7DDP ...

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp

loc_60DFF:
		mov	bp, sp

loc_60E01:
		sub	sp, 4

loc_60E04:
		push	si
		push	di

loc_60E06:
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_2], 0
		mov	[bp+var_4], 0
		jmp	short loc_60E35
; ���������������������������������������������������������������������������

loc_60E18:				; CODE XREF: GlyphObject_RenderToWidget_60DFE+3Fj
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

loc_60E35:				; CODE XREF: GlyphObject_RenderToWidget_60DFE+18j
		cmp	byte ptr [di], 0Ah
		jz	short loc_60E3F
		cmp	byte ptr [di], 0
		jnz	short loc_60E18

loc_60E3F:				; CODE XREF: GlyphObject_RenderToWidget_60DFE+3Aj
		cmp	[bp+var_4], 0
		jz	short loc_60E59
		mov	dx, [bp+var_4]
		dec	dx
		mov	bx, [si+14h]
		mov	ax, [bx+10h]
		imul	dx
		mov	dx, [bp+var_2]
		add	dx, ax
		mov	[bp+var_2], dx

loc_60E59:				; CODE XREF: GlyphObject_RenderToWidget_60DFE+45j
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
GlyphObject_RenderToWidget_60DFE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 131 lignes, NON DÉTAILLÉE — orchestre GlyphObject_RenderToWidget_60DFE (×2) et
; dispatch vtable multiple. Référencée par Widget_UpdateLayoutAndBounds_60B1D.
; ==============================================================================================
GlyphObject_LayoutAndRenderAll_60E60	proc far		; CODE XREF: Widget_UpdateLayoutAndBounds_60B1D+2Bp

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
		ja	short loc_60EF5	; default
		shl	bx, 1
		jmp	cs:off_60EF9[bx] ; switch jump

loc_60E81:				; DATA XREF: seg163:off_60EF9o
		push	si		; case 0x0

loc_60E82:
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		mov	[bp+var_2], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		add	ax, [bp+var_2]

loc_60E93:
		jmp	short loc_60EF2
; ���������������������������������������������������������������������������

loc_60E95:				; CODE XREF: GlyphObject_LayoutAndRenderAll_60E60+1Cj
					; DATA XREF: seg163:off_60EF9o
		push	si		; case 0x1
		mov	bx, [si]
		call	dword ptr [bx+8]
		pop	cx
		push	ax
		push	di
		push	si
		push	cs
		call	near ptr GlyphObject_RenderToWidget_60DFE
		add	sp, 4
		pop	dx
		sub	dx, ax
		mov	[bp+var_4], dx
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		add	ax, [bp+var_4]
		jmp	short loc_60EF2
; ���������������������������������������������������������������������������

loc_60EB7:				; CODE XREF: GlyphObject_LayoutAndRenderAll_60E60+1Cj
					; DATA XREF: seg163:off_60EF9o
		push	si		; case 0x2
		mov	bx, [si]
		call	dword ptr [bx+8]
		pop	cx
		push	ax
		push	di
		push	si
		push	cs
		call	near ptr GlyphObject_RenderToWidget_60DFE
		add	sp, 4
		pop	dx

loc_60EC9:
		sub	dx, ax

loc_60ECB:
		mov	ax, dx
		cwd
		sub	ax, dx
		sar	ax, 1

loc_60ED2:
		mov	[bp+var_6], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx]

loc_60EDA:
		pop	cx

loc_60EDB:
		add	ax, [bp+var_6]
		jmp	short loc_60EF2
; ���������������������������������������������������������������������������

loc_60EE0:				; CODE XREF: GlyphObject_LayoutAndRenderAll_60E60+1Cj
					; DATA XREF: seg163:off_60EF9o
		push	si		; case 0x3
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		mov	[bp+var_8], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx

loc_60EEF:
		add	ax, [bp+var_8]

loc_60EF2:				; CODE XREF: GlyphObject_LayoutAndRenderAll_60E60:loc_60E93j
					; GlyphObject_LayoutAndRenderAll_60E60+55j ...
		mov	[si+10h], ax

loc_60EF5:				; CODE XREF: GlyphObject_LayoutAndRenderAll_60E60+18j
		pop	di		; default

loc_60EF6:
		pop	si

locret_60EF7:
		leave
		retf
GlyphObject_LayoutAndRenderAll_60E60	endp

; ���������������������������������������������������������������������������
off_60EF9	dw offset loc_60E81	; DATA XREF: GlyphObject_LayoutAndRenderAll_60E60+1Cr
		dw offset loc_60E95	; jump table for switch	statement
		dw offset loc_60EB7
		dw offset loc_60EE0
seg163		ends

seg059		segment	byte public 'CODE' use16
		assume cs:seg059
		;org 9
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,21L — stocke un pointeur sommet (+1) et copie un champ (+2→+5) depuis un second sommet :
; setup d'une arête/segment (2 sommets), analogue linéaire de sub_294C0 (triangles, seg055).
; ==============================================================================================
Render_EdgeSetup	proc far		; CODE XREF: Render_EdgeSetupSolidColor+10p
					; Render_EdgeSetupTexturedColor+11p

arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh

		push	bp

loc_2B5FA:				; DATA XREF: seg216:029Eo
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	eax, [bp+arg_4]
		mov	es:[bx+1], eax
		les	bx, [bp+arg_8]
		mov	eax, es:[bx+2]
		les	bx, [bp+arg_0]
		mov	es:[bx+5], eax
		pop	bp
		retf
Render_EdgeSetup	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,21L — stocke deux pointeurs de sommets (+6/+0xA) : setup d'arête, variante stockant les
; références brutes.
; ==============================================================================================
Render_EdgeSetupRaw	proc far		; CODE XREF: Render_EdgeSetupWithParam+13p
					; AircraftComponent_LoadWithDwordFieldsC_95590+1B0P

arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]

loc_2B620:
		mov	eax, [bp+arg_8]
		mov	es:[bx+0Ah], eax

loc_2B629:
		mov	eax, [bp+arg_4]
		mov	es:[bx+6], eax
		pop	bp
		retf
Render_EdgeSetupRaw	endp

; ���������������������������������������������������������������������������

loc_2B634:				; DATA XREF: seg339:1796o seg339:17BAo ...
		push	bp

loc_2B635:
		mov	bp, sp
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	al, es:[bx+11h]
		shr	ax, 3
		and	ax, 1
		or	al, al
		jz	short loc_2B650
		mov	al, 1
		jmp	short loc_2B652
; ���������������������������������������������������������������������������

loc_2B650:				; CODE XREF: seg059:005Aj
		mov	al, 0

loc_2B652:				; CODE XREF: seg059:005Ej
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2B654:				; DATA XREF: seg339:179Ao seg339:17BEo ...
		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		les	bx, [bp+6]

loc_2B65E:
		mov	ax, es:[bx+0Ch]
		mov	dx, es:[bx+0Ah]
		add	dx, 5
		mov	[bp-2],	ax
		mov	[bp-4],	dx
		les	si, [bp-4]
		mov	eax, es:[si]
		mov	[bp-14h], eax
		mov	eax, es:[si+4]
		mov	[bp-10h], eax
		mov	eax, es:[si+8]
		mov	[bp-0Ch], eax
		lea	si, [bp-14h]
		add	si, 4
		mov	eax, [si]
		mov	[bp-8],	eax
		mov	eax, [bp-8]
		mov	es, word ptr [bp+8]
		mov	es:[bx+2], eax
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_2B6A8:				; DATA XREF: seg339:179Eo seg339:17C2o ...
		push	bp
		mov	bp, sp
		mov	al, 2
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2B6AF:				; DATA XREF: seg339:17F6o seg339:181Ao
		push	bp
		mov	bp, sp
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2B6B4:				; DATA XREF: seg339:17AAo seg339:17CEo ...
		push	bp
		mov	bp, sp
		push	si
		les	bx, [bp+6]
		mov	ax, es:[bx+0Ah]
		xor	dx, dx
		sub	ax, [bp+0Ah]
		sbb	dx, 0
		push	dx
		push	ax
		pop	eax
		mov	ebx, 12h
		cdq
		idiv	ebx
		imul	ax, 12h
		mov	dx, [bp+10h]
		mov	bx, [bp+0Eh]
		add	bx, ax
		mov	si, [bp+6]
		mov	es:[si+0Ch], dx
		mov	es:[si+0Ah], bx
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2B6EF:				; DATA XREF: seg339:17A6o seg339:17CAo ...
		push	bp
		mov	bp, sp
		sub	sp, 9Eh
		push	si
		les	bx, [bp+6]
		mov	eax, es:[bx+6]
		mov	[bp-4],	eax
		mov	ax, [bp+0Ah]
		mov	[bp-6],	ax
		les	bx, [bp-4]
		mov	eax, es:[bx+1]
		mov	[bp-0Ah], eax
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	al, es:[bx+11h]
		shr	ax, 1
		and	ax, 1
		mov	ah, 0
		or	ax, ax

loc_2B729:
		jz	short loc_2B72E
		jmp	loc_2B8A9
; ���������������������������������������������������������������������������

loc_2B72E:				; CODE XREF: seg059:loc_2B729j
		les	si, [bp-0Ah]

loc_2B731:
		mov	eax, es:[si]
		mov	[bp-7Ah], eax
		mov	eax, es:[si+4]
		mov	[bp-76h], eax
		mov	eax, es:[si+8]
		mov	[bp-72h], eax
		push	word ptr [bp-6]
		lea	ax, [bp-7Ah]
		push	ax
		call	Math_Helper_583A3
		add	sp, 4
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]

loc_2B761:
		mov	eax, [bp-7Ah]
		mov	es:[bx+5], eax
		mov	eax, [bp-76h]
		mov	es:[bx+9], eax

loc_2B773:
		mov	eax, [bp-72h]
		mov	es:[bx+0Dh], eax
		or	byte ptr es:[bx+11h], 2
		mov	al, es:[bx+11h]
		shr	ax, 2
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jz	short loc_2B794
		jmp	loc_2B8A9
; ���������������������������������������������������������������������������

loc_2B794:				; CODE XREF: seg059:019Fj
		cmp	byte_6E680, 0
		jz	short loc_2B80C
		push	large dword ptr	[bp-76h]
		push	large [dword_72202]
		push	large dword ptr	[bp-7Ah]
		call	Math_FixedMulDiv_5804C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-0Eh], eax
		mov	[bp-12h], eax
		mov	ax, word_721FE
		add	ax, [bp-11h]
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	es:[bx+1], ax
		push	large dword ptr	[bp-76h]
		push	large [dword_72206]
		push	large dword ptr	[bp-72h]
		call	Math_FixedMulDiv_5804C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-16h], eax
		mov	[bp-1Ah], eax
		mov	ax, word_72200
		sub	ax, [bp-19h]

loc_2B7F4:				; CODE XREF: seg059:02A8j
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	es:[bx+3], ax
		or	byte ptr es:[bx+11h], 4
		and	byte ptr es:[bx+11h], 0F7h
		jmp	loc_2B8A9
; ���������������������������������������������������������������������������

loc_2B80C:				; CODE XREF: seg059:01A9j
		mov	eax, [bp-76h]
		cmp	eax, dword_6E9A6
		jl	short loc_2B81C
		mov	ax, 1
		jmp	short loc_2B81E
; ���������������������������������������������������������������������������

loc_2B81C:				; CODE XREF: seg059:0225j
		xor	ax, ax

loc_2B81E:				; CODE XREF: seg059:022Aj
		or	al, al
		jz	short loc_2B89B

loc_2B822:
		mov	eax, dword_72540

loc_2B826:
		mov	[bp-1Eh], eax

loc_2B82A:
		shl	eax, 8
		cmp	eax, [bp-76h]

loc_2B832:
		jl	short loc_2B839

loc_2B834:
		mov	ax, 1

loc_2B837:
		jmp	short loc_2B83B
; ���������������������������������������������������������������������������

loc_2B839:				; CODE XREF: seg059:loc_2B832j
		xor	ax, ax

loc_2B83B:				; CODE XREF: seg059:loc_2B837j
		or	al, al
		jz	short loc_2B89B
		push	large dword ptr	[bp-76h]
		push	large [dword_72202]
		push	large dword ptr	[bp-7Ah]
		call	Math_FixedMulDiv_5804C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-22h], eax
		mov	[bp-26h], eax
		mov	ax, word_721FE

loc_2B863:
		add	ax, [bp-25h]

loc_2B866:
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]

loc_2B86D:
		mov	es:[bx+1], ax
		push	large dword ptr	[bp-76h]
		push	large [dword_72206]
		push	large dword ptr	[bp-72h]
		call	Math_FixedMulDiv_5804C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-2Ah], eax
		mov	[bp-2Eh], eax
		mov	ax, word_72200
		sub	ax, [bp-2Dh]
		jmp	loc_2B7F4
; ���������������������������������������������������������������������������

loc_2B89B:				; CODE XREF: seg059:0230j seg059:024Dj
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		or	byte ptr es:[bx+11h], 8
		jmp	short $+2

loc_2B8A9:				; CODE XREF: seg059:013Bj seg059:01A1j ...
		les	bx, [bp+6]
		mov	ax, es:[bx+0Ch]
		mov	dx, es:[bx+0Ah]
		add	dx, 5
		mov	[bp-34h], ax
		mov	[bp-36h], dx
		les	si, [bp-36h]
		mov	eax, es:[si]
		mov	[bp-86h], eax
		mov	eax, es:[si+4]
		mov	[bp-82h], eax
		mov	eax, es:[si+8]
		mov	[bp-7Eh], eax
		lea	si, [bp-86h]
		add	si, 4
		mov	eax, [si]
		mov	[bp-32h], eax
		mov	ax, [bp-2]
		mov	dx, [bp-4]
		add	dx, 5
		mov	[bp-3Ch], ax
		mov	[bp-3Eh], dx
		les	bx, [bp-3Eh]
		mov	eax, es:[bx]
		mov	[bp-3Ah], eax
		cmp	dword ptr [bp-32h], 0
		jz	short loc_2B910
		mov	ax, 1
		jmp	short loc_2B912
; ���������������������������������������������������������������������������

loc_2B910:				; CODE XREF: seg059:0319j
		xor	ax, ax

loc_2B912:				; CODE XREF: seg059:031Ej
		or	al, al
		jz	short loc_2B959
		mov	eax, dword_72202
		mov	edx, [bp-3Ah]
		imul	edx

loc_2B921:
		shrd	eax, edx, 8

loc_2B926:
		mov	[bp-42h], eax
		mov	eax, [bp-42h]
		mov	[bp-46h], eax
		mov	eax, [bp-46h]
		mov	edx, eax
		mov	ecx, [bp-32h]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp-4Ah], eax
		mov	eax, [bp-4Ah]
		mov	[bp-4Eh], eax
		mov	ax, [bp-4Dh]
		jmp	short loc_2B99B
; ���������������������������������������������������������������������������

loc_2B959:				; CODE XREF: seg059:0324j
		mov	eax, dword_72202
		mov	edx, [bp-3Ah]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-52h], eax
		mov	eax, [bp-52h]
		mov	[bp-56h], eax
		mov	eax, [bp-56h]
		mov	edx, eax
		mov	ecx, dword_6E9A6
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp-5Ah], eax
		mov	eax, [bp-5Ah]
		mov	[bp-5Eh], eax
		mov	ax, [bp-5Dh]

loc_2B99B:				; CODE XREF: seg059:0367j
		les	bx, [bp+6]
		mov	es:[bx+0Eh], ax
		cmp	byte_6E680, 0
		jz	short loc_2B9F1
		les	bx, [bp+6]
		mov	ax, es:[bx+0Ch]
		mov	dx, es:[bx+0Ah]
		add	dx, 5
		mov	[bp-60h], ax
		mov	[bp-62h], dx
		les	si, [bp-62h]
		mov	eax, es:[si]
		mov	[bp-92h], eax
		mov	eax, es:[si+4]
		mov	[bp-8Eh], eax
		mov	eax, es:[si+8]
		mov	[bp-8Ah], eax
		lea	si, [bp-92h]
		add	si, 4
		mov	eax, [si]
		mov	[bp-66h], eax
		mov	eax, [bp-66h]
		jmp	short loc_2BA5A
; ���������������������������������������������������������������������������

loc_2B9F1:				; CODE XREF: seg059:03B7j
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	al, es:[bx+11h]
		shr	ax, 3
		and	ax, 1
		or	al, al
		jz	short loc_2BA0A
		mov	al, 1
		jmp	short loc_2BA0C
; ���������������������������������������������������������������������������

loc_2BA0A:				; CODE XREF: seg059:0414j
		mov	al, 0

loc_2BA0C:				; CODE XREF: seg059:0418j
		or	al, al
		jz	short loc_2BA14
		mov	al, 0
		jmp	short loc_2BA64
; ���������������������������������������������������������������������������

loc_2BA14:				; CODE XREF: seg059:041Ej
		les	bx, [bp+6]
		mov	ax, es:[bx+0Ch]
		mov	dx, es:[bx+0Ah]

loc_2BA1F:
		add	dx, 5
		mov	[bp-68h], ax
		mov	[bp-6Ah], dx
		les	si, [bp-6Ah]
		mov	eax, es:[si]
		mov	[bp-9Eh], eax
		mov	eax, es:[si+4]
		mov	[bp-9Ah], eax
		mov	eax, es:[si+8]
		mov	[bp-96h], eax
		lea	si, [bp-9Eh]
		add	si, 4
		mov	eax, [si]
		mov	[bp-6Eh], eax
		mov	eax, [bp-6Eh]

loc_2BA5A:				; CODE XREF: seg059:03FFj
		les	bx, [bp+6]
		mov	es:[bx+2], eax
		mov	al, 1

loc_2BA64:				; CODE XREF: seg059:0422j
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,22L — appelle sub_2B5F9 puis copie un flag couleur (+6→+9) : setup d'arête avec couleur
; unie.
; ==============================================================================================
Render_EdgeSetupSolidColor	proc far		; CODE XREF: AircraftComponent_LoadWithDwordFieldsC_95590+187P
					; AircraftComponent_LoadWithDwordFieldsC_95590+1D1P

arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh

		push	bp
		mov	bp, sp
		push	large [bp+arg_8]
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr Render_EdgeSetup
		add	sp, 0Ch
		les	bx, [bp+arg_8]
		mov	al, es:[bx+6]
		les	bx, [bp+arg_0]
		mov	es:[bx+9], al
		pop	bp
		retf
Render_EdgeSetupSolidColor	endp

; ���������������������������������������������������������������������������

loc_2BA8D:				; DATA XREF: seg339:17AEo seg339:17D2o
		push	bp
		mov	bp, sp
		sub	sp, 4
		les	bx, [bp+6]
		mov	eax, es:[bx+6]
		mov	[bp-4],	eax
		les	bx, [bp-4]
		mov	al, es:[bx+9]
		push	ax
		push	large dword ptr	[bp+6]
		call	Keyframe_ResolveEasingValue
		add	sp, 6
		les	bx, [bp+6]
		mov	es:[bx+10h], al
		leave
		retf
; ���������������������������������������������������������������������������

loc_2BABC:				; DATA XREF: seg339:17B2o
		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		les	bx, [bp+6]
		mov	al, es:[bx+10h]
		push	ax
		mov	ax, es:[bx+0Eh]
		mov	[bp-2],	ax
		movsx	eax, word ptr [bp-2]
		mov	edx, dword_6E9AA
		imul	edx, eax
		mov	[bp-6],	edx
		mov	eax, [bp-6]
		mov	[bp-0Ah], eax
		push	word ptr [bp-9]
		push	word ptr es:[bx+0Eh]
		les	bx, es:[bx+0Ah]
		push	word ptr es:[bx+3]
		push	word ptr es:[bx+1]
		push	word_70E60
		call	Render_DrawEllipseOutline_61612
		add	sp, 0Ch
		leave
		retf
; ���������������������������������������������������������������������������

loc_2BB0C:				; DATA XREF: seg339:17C6o
		push	bp
		mov	bp, sp
		mov	al, 0
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2BB13:				; DATA XREF: seg339:178Eo
		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		les	bx, [bp+6]
		mov	al, es:[bx+10h]
		push	ax

loc_2BB21:
		mov	ax, es:[bx+0Eh]
		mov	[bp-2],	ax
		movsx	eax, word ptr [bp-2]
		mov	edx, dword_6E9AA

loc_2BB32:
		imul	edx, eax
		mov	[bp-6],	edx
		mov	eax, [bp-6]
		mov	[bp-0Ah], eax
		push	word ptr [bp-9]
		push	word ptr es:[bx+0Eh]
		les	bx, es:[bx+0Ah]
		push	word ptr es:[bx+3]
		push	word ptr es:[bx+1]
		push	word_70E60
		call	Render_DrawFilledEllipse_6106E
		add	sp, 0Ch

locret_2BB61:
		leave
		retf
; ���������������������������������������������������������������������������

loc_2BB63:				; DATA XREF: seg339:17A2o
		push	bp
		mov	bp, sp

loc_2BB66:
		mov	al, 1
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,46L — appelle sub_2B5F9 puis résout une couleur via texte/texture si index négatif (même
; table 0x72528 que sub_298F5, seg055) : setup d'arête avec résolution de texture/couleur
; spéciale.
; ==============================================================================================
Render_EdgeSetupTexturedColor	proc far		; CODE XREF: AircraftComponent_LoadWithDwordFieldsC_95590+1EEP

arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		push	large [bp+arg_8]
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr Render_EdgeSetup
		add	sp, 0Ch
		les	bx, [bp+arg_8]
		mov	al, es:[bx+6]
		cbw
		mov	si, ax
		or	si, si
		jge	short loc_2BB95
		xor	dx, dx
		xor	ax, ax
		jmp	short loc_2BBB2
; ���������������������������������������������������������������������������

loc_2BB95:				; CODE XREF: Render_EdgeSetupTexturedColor+23j
		push	0
		mov	al, byte_7252C
		push	ax
		push	large [dword_72528]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	bx, si
		shl	bx, 8
		add	ax, bx

loc_2BBB2:				; CODE XREF: Render_EdgeSetupTexturedColor+29j
		les	bx, [bp+arg_0]
		mov	es:[bx+0Bh], dx
		mov	es:[bx+9], ax
		pop	si
		pop	bp
		retf
Render_EdgeSetupTexturedColor	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,25L — appelle sub_2B61A puis copie un champ (+9→+0x10) : setup d'arête, copie de
; paramètre additionnel.
; ==============================================================================================
Render_EdgeSetupWithParam	proc far		; CODE XREF: AircraftComponent_LoadWithDwordFieldsC_95590+217P

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	large [bp+arg_8]
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr Render_EdgeSetupRaw
		add	sp, 0Ch
		mov	eax, [bp+arg_4]
		mov	[bp+var_4], eax
		les	bx, [bp+var_4]
		mov	eax, es:[bx+9]
		les	bx, [bp+arg_0]
		mov	es:[bx+10h], eax
		leave
		retf
Render_EdgeSetupWithParam	endp

; ���������������������������������������������������������������������������

loc_2BBF3:				; DATA XREF: seg339:17FAo
		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+10h]
		mov	ax, es:[bx+0Eh]
		mov	[bp-2],	ax
		movsx	eax, word ptr [bp-2]
		mov	edx, dword_6E9AA
		imul	edx, eax
		mov	[bp-6],	edx
		mov	eax, [bp-6]
		mov	[bp-0Ah], eax

loc_2BC22:
		push	word ptr [bp-9]

loc_2BC25:
		push	word ptr es:[bx+0Eh]
		les	bx, es:[bx+0Ah]

loc_2BC2D:
		push	word ptr es:[bx+3]
		push	word ptr es:[bx+1]
		push	word_70E60
		call	Render_PlotPixelClippedColorMap
		add	sp, 0Eh
		leave
		retf
; ���������������������������������������������������������������������������

loc_2BC43:				; DATA XREF: seg339:180Eo
		push	bp
		mov	bp, sp
		mov	al, 2
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2BC4A:				; DATA XREF: seg339:off_71E90o
		push	bp
		mov	bp, sp
		mov	word_72474, 11E8h
		mov	word_72474, 11ECh
		mov	word_72474, 17D6h
		mov	word_72474, 17FAh
		mov	word_72488, 11E8h

loc_2BC6B:
		mov	word_72488, 11ECh

loc_2BC71:
		mov	word_72488, 17D6h

loc_2BC77:
		mov	word_72488, 17B2h
		mov	word_72499, 11E8h
		mov	word_72499, 11ECh
		mov	word_72499, 17D6h

loc_2BC8F:
		mov	word_72499, 17B2h
		mov	word_72499, 178Eh
		pop	bp
		retf
seg059		ends

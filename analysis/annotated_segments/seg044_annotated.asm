seg044		segment	byte public 'CODE' use16
		assume cs:seg044
		;org 8
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,443L — primitive de tracé graphique bas niveau : plot d'un pixel avec clipping (bornes
; min/max x/y) et remappage de couleur via table de correspondance (instruction xlat, segment
; FS) ; variante en boucle pour remplissage de zone : primitive de dessin/remplissage avec
; table de couleurs (probable effet de transparence/ombrage du moteur de rendu logiciel, même
; famille que seg037).
; ==============================================================================================
Render_PlotPixelClippedColorMap	proc far		; CODE XREF: seg059:0649P seg106:08EBP

var_36		= word ptr -36h
var_34		= word ptr -34h
var_32		= word ptr -32h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_2C		= word ptr -2Ch
var_2A		= word ptr -2Ah
var_28		= word ptr -28h
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= word ptr -22h
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
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= dword	ptr  10h

		enter	36h, 0
		push	si
		push	di
		mov	si, [bp+arg_0]

loc_258B1:
		mov	ax, ss

loc_258B3:
		mov	es, ax

loc_258B5:
		lea	di, [bp+var_14]

loc_258B8:
		mov	cx, 6
		rep movsw

loc_258BD:
		mov	es, [bp+var_14]
		shl	[bp+var_E], 1

loc_258C3:
		shl	[bp+var_A], 1
		shl	[bp+arg_4], 1
		mov	ax, [bp+arg_8]
		mov	[bp+var_32], ax
		lfs	bx, [bp+arg_A]

loc_258D3:
		cmp	[bp+arg_6], 0
		jz	short loc_258DE
		cmp	ax, 0
		jnz	short loc_2590D

loc_258DE:				; CODE XREF: Render_PlotPixelClippedColorMap+2Fj
		mov	ax, [bp+arg_4]
		cmp	ax, [bp+var_A]
		jg	short loc_25909
		cmp	ax, [bp+var_E]
		jl	short loc_25909
		mov	di, [bp+var_12]
		add	di, ax
		mov	di, [di]
		mov	ax, [bp+arg_2]
		cmp	ax, [bp+var_C]
		jg	short loc_25909
		cmp	ax, [bp+var_10]
		jl	short loc_25909
		add	di, ax
		mov	al, es:[di]
		xlat	byte ptr fs:[bx]
		mov	es:[di], al

loc_25909:				; CODE XREF: Render_PlotPixelClippedColorMap+3Cj
					; Render_PlotPixelClippedColorMap+41j ...
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_2590D:				; CODE XREF: Render_PlotPixelClippedColorMap+34j
		mov	[bp+var_2], 0
		mov	ax, [bp+arg_8]
		shl	ax, 1
		mov	[bp+var_4], ax
		mov	[bp+var_36], 1
		mov	ax, [bp+arg_6]
		mul	ax
		mov	[bp+var_18], ax
		mov	[bp+var_16], dx
		shl	ax, 1
		rcl	dx, 1
		mov	[bp+var_1C], ax
		mov	[bp+var_1A], dx
		mov	ax, [bp+arg_8]
		mul	ax
		mov	[bp+var_20], ax
		mov	[bp+var_1E], dx
		shl	ax, 1
		rcl	dx, 1
		mov	[bp+var_24], ax
		mov	[bp+var_22], dx
		mov	[bp+var_28], 0

loc_2594E:
		mov	[bp+var_26], 0
		mov	ax, [bp+var_1C]
		mov	dx, [bp+var_1A]
		mov	cx, [bp+arg_8]
		push	ax
		mov	ax, dx
		mul	cx
		xchg	ax, cx
		pop	dx
		mul	dx
		add	dx, cx
		mov	[bp+var_2C], ax
		mov	[bp+var_2A], dx
		mov	ax, [bp+var_18]
		mov	dx, [bp+var_16]
		sar	dx, 1
		rcr	ax, 1
		sar	dx, 1
		rcr	ax, 1
		add	ax, [bp+var_20]
		add	dx, [bp+var_1E]
		mov	[bp+var_30], ax
		mov	[bp+var_2E], dx
		mov	ax, [bp+var_18]
		mov	dx, [bp+var_16]
		mov	cx, [bp+arg_8]
		push	ax
		mov	ax, dx
		mul	cx
		xchg	ax, cx
		pop	dx
		mul	dx
		add	dx, cx
		sub	[bp+var_30], ax
		sbb	[bp+var_2E], dx

loc_259A1:				; CODE XREF: Render_PlotPixelClippedColorMap+1F3j
		mov	ax, [bp+var_28]
		mov	dx, [bp+var_26]
		sub	ax, [bp+var_2C]
		sbb	dx, [bp+var_2A]
		js	short loc_259B2

loc_259AF:
		jmp	loc_25A9E
; ���������������������������������������������������������������������������

loc_259B2:				; CODE XREF: Render_PlotPixelClippedColorMap+105j
		cmp	[bp+var_36], 1
		jnz	short loc_259CB
		mov	ax, [bp+arg_2]
		add	ax, [bp+var_2]
		cmp	ax, [bp+var_C]
		jle	short loc_259C6
		mov	ax, [bp+var_C]

loc_259C6:				; CODE XREF: Render_PlotPixelClippedColorMap+119j
		cmp	ax, [bp+var_10]
		jge	short loc_259CD

loc_259CB:				; CODE XREF: Render_PlotPixelClippedColorMap+10Ej
					; Render_PlotPixelClippedColorMap+139j ...
		jmp	short loc_25A40
; ���������������������������������������������������������������������������

loc_259CD:				; CODE XREF: Render_PlotPixelClippedColorMap+121j
		mov	[bp+var_8], ax
		mov	ax, [bp+arg_2]
		sub	ax, [bp+var_2]
		cmp	ax, [bp+var_10]
		jge	short loc_259DE
		mov	ax, [bp+var_10]

loc_259DE:				; CODE XREF: Render_PlotPixelClippedColorMap+131j
		cmp	ax, [bp+var_C]
		jg	short loc_259CB
		mov	[bp+var_6], ax
		mov	si, [bp+arg_4]
		add	si, [bp+var_4]
		cmp	si, [bp+var_E]
		jl	short loc_259CB
		cmp	si, [bp+var_A]
		jg	short loc_25A0F
		mov	cx, [bp+var_8]
		sub	cx, [bp+var_6]
		inc	cx
		mov	di, [bp+var_12]
		add	di, si
		mov	di, [di]
		add	di, [bp+var_6]

loc_25A07:				; CODE XREF: Render_PlotPixelClippedColorMap+165j
		mov	al, es:[di]
		xlat	byte ptr fs:[bx]
		stosb
		loop	loc_25A07

loc_25A0F:				; CODE XREF: Render_PlotPixelClippedColorMap+14Cj
		mov	ax, [bp+var_4]
		or	ax, ax
		jz	short loc_25A40
		mov	si, [bp+arg_4]
		sub	si, ax
		jz	short loc_25A40
		cmp	si, [bp+var_A]
		jg	short loc_25A40
		cmp	si, [bp+var_E]
		jl	short loc_25A40
		mov	cx, [bp+var_8]
		sub	cx, [bp+var_6]
		inc	cx
		mov	di, [bp+var_12]
		add	di, si
		mov	di, [di]
		add	di, [bp+var_6]

loc_25A38:				; CODE XREF: Render_PlotPixelClippedColorMap+196j
		mov	al, es:[di]
		xlat	byte ptr fs:[bx]
		stosb
		loop	loc_25A38

loc_25A40:				; CODE XREF: Render_PlotPixelClippedColorMap:loc_259CBj
					; Render_PlotPixelClippedColorMap+16Cj ...
		mov	cx, 0
		cmp	[bp+var_2E], 0
		js	short loc_25A6B
		sub	[bp+var_4], 2
		mov	cx, 1

loc_25A50:
		dec	[bp+var_32]
		mov	ax, [bp+var_2C]
		mov	dx, [bp+var_2A]
		sub	ax, [bp+var_1C]
		sbb	dx, [bp+var_1A]
		mov	[bp+var_2C], ax

loc_25A62:
		mov	[bp+var_2A], dx
		sub	[bp+var_30], ax
		sbb	[bp+var_2E], dx

loc_25A6B:				; CODE XREF: Render_PlotPixelClippedColorMap+19Fj
		mov	[bp+var_36], cx
		inc	[bp+var_2]
		mov	ax, [bp+var_28]
		mov	dx, [bp+var_26]
		add	ax, [bp+var_24]
		adc	dx, [bp+var_22]
		mov	[bp+var_28], ax

loc_25A80:
		mov	[bp+var_26], dx

loc_25A83:
		add	ax, [bp+var_20]

loc_25A86:
		adc	dx, [bp+var_1E]

loc_25A89:
		add	[bp+var_30], ax
		adc	[bp+var_2E], dx

loc_25A8F:
		mov	ax, [bp+var_28]

loc_25A92:
		mov	dx, [bp+var_26]
		sub	ax, [bp+var_2C]
		sbb	dx, [bp+var_2A]
		jmp	loc_259A1
; ���������������������������������������������������������������������������

loc_25A9E:				; CODE XREF: Render_PlotPixelClippedColorMap:loc_259AFj
		mov	ax, [bp+var_18]
		mov	dx, [bp+var_16]
		sub	ax, [bp+var_20]
		sbb	dx, [bp+var_1E]
		mov	[bp+var_34], ax
		mov	cx, dx
		sar	dx, 1

loc_25AB1:
		rcr	ax, 1
		add	ax, [bp+var_34]
		adc	dx, cx
		sub	ax, [bp+var_28]
		sbb	dx, [bp+var_26]
		sub	ax, [bp+var_2C]

loc_25AC1:
		sbb	dx, [bp+var_2A]

loc_25AC4:
		sar	dx, 1
		rcr	ax, 1
		add	[bp+var_30], ax
		adc	[bp+var_2E], dx

loc_25ACE:				; CODE XREF: Render_PlotPixelClippedColorMap+2F4j
		mov	ax, [bp+arg_2]
		add	ax, [bp+var_2]
		cmp	ax, [bp+var_C]
		jle	short loc_25ADC
		mov	ax, [bp+var_C]

loc_25ADC:				; CODE XREF: Render_PlotPixelClippedColorMap+22Fj
		cmp	ax, [bp+var_10]
		jge	short loc_25AE3

loc_25AE1:				; CODE XREF: Render_PlotPixelClippedColorMap+24Fj
					; Render_PlotPixelClippedColorMap+25Dj
		jmp	short loc_25B54
; ���������������������������������������������������������������������������

loc_25AE3:				; CODE XREF: Render_PlotPixelClippedColorMap+237j
		mov	[bp+var_8], ax
		mov	ax, [bp+arg_2]
		sub	ax, [bp+var_2]
		cmp	ax, [bp+var_10]
		jge	short loc_25AF4
		mov	ax, [bp+var_10]

loc_25AF4:				; CODE XREF: Render_PlotPixelClippedColorMap+247j
		cmp	ax, [bp+var_C]
		jg	short loc_25AE1
		mov	[bp+var_6], ax
		mov	si, [bp+arg_4]
		add	si, [bp+var_4]
		cmp	si, [bp+var_E]
		jl	short loc_25AE1
		cmp	si, [bp+var_A]
		jg	short loc_25B25
		mov	cx, [bp+var_8]
		sub	cx, [bp+var_6]
		inc	cx
		mov	di, [bp+var_12]
		add	di, si
		mov	di, [di]
		add	di, [bp+var_6]

loc_25B1D:				; CODE XREF: Render_PlotPixelClippedColorMap+27Bj
		mov	al, es:[di]
		xlat	byte ptr fs:[bx]
		stosb
		loop	loc_25B1D

loc_25B25:				; CODE XREF: Render_PlotPixelClippedColorMap+262j
		mov	ax, [bp+var_4]
		or	ax, ax
		jz	short loc_25B54
		mov	si, [bp+arg_4]
		sub	si, ax
		cmp	si, [bp+var_A]
		jg	short loc_25B54
		cmp	si, [bp+var_E]
		jl	short loc_25B54
		mov	cx, [bp+var_8]
		sub	cx, [bp+var_6]
		inc	cx
		mov	di, [bp+var_12]
		add	di, si
		mov	di, [di]
		add	di, [bp+var_6]

loc_25B4C:				; CODE XREF: Render_PlotPixelClippedColorMap+2AAj
		mov	al, es:[di]
		xlat	byte ptr fs:[bx]
		stosb
		loop	loc_25B4C

loc_25B54:				; CODE XREF: Render_PlotPixelClippedColorMap:loc_25AE1j
					; Render_PlotPixelClippedColorMap+282j ...
		cmp	[bp+var_2E], 0

loc_25B58:
		jns	short loc_25B75
		inc	[bp+var_2]

loc_25B5D:
		mov	ax, [bp+var_28]
		mov	dx, [bp+var_26]

loc_25B63:
		add	ax, [bp+var_24]
		adc	dx, [bp+var_22]
		mov	[bp+var_28], ax
		mov	[bp+var_26], dx
		add	[bp+var_30], ax
		adc	[bp+var_2E], dx

loc_25B75:				; CODE XREF: Render_PlotPixelClippedColorMap:loc_25B58j
		sub	[bp+var_4], 2
		mov	ax, [bp+var_2C]
		mov	dx, [bp+var_2A]

loc_25B7F:
		sub	ax, [bp+var_1C]
		sbb	dx, [bp+var_1A]
		mov	[bp+var_2C], ax
		mov	[bp+var_2A], dx
		sub	ax, [bp+var_18]
		sbb	dx, [bp+var_16]
		sub	[bp+var_30], ax
		sbb	[bp+var_2E], dx
		dec	[bp+var_32]
		js	short loc_25B9F
		jmp	loc_25ACE
; ���������������������������������������������������������������������������

loc_25B9F:				; CODE XREF: Render_PlotPixelClippedColorMap+2F2j
		pop	di

loc_25BA0:
		pop	si
		leave
		retf
Render_PlotPixelClippedColorMap	endp

seg044		ends

seg174		segment	byte public 'CODE' use16
		assume cs:seg174
		;org 2
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 457 lignes, NON DÉTAILLÉE — même motif que Render_DrawTextString_61CD2 (seg173) :
; copie un descripteur de contexte (6 mots) et prend un pointeur far vers une chaîne (arg_6),
; avec vérification de capacité de buffer (comparaison contre [si+4]). Référencée par
; sub_1450B, sub_14795 et Widget_ConstructWithBuffer/GlyphObject_ConstructWithBuffer (seg162).
; Probable variante mesure-sans-dessiner ou dessin avec contrôle de capacité — identité exacte
; vis-à-vis de Render_DrawTextString_61CD2 non vérifiée. Candidat pour session dédiée.
; ==============================================================================================
Render_MeasureOrDrawTextString_61F52	proc far		; CODE XREF: UI_RenderFormattedText+17BP
					; Text_TypewriterFrame+78P ...

var_152		= word ptr -152h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= dword	ptr  0Ch
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 152h
		push	si
		push	di
		push	ds
		cld
		push	ss
		pop	es
		mov	si, [bp+arg_0]
		lea	di, [bp+var_12]
		mov	cx, 6
		rep movsw
		mov	es, [bp+var_12]
		lds	si, [bp+arg_6]
		mov	bx, [bp+arg_A]
		inc	bx
		shl	bx, 1
		shl	bx, 1
		cmp	[si+4],	bx
		jb	short loc_61F7F
		jnz	short loc_61F82

loc_61F7F:				; CODE XREF: Render_MeasureOrDrawTextString_61F52+29j
		jmp	loc_6203E
; ���������������������������������������������������������������������������

loc_61F82:				; CODE XREF: Render_MeasureOrDrawTextString_61F52+2Bj
		mov	ax, ds

loc_61F84:
		mov	dx, 0

loc_61F87:
		shl	ax, 1

loc_61F89:
		rcl	dx, 1
		shl	ax, 1
		rcl	dx, 1
		shl	ax, 1

loc_61F91:
		rcl	dx, 1
		shl	ax, 1

loc_61F95:
		rcl	dx, 1

loc_61F97:
		add	ax, si
		adc	dx, 0
		add	ax, [bx+si]
		adc	dx, [bx+si+2]
		mov	si, ax
		and	si, 0Fh
		shr	dx, 1
		rcr	ax, 1
		shr	dx, 1
		rcr	ax, 1
		shr	dx, 1
		rcr	ax, 1
		shr	dx, 1
		rcr	ax, 1
		mov	ds, ax
		mov	ax, [si]
		add	ax, [bp+arg_2]
		cmp	ax, [bp+var_A]
		jg	short loc_61FE1
		mov	ax, [bp+arg_2]
		sub	ax, [si+2]
		cmp	ax, [bp+var_E]
		jl	short loc_61FD6
		mov	ax, [bp+arg_4]

loc_61FD0:
		sub	ax, [si+4]

loc_61FD3:
		cmp	ax, [bp+var_C]

loc_61FD6:				; CODE XREF: Render_MeasureOrDrawTextString_61F52+79j
		jl	short loc_62045

loc_61FD8:
		mov	ax, [si+6]
		add	ax, [bp+arg_4]

loc_61FDE:
		cmp	ax, [bp+var_8]

loc_61FE1:				; CODE XREF: Render_MeasureOrDrawTextString_61F52+6Ej
		jg	short loc_62045

loc_61FE3:
		mov	dx, ds
		add	si, 8

loc_61FE8:				; CODE XREF: Render_MeasureOrDrawTextString_61F52+BFj
					; Render_MeasureOrDrawTextString_61F52+D7j ...
		lodsw
		or	ax, ax
		jz	short loc_6204B
		mov	cx, ax
		lodsw

loc_61FF0:
		add	ax, [bp+arg_2]
		mov	di, ax
		lodsw
		add	ax, [bp+arg_4]
		shl	ax, 1
		mov	bx, [bp+var_10]
		add	bx, ax
		add	di, ss:[bx]
		mov	ds, dx
		shr	cx, 1
		jb	short loc_62013
		shr	cx, 1
		rep movsw
		adc	cx, cx
		rep movsb
		jmp	short loc_61FE8
; ���������������������������������������������������������������������������

loc_62013:				; CODE XREF: Render_MeasureOrDrawTextString_61F52+B5j
		mov	bx, cx

loc_62015:				; CODE XREF: Render_MeasureOrDrawTextString_61F52+D5j
					; Render_MeasureOrDrawTextString_61F52+E8j
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_6202B
		shr	cx, 1
		rep movsw
		adc	cx, cx
		rep movsb
		sub	bx, ax
		jnz	short loc_62015
		jmp	short loc_61FE8
; ���������������������������������������������������������������������������

loc_6202B:				; CODE XREF: Render_MeasureOrDrawTextString_61F52+C9j
		sub	bx, ax
		lodsb
		mov	ah, al

loc_62030:
		shr	cx, 1
		rep stosw
		adc	cx, cx

loc_62036:
		rep stosb
		or	bx, bx
		jnz	short loc_62015
		jmp	short loc_61FE8
; ���������������������������������������������������������������������������

loc_6203E:				; CODE XREF: Render_MeasureOrDrawTextString_61F52:loc_61F7Fj
					; Render_MeasureOrDrawTextString_61F52:loc_6204Bj
		pop	ds
		pop	di
		pop	si

loc_62041:
		mov	sp, bp

loc_62043:
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_62045:				; CODE XREF: Render_MeasureOrDrawTextString_61F52:loc_61FD6j
					; Render_MeasureOrDrawTextString_61F52:loc_61FE1j
		add	si, 8

loc_62048:				; CODE XREF: Render_MeasureOrDrawTextString_61F52+157j
					; Render_MeasureOrDrawTextString_61F52+161j ...
		lodsw

loc_62049:
		shr	ax, 1

loc_6204B:				; CODE XREF: Render_MeasureOrDrawTextString_61F52+99j
		jz	short loc_6203E

loc_6204D:
		mov	cx, ax

loc_6204F:
		jb	short loc_620B9
		lodsw

loc_62052:
		add	ax, [bp+arg_2]
		mov	dx, ax
		lodsw
		add	ax, [bp+arg_4]
		cmp	ax, [bp+var_C]
		jl	short loc_620B5
		cmp	ax, [bp+var_8]
		jg	short loc_620B5
		mov	bx, ax
		cmp	dx, [bp+var_A]
		jg	short loc_620B5
		mov	ax, dx
		add	ax, cx
		dec	ax
		cmp	ax, [bp+var_E]
		jl	short loc_620B5
		shl	bx, 1
		push	ds
		mov	ax, [bp+var_10]
		add	bx, ax
		mov	di, ss:[bx]

loc_62081:
		pop	ds
		add	di, dx
		mov	ax, [bp+var_E]

loc_62087:
		mov	bx, [bp+var_A]
		sub	ax, dx
		jle	short loc_62096
		sub	cx, ax
		add	si, ax
		add	di, ax
		add	dx, ax

loc_62096:				; CODE XREF: Render_MeasureOrDrawTextString_61F52+13Aj
		add	dx, cx
		dec	dx
		sub	dx, bx
		jle	short loc_620AB
		sub	cx, dx
		shr	cx, 1
		rep movsw
		adc	cx, cx
		rep movsb
		add	si, dx
		jmp	short loc_62048
; ���������������������������������������������������������������������������

loc_620AB:				; CODE XREF: Render_MeasureOrDrawTextString_61F52+149j
		shr	cx, 1
		rep movsw
		adc	cx, cx
		rep movsb
		jmp	short loc_62048
; ���������������������������������������������������������������������������

loc_620B5:				; CODE XREF: Render_MeasureOrDrawTextString_61F52+10Cj
					; Render_MeasureOrDrawTextString_61F52+111j ...
		add	si, cx
		jmp	short loc_62048
; ���������������������������������������������������������������������������

loc_620B9:				; CODE XREF: Render_MeasureOrDrawTextString_61F52:loc_6204Fj
		lodsw
		add	ax, [bp+arg_2]
		mov	dx, ax
		lodsw

loc_620C0:
		add	ax, [bp+arg_4]

loc_620C3:
		cmp	ax, [bp+var_C]

loc_620C6:
		jl	short loc_62126
		cmp	ax, [bp+var_8]
		jg	short loc_62126
		mov	bx, ax

loc_620CF:
		cmp	dx, [bp+var_A]
		jg	short loc_62126

loc_620D4:
		mov	ax, dx

loc_620D6:
		add	ax, cx

loc_620D8:
		dec	ax
		cmp	ax, [bp+var_E]
		jl	short loc_62126

loc_620DE:
		shl	bx, 1
		push	ds

loc_620E1:
		mov	di, [bp+var_10]
		add	bx, di
		mov	di, ss:[bx]
		pop	ds
		add	di, dx
		sub	ax, [bp+var_A]

loc_620EF:
		sub	dx, [bp+var_E]
		jl	short loc_62139
		cmp	ax, 0
		jg	short loc_62139
		mov	bx, cx

loc_620FB:				; CODE XREF: Render_MeasureOrDrawTextString_61F52+1BBj
					; Render_MeasureOrDrawTextString_61F52+1CFj
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_62112

loc_62103:
		shr	cx, 1
		rep movsw
		adc	cx, cx
		rep movsb
		sub	bx, ax
		jnz	short loc_620FB
		jmp	loc_62048
; ���������������������������������������������������������������������������

loc_62112:				; CODE XREF: Render_MeasureOrDrawTextString_61F52+1AFj
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		or	bx, bx
		jnz	short loc_620FB
		jmp	loc_62048
; ���������������������������������������������������������������������������

loc_62126:				; CODE XREF: Render_MeasureOrDrawTextString_61F52:loc_620C6j
					; Render_MeasureOrDrawTextString_61F52+179j ...
		lodsb
		add	si, 1
		shr	al, 1
		cbw
		jb	short loc_62132
		add	si, ax

loc_62131:
		dec	si

loc_62132:				; CODE XREF: Render_MeasureOrDrawTextString_61F52+1DBj
		sub	cx, ax
		jnz	short loc_62126
		jmp	loc_62048
; ���������������������������������������������������������������������������

loc_62139:				; CODE XREF: Render_MeasureOrDrawTextString_61F52+1A0j
					; Render_MeasureOrDrawTextString_61F52+1A5j
		mov	[bp+var_2], ax
		mov	bx, cx
		push	cx
		push	es
		push	di

loc_62141:
		push	ss
		pop	es
		lea	di, [bp+var_152]

loc_62147:				; CODE XREF: Render_MeasureOrDrawTextString_61F52+207j
					; Render_MeasureOrDrawTextString_61F52+21Aj
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_6215D
		shr	cx, 1
		rep movsw

loc_62153:
		adc	cx, cx
		rep movsb
		sub	bx, ax
		jnz	short loc_62147
		jmp	short loc_6216E
; ���������������������������������������������������������������������������

loc_6215D:				; CODE XREF: Render_MeasureOrDrawTextString_61F52+1FBj
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		or	bx, bx
		jnz	short loc_62147

loc_6216E:				; CODE XREF: Render_MeasureOrDrawTextString_61F52+209j
		pop	di
		pop	es
		pop	cx
		push	ds
		push	si
		push	ss
		pop	ds
		lea	si, [bp+var_152]
		mov	ax, 0
		cmp	dx, 0
		jge	short loc_62187

loc_62181:
		add	cx, dx
		sub	si, dx
		sub	di, dx

loc_62187:				; CODE XREF: Render_MeasureOrDrawTextString_61F52+22Dj
		cmp	[bp+var_2], 0
		jle	short loc_62193
		sub	cx, [bp+var_2]
		mov	ax, [bp+var_2]

loc_62193:				; CODE XREF: Render_MeasureOrDrawTextString_61F52+239j
		shr	cx, 1
		rep movsw
		adc	cx, cx
		rep movsb
		add	si, ax
		pop	si
		pop	ds

loc_6219F:
		jmp	loc_62048
Render_MeasureOrDrawTextString_61F52	endp

seg174		ends

ovr226		segment	para public 'OVERLAY' use16
		assume cs:ovr226
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
		db 3 dup(0F0h),	3 dup(0F1h), 3 dup(0F2h), 3 dup(0F3h)
		db 3 dup(0F4h),	3 dup(0F5h), 3 dup(0F6h), 3 dup(0F7h)
		db 3 dup(0F8h),	3 dup(0F9h), 0FAh, 0F9h, 0FAh, 0FCh, 0FAh
		db 0FCh, 0FBh, 2 dup(0FDh), 0FCh, 0FDh,	0FEh, 0FCh, 2 dup(0FEh)
		db 0FDh, 0FFh, 0FEh, 0F0h, 0F1h, 0F0h, 0F1h, 0F2h, 0F1h
		db 0F2h, 0F3h, 0F2h, 0F3h, 0F4h, 0F3h, 0F4h, 0F5h, 0F4h
		db 0F5h, 0F6h, 0F5h, 0F6h, 0F7h, 0F6h, 0F7h, 0F8h, 0F7h
		db 0F8h, 0F9h, 0F8h, 0F9h, 0FAh, 0F9h, 0FAh, 0FBh, 0FAh
		db 0FBh, 0FCh, 0FBh, 0FDh, 0FCh, 0FBh, 0FDh, 0FEh, 0FDh
		db 0FEh, 0FDh, 0FEh, 0FFh, 0FEh, 0FFh, 2 dup(0F1h), 0F0h
		db 0F1h, 0F0h, 0F1h, 2 dup(0F2h), 2 dup(0F3h), 0F2h, 0F4h
		db 2 dup(0F3h),	2 dup(0F4h), 0F6h, 3 dup(0F5h),	0F7h, 0F6h
		db 0F7h, 0F9h, 2 dup(0F8h), 3 dup(0F9h), 0FAh, 0FBh, 0FAh
		db 0FBh, 0FAh, 2 dup(0FBh), 3 dup(0FCh), 0FDh, 0FCh, 0FDh
		db 0FEh, 2 dup(0FDh), 2	dup(0FEh), 0FFh, 2 dup(0F0h), 0F1h
		db 0F0h, 0F1h, 0F2h, 0F1h, 0F2h, 0F3h, 0F2h, 0F3h, 0F4h
		db 0F3h, 0F4h, 0F5h, 0F4h, 0F5h, 0F6h, 0F5h, 0F6h, 0F7h
		db 0F6h, 0F7h, 0F8h, 0F7h, 0F8h, 0F9h, 0F8h, 0F9h, 0FAh
		db 0F9h, 2 dup(0FAh), 2	dup(0FBh), 0FCh, 0FDh, 0FBh, 0FDh
		db 0FCh, 0FDh, 0FEh, 0FDh, 0FEh, 0FFh, 0FEh, 2 dup(0FFh)
		db 2 dup(0), 30h, 0, 60h, 0, 90h, 0

; ��������������� S U B	R O U T	I N E ���������������������������������������


sub_C3FF8	proc near		; CODE XREF: sub_C4118+1BCp
					; sub_C4118+1D1p
		push	si
		push	di
		cmp	cx, word_466FC
		jg	short loc_C4077
		cmp	dx, word_466F8
		jl	short loc_C4077
		mov	di, bx
		and	di, 3
		shl	di, 1
		mov	si, cs:[di+0C0h]
		shl	bx, 1
		add	bx, word_466F6
		mov	di, ss:[bx]
		mov	bx, cx
		mov	cx, 30h	; '0'
		or	ax, ax
		jz	short loc_C404F
		add	si, 2Fh	; '/'
		mov	ax, word_466F8
		sub	ax, bx
		js	short loc_C4034
		sub	si, ax
		sub	cx, ax
		add	bx, ax

loc_C4034:				; CODE XREF: sub_C3FF8+34j
		mov	ax, dx
		sub	ax, word_466FC
		jle	short loc_C4040
		sub	cx, ax
		sub	dx, ax

loc_C4040:				; CODE XREF: sub_C3FF8+42j
		add	di, bx
		or	cx, cx
		jle	short loc_C4077

loc_C4046:				; CODE XREF: sub_C3FF8+53j
		mov	al, cs:[si]
		dec	si
		stosb
		loop	loc_C4046
		jmp	short loc_C4077
; ���������������������������������������������������������������������������

loc_C404F:				; CODE XREF: sub_C3FF8+2Aj
		mov	ax, word_466F8
		sub	ax, bx
		js	short loc_C405C
		add	si, ax
		sub	cx, ax
		add	bx, ax

loc_C405C:				; CODE XREF: sub_C3FF8+5Cj
		mov	ax, dx
		sub	ax, word_466FC
		jle	short loc_C4068
		sub	cx, ax
		sub	dx, ax

loc_C4068:				; CODE XREF: sub_C3FF8+6Aj
		add	di, bx
		or	cx, cx
		jle	short loc_C4077
		nop
		nop

loc_C4070:				; CODE XREF: sub_C3FF8+7Dj
		mov	al, cs:[si]
		inc	si
		stosb
		loop	loc_C4070

loc_C4077:				; CODE XREF: sub_C3FF8+6j sub_C3FF8+Cj ...
		pop	di
		pop	si
		retn
sub_C3FF8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Render_DitheredLineSpanVariant_58AFA (sub_58AFA de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — near,
; variante de Render_DitheredLineSpan_58A7A pour une autre paire de bornes
; (word_70842/word_7083E) — probable axe/bord de clipping différent.
; ==============================================================================================
Render_DitheredLineSpanVariant_C407A	proc near		; CODE XREF: sub_C4118+23Ep
					; sub_C4118+253p
		push	si
		push	di
		cmp	cx, word_466FE
		jg	loc_C4115
		cmp	dx, word_466FA
		jl	loc_C4115
		mov	di, bx
		and	di, 3
		shl	di, 1
		mov	si, cs:[di+0C0h]
		mov	di, bx
		mov	bx, cx
		mov	dx, dx
		mov	cx, 30h	; '0'
		or	ax, ax
		jz	short loc_C40E0
		add	si, 2Fh	; '/'
		mov	ax, word_466FA
		sub	ax, bx
		js	short loc_C40B5
		sub	si, ax
		sub	cx, ax
		add	bx, ax

loc_C40B5:				; CODE XREF: Render_DitheredLineSpanVariant_C407A+33j
		mov	ax, dx
		sub	ax, word_466FE
		jle	short loc_C40C1
		sub	cx, ax
		sub	dx, ax

loc_C40C1:				; CODE XREF: Render_DitheredLineSpanVariant_C407A+41j
		shl	bx, 1
		add	bx, word_466F6
		add	di, ss:[bx]
		mov	dx, word_46700
		or	cx, cx
		jle	short loc_C4115

loc_C40D2:				; CODE XREF: Render_DitheredLineSpanVariant_C407A+61j
		mov	al, cs:[si]
		dec	si
		mov	es:[di], al
		add	di, dx
		loop	loc_C40D2
		jmp	short loc_C4115
; ���������������������������������������������������������������������������
		align 2

loc_C40E0:				; CODE XREF: Render_DitheredLineSpanVariant_C407A+29j
		mov	ax, word_466FA
		sub	ax, bx
		js	short loc_C40ED
		add	si, ax
		sub	cx, ax
		add	bx, ax

loc_C40ED:				; CODE XREF: Render_DitheredLineSpanVariant_C407A+6Bj
		mov	ax, dx
		sub	ax, word_466FE
		jle	short loc_C40F9
		sub	cx, ax
		sub	dx, ax

loc_C40F9:				; CODE XREF: Render_DitheredLineSpanVariant_C407A+79j
		shl	bx, 1
		add	bx, word_466F6
		add	di, ss:[bx]
		mov	dx, word_46700
		or	cx, cx
		jle	short loc_C4115

loc_C410A:				; CODE XREF: Render_DitheredLineSpanVariant_C407A+99j
		mov	al, cs:[si]
		inc	si
		mov	es:[di], al
		add	di, dx
		loop	loc_C410A

loc_C4115:				; CODE XREF: Render_DitheredLineSpanVariant_C407A+6j Render_DitheredLineSpanVariant_C407A+Ej ...
		pop	di
		pop	si
		retn
Render_DitheredLineSpanVariant_C407A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C4118	proc far		; CODE XREF: sub_42B90J

var_32		= word ptr -32h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_28		= word ptr -28h
var_26		= word ptr -26h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		enter	32h, 0
		push	si
		push	di
		push	ss
		pop	es
		mov	si, [bp+arg_0]
		mov	di, 36D4h
		mov	cx, 3
		rep movsd
		mov	si, word_466F6
		mov	bx, word_466FA
		shl	bx, 1
		mov	ax, [bx+si+2]
		sub	ax, [bx+si]
		mov	word_46700, ax
		mov	di, [bx+si]
		add	di, word_466F8
		mov	[bp+var_2E], di
		mov	ax, word_466FC
		sub	ax, word_466F8
		inc	ax
		mov	[bp+var_30], ax
		mov	ax, word_466FE
		sub	ax, word_466FA
		inc	ax
		mov	[bp+var_32], ax
		mov	ax, [bp+arg_6]
		sub	ax, [bp+arg_2]
		cwde
		mov	[bp+var_8], eax
		jge	short loc_C416D
		neg	ax

loc_C416D:				; CODE XREF: sub_C4118+51j
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		sub	ax, [bp+arg_8]
		cwde
		mov	[bp+var_C], eax
		jge	short loc_C4180
		neg	ax

loc_C4180:				; CODE XREF: sub_C4118+64j
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		or	ax, [bp+var_4]
		jnz	short loc_C418E
		jmp	loc_C437F
; ���������������������������������������������������������������������������

loc_C418E:				; CODE XREF: sub_C4118+71j
		cmp	word ptr [bp+var_C], 0
		jnz	short loc_C41C5
		movzx	ebx, word_46700
		shl	ebx, 8
		mov	ax, [bp+arg_4]
		sub	ax, word_466FA
		cwde
		imul	ebx
		test	word ptr [bp+var_8], 0FFFFh
		js	short loc_C41B7
		neg	ebx
		neg	eax

loc_C41B7:				; CODE XREF: sub_C4118+97j
		neg	eax
		mov	[bp+var_20], ebx
		mov	[bp+var_24], eax
		jmp	short loc_C41FD
; ���������������������������������������������������������������������������
		db 90h
; ���������������������������������������������������������������������������

loc_C41C5:				; CODE XREF: sub_C4118+7Aj
		mov	eax, [bp+var_8]
		shl	eax, 8
		cdq
		mov	ebx, [bp+var_C]
		neg	ebx
		idiv	ebx
		mov	[bp+var_20], eax
		mov	ax, [bp+arg_2]
		cwde
		shl	eax, 8
		mov	ecx, eax
		mov	ax, [bp+arg_4]
		sub	ax, word_466FA
		cwde
		imul	[bp+var_20]
		sub	ecx, eax
		mov	[bp+var_24], ecx

loc_C41FD:				; CODE XREF: sub_C4118+AAj
		mov	al, byte_46704
		mov	ah, al
		mov	dl, byte_46702
		mov	dh, dl
		test	word ptr [bp+var_C], 0FFFFh
		js	short loc_C4210
		xchg	ax, dx

loc_C4210:				; CODE XREF: sub_C4118+F5j
		mov	[bp+var_26], ax
		mov	[bp+var_28], dx
		mov	es, word_466F4
		assume es:seg000
		mov	di, [bp+var_2E]
		mov	si, [bp+var_32]
		mov	edx, [bp+var_24]

loc_C4224:				; CODE XREF: sub_C4118+153j
		push	di
		mov	bx, [bp+var_30]
		mov	eax, edx
		sar	eax, 8
		movzx	ecx, word_466F8
		sub	eax, ecx
		jl	short loc_C4250
		mov	cx, bx
		cmp	eax, ecx
		jg	short loc_C4243
		mov	cx, ax

loc_C4243:				; CODE XREF: sub_C4118+127j
		sub	bx, cx
		mov	ax, [bp+var_26]
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb

loc_C4250:				; CODE XREF: sub_C4118+120j
		or	bx, bx
		jle	short loc_C4261
		mov	cx, bx
		mov	ax, [bp+var_28]
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb

loc_C4261:				; CODE XREF: sub_C4118+13Aj
		pop	di
		add	di, word_46700
		add	edx, [bp+var_20]
		dec	si
		jnz	short loc_C4224
		mov	es, word_466F4
		mov	ax, [bp+var_4]
		cmp	[bp+var_2], ax
		jl	short loc_C427C
		jmp	loc_C42FE
; ���������������������������������������������������������������������������

loc_C427C:				; CODE XREF: sub_C4118+15Fj
		mov	eax, [bp+var_8]
		shl	eax, 8
		cdq
		idiv	[bp+var_C]
		mov	[bp+var_10], eax
		mov	ax, [bp+arg_4]
		sub	ax, word_466FA
		imul	word ptr [bp+var_8]
		idiv	word ptr [bp+var_C]
		cwde
		movsx	edx, [bp+arg_2]
		add	eax, edx
		shl	eax, 8
		mov	[bp+var_14], eax
		mov	si, word_466FA
		jmp	short loc_C42F5
; ���������������������������������������������������������������������������
		align 2

loc_C42B4:				; CODE XREF: sub_C4118+1E1j
		mov	edi, [bp+var_14]
		sar	edi, 8
		test	[bp+var_C+3], 80h
		jnz	short loc_C42DA
		mov	bx, si
		mov	cx, di
		sub	cx, 18h
		mov	dx, di
		add	dx, 17h
		xor	ax, ax
		call	sub_C3FF8
		jmp	short loc_C42EC
; ���������������������������������������������������������������������������
		align 2

loc_C42DA:				; CODE XREF: sub_C4118+1ACj
		mov	bx, si
		mov	cx, di
		sub	cx, 17h
		mov	dx, di
		add	dx, 18h
		mov	ax, 0FFFFh
		call	sub_C3FF8

loc_C42EC:				; CODE XREF: sub_C4118+1BFj
		mov	eax, [bp+var_10]
		sub	[bp+var_14], eax
		inc	si

loc_C42F5:				; CODE XREF: sub_C4118+199j
		cmp	si, word_466FE
		jle	short loc_C42B4
		jmp	loc_C437F
; ���������������������������������������������������������������������������

loc_C42FE:				; CODE XREF: sub_C4118+161j
		mov	eax, [bp+var_C]
		shl	eax, 8
		cdq
		idiv	[bp+var_8]
		mov	[bp+var_10], eax
		mov	ax, [bp+arg_2]
		sub	ax, word_466F8
		imul	word ptr [bp+var_C]
		idiv	word ptr [bp+var_8]
		cwde
		movsx	edx, [bp+arg_4]
		add	eax, edx
		shl	eax, 8
		mov	[bp+var_14], eax
		mov	si, word_466F8
		jmp	short loc_C4377
; ���������������������������������������������������������������������������
		align 2

loc_C4336:				; CODE XREF: sub_C4118+265j
		mov	edi, [bp+var_14]
		shr	edi, 8
		test	[bp+var_8+3], 80h
		jnz	short loc_C435C
		mov	bx, si
		mov	cx, di
		sub	cx, 18h
		mov	dx, di
		add	dx, 17h
		xor	ax, ax
		call	Render_DitheredLineSpanVariant_C407A
		jmp	short loc_C436E
; ���������������������������������������������������������������������������
		align 2

loc_C435C:				; CODE XREF: sub_C4118+22Ej
		mov	bx, si
		mov	cx, di
		sub	cx, 17h
		mov	dx, di
		add	dx, 18h
		mov	ax, 0FFFFh
		call	Render_DitheredLineSpanVariant_C407A

loc_C436E:				; CODE XREF: sub_C4118+241j
		mov	eax, [bp+var_10]
		sub	[bp+var_14], eax
		inc	si

loc_C4377:				; CODE XREF: sub_C4118+21Bj
		cmp	word_466FC, si
		jl	short loc_C437F
		jmp	short loc_C4336
; ���������������������������������������������������������������������������

loc_C437F:				; CODE XREF: sub_C4118+73j
					; sub_C4118+1E3j ...
		pop	di
		pop	si
		leave
		retf
sub_C4118	endp

ovr226		ends

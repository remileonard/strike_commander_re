seg119		segment	byte public 'CODE' use16
		assume cs:seg119
		;org 2
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
byte_589B2	db 3 dup(0F0h),	3 dup(0F1h), 3 dup(0F2h), 3 dup(0F3h)
					; DATA XREF: seg216:047Eo
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
		db 2, 0, 32h, 0, 62h, 0, 92h, 0

; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; near, primitive de tracé de ligne pointillée/dégradée : copie un run de pixels (stosb)
; depuis une table de motif (data en tête de segment, dégradés 0xF0-0xFF), avec clipping
; contre des bornes rectangulaires (word_70840/word_7083C). Appelée uniquement par sub_58B97.
; ==============================================================================================
Render_DitheredLineSpan_58A7A	proc near		; CODE XREF: Render_DitheredLineMain_58B97+1BAp
					; Render_DitheredLineMain_58B97+1CEp
		push	si
		push	di
		cmp	cx, word_70840
		jg	short loc_58AF7
		cmp	dx, word_7083C
		jl	short loc_58AF7
		mov	di, bx
		and	di, 3
		shl	di, 1
		mov	si, cs:[di+0C2h]
		shl	bx, 1
		add	bx, word_7083A
		mov	di, ss:[bx]
		mov	bx, cx
		mov	cx, 30h	; '0'
		or	ax, ax
		jz	short loc_58AD1
		add	si, 2Fh	; '/'
		mov	ax, word_7083C
		sub	ax, bx
		js	short loc_58AB6
		sub	si, ax
		sub	cx, ax
		add	bx, ax

loc_58AB6:				; CODE XREF: Render_DitheredLineSpan_58A7A+34j
		mov	ax, dx
		sub	ax, word_70840
		jle	short loc_58AC2
		sub	cx, ax
		sub	dx, ax

loc_58AC2:				; CODE XREF: Render_DitheredLineSpan_58A7A+42j
		add	di, bx
		or	cx, cx
		jle	short loc_58AF7

loc_58AC8:				; CODE XREF: Render_DitheredLineSpan_58A7A+53j
		mov	al, cs:[si]
		dec	si
		stosb
		loop	loc_58AC8
		jmp	short loc_58AF7
; ���������������������������������������������������������������������������

loc_58AD1:				; CODE XREF: Render_DitheredLineSpan_58A7A+2Aj
		mov	ax, word_7083C
		sub	ax, bx
		js	short loc_58ADE
		add	si, ax
		sub	cx, ax
		add	bx, ax

loc_58ADE:				; CODE XREF: Render_DitheredLineSpan_58A7A+5Cj
		mov	ax, dx
		sub	ax, word_70840
		jle	short loc_58AEA
		sub	cx, ax
		sub	dx, ax

loc_58AEA:				; CODE XREF: Render_DitheredLineSpan_58A7A+6Aj
		add	di, bx
		or	cx, cx
		jle	short loc_58AF7

loc_58AF0:				; CODE XREF: Render_DitheredLineSpan_58A7A+7Bj
		mov	al, cs:[si]
		inc	si
		stosb
		loop	loc_58AF0

loc_58AF7:				; CODE XREF: Render_DitheredLineSpan_58A7A+6j Render_DitheredLineSpan_58A7A+Cj ...
		pop	di
		pop	si
		retn
Render_DitheredLineSpan_58A7A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; near, variante de Render_DitheredLineSpan_58A7A pour une autre paire de bornes
; (word_70842/word_7083E) — probable axe/bord de clipping différent.
; ==============================================================================================
Render_DitheredLineSpanVariant_58AFA	proc near		; CODE XREF: Render_DitheredLineMain_58B97+23Ap
					; Render_DitheredLineMain_58B97+24Ep
		push	si
		push	di
		cmp	cx, word_70842
		jg	loc_58B94
		cmp	dx, word_7083E
		jl	loc_58B94
		mov	di, bx
		and	di, 3
		shl	di, 1
		mov	si, cs:[di+0C2h]
		mov	di, bx
		mov	bx, cx
		mov	dx, dx
		mov	cx, 30h	; '0'
		or	ax, ax

loc_58B23:
		jz	short loc_58B5F
		add	si, 2Fh	; '/'
		mov	ax, word_7083E

loc_58B2B:
		sub	ax, bx
		js	short loc_58B35
		sub	si, ax
		sub	cx, ax
		add	bx, ax

loc_58B35:				; CODE XREF: Render_DitheredLineSpanVariant_58AFA+33j
		mov	ax, dx
		sub	ax, word_70842
		jle	short loc_58B41
		sub	cx, ax
		sub	dx, ax

loc_58B41:				; CODE XREF: Render_DitheredLineSpanVariant_58AFA+41j
		shl	bx, 1
		add	bx, word_7083A
		add	di, ss:[bx]
		mov	dx, word_70844
		or	cx, cx
		jle	short loc_58B94

loc_58B52:				; CODE XREF: Render_DitheredLineSpanVariant_58AFA+61j
		mov	al, cs:[si]
		dec	si
		mov	es:[di], al
		add	di, dx
		loop	loc_58B52
		jmp	short loc_58B94
; ���������������������������������������������������������������������������

loc_58B5F:				; CODE XREF: Render_DitheredLineSpanVariant_58AFA:loc_58B23j
		mov	ax, word_7083E
		sub	ax, bx
		js	short loc_58B6C
		add	si, ax
		sub	cx, ax
		add	bx, ax

loc_58B6C:				; CODE XREF: Render_DitheredLineSpanVariant_58AFA+6Aj
		mov	ax, dx
		sub	ax, word_70842
		jle	short loc_58B78
		sub	cx, ax
		sub	dx, ax

loc_58B78:				; CODE XREF: Render_DitheredLineSpanVariant_58AFA+78j
		shl	bx, 1
		add	bx, word_7083A
		add	di, ss:[bx]
		mov	dx, word_70844
		or	cx, cx
		jle	short loc_58B94

loc_58B89:				; CODE XREF: Render_DitheredLineSpanVariant_58AFA+98j
		mov	al, cs:[si]
		inc	si
		mov	es:[di], al
		add	di, dx
		loop	loc_58B89

loc_58B94:				; CODE XREF: Render_DitheredLineSpanVariant_58AFA+6j Render_DitheredLineSpanVariant_58AFA+Ej ...
		pop	di
		pop	si
		retn
Render_DitheredLineSpanVariant_58AFA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 298 lignes, NON DÉTAILLÉE — orchestre Render_DitheredLineSpan_58A7A et sa variante
; 58AFA. Référencée par sub_2E6CB (voisin de Camera_ComputeViewMatrix, seg065). Candidat pour
; session dédiée si le contexte de rendu 3D le justifie.
; ==============================================================================================
Render_DitheredLineMain_58B97	proc far		; CODE XREF: Camera_UpdateViewportClip:loc_2E6F2P

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
		mov	di, 3788h
		mov	cx, 3
		rep movsd
		mov	si, word_7083A
		mov	bx, word_7083E
		shl	bx, 1
		mov	ax, [bx+si+2]
		sub	ax, [bx+si]
		mov	word_70844, ax
		mov	di, [bx+si]
		add	di, word_7083C
		mov	[bp+var_2E], di
		mov	ax, word_70840
		sub	ax, word_7083C
		inc	ax
		mov	[bp+var_30], ax
		mov	ax, word_70842
		sub	ax, word_7083E
		inc	ax
		mov	[bp+var_32], ax
		mov	ax, [bp+arg_6]
		sub	ax, [bp+arg_2]
		cwde
		mov	[bp+var_8], eax
		jge	short loc_58BEC
		neg	ax

loc_58BEC:				; CODE XREF: Render_DitheredLineMain_58B97+51j
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		sub	ax, [bp+arg_8]
		cwde
		mov	[bp+var_C], eax
		jge	short loc_58BFF
		neg	ax

loc_58BFF:				; CODE XREF: Render_DitheredLineMain_58B97+64j
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		or	ax, [bp+var_4]
		jnz	short loc_58C0D
		jmp	loc_58DF9
; ���������������������������������������������������������������������������

loc_58C0D:				; CODE XREF: Render_DitheredLineMain_58B97+71j
		cmp	word ptr [bp+var_C], 0
		jnz	short loc_58C43
		movzx	ebx, word_70844
		shl	ebx, 8
		mov	ax, [bp+arg_4]
		sub	ax, word_7083E
		cwde
		imul	ebx

loc_58C29:
		test	word ptr [bp+var_8], 0FFFFh
		js	short loc_58C36
		neg	ebx
		neg	eax

loc_58C36:				; CODE XREF: Render_DitheredLineMain_58B97+97j
		neg	eax
		mov	[bp+var_20], ebx
		mov	[bp+var_24], eax
		jmp	short loc_58C7B
; ���������������������������������������������������������������������������

loc_58C43:				; CODE XREF: Render_DitheredLineMain_58B97+7Aj
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
		sub	ax, word_7083E
		cwde
		imul	[bp+var_20]
		sub	ecx, eax
		mov	[bp+var_24], ecx

loc_58C7B:				; CODE XREF: Render_DitheredLineMain_58B97+AAj
		mov	al, byte_70848
		mov	ah, al
		mov	dl, byte_70846
		mov	dh, dl
		test	word ptr [bp+var_C], 0FFFFh
		js	short loc_58C8E
		xchg	ax, dx

loc_58C8E:				; CODE XREF: Render_DitheredLineMain_58B97+F4j
		mov	[bp+var_26], ax
		mov	[bp+var_28], dx
		mov	es, word_70838
		assume es:seg000
		mov	di, [bp+var_2E]
		mov	si, [bp+var_32]
		mov	edx, [bp+var_24]

loc_58CA2:				; CODE XREF: Render_DitheredLineMain_58B97+152j
		push	di
		mov	bx, [bp+var_30]
		mov	eax, edx
		sar	eax, 8
		movzx	ecx, word_7083C
		sub	eax, ecx
		jl	short loc_58CCE
		mov	cx, bx
		cmp	eax, ecx
		jg	short loc_58CC1
		mov	cx, ax

loc_58CC1:				; CODE XREF: Render_DitheredLineMain_58B97+126j
		sub	bx, cx
		mov	ax, [bp+var_26]
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb

loc_58CCE:				; CODE XREF: Render_DitheredLineMain_58B97+11Fj
		or	bx, bx
		jle	short loc_58CDF
		mov	cx, bx
		mov	ax, [bp+var_28]
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb

loc_58CDF:				; CODE XREF: Render_DitheredLineMain_58B97+139j
		pop	di
		add	di, word_70844
		add	edx, [bp+var_20]
		dec	si
		jnz	short loc_58CA2
		mov	es, word_70838
		mov	ax, [bp+var_4]
		cmp	[bp+var_2], ax
		jl	short loc_58CFA
		jmp	loc_58D7A
; ���������������������������������������������������������������������������

loc_58CFA:				; CODE XREF: Render_DitheredLineMain_58B97+15Ej
		mov	eax, [bp+var_8]
		shl	eax, 8
		cdq
		idiv	[bp+var_C]
		mov	[bp+var_10], eax
		mov	ax, [bp+arg_4]
		sub	ax, word_7083E
		imul	word ptr [bp+var_8]
		idiv	word ptr [bp+var_C]
		cwde
		movsx	edx, [bp+arg_2]
		add	eax, edx

loc_58D23:
		shl	eax, 8

loc_58D27:
		mov	[bp+var_14], eax
		mov	si, word_7083E
		jmp	short loc_58D71
; ���������������������������������������������������������������������������

loc_58D31:				; CODE XREF: Render_DitheredLineMain_58B97+1DEj
		mov	edi, [bp+var_14]

loc_58D35:
		sar	edi, 8
		test	[bp+var_C+3], 80h
		jnz	short loc_58D56
		mov	bx, si
		mov	cx, di
		sub	cx, 18h
		mov	dx, di
		add	dx, 17h
		xor	ax, ax
		call	Render_DitheredLineSpan_58A7A
		jmp	short loc_58D68
; ���������������������������������������������������������������������������

loc_58D56:				; CODE XREF: Render_DitheredLineMain_58B97+1AAj
		mov	bx, si
		mov	cx, di
		sub	cx, 17h
		mov	dx, di
		add	dx, 18h
		mov	ax, 0FFFFh
		call	Render_DitheredLineSpan_58A7A

loc_58D68:				; CODE XREF: Render_DitheredLineMain_58B97+1BDj
		mov	eax, [bp+var_10]
		sub	[bp+var_14], eax
		inc	si

loc_58D71:				; CODE XREF: Render_DitheredLineMain_58B97+198j
		cmp	si, word_70842
		jle	short loc_58D31
		jmp	loc_58DF9
; ���������������������������������������������������������������������������

loc_58D7A:				; CODE XREF: Render_DitheredLineMain_58B97+160j
		mov	eax, [bp+var_C]
		shl	eax, 8
		cdq
		idiv	[bp+var_8]
		mov	[bp+var_10], eax
		mov	ax, [bp+arg_2]
		sub	ax, word_7083C
		imul	word ptr [bp+var_C]
		idiv	word ptr [bp+var_8]
		cwde
		movsx	edx, [bp+arg_4]
		add	eax, edx
		shl	eax, 8
		mov	[bp+var_14], eax
		mov	si, word_7083C
		jmp	short loc_58DF1
; ���������������������������������������������������������������������������

loc_58DB1:				; CODE XREF: Render_DitheredLineMain_58B97+260j
		mov	edi, [bp+var_14]
		shr	edi, 8
		test	[bp+var_8+3], 80h
		jnz	short loc_58DD6
		mov	bx, si
		mov	cx, di
		sub	cx, 18h
		mov	dx, di
		add	dx, 17h
		xor	ax, ax
		call	Render_DitheredLineSpanVariant_58AFA
		jmp	short loc_58DE8
; ���������������������������������������������������������������������������

loc_58DD6:				; CODE XREF: Render_DitheredLineMain_58B97+22Aj
		mov	bx, si
		mov	cx, di
		sub	cx, 17h
		mov	dx, di
		add	dx, 18h
		mov	ax, 0FFFFh
		call	Render_DitheredLineSpanVariant_58AFA

loc_58DE8:				; CODE XREF: Render_DitheredLineMain_58B97+23Dj
		mov	eax, [bp+var_10]
		sub	[bp+var_14], eax

loc_58DF0:
		inc	si

loc_58DF1:				; CODE XREF: Render_DitheredLineMain_58B97+218j
		cmp	word_70840, si
		jl	short loc_58DF9
		jmp	short loc_58DB1
; ���������������������������������������������������������������������������

loc_58DF9:				; CODE XREF: Render_DitheredLineMain_58B97+73j
					; Render_DitheredLineMain_58B97+1E0j ...
		pop	di
		pop	si
		leave
		retf
Render_DitheredLineMain_58B97	endp

seg119		ends

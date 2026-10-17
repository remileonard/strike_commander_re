ovr245		segment	para public 'OVERLAY' use16
		assume cs:ovr245
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C8230	proc far		; CODE XREF: sub_42F70J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+2Ch]
		mov	bx, [si+2Ah]
		mov	[bx], ax
		pop	si
		pop	bp
		retf
sub_C8230	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; InfoWidget_CopyFieldB_A4582 (sub_A4582 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, copie conditionnellement un champ (+0x20)
; vers un pointeur cible (+0x1E) si un flag (arg_8) est posé.
; ==============================================================================================
InfoWidget_CopyFieldB_C8242	proc far		; CODE XREF: sub_42F75J

arg_0		= word ptr  6
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	[bp+arg_8], 0
		jz	short loc_C8257
		mov	ax, [si+20h]
		mov	bx, [si+1Eh]
		mov	[bx], ax

loc_C8257:				; CODE XREF: InfoWidget_CopyFieldB_C8242+Bj
		pop	si
		pop	bp
		retf
InfoWidget_CopyFieldB_C8242	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C825A	proc far		; CODE XREF: sub_42F7AJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+2Ch]
		mov	bx, [si+2Ah]
		mov	[bx], ax
		pop	si
		pop	bp
		retf
sub_C825A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C826C	proc far		; CODE XREF: sub_42F7FJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	sub_F859
		add	sp, 2
		mov	al, [si+10h]
		shr	ax, 5
		and	ax, 1
		or	ax, ax
		jz	short loc_C82B9
		push	word ptr [si+2Eh]
		push	0
		mov	al, [si+22h]
		push	ax
		push	word ptr [si+20h]
		push	word ptr [si+1Eh]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	word_46F46
		call	Render_MeasureOrDrawTextString_32CD8
		add	sp, 0Ch
		jmp	short loc_C82E7
; ���������������������������������������������������������������������������

loc_C82B9:				; CODE XREF: sub_C826C+1Bj
		push	word ptr [si+28h]
		push	0
		mov	al, [si+22h]
		push	ax
		push	word ptr [si+20h]
		push	word ptr [si+1Eh]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	word_46F46
		call	Render_MeasureOrDrawTextString_32CD8
		add	sp, 0Ch

loc_C82E7:				; CODE XREF: sub_C826C+4Bj
		push	si
		call	sub_F878
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_C826C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C82F3	proc far		; CODE XREF: sub_42F84J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	0FFFFh
		push	0FFFFh
		push	word ptr [si+2Ch]
		push	word ptr [si+2Ah]
		mov	bx, [si+2Ah]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+0Ch]
		add	sp, 8
		pop	si
		pop	bp
		retf
sub_C82F3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C8313	proc far		; CODE XREF: sub_42F89J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	sub_F859
		add	sp, 2
		mov	al, [si+10h]
		shr	ax, 5
		and	ax, 1
		or	ax, ax
		jz	short loc_C8360
		push	word ptr [si+2Eh]
		push	0
		mov	al, [si+22h]
		push	ax
		push	word ptr [si+20h]
		push	word ptr [si+1Eh]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	word_46F46
		call	Render_MeasureOrDrawTextString_32CD8
		add	sp, 0Ch
		jmp	short loc_C838E
; ���������������������������������������������������������������������������

loc_C8360:				; CODE XREF: sub_C8313+1Bj
		push	word ptr [si+28h]
		push	0
		mov	al, [si+22h]
		push	ax
		push	word ptr [si+20h]
		push	word ptr [si+1Eh]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	word_46F46
		call	Render_MeasureOrDrawTextString_32CD8
		add	sp, 0Ch

loc_C838E:				; CODE XREF: sub_C8313+4Bj
		push	si
		call	sub_F878
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_C8313	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C839A	proc far		; CODE XREF: sub_42F8EJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	0FFFFh
		push	0FFFFh
		push	word ptr [si+2Ch]
		push	word ptr [si+2Ah]
		mov	bx, [si+2Ah]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+0Ch]
		add	sp, 8
		pop	si
		pop	bp
		retf
sub_C839A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C83BA	proc far		; CODE XREF: sub_42F93J

arg_0		= word ptr  6
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, 0FFFFh
		cmp	[bp+arg_6], 1
		jnz	short loc_C83D0
		mov	di, [si+2Ch]
		jmp	short loc_C83D3
; ���������������������������������������������������������������������������

loc_C83D0:				; CODE XREF: sub_C83BA+Fj
		mov	di, [si+30h]

loc_C83D3:				; CODE XREF: sub_C83BA+14j
		push	0FFFFh
		push	0FFFFh
		push	di
		push	word ptr [si+2Ah]
		mov	bx, [si+2Ah]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+0Ch]
		add	sp, 8
		pop	di
		pop	si
		pop	bp
		retf
sub_C83BA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C83EB	proc far		; CODE XREF: sub_42F98J

var_18		= word ptr -18h
var_16		= word ptr -16h
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+4]
		add	ax, [si+16h]
		add	ax, [si+18h]
		mov	[bp+var_2], ax
		mov	ax, [si+6]
		add	ax, [si+16h]
		add	ax, [si+18h]
		mov	[bp+var_4], ax
		mov	ax, [si+16h]
		add	ax, [si+18h]
		add	ax, [si+2Ah]
		mov	dl, [si+10h]
		shr	dx, 5
		and	dx, 1
		add	ax, dx
		mov	[bp+var_6], ax
		mov	ax, [si+16h]
		add	ax, [si+18h]
		mov	dl, [si+10h]
		shr	dx, 5
		and	dx, 1
		add	ax, dx
		mov	[bp+var_8], ax
		mov	ax, word_45B54
		add	ax, 2
		mov	[bp+var_A], ax
		mov	[bp+var_18], 0
		mov	[bp+var_16], 0
		push	[bp+var_A]
		lea	ax, [bp+var_18]
		push	ax
		call	TextFormat_ApplyStyleAttribute_2E9A4
		add	sp, 4
		push	si
		mov	ax, word_45B54
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_2E9A4
		add	sp, 4
		push	si
		call	sub_F859
		add	sp, 2
		mov	al, [si+10h]
		shr	ax, 5
		and	ax, 1
		or	ax, ax
		jz	short loc_C84B0
		push	word ptr [si+34h]
		push	0
		mov	al, [si+22h]
		push	ax
		push	word ptr [si+20h]
		push	word ptr [si+1Eh]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	word_46F46
		call	Render_MeasureOrDrawTextString_32CD8
		add	sp, 0Ch
		jmp	short loc_C84DE
; ���������������������������������������������������������������������������

loc_C84B0:				; CODE XREF: sub_C83EB+93j
		push	word ptr [si+28h]
		push	0
		mov	al, [si+22h]
		push	ax
		push	word ptr [si+20h]
		push	word ptr [si+1Eh]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	word_46F46
		call	Render_MeasureOrDrawTextString_32CD8
		add	sp, 0Ch

loc_C84DE:				; CODE XREF: sub_C83EB+C3j
		push	word_45B54
		push	0FFh
		mov	ax, [si+2Eh]
		add	ax, [si+28h]
		push	ax
		push	[bp+var_8]
		push	[bp+var_6]
		call	PaletteScreen_DispatchWidgetLayoutB_11363
		add	sp, 0Ah
		push	si
		call	sub_F878
		add	sp, 2
		lea	ax, [bp+var_18]
		push	ax
		mov	ax, word_45B54
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_2E9A4
		add	sp, 4
		lea	ax, [bp+var_18]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		pop	si
		leave
		retf
sub_C83EB	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C8525	proc far		; CODE XREF: sub_42F9DJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	0FFFFh
		push	0FFFFh
		push	word ptr [si+32h]
		push	word ptr [si+30h]
		mov	bx, [si+30h]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+0Ch]
		add	sp, 8
		pop	si
		pop	bp
		retf
sub_C8525	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C8545	proc far		; CODE XREF: sub_42FA2J

arg_0		= word ptr  6
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, 0FFFFh
		cmp	[bp+arg_6], 1
		jnz	short loc_C855B
		mov	di, [si+32h]
		jmp	short loc_C855E
; ���������������������������������������������������������������������������

loc_C855B:				; CODE XREF: sub_C8545+Fj
		mov	di, [si+36h]

loc_C855E:				; CODE XREF: sub_C8545+14j
		push	0FFFFh
		push	0FFFFh
		push	di
		push	word ptr [si+30h]
		mov	bx, [si+30h]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+0Ch]
		add	sp, 8
		pop	di
		pop	si
		pop	bp
		retf
sub_C8545	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C8576	proc far		; CODE XREF: sub_42FA7J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	sub_101C8
		add	sp, 2
		push	word ptr [si+2Eh]
		push	si
		call	sub_10142
		add	sp, 4
		pop	si
		pop	bp
		retf
sub_C8576	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C8595	proc far		; CODE XREF: sub_42FACJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2Ch], 0
		jge	short loc_C85B6
		mov	bx, [si+2Ah]
		mov	ax, [bx]
		cmp	ax, [si+2Eh]
		jle	short loc_C85B4
		mov	ax, [si+2Ch]
		mov	bx, [si+2Ah]
		add	[bx], ax

loc_C85B4:				; CODE XREF: sub_C8595+15j
		jmp	short loc_C85C8
; ���������������������������������������������������������������������������

loc_C85B6:				; CODE XREF: sub_C8595+Bj
		mov	bx, [si+2Ah]
		mov	ax, [bx]
		cmp	ax, [si+30h]
		jge	short loc_C85C8
		mov	ax, [si+2Ch]
		mov	bx, [si+2Ah]
		add	[bx], ax

loc_C85C8:				; CODE XREF: sub_C8595:loc_C85B4j
					; sub_C8595+29j
		pop	si
		pop	bp
		retf
sub_C8595	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; InfoWidget_Method_DispatchField2A_A4843 (sub_A4843 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, dispatch vtable via champ
; [si+0x2A].
; ==============================================================================================
InfoWidget_Method_DispatchField2A_C85CB	proc far		; CODE XREF: sub_42FB1J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		call	dword ptr [si+2Ah]
		pop	si
		pop	bp
		retf
InfoWidget_Method_DispatchField2A_C85CB	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C85D8	proc far		; CODE XREF: sub_42FB6J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	bx, [si+2Ah]
		mov	ax, [bx]
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	bx, [si+2Ah]
		mov	[bx], ax
		pop	si
		pop	bp
		retf
sub_C85D8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C85F1	proc far		; CODE XREF: sub_42FBBJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, [si+10h]
		shr	ax, 5
		and	ax, 1
		or	ax, ax
		jz	short loc_C860F
		mov	ax, [si+2Ch]
		mov	bx, [si+2Ah]
		mov	[bx], ax
		jmp	short loc_C8617
; ���������������������������������������������������������������������������

loc_C860F:				; CODE XREF: sub_C85F1+12j
		mov	ax, [si+2Eh]
		mov	bx, [si+2Ah]
		mov	[bx], ax

loc_C8617:				; CODE XREF: sub_C85F1+1Cj
		pop	si
		pop	bp
		retf
sub_C85F1	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C861A	proc far		; CODE XREF: sub_42FC0J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	word_45B08
		push	si
		call	sub_10531
		add	sp, 4
		push	word_45AE0
		push	si
		call	sub_104D8
		add	sp, 4
		push	word_45AE0
		mov	ax, [si+1Ch]
		add	ax, 0FFFCh
		push	ax
		push	8
		push	2
		push	3
		push	si
		call	sub_1058A
		add	sp, 0Ch
		mov	di, word_45B04
		mov	bx, [si+1Eh]
		cmp	byte ptr [bx], 0
		jz	short loc_C86CE
		mov	di, word_45AE0
		push	word_45AFE
		mov	ax, [si+1Ch]
		add	ax, 0FFFDh
		push	ax
		push	9
		push	2
		push	3
		push	si
		call	sub_1067C
		add	sp, 0Ch
		push	word_45AFE
		mov	ax, [si+1Ch]
		add	ax, 0FFFDh
		push	ax
		push	0Ah
		push	2
		push	4
		push	si
		call	sub_1067C
		add	sp, 0Ch
		push	word_45AFE
		mov	ax, [si+1Ch]
		add	ax, 0FFFDh
		push	ax
		push	3
		push	2
		push	9
		push	si
		call	sub_1067C
		add	sp, 0Ch
		push	word_45AFE
		mov	ax, [si+1Ch]
		add	ax, 0FFFDh
		push	ax
		push	4
		push	2
		push	0Ah
		push	si
		call	sub_1067C
		add	sp, 0Ch

loc_C86CE:				; CODE XREF: sub_C861A+46j
		push	si
		call	sub_F859
		add	sp, 2
		push	word_45B54
		push	di
		push	word ptr [si+20h]
		mov	ax, [si+6]
		add	ax, 2
		push	ax
		mov	ax, [si+4]
		add	ax, 0Dh
		push	ax
		call	PaletteScreen_DispatchWidgetLayoutB_11363
		add	sp, 0Ah
		push	si
		call	sub_F878
		add	sp, 2
		pop	di
		pop	si
		pop	bp
		retf
sub_C861A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C8702	proc far		; CODE XREF: sub_42FC5J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	bx, [si+1Eh]
		cmp	byte ptr [bx], 0
		jz	short loc_C8719
		mov	bx, [si+1Eh]
		mov	byte ptr [bx], 0
		jmp	short loc_C871F
; ���������������������������������������������������������������������������

loc_C8719:				; CODE XREF: sub_C8702+Dj
		mov	bx, [si+1Eh]
		mov	byte ptr [bx], 1

loc_C871F:				; CODE XREF: sub_C8702+15j
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+18h]
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_C8702	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C872C	proc far		; CODE XREF: sub_42FCAJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	sub_F859
		add	sp, 2
		mov	bx, [si+1Eh]
		cmp	byte ptr [bx], 0
		jz	short loc_C8774
		push	word ptr [si+2Ch]
		push	0
		mov	al, [si+24h]
		push	ax
		push	word ptr [si+22h]
		push	word ptr [si+20h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	word_46F46
		call	Render_MeasureOrDrawTextString_32CD8
		add	sp, 0Ch
		jmp	short loc_C87A2
; ���������������������������������������������������������������������������

loc_C8774:				; CODE XREF: sub_C872C+16j
		push	word ptr [si+2Ah]
		push	0
		mov	al, [si+24h]
		push	ax
		push	word ptr [si+22h]
		push	word ptr [si+20h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	word_46F46
		call	Render_MeasureOrDrawTextString_32CD8
		add	sp, 0Ch

loc_C87A2:				; CODE XREF: sub_C872C+46j
		push	si
		call	sub_F878
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_C872C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C87AE	proc far		; CODE XREF: sub_42FCFJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	bx, [si+1Eh]
		cmp	byte ptr [bx], 0
		jz	short loc_C87C5
		mov	bx, [si+1Eh]
		mov	byte ptr [bx], 0
		jmp	short loc_C87CB
; ���������������������������������������������������������������������������

loc_C87C5:				; CODE XREF: sub_C87AE+Dj
		mov	bx, [si+1Eh]
		mov	byte ptr [bx], 1

loc_C87CB:				; CODE XREF: sub_C87AE+15j
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+18h]
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_C87AE	endp

ovr245		ends

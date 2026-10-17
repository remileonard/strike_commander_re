ovr218		segment	para public 'OVERLAY' use16
		assume cs:ovr218
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C23B0	proc far		; CODE XREF: sub_42940J sub_C2500+51p

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+24h], ax
		push	31h ; '1'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jz	short loc_C23DB
		push	di
		call	sub_25718
		add	sp, 2
		mov	ax, di
		jmp	short loc_C23DD
; ���������������������������������������������������������������������������

loc_C23DB:				; CODE XREF: sub_C23B0+1Cj
		mov	ax, di

loc_C23DD:				; CODE XREF: sub_C23B0+29j
		mov	[si+26h], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+28h]
		add	sp, 2
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		add	sp, 2
		pop	di
		pop	si
		pop	bp
		retf
sub_C23B0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C23F6	proc far		; CODE XREF: sub_42945J

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
		mov	ax, [bp+arg_2]
		mov	[si+24h], ax
		push	31h ; '1'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_2], ax
		or	ax, ax
		jz	short loc_C2428
		push	[bp+var_2]
		call	sub_25718
		add	sp, 2
		mov	ax, [bp+var_2]
		jmp	short loc_C242B
; ���������������������������������������������������������������������������

loc_C2428:				; CODE XREF: sub_C23F6+20j
		mov	ax, [bp+var_2]

loc_C242B:				; CODE XREF: sub_C23F6+30j
		mov	[si+26h], ax
		cmp	word ptr [si+26h], 0
		jz	short loc_C2462
		mov	ax, si
		add	ax, 12h
		mov	di, ax
		mov	eax, [di]
		mov	bx, [si+26h]
		mov	[bx+24h], eax
		mov	eax, [di+4]
		mov	bx, [si+26h]
		mov	[bx+28h], eax
		mov	eax, [di+8]
		mov	bx, [si+26h]
		mov	[bx+2Ch], eax
		mov	bx, [si+26h]
		or	byte ptr [bx+30h], 1

loc_C2462:				; CODE XREF: sub_C23F6+3Cj
		mov	ax, [si+24h]
		add	ax, 12h
		mov	[bp+var_4], ax
		mov	bx, [bp+var_4]
		mov	eax, [bx]
		sub	[si+12h], eax
		mov	bx, [bp+var_4]
		mov	eax, [bx+4]
		sub	[si+16h], eax
		mov	bx, [bp+var_4]
		mov	eax, [bx+8]
		sub	[si+1Ah], eax
		push	word ptr [si+24h]
		mov	bx, [si+24h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		add	sp, 2
		push	ax
		mov	ax, si
		add	ax, 12h
		push	ax
		call	Matrix_WorldToLocal_272D3
		add	sp, 4
		cmp	word ptr [si+1Eh], 0
		jz	short loc_C24B9
		push	word ptr [si+1Eh]
		call	sub_20E68
		add	sp, 2

loc_C24B9:				; CODE XREF: sub_C23F6+B6j
		pop	di
		pop	si
		leave
		retf
sub_C23F6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C24BD	proc far		; CODE XREF: sub_4294AJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		call	sub_21381
		add	sp, 2
		mov	di, ax
		mov	eax, [di]
		mov	[si+12h], eax
		mov	eax, [di+4]
		mov	[si+16h], eax
		mov	eax, [di+8]
		mov	[si+1Ah], eax
		push	word ptr [si+26h]
		call	sub_308
		add	sp, 2
		mov	word ptr [si+26h], 0
		mov	word ptr [si+24h], 0
		pop	di
		pop	si
		pop	bp
		retf
sub_C24BD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C2500	proc far		; CODE XREF: sub_4294FJ

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+1Eh], 0
		jnz	short loc_C2540
		push	0Fh
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jz	short loc_C253B
		push	di
		call	sub_C7A3
		add	sp, 2
		mov	word ptr [di+9], 0
		xor	ax, ax
		mov	[di+0Dh], ax
		mov	[di+0Bh], ax
		mov	ax, di
		jmp	short loc_C253D
; ���������������������������������������������������������������������������

loc_C253B:				; CODE XREF: sub_C2500+1Fj
		mov	ax, di

loc_C253D:				; CODE XREF: sub_C2500+39j
		mov	[si+1Eh], ax

loc_C2540:				; CODE XREF: sub_C2500+Fj
		cmp	word ptr [si+1Eh], 0
		jz	short loc_C2574
		mov	bx, [bp+arg_2]
		mov	[bx+24h], si
		push	si
		push	[bp+arg_2]
		push	cs
		call	near ptr sub_C23B0
		add	sp, 4
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		push	[bp+var_2]
		push	word ptr [si+1Eh]
		call	List_AppendTail_20D45
		add	sp, 4
		push	si
		call	sub_212BA
		add	sp, 2

loc_C2574:				; CODE XREF: sub_C2500+44j
		pop	di
		pop	si
		leave
		retf
sub_C2500	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Debris_ContainerOpWrapper_9B62B (sub_9B62B de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, appelle une opération de conteneur
; (Container_RemoveAndDeleteObject_22DE5).
; ==============================================================================================
Debris_ContainerOpWrapper_C2578	proc far		; CODE XREF: sub_42954J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+1Eh], 0
		jz	short loc_C2593
		push	[bp+arg_2]
		push	word ptr [si+1Eh]
		call	sub_20F26
		add	sp, 4

loc_C2593:				; CODE XREF: Debris_ContainerOpWrapper_C2578+Bj
		pop	si
		pop	bp
		retf
Debris_ContainerOpWrapper_C2578	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C2596	proc far		; CODE XREF: sub_42959J

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		push	[bp+arg_2]
		mov	bx, [bp+arg_2]
		mov	bx, [bx]
		call	dword ptr [bx+20h]
		add	sp, 4
		cmp	word ptr [si+1Eh], 0
		jnz	short loc_C25E5
		push	0Fh
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jz	short loc_C25E0
		push	di
		call	sub_C7A3
		add	sp, 2
		mov	word ptr [di+9], 0
		xor	ax, ax
		mov	[di+0Dh], ax
		mov	[di+0Bh], ax
		mov	ax, di
		jmp	short loc_C25E2
; ���������������������������������������������������������������������������

loc_C25E0:				; CODE XREF: sub_C2596+2Ej
		mov	ax, di

loc_C25E2:				; CODE XREF: sub_C2596+48j
		mov	[si+1Eh], ax

loc_C25E5:				; CODE XREF: sub_C2596+1Ej
		cmp	word ptr [si+1Eh], 0
		jz	short loc_C25FF
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		push	[bp+var_2]
		push	word ptr [si+1Eh]
		call	List_AppendTail_20D45
		add	sp, 4

loc_C25FF:				; CODE XREF: sub_C2596+53j
		push	[bp+arg_2]
		push	[bp+arg_4]
		call	sub_203CD
		add	sp, 4
		push	si
		call	sub_212BA
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
sub_C2596	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C261A	proc far		; CODE XREF: sub_4295EJ

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		mov	bx, [di]
		call	dword ptr [bx+24h]
		add	sp, 2
		push	di
		push	[bp+arg_4]
		call	sub_1FEED
		add	sp, 4
		cmp	word ptr [si+1Eh], 0
		jz	short loc_C264C
		push	di
		push	word ptr [si+1Eh]
		call	sub_21043
		add	sp, 4

loc_C264C:				; CODE XREF: sub_C261A+24j
		pop	di
		pop	si
		pop	bp
		retf
sub_C261A	endp

ovr218		ends

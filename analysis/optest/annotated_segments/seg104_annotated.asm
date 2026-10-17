seg104		segment	byte public 'CODE' use16
		assume cs:seg104
		;org 0Ch
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_2FDCC	proc far		; CODE XREF: sub_449C+38P
					; sub_449C+125P ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp

loc_2FDCD:				; DATA XREF: seg170:0416o
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	di, di
		jz	short loc_2FDF0
		mov	ax, [si+2]
		mov	[di+2],	ax
		mov	[si+2],	di
		cmp	word ptr [si+4], 0
		jnz	short loc_2FDF0
		mov	ax, [si+2]
		mov	[si+4],	ax

loc_2FDF0:				; CODE XREF: sub_2FDCC+Dj
					; sub_2FDCC+1Cj
		pop	di
		pop	si
		pop	bp
		retf
sub_2FDCC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; LinkedListB_InsertAtTail_5F57F (sub_5F57F de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, insère un nœud en queue de la même structure
; de liste. Référencée par sub_1F4BB et sub_2387E.
; ==============================================================================================
LinkedListB_InsertAtTail_2FDF4	proc far		; CODE XREF: sub_34F6+46P sub_409A+4DP ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		or	dx, dx
		jz	short loc_2FE16
		cmp	word ptr [si+4], 0
		jz	short loc_2FE10
		mov	bx, [si+4]
		mov	[bx+2],	dx
		jmp	short loc_2FE13
; ���������������������������������������������������������������������������

loc_2FE10:				; CODE XREF: LinkedListB_InsertAtTail_2FDF4+12j
		mov	[si+2],	dx

loc_2FE13:				; CODE XREF: LinkedListB_InsertAtTail_2FDF4+1Aj
		mov	[si+4],	dx

loc_2FE16:				; CODE XREF: LinkedListB_InsertAtTail_2FDF4+Cj
		pop	si
		pop	bp
		retf
LinkedListB_InsertAtTail_2FDF4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; LinkedListB_FindAndDispatch_5F5A4 (sub_5F5A4 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, recherche un nœud (sub_5F604) puis dispatch
; vtable [bx] si trouvé.
; ==============================================================================================
LinkedListB_FindAndDispatch_2FE19	proc far		; CODE XREF: seg002:0091P sub_358C+17P ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+arg_0]
		mov	si, [bp+arg_2]
		push	[bp+arg_4]
		push	si
		push	ax
		nop
		push	cs
		call	near ptr LinkedListB_FindByKey_2FE79
		add	sp, 6
		or	si, si
		jz	short loc_2FE40
		push	3
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short $+2

loc_2FE40:				; CODE XREF: LinkedListB_FindAndDispatch_2FE19+19j
		pop	si
		pop	bp
		retf
LinkedListB_FindAndDispatch_2FE19	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		mov	dx, [bp+0Ah]
		or	di, di
		jz	short loc_2FE75
		or	dx, dx
		jz	short loc_2FE75
		cmp	[si+4],	di
		jz	short loc_2FE68
		mov	ax, [di+2]
		mov	bx, dx
		mov	[bx+2],	ax
		jmp	short loc_2FE72
; ���������������������������������������������������������������������������

loc_2FE68:				; CODE XREF: seg104:009Cj
		mov	[si+4],	dx
		mov	bx, dx
		mov	word ptr [bx+2], 0

loc_2FE72:				; CODE XREF: seg104:00A6j
		mov	[di+2],	dx

loc_2FE75:				; CODE XREF: seg104:0093j seg104:0097j
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; LinkedListB_FindByKey_5F604 (sub_5F604 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, recherche un nœud par clé (cx) en parcourant
; la liste (champ +2). Appelée par LinkedListB_FindAndDispatch_5F5A4.
; ==============================================================================================
LinkedListB_FindByKey_2FE79	proc far		; CODE XREF: sub_449C+2CP
					; LinkedListB_FindAndDispatch_2FE19+11p

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	cx, [bp+arg_2]
		mov	di, [bp+arg_4]
		or	di, di
		jnz	short loc_2FEA3
		mov	dx, [si+2]
		jmp	short loc_2FE97
; ���������������������������������������������������������������������������

loc_2FE90:				; CODE XREF: LinkedListB_FindByKey_2FE79+24j
		mov	di, dx
		mov	bx, dx
		mov	dx, [bx+2]

loc_2FE97:				; CODE XREF: LinkedListB_FindByKey_2FE79+15j
		or	dx, dx
		jz	short loc_2FE9F
		cmp	dx, cx
		jnz	short loc_2FE90

loc_2FE9F:				; CODE XREF: LinkedListB_FindByKey_2FE79+20j
		or	dx, dx
		jz	short loc_2FEDC

loc_2FEA3:				; CODE XREF: LinkedListB_FindByKey_2FE79+10j
		or	di, di
		jnz	short loc_2FEBD
		mov	bx, [si+2]
		mov	ax, [bx+2]
		mov	[si+2],	ax
		cmp	word ptr [si+2], 0
		jnz	short loc_2FEDC
		mov	word ptr [si+4], 0
		jmp	short loc_2FEDC
; ���������������������������������������������������������������������������

loc_2FEBD:				; CODE XREF: LinkedListB_FindByKey_2FE79+2Cj
		cmp	[si+4],	cx
		jz	short loc_2FED4
		mov	bx, cx
		mov	ax, [bx+2]
		mov	[di+2],	ax
		cmp	[si+2],	cx
		jnz	short loc_2FEDC
		mov	[si+2],	ax
		jmp	short loc_2FEDC
; ���������������������������������������������������������������������������

loc_2FED4:				; CODE XREF: LinkedListB_FindByKey_2FE79+47j
		mov	[si+4],	di
		mov	word ptr [di+2], 0

loc_2FEDC:				; CODE XREF: LinkedListB_FindByKey_2FE79+28j
					; LinkedListB_FindByKey_2FE79+3Bj ...
		pop	di
		pop	si
		pop	bp
		retf
LinkedListB_FindByKey_2FE79	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_2FEE0	proc far		; CODE XREF: seg001:0357P seg001:03CFP ...

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		jmp	short loc_2FF0D
; ���������������������������������������������������������������������������

loc_2FEEC:				; CODE XREF: sub_2FEE0+31j
		mov	bx, [si+2]
		mov	ax, [bx+2]
		mov	[bp+var_2], ax
		cmp	word ptr [si+2], 0
		jz	short loc_2FF07
		push	3
		push	bx
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short $+2

loc_2FF07:				; CODE XREF: sub_2FEE0+19j
		mov	ax, [bp+var_2]
		mov	[si+2],	ax

loc_2FF0D:				; CODE XREF: sub_2FEE0+Aj
		cmp	word ptr [si+2], 0
		jnz	short loc_2FEEC
		xor	ax, ax
		mov	[si+4],	ax
		mov	[si+2],	ax
		pop	si
		leave
		retf
sub_2FEE0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_2FF1E	proc far		; CODE XREF: seg002:006EP sub_358C+29P ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word ptr [di], 0
		jnz	short loc_2FF33
		mov	ax, [si+2]
		jmp	short loc_2FF38
; ���������������������������������������������������������������������������

loc_2FF33:				; CODE XREF: sub_2FF1E+Ej
		mov	bx, [di]
		mov	ax, [bx+2]

loc_2FF38:				; CODE XREF: sub_2FF1E+13j
		mov	[di], ax
		cmp	word ptr [di], 0
		jz	short loc_2FF44
		mov	ax, 1
		jmp	short loc_2FF46
; ���������������������������������������������������������������������������

loc_2FF44:				; CODE XREF: sub_2FF1E+1Fj
		xor	ax, ax

loc_2FF46:				; CODE XREF: sub_2FF1E+24j
		pop	di
		pop	si
		pop	bp
		retf
sub_2FF1E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; LinkedListB_Helper_5F6D5 (sub_5F6D5 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, aucun appel externe visible (rôle exact non détaillé).
; ==============================================================================================
LinkedListB_Helper_2FF4A	proc far		; CODE XREF: sub_1D80D+4AP

var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_4], 0
		jmp	short loc_2FF62
; ���������������������������������������������������������������������������

loc_2FF5E:				; CODE XREF: LinkedListB_Helper_2FF4A+1Dj
		inc	[bp+var_4]

loc_2FF62:				; CODE XREF: LinkedListB_Helper_2FF4A+12j
		mov	si, [si+2]
		or	si, si
		jnz	short loc_2FF5E
		mov	eax, [bp+var_4]
		shld	edx, eax, 10h
		pop	si
		leave
		retf
LinkedListB_Helper_2FF4A	endp

seg104		ends

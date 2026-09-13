seg444		segment	para public 'OVERLAY' use16
		assume cs:seg444
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue (sub_658, 0x35 octets) si besoin, initialise via sub_6C76C (stub voisin), pose
; un tag (0x2E82) et remet à zéro plusieurs champs (+0x1E/+0x20/+0x22/+0x34) — constructeur de
; base d'un widget jauge/indicateur.
; ==============================================================================================
GaugeWidget_Construct_A2DF0	proc far		; CODE XREF: VROOMM_StubThunk_6C90FJ GaugeWidgetVariantA_ConstructAndInit_A34CA+21p	...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_A2E09
		push	35h ; '5'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_A2E34

loc_A2E09:				; CODE XREF: GaugeWidget_Construct_A2DF0+9j
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		call	VROOMM_StubThunk_6C76C
		add	sp, 0Ah
		mov	word ptr [si+0Eh], 2E82h
		xor	ax, ax
		mov	[si+20h], ax
		mov	[si+1Eh], ax
		mov	word ptr [si+22h], 0
		mov	byte ptr [si+34h], 0

loc_A2E34:				; CODE XREF: GaugeWidget_Construct_A2DF0+17j
		mov	ax, si
		pop	si
		pop	bp
		retf
GaugeWidget_Construct_A2DF0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle GaugeWidget_ReleaseListNode_A2ED3, libère un style
; (TextFormat_ReleaseStyleList_5E526, seg143) et l'objet (sub_338).
; ==============================================================================================
GaugeWidget_Destruct_A2E39	proc far		; CODE XREF: VROOMM_StubThunk_6C914J GaugeWidget_RebuildAndRelease_A36BD+A9p

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_A2E68
		mov	word ptr [si+0Eh], 2E82h
		push	si
		nop
		push	cs
		call	near ptr GaugeWidget_ReleaseListNode_A2ED3
		pop	cx

loc_A2E54:
		push	si

loc_A2E55:
		call	TextFormat_ReleaseStyleList_5E526
		pop	cx

loc_A2E5B:
		test	di, 1
		jz	short loc_A2E68
		push	si

loc_A2E62:
		call	CRT_FreeNear_Wrap
		pop	cx

loc_A2E68:				; CODE XREF: GaugeWidget_Destruct_A2E39+Dj
					; GaugeWidget_Destruct_A2E39+26j
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidget_Destruct_A2E39	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle GaugeWidget_GetNthListItem_A2E95 avec index 0.
; ==============================================================================================
GaugeWidget_GetFirstListItem_A2E6C	proc far		; CODE XREF: VROOMM_StubThunk_6C919J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	byte ptr [si+34h], 1
		push	0
		jmp	short loc_A2E82
; ���������������������������������������������������������������������������

loc_A2E7C:				; CODE XREF: GaugeWidget_GetFirstListItem_A2E6C+23j
		and	byte ptr [di+10h], 0FBh
		push	1

loc_A2E82:				; CODE XREF: GaugeWidget_GetFirstListItem_A2E6C+Ej
		push	si
		nop
		push	cs
		call	near ptr GaugeWidget_GetNthListItem_A2E95
		add	sp, 4
		mov	di, ax
		or	di, di
		jnz	short loc_A2E7C
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidget_GetFirstListItem_A2E6C	endp ; sp = -2


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, parcourt une liste chaînée (champ +0x24, next-ptr à +2) N fois et retourne la valeur du
; nœud atteint — accesseur de liste indexée, motif similaire à IndexedRecordReader (seg196).
; ==============================================================================================
GaugeWidget_GetNthListItem_A2E95	proc far		; CODE XREF: VROOMM_StubThunk_6C8B0J GaugeWidget_GetFirstListItem_A2E6C+19p	...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		or	dx, dx
		jnz	short loc_A2EB4

loc_A2EA3:
		mov	ax, [si+1Eh]
		mov	[si+24h], ax
		jmp	short loc_A2EC1
; ���������������������������������������������������������������������������

loc_A2EAB:				; CODE XREF: GaugeWidget_GetNthListItem_A2E95+2Aj
		mov	bx, [si+24h]
		mov	ax, [bx+2]

loc_A2EB1:
		mov	[si+24h], ax

loc_A2EB4:				; CODE XREF: GaugeWidget_GetNthListItem_A2E95+Cj
		cmp	word ptr [si+24h], 0
		jz	short loc_A2EC1
		mov	ax, dx
		dec	dx
		or	ax, ax
		jnz	short loc_A2EAB

loc_A2EC1:				; CODE XREF: GaugeWidget_GetNthListItem_A2E95+14j
					; GaugeWidget_GetNthListItem_A2E95+23j
		cmp	word ptr [si+24h], 0
		jnz	short loc_A2ECB
		xor	ax, ax
		jmp	short loc_A2ED0
; ���������������������������������������������������������������������������

loc_A2ECB:				; CODE XREF: GaugeWidget_GetNthListItem_A2E95+30j
		mov	bx, [si+24h]
		mov	ax, [bx]

loc_A2ED0:				; CODE XREF: GaugeWidget_GetNthListItem_A2E95+34j
		pop	si
		pop	bp
		retf
GaugeWidget_GetNthListItem_A2E95	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, dispatch vtable [bx+0x30] puis libère (sub_338) — libération d'un nœud de la liste du
; widget.
; ==============================================================================================
GaugeWidget_ReleaseListNode_A2ED3	proc far		; CODE XREF: VROOMM_StubThunk_6C8F1J GaugeWidget_Destruct_A2E39+17p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		jmp	short loc_A2F03
; ���������������������������������������������������������������������������

loc_A2EDD:				; CODE XREF: GaugeWidget_ReleaseListNode_A2ED3+34j
		mov	di, [si+1Eh]
		cmp	word ptr [di], 0
		jz	short loc_A2EF6
		push	3
		push	word ptr [di]
		mov	bx, [di]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+30h]
		add	sp, 4
		jmp	short $+2

loc_A2EF6:				; CODE XREF: GaugeWidget_ReleaseListNode_A2ED3+10j
		mov	ax, [di+2]
		mov	[si+1Eh], ax
		push	di
		call	CRT_FreeNear_Wrap
		pop	cx

loc_A2F03:				; CODE XREF: GaugeWidget_ReleaseListNode_A2ED3+8j
		cmp	word ptr [si+1Eh], 0
		jnz	short loc_A2EDD
		xor	ax, ax
		mov	[si+20h], ax
		mov	[si+1Eh], ax
		mov	word ptr [si+22h], 0
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidget_ReleaseListNode_A2ED3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (rôle exact non détaillé, manipulation de champs internes).
; ==============================================================================================
GaugeWidget_Helper_A2F1A	proc far		; CODE XREF: VROOMM_StubThunk_6C8C9J

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_A2F6F
; ���������������������������������������������������������������������������

loc_A2F2C:				; CODE XREF: GaugeWidget_Helper_A2F1A:loc_A2F73j
		mov	[bp+var_2], 1
		mov	cx, [si+1Eh]
		mov	bx, cx
		mov	di, [bx+2]
		jmp	short loc_A2F6B
; ���������������������������������������������������������������������������

loc_A2F3B:				; CODE XREF: GaugeWidget_Helper_A2F1A+53j
		mov	bx, cx
		mov	bx, [bx]
		mov	al, [bx+15h]
		and	ax, 0Fh
		mov	bx, [di]
		mov	dl, [bx+15h]
		and	dx, 0Fh
		cmp	ax, dx
		jle	short loc_A2F66

loc_A2F51:
		mov	[bp+var_2], 0
		mov	bx, cx
		mov	ax, [bx]
		mov	[bp+var_4], ax
		mov	ax, [di]
		mov	[bx], ax
		mov	ax, [bp+var_4]
		mov	[di], ax

loc_A2F66:				; CODE XREF: GaugeWidget_Helper_A2F1A+35j
		mov	cx, di
		mov	di, [di+2]

loc_A2F6B:				; CODE XREF: GaugeWidget_Helper_A2F1A+1Fj
		or	di, di
		jnz	short loc_A2F3B

loc_A2F6F:				; CODE XREF: GaugeWidget_Helper_A2F1A+10j
		cmp	[bp+var_2], 0

loc_A2F73:
		jz	short loc_A2F2C
		pop	di
		pop	si

locret_A2F77:
		leave
		retf
GaugeWidget_Helper_A2F1A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (rôle exact non détaillé).
; ==============================================================================================
GaugeWidget_HelperB_A2F79	proc far		; CODE XREF: VROOMM_StubThunk_6C8CEJ

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2

loc_A2F7F:
		push	si
		mov	si, [bp+arg_0]

loc_A2F83:
		mov	si, [si+1Eh]
		jmp	short loc_A2FA8
; ���������������������������������������������������������������������������

loc_A2F88:				; CODE XREF: GaugeWidget_HelperB_A2F79+31j
		mov	bx, [si]
		mov	al, [bx+15h]
		and	ax, 0Fh
		cmp	ax, [bp+arg_2]
		jnz	short loc_A2FA5
		mov	ax, [bp+arg_4]
		mov	[bp+var_2], ax
		and	ax, 0Fh
		and	byte ptr [bx+15h], 0F0h
		or	[bx+15h], al

loc_A2FA5:				; CODE XREF: GaugeWidget_HelperB_A2F79+1Aj
		mov	si, [si+2]

loc_A2FA8:				; CODE XREF: GaugeWidget_HelperB_A2F79+Dj
		or	si, si
		jnz	short loc_A2F88
		pop	si
		leave
		retf
GaugeWidget_HelperB_A2F79	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (rôle exact non détaillé).
; ==============================================================================================
GaugeWidget_HelperC_A2FAF	proc far		; CODE XREF: VROOMM_StubThunk_6C8D3J

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4

loc_A2FB5:
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	cx, [bp+arg_4]
		mov	si, [si+1Eh]
		jmp	short loc_A2FF9
; ���������������������������������������������������������������������������

loc_A2FC4:				; CODE XREF: GaugeWidget_HelperC_A2FAF+4Cj
		mov	bx, [si]
		mov	al, [bx+15h]
		and	ax, 0Fh
		cmp	ax, dx
		jnz	short loc_A2FD8
		mov	[bp+var_2], cx
		mov	ax, [bp+var_2]
		jmp	short loc_A2FEA
; ���������������������������������������������������������������������������

loc_A2FD8:				; CODE XREF: GaugeWidget_HelperC_A2FAF+1Fj
		mov	bx, [si]
		mov	al, [bx+15h]
		and	ax, 0Fh
		cmp	ax, cx
		jnz	short loc_A2FF6
		mov	[bp+var_4], dx
		mov	ax, [bp+var_4]

loc_A2FEA:				; CODE XREF: GaugeWidget_HelperC_A2FAF+27j
		and	ax, 0Fh
		mov	bx, [si]
		and	byte ptr [bx+15h], 0F0h
		or	[bx+15h], al

loc_A2FF6:				; CODE XREF: GaugeWidget_HelperC_A2FAF+33j
		mov	si, [si+2]

loc_A2FF9:				; CODE XREF: GaugeWidget_HelperC_A2FAF+13j
		or	si, si
		jnz	short loc_A2FC4
		pop	si
		leave
		retf
GaugeWidget_HelperC_A2FAF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue un nœud de liste (sub_658).
; ==============================================================================================
GaugeWidget_AllocateListNode_A3000	proc far		; CODE XREF: VROOMM_StubThunk_6C8B5J GaugeWidget_InsertListNode_A312F+5Dp	...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	4
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	di, di
		jz	short loc_A3037
		mov	ax, [bp+arg_2]
		mov	[di], ax
		mov	word ptr [di+2], 0
		cmp	word ptr [si+1Eh], 0
		jnz	short loc_A302B
		mov	[si+1Eh], di
		jmp	short loc_A3031
; ���������������������������������������������������������������������������

loc_A302B:				; CODE XREF: GaugeWidget_AllocateListNode_A3000+24j
		mov	bx, [si+20h]
		mov	[bx+2],	di

loc_A3031:				; CODE XREF: GaugeWidget_AllocateListNode_A3000+29j
		mov	[si+20h], di
		inc	word ptr [si+22h]

loc_A3037:				; CODE XREF: GaugeWidget_AllocateListNode_A3000+14j
		mov	ax, di
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidget_AllocateListNode_A3000	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, variante d'allocation de nœud de liste (sub_658).
; ==============================================================================================
GaugeWidget_AllocateListNodeB_A303D	proc far		; CODE XREF: VROOMM_StubThunk_6C8BAJ GaugeWidget_InsertListNodeAtTail_A31C9+17p

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	4
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	di, di
		jz	short loc_A3064
		mov	ax, [bp+arg_2]
		mov	[di], ax
		mov	ax, [si+1Eh]
		mov	[di+2],	ax
		mov	[si+1Eh], di

loc_A3061:
		inc	word ptr [si+22h]

loc_A3064:				; CODE XREF: GaugeWidget_AllocateListNodeB_A303D+14j
		mov	ax, di
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidget_AllocateListNodeB_A303D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, libère un nœud (sub_338), rôle complémentaire à GaugeWidget_ReleaseListNode_A2ED3.
; ==============================================================================================
GaugeWidget_ReleaseListNodeB_A306A	proc far		; CODE XREF: VROOMM_StubThunk_6C8BFJ GaugeWidget_RemoveListNode_A30BF+16p	...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di

loc_A306F:
		mov	si, [bp+arg_0]
		xor	dx, dx
		mov	di, [si+1Eh]
		jmp	short loc_A30B5
; ���������������������������������������������������������������������������

loc_A3079:				; CODE XREF: GaugeWidget_ReleaseListNodeB_A306A+4Dj
		mov	ax, [di]
		cmp	ax, [bp+arg_2]
		jnz	short loc_A30AE
		or	dx, dx
		jz	short loc_A308C
		mov	ax, [di+2]
		mov	bx, dx
		mov	[bx+2],	ax

loc_A308C:				; CODE XREF: GaugeWidget_ReleaseListNodeB_A306A+18j
		cmp	[si+1Eh], di
		jnz	short loc_A3097

loc_A3091:
		mov	ax, [di+2]
		mov	[si+1Eh], ax

loc_A3097:				; CODE XREF: GaugeWidget_ReleaseListNodeB_A306A+25j
		cmp	[si+20h], di
		jnz	short loc_A309F
		mov	[si+20h], dx

loc_A309F:				; CODE XREF: GaugeWidget_ReleaseListNodeB_A306A+30j
		push	di

loc_A30A0:
		call	CRT_FreeNear_Wrap
		pop	cx

loc_A30A6:
		dec	word ptr [si+22h]

loc_A30A9:
		mov	ax, 1
		jmp	short loc_A30BB
; ���������������������������������������������������������������������������

loc_A30AE:				; CODE XREF: GaugeWidget_ReleaseListNodeB_A306A+14j
		mov	dx, di
		mov	bx, dx

loc_A30B2:
		mov	di, [bx+2]

loc_A30B5:				; CODE XREF: GaugeWidget_ReleaseListNodeB_A306A+Dj
		or	di, di
		jnz	short loc_A3079
		xor	ax, ax

loc_A30BB:				; CODE XREF: GaugeWidget_ReleaseListNodeB_A306A+42j
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidget_ReleaseListNodeB_A306A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, retire un nœud de la liste (GaugeWidget_ReleaseListNodeB_A306A).
; ==============================================================================================
GaugeWidget_RemoveListNode_A30BF	proc far		; CODE XREF: VROOMM_StubThunk_6C8C4J
					; GaugeWidget_ReleaseExtraAndNode_A41FA:loc_A4211p

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+4]
		pop	cx
		push	di
		push	si
		push	cs
		call	near ptr GaugeWidget_ReleaseListNodeB_A306A
		add	sp, 4
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidget_RemoveListNode_A30BF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (rôle exact non détaillé).
; ==============================================================================================
GaugeWidget_HelperD_A30DF	proc far		; CODE XREF: VROOMM_StubThunk_6C8DDJ

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		xor	cx, cx
		or	dx, dx
		jl	short loc_A3103
		cmp	[si+22h], dx
		jle	short loc_A3103
		mov	si, [si+1Eh]
		jmp	short loc_A30FD
; ���������������������������������������������������������������������������

loc_A30F9:				; CODE XREF: GaugeWidget_HelperD_A30DF+20j
		mov	si, [si+2]
		dec	dx

loc_A30FD:				; CODE XREF: GaugeWidget_HelperD_A30DF+18j
		or	dx, dx
		jnz	short loc_A30F9
		mov	cx, [si]

loc_A3103:				; CODE XREF: GaugeWidget_HelperD_A30DF+Ej
					; GaugeWidget_HelperD_A30DF+13j
		mov	ax, cx
		pop	si
		pop	bp
		retf
GaugeWidget_HelperD_A30DF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (rôle exact non détaillé).
; ==============================================================================================
GaugeWidget_HelperE_A3108	proc far		; CODE XREF: VROOMM_StubThunk_6C8E2J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		xor	dx, dx
		mov	si, [si+1Eh]
		jmp	short loc_A3125
; ���������������������������������������������������������������������������

loc_A3116:				; CODE XREF: GaugeWidget_HelperE_A3108+1Fj
		mov	ax, [si]
		cmp	ax, [bp+arg_2]
		jnz	short loc_A3121
		mov	ax, dx
		jmp	short loc_A312C
; ���������������������������������������������������������������������������

loc_A3121:				; CODE XREF: GaugeWidget_HelperE_A3108+13j
		mov	si, [si+2]
		inc	dx

loc_A3125:				; CODE XREF: GaugeWidget_HelperE_A3108+Cj
		or	si, si
		jnz	short loc_A3116
		mov	ax, 0FFFFh

loc_A312C:				; CODE XREF: GaugeWidget_HelperE_A3108+17j
		pop	si
		pop	bp
		retf
GaugeWidget_HelperE_A3108	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 70 lignes, NON DÉTAILLÉE — combine GaugeWidget_AllocateListNode_A3000 et
; manipulation de champs de liste chaînée — insertion d'un nœud.
; ==============================================================================================
GaugeWidget_InsertListNode_A312F	proc far		; CODE XREF: VROOMM_StubThunk_6C8D8J GaugeWidget_InsertAndAllocateExtra_A3BE6+12p

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[si+26h], di
		mov	ax, [di+4]
		mov	[si+28h], ax
		mov	ax, [di+6]
		mov	[si+2Ah], ax
		mov	ax, [di+8]
		inc	ax
		mov	[si+2Ch], ax
		mov	ax, [di+0Ah]
		inc	ax

loc_A3154:
		mov	[si+2Eh], ax
		mov	ax, [si+16h]
		add	ax, [si+18h]
		mov	dx, [si+1Ah]
		sub	dx, ax
		sub	dx, [si+2Ch]
		mov	[si+30h], dx
		mov	ax, [si+16h]
		add	ax, [si+18h]
		mov	dx, [si+1Ch]

loc_A3171:
		sub	dx, ax
		sub	dx, [si+2Eh]
		mov	[si+32h], dx
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	di
		mov	bx, [di+0Eh]

loc_A3183:
		call	dword ptr [bx+8]
		add	sp, 6
		push	di
		push	si
		push	cs
		call	near ptr GaugeWidget_AllocateListNode_A3000

loc_A318F:
		add	sp, 4
		mov	al, [si+10h]
		and	ax, 1
		or	ax, ax
		jz	short loc_A31A4
		push	di
		mov	bx, [di+0Eh]

loc_A31A0:
		call	dword ptr [bx+18h]
		pop	cx

loc_A31A4:				; CODE XREF: GaugeWidget_InsertListNode_A312F+6Bj
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidget_InsertListNode_A312F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine GaugeWidget_ReleaseListNodeB_A306A et GaugeWidget_AllocateListNode_A3000.
; ==============================================================================================
GaugeWidget_InsertListNodeAtHead_A31A8	proc far		; CODE XREF: VROOMM_StubThunk_6C8F6J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		push	si
		push	cs
		call	near ptr GaugeWidget_ReleaseListNodeB_A306A
		add	sp, 4
		push	di
		push	si
		push	cs
		call	near ptr GaugeWidget_AllocateListNode_A3000
		add	sp, 4
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidget_InsertListNodeAtHead_A31A8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine GaugeWidget_ReleaseListNodeB_A306A et GaugeWidget_AllocateListNodeB_A303D.
; ==============================================================================================
GaugeWidget_InsertListNodeAtTail_A31C9	proc far		; CODE XREF: VROOMM_StubThunk_6C8FBJ

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		push	si
		push	cs
		call	near ptr GaugeWidget_ReleaseListNodeB_A306A
		add	sp, 4
		push	di
		push	si
		push	cs
		call	near ptr GaugeWidget_AllocateListNodeB_A303D
		add	sp, 4
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidget_InsertListNodeAtTail_A31C9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, méthode virtuelle écrivant un champ (dispatch vtable), référencée via jmp depuis un
; stub VROOMM (sub_6C749).
; ==============================================================================================
GaugeWidget_Method_SetField_A31EA	proc far		; CODE XREF: VROOMM_StubThunk_6C900J

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [si+1Eh]
		jmp	short loc_A320D
; ���������������������������������������������������������������������������

loc_A31F7:				; CODE XREF: GaugeWidget_Method_SetField_A31EA+25j
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	word ptr [di]
		mov	bx, [di]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+8]
		add	sp, 6
		mov	di, [di+2]

loc_A320D:				; CODE XREF: GaugeWidget_Method_SetField_A31EA+Bj
		or	di, di
		jnz	short loc_A31F7
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		call	VROOMM_StubThunk_6C749
		add	sp, 6
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidget_Method_SetField_A31EA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, méthode virtuelle effaçant un champ, référencée via jmp depuis un stub VROOMM
; (sub_6C73F).
; ==============================================================================================
GaugeWidget_Method_ClearField_A3224	proc far		; CODE XREF: VROOMM_StubThunk_6C905J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [si+1Eh]
		jmp	short loc_A323E
; ���������������������������������������������������������������������������

loc_A3231:				; CODE XREF: GaugeWidget_Method_ClearField_A3224+1Cj
		push	word ptr [di]
		mov	bx, [di]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx]
		pop	cx
		mov	di, [di+2]

loc_A323E:				; CODE XREF: GaugeWidget_Method_ClearField_A3224+Bj
		or	di, di
		jnz	short loc_A3231
		push	si
		call	VROOMM_StubThunk_6C73F
		pop	cx
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidget_Method_ClearField_A3224	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, méthode virtuelle basculant un champ, référencée via jmp depuis un stub VROOMM
; (sub_6C744).
; ==============================================================================================
GaugeWidget_Method_ToggleField_A324D	proc far		; CODE XREF: VROOMM_StubThunk_6C90AJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di

loc_A3252:
		mov	si, [bp+arg_0]
		mov	di, [si+1Eh]
		jmp	short loc_A3268
; ���������������������������������������������������������������������������

loc_A325A:				; CODE XREF: GaugeWidget_Method_ToggleField_A324D+1Dj
		push	word ptr [di]
		mov	bx, [di]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+4]
		pop	cx
		mov	di, [di+2]

loc_A3268:				; CODE XREF: GaugeWidget_Method_ToggleField_A324D+Bj
		or	di, di
		jnz	short loc_A325A
		push	si
		call	VROOMM_StubThunk_6C744
		pop	cx
		pop	di

loc_A3274:
		pop	si
		pop	bp

locret_A3276:
		retf
GaugeWidget_Method_ToggleField_A324D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 96 lignes, NON DÉTAILLÉE — calcul de layout du widget jauge (manipulation de champs
; internes multiples, pas d'appel externe).
; ==============================================================================================
GaugeWidget_ComputeLayout_A3277	proc far		; CODE XREF: VROOMM_StubThunk_6C8E7J

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp

loc_A3278:
		mov	bp, sp
		sub	sp, 8
		push	si

loc_A327E:
		push	di
		mov	si, [bp+arg_0]

loc_A3282:
		xor	dx, dx
		mov	ax, [bp+arg_2]
		add	ax, [si+4]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]

loc_A3290:
		add	ax, [si+6]
		mov	[bp+var_4], ax
		mov	di, [si+1Eh]
		jmp	short loc_A32F3
; ���������������������������������������������������������������������������

loc_A329B:				; CODE XREF: GaugeWidget_ComputeLayout_A3277+7Ej
		mov	si, [di]
		mov	ax, [si+4]

loc_A32A0:
		cmp	ax, [bp+var_2]

loc_A32A3:
		jg	short loc_A32C2
		mov	ax, [si+6]
		cmp	ax, [bp+var_4]
		jg	short loc_A32C2
		mov	ax, [si+8]
		cmp	ax, [bp+var_2]

loc_A32B3:
		jl	short loc_A32C2
		mov	ax, [si+0Ah]
		cmp	ax, [bp+var_4]
		jl	short loc_A32C2
		mov	ax, 1
		jmp	short loc_A32C4
; ���������������������������������������������������������������������������

loc_A32C2:				; CODE XREF: GaugeWidget_ComputeLayout_A3277:loc_A32A3j
					; GaugeWidget_ComputeLayout_A3277+34j ...
		xor	ax, ax

loc_A32C4:				; CODE XREF: GaugeWidget_ComputeLayout_A3277+49j
		or	ax, ax
		jz	short loc_A32F0
		mov	ax, [bp+var_2]
		sub	ax, [si+4]
		mov	[bp+var_6], ax
		mov	ax, [bp+var_4]
		sub	ax, [si+6]
		mov	[bp+var_8], ax
		push	ax
		push	[bp+var_6]
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+24h]
		add	sp, 6
		mov	dx, ax
		or	dx, dx
		jnz	short loc_A32F0
		mov	dx, si

loc_A32F0:				; CODE XREF: GaugeWidget_ComputeLayout_A3277+4Fj
					; GaugeWidget_ComputeLayout_A3277+75j
		mov	di, [di+2]

loc_A32F3:				; CODE XREF: GaugeWidget_ComputeLayout_A3277+22j
		or	di, di
		jnz	short loc_A329B
		mov	ax, dx
		pop	di
		pop	si
		leave
		retf
GaugeWidget_ComputeLayout_A3277	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (rôle exact non détaillé, 60 lignes).
; ==============================================================================================
GaugeWidget_HelperF_A32FD	proc far		; CODE XREF: VROOMM_StubThunk_6C8ECJ

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
		xor	dx, dx
		mov	cx, [bp+arg_2]
		add	cx, [si+4]
		mov	ax, [bp+arg_4]
		add	ax, [si+6]
		mov	[bp+var_2], ax
		mov	di, [si+1Eh]
		jmp	short loc_A334A
; ���������������������������������������������������������������������������

loc_A331E:				; CODE XREF: GaugeWidget_HelperF_A32FD+4Fj
		mov	si, [di]
		cmp	[si+4],	cx
		jg	short loc_A333F
		mov	ax, [si+6]
		cmp	ax, [bp+var_2]
		jg	short loc_A333F
		cmp	[si+8],	cx
		jl	short loc_A333F
		mov	ax, [si+0Ah]
		cmp	ax, [bp+var_2]
		jl	short loc_A333F
		mov	ax, 1
		jmp	short loc_A3341
; ���������������������������������������������������������������������������

loc_A333F:				; CODE XREF: GaugeWidget_HelperF_A32FD+26j
					; GaugeWidget_HelperF_A32FD+2Ej ...
		xor	ax, ax

loc_A3341:				; CODE XREF: GaugeWidget_HelperF_A32FD+40j
		or	ax, ax
		jz	short loc_A3347
		mov	dx, si

loc_A3347:				; CODE XREF: GaugeWidget_HelperF_A32FD+46j
		mov	di, [di+2]

loc_A334A:				; CODE XREF: GaugeWidget_HelperF_A32FD+1Fj
		or	di, di
		jnz	short loc_A331E
		mov	ax, dx
		pop	di
		pop	si
		leave
		retf
GaugeWidget_HelperF_A32FD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 115 lignes, NON DÉTAILLÉE — combine GaugeWidget_GetNthListItem_A2E95 et manipulation
; de champs — reconstruction de la liste sur une plage d'indices.
; ==============================================================================================
GaugeWidget_RebuildListFromRange_A3354	proc far		; CODE XREF: VROOMM_StubThunk_6C923J GaugeWidget_RebuildDisplay_A3C85+67p

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

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	[bp+arg_4]
		push	di
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+24h]
		add	sp, 6
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0
		jnz	short loc_A337C
		jmp	loc_A3401
; ���������������������������������������������������������������������������

loc_A337C:				; CODE XREF: GaugeWidget_RebuildListFromRange_A3354+23j
		mov	ax, di
		add	ax, [si+4]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_4]
		add	ax, [si+6]
		mov	[bp+var_6], ax
		mov	bx, [bp+var_2]
		mov	ax, [bp+var_4]

loc_A3393:
		sub	ax, [bx+4]

loc_A3396:
		mov	[bp+var_8], ax
		mov	ax, [bp+var_6]

loc_A339C:
		sub	ax, [bx+6]
		mov	[bp+var_A], ax

loc_A33A2:
		cmp	byte ptr [si+34h], 0

loc_A33A6:
		jz	short loc_A33E6

loc_A33A8:
		push	0
		jmp	short loc_A33D8
; ���������������������������������������������������������������������������

loc_A33AC:				; CODE XREF: GaugeWidget_RebuildListFromRange_A3354+90j
		cmp	di, [bp+var_2]
		jz	short loc_A33D6

loc_A33B1:
		mov	al, [di+10h]
		shr	ax, 5
		and	ax, 1
		or	ax, ax
		jz	short loc_A33D6
		and	byte ptr [di+10h], 0DFh
		mov	al, [di+10h]
		and	ax, 1
		or	ax, ax
		jz	short loc_A33D6
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+18h]
		pop	cx
		jmp	short $+2

loc_A33D6:				; CODE XREF: GaugeWidget_RebuildListFromRange_A3354+5Bj
					; GaugeWidget_RebuildListFromRange_A3354+68j ...
		push	1

loc_A33D8:				; CODE XREF: GaugeWidget_RebuildListFromRange_A3354+56j
		push	si
		push	cs
		call	near ptr GaugeWidget_GetNthListItem_A2E95
		add	sp, 4
		mov	di, ax
		or	di, di
		jnz	short loc_A33AC

loc_A33E6:				; CODE XREF: GaugeWidget_RebuildListFromRange_A3354:loc_A33A6j
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+var_A]
		push	[bp+var_8]
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+28h]
		add	sp, 0Ah

loc_A3401:				; CODE XREF: GaugeWidget_RebuildListFromRange_A3354+25j
		pop	di
		pop	si
		leave
		retf
GaugeWidget_RebuildListFromRange_A3354	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, encadré par PaletteScreen_AcquireOwnership_A1240/ReleaseOwnership_A125D (seg442, via
; sub_6C7B7/sub_6C7BC) — met à jour un champ sous verrou.
; ==============================================================================================
GaugeWidget_UpdateWithLock_A3405	proc far		; CODE XREF: VROOMM_StubThunk_6C928J
					; GaugeWidget_UpdateWithLockWrapper_A3C14:loc_A3C25p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		call	VROOMM_StubThunk_6C7B7
		pop	cx
		mov	di, [si+1Eh]
		jmp	short loc_A3427
; ���������������������������������������������������������������������������

loc_A3419:				; CODE XREF: GaugeWidget_UpdateWithLock_A3405+24j
		push	word ptr [di]
		mov	bx, [di]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+1Ch]
		pop	cx
		mov	di, [di+2]

loc_A3427:				; CODE XREF: GaugeWidget_UpdateWithLock_A3405+12j
		or	di, di
		jnz	short loc_A3419
		push	si
		call	VROOMM_StubThunk_6C7BC
		pop	cx
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidget_UpdateWithLock_A3405	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, calcul sur deux champs (rôle exact non détaillé).
; ==============================================================================================
GaugeWidget_ComputeRange_A3436	proc far		; CODE XREF: VROOMM_StubThunk_6C91EJ

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+24h]
		add	sp, 6
		mov	di, ax
		or	di, di
		jz	short loc_A348C
		mov	ax, [bp+arg_2]
		add	ax, [si+4]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		add	ax, [si+6]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		sub	ax, [di+4]
		mov	[bp+var_6], ax
		mov	ax, [bp+var_4]
		sub	ax, [di+6]
		mov	[bp+var_8], ax
		push	[bp+arg_6]
		push	ax
		push	[bp+var_6]
		push	di

loc_A3483:
		mov	bx, [di+0Eh]
		call	dword ptr [bx+10h]
		add	sp, 8

loc_A348C:				; CODE XREF: GaugeWidget_ComputeRange_A3436+1Fj
		pop	di
		pop	si
		leave
		retf
GaugeWidget_ComputeRange_A3436	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, applique un style de texte (TextFormat_ApplyStyleAttribute_5E2D0, seg143).
; ==============================================================================================
GaugeWidget_ApplyTextStyle_A3490	proc far		; CODE XREF: VROOMM_StubThunk_6C95FJ GaugeWidgetVariantA_ConstructAndInit_A34CA+6Cp	...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word ptr [si+35h], 0
		mov	byte ptr [si+4Fh], 1
		mov	word ptr [si+5Ch], 0FFFFh
		xor	ax, ax
		mov	[si+60h], ax
		mov	[si+5Eh], ax
		xor	ax, ax
		mov	[si+64h], ax
		mov	[si+62h], ax
		push	word_70E62
		mov	ax, si
		add	ax, 37h	; '7'
		push	ax
		call	TextFormat_ApplyStyleAttribute_5E2D0
		add	sp, 4
		pop	si
		pop	bp
		retf
GaugeWidget_ApplyTextStyle_A3490	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue (sub_658), construit (GaugeWidget_Construct_A2DF0), applique un style
; (GaugeWidget_ApplyTextStyle_A3490).
; ==============================================================================================
GaugeWidgetVariantA_ConstructAndInit_A34CA	proc far		; CODE XREF: VROOMM_StubThunk_6C964J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_A34E3
		push	6Eh ; 'n'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_A353A

loc_A34E3:				; CODE XREF: GaugeWidgetVariantA_ConstructAndInit_A34CA+9j
		push	large 0
		push	large 0FFFFFFFFh
		push	si
		push	cs
		call	near ptr GaugeWidget_Construct_A2DF0
		add	sp, 0Ah
		mov	word ptr [si+0Eh], 2E46h
		mov	word ptr [si+37h], 0
		mov	word ptr [si+39h], 0
		mov	byte ptr [si+44h], 0
		mov	dword ptr [si+45h], 0
		mov	byte ptr [si+49h], 2
		mov	byte ptr [si+4Ah], 0
		mov	dword ptr [si+4Bh], 0
		mov	dword ptr [si+50h], 0
		mov	byte ptr [si+54h], 2
		mov	byte ptr [si+55h], 0
		mov	dword ptr [si+56h], 0
		push	si
		push	cs
		call	near ptr GaugeWidget_ApplyTextStyle_A3490
		pop	cx

loc_A353A:				; CODE XREF: GaugeWidgetVariantA_ConstructAndInit_A34CA+17j
		mov	ax, si
		pop	si
		pop	bp
		retf
GaugeWidgetVariantA_ConstructAndInit_A34CA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, même motif que GaugeWidgetVariantA_ConstructAndInit_A34CA (variante de paramètres).
; ==============================================================================================
GaugeWidgetVariantB_ConstructAndInit_A353F	proc far		; CODE XREF: VROOMM_StubThunk_6C969J

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_A3558
		push	6Eh ; 'n'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_A35B5

loc_A3558:				; CODE XREF: GaugeWidgetVariantB_ConstructAndInit_A353F+9j
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr GaugeWidget_Construct_A2DF0
		add	sp, 0Ah
		mov	word ptr [si+0Eh], 2E46h

loc_A3571:
		mov	word ptr [si+37h], 0
		mov	word ptr [si+39h], 0
		mov	byte ptr [si+44h], 0
		mov	dword ptr [si+45h], 0
		mov	byte ptr [si+49h], 2
		mov	byte ptr [si+4Ah], 0
		mov	dword ptr [si+4Bh], 0
		mov	dword ptr [si+50h], 0
		mov	byte ptr [si+54h], 2

loc_A35A3:
		mov	byte ptr [si+55h], 0
		mov	dword ptr [si+56h], 0
		push	si
		push	cs

loc_A35B1:
		call	near ptr GaugeWidget_ApplyTextStyle_A3490
		pop	cx

loc_A35B5:				; CODE XREF: GaugeWidgetVariantB_ConstructAndInit_A353F+17j
		mov	ax, si
		pop	si
		pop	bp
		retf
GaugeWidgetVariantB_ConstructAndInit_A353F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, même motif que GaugeWidgetVariantA_ConstructAndInit_A34CA (variante de paramètres).
; ==============================================================================================
GaugeWidgetVariantC_ConstructAndInit_A35BA	proc far		; CODE XREF: VROOMM_StubThunk_6C96EJ

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_A35D7
		push	6Eh ; 'n'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_A363E

loc_A35D7:				; CODE XREF: GaugeWidgetVariantC_ConstructAndInit_A35BA+Dj
		mov	ax, [di+0Ah]
		sub	ax, [di+6]
		inc	ax
		push	ax
		mov	ax, [di+8]
		sub	ax, [di+4]
		inc	ax
		push	ax
		push	word ptr [di+6]
		push	word ptr [di+4]
		push	si
		push	cs
		call	near ptr GaugeWidget_Construct_A2DF0
		add	sp, 0Ah
		mov	word ptr [si+0Eh], 2E46h
		mov	word ptr [si+37h], 0
		mov	word ptr [si+39h], 0
		mov	byte ptr [si+44h], 0
		mov	dword ptr [si+45h], 0
		mov	byte ptr [si+49h], 2
		mov	byte ptr [si+4Ah], 0
		mov	dword ptr [si+4Bh], 0
		mov	dword ptr [si+50h], 0
		mov	byte ptr [si+54h], 2
		mov	byte ptr [si+55h], 0
		mov	dword ptr [si+56h], 0
		push	si
		push	cs
		call	near ptr GaugeWidget_ApplyTextStyle_A3490
		pop	cx

loc_A363E:				; CODE XREF: GaugeWidgetVariantC_ConstructAndInit_A35BA+1Bj
		mov	ax, si
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidgetVariantC_ConstructAndInit_A35BA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 68 lignes, NON DÉTAILLÉE — calcul de layout (manipulation de champs internes, pas
; d'appel externe).
; ==============================================================================================
GaugeWidget_ComputeLayoutB_A3644	proc far		; CODE XREF: VROOMM_StubThunk_6C973J

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	cx, [bp+arg_4]
		mov	[si+1Ah], dx
		mov	[si+1Ch], cx
		mov	ax, [si+4]
		add	ax, [si+1Ah]
		dec	ax
		mov	[si+8],	ax
		mov	ax, [si+6]
		add	ax, [si+1Ch]
		dec	ax
		mov	[si+0Ah], ax
		mov	bx, word_70E62

loc_A3672:
		mov	ax, [bx+8]
		sub	ax, [bx+4]
		inc	ax
		sub	ax, dx
		sar	ax, 1
		mov	[bp+var_2], ax
		mov	ax, [bx+0Ah]
		sub	ax, [bx+6]
		inc	ax
		sub	ax, cx
		sar	ax, 1
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		mov	[bp+var_6], ax

loc_A3694:
		mov	ax, [bp+var_4]
		mov	[bp+var_8], ax
		mov	ax, [bp+var_6]
		sub	ax, [si+4]
		mov	[bp+var_A], ax

loc_A36A3:
		mov	ax, [bp+var_8]
		sub	ax, [si+6]
		mov	[bp+var_C], ax
		push	ax
		push	[bp+var_A]
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+8]
		add	sp, 6
		pop	si
		leave
		retf
GaugeWidget_ComputeLayoutB_A3644	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 91 lignes, NON DÉTAILLÉE — combine sub_A3A86, sub_A3B93, Memory_TypedFree_5C7B6
; (×2), TextFormat_ReleaseStyleList_5E526, GaugeWidget_Destruct_A2E39, sub_338.
; ==============================================================================================
GaugeWidget_RebuildAndRelease_A36BD	proc far		; CODE XREF: VROOMM_StubThunk_6C978J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_A36CF
		jmp	loc_A3779
; ���������������������������������������������������������������������������

loc_A36CF:				; CODE XREF: GaugeWidget_RebuildAndRelease_A36BD+Dj
		mov	word ptr [si+0Eh], 2E46h
		push	si
		nop
		push	cs
		call	near ptr GaugeWidget_ReleaseRenderBuffer_A3A86
		pop	cx
		push	si
		nop
		push	cs
		call	near ptr GaugeWidget_ReleaseExtraB_A3B93
		pop	cx
		cmp	byte ptr [si+55h], 0
		jz	short loc_A3708
		cmp	dword ptr [si+50h], 0
		jz	short loc_A3708
		push	0
		mov	al, [si+54h]
		push	ax
		mov	ax, si
		add	ax, 50h	; 'P'
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_A3708:				; CODE XREF: GaugeWidget_RebuildAndRelease_A36BD+29j
					; GaugeWidget_RebuildAndRelease_A36BD+30j
		mov	dword ptr [si+50h], 0
		mov	byte ptr [si+55h], 0
		mov	dword ptr [si+56h], 0
		cmp	byte ptr [si+4Ah], 0
		jz	short loc_A3742
		cmp	dword ptr [si+45h], 0
		jz	short loc_A3742
		push	0
		mov	al, [si+49h]
		push	ax
		mov	ax, si
		add	ax, 45h	; 'E'
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_A3742:				; CODE XREF: GaugeWidget_RebuildAndRelease_A36BD+63j
					; GaugeWidget_RebuildAndRelease_A36BD+6Aj
		mov	dword ptr [si+45h], 0
		mov	byte ptr [si+4Ah], 0
		mov	dword ptr [si+4Bh], 0
		mov	ax, si
		add	ax, 37h	; '7'
		push	ax
		call	TextFormat_ReleaseStyleList_5E526
		pop	cx
		push	0
		push	si
		push	cs
		call	near ptr GaugeWidget_Destruct_A2E39
		add	sp, 4
		test	di, 1
		jz	short loc_A3779
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_A3779:				; CODE XREF: GaugeWidget_RebuildAndRelease_A36BD+Fj
					; GaugeWidget_RebuildAndRelease_A36BD+B3j
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidget_RebuildAndRelease_A36BD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, encadré par le verrou d'ownership (seg442), combine Rect_ComputeIntersection_60F02
; (seg164), sub_A3A40, Memory_TypedAllocDispatchB_5C832, Render_MeasureOrDrawTextString_61F52
; (seg174).
; ==============================================================================================
GaugeWidget_MeasureAndDraw_A377D	proc far		; CODE XREF: VROOMM_StubThunk_6C99BJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	VROOMM_StubThunk_6C7B7
		pop	cx
		cmp	word ptr [si+5Ch], 0FFFFh
		jz	short loc_A37AD
		mov	al, [si+5Ch]

loc_A3794:
		push	ax
		push	word ptr [si+0Ah]
		push	word ptr [si+8]
		push	word ptr [si+6]
		push	word ptr [si+4]

loc_A37A1:
		push	word_70E62
		call	Rect_ComputeIntersection_60F02
		add	sp, 0Ch

loc_A37AD:				; CODE XREF: GaugeWidget_MeasureAndDraw_A377D+12j
		cmp	word ptr [si+5Eh], 0
		jz	short loc_A37BA
		push	si
		nop
		push	cs
		call	near ptr GaugeWidget_DrawFrameConditional_A3A40
		pop	cx

loc_A37BA:				; CODE XREF: GaugeWidget_MeasureAndDraw_A377D+34j
		cmp	dword ptr [si+50h], 0
		jz	short loc_A37C6
		mov	ax, 1
		jmp	short loc_A37C8
; ���������������������������������������������������������������������������

loc_A37C6:				; CODE XREF: GaugeWidget_MeasureAndDraw_A377D+42j
		xor	ax, ax

loc_A37C8:				; CODE XREF: GaugeWidget_MeasureAndDraw_A377D+47j
		or	ax, ax
		jz	short loc_A37F8
		push	word ptr [si+5Ah]
		push	0
		mov	al, [si+54h]
		push	ax
		push	large dword ptr	[si+50h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	word_70E62
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch

loc_A37F8:				; CODE XREF: GaugeWidget_MeasureAndDraw_A377D+4Dj
		push	si
		call	VROOMM_StubThunk_6C7BC
		pop	cx
		pop	si
		pop	bp
		retf
GaugeWidget_MeasureAndDraw_A377D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (rôle exact non détaillé).
; ==============================================================================================
GaugeWidget_HelperG_A3802	proc far		; CODE XREF: VROOMM_StubThunk_6C9A0J

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	[bp+arg_2], 0
		jz	short loc_A3817
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+34h]
		pop	cx

loc_A3817:				; CODE XREF: GaugeWidget_HelperG_A3802+Bj
		pop	si
		pop	bp
		retf
GaugeWidget_HelperG_A3802	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle StreamReader_ValidateState_63DB5 (seg190, via sub_6C75D).
; ==============================================================================================
GaugeWidget_HelperH_A381A	proc far		; CODE XREF: VROOMM_StubThunk_6C97DJ

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		cmp	dx, 0FFFEh
		jnz	short loc_A383E
		push	large 290042h
		push	51h ; 'Q'
		call	VROOMM_StubThunk_6C75D
		add	sp, 6
		mov	[si+5Ch], ax
		jmp	short loc_A3841
; ���������������������������������������������������������������������������

loc_A383E:				; CODE XREF: GaugeWidget_HelperH_A381A+Dj
		mov	[si+5Ch], dx

loc_A3841:				; CODE XREF: GaugeWidget_HelperH_A381A+22j
		pop	si
		pop	bp
		retf
GaugeWidget_HelperH_A381A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (rôle exact non détaillé, 39 lignes).
; ==============================================================================================
GaugeWidget_HelperI_A3844	proc far		; CODE XREF: VROOMM_StubThunk_6C9AFJ

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	ax, [bp+arg_0]
		mov	si, [bp+arg_2]
		or	si, si
		jz	short loc_A387B
		mov	ax, [bp+arg_4]
		sub	ax, [si+4]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_6]
		sub	ax, [si+6]
		mov	[bp+var_4], ax
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	ax
		push	[bp+var_2]
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+28h]
		add	sp, 0Ah

loc_A387B:				; CODE XREF: GaugeWidget_HelperI_A3844+Fj
		pop	si
		leave
		retf
GaugeWidget_HelperI_A3844	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 114 lignes, NON DÉTAILLÉE — dessine le cadre du widget :
; Render_DrawHorizontalLineClipped_61B8E, Render_FillClippedRect_61960 (×4),
; Rect_ComputeIntersection_60F02, encadré par le verrou d'ownership (seg442).
; ==============================================================================================
GaugeWidget_DrawFrame_A387E	proc far		; CODE XREF: VROOMM_StubThunk_6C982J GaugeWidget_DrawFrameWrapper_A396D+1Bp	...

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	si
		call	VROOMM_StubThunk_6C7B7
		pop	cx
		cmp	[bp+arg_C], 0
		jz	short loc_A38BD
		mov	al, byte ptr word_6FE94
		push	ax
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	di
		push	word_70E62
		call	Render_DrawHorizontalLineClipped_61B8E
		add	sp, 0Ch
		inc	di
		inc	[bp+arg_4]
		dec	[bp+arg_6]
		dec	[bp+arg_8]

loc_A38BD:				; CODE XREF: GaugeWidget_DrawFrame_A387E+19j
		mov	[bp+var_2], 0
		jmp	short loc_A393D
; ���������������������������������������������������������������������������

loc_A38C4:				; CODE XREF: GaugeWidget_DrawFrame_A387E+C7j
		mov	al, byte ptr word_6FE98
		push	ax
		push	[bp+arg_8]
		push	[bp+arg_6]
		mov	ax, [bp+arg_4]
		inc	ax
		push	ax
		push	[bp+arg_6]
		push	word_70E62
		call	Render_FillClippedRect_61960
		add	sp, 0Ch
		mov	al, byte ptr word_6FE98
		push	ax
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_8]
		push	di
		push	word_70E62
		call	Render_FillClippedRect_61960
		add	sp, 0Ch
		mov	al, byte ptr word_6FE9E
		push	ax
		push	[bp+arg_4]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	di
		push	word_70E62
		call	Render_FillClippedRect_61960
		add	sp, 0Ch
		mov	al, byte ptr word_6FE9E
		push	ax
		mov	ax, [bp+arg_8]
		dec	ax
		push	ax
		push	di
		push	[bp+arg_4]
		push	di
		push	word_70E62
		call	Render_FillClippedRect_61960
		add	sp, 0Ch
		inc	di
		inc	[bp+arg_4]
		dec	[bp+arg_6]
		dec	[bp+arg_8]
		inc	[bp+var_2]

loc_A393D:				; CODE XREF: GaugeWidget_DrawFrame_A387E+44j
		mov	ax, [bp+var_2]
		cmp	ax, [bp+arg_A]
		jge	short loc_A3948
		jmp	loc_A38C4
; ���������������������������������������������������������������������������

loc_A3948:				; CODE XREF: GaugeWidget_DrawFrame_A387E+C5j
		mov	al, byte ptr word_6FE9C
		push	ax
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	di
		push	word_70E62
		call	Rect_ComputeIntersection_60F02
		add	sp, 0Ch
		push	si
		call	VROOMM_StubThunk_6C7BC
		pop	cx
		pop	di
		pop	si
		leave
		retf
GaugeWidget_DrawFrame_A387E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, enveloppe appelant GaugeWidget_DrawFrame_A387E.
; ==============================================================================================
GaugeWidget_DrawFrameWrapper_A396D	proc far		; CODE XREF: VROOMM_StubThunk_6C987J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	large 10001h
		push	word ptr [si+0Ah]
		push	word ptr [si+8]
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	si
		push	cs
		call	near ptr GaugeWidget_DrawFrame_A387E
		add	sp, 0Eh
		pop	si
		pop	bp
		retf
GaugeWidget_DrawFrameWrapper_A396D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, encadré par le verrou d'ownership, appelle sub_6C79E (stub voisin).
; ==============================================================================================
GaugeWidget_ApplyUnderLock_A3991	proc far		; CODE XREF: VROOMM_StubThunk_6C991J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	VROOMM_StubThunk_6C7B7
		pop	cx
		push	word ptr [si+5Ch]
		push	[bp+arg_2]
		call	VROOMM_StubThunk_6C79E
		add	sp, 4
		push	si
		call	VROOMM_StubThunk_6C7BC
		pop	cx
		pop	si
		pop	bp
		retf
GaugeWidget_ApplyUnderLock_A3991	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle GaugeWidget_RenderModeDispatch_A3EA5.
; ==============================================================================================
GaugeWidget_QueryRenderState_A39B7	proc far		; CODE XREF: VROOMM_StubThunk_6C996J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word ptr [si+35h], 1
		push	si
		nop
		push	cs
		call	near ptr GaugeWidget_RenderModeDispatch_A3EA5
		pop	cx
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+18h]
		pop	cx
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx]
		pop	cx
		pop	si
		pop	bp
		retf
GaugeWidget_QueryRenderState_A39B7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle GaugeWidget_RenderModeDispatch_A40B0.
; ==============================================================================================
GaugeWidget_DrawByMode_A39DC	proc far		; CODE XREF: VROOMM_StubThunk_6C9BEJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+4]
		pop	cx
		push	si
		nop
		push	cs
		call	near ptr GaugeWidget_RenderModeDispatch_A40B0
		pop	cx
		mov	word ptr [si+35h], 0
		pop	si
		pop	bp
		retf
GaugeWidget_DrawByMode_A39DC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue un tampon de rendu (sub_658).
; ==============================================================================================
GaugeWidget_AllocateRenderBuffer_A39FA	proc far		; CODE XREF: VROOMM_StubThunk_6C937J GaugeWidget_AllocateRenderBufferWrapper_A3AB5+1Fp

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	0Ah
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		mov	ax, [bp+arg_2]
		mov	[di], ax
		mov	ax, [bp+arg_4]
		mov	[di+2],	ax
		mov	ax, [bp+arg_6]
		mov	[di+4],	ax
		mov	ax, [bp+arg_8]
		mov	[di+6],	ax
		mov	word ptr [di+8], 0
		cmp	word ptr [si+5Eh], 0
		jnz	short loc_A3A33
		mov	[si+5Eh], di
		jmp	short loc_A3A39
; ���������������������������������������������������������������������������

loc_A3A33:				; CODE XREF: GaugeWidget_AllocateRenderBuffer_A39FA+32j
		mov	bx, [si+60h]
		mov	[bx+8],	di

loc_A3A39:				; CODE XREF: GaugeWidget_AllocateRenderBuffer_A39FA+37j
		mov	[si+60h], di
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidget_AllocateRenderBuffer_A39FA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle GaugeWidget_DrawFrame_A387E.
; ==============================================================================================
GaugeWidget_DrawFrameConditional_A3A40	proc far		; CODE XREF: VROOMM_StubThunk_6C93CJ GaugeWidget_MeasureAndDraw_A377D+39p

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [si+5Eh]
		jmp	short loc_A3A7E
; ���������������������������������������������������������������������������

loc_A3A50:				; CODE XREF: GaugeWidget_DrawFrameConditional_A3A40+40j
		mov	dx, [di]
		mov	cx, [di+2]
		mov	ax, dx
		add	ax, [di+4]
		dec	ax
		mov	[bp+var_2], ax
		mov	ax, cx
		add	ax, [di+6]
		dec	ax
		mov	[bp+var_4], ax
		push	large 10001h
		push	ax
		push	[bp+var_2]
		push	cx
		push	dx
		push	si
		push	cs
		call	near ptr GaugeWidget_DrawFrame_A387E
		add	sp, 0Eh
		mov	di, [di+8]

loc_A3A7E:				; CODE XREF: GaugeWidget_DrawFrameConditional_A3A40+Ej
		or	di, di
		jnz	short loc_A3A50
		pop	di
		pop	si
		leave
		retf
GaugeWidget_DrawFrameConditional_A3A40	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, libère un tampon de rendu (sub_338).
; ==============================================================================================
GaugeWidget_ReleaseRenderBuffer_A3A86	proc far		; CODE XREF: VROOMM_StubThunk_6C941J GaugeWidget_RebuildAndRelease_A36BD+1Ap

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [si+5Eh]
		jmp	short loc_A3AA5
; ���������������������������������������������������������������������������

loc_A3A96:				; CODE XREF: GaugeWidget_ReleaseRenderBuffer_A3A86+21j
		mov	[bp+var_2], di
		mov	di, [di+8]
		push	[bp+var_2]
		call	CRT_FreeNear_Wrap
		pop	cx

loc_A3AA5:				; CODE XREF: GaugeWidget_ReleaseRenderBuffer_A3A86+Ej
		or	di, di
		jnz	short loc_A3A96
		xor	ax, ax
		mov	[si+60h], ax
		mov	[si+5Eh], ax
		pop	di
		pop	si
		leave
		retf
GaugeWidget_ReleaseRenderBuffer_A3A86	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle GaugeWidget_AllocateRenderBuffer_A39FA.
; ==============================================================================================
GaugeWidget_AllocateRenderBufferWrapper_A3AB5	proc far		; CODE XREF: VROOMM_StubThunk_6C98CJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+0Ah]
		sub	ax, [si+6]
		inc	ax
		push	ax
		mov	ax, [si+8]
		sub	ax, [si+4]
		inc	ax
		push	ax
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	si
		push	cs
		call	near ptr GaugeWidget_AllocateRenderBuffer_A39FA
		add	sp, 0Ah
		pop	si
		pop	bp
		retf
GaugeWidget_AllocateRenderBufferWrapper_A3AB5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 61 lignes, NON DÉTAILLÉE — alloue (sub_658) des données supplémentaires pour le
; widget.
; ==============================================================================================
GaugeWidget_AllocateExtra_A3ADD	proc far		; CODE XREF: VROOMM_StubThunk_6C946J GaugeWidget_InsertAndAllocateExtra_A3BE6+24p

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [si+62h]
		jmp	short loc_A3AF4
; ���������������������������������������������������������������������������

loc_A3AEA:				; CODE XREF: GaugeWidget_AllocateExtra_A3ADD+19j
		mov	ax, [di]
		cmp	ax, [bp+arg_2]
		jz	short loc_A3AF8
		mov	di, [di+4]

loc_A3AF4:				; CODE XREF: GaugeWidget_AllocateExtra_A3ADD+Bj
		or	di, di
		jnz	short loc_A3AEA

loc_A3AF8:				; CODE XREF: GaugeWidget_AllocateExtra_A3ADD+12j
		or	di, di
		jnz	short loc_A3B1F
		push	6
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		mov	word ptr [di+4], 0
		cmp	word ptr [si+62h], 0
		jnz	short loc_A3B16
		mov	[si+62h], di
		jmp	short loc_A3B1C
; ���������������������������������������������������������������������������

loc_A3B16:				; CODE XREF: GaugeWidget_AllocateExtra_A3ADD+32j
		mov	bx, [si+64h]
		mov	[bx+4],	di

loc_A3B1C:				; CODE XREF: GaugeWidget_AllocateExtra_A3ADD+37j
		mov	[si+64h], di

loc_A3B1F:				; CODE XREF: GaugeWidget_AllocateExtra_A3ADD+1Dj
		or	di, di
		jz	short loc_A3B2E
		mov	ax, [bp+arg_2]
		mov	[di], ax
		mov	ax, [bp+arg_4]
		mov	[di+2],	ax

loc_A3B2E:				; CODE XREF: GaugeWidget_AllocateExtra_A3ADD+44j
		mov	ax, di
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidget_AllocateExtra_A3ADD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 62 lignes, NON DÉTAILLÉE — libère (sub_338) les données supplémentaires du widget.
; ==============================================================================================
GaugeWidget_ReleaseExtra_A3B34	proc far		; CODE XREF: VROOMM_StubThunk_6C94BJ GaugeWidget_ReleaseExtraAndNode_A41FA+Ep

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
		mov	[bp+var_2], 0
		mov	di, [si+62h]
		jmp	short loc_A3B8B
; ���������������������������������������������������������������������������

loc_A3B49:				; CODE XREF: GaugeWidget_ReleaseExtra_A3B34+59j
		mov	ax, [di+2]
		cmp	ax, [bp+arg_2]
		jnz	short loc_A3B85
		mov	ax, [di+4]
		mov	[bp+var_4], ax
		cmp	[bp+var_2], 0
		jz	short loc_A3B63
		mov	bx, [bp+var_2]
		mov	[bx+4],	ax

loc_A3B63:				; CODE XREF: GaugeWidget_ReleaseExtra_A3B34+27j
		cmp	[si+64h], di
		jnz	short loc_A3B6E
		mov	ax, [bp+var_2]
		mov	[si+64h], ax

loc_A3B6E:				; CODE XREF: GaugeWidget_ReleaseExtra_A3B34+32j
		cmp	[si+62h], di
		jnz	short loc_A3B79
		mov	ax, [di+4]
		mov	[si+62h], ax

loc_A3B79:				; CODE XREF: GaugeWidget_ReleaseExtra_A3B34+3Dj
		push	di
		call	CRT_FreeNear_Wrap
		pop	cx
		mov	di, [bp+var_4]
		jmp	short loc_A3B8B
; ���������������������������������������������������������������������������

loc_A3B85:				; CODE XREF: GaugeWidget_ReleaseExtra_A3B34+1Bj
		mov	[bp+var_2], di
		mov	di, [di+4]

loc_A3B8B:				; CODE XREF: GaugeWidget_ReleaseExtra_A3B34+13j
					; GaugeWidget_ReleaseExtra_A3B34+4Fj
		or	di, di
		jnz	short loc_A3B49
		pop	di
		pop	si
		leave
		retf
GaugeWidget_ReleaseExtra_A3B34	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, variante de libération (sub_338).
; ==============================================================================================
GaugeWidget_ReleaseExtraB_A3B93	proc far		; CODE XREF: VROOMM_StubThunk_6C950J GaugeWidget_RebuildAndRelease_A36BD+21p

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [si+62h]
		jmp	short loc_A3BB2
; ���������������������������������������������������������������������������

loc_A3BA3:				; CODE XREF: GaugeWidget_ReleaseExtraB_A3B93+21j
		mov	[bp+var_2], di
		mov	di, [di+4]
		push	[bp+var_2]
		call	CRT_FreeNear_Wrap
		pop	cx

loc_A3BB2:				; CODE XREF: GaugeWidget_ReleaseExtraB_A3B93+Ej
		or	di, di
		jnz	short loc_A3BA3
		xor	ax, ax
		mov	[si+64h], ax
		mov	[si+62h], ax
		pop	di
		pop	si
		leave
		retf
GaugeWidget_ReleaseExtraB_A3B93	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (rôle exact non détaillé).
; ==============================================================================================
GaugeWidget_HelperJ_A3BC2	proc far		; CODE XREF: VROOMM_StubThunk_6C955J GaugeWidget_RebuildDisplay_A3C85+10p	...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	si, [si+62h]
		jmp	short loc_A3BDD
; ���������������������������������������������������������������������������

loc_A3BCE:				; CODE XREF: GaugeWidget_HelperJ_A3BC2+1Dj
		mov	ax, [si]
		cmp	ax, [bp+arg_2]
		jnz	short loc_A3BDA
		mov	ax, [si+2]
		jmp	short loc_A3BE3
; ���������������������������������������������������������������������������

loc_A3BDA:				; CODE XREF: GaugeWidget_HelperJ_A3BC2+11j
		mov	si, [si+4]

loc_A3BDD:				; CODE XREF: GaugeWidget_HelperJ_A3BC2+Aj
		or	si, si
		jnz	short loc_A3BCE
		xor	ax, ax

loc_A3BE3:				; CODE XREF: GaugeWidget_HelperJ_A3BC2+16j
		pop	si
		pop	bp
		retf
GaugeWidget_HelperJ_A3BC2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine GaugeWidget_InsertListNode_A312F et GaugeWidget_AllocateExtra_A3ADD.
; ==============================================================================================
GaugeWidget_InsertAndAllocateExtra_A3BE6	proc far		; CODE XREF: VROOMM_StubThunk_6C95AJ

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	di, di
		jz	short loc_A3C10
		push	di
		push	si
		push	cs
		call	near ptr GaugeWidget_InsertListNode_A312F
		add	sp, 4
		cmp	[bp+arg_4], 0
		jz	short loc_A3C10
		push	di
		push	[bp+arg_4]
		push	si
		push	cs
		call	near ptr GaugeWidget_AllocateExtra_A3ADD
		add	sp, 6

loc_A3C10:				; CODE XREF: GaugeWidget_InsertAndAllocateExtra_A3BE6+Dj
					; GaugeWidget_InsertAndAllocateExtra_A3BE6+1Cj
		pop	di
		pop	si
		pop	bp

locret_A3C13:
		retf
GaugeWidget_InsertAndAllocateExtra_A3BE6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle GaugeWidget_UpdateWithLock_A3405.
; ==============================================================================================
GaugeWidget_UpdateWithLockWrapper_A3C14	proc far		; CODE XREF: VROOMM_StubThunk_6C9A5J

arg_0		= word ptr  6

		push	bp

loc_A3C15:
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si

loc_A3C1C:
		mov	bx, [si+0Eh]

loc_A3C1F:
		call	dword ptr [bx+34h]

loc_A3C22:
		pop	cx
		push	si

loc_A3C24:
		push	cs

loc_A3C25:
		call	near ptr GaugeWidget_UpdateWithLock_A3405
		pop	cx
		pop	si
		pop	bp
		retf
GaugeWidget_UpdateWithLockWrapper_A3C14	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine Joystick_LoadCalibrationSample-like accessor (sub_66DA3, seg163) et
; GaugeWidget_FormatDisplayValue_A3CF6.
; ==============================================================================================
GaugeWidget_QueryAndFormat_A3C2C	proc far		; CODE XREF: VROOMM_StubThunk_6C9B4J

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	ax, 0C00h
		int	21h		; DOS -	CLEAR KEYBOARD BUFFER
					; AL must be 01h, 06h, 07h, 08h, or 0Ah.

loc_A3C3B:				; CODE XREF: GaugeWidget_QueryAndFormat_A3C2C+22j
		push	0FFh
		push	5855h
		call	Keyboard_QueryAndDispatch_66DA3
		add	sp, 4
		cmp	byte_72905, 0
		jnz	short loc_A3C3B
		push	[bp+arg_2]
		push	0FFFFh
		push	si
		nop
		push	cs
		call	near ptr GaugeWidget_FormatDisplayValue_A3CF6
		add	sp, 6
		mov	[bp+var_2], ax
		push	word ptr [si+6Ch]
		push	word ptr [si+6Ah]
		mov	ax, [si+68h]
		sub	ax, [si+6]
		push	ax
		mov	ax, [si+66h]
		sub	ax, [si+4]
		push	ax
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+28h]
		add	sp, 0Ah
		mov	ax, [bp+var_2]
		pop	si
		leave
		retf
GaugeWidget_QueryAndFormat_A3C2C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine GaugeWidget_HelperJ_A3BC2 et GaugeWidget_RebuildListFromRange_A3354.
; ==============================================================================================
GaugeWidget_RebuildDisplay_A3C85	proc far		; CODE XREF: VROOMM_StubThunk_6C9AAJ

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
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	[bp+arg_8]
		push	si
		push	cs
		call	near ptr GaugeWidget_HelperJ_A3BC2
		add	sp, 4
		mov	di, ax
		or	di, di
		jz	short loc_A3CD8
		mov	ax, [bp+arg_2]
		add	ax, [si+4]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		add	ax, [si+6]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		sub	ax, [di+4]
		mov	[bp+var_6], ax
		mov	ax, [bp+var_4]
		sub	ax, [di+6]
		mov	[bp+var_8], ax
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	ax
		push	[bp+var_6]
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+28h]
		jmp	short loc_A3CEF
; ���������������������������������������������������������������������������

loc_A3CD8:				; CODE XREF: GaugeWidget_RebuildDisplay_A3C85+1Aj
		cmp	[bp+arg_6], 0
		jz	short loc_A3CF2
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr GaugeWidget_RebuildListFromRange_A3354

loc_A3CEF:				; CODE XREF: GaugeWidget_RebuildDisplay_A3C85+51j
		add	sp, 0Ah

loc_A3CF2:				; CODE XREF: GaugeWidget_RebuildDisplay_A3C85+57j
		pop	di
		pop	si
		leave
		retf
GaugeWidget_RebuildDisplay_A3C85	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 227 lignes, NON DÉTAILLÉE — combine le verrou d'ownership (seg442),
; TextScroll_FormatAndApply_67204 (seg204), sub_28A63/sub_288A6 (externes),
; GaugeWidget_HelperJ_A3BC2 — formatage/affichage de la valeur du widget jauge. Candidat pour
; session dédiée.
; ==============================================================================================
GaugeWidget_FormatDisplayValue_A3CF6	proc far		; CODE XREF: VROOMM_StubThunk_6C9B9J GaugeWidget_QueryAndFormat_A3C2C+2Cp

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		mov	word ptr [si+6Ch], 0
		mov	word ptr [si+6Ah], 0
		mov	[bp+var_2], 0
		push	si

loc_A3D13:
		call	VROOMM_StubThunk_6C7BC
		pop	cx
		jmp	loc_A3E92
; ���������������������������������������������������������������������������

loc_A3D1C:				; CODE XREF: GaugeWidget_FormatDisplayValue_A3CF6+1A6j
		push	584Eh

loc_A3D1F:
		call	TextScroll_FormatAndApply_67204
		pop	cx
		cmp	byte_728FE, 0
		jnz	short loc_A3D4B
		push	584Eh
		call	Input_ReadCombinedAxes
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A3D4B
		push	5855h
		push	584Eh
		call	Input_ReadAxis2Deadzone
		add	sp, 4
		jmp	short $+2

loc_A3D4B:				; CODE XREF: GaugeWidget_FormatDisplayValue_A3CF6+34j
					; GaugeWidget_FormatDisplayValue_A3CF6+43j
		mov	al, byte_728FE
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A3D57
		jmp	loc_A3DFD
; ���������������������������������������������������������������������������

loc_A3D57:				; CODE XREF: GaugeWidget_FormatDisplayValue_A3CF6+5Cj
		mov	ax, [si+68h]
		mov	[bp+var_4], ax
		mov	ax, word_72900
		sar	ax, 1
		mov	[si+66h], ax
		mov	ax, word_72902
		mov	[si+68h], ax
		mov	ax, [si+68h]
		sub	[bp+var_4], ax
		mov	al, byte_728FE
		mov	ah, 0
		cmp	ax, 3
		jz	short loc_A3D81
		cmp	[bp+var_4], 0
		jz	short loc_A3DEB

loc_A3D81:				; CODE XREF: GaugeWidget_FormatDisplayValue_A3CF6+83j
		mov	ax, [si+68h]
		sub	ax, [si+6]
		push	ax
		mov	ax, [si+66h]
		sub	ax, [si+4]
		push	ax
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+20h]
		add	sp, 6
		mov	[bp+var_6], ax
		cmp	ax, [bp+var_2]
		jz	short loc_A3DA6
		mov	ax, 1
		jmp	short loc_A3DA8
; ���������������������������������������������������������������������������

loc_A3DA6:				; CODE XREF: GaugeWidget_FormatDisplayValue_A3CF6+A9j
		xor	ax, ax

loc_A3DA8:				; CODE XREF: GaugeWidget_FormatDisplayValue_A3CF6+AEj
		mov	[bp+var_8], ax
		cmp	[bp+var_2], 0
		jz	short loc_A3DC4
		cmp	[bp+var_8], 0
		jz	short loc_A3DC4
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+14h]
		pop	cx

loc_A3DC4:				; CODE XREF: GaugeWidget_FormatDisplayValue_A3CF6+B9j
					; GaugeWidget_FormatDisplayValue_A3CF6+BFj
		cmp	[bp+var_6], 0
		jz	short loc_A3DE5
		push	[bp+var_8]
		mov	ax, [si+68h]
		sub	ax, [si+6]
		push	ax
		mov	ax, [si+66h]
		sub	ax, [si+4]
		push	ax
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+10h]
		add	sp, 8

loc_A3DE5:				; CODE XREF: GaugeWidget_FormatDisplayValue_A3CF6+D2j
		mov	ax, [bp+var_6]
		mov	[bp+var_2], ax

loc_A3DEB:				; CODE XREF: GaugeWidget_FormatDisplayValue_A3CF6+89j
		mov	al, byte_728FE
		mov	ah, 0
		cmp	ax, 1
		jnz	short loc_A3DFD
		mov	al, byte_728FF
		mov	ah, 0
		mov	[si+6Ah], ax

loc_A3DFD:				; CODE XREF: GaugeWidget_FormatDisplayValue_A3CF6+5Ej
					; GaugeWidget_FormatDisplayValue_A3CF6+FDj
		mov	al, byte_72905
		mov	ah, 0
		cmp	ax, 2
		jnz	short loc_A3E57
		mov	ax, 0C00h
		int	21h		; DOS -	CLEAR KEYBOARD BUFFER
					; AL must be 01h, 06h, 07h, 08h, or 0Ah.
		mov	word ptr [si+6Ah], 0

loc_A3E11:
		mov	al, byte_72906
		mov	ah, 0
		mov	dx, word_6FE70

loc_A3E1A:
		shl	dx, 8
		or	dx, ax
		mov	[si+6Ch], dx
		push	word ptr [si+6Ch]
		push	si
		push	cs
		call	near ptr GaugeWidget_HelperJ_A3BC2
		add	sp, 4
		mov	di, ax
		or	di, di
		jnz	short loc_A3E57
		mov	ax, [si+68h]
		sub	ax, [si+6]
		push	ax
		mov	ax, [si+66h]
		sub	ax, [si+4]
		push	ax
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+24h]
		add	sp, 6
		mov	di, ax
		or	di, di
		jnz	short loc_A3E57
		cmp	[bp+arg_4], 0
		jnz	short loc_A3E9F

loc_A3E57:				; CODE XREF: GaugeWidget_FormatDisplayValue_A3CF6+10Fj
					; GaugeWidget_FormatDisplayValue_A3CF6+13Bj ...
		or	di, di
		jnz	short loc_A3E89
		mov	al, byte_728FE
		mov	ah, 0
		cmp	ax, 1
		jnz	short loc_A3E89
		mov	ax, [si+68h]
		sub	ax, [si+6]
		push	ax
		mov	ax, [si+66h]
		sub	ax, [si+4]
		push	ax
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+24h]
		add	sp, 6
		mov	di, ax
		or	di, di
		jnz	short loc_A3E89
		cmp	[bp+arg_4], 0
		jnz	short loc_A3E9F

loc_A3E89:				; CODE XREF: GaugeWidget_FormatDisplayValue_A3CF6+163j
					; GaugeWidget_FormatDisplayValue_A3CF6+16Dj ...
		cmp	[bp+arg_2], 0FFFFh
		jz	short loc_A3E92
		dec	[bp+arg_2]

loc_A3E92:				; CODE XREF: GaugeWidget_FormatDisplayValue_A3CF6+23j
					; GaugeWidget_FormatDisplayValue_A3CF6+197j
		or	di, di
		jnz	short loc_A3E9F
		cmp	[bp+arg_2], 0
		jz	short loc_A3E9F
		jmp	loc_A3D1C
; ���������������������������������������������������������������������������

loc_A3E9F:				; CODE XREF: GaugeWidget_FormatDisplayValue_A3CF6+15Fj
					; GaugeWidget_FormatDisplayValue_A3CF6+191j ...
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
GaugeWidget_FormatDisplayValue_A3CF6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 251 lignes, NON DÉTAILLÉE — dispatch de rendu selon le mode :
; Memory_TypedAllocDispatchC_5C86D (×2), Memory_TypedFreeWrapperC_5C6F3 (×2),
; Memory_TypedAllocDispatchB_5C832 (×3), Render_BlitClippedRegionVariant_62D36 (seg181),
; encadré par le verrou d'ownership. Candidat pour session dédiée.
; ==============================================================================================
GaugeWidget_RenderModeDispatch_A3EA5	proc far		; CODE XREF: VROOMM_StubThunk_6C92DJ GaugeWidget_QueryRenderState_A39B7+Fp

var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 20h
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		call	VROOMM_StubThunk_6C7B7
		pop	cx
		mov	ax, [si+4]
		mov	[bp+var_2], ax
		mov	ax, [si+6]
		mov	[bp+var_4], ax
		mov	ax, [si+8]
		mov	[bp+var_6], ax
		mov	ax, [si+0Ah]
		mov	[bp+var_8], ax
		mov	ax, [bp+var_2]
		mov	[si+3Bh], ax
		mov	ax, [bp+var_4]
		mov	[si+3Dh], ax
		mov	ax, [bp+var_6]
		mov	[si+3Fh], ax
		mov	ax, [bp+var_8]
		mov	[si+41h], ax
		mov	ax, [si+3Fh]
		sub	ax, [si+3Bh]
		inc	ax
		mov	dx, [si+41h]
		sub	dx, [si+3Dh]
		inc	dx
		imul	dx
		mov	di, ax
		push	0
		push	2
		push	5C44h
		call	Memory_TypedAllocDispatchC_5C86D
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		mov	[bp+var_C], eax
		push	0
		push	3
		push	5C44h

loc_A3F17:
		call	Memory_TypedAllocDispatchC_5C86D
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		mov	[bp+var_10], eax
		cmp	byte ptr [si+4Fh], 3
		jnz	short loc_A3F3B
		movzx	eax, di
		cmp	eax, [bp+var_C]
		jle	short loc_A3F3B
		mov	byte ptr [si+4Fh], 2

loc_A3F3B:				; CODE XREF: GaugeWidget_RenderModeDispatch_A3EA5+86j
					; GaugeWidget_RenderModeDispatch_A3EA5+90j
		cmp	byte ptr [si+4Fh], 4
		jnz	short loc_A3F4F
		movzx	eax, di
		cmp	eax, [bp+var_10]
		jle	short loc_A3F4F
		mov	byte ptr [si+4Fh], 2

loc_A3F4F:				; CODE XREF: GaugeWidget_RenderModeDispatch_A3EA5+9Aj
					; GaugeWidget_RenderModeDispatch_A3EA5+A4j
		cmp	byte ptr [si+4Fh], 1
		jnz	short loc_A3F69
		movzx	eax, di
		cmp	eax, [bp+var_10]
		jle	short loc_A3F65
		mov	byte ptr [si+4Fh], 2
		jmp	short loc_A3F69
; ���������������������������������������������������������������������������

loc_A3F65:				; CODE XREF: GaugeWidget_RenderModeDispatch_A3EA5+B8j
		mov	byte ptr [si+4Fh], 4

loc_A3F69:				; CODE XREF: GaugeWidget_RenderModeDispatch_A3EA5+AEj
					; GaugeWidget_RenderModeDispatch_A3EA5+BEj
		mov	al, [si+4Fh]
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 4		; switch 5 cases
		jbe	short loc_A3F78
		jmp	loc_A409B	; default
; ���������������������������������������������������������������������������

loc_A3F78:				; CODE XREF: GaugeWidget_RenderModeDispatch_A3EA5+CEj
		shl	bx, 1
		jmp	cs:off_A40A6[bx] ; switch jump

loc_A3F7F:				; DATA XREF: seg444:off_A40A6o
		movzx	eax, di		; case 0x3
		mov	[bp+var_14], eax
		push	1
		push	0
		push	2
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_18+2],	dx
		mov	word ptr [bp+var_18], ax
		mov	eax, [bp+var_18]
		mov	[si+45h], eax
		mov	byte ptr [si+49h], 2
		mov	byte ptr [si+4Ah], 1
		mov	dword ptr [si+4Bh], 0
		mov	eax, [bp+var_14]
		mov	[si+4Bh], eax
		push	0
		mov	al, [si+49h]
		push	ax
		push	large dword ptr	[si+45h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		or	ax, dx
		jnz	short loc_A3FDC
		jmp	loc_A4083
; ���������������������������������������������������������������������������

loc_A3FDC:				; CODE XREF: GaugeWidget_RenderModeDispatch_A3EA5+132j
		mov	ax, si
		add	ax, 37h	; '7'
		jz	short loc_A3FE6
		jmp	loc_A4078
; ���������������������������������������������������������������������������

loc_A3FE6:				; CODE XREF: GaugeWidget_RenderModeDispatch_A3EA5+13Cj
					; GaugeWidget_RenderModeDispatch_A3EA5+1D0j ...
		mov	ax, si
		add	ax, 37h	; '7'

loc_A3FEB:				; CODE XREF: GaugeWidget_RenderModeDispatch_A3EA5+1D8j
		push	ax
		push	0
		mov	al, [si+49h]
		push	ax
		push	large dword ptr	[si+45h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	word_70E62
		call	Render_BlitClippedRegionVariant_62D36
		add	sp, 8
		jmp	loc_A409B	; default
; ���������������������������������������������������������������������������
		jmp	short loc_A4083
; ���������������������������������������������������������������������������

loc_A4014:				; CODE XREF: GaugeWidget_RenderModeDispatch_A3EA5+D5j
					; DATA XREF: seg444:off_A40A6o
		movzx	eax, di		; case 0x4

loc_A4018:
		mov	[bp+var_1C], eax
		push	1
		push	0
		push	3

loc_A4022:
		push	eax

loc_A4024:
		push	5C44h

loc_A4027:
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_20+2],	dx
		mov	word ptr [bp+var_20], ax
		mov	eax, [bp+var_20]
		mov	[si+45h], eax
		mov	byte ptr [si+49h], 3
		mov	byte ptr [si+4Ah], 1
		mov	dword ptr [si+4Bh], 0
		mov	eax, [bp+var_1C]
		mov	[si+4Bh], eax
		push	0
		mov	al, [si+49h]
		push	ax
		push	large dword ptr	[si+45h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		or	ax, dx
		jz	short loc_A4083
		mov	ax, si
		add	ax, 37h	; '7'
		jnz	short loc_A4078
		jmp	loc_A3FE6
; ���������������������������������������������������������������������������

loc_A4078:				; CODE XREF: GaugeWidget_RenderModeDispatch_A3EA5+13Ej
					; GaugeWidget_RenderModeDispatch_A3EA5+1CEj
		mov	ax, si
		add	ax, 3Bh	; ';'
		jmp	loc_A3FEB
; ���������������������������������������������������������������������������
		jmp	loc_A3FE6
; ���������������������������������������������������������������������������

loc_A4083:				; CODE XREF: GaugeWidget_RenderModeDispatch_A3EA5+134j
					; GaugeWidget_RenderModeDispatch_A3EA5+16Dj ...
		mov	byte ptr [si+4Fh], 0
		jmp	short loc_A409B	; default
; ���������������������������������������������������������������������������

loc_A4089:				; CODE XREF: GaugeWidget_RenderModeDispatch_A3EA5+D5j
					; DATA XREF: seg444:off_A40A6o
		push	si		; case 0x2
		push	2E2Eh
		mov	ax, si
		add	ax, 37h	; '7'
		push	ax
		call	VROOMM_StubThunk_6C700
		add	sp, 6

loc_A409B:				; CODE XREF: GaugeWidget_RenderModeDispatch_A3EA5+D0j
					; GaugeWidget_RenderModeDispatch_A3EA5+D5j ...
		push	si		; default
		call	VROOMM_StubThunk_6C7BC
		pop	cx
		pop	di
		pop	si
		leave
		retf
GaugeWidget_RenderModeDispatch_A3EA5	endp

; ���������������������������������������������������������������������������
off_A40A6	dw offset loc_A409B	; DATA XREF: GaugeWidget_RenderModeDispatch_A3EA5+D5r
		dw offset loc_A409B	; jump table for switch	statement
		dw offset loc_A4089
		dw offset loc_A3F7F
		dw offset loc_A4014

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 167 lignes, NON DÉTAILLÉE — switch à 5 cas de rendu (tag mémoire 5C44h) combinant
; Memory_TypedAllocDispatchB_5C832 (×3), Render_BlitClippedRegion_6271A (seg178, ×2),
; Memory_TypedFree_5C7B6, Rect_FillRegion_60F94 (seg165), encadré par le verrou d'ownership —
; probable jauge/indicateur graphique multi-mode (aiguille, barre, digital...). Candidat
; prioritaire pour session dédiée.
; ==============================================================================================
GaugeWidget_RenderModeDispatch_A40B0	proc far		; CODE XREF: VROOMM_StubThunk_6C932J GaugeWidget_DrawByMode_A39DC+12p

var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	VROOMM_StubThunk_6C7B7
		pop	cx
		mov	al, [si+4Fh]
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 4		; switch 5 cases
		jbe	short loc_A40D0
		jmp	loc_A41D4	; default
; ���������������������������������������������������������������������������

loc_A40D0:				; CODE XREF: GaugeWidget_RenderModeDispatch_A40B0+1Bj
		shl	bx, 1
		jmp	cs:off_A41F0[bx] ; switch jump

loc_A40D7:				; DATA XREF: seg444:off_A41F0o
		push	0		; case 0x3
		mov	al, [si+49h]
		push	ax
		push	large dword ptr	[si+45h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		or	ax, dx
		jnz	short loc_A40F3
		jmp	loc_A41E6	; case 0x0
; ���������������������������������������������������������������������������

loc_A40F3:				; CODE XREF: GaugeWidget_RenderModeDispatch_A40B0+3Ej
		mov	ax, si
		add	ax, 37h	; '7'
		jz	short loc_A4101
		mov	ax, si
		add	ax, 3Bh	; ';'
		jmp	short loc_A4106
; ���������������������������������������������������������������������������

loc_A4101:				; CODE XREF: GaugeWidget_RenderModeDispatch_A40B0+48j
		mov	ax, si
		add	ax, 37h	; '7'

loc_A4106:				; CODE XREF: GaugeWidget_RenderModeDispatch_A40B0+4Fj
		push	ax
		push	0
		mov	al, [si+49h]
		push	ax
		push	large dword ptr	[si+45h]

loc_A4111:
		push	5C44h

loc_A4114:
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	word_70E62
		call	Render_BlitClippedRegion_6271A
		add	sp, 8
		cmp	byte ptr [si+4Ah], 0
		jz	short loc_A4139
		cmp	dword ptr [si+45h], 0
		jz	short loc_A4139
		jmp	short loc_A41A3
; ���������������������������������������������������������������������������

loc_A4139:				; CODE XREF: GaugeWidget_RenderModeDispatch_A40B0+7Ej
					; GaugeWidget_RenderModeDispatch_A40B0+85j ...
		mov	dword ptr [si+45h], 0
		mov	byte ptr [si+4Ah], 0
		mov	dword ptr [si+4Bh], 0
		jmp	loc_A41E6	; case 0x0
; ���������������������������������������������������������������������������

loc_A4150:				; CODE XREF: GaugeWidget_RenderModeDispatch_A40B0+22j
					; DATA XREF: seg444:off_A41F0o
		push	0		; case 0x4
		mov	al, [si+49h]
		push	ax
		push	large dword ptr	[si+45h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jz	short loc_A41E6	; case 0x0
		mov	ax, si
		add	ax, 37h	; '7'
		jz	short loc_A4180
		mov	ax, si
		add	ax, 3Bh	; ';'
		jmp	short loc_A4185
; ���������������������������������������������������������������������������

loc_A4180:				; CODE XREF: GaugeWidget_RenderModeDispatch_A40B0+C7j
		mov	ax, si
		add	ax, 37h	; '7'

loc_A4185:				; CODE XREF: GaugeWidget_RenderModeDispatch_A40B0+CEj
		push	ax
		push	large [bp+var_4]
		push	word_70E62
		call	Render_BlitClippedRegion_6271A
		add	sp, 8
		cmp	byte ptr [si+4Ah], 0
		jz	short loc_A4139
		cmp	dword ptr [si+45h], 0
		jz	short loc_A4139

loc_A41A3:				; CODE XREF: GaugeWidget_RenderModeDispatch_A40B0+87j
		push	0
		mov	al, [si+49h]
		push	ax
		mov	ax, si
		add	ax, 45h	; 'E'
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	loc_A4139
; ���������������������������������������������������������������������������
		jmp	loc_A4139
; ���������������������������������������������������������������������������

loc_A41C0:				; CODE XREF: GaugeWidget_RenderModeDispatch_A40B0+22j
					; DATA XREF: seg444:off_A41F0o
		push	si		; case 0x2
		push	2E3Ah
		mov	ax, si
		add	ax, 37h	; '7'
		push	ax
		call	VROOMM_StubThunk_6C705
		add	sp, 6
		jmp	short loc_A41E6	; case 0x0
; ���������������������������������������������������������������������������

loc_A41D4:				; CODE XREF: GaugeWidget_RenderModeDispatch_A40B0+1Dj
					; GaugeWidget_RenderModeDispatch_A40B0+22j
					; DATA XREF: ...
		mov	al, [si+5Ch]	; default
		push	ax
		mov	ax, si
		add	ax, 37h	; '7'
		push	ax
		call	Rect_FillRegion_60F94
		add	sp, 4

loc_A41E6:				; CODE XREF: GaugeWidget_RenderModeDispatch_A40B0+22j
					; GaugeWidget_RenderModeDispatch_A40B0+40j ...
		push	si		; case 0x0
		call	VROOMM_StubThunk_6C7BC
		pop	cx
		pop	si
		leave
		retf
GaugeWidget_RenderModeDispatch_A40B0	endp

; ���������������������������������������������������������������������������
off_A41F0	dw offset loc_A41E6	; DATA XREF: GaugeWidget_RenderModeDispatch_A40B0+22r
		dw offset loc_A41D4	; jump table for switch	statement
		dw offset loc_A41C0
		dw offset loc_A40D7
		dw offset loc_A4150

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine GaugeWidget_ReleaseExtra_A3B34 et GaugeWidget_RemoveListNode_A30BF.
; ==============================================================================================
GaugeWidget_ReleaseExtraAndNode_A41FA	proc far		; CODE XREF: VROOMM_StubThunk_6C9C3J GaugeWidget_UpdateAndReleaseUnderLock_A421B+2Ep

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		push	si
		push	cs
		call	near ptr GaugeWidget_ReleaseExtra_A3B34
		add	sp, 4
		push	di
		push	si
		push	cs

loc_A4211:
		call	near ptr GaugeWidget_RemoveListNode_A30BF
		add	sp, 4
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidget_ReleaseExtraAndNode_A41FA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, encadré par le verrou d'ownership, appelle sub_6C79E (stub voisin) et
; GaugeWidget_ReleaseExtraAndNode_A41FA.
; ==============================================================================================
GaugeWidget_UpdateAndReleaseUnderLock_A421B	proc far		; CODE XREF: VROOMM_StubThunk_6C9C8J

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	[bp+arg_4], 0
		jz	short loc_A4246
		push	si
		call	VROOMM_StubThunk_6C7B7
		pop	cx
		push	word ptr [si+5Ch]
		push	di
		call	VROOMM_StubThunk_6C79E
		add	sp, 4
		push	si
		call	VROOMM_StubThunk_6C7BC
		pop	cx

loc_A4246:				; CODE XREF: GaugeWidget_UpdateAndReleaseUnderLock_A421B+Fj
		push	di
		push	si
		push	cs
		call	near ptr GaugeWidget_ReleaseExtraAndNode_A41FA
		add	sp, 4
		or	di, di
		jz	short loc_A4261
		push	3
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+30h]
		add	sp, 4
		jmp	short $+2

loc_A4261:				; CODE XREF: GaugeWidget_UpdateAndReleaseUnderLock_A421B+36j
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidget_UpdateAndReleaseUnderLock_A421B	endp

seg444		ends

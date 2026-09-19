seg457		segment	para public 'OVERLAY' use16
		assume cs:seg457
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 94 lignes, NON DÉTAILLÉE — combine ResourceRecord_ReadFieldGroupA_64A19 et
; ReadFieldGroupC_64A7E (×3, seg193) — chargement d'un groupe de champs IFF pour le système de
; résolution d'expressions (Expr/GeomNode, seg114).
; ==============================================================================================
ExprSlot_LoadFieldGroup_A9450	proc far		; CODE XREF: VROOMM_StubThunk_6CEBDJ ExprSlot_ReleaseAndLoad_A94E9+48p	...

var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp

loc_A9453:
		sub	sp, 1Ch
		push	si

loc_A9457:
		mov	si, [bp+arg_4]
		mov	ax, [bp+arg_2]

loc_A945D:
		mov	dx, [bp+arg_0]
		add	dx, 2
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		push	large 20h ; ' '
		push	ax
		push	dx
		push	si
		call	ResourceRecord_ReadFieldGroupA_64A19
		add	sp, 0Ah
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 22h	; '"'
		mov	word ptr [bp+var_8+2], ax
		mov	word ptr [bp+var_8], dx
		push	si
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_C], eax
		les	bx, [bp+var_8]
		mov	es:[bx], eax
		mov	ax, word ptr [bp+var_8+2]
		mov	dx, word ptr [bp+var_8]
		add	dx, 4
		mov	word ptr [bp+var_10+2],	ax
		mov	word ptr [bp+var_10], dx
		push	si
		call	ResourceRecord_ReadFieldGroupC_64A7E

loc_A94B1:
		push	dx

loc_A94B2:
		push	ax

loc_A94B3:
		pop	eax
		pop	cx

loc_A94B6:
		mov	[bp+var_14], eax
		les	bx, [bp+var_10]

loc_A94BD:
		mov	es:[bx], eax
		mov	ax, word ptr [bp+var_8+2]

loc_A94C4:
		mov	dx, word ptr [bp+var_8]
		add	dx, 8
		mov	word ptr [bp+var_18+2],	ax
		mov	word ptr [bp+var_18], dx
		push	si
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_1C], eax
		les	bx, [bp+var_18]
		mov	es:[bx], eax
		pop	si
		leave
		retf
ExprSlot_LoadFieldGroup_A9450	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine Memory_TypedFreeWrapperC_5C6F3 et ExprSlot_LoadFieldGroup_A9450.
; ==============================================================================================
ExprSlot_ReleaseAndLoad_A94E9	proc far		; CODE XREF: VROOMM_StubThunk_6CEC2J ExprSlot_ConstructMain_A974A+FEp

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jnz	short loc_A9518
		push	1
		push	0
		push	2
		push	large 32h ; '2'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jz	short loc_A955C

loc_A9518:				; CODE XREF: ExprSlot_ReleaseAndLoad_A94E9+Fj
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 36F9h
		mov	word ptr es:[bx], 36F1h
		mov	ax, word ptr [bp+arg_0]
		add	ax, 2Eh	; '.'
		push	si
		push	word ptr [bp+arg_0+2]
		push	bx
		push	cs
		call	near ptr ExprSlot_LoadFieldGroup_A9450
		add	sp, 6
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 2Eh	; '.'
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		push	si
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_8], eax
		les	bx, [bp+var_4]
		mov	es:[bx], eax

loc_A955C:				; CODE XREF: ExprSlot_ReleaseAndLoad_A94E9+2Dj
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	si
		leave
		retf
ExprSlot_ReleaseAndLoad_A94E9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 146 lignes, NON DÉTAILLÉE — variante étendue de ExprSlot_ReleaseAndLoad_A94E9 (5
; appels à ReadFieldGroupC_64A7E).
; ==============================================================================================
ExprSlot_ReleaseAndLoadExtended_A9565	proc far		; CODE XREF: VROOMM_StubThunk_6CEC7J
					; ExprSlot_ConstructMain_A974A:loc_A985Dp

var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 28h
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jnz	short loc_A9597
		push	1
		push	0
		push	2
		push	large 42h ; 'B'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_A9597
		jmp	loc_A9687
; ���������������������������������������������������������������������������

loc_A9597:				; CODE XREF: ExprSlot_ReleaseAndLoadExtended_A9565+Fj
					; ExprSlot_ReleaseAndLoadExtended_A9565+2Dj
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 36F9h
		mov	word ptr es:[bx], 36E9h
		mov	ax, word ptr [bp+arg_0]
		add	ax, 2Eh	; '.'
		mov	ax, word ptr [bp+arg_0]
		add	ax, 32h	; '2'

loc_A95B0:
		mov	ax, word ptr [bp+arg_0]
		add	ax, 36h	; '6'
		mov	ax, word ptr [bp+arg_0]
		add	ax, 3Ah	; ':'
		mov	ax, word ptr [bp+arg_0]
		add	ax, 3Eh	; '>'
		push	si

loc_A95C3:
		push	word ptr [bp+arg_0+2]
		push	bx
		push	cs
		call	near ptr ExprSlot_LoadFieldGroup_A9450
		add	sp, 6
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 2Eh	; '.'
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		push	si
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_8], eax
		les	bx, [bp+var_4]
		mov	es:[bx], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 32h	; '2'
		mov	word ptr [bp+var_C+2], ax
		mov	word ptr [bp+var_C], dx
		push	si
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_10], eax
		les	bx, [bp+var_C]
		mov	es:[bx], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 36h	; '6'
		mov	word ptr [bp+var_14+2],	ax
		mov	word ptr [bp+var_14], dx
		push	si
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_18], eax
		les	bx, [bp+var_14]
		mov	es:[bx], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 3Ah	; ':'
		mov	word ptr [bp+var_1C+2],	ax
		mov	word ptr [bp+var_1C], dx
		push	si
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_20], eax
		les	bx, [bp+var_1C]

loc_A965E:
		mov	es:[bx], eax

loc_A9662:
		mov	ax, word ptr [bp+arg_0+2]

loc_A9665:
		mov	dx, word ptr [bp+arg_0]
		add	dx, 3Eh	; '>'
		mov	word ptr [bp+var_24+2],	ax
		mov	word ptr [bp+var_24], dx
		push	si
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_28], eax
		les	bx, [bp+var_24]
		mov	es:[bx], eax

loc_A9687:				; CODE XREF: ExprSlot_ReleaseAndLoadExtended_A9565+2Fj
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	si
		leave
		retf
ExprSlot_ReleaseAndLoadExtended_A9565	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 83 lignes, NON DÉTAILLÉE — variante de ExprSlot_ReleaseAndLoad_A94E9.
; ==============================================================================================
ExprSlot_ReleaseAndLoadB_A9690	proc far		; CODE XREF: VROOMM_StubThunk_6CECCJ
					; ExprSlot_ConstructMain_A974A:loc_A9869p

var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jnz	short loc_A96BF
		push	1
		push	0
		push	2
		push	large 36h ; '6'
		push	5C44h

loc_A96AD:
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jz	short loc_A972E

loc_A96BF:				; CODE XREF: ExprSlot_ReleaseAndLoadB_A9690+Fj
		les	bx, [bp+arg_0]

loc_A96C2:
		mov	word ptr es:[bx], 36F9h
		mov	word ptr es:[bx], 36E1h
		mov	ax, word ptr [bp+arg_0]
		add	ax, 2Eh	; '.'
		mov	ax, word ptr [bp+arg_0]
		add	ax, 32h	; '2'
		push	si
		push	word ptr [bp+arg_0+2]
		push	bx
		push	cs
		call	near ptr ExprSlot_LoadFieldGroup_A9450
		add	sp, 6
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 2Eh	; '.'
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		push	si
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_8], eax
		les	bx, [bp+var_4]
		mov	es:[bx], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 32h	; '2'
		mov	word ptr [bp+var_C+2], ax
		mov	word ptr [bp+var_C], dx
		push	si
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_10], eax
		les	bx, [bp+var_C]
		mov	es:[bx], eax

loc_A972E:				; CODE XREF: ExprSlot_ReleaseAndLoadB_A9690+2Dj
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	si
		leave
		retf
ExprSlot_ReleaseAndLoadB_A9690	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, remet à zéro 2 champs (dword à +0/+2) — réinitialisation d'un nœud/slot.
; ==============================================================================================
ExprSlot_ResetFields_A9737	proc far		; CODE XREF: VROOMM_StubThunk_6CED1J ExprSlot_ConstructMain_A974A+Dp

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word ptr [si], 0
		mov	word ptr [si+2], 0
		pop	si
		pop	bp
		retf
ExprSlot_ResetFields_A9737	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 272 lignes, NON DÉTAILLÉE — construit et initialise un ensemble de slots via
; ExprSlot_ResetFields_A9737, ExprSlot_ReleaseAndLoad_A94E9/A9565/A9690, gestion d'erreur —
; constructeur principal du système de slots d'expression.
; ==============================================================================================
ExprSlot_ConstructMain_A974A	proc far		; CODE XREF: VROOMM_StubThunk_6CED6J

var_E		= dword	ptr -0Eh
var_9		= byte ptr -9
var_8		= dword	ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	si

loc_A9751:
		push	di

loc_A9752:
		mov	di, [bp+arg_0]
		push	di

loc_A9756:
		push	cs
		call	near ptr ExprSlot_ResetFields_A9737
		pop	cx
		mov	bx, [bp+arg_2]
		mov	eax, [bx+65h]

loc_A9762:
		mov	[bx+0A8h], eax
		mov	[bp+var_2], 0

loc_A976C:
		jmp	short loc_A97B0
; ���������������������������������������������������������������������������

loc_A976E:				; CODE XREF: ExprSlot_ConstructMain_A974A+9Bj
		push	[bp+arg_2]

loc_A9771:
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx

loc_A9777:
		cmp	ax, 42h	; 'B'
		jz	short loc_A9790
		cmp	ax, 43h	; 'C'
		jz	short loc_A979A
		cmp	ax, 53h	; 'S'
		jnz	short loc_A97A7
		mov	bx, [bp+arg_2]
		add	dword ptr [bx+65h], 30h	; '0'
		jmp	short loc_A97A2
; ���������������������������������������������������������������������������

loc_A9790:				; CODE XREF: ExprSlot_ConstructMain_A974A+30j
		mov	bx, [bp+arg_2]
		add	dword ptr [bx+65h], 40h	; '@'
		jmp	short loc_A97A2
; ���������������������������������������������������������������������������

loc_A979A:				; CODE XREF: ExprSlot_ConstructMain_A974A+35j
		mov	bx, [bp+arg_2]
		add	dword ptr [bx+65h], 34h	; '4'

loc_A97A2:				; CODE XREF: ExprSlot_ConstructMain_A974A+44j
					; ExprSlot_ConstructMain_A974A+4Ej
		inc	[bp+var_2]
		jmp	short loc_A97B0
; ���������������������������������������������������������������������������

loc_A97A7:				; CODE XREF: ExprSlot_ConstructMain_A974A+3Aj
		push	900Dh
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_A97B0:				; CODE XREF: ExprSlot_ConstructMain_A974A:loc_A976Cj
					; ExprSlot_ConstructMain_A974A+5Bj
		mov	bx, [bp+arg_2]

loc_A97B3:
		test	word ptr [bx+72h], 1

loc_A97B8:
		jz	short loc_A97CF
		mov	si, [bp+arg_2]

loc_A97BD:
		mov	eax, [si+76h]
		dec	eax

loc_A97C3:
		cmp	[bx+65h], eax
		jnz	short loc_A97CF
		inc	dword ptr [bx+65h]
		jmp	short $+2

loc_A97CF:				; CODE XREF: ExprSlot_ConstructMain_A974A:loc_A97B8j
					; ExprSlot_ConstructMain_A974A+7Dj
		mov	bx, [bp+arg_2]
		mov	eax, [bx+65h]
		cmp	eax, [bx+76h]
		jl	short loc_A97E1
		mov	ax, 1
		jmp	short loc_A97E3
; ���������������������������������������������������������������������������

loc_A97E1:				; CODE XREF: ExprSlot_ConstructMain_A974A+90j
		xor	ax, ax

loc_A97E3:				; CODE XREF: ExprSlot_ConstructMain_A974A+95j
		or	ax, ax
		jz	short loc_A976E
		mov	bx, [bp+arg_2]
		mov	eax, [bx+0A8h]
		mov	[bx+65h], eax
		mov	ax, [bp+var_2]
		mov	[bp+var_4], ax
		shl	ax, 2
		push	ax
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[di+2],	ax
		cmp	word ptr [di+2], 0
		jz	short loc_A9811
		mov	ax, 1
		jmp	short loc_A9813
; ���������������������������������������������������������������������������

loc_A9811:				; CODE XREF: ExprSlot_ConstructMain_A974A+C0j
		xor	ax, ax

loc_A9813:				; CODE XREF: ExprSlot_ConstructMain_A974A+C5j
		or	ax, ax
		jz	short loc_A981A
		jmp	loc_A98AE
; ���������������������������������������������������������������������������

loc_A981A:				; CODE XREF: ExprSlot_ConstructMain_A974A+CBj
		jmp	loc_A98AE
; ���������������������������������������������������������������������������

loc_A981D:				; CODE XREF: ExprSlot_ConstructMain_A974A+19Bj
		mov	[bp+var_8], 0
		push	[bp+arg_2]
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		mov	[bp+var_9], al
		cbw
		cmp	ax, 42h	; 'B'
		jz	short loc_A9856
		cmp	ax, 43h	; 'C'
		jz	short loc_A9862
		cmp	ax, 53h	; 'S'
		jnz	short loc_A986E
		push	[bp+arg_2]
		push	large 0
		push	cs
		call	near ptr ExprSlot_ReleaseAndLoad_A94E9

loc_A984B:				; CODE XREF: ExprSlot_ConstructMain_A974A+116j
					; ExprSlot_ConstructMain_A974A:loc_A986Cj
		add	sp, 6
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		jmp	short loc_A9877
; ���������������������������������������������������������������������������

loc_A9856:				; CODE XREF: ExprSlot_ConstructMain_A974A+EBj
		push	[bp+arg_2]
		push	large 0
		push	cs

loc_A985D:
		call	near ptr ExprSlot_ReleaseAndLoadExtended_A9565
		jmp	short loc_A984B
; ���������������������������������������������������������������������������

loc_A9862:				; CODE XREF: ExprSlot_ConstructMain_A974A+F0j
		push	[bp+arg_2]

loc_A9865:
		push	large 0

loc_A9868:
		push	cs

loc_A9869:
		call	near ptr ExprSlot_ReleaseAndLoadB_A9690

loc_A986C:
		jmp	short loc_A984B
; ���������������������������������������������������������������������������

loc_A986E:				; CODE XREF: ExprSlot_ConstructMain_A974A+F5j
		push	900Fh

loc_A9871:
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_A9877:				; CODE XREF: ExprSlot_ConstructMain_A974A+10Aj
		mov	eax, [bp+var_8]
		mov	[bp+var_E], eax
		cmp	[bp+var_E], 0
		jz	short loc_A988B
		mov	ax, 1
		jmp	short loc_A988D
; ���������������������������������������������������������������������������

loc_A988B:				; CODE XREF: ExprSlot_ConstructMain_A974A+13Aj
		xor	ax, ax

loc_A988D:				; CODE XREF: ExprSlot_ConstructMain_A974A+13Fj
		mov	cx, ax
		or	cx, cx
		jz	short loc_A98AC
		mov	ax, [di]
		inc	word ptr [di]
		shl	ax, 2
		mov	bx, [di+2]
		add	bx, ax
		mov	ax, word ptr [bp+var_E+2]
		mov	dx, word ptr [bp+var_E]
		mov	[bx+2],	ax
		mov	[bx], dx
		jmp	short $+2

loc_A98AC:				; CODE XREF: ExprSlot_ConstructMain_A974A+147j
		or	cx, cx

loc_A98AE:				; CODE XREF: ExprSlot_ConstructMain_A974A+CDj
					; ExprSlot_ConstructMain_A974A:loc_A981Aj
		mov	bx, [bp+arg_2]

loc_A98B1:
		test	word ptr [bx+72h], 1
		jz	short loc_A98CD
		mov	si, [bp+arg_2]
		mov	eax, [si+76h]
		dec	eax
		cmp	[bx+65h], eax
		jnz	short loc_A98CD
		inc	dword ptr [bx+65h]
		jmp	short $+2

loc_A98CD:				; CODE XREF: ExprSlot_ConstructMain_A974A+16Cj
					; ExprSlot_ConstructMain_A974A+17Bj
		mov	bx, [bp+arg_2]
		mov	eax, [bx+65h]
		cmp	eax, [bx+76h]
		jl	short loc_A98DF
		mov	ax, 1
		jmp	short loc_A98E1
; ���������������������������������������������������������������������������

loc_A98DF:				; CODE XREF: ExprSlot_ConstructMain_A974A+18Ej
		xor	ax, ax

loc_A98E1:				; CODE XREF: ExprSlot_ConstructMain_A974A+193j
		or	ax, ax
		jnz	short loc_A98E8
		jmp	loc_A981D
; ���������������������������������������������������������������������������

loc_A98E8:				; CODE XREF: ExprSlot_ConstructMain_A974A+199j
		pop	di
		pop	si
		leave
		retf
ExprSlot_ConstructMain_A974A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, parcourt un tableau de slots (stride 4 octets, tag 5C44h) et libère chaque entrée
; (Memory_TypedFree_5C7B6), les remet à zéro.
; ==============================================================================================
ExprSlot_ReleaseArray_A98EC	proc far		; CODE XREF: VROOMM_StubThunk_6CEDBJ

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0
		jz	short loc_A9952
		xor	di, di
		jmp	short loc_A993C
; ���������������������������������������������������������������������������

loc_A9900:				; CODE XREF: ExprSlot_ReleaseArray_A98EC+52j
		mov	ax, di
		shl	ax, 2
		mov	bx, [si+2]
		add	bx, ax
		mov	ax, [bx+2]
		mov	dx, [bx]
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		mov	ax, di
		shl	ax, 2
		mov	bx, [si+2]
		add	bx, ax
		mov	word ptr [bx+2], 0
		mov	word ptr [bx], 0
		inc	di

loc_A993C:				; CODE XREF: ExprSlot_ReleaseArray_A98EC+12j
		cmp	[si], di
		jg	short loc_A9900
		push	word ptr [si+2]
		call	CRT_FreeNear_Wrap
		pop	cx
		mov	word ptr [si+2], 0
		mov	word ptr [si], 0

loc_A9952:				; CODE XREF: ExprSlot_ReleaseArray_A98EC+Ej
		pop	di
		pop	si
		leave
		retf
ExprSlot_ReleaseArray_A98EC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 125 lignes, LUE INTEGRALEMENT (session ordres de mission avec Remi). RENOMMEE (ancien
; nom 'ExprSlot_ReleaseAndReloadDword' n'avait aucun rapport). C'EST LE VRAI LECTEUR DU CHUNK
; CAST (confirme via DATA_MODEL.md 'sub_6CF0D->A9956'). Taille d'enregistrement : 9 octets
; (compteur = taille_chunk/9). Pour chaque entree : si le tag vaut le litteral 'TEAM' (4
; octets), lit un 5eme octet comme caractere ASCII de numero d'equipe (0-9), puis copie un nom
; de pilote de 8 caracteres par-dessus (deborde volontairement sur l'entree suivante) — soit
; 'BILLY' en dur si byte_7070E==0 (mode test/defaut), soit une entree resolue depuis une table
; nommee (word_706A0+0x86+idx*9) sinon. CONCLUSION : CAST est la table qui associe un numero
; d'equipe au NOM DE FICHIER PROF a charger — le chainon manquant vers
; PilotProfile_LoadFromPROF.
; ==============================================================================================
PLAY_LoadCASTTeamNames_A9956	proc far		; CODE XREF: VROOMM_StubThunk_6CF0DJ

var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp

loc_A9959:
		sub	sp, 18h

loc_A995C:
		push	si
		push	di
		mov	si, [bp+arg_0]

loc_A9961:
		mov	di, [bp+arg_2]
		mov	word ptr [si], 0

loc_A9968:
		mov	dword ptr [si+2], 0

loc_A9970:
		mov	ax, [di+72h]

loc_A9973:
		mov	bx, 9
		xor	dx, dx
		div	bx
		mov	[si], ax
		push	1
		push	0
		push	2
		push	large dword ptr	[di+72h]
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	[si+4],	dx
		mov	[si+2],	ax
		push	large dword ptr	[si+2]
		push	di
		call	ResourceRecord_ReadDwordFieldB_64AFF
		add	sp, 6
		mov	eax, [si+2]
		mov	[bp+var_4], eax
		xor	di, di
		jmp	loc_A9A39
; ���������������������������������������������������������������������������

loc_A99B1:				; CODE XREF: PLAY_LoadCASTTeamNames_A9956+E7j
		les	bx, [bp+var_4]
		cmp	dword ptr es:[bx], 4D414554h
		jnz	short loc_A9A34
		mov	al, es:[bx+4]
		cbw

loc_A99C3:
		add	ax, 0FFD0h
		mov	dx, ax
		mov	al, byte_7070E
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A99F4
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		mov	[bp+var_C], eax
		push	8
		push	ds
		push	offset aBilly	; "BILLY"
		push	large [bp+var_C]
		call	CRT_MemFamily_Extra8
		add	sp, 0Ah
		les	bx, [bp+var_C]
		jmp	short loc_A9A2F
; ���������������������������������������������������������������������������

loc_A99F4:				; CODE XREF: PLAY_LoadCASTTeamNames_A9956+79j
		cmp	dx, 3
		jnb	short loc_A9A34
		mov	eax, [bp+var_4]
		mov	[bp+var_10], eax
		mov	[bp+var_14], eax
		mov	ax, dx
		imul	ax, 9
		mov	dx, word_706A0
		add	dx, ax
		add	dx, 86h	; '�'
		mov	[bp+var_16], ds
		mov	[bp+var_18], dx
		push	8
		push	[bp+var_16]
		push	dx
		push	large [bp+var_14]
		call	CRT_MemFamily_Extra8
		add	sp, 0Ah
		les	bx, [bp+var_14]

loc_A9A2F:				; CODE XREF: PLAY_LoadCASTTeamNames_A9956+9Cj
		mov	byte ptr es:[bx+8], 0

loc_A9A34:				; CODE XREF: PLAY_LoadCASTTeamNames_A9956+66j
					; PLAY_LoadCASTTeamNames_A9956+A1j
		inc	di
		add	word ptr [bp+var_4], 9

loc_A9A39:				; CODE XREF: PLAY_LoadCASTTeamNames_A9956+58j
		cmp	[si], di
		jle	short loc_A9A40
		jmp	loc_A99B1
; ���������������������������������������������������������������������������

loc_A9A40:				; CODE XREF: PLAY_LoadCASTTeamNames_A9956+E5j
		pop	di
		pop	si
		leave
		retf
PLAY_LoadCASTTeamNames_A9956	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, libère un slot (Memory_TypedFree_5C7B6).
; ==============================================================================================
ExprSlot_ReleaseSingle_A9A44	proc far		; CODE XREF: VROOMM_StubThunk_6CF12J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	dword ptr [si+2], 0
		jz	short loc_A9A78

loc_A9A52:
		cmp	word ptr [si], 0
		jz	short loc_A9A78
		push	0
		push	2
		mov	ax, si

loc_A9A5D:
		add	ax, 2

loc_A9A60:
		push	ax
		push	5C44h

loc_A9A64:
		call	Memory_TypedFree_5C7B6

loc_A9A69:
		add	sp, 8

loc_A9A6C:
		mov	dword ptr [si+2], 0
		mov	word ptr [si], 0

loc_A9A78:				; CODE XREF: ExprSlot_ReleaseSingle_A9A44+Cj
					; ExprSlot_ReleaseSingle_A9A44+11j
		pop	si
		pop	bp
		retf
ExprSlot_ReleaseSingle_A9A44	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, réinitialisation minimale (13 lignes).
; ==============================================================================================
ExprSlot_ResetFieldsB_A9A7B	proc far		; CODE XREF: VROOMM_StubThunk_6CE9AJ ExprSlot_ReleaseAndReloadDwordB_A9A89+Dp

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word ptr [si], 0
		pop	si
		pop	bp
		retf
ExprSlot_ResetFieldsB_A9A7B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine ExprSlot_ResetFieldsB_A9A7B, Memory_TypedFreeWrapperC_5C6F3,
; ResourceRecord_ReadDwordFieldB_64AFF.
; ==============================================================================================
ExprSlot_ReleaseAndReloadDwordB_A9A89	proc far		; CODE XREF: VROOMM_StubThunk_6CE9FJ

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	si
		push	cs
		call	near ptr ExprSlot_ResetFieldsB_A9A7B
		pop	cx
		mov	eax, [di+72h]
		mov	ebx, 2
		cdq
		idiv	ebx
		mov	[si], ax
		cmp	word ptr [si], 0
		jz	short loc_A9AD3
		push	1
		push	0

loc_A9AB4:
		push	2

loc_A9AB6:
		mov	ax, [si]

loc_A9AB8:
		shl	ax, 1
		movzx	eax, ax

loc_A9ABE:
		push	eax
		push	5C44h

loc_A9AC3:
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	[si+4],	dx
		mov	[si+2],	ax
		jmp	short loc_A9ADB
; ���������������������������������������������������������������������������

loc_A9AD3:				; CODE XREF: ExprSlot_ReleaseAndReloadDwordB_A9A89+25j
		mov	dword ptr [si+2], 0

loc_A9ADB:				; CODE XREF: ExprSlot_ReleaseAndReloadDwordB_A9A89+48j
		push	large dword ptr	[si+2]
		push	di
		call	ResourceRecord_ReadDwordFieldB_64AFF
		add	sp, 6
		pop	di
		pop	si
		pop	bp
		retf
ExprSlot_ReleaseAndReloadDwordB_A9A89	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, libère un slot (Memory_TypedFree_5C7B6).
; ==============================================================================================
ExprSlot_ReleaseSingleB_A9AEC	proc far		; CODE XREF: VROOMM_StubThunk_6CEA4J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0
		jz	short loc_A9B11
		push	0
		push	2
		mov	ax, si
		add	ax, 2
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		mov	word ptr [si], 0

loc_A9B11:				; CODE XREF: ExprSlot_ReleaseSingleB_A9AEC+Aj
		pop	si
		pop	bp
		retf
ExprSlot_ReleaseSingleB_A9AEC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 121 lignes, NON DÉTAILLÉE — combine sub_2EA5, sub_2B6D (décodage), sub_2E3C —
; probable décodage d'un champ compressé/codé du scénario de mission.
; ==============================================================================================
MissionScenario_DecodeFieldA_A9B14	proc far		; CODE XREF: VROOMM_StubThunk_6CF62J MissionScenario_DispatchDecodeA_A9FD0+4Fp

var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= byte ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		push	large [bp+arg_2]
		call	CRT_Strlen_Far
		add	sp, 4
		push	8
		push	36D6h
		lea	ax, [bp+var_C]
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	[bp+var_4], 0
		les	bx, [bp+arg_2]
		mov	eax, es:[bx]
		cmp	eax, [bp+var_C]
		jnz	short loc_A9B62
		mov	eax, es:[bx+4]
		cmp	eax, [bp+var_8]
		jnz	short loc_A9B62
		mov	ax, 1
		jmp	short loc_A9B64
; ���������������������������������������������������������������������������

loc_A9B62:				; CODE XREF: MissionScenario_DecodeFieldA_A9B14+3Cj
					; MissionScenario_DecodeFieldA_A9B14+47j
		xor	ax, ax

loc_A9B64:				; CODE XREF: MissionScenario_DecodeFieldA_A9B14+4Cj
		or	al, al
		jz	short loc_A9B70

loc_A9B68:
		mov	ax, [bp+arg_6]
		mov	[bp+var_2], ax
		jmp	short loc_A9BD1
; ���������������������������������������������������������������������������

loc_A9B70:				; CODE XREF: MissionScenario_DecodeFieldA_A9B14+52j
		xor	di, di

loc_A9B72:
		jmp	short loc_A9BCD
; ���������������������������������������������������������������������������

loc_A9B74:				; CODE XREF: MissionScenario_DecodeFieldA_A9B14+BBj
		mov	eax, [bp+arg_2]
		mov	[bp+var_10], eax
		push	8
		push	large [bp+var_10]
		mov	ax, [si+22h]
		mov	dx, di
		imul	dx, 9
		add	ax, dx
		push	word ptr [si+24h]
		push	ax
		call	CRT_MemFamily_Extra7
		add	sp, 0Ah
		or	ax, ax
		jnz	short loc_A9BA1
		mov	ax, 1
		jmp	short loc_A9BA3
; ���������������������������������������������������������������������������

loc_A9BA1:				; CODE XREF: MissionScenario_DecodeFieldA_A9B14+86j
		xor	ax, ax

loc_A9BA3:				; CODE XREF: MissionScenario_DecodeFieldA_A9B14+8Bj
		or	al, al
		jz	short loc_A9BCC
		mov	ax, [bp+arg_6]
		mov	[bp+var_2], ax
		mov	bx, di
		shl	bx, 1
		mov	ax, [bx+si+2]

loc_A9BB4:
		cmp	ax, [bp+arg_6]
		jge	short loc_A9BC0
		mov	bx, di
		shl	bx, 1
		mov	[bp+var_2], ax

loc_A9BC0:				; CODE XREF: MissionScenario_DecodeFieldA_A9B14+A3j
		mov	bx, di
		shl	bx, 1
		mov	ax, [bp+var_2]
		sub	[bx+si+2], ax
		jmp	short loc_A9BD1
; ���������������������������������������������������������������������������

loc_A9BCC:				; CODE XREF: MissionScenario_DecodeFieldA_A9B14+91j
		inc	di

loc_A9BCD:				; CODE XREF: MissionScenario_DecodeFieldA_A9B14:loc_A9B72j
		cmp	[si], di
		jg	short loc_A9B74

loc_A9BD1:				; CODE XREF: MissionScenario_DecodeFieldA_A9B14+5Aj
					; MissionScenario_DecodeFieldA_A9B14+B6j
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
MissionScenario_DecodeFieldA_A9B14	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 139 lignes, NON DÉTAILLÉE — variante de MissionScenario_DecodeFieldA_A9B14 avec
; sub_2E74 additionnel.
; ==============================================================================================
MissionScenario_DecodeFieldB_A9BD8	proc far		; CODE XREF: VROOMM_StubThunk_6CF67J MissionScenario_LoadAndDecodeField_A9CC3+53p	...

var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_2		= byte ptr -2
arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		push	di
		mov	di, [bp+arg_0]
		cmp	[bp+arg_6], 0
		jnz	short loc_A9BEC
		jmp	loc_A9CBF
; ���������������������������������������������������������������������������

loc_A9BEC:				; CODE XREF: MissionScenario_DecodeFieldB_A9BD8+Fj
		push	8
		push	36D6h
		lea	ax, [bp+var_A]
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	[bp+var_2], 0
		push	large [bp+arg_2]
		call	CRT_Strlen_Far
		add	sp, 4
		les	bx, [bp+arg_2]
		mov	eax, es:[bx]
		cmp	eax, [bp+var_A]
		jnz	short loc_A9C2A
		mov	eax, es:[bx+4]
		cmp	eax, [bp+var_6]
		jnz	short loc_A9C2A
		mov	ax, 1
		jmp	short loc_A9C2C
; ���������������������������������������������������������������������������

loc_A9C2A:				; CODE XREF: MissionScenario_DecodeFieldB_A9BD8+40j
					; MissionScenario_DecodeFieldB_A9BD8+4Bj
		xor	ax, ax

loc_A9C2C:				; CODE XREF: MissionScenario_DecodeFieldB_A9BD8+50j
		or	al, al
		jz	short loc_A9C33
		jmp	loc_A9CBF
; ���������������������������������������������������������������������������

loc_A9C33:				; CODE XREF: MissionScenario_DecodeFieldB_A9BD8+56j
		xor	si, si
		jmp	short loc_A9C77
; ���������������������������������������������������������������������������

loc_A9C37:				; CODE XREF: MissionScenario_DecodeFieldB_A9BD8+A1j
		mov	eax, [bp+arg_2]
		mov	[bp+var_12], eax
		push	8
		push	large [bp+var_12]
		mov	ax, [di+22h]
		mov	dx, si
		imul	dx, 9
		add	ax, dx
		push	word ptr [di+24h]
		push	ax
		call	CRT_MemFamily_Extra7
		add	sp, 0Ah
		or	ax, ax
		jnz	short loc_A9C64

loc_A9C5F:
		mov	ax, 1

loc_A9C62:
		jmp	short loc_A9C66
; ���������������������������������������������������������������������������

loc_A9C64:				; CODE XREF: MissionScenario_DecodeFieldB_A9BD8+85j
		xor	ax, ax

loc_A9C66:				; CODE XREF: MissionScenario_DecodeFieldB_A9BD8:loc_A9C62j
		or	al, al

loc_A9C68:
		jz	short loc_A9C76
		mov	bx, si
		shl	bx, 1

loc_A9C6E:
		mov	ax, [bp+arg_6]
		add	[bx+di+2], ax

loc_A9C74:
		jmp	short loc_A9CBF
; ���������������������������������������������������������������������������

loc_A9C76:				; CODE XREF: MissionScenario_DecodeFieldB_A9BD8:loc_A9C68j
		inc	si

loc_A9C77:				; CODE XREF: MissionScenario_DecodeFieldB_A9BD8+5Dj
		cmp	[di], si
		jg	short loc_A9C37
		cmp	word ptr [di], 10h
		jge	short loc_A9CBF
		mov	eax, [bp+arg_2]
		mov	[bp+var_E], eax
		push	8
		push	large [bp+var_E]
		mov	ax, [di+22h]
		mov	dx, [di]
		imul	dx, 9
		add	ax, dx
		push	word ptr [di+24h]
		push	ax
		call	CRT_MemFamily_Extra8
		add	sp, 0Ah
		les	bx, [di+22h]
		mov	ax, [di]
		imul	ax, 9
		add	bx, ax
		mov	byte ptr es:[bx+8], 0
		mov	bx, [di]
		shl	bx, 1
		mov	ax, [bp+arg_6]
		mov	[bx+di+2], ax
		inc	word ptr [di]

loc_A9CBF:				; CODE XREF: MissionScenario_DecodeFieldB_A9BD8+11j
					; MissionScenario_DecodeFieldB_A9BD8+58j ...
		pop	di
		pop	si
		leave
		retf
MissionScenario_DecodeFieldB_A9BD8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 95 lignes, NON DÉTAILLÉE — combine ResourceRecord_SeekAndRead_64743, sub_2AFB5,
; ReadFieldGroupB_64A54, sub_2AFE0, MissionScenario_DecodeFieldB_A9BD8.
; ==============================================================================================
MissionScenario_LoadAndDecodeField_A9CC3	proc far		; CODE XREF: VROOMM_StubThunk_6CF6CJ

var_C		= word ptr -0Ch
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	di, [bp+arg_0]
		push	0
		push	large 534E5057h
		push	[bp+arg_2]
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_A9D62
		lea	ax, [bp+var_C]
		push	ax
		call	String_ConstructEmpty
		pop	cx
		jmp	short loc_A9D1C
; ���������������������������������������������������������������������������

loc_A9CF1:				; CODE XREF: MissionScenario_LoadAndDecodeField_A9CC3:loc_A9D51j
		push	[bp+arg_2]
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_2], ax
		push	[bp+arg_2]
		lea	ax, [bp+var_C]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		push	[bp+var_2]
		push	ds
		lea	ax, [bp+var_C]
		push	ax
		push	di
		push	cs
		call	near ptr MissionScenario_DecodeFieldB_A9BD8
		add	sp, 8

loc_A9D1C:				; CODE XREF: MissionScenario_LoadAndDecodeField_A9CC3+2Cj
		mov	bx, [bp+arg_2]
		test	word ptr [bx+72h], 1
		jz	short loc_A9D3B
		mov	si, [bp+arg_2]
		mov	eax, [si+76h]
		dec	eax
		cmp	[bx+65h], eax
		jnz	short loc_A9D3B
		inc	dword ptr [bx+65h]
		jmp	short $+2

loc_A9D3B:				; CODE XREF: MissionScenario_LoadAndDecodeField_A9CC3+61j
					; MissionScenario_LoadAndDecodeField_A9CC3+70j
		mov	bx, [bp+arg_2]
		mov	eax, [bx+65h]
		cmp	eax, [bx+76h]
		jl	short loc_A9D4D
		mov	ax, 1
		jmp	short loc_A9D4F
; ���������������������������������������������������������������������������

loc_A9D4D:				; CODE XREF: MissionScenario_LoadAndDecodeField_A9CC3+83j
		xor	ax, ax

loc_A9D4F:				; CODE XREF: MissionScenario_LoadAndDecodeField_A9CC3+88j
		or	ax, ax

loc_A9D51:
		jz	short loc_A9CF1

loc_A9D53:
		mov	bx, [bp+arg_2]

loc_A9D56:
		mov	eax, [bx+76h]
		mov	[bx+65h], eax

loc_A9D5E:
		mov	byte ptr [bx+6Dh], 0

loc_A9D62:				; CODE XREF: MissionScenario_LoadAndDecodeField_A9CC3+20j
		pop	di
		pop	si

locret_A9D64:
		leave
		retf
MissionScenario_LoadAndDecodeField_A9CC3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine ResourceRecord_WriteFieldGroupA_64E50, StreamReader_WriteTyped_6568F (×2,
; seg195), ResourceRecord_WriteFieldWrapper_64FD8 (seg194) — écriture de champs pour le
; système de slots d'expression.
; ==============================================================================================
ExprSlot_WriteFieldGroup_A9D66	proc far		; CODE XREF: VROOMM_StubThunk_6CF71J

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
		push	large 0
		push	large 534E5057h
		push	di
		call	ResourceRecord_WriteFieldGroupA_64E50
		add	sp, 0Ah
		mov	[bp+var_2], 0
		jmp	short loc_A9DEB
; ���������������������������������������������������������������������������

loc_A9D8D:				; CODE XREF: ExprSlot_WriteFieldGroup_A9D66+8Aj
		mov	bx, [bp+var_2]
		shl	bx, 1
		cmp	word ptr [bx+si+2], 0
		jz	short loc_A9DE8
		mov	bx, [bp+var_2]
		shl	bx, 1
		mov	ax, [bx+si+2]
		mov	[bp+var_4], ax
		push	large dword ptr	[di+65h]
		push	large 2
		push	ss
		lea	ax, [bp+var_4]
		push	ax
		push	di
		call	StreamReader_WriteTyped_6568F

loc_A9DB5:
		add	sp, 0Eh
		add	dword ptr [di+65h], 2
		mov	ax, [si+24h]
		mov	dx, [si+22h]
		mov	bx, [bp+var_2]
		imul	bx, 9
		add	dx, bx
		mov	[bp+var_6], ax
		mov	[bp+var_8], dx
		push	large dword ptr	[di+65h]
		push	large 8
		push	ax
		push	dx
		push	di
		call	StreamReader_WriteTyped_6568F
		add	sp, 0Eh
		add	dword ptr [di+65h], 8

loc_A9DE8:				; CODE XREF: ExprSlot_WriteFieldGroup_A9D66+30j
		inc	[bp+var_2]

loc_A9DEB:				; CODE XREF: ExprSlot_WriteFieldGroup_A9D66+25j
		mov	ax, [si]
		cmp	ax, [bp+var_2]
		jg	short loc_A9D8D
		push	di
		call	ResourceRecord_WriteFieldWrapper_64FD8
		pop	cx
		pop	di
		pop	si
		leave
		retf
ExprSlot_WriteFieldGroup_A9D66	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 19 lignes, LUE INTEGRALEMENT (session ordres de mission avec Remi). Reinitialise une
; entree PART (participant de mission) (85 octets, voir MissionObject_AllocateArray_AA23D) a
; son etat de repos : +0x32=0xFF, +0x3A(dword)=0, efface 6 bits de +0x39 (le meme champ de
; statut verifie par la garde d'entree de MissionScript_CallNativeHandler),
; +0x52(controleur)=0, +0x54(achevement)=0xFF. Ne construit PAS de vrai controleur — remet
; seulement a NUL.
; ==============================================================================================
PartEntry_ResetState_A9DFD	proc far		; CODE XREF: VROOMM_StubThunk_6CF17J PartEntry_LoadAndResolveNames_A9E3C+10p

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+32h], 0FFh
		mov	dword ptr es:[bx+3Ah], 0
		and	byte ptr es:[bx+39h], 0FEh
		and	byte ptr es:[bx+39h], 0FDh
		and	byte ptr es:[bx+39h], 0FBh
		and	byte ptr es:[bx+39h], 0F7h
		and	byte ptr es:[bx+39h], 0EFh
		and	byte ptr es:[bx+39h], 0DFh
		mov	word ptr es:[bx+52h], 0
		mov	byte ptr es:[bx+54h], 0FFh
		pop	bp
		retf
PartEntry_ResetState_A9DFD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 183 lignes, LUE INTEGRALEMENT (session ordres de mission avec Remi — croisement avec
; DATA_MODEL.md et l'implementation C de Remi). RENOMMEE (MissionObject -> PartEntry) : cette
; structure de 85 octets EST une entree du chunk PART (participants/factions), confirme par
; DATA_MODEL.md ('sub_6CF35->AA23D (PART)').   DECOUVERTE MAJEURE : contient les 4
; identifiants de script 'progs_id' de l'implementation de Remi, resolus ICI en pointeurs
; directs vers le PROG via 4 appels identiques a Expr_LookupNamedValue_51E4A(word_706A0+0x40,
; id_brut) :   - PartEntry+0x42/0x44 (far ptr) = on_is_activated  (progs_id[0])   -
; PartEntry+0x46/0x48 (far ptr) = on_mission_update (progs_id[1])   - PartEntry+0x4A/0x4C (far
; ptr) = on_is_destroyed  (progs_id[2])   - PartEntry+0x4E/0x50 (far ptr) = on_missions_init
; (progs_id[3]) Ordre et noms confirmes par l'implementation C de Remi. Chaque champ est un
; pointeur RESOLU vers le script reel (pas l'id brut) — resolution faite une fois au
; chargement, pas a chaque execution. Suivi de deux champs remis a zero (+0x3E, +0x40) —
; candidats pour l'etat d'execution courant, a confirmer.   Debut de fonction (avant les
; progs_id) : appelle PartEntry_ResetState_A9DFD, lit 62 octets bruts du chunk
; (ResourceRecord_ReadFieldGroupA), en extrait +0x1B (1er octet), resout 3 noms de 8
; caracteres via sub_2E74 (aux offsets entite+9, +0x12, +0x1A -- roles precis non elucides),
; resout une position nommee via GeomNode_SumAndCount_53034 -> +0x1D/+0x1F/+0x1C, copie des
; champs +0x21/+0x25/+0x29/+0x2D/+0x2F/+0x31/+0x32/+0x33/+0x35/+0x37 (roles precis non
; elucides, correspondent probablement a d'autres champs de l'implementation de Remi -- point
; ouvert).
; ==============================================================================================
PartEntry_LoadAndResolveNames_A9E3C	proc far		; CODE XREF: VROOMM_StubThunk_6CF1CJ PartEntry_AllocateArray_AA23D+6Fp

var_4A		= word ptr -4Ah
var_48		= word ptr -48h
var_40		= word ptr -40h
var_38		= word ptr -38h
var_30		= word ptr -30h
var_2E		= byte ptr -2Eh
var_2D		= dword	ptr -2Dh
var_29		= dword	ptr -29h
var_25		= dword	ptr -25h
var_21		= word ptr -21h
var_1F		= word ptr -1Fh
var_1D		= byte ptr -1Dh
var_1C		= byte ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4Ah
		push	si
		mov	si, word_706A0
		push	large [bp+arg_0]
		push	cs
		call	near ptr PartEntry_ResetState_A9DFD

loc_A9E4F:
		add	sp, 4
		push	large 3Eh ; '>'
		push	ss
		lea	ax, [bp+var_4A]
		push	ax
		push	[bp+arg_4]

loc_A9E5D:
		call	ResourceRecord_ReadFieldGroupA_64A19

loc_A9E62:
		add	sp, 0Ah
		les	bx, [bp+arg_0]
		mov	al, byte ptr [bp+var_4A]
		mov	es:[bx+1Bh], al
		push	8
		push	ss

loc_A9E72:
		lea	ax, [bp+var_48]
		push	ax
		push	word ptr [bp+arg_0+2]
		push	bx
		call	CRT_MemFamily_Extra8
		add	sp, 0Ah
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+8], 0
		push	8
		push	ss
		lea	ax, [bp+var_40]
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 9
		push	word ptr [bp+arg_0+2]
		push	ax
		call	CRT_MemFamily_Extra8
		add	sp, 0Ah
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+11h], 0
		push	8
		push	ss
		lea	ax, [bp+var_38]
		push	ax

loc_A9EB2:
		mov	ax, word ptr [bp+arg_0]
		add	ax, 12h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	CRT_MemFamily_Extra8
		add	sp, 0Ah
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+1Ah], 0
		push	[bp+var_30]
		mov	ax, si
		add	ax, 1Ah
		push	ax
		call	GeomNode_SumAndCount_53034
		add	sp, 4
		les	bx, [bp+arg_0]
		mov	es:[bx+1Fh], dx
		mov	es:[bx+1Dh], ax
		mov	al, [bp+var_2E]
		mov	es:[bx+1Ch], al
		mov	eax, [bp+var_2D]
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		mov	es:[bx+21h], eax
		mov	eax, [bp+var_29]
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	es:[bx+25h], eax
		mov	eax, [bp+var_25]
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	es:[bx+29h], eax
		mov	ax, [bp+var_21]
		mov	es:[bx+2Dh], ax
		mov	ax, [bp+var_1F]
		mov	es:[bx+2Fh], ax
		mov	al, [bp+var_1D]
		mov	es:[bx+31h], al
		mov	al, [bp+var_1C]
		mov	es:[bx+32h], al
		mov	ax, [bp+var_1A]
		mov	es:[bx+33h], ax
		mov	ax, [bp+var_18]
		mov	es:[bx+35h], ax
		mov	ax, [bp+var_16]

loc_A9F4F:
		mov	es:[bx+37h], ax
		push	[bp+var_14]
		mov	ax, si
		add	ax, 40h	; '@'
		push	ax
		call	Expr_LookupNamedValue_51E4A

loc_A9F61:
		add	sp, 4

loc_A9F64:
		les	bx, [bp+arg_0]

loc_A9F67:
		mov	es:[bx+44h], dx

loc_A9F6B:
		mov	es:[bx+42h], ax
		push	[bp+var_12]

loc_A9F72:
		mov	ax, si
		add	ax, 40h	; '@'
		push	ax
		call	Expr_LookupNamedValue_51E4A
		add	sp, 4
		les	bx, [bp+arg_0]
		mov	es:[bx+48h], dx
		mov	es:[bx+46h], ax
		push	[bp+var_10]
		mov	ax, si
		add	ax, 40h	; '@'
		push	ax
		call	Expr_LookupNamedValue_51E4A
		add	sp, 4
		les	bx, [bp+arg_0]
		mov	es:[bx+4Ch], dx
		mov	es:[bx+4Ah], ax
		push	[bp+var_E]
		mov	ax, si
		add	ax, 40h	; '@'
		push	ax
		call	Expr_LookupNamedValue_51E4A
		add	sp, 4
		les	bx, [bp+arg_0]
		mov	es:[bx+50h], dx
		mov	es:[bx+4Eh], ax
		xor	ax, ax
		mov	es:[bx+40h], ax
		mov	es:[bx+3Eh], ax
		pop	si
		leave
		retf
PartEntry_LoadAndResolveNames_A9E3C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, référencée via jmp depuis des stubs VROOMM (sub_6C3EE/6C3E9), appelle
; MissionScenario_DecodeFieldA_A9B14.
; ==============================================================================================
MissionScenario_DispatchDecodeA_A9FD0	proc far		; CODE XREF: VROOMM_StubThunk_6CF21J

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+52h], 0
		jz	short loc_AA048
		mov	si, es:[bx+52h]
		mov	eax, [si+5Ah]
		mov	[bp+var_4], eax
		les	bx, [bp+var_4]
		mov	eax, es:[bx+14h]
		mov	[bp+var_8], eax
		push	word ptr [bp+var_4+2]
		push	bx
		call	VROOMM_StubThunk_6C3EE
		add	sp, 4
		xor	si, si
		jmp	short loc_AA033
; ���������������������������������������������������������������������������

loc_AA009:				; CODE XREF: MissionScenario_DispatchDecodeA_A9FD0+6Aj
		les	bx, [bp+var_8]
		mov	dx, es:[bx+10h]
		push	dx
		mov	ax, word ptr [bp+var_8]
		add	ax, 4
		push	word ptr [bp+var_8+2]
		push	ax
		push	[bp+arg_4]
		push	cs
		call	near ptr MissionScenario_DecodeFieldA_A9B14
		add	sp, 8
		mov	dx, ax
		les	bx, [bp+var_8]
		mov	es:[bx+10h], dx
		inc	si
		add	word ptr [bp+var_8], 12h

loc_AA033:				; CODE XREF: MissionScenario_DispatchDecodeA_A9FD0+37j
		les	bx, [bp+var_4]
		cmp	es:[bx+1Ch], si
		jg	short loc_AA009
		push	word ptr [bp+var_4+2]
		push	bx
		call	VROOMM_StubThunk_6C3E9
		add	sp, 4

loc_AA048:				; CODE XREF: MissionScenario_DispatchDecodeA_A9FD0+Fj
		pop	si
		leave
		retf
MissionScenario_DispatchDecodeA_A9FD0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 88 lignes, NON DÉTAILLÉE — appelle MissionScenario_DecodeFieldB_A9BD8.
; ==============================================================================================
MissionScenario_DispatchDecodeB_AA04B	proc far		; CODE XREF: VROOMM_StubThunk_6CF26J

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si

loc_AA052:
		les	bx, [bp+arg_0]

loc_AA055:
		mov	al, es:[bx+39h]
		shl	ax, 0Eh

loc_AA05C:
		sar	ax, 0Fh
		or	ax, ax
		jnz	short loc_AA0C4

loc_AA063:
		cmp	word ptr es:[bx+52h], 0
		jz	short loc_AA0C4

loc_AA06A:
		mov	bx, es:[bx+52h]

loc_AA06E:
		mov	ax, [bx+5Ch]

loc_AA071:
		mov	dx, [bx+5Ah]

loc_AA074:
		mov	word ptr [bp+var_4+2], ax

loc_AA077:
		mov	word ptr [bp+var_4], dx
		xor	si, si
		jmp	short loc_AA099
; ���������������������������������������������������������������������������

loc_AA07E:				; CODE XREF: MissionScenario_DispatchDecodeB_AA04B+77j
		les	bx, [bp+var_8]
		push	word ptr es:[bx+13h]
		mov	ax, word ptr [bp+var_8]
		add	ax, 1Ah
		push	word ptr [bp+var_8+2]
		push	ax
		push	[bp+arg_4]
		push	cs
		call	near ptr MissionScenario_DecodeFieldB_A9BD8
		add	sp, 8

loc_AA099:				; CODE XREF: MissionScenario_DispatchDecodeB_AA04B+31j
		mov	cx, si
		inc	si
		les	bx, [bp+var_4]
		cmp	es:[bx+38h], cx
		jle	short loc_AA0B6
		mov	dx, es:[bx+36h]
		mov	ax, es:[bx+34h]
		mov	bx, cx
		imul	bx, 23h
		add	ax, bx
		jmp	short loc_AA0BA
; ���������������������������������������������������������������������������

loc_AA0B6:				; CODE XREF: MissionScenario_DispatchDecodeB_AA04B+58j
		xor	dx, dx
		xor	ax, ax

loc_AA0BA:				; CODE XREF: MissionScenario_DispatchDecodeB_AA04B+69j
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		or	ax, dx
		jnz	short loc_AA07E

loc_AA0C4:				; CODE XREF: MissionScenario_DispatchDecodeB_AA04B+16j
					; MissionScenario_DispatchDecodeB_AA04B+1Dj
		pop	si
		leave
		retf
MissionScenario_DispatchDecodeB_AA04B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, référencée via jmp depuis un stub VROOMM (sub_6C3D5).
; ==============================================================================================
MissionScenario_DispatchWrapper_AA0C7	proc far		; CODE XREF: VROOMM_StubThunk_6CF2BJ

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+52h], 0
		jz	short loc_AA0D9
		mov	ax, 1
		jmp	short loc_AA0DB
; ���������������������������������������������������������������������������

loc_AA0D9:				; CODE XREF: MissionScenario_DispatchWrapper_AA0C7+Bj
		xor	ax, ax

loc_AA0DB:				; CODE XREF: MissionScenario_DispatchWrapper_AA0C7+10j
		or	ax, ax
		jz	short loc_AA0F5
		push	[bp+arg_4]
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+52h]
		push	large dword ptr	[bx+5Ah]
		call	VROOMM_StubThunk_6C3D5
		add	sp, 6

loc_AA0F5:				; CODE XREF: MissionScenario_DispatchWrapper_AA0C7+16j
		pop	bp
		retf
MissionScenario_DispatchWrapper_AA0C7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (14 lignes).
; ==============================================================================================
ExprSlot_Helper2_AA0F7	proc far		; CODE XREF: VROOMM_StubThunk_6CEFEJ ExprSlot_ReleaseAndReloadDwordC_AA10D+Dp

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word ptr [si], 0
		mov	dword ptr [si+2], 0
		pop	si
		pop	bp
		retf
ExprSlot_Helper2_AA0F7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine ExprSlot_Helper2_AA0F7, Memory_TypedFreeWrapperC_5C6F3,
; ResourceRecord_ReadDwordFieldB_64AFF.
; ==============================================================================================
ExprSlot_ReleaseAndReloadDwordC_AA10D	proc far		; CODE XREF: VROOMM_StubThunk_6CF03J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	si
		push	cs
		call	near ptr ExprSlot_Helper2_AA0F7
		pop	cx
		cmp	dword ptr [di+72h], 0
		jz	short loc_AA177
		push	1
		push	0
		push	2
		push	large dword ptr	[di+72h]
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	[si+4],	dx
		mov	[si+2],	ax
		push	large dword ptr	[si+2]
		push	di
		call	ResourceRecord_ReadDwordFieldB_64AFF
		add	sp, 6
		xor	dx, dx
		jmp	short loc_AA16D
; ���������������������������������������������������������������������������

loc_AA151:				; CODE XREF: ExprSlot_ReleaseAndReloadDwordC_AA10D+5Ej
		les	bx, [si+2]
		mov	ax, dx
		inc	dx
		add	bx, ax
		cmp	byte ptr es:[bx], 0
		jnz	short loc_AA163
		inc	word ptr [si]
		jmp	short loc_AA16D
; ���������������������������������������������������������������������������

loc_AA163:				; CODE XREF: ExprSlot_ReleaseAndReloadDwordC_AA10D+50j
					; ExprSlot_ReleaseAndReloadDwordC_AA10D+68j
		movsx	eax, dx

loc_AA167:
		cmp	eax, [di+72h]
		jl	short loc_AA151

loc_AA16D:				; CODE XREF: ExprSlot_ReleaseAndReloadDwordC_AA10D+42j
					; ExprSlot_ReleaseAndReloadDwordC_AA10D+54j
		movsx	eax, dx

loc_AA171:
		cmp	eax, [di+72h]
		jl	short loc_AA163

loc_AA177:				; CODE XREF: ExprSlot_ReleaseAndReloadDwordC_AA10D+16j
		pop	di
		pop	si
		pop	bp
		retf
ExprSlot_ReleaseAndReloadDwordC_AA10D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, libère un slot (Memory_TypedFree_5C7B6).
; ==============================================================================================
ExprSlot_ReleaseSingleC_AA17B	proc far		; CODE XREF: VROOMM_StubThunk_6CF08J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0
		jz	short loc_AA1A8
		push	0
		push	2
		mov	ax, si
		add	ax, 2
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		mov	dword ptr [si+2], 0
		mov	word ptr [si], 0

loc_AA1A8:				; CODE XREF: ExprSlot_ReleaseSingleC_AA17B+Aj
		pop	si
		pop	bp
		retf
ExprSlot_ReleaseSingleC_AA17B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (14 lignes).
; ==============================================================================================
ExprSlot_Helper3_AA1AB	proc far		; CODE XREF: VROOMM_StubThunk_6CEEFJ ExprSlot_AllocateAndReloadDword_AA1BE+Dp

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word ptr [si], 0
		mov	word ptr [si+2], 0
		pop	si
		pop	bp
		retf
ExprSlot_Helper3_AA1AB	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine ExprSlot_Helper3_AA1AB, alloue (sub_658), ResourceRecord_ReadDwordFieldB_64AFF.
; ==============================================================================================
ExprSlot_AllocateAndReloadDword_AA1BE	proc far		; CODE XREF: VROOMM_StubThunk_6CEF4J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	si
		push	cs
		call	near ptr ExprSlot_Helper3_AA1AB
		pop	cx
		mov	eax, [di+72h]
		mov	ebx, 4
		cdq
		idiv	ebx
		mov	[si], ax
		cmp	word ptr [si], 0
		jz	short loc_AA201
		mov	ax, [si]
		shl	ax, 2
		push	ax
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[si+2],	ax
		push	ds
		push	word ptr [si+2]
		push	di
		call	ResourceRecord_ReadDwordFieldB_64AFF
		add	sp, 6

loc_AA201:				; CODE XREF: ExprSlot_AllocateAndReloadDword_AA1BE+25j
		pop	di
		pop	si
		pop	bp
		retf
ExprSlot_AllocateAndReloadDword_AA1BE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, libère l'objet (sub_338).
; ==============================================================================================
ExprSlot_ReleaseObject_AA205	proc far		; CODE XREF: VROOMM_StubThunk_6CEF9J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jz	short loc_AA224
		push	word ptr [si+2]
		call	CRT_FreeNear_Wrap
		pop	cx
		mov	word ptr [si+2], 0
		mov	word ptr [si], 0

loc_AA224:				; CODE XREF: ExprSlot_ReleaseObject_AA205+Bj
		pop	si
		pop	bp
		retf
ExprSlot_ReleaseObject_AA205	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (14 lignes).
; ==============================================================================================
ExprSlot_Helper4_AA227	proc far		; CODE XREF: VROOMM_StubThunk_6CF30J PartEntry_AllocateArray_AA23D+10p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word ptr [si], 0
		mov	dword ptr [si+2], 0
		pop	si
		pop	bp
		retf
ExprSlot_Helper4_AA227	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 77 lignes, LUE INTEGRALEMENT. Le vrai constructeur du tableau d'entrees PART : calcule
; un nombre d'elements ([di+0x72]/0x3E), alloue un tableau de records de 85 octets chacun
; (meme allocateur Memory_TypedFreeWrapper_5C6F3, tag 0x5C44, que MVRS), puis appelle
; PartEntry_LoadAndResolveNames_A9E3C sur chaque element successivement (pas +0x55). CONFIRME
; : +0x52 (controleur) reste NUL a l'issue de la construction complete du tableau — son
; assignation reelle, si elle existe, se fait ailleurs, dynamiquement pendant le jeu — site
; non retrouve a ce stade.
; ==============================================================================================
PartEntry_AllocateArray_AA23D	proc far		; CODE XREF: VROOMM_StubThunk_6CF35J

var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	si
		push	cs
		call	near ptr ExprSlot_Helper4_AA227
		pop	cx
		mov	ax, [di+72h]
		mov	bx, 3Eh	; '>'
		xor	dx, dx
		div	bx
		mov	[si], ax
		mov	ax, [si]

loc_AA25F:
		imul	ax, 3Eh

loc_AA262:
		movzx	eax, ax

loc_AA266:
		cmp	eax, [di+72h]
		jz	short loc_AA275

loc_AA26C:
		push	9036h
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_AA275:				; CODE XREF: PartEntry_AllocateArray_AA23D+2Dj
		push	1
		push	0
		push	2
		mov	ax, [si]
		imul	ax, 55h
		movzx	eax, ax
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	[si+4],	dx
		mov	[si+2],	ax
		mov	eax, [si+2]
		mov	[bp+var_4], eax
		mov	[bp+var_6], 0
		jmp	short loc_AA2B9
; ���������������������������������������������������������������������������

loc_AA2A6:				; CODE XREF: PartEntry_AllocateArray_AA23D+81j
		push	di
		push	large [bp+var_4]
		push	cs
		call	near ptr PartEntry_LoadAndResolveNames_A9E3C
		add	sp, 6
		inc	[bp+var_6]
		add	word ptr [bp+var_4], 55h ; 'U'

loc_AA2B9:				; CODE XREF: PartEntry_AllocateArray_AA23D+67j
		mov	ax, [si]
		cmp	ax, [bp+var_6]
		jg	short loc_AA2A6
		pop	di
		pop	si
		leave
		retf
PartEntry_AllocateArray_AA23D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, libère un slot (Memory_TypedFree_5C7B6).
; ==============================================================================================
ExprSlot_ReleaseSingleD_AA2C4	proc far		; CODE XREF: VROOMM_StubThunk_6CF3AJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0
		jz	short loc_AA2F1
		push	0
		push	2
		mov	ax, si
		add	ax, 2
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		mov	dword ptr [si+2], 0
		mov	word ptr [si], 0

loc_AA2F1:				; CODE XREF: ExprSlot_ReleaseSingleD_AA2C4+Aj
		pop	si
		pop	bp
		retf
ExprSlot_ReleaseSingleD_AA2C4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 13 lignes, LUE INTEGRALEMENT (session ordres de mission avec Remi). Initialise a zero
; les deux premiers champs du conteneur PROG : +0x00 (compteur d'instructions/marqueurs) et
; +0x06 (taille du chunk, ecrasee juste apres par ProgBuffer_ResetAndSetSize_AA307).
; ==============================================================================================
ProgBuffer_ResetState_AA2F4	proc far		; CODE XREF: VROOMM_StubThunk_6CEA9J ProgBuffer_ResetAndSetSize_AA307+9p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word ptr [si], 0
		mov	word ptr [si+6], 0
		pop	si
		pop	bp
		retf
ProgBuffer_ResetState_AA2F4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 18 lignes, LUE INTEGRALEMENT. Appelle ProgBuffer_ResetState_AA2F4 puis pose +0x06 =
; taille du chunk PROG (parametre). Etape preliminaire de
; ProgBuffer_LoadRawAndCountMarkers_AA31D.
; ==============================================================================================
ProgBuffer_ResetAndSetSize_AA307	proc far		; CODE XREF: VROOMM_StubThunk_6CEAEJ ProgBuffer_LoadRawAndCountMarkers_AA31D+10p

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr ProgBuffer_ResetState_AA2F4
		pop	cx
		mov	ax, [bp+arg_2]
		mov	[si+6],	ax
		pop	si
		pop	bp
		retf
ProgBuffer_ResetAndSetSize_AA307	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 62 lignes, LUE INTEGRALEMENT (session ordres de mission avec Remi — lecteur reel du
; chunk PROG, confirme par DATA_MODEL.md 'sub_6CEB3->AA31D (PROG)').   DECOUVERTE : PROG N'EST
; PAS PARSE EN INSTRUCTIONS ICI — charge comme UN SEUL BLOC BRUT : alloue un tampon (meme
; allocateur generique tag 0x5C44 que partout ailleurs dans le binaire), copie tout le chunk
; tel quel (ResourceRecord_ReadFieldGroupA), puis SCANNE le tampon 2 octets par 2 octets et
; COMPTE les octets nuls a positions paires (+0x00 = compteur resultant).   HYPOTHESE : ces
; zeros sont des SEPARATEURS entre plusieurs mini-programmes empaquetes dans le meme bloc PROG
; — ce qui expliquerait comment les 4 progs_id d'une entree PartEntry
; (on_is_activated/on_mission_update/on_is_destroyed/on_missions_init) peuvent chacun pointer
; vers un OFFSET DIFFERENT a l'interieur de ce meme bloc, plutot que vers des blocs separes.
; Le vrai decoupage en instructions (opcode, parametres, [instr+0xE] etat) n'a lieu qu'a
; l'execution, dans MissionScript_ExecutePROG.   Structure du conteneur ProgBuffer (confirmee)
; : +0x00 compteur de marqueurs (word), +0x02/+0x04 pointeur lointain vers le tampon brut,
; +0x06 taille du chunk (word).
; ==============================================================================================
ProgBuffer_LoadRawAndCountMarkers_AA31D	proc far		; CODE XREF: VROOMM_StubThunk_6CEB3J

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr ProgBuffer_ResetAndSetSize_AA307
		add	sp, 4
		push	1
		push	0
		push	2
		push	large dword ptr	[di+72h]
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	[si+4],	dx
		mov	[si+2],	ax
		push	large dword ptr	[si+2]
		push	di

loc_AA353:
		call	ResourceRecord_ReadDwordFieldB_64AFF
		add	sp, 6
		xor	dx, dx
		jmp	short loc_AA36F
; ���������������������������������������������������������������������������

loc_AA35F:				; CODE XREF: ProgBuffer_LoadRawAndCountMarkers_AA31D:loc_AA377j
		les	bx, [si+2]
		add	bx, dx

loc_AA364:
		cmp	byte ptr es:[bx], 0
		jnz	short loc_AA36C

loc_AA36A:
		inc	word ptr [si]

loc_AA36C:				; CODE XREF: ProgBuffer_LoadRawAndCountMarkers_AA31D+4Bj
		add	dx, 2

loc_AA36F:				; CODE XREF: ProgBuffer_LoadRawAndCountMarkers_AA31D+40j
		movsx	eax, dx

loc_AA373:
		cmp	eax, [di+72h]

loc_AA377:
		jl	short loc_AA35F
		pop	di
		pop	si
		pop	bp
		retf
ProgBuffer_LoadRawAndCountMarkers_AA31D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, libère un slot (Memory_TypedFree_5C7B6).
; ==============================================================================================
ExprSlot_ReleaseSingleE_AA37D	proc far		; CODE XREF: VROOMM_StubThunk_6CEB8J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0
		jz	short loc_AA3A2
		push	0
		push	2
		mov	ax, si
		add	ax, 2
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		mov	word ptr [si], 0

loc_AA3A2:				; CODE XREF: ExprSlot_ReleaseSingleE_AA37D+Aj
		pop	si
		pop	bp
		retf
ExprSlot_ReleaseSingleE_AA37D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,123L — parse un chunk 'SCNE' (scene) en un record de 0x27 octets. Appele par
; MissionPlay_LoadScenes_AA595. En-tete disque fixe de 24 octets (ReadFieldGroupA) : +0x00 u8
; is_active ; +0x01 u16 area_id (index dans AREA, -1=scene globale ; resolu par
; GeomNode_SumAndCount_53034(ctx+0x1A) -> record+0x04) ; +0x03/+0x05/+0x07 3x i16 = handlers
; PROG on_activated/on_leaving/on_mission_update (-1=aucun ; resolus par
; Expr_LookupNamedValue_51E4A(ctx+0x40=liste PROG) -> record+0x08/+0x0C/+0x10) ; +0x09 u8
; has_own_coord ; +0x0A u16 heading (candidat cap deg ; =180 si ancre a l'aire, =0 si coord
; explicite) ; +0x0C/+0x10/+0x14 3x i32 position (X, Y, Z) fixed-point /256 ; 3e composante
; (+0x14) = Z = altitude (repere ASM Z-up, cf. CLAUDE.md) -> record+0x1B/+0x1F/+0x23. Puis
; (taille_chunk-24)/2 mots u16 en queue = LISTE D'UNITES : index dans le chunk PART en ORDRE
; DE STOCKAGE (pas un id d'entite, pas un index CAST, sans offset) -> PART[slot].entity_id ->
; CAST[entity_id]. malloc + ReadFieldGroupA -> record+0x14 count, +0x16 ptr. Verifie sur
; MISSIONS/MISN-1A.IFF. Detail complet : analysis/DATA_MODEL.md §6.6a.
; ==============================================================================================
MissionScene_ParseRecord_AA3A5	proc far		; CODE XREF: VROOMM_StubThunk_6CF3FJ MissionPlay_LoadScenes_AA595+DFp

var_18		= word ptr -18h
var_15		= word ptr -15h
var_13		= word ptr -13h
var_11		= word ptr -11h
var_F		= byte ptr -0Fh
var_E		= word ptr -0Eh
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		mov	ax, [bp+arg_2]
		mov	[si+2],	ax
		push	large 18h
		push	ss
		lea	ax, [bp+var_18]
		push	ax
		push	di
		call	ResourceRecord_ReadFieldGroupA_64A19
		add	sp, 0Ah
		mov	al, byte ptr [bp+var_18]
		mov	[si], al
		mov	byte ptr [si+1], 0
		push	[bp+var_18+1]
		mov	ax, [si+2]
		add	ax, 1Ah
		push	ax
		call	GeomNode_SumAndCount_53034
		add	sp, 4
		mov	[si+6],	dx
		mov	[si+4],	ax
		push	[bp+var_15]
		mov	ax, [si+2]
		add	ax, 40h	; '@'
		push	ax
		call	Expr_LookupNamedValue_51E4A
		add	sp, 4
		mov	[si+0Ah], dx
		mov	[si+8],	ax
		push	[bp+var_13]
		mov	ax, [si+2]
		add	ax, 40h	; '@'
		push	ax
		call	Expr_LookupNamedValue_51E4A
		add	sp, 4
		mov	[si+0Eh], dx
		mov	[si+0Ch], ax
		push	[bp+var_11]
		mov	ax, [si+2]
		add	ax, 40h	; '@'
		push	ax
		call	Expr_LookupNamedValue_51E4A
		add	sp, 4
		mov	[si+12h], dx
		mov	[si+10h], ax
		mov	al, [bp+var_F]
		mov	[si+18h], al
		mov	ax, [bp+var_E]
		mov	[si+19h], ax
		mov	eax, [bp+var_C]
		mov	[si+1Bh], eax
		mov	eax, [bp+var_8]
		mov	[si+1Fh], eax
		mov	eax, [bp+var_4]

loc_AA453:
		mov	[si+23h], eax
		mov	ax, [di+72h]
		add	ax, 0FFE8h
		shr	ax, 1
		mov	[si+14h], ax

loc_AA462:
		cmp	word ptr [si+14h], 0
		jz	short loc_AA491

loc_AA468:
		mov	ax, [si+14h]

loc_AA46B:
		shl	ax, 1
		push	ax

loc_AA46E:
		call	CRT_Malloc16_Retry
		pop	cx

loc_AA474:
		mov	[si+16h], ax

loc_AA477:
		mov	ax, [si+14h]
		shl	ax, 1
		movzx	eax, ax
		push	eax
		push	ds
		push	word ptr [si+16h]
		push	di
		call	ResourceRecord_ReadFieldGroupA_64A19
		add	sp, 0Ah
		jmp	short loc_AA496
; ���������������������������������������������������������������������������

loc_AA491:				; CODE XREF: MissionScene_ParseRecord_AA3A5+C1j
		mov	word ptr [si+16h], 0

loc_AA496:				; CODE XREF: MissionScene_ParseRecord_AA3A5+EAj
		pop	di
		pop	si
		leave
		retf
MissionScene_ParseRecord_AA3A5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, libère l'objet (sub_338).
; ==============================================================================================
ExprSlot_ReleaseObjectB_AA49A	proc far		; CODE XREF: VROOMM_StubThunk_6CF44J ExprSlot_ReleaseObjectAndFree_AA7E3+12p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+14h], 0
		jz	short loc_AA4BA
		mov	word ptr [si+14h], 0
		push	word ptr [si+16h]
		call	CRT_FreeNear_Wrap
		pop	cx
		mov	word ptr [si+16h], 0

loc_AA4BA:				; CODE XREF: ExprSlot_ReleaseObjectB_AA49A+Bj
		pop	si
		pop	bp
		retf
ExprSlot_ReleaseObjectB_AA49A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 106 lignes, NON DÉTAILLÉE — appelle Expr_LookupTableEntry85B_52D45 (seg114) en
; boucle.
; ==============================================================================================
MissionScenario_ResolveMultipleFields_AA4BD	proc far		; CODE XREF: VROOMM_StubThunk_6CF49J

var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		mov	[bp+var_2], 0
		jmp	loc_AA55B
; ���������������������������������������������������������������������������

loc_AA4D2:				; CODE XREF: MissionScenario_ResolveMultipleFields_AA4BD:loc_AA563j
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [si+16h]
		add	bx, ax
		push	word ptr [bx]
		mov	ax, [si+2]
		add	ax, 34h	; '4'
		push	ax
		call	Expr_LookupTableEntry85B_52D45
		add	sp, 4
		mov	word ptr [bp+var_6+2], dx
		mov	word ptr [bp+var_6], ax
		cmp	[bp+var_6], 0
		jz	short loc_AA558
		les	bx, [bp+var_6]
		mov	al, es:[bx+31h]
		cmp	al, [bp+arg_2]
		jnz	short loc_AA558
		mov	al, es:[bx+39h]
		shl	ax, 0Fh
		sar	ax, 0Fh
		or	ax, ax
		jz	short loc_AA527
		mov	al, es:[bx+39h]
		shl	ax, 0Eh
		sar	ax, 0Fh
		or	ax, ax
		jz	short loc_AA527
		mov	ax, 1
		jmp	short loc_AA529
; ���������������������������������������������������������������������������

loc_AA527:				; CODE XREF: MissionScenario_ResolveMultipleFields_AA4BD+55j
					; MissionScenario_ResolveMultipleFields_AA4BD+63j
		xor	ax, ax

loc_AA529:				; CODE XREF: MissionScenario_ResolveMultipleFields_AA4BD+68j
		or	al, al
		jnz	short loc_AA557
		les	bx, [bp+var_6]
		mov	al, es:[bx+39h]
		shl	ax, 0Eh
		sar	ax, 0Fh
		or	ax, ax
		jnz	short loc_AA551
		mov	al, es:[bx+39h]
		shl	ax, 0Dh
		sar	ax, 0Fh
		or	ax, ax
		jnz	short loc_AA551
		mov	ax, 1
		jmp	short loc_AA553
; ���������������������������������������������������������������������������

loc_AA551:				; CODE XREF: MissionScenario_ResolveMultipleFields_AA4BD+7Fj
					; MissionScenario_ResolveMultipleFields_AA4BD+8Dj
		xor	ax, ax

loc_AA553:				; CODE XREF: MissionScenario_ResolveMultipleFields_AA4BD+92j
		or	al, al
		jz	short loc_AA558

loc_AA557:				; CODE XREF: MissionScenario_ResolveMultipleFields_AA4BD+6Ej
		inc	di

loc_AA558:				; CODE XREF: MissionScenario_ResolveMultipleFields_AA4BD+3Bj
					; MissionScenario_ResolveMultipleFields_AA4BD+47j ...
		inc	[bp+var_2]

loc_AA55B:				; CODE XREF: MissionScenario_ResolveMultipleFields_AA4BD+12j
		mov	ax, [si+14h]
		cmp	ax, [bp+var_2]

loc_AA561:
		jle	short loc_AA566

loc_AA563:
		jmp	loc_AA4D2
; ���������������������������������������������������������������������������

loc_AA566:				; CODE XREF: MissionScenario_ResolveMultipleFields_AA4BD:loc_AA561j
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
MissionScenario_ResolveMultipleFields_AA4BD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (20 lignes).
; ==============================================================================================
ExprSlot_Helper7_AA56C	proc far		; CODE XREF: VROOMM_StubThunk_6CF4EJ ExprSlot_Helper8_AA57F+9p

arg_0		= word ptr  6

		push	bp

loc_AA56D:
		mov	bp, sp
		push	si

loc_AA570:
		mov	si, [bp+arg_0]

loc_AA573:
		mov	word ptr [si], 0
		mov	word ptr [si+4], 0
		pop	si
		pop	bp
		retf
ExprSlot_Helper7_AA56C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle ExprSlot_Helper7_AA56C.
; ==============================================================================================
ExprSlot_Helper8_AA57F	proc far		; CODE XREF: VROOMM_StubThunk_6CF53J MissionPlay_LoadScenes_AA595+19p

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr ExprSlot_Helper7_AA56C
		pop	cx
		mov	ax, [bp+arg_2]
		mov	[si+4],	ax
		pop	si
		pop	bp
		retf
ExprSlot_Helper8_AA57F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,131L — lecteur du FORM 'PLAY' (la piece de theatre de la mission). Appele via
; MissionScenario_LoadMainRecord_A8331 (chunk PLAY -> stub sub_6CF58). 2 passes sur les sous-
; chunks : (1) collecte les offsets de tous les chunks de tag 'SCNE' ([rr+0x6D]==0x454E4353,
; octets disque S C N E ; max 0x20) ; (2) alloue un tableau de N records de 0x27 octets
; (compteur en [dst+0], ptr en [dst+2]) et appelle MissionScene_ParseRecord_AA3A5 pour chacun.
; C'est le chargeur du systeme de scenes scriptees de la mission. Detail :
; analysis/DATA_MODEL.md §6.6a.
; ==============================================================================================
MissionPlay_LoadScenes_AA595	proc far		; CODE XREF: VROOMM_StubThunk_6CF58J

var_86		= word ptr -86h
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 86h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		mov	[bp+var_2], 0
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr ExprSlot_Helper8_AA57F
		add	sp, 4
		jmp	short loc_AA602
; ���������������������������������������������������������������������������

loc_AA5B6:				; CODE XREF: MissionPlay_LoadScenes_AA595+92j
		mov	eax, [di+65h]
		mov	[bp+var_6], eax
		push	di
		call	ResourceRecord_ComputeAlignedBounds_64BC1
		pop	cx
		cmp	dword ptr [di+6Dh], 454E4353h
		jnz	short loc_AA5D4
		mov	ax, 1
		jmp	short loc_AA5D6
; ���������������������������������������������������������������������������

loc_AA5D4:				; CODE XREF: MissionPlay_LoadScenes_AA595+38j
		xor	ax, ax

loc_AA5D6:				; CODE XREF: MissionPlay_LoadScenes_AA595+3Dj
		or	ax, ax
		jz	short loc_AA5F6
		cmp	[bp+var_2], 20h	; ' '
		jge	short loc_AA5F6
		mov	bx, [bp+var_2]
		shl	bx, 2
		lea	ax, [bp+var_86]
		add	bx, ax
		mov	eax, [bp+var_6]
		mov	[bx], eax
		inc	[bp+var_2]

loc_AA5F6:				; CODE XREF: MissionPlay_LoadScenes_AA595+43j
					; MissionPlay_LoadScenes_AA595+49j
		mov	eax, [di+76h]
		mov	[di+65h], eax
		mov	byte ptr [di+6Dh], 0

loc_AA602:				; CODE XREF: MissionPlay_LoadScenes_AA595+1Fj
		cmp	word ptr [di+7Ch], 0
		jnz	short loc_AA611
		push	di
		call	ResourceRecord_ReadPayload_64DB3
		pop	cx
		jmp	short loc_AA625
; ���������������������������������������������������������������������������

loc_AA611:				; CODE XREF: MissionPlay_LoadScenes_AA595+71j
		mov	eax, [di+65h]
		mov	bx, [di+7Ch]
		cmp	eax, [bx+0Fh]
		jl	short loc_AA623
		mov	ax, 1
		jmp	short loc_AA625
; ���������������������������������������������������������������������������

loc_AA623:				; CODE XREF: MissionPlay_LoadScenes_AA595+87j
		xor	ax, ax

loc_AA625:				; CODE XREF: MissionPlay_LoadScenes_AA595+7Aj
					; MissionPlay_LoadScenes_AA595+8Cj
		or	ax, ax
		jz	short loc_AA5B6
		push	seg seg334
		push	offset VROOMM_StubThunk_6CE95
		push	11h
		push	[bp+var_2]
		push	large 270000h
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[si+2],	ax
		mov	word ptr [si], 0
		jmp	short loc_AA67C
; ���������������������������������������������������������������������������

loc_AA64B:				; CODE XREF: MissionPlay_LoadScenes_AA595+ECj
		mov	bx, [si]
		shl	bx, 2
		lea	ax, [bp+var_86]
		add	bx, ax
		mov	eax, [bx]
		mov	[di+65h], eax
		push	di

loc_AA65E:
		call	ResourceRecord_ComputeAlignedBounds_64BC1
		pop	cx
		push	di
		push	word ptr [si+4]
		mov	ax, [si]
		imul	ax, 27h
		mov	dx, [si+2]
		add	dx, ax
		push	dx

loc_AA673:
		push	cs
		call	near ptr MissionScene_ParseRecord_AA3A5
		add	sp, 6
		inc	word ptr [si]

loc_AA67C:				; CODE XREF: MissionPlay_LoadScenes_AA595+B4j
		mov	ax, [si]
		cmp	ax, [bp+var_2]
		jl	short loc_AA64B
		pop	di
		pop	si
		leave
		retf
MissionPlay_LoadScenes_AA595	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle sub_E77 (externe).
; ==============================================================================================
MissionScenario_Helper_AA687	proc far		; CODE XREF: VROOMM_StubThunk_6CF5DJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0
		jz	short loc_AA6B0
		push	seg seg334
		push	offset VROOMM_StubThunk_6CE90
		push	large 190000h
		push	27h ; '''
		push	word ptr [si+2]
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		mov	word ptr [si], 0

loc_AA6B0:				; CODE XREF: MissionScenario_Helper_AA687+Aj
		pop	si
		pop	bp
		retf
MissionScenario_Helper_AA687	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (14 lignes).
; ==============================================================================================
ExprSlot_Helper9_AA6B3	proc far		; CODE XREF: VROOMM_StubThunk_6CEE0J ExprSlot_LoadFieldGroupWithErrorCheck_AA6C9+10p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word ptr [si], 0
		mov	dword ptr [si+2], 0
		pop	si
		pop	bp
		retf
ExprSlot_Helper9_AA6B3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 104 lignes, NON DÉTAILLÉE — combine ExprSlot_Helper9_AA6B3, gestion d'erreur,
; Memory_TypedFreeWrapperC_5C6F3, ReadFieldGroupA_64A19, GeomNode_SumAndCount_53034.
; ==============================================================================================
ExprSlot_LoadFieldGroupWithErrorCheck_AA6C9	proc far		; CODE XREF: VROOMM_StubThunk_6CEE5J

var_20		= word ptr -20h
var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 20h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		push	si
		push	cs
		call	near ptr ExprSlot_Helper9_AA6B3
		pop	cx
		mov	ax, [di+72h]
		mov	bx, 0Eh
		xor	dx, dx
		div	bx
		mov	[si], ax
		mov	ax, [si]
		imul	ax, 0Eh
		movzx	eax, ax
		cmp	eax, [di+72h]
		jz	short loc_AA701
		push	9114h
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_AA701:				; CODE XREF: ExprSlot_LoadFieldGroupWithErrorCheck_AA6C9+2Dj
		push	1
		push	0
		push	2
		mov	ax, [si]
		shl	ax, 4
		movzx	eax, ax
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	[si+4],	dx
		mov	[si+2],	ax
		mov	eax, [si+2]
		mov	[bp+var_4], eax
		mov	[bp+var_6], 0
		jmp	short loc_AA799
; ���������������������������������������������������������������������������

loc_AA732:				; CODE XREF: ExprSlot_LoadFieldGroupWithErrorCheck_AA6C9+D5j
		push	large 0Eh
		push	ss
		lea	ax, [bp+var_20]
		push	ax
		push	di
		call	ResourceRecord_ReadFieldGroupA_64A19
		add	sp, 0Ah
		push	[bp+var_20]
		mov	ax, [bp+arg_2]
		add	ax, 1Ah
		push	ax
		call	GeomNode_SumAndCount_53034
		add	sp, 4
		les	bx, [bp+var_4]
		mov	es:[bx+2], dx
		mov	es:[bx], ax
		mov	eax, [bp+var_1E]

loc_AA763:
		mov	[bp+var_A], eax
		mov	eax, [bp+var_A]
		mov	es:[bx+4], eax
		mov	eax, [bp+var_1A]

loc_AA774:
		mov	[bp+var_E], eax
		mov	eax, [bp+var_E]
		mov	es:[bx+8], eax
		mov	eax, [bp+var_16]
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		mov	es:[bx+0Ch], eax
		inc	[bp+var_6]
		add	word ptr [bp+var_4], 10h

loc_AA799:				; CODE XREF: ExprSlot_LoadFieldGroupWithErrorCheck_AA6C9+67j
		mov	ax, [si]
		cmp	ax, [bp+var_6]
		jg	short loc_AA732
		pop	di
		pop	si
		leave
		retf
ExprSlot_LoadFieldGroupWithErrorCheck_AA6C9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, libère un slot (Memory_TypedFree_5C7B6).
; ==============================================================================================
ExprSlot_ReleaseSingleF_AA7A4	proc far		; CODE XREF: VROOMM_StubThunk_6CEEAJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0
		jz	short loc_AA7D1
		push	0
		push	2
		mov	ax, si
		add	ax, 2
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		mov	dword ptr [si+2], 0
		mov	word ptr [si], 0

loc_AA7D1:				; CODE XREF: ExprSlot_ReleaseSingleF_AA7A4+Aj
		pop	si
		pop	bp
		retf
ExprSlot_ReleaseSingleF_AA7A4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (13 lignes).
; ==============================================================================================
ExprSlot_Helper10_AA7D4	proc far		; CODE XREF: VROOMM_StubThunk_6CE95J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	ax, dx
		add	ax, 1Bh
		mov	ax, dx
		pop	bp
		retf
ExprSlot_Helper10_AA7D4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine ExprSlot_ReleaseObjectB_AA49A et libération de l'objet (sub_338).
; ==============================================================================================
ExprSlot_ReleaseObjectAndFree_AA7E3	proc far		; CODE XREF: VROOMM_StubThunk_6CE90J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_AA806
		push	si
		nop
		push	cs
		call	near ptr ExprSlot_ReleaseObjectB_AA49A
		pop	cx
		test	di, 1
		jz	short loc_AA806
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_AA806:				; CODE XREF: ExprSlot_ReleaseObjectAndFree_AA7E3+Dj
					; ExprSlot_ReleaseObjectAndFree_AA7E3+1Aj
		pop	di
		pop	si
		pop	bp
		retf
ExprSlot_ReleaseObjectAndFree_AA7E3	endp

seg457		ends

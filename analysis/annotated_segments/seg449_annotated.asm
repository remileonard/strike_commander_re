seg449		segment	para public 'OVERLAY' use16
		assume cs:seg449
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 90 lignes, NON DÉTAILLÉE — réinitialise un large champ de flags (+0x75, plusieurs
; bits) et initialise 8 champs à des valeurs par défaut en virgule fixe 8.8 (0x100 = 1.0) —
; probable état visuel/matériau par défaut d'un composant.
; ==============================================================================================
PlayerComponent_ResetVisualStateDefaults_A5620	proc far		; CODE XREF: VROOMM_StubThunk_6CBC4J PlayerComponentVariantAH_ConstructAndInit_A5707+37p	...

var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 20h
		push	si
		mov	si, [bp+arg_0]
		mov	bx, [si]
		mov	word ptr [bx+2], 0
		and	byte ptr [si+75h], 0FEh
		and	byte ptr [si+75h], 0FDh
		and	byte ptr [si+75h], 0FBh
		and	byte ptr [si+75h], 0F7h

loc_A5641:
		or	byte ptr [si+75h], 10h

loc_A5645:
		and	byte ptr [si+75h], 0DFh
		mov	byte ptr [bx+20h], 0

loc_A564D:
		and	byte ptr [si+75h], 0BFh

loc_A5651:
		and	word ptr [si+75h], 0FE7Fh
		or	word ptr [si+75h], 80h
		mov	[bp+var_4], 100h
		mov	eax, [bp+var_4]
		mov	dword_72A14, eax

loc_A566B:
		mov	[bp+var_8], 100h
		mov	eax, [bp+var_8]

loc_A5677:
		mov	dword_72A18, eax

loc_A567B:
		mov	[bp+var_C], 100h
		mov	eax, [bp+var_C]

loc_A5687:
		mov	dword_72A1C, eax
		mov	[bp+var_10], 100h
		mov	eax, [bp+var_10]
		mov	dword_72A20, eax
		mov	[bp+var_14], 100h
		mov	eax, [bp+var_14]
		mov	dword_72A24, eax
		mov	[bp+var_18], 100h
		mov	eax, [bp+var_18]
		mov	dword_72A28, eax
		mov	[bp+var_1C], 100h

loc_A56C3:
		mov	eax, [bp+var_1C]

loc_A56C7:
		mov	dword_72A2C, eax

loc_A56CB:
		mov	byte ptr [si+68h], 0FFh
		mov	[bp+var_20], 0
		mov	eax, [bp+var_20]
		mov	[si+7Ch], eax
		mov	word ptr [si+80h], 1F4h
		mov	word ptr [si+82h], 64h ; 'd'
		mov	word ptr [si+84h], 0E7h	; '�'

loc_A56F1:
		mov	dword ptr [si+86h], 2ADDh
		mov	byte ptr [si+8Ah], 3

loc_A56FF:
		mov	byte ptr [si+8Bh], 2
		pop	si
		leave
		retf
PlayerComponent_ResetVisualStateDefaults_A5620	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, initialise 3 sous-objets composites (sub_6CACA/6CB0A/6CB73, motif seg109) et appelle
; PlayerComponent_ResetVisualStateDefaults_A5620.
; ==============================================================================================
PlayerComponentVariantAH_ConstructAndInit_A5707	proc far		; CODE XREF: VROOMM_StubThunk_6CBC9J PlayerComponentVariantAJ_ConstructAndInit_A58AB+151p ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si]
		call	VROOMM_StubThunk_6CACA
		pop	cx
		push	si
		call	VROOMM_StubThunk_6CB0A
		pop	cx
		mov	bx, [si+10h]
		xor	eax, eax
		mov	[bx+0Ch], eax
		mov	[bx+8],	eax
		mov	[bx+4],	eax
		mov	ax, [si+10h]
		add	ax, 4
		push	si
		call	VROOMM_StubThunk_6CB73
		pop	cx
		push	si
		push	cs
		call	near ptr PlayerComponent_ResetVisualStateDefaults_A5620
		pop	cx
		mov	bx, [si]
		mov	ax, [bp+arg_2]
		mov	[bx+2],	ax
		pop	si
		pop	bp
		retf
PlayerComponentVariantAH_ConstructAndInit_A5707	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 182 lignes, NON DÉTAILLÉE — alloue (sub_658), initialise 3 sous-objets composites,
; appelle PlayerComponent_ResetVisualStateDefaults_A5620.
; ==============================================================================================
PlayerComponentVariantAI_ConstructAndInit_A574D	proc far		; CODE XREF: VROOMM_StubThunk_6CBD3J

arg_0		= word ptr  6

		push	bp

loc_A574E:
		mov	bp, sp
		push	si

loc_A5751:
		mov	ax, [bp+arg_0]
		push	0C5h ; '�'

loc_A5757:
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_A5766
		jmp	loc_A589A
; ���������������������������������������������������������������������������

loc_A5766:				; CODE XREF: PlayerComponentVariantAI_ConstructAndInit_A574D+14j
		add	ax, 8Eh	; '�'
		mov	[si], ax
		mov	ax, si
		add	ax, 0B1h ; '�'

loc_A5770:
		mov	[si+10h], ax
		mov	ax, si
		add	ax, 8Eh	; '�'
		mov	[si+0B1h], ax
		mov	ax, si
		add	ax, 8Eh	; '�'

loc_A5781:
		mov	[si+1Eh], ax

loc_A5784:
		mov	ax, si

loc_A5786:
		add	ax, 0B1h ; '�'

loc_A5789:
		mov	[si+22h], ax
		mov	ax, si
		add	ax, 8Eh	; '�'

loc_A5791:
		mov	[si+24h], ax

loc_A5794:
		mov	word ptr [si+8Ch], 0
		mov	word ptr [si+0AFh], 0
		mov	word ptr [si+8Eh], 223Ah
		mov	ax, si
		add	ax, 8Eh	; '�'
		push	ax
		call	VROOMM_StubThunk_6CACA
		pop	cx
		mov	bx, [si]
		sub	word ptr [bx-2], 0FFC7h
		mov	word ptr [si+0B3h], 21CEh
		mov	bx, [si+0B1h]
		mov	word ptr [bx], 21EAh
		xor	eax, eax
		mov	[si+0BDh], eax
		mov	[si+0B9h], eax
		mov	[si+0B5h], eax
		mov	ax, si
		add	ax, 0B5h ; '�'
		mov	bx, [si]
		add	word ptr [bx-2], 0FFC7h
		sub	word ptr [bx-2], 6Eh ; 'n'
		mov	bx, [si+10h]
		sub	word ptr [bx-2], 6Eh ; 'n'
		mov	bx, [si]

loc_A57F0:
		sub	word ptr [bx-2], 0Eh
		mov	word ptr [si+2], 20AEh
		mov	word ptr [bx], 20DEh
		push	si

loc_A57FE:
		call	VROOMM_StubThunk_6CB0A
		pop	cx

loc_A5804:
		mov	bx, [si]
		add	word ptr [bx-2], 0Eh
		mov	word ptr [si+2], 212Eh
		mov	word ptr [bx], 2162h
		mov	bx, [si+10h]
		mov	word ptr [bx+2], 21B2h
		push	si
		call	VROOMM_StubThunk_6CB73

loc_A5821:
		pop	cx

loc_A5822:
		mov	bx, [si]

loc_A5824:
		add	word ptr [bx-2], 6Eh ; 'n'
		mov	bx, [si+10h]
		add	word ptr [bx-2], 6Eh ; 'n'
		mov	bx, [si]
		sub	word ptr [bx-2], 6Ah ; 'j'
		mov	word ptr [si+20h], 2042h
		mov	bx, [si+1Eh]
		mov	word ptr [bx], 205Eh
		mov	bx, [si]
		add	word ptr [bx-2], 6Ah ; 'j'

loc_A5847:
		sub	word ptr [bx-2], 59h ; 'Y'

loc_A584B:
		mov	bx, [si+10h]
		sub	word ptr [bx-2], 59h ; 'Y'

loc_A5852:
		mov	word ptr [si+26h], 1FB6h
		mov	bx, [si+24h]
		mov	word ptr [bx], 1FD6h
		mov	bx, [si+22h]
		mov	word ptr [bx+2], 2026h
		mov	bx, [si]
		add	word ptr [bx-2], 59h ; 'Y'
		mov	bx, [si+10h]
		add	word ptr [bx-2], 59h ; 'Y'

loc_A5873:
		mov	word ptr [si+2], 228Ah
		mov	word ptr [si+20h], 22D6h

loc_A587D:
		mov	word ptr [si+26h], 22F2h
		mov	bx, [si]

loc_A5884:
		mov	word ptr [bx], 2312h

loc_A5888:
		mov	bx, [si+10h]

loc_A588B:
		mov	word ptr [bx+2], 2362h
		push	si
		push	cs

loc_A5892:
		call	near ptr PlayerComponent_ResetVisualStateDefaults_A5620
		pop	cx
		mov	ax, si
		jmp	short loc_A589C
; ���������������������������������������������������������������������������

loc_A589A:				; CODE XREF: PlayerComponentVariantAI_ConstructAndInit_A574D+16j
		mov	ax, si

loc_A589C:				; CODE XREF: PlayerComponentVariantAI_ConstructAndInit_A574D+14Bj
		mov	si, ax
		or	si, si
		jz	short loc_A58A6
		mov	ax, [si]
		jmp	short loc_A58A8
; ���������������������������������������������������������������������������

loc_A58A6:				; CODE XREF: PlayerComponentVariantAI_ConstructAndInit_A574D+153j
		mov	ax, si

loc_A58A8:				; CODE XREF: PlayerComponentVariantAI_ConstructAndInit_A574D+157j
		pop	si
		pop	bp
		retf
PlayerComponentVariantAI_ConstructAndInit_A574D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 178 lignes, NON DÉTAILLÉE — alloue (sub_658), initialise 3 sous-objets composites,
; appelle PlayerComponentVariantAH_ConstructAndInit_A5707.
; ==============================================================================================
PlayerComponentVariantAJ_ConstructAndInit_A58AB	proc far		; CODE XREF: VROOMM_StubThunk_6CBD8J

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	ax, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		push	0C5h ; '�'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_A58CD
		jmp	loc_A5A06
; ���������������������������������������������������������������������������

loc_A58CD:				; CODE XREF: PlayerComponentVariantAJ_ConstructAndInit_A58AB+1Dj
		add	ax, 8Eh	; '�'
		mov	[si], ax
		mov	ax, si
		add	ax, 0B1h ; '�'
		mov	[si+10h], ax
		mov	ax, si
		add	ax, 8Eh	; '�'
		mov	[si+0B1h], ax
		mov	ax, si
		add	ax, 8Eh	; '�'
		mov	[si+1Eh], ax
		mov	ax, si
		add	ax, 0B1h ; '�'
		mov	[si+22h], ax

loc_A58F3:
		mov	ax, si
		add	ax, 8Eh	; '�'

loc_A58F8:
		mov	[si+24h], ax

loc_A58FB:
		mov	word ptr [si+8Ch], 0

loc_A5901:
		mov	word ptr [si+0AFh], 0
		mov	word ptr [si+8Eh], 223Ah
		mov	ax, si
		add	ax, 8Eh	; '�'
		push	ax

loc_A5913:
		call	VROOMM_StubThunk_6CACA
		pop	cx
		mov	bx, [si]
		sub	word ptr [bx-2], 0FFC7h
		mov	word ptr [si+0B3h], 21CEh
		mov	bx, [si+0B1h]
		mov	word ptr [bx], 21EAh

loc_A592D:
		xor	eax, eax

loc_A5930:
		mov	[si+0BDh], eax

loc_A5935:
		mov	[si+0B9h], eax
		mov	[si+0B5h], eax
		mov	ax, si

loc_A5941:
		add	ax, 0B5h ; '�'
		mov	bx, [si]

loc_A5946:
		add	word ptr [bx-2], 0FFC7h

loc_A594A:
		sub	word ptr [bx-2], 6Eh ; 'n'

loc_A594E:
		mov	bx, [si+10h]

loc_A5951:
		sub	word ptr [bx-2], 6Eh ; 'n'
		mov	bx, [si]
		sub	word ptr [bx-2], 0Eh
		mov	word ptr [si+2], 20AEh
		mov	word ptr [bx], 20DEh
		push	si
		call	VROOMM_StubThunk_6CB0A
		pop	cx
		mov	bx, [si]
		add	word ptr [bx-2], 0Eh

loc_A5971:
		mov	word ptr [si+2], 212Eh

loc_A5976:
		mov	word ptr [bx], 2162h
		mov	bx, [si+10h]

loc_A597D:
		mov	word ptr [bx+2], 21B2h
		push	si
		call	VROOMM_StubThunk_6CB73
		pop	cx
		mov	bx, [si]
		add	word ptr [bx-2], 6Eh ; 'n'
		mov	bx, [si+10h]
		add	word ptr [bx-2], 6Eh ; 'n'
		mov	bx, [si]
		sub	word ptr [bx-2], 6Ah ; 'j'
		mov	word ptr [si+20h], 2042h
		mov	bx, [si+1Eh]
		mov	word ptr [bx], 205Eh
		mov	bx, [si]
		add	word ptr [bx-2], 6Ah ; 'j'
		sub	word ptr [bx-2], 59h ; 'Y'
		mov	bx, [si+10h]
		sub	word ptr [bx-2], 59h ; 'Y'
		mov	word ptr [si+26h], 1FB6h
		mov	bx, [si+24h]

loc_A59C1:
		mov	word ptr [bx], 1FD6h

loc_A59C5:
		mov	bx, [si+22h]
		mov	word ptr [bx+2], 2026h
		mov	bx, [si]
		add	word ptr [bx-2], 59h ; 'Y'
		mov	bx, [si+10h]
		add	word ptr [bx-2], 59h ; 'Y'
		mov	word ptr [si+2], 228Ah
		mov	word ptr [si+20h], 22D6h
		mov	word ptr [si+26h], 22F2h
		mov	bx, [si]
		mov	word ptr [bx], 2312h
		mov	bx, [si+10h]
		mov	word ptr [bx+2], 2362h
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr PlayerComponentVariantAH_ConstructAndInit_A5707
		add	sp, 4

loc_A5A02:
		mov	ax, si
		jmp	short loc_A5A08
; ���������������������������������������������������������������������������

loc_A5A06:				; CODE XREF: PlayerComponentVariantAJ_ConstructAndInit_A58AB+1Fj
		mov	ax, si

loc_A5A08:				; CODE XREF: PlayerComponentVariantAJ_ConstructAndInit_A58AB+159j
		mov	si, ax
		or	si, si

loc_A5A0C:
		jz	short loc_A5A12
		mov	ax, [si]
		jmp	short loc_A5A14
; ���������������������������������������������������������������������������

loc_A5A12:				; CODE XREF: PlayerComponentVariantAJ_ConstructAndInit_A58AB:loc_A5A0Cj
		mov	ax, si

loc_A5A14:				; CODE XREF: PlayerComponentVariantAJ_ConstructAndInit_A58AB+165j
		pop	si
		leave
		retf
PlayerComponentVariantAJ_ConstructAndInit_A58AB	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 186 lignes, NON DÉTAILLÉE — alloue (sub_658), initialise 3 sous-objets composites,
; combine PlayerComponentVariantAH_A5707 et PlayerComponent_LoadFieldsWithRetryL_A5C76.
; ==============================================================================================
PlayerComponentVariantAK_ConstructAndInit_A5A17	proc far		; CODE XREF: VROOMM_StubThunk_6CBDDJ

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax

loc_A5A28:
		push	0C5h ; '�'

loc_A5A2B:
		call	CRT_Malloc16_Retry
		pop	cx

loc_A5A31:
		mov	di, ax
		or	ax, ax
		jnz	short loc_A5A3A
		jmp	loc_A5B73
; ���������������������������������������������������������������������������

loc_A5A3A:				; CODE XREF: PlayerComponentVariantAK_ConstructAndInit_A5A17+1Ej
		add	ax, 8Eh	; '�'
		mov	[di], ax
		mov	ax, di

loc_A5A41:
		add	ax, 0B1h ; '�'
		mov	[di+10h], ax
		mov	ax, di
		add	ax, 8Eh	; '�'
		mov	[di+0B1h], ax
		mov	ax, di

loc_A5A52:
		add	ax, 8Eh	; '�'
		mov	[di+1Eh], ax
		mov	ax, di
		add	ax, 0B1h ; '�'
		mov	[di+22h], ax
		mov	ax, di
		add	ax, 8Eh	; '�'
		mov	[di+24h], ax
		mov	word ptr [di+8Ch], 0
		mov	word ptr [di+0AFh], 0
		mov	word ptr [di+8Eh], 223Ah
		mov	ax, di
		add	ax, 8Eh	; '�'
		push	ax

loc_A5A80:
		call	VROOMM_StubThunk_6CACA
		pop	cx
		mov	bx, [di]
		sub	word ptr [bx-2], 0FFC7h
		mov	word ptr [di+0B3h], 21CEh

loc_A5A92:
		mov	bx, [di+0B1h]
		mov	word ptr [bx], 21EAh
		xor	eax, eax
		mov	[di+0BDh], eax
		mov	[di+0B9h], eax
		mov	[di+0B5h], eax
		mov	ax, di
		add	ax, 0B5h ; '�'
		mov	bx, [di]
		add	word ptr [bx-2], 0FFC7h
		sub	word ptr [bx-2], 6Eh ; 'n'
		mov	bx, [di+10h]
		sub	word ptr [bx-2], 6Eh ; 'n'
		mov	bx, [di]
		sub	word ptr [bx-2], 0Eh
		mov	word ptr [di+2], 20AEh

loc_A5ACD:
		mov	word ptr [bx], 20DEh
		push	di

loc_A5AD2:
		call	VROOMM_StubThunk_6CB0A
		pop	cx

loc_A5AD8:
		mov	bx, [di]
		add	word ptr [bx-2], 0Eh
		mov	word ptr [di+2], 212Eh
		mov	word ptr [bx], 2162h
		mov	bx, [di+10h]
		mov	word ptr [bx+2], 21B2h
		push	di
		call	VROOMM_StubThunk_6CB73
		pop	cx
		mov	bx, [di]
		add	word ptr [bx-2], 6Eh ; 'n'
		mov	bx, [di+10h]
		add	word ptr [bx-2], 6Eh ; 'n'
		mov	bx, [di]
		sub	word ptr [bx-2], 6Ah ; 'j'
		mov	word ptr [di+20h], 2042h
		mov	bx, [di+1Eh]
		mov	word ptr [bx], 205Eh
		mov	bx, [di]
		add	word ptr [bx-2], 6Ah ; 'j'
		sub	word ptr [bx-2], 59h ; 'Y'
		mov	bx, [di+10h]

loc_A5B22:
		sub	word ptr [bx-2], 59h ; 'Y'
		mov	word ptr [di+26h], 1FB6h

loc_A5B2B:
		mov	bx, [di+24h]

loc_A5B2E:
		mov	word ptr [bx], 1FD6h

loc_A5B32:
		mov	bx, [di+22h]
		mov	word ptr [bx+2], 2026h
		mov	bx, [di]
		add	word ptr [bx-2], 59h ; 'Y'

loc_A5B40:
		mov	bx, [di+10h]
		add	word ptr [bx-2], 59h ; 'Y'
		mov	word ptr [di+2], 228Ah
		mov	word ptr [di+20h], 22D6h

loc_A5B51:
		mov	word ptr [di+26h], 22F2h
		mov	bx, [di]
		mov	word ptr [bx], 2312h
		mov	bx, [di+10h]
		mov	word ptr [bx+2], 2362h
		push	[bp+var_2]
		push	di
		push	cs
		call	near ptr PlayerComponentVariantAH_ConstructAndInit_A5707
		add	sp, 4
		mov	ax, di
		jmp	short loc_A5B75
; ���������������������������������������������������������������������������

loc_A5B73:				; CODE XREF: PlayerComponentVariantAK_ConstructAndInit_A5A17+20j
		mov	ax, di

loc_A5B75:				; CODE XREF: PlayerComponentVariantAK_ConstructAndInit_A5A17+15Aj
		mov	di, ax
		push	si
		push	ax
		nop
		push	cs
		call	near ptr PlayerComponent_LoadFieldsWithRetryL_A5C76
		add	sp, 4
		or	di, di

loc_A5B83:
		jz	short loc_A5B89

loc_A5B85:
		mov	ax, [di]

loc_A5B87:
		jmp	short loc_A5B8B
; ���������������������������������������������������������������������������

loc_A5B89:				; CODE XREF: PlayerComponentVariantAK_ConstructAndInit_A5A17:loc_A5B83j
		mov	ax, di

loc_A5B8B:				; CODE XREF: PlayerComponentVariantAK_ConstructAndInit_A5A17:loc_A5B87j
		pop	di
		pop	si

locret_A5B8D:
		leave
		retf
PlayerComponentVariantAK_ConstructAndInit_A5A17	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 102 lignes, NON DÉTAILLÉE — aucun appel externe visible (manipulation de champs
; internes).
; ==============================================================================================
PlayerComponent_Helper_A5B8F	proc far		; CODE XREF: VROOMM_StubThunk_6CBBAJ PlayerComponent_LoadFieldsWithRetryL_A5C76+6Ap

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	eax, [di+6Dh]
		mov	[si+6Dh], eax
		mov	eax, [di+33h]
		mov	[si+33h], eax
		mov	eax, [di+37h]
		mov	[si+37h], eax
		mov	eax, [di+3Bh]
		mov	[si+3Bh], eax
		mov	eax, [di+3Fh]
		mov	[si+3Fh], eax
		mov	eax, [di+43h]

loc_A5BC6:
		mov	[si+43h], eax

loc_A5BCA:
		mov	eax, [di+47h]
		mov	[si+47h], eax

loc_A5BD2:
		mov	eax, [di+71h]
		mov	[si+71h], eax
		mov	al, [di+4Bh]
		mov	[si+4Bh], al
		mov	al, [di+4Ch]
		mov	[si+4Ch], al
		mov	al, [di+4Dh]
		mov	[si+4Dh], al
		mov	eax, [di+4Eh]

loc_A5BF0:
		mov	[si+4Eh], eax

loc_A5BF4:
		mov	eax, [di+52h]
		mov	[si+52h], eax
		mov	al, [di+56h]
		mov	[si+56h], al
		mov	al, [di+57h]
		mov	[si+57h], al
		mov	al, [di+58h]
		mov	[si+58h], al
		mov	eax, [di+59h]
		mov	[si+59h], eax
		mov	eax, [di+5Dh]
		mov	[si+5Dh], eax
		mov	eax, [di+61h]
		mov	[si+61h], eax
		mov	al, [di+65h]
		mov	[si+65h], al
		mov	al, [di+66h]
		mov	[si+66h], al

loc_A5C32:
		mov	al, [di+67h]
		mov	[si+67h], al
		mov	eax, [di+69h]
		mov	[si+69h], eax

loc_A5C40:
		mov	ax, [di+80h]

loc_A5C44:
		mov	[si+80h], ax

loc_A5C48:
		mov	ax, [di+82h]

loc_A5C4C:
		mov	[si+82h], ax

loc_A5C50:
		mov	ax, [di+84h]

loc_A5C54:
		mov	[si+84h], ax
		mov	eax, [di+86h]
		mov	[si+86h], eax
		mov	al, [di+8Ah]
		mov	[si+8Ah], al
		mov	al, [di+8Bh]

loc_A5C6E:
		mov	[si+8Bh], al
		pop	di

loc_A5C73:
		pop	si
		pop	bp
		retf
PlayerComponent_Helper_A5B8F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 84 lignes, NON DÉTAILLÉE — initialise 4 sous-objets composites supplémentaires
; (sub_6CAC5/6CB05/6CB1E/6CB69/6CB46) et appelle PlayerComponent_Helper_A5B8F.
; ==============================================================================================
PlayerComponent_LoadFieldsWithRetryL_A5C76	proc far		; CODE XREF: VROOMM_StubThunk_6CBBFJ PlayerComponentVariantAK_ConstructAndInit_A5A17+164p

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	di, di

loc_A5C83:
		jz	short loc_A5C89
		mov	ax, [di]
		jmp	short loc_A5C8B
; ���������������������������������������������������������������������������

loc_A5C89:				; CODE XREF: PlayerComponent_LoadFieldsWithRetryL_A5C76:loc_A5C83j
		mov	ax, di

loc_A5C8B:				; CODE XREF: PlayerComponent_LoadFieldsWithRetryL_A5C76+11j
		push	ax
		push	word ptr [si]
		call	VROOMM_StubThunk_6CAC5
		add	sp, 4
		push	di
		push	si
		call	VROOMM_StubThunk_6CB05
		add	sp, 4
		or	di, di
		jz	short loc_A5CA9
		mov	ax, [di+10h]
		jmp	short loc_A5CAB
; ���������������������������������������������������������������������������

loc_A5CA9:				; CODE XREF: PlayerComponent_LoadFieldsWithRetryL_A5C76+2Cj
		mov	ax, di

loc_A5CAB:				; CODE XREF: PlayerComponent_LoadFieldsWithRetryL_A5C76+31j
		push	ax
		push	word ptr [si+10h]
		call	VROOMM_StubThunk_6CB1E
		add	sp, 4
		push	di
		push	si
		call	VROOMM_StubThunk_6CB69
		add	sp, 4

loc_A5CC1:
		or	di, di

loc_A5CC3:
		jz	short loc_A5CCC
		mov	ax, di
		add	ax, 22h	; '"'
		jmp	short loc_A5CCE
; ���������������������������������������������������������������������������

loc_A5CCC:				; CODE XREF: PlayerComponent_LoadFieldsWithRetryL_A5C76:loc_A5CC3j
		mov	ax, di

loc_A5CCE:				; CODE XREF: PlayerComponent_LoadFieldsWithRetryL_A5C76+54j
		push	ax

loc_A5CCF:
		mov	ax, si
		add	ax, 22h	; '"'

loc_A5CD4:
		push	ax
		call	VROOMM_StubThunk_6CB46
		add	sp, 4
		push	di
		push	si
		push	cs
		call	near ptr PlayerComponent_Helper_A5B8F
		add	sp, 4
		pop	di
		pop	si
		pop	bp
		retf
PlayerComponent_LoadFieldsWithRetryL_A5C76	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,35L — wrapper : int 15h/1209h (5650h), byte_6E33B=1, appelle
; PlayerComponent_ConstructAndLoadMassive_A5EB4 (-> JDYN_ReadChunkFields_A5D18), puis
; [si+0x6D]=[si+0x69]. Point d'entrée du chargement de champs JDYN depuis JDYN_LoadChunk
; (sub_6CBCE).
; ==============================================================================================
PlayerComponent_LoadFieldsWrapper_A5CEA	proc far		; CODE XREF: VROOMM_StubThunk_6CBCEJ

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1

loc_A5CFD:
		mov	byte_6E33B, cl

loc_A5D01:
		push	[bp+arg_2]
		push	si
		nop

loc_A5D06:
		push	cs

loc_A5D07:
		call	near ptr PlayerComponent_ConstructAndLoadMassive_A5EB4
		add	sp, 4
		mov	eax, [si+69h]
		mov	[si+6Dh], eax
		pop	si
		pop	bp
		retf
PlayerComponent_LoadFieldsWrapper_A5CEA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,239L — LECTEUR DU CHUNK 'JDYN' (enveloppe de reglage de la cellule). seek_chunk('JDYN')
; puis 28 champs LE, payload disque = 73 octets (0x49). Champ 1 (disque 0x00 -> struct +0x69,
; copie en +0x6D) = CAPACITE CARBURANT en 24.8 (fait verifie cote donnees) ; +0x6D = carburant
; courant, decremente par sub_49242 (burn = 0xA00*throttle*[+0x33]>>16), clamp>=0, flameout
; ([jdyn+0x28]=0) si <=0. Champ 2 (+0x33) = coeff de consommation carburant. +0x37/+0x3B =
; trainee aerofrein/train (flags_75 bit0/bit2). +0x3F/+0x43 = coeffs de moment AU SOL (gates
; par flag [A+0x20]). +0x47 = limite +/- rate-limitee. +0x4B = seuil de sur-controle.
; +0x4C/+0x4D = trim / trim volets. +0x4E/+0x52/+0x56/+0x57/+0x58 = enveloppe de detection 'au
; sol'. +0x59 = altitude plafond effet de sol. +0x61 = taux de rotation de reference (/4).
; +0x65/+0x66 = coeffs x gains globaux dword_72A1C/72A18. +0x67 -> [jdyn+0x78]. +0x71 = taux
; de rotation/cap max (integre par dt). +0x80..+0x8B (defauts 500/100/231/11005/3/2) =
; PARAMETRES DE COMPORTEMENT DE L'IA DE VOL (lus via [pilotCtx+0x0B] depuis
; seg002/seg003/ovr231, jamais par la physique du joueur) : +0x80 (u16 500)=vitesse IA MAX de
; poursuite, +0x82 (u16 100)=vitesse IA MIN, +0x84 (i16 231)=vitesse de croisiere/manoeuvre IA
; + seuil de distance, +0x86 (u32 11005)=seuil de portee IA, +0x8A (u8 3)=param decision IA
; non localise, +0x8B (u8 2)=poids d'un score de decision IA. Detail : DATA_MODEL.md §6.2.
; +0x33 = conso carburant. +0x5D = coeff de reponse angulaire / maniabilite
; (Aero_ComputeMomentsWithFeedback sub_48400 L633/L678 : module l'accel angulaire =
; jdyn[+0x5D]*controlMoments^2). NB : le coeur aero (portance/trainee/moments) est dans seg102
; via FlightControl_ResolveNamedParam (table nommee par gouverne), PAS dans JDYN. Detail
; complet + citations : analysis/DATA_MODEL.md §6.2.
; ==============================================================================================
JDYN_ReadChunkFields_A5D18	proc far		; CODE XREF: VROOMM_StubThunk_6CBB0J
					; PlayerComponent_ConstructAndLoadMassive_A5EB4:loc_A5F0Cp

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
		call	near ptr PlayerComponent_ResetVisualStateDefaults_A5620
		pop	cx
		push	0
		push	large 'NYDJ'    ; JDYN
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_A5D41
		jmp	loc_A5EA7
; ���������������������������������������������������������������������������

loc_A5D41:				; CODE XREF: JDYN_ReadChunkFields_A5D18+24j
		push	di
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+69h], eax
		push	di
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+33h], eax
		push	di
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+37h], eax
		push	di
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+3Bh], eax
		push	di

loc_A5D7E:
		call	ResourceRecord_ReadFieldGroupC_64A7E

loc_A5D83:
		push	dx
		push	ax
		pop	eax
		pop	cx

loc_A5D88:
		mov	[si+3Fh], eax
		push	di
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+43h], eax
		push	di
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+47h], eax
		push	di
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+71h], eax
		push	di
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		mov	[si+4Bh], al
		push	di
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		mov	[si+4Ch], al
		push	di
		call	ResourceRecord_ReadFinalField_64B51

loc_A5DD3:
		pop	cx
		mov	[si+4Dh], al
		push	di
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+4Eh], eax
		push	di
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+52h], eax
		push	di

loc_A5DF6:
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx

loc_A5DFC:
		mov	[si+56h], al
		push	di

loc_A5E00:
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		mov	[si+57h], al
		push	di
		call	ResourceRecord_ReadFinalField_64B51

loc_A5E0F:
		pop	cx
		mov	[si+58h], al

loc_A5E13:
		push	di

loc_A5E14:
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx

loc_A5E1E:
		mov	[si+59h], eax
		push	di

loc_A5E23:
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx

loc_A5E29:
		push	ax
		pop	eax
		pop	cx

loc_A5E2D:
		mov	[si+5Dh], eax
		push	di

loc_A5E32:
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+61h], eax
		push	di

loc_A5E41:
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		mov	[si+65h], al
		push	di
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx

loc_A5E51:
		mov	[si+66h], al

loc_A5E54:
		push	di
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		mov	[si+67h], al
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+80h], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+82h], ax
		push	di

loc_A5E75:
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx

loc_A5E7B:
		mov	[si+84h], ax
		push	di

loc_A5E80:
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx

loc_A5E86:
		push	ax
		pop	eax
		pop	cx
		mov	[si+86h], eax
		push	di
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		mov	[si+8Ah], al
		push	di
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		mov	[si+8Bh], al
		jmp	short loc_A5EB0
; ���������������������������������������������������������������������������

loc_A5EA7:				; CODE XREF: JDYN_ReadChunkFields_A5D18+26j
		push	0A005h
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_A5EB0:				; CODE XREF: JDYN_ReadChunkFields_A5D18+18Dj
		pop	di
		pop	si
		pop	bp
		retf
JDYN_ReadChunkFields_A5D18	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, initialise 3 sous-objets composites (sub_6CAC0/6CB00/6CB19/6CB64/6CB41) et appelle
; PlayerComponent_LoadFieldsMassive_A5D18.
; ==============================================================================================
PlayerComponent_ConstructAndLoadMassive_A5EB4	proc far		; CODE XREF: VROOMM_StubThunk_6CBB5J
					; PlayerComponent_LoadFieldsWrapper_A5CEA:loc_A5D07p

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_6E33B, cl
		push	di
		push	word ptr [si]
		call	VROOMM_StubThunk_6CAC0
		add	sp, 4
		push	di
		push	si
		call	VROOMM_StubThunk_6CB00
		add	sp, 4
		push	di
		push	word ptr [si+10h]
		call	VROOMM_StubThunk_6CB19
		add	sp, 4
		push	di
		push	si

loc_A5EF2:
		call	VROOMM_StubThunk_6CB64
		add	sp, 4
		push	di
		mov	ax, si

loc_A5EFD:
		add	ax, 22h	; '"'

loc_A5F00:
		push	ax

loc_A5F01:
		call	VROOMM_StubThunk_6CB41
		add	sp, 4

loc_A5F09:
		push	di
		push	si
		push	cs

loc_A5F0C:
		call	near ptr JDYN_ReadChunkFields_A5D18
		add	sp, 4

loc_A5F12:
		pop	di
		pop	si
		pop	bp
		retf
PlayerComponent_ConstructAndLoadMassive_A5EB4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (rôle exact non détaillé).
; ==============================================================================================
PlayerComponent_Helper_A5F16	proc far		; CODE XREF: VROOMM_StubThunk_6CBE2J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
PlayerComponent_Helper_A5F16	endp

seg449		ends

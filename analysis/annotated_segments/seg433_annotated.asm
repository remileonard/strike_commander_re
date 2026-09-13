seg433		segment	para public 'OVERLAY' use16
		assume cs:seg433
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle sub_6C5A5 (probable stub voisin) puis lit plusieurs champs via
; ResourceRecord_SeekAndRead_64743/ReadFinalField_64B51 (×3)/ReadFieldGroupB_64A54 (seg193),
; gestion d'erreur (sub_6B70F). Référencée via jmp depuis un stub VROOMM (sub_6C470) et par
; PlayerComponentVariantB_ConstructAndInit_9FBDE.
; ==============================================================================================
PlayerComponent_LoadFieldsWithRetry_9FAD0	proc far		; CODE XREF: VROOMM_StubThunk_6C470J PlayerComponentVariantB_ConstructAndInit_9FBDE+26p

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp

loc_9FAD3:
		push	si
		mov	si, [bp+arg_4]
		push	si

loc_9FAD8:
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6C5A5

loc_9FAE1:
		add	sp, 6
		push	0

loc_9FAE6:
		push	large 41544144h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_9FB33
		push	si
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+5Eh], al
		push	si
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+5Fh], al
		push	si
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+60h], al

loc_9FB23:
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx

loc_9FB2A:
		les	bx, [bp+arg_0]
		mov	es:[bx+61h], ax

loc_9FB31:
		jmp	short loc_9FB3C
; ���������������������������������������������������������������������������

loc_9FB33:				; CODE XREF: PlayerComponent_LoadFieldsWithRetry_9FAD0+27j
		push	0C001h

loc_9FB36:
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_9FB3C:				; CODE XREF: PlayerComponent_LoadFieldsWithRetry_9FAD0:loc_9FB31j
		pop	si
		pop	bp
		retf
PlayerComponent_LoadFieldsWithRetry_9FAD0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue (sub_658), initialise deux classes de base (sub_3C9BC, sub_3DC27), appelle
; PlayerComponent_SubHelperA_9FD58, enregistre dans un conteneur (sub_6C00E), dispatch vtable
; [bx+8] — constructeur de variante de composant joueur.
; ==============================================================================================
PlayerComponentVariantA_ConstructAndInit_9FB3F	proc far		; CODE XREF: VROOMM_StubThunk_6C475J

var_A		= word ptr -0Ah
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp

loc_9FB42:
		sub	sp, 0Ah
		push	si

loc_9FB46:
		mov	eax, [bp+arg_0]

loc_9FB4A:
		mov	[bp+var_4], eax
		push	5Fh ; '_'

loc_9FB50:
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_9FBAE
		push	ax

loc_9FB5D:
		call	WorldObject_BaseConstruct
		pop	cx

loc_9FB63:
		mov	word ptr [si+51h], 0
		mov	word ptr [si], 26A4h
		push	si
		call	Camera_ResetState
		pop	cx
		mov	word ptr [si], 28FCh
		mov	word ptr [si+55h], 0
		mov	word ptr [si+57h], 0
		mov	byte ptr [si+59h], 1
		or	byte ptr [si+4], 20h
		mov	word ptr [si], 2988h
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		mov	[si+5Ah], eax
		push	large [bp+var_4]
		push	si
		nop
		push	cs
		call	near ptr PlayerComponent_SubHelperA_9FD58
		add	sp, 6
		mov	ax, si
		jmp	short loc_9FBB0
; ���������������������������������������������������������������������������

loc_9FBAE:				; CODE XREF: PlayerComponentVariantA_ConstructAndInit_9FB3F+1Bj
		mov	ax, si

loc_9FBB0:				; CODE XREF: PlayerComponentVariantA_ConstructAndInit_9FB3F+6Dj
		mov	si, ax
		push	ax
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6C00E
		add	sp, 6
		push	si
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+36h]

loc_9FBC7:
		mov	bx, es:[bx+36h]

loc_9FBCB:
		mov	bx, [bx]
		call	dword ptr [bx+8]

loc_9FBD0:
		add	sp, 4
		mov	[bp+var_A], ax
		mov	[si+51h], ax
		mov	ax, si
		pop	si
		leave
		retf
PlayerComponentVariantA_ConstructAndInit_9FB3F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine sub_6C5A5, PlayerComponent_LoadFieldsWithRetry_9FAD0,
; ResourceRecord_SeekAndReadB_647B2 (seg193), sub_6B8BA, ResourceRecord_ReleaseAndClear_64D25
; (seg193), gestion d'erreur.
; ==============================================================================================
PlayerComponentVariantB_ConstructAndInit_9FBDE	proc far		; CODE XREF: VROOMM_StubThunk_6C484J

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp

loc_9FBE1:
		push	si
		mov	si, [bp+arg_4]
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+63h], 0
		push	si
		push	word ptr [bp+arg_0+2]
		push	bx
		call	VROOMM_StubThunk_6C5A5
		add	sp, 6
		push	si
		push	large [bp+arg_0]
		push	cs
		call	near ptr PlayerComponent_LoadFieldsWithRetry_9FAD0
		add	sp, 6
		push	0
		push	large 52504144h
		push	si
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_9FC39
		push	si
		call	VROOMM_StubThunk_6B8BA
		pop	cx
		les	bx, [bp+arg_0]

loc_9FC29:
		mov	es:[bx+65h], dx
		mov	es:[bx+63h], ax

loc_9FC31:
		push	si
		call	ResourceRecord_ReleaseAndClear_64D25
		jmp	short loc_9FC41
; ���������������������������������������������������������������������������

loc_9FC39:				; CODE XREF: PlayerComponentVariantB_ConstructAndInit_9FBDE+3Fj
		push	0C002h

loc_9FC3C:
		call	VROOMM_StubThunk_6B70F

loc_9FC41:				; CODE XREF: PlayerComponentVariantB_ConstructAndInit_9FBDE+59j
		pop	cx

loc_9FC42:
		pop	si
		pop	bp

locret_9FC44:
		retf
PlayerComponentVariantB_ConstructAndInit_9FBDE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, même motif que PlayerComponentVariantA_ConstructAndInit_9FB3F, utilisant
; PlayerComponent_SubHelperB_9FD75.
; ==============================================================================================
PlayerComponentVariantC_ConstructAndInit_9FC45	proc far		; CODE XREF: VROOMM_StubThunk_6C489J

var_E		= dword	ptr -0Eh
var_A		= word ptr -0Ah
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp

loc_9FC48:
		sub	sp, 0Eh
		push	si
		mov	eax, [bp+arg_0]

loc_9FC50:
		mov	[bp+var_4], eax
		push	64h ; 'd'

loc_9FC56:
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_9FCB8
		push	ax

loc_9FC63:
		call	WorldObject_BaseConstruct
		pop	cx
		mov	word ptr [si+51h], 0
		mov	word ptr [si], 26A4h
		push	si
		call	Camera_ResetState
		pop	cx
		mov	word ptr [si], 28FCh
		mov	word ptr [si+55h], 0
		mov	word ptr [si+57h], 0
		mov	byte ptr [si+59h], 1
		or	byte ptr [si+4], 20h
		mov	word ptr [si], 2988h
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		mov	[si+5Ah], eax
		mov	word ptr [si], 2870h
		push	large [bp+var_4]
		push	si
		nop
		push	cs
		call	near ptr PlayerComponent_SubHelperB_9FD75
		add	sp, 6
		mov	ax, si
		jmp	short loc_9FCBA
; ���������������������������������������������������������������������������

loc_9FCB8:				; CODE XREF: PlayerComponentVariantC_ConstructAndInit_9FC45+1Bj
		mov	ax, si

loc_9FCBA:				; CODE XREF: PlayerComponentVariantC_ConstructAndInit_9FC45+71j
		mov	si, ax
		push	ax
		push	large [bp+arg_0]

loc_9FCC1:
		call	VROOMM_StubThunk_6C00E
		add	sp, 6
		push	si
		les	bx, [bp+arg_0]

loc_9FCCD:
		push	word ptr es:[bx+36h]

loc_9FCD1:
		mov	bx, es:[bx+36h]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_A], ax
		mov	[si+51h], ax

loc_9FCE3:
		mov	[bp+var_E], 0
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+63h], 0

loc_9FCF4:
		jz	short loc_9FD0F
		push	si
		push	large dword ptr	es:[bx+63h]
		les	bx, es:[bx+63h]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6
		mov	word ptr [bp+var_E+2], dx
		mov	word ptr [bp+var_E], ax

loc_9FD0F:				; CODE XREF: PlayerComponentVariantC_ConstructAndInit_9FC45:loc_9FCF4j
		mov	eax, [bp+var_E]
		mov	[si+5Fh], eax
		mov	ax, si
		pop	si
		leave
		retf
PlayerComponentVariantC_ConstructAndInit_9FC45	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle Timer_SetAbsolute_4F9A2 (seg110) — initialise un champ minuteur du composant.
; ==============================================================================================
PlayerComponent_InitTimerField_9FD1C	proc far		; CODE XREF: VROOMM_StubThunk_6C47AJ PlayerComponent_SubHelperA_9FD58+16p

var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si

loc_9FD23:
		mov	si, [bp+arg_0]

loc_9FD26:
		les	bx, [si+0Eh]

loc_9FD29:
		mov	al, es:[bx+5Fh]
		mov	ah, 0

loc_9FD2F:
		mov	[bp+var_2], ax

loc_9FD32:
		movsx	eax, [bp+var_2]

loc_9FD37:
		shl	eax, 8

loc_9FD3B:
		mov	[bp+var_6], eax

loc_9FD3F:
		lea	ax, [bp+var_6]
		push	ax

loc_9FD43:
		mov	ax, si

loc_9FD45:
		add	ax, 5Ah	; 'Z'
		push	ax
		call	Timer_SetAbsolute_4F9A2
		add	sp, 4
		and	byte ptr [si+4], 0FDh
		pop	si
		leave
		retf
PlayerComponent_InitTimerField_9FD1C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine sub_4338E et PlayerComponent_InitTimerField_9FD1C.
; ==============================================================================================
PlayerComponent_SubHelperA_9FD58	proc far		; CODE XREF: VROOMM_StubThunk_6C47FJ PlayerComponentVariantA_ConstructAndInit_9FB3F+65p	...

arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	large [bp+arg_2]
		push	si
		call	Targeting_InitWithFlags
		add	sp, 6
		push	si
		push	cs
		call	near ptr PlayerComponent_InitTimerField_9FD1C
		pop	cx
		pop	si
		pop	bp
		retf
PlayerComponent_SubHelperA_9FD58	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle PlayerComponent_SubHelperA_9FD58.
; ==============================================================================================
PlayerComponent_SubHelperB_9FD75	proc far		; CODE XREF: VROOMM_StubThunk_6C48EJ PlayerComponentVariantC_ConstructAndInit_9FC45+69p

arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dword ptr [si+5Fh], 0
		mov	byte ptr [si+63h], 0
		push	large [bp+arg_2]
		push	si
		push	cs
		call	near ptr PlayerComponent_SubHelperA_9FD58
		add	sp, 6
		pop	si
		pop	bp
		retf
PlayerComponent_SubHelperB_9FD75	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle PlayerComponent_SubHelperD_9FDAB.
; ==============================================================================================
PlayerComponent_SubHelperC_9FD97	proc far		; CODE XREF: VROOMM_StubThunk_6C4A2J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	[bp+arg_2]
		push	ax
		nop
		push	cs
		call	near ptr PlayerComponent_SubHelperD_9FDAB
		add	sp, 4
		pop	bp
		retf
PlayerComponent_SubHelperC_9FD97	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine PlayerComponent_LoadFieldGroup_9FDDE, sub_6CB19, sub_6CAC0 (sous-objets
; composites, motif seg109).
; ==============================================================================================
PlayerComponent_SubHelperD_9FDAB	proc far		; CODE XREF: VROOMM_StubThunk_6C4A7J PlayerComponent_SubHelperC_9FD97+Cp

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
		nop
		push	cs
		call	near ptr PlayerComponent_LoadFieldGroup_9FDDE
		add	sp, 4
		push	di
		mov	ax, si
		add	ax, 4
		push	ax
		call	VROOMM_StubThunk_6CB19
		add	sp, 4
		push	di
		push	word ptr [si]

loc_9FDD2:
		call	VROOMM_StubThunk_6CAC0
		add	sp, 4
		pop	di
		pop	si
		pop	bp
		retf
PlayerComponent_SubHelperD_9FDAB	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine ResourceRecord_SeekAndRead_64743 et ResourceRecord_ReadFieldGroupC_64A7E
; (seg193), gestion d'erreur.
; ==============================================================================================
PlayerComponent_LoadFieldGroup_9FDDE	proc far		; CODE XREF: VROOMM_StubThunk_6C4ACJ PlayerComponent_SubHelperD_9FDAB+Fp

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp

loc_9FDE1:
		sub	sp, 4
		push	si
		push	di

loc_9FDE6:
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]

loc_9FDEC:
		push	0
		push	large 424D4247h
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_9FE16
		push	di
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_4], eax
		mov	[si+18h], eax
		jmp	short loc_9FE1F
; ���������������������������������������������������������������������������

loc_9FE16:				; CODE XREF: PlayerComponent_LoadFieldGroup_9FDDE+21j
		push	0C003h
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_9FE1F:				; CODE XREF: PlayerComponent_LoadFieldGroup_9FDDE+36j
		pop	di
		pop	si

locret_9FE21:
		leave
		retf
PlayerComponent_LoadFieldGroup_9FDDE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, référencée via jmp depuis un stub VROOMM (sub_6C493) et par
; PlayerComponent_SubHelperF_A0090.
; ==============================================================================================
PlayerComponent_SubHelperE_9FE23	proc far		; CODE XREF: VROOMM_StubThunk_6C493J PlayerComponent_SubHelperF_A0090+8p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si

loc_9FE27:
		mov	si, [bp+arg_0]
		mov	byte ptr [si+24h], 0
		mov	bx, [si]
		mov	bx, [bx+2]

loc_9FE33:
		and	byte ptr [bx+4], 0FDh

loc_9FE37:
		pop	si

loc_9FE38:
		pop	bp
		retf
PlayerComponent_SubHelperE_9FE23	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 99 lignes, NON DÉTAILLÉE — alloue (sub_658), initialise un sous-objet composite
; (sub_6CACA, motif seg109), appelle PlayerComponent_SubHelperF_A0090.
; ==============================================================================================
PlayerComponentVariantD_ConstructAndInit_9FE3A	proc far		; CODE XREF: VROOMM_StubThunk_6C4BBJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si

loc_9FE3E:
		mov	ax, [bp+arg_0]

loc_9FE41:
		push	49h ; 'I'

loc_9FE43:
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_9FE52

loc_9FE4F:
		jmp	loc_9FEE3
; ���������������������������������������������������������������������������

loc_9FE52:				; CODE XREF: PlayerComponentVariantD_ConstructAndInit_9FE3A+13j
		add	ax, 28h	; '('
		mov	[si], ax

loc_9FE57:
		mov	ax, si

loc_9FE59:
		add	ax, 28h	; '('
		mov	[si+4],	ax

loc_9FE5F:
		mov	word ptr [si+26h], 0

loc_9FE64:
		mov	word ptr [si+28h], 223Ah
		mov	ax, si
		add	ax, 28h	; '('
		push	ax
		call	VROOMM_StubThunk_6CACA
		pop	cx
		mov	bx, [si]
		sub	word ptr [bx-2], 0Eh
		sub	word ptr [bx-2], 14h
		mov	word ptr [si+2], 2042h
		mov	word ptr [bx], 205Eh
		add	word ptr [bx-2], 14h
		mov	word ptr [si+6], 21CEh
		mov	bx, [si+4]
		mov	word ptr [bx], 21EAh
		xor	eax, eax
		mov	[si+10h], eax
		mov	[si+0Ch], eax
		mov	[si+8],	eax
		mov	ax, si
		add	ax, 8
		mov	word ptr [si+2], 1E56h
		mov	word ptr [si+6], 1E72h
		mov	bx, [si]
		mov	word ptr [bx], 1E8Eh
		add	word ptr [bx-2], 0Eh
		mov	word ptr [si+2], 1EDEh
		mov	word ptr [si+6], 1EFAh
		mov	word ptr [bx], 1F16h
		mov	word ptr [si+20h], 0
		mov	word ptr [si+22h], 0
		push	si
		nop
		push	cs
		call	near ptr PlayerComponent_SubHelperF_A0090
		pop	cx
		mov	ax, si
		jmp	short loc_9FEE5
; ���������������������������������������������������������������������������

loc_9FEE3:				; CODE XREF: PlayerComponentVariantD_ConstructAndInit_9FE3A:loc_9FE4Fj
		mov	ax, si

loc_9FEE5:				; CODE XREF: PlayerComponentVariantD_ConstructAndInit_9FE3A+A7j
		mov	si, ax
		or	si, si
		jz	short loc_9FEEF
		mov	ax, [si]
		jmp	short loc_9FEF1
; ���������������������������������������������������������������������������

loc_9FEEF:				; CODE XREF: PlayerComponentVariantD_ConstructAndInit_9FE3A+AFj
		mov	ax, si

loc_9FEF1:				; CODE XREF: PlayerComponentVariantD_ConstructAndInit_9FE3A+B3j
		pop	si
		pop	bp
		retf
PlayerComponentVariantD_ConstructAndInit_9FE3A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 97 lignes, NON DÉTAILLÉE — même motif que PlayerComponentVariantD_9FE3A avec
; PlayerComponent_SubHelperG_A009E.
; ==============================================================================================
PlayerComponentVariantE_ConstructAndInit_9FEF4	proc far		; CODE XREF: VROOMM_StubThunk_6C4C0J

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
		push	49h ; 'I'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_9FF15
		jmp	loc_9FFAB
; ���������������������������������������������������������������������������

loc_9FF15:				; CODE XREF: PlayerComponentVariantE_ConstructAndInit_9FEF4+1Cj
		add	ax, 28h	; '('
		mov	[si], ax
		mov	ax, si
		add	ax, 28h	; '('

loc_9FF1F:
		mov	[si+4],	ax
		mov	word ptr [si+26h], 0
		mov	word ptr [si+28h], 223Ah
		mov	ax, si
		add	ax, 28h	; '('
		push	ax
		call	VROOMM_StubThunk_6CACA
		pop	cx
		mov	bx, [si]
		sub	word ptr [bx-2], 0Eh
		sub	word ptr [bx-2], 14h

loc_9FF42:
		mov	word ptr [si+2], 2042h
		mov	word ptr [bx], 205Eh
		add	word ptr [bx-2], 14h

loc_9FF4F:
		mov	word ptr [si+6], 21CEh

loc_9FF54:
		mov	bx, [si+4]
		mov	word ptr [bx], 21EAh
		xor	eax, eax
		mov	[si+10h], eax
		mov	[si+0Ch], eax
		mov	[si+8],	eax
		mov	ax, si
		add	ax, 8
		mov	word ptr [si+2], 1E56h
		mov	word ptr [si+6], 1E72h
		mov	bx, [si]
		mov	word ptr [bx], 1E8Eh
		add	word ptr [bx-2], 0Eh
		mov	word ptr [si+2], 1EDEh
		mov	word ptr [si+6], 1EFAh
		mov	word ptr [bx], 1F16h
		mov	word ptr [si+20h], 0
		mov	word ptr [si+22h], 0
		push	[bp+var_2]
		push	si
		nop
		push	cs
		call	near ptr PlayerComponent_SubHelperG_A009E
		add	sp, 4
		mov	ax, si
		jmp	short loc_9FFAD
; ���������������������������������������������������������������������������

loc_9FFAB:				; CODE XREF: PlayerComponentVariantE_ConstructAndInit_9FEF4+1Ej
		mov	ax, si

loc_9FFAD:				; CODE XREF: PlayerComponentVariantE_ConstructAndInit_9FEF4+B5j
		mov	si, ax
		or	si, si
		jz	short loc_9FFB7
		mov	ax, [si]
		jmp	short loc_9FFB9
; ���������������������������������������������������������������������������

loc_9FFB7:				; CODE XREF: PlayerComponentVariantE_ConstructAndInit_9FEF4+BDj
		mov	ax, si

loc_9FFB9:				; CODE XREF: PlayerComponentVariantE_ConstructAndInit_9FEF4+C1j
		pop	si
		leave
		retf
PlayerComponentVariantE_ConstructAndInit_9FEF4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 133 lignes, NON DÉTAILLÉE — combine sub_658, sub_6CACA,
; PlayerComponent_SubHelperG_A009E, PlayerComponent_SubHelperH_A00B6.
; ==============================================================================================
PlayerComponentVariantF_ConstructAndInit_9FFBC	proc far		; CODE XREF: VROOMM_StubThunk_6C4C5J

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp

loc_9FFBF:
		sub	sp, 2
		push	si

loc_9FFC3:
		push	di
		mov	si, [bp+arg_0]

loc_9FFC7:
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		push	49h ; 'I'

loc_9FFCF:
		call	CRT_Malloc16_Retry

loc_9FFD4:
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_9FFDE
		jmp	loc_A0074
; ���������������������������������������������������������������������������

loc_9FFDE:				; CODE XREF: PlayerComponentVariantF_ConstructAndInit_9FFBC+1Dj
		add	ax, 28h	; '('
		mov	[di], ax
		mov	ax, di
		add	ax, 28h	; '('
		mov	[di+4],	ax
		mov	word ptr [di+26h], 0
		mov	word ptr [di+28h], 223Ah
		mov	ax, di
		add	ax, 28h	; '('
		push	ax
		call	VROOMM_StubThunk_6CACA
		pop	cx
		mov	bx, [di]
		sub	word ptr [bx-2], 0Eh
		sub	word ptr [bx-2], 14h
		mov	word ptr [di+2], 2042h
		mov	word ptr [bx], 205Eh
		add	word ptr [bx-2], 14h
		mov	word ptr [di+6], 21CEh
		mov	bx, [di+4]

loc_A0020:
		mov	word ptr [bx], 21EAh
		xor	eax, eax
		mov	[di+10h], eax
		mov	[di+0Ch], eax

loc_A002F:
		mov	[di+8],	eax

loc_A0033:
		mov	ax, di

loc_A0035:
		add	ax, 8

loc_A0038:
		mov	word ptr [di+2], 1E56h

loc_A003D:
		mov	word ptr [di+6], 1E72h

loc_A0042:
		mov	bx, [di]

loc_A0044:
		mov	word ptr [bx], 1E8Eh

loc_A0048:
		add	word ptr [bx-2], 0Eh

loc_A004C:
		mov	word ptr [di+2], 1EDEh

loc_A0051:
		mov	word ptr [di+6], 1EFAh
		mov	word ptr [bx], 1F16h
		mov	word ptr [di+20h], 0

loc_A005F:
		mov	word ptr [di+22h], 0

loc_A0064:
		push	[bp+var_2]
		push	di
		nop
		push	cs
		call	near ptr PlayerComponent_SubHelperG_A009E
		add	sp, 4
		mov	ax, di
		jmp	short loc_A0076
; ���������������������������������������������������������������������������

loc_A0074:				; CODE XREF: PlayerComponentVariantF_ConstructAndInit_9FFBC+1Fj
		mov	ax, di

loc_A0076:				; CODE XREF: PlayerComponentVariantF_ConstructAndInit_9FFBC+B6j
		mov	di, ax
		push	si
		push	ax
		nop
		push	cs
		call	near ptr PlayerComponent_SubHelperH_A00B6
		add	sp, 4
		or	di, di
		jz	short loc_A008A
		mov	ax, [di]
		jmp	short loc_A008C
; ���������������������������������������������������������������������������

loc_A008A:				; CODE XREF: PlayerComponentVariantF_ConstructAndInit_9FFBC+C8j
		mov	ax, di

loc_A008C:				; CODE XREF: PlayerComponentVariantF_ConstructAndInit_9FFBC+CCj
		pop	di
		pop	si
		leave
		retf
PlayerComponentVariantF_ConstructAndInit_9FFBC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle PlayerComponent_SubHelperE_9FE23.
; ==============================================================================================
PlayerComponent_SubHelperF_A0090	proc far		; CODE XREF: VROOMM_StubThunk_6C498J PlayerComponentVariantD_ConstructAndInit_9FE3A+A1p	...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		push	cs
		call	near ptr PlayerComponent_SubHelperE_9FE23
		pop	cx
		pop	bp
		retf
PlayerComponent_SubHelperF_A0090	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle PlayerComponent_SubHelperF_A0090.
; ==============================================================================================
PlayerComponent_SubHelperG_A009E	proc far		; CODE XREF: VROOMM_StubThunk_6C49DJ PlayerComponentVariantE_ConstructAndInit_9FEF4+ADp	...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	bx, [si]
		mov	ax, [bp+arg_2]
		mov	[bx+2],	ax
		push	si
		push	cs
		call	near ptr PlayerComponent_SubHelperF_A0090
		pop	cx
		pop	si
		pop	bp
		retf
PlayerComponent_SubHelperG_A009E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine sub_6CAC5, sub_6CB1E (sous-objets composites) et
; PlayerComponent_SubHelperI_A0100.
; ==============================================================================================
PlayerComponent_SubHelperH_A00B6	proc far		; CODE XREF: VROOMM_StubThunk_6C4B6J PlayerComponentVariantF_ConstructAndInit_9FFBC+C0p

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]

loc_A00C1:
		or	di, di
		jz	short loc_A00C9
		mov	ax, [di]
		jmp	short loc_A00CB
; ���������������������������������������������������������������������������

loc_A00C9:				; CODE XREF: PlayerComponent_SubHelperH_A00B6+Dj
		mov	ax, di

loc_A00CB:				; CODE XREF: PlayerComponent_SubHelperH_A00B6+11j
		push	ax
		push	word ptr [si]
		call	VROOMM_StubThunk_6CAC5
		add	sp, 4
		or	di, di
		jz	short loc_A00E1
		mov	ax, di
		add	ax, 4
		jmp	short loc_A00E3
; ���������������������������������������������������������������������������

loc_A00E1:				; CODE XREF: PlayerComponent_SubHelperH_A00B6+22j
		mov	ax, di

loc_A00E3:				; CODE XREF: PlayerComponent_SubHelperH_A00B6+29j
		push	ax
		mov	ax, si

loc_A00E6:
		add	ax, 4
		push	ax
		call	VROOMM_StubThunk_6CB1E
		add	sp, 4
		push	di

loc_A00F3:
		push	si
		nop
		push	cs

loc_A00F6:
		call	near ptr PlayerComponent_SubHelperI_A0100
		add	sp, 4

loc_A00FC:
		pop	di

loc_A00FD:
		pop	si
		pop	bp
		retf
PlayerComponent_SubHelperH_A00B6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, référencée via jmp depuis un stub VROOMM (sub_6C4B1), appelée par
; PlayerComponent_SubHelperH_A00B6.
; ==============================================================================================
PlayerComponent_SubHelperI_A0100	proc far		; CODE XREF: VROOMM_StubThunk_6C4B1J
					; PlayerComponent_SubHelperH_A00B6:loc_A00F6p

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp

loc_A0101:
		mov	bp, sp
		push	si

loc_A0104:
		push	di

loc_A0105:
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	eax, [di+18h]
		mov	[si+18h], eax
		pop	di
		pop	si
		pop	bp
		retf
PlayerComponent_SubHelperI_A0100	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle PlayerComponent_SubHelperK_A012B.
; ==============================================================================================
PlayerComponent_SubHelperJ_A0117	proc far		; CODE XREF: VROOMM_StubThunk_6C4D9J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	[bp+arg_2]
		push	ax
		nop
		push	cs

loc_A0123:
		call	near ptr PlayerComponent_SubHelperK_A012B

loc_A0126:
		add	sp, 4
		pop	bp
		retf
PlayerComponent_SubHelperJ_A0117	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine PlayerComponent_LoadFieldGroupB_A014E et sub_6CAC0 (sous-objet composite).
; ==============================================================================================
PlayerComponent_SubHelperK_A012B	proc far		; CODE XREF: VROOMM_StubThunk_6C4DEJ
					; PlayerComponent_SubHelperJ_A0117:loc_A0123p

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp

loc_A012C:
		mov	bp, sp
		push	si
		push	di

loc_A0130:
		mov	si, [bp+arg_0]

loc_A0133:
		mov	di, [bp+arg_2]
		push	di
		push	si
		nop
		push	cs
		call	near ptr PlayerComponent_LoadFieldGroupB_A014E
		add	sp, 4
		push	di
		push	si
		call	VROOMM_StubThunk_6CAC0
		add	sp, 4
		pop	di
		pop	si
		pop	bp
		retf
PlayerComponent_SubHelperK_A012B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine ResourceRecord_SeekAndRead_64743, ReadFieldGroupB_64A54, ReadFieldGroupC_64A7E
; (seg193), gestion d'erreur.
; ==============================================================================================
PlayerComponent_LoadFieldGroupB_A014E	proc far		; CODE XREF: VROOMM_StubThunk_6C4E3J PlayerComponent_SubHelperK_A012B+Fp

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8

loc_A0154:
		push	si
		push	di

loc_A0156:
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	0

loc_A015E:
		push	large 44525544h
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_A019C
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+21h], ax
		push	di
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_4], eax
		shl	eax, 8
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	[si+23h], eax
		jmp	short loc_A01A5
; ���������������������������������������������������������������������������

loc_A019C:				; CODE XREF: PlayerComponent_LoadFieldGroupB_A014E+21j
		push	0C004h
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_A01A5:				; CODE XREF: PlayerComponent_LoadFieldGroupB_A014E+4Cj
		pop	di
		pop	si
		leave
		retf
PlayerComponent_LoadFieldGroupB_A014E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle sub_3A40B (motif d'ajout à liste membre, seg109). Référencée par
; PlayerComponent_SubHelperL_A02CC.
; ==============================================================================================
PlayerComponent_RegisterInList_A01A9	proc far		; CODE XREF: VROOMM_StubThunk_6C4CAJ PlayerComponent_SubHelperL_A02CC+8p

var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	bx, [si+2]
		and	byte ptr [bx+4], 0FDh

loc_A01BA:
		mov	[bp+var_4], 0
		mov	eax, [bp+var_4]
		mov	[si+39h], eax
		mov	[si+35h], eax
		mov	[si+31h], eax

loc_A01D2:
		mov	[si+2Dh], eax
		mov	[si+29h], eax
		mov	byte ptr [si+28h], 1
		mov	byte ptr [si+27h], 0
		push	0
		mov	ax, si
		add	ax, 45h	; 'E'
		push	ax
		call	SetReference16

loc_A01EF:
		add	sp, 4
		pop	si

locret_A01F3:
		leave
		retf
PlayerComponent_RegisterInList_A01A9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue (sub_658), initialise sous-objet composite (sub_6CACA), appelle
; PlayerComponent_SubHelperL_A02CC.
; ==============================================================================================
PlayerComponentVariantG_ConstructAndInit_A01F5	proc far		; CODE XREF: VROOMM_StubThunk_6C4F2J

arg_0		= word ptr  6

		push	bp

loc_A01F6:
		mov	bp, sp

loc_A01F8:
		push	si
		mov	ax, [bp+arg_0]
		push	47h ; 'G'

loc_A01FE:
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_A0229
		mov	word ptr [si], 223Ah
		push	ax
		call	VROOMM_StubThunk_6CACA
		pop	cx
		mov	word ptr [si], 1E06h
		mov	word ptr [si+45h], 0
		push	si
		nop
		push	cs
		call	near ptr PlayerComponent_SubHelperL_A02CC
		pop	cx
		mov	ax, si
		jmp	short loc_A022B
; ���������������������������������������������������������������������������

loc_A0229:				; CODE XREF: PlayerComponentVariantG_ConstructAndInit_A01F5+13j
		mov	ax, si

loc_A022B:				; CODE XREF: PlayerComponentVariantG_ConstructAndInit_A01F5+32j
		pop	si
		pop	bp
		retf
PlayerComponentVariantG_ConstructAndInit_A01F5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue (sub_658), initialise sous-objet composite (sub_6CACA), appelle
; PlayerComponent_SubHelperM_A02DA.
; ==============================================================================================
PlayerComponentVariantH_ConstructAndInit_A022E	proc far		; CODE XREF: VROOMM_StubThunk_6C4F7J

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp

loc_A0231:
		sub	sp, 2

loc_A0234:
		push	si
		mov	ax, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		push	47h ; 'G'

loc_A0240:
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_A0270
		mov	word ptr [si], 223Ah
		push	ax
		call	VROOMM_StubThunk_6CACA
		pop	cx
		mov	word ptr [si], 1E06h
		mov	word ptr [si+45h], 0
		push	[bp+var_2]
		push	si
		nop
		push	cs
		call	near ptr PlayerComponent_SubHelperM_A02DA
		add	sp, 4
		mov	ax, si
		jmp	short loc_A0272
; ���������������������������������������������������������������������������

loc_A0270:				; CODE XREF: PlayerComponentVariantH_ConstructAndInit_A022E+1Cj
		mov	ax, si

loc_A0272:				; CODE XREF: PlayerComponentVariantH_ConstructAndInit_A022E+40j
		pop	si
		leave
		retf
PlayerComponentVariantH_ConstructAndInit_A022E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue (sub_658), initialise sous-objet composite (sub_6CACA), combine
; PlayerComponent_SubHelperM_A02DA et PlayerComponent_SubHelperN_A02F0.
; ==============================================================================================
PlayerComponentVariantI_ConstructAndInit_A0275	proc far		; CODE XREF: VROOMM_StubThunk_6C4FCJ

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
		push	47h ; 'G'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_A02B8
		mov	word ptr [di], 223Ah
		push	ax
		call	VROOMM_StubThunk_6CACA
		pop	cx
		mov	word ptr [di], 1E06h
		mov	word ptr [di+45h], 0
		push	[bp+var_2]
		push	di
		nop
		push	cs
		call	near ptr PlayerComponent_SubHelperM_A02DA
		add	sp, 4
		mov	ax, di
		jmp	short loc_A02BA
; ���������������������������������������������������������������������������

loc_A02B8:				; CODE XREF: PlayerComponentVariantI_ConstructAndInit_A0275+1Dj
		mov	ax, di

loc_A02BA:				; CODE XREF: PlayerComponentVariantI_ConstructAndInit_A0275+41j
		mov	di, ax
		push	si
		push	ax
		nop
		push	cs
		call	near ptr PlayerComponent_SubHelperN_A02F0

loc_A02C3:
		add	sp, 4

loc_A02C6:
		mov	ax, di

loc_A02C8:
		pop	di
		pop	si
		leave
		retf
PlayerComponentVariantI_ConstructAndInit_A0275	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle PlayerComponent_RegisterInList_A01A9.
; ==============================================================================================
PlayerComponent_SubHelperL_A02CC	proc far		; CODE XREF: VROOMM_StubThunk_6C4CFJ PlayerComponentVariantG_ConstructAndInit_A01F5+2Cp	...

arg_0		= word ptr  6

		push	bp

loc_A02CD:
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax

loc_A02D3:
		push	cs
		call	near ptr PlayerComponent_RegisterInList_A01A9
		pop	cx
		pop	bp
		retf
PlayerComponent_SubHelperL_A02CC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle PlayerComponent_SubHelperL_A02CC.
; ==============================================================================================
PlayerComponent_SubHelperM_A02DA	proc far		; CODE XREF: VROOMM_StubThunk_6C4D4J PlayerComponentVariantH_ConstructAndInit_A022E+38p	...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+2],	ax
		push	si
		push	cs

loc_A02E9:
		call	near ptr PlayerComponent_SubHelperL_A02CC

loc_A02EC:
		pop	cx
		pop	si
		pop	bp
		retf
PlayerComponent_SubHelperM_A02DA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine sub_6CAC5 (sous-objet composite) et PlayerComponent_SubHelperO_A0313.
; ==============================================================================================
PlayerComponent_SubHelperN_A02F0	proc far		; CODE XREF: VROOMM_StubThunk_6C4EDJ PlayerComponentVariantI_ConstructAndInit_A0275+4Bp

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp

loc_A02F1:
		mov	bp, sp

loc_A02F3:
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di

loc_A02FC:
		push	si
		call	VROOMM_StubThunk_6CAC5
		add	sp, 4
		push	di
		push	si
		nop
		push	cs
		call	near ptr PlayerComponent_SubHelperO_A0313
		add	sp, 4
		pop	di
		pop	si
		pop	bp
		retf
PlayerComponent_SubHelperN_A02F0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, référencée via jmp depuis un stub VROOMM (sub_6C4E8) et par
; PlayerComponent_SubHelperN_A02F0.
; ==============================================================================================
PlayerComponent_SubHelperO_A0313	proc far		; CODE XREF: VROOMM_StubThunk_6C4E8J PlayerComponent_SubHelperN_A02F0+19p

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [di+21h]
		mov	[si+21h], ax
		mov	eax, [di+23h]
		sar	eax, 8
		mov	[si+23h], eax
		pop	di
		pop	si
		pop	bp
		retf
PlayerComponent_SubHelperO_A0313	endp

seg433		ends

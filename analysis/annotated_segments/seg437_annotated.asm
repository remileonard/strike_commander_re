seg437		segment	para public 'OVERLAY' use16
		assume cs:seg437
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, référencée via jmp depuis un stub VROOMM (sub_6C620) et par
; PlayerComponent_SubHelperZ_A0CE2/PlayerComponentVariantP_A0D23.
; ==============================================================================================
PlayerComponent_SubHelperY_A0BE0	proc far		; CODE XREF: VROOMM_StubThunk_6C620J PlayerComponent_SubHelperZ_A0CE2+32p	...

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si

loc_A0BE7:
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]

loc_A0BED:
		mov	[si+2],	ax

loc_A0BF0:
		mov	[bp+var_4], 0
		mov	eax, [bp+var_4]
		mov	[si+21h], eax
		pop	si
		leave
		retf
PlayerComponent_SubHelperY_A0BE0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine sub_6CAC0 (sous-objet composite, motif seg109) et
; PlayerComponent_LoadFieldGroupD_A0C36.
; ==============================================================================================
PlayerComponent_SubHelperAA_A0C03	proc far		; CODE XREF: VROOMM_StubThunk_6C625J

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
		push	si

loc_A0C20:
		call	VROOMM_StubThunk_6CAC0
		add	sp, 4
		push	di
		push	si
		nop
		push	cs
		call	near ptr PlayerComponent_LoadFieldGroupD_A0C36
		add	sp, 4
		pop	di

loc_A0C33:
		pop	si

loc_A0C34:
		pop	bp
		retf
PlayerComponent_SubHelperAA_A0C03	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine ResourceRecord_SeekAndRead_64743 et ReadFieldGroupC_64A7E (×2, seg193).
; ==============================================================================================
PlayerComponent_LoadFieldGroupD_A0C36	proc far		; CODE XREF: VROOMM_StubThunk_6C62AJ PlayerComponent_SubHelperAA_A0C03+29p

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	0

loc_A0C43:
		push	large 46525553h
		push	di

loc_A0C4A:
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8

loc_A0C52:
		or	ax, ax
		jz	short loc_A0C74
		push	di

loc_A0C57:
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+21h], eax
		push	di
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+25h], eax

loc_A0C74:				; CODE XREF: PlayerComponent_LoadFieldGroupD_A0C36+1Ej
		pop	di
		pop	si
		pop	bp
		retf
PlayerComponent_LoadFieldGroupD_A0C36	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, référencée via jmp depuis un stub VROOMM (sub_6C62F) et par
; PlayerComponent_SubHelperCC_A0C80.
; ==============================================================================================
PlayerComponent_SubHelperBB_A0C78	proc far		; CODE XREF: VROOMM_StubThunk_6C62FJ PlayerComponent_SubHelperCC_A0C80+18p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
PlayerComponent_SubHelperBB_A0C78	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine sub_6CAC5 (sous-objet composite) et PlayerComponent_SubHelperBB_A0C78.
; ==============================================================================================
PlayerComponent_SubHelperCC_A0C80	proc far		; CODE XREF: VROOMM_StubThunk_6C634J
					; PlayerComponentVariantP_ConstructAndInit_A0D23:loc_A0D67p

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp

loc_A0C83:
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di

loc_A0C8C:
		push	si
		call	VROOMM_StubThunk_6CAC5
		add	sp, 4
		push	di
		push	si
		push	cs
		call	near ptr PlayerComponent_SubHelperBB_A0C78
		add	sp, 4
		pop	di
		pop	si
		pop	bp
		retf
PlayerComponent_SubHelperCC_A0C80	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue (sub_658), initialise sous-objet composite (sub_6CACA) — constructeur de
; variante de composant joueur.
; ==============================================================================================
PlayerComponentVariantQ_ConstructAndInit_A0CA2	proc far		; CODE XREF: VROOMM_StubThunk_6C639J

var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	ax, [bp+arg_0]
		push	29h ; ')'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_A0CDD
		mov	word ptr [si], 223Ah
		push	ax
		call	VROOMM_StubThunk_6CACA
		pop	cx
		mov	word ptr [si], 1DB6h
		mov	[bp+var_4], 0
		mov	eax, [bp+var_4]
		mov	[si+21h], eax
		mov	ax, si
		jmp	short loc_A0CDF
; ���������������������������������������������������������������������������

loc_A0CDD:				; CODE XREF: PlayerComponentVariantQ_ConstructAndInit_A0CA2+16j
		mov	ax, si

loc_A0CDF:				; CODE XREF: PlayerComponentVariantQ_ConstructAndInit_A0CA2+39j
		pop	si
		leave
		retf
PlayerComponentVariantQ_ConstructAndInit_A0CA2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue (sub_658), initialise sous-objet composite (sub_6CACA), appelle
; PlayerComponent_SubHelperY_A0BE0.
; ==============================================================================================
PlayerComponent_SubHelperZ_A0CE2	proc far		; CODE XREF: VROOMM_StubThunk_6C63EJ

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp

loc_A0CE3:
		mov	bp, sp

loc_A0CE5:
		sub	sp, 2
		push	si
		mov	ax, [bp+arg_0]

loc_A0CEC:
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		push	29h ; ')'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax

loc_A0CFE:
		jz	short loc_A0D1E

loc_A0D00:
		mov	word ptr [si], 223Ah
		push	ax

loc_A0D05:
		call	VROOMM_StubThunk_6CACA
		pop	cx
		mov	word ptr [si], 1DB6h
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr PlayerComponent_SubHelperY_A0BE0
		add	sp, 4
		mov	ax, si
		jmp	short loc_A0D20
; ���������������������������������������������������������������������������

loc_A0D1E:				; CODE XREF: PlayerComponent_SubHelperZ_A0CE2:loc_A0CFEj
		mov	ax, si

loc_A0D20:				; CODE XREF: PlayerComponent_SubHelperZ_A0CE2+3Aj
		pop	si
		leave
		retf
PlayerComponent_SubHelperZ_A0CE2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue (sub_658), initialise sous-objet composite (sub_6CACA), combine
; PlayerComponent_SubHelperY_A0BE0 et PlayerComponent_SubHelperCC_A0C80.
; ==============================================================================================
PlayerComponentVariantP_ConstructAndInit_A0D23	proc far		; CODE XREF: VROOMM_StubThunk_6C643J

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp

loc_A0D24:
		mov	bp, sp

loc_A0D26:
		sub	sp, 2
		push	si
		push	di

loc_A0D2B:
		mov	si, [bp+arg_0]

loc_A0D2E:
		mov	ax, [bp+arg_2]

loc_A0D31:
		mov	[bp+var_2], ax

loc_A0D34:
		push	29h ; ')'

loc_A0D36:
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_A0D60
		mov	word ptr [di], 223Ah
		push	ax
		call	VROOMM_StubThunk_6CACA
		pop	cx
		mov	word ptr [di], 1DB6h
		push	[bp+var_2]

loc_A0D54:
		push	di
		push	cs

loc_A0D56:
		call	near ptr PlayerComponent_SubHelperY_A0BE0

loc_A0D59:
		add	sp, 4
		mov	ax, di
		jmp	short loc_A0D62
; ���������������������������������������������������������������������������

loc_A0D60:				; CODE XREF: PlayerComponentVariantP_ConstructAndInit_A0D23+1Dj
		mov	ax, di

loc_A0D62:				; CODE XREF: PlayerComponentVariantP_ConstructAndInit_A0D23+3Bj
		mov	di, ax
		push	si
		push	ax

loc_A0D66:
		push	cs

loc_A0D67:
		call	near ptr PlayerComponent_SubHelperCC_A0C80
		add	sp, 4
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
PlayerComponentVariantP_ConstructAndInit_A0D23	endp

seg437		ends

seg434		segment	para public 'OVERLAY' use16
		assume cs:seg434
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine sub_6C5A5, ResourceRecord_SeekAndRead_64743, ReadFieldGroupC_64A7E,
; ReadFinalField_64B51, ReadFieldGroupB_64A54 (seg193), gestion d'erreur.
; ==============================================================================================
PlayerComponent_LoadFieldsWithRetryB_A0340	proc far		; CODE XREF: VROOMM_StubThunk_6C530J

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp

loc_A0341:
		mov	bp, sp

loc_A0343:
		push	si

loc_A0344:
		mov	si, [bp+arg_4]
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_6E33B, cl
		push	si
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6C5A5

loc_A0361:
		add	sp, 6
		push	0
		push	large 41544144h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_A03AA
		push	si
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+5Eh], eax
		push	si
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+62h], al
		push	si
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+63h], ax
		jmp	short loc_A03B3
; ���������������������������������������������������������������������������

loc_A03AA:				; CODE XREF: PlayerComponent_LoadFieldsWithRetryB_A0340+37j
		push	0C00Ah
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_A03B3:				; CODE XREF: PlayerComponent_LoadFieldsWithRetryB_A0340+68j
		pop	si
		pop	bp
		retf
PlayerComponent_LoadFieldsWithRetryB_A0340	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue (sub_658), initialise deux classes de base (sub_3C9BC, sub_3DC27), appelle
; PlayerComponent_SubHelperP_A0488, enregistre dans un conteneur (sub_6C00E), dispatch vtable
; [bx+8].
; ==============================================================================================
PlayerComponentVariantJ_ConstructAndInit_A03B6	proc far		; CODE XREF: VROOMM_StubThunk_6C535J

var_A		= word ptr -0Ah
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	64h ; 'd'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_A0425
		push	ax
		call	WorldObject_BaseConstruct
		pop	cx
		mov	word ptr [si+51h], 0

loc_A03DF:
		mov	word ptr [si], 26A4h

loc_A03E3:
		push	si
		call	Camera_ResetState
		pop	cx

loc_A03EA:
		mov	word ptr [si], 28FCh

loc_A03EE:
		mov	word ptr [si+55h], 0

loc_A03F3:
		mov	word ptr [si+57h], 0

loc_A03F8:
		mov	byte ptr [si+59h], 1
		or	byte ptr [si+4], 20h
		mov	word ptr [si], 2A14h
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		mov	[si+5Ah], eax
		push	large [bp+var_4]
		push	si
		nop
		push	cs
		call	near ptr PlayerComponent_SubHelperP_A0488
		add	sp, 6

loc_A0421:
		mov	ax, si

loc_A0423:
		jmp	short loc_A0427
; ���������������������������������������������������������������������������

loc_A0425:				; CODE XREF: PlayerComponentVariantJ_ConstructAndInit_A03B6+1Bj
		mov	ax, si

loc_A0427:				; CODE XREF: PlayerComponentVariantJ_ConstructAndInit_A03B6:loc_A0423j
		mov	si, ax
		push	ax
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6C00E
		add	sp, 6
		push	si
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+36h]
		mov	bx, es:[bx+36h]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_A], ax

loc_A044D:
		mov	[si+51h], ax
		mov	ax, si
		pop	si

locret_A0453:
		leave
		retf
PlayerComponentVariantJ_ConstructAndInit_A03B6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle Timer_SetAbsoluteAndResetPulses_4FAFC (seg110).
; ==============================================================================================
PlayerComponent_InitPulseTimer_A0455	proc far		; CODE XREF: VROOMM_StubThunk_6C53AJ PlayerComponent_SubHelperP_A0488+16p

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp

loc_A0458:
		sub	sp, 8
		mov	dx, [bp+arg_0]
		mov	bx, dx
		les	bx, [bx+0Eh]
		mov	eax, es:[bx+5Eh]
		mov	[bp+var_4], eax
		shl	eax, 8
		mov	[bp+var_8], eax
		lea	ax, [bp+var_8]
		push	ax
		mov	ax, dx
		add	ax, 5Ah	; 'Z'
		push	ax
		call	Timer_SetAbsoluteAndResetPulses_4FAFC
		add	sp, 4
		leave
		retf
PlayerComponent_InitPulseTimer_A0455	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine sub_4338E, PlayerComponent_InitPulseTimer_A0455, sub_3D566.
; ==============================================================================================
PlayerComponent_SubHelperP_A0488	proc far		; CODE XREF: VROOMM_StubThunk_6C53FJ PlayerComponentVariantJ_ConstructAndInit_A03B6+65p

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
		call	near ptr PlayerComponent_InitPulseTimer_A0455
		pop	cx
		push	si
		call	Camera_EnableFollowIfActive
		pop	cx
		pop	si
		pop	bp
		retf
PlayerComponent_SubHelperP_A0488	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle PlayerComponent_SubHelperR_A04C0.
; ==============================================================================================
PlayerComponent_SubHelperQ_A04AC	proc far		; CODE XREF: VROOMM_StubThunk_6C553J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	[bp+arg_2]
		push	ax
		nop
		push	cs
		call	near ptr PlayerComponent_SubHelperR_A04C0
		add	sp, 4
		pop	bp
		retf
PlayerComponent_SubHelperQ_A04AC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine sub_6CAC0 (sous-objet composite) et PlayerComponent_LoadFieldGroupC_A04E3.
; ==============================================================================================
PlayerComponent_SubHelperR_A04C0	proc far		; CODE XREF: VROOMM_StubThunk_6C558J PlayerComponent_SubHelperQ_A04AC+Cp

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
		call	VROOMM_StubThunk_6CAC0

loc_A04D2:
		add	sp, 4
		push	di
		push	si
		nop
		push	cs
		call	near ptr PlayerComponent_LoadFieldGroupC_A04E3
		add	sp, 4
		pop	di
		pop	si
		pop	bp
		retf
PlayerComponent_SubHelperR_A04C0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 104 lignes, NON DÉTAILLÉE — combine ResourceRecord_SeekAndRead_64743 et
; ReadFieldGroupC_64A7E (×5, seg193), gestion d'erreur — charge un grand nombre de champs
; depuis le format IFF.
; ==============================================================================================
PlayerComponent_LoadFieldGroupC_A04E3	proc far		; CODE XREF: VROOMM_StubThunk_6C55DJ PlayerComponent_SubHelperR_A04C0+19p

var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	0

loc_A04F3:
		push	large 5353494Dh
		push	di

loc_A04FA:
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8

loc_A0502:
		or	ax, ax
		jz	short loc_A0567

loc_A0506:
		push	di

loc_A0507:
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_4], eax
		mov	[si+21h], eax
		push	di
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_8], eax
		mov	[si+25h], eax
		push	di

loc_A052D:
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx

loc_A0533:
		push	ax
		pop	eax
		pop	cx

loc_A0537:
		mov	[bp+var_C], eax
		mov	[si+29h], eax
		push	di

loc_A0540:
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax

loc_A0549:
		pop	cx

loc_A054A:
		mov	[bp+var_10], eax
		mov	[si+2Dh], eax

loc_A0552:
		push	di

loc_A0553:
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_14], eax
		mov	[si+31h], eax
		jmp	short loc_A0570
; ���������������������������������������������������������������������������

loc_A0567:				; CODE XREF: PlayerComponent_LoadFieldGroupC_A04E3+21j
		push	0C00Bh
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_A0570:				; CODE XREF: PlayerComponent_LoadFieldGroupC_A04E3+82j
		pop	di
		pop	si
		leave
		retf
PlayerComponent_LoadFieldGroupC_A04E3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, référencée via jmp depuis un stub VROOMM (sub_6C544) et par
; PlayerComponent_SubHelperT_A0673.
; ==============================================================================================
PlayerComponent_SubHelperS_A0574	proc far		; CODE XREF: VROOMM_StubThunk_6C544J PlayerComponent_SubHelperT_A0673+8p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+3Bh], 0
		mov	byte ptr [si+3Ah], 0
		mov	bx, [si+2]
		and	byte ptr [bx+4], 0FDh
		pop	si
		pop	bp
		retf
PlayerComponent_SubHelperS_A0574	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue (sub_658), initialise sous-objet composite (sub_6CACA), appelle
; PlayerComponent_SubHelperT_A0673.
; ==============================================================================================
PlayerComponentVariantK_ConstructAndInit_A058D	proc far		; CODE XREF: VROOMM_StubThunk_6C56CJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+arg_0]
		push	3Ch ; '<'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_A05C6
		mov	word ptr [si], 223Ah
		push	ax
		call	VROOMM_StubThunk_6CACA
		pop	cx
		mov	word ptr [si], 1F66h
		mov	word ptr [si+35h], 0
		mov	word ptr [si+37h], 0
		push	si
		nop
		push	cs
		call	near ptr PlayerComponent_SubHelperT_A0673
		pop	cx
		mov	ax, si

loc_A05C4:
		jmp	short loc_A05C8
; ���������������������������������������������������������������������������

loc_A05C6:				; CODE XREF: PlayerComponentVariantK_ConstructAndInit_A058D+13j
		mov	ax, si

loc_A05C8:				; CODE XREF: PlayerComponentVariantK_ConstructAndInit_A058D:loc_A05C4j
		pop	si
		pop	bp
		retf
PlayerComponentVariantK_ConstructAndInit_A058D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue (sub_658), initialise sous-objet composite (sub_6CACA), appelle
; PlayerComponent_SubHelperU_A0681.
; ==============================================================================================
PlayerComponentVariantL_ConstructAndInit_A05CB	proc far		; CODE XREF: VROOMM_StubThunk_6C571J

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
		push	3Ch ; '<'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_A0612
		mov	word ptr [si], 223Ah
		push	ax

loc_A05EE:
		call	VROOMM_StubThunk_6CACA
		pop	cx

loc_A05F4:
		mov	word ptr [si], 1F66h
		mov	word ptr [si+35h], 0
		mov	word ptr [si+37h], 0
		push	[bp+var_2]
		push	si
		nop
		push	cs
		call	near ptr PlayerComponent_SubHelperU_A0681
		add	sp, 4
		mov	ax, si
		jmp	short loc_A0614
; ���������������������������������������������������������������������������

loc_A0612:				; CODE XREF: PlayerComponentVariantL_ConstructAndInit_A05CB+1Cj
		mov	ax, si

loc_A0614:				; CODE XREF: PlayerComponentVariantL_ConstructAndInit_A05CB+45j
		pop	si
		leave
		retf
PlayerComponentVariantL_ConstructAndInit_A05CB	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue (sub_658), initialise sous-objet composite (sub_6CACA), combine
; PlayerComponent_SubHelperU_A0681 et PlayerComponent_SubHelperV_A0697.
; ==============================================================================================
PlayerComponentVariantM_ConstructAndInit_A0617	proc far		; CODE XREF: VROOMM_StubThunk_6C576J

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

loc_A0628:
		push	3Ch ; '<'

loc_A062A:
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax

loc_A0632:
		or	ax, ax

loc_A0634:
		jz	short loc_A065F
		mov	word ptr [di], 223Ah
		push	ax
		call	VROOMM_StubThunk_6CACA
		pop	cx

loc_A0641:
		mov	word ptr [di], 1F66h
		mov	word ptr [di+35h], 0

loc_A064A:
		mov	word ptr [di+37h], 0

loc_A064F:
		push	[bp+var_2]
		push	di
		nop

loc_A0654:
		push	cs
		call	near ptr PlayerComponent_SubHelperU_A0681
		add	sp, 4
		mov	ax, di
		jmp	short loc_A0661
; ���������������������������������������������������������������������������

loc_A065F:				; CODE XREF: PlayerComponentVariantM_ConstructAndInit_A0617:loc_A0634j
		mov	ax, di

loc_A0661:				; CODE XREF: PlayerComponentVariantM_ConstructAndInit_A0617+46j
		mov	di, ax
		push	si
		push	ax
		nop
		push	cs
		call	near ptr PlayerComponent_SubHelperV_A0697
		add	sp, 4
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
PlayerComponentVariantM_ConstructAndInit_A0617	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle PlayerComponent_SubHelperS_A0574.
; ==============================================================================================
PlayerComponent_SubHelperT_A0673	proc far		; CODE XREF: VROOMM_StubThunk_6C549J PlayerComponentVariantK_ConstructAndInit_A058D+31p	...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		push	cs
		call	near ptr PlayerComponent_SubHelperS_A0574
		pop	cx
		pop	bp
		retf
PlayerComponent_SubHelperT_A0673	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle PlayerComponent_SubHelperT_A0673.
; ==============================================================================================
PlayerComponent_SubHelperU_A0681	proc far		; CODE XREF: VROOMM_StubThunk_6C54EJ PlayerComponentVariantL_ConstructAndInit_A05CB+3Dp	...

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
		call	near ptr PlayerComponent_SubHelperT_A0673
		pop	cx
		pop	si
		pop	bp
		retf
PlayerComponent_SubHelperU_A0681	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine sub_6CAC5 (sous-objet composite) et PlayerComponent_SubHelperW_A06BA.
; ==============================================================================================
PlayerComponent_SubHelperV_A0697	proc far		; CODE XREF: VROOMM_StubThunk_6C567J PlayerComponentVariantM_ConstructAndInit_A0617+50p

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
		call	VROOMM_StubThunk_6CAC5
		add	sp, 4
		push	di
		push	si
		nop
		push	cs
		call	near ptr PlayerComponent_SubHelperW_A06BA
		add	sp, 4
		pop	di
		pop	si
		pop	bp
		retf
PlayerComponent_SubHelperV_A0697	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, référencée via jmp depuis un stub VROOMM (sub_6C562) et par
; PlayerComponent_SubHelperV_A0697.
; ==============================================================================================
PlayerComponent_SubHelperW_A06BA	proc far		; CODE XREF: VROOMM_StubThunk_6C562J PlayerComponent_SubHelperV_A0697+19p

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]

loc_A06C2:
		mov	di, [bp+arg_2]
		mov	eax, [di+21h]
		mov	[si+21h], eax
		mov	eax, [di+25h]
		mov	[si+25h], eax
		mov	eax, [di+29h]
		mov	[si+29h], eax
		mov	eax, [di+2Dh]

loc_A06E1:
		mov	[si+2Dh], eax

loc_A06E5:
		mov	eax, [di+31h]

loc_A06E9:
		mov	[si+31h], eax
		pop	di
		pop	si

loc_A06EF:
		pop	bp
		retf
PlayerComponent_SubHelperW_A06BA	endp

seg434		ends

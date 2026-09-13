seg190		segment	byte public 'CODE' use16
		assume cs:seg190
		;org 0Fh
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, destructeur de la classe « lecteur de flux tamponné » : détruit des sous-objets
; (sub_5E9A9/sub_5E95A), dispatch vtable (DisplayContext_Method_PassThrough_5F458) et libère
; un membre (Member_ClearAndFree_5EA03). Référencée dans le cluster environnant.
; ==============================================================================================
StreamReader_Destruct_638FF	proc far		; CODE XREF: seg193:0055P StreamReader_DestructWrapper_659C1+7P ...

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp

loc_63900:
		mov	bp, sp

loc_63902:
		sub	sp, 4
		push	si

loc_63906:
		mov	si, [bp+arg_0]
		mov	[bp+var_4], 0
		mov	[bp+var_2], 0

loc_63913:
		mov	al, [si+4Ch]
		mov	ah, 0

loc_63918:
		shl	ax, 1

loc_6391A:
		mov	bx, ax

loc_6391C:
		push	word ptr [bx+3F62h]
		push	large dword ptr	[si+4Dh]
		push	large dword ptr	[si+55h]

loc_63928:
		mov	ax, si

loc_6392A:
		add	ax, 0Ah
		push	ax
		push	3F7Fh

loc_63931:
		lea	ax, [bp+var_4]
		push	ax
		call	DisplaySurface_ConstructWithMode_5E9A9
		add	sp, 10h
		push	[bp+var_4]

loc_63940:
		mov	ax, si

loc_63942:
		add	ax, 6
		push	ax

loc_63946:
		call	CachedObject_DestructSubobjects_5E95A

loc_6394B:
		add	sp, 4
		push	si

loc_6394F:
		call	DisplayContext_Method_PassThrough_5F458

loc_63954:
		pop	cx
		lea	ax, [bp+var_4]
		push	ax
		call	Member_ClearAndFree_5EA03
		pop	cx
		pop	si
		leave
		retf
StreamReader_Destruct_638FF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine StreamReader_ValidateState_63DB5, sub_2A82 (externe) et
; Runtime_FatalErrorHandlerWithTag_UNRESOLVED (sub_5F4A9). Appelée par sub_639F1 et sub_63B23.
; ==============================================================================================
StreamReader_Helper_63962	proc far		; CODE XREF: StreamReader_ValidateAndDispatch_639F1:loc_639FDp
					; StreamReader_ConstructAndBind_63B23:loc_63B52p

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	si
		nop
		push	cs

loc_63970:
		call	near ptr StreamReader_ValidateState_63DB5
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_63992
		or	di, di
		jz	short loc_6398C
		push	di
		mov	ax, si

loc_63981:
		add	ax, 0Ah
		push	ax

loc_63985:
		call	CRT_Strcpy
		jmp	short loc_6399B
; ���������������������������������������������������������������������������

loc_6398C:				; CODE XREF: StreamReader_Helper_63962+1Aj
		mov	byte ptr [si+0Ah], 0
		jmp	short loc_6399E
; ���������������������������������������������������������������������������

loc_63992:				; CODE XREF: StreamReader_Helper_63962+16j
		push	1912h
		push	si

loc_63996:
		call	DisplayContext_CommitFrameWithTag_5F4A9

loc_6399B:				; CODE XREF: StreamReader_Helper_63962+28j
		add	sp, 4

loc_6399E:				; CODE XREF: StreamReader_Helper_63962+2Ej
		pop	di
		pop	si
		pop	bp
		retf
StreamReader_Helper_63962	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine StreamReader_ValidateState_63DB5 et Runtime_FatalErrorHandlerWithTag
; (sub_5F4A9). Appelée par sub_639F1.
; ==============================================================================================
StreamReader_Helper_639A2	proc far		; CODE XREF: StreamReader_ValidateAndDispatch_639F1+18p

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si

loc_639A6:
		mov	si, [bp+arg_0]
		push	si
		nop
		push	cs
		call	near ptr StreamReader_ValidateState_63DB5
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_639BE
		mov	al, [bp+arg_2]
		mov	[si+4Ch], al
		jmp	short loc_639CA
; ���������������������������������������������������������������������������

loc_639BE:				; CODE XREF: StreamReader_Helper_639A2+12j
		push	1913h
		push	si

loc_639C2:
		call	DisplayContext_CommitFrameWithTag_5F4A9
		add	sp, 4

loc_639CA:				; CODE XREF: StreamReader_Helper_639A2+1Aj
		pop	si
		pop	bp
		retf
StreamReader_Helper_639A2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine Runtime_FatalErrorHandlerWithTag (sub_5F4A9). Appelée par sub_63A88 et
; sub_63D2D.
; ==============================================================================================
StreamReader_Helper_639CD	proc far		; CODE XREF: StreamReader_ConstructVariantB_63A88+40p
					; StreamReader_ReadDispatchB_63D2D:loc_63D55p

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si

loc_639D1:
		mov	si, [bp+arg_0]
		cmp	word ptr [si+59h], 0
		jnz	short loc_639E2
		mov	ax, [bp+arg_2]
		mov	[si+59h], ax
		jmp	short loc_639EE
; ���������������������������������������������������������������������������

loc_639E2:				; CODE XREF: StreamReader_Helper_639CD+Bj
		push	1990h
		push	si
		call	DisplayContext_CommitFrameWithTag_5F4A9
		add	sp, 4

loc_639EE:				; CODE XREF: StreamReader_Helper_639CD+13j
		pop	si
		pop	bp
		retf
StreamReader_Helper_639CD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine StreamReader_Helper_63962 et StreamReader_Helper_639A2. Appelée par sub_63D0E.
; ==============================================================================================
StreamReader_ValidateAndDispatch_639F1	proc far		; CODE XREF: StreamReader_ReadDispatch_63D0E:loc_63D1Ep

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		push	si

loc_639F5:
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		push	si
		push	cs

loc_639FD:
		call	near ptr StreamReader_Helper_63962
		add	sp, 4
		mov	al, [bp+arg_4]
		push	ax
		push	si
		push	cs
		call	near ptr StreamReader_Helper_639A2
		add	sp, 4
		pop	si
		pop	bp

locret_63A11:
		retf
StreamReader_ValidateAndDispatch_639F1	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelée par sub_63A39 (constructeur, seg009), sub_63A88 (seg195), sub_63AD3 (sub_A713E)
; et sub_63B23 (sub_33346) — helper commun d'initialisation, largement utilisé par des sous-
; systèmes très divers.
; ==============================================================================================
StreamReader_Helper_63A12	proc far		; CODE XREF: StreamReader_ConstructVariantA_63A39:loc_63A7Fp
					; StreamReader_ConstructVariantB_63A88+37p ...

arg_0		= word ptr  6

		push	bp

loc_63A13:
		mov	bp, sp
		push	si

loc_63A16:
		mov	si, [bp+arg_0]

loc_63A19:
		xor	eax, eax

loc_63A1C:
		mov	[si+55h], eax

loc_63A20:
		mov	[si+51h], eax

loc_63A24:
		mov	[si+4Dh], eax

loc_63A28:
		mov	word ptr [si+5Bh], 0

loc_63A2D:
		mov	word ptr [si+59h], 0

loc_63A32:
		mov	byte ptr [si+0Ah], 0
		pop	si
		pop	bp
		retf
StreamReader_Helper_63A12	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue (sub_658) et initialise (StreamReader_Helper_63A12). Référencée directement
; depuis seg009 (cœur du jeu/boucle principale).
; ==============================================================================================
StreamReader_ConstructVariantA_63A39	proc far		; CODE XREF: seg009:030DP
					; TextObj_Construct+24P ...

var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si

loc_63A40:
		mov	si, [bp+arg_0]

loc_63A43:
		or	si, si
		jnz	short loc_63A55
		push	5Dh ; ']'

loc_63A49:
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_63A51:
		or	ax, ax

loc_63A53:
		jz	short loc_63A83

loc_63A55:				; CODE XREF: StreamReader_ConstructVariantA_63A39+Cj
		mov	word ptr [si], 39E3h

loc_63A59:
		mov	word ptr [si+6], 0

loc_63A5E:
		mov	word ptr [si+8], 0

loc_63A63:
		mov	word ptr [si+4], seg seg160
		mov	word ptr [si+2], 0
		mov	word ptr [si], 3FB3h

loc_63A71:
		mov	eax, dword ptr aL?s?x?+6
		mov	[bp+var_4], eax
		mov	[si+2],	eax
		push	si
		push	cs

loc_63A7F:
		call	near ptr StreamReader_Helper_63A12
		pop	cx

loc_63A83:				; CODE XREF: StreamReader_ConstructVariantA_63A39:loc_63A53j
		mov	ax, si
		pop	si
		leave
		retf
StreamReader_ConstructVariantA_63A39	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue (sub_658), initialise (StreamReader_Helper_63A12, StreamReader_Helper_639CD).
; Référencée depuis seg195.
; ==============================================================================================
StreamReader_ConstructVariantB_63A88	proc far		; CODE XREF: seg195:0099P

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si

loc_63A91:
		jnz	short loc_63AA1

loc_63A93:
		push	5Dh ; ']'

loc_63A95:
		call	CRT_Malloc16_Retry

loc_63A9A:
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_63ACE

loc_63AA1:				; CODE XREF: StreamReader_ConstructVariantB_63A88:loc_63A91j
		mov	word ptr [si], 39E3h

loc_63AA5:
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], seg seg160

loc_63AB4:
		mov	word ptr [si+2], 0
		mov	word ptr [si], 3FB3h
		push	si
		push	cs
		call	near ptr StreamReader_Helper_63A12
		pop	cx
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr StreamReader_Helper_639CD
		add	sp, 4

loc_63ACE:				; CODE XREF: StreamReader_ConstructVariantB_63A88+17j
		mov	ax, si
		pop	si
		pop	bp
		retf
StreamReader_ConstructVariantB_63A88	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue (sub_658), initialise (StreamReader_Helper_63A12, sub_63D0E). Référencée par
; sub_A713E.
; ==============================================================================================
StreamReader_ConstructVariantC_63AD3	proc far		; CODE XREF: TextCycler_LoadFromIndexedReader_A713E+69P

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		push	si

loc_63AD7:
		mov	si, [bp+arg_0]
		or	si, si

loc_63ADC:
		jnz	short loc_63AEC
		push	5Dh ; ']'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_63B1E

loc_63AEC:				; CODE XREF: StreamReader_ConstructVariantC_63AD3:loc_63ADCj
		mov	word ptr [si], 39E3h

loc_63AF0:
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0

loc_63AFA:
		mov	word ptr [si+4], seg seg160

loc_63AFF:
		mov	word ptr [si+2], 0

loc_63B04:
		mov	word ptr [si], 3FB3h
		push	si
		push	cs
		call	near ptr StreamReader_Helper_63A12
		pop	cx
		mov	al, [bp+arg_4]

loc_63B11:
		push	ax

loc_63B12:
		push	[bp+arg_2]

loc_63B15:
		push	si

loc_63B16:
		nop

loc_63B17:
		push	cs
		call	near ptr StreamReader_ReadDispatch_63D0E
		add	sp, 6

loc_63B1E:				; CODE XREF: StreamReader_ConstructVariantC_63AD3+17j
		mov	ax, si
		pop	si

loc_63B21:
		pop	bp
		retf
StreamReader_ConstructVariantC_63AD3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 99 lignes, NON DÉTAILLÉE — combine StreamReader_Helper_63A12,
; StreamReader_Helper_63962, dispatch vtable et sub_63D2D. Référencée par sub_33346 (proche du
; cœur IA).
; ==============================================================================================
StreamReader_ConstructAndBind_63B23	proc far		; CODE XREF: Terrain_HeightmapAllocate+130P
					; StreamReader_ParseFormattedValue_6410E+4EP ...

var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh
arg_C		= word ptr  12h

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]

loc_63B31:
		mov	al, [si+0Ah]
		mov	[bp+var_1], al
		push	si
		push	cs
		call	near ptr StreamReader_Helper_63A12
		pop	cx
		mov	ax, si

loc_63B3F:
		add	ax, 0Ah
		cmp	ax, [bp+arg_C]
		jnz	short loc_63B4D
		mov	al, [bp+var_1]

loc_63B4A:
		mov	[si+0Ah], al

loc_63B4D:				; CODE XREF: StreamReader_ConstructAndBind_63B23+22j
		push	[bp+arg_C]
		push	si

loc_63B51:
		push	cs

loc_63B52:
		call	near ptr StreamReader_Helper_63962

loc_63B55:
		add	sp, 4

loc_63B58:
		mov	[si+5Bh], di
		mov	al, [di+4Ch]

loc_63B5E:
		mov	[si+4Ch], al
		push	si

loc_63B62:
		mov	bx, [si]
		call	dword ptr [bx+8]
		pop	cx
		or	al, al
		jz	short loc_63B93
		mov	eax, [di+51h]
		add	[bp+arg_4], eax

loc_63B74:
		add	[bp+arg_8], eax

loc_63B78:
		push	large [bp+arg_8]

loc_63B7C:
		push	large [bp+arg_4]

loc_63B80:
		push	word ptr [di+59h]

loc_63B83:
		push	si
		nop
		push	cs
		call	near ptr StreamReader_ReadDispatchB_63D2D
		add	sp, 0Ch
		push	si
		mov	bx, [si]

loc_63B8F:
		call	dword ptr [bx+0Ch]
		pop	cx

loc_63B93:				; CODE XREF: StreamReader_ConstructAndBind_63B23+47j
		pop	di

loc_63B94:
		pop	si
		leave
		retf
StreamReader_ConstructAndBind_63B23	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine StreamReader_ValidateState_63DB5 et sub_63D6E, dispatch vtable [bx]. Appelée
; par sub_63BD5.
; ==============================================================================================
StreamReader_CloseUnderlying_63B97	proc far		; CODE XREF: StreamReader_Close_63BD5+15p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		nop
		push	cs
		call	near ptr StreamReader_ValidateState_63DB5
		pop	cx
		or	al, al
		jz	short loc_63BB0
		push	si
		nop
		push	cs
		call	near ptr StreamReader_CloseHook_63D6E
		pop	cx

loc_63BB0:				; CODE XREF: StreamReader_CloseUnderlying_63B97+10j
		cmp	word ptr [si+5Bh], 0

loc_63BB4:
		jnz	short loc_63BD2
		cmp	word ptr [si+59h], 0
		jz	short loc_63BCD
		push	3
		push	word ptr [si+59h]
		mov	bx, [si+59h]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short $+2

loc_63BCD:				; CODE XREF: StreamReader_CloseUnderlying_63B97+23j
		mov	word ptr [si+59h], 0

loc_63BD2:				; CODE XREF: StreamReader_CloseUnderlying_63B97:loc_63BB4j
		pop	si
		pop	bp
		retf
StreamReader_CloseUnderlying_63B97	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, ferme et libère le flux (StreamReader_CloseUnderlying_63B97, Member_ClearAndFree_5EA03,
; sub_338). Référencée directement par TextRenderer_Main (sub_27477, seg048).
; ==============================================================================================
StreamReader_Close_63BD5	proc far		; CODE XREF: TextRenderer_Main+9A2P
					; seg048:1349P	...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_63C07
		mov	word ptr [si], 3FB3h
		push	si
		push	cs
		call	near ptr StreamReader_CloseUnderlying_63B97
		pop	cx
		mov	ax, si
		add	ax, 6
		push	ax

loc_63BF4:
		call	Member_ClearAndFree_5EA03
		pop	cx

loc_63BFA:
		test	di, 1

loc_63BFE:
		jz	short loc_63C07
		push	si

loc_63C01:
		call	CRT_FreeNear_Wrap
		pop	cx

loc_63C07:				; CODE XREF: StreamReader_Close_63BD5+Dj
					; StreamReader_Close_63BD5:loc_63BFEj
		pop	di
		pop	si
		pop	bp
		retf
StreamReader_Close_63BD5	endp

; ���������������������������������������������������������������������������

; ==============================================================================================
; far, alloue via sub_658 (fonction interne du cluster StreamReader, aucun label IDA distinct
; trouvé pour ses appelants).
; ==============================================================================================
StreamReader_AllocateInternal_63C0B:				; DATA XREF: seg339:13B6o
					; seg339:off_71073o ...
		push	bp
		mov	bp, sp
		push	si

loc_63C0F:
		mov	ax, [bp+6]

loc_63C12:
		push	4

loc_63C14:
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax

loc_63C1E:
		jz	short loc_63C2B

loc_63C20:
		mov	word ptr [si], 3F42h

loc_63C24:
		mov	word ptr [si+2], 0
		jmp	short loc_63C2D
; ���������������������������������������������������������������������������

loc_63C2B:				; CODE XREF: seg190:loc_63C1Ej
		mov	ax, si

loc_63C2D:				; CODE XREF: seg190:0339j
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, dispatch vtable [bx+0x10] avec gestion d'erreur (Runtime_FatalErrorHandlerWithTag,
; sub_5F4A9). Appelée par sub_63C61.
; ==============================================================================================
StreamReader_DispatchRead_63C30	proc far		; CODE XREF: StreamReader_ReadBlock_63C61+3Fp

arg_0		= word ptr  6

		push	bp
		mov	bp, sp

loc_63C33:
		push	si

loc_63C34:
		mov	si, [bp+arg_0]
		cmp	word ptr [si+59h], 0
		jnz	short loc_63C52
		push	si
		mov	bx, [si]

loc_63C40:
		call	dword ptr [bx+10h]

loc_63C43:
		pop	cx

loc_63C44:
		mov	[si+59h], ax

loc_63C47:
		cmp	word ptr [si+59h], 0
		jnz	short loc_63C5E

loc_63C4D:
		push	19E0h

loc_63C50:
		jmp	short loc_63C55
; ���������������������������������������������������������������������������

loc_63C52:				; CODE XREF: StreamReader_DispatchRead_63C30+Bj
		push	1990h

loc_63C55:				; CODE XREF: StreamReader_DispatchRead_63C30:loc_63C50j
		push	si

loc_63C56:
		call	DisplayContext_CommitFrameWithTag_5F4A9
		add	sp, 4

loc_63C5E:				; CODE XREF: StreamReader_DispatchRead_63C30+1Bj
		pop	si
		pop	bp
		retf
StreamReader_DispatchRead_63C30	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 115 lignes, NON DÉTAILLÉE — combine sub_6410E, StreamReader_DispatchRead_63C30 et
; dispatch vtable multiple ([bx+8]/[bx+0x10]/[bx+0x18]/[bx+0xC]). Appelée par sub_63D0E et
; sub_63D2D — cœur de lecture par blocs du flux tamponné.
; ==============================================================================================
StreamReader_ReadBlock_63C61	proc far		; CODE XREF: StreamReader_ReadDispatch_63D0E:loc_63D26p
					; StreamReader_ReadDispatchB_63D2D+3Ap ...

var_3		= byte ptr -3
var_2		= byte ptr -2
arg_0		= word ptr  6

		push	bp

loc_63C62:
		mov	bp, sp

loc_63C64:
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		cmp	byte ptr [si+4Ch], 1
		jnz	short loc_63C87
		mov	ax, si
		add	ax, 0Ah
		push	ax
		push	si
		call	StreamReader_ParseFormattedValue_6410E
		add	sp, 4

loc_63C84:
		mov	[bp+var_2], al

loc_63C87:				; CODE XREF: StreamReader_ReadBlock_63C61+12j
		cmp	[bp+var_2], 0
		jnz	short loc_63D08
		push	si

loc_63C8E:
		mov	bx, [si]

loc_63C90:
		call	dword ptr [bx+8]

loc_63C93:
		pop	cx
		or	al, al
		jz	short loc_63D08
		cmp	word ptr [si+59h], 0
		jnz	short loc_63CA4
		push	si
		push	cs
		call	near ptr StreamReader_DispatchRead_63C30
		pop	cx

loc_63CA4:				; CODE XREF: StreamReader_ReadBlock_63C61+3Bj
		cmp	word ptr [si+59h], 0
		jz	short loc_63CFC
		mov	al, [si+4Ch]
		push	ax
		mov	ax, si
		add	ax, 0Ah
		push	ax
		push	word ptr [si+59h]
		mov	bx, [si+59h]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6
		mov	[bp+var_3], al
		cmp	[bp+var_3], 0
		jz	short loc_63CF7
		xor	eax, eax
		mov	[si+51h], eax
		mov	[si+4Dh], eax
		push	word ptr [si+59h]
		mov	bx, [si+59h]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+55h], eax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+0Ch]
		pop	cx

loc_63CF1:
		mov	[bp+var_2], 1
		jmp	short loc_63D08
; ���������������������������������������������������������������������������

loc_63CF7:				; CODE XREF: StreamReader_ReadBlock_63C61+68j
		push	1910h

loc_63CFA:
		jmp	short loc_63CFF
; ���������������������������������������������������������������������������

loc_63CFC:				; CODE XREF: StreamReader_ReadBlock_63C61+47j
		push	19E0h

loc_63CFF:				; CODE XREF: StreamReader_ReadBlock_63C61:loc_63CFAj
		push	si

loc_63D00:
		call	DisplayContext_CommitFrameWithTag_5F4A9

loc_63D05:
		add	sp, 4

loc_63D08:				; CODE XREF: StreamReader_ReadBlock_63C61+2Aj
					; StreamReader_ReadBlock_63C61+35j ...
		mov	al, [bp+var_2]
		pop	si
		leave
		retf
StreamReader_ReadBlock_63C61	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine StreamReader_ValidateAndDispatch_639F1 et StreamReader_ReadBlock_63C61. Appelée
; par sub_63AD3.
; ==============================================================================================
StreamReader_ReadDispatch_63D0E	proc far		; CODE XREF: StreamReader_ConstructVariantC_63AD3+45p
					; StreamReader_OpenAndRegister_64321+10P ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		push	si

loc_63D12:
		mov	si, [bp+arg_0]

loc_63D15:
		mov	al, [bp+arg_4]

loc_63D18:
		push	ax

loc_63D19:
		push	[bp+arg_2]

loc_63D1C:
		push	si
		push	cs

loc_63D1E:
		call	near ptr StreamReader_ValidateAndDispatch_639F1

loc_63D21:
		add	sp, 6

loc_63D24:
		push	si
		push	cs

loc_63D26:
		call	near ptr StreamReader_ReadBlock_63C61

loc_63D29:
		pop	cx
		pop	si
		pop	bp
		retf
StreamReader_ReadDispatch_63D0E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine StreamReader_Helper_639CD et StreamReader_ReadBlock_63C61. Appelée par
; sub_63B23.
; ==============================================================================================
StreamReader_ReadDispatchB_63D2D	proc far		; CODE XREF: StreamReader_ConstructAndBind_63B23+63p

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh

		push	bp

loc_63D2E:
		mov	bp, sp
		push	si

loc_63D31:
		mov	si, [bp+arg_0]

loc_63D34:
		mov	dword ptr [si+4Dh], 0
		mov	eax, [bp+arg_4]

loc_63D40:
		mov	[si+51h], eax

loc_63D44:
		mov	eax, [bp+arg_8]
		sub	eax, [bp+arg_4]
		mov	[si+55h], eax
		push	[bp+arg_2]
		push	si

loc_63D54:
		push	cs

loc_63D55:
		call	near ptr StreamReader_Helper_639CD

loc_63D58:
		add	sp, 4

loc_63D5B:
		cmp	word ptr [si+5Bh], 0
		jz	short loc_63D65
		mov	al, 1

loc_63D63:
		jmp	short loc_63D6B
; ���������������������������������������������������������������������������

loc_63D65:				; CODE XREF: StreamReader_ReadDispatchB_63D2D+32j
		push	si
		push	cs
		call	near ptr StreamReader_ReadBlock_63C61
		pop	cx

loc_63D6B:				; CODE XREF: StreamReader_ReadDispatchB_63D2D:loc_63D63j
		pop	si
		pop	bp
		retf
StreamReader_ReadDispatchB_63D2D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine StreamReader_ValidateState_63DB5, dispatch vtable [bx+0x14] et
; Runtime_FatalErrorHandlerWithTag. Référencée directement par sub_27F9E (proche de
; TextRenderer).
; ==============================================================================================
StreamReader_CloseHook_63D6E	proc far		; CODE XREF: Input_CalibrationHandler+156P
					; Terrain_SectorIndexResolve+DEP ...

var_2		= byte ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		cmp	word ptr [si+5Bh], 0
		jnz	short loc_63DAF
		push	si

loc_63D83:
		nop
		push	cs
		call	near ptr StreamReader_ValidateState_63DB5
		pop	cx
		or	al, al
		jz	short loc_63DAB
		push	word ptr [si+59h]
		mov	bx, [si+59h]

loc_63D93:
		mov	bx, [bx]
		call	dword ptr [bx+14h]

loc_63D98:
		pop	cx
		or	al, al
		jnz	short loc_63DAB

loc_63D9D:
		push	1980h
		push	si

loc_63DA1:
		call	DisplayContext_CommitFrameWithTag_5F4A9
		add	sp, 4
		jmp	short loc_63DAF
; ���������������������������������������������������������������������������

loc_63DAB:				; CODE XREF: StreamReader_CloseHook_63D6E+1Dj
					; StreamReader_CloseHook_63D6E+2Dj
		mov	[bp+var_2], 1

loc_63DAF:				; CODE XREF: StreamReader_CloseHook_63D6E+12j
					; StreamReader_CloseHook_63D6E+3Bj
		mov	al, [bp+var_2]
		pop	si
		leave
		retf
StreamReader_CloseHook_63D6E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, fonction de garde utilisée dans tout le cluster StreamReader (rôle exact non détaillé —
; vérification d'état avant opération). Référencée directement par sub_27355 (proche de
; TextRenderer).
; ==============================================================================================
StreamReader_ValidateState_63DB5	proc far		; CODE XREF: TextObj_CommandInterp+2CP
					; StreamReader_Helper_63962:loc_63970p	...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dl, 0
		cmp	word ptr [si+59h], 0
		jz	short loc_63DD6
		mov	bx, [si+59h]
		cmp	word ptr [bx+2], 0
		jz	short loc_63DD2
		mov	ax, 1

loc_63DD0:
		jmp	short loc_63DD4
; ���������������������������������������������������������������������������

loc_63DD2:				; CODE XREF: StreamReader_ValidateState_63DB5+16j
		xor	ax, ax

loc_63DD4:				; CODE XREF: StreamReader_ValidateState_63DB5:loc_63DD0j
		mov	dl, al

loc_63DD6:				; CODE XREF: StreamReader_ValidateState_63DB5+Dj
		mov	al, dl
		pop	si
		pop	bp
		retf
StreamReader_ValidateState_63DB5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelée par Handle_ReadAndOffsetField-style StreamReader_ReadTyped_63FA1 pour vérifier
; la validité du tampon après une lecture.
; ==============================================================================================
StreamReader_CheckBufferValid_63DDB	proc far		; CODE XREF: StreamReader_ReadTyped_63FA1+5Ep

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si+4Dh]
		cmp	eax, [si+55h]
		jl	short loc_63DF1
		mov	ax, 1
		jmp	short loc_63DF3
; ���������������������������������������������������������������������������

loc_63DF1:				; CODE XREF: StreamReader_CheckBufferValid_63DDB+Fj
		xor	ax, ax

loc_63DF3:				; CODE XREF: StreamReader_CheckBufferValid_63DDB+14j
		pop	si
		pop	bp
		retf
StreamReader_CheckBufferValid_63DDB	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 90 lignes, NON DÉTAILLÉE — dispatch vtable [bx+0xC],
; StreamReader_ValidateState_63DB5, sub_6404E. Référencée par sub_641EB.
; ==============================================================================================
StreamReader_SeekVariant_63DF6	proc far		; CODE XREF: StreamReader_PrepareParse_641EB+BP
					; StreamReader_ParseFormattedString_64217+47P ...

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp

loc_63DF7:
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]

loc_63E00:
		cmp	[bp+arg_2], 0
		jl	short loc_63E11
		mov	eax, [si+55h]
		cmp	eax, [bp+arg_2]
		jge	short loc_63E16

loc_63E11:				; CODE XREF: StreamReader_SeekVariant_63DF6+Fj
		push	1941h
		jmp	short loc_63E61
; ���������������������������������������������������������������������������

loc_63E16:				; CODE XREF: StreamReader_SeekVariant_63DF6+19j
		push	0

loc_63E18:
		mov	eax, [bp+arg_2]

loc_63E1C:
		add	eax, [si+51h]

loc_63E20:
		push	eax

loc_63E22:
		push	word ptr [si+59h]
		mov	bx, [si+59h]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		push	dx
		push	ax
		pop	eax
		add	sp, 8
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0FFFFFFFFh
		jz	short loc_63E49

loc_63E3F:
		sub	eax, [si+51h]
		mov	[si+4Dh], eax
		jmp	short loc_63E6A
; ���������������������������������������������������������������������������

loc_63E49:				; CODE XREF: StreamReader_SeekVariant_63DF6+47j
		push	si
		push	cs
		call	near ptr StreamReader_ValidateState_63DB5
		pop	cx
		mov	ah, 0
		or	ax, ax

loc_63E53:
		jnz	short loc_63E5E

loc_63E55:
		push	si
		nop
		push	cs
		call	near ptr StreamReader_ReportError_6404E
		pop	cx
		jmp	short $+2

loc_63E5E:				; CODE XREF: StreamReader_SeekVariant_63DF6:loc_63E53j
		push	1914h

loc_63E61:				; CODE XREF: StreamReader_SeekVariant_63DF6+1Ej
		push	si
		call	DisplayContext_CommitFrameWithTag_5F4A9
		add	sp, 4

loc_63E6A:				; CODE XREF: StreamReader_SeekVariant_63DF6+51j
		pop	si
		leave
		retf
StreamReader_SeekVariant_63DF6	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si

loc_63E74:
		mov	si, [bp+6]
		mov	eax, [si+4Dh]
		add	eax, [bp+8]
		mov	[bp-4],	eax
		cmp	dword ptr [bp-4], 0
		jl	short loc_63ED6
		mov	eax, [si+55h]
		cmp	eax, [bp-4]

loc_63E92:
		jl	short loc_63ED6
		push	1

loc_63E96:
		push	large dword ptr	[bp+8]
		push	word ptr [si+59h]

loc_63E9D:
		mov	bx, [si+59h]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		push	dx
		push	ax
		pop	eax
		add	sp, 8
		mov	[bp-4],	eax
		cmp	dword ptr [bp-4], 0FFFFFFFFh
		jz	short loc_63EC1
		sub	eax, [si+51h]
		mov	[si+4Dh], eax
		jmp	short loc_63EE2
; ���������������������������������������������������������������������������

loc_63EC1:				; CODE XREF: seg190:05C5j
		push	si
		push	cs
		call	near ptr StreamReader_ValidateState_63DB5
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_63ED6
		push	si
		nop
		push	cs
		call	near ptr StreamReader_ReportError_6404E
		pop	cx
		jmp	short $+2

loc_63ED6:				; CODE XREF: seg190:0598j
					; seg190:loc_63E92j ...
		push	1943h
		push	si
		call	DisplayContext_CommitFrameWithTag_5F4A9

loc_63EDF:
		add	sp, 4

loc_63EE2:				; CODE XREF: seg190:05CFj
		pop	si

locret_63EE3:
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, recharge le tampon depuis le flux sous-jacent (dispatch vtable [bx+0xC]),
; StreamReader_ValidateState_63DB5, sub_6404E. Appelée par StreamReader_ReadTyped_63FA1 en cas
; de dépassement de tampon.
; ==============================================================================================
StreamReader_RefillBuffer_63EE5	proc far		; CODE XREF: StreamReader_ReadTyped_63FA1+68p

var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp

loc_63EE8:
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	0

loc_63EF1:
		mov	eax, [si+51h]

loc_63EF5:
		add	eax, [si+55h]
		push	eax
		push	word ptr [si+59h]
		mov	bx, [si+59h]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		push	dx
		push	ax
		pop	eax
		add	sp, 8
		mov	[bp+var_4], eax

loc_63F11:
		cmp	[bp+var_4], 0FFFFFFFFh
		jz	short loc_63F22
		sub	eax, [si+51h]

loc_63F1C:
		mov	[si+4Dh], eax

loc_63F20:
		jmp	short loc_63F43
; ���������������������������������������������������������������������������

loc_63F22:				; CODE XREF: StreamReader_RefillBuffer_63EE5+31j
		push	si

loc_63F23:
		push	cs

loc_63F24:
		call	near ptr StreamReader_ValidateState_63DB5
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_63F37
		push	si
		nop
		push	cs

loc_63F31:
		call	near ptr StreamReader_ReportError_6404E

loc_63F34:
		pop	cx
		jmp	short $+2

loc_63F37:				; CODE XREF: StreamReader_RefillBuffer_63EE5+47j
		push	1940h
		push	si
		call	DisplayContext_CommitFrameWithTag_5F4A9
		add	sp, 4

loc_63F43:				; CODE XREF: StreamReader_RefillBuffer_63EE5:loc_63F20j
		pop	si

locret_63F44:
		leave

locret_63F45:
		retf
StreamReader_RefillBuffer_63EE5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, prépare le flux avant lecture (dispatch vtable [bx+0xC],
; StreamReader_ValidateState_63DB5, sub_6404E). Référencée par TextObject_Allocate_5A577
; (seg124).
; ==============================================================================================
StreamReader_PrepareForRead_63F46	proc far		; CODE XREF: TextObject_Allocate_5A577+10P
					; seg196:0161P

var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp

loc_63F47:
		mov	bp, sp
		sub	sp, 4
		push	si

loc_63F4D:
		mov	si, [bp+arg_0]
		push	0

loc_63F52:
		push	large dword ptr	[si+51h]
		push	word ptr [si+59h]
		mov	bx, [si+59h]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		push	dx
		push	ax

loc_63F63:
		pop	eax
		add	sp, 8
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0FFFFFFFFh
		jz	short loc_63F7D

loc_63F73:
		sub	eax, [si+51h]
		mov	[si+4Dh], eax
		jmp	short loc_63F9E
; ���������������������������������������������������������������������������

loc_63F7D:				; CODE XREF: StreamReader_PrepareForRead_63F46+2Bj
		push	si
		push	cs
		call	near ptr StreamReader_ValidateState_63DB5
		pop	cx
		mov	ah, 0

loc_63F85:
		or	ax, ax
		jnz	short loc_63F92
		push	si
		nop
		push	cs
		call	near ptr StreamReader_ReportError_6404E
		pop	cx
		jmp	short $+2

loc_63F92:				; CODE XREF: StreamReader_PrepareForRead_63F46+41j
		push	1940h
		push	si
		call	DisplayContext_CommitFrameWithTag_5F4A9
		add	sp, 4

loc_63F9E:				; CODE XREF: StreamReader_PrepareForRead_63F46+35j
		pop	si
		leave
		retf
StreamReader_PrepareForRead_63F46	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⭐ far, lecture typée à travers le flux tamponné : gère la position courante (+0x4D) et le
; tampon (+0x51), dispatch vers l'objet flux sous-jacent (+0x59, méthode virtuelle « Read »),
; avec repli sur StreamReader_RefillBuffer_63EE5/CheckBufferValid_63DDB selon le résultat.
; Référencée massivement (Handle_ReadWordField_63511, Handle_ReadByteField_63534, seg188, et
; de nombreux autres segments) — fonction centrale du système de lecture typée par handle.
; ==============================================================================================
StreamReader_ReadTyped_63FA1	proc far		; CODE XREF: TextObj_CommandInterp+70P
					; Input_CalibrationHandler+149P ...

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= dword	ptr  0Ch
arg_A		= dword	ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [bp+arg_A]
		mov	[bp+var_8], eax
		cmp	[bp+arg_A], 0FFFFFFFFh
		jnz	short loc_63FC2
		mov	eax, [si+4Dh]
		mov	[bp+var_8], eax

loc_63FC2:				; CODE XREF: StreamReader_ReadTyped_63FA1+17j
		push	large [bp+arg_6]
		mov	eax, [bp+var_8]
		add	eax, [si+51h]
		push	eax
		push	large [bp+arg_2]
		push	word ptr [si+59h]

loc_63FD7:
		mov	bx, [si+59h]
		mov	bx, [bx]

loc_63FDC:
		call	dword ptr [bx+4]
		push	dx
		push	ax

loc_63FE1:
		pop	eax
		add	sp, 0Eh
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0FFFFFFFFh
		jz	short loc_6400F

loc_63FF1:
		mov	eax, [bp+var_8]
		add	eax, [bp+var_4]
		mov	[si+4Dh], eax
		push	si
		push	cs
		call	near ptr StreamReader_CheckBufferValid_63DDB
		pop	cx

loc_64003:
		or	al, al
		jz	short loc_64030
		push	si
		push	cs
		call	near ptr StreamReader_RefillBuffer_63EE5
		pop	cx
		jmp	short loc_64030
; ���������������������������������������������������������������������������

loc_6400F:				; CODE XREF: StreamReader_ReadTyped_63FA1+4Ej
		push	si
		push	cs
		call	near ptr StreamReader_ValidateState_63DB5
		pop	cx

loc_64015:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_64024
		push	si
		nop
		push	cs
		call	near ptr StreamReader_ReportError_6404E
		pop	cx

loc_64022:
		jmp	short $+2

loc_64024:				; CODE XREF: StreamReader_ReadTyped_63FA1+78j
		push	1920h

loc_64027:
		push	si

loc_64028:
		call	DisplayContext_CommitFrameWithTag_5F4A9

loc_6402D:
		add	sp, 4

loc_64030:				; CODE XREF: StreamReader_ReadTyped_63FA1+64j
					; StreamReader_ReadTyped_63FA1+6Cj
		mov	eax, [bp+var_4]
		shld	edx, eax, 10h
		pop	si
		leave
		retf
StreamReader_ReadTyped_63FA1	endp

; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg339) — stub retournant toujours vrai (AL=1).
; ==============================================================================================
StreamReader_Method_ReturnTrue_6403C:				; DATA XREF: seg339:02D0o seg339:1392o ...
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]

loc_64042:
		mov	al, 1

loc_64044:
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg339) et depuis seg195 — stub transmettant
; simplement son argument.
; ==============================================================================================
StreamReader_Method_PassThrough_64046	proc far		; CODE XREF: seg195:loc_65536P
					; DATA XREF: seg339:13B2o ...

arg_0		= word ptr  6

		push	bp

loc_64047:
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp

locret_6404D:
		retf
StreamReader_Method_PassThrough_64046	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, enveloppe Runtime_FatalErrorHandlerWithTag (sub_5F4A9, tag 1911h) — signale une erreur
; du flux tamponné.
; ==============================================================================================
StreamReader_ReportError_6404E	proc far		; CODE XREF: StreamReader_SeekVariant_63DF6+62p
					; seg190:05E0p	...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]

loc_64054:
		push	1911h
		push	ax
		call	DisplayContext_CommitFrameWithTag_5F4A9
		add	sp, 4
		pop	bp
		retf
StreamReader_ReportError_6404E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, retourne la capacité du tampon (+0x55, 32 bits). Référencée directement par sub_27355
; et sub_27F9E (proches de TextRenderer).
; ==============================================================================================
StreamReader_GetCapacity_64062	proc far		; CODE XREF: TextObj_CommandInterp+3FP
					; Input_CalibrationHandler+DBP ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si+55h]
		shld	edx, eax, 10h
		pop	si
		pop	bp
		retf
StreamReader_GetCapacity_64062	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, retourne la position courante (+0x4D, 32 bits). Référencée par sub_33346 et sub_99120.
; ==============================================================================================
StreamReader_GetPosition_64075	proc far		; CODE XREF: Terrain_HeightmapAllocate+EBP
					; TRI_ParseOverlayGeometry_99120+46P ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si+4Dh]

loc_64080:
		shld	edx, eax, 10h
		pop	si
		pop	bp
		retf
StreamReader_GetPosition_64075	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, ajoute une constante (0xA, taille d'en-tête ?) à un handle/offset. Référencée depuis
; seg193.
; ==============================================================================================
StreamReader_ComputeHeaderOffset_64088	proc far		; CODE XREF: seg193:002CP

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	ax, dx

loc_64090:
		add	ax, 0Ah

loc_64093:
		pop	bp
		retf
StreamReader_ComputeHeaderOffset_64088	endp

; ���������������������������������������������������������������������������
		push	bp

loc_64096:
		mov	bp, sp
		mov	eax, [bp+6]
		mov	dword ptr aL?s?x?+6, eax
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		push	ax
		push	cs
		call	near ptr StreamReader_ReadBlock_63C61
		pop	cx
		pop	bp
		retf
seg190		ends

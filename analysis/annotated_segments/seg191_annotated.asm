seg191		segment	byte public 'CODE' use16
		assume cs:seg191
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, ajoute un handle à une table globale de 8 flux ouverts (word_7107C = compteur).
; Référencée par sub_64321.
; ==============================================================================================
StreamReader_RegistryAdd_640B0	proc far		; CODE XREF: StreamReader_OpenAndRegister_64321+28p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		cmp	word_7107C, 8
		jge	short loc_640D0
		mov	bx, word_7107C

loc_640BE:				; DATA XREF: seg216:06BEo
		shl	bx, 1
		mov	ax, [bp+arg_0]
		mov	[bx+5CDAh], ax
		inc	word_7107C
		mov	ax, 1
		jmp	short loc_640D2
; ���������������������������������������������������������������������������

loc_640D0:				; CODE XREF: StreamReader_RegistryAdd_640B0+8j
		xor	ax, ax

loc_640D2:				; CODE XREF: StreamReader_RegistryAdd_640B0+1Ej
		pop	bp

locret_640D3:
		retf
StreamReader_RegistryAdd_640B0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, retire un handle de la table globale des flux ouverts (recherche linéaire +
; compactage). Référencée par sub_642FF.
; ==============================================================================================
StreamReader_RegistryRemove_640D4	proc far		; CODE XREF: StreamReader_CloseAndUnregister_642FF:loc_6431Ap

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		xor	dx, dx
		jmp	short loc_64104
; ���������������������������������������������������������������������������

loc_640DB:				; CODE XREF: StreamReader_RegistryRemove_640D4+34j
		mov	bx, dx

loc_640DD:
		shl	bx, 1

loc_640DF:
		mov	ax, [bx+5CDAh]

loc_640E3:
		cmp	ax, [bp+arg_0]
		jnz	short loc_64103
		dec	word_7107C
		mov	bx, word_7107C
		shl	bx, 1

loc_640F2:
		mov	ax, [bx+5CDAh]
		mov	bx, dx

loc_640F8:
		shl	bx, 1

loc_640FA:
		mov	[bx+5CDAh], ax
		mov	ax, 1
		jmp	short loc_6410C
; ���������������������������������������������������������������������������

loc_64103:				; CODE XREF: StreamReader_RegistryRemove_640D4+12j
		inc	dx

loc_64104:				; CODE XREF: StreamReader_RegistryRemove_640D4+5j
		cmp	dx, word_7107C
		jl	short loc_640DB
		xor	ax, ax

loc_6410C:				; CODE XREF: StreamReader_RegistryRemove_640D4+2Dj
		pop	bp
		retf
StreamReader_RegistryRemove_640D4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 79 lignes, NON DÉTAILLÉE — combine StreamReader_ValidateState_63DB5, sub_64217
; (parseur), sub_63B23 (construction de flux). Appelée par StreamReader_ReadBlock_63C61
; (seg190) — probable lecture/analyse d'une valeur formatée depuis le flux.
; ==============================================================================================
StreamReader_ParseFormattedValue_6410E	proc far		; CODE XREF: StreamReader_ReadBlock_63C61+1BP

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp

loc_64111:
		sub	sp, 8

loc_64114:
		push	si
		push	di

loc_64116:
		xor	di, di

loc_64118:
		jmp	short loc_64169
; ���������������������������������������������������������������������������

loc_6411A:				; CODE XREF: StreamReader_ParseFormattedValue_6410E+5Fj
		mov	bx, di
		shl	bx, 1

loc_6411E:
		mov	si, [bx+5CDAh]
		push	si

loc_64123:
		call	StreamReader_ValidateState_63DB5
		pop	cx
		or	al, al
		jz	short loc_64168
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr StreamReader_ParseFormattedString_64217
		add	sp, 4
		or	ax, ax
		jz	short loc_64168
		mov	eax, [si+127h]
		mov	[bp+var_4], eax
		add	eax, [si+12Bh]
		mov	[bp+var_8], eax
		push	[bp+arg_2]

loc_64152:
		push	eax

loc_64154:
		push	large [bp+var_4]
		push	si
		push	[bp+arg_0]
		call	StreamReader_ConstructAndBind_63B23
		add	sp, 0Eh
		mov	al, 1
		jmp	short loc_64171
; ���������������������������������������������������������������������������

loc_64168:				; CODE XREF: StreamReader_ParseFormattedValue_6410E+1Dj
					; StreamReader_ParseFormattedValue_6410E+2Dj
		inc	di

loc_64169:				; CODE XREF: StreamReader_ParseFormattedValue_6410E:loc_64118j
		cmp	di, word_7107C
		jl	short loc_6411A
		mov	al, 0

loc_64171:				; CODE XREF: StreamReader_ParseFormattedValue_6410E+58j
		pop	di
		pop	si
		leave
		retf
StreamReader_ParseFormattedValue_6410E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, dispatch vtable [bx+4] (écriture).
; ==============================================================================================
StreamReader_DispatchWrite_64175	proc far		; CODE XREF: Dialog_Close+75P
		push	bp
		mov	bp, sp
		push	si
		push	di
		xor	si, si
		jmp	short loc_641A2
; ���������������������������������������������������������������������������

loc_6417E:				; CODE XREF: StreamReader_DispatchWrite_64175+31j
		mov	bx, si
		shl	bx, 1
		mov	di, [bx+5CDAh]
		or	di, di
		jz	short loc_64197
		push	3
		push	di
		mov	bx, [di]

loc_6418F:
		call	dword ptr [bx+4]

loc_64192:
		add	sp, 4

loc_64195:
		jmp	short $+2

loc_64197:				; CODE XREF: StreamReader_DispatchWrite_64175+13j
		mov	bx, si
		shl	bx, 1

loc_6419B:
		mov	word ptr [bx+5CDAh], 0
		inc	si

loc_641A2:				; CODE XREF: StreamReader_DispatchWrite_64175+7j
		cmp	si, word_7107C
		jl	short loc_6417E

loc_641A8:
		mov	word_7107C, 0
		pop	di
		pop	si
		pop	bp
		retf
StreamReader_DispatchWrite_64175	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle sub_64217 (parseur) — variante d'appel.
; ==============================================================================================
StreamReader_ParseFormattedValueB_641B2	proc far		; CODE XREF: Config_LoadOrCreate+1BP

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		xor	di, di
		xor	si, si
		jmp	short loc_641DF
; ���������������������������������������������������������������������������

loc_641C0:				; CODE XREF: StreamReader_ParseFormattedValueB_641B2:loc_641E3j
		mov	bx, si
		shl	bx, 1
		mov	ax, [bx+5CDAh]
		mov	[bp+var_2], ax
		push	[bp+arg_0]
		push	ax
		nop
		push	cs
		call	near ptr StreamReader_ParseFormattedString_64217
		add	sp, 4
		or	ax, ax
		jz	short loc_641DE
		inc	di
		jmp	short loc_641E5
; ���������������������������������������������������������������������������

loc_641DE:				; CODE XREF: StreamReader_ParseFormattedValueB_641B2+27j
		inc	si

loc_641DF:				; CODE XREF: StreamReader_ParseFormattedValueB_641B2+Cj
		cmp	si, word_7107C

loc_641E3:
		jl	short loc_641C0

loc_641E5:				; CODE XREF: StreamReader_ParseFormattedValueB_641B2+2Aj
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
StreamReader_ParseFormattedValueB_641B2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine StreamReader_SeekVariant_63DF6 et StreamReader_ReadTyped_63FA1 (seg190) —
; prépare le flux avant analyse formatée. Appelée par sub_64217.
; ==============================================================================================
StreamReader_PrepareParse_641EB	proc far		; CODE XREF: StreamReader_ParseFormattedString_64217+20p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	large 0
		push	si
		call	StreamReader_SeekVariant_63DF6
		add	sp, 6
		push	large 0FFFFFFFFh
		push	large 8
		push	ds
		mov	ax, si
		add	ax, 0DDh ; '�'
		push	ax
		push	si
		call	StreamReader_ReadTyped_63FA1

loc_64211:
		add	sp, 0Eh
		pop	si
		pop	bp
		retf
StreamReader_PrepareParse_641EB	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 148 lignes, NON DÉTAILLÉE — la plus grosse fonction du segment : combine
; StreamReader_ValidateState_63DB5, StreamReader_PrepareParse_641EB, sub_2B99 (formatage
; externe) et StreamReader_SeekVariant_63DF6 — parseur de valeur/chaîne formatée à travers le
; flux tamponné (proche d'un sscanf typé). Candidat pour session dédiée si le format exact
; doit être élucidé.
; ==============================================================================================
StreamReader_ParseFormattedString_64217	proc far		; CODE XREF: StreamReader_ParseFormattedValue_6410E+25p
					; StreamReader_ParseFormattedValueB_641B2+1Fp

var_16		= word ptr -16h
var_14		= dword	ptr -14h
var_10		= word ptr -10h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp

loc_64218:
		mov	bp, sp
		sub	sp, 16h
		push	si
		push	di

loc_6421F:
		mov	si, [bp+arg_0]

loc_64222:
		mov	[bp+var_2], 0
		push	si

loc_64228:
		call	StreamReader_ValidateState_63DB5
		pop	cx
		or	al, al
		jnz	short loc_64235

loc_64232:
		jmp	loc_642F8
; ���������������������������������������������������������������������������

loc_64235:				; CODE XREF: StreamReader_ParseFormattedString_64217+19j
		push	si
		push	cs
		call	near ptr StreamReader_PrepareParse_641EB
		pop	cx
		push	[bp+arg_2]
		call	CRT_Strupr
		pop	cx

loc_64244:
		mov	di, [si+0DDh]
		mov	eax, [si+4Dh]
		mov	[bp+var_6], eax
		jmp	loc_642DA
; ���������������������������������������������������������������������������

loc_64253:				; CODE XREF: StreamReader_ParseFormattedString_64217+DEj
		mov	eax, [bp+var_A]
		mov	[bp+var_E], eax
		push	eax
		push	si
		call	StreamReader_SeekVariant_63DF6
		add	sp, 6
		mov	ax, si
		add	ax, 0E5h ; '�'
		mov	[bp+var_10], ax
		push	large 0FFFFFFFFh
		push	large 4Ah ; 'J'
		push	ds
		push	ax
		push	si
		call	StreamReader_ReadTyped_63FA1
		push	dx
		push	ax
		pop	eax
		add	sp, 0Eh
		mov	[bp+var_14], eax
		cmp	[bp+var_14], 4Ah ; 'J'
		jz	short loc_64298
		mov	bx, [bp+var_10]
		mov	byte ptr [bx], 0
		mov	byte ptr [bx+1], 0

loc_64298:				; CODE XREF: StreamReader_ParseFormattedString_64217+75j
		mov	ax, [bp+arg_2]

loc_6429B:
		mov	[bp+var_16], ax

loc_6429E:
		mov	ax, si

loc_642A0:
		add	ax, 0E6h ; '�'

loc_642A3:
		push	ax
		push	[bp+var_16]

loc_642A7:
		call	CRT_Stricmp
		add	sp, 4
		mov	dx, ax
		or	dx, dx
		jnz	short loc_642BC
		mov	[bp+var_2], 1
		jmp	short loc_642F8
; ���������������������������������������������������������������������������

loc_642BC:				; CODE XREF: StreamReader_ParseFormattedString_64217+9Cj
		or	dx, dx
		jge	short loc_642C7
		mov	ax, di
		inc	ax
		sar	ax, 1
		jmp	short loc_642D8
; ���������������������������������������������������������������������������

loc_642C7:				; CODE XREF: StreamReader_ParseFormattedString_64217+A7j
		mov	eax, [bp+var_A]
		add	eax, 4Ah ; 'J'
		mov	[bp+var_6], eax
		mov	ax, di
		sar	ax, 1
		inc	ax

loc_642D8:				; CODE XREF: StreamReader_ParseFormattedString_64217+AEj
		sub	di, ax

loc_642DA:				; CODE XREF: StreamReader_ParseFormattedString_64217+39j
		mov	ax, di
		sar	ax, 1
		movsx	eax, ax
		imul	eax, 4Ah
		mov	edx, [bp+var_6]
		add	edx, eax
		mov	[bp+var_A], edx
		or	di, di
		jle	short loc_642F8
		jmp	loc_64253
; ���������������������������������������������������������������������������

loc_642F8:				; CODE XREF: StreamReader_ParseFormattedString_64217:loc_64232j
					; StreamReader_ParseFormattedString_64217+A3j ...
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
StreamReader_ParseFormattedString_64217	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, ferme le flux (StreamReader_ValidateState_63DB5, StreamReader_CloseHook_63D6E) puis le
; retire de la table globale (StreamReader_RegistryRemove_640D4).
; ==============================================================================================
StreamReader_CloseAndUnregister_642FF	proc far		; CODE XREF: seg048:1340P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	StreamReader_ValidateState_63DB5
		pop	cx
		or	al, al
		jz	short loc_6431E

loc_64311:
		push	si
		call	StreamReader_CloseHook_63D6E
		pop	cx
		push	si

loc_64319:
		push	cs

loc_6431A:
		call	near ptr StreamReader_RegistryRemove_640D4
		pop	cx

loc_6431E:				; CODE XREF: StreamReader_CloseAndUnregister_642FF+10j
		pop	si
		pop	bp
		retf
StreamReader_CloseAndUnregister_642FF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, ouvre un flux (StreamReader_ReadDispatch_63D0E, StreamReader_ValidateState_63DB5) puis
; l'ajoute à la table globale (StreamReader_RegistryAdd_640B0).
; ==============================================================================================
StreamReader_OpenAndRegister_64321	proc far		; CODE XREF: TextRenderer_Main+2A9P

var_2		= byte ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp

loc_64322:
		mov	bp, sp

loc_64324:
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		push	1
		push	[bp+arg_2]
		push	si
		call	StreamReader_ReadDispatch_63D0E
		add	sp, 6
		mov	[bp+var_2], al
		push	si

loc_6433D:
		call	StreamReader_ValidateState_63DB5
		pop	cx

loc_64343:
		or	al, al

loc_64345:
		jz	short loc_6434D
		push	si
		push	cs
		call	near ptr StreamReader_RegistryAdd_640B0
		pop	cx

loc_6434D:				; CODE XREF: StreamReader_OpenAndRegister_64321:loc_64345j
		mov	al, [bp+var_2]

loc_64350:
		pop	si
		leave
		retf
StreamReader_OpenAndRegister_64321	endp

seg191		ends

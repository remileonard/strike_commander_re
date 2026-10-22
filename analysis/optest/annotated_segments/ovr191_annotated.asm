ovr191		segment	para public 'OVERLAY' use16
		assume cs:ovr191
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-22. [+6Bh] = dernier indice i (0 à 6) dont le drapeau dseg 0EE6h+i ≠ 0,
; [+6Ch] = dernier autre ; indices des noms $A/$B (table 0ED8h). Zone de texte (0, 24)-(319,
; 151), écran (0, 0)-(319, 199) ; police ..\..\data\fonts\convfont.shp.
; ==============================================================================================
Conv_Init_59A20	proc far		; CODE XREF: sub_42221J Conv_Construct_59B67+94p	...

var_60		= word ptr -60h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= byte ptr -8
var_7		= byte ptr -7
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 60h
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_59A44
; ���������������������������������������������������������������������������

loc_59A31:				; CODE XREF: Conv_Init_59A20+28j
		mov	bx, [bp+var_2]
		cmp	byte ptr [bx+0EE6h], 0
		jz	short loc_59A41
		mov	al, byte ptr [bp+var_2]
		mov	[si+6Bh], al

loc_59A41:				; CODE XREF: Conv_Init_59A20+19j
		inc	[bp+var_2]

loc_59A44:				; CODE XREF: Conv_Init_59A20+Fj
		cmp	[bp+var_2], 7
		jl	short loc_59A31
		mov	[bp+var_2], 0
		jmp	short loc_59A6E
; ���������������������������������������������������������������������������

loc_59A51:				; CODE XREF: Conv_Init_59A20+52j
		mov	bx, [bp+var_2]
		cmp	byte ptr [bx+0EE6h], 0
		jz	short loc_59A6B
		mov	al, [si+6Bh]
		mov	ah, 0
		cmp	ax, [bp+var_2]
		jz	short loc_59A6B
		mov	al, byte ptr [bp+var_2]
		mov	[si+6Ch], al

loc_59A6B:				; CODE XREF: Conv_Init_59A20+39j
					; Conv_Init_59A20+43j
		inc	[bp+var_2]

loc_59A6E:				; CODE XREF: Conv_Init_59A20+2Fj
		cmp	[bp+var_2], 7
		jl	short loc_59A51
		push	word_46F44
		mov	ax, si
		add	ax, 0Ch
		push	ax
		call	TextFormat_ApplyStyleAttribute_2E9A4
		add	sp, 4
		mov	word ptr [si+10h], 0
		mov	word ptr [si+12h], 18h
		mov	word ptr [si+14h], 13Fh
		mov	word ptr [si+16h], 97h ; '�'
		mov	word ptr [si+1Eh], 0
		mov	word ptr [si+20h], 0
		mov	word ptr [si+22h], 13Fh
		mov	word ptr [si+24h], 0C7h	; '�'
		push	0
		mov	ax, si
		add	ax, 1Ah
		push	ax
		call	TextRenderer_ApplyFormatChange_2EA21
		add	sp, 4
		push	ds
		push	offset unk_43F7A
		push	ds
		push	offset aConvfont_shp ; "convfont.shp"
		push	ds
		push	offset a____DataFonts ;	"..\\..\\data\\fonts\\"
		lea	ax, [bp+var_60]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		mov	[bp+var_C], 0
		mov	[bp+var_8], 2
		mov	[bp+var_7], 0
		mov	[bp+var_6], 0
		push	2
		lea	ax, [bp+var_60]
		push	ax
		call	TextRenderer_LoadResourceFile_3DA1F
		add	sp, 4
		mov	word ptr [bp+var_10+2],	dx
		mov	word ptr [bp+var_10], ax
		mov	eax, [bp+var_10]
		mov	[bp+var_C], eax
		mov	[bp+var_8], 2
		mov	[bp+var_7], 1
		mov	[bp+var_6], 0
		lea	ax, [bp+var_C]
		push	ax
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	GlyphObject_ComputeMetrics_3111E
		add	sp, 4
		cmp	[bp+var_7], 0
		jz	short loc_59B50
		cmp	[bp+var_C], 0
		jz	short loc_59B50
		push	0
		mov	al, [bp+var_8]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_59B50:				; CODE XREF: Conv_Init_59A20+110j
					; Conv_Init_59A20+117j
		mov	[bp+var_C], 0
		mov	[bp+var_7], 0
		mov	[bp+var_6], 0
		pop	si
		leave
		retf
Conv_Init_59A20	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-22. Objet conversation (6Eh octets, alloué si nul) : Conv_Init_59A20,
; chaînes du joueur [+28h] = arg_4, tampon des équipiers et réponse [+2Ah] = arg_6, entrée du
; PAK [+6Dh] = arg_2, puis Conv_LoadScriptFromPak_59DAA.
; ==============================================================================================
Conv_Construct_59B67	proc far		; CODE XREF: sub_4222BJ

arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_59B85
		push	6Eh ; 'n'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jnz	short loc_59B85
		jmp	loc_59C1C
; ���������������������������������������������������������������������������

loc_59B85:				; CODE XREF: Conv_Construct_59B67+9j
					; Conv_Construct_59B67+19j
		xor	eax, eax
		mov	[si+4],	eax
		mov	[si], eax
		mov	dword ptr [si+8], 0
		mov	word ptr [si+0Ch], 0
		mov	word ptr [si+0Eh], 0
		mov	byte ptr [si+19h], 0
		mov	word ptr [si+1Ah], 0
		mov	word ptr [si+1Ch], 0
		mov	byte ptr [si+27h], 0
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	GlyphObject_AllocateBuffer_31191
		add	sp, 2
		mov	word ptr [si+43h], 2BDh
		xor	ax, ax
		mov	[si+47h], ax
		mov	[si+45h], ax
		mov	word ptr [si+43h], 1264h
		mov	dword ptr [si+61h], 0
		mov	byte ptr [si+65h], 2
		mov	byte ptr [si+66h], 0
		mov	dword ptr [si+67h], 0
		mov	ax, si
		add	ax, 43h	; 'C'
		push	ax
		call	sub_43D8
		add	sp, 2
		push	si
		push	cs
		call	near ptr Conv_Init_59A20
		add	sp, 2
		mov	ax, [bp+arg_4]
		mov	[si+28h], ax
		mov	ax, [bp+arg_6]
		mov	[si+2Ah], ax
		mov	al, [bp+arg_2]
		mov	[si+6Dh], al
		push	si
		nop
		push	cs
		call	near ptr Conv_LoadScriptFromPak_59DAA
		add	sp, 2

loc_59C1C:				; CODE XREF: Conv_Construct_59B67+1Bj
		mov	ax, si
		pop	si
		pop	bp
		retf
Conv_Construct_59B67	endp

; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_59C24	proc far		; CODE XREF: sub_42226J

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_59C42
		push	6Eh ; 'n'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jnz	short loc_59C42
		jmp	loc_59CD6
; ���������������������������������������������������������������������������

loc_59C42:				; CODE XREF: sub_59C24+9j
					; sub_59C24+19j
		xor	eax, eax
		mov	[si+4],	eax
		mov	[si], eax
		mov	dword ptr [si+8], 0
		mov	word ptr [si+0Ch], 0
		mov	word ptr [si+0Eh], 0
		mov	byte ptr [si+19h], 0
		mov	word ptr [si+1Ah], 0
		mov	word ptr [si+1Ch], 0
		mov	byte ptr [si+27h], 0
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	GlyphObject_AllocateBuffer_31191
		add	sp, 2
		mov	word ptr [si+43h], 2BDh
		xor	ax, ax
		mov	[si+47h], ax
		mov	[si+45h], ax
		mov	word ptr [si+43h], 1264h
		mov	dword ptr [si+61h], 0
		mov	byte ptr [si+65h], 2
		mov	byte ptr [si+66h], 0
		mov	dword ptr [si+67h], 0
		mov	ax, si
		add	ax, 43h	; 'C'
		push	ax
		call	sub_43D8
		add	sp, 2
		push	si
		push	cs
		call	near ptr Conv_Init_59A20
		add	sp, 2
		mov	ax, [bp+arg_4]
		mov	[si+28h], ax
		mov	ax, [bp+arg_6]
		mov	[si+2Ah], ax
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr sub_59E81
		add	sp, 4

loc_59CD6:				; CODE XREF: sub_59C24+1Bj
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_59C24	endp

; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_59CDE	proc far		; CODE XREF: sub_42230J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_59CF0
		jmp	loc_59DA6
; ���������������������������������������������������������������������������

loc_59CF0:				; CODE XREF: sub_59CDE+Dj
		push	si
		nop
		push	cs
		call	near ptr sub_59F28
		add	sp, 2
		mov	word ptr [si+43h], 1264h
		mov	ax, si
		add	ax, 43h	; 'C'
		push	ax
		call	sub_43FF
		add	sp, 2
		cmp	byte ptr [si+66h], 0
		jz	short loc_59D32
		cmp	dword ptr [si+61h], 0
		jz	short loc_59D32
		push	0
		mov	al, [si+65h]
		push	ax
		mov	ax, si
		add	ax, 61h	; 'a'
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_59D32:				; CODE XREF: sub_59CDE+32j
					; sub_59CDE+39j
		mov	dword ptr [si+61h], 0
		mov	byte ptr [si+66h], 0
		mov	dword ptr [si+67h], 0
		mov	word ptr [si+43h], 2BDh
		mov	ax, si
		add	ax, 43h	; 'C'
		push	ax
		call	sub_2FEE0
		add	sp, 2
		push	2
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		mov	ax, si
		add	ax, 1Ah
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		mov	ax, si
		add	ax, 0Ch
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		xor	eax, eax
		mov	[si+4],	eax
		mov	[si], eax
		mov	dword ptr [si+8], 0
		test	di, 1
		jz	short loc_59DA6
		push	si
		call	sub_308
		add	sp, 2

loc_59DA6:				; CODE XREF: sub_59CDE+Fj
					; sub_59CDE+BDj
		pop	di
		pop	si
		pop	bp
		retf
sub_59CDE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-22. Ouvre ..\..\data\gameflow\conv.pak, lit l'entrée [arg_0+6Dh] en mémoire
; telle quelle : [arg_0] = [arg_0+4] = adresse, [arg_0+8] = taille.
; ==============================================================================================
Conv_LoadScriptFromPak_59DAA	proc far		; CODE XREF: sub_421EAJ Conv_Construct_59B67+AFp

var_D6		= word ptr -0D6h
var_75		= dword	ptr -75h
var_69		= word ptr -69h
var_65		= dword	ptr -65h
var_5E		= word ptr -5Eh
var_E		= word ptr -0Eh
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0D6h
		push	si
		mov	si, [bp+arg_0]
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aConv	; "conv"
		push	ds
		push	offset a____DataGamefl ; "..\\..\\data\\gameflow\\"
		lea	ax, [bp+var_5E]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_5E]
		push	ax
		lea	ax, [bp+var_D6]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		mov	al, [si+6Dh]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_D6]
		push	ax
		call	IndexedRecordReader_AdvanceIndex_3D69C
		add	sp, 4
		mov	ax, [bp+var_69]
		and	ax, 0C0h
		cmp	ax, 0C0h ; '�'
		jnz	short loc_59E04
		mov	eax, [bp+var_75]
		jmp	short loc_59E08
; ���������������������������������������������������������������������������

loc_59E04:				; CODE XREF: Conv_LoadScriptFromPak_59DAA+52j
		mov	eax, [bp+var_65]

loc_59E08:				; CODE XREF: Conv_LoadScriptFromPak_59DAA+58j
		mov	[bp+var_4], eax
		push	1
		push	0
		push	2
		push	large [bp+var_4]
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		push	word ptr [bp+var_8+2]
		push	word ptr [bp+var_8]
		mov	al, [si+6Dh]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_D6]
		push	ax
		call	IndexedRecordReader_SeekToIndex_3D4DD
		add	sp, 8
		mov	eax, [bp+var_8]
		mov	[bp+var_C], eax
		mov	ax, word ptr [bp+var_4]
		mov	[bp+var_E], ax
		mov	eax, [bp+var_C]
		mov	[si+4],	eax
		mov	[si], eax
		movzx	eax, [bp+var_E]
		mov	[si+8],	eax
		lea	ax, [bp+var_D6]
		push	ax
		call	StreamReader_CloseHook_3B5DE
		add	sp, 2
		push	2
		lea	ax, [bp+var_D6]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		pop	si
		leave
		retf
Conv_LoadScriptFromPak_59DAA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_59E81	proc far		; CODE XREF: sub_421EFJ sub_59C24+ACp

var_6C		= word ptr -6Ch
var_E		= word ptr -0Eh
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6Ch
		push	si
		mov	si, [bp+arg_0]
		push	1
		push	[bp+arg_2]
		lea	ax, [bp+var_6C]
		push	ax
		call	StreamReader_ConstructVariantC_3B343
		add	sp, 6
		lea	ax, [bp+var_6C]
		push	ax
		call	StreamReader_GetCapacity_3B8D2
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		mov	[bp+var_4], eax
		push	1
		push	0
		push	2
		push	large [bp+var_4]
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		push	large 0FFFFFFFFh
		push	large [bp+var_4]
		push	word ptr [bp+var_8+2]
		push	word ptr [bp+var_8]
		lea	ax, [bp+var_6C]
		push	ax
		call	StreamReader_ReadTyped_3B811
		add	sp, 0Eh
		mov	eax, [bp+var_8]
		mov	[bp+var_C], eax
		mov	ax, word ptr [bp+var_4]
		mov	[bp+var_E], ax
		mov	eax, [bp+var_C]
		mov	[si+4],	eax
		mov	[si], eax
		movzx	eax, [bp+var_E]
		mov	[si+8],	eax
		lea	ax, [bp+var_6C]
		push	ax
		call	StreamReader_CloseHook_3B5DE
		add	sp, 2
		push	2
		lea	ax, [bp+var_6C]
		push	ax
		call	StreamReader_Close_3B445
		add	sp, 4
		pop	si
		leave
		retf
sub_59E81	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_59F28	proc far		; CODE XREF: sub_421F4J sub_59CDE+15p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	0
		push	2
		push	si
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		pop	si
		pop	bp
		retf
sub_59F28	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_59F42	proc far		; CODE XREF: sub_421F9J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	bx, dx
		les	bx, [bx+4]
		mov	al, es:[bx]
		pop	bp
		retf
sub_59F42	endp

; ���������������������������������������������������������������������������
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-22. Affiche un texte de conversation : remplace $S $N $C (chaînes du joueur
; [[conv+28h]+0/+2/+4]), $W $L $O (équipiers [conv+2Ah]+1/+15h/+29h), $A $B (table dseg 0ED8h,
; indices [conv+6Bh]/[conv+6Ch]), $P $T (nombres [[conv+28h]+6/+8] + « plane(s) ») ; coupe aux
; espaces en lignes de 30 caractères, y = 4 + 15 × ligne, format « %Y%J%S ».
; ==============================================================================================
Conv_DrawText_59F54	proc far		; CODE XREF: sub_421FEJ Conv_PlayScript_5AA4E+74Cp ...

var_1B0		= word ptr -1B0h
var_19C		= word ptr -19Ch
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
		sub	sp, 1B0h
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	[bp+arg_4]
		call	CRT_Strdup
		add	sp, 2
		mov	[bp+var_2], ax
		mov	ax, [bp+var_2]
		mov	[bp+var_4], ax
		mov	di, [bp+var_2]
		mov	byte ptr [bp+var_19C], 0
		jmp	loc_5A165
; ���������������������������������������������������������������������������

loc_59F7F:				; CODE XREF: Conv_DrawText_59F54+224j
		mov	ax, di
		sub	ax, [bp+var_4]
		push	ax
		push	[bp+var_4]
		lea	ax, [bp+var_19C]
		push	ax
		call	sub_2789
		add	sp, 6
		cmp	byte ptr [di+1], 53h ; 'S'
		jnz	short loc_59FB3
		mov	bx, [si+28h]
		push	word ptr [bx]
		lea	ax, [bp+var_19C]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		add	di, 2
		jmp	loc_5A162
; ���������������������������������������������������������������������������

loc_59FB3:				; CODE XREF: Conv_DrawText_59F54+45j
		cmp	byte ptr [di+1], 4Eh ; 'N'
		jnz	short loc_59FD2
		mov	bx, [si+28h]
		push	word ptr [bx+2]
		lea	ax, [bp+var_19C]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		add	di, 2
		jmp	loc_5A162
; ���������������������������������������������������������������������������

loc_59FD2:				; CODE XREF: Conv_DrawText_59F54+63j
		cmp	byte ptr [di+1], 43h ; 'C'
		jnz	short loc_59FF1
		mov	bx, [si+28h]
		push	word ptr [bx+4]
		lea	ax, [bp+var_19C]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		add	di, 2
		jmp	loc_5A162
; ���������������������������������������������������������������������������

loc_59FF1:				; CODE XREF: Conv_DrawText_59F54+82j
		cmp	byte ptr [di+1], 57h ; 'W'
		jnz	short loc_5A00F
		mov	ax, [si+2Ah]
		inc	ax
		push	ax
		lea	ax, [bp+var_19C]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		add	di, 2
		jmp	loc_5A162
; ���������������������������������������������������������������������������

loc_5A00F:				; CODE XREF: Conv_DrawText_59F54+A1j
		cmp	byte ptr [di+1], 4Ch ; 'L'
		jnz	short loc_5A02F
		mov	ax, [si+2Ah]
		add	ax, 15h
		push	ax
		lea	ax, [bp+var_19C]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		add	di, 2
		jmp	loc_5A162
; ���������������������������������������������������������������������������

loc_5A02F:				; CODE XREF: Conv_DrawText_59F54+BFj
		cmp	byte ptr [di+1], 4Fh ; 'O'
		jnz	short loc_5A04F
		mov	ax, [si+2Ah]
		add	ax, 29h	; ')'
		push	ax
		lea	ax, [bp+var_19C]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		add	di, 2
		jmp	loc_5A162
; ���������������������������������������������������������������������������

loc_5A04F:				; CODE XREF: Conv_DrawText_59F54+DFj
		cmp	byte ptr [di+1], 41h ; 'A'
		jnz	short loc_5A075
		mov	al, [si+6Bh]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0ED8h]
		lea	ax, [bp+var_19C]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		add	di, 2
		jmp	loc_5A162
; ���������������������������������������������������������������������������

loc_5A075:				; CODE XREF: Conv_DrawText_59F54+FFj
		cmp	byte ptr [di+1], 42h ; 'B'
		jnz	short loc_5A09B
		mov	al, [si+6Ch]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0ED8h]
		lea	ax, [bp+var_19C]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		add	di, 2
		jmp	loc_5A162
; ���������������������������������������������������������������������������

loc_5A09B:				; CODE XREF: Conv_DrawText_59F54+125j
		cmp	byte ptr [di+1], 50h ; 'P'
		jnz	short loc_5A0F6
		push	0Ah
		lea	ax, [bp+var_1B0]
		push	ax
		mov	bx, [si+28h]
		push	word ptr [bx+6]
		call	CRT_Itoa_Signed10
		add	sp, 6
		push	0F5Bh
		lea	ax, [bp+var_1B0]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		mov	bx, [si+28h]
		cmp	word ptr [bx+6], 1
		jz	short loc_5A0DF
		push	0F62h
		lea	ax, [bp+var_1B0]
		push	ax
		call	CRT_Strcat
		add	sp, 4

loc_5A0DF:				; CODE XREF: Conv_DrawText_59F54+179j
		lea	ax, [bp+var_1B0]
		push	ax
		lea	ax, [bp+var_19C]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		add	di, 2
		jmp	short loc_5A162
; ���������������������������������������������������������������������������

loc_5A0F6:				; CODE XREF: Conv_DrawText_59F54+14Bj
		cmp	byte ptr [di+1], 54h ; 'T'
		jnz	short loc_5A151
		push	0Ah
		lea	ax, [bp+var_1B0]
		push	ax
		mov	bx, [si+28h]
		push	word ptr [bx+8]
		call	CRT_Itoa_Signed10
		add	sp, 6
		push	0F64h
		lea	ax, [bp+var_1B0]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		mov	bx, [si+28h]
		cmp	word ptr [bx+8], 1
		jz	short loc_5A13A
		push	0F6Bh
		lea	ax, [bp+var_1B0]
		push	ax
		call	CRT_Strcat
		add	sp, 4

loc_5A13A:				; CODE XREF: Conv_DrawText_59F54+1D4j
		lea	ax, [bp+var_1B0]
		push	ax
		lea	ax, [bp+var_19C]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		add	di, 2
		jmp	short loc_5A162
; ���������������������������������������������������������������������������

loc_5A151:				; CODE XREF: Conv_DrawText_59F54+1A6j
		inc	di
		push	0F6Dh
		lea	ax, [bp+var_19C]
		push	ax
		call	CRT_Strcat
		add	sp, 4

loc_5A162:				; CODE XREF: Conv_DrawText_59F54+5Cj
					; Conv_DrawText_59F54+7Bj ...
		mov	[bp+var_4], di

loc_5A165:				; CODE XREF: Conv_DrawText_59F54+28j
		push	24h ; '$'
		push	[bp+var_4]
		call	CRT_Strchr_WordAligned
		add	sp, 4
		mov	di, ax
		or	ax, ax
		jz	short loc_5A17B
		jmp	loc_59F7F
; ���������������������������������������������������������������������������

loc_5A17B:				; CODE XREF: Conv_DrawText_59F54+222j
		push	[bp+var_4]
		lea	ax, [bp+var_19C]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		push	[bp+var_2]
		call	Heap_FreeAndCoalesce_2C3FC
		add	sp, 2
		lea	ax, [bp+var_19C]
		push	ax
		call	CRT_Strdup
		add	sp, 2
		mov	[bp+var_2], ax
		mov	ax, [bp+var_2]
		mov	[bp+var_6], ax
		mov	[bp+var_8], 4
		jmp	short loc_5A204
; ���������������������������������������������������������������������������

loc_5A1B3:				; CODE XREF: Conv_DrawText_59F54+2C0j
		cmp	[bp+var_A], 1Eh
		jle	short loc_5A1D9
		mov	[bp+var_C], 1Eh
		jmp	short loc_5A1C3
; ���������������������������������������������������������������������������

loc_5A1C0:				; CODE XREF: Conv_DrawText_59F54+278j
		dec	[bp+var_C]

loc_5A1C3:				; CODE XREF: Conv_DrawText_59F54+26Aj
		mov	bx, [bp+var_6]
		add	bx, [bp+var_C]
		cmp	byte ptr [bx], 20h ; ' '
		jnz	short loc_5A1C0
		mov	bx, [bp+var_6]
		add	bx, [bp+var_C]
		mov	byte ptr [bx], 0
		jmp	short loc_5A1E0
; ���������������������������������������������������������������������������

loc_5A1D9:				; CODE XREF: Conv_DrawText_59F54+263j
		mov	ax, [bp+var_A]
		dec	ax
		mov	[bp+var_C], ax

loc_5A1E0:				; CODE XREF: Conv_DrawText_59F54+283j
		push	[bp+var_6]
		push	2
		push	[bp+var_8]
		push	0F6Fh
		push	[bp+arg_2]
		call	Widget_RenderComplexLayoutWrapper_31A3B
		add	sp, 0Ah
		add	[bp+var_8], 0Fh
		mov	ax, [bp+var_C]
		add	ax, [bp+var_6]
		inc	ax
		mov	[bp+var_6], ax

loc_5A204:				; CODE XREF: Conv_DrawText_59F54+25Dj
		push	[bp+var_6]
		call	CRT_Strlen
		add	sp, 2
		mov	[bp+var_A], ax
		or	ax, ax
		jnz	short loc_5A1B3
		push	[bp+var_2]
		call	Heap_FreeAndCoalesce_2C3FC
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
Conv_DrawText_59F54	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-22. Cherche un nom dans CONVDATA.IFF : arg_2 = 0 FACE, 1 FIGR, 2 FCPL, 3
; FGPL, 4 PFIG (dword_43F96…43FAA) ; numéro = dernier octet du DATA ; ressource dans
; convshps.pak (FACE, FIGR) ou convpals.pak (les autres), rangée en [arg_6] (6 + 4 octets).
; ==============================================================================================
ConvData_LookupByName_5A225	proc far		; CODE XREF: sub_42217J ConvData_FindFace_5A451+15p	...

var_10A		= word ptr -10Ah
var_AD		= dword	ptr -0ADh
var_A9		= dword	ptr -0A9h
var_A5		= dword	ptr -0A5h
var_94		= dword	ptr -94h
var_62		= word ptr -62h
var_12		= word ptr -12h
var_9		= byte ptr -9
var_8		= dword	ptr -8
var_4		= word ptr -4
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 10Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_6]
		push	ds
		push	offset a_iff	; ".iff"
		push	ds
		push	offset aConvdata ; "convdata"
		push	ds
		push	offset a____DataGamefl ; "..\\..\\data\\gameflow\\"
		lea	ax, [bp+var_62]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_10A]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_10A], 556h
		mov	[bp+var_A9], 100h
		mov	[bp+var_AD], 0
		mov	[bp+var_10A], 56Eh
		push	1
		lea	ax, [bp+var_62]
		push	ax
		lea	ax, [bp+var_10A]
		push	ax
		mov	bx, [bp+var_10A]
		call	dword ptr [bx+14h]
		add	sp, 6
		cmp	[bp+arg_2], 0
		jnz	short loc_5A2A8
		push	0
		push	large [dword_43F96]
		lea	ax, [bp+var_10A]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		jmp	short loc_5A310
; ���������������������������������������������������������������������������

loc_5A2A8:				; CODE XREF: ConvData_LookupByName_5A225+6Bj
		cmp	[bp+arg_2], 1
		jnz	short loc_5A2C4
		push	0
		push	large [dword_43F9B]
		lea	ax, [bp+var_10A]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		jmp	short loc_5A310
; ���������������������������������������������������������������������������

loc_5A2C4:				; CODE XREF: ConvData_LookupByName_5A225+87j
		cmp	[bp+arg_2], 2
		jnz	short loc_5A2E0
		push	0
		push	large [dword_43FA0]
		lea	ax, [bp+var_10A]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		jmp	short loc_5A310
; ���������������������������������������������������������������������������

loc_5A2E0:				; CODE XREF: ConvData_LookupByName_5A225+A3j
		cmp	[bp+arg_2], 3
		jnz	short loc_5A2FC
		push	0
		push	large [dword_43FA5]
		lea	ax, [bp+var_10A]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		jmp	short loc_5A310
; ���������������������������������������������������������������������������

loc_5A2FC:				; CODE XREF: ConvData_LookupByName_5A225+BFj
		push	0
		push	large [dword_43FAA]
		lea	ax, [bp+var_10A]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8

loc_5A310:				; CODE XREF: ConvData_LookupByName_5A225+81j
					; ConvData_LookupByName_5A225+9Dj ...
		mov	[bp+var_1], 0
		jmp	short loc_5A34C
; ���������������������������������������������������������������������������

loc_5A316:				; CODE XREF: ConvData_LookupByName_5A225+13Dj
		lea	ax, [bp+var_10A]
		push	ax
		lea	ax, [bp+var_12]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		lea	ax, [bp+var_12]
		push	ax
		push	[bp+arg_4]
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_5A342
		mov	[bp+var_1], 1
		jmp	short loc_5A364
; ���������������������������������������������������������������������������
		jmp	short loc_5A34C
; ���������������������������������������������������������������������������

loc_5A342:				; CODE XREF: ConvData_LookupByName_5A225+113j
		mov	eax, [bp+var_94]
		mov	[bp+var_A5], eax

loc_5A34C:				; CODE XREF: ConvData_LookupByName_5A225+EFj
					; ConvData_LookupByName_5A225+11Bj
		push	1
		push	large [dword_43FAF]
		lea	ax, [bp+var_10A]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jnz	short loc_5A316

loc_5A364:				; CODE XREF: ConvData_LookupByName_5A225+119j
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5A37E
		mov	al, [bp+arg_2]
		mov	ah, 0
		push	ax
		push	0F94h
		call	Fatal_Error_310B
		add	sp, 4

loc_5A37E:				; CODE XREF: ConvData_LookupByName_5A225+146j
		lea	ax, [bp+var_10A]
		push	ax
		call	ResourceRecord_ReadFinalField_3C3C1
		add	sp, 2
		mov	[bp+var_2], al
		lea	ax, [bp+var_10A]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		cmp	[bp+arg_2], 0
		jz	short loc_5A3A7
		cmp	[bp+arg_2], 1
		jnz	short loc_5A3C1

loc_5A3A7:				; CODE XREF: ConvData_LookupByName_5A225+17Aj
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aConvshps ; "convshps"
		push	ds
		push	offset a____DataGamefl ; "..\\..\\data\\gameflow\\"
		lea	ax, [bp+var_62]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		jmp	short loc_5A3D9
; ���������������������������������������������������������������������������

loc_5A3C1:				; CODE XREF: ConvData_LookupByName_5A225+180j
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aConvpals ; "convpals"
		push	ds
		push	offset a____DataGamefl ; "..\\..\\data\\gameflow\\"
		lea	ax, [bp+var_62]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh

loc_5A3D9:				; CODE XREF: ConvData_LookupByName_5A225+19Aj
		mov	al, [bp+var_2]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_62]
		push	ax
		mov	ax, si
		add	ax, 43h	; 'C'
		push	ax
		call	sub_449C
		add	sp, 6
		mov	[bp+var_4], ax
		mov	bx, [bp+var_4]
		mov	eax, [bx]
		mov	[bp+var_8], eax
		mov	bx, [bp+var_4]
		mov	al, [bx+4]
		mov	[bp+var_9], al
		mov	eax, [bp+var_8]
		mov	[di], eax
		mov	al, [bp+var_9]
		mov	[di+4],	al
		mov	byte ptr [di+5], 0
		mov	dword ptr [di+6], 0
		mov	bx, [bp+var_4]
		mov	eax, [bx+6]
		mov	[di+6],	eax
		mov	[bp+var_10A], 56Eh
		lea	ax, [bp+var_10A]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_10A]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
ConvData_LookupByName_5A225	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-22. ConvData_LookupByName_5A225(conv, 0 = FACE, nom, sortie).
; ==============================================================================================
ConvData_FindFace_5A451	proc far		; CODE XREF: sub_42203J Conv_PlayScript_5AA4E+AE4p

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, [bp+arg_6]
		push	ax
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	0
		push	si
		push	cs
		call	near ptr ConvData_LookupByName_5A225
		add	sp, 0Ah
		pop	si
		pop	bp
		retf
ConvData_FindFace_5A451	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-22. ConvData_LookupByName_5A225(conv, 2 = FCPL, « normal » si arg_6 = 0, «
; night » sinon, sortie). Seul appel vu : Conv_PlayScript_5AA4E, avec arg_6 = 0 (push 0) → les
; conversations prennent toujours la palette de visage « normal ».
; ==============================================================================================
ConvData_FindFacePalette_5A46F	proc far		; CODE XREF: sub_42208J Conv_PlayScript_5AA4E+B0Cp

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	[bp+arg_6], 0
		jnz	short loc_5A494
		mov	al, [bp+arg_4]
		push	ax
		push	di
		push	0FC3h
		push	2
		push	si
		push	cs
		call	near ptr ConvData_LookupByName_5A225
		add	sp, 0Ah
		jmp	short loc_5A4A6
; ���������������������������������������������������������������������������

loc_5A494:				; CODE XREF: ConvData_FindFacePalette_5A46F+Fj
		mov	al, [bp+arg_4]
		push	ax
		push	di
		push	0FCAh
		push	2
		push	si
		push	cs
		call	near ptr ConvData_LookupByName_5A225
		add	sp, 0Ah

loc_5A4A6:				; CODE XREF: ConvData_FindFacePalette_5A46F+23j
		pop	di
		pop	si
		pop	bp
		retf
ConvData_FindFacePalette_5A46F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-22. ConvData_LookupByName_5A225(conv, 1 = FIGR, nom, sortie) : forme d'une
; figure de scène de groupe.
; ==============================================================================================
ConvData_FindFigure_5A4AA	proc far		; CODE XREF: sub_4220DJ Conv_PlayScript_5AA4E+288p ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, [bp+arg_6]
		push	ax
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	1
		push	si
		push	cs
		call	near ptr ConvData_LookupByName_5A225
		add	sp, 0Ah
		pop	si
		pop	bp
		retf
ConvData_FindFigure_5A4AA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-22. ConvData_LookupByName_5A225(conv, 3 = FGPL, « normal », sortie).
; ==============================================================================================
ConvData_FindFigurePalette_5A4C8	proc far		; CODE XREF: sub_42212J Conv_PlayScript_5AA4E+19Bp ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, [bp+arg_4]
		push	ax
		push	[bp+arg_2]
		push	0FD0h
		push	3
		push	si
		push	cs
		call	near ptr ConvData_LookupByName_5A225
		add	sp, 0Ah
		pop	si
		pop	bp
		retf
ConvData_FindFigurePalette_5A4C8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE en partie 2026-10-22. Cherche dans CONVDATA.IFF la FORM BACK dont l'INFO vaut le
; nom donné ; DATA = éléments de 5 octets (source 0 = convshps/convpals, 1 = optshps/optpals ;
; image ; palette ; mot y) → tableaux de ressources d'images, de palettes et de positions y ;
; renvoie le nombre d'éléments.
; ==============================================================================================
ConvData_LoadBackground_5A4E6	proc far		; CODE XREF: sub_4221CJ Conv_PlayScript_5AA4E+CEp	...

var_262		= word ptr -262h
var_212		= word ptr -212h
var_1C2		= word ptr -1C2h
var_172		= word ptr -172h
var_122		= word ptr -122h
var_C5		= dword	ptr -0C5h
var_C1		= dword	ptr -0C1h
var_BD		= dword	ptr -0BDh
var_B0		= dword	ptr -0B0h
var_AC		= dword	ptr -0ACh
var_7A		= word ptr -7Ah
var_29		= byte ptr -29h
var_28		= dword	ptr -28h
var_24		= word ptr -24h
var_21		= byte ptr -21h
var_20		= dword	ptr -20h
var_1C		= word ptr -1Ch
var_19		= byte ptr -19h
var_18		= dword	ptr -18h
var_14		= word ptr -14h
var_11		= byte ptr -11h
var_10		= dword	ptr -10h
var_C		= word ptr -0Ch
var_9		= byte ptr -9
var_8		= byte ptr -8
var_7		= byte ptr -7
var_6		= word ptr -6
var_3		= byte ptr -3
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 262h
		push	si
		push	di
		mov	di, [bp+arg_0]
		push	ds
		push	offset a_iff	; ".iff"
		push	ds
		push	offset aConvdata ; "convdata"
		push	ds
		push	offset a____DataGamefl ; "..\\..\\data\\gameflow\\"
		lea	ax, [bp+var_7A]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_122]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_122], 556h
		mov	[bp+var_C1], 100h
		mov	[bp+var_C5], 0
		mov	[bp+var_122], 56Eh
		push	1
		lea	ax, [bp+var_7A]
		push	ax
		lea	ax, [bp+var_122]
		push	ax
		mov	bx, [bp+var_122]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aOptshps_0 ; "optshps"
		push	ds
		push	offset a____DataGamefl ; "..\\..\\data\\gameflow\\"
		lea	ax, [bp+var_172]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aOptpals_0 ; "optpals"
		push	ds
		push	offset a____DataGamefl ; "..\\..\\data\\gameflow\\"
		lea	ax, [bp+var_1C2]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aConvshps ; "convshps"
		push	ds
		push	offset a____DataGamefl ; "..\\..\\data\\gameflow\\"
		lea	ax, [bp+var_212]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	ds
		push	offset a_pak	; ".pak"
		push	ds
		push	offset aConvpals ; "convpals"
		push	ds
		push	offset a____DataGamefl ; "..\\..\\data\\gameflow\\"
		lea	ax, [bp+var_262]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		mov	[bp+var_1], 0
		push	0
		push	large [dword_43FF7]
		lea	ax, [bp+var_122]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		jmp	short loc_5A63A
; ���������������������������������������������������������������������������

loc_5A5C8:				; CODE XREF: ConvData_LoadBackground_5A4E6+16Cj
		push	0
		push	large [dword_44001]
		lea	ax, [bp+var_122]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jz	short loc_5A618
		lea	ax, [bp+var_C]
		push	ax
		call	sub_C7A3
		add	sp, 2
		lea	ax, [bp+var_122]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		push	[bp+arg_2]
		lea	ax, [bp+var_C]
		push	ax
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_5A616
		mov	[bp+var_1], 1
		jmp	short loc_5A655
; ���������������������������������������������������������������������������

loc_5A616:				; CODE XREF: ConvData_LoadBackground_5A4E6+128j
		jmp	short loc_5A623
; ���������������������������������������������������������������������������

loc_5A618:				; CODE XREF: ConvData_LoadBackground_5A4E6+F8j
		push	0FE6h
		call	Fatal_Error_310B
		add	sp, 2

loc_5A623:				; CODE XREF: ConvData_LoadBackground_5A4E6:loc_5A616j
		mov	eax, [bp+var_AC]
		mov	[bp+var_BD], eax
		lea	ax, [bp+var_122]
		push	ax
		call	ResourceRecord_ReleaseAndClear_3C595
		add	sp, 2

loc_5A63A:				; CODE XREF: ConvData_LoadBackground_5A4E6+E0j
		push	1
		push	large [dword_43FFC]
		lea	ax, [bp+var_122]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		or	ax, ax
		jz	short loc_5A655
		jmp	loc_5A5C8
; ���������������������������������������������������������������������������

loc_5A655:				; CODE XREF: ConvData_LoadBackground_5A4E6+12Ej
					; ConvData_LoadBackground_5A4E6+16Aj
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5A669
		push	1008h
		call	Fatal_Error_310B
		add	sp, 2

loc_5A669:				; CODE XREF: ConvData_LoadBackground_5A4E6+176j
		mov	eax, [bp+var_AC]
		mov	[bp+var_BD], eax
		push	0
		push	large [dword_4404E]
		lea	ax, [bp+var_122]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jnz	short loc_5A68E
		jmp	loc_5AA10
; ���������������������������������������������������������������������������

loc_5A68E:				; CODE XREF: ConvData_LoadBackground_5A4E6+1A3j
		mov	eax, [bp+var_B0]
		mov	ebx, 5
		cdq
		idiv	ebx
		mov	[bp+var_2], al
		push	seg stub188
		push	offset Stub_ResourceHandle_Construct_42095
		push	11h
		mov	al, [bp+var_2]
		mov	ah, 0
		push	ax
		push	0Ah
		push	0
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	bx, [bp+arg_4]
		mov	[bx], ax
		push	seg stub188
		push	offset Stub_ResourceHandle_Construct_42095
		push	11h
		mov	al, [bp+var_2]
		mov	ah, 0
		push	ax
		push	0Ah
		push	0
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	bx, [bp+arg_6]
		mov	[bx], ax
		mov	al, [bp+var_2]
		mov	ah, 0
		shl	ax, 1
		push	ax
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	bx, [bp+arg_8]
		mov	[bx], ax
		mov	[bp+var_6], 0
		jmp	loc_5A9F4
; ���������������������������������������������������������������������������

loc_5A6FC:				; CODE XREF: ConvData_LoadBackground_5A4E6+518j
		lea	ax, [bp+var_122]
		push	ax
		call	ResourceRecord_ReadFinalField_3C3C1
		add	sp, 2
		mov	[bp+var_7], al
		lea	ax, [bp+var_122]
		push	ax
		call	ResourceRecord_ReadFinalField_3C3C1
		add	sp, 2
		mov	[bp+var_8], al
		lea	ax, [bp+var_122]
		push	ax
		call	ResourceRecord_ReadFinalField_3C3C1
		add	sp, 2
		mov	[bp+var_9], al
		cmp	[bp+var_7], 0
		jz	short loc_5A735
		jmp	loc_5A87C
; ���������������������������������������������������������������������������

loc_5A735:				; CODE XREF: ConvData_LoadBackground_5A4E6+24Aj
		mov	al, [bp+var_8]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_212]
		push	ax
		mov	ax, di
		add	ax, 43h	; 'C'
		push	ax
		call	sub_449C
		add	sp, 6
		mov	[bp+var_C], ax
		mov	bx, [bp+var_C]
		mov	eax, [bx]
		mov	[bp+var_10], eax
		mov	bx, [bp+var_C]
		mov	al, [bx+4]
		mov	[bp+var_11], al
		mov	ax, [bp+var_6]
		mov	dx, 0Ah
		imul	dx
		mov	bx, [bp+arg_4]
		mov	bx, [bx]
		add	bx, ax
		mov	ax, word ptr [bp+var_10+2]
		mov	dx, word ptr [bp+var_10]
		mov	[bx+2],	ax
		mov	[bx], dx
		mov	ax, [bp+var_6]
		mov	dx, 0Ah
		imul	dx
		mov	bx, [bp+arg_4]
		mov	bx, [bx]
		add	bx, ax
		mov	al, [bp+var_11]
		mov	[bx+4],	al
		mov	ax, [bp+var_6]
		mov	dx, 0Ah
		imul	dx
		mov	bx, [bp+arg_4]
		mov	bx, [bx]
		add	bx, ax
		mov	byte ptr [bx+5], 0
		mov	ax, [bp+var_6]
		mov	dx, 0Ah
		imul	dx
		mov	bx, [bp+arg_4]
		mov	bx, [bx]
		add	bx, ax
		mov	dword ptr [bx+6], 0
		mov	ax, [bp+var_6]
		mov	dx, 0Ah
		imul	dx
		mov	bx, [bp+arg_4]
		mov	bx, [bx]
		add	bx, ax
		mov	si, [bp+var_C]
		mov	eax, [si+6]
		mov	[bx+6],	eax
		mov	al, [bp+var_9]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_262]
		push	ax
		mov	ax, di
		add	ax, 43h	; 'C'
		push	ax
		call	sub_449C
		add	sp, 6
		mov	[bp+var_14], ax
		mov	bx, [bp+var_14]
		mov	eax, [bx]
		mov	[bp+var_18], eax
		mov	bx, [bp+var_14]
		mov	al, [bx+4]
		mov	[bp+var_19], al
		mov	ax, [bp+var_6]
		mov	dx, 0Ah
		imul	dx
		mov	bx, [bp+arg_6]
		mov	bx, [bx]
		add	bx, ax
		mov	ax, word ptr [bp+var_18+2]
		mov	dx, word ptr [bp+var_18]
		mov	[bx+2],	ax
		mov	[bx], dx
		mov	ax, [bp+var_6]
		mov	dx, 0Ah
		imul	dx
		mov	bx, [bp+arg_6]
		mov	bx, [bx]
		add	bx, ax
		mov	al, [bp+var_19]
		mov	[bx+4],	al
		mov	ax, [bp+var_6]
		mov	dx, 0Ah
		imul	dx
		mov	bx, [bp+arg_6]
		mov	bx, [bx]
		add	bx, ax
		mov	byte ptr [bx+5], 0
		mov	ax, [bp+var_6]
		mov	dx, 0Ah
		imul	dx
		mov	bx, [bp+arg_6]
		mov	bx, [bx]
		add	bx, ax
		mov	dword ptr [bx+6], 0
		mov	ax, [bp+var_6]
		mov	dx, 0Ah
		imul	dx
		mov	bx, [bp+arg_6]
		mov	bx, [bx]
		add	bx, ax
		mov	si, [bp+var_14]
		mov	eax, [si+6]
		mov	[bx+6],	eax
		jmp	loc_5A9D6
; ���������������������������������������������������������������������������

loc_5A87C:				; CODE XREF: ConvData_LoadBackground_5A4E6+24Cj
		cmp	[bp+var_7], 1
		jz	short loc_5A885
		jmp	loc_5A9CB
; ���������������������������������������������������������������������������

loc_5A885:				; CODE XREF: ConvData_LoadBackground_5A4E6+39Aj
		mov	al, [bp+var_8]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_172]
		push	ax
		mov	ax, di
		add	ax, 43h	; 'C'
		push	ax
		call	sub_449C
		add	sp, 6
		mov	[bp+var_1C], ax
		mov	bx, [bp+var_1C]
		mov	eax, [bx]
		mov	[bp+var_20], eax
		mov	bx, [bp+var_1C]
		mov	al, [bx+4]
		mov	[bp+var_21], al
		mov	ax, [bp+var_6]
		mov	dx, 0Ah
		imul	dx
		mov	bx, [bp+arg_4]
		mov	bx, [bx]
		add	bx, ax
		mov	ax, word ptr [bp+var_20+2]
		mov	dx, word ptr [bp+var_20]
		mov	[bx+2],	ax
		mov	[bx], dx
		mov	ax, [bp+var_6]
		mov	dx, 0Ah
		imul	dx
		mov	bx, [bp+arg_4]
		mov	bx, [bx]
		add	bx, ax
		mov	al, [bp+var_21]
		mov	[bx+4],	al
		mov	ax, [bp+var_6]
		mov	dx, 0Ah
		imul	dx
		mov	bx, [bp+arg_4]
		mov	bx, [bx]
		add	bx, ax
		mov	byte ptr [bx+5], 0
		mov	ax, [bp+var_6]
		mov	dx, 0Ah
		imul	dx
		mov	bx, [bp+arg_4]
		mov	bx, [bx]
		add	bx, ax
		mov	dword ptr [bx+6], 0
		mov	ax, [bp+var_6]
		mov	dx, 0Ah
		imul	dx
		mov	bx, [bp+arg_4]
		mov	bx, [bx]
		add	bx, ax
		mov	si, [bp+var_1C]
		mov	eax, [si+6]
		mov	[bx+6],	eax
		mov	al, [bp+var_9]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_1C2]
		push	ax
		mov	ax, di
		add	ax, 43h	; 'C'
		push	ax
		call	sub_449C
		add	sp, 6
		mov	[bp+var_24], ax
		mov	bx, [bp+var_24]
		mov	eax, [bx]
		mov	[bp+var_28], eax
		mov	bx, [bp+var_24]
		mov	al, [bx+4]
		mov	[bp+var_29], al
		mov	ax, [bp+var_6]
		mov	dx, 0Ah
		imul	dx
		mov	bx, [bp+arg_6]
		mov	bx, [bx]
		add	bx, ax
		mov	ax, word ptr [bp+var_28+2]
		mov	dx, word ptr [bp+var_28]
		mov	[bx+2],	ax
		mov	[bx], dx
		mov	ax, [bp+var_6]
		mov	dx, 0Ah
		imul	dx
		mov	bx, [bp+arg_6]
		mov	bx, [bx]
		add	bx, ax
		mov	al, [bp+var_29]
		mov	[bx+4],	al
		mov	ax, [bp+var_6]
		mov	dx, 0Ah
		imul	dx
		mov	bx, [bp+arg_6]
		mov	bx, [bx]
		add	bx, ax
		mov	byte ptr [bx+5], 0
		mov	ax, [bp+var_6]
		mov	dx, 0Ah
		imul	dx
		mov	bx, [bp+arg_6]
		mov	bx, [bx]
		add	bx, ax
		mov	dword ptr [bx+6], 0
		mov	ax, [bp+var_6]
		mov	dx, 0Ah
		imul	dx
		mov	bx, [bp+arg_6]
		mov	bx, [bx]
		add	bx, ax
		mov	si, [bp+var_24]
		mov	eax, [si+6]
		mov	[bx+6],	eax
		jmp	short loc_5A9D6
; ���������������������������������������������������������������������������

loc_5A9CB:				; CODE XREF: ConvData_LoadBackground_5A4E6+39Cj
		push	1033h
		call	Fatal_Error_310B
		add	sp, 2

loc_5A9D6:				; CODE XREF: ConvData_LoadBackground_5A4E6+393j
					; ConvData_LoadBackground_5A4E6+4E3j
		lea	ax, [bp+var_122]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	dx, [bp+var_6]
		shl	dx, 1
		mov	bx, [bp+arg_8]
		mov	bx, [bx]
		add	bx, dx
		mov	[bx], ax
		inc	[bp+var_6]

loc_5A9F4:				; CODE XREF: ConvData_LoadBackground_5A4E6+213j
		mov	al, [bp+var_2]
		mov	ah, 0
		cmp	ax, [bp+var_6]
		jle	short loc_5AA01
		jmp	loc_5A6FC
; ���������������������������������������������������������������������������

loc_5AA01:				; CODE XREF: ConvData_LoadBackground_5A4E6+516j
		lea	ax, [bp+var_122]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		jmp	short loc_5AA1B
; ���������������������������������������������������������������������������

loc_5AA10:				; CODE XREF: ConvData_LoadBackground_5A4E6+1A5j
		push	1054h
		call	Fatal_Error_310B
		add	sp, 2

loc_5AA1B:				; CODE XREF: ConvData_LoadBackground_5A4E6+528j
		mov	al, [bp+var_2]
		mov	[bp+var_3], al
		mov	[bp+var_122], 56Eh
		lea	ax, [bp+var_122]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_122]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4
		mov	al, [bp+var_3]
		pop	di
		pop	si
		leave
		retf
ConvData_LoadBackground_5A4E6	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-22 (structure). Interpréteur des scripts de conversation (CONV.PAK) :
; boucle tant que le curseur [conv+4] < début [conv] + taille [conv+8], lit un octet de
; commande et saute par la table off_5CE29 (00h scène de groupe, 03h réplique en gros plan
; avec 04h/0Ah/0Bh qui suivent, 0Ch saut relatif, 0Eh escadre, 0Fh choix d'équipier, 10h rien
; ; autre = octet sauté). Format complet : analysis/CONV_SYSTEM.md.
; ==============================================================================================
Conv_PlayScript_5AA4E	proc far		; CODE XREF: sub_42235J

var_22E		= word ptr -22Eh
var_22C		= byte ptr -22Ch
var_22A		= word ptr -22Ah
var_228		= byte ptr -228h
var_227		= word ptr -227h
var_222		= word ptr -222h
var_220		= word ptr -220h
var_21E		= word ptr -21Eh
var_21C		= word ptr -21Ch
var_21A		= word ptr -21Ah
var_218		= word ptr -218h
var_201		= word ptr -201h
var_1FF		= word ptr -1FFh
var_1FD		= word ptr -1FDh
var_1FB		= word ptr -1FBh
var_1F8		= word ptr -1F8h
var_1E4		= word ptr -1E4h
var_1DC		= word ptr -1DCh
var_1BE		= word ptr -1BEh
var_1BC		= word ptr -1BCh
var_1BA		= word ptr -1BAh
var_1B8		= word ptr -1B8h
var_1B6		= word ptr -1B6h
var_1B4		= word ptr -1B4h
var_1B0		= word ptr -1B0h
var_1AE		= word ptr -1AEh
var_1AC		= word ptr -1ACh
var_1AA		= word ptr -1AAh
var_1A8		= word ptr -1A8h
var_1A6		= word ptr -1A6h
var_1A2		= word ptr -1A2h
var_1A0		= word ptr -1A0h
var_194		= word ptr -194h
var_188		= word ptr -188h
var_184		= word ptr -184h
var_17C		= word ptr -17Ch
var_170		= word ptr -170h
var_166		= word ptr -166h
var_164		= word ptr -164h
var_162		= word ptr -162h
var_160		= word ptr -160h
var_15E		= word ptr -15Eh
var_15C		= word ptr -15Ch
var_158		= word ptr -158h
var_156		= word ptr -156h
var_154		= word ptr -154h
var_152		= word ptr -152h
var_150		= word ptr -150h
var_14E		= word ptr -14Eh
var_14C		= dword	ptr -14Ch
var_148		= word ptr -148h
var_146		= word ptr -146h
var_144		= word ptr -144h
var_142		= word ptr -142h
var_140		= word ptr -140h
var_13E		= word ptr -13Eh
var_13C		= word ptr -13Ch
var_13A		= word ptr -13Ah
var_136		= dword	ptr -136h
var_130		= word ptr -130h
var_12E		= byte ptr -12Eh
var_12D		= word ptr -12Dh
var_12B		= word ptr -12Bh
var_129		= word ptr -129h
var_127		= word ptr -127h
var_124		= word ptr -124h
var_107		= word ptr -107h
var_104		= word ptr -104h
var_B4		= dword	ptr -0B4h
var_B0		= dword	ptr -0B0h
var_AC		= word ptr -0ACh
var_AA		= word ptr -0AAh
var_A6		= dword	ptr -0A6h
var_A2		= dword	ptr -0A2h
var_9E		= word ptr -9Eh
var_9C		= word ptr -9Ch
var_9A		= word ptr -9Ah
var_98		= word ptr -98h
var_96		= word ptr -96h
var_92		= word ptr -92h
var_90		= word ptr -90h
var_8E		= word ptr -8Eh
var_8C		= word ptr -8Ch
var_8A		= word ptr -8Ah
var_88		= word ptr -88h
var_86		= dword	ptr -86h
var_82		= dword	ptr -82h
var_7D		= word ptr -7Dh
var_7A		= dword	ptr -7Ah
var_73		= word ptr -73h
var_71		= byte ptr -71h
var_70		= word ptr -70h
var_6E		= dword	ptr -6Eh
var_6A		= dword	ptr -6Ah
var_66		= dword	ptr -66h
var_62		= dword	ptr -62h
var_5E		= dword	ptr -5Eh
var_5A		= word ptr -5Ah
var_58		= word ptr -58h
var_56		= word ptr -56h
var_54		= word ptr -54h
var_52		= word ptr -52h
var_50		= word ptr -50h
var_4E		= word ptr -4Eh
var_4C		= word ptr -4Ch
var_4A		= word ptr -4Ah
var_48		= word ptr -48h
var_46		= word ptr -46h
var_44		= word ptr -44h
var_41		= byte ptr -41h
var_40		= word ptr -40h
var_3D		= byte ptr -3Dh
var_3C		= word ptr -3Ch
var_39		= byte ptr -39h
var_38		= word ptr -38h
var_36		= word ptr -36h
var_34		= word ptr -34h
var_32		= word ptr -32h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_2C		= word ptr -2Ch
var_2A		= word ptr -2Ah
var_28		= byte ptr -28h
var_26		= byte ptr -26h
var_25		= byte ptr -25h
var_24		= word ptr -24h
var_1D		= byte ptr -1Dh
var_1C		= word ptr -1Ch
var_16		= byte ptr -16h
var_15		= byte ptr -15h
var_14		= word ptr -14h
var_A		= word ptr -0Ah
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 22Eh
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	byte_495FC, 0
		mov	byte ptr [bp+var_A], 0
		mov	byte ptr [bp+var_14], 0
		mov	[bp+var_15], 0
		mov	bx, [di+2Ah]
		mov	byte ptr [bx], 0
		mov	[bp+var_1D], 0
		jmp	loc_5CDF7
; ���������������������������������������������������������������������������

loc_5AA78:				; CODE XREF: Conv_PlayScript_5AA4E+23C0j
		mov	[bp+var_26], 0
		call	Input_Flush_CDDC
		les	bx, [di+4]
		inc	word ptr [di+4]
		mov	al, es:[bx]
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 10h		; switch 17 cases
		jbe	short loc_5AA96
		jmp	loc_5CDED	; default
; ���������������������������������������������������������������������������

loc_5AA96:				; CODE XREF: Conv_PlayScript_5AA4E+43j
		shl	bx, 1
		jmp	cs:off_5CE29[bx] ; switch jump

loc_5AA9D:				; DATA XREF: ovr191:off_5CE29o
		jmp	loc_5CDEF	; case 0x10
; ���������������������������������������������������������������������������

loc_5AAA0:				; CODE XREF: Conv_PlayScript_5AA4E+4Aj
					; DATA XREF: ovr191:off_5CE29o
		cmp	byte_495FC, 0	; case 0x0
		jz	short loc_5AAAB
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_5AAAB:				; CODE XREF: Conv_PlayScript_5AA4E+57j
		mov	ax, di
		add	ax, 1Ah
		push	ax
		lea	ax, [bp+var_2A]
		push	ax
		call	SmallObject_RegisterInList_2CB40
		add	sp, 4
		push	100h
		push	0
		lea	ax, [bp+var_30]
		push	ax
		call	Palette_Alloc_2CC76
		add	sp, 6
		mov	ax, di
		add	ax, 0Ch
		push	ax
		push	0
		push	0Ah
		lea	ax, [bp+var_124]
		push	ax
		call	LayerGroup_Construct_2DC66
		add	sp, 8
		mov	[bp+var_130], 1254h
		mov	[bp+var_12E], 0
		mov	[bp+var_130], 125Ch
		push	di
		lea	ax, [bp+var_130]
		push	ax
		call	ConvRec_ReadName_6305
		add	sp, 4
		lea	ax, [bp+var_12D]
		mov	[bp+var_32], ax
		lea	ax, [bp+var_38]
		push	ax
		lea	ax, [bp+var_36]
		push	ax
		lea	ax, [bp+var_34]
		push	ax
		push	[bp+var_32]
		push	di
		push	cs
		call	near ptr ConvData_LoadBackground_5A4E6
		add	sp, 0Ah
		mov	[bp+var_39], al
		mov	[bp+var_3C], 0
		jmp	short loc_5AB65
; ���������������������������������������������������������������������������

loc_5AB2C:				; CODE XREF: Conv_PlayScript_5AA4E+11Fj
		mov	ax, [bp+var_3C]
		shl	ax, 1
		mov	bx, [bp+var_38]
		add	bx, ax
		push	word ptr [bx]
		push	0
		mov	ax, [bp+var_3C]
		mov	dx, 0Ah
		imul	dx
		mov	dx, [bp+var_34]
		add	dx, ax
		push	dx
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	si, ax
		push	si
		lea	ax, [bp+var_124]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		inc	[bp+var_3C]

loc_5AB65:				; CODE XREF: Conv_PlayScript_5AA4E+DCj
		mov	al, [bp+var_39]
		mov	ah, 0
		cmp	ax, [bp+var_3C]
		jg	short loc_5AB2C
		mov	[bp+var_3C], 0
		jmp	short loc_5ABBF
; ���������������������������������������������������������������������������

loc_5AB76:				; CODE XREF: Conv_PlayScript_5AA4E+179j
		mov	ax, [bp+var_3C]
		mov	dx, 0Ah
		imul	dx
		mov	dx, [bp+var_36]
		add	dx, ax
		mov	si, dx
		mov	word ptr [bp+var_62+3],	0
		push	si
		lea	ax, [bp+var_62]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		push	word ptr [bp+var_62]
		mov	al, byte ptr [bp+var_62+2]
		push	ax
		lea	ax, [bp+var_62]
		push	ax
		lea	ax, [bp+var_30]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	2
		lea	ax, [bp+var_62]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		inc	[bp+var_3C]

loc_5ABBF:				; CODE XREF: Conv_PlayScript_5AA4E+126j
		mov	al, [bp+var_39]
		mov	ah, 0
		cmp	ax, [bp+var_3C]
		jg	short loc_5AB76
		mov	[bp+var_66], 0
		mov	byte ptr [bp+var_62], 2
		mov	byte ptr [bp+var_62+1],	0
		mov	[bp+var_62+2], 0
		push	2
		lea	ax, [bp+var_66]
		push	ax
		push	di
		push	cs
		call	near ptr ConvData_FindFigurePalette_5A4C8
		add	sp, 6
		mov	word ptr [bp+var_6A+1],	0
		lea	ax, [bp+var_66]
		push	ax
		lea	ax, [bp+var_6E+2]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		push	word ptr [bp+var_6E+2]
		mov	al, byte ptr [bp+var_6A]
		push	ax
		lea	ax, [bp+var_6E+2]
		push	ax
		lea	ax, [bp+var_30]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	2
		lea	ax, [bp+var_6E+2]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	byte ptr [bp+var_62+1],	0
		jz	short loc_5AC4D
		cmp	[bp+var_66], 0
		jz	short loc_5AC4D
		push	0
		mov	al, byte ptr [bp+var_62]
		push	ax
		lea	ax, [bp+var_66]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_5AC4D:				; CODE XREF: Conv_PlayScript_5AA4E+1DFj
					; Conv_PlayScript_5AA4E+1E6j
		mov	[bp+var_66], 0
		mov	byte ptr [bp+var_62+1],	0
		mov	[bp+var_62+2], 0
		mov	[bp+var_3D], 1
		push	seg stub188
		push	offset Stub_ResourceHandle_Construct_42095
		push	1
		push	0Ah
		push	0Ah
		lea	ax, [bp+var_194]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[bp+var_40], 0
		jmp	loc_5ADBC
; ���������������������������������������������������������������������������

loc_5AC86:				; CODE XREF: Conv_PlayScript_5AA4E+377j
		inc	word ptr [di+4]
		mov	[bp+var_22A], 1254h
		mov	[bp+var_228], 1
		mov	[bp+var_22A], 124Ch
		push	di
		lea	ax, [bp+var_22A]
		push	ax
		call	ConvRec_ReadExtra_6464
		add	sp, 4
		lea	ax, [bp+var_227]
		mov	si, ax
		push	si
		call	CRT_Strlen
		add	sp, 2
		mov	bx, ax
		mov	al, [bx+si-1]
		mov	byte ptr [bp+var_5E+1],	al
		inc	[bp+var_40]
		push	3
		mov	ax, [bp+var_40]
		mov	dx, 0Ah
		imul	dx
		lea	dx, [bp+var_194]
		add	ax, dx
		push	ax
		push	si
		push	di
		push	cs
		call	near ptr ConvData_FindFigure_5A4AA
		add	sp, 8
		mov	al, byte ptr [bp+var_5E+1]
		push	ax
		push	[bp+var_21C]
		push	[bp+var_21E]
		mov	ax, [bp+var_40]
		mov	dx, 0Ah
		imul	dx
		lea	dx, [bp+var_194]
		add	ax, dx
		push	ax
		push	0
		call	ConvFigure_ConstructExtra_AB6B
		add	sp, 0Ah
		mov	word ptr [bp+var_62+2],	ax
		push	word ptr [bp+var_62+2]
		lea	ax, [bp+var_124]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		cmp	[bp+var_3D], 0
		jnz	short loc_5AD1D
		jmp	loc_5ADBC
; ���������������������������������������������������������������������������

loc_5AD1D:				; CODE XREF: Conv_PlayScript_5AA4E+2CAj
		mov	[bp+var_6A], 0
		mov	byte ptr [bp+var_66], 2
		mov	byte ptr [bp+var_66+1],	0
		mov	[bp+var_66+2], 0
		push	2
		lea	ax, [bp+var_6A]
		push	ax
		push	si
		push	4
		push	di
		push	cs
		call	near ptr ConvData_LookupByName_5A225
		add	sp, 0Ah
		mov	word ptr [bp-6Dh], 0
		lea	ax, [bp+var_6A]
		push	ax
		lea	ax, [bp+var_70]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		push	[bp+var_70]
		mov	al, byte ptr [bp+var_6E]
		push	ax
		lea	ax, [bp+var_70]
		push	ax
		lea	ax, [bp+var_30]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		mov	[bp+var_3D], 0
		push	2
		lea	ax, [bp+var_70]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	byte ptr [bp+var_66+1],	0
		jz	short loc_5ADA8
		cmp	[bp+var_6A], 0
		jz	short loc_5ADA8
		push	0
		mov	al, byte ptr [bp+var_66]
		push	ax
		lea	ax, [bp+var_6A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_5ADA8:				; CODE XREF: Conv_PlayScript_5AA4E+33Aj
					; Conv_PlayScript_5AA4E+341j
		mov	[bp+var_6A], 0
		mov	byte ptr [bp+var_66+1],	0
		mov	[bp+var_66+2], 0

loc_5ADBC:				; CODE XREF: Conv_PlayScript_5AA4E+235j
					; Conv_PlayScript_5AA4E+2CCj
		les	bx, [di+4]
		cmp	byte ptr es:[bx], 1
		jnz	short loc_5ADC8
		jmp	loc_5AC86
; ���������������������������������������������������������������������������

loc_5ADC8:				; CODE XREF: Conv_PlayScript_5AA4E+375j
		mov	[bp+var_41], 0

loc_5ADCC:				; CODE XREF: Conv_PlayScript_5AA4E:loc_5B016j
		mov	ax, [di]
		add	ax, [di+8]
		cmp	ax, [di+4]
		ja	short loc_5ADDB
		mov	ax, 1
		jmp	short loc_5ADDD
; ���������������������������������������������������������������������������

loc_5ADDB:				; CODE XREF: Conv_PlayScript_5AA4E+386j
		xor	ax, ax

loc_5ADDD:				; CODE XREF: Conv_PlayScript_5AA4E+38Bj
		mov	ah, 0
		or	ax, ax
		jz	short loc_5ADE6
		jmp	loc_5AF78
; ���������������������������������������������������������������������������

loc_5ADE6:				; CODE XREF: Conv_PlayScript_5AA4E+393j
		les	bx, [di+4]
		cmp	byte ptr es:[bx], 2
		jz	short loc_5ADF2
		jmp	loc_5AF78
; ���������������������������������������������������������������������������

loc_5ADF2:				; CODE XREF: Conv_PlayScript_5AA4E+39Fj
		inc	word ptr [di+4]
		mov	[bp+var_22E], 1254h
		mov	[bp+var_22C], 2
		mov	[bp+var_22E], 1244h
		mov	[bp+var_21E+1],	0
		push	di
		lea	ax, [bp+var_22E]
		push	ax
		call	ConvRec_ReadSpeaker_64EE
		add	sp, 4
		lea	ax, [bp-22Bh]
		push	ax
		call	CRT_Strdup
		add	sp, 2
		mov	word ptr [bp+var_5E], ax
		inc	[bp+var_40]
		push	3
		mov	ax, [bp+var_40]
		mov	dx, 0Ah
		imul	dx
		lea	dx, [bp+var_194]
		add	ax, dx
		push	ax
		push	word ptr [bp+var_5E]
		push	di
		push	cs
		call	near ptr ConvData_FindFigure_5A4AA
		add	sp, 8
		push	[bp+var_220]
		push	[bp+var_222]
		mov	ax, [bp+var_40]
		mov	dx, 0Ah
		imul	dx
		lea	dx, [bp+var_194]
		add	ax, dx
		push	ax
		push	0
		call	ConvFigure_ConstructSpeaking_A207
		add	sp, 8
		mov	si, ax
		mov	al, [bp+var_41]
		mov	ah, 0
		shl	ax, 1
		lea	dx, [bp+var_1BC]
		add	ax, dx
		mov	bx, ax
		mov	[bx], si
		push	[bp+var_21E+1]
		call	CRT_Strdup
		add	sp, 2
		mov	dl, [bp+var_41]
		mov	dh, 0
		shl	dx, 1
		lea	bx, [bp+var_1E4]
		add	dx, bx
		mov	bx, dx
		mov	[bx], ax
		mov	al, [bp+var_41]
		mov	ah, 0
		lea	dx, [bp+var_1F8]
		add	ax, dx
		mov	dl, byte ptr [bp+var_21E]
		mov	bx, ax
		mov	[bx], dl
		inc	[bp+var_41]
		push	si
		lea	ax, [bp+var_124]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		cmp	[bp+var_3D], 0
		jnz	short loc_5AEC7
		jmp	loc_5AF63
; ���������������������������������������������������������������������������

loc_5AEC7:				; CODE XREF: Conv_PlayScript_5AA4E+474j
		mov	[bp+var_6A+2], 0
		mov	byte ptr [bp+var_66+2],	2
		mov	byte ptr [bp+var_66+3],	0
		mov	[bp+var_62], 0
		push	2
		lea	ax, [bp+var_6A+2]
		push	ax
		push	di
		push	cs
		call	near ptr ConvData_FindFigurePalette_5A4C8
		add	sp, 6
		mov	word ptr [bp+var_6E+3],	0
		lea	ax, [bp+var_6A+2]
		push	ax
		lea	ax, [bp+var_6E]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		push	word ptr [bp+var_6E]
		mov	al, byte ptr [bp+var_6E+2]
		push	ax
		lea	ax, [bp+var_6E]
		push	ax
		lea	ax, [bp+var_30]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		mov	[bp+var_3D], 0
		push	2
		lea	ax, [bp+var_6E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	byte ptr [bp+var_66+3],	0
		jz	short loc_5AF4F
		cmp	[bp+var_6A+2], 0
		jz	short loc_5AF4F
		push	0
		mov	al, byte ptr [bp+var_66+2]
		push	ax
		lea	ax, [bp+var_6A+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_5AF4F:				; CODE XREF: Conv_PlayScript_5AA4E+4E1j
					; Conv_PlayScript_5AA4E+4E8j
		mov	[bp+var_6A+2], 0
		mov	byte ptr [bp+var_66+3],	0
		mov	[bp+var_62], 0

loc_5AF63:				; CODE XREF: Conv_PlayScript_5AA4E+476j
		mov	[bp+var_22E], 1244h
		push	[bp+var_21E+1]
		call	Heap_FreeAndCoalesce_2C3FC
		add	sp, 2
		jmp	loc_5B016
; ���������������������������������������������������������������������������

loc_5AF78:				; CODE XREF: Conv_PlayScript_5AA4E+395j
					; Conv_PlayScript_5AA4E+3A1j
		mov	ax, [di]
		add	ax, [di+8]
		cmp	ax, [di+4]
		ja	short loc_5AF87
		mov	ax, 1
		jmp	short loc_5AF89
; ���������������������������������������������������������������������������

loc_5AF87:				; CODE XREF: Conv_PlayScript_5AA4E+532j
		xor	ax, ax

loc_5AF89:				; CODE XREF: Conv_PlayScript_5AA4E+537j
		mov	ah, 0
		or	ax, ax
		jz	short loc_5AF92
		jmp	loc_5B014
; ���������������������������������������������������������������������������

loc_5AF92:				; CODE XREF: Conv_PlayScript_5AA4E+53Fj
		les	bx, [di+4]
		cmp	byte ptr es:[bx], 0Ah
		jnz	short loc_5B014
		inc	word ptr [di+4]
		mov	word ptr [bp+var_62], 1254h
		mov	byte ptr [bp+var_62+2],	0Ah
		mov	word ptr [bp+var_62], 123Ch
		mov	word ptr [bp+var_5E], 0
		push	di
		lea	ax, [bp+var_62]
		push	ax
		call	ConvRec_ReadNarration_65E8
		add	sp, 4
		mov	al, [bp+var_41]
		mov	ah, 0
		shl	ax, 1
		lea	dx, [bp+var_1BC]
		add	ax, dx
		mov	bx, ax
		mov	word ptr [bx], 0
		push	word ptr [bp+var_5E]
		call	CRT_Strdup
		add	sp, 2
		mov	dl, [bp+var_41]
		mov	dh, 0
		shl	dx, 1
		lea	bx, [bp+var_1E4]
		add	dx, bx
		mov	bx, dx
		mov	[bx], ax
		mov	al, [bp+var_41]
		mov	ah, 0
		lea	dx, [bp+var_1F8]
		add	ax, dx
		mov	dl, byte ptr [bp+var_62+3]
		mov	bx, ax
		mov	[bx], dl
		inc	[bp+var_41]
		mov	word ptr [bp+var_62], 123Ch
		push	word ptr [bp+var_5E]
		call	Heap_FreeAndCoalesce_2C3FC
		add	sp, 2
		jmp	short loc_5B016
; ���������������������������������������������������������������������������

loc_5B014:				; CODE XREF: Conv_PlayScript_5AA4E+541j
					; Conv_PlayScript_5AA4E+54Bj
		jmp	short loc_5B019
; ���������������������������������������������������������������������������

loc_5B016:				; CODE XREF: Conv_PlayScript_5AA4E+527j
					; Conv_PlayScript_5AA4E+5C4j
		jmp	loc_5ADCC
; ���������������������������������������������������������������������������

loc_5B019:				; CODE XREF: Conv_PlayScript_5AA4E:loc_5B014j
		mov	[bp+var_107], 0
		lea	ax, [bp+var_A]
		push	ax
		push	[bp+var_32]
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jz	short loc_5B064
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_30]
		mov	al, byte ptr [bp+var_2E]
		push	ax
		lea	ax, [bp+var_30]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	[bp+var_32]
		lea	ax, [bp+var_A]
		push	ax
		call	CRT_Strcpy
		add	sp, 4

loc_5B064:				; CODE XREF: Conv_PlayScript_5AA4E+5E2j
		mov	[bp+var_4A], 0
		mov	[bp+var_48], 98h ; '�'
		mov	[bp+var_46], 13Fh
		mov	[bp+var_44], 0C7h ; '�'
		mov	ax, [bp+var_4A]
		mov	[bp+var_52], ax
		mov	ax, [bp+var_48]
		mov	[bp+var_50], ax
		mov	ax, [bp+var_46]
		mov	[bp+var_4E], ax
		mov	ax, [bp+var_44]
		mov	[bp+var_4C], ax
		mov	ax, word_46F46
		mov	[bp+var_54], ax
		mov	ax, di
		add	ax, 2Ch	; ','
		mov	[bp+var_56], ax
		push	[bp+var_56]
		push	[bp+var_54]
		lea	ax, [bp+var_21A]
		push	ax
		call	Widget_ApplyStyleAndAllocate_3144B
		add	sp, 6
		mov	[bp+var_21A], 1218h
		mov	ax, [bp+var_50]
		mov	[bp+var_58], ax
		mov	ax, [bp+var_4E]
		mov	[bp+var_5A], ax
		mov	ax, [bp+var_4C]
		mov	word ptr [bp+var_5E+2],	ax
		mov	ax, [bp+var_52]
		mov	[bp+var_201], ax
		mov	ax, [bp+var_58]
		mov	[bp+var_1FF], ax
		mov	ax, [bp+var_5A]
		mov	[bp+var_1FD], ax
		mov	ax, word ptr [bp+var_5E+2]
		mov	[bp+var_1FB], ax
		cmp	[bp+var_41], 0
		jnz	short loc_5B0EE
		jmp	loc_5B249
; ���������������������������������������������������������������������������

loc_5B0EE:				; CODE XREF: Conv_PlayScript_5AA4E+69Bj
		xor	si, si
		jmp	loc_5B219
; ���������������������������������������������������������������������������

loc_5B0F3:				; CODE XREF: Conv_PlayScript_5AA4E+7D4j
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_1BC]
		add	bx, ax
		cmp	word ptr [bx], 0
		jz	short loc_5B122
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_1E4]
		add	bx, ax
		push	word ptr [bx]
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_1BC]
		add	bx, ax
		push	word ptr [bx]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4

loc_5B122:				; CODE XREF: Conv_PlayScript_5AA4E+6B2j
		mov	[bp+var_227+1],	11BCh
		mov	[bp+var_227+1],	11C8h
		mov	[bp+var_227+1],	11D8h
		mov	[bp+var_227+1],	11E8h
		mov	[bp+var_227+1],	11FCh
		lea	ax, [bp+var_218]
		push	ax
		push	0
		push	[bp+var_1FB]
		push	[bp+var_1FD]
		push	[bp+var_1FF]
		push	[bp+var_201]
		lea	ax, [bp+var_227+1]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		mov	al, byte ptr [bp+si+var_1F8]
		mov	byte ptr [bp+var_5E+1],	al
		lea	ax, [bp+var_5E+1]
		push	ax
		mov	ax, di
		add	ax, 2Ch	; ','
		push	ax
		mov	bx, [di+2Ch]
		call	dword ptr [bx+10h]
		add	sp, 4
		mov	al, byte_495FC
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5B1A0
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_1E4]
		add	bx, ax
		push	word ptr [bx]
		lea	ax, [bp+var_21A]
		push	ax
		push	di
		push	cs
		call	near ptr Conv_DrawText_59F54
		add	sp, 6

loc_5B1A0:				; CODE XREF: Conv_PlayScript_5AA4E+737j
		call	Input_Flush_CDDC
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_1BC]
		add	bx, ax
		cmp	word ptr [bx], 0
		jz	short loc_5B1EA
		jmp	short loc_5B1CE
; ���������������������������������������������������������������������������

loc_5B1B6:				; CODE XREF: Conv_PlayScript_5AA4E+798j
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_5B1C1
		jmp	short loc_5B1E8
; ���������������������������������������������������������������������������

loc_5B1C1:				; CODE XREF: Conv_PlayScript_5AA4E+76Fj
		lea	ax, [bp+var_124]
		push	ax
		call	LayerGroup_PlayFrame_2DD86
		add	sp, 2

loc_5B1CE:				; CODE XREF: Conv_PlayScript_5AA4E+766j
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_1BC]
		add	bx, ax
		push	word ptr [bx]
		call	TalkingHead_IsLipTextDone_A0D5
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jz	short loc_5B1B6

loc_5B1E8:				; CODE XREF: Conv_PlayScript_5AA4E+771j
		jmp	short loc_5B218
; ���������������������������������������������������������������������������

loc_5B1EA:				; CODE XREF: Conv_PlayScript_5AA4E+764j
		jmp	short loc_5B204
; ���������������������������������������������������������������������������

loc_5B1EC:				; CODE XREF: Conv_PlayScript_5AA4E+7C8j
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_5B1F7
		jmp	short loc_5B218
; ���������������������������������������������������������������������������

loc_5B1F7:				; CODE XREF: Conv_PlayScript_5AA4E+7A5j
		lea	ax, [bp+var_124]
		push	ax
		call	LayerGroup_PlayFrame_2DD86
		add	sp, 2

loc_5B204:				; CODE XREF: Conv_PlayScript_5AA4E:loc_5B1EAj
		cmp	[bp+var_107], 28h ; '('
		jb	short loc_5B210
		mov	ax, 1
		jmp	short loc_5B212
; ���������������������������������������������������������������������������

loc_5B210:				; CODE XREF: Conv_PlayScript_5AA4E+7BBj
		xor	ax, ax

loc_5B212:				; CODE XREF: Conv_PlayScript_5AA4E+7C0j
		mov	ah, 0
		or	ax, ax
		jz	short loc_5B1EC

loc_5B218:				; CODE XREF: Conv_PlayScript_5AA4E:loc_5B1E8j
					; Conv_PlayScript_5AA4E+7A7j
		inc	si

loc_5B219:				; CODE XREF: Conv_PlayScript_5AA4E+6A2j
		mov	al, [bp+var_41]
		mov	ah, 0
		cmp	ax, si
		jle	short loc_5B225
		jmp	loc_5B0F3
; ���������������������������������������������������������������������������

loc_5B225:				; CODE XREF: Conv_PlayScript_5AA4E+7D2j
		xor	si, si
		jmp	short loc_5B23E
; ���������������������������������������������������������������������������

loc_5B229:				; CODE XREF: Conv_PlayScript_5AA4E+7F7j
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_1E4]
		add	bx, ax
		push	word ptr [bx]
		call	Heap_FreeAndCoalesce_2C3FC
		add	sp, 2
		inc	si

loc_5B23E:				; CODE XREF: Conv_PlayScript_5AA4E+7D9j
		mov	al, [bp+var_41]
		mov	ah, 0
		cmp	ax, si
		jg	short loc_5B229
		jmp	short loc_5B2B3
; ���������������������������������������������������������������������������

loc_5B249:				; CODE XREF: Conv_PlayScript_5AA4E+69Dj
		lea	ax, [bp+var_A]
		push	ax
		push	[bp+var_32]
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jz	short loc_5B280
		push	0
		push	[bp+var_30]
		mov	al, byte ptr [bp+var_2E]
		push	ax
		lea	ax, [bp+var_30]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	[bp+var_32]
		lea	ax, [bp+var_A]
		push	ax
		call	CRT_Strcpy
		add	sp, 4

loc_5B280:				; CODE XREF: Conv_PlayScript_5AA4E+80Cj
		call	Input_Flush_CDDC
		jmp	short loc_5B29F
; ���������������������������������������������������������������������������

loc_5B287:				; CODE XREF: Conv_PlayScript_5AA4E+863j
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_5B292
		jmp	short loc_5B2B3
; ���������������������������������������������������������������������������

loc_5B292:				; CODE XREF: Conv_PlayScript_5AA4E+840j
		lea	ax, [bp+var_124]
		push	ax
		call	LayerGroup_PlayFrame_2DD86
		add	sp, 2

loc_5B29F:				; CODE XREF: Conv_PlayScript_5AA4E+837j
		cmp	[bp+var_107], 14h
		jb	short loc_5B2AB
		mov	ax, 1
		jmp	short loc_5B2AD
; ���������������������������������������������������������������������������

loc_5B2AB:				; CODE XREF: Conv_PlayScript_5AA4E+856j
		xor	ax, ax

loc_5B2AD:				; CODE XREF: Conv_PlayScript_5AA4E+85Bj
		mov	ah, 0
		or	ax, ax
		jz	short loc_5B287

loc_5B2B3:				; CODE XREF: Conv_PlayScript_5AA4E+7F9j
					; Conv_PlayScript_5AA4E+842j
		push	seg stub188
		push	offset Stub_ResourceHandle_Destruct_42090
		push	19h
		push	0
		push	0Ah
		push	[bp+var_34]
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg stub188
		push	offset Stub_ResourceHandle_Destruct_42090
		push	19h
		push	0
		push	0Ah
		push	[bp+var_36]
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	[bp+var_38]
		call	sub_308
		add	sp, 2
		lea	ax, [bp+var_218]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	seg stub188
		push	offset Stub_ResourceHandle_Destruct_42090
		push	1
		push	0Ah
		push	0Ah
		lea	ax, [bp+var_194]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		lea	ax, [bp+var_124]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		push	0
		lea	ax, [bp+var_30]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_2A]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		jmp	loc_5CDEF
; ���������������������������������������������������������������������������

loc_5B340:				; CODE XREF: Conv_PlayScript_5AA4E+4Aj
					; DATA XREF: ovr191:off_5CE29o
		cmp	byte_495FC, 0	; case 0x3
		jz	short loc_5B34B
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_5B34B:				; CODE XREF: Conv_PlayScript_5AA4E+8F7j
		call	Input_Flush_CDDC
		mov	ax, di
		add	ax, 1Ah
		push	ax
		lea	ax, [bp+var_2A]
		push	ax
		call	SmallObject_RegisterInList_2CB40
		add	sp, 4
		push	100h
		push	0
		lea	ax, [bp+var_30]
		push	ax
		call	Palette_Alloc_2CC76
		add	sp, 6
		mov	ax, di
		add	ax, 0Ch
		push	ax
		push	0
		push	0Ah
		lea	ax, [bp+var_124]
		push	ax
		call	LayerGroup_Construct_2DC66
		add	sp, 8
		mov	[bp+var_38], 0
		mov	[bp+var_36], 98h ; '�'
		mov	[bp+var_34], 13Fh
		mov	[bp+var_32], 0C7h ; '�'
		mov	ax, [bp+var_38]
		mov	[bp+var_40], ax
		mov	ax, [bp+var_36]
		mov	[bp-3Eh], ax
		mov	ax, [bp+var_34]
		mov	[bp+var_3C], ax
		mov	ax, [bp+var_32]
		mov	[bp-3Ah], ax
		mov	ax, word_46F46
		mov	[bp-42h], ax
		mov	ax, di
		add	ax, 2Ch	; ','
		mov	[bp+var_44], ax
		push	[bp+var_44]
		push	word ptr [bp-42h]
		lea	ax, [bp+var_146]
		push	ax
		call	Widget_ApplyStyleAndAllocate_3144B
		add	sp, 6
		mov	[bp+var_146], 1218h
		mov	ax, [bp-3Eh]
		mov	[bp+var_46], ax
		mov	ax, [bp+var_3C]
		mov	[bp+var_48], ax
		mov	ax, [bp-3Ah]
		mov	[bp+var_4A], ax
		mov	ax, [bp+var_40]
		mov	[bp+var_12D], ax
		mov	ax, [bp+var_46]
		mov	[bp+var_12B], ax
		mov	ax, [bp+var_48]
		mov	[bp+var_129], ax
		mov	ax, [bp+var_4A]
		mov	[bp+var_127], ax
		mov	[bp+var_164], 1254h
		mov	byte ptr [bp+var_162], 3
		mov	[bp+var_164], 11B4h
		mov	byte ptr [bp+var_148+1], 0
		mov	word ptr [bp+var_14C+2], 0
		push	di
		lea	ax, [bp+var_164]
		push	ax
		call	ConvRec_ReadLine_632E
		add	sp, 4
		lea	ax, [bp+var_158+1]
		mov	[bp+var_4C], ax
		lea	ax, [bp+var_52]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		lea	ax, [bp+var_4E]
		push	ax
		push	[bp+var_4C]
		push	di
		push	cs
		call	near ptr ConvData_LoadBackground_5A4E6
		add	sp, 0Ah
		mov	byte ptr [bp+var_54+1],	al
		mov	[bp+var_58], 0
		jmp	short loc_5B4A4
; ���������������������������������������������������������������������������

loc_5B45D:				; CODE XREF: Conv_PlayScript_5AA4E+A5Ej
		mov	ax, [bp+var_58]
		shl	ax, 1
		mov	bx, [bp+var_52]
		add	bx, ax
		push	word ptr [bx]
		push	0
		mov	ax, [bp+var_58]
		mov	dx, 0Ah
		imul	dx
		mov	dx, [bp+var_4E]
		add	dx, ax
		push	dx
		push	0
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	si, ax
		mov	al, byte ptr [bp+var_54+1]
		mov	ah, 0
		dec	ax
		cmp	ax, [bp+var_58]
		jnz	short loc_5B493
		mov	[bp+var_56], si

loc_5B493:				; CODE XREF: Conv_PlayScript_5AA4E+A40j
		push	si
		lea	ax, [bp+var_124]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		inc	[bp+var_58]

loc_5B4A4:				; CODE XREF: Conv_PlayScript_5AA4E+A0Dj
		mov	al, byte ptr [bp+var_54+1]
		mov	ah, 0
		cmp	ax, [bp+var_58]
		jg	short loc_5B45D
		mov	[bp+var_58], 0
		jmp	short loc_5B4FE
; ���������������������������������������������������������������������������

loc_5B4B5:				; CODE XREF: Conv_PlayScript_5AA4E+AB8j
		mov	ax, [bp+var_58]
		mov	dx, 0Ah
		imul	dx
		mov	dx, [bp+var_50]
		add	dx, ax
		mov	si, dx
		mov	word ptr [bp+var_7A+1],	0
		push	si
		lea	ax, [bp+var_7D+1]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		push	[bp+var_7D+1]
		mov	al, byte ptr [bp+var_7A]
		push	ax
		lea	ax, [bp+var_7D+1]
		push	ax
		lea	ax, [bp+var_30]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	2
		lea	ax, [bp+var_7D+1]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		inc	[bp+var_58]

loc_5B4FE:				; CODE XREF: Conv_PlayScript_5AA4E+A65j
		mov	al, byte ptr [bp+var_54+1]
		mov	ah, 0
		cmp	ax, [bp+var_58]
		jg	short loc_5B4B5
		lea	ax, [bp+var_162+1]
		mov	[bp+var_5A], ax
		mov	[bp+var_66+2], 0
		mov	byte ptr [bp+var_62+2],	2
		mov	byte ptr [bp+var_62+3],	0
		mov	[bp+var_5E], 0
		push	3
		lea	ax, [bp+var_66+2]
		push	ax
		push	[bp+var_5A]
		push	di
		push	cs
		call	near ptr ConvData_FindFace_5A451
		add	sp, 8
		mov	[bp+var_6E], 0
		mov	byte ptr [bp+var_6A], 2
		mov	byte ptr [bp+var_6A+1],	0
		mov	[bp+var_6A+2], 0
		push	0
		push	2
		lea	ax, [bp+var_6E]
		push	ax
		push	di
		push	cs
		call	near ptr ConvData_FindFacePalette_5A46F
		add	sp, 8
		push	word ptr [bp+var_14C]
		push	[bp+var_14E]
		lea	ax, [bp+var_66+2]
		push	ax
		push	0
		call	TalkingHead_Construct_98F4
		add	sp, 8
		mov	[bp+var_70], ax
		push	[bp+var_70]
		lea	ax, [bp+var_124]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		mov	al, byte ptr [bp+var_158]
		cbw
		push	ax
		push	[bp+var_70]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		mov	[bp+var_73], 0
		lea	ax, [bp+var_6E]
		push	ax
		lea	ax, [bp-76h]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		push	word ptr [bp-76h]
		mov	al, [bp-74h]
		push	ax
		lea	ax, [bp-76h]
		push	ax
		lea	ax, [bp+var_30]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+var_4C]
		lea	ax, [bp+var_A]
		push	ax
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_5B5EC
		push	[bp+var_5A]
		lea	ax, [bp+var_14]
		push	ax
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jz	short loc_5B62F

loc_5B5EC:				; CODE XREF: Conv_PlayScript_5AA4E+B89j
		push	0
		mov	ax, di
		add	ax, 0Ch
		push	ax
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_30]
		mov	al, byte ptr [bp+var_2E]
		push	ax
		lea	ax, [bp+var_30]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		push	[bp+var_4C]
		lea	ax, [bp+var_A]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		push	[bp+var_5A]
		lea	ax, [bp+var_14]
		push	ax
		call	CRT_Strcpy
		add	sp, 4

loc_5B62F:				; CODE XREF: Conv_PlayScript_5AA4E+B9Cj
		mov	ax, [di]
		add	ax, [di+8]
		cmp	ax, [di+4]
		ja	short loc_5B63E
		mov	ax, 1
		jmp	short loc_5B640
; ���������������������������������������������������������������������������

loc_5B63E:				; CODE XREF: Conv_PlayScript_5AA4E+BE9j
		xor	ax, ax

loc_5B640:				; CODE XREF: Conv_PlayScript_5AA4E+BEEj
		mov	ah, 0
		or	ax, ax
		jz	short loc_5B649
		jmp	loc_5B75C
; ���������������������������������������������������������������������������

loc_5B649:				; CODE XREF: Conv_PlayScript_5AA4E+BF6j
		les	bx, [di+4]
		cmp	byte ptr es:[bx], 0Ah
		jz	short loc_5B655
		jmp	loc_5B75C
; ���������������������������������������������������������������������������

loc_5B655:				; CODE XREF: Conv_PlayScript_5AA4E+C02j
					; Conv_PlayScript_5AA4E+D08j
		inc	word ptr [di+4]
		mov	[bp+var_7D+1], 1254h
		mov	byte ptr [bp+var_7A], 0Ah
		mov	[bp+var_7D+1], 123Ch
		mov	word ptr [bp+var_7A+2],	0
		push	di
		lea	ax, [bp+var_7D+1]
		push	ax
		call	ConvRec_ReadNarration_65E8
		add	sp, 4
		mov	[bp+var_17C], 11BCh
		mov	[bp+var_17C], 11C8h
		mov	[bp+var_17C], 11D8h
		mov	[bp+var_17C], 11E8h
		mov	[bp+var_17C], 11FCh
		lea	ax, [bp+var_144]
		push	ax
		push	0
		push	[bp+var_127]
		push	[bp+var_129]
		push	[bp+var_12B]
		push	[bp+var_12D]
		lea	ax, [bp+var_17C]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		mov	al, byte ptr [bp+var_7A+1]
		mov	byte ptr [bp+var_7D], al
		lea	ax, [bp+var_7D]
		push	ax
		mov	ax, di
		add	ax, 2Ch	; ','
		push	ax
		mov	bx, [di+2Ch]
		call	dword ptr [bx+10h]
		add	sp, 4
		mov	si, word ptr [bp+var_7A+2]
		mov	al, byte_495FC
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5B6ED
		push	si
		lea	ax, [bp+var_146]
		push	ax
		push	di
		push	cs
		call	near ptr Conv_DrawText_59F54
		add	sp, 6

loc_5B6ED:				; CODE XREF: Conv_PlayScript_5AA4E+C8Fj
		mov	[bp+var_107], 0
		call	Input_Flush_CDDC
		jmp	short loc_5B712
; ���������������������������������������������������������������������������

loc_5B6FA:				; CODE XREF: Conv_PlayScript_5AA4E+CD6j
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_5B705
		jmp	short loc_5B726
; ���������������������������������������������������������������������������

loc_5B705:				; CODE XREF: Conv_PlayScript_5AA4E+CB3j
		lea	ax, [bp+var_124]
		push	ax
		call	LayerGroup_PlayFrame_2DD86
		add	sp, 2

loc_5B712:				; CODE XREF: Conv_PlayScript_5AA4E+CAAj
		cmp	[bp+var_107], 14h
		jb	short loc_5B71E
		mov	ax, 1
		jmp	short loc_5B720
; ���������������������������������������������������������������������������

loc_5B71E:				; CODE XREF: Conv_PlayScript_5AA4E+CC9j
		xor	ax, ax

loc_5B720:				; CODE XREF: Conv_PlayScript_5AA4E+CCEj
		mov	ah, 0
		or	ax, ax
		jz	short loc_5B6FA

loc_5B726:				; CODE XREF: Conv_PlayScript_5AA4E+CB5j
		mov	[bp+var_7D+1], 123Ch
		push	word ptr [bp+var_7A+2]
		call	Heap_FreeAndCoalesce_2C3FC
		add	sp, 2
		mov	ax, [di]
		add	ax, [di+8]
		cmp	ax, [di+4]
		ja	short loc_5B745
		mov	ax, 1
		jmp	short loc_5B747
; ���������������������������������������������������������������������������

loc_5B745:				; CODE XREF: Conv_PlayScript_5AA4E+CF0j
		xor	ax, ax

loc_5B747:				; CODE XREF: Conv_PlayScript_5AA4E+CF5j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5B759
		les	bx, [di+4]
		cmp	byte ptr es:[bx], 0Ah
		jnz	short loc_5B759
		jmp	loc_5B655
; ���������������������������������������������������������������������������

loc_5B759:				; CODE XREF: Conv_PlayScript_5AA4E+CFDj
					; Conv_PlayScript_5AA4E+D06j
		jmp	loc_5BEA5
; ���������������������������������������������������������������������������

loc_5B75C:				; CODE XREF: Conv_PlayScript_5AA4E+BF8j
					; Conv_PlayScript_5AA4E+C04j
		mov	[bp+var_170], 11BCh
		mov	[bp+var_170], 11C8h
		mov	[bp+var_170], 11D8h
		mov	[bp+var_170], 11E8h
		mov	[bp+var_170], 11FCh
		lea	ax, [bp+var_144]
		push	ax
		push	0
		push	[bp+var_127]
		push	[bp+var_129]
		push	[bp+var_12B]
		push	[bp+var_12D]
		lea	ax, [bp+var_170]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		mov	al, byte ptr [bp+var_148]
		mov	byte ptr [bp+var_7A+3],	al
		lea	ax, [bp+var_7A+3]
		push	ax
		mov	ax, di
		add	ax, 2Ch	; ','
		push	ax
		mov	bx, [di+2Ch]
		call	dword ptr [bx+10h]
		add	sp, 4
		mov	ax, word ptr [bp+var_14C+2]
		mov	word ptr [bp+var_7A], ax
		mov	al, byte_495FC
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5B7D8
		push	word ptr [bp+var_7A]
		lea	ax, [bp+var_146]
		push	ax
		push	di
		push	cs
		call	near ptr Conv_DrawText_59F54
		add	sp, 6

loc_5B7D8:				; CODE XREF: Conv_PlayScript_5AA4E+D78j
		push	word ptr [bp+var_14C+2]
		push	[bp+var_70]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4
		call	Input_Flush_CDDC
		jmp	short loc_5B80B
; ���������������������������������������������������������������������������

loc_5B7EE:				; CODE XREF: Conv_PlayScript_5AA4E+DCCj
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_5B7FE
		inc	[bp+var_26]
		jmp	short loc_5B81C
; ���������������������������������������������������������������������������
		jmp	short loc_5B80B
; ���������������������������������������������������������������������������

loc_5B7FE:				; CODE XREF: Conv_PlayScript_5AA4E+DA7j
		lea	ax, [bp+var_124]
		push	ax
		call	LayerGroup_PlayFrame_2DD86
		add	sp, 2

loc_5B80B:				; CODE XREF: Conv_PlayScript_5AA4E+D9Ej
					; Conv_PlayScript_5AA4E+DAEj
		push	[bp+var_70]
		call	TalkingHead_IsLipTextDone_A0D5
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jz	short loc_5B7EE

loc_5B81C:				; CODE XREF: Conv_PlayScript_5AA4E+DACj
		mov	[bp+var_7D+1], 28h ; '('
		push	word ptr [bp+var_14C+2]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jnz	short loc_5B836
		mov	[bp+var_7D+1], 0Fh

loc_5B836:				; CODE XREF: Conv_PlayScript_5AA4E+DE1j
		mov	al, [bp+var_26]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5B877
		mov	[bp+var_107], 0
		jmp	short loc_5B861
; ���������������������������������������������������������������������������

loc_5B847:				; CODE XREF: Conv_PlayScript_5AA4E+E27j
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_5B854
		jmp	short loc_5B877
; ���������������������������������������������������������������������������
		jmp	short loc_5B861
; ���������������������������������������������������������������������������

loc_5B854:				; CODE XREF: Conv_PlayScript_5AA4E+E00j
		lea	ax, [bp+var_124]
		push	ax
		call	LayerGroup_PlayFrame_2DD86
		add	sp, 2

loc_5B861:				; CODE XREF: Conv_PlayScript_5AA4E+DF7j
					; Conv_PlayScript_5AA4E+E04j
		mov	ax, [bp+var_107]
		cmp	ax, [bp+var_7D+1]
		jb	short loc_5B86F
		mov	ax, 1
		jmp	short loc_5B871
; ���������������������������������������������������������������������������

loc_5B86F:				; CODE XREF: Conv_PlayScript_5AA4E+E1Aj
		xor	ax, ax

loc_5B871:				; CODE XREF: Conv_PlayScript_5AA4E+E1Fj
		mov	ah, 0
		or	ax, ax
		jz	short loc_5B847

loc_5B877:				; CODE XREF: Conv_PlayScript_5AA4E+DEFj
					; Conv_PlayScript_5AA4E+E02j
		jmp	loc_5BE76
; ���������������������������������������������������������������������������

loc_5B87A:				; CODE XREF: Conv_PlayScript_5AA4E+1448j
					; Conv_PlayScript_5AA4E+1454j
		call	Input_Flush_CDDC
		jmp	loc_5B974
; ���������������������������������������������������������������������������

loc_5B882:				; CODE XREF: Conv_PlayScript_5AA4E+F46j
		inc	word ptr [di+4]
		push	di
		lea	ax, [bp+var_164]
		push	ax
		call	ConvRec_ReadLine_632E
		add	sp, 4
		mov	[bp+var_17C], 11BCh
		mov	[bp+var_17C], 11C8h
		mov	[bp+var_17C], 11D8h
		mov	[bp+var_17C], 11E8h
		mov	[bp+var_17C], 11FCh
		lea	ax, [bp+var_144]
		push	ax
		push	0
		push	[bp+var_127]
		push	[bp+var_129]
		push	[bp+var_12B]
		push	[bp+var_12D]
		lea	ax, [bp+var_17C]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		mov	si, word ptr [bp+var_14C+2]
		mov	al, byte_495FC
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5B8F0
		push	si
		lea	ax, [bp+var_146]
		push	ax
		push	di
		push	cs
		call	near ptr Conv_DrawText_59F54
		add	sp, 6

loc_5B8F0:				; CODE XREF: Conv_PlayScript_5AA4E+E92j
		mov	[bp+var_107], 0
		push	word ptr [bp+var_14C+2]
		push	[bp+var_70]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4
		jmp	short loc_5B924
; ���������������������������������������������������������������������������

loc_5B907:				; CODE XREF: Conv_PlayScript_5AA4E+EE5j
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_5B917
		inc	[bp+var_26]
		jmp	short loc_5B935
; ���������������������������������������������������������������������������
		jmp	short loc_5B924
; ���������������������������������������������������������������������������

loc_5B917:				; CODE XREF: Conv_PlayScript_5AA4E+EC0j
		lea	ax, [bp+var_124]
		push	ax
		call	LayerGroup_PlayFrame_2DD86
		add	sp, 2

loc_5B924:				; CODE XREF: Conv_PlayScript_5AA4E+EB7j
					; Conv_PlayScript_5AA4E+EC7j
		push	[bp+var_70]
		call	TalkingHead_IsLipTextDone_A0D5
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jz	short loc_5B907

loc_5B935:				; CODE XREF: Conv_PlayScript_5AA4E+EC5j
		mov	al, [bp+var_26]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5B974
		mov	[bp+var_107], 0
		jmp	short loc_5B960
; ���������������������������������������������������������������������������

loc_5B946:				; CODE XREF: Conv_PlayScript_5AA4E+F24j
		call	Input_CheckSkip_D24A
		or	al, al
		jz	short loc_5B953
		jmp	short loc_5B974
; ���������������������������������������������������������������������������
		jmp	short loc_5B960
; ���������������������������������������������������������������������������

loc_5B953:				; CODE XREF: Conv_PlayScript_5AA4E+EFFj
		lea	ax, [bp+var_124]
		push	ax
		call	LayerGroup_PlayFrame_2DD86
		add	sp, 2

loc_5B960:				; CODE XREF: Conv_PlayScript_5AA4E+EF6j
					; Conv_PlayScript_5AA4E+F03j
		cmp	[bp+var_107], 28h ; '('
		jb	short loc_5B96C
		mov	ax, 1
		jmp	short loc_5B96E
; ���������������������������������������������������������������������������

loc_5B96C:				; CODE XREF: Conv_PlayScript_5AA4E+F17j
		xor	ax, ax

loc_5B96E:				; CODE XREF: Conv_PlayScript_5AA4E+F1Cj
		mov	ah, 0
		or	ax, ax
		jz	short loc_5B946

loc_5B974:				; CODE XREF: Conv_PlayScript_5AA4E+E31j
					; Conv_PlayScript_5AA4E+EEEj ...
		mov	ax, [di]
		add	ax, [di+8]
		cmp	ax, [di+4]
		ja	short loc_5B983
		mov	ax, 1
		jmp	short loc_5B985
; ���������������������������������������������������������������������������

loc_5B983:				; CODE XREF: Conv_PlayScript_5AA4E+F2Ej
		xor	ax, ax

loc_5B985:				; CODE XREF: Conv_PlayScript_5AA4E+F33j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5B997
		les	bx, [di+4]
		cmp	byte ptr es:[bx], 4
		jnz	short loc_5B997
		jmp	loc_5B882
; ���������������������������������������������������������������������������

loc_5B997:				; CODE XREF: Conv_PlayScript_5AA4E+F3Bj
					; Conv_PlayScript_5AA4E+F44j
		mov	ax, [di]
		add	ax, [di+8]
		cmp	ax, [di+4]
		ja	short loc_5B9A6
		mov	ax, 1
		jmp	short loc_5B9A8
; ���������������������������������������������������������������������������

loc_5B9A6:				; CODE XREF: Conv_PlayScript_5AA4E+F51j
		xor	ax, ax

loc_5B9A8:				; CODE XREF: Conv_PlayScript_5AA4E+F56j
		mov	ah, 0
		or	ax, ax
		jz	short loc_5B9B1
		jmp	loc_5BE76
; ���������������������������������������������������������������������������

loc_5B9B1:				; CODE XREF: Conv_PlayScript_5AA4E+F5Ej
		les	bx, [di+4]
		cmp	byte ptr es:[bx], 0Bh
		jz	short loc_5B9BD
		jmp	loc_5BE76
; ���������������������������������������������������������������������������

loc_5B9BD:				; CODE XREF: Conv_PlayScript_5AA4E+F6Aj
		call	Input_Flush_CDDC
		inc	word ptr [di+4]
		mov	word ptr [bp+var_82], 1254h
		mov	byte ptr [bp+var_82+2],	0Bh
		mov	word ptr [bp+var_82], 11ACh
		push	di
		lea	ax, [bp+var_82]
		push	ax
		call	ConvRec_ReadAcceptSkip_6660
		add	sp, 4
		mov	[bp+var_188], 11BCh
		mov	[bp+var_188], 11C8h
		mov	[bp+var_188], 11D8h
		mov	[bp+var_188], 11E8h
		mov	[bp+var_188], 11FCh
		lea	ax, [bp+var_144]
		push	ax
		push	0
		push	[bp+var_127]
		push	[bp+var_129]
		push	[bp+var_12B]
		push	[bp+var_12D]
		lea	ax, [bp+var_188]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		mov	ax, di
		add	ax, 1Ah
		push	ax
		lea	ax, [bp+var_86]
		push	ax
		call	SmallObject_RegisterInList_2CB40
		add	sp, 4
		mov	ax, di
		add	ax, 2Ch	; ','
		push	ax
		mov	ax, di
		add	ax, 1Ah
		push	ax
		lea	ax, [bp+var_1A2]
		push	ax
		call	Widget_ApplyStyleAndAllocate_3144B
		add	sp, 6
		push	35h ; '5'
		push	[bp+var_70]
		call	TalkingHead_SetBaseFrame_9D32
		add	sp, 4
		push	1079h
		push	[bp+var_70]
		call	TalkingHead_SetLipText_9C4F
		add	sp, 4
		lea	ax, [bp+var_124]
		push	ax
		call	LayerGroup_PlayFrame_2DD86
		add	sp, 2
		push	0
		mov	ax, di
		add	ax, 1Ah
		push	ax
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		mov	ax, di
		add	ax, 1Ah
		mov	[bp+var_88], ax
		mov	[bp+var_1B0], 0
		mov	[bp+var_1AE], 0
		push	[bp+var_88]
		lea	ax, [bp+var_1B0]
		push	ax
		call	TextFormat_ApplyStyleAttribute_2E9A4
		add	sp, 4
		mov	ax, word_46F46
		mov	[bp+var_8A], ax
		mov	[bp+var_1BE], 0
		mov	[bp+var_1BC], 0
		push	[bp+var_8A]
		lea	ax, [bp+var_1BE]
		push	ax
		call	TextFormat_ApplyStyleAttribute_2E9A4
		add	sp, 4
		mov	word ptr [di+10h], 0
		mov	word ptr [di+12h], 0
		mov	word ptr [di+14h], 13Fh
		mov	word ptr [di+16h], 0C7h	; '�'
		push	18h
		push	0
		push	[bp+var_56]
		mov	bx, [bp+var_56]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	18h
		push	0
		push	[bp+var_70]
		mov	bx, [bp+var_70]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	[bp+var_56]
		mov	bx, [bp+var_56]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		add	sp, 2
		push	[bp+var_70]
		mov	bx, [bp+var_70]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		add	sp, 2
		mov	si, 1
		jmp	short loc_5BB9F
; ���������������������������������������������������������������������������

loc_5BB2C:				; CODE XREF: Conv_PlayScript_5AA4E+1154j
		mov	ax, 18h
		sub	ax, si
		mov	[bp+var_8C], ax
		mov	ax, si
		shl	ax, 1
		add	ax, 97h	; '�'
		mov	[bp+var_8E], ax
		mov	[bp+var_1AC], 0
		mov	ax, [bp+var_8C]
		mov	[bp+var_1AA], ax
		mov	[bp+var_1A8], 13Fh
		mov	ax, [bp+var_8E]
		mov	[bp+var_1A6], ax
		mov	ax, 18h
		sub	ax, si
		mov	[bp+var_90], ax
		mov	ax, si
		shl	ax, 1
		add	ax, 97h	; '�'
		mov	[bp+var_92], ax
		mov	[bp+var_1BA], 0
		mov	ax, [bp+var_90]
		mov	[bp+var_1B8], ax
		mov	[bp+var_1B6], 13Fh
		mov	ax, [bp+var_92]
		mov	[bp+var_1B4], ax
		lea	ax, [bp+var_1B0]
		push	ax
		lea	ax, [bp+var_1BE]
		push	ax
		call	UI_ApplyEncodingHelper_2EC65
		add	sp, 4
		inc	si

loc_5BB9F:				; CODE XREF: Conv_PlayScript_5AA4E+10DCj
		cmp	si, 18h
		jle	short loc_5BB2C
		call	Input_Flush_CDDC
		call	TextScrollDisplayB_ApplyHelperC_3F74A
		mov	byte ptr [bp+var_9A], 0
		mov	[bp+var_9C], 0
		mov	[bp+var_9E], 0
		push	0Fh
		mov	ax, di
		add	ax, 2Ch	; ','
		push	ax
		mov	bx, [di+2Ch]
		call	dword ptr [bx+8]
		add	sp, 4
		xor	eax, eax
		mov	[bp+var_A2], eax
		mov	[bp+var_A6], eax
		mov	[bp+var_A2], 3
		mov	eax, dword_47ABB
		mov	[bp+var_A6], eax

loc_5BBEF:				; CODE XREF: Conv_PlayScript_5AA4E:loc_5BD35j
		lea	ax, [bp+var_9A]
		push	ax
		call	TextScroll_FormatAndApply_3EA28
		add	sp, 2
		cmp	byte ptr [bp+var_9A], 0
		jnz	short loc_5BC2C
		lea	ax, [bp+var_9A]
		push	ax
		call	sub_6DBF
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5BC2A
		lea	ax, [bp+var_AA]
		push	ax
		lea	ax, [bp+var_9A]
		push	ax
		call	sub_6BFB
		add	sp, 4
		jmp	short $+2

loc_5BC2A:				; CODE XREF: Conv_PlayScript_5AA4E+11C6j
		jmp	short $+2

loc_5BC2C:				; CODE XREF: Conv_PlayScript_5AA4E+11B3j
		cmp	byte ptr [bp+var_9A], 0
		jz	short loc_5BC43
		mov	ax, [bp+var_98]
		mov	[bp+var_9C], ax
		mov	ax, [bp+var_96]
		mov	[bp+var_9E], ax

loc_5BC43:				; CODE XREF: Conv_PlayScript_5AA4E+11E3j
		cmp	byte ptr [bp+var_9A], 2
		jnz	short loc_5BC4D
		jmp	loc_5BD38
; ���������������������������������������������������������������������������

loc_5BC4D:				; CODE XREF: Conv_PlayScript_5AA4E+11FAj
		mov	eax, [bp+var_A6]
		add	eax, [bp+var_A2]
		cmp	eax, dword_47ABB
		ja	short loc_5BC63
		mov	ax, 1
		jmp	short loc_5BC65
; ���������������������������������������������������������������������������

loc_5BC63:				; CODE XREF: Conv_PlayScript_5AA4E+120Ej
		xor	ax, ax

loc_5BC65:				; CODE XREF: Conv_PlayScript_5AA4E+1213j
		or	al, al
		jnz	short loc_5BC6C
		jmp	loc_5BD35
; ���������������������������������������������������������������������������

loc_5BC6C:				; CODE XREF: Conv_PlayScript_5AA4E+1219j
		mov	[bp+var_A2], 3
		mov	eax, dword_47ABB
		mov	[bp+var_A6], eax
		lea	ax, [bp+var_124]
		push	ax
		call	Scene_AdvanceFrame_2DE14
		add	sp, 2
		push	[bp+var_56]
		mov	bx, [bp+var_56]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		add	sp, 2
		push	[bp+var_70]
		mov	bx, [bp+var_70]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		add	sp, 2
		cmp	[bp+var_9C], 118h
		jge	short loc_5BCDD
		cmp	[bp+var_9C], 76h ; 'v'
		jl	short loc_5BCDD
		cmp	[bp+var_9E], 70h ; 'p'
		jle	short loc_5BCDD
		cmp	[bp+var_9E], 0C7h ; '�'
		jg	short loc_5BCDD
		push	107Ah
		lea	ax, [bp+var_1DC]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	bx, [di+2Ah]
		mov	byte ptr [bx], 1
		jmp	short loc_5BCF3
; ���������������������������������������������������������������������������

loc_5BCDD:				; CODE XREF: Conv_PlayScript_5AA4E+125Fj
					; Conv_PlayScript_5AA4E+1266j ...
		push	1089h
		lea	ax, [bp+var_1DC]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	bx, [di+2Ah]
		mov	byte ptr [bx], 0

loc_5BCF3:				; CODE XREF: Conv_PlayScript_5AA4E+128Dj
		lea	ax, [bp+var_1DC]
		push	ax
		push	0AFh ; '�'
		push	2
		push	1098h
		lea	ax, [bp+var_1A2]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_31A3B
		add	sp, 0Ah
		push	word_46F44
		call	sub_3F8CC
		add	sp, 2
		push	word_46F44
		push	word_46F46
		call	UI_ApplyEncodingHelper_2EC65
		add	sp, 4
		push	word_46F44
		call	sub_3F8DE
		add	sp, 2

loc_5BD35:				; CODE XREF: Conv_PlayScript_5AA4E+121Bj
		jmp	loc_5BBEF
; ���������������������������������������������������������������������������

loc_5BD38:				; CODE XREF: Conv_PlayScript_5AA4E+11FCj
		mov	bx, [di+2Ah]
		mov	al, [bx]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5BD51
		mov	ax, word ptr [bp+var_82+3]
		mov	[bp+var_AC], ax
		mov	ax, [bp+var_AC]
		add	[di+4],	ax

loc_5BD51:				; CODE XREF: Conv_PlayScript_5AA4E+12F3j
		call	TextScrollDisplayB_ApplyHelperD_3F784
		xor	si, si
		jmp	loc_5BE00
; ���������������������������������������������������������������������������

loc_5BD5B:				; CODE XREF: Conv_PlayScript_5AA4E+13B7j
		mov	[bp+var_B4], 0
		mov	[bp+var_B0], 1
		mov	eax, dword_47ABB
		mov	[bp+var_B4], eax
		jmp	short $+2

loc_5BD78:				; CODE XREF: Conv_PlayScript_5AA4E+1346j
		mov	eax, [bp+var_B4]
		add	eax, [bp+var_B0]
		cmp	eax, dword_47ABB
		ja	short loc_5BD8E
		mov	ax, 1
		jmp	short loc_5BD90
; ���������������������������������������������������������������������������

loc_5BD8E:				; CODE XREF: Conv_PlayScript_5AA4E+1339j
		xor	ax, ax

loc_5BD90:				; CODE XREF: Conv_PlayScript_5AA4E+133Ej
		mov	ah, 0
		or	ax, ax
		jz	short loc_5BD78
		push	0
		push	si
		push	13Fh
		push	si
		push	0
		mov	ax, di
		add	ax, 0Ch
		push	ax
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch
		push	0
		mov	ax, si
		shl	ax, 1
		mov	dx, 0C7h ; '�'
		sub	dx, ax
		push	dx
		push	13Fh
		mov	ax, si
		shl	ax, 1
		mov	dx, 0C7h ; '�'
		sub	dx, ax
		push	dx
		push	0
		mov	ax, di
		add	ax, 0Ch
		push	ax
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch
		push	0
		mov	ax, si
		shl	ax, 1
		mov	dx, 0C6h ; '�'
		sub	dx, ax
		push	dx
		push	13Fh
		mov	ax, si
		shl	ax, 1
		mov	dx, 0C6h ; '�'
		sub	dx, ax
		push	dx
		push	0
		mov	ax, di
		add	ax, 0Ch
		push	ax
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch
		inc	si

loc_5BE00:				; CODE XREF: Conv_PlayScript_5AA4E+130Aj
		cmp	si, 18h
		jge	short loc_5BE08
		jmp	loc_5BD5B
; ���������������������������������������������������������������������������

loc_5BE08:				; CODE XREF: Conv_PlayScript_5AA4E+13B5j
		push	0FFE8h
		push	0
		push	[bp+var_56]
		mov	bx, [bp+var_56]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	0FFE8h
		push	0
		push	[bp+var_70]
		mov	bx, [bp+var_70]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	word ptr [di+10h], 0
		mov	word ptr [di+12h], 18h
		mov	word ptr [di+14h], 13Fh
		mov	word ptr [di+16h], 97h ; '�'
		lea	ax, [bp+var_1BE]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_1B0]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_1A0]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_86]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4

loc_5BE76:				; CODE XREF: Conv_PlayScript_5AA4E:loc_5B877j
					; Conv_PlayScript_5AA4E+F60j ...
		mov	ax, [di]
		add	ax, [di+8]
		cmp	ax, [di+4]
		ja	short loc_5BE85
		mov	ax, 1
		jmp	short loc_5BE87
; ���������������������������������������������������������������������������

loc_5BE85:				; CODE XREF: Conv_PlayScript_5AA4E+1430j
		xor	ax, ax

loc_5BE87:				; CODE XREF: Conv_PlayScript_5AA4E+1435j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5BEA5
		les	bx, [di+4]
		cmp	byte ptr es:[bx], 4
		jnz	short loc_5BE99
		jmp	loc_5B87A
; ���������������������������������������������������������������������������

loc_5BE99:				; CODE XREF: Conv_PlayScript_5AA4E+1446j
		les	bx, [di+4]
		cmp	byte ptr es:[bx], 0Bh
		jnz	short loc_5BEA5
		jmp	loc_5B87A
; ���������������������������������������������������������������������������

loc_5BEA5:				; CODE XREF: Conv_PlayScript_5AA4E:loc_5B759j
					; Conv_PlayScript_5AA4E+143Dj ...
		push	seg stub188
		push	offset Stub_ResourceHandle_Destruct_42090
		push	19h
		push	0
		push	0Ah
		push	[bp+var_4E]
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg stub188
		push	offset Stub_ResourceHandle_Destruct_42090
		push	19h
		push	0
		push	0Ah
		push	[bp+var_50]
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	[bp+var_52]
		call	sub_308
		add	sp, 2
		push	2
		lea	ax, [bp-76h]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		cmp	byte ptr [bp+var_6A+1],	0
		jz	short loc_5BF10
		cmp	[bp+var_6E], 0
		jz	short loc_5BF10
		push	0
		mov	al, byte ptr [bp+var_6A]
		push	ax
		lea	ax, [bp+var_6E]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_5BF10:				; CODE XREF: Conv_PlayScript_5AA4E+14A2j
					; Conv_PlayScript_5AA4E+14A9j
		mov	[bp+var_6E], 0
		mov	byte ptr [bp+var_6A+1],	0
		mov	[bp+var_6A+2], 0
		cmp	byte ptr [bp+var_62+3],	0
		jz	short loc_5BF48
		cmp	[bp+var_66+2], 0
		jz	short loc_5BF48
		push	0
		mov	al, byte ptr [bp+var_62+2]
		push	ax
		lea	ax, [bp+var_66+2]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_5BF48:				; CODE XREF: Conv_PlayScript_5AA4E+14DAj
					; Conv_PlayScript_5AA4E+14E1j
		mov	[bp+var_66+2], 0
		mov	byte ptr [bp+var_62+3],	0
		mov	[bp+var_5E], 0
		mov	[bp+var_164], 11B4h
		push	word ptr [bp+var_14C+2]
		call	Heap_FreeAndCoalesce_2C3FC
		add	sp, 2
		lea	ax, [bp+var_144]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_124]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		push	0
		lea	ax, [bp+var_30]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	2
		lea	ax, [bp+var_2A]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		jmp	loc_5CDEF
; ���������������������������������������������������������������������������

loc_5BFA9:				; CODE XREF: Conv_PlayScript_5AA4E+4Aj
					; DATA XREF: ovr191:off_5CE29o
		mov	[bp+var_2C], 1254h ; case 0xE
		mov	byte ptr [bp+var_2A], 0Eh
		mov	[bp+var_2C], 11A4h
		push	di
		lea	ax, [bp+var_2C]
		push	ax
		call	ConvRec_ReadWing_66E0
		add	sp, 4
		mov	al, byte ptr [bp+var_2A+1]
		mov	[bp+var_16], al
		push	ds
		push	offset a_iff	; ".iff"
		push	ds
		push	offset aGameflow_0 ; "gameflow"
		push	ds
		push	offset a____DataGamefl ; "..\\..\\data\\gameflow\\"
		lea	ax, [bp+var_104]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_1AC]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_1AC], 556h
		mov	[bp+var_14C+1],	100h
		mov	dword ptr [bp-14Fh], 0
		mov	[bp+var_1AC], 56Eh
		push	1
		lea	ax, [bp+var_104]
		push	ax
		lea	ax, [bp+var_1AC]
		push	ax
		mov	bx, [bp+var_1AC]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large [dword_440C8]
		lea	ax, [bp+var_1AC]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		or	ax, ax
		jnz	short loc_5C047
		push	10ADh
		call	Fatal_Error_310B
		add	sp, 2

loc_5C047:				; CODE XREF: Conv_PlayScript_5AA4E+15ECj
		mov	byte ptr [bp+var_2E+1],	0
		jmp	short loc_5C0A8
; ���������������������������������������������������������������������������

loc_5C04D:				; CODE XREF: Conv_PlayScript_5AA4E+168Aj
		push	1
		push	large [dword_440EA]
		lea	ax, [bp+var_1AC]
		push	ax
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		push	0
		push	large [dword_440EF]
		lea	ax, [bp+var_1AC]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		lea	ax, [bp+var_1AC]
		push	ax
		call	ResourceRecord_ReadFinalField_3C3C1
		add	sp, 2
		mov	dl, [bp+var_28]
		mov	dh, 0
		cmp	ax, dx
		jnz	short loc_5C091
		mov	byte ptr [bp+var_2E+1],	1
		jmp	short loc_5C0DB
; ���������������������������������������������������������������������������

loc_5C091:				; CODE XREF: Conv_PlayScript_5AA4E+163Bj
		mov	eax, [bp+var_136]
		mov	dword ptr [bp+var_148+1], eax
		lea	ax, [bp+var_1AC]
		push	ax
		call	ResourceRecord_ReleaseAndClear_3C595
		add	sp, 2

loc_5C0A8:				; CODE XREF: Conv_PlayScript_5AA4E+15FDj
		cmp	[bp+var_130], 0
		jnz	short loc_5C0BE
		lea	ax, [bp+var_1AC]
		push	ax
		call	ResourceRecord_ReadPayload_3C623
		add	sp, 2
		jmp	short loc_5C0D4
; ���������������������������������������������������������������������������

loc_5C0BE:				; CODE XREF: Conv_PlayScript_5AA4E+165Fj
		mov	bx, [bp+var_130]
		mov	eax, [bx+0Fh]
		cmp	eax, dword ptr [bp+var_148+1]
		jg	short loc_5C0D2
		mov	ax, 1
		jmp	short loc_5C0D4
; ���������������������������������������������������������������������������

loc_5C0D2:				; CODE XREF: Conv_PlayScript_5AA4E+167Dj
		xor	ax, ax

loc_5C0D4:				; CODE XREF: Conv_PlayScript_5AA4E+166Ej
					; Conv_PlayScript_5AA4E+1682j
		or	ax, ax
		jnz	short loc_5C0DB
		jmp	loc_5C04D
; ���������������������������������������������������������������������������

loc_5C0DB:				; CODE XREF: Conv_PlayScript_5AA4E+1641j
					; Conv_PlayScript_5AA4E+1688j
		mov	al, byte ptr [bp+var_2E+1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5C0F5
		mov	al, [bp+var_28]
		mov	ah, 0
		push	ax
		push	10D4h
		call	Fatal_Error_310B
		add	sp, 4

loc_5C0F5:				; CODE XREF: Conv_PlayScript_5AA4E+1694j
		lea	ax, [bp+var_1AC]
		push	ax
		call	ResourceRecord_ReadFinalField_3C3C1
		add	sp, 2
		mov	[bp+var_25], al
		mov	eax, [bp+var_136]
		mov	dword ptr [bp+var_148+1], eax
		push	0
		push	large [dword_4411C]
		lea	ax, [bp+var_1AC]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jnz	short loc_5C138
		mov	al, [bp+var_28]
		mov	ah, 0
		push	ax
		push	1101h
		call	Fatal_Error_310B
		add	sp, 4

loc_5C138:				; CODE XREF: Conv_PlayScript_5AA4E+16D7j
		jmp	short loc_5C158
; ���������������������������������������������������������������������������

loc_5C13A:				; CODE XREF: Conv_PlayScript_5AA4E+173Ej
		mov	al, [bp+var_1D]
		mov	ah, 0
		lea	dx, [bp+var_1C]
		add	ax, dx
		push	ax
		lea	ax, [bp+var_1AC]
		push	ax
		call	ResourceRecord_ReadFinalField_3C3C1
		add	sp, 2
		pop	bx
		mov	[bx], al
		inc	[bp+var_1D]

loc_5C158:				; CODE XREF: Conv_PlayScript_5AA4E:loc_5C138j
		test	[bp+var_13A], 1
		jz	short loc_5C177
		mov	eax, [bp+var_136]
		dec	eax
		cmp	eax, dword ptr [bp+var_148+1]
		jnz	short loc_5C175
		inc	dword ptr [bp+var_148+1]
		jmp	short $+2

loc_5C175:				; CODE XREF: Conv_PlayScript_5AA4E+171Ej
		jmp	short $+2

loc_5C177:				; CODE XREF: Conv_PlayScript_5AA4E+1710j
		mov	eax, dword ptr [bp+var_148+1]
		cmp	eax, [bp+var_136]
		jl	short loc_5C188
		mov	ax, 1
		jmp	short loc_5C18A
; ���������������������������������������������������������������������������

loc_5C188:				; CODE XREF: Conv_PlayScript_5AA4E+1733j
		xor	ax, ax

loc_5C18A:				; CODE XREF: Conv_PlayScript_5AA4E+1738j
		or	ax, ax
		jz	short loc_5C13A
		mov	eax, [bp+var_136]
		mov	dword ptr [bp+var_148+1], eax
		cmp	[bp+var_25], 1
		jz	short loc_5C1A4
		cmp	[bp+var_25], 2
		jnz	short loc_5C1F1

loc_5C1A4:				; CODE XREF: Conv_PlayScript_5AA4E+174Ej
		push	0
		push	large [dword_44143]
		lea	ax, [bp+var_1AC]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jnz	short loc_5C1CD
		mov	al, [bp+var_28]
		mov	ah, 0
		push	ax
		push	1128h
		call	Fatal_Error_310B
		add	sp, 4

loc_5C1CD:				; CODE XREF: Conv_PlayScript_5AA4E+176Cj
		xor	si, si
		jmp	short loc_5C1E2
; ���������������������������������������������������������������������������

loc_5C1D1:				; CODE XREF: Conv_PlayScript_5AA4E+1797j
		lea	ax, [bp+var_1AC]
		push	ax
		call	ResourceRecord_ReadFinalField_3C3C1
		add	sp, 2
		mov	byte ptr [bp+si+var_24], al
		inc	si

loc_5C1E2:				; CODE XREF: Conv_PlayScript_5AA4E+1781j
		cmp	si, 5
		jl	short loc_5C1D1
		mov	eax, [bp+var_136]
		mov	dword ptr [bp+var_148+1], eax

loc_5C1F1:				; CODE XREF: Conv_PlayScript_5AA4E+1754j
		lea	ax, [bp+var_1AC]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		mov	al, [bp+var_25]
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 3		; switch 4 cases
		jbe	short loc_5C20D
		jmp	loc_5C391	; default
; ���������������������������������������������������������������������������

loc_5C20D:				; CODE XREF: Conv_PlayScript_5AA4E+17BAj
		shl	bx, 1
		jmp	cs:off_5CE21[bx] ; switch jump

loc_5C214:				; DATA XREF: ovr191:off_5CE21o
		mov	al, byte ptr [bp+var_1C] ; case	0x0
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0ECCh]
		mov	ax, [di+2Ah]
		inc	ax
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	bx, [di+2Ah]
		mov	byte ptr [bx+15h], 0
		mov	bx, [di+2Ah]
		mov	byte ptr [bx+29h], 0
		jmp	loc_5C393
; ���������������������������������������������������������������������������

loc_5C23F:				; CODE XREF: Conv_PlayScript_5AA4E+17C1j
					; DATA XREF: ovr191:off_5CE21o
		mov	al, byte ptr [bp+var_1C] ; case	0x1
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0ECCh]
		mov	ax, [di+2Ah]
		inc	ax
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		xor	si, si
		jmp	short loc_5C268
; ���������������������������������������������������������������������������

loc_5C25D:				; CODE XREF: Conv_PlayScript_5AA4E+181Dj
		mov	al, byte ptr [bp+si+var_24]
		cmp	al, byte ptr [bp+var_1C]
		jz	short loc_5C267
		jmp	short loc_5C26D
; ���������������������������������������������������������������������������

loc_5C267:				; CODE XREF: Conv_PlayScript_5AA4E+1815j
		inc	si

loc_5C268:				; CODE XREF: Conv_PlayScript_5AA4E+180Dj
		cmp	si, 5
		jl	short loc_5C25D

loc_5C26D:				; CODE XREF: Conv_PlayScript_5AA4E+1817j
		mov	al, byte ptr [bp+si+var_24]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0ECCh]
		mov	ax, [di+2Ah]
		add	ax, 15h
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	[bp+var_30], 0
		jmp	short loc_5C2A9
; ���������������������������������������������������������������������������

loc_5C290:				; CODE XREF: Conv_PlayScript_5AA4E+185Fj
		lea	ax, [bp+var_24]
		mov	bx, [bp+var_30]
		add	bx, ax
		mov	al, [bx]
		cmp	al, byte ptr [bp+var_1C]
		jz	short loc_5C2A6
		cmp	[bp+var_30], si
		jz	short loc_5C2A6
		jmp	short loc_5C2AF
; ���������������������������������������������������������������������������

loc_5C2A6:				; CODE XREF: Conv_PlayScript_5AA4E+184Fj
					; Conv_PlayScript_5AA4E+1854j
		inc	[bp+var_30]

loc_5C2A9:				; CODE XREF: Conv_PlayScript_5AA4E+1840j
		cmp	[bp+var_30], 5
		jl	short loc_5C290

loc_5C2AF:				; CODE XREF: Conv_PlayScript_5AA4E+1856j
		lea	ax, [bp+var_24]
		mov	bx, [bp+var_30]
		add	bx, ax
		mov	al, [bx]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0ECCh]
		mov	ax, [di+2Ah]
		add	ax, 29h	; ')'
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		jmp	loc_5C393
; ���������������������������������������������������������������������������

loc_5C2D5:				; CODE XREF: Conv_PlayScript_5AA4E+17C1j
					; DATA XREF: ovr191:off_5CE21o
		mov	al, byte ptr [bp+var_1C] ; case	0x2
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0ECCh]
		mov	ax, [di+2Ah]
		inc	ax
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		xor	si, si
		jmp	short loc_5C2FE
; ���������������������������������������������������������������������������

loc_5C2F3:				; CODE XREF: Conv_PlayScript_5AA4E+18B3j
		mov	al, byte ptr [bp+si+var_24]
		cmp	al, byte ptr [bp+var_1C]
		jz	short loc_5C2FD
		jmp	short loc_5C303
; ���������������������������������������������������������������������������

loc_5C2FD:				; CODE XREF: Conv_PlayScript_5AA4E+18ABj
		inc	si

loc_5C2FE:				; CODE XREF: Conv_PlayScript_5AA4E+18A3j
		cmp	si, 5
		jl	short loc_5C2F3

loc_5C303:				; CODE XREF: Conv_PlayScript_5AA4E+18ADj
		mov	al, byte ptr [bp+si+var_24]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0ECCh]
		mov	ax, [di+2Ah]
		add	ax, 15h
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	al, [di+6Bh]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0ED8h]
		mov	ax, [di+2Ah]
		add	ax, 29h	; ')'
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		jmp	short loc_5C393
; ���������������������������������������������������������������������������

loc_5C33D:				; CODE XREF: Conv_PlayScript_5AA4E+17C1j
					; DATA XREF: ovr191:off_5CE21o
		mov	al, byte ptr [bp+var_1C] ; case	0x3
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0ECCh]
		mov	ax, [di+2Ah]
		inc	ax
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	al, [di+6Bh]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0ED8h]
		mov	ax, [di+2Ah]
		add	ax, 15h
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	al, [di+6Ch]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0ED8h]
		mov	ax, [di+2Ah]
		add	ax, 29h	; ')'
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		jmp	short loc_5C393
; ���������������������������������������������������������������������������

loc_5C391:				; CODE XREF: Conv_PlayScript_5AA4E+17BCj
		jmp	short $+2	; default

loc_5C393:				; CODE XREF: Conv_PlayScript_5AA4E+17EEj
					; Conv_PlayScript_5AA4E+1884j ...
		mov	[bp+var_1AC], 56Eh
		lea	ax, [bp+var_1AC]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_1AC]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4
		jmp	loc_5CDEF
; ���������������������������������������������������������������������������

loc_5C3B8:				; CODE XREF: Conv_PlayScript_5AA4E+4Aj
					; DATA XREF: ovr191:off_5CE29o
		mov	byte ptr [bp+var_A], 0 ; case 0xF
		mov	byte ptr [bp+var_14], 0
		mov	ax, word_43F0D
		mov	[bp+var_2C], ax
		mov	ax, word_43F0F
		mov	[bp+var_2A], ax
		mov	al, byte_43F11
		mov	[bp+var_28], al
		mov	ax, word_43F12
		mov	[bp+var_32], ax
		mov	ax, word_43F14
		mov	[bp+var_30], ax
		mov	ax, word_43F16
		mov	[bp+var_2E], ax
		xor	si, si
		jmp	short loc_5C3F8
; ���������������������������������������������������������������������������

loc_5C3E8:				; CODE XREF: Conv_PlayScript_5AA4E+19B1j
		mov	al, byte ptr [bp+si+var_1C]
		mov	ah, 0
		lea	dx, [bp+var_32]
		add	ax, dx
		mov	bx, ax
		mov	byte ptr [bx], 1
		inc	si

loc_5C3F8:				; CODE XREF: Conv_PlayScript_5AA4E+1998j
		mov	al, [bp+var_1D]
		mov	ah, 0
		cmp	ax, si
		jg	short loc_5C3E8
		mov	ax, di
		add	ax, 1Ah
		push	ax
		lea	ax, [bp+var_36]
		push	ax
		call	SmallObject_RegisterInList_2CB40
		add	sp, 4
		mov	ax, di
		add	ax, 0Ch
		push	ax
		push	0
		push	0Ah
		lea	ax, [bp+var_124]
		push	ax
		call	LayerGroup_Construct_2DC66
		add	sp, 8
		mov	ax, di
		add	ax, 2Ch	; ','
		push	ax
		mov	ax, di
		add	ax, 1Ah
		push	ax
		lea	ax, [bp+var_13E]
		push	ax
		call	Widget_ApplyStyleAndAllocate_3144B
		add	sp, 6
		cmp	[bp+var_16], 0
		jnz	short loc_5C467
		lea	ax, [bp+var_3C]
		push	ax
		lea	ax, [bp-3Ah]
		push	ax
		lea	ax, [bp+var_38]
		push	ax
		push	1141h
		push	di
		push	cs
		call	near ptr ConvData_LoadBackground_5A4E6
		add	sp, 0Ah
		mov	ah, 0
		mov	[bp-3Eh], ax
		jmp	short loc_5C483
; ���������������������������������������������������������������������������

loc_5C467:				; CODE XREF: Conv_PlayScript_5AA4E+19F9j
		lea	ax, [bp+var_3C]
		push	ax
		lea	ax, [bp-3Ah]
		push	ax
		lea	ax, [bp+var_38]
		push	ax
		push	1148h
		push	di
		push	cs
		call	near ptr ConvData_LoadBackground_5A4E6
		add	sp, 0Ah
		mov	ah, 0
		mov	[bp-3Eh], ax

loc_5C483:				; CODE XREF: Conv_PlayScript_5AA4E+1A17j
		push	0
		mov	bx, [bp+var_3C]
		push	word ptr [bx]
		push	0
		push	[bp+var_38]
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	[bp+var_40], ax
		push	[bp+var_40]
		lea	ax, [bp+var_124]
		push	ax
		call	LayerGroup_Add_2DB84
		add	sp, 4
		mov	si, 1
		jmp	short loc_5C4E9
; ���������������������������������������������������������������������������

loc_5C4B1:				; CODE XREF: Conv_PlayScript_5AA4E+1A9Ej
		push	0
		mov	ax, si
		shl	ax, 1
		mov	bx, [bp+var_3C]
		add	bx, ax
		push	word ptr [bx]
		push	0
		mov	ax, si
		mov	dx, 0Ah
		imul	dx
		mov	dx, [bp+var_38]
		add	dx, ax
		push	dx
		push	0
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	word ptr [bp+var_82+2],	ax
		push	word ptr [bp+var_82+2]
		push	[bp+var_40]
		call	LayerGroup_Add_2DB84
		add	sp, 4
		inc	si

loc_5C4E9:				; CODE XREF: Conv_PlayScript_5AA4E+1A61j
		cmp	si, [bp-3Eh]
		jl	short loc_5C4B1
		mov	[bp+var_48], 6
		lea	ax, [bp+var_46]
		push	ax
		lea	ax, [bp+var_44]
		push	ax
		lea	ax, [bp-42h]
		push	ax
		push	114Fh
		push	di
		push	cs
		call	near ptr ConvData_LoadBackground_5A4E6
		add	sp, 0Ah
		push	0
		mov	bx, [bp+var_46]
		push	word ptr [bx]
		push	0
		push	word ptr [bp-42h]
		push	0
		call	OverlayImageLayer_Construct_A9D6
		add	sp, 0Ah
		mov	word ptr [bp+var_14C+2], ax
		push	word ptr [bp+var_14C+2]
		push	[bp+var_40]
		call	LayerGroup_Add_2DB84
		add	sp, 4
		mov	si, 1
		jmp	short loc_5C588
; ���������������������������������������������������������������������������

loc_5C538:				; CODE XREF: Conv_PlayScript_5AA4E+1B3Dj
		cmp	byte ptr [bp+si+var_32], 0
		jz	short loc_5C587
		push	0
		mov	ax, si
		shl	ax, 1
		mov	bx, [bp+var_46]
		add	bx, ax
		push	word ptr [bx]
		push	0
		mov	ax, si
		mov	dx, 0Ah
		imul	dx
		mov	dx, [bp-42h]
		add	dx, ax
		push	dx
		push	0
		call	OverlayImageLayer_Construct_A9D6
		add	sp, 0Ah
		mov	bx, si
		shl	bx, 1
		lea	dx, [bp+var_14C+2]
		add	bx, dx
		mov	[bx], ax
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_14C+2]
		add	bx, ax
		push	word ptr [bx]
		push	[bp+var_40]
		call	LayerGroup_Add_2DB84
		add	sp, 4

loc_5C587:				; CODE XREF: Conv_PlayScript_5AA4E+1AEEj
		inc	si

loc_5C588:				; CODE XREF: Conv_PlayScript_5AA4E+1AE8j
		cmp	si, 6
		jl	short loc_5C538
		push	100h
		push	0
		lea	ax, [bp+var_4E]
		push	ax
		call	Palette_Alloc_2CC76
		add	sp, 6
		xor	si, si
		jmp	short loc_5C5F3
; ���������������������������������������������������������������������������

loc_5C5A2:				; CODE XREF: Conv_PlayScript_5AA4E+1BA8j
		mov	ax, si
		mov	dx, 0Ah
		imul	dx
		mov	dx, [bp-3Ah]
		add	dx, ax
		mov	word ptr [bp+var_86], dx
		mov	word ptr [bp+var_82+1],	0
		push	word ptr [bp+var_86]
		lea	ax, [bp+var_86+2]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		push	word ptr [bp+var_86+2]
		mov	al, byte ptr [bp+var_82]
		push	ax
		lea	ax, [bp+var_86+2]
		push	ax
		lea	ax, [bp+var_4E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	2
		lea	ax, [bp+var_86+2]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		inc	si

loc_5C5F3:				; CODE XREF: Conv_PlayScript_5AA4E+1B52j
		cmp	si, [bp-3Eh]
		jl	short loc_5C5A2
		mov	ax, [bp+var_44]
		mov	[bp+var_56], ax
		mov	[bp+var_52+1], 0
		push	[bp+var_56]
		lea	ax, [bp+var_54]
		push	ax
		call	Palette_LoadFromResource_2CCE5
		add	sp, 4
		push	[bp+var_54]
		mov	al, byte ptr [bp+var_52]
		push	ax
		lea	ax, [bp+var_54]
		push	ax
		lea	ax, [bp+var_4E]
		push	ax
		call	Palette_CopyInto_2CF80
		add	sp, 8
		push	0
		push	word_46F46
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		push	0
		push	[bp+var_4E]
		mov	al, byte ptr [bp+var_4C]
		push	ax
		lea	ax, [bp+var_4E]
		push	ax
		call	Palette_Upload_2CDE1
		add	sp, 8
		lea	ax, [bp+var_124]
		push	ax
		call	LayerGroup_PlayFrame_2DD86
		add	sp, 2
		mov	ax, di
		add	ax, 1Ah
		mov	[bp+var_58], ax
		mov	[bp+var_158], 0
		mov	[bp+var_156], 0
		push	[bp+var_58]
		lea	ax, [bp+var_158]
		push	ax
		call	TextFormat_ApplyStyleAttribute_2E9A4
		add	sp, 4
		mov	ax, word_46F46
		mov	[bp+var_5A], ax
		mov	[bp+var_166], 0
		mov	[bp+var_164], 0
		push	[bp+var_5A]
		lea	ax, [bp+var_166]
		push	ax
		call	TextFormat_ApplyStyleAttribute_2E9A4
		add	sp, 4
		mov	word ptr [di+10h], 0
		mov	word ptr [di+12h], 0
		mov	word ptr [di+14h], 13Fh
		mov	word ptr [di+16h], 0C7h	; '�'
		push	18h
		push	0
		push	[bp+var_40]
		mov	bx, [bp+var_40]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	[bp+var_40]
		mov	bx, [bp+var_40]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		add	sp, 2
		mov	word ptr [bp+var_5E+2],	1
		jmp	short loc_5C74B
; ���������������������������������������������������������������������������

loc_5C6DA:				; CODE XREF: Conv_PlayScript_5AA4E+1D01j
		mov	ax, 18h
		sub	ax, word ptr [bp+var_5E+2]
		mov	word ptr [bp+var_5E], ax
		mov	ax, word ptr [bp+var_5E+2]
		shl	ax, 1
		add	ax, 97h	; '�'
		mov	word ptr [bp+var_62+2],	ax
		mov	[bp+var_154], 0
		mov	ax, word ptr [bp+var_5E]
		mov	[bp+var_152], ax
		mov	[bp+var_150], 13Fh
		mov	ax, word ptr [bp+var_62+2]
		mov	[bp+var_14E], ax
		mov	ax, 18h
		sub	ax, word ptr [bp+var_5E+2]
		mov	word ptr [bp+var_62], ax
		mov	ax, word ptr [bp+var_5E+2]
		shl	ax, 1
		add	ax, 97h	; '�'
		mov	word ptr [bp+var_66+2],	ax
		mov	[bp+var_162], 0
		mov	ax, word ptr [bp+var_62]
		mov	[bp+var_160], ax
		mov	[bp+var_15E], 13Fh
		mov	ax, word ptr [bp+var_66+2]
		mov	[bp+var_15C], ax
		lea	ax, [bp+var_158]
		push	ax
		lea	ax, [bp+var_166]
		push	ax
		call	UI_ApplyEncodingHelper_2EC65
		add	sp, 4
		inc	word ptr [bp+var_5E+2]

loc_5C74B:				; CODE XREF: Conv_PlayScript_5AA4E+1C8Aj
		cmp	word ptr [bp+var_5E+2],	18h
		jle	short loc_5C6DA
		call	Input_Flush_CDDC
		mov	word_49818, 1
		call	TextScrollDisplayB_ApplyHelperC_3F74A
		mov	byte ptr [bp+var_6E+2],	0
		mov	word ptr [bp+var_6E], 0
		mov	[bp+var_70], 0
		push	0Fh
		mov	ax, di
		add	ax, 2Ch	; ','
		push	ax
		mov	bx, [di+2Ch]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_71], 0
		mov	byte ptr [bp+var_184], 0
		xor	eax, eax
		mov	[bp-76h], eax
		mov	[bp+var_7A], eax
		mov	dword ptr [bp-76h], 6
		mov	eax, dword_47ABB
		mov	[bp+var_7A], eax

loc_5C7A4:				; CODE XREF: Conv_PlayScript_5AA4E:loc_5CA44j
		lea	ax, [bp+var_6E+2]
		push	ax
		call	TextScroll_FormatAndApply_3EA28
		add	sp, 2
		cmp	byte ptr [bp+var_6E+2],	0
		jnz	short loc_5C7DC
		lea	ax, [bp+var_6E+2]
		push	ax
		call	sub_6DBF
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5C7DA
		lea	ax, [bp-7Eh]
		push	ax
		lea	ax, [bp+var_6E+2]
		push	ax
		call	sub_6BFB
		add	sp, 4
		jmp	short $+2

loc_5C7DA:				; CODE XREF: Conv_PlayScript_5AA4E+1D78j
		jmp	short $+2

loc_5C7DC:				; CODE XREF: Conv_PlayScript_5AA4E+1D66j
		cmp	byte ptr [bp+var_6E+2],	0
		jz	short loc_5C7EE
		mov	ax, word ptr [bp+var_6A]
		mov	word ptr [bp+var_6E], ax
		mov	ax, word ptr [bp+var_6A+2]
		mov	[bp+var_70], ax

loc_5C7EE:				; CODE XREF: Conv_PlayScript_5AA4E+1D92j
		mov	ax, word_49818
		mov	word ptr [bp+var_82+2],	ax
		cmp	[bp+var_71], 0
		jz	short loc_5C807
		cmp	word ptr [bp+var_82+2],	1
		jnz	short loc_5C807
		mov	word ptr [bp+var_82+2],	0
		jmp	short loc_5C822
; ���������������������������������������������������������������������������

loc_5C807:				; CODE XREF: Conv_PlayScript_5AA4E+1DAAj
					; Conv_PlayScript_5AA4E+1DB0j
		mov	al, [bp+var_71]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5C81D
		cmp	word ptr [bp+var_82+2],	0
		jnz	short loc_5C81D
		mov	word ptr [bp+var_82+2],	1
		jmp	short loc_5C822
; ���������������������������������������������������������������������������

loc_5C81D:				; CODE XREF: Conv_PlayScript_5AA4E+1DC0j
					; Conv_PlayScript_5AA4E+1DC6j
		mov	word ptr [bp+var_82+2],	0FFFFh

loc_5C822:				; CODE XREF: Conv_PlayScript_5AA4E+1DB7j
					; Conv_PlayScript_5AA4E+1DCDj
		cmp	word ptr [bp+var_82+2],	0FFFFh
		jz	short loc_5C840
		call	TextScrollDisplayB_ApplyHelperD_3F784
		mov	ax, word ptr [bp+var_82+2]
		mov	word ptr [bp+var_82], ax
		mov	ax, word ptr [bp+var_82]
		mov	word_49818, ax
		call	TextScrollDisplayB_ApplyHelperC_3F74A

loc_5C840:				; CODE XREF: Conv_PlayScript_5AA4E+1DD8j
		cmp	byte ptr [bp+var_6E+2],	2
		jnz	short loc_5C84F
		cmp	[bp+var_71], 0
		jz	short loc_5C84F
		jmp	loc_5CA47
; ���������������������������������������������������������������������������

loc_5C84F:				; CODE XREF: Conv_PlayScript_5AA4E+1DF6j
					; Conv_PlayScript_5AA4E+1DFCj
		mov	eax, [bp+var_7A]
		add	eax, [bp-76h]
		cmp	eax, dword_47ABB
		ja	short loc_5C863
		mov	ax, 1
		jmp	short loc_5C865
; ���������������������������������������������������������������������������

loc_5C863:				; CODE XREF: Conv_PlayScript_5AA4E+1E0Ej
		xor	ax, ax

loc_5C865:				; CODE XREF: Conv_PlayScript_5AA4E+1E13j
		or	al, al
		jnz	short loc_5C86C
		jmp	loc_5CA44
; ���������������������������������������������������������������������������

loc_5C86C:				; CODE XREF: Conv_PlayScript_5AA4E+1E19j
		mov	dword ptr [bp-76h], 6
		mov	eax, dword_47ABB
		mov	[bp+var_7A], eax
		push	[bp+var_40]
		mov	bx, [bp+var_40]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		add	sp, 2
		push	0AFh ; '�'
		lea	ax, [bp+var_184]
		push	ax
		push	2
		push	1156h
		lea	ax, [bp+var_13E]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_31A3B
		add	sp, 0Ah
		push	word_46F44
		call	sub_3F8CC
		add	sp, 2
		push	word_46F44
		push	word_46F46
		call	UI_ApplyEncodingHelper_2EC65
		add	sp, 4
		push	word_46F44
		call	sub_3F8DE
		add	sp, 2
		mov	si, 1
		jmp	short loc_5C8E9
; ���������������������������������������������������������������������������

loc_5C8D1:				; CODE XREF: Conv_PlayScript_5AA4E+1E9Ej
		cmp	byte ptr [bp+si+var_32], 0
		jz	short loc_5C8E8
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_14C+2]
		add	bx, ax
		mov	bx, [bx]
		mov	word ptr [bx+1Bh], 0

loc_5C8E8:				; CODE XREF: Conv_PlayScript_5AA4E+1E87j
		inc	si

loc_5C8E9:				; CODE XREF: Conv_PlayScript_5AA4E+1E81j
		cmp	si, 6
		jl	short loc_5C8D1
		cmp	word ptr [bp+var_6E], 1D2h
		jge	short loc_5C92F
		cmp	word ptr [bp+var_6E], 176h
		jl	short loc_5C92F
		cmp	[bp+var_70], 47h ; 'G'
		jle	short loc_5C92F
		cmp	[bp+var_70], 0BFh ; '�'
		jg	short loc_5C92F
		cmp	byte ptr [bp+var_32+1],	0
		jz	short loc_5C92F
		push	115Dh
		lea	ax, [bp+var_184]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	bx, [bp+var_148]
		mov	word ptr [bx+1Bh], 1
		mov	[bp+var_71], 1
		jmp	loc_5CA44
; ���������������������������������������������������������������������������

loc_5C92F:				; CODE XREF: Conv_PlayScript_5AA4E+1EA5j
					; Conv_PlayScript_5AA4E+1EACj ...
		cmp	word ptr [bp+var_6E], 178h
		jge	short loc_5C970
		cmp	word ptr [bp+var_6E], 122h
		jl	short loc_5C970
		cmp	[bp+var_70], 4Ah ; 'J'
		jle	short loc_5C970
		cmp	[bp+var_70], 0C5h ; '�'
		jg	short loc_5C970
		cmp	byte ptr [bp+var_30], 0
		jz	short loc_5C970
		push	116Ah
		lea	ax, [bp+var_184]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	bx, [bp+var_146]
		mov	word ptr [bx+1Bh], 1
		mov	[bp+var_71], 2
		jmp	loc_5CA44
; ���������������������������������������������������������������������������

loc_5C970:				; CODE XREF: Conv_PlayScript_5AA4E+1EE6j
					; Conv_PlayScript_5AA4E+1EEDj ...
		cmp	word ptr [bp+var_6E], 98h ; '�'
		jge	short loc_5C9B0
		cmp	word ptr [bp+var_6E], 3Ah ; ':'
		jl	short loc_5C9B0
		cmp	[bp+var_70], 43h ; 'C'
		jle	short loc_5C9B0
		cmp	[bp+var_70], 0C3h ; '�'
		jg	short loc_5C9B0
		cmp	byte ptr [bp+var_30+1],	0
		jz	short loc_5C9B0
		push	1176h
		lea	ax, [bp+var_184]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	bx, [bp+var_144]
		mov	word ptr [bx+1Bh], 1
		mov	[bp+var_71], 3
		jmp	loc_5CA44
; ���������������������������������������������������������������������������

loc_5C9B0:				; CODE XREF: Conv_PlayScript_5AA4E+1F27j
					; Conv_PlayScript_5AA4E+1F2Dj ...
		cmp	word ptr [bp+var_6E], 10Ah
		jge	short loc_5C9F0
		cmp	word ptr [bp+var_6E], 0A8h ; '�'
		jl	short loc_5C9F0
		cmp	[bp+var_70], 47h ; 'G'
		jle	short loc_5C9F0
		cmp	[bp+var_70], 0C1h ; '�'
		jg	short loc_5C9F0
		cmp	byte ptr [bp+var_2E], 0
		jz	short loc_5C9F0
		push	1182h
		lea	ax, [bp+var_184]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	bx, [bp+var_142]
		mov	word ptr [bx+1Bh], 1
		mov	[bp+var_71], 4
		jmp	short loc_5CA44
; ���������������������������������������������������������������������������

loc_5C9F0:				; CODE XREF: Conv_PlayScript_5AA4E+1F67j
					; Conv_PlayScript_5AA4E+1F6Ej ...
		cmp	word ptr [bp+var_6E], 234h
		jge	short loc_5CA30
		cmp	word ptr [bp+var_6E], 1E4h
		jl	short loc_5CA30
		cmp	[bp+var_70], 45h ; 'E'
		jle	short loc_5CA30
		cmp	[bp+var_70], 11Ah
		jg	short loc_5CA30
		cmp	byte ptr [bp+var_2E+1],	0
		jz	short loc_5CA30
		push	1190h
		lea	ax, [bp+var_184]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	bx, [bp+var_140]
		mov	word ptr [bx+1Bh], 1
		mov	[bp+var_71], 5
		jmp	short loc_5CA44
; ���������������������������������������������������������������������������

loc_5CA30:				; CODE XREF: Conv_PlayScript_5AA4E+1FA7j
					; Conv_PlayScript_5AA4E+1FAEj ...
		push	119Bh
		lea	ax, [bp+var_184]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	[bp+var_71], 0

loc_5CA44:				; CODE XREF: Conv_PlayScript_5AA4E+1E1Bj
					; Conv_PlayScript_5AA4E+1EDEj ...
		jmp	loc_5C7A4
; ���������������������������������������������������������������������������

loc_5CA47:				; CODE XREF: Conv_PlayScript_5AA4E+1DFEj
		call	TextScrollDisplayB_ApplyHelperD_3F784
		mov	word ptr [bp+var_5E+2],	0
		jmp	loc_5CB03
; ���������������������������������������������������������������������������

loc_5CA54:				; CODE XREF: Conv_PlayScript_5AA4E+20BBj
		mov	[bp+var_86], 0
		mov	[bp+var_82], 1
		mov	eax, dword_47ABB
		mov	[bp+var_86], eax
		jmp	short $+2

loc_5CA71:				; CODE XREF: Conv_PlayScript_5AA4E+203Fj
		mov	eax, [bp+var_86]
		add	eax, [bp+var_82]
		cmp	eax, dword_47ABB
		ja	short loc_5CA87
		mov	ax, 1
		jmp	short loc_5CA89
; ���������������������������������������������������������������������������

loc_5CA87:				; CODE XREF: Conv_PlayScript_5AA4E+2032j
		xor	ax, ax

loc_5CA89:				; CODE XREF: Conv_PlayScript_5AA4E+2037j
		mov	ah, 0
		or	ax, ax
		jz	short loc_5CA71
		push	0
		push	word ptr [bp+var_5E+2]
		push	13Fh
		push	word ptr [bp+var_5E+2]
		push	0
		mov	ax, di
		add	ax, 0Ch
		push	ax
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch
		push	0
		mov	ax, word ptr [bp+var_5E+2]
		shl	ax, 1
		mov	dx, 0C7h ; '�'
		sub	dx, ax
		push	dx
		push	13Fh
		mov	ax, word ptr [bp+var_5E+2]
		shl	ax, 1
		mov	dx, 0C7h ; '�'
		sub	dx, ax
		push	dx
		push	0
		mov	ax, di
		add	ax, 0Ch
		push	ax
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch
		push	0
		mov	ax, word ptr [bp+var_5E+2]
		shl	ax, 1
		mov	dx, 0C6h ; '�'
		sub	dx, ax
		push	dx
		push	13Fh
		mov	ax, word ptr [bp+var_5E+2]
		shl	ax, 1
		mov	dx, 0C6h ; '�'
		sub	dx, ax
		push	dx
		push	0
		mov	ax, di
		add	ax, 0Ch
		push	ax
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch
		inc	word ptr [bp+var_5E+2]

loc_5CB03:				; CODE XREF: Conv_PlayScript_5AA4E+2003j
		cmp	word ptr [bp+var_5E+2],	18h
		jge	short loc_5CB0C
		jmp	loc_5CA54
; ���������������������������������������������������������������������������

loc_5CB0C:				; CODE XREF: Conv_PlayScript_5AA4E+20B9j
		push	0FFE8h
		push	0
		push	[bp+var_40]
		mov	bx, [bp+var_40]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	word ptr [di+10h], 0
		mov	word ptr [di+12h], 18h
		mov	word ptr [di+14h], 13Fh
		mov	word ptr [di+16h], 97h ; '�'
		mov	al, [bp+var_25]
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 3		; switch 4 cases
		jbe	short loc_5CB41
		jmp	loc_5CCF6	; default
; ���������������������������������������������������������������������������

loc_5CB41:				; CODE XREF: Conv_PlayScript_5AA4E+20EEj
		shl	bx, 1
		jmp	cs:off_5CE19[bx] ; switch jump

loc_5CB48:				; DATA XREF: ovr191:off_5CE19o
		mov	al, [bp+var_71]	; case 0x0
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0ECCh]
		mov	ax, [di+2Ah]
		inc	ax
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	bx, [di+2Ah]
		mov	byte ptr [bx+15h], 0
		mov	bx, [di+2Ah]
		mov	byte ptr [bx+29h], 0
		jmp	loc_5CCF6	; default
; ���������������������������������������������������������������������������

loc_5CB73:				; CODE XREF: Conv_PlayScript_5AA4E+20F5j
					; DATA XREF: ovr191:off_5CE19o
		mov	al, [bp+var_71]	; case 0x1
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0ECCh]
		mov	ax, [di+2Ah]
		inc	ax
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	word ptr [bp+var_82+2],	0
		jmp	short loc_5CBA8
; ���������������������������������������������������������������������������

loc_5CB94:				; CODE XREF: Conv_PlayScript_5AA4E+215Ej
		lea	ax, [bp+var_24]
		mov	bx, word ptr [bp+var_82+2]
		add	bx, ax
		mov	al, [bx]
		cmp	al, [bp+var_71]
		jz	short loc_5CBA5
		jmp	short loc_5CBAE
; ���������������������������������������������������������������������������

loc_5CBA5:				; CODE XREF: Conv_PlayScript_5AA4E+2153j
		inc	word ptr [bp+var_82+2]

loc_5CBA8:				; CODE XREF: Conv_PlayScript_5AA4E+2144j
		cmp	word ptr [bp+var_82+2],	5
		jl	short loc_5CB94

loc_5CBAE:				; CODE XREF: Conv_PlayScript_5AA4E+2155j
		lea	ax, [bp+var_24]
		mov	bx, word ptr [bp+var_82+2]
		add	bx, ax
		mov	al, [bx]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0ECCh]
		mov	ax, [di+2Ah]
		add	ax, 15h
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	word ptr [bp+var_82], 0
		jmp	short loc_5CBF8
; ���������������������������������������������������������������������������

loc_5CBD9:				; CODE XREF: Conv_PlayScript_5AA4E+21AFj
		lea	ax, [bp+var_24]
		mov	bx, word ptr [bp+var_82]
		add	bx, ax
		mov	al, [bx]
		cmp	al, [bp+var_71]
		jz	short loc_5CBF4
		mov	ax, word ptr [bp+var_82]
		cmp	ax, word ptr [bp+var_82+2]
		jz	short loc_5CBF4
		jmp	short loc_5CBFF
; ���������������������������������������������������������������������������

loc_5CBF4:				; CODE XREF: Conv_PlayScript_5AA4E+2199j
					; Conv_PlayScript_5AA4E+21A2j
		inc	word ptr [bp+var_82]

loc_5CBF8:				; CODE XREF: Conv_PlayScript_5AA4E+2189j
		cmp	word ptr [bp+var_82], 5
		jl	short loc_5CBD9

loc_5CBFF:				; CODE XREF: Conv_PlayScript_5AA4E+21A4j
		lea	ax, [bp+var_24]
		mov	bx, word ptr [bp+var_82]
		add	bx, ax
		mov	al, [bx]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0ECCh]
		mov	ax, [di+2Ah]
		add	ax, 29h	; ')'
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		jmp	loc_5CCF6	; default
; ���������������������������������������������������������������������������

loc_5CC26:				; CODE XREF: Conv_PlayScript_5AA4E+20F5j
					; DATA XREF: ovr191:off_5CE19o
		mov	al, [bp+var_71]	; case 0x2
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0ECCh]
		mov	ax, [di+2Ah]
		inc	ax
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	word ptr [bp+var_82+2],	0
		jmp	short loc_5CC5B
; ���������������������������������������������������������������������������

loc_5CC47:				; CODE XREF: Conv_PlayScript_5AA4E+2211j
		lea	ax, [bp+var_24]
		mov	bx, word ptr [bp+var_82+2]
		add	bx, ax
		mov	al, [bx]
		cmp	al, [bp+var_71]
		jz	short loc_5CC58
		jmp	short loc_5CC61
; ���������������������������������������������������������������������������

loc_5CC58:				; CODE XREF: Conv_PlayScript_5AA4E+2206j
		inc	word ptr [bp+var_82+2]

loc_5CC5B:				; CODE XREF: Conv_PlayScript_5AA4E+21F7j
		cmp	word ptr [bp+var_82+2],	5
		jl	short loc_5CC47

loc_5CC61:				; CODE XREF: Conv_PlayScript_5AA4E+2208j
		lea	ax, [bp+var_24]
		mov	bx, word ptr [bp+var_82+2]
		add	bx, ax
		mov	al, [bx]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0ECCh]
		mov	ax, [di+2Ah]
		add	ax, 15h
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	al, [di+6Bh]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0ED8h]
		mov	ax, [di+2Ah]
		add	ax, 29h	; ')'
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		jmp	short loc_5CCF6	; default
; ���������������������������������������������������������������������������

loc_5CCA2:				; CODE XREF: Conv_PlayScript_5AA4E+20F5j
					; DATA XREF: ovr191:off_5CE19o
		mov	al, [bp+var_71]	; case 0x3
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0ECCh]
		mov	ax, [di+2Ah]
		inc	ax
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	al, [di+6Bh]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0ED8h]
		mov	ax, [di+2Ah]
		add	ax, 15h
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	al, [di+6Ch]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0ED8h]
		mov	ax, [di+2Ah]
		add	ax, 29h	; ')'
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		jmp	short $+2

loc_5CCF6:				; CODE XREF: Conv_PlayScript_5AA4E+20F0j
					; Conv_PlayScript_5AA4E+2122j ...
		push	seg stub188	; default
		push	offset Stub_ResourceHandle_Destruct_42090
		push	19h
		push	0
		push	0Ah
		push	[bp+var_38]
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg stub188
		push	offset Stub_ResourceHandle_Destruct_42090
		push	19h
		push	0
		push	0Ah
		push	word ptr [bp-3Ah]
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	[bp+var_3C]
		call	sub_308
		add	sp, 2
		push	seg stub188
		push	offset Stub_ResourceHandle_Destruct_42090
		push	19h
		push	0
		push	0Ah
		push	word ptr [bp-42h]
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg stub188
		push	offset Stub_ResourceHandle_Destruct_42090
		push	19h
		push	0
		push	0Ah
		push	[bp+var_44]
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	[bp+var_46]
		call	sub_308
		add	sp, 2
		lea	ax, [bp+var_166]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		lea	ax, [bp+var_158]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_54]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		push	0
		lea	ax, [bp+var_4E]
		push	ax
		call	Palette_Destruct_2D048
		add	sp, 4
		lea	ax, [bp+var_13C]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	2
		lea	ax, [bp+var_124]
		push	ax
		call	Scene_Destruct_2DCFC
		add	sp, 4
		push	2
		lea	ax, [bp+var_36]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4
		jmp	short loc_5CDEF
; ���������������������������������������������������������������������������

loc_5CDCA:				; CODE XREF: Conv_PlayScript_5AA4E+4Aj
					; DATA XREF: ovr191:off_5CE29o
		mov	[bp+var_2C], 1254h ; case 0xC
		mov	byte ptr [bp+var_2A], 0Ch
		mov	[bp+var_2C], 119Ch
		push	di
		lea	ax, [bp+var_2C]
		push	ax
		call	ConvRec_ReadJump_66A0
		add	sp, 4
		mov	si, [bp+var_2A+1]
		add	[di+4],	si
		jmp	short loc_5CDEF
; ���������������������������������������������������������������������������

loc_5CDED:				; CODE XREF: Conv_PlayScript_5AA4E+45j
					; Conv_PlayScript_5AA4E+4Aj
					; DATA XREF: ...
		jmp	short $+2	; default

loc_5CDEF:				; CODE XREF: Conv_PlayScript_5AA4E:loc_5AA9Dj
					; Conv_PlayScript_5AA4E+8EFj ...
		cmp	[bp+var_15], 0
		jz	short loc_5CDF7
		jmp	short loc_5CE11
; ���������������������������������������������������������������������������

loc_5CDF7:				; CODE XREF: Conv_PlayScript_5AA4E+27j
					; Conv_PlayScript_5AA4E+23A5j
		mov	ax, [di]
		add	ax, [di+8]
		cmp	ax, [di+4]
		ja	short loc_5CE06
		mov	ax, 1
		jmp	short loc_5CE08
; ���������������������������������������������������������������������������

loc_5CE06:				; CODE XREF: Conv_PlayScript_5AA4E+23B1j
		xor	ax, ax

loc_5CE08:				; CODE XREF: Conv_PlayScript_5AA4E+23B6j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5CE11
		jmp	loc_5AA78
; ���������������������������������������������������������������������������

loc_5CE11:				; CODE XREF: Conv_PlayScript_5AA4E+23A7j
					; Conv_PlayScript_5AA4E+23BEj
		pop	di
		pop	si
		leave
		retf
Conv_PlayScript_5AA4E	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
off_5CE19	dw offset loc_5CB48	; DATA XREF: Conv_PlayScript_5AA4E+20F5r
		dw offset loc_5CB73	; jump table for switch	statement
		dw offset loc_5CC26
		dw offset loc_5CCA2
off_5CE21	dw offset loc_5C214	; DATA XREF: Conv_PlayScript_5AA4E+17C1r
		dw offset loc_5C23F	; jump table for switch	statement
		dw offset loc_5C2D5
		dw offset loc_5C33D
off_5CE29	dw offset loc_5AAA0	; DATA XREF: Conv_PlayScript_5AA4E+4Ar
		dw offset loc_5CDED	; jump table for switch	statement
		dw offset loc_5CDED
		dw offset loc_5B340
		dw offset loc_5CDED
		dw offset loc_5CDED
		dw offset loc_5CDED
		dw offset loc_5CDED
		dw offset loc_5CDED
		dw offset loc_5CDED
		dw offset loc_5CDED
		dw offset loc_5CDED
		dw offset loc_5CDCA
		dw offset loc_5CDED
		dw offset loc_5BFA9
		dw offset loc_5C3B8
		dw offset loc_5AA9D

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_5CE4B	proc far		; CODE XREF: sub_421E5J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		xor	ax, ax
		pop	bp
		retf
sub_5CE4B	endp

; ���������������������������������������������������������������������������
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_5CE57	proc far		; CODE XREF: sub_421E0J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_5CE57	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_5CE5F	proc far		; CODE XREF: sub_421DBJ

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		add	sp, 2
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		add	[si+2],	ax
		mov	ax, [bp+var_4]
		add	[si+4],	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		add	sp, 2
		pop	si
		leave
		retf
sub_5CE5F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_5CE95	proc far		; CODE XREF: sub_421D6J

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		mov	[si+2],	ax
		mov	ax, [bp+var_4]
		mov	[si+4],	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		add	sp, 2
		pop	si
		leave
		retf
sub_5CE95	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_5CEC2	proc far		; CODE XREF: sub_421D1J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_5CEC2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_5CECA	proc far		; CODE XREF: sub_421CCJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+19h]
		pop	si
		pop	bp
		retf
sub_5CECA	endp

; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_5CEDA	proc far		; CODE XREF: sub_421C7J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+1Bh]
		pop	si
		pop	bp
		retf
sub_5CEDA	endp

; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_5CEEA	proc far		; CODE XREF: sub_421C2J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+1Dh]
		pop	si
		pop	bp
		retf
sub_5CEEA	endp

; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_5CEFA	proc far		; CODE XREF: sub_421BDJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+1Fh]
		pop	si
		pop	bp
		retf
sub_5CEFA	endp

; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_5CF0A	proc far		; CODE XREF: sub_421B8J

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
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_6], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_8], ax
		mov	ax, [bp+var_2]
		mov	[si+19h], ax
		mov	ax, [bp+var_4]
		mov	[si+1Bh], ax
		mov	ax, [bp+var_6]
		mov	[si+1Dh], ax
		mov	ax, [bp+var_8]
		mov	[si+1Fh], ax
		push	0
		push	0
		push	si
		call	Widget_ComputeBoundsExtent_31755
		add	sp, 6
		pop	si
		leave
		retf
sub_5CF0A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_5CF54	proc far		; CODE XREF: sub_421B3J

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+19h], ax
		mov	ax, [bp+arg_4]
		mov	[si+1Dh], ax
		push	0
		push	0
		push	si
		call	Widget_ComputeBoundsExtent_31755
		add	sp, 6
		pop	si
		pop	bp
		retf
sub_5CF54	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_5CF77	proc far		; CODE XREF: sub_421AEJ

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+1Bh], ax
		mov	ax, [bp+arg_4]
		mov	[si+1Fh], ax
		push	0
		push	0
		push	si
		call	Widget_ComputeBoundsExtent_31755
		add	sp, 6
		pop	si
		pop	bp
		retf
sub_5CF77	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_5CF9A	proc far		; CODE XREF: sub_421A9J

var_C		= word ptr -0Ch
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_C], 11BCh
		mov	[bp+var_C], 11C8h
		mov	[bp+var_C], 11D8h
		mov	[bp+var_C], 11E8h
		mov	[bp+var_C], 11FCh
		mov	ax, si
		add	ax, 2
		push	ax
		mov	al, [bp+arg_2]
		push	ax
		push	word ptr [si+1Fh]
		push	word ptr [si+1Dh]
		push	word ptr [si+1Bh]
		push	word ptr [si+19h]
		lea	ax, [bp+var_C]
		push	ax
		call	Primitive_SetRectColorAndDraw_2CBE5
		add	sp, 0Eh
		pop	si
		leave
		retf
sub_5CF9A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_5CFE2	proc far		; CODE XREF: sub_421A4J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_5D012
		mov	ax, si
		add	ax, 2
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		test	di, 1
		jz	short loc_5D010
		push	si
		call	sub_308
		add	sp, 2
		jmp	short $+2

loc_5D010:				; CODE XREF: sub_5CFE2+21j
		jmp	short $+2

loc_5D012:				; CODE XREF: sub_5CFE2+Dj
		pop	di
		pop	si
		pop	bp
		retf
sub_5CFE2	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_5D01A	proc far		; CODE XREF: sub_4219FJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	ax, dx
		add	ax, 3
		pop	bp
		retf
sub_5D01A	endp

; ���������������������������������������������������������������������������
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_5D029	proc far		; CODE XREF: sub_4219AJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	ax, dx
		add	ax, 3
		pop	bp
		retf
sub_5D029	endp

; ���������������������������������������������������������������������������
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_5D038	proc far		; CODE XREF: sub_42195J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	ax, dx
		add	ax, 3
		pop	bp
		retf
sub_5D038	endp

; ���������������������������������������������������������������������������
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_5D047	proc far		; CODE XREF: sub_42190J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_5D0B9
		mov	word ptr [si], 1264h
		push	si
		call	sub_43FF
		add	sp, 2
		cmp	byte ptr [si+23h], 0
		jz	short loc_5D089
		cmp	dword ptr [si+1Eh], 0
		jz	short loc_5D089
		push	0
		mov	al, [si+22h]
		push	ax
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_5D089:				; CODE XREF: sub_5D047+20j
					; sub_5D047+27j
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		mov	word ptr [si], 2BDh
		push	si
		call	sub_2FEE0
		add	sp, 2
		test	di, 1
		jz	short loc_5D0B9
		push	si
		call	sub_308
		add	sp, 2

loc_5D0B9:				; CODE XREF: sub_5D047+Dj
					; sub_5D047+67j
		pop	di
		pop	si
		pop	bp
		retf
sub_5D047	endp

ovr191		ends

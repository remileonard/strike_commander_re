ovr195		segment	para public 'OVERLAY' use16
		assume cs:ovr195
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 9 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Conv_Init_59A20 (sub_59A20 de OPTEST.EXE). Résumé
; repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-22. [+6Bh]
; = dernier indice i (0 à 6) dont le drapeau dseg 0EE6h+i ≠ 0, [+6Ch] = dernier autre ;
; indices des noms $A/$B (table 0ED8h). Zone de texte (0, 24)-(319, 151), écran (0, 0)-(319,
; 199) ; police ..\..\data\fonts\convfont.shp.
; ==============================================================================================
Conv_Init_60DA0		proc far

var_60		= word ptr -60h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= byte ptr -8
var_7		= byte ptr -7
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 60h
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_60DC4

loc_60DB1:
		mov	bx, [bp+var_2]
		cmp	byte ptr [bx+0EB6h], 0
		jz	short loc_60DC1
		mov	al, byte ptr [bp+var_2]
		mov	[si+6Bh], al

loc_60DC1:
		inc	[bp+var_2]

loc_60DC4:
		cmp	[bp+var_2], 8
		jl	short loc_60DB1
		mov	[bp+var_2], 0
		jmp	short loc_60DEE

loc_60DD1:
		mov	bx, [bp+var_2]
		cmp	byte ptr [bx+0EB6h], 0
		jz	short loc_60DEB
		mov	al, [si+6Bh]
		mov	ah, 0
		cmp	ax, [bp+var_2]
		jz	short loc_60DEB
		mov	al, byte ptr [bp+var_2]
		mov	[si+6Ch], al

loc_60DEB:
		inc	[bp+var_2]

loc_60DEE:
		cmp	[bp+var_2], 8
		jl	short loc_60DD1
		push	word_4D36C
		mov	ax, si
		add	ax, 0Ch
		push	ax
		call	TextFormat_ApplyStyleAttribute_357D1
		add	sp, 4
		mov	word ptr [si+10h], 0
		mov	word ptr [si+12h], 18h
		mov	word ptr [si+14h], 13Fh
		mov	word ptr [si+16h], 97h
		mov	word ptr [si+1Eh], 0
		mov	word ptr [si+20h], 0
		mov	word ptr [si+22h], 13Fh
		mov	word ptr [si+24h], 0C7h
		push	0
		mov	ax, si
		add	ax, 1Ah
		push	ax
		call	TextRenderer_ApplyFormatChange_3584E
		add	sp, 4
		push	ds
		push	offset unk_49923
		push	ds
		push	offset aConvfontShp
		push	ds
		push	offset aDataFonts
		lea	ax, [bp+var_60]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		mov	[bp+var_C], 0
		mov	[bp+var_8], 2
		mov	[bp+var_7], 0
		mov	[bp+var_6], 0
		push	2
		lea	ax, [bp+var_60]
		push	ax
		call	TextRenderer_LoadResourceFile_437A9
		add	sp, 4
		mov	word ptr [bp+var_10+2], dx
		mov	word ptr [bp+var_10], ax
		mov	eax, [bp+var_10]
		mov	[bp+var_C], eax
		mov	[bp+var_8], 2
		mov	[bp+var_7], 1
		mov	[bp+var_6], 0
		lea	ax, word ptr [bp+var_C]
		push	ax
		mov	ax, si
		add	ax, 2Ch
		push	ax
		call	sub_36C9D
		add	sp, 4
		cmp	[bp+var_7], 0
		jz	short loc_60ED0
		cmp	[bp+var_C], 0
		jz	short loc_60ED0
		push	0
		mov	al, [bp+var_8]
		push	ax
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_60ED0

loc_60ED0:
		mov	[bp+var_C], 0
		mov	[bp+var_7], 0
		mov	[bp+var_6], 0
		pop	si
		leave
		retf
Conv_Init_60DA0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Conv_Construct_59B67 (sub_59B67 de OPTEST.EXE). Résumé
; repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-22. Objet
; conversation (6Eh octets, alloué si nul) : Conv_Init_59A20, chaînes du joueur [+28h] =
; arg_4, tampon des équipiers et réponse [+2Ah] = arg_6, entrée du PAK [+6Dh] = arg_2, puis
; Conv_LoadScriptFromPak_59DAA.
; ==============================================================================================
Conv_Construct_60EE7		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_60F05
		push	6Eh
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jnz	short loc_60F05
		jmp	loc_60F9C

loc_60F05:
		xor	eax, eax
		mov	[si+4], eax
		mov	[si], eax
		mov	dword ptr [si+8], 0
		mov	word ptr [si+0Ch], 0
		mov	word ptr [si+0Eh], 0
		mov	byte ptr [si+19h], 0
		mov	word ptr [si+1Ah], 0
		mov	word ptr [si+1Ch], 0
		mov	byte ptr [si+27h], 0
		mov	ax, si
		add	ax, 2Ch
		push	ax
		call	GlyphObject_AllocateBuffer_36D18
		add	sp, 2
		mov	word ptr [si+43h], 1E4h
		xor	ax, ax
		mov	[si+47h], ax
		mov	[si+45h], ax
		mov	word ptr [si+43h], 12D3h
		mov	dword ptr [si+61h], 0
		mov	byte ptr [si+65h], 2
		mov	byte ptr [si+66h], 0
		mov	dword ptr [si+67h], 0
		mov	ax, si
		add	ax, 43h
		push	ax
		call	sub_71BD
		add	sp, 2
		push	si
		push	cs
		call	near ptr Conv_Init_60DA0
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
		call	near ptr sub_6112A
		add	sp, 2

loc_60F9C:
		mov	ax, si
		pop	si
		pop	bp
		retf
Conv_Construct_60EE7		endp

; START OF FUNCTION CHUNK FOR Conv_Construct_60EE7
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR Conv_Construct_60EE7

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_60FA4		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_60FC2
		push	6Eh
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jnz	short loc_60FC2
		jmp	loc_61056

loc_60FC2:
		xor	eax, eax
		mov	[si+4], eax
		mov	[si], eax
		mov	dword ptr [si+8], 0
		mov	word ptr [si+0Ch], 0
		mov	word ptr [si+0Eh], 0
		mov	byte ptr [si+19h], 0
		mov	word ptr [si+1Ah], 0
		mov	word ptr [si+1Ch], 0
		mov	byte ptr [si+27h], 0
		mov	ax, si
		add	ax, 2Ch
		push	ax
		call	GlyphObject_AllocateBuffer_36D18
		add	sp, 2
		mov	word ptr [si+43h], 1E4h
		xor	ax, ax
		mov	[si+47h], ax
		mov	[si+45h], ax
		mov	word ptr [si+43h], 12D3h
		mov	dword ptr [si+61h], 0
		mov	byte ptr [si+65h], 2
		mov	byte ptr [si+66h], 0
		mov	dword ptr [si+67h], 0
		mov	ax, si
		add	ax, 43h
		push	ax
		call	sub_71BD
		add	sp, 2
		push	si
		push	cs
		call	near ptr Conv_Init_60DA0
		add	sp, 2
		mov	ax, [bp+arg_4]
		mov	[si+28h], ax
		mov	ax, [bp+arg_6]
		mov	[si+2Ah], ax
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr sub_6120E
		add	sp, 4

loc_61056:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_60FA4		endp

; START OF FUNCTION CHUNK FOR sub_60FA4
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_60FA4

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6105E		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_61070
		jmp	loc_61126

loc_61070:
		push	si
		nop
		push	cs
		call	near ptr sub_612B5
		add	sp, 2
		mov	word ptr [si+43h], 12D3h
		mov	ax, si
		add	ax, 43h
		push	ax
		call	sub_71E4
		add	sp, 2
		cmp	byte ptr [si+66h], 0
		jz	short loc_610B2
		cmp	dword ptr [si+61h], 0
		jz	short loc_610B2
		push	0
		mov	al, [si+65h]
		push	ax
		mov	ax, si
		add	ax, 61h
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_610B2

loc_610B2:
		mov	dword ptr [si+61h], 0
		mov	byte ptr [si+66h], 0
		mov	dword ptr [si+67h], 0
		mov	word ptr [si+43h], 1E4h
		mov	ax, si
		add	ax, 43h
		push	ax
		call	sub_36702
		add	sp, 2
		push	2
		mov	ax, si
		add	ax, 2Ch
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		mov	ax, si
		add	ax, 1Ah
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		mov	ax, si
		add	ax, 0Ch
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		xor	eax, eax
		mov	[si+4], eax
		mov	[si], eax
		mov	dword ptr [si+8], 0
		test	di, 1
		jz	short loc_61126
		push	si
		call	sub_39C
		add	sp, 2

loc_61126:
		pop	di
		pop	si
		pop	bp
		retf
sub_6105E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6112A		proc far

var_D6		= word ptr -0D6h
var_75		= dword ptr -75h
var_69		= word ptr -69h
var_65		= dword ptr -65h
var_5E		= word ptr -5Eh
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0D6h
		push	si
		mov	si, [bp+arg_0]
		push	ds
		push	offset aPak
		push	ds
		push	offset aConv2
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_5E]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_5E]
		push	ax
		lea	ax, [bp+var_D6]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		lea	ax, [bp+var_D6]
		push	ax
		call	sub_435F1
		add	sp, 2
		mov	al, [si+6Dh]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_D6]
		push	ax
		call	IndexedRecordReader_AdvanceIndex_436B6
		add	sp, 4
		mov	ax, [bp+var_69]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_61191
		mov	eax, [bp+var_75]
		jmp	short loc_61195

loc_61191:
		mov	eax, [bp+var_65]

loc_61195:
		mov	[bp+var_4], eax
		push	1
		push	0
		push	2
		push	large [bp+var_4]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
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
		call	sub_43519
		add	sp, 8
		mov	eax, [bp+var_8]
		mov	[bp+var_C], eax
		mov	ax, word ptr [bp+var_4]
		mov	[bp+var_E], ax
		mov	eax, [bp+var_C]
		mov	[si+4], eax
		mov	[si], eax
		movzx	eax, [bp+var_E]
		mov	[si+8], eax
		lea	ax, [bp+var_D6]
		push	ax
		call	sub_4123E
		add	sp, 2
		push	2
		lea	ax, [bp+var_D6]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		pop	si
		leave
		retf
sub_6112A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6120E		proc far

var_6C		= word ptr -6Ch
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
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
		call	StreamReader_ConstructVariantC_40F6E
		add	sp, 6
		lea	ax, [bp+var_6C]
		push	ax
		call	StreamReader_GetCapacity_4154E
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		mov	[bp+var_4], eax
		push	1
		push	0
		push	2
		push	large [bp+var_4]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		push	large 0FFFFFFFFh
		push	large [bp+var_4]
		push	word ptr [bp+var_8+2]
		push	word ptr [bp+var_8]
		lea	ax, [bp+var_6C]
		push	ax
		call	StreamReader_ReadTyped_4148D
		add	sp, 0Eh
		mov	eax, [bp+var_8]
		mov	[bp+var_C], eax
		mov	ax, word ptr [bp+var_4]
		mov	[bp+var_E], ax
		mov	eax, [bp+var_C]
		mov	[si+4], eax
		mov	[si], eax
		movzx	eax, [bp+var_E]
		mov	[si+8], eax
		lea	ax, [bp+var_6C]
		push	ax
		call	sub_4123E
		add	sp, 2
		push	2
		lea	ax, [bp+var_6C]
		push	ax
		call	StreamReader_Close_410AA
		add	sp, 4
		pop	si
		leave
		retf
sub_6120E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_612B5		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	0
		push	2
		push	si
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		pop	si
		pop	bp
		retf
sub_612B5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Debris_GetSubpartAttrib (sub_381F2 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,14L — accesseur
; d'un champ (+0x13 via référence +0xE) : getter d'un attribut de sous-composant.
; ==============================================================================================
Debris_GetSubpartAttrib_612CF		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	bx, dx
		les	bx, [bx+4]
		mov	al, es:[bx]
		pop	bp
		retf
Debris_GetSubpartAttrib_612CF		endp

; START OF FUNCTION CHUNK FOR Debris_GetSubpartAttrib_612CF
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR Debris_GetSubpartAttrib_612CF

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 8 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Conv_DrawText_59F54 (sub_59F54 de OPTEST.EXE). Résumé
; repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-22.
; Affiche un texte de conversation : remplace $S $N $C (chaînes du joueur
; [[conv+28h]+0/+2/+4]), $W $L $O (équipiers [conv+2Ah]+1/+15h/+29h), $A $B (table dseg 0ED8h,
; indices [conv+6Bh]/[conv+6Ch]), $P $T (nombres [[conv+28h]+6/+8] + « plane(s) ») ; coupe aux
; espaces en lignes de 30 caractères, y = 4 + 15 × ligne, format « %Y%J%S ».
; ==============================================================================================
Conv_DrawText_612E1		proc far

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
		jmp	loc_614F2

loc_6130C:
		mov	ax, di
		sub	ax, [bp+var_4]
		push	ax
		push	[bp+var_4]
		lea	ax, [bp+var_19C]
		push	ax
		call	sub_2CC5
		add	sp, 6
		cmp	byte ptr [di+1], 53h
		jnz	short loc_61340
		mov	bx, [si+28h]
		push	word ptr [bx]
		lea	ax, [bp+var_19C]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		add	di, 2
		jmp	loc_614EF

loc_61340:
		cmp	byte ptr [di+1], 4Eh
		jnz	short loc_6135F
		mov	bx, [si+28h]
		push	word ptr [bx+2]
		lea	ax, [bp+var_19C]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		add	di, 2
		jmp	loc_614EF

loc_6135F:
		cmp	byte ptr [di+1], 43h
		jnz	short loc_6137E
		mov	bx, [si+28h]
		push	word ptr [bx+4]
		lea	ax, [bp+var_19C]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		add	di, 2
		jmp	loc_614EF

loc_6137E:
		cmp	byte ptr [di+1], 57h
		jnz	short loc_6139C
		mov	ax, [si+2Ah]
		inc	ax
		push	ax
		lea	ax, [bp+var_19C]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		add	di, 2
		jmp	loc_614EF

loc_6139C:
		cmp	byte ptr [di+1], 4Ch
		jnz	short loc_613BC
		mov	ax, [si+2Ah]
		add	ax, 15h
		push	ax
		lea	ax, [bp+var_19C]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		add	di, 2
		jmp	loc_614EF

loc_613BC:
		cmp	byte ptr [di+1], 4Fh
		jnz	short loc_613DC
		mov	ax, [si+2Ah]
		add	ax, 29h
		push	ax
		lea	ax, [bp+var_19C]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		add	di, 2
		jmp	loc_614EF

loc_613DC:
		cmp	byte ptr [di+1], 41h
		jnz	short loc_61402
		mov	al, [si+6Bh]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0EA6h]
		lea	ax, [bp+var_19C]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		add	di, 2
		jmp	loc_614EF

loc_61402:
		cmp	byte ptr [di+1], 42h
		jnz	short loc_61428
		mov	al, [si+6Ch]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0EA6h]
		lea	ax, [bp+var_19C]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		add	di, 2
		jmp	loc_614EF

loc_61428:
		cmp	byte ptr [di+1], 50h
		jnz	short loc_61483
		push	0Ah
		lea	ax, [bp+var_1B0]
		push	ax
		mov	bx, [si+28h]
		push	word ptr [bx+6]
		call	CRT_Itoa_Signed10
		add	sp, 6
		push	0F44h
		lea	ax, [bp+var_1B0]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		mov	bx, [si+28h]
		cmp	word ptr [bx+6], 1
		jz	short loc_6146C
		push	0F4Bh
		lea	ax, [bp+var_1B0]
		push	ax
		call	CRT_Strcat
		add	sp, 4

loc_6146C:
		lea	ax, [bp+var_1B0]
		push	ax
		lea	ax, [bp+var_19C]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		add	di, 2
		jmp	short loc_614EF

loc_61483:
		cmp	byte ptr [di+1], 54h
		jnz	short loc_614DE
		push	0Ah
		lea	ax, [bp+var_1B0]
		push	ax
		mov	bx, [si+28h]
		push	word ptr [bx+8]
		call	CRT_Itoa_Signed10
		add	sp, 6
		push	0F4Dh
		lea	ax, [bp+var_1B0]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		mov	bx, [si+28h]
		cmp	word ptr [bx+8], 1
		jz	short loc_614C7
		push	0F54h
		lea	ax, [bp+var_1B0]
		push	ax
		call	CRT_Strcat
		add	sp, 4

loc_614C7:
		lea	ax, [bp+var_1B0]
		push	ax
		lea	ax, [bp+var_19C]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		add	di, 2
		jmp	short loc_614EF

loc_614DE:
		inc	di
		push	0F56h
		lea	ax, [bp+var_19C]
		push	ax
		call	CRT_Strcat
		add	sp, 4

loc_614EF:
		mov	[bp+var_4], di

loc_614F2:
		push	24h
		push	[bp+var_4]
		call	CRT_Strchr_WordAligned
		add	sp, 4
		mov	di, ax
		or	ax, ax
		jz	short loc_61508
		jmp	loc_6130C

loc_61508:
		push	[bp+var_4]
		lea	ax, [bp+var_19C]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		push	[bp+var_2]
		call	sub_330E8
		add	sp, 2
		lea	ax, [bp+var_19C]
		push	ax
		call	CRT_Strdup
		add	sp, 2
		mov	[bp+var_2], ax
		mov	ax, [bp+var_2]
		mov	[bp+var_6], ax
		mov	[bp+var_8], 4
		jmp	short loc_61591

loc_61540:
		cmp	[bp+var_A], 1Eh
		jle	short loc_61566
		mov	[bp+var_C], 1Eh
		jmp	short loc_61550

loc_6154D:
		dec	[bp+var_C]

loc_61550:
		mov	bx, [bp+var_6]
		add	bx, [bp+var_C]
		cmp	byte ptr [bx], 20h
		jnz	short loc_6154D
		mov	bx, [bp+var_6]
		add	bx, [bp+var_C]
		mov	byte ptr [bx], 0
		jmp	short loc_6156D

loc_61566:
		mov	ax, [bp+var_A]
		dec	ax
		mov	[bp+var_C], ax

loc_6156D:
		push	[bp+var_6]
		push	2
		push	[bp+var_8]
		push	0F58h
		push	[bp+arg_2]
		call	Widget_RenderComplexLayoutWrapper_375C2
		add	sp, 0Ah
		add	[bp+var_8], 0Fh
		mov	ax, [bp+var_C]
		add	ax, [bp+var_6]
		inc	ax
		mov	[bp+var_6], ax

loc_61591:
		push	[bp+var_6]
		call	CRT_Strlen
		add	sp, 2
		mov	[bp+var_A], ax
		or	ax, ax
		jnz	short loc_61540
		push	[bp+var_2]
		call	sub_330E8
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
Conv_DrawText_612E1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_615B2		proc far

var_10A		= word ptr -10Ah
var_AD		= dword ptr -0ADh
var_A9		= dword ptr -0A9h
var_A5		= dword ptr -0A5h
var_94		= dword ptr -94h
var_62		= word ptr -62h
var_12		= word ptr -12h
var_9		= byte ptr -9
var_8		= dword ptr -8
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
		push	offset aIff
		push	ds
		push	offset aConvdat2
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_62]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_10A]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_10A], 480h
		mov	[bp+var_A9], 100h
		mov	[bp+var_AD], 0
		mov	[bp+var_10A], 498h
		push	1
		lea	ax, [bp+var_62]
		push	ax
		lea	ax, [bp+var_10A]
		push	ax
		mov	bx, [bp+var_10A]
		call	dword ptr [bx+14h]
		add	sp, 6
		cmp	[bp+arg_2], 0
		jnz	short loc_61635
		push	0
		push	large dword_4993F
		lea	ax, [bp+var_10A]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		jmp	short loc_6169D

loc_61635:
		cmp	[bp+arg_2], 1
		jnz	short loc_61651
		push	0
		push	large dword_49944
		lea	ax, [bp+var_10A]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		jmp	short loc_6169D

loc_61651:
		cmp	[bp+arg_2], 2
		jnz	short loc_6166D
		push	0
		push	large dword_49949
		lea	ax, [bp+var_10A]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		jmp	short loc_6169D

loc_6166D:
		cmp	[bp+arg_2], 3
		jnz	short loc_61689
		push	0
		push	large dword_4994E
		lea	ax, [bp+var_10A]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		jmp	short loc_6169D

loc_61689:
		push	0
		push	large dword_49953
		lea	ax, [bp+var_10A]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8

loc_6169D:
		mov	[bp+var_1], 0
		jmp	short loc_616D9

loc_616A3:
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
		jnz	short loc_616CF
		mov	[bp+var_1], 1
		jmp	short loc_616F1
		jmp	short loc_616D9

loc_616CF:
		mov	eax, [bp+var_94]
		mov	[bp+var_A5], eax

loc_616D9:
		push	1
		push	large dword_49958
		lea	ax, [bp+var_10A]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jnz	short loc_616A3

loc_616F1:
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6170B
		mov	al, [bp+arg_2]
		mov	ah, 0
		push	ax
		push	0F7Dh
		call	Runtime_FatalErrorHandler_36797
		add	sp, 4

loc_6170B:
		lea	ax, [bp+var_10A]
		push	ax
		call	ResourceRecord_ReadFinalField_42B64
		add	sp, 2
		mov	[bp+var_2], al
		lea	ax, [bp+var_10A]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		cmp	[bp+arg_2], 0
		jz	short loc_61734
		cmp	[bp+arg_2], 1
		jnz	short loc_6176E

loc_61734:
		cmp	[bp+var_2], 5Ch
		jbe	short loc_61754
		push	ds
		push	offset aPak
		push	ds
		push	offset aConvshp2
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_62]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		jmp	short loc_6176C

loc_61754:
		push	ds
		push	offset aPak
		push	ds
		push	offset aConvshps
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_62]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh

loc_6176C:
		jmp	short loc_61786

loc_6176E:
		push	ds
		push	offset aPak
		push	ds
		push	offset aConvpals
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_62]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh

loc_61786:
		mov	al, [bp+var_2]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_62]
		push	ax
		mov	ax, si
		add	ax, 43h
		push	ax
		call	sub_7281
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
		mov	[di+4], al
		mov	byte ptr [di+5], 0
		mov	dword ptr [di+6], 0
		mov	bx, [bp+var_4]
		mov	eax, [bx+6]
		mov	[di+6], eax
		mov	[bp+var_10A], 498h
		lea	ax, [bp+var_10A]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_10A]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_615B2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à ConvData_FindFace_5A451
; (sub_5A451 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — far, LUE 2026-10-22. ConvData_LookupByName_5A225(conv, 0 = FACE, nom, sortie).
; ==============================================================================================
ConvData_FindFace_617FE		proc far

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
		call	near ptr sub_615B2
		add	sp, 0Ah
		pop	si
		pop	bp
		retf
ConvData_FindFace_617FE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ConvData_FindFacePalette_5A46F (sub_5A46F de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far,
; LUE 2026-10-22. ConvData_LookupByName_5A225(conv, 2 = FCPL, « normal » si arg_6 = 0, « night
; » sinon, sortie). Seul appel vu : Conv_PlayScript_5AA4E, avec arg_6 = 0 (push 0) → les
; conversations prennent toujours la palette de visage « normal ».
; ==============================================================================================
ConvData_FindFacePalette_6181C		proc far

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
		jnz	short loc_61841
		mov	al, [bp+arg_4]
		push	ax
		push	di
		push	0FACh
		push	2
		push	si
		push	cs
		call	near ptr sub_615B2
		add	sp, 0Ah
		jmp	short loc_61853

loc_61841:
		mov	al, [bp+arg_4]
		push	ax
		push	di
		push	0FB3h
		push	2
		push	si
		push	cs
		call	near ptr sub_615B2
		add	sp, 0Ah

loc_61853:
		pop	di
		pop	si
		pop	bp
		retf
ConvData_FindFacePalette_6181C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; ConvData_FindFigure_5A4AA (sub_5A4AA de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants
; et contexte à revérifier ici. — far, LUE 2026-10-22. ConvData_LookupByName_5A225(conv, 1 =
; FIGR, nom, sortie) : forme d'une figure de scène de groupe.
; ==============================================================================================
ConvData_FindFigure_61857		proc far

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
		call	near ptr sub_615B2
		add	sp, 0Ah
		pop	si
		pop	bp
		retf
ConvData_FindFigure_61857		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ConvData_FindFigurePalette_5A4C8 (sub_5A4C8 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far,
; LUE 2026-10-22. ConvData_LookupByName_5A225(conv, 3 = FGPL, « normal », sortie).
; ==============================================================================================
ConvData_FindFigurePalette_61875		proc far

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
		push	0FB9h
		push	3
		push	si
		push	cs
		call	near ptr sub_615B2
		add	sp, 0Ah
		pop	si
		pop	bp
		retf
ConvData_FindFigurePalette_61875		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_61893		proc far

var_262		= word ptr -262h
var_212		= word ptr -212h
var_1C2		= word ptr -1C2h
var_172		= word ptr -172h
var_122		= word ptr -122h
var_C5		= dword ptr -0C5h
var_C1		= dword ptr -0C1h
var_BD		= dword ptr -0BDh
var_B0		= dword ptr -0B0h
var_AC		= dword ptr -0ACh
var_7A		= word ptr -7Ah
var_29		= byte ptr -29h
var_28		= dword ptr -28h
var_24		= word ptr -24h
var_21		= byte ptr -21h
var_20		= dword ptr -20h
var_1C		= word ptr -1Ch
var_19		= byte ptr -19h
var_18		= dword ptr -18h
var_14		= word ptr -14h
var_11		= byte ptr -11h
var_10		= dword ptr -10h
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
		push	offset aIff
		push	ds
		push	offset aConvdat2
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_7A]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_122]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_122], 480h
		mov	[bp+var_C1], 100h
		mov	[bp+var_C5], 0
		mov	[bp+var_122], 498h
		push	1
		lea	ax, [bp+var_7A]
		push	ax
		lea	ax, [bp+var_122]
		push	ax
		mov	bx, [bp+var_122]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	ds
		push	offset aPak
		push	ds
		push	offset aOptshps
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_172]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	ds
		push	offset aPak
		push	ds
		push	offset aOptpals
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_1C2]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	ds
		push	offset aPak
		push	ds
		push	offset aConvpals
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_262]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		mov	[bp+var_1], 0
		push	0
		push	large dword_499A0
		lea	ax, [bp+var_122]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		jmp	short loc_619CE

loc_6195C:
		push	0
		push	large dword_499AA
		lea	ax, [bp+var_122]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_619AC
		lea	ax, [bp+var_C]
		push	ax
		call	sub_1109C
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
		jnz	short loc_619AA
		mov	[bp+var_1], 1
		jmp	short loc_619E9

loc_619AA:
		jmp	short loc_619B7

loc_619AC:
		push	0FCFh
		call	Runtime_FatalErrorHandler_36797
		add	sp, 2

loc_619B7:
		mov	eax, [bp+var_AC]
		mov	[bp+var_BD], eax
		lea	ax, [bp+var_122]
		push	ax
		call	ResourceRecord_ReleaseAndClear_42D38
		add	sp, 2

loc_619CE:
		push	1
		push	large dword_499A5
		lea	ax, [bp+var_122]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		or	ax, ax
		jz	short loc_619E9
		jmp	loc_6195C

loc_619E9:
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_619FD
		push	0FF1h
		call	Runtime_FatalErrorHandler_36797
		add	sp, 2

loc_619FD:
		mov	eax, [bp+var_AC]
		mov	[bp+var_BD], eax
		push	0
		push	large dword_499F7
		lea	ax, [bp+var_122]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jnz	short loc_61A22
		jmp	loc_61DDE

loc_61A22:
		mov	eax, [bp+var_B0]
		mov	ebx, 5
		cdq
		idiv	ebx
		mov	[bp+var_2], al
		push	seg stub192
		push	offset sub_479E5
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
		push	seg stub192
		push	offset sub_479E5
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
		jmp	loc_61DC2

loc_61A90:
		lea	ax, [bp+var_122]
		push	ax
		call	ResourceRecord_ReadFinalField_42B64
		add	sp, 2
		mov	[bp+var_7], al
		lea	ax, [bp+var_122]
		push	ax
		call	ResourceRecord_ReadFinalField_42B64
		add	sp, 2
		mov	[bp+var_8], al
		lea	ax, [bp+var_122]
		push	ax
		call	ResourceRecord_ReadFinalField_42B64
		add	sp, 2
		mov	[bp+var_9], al
		cmp	[bp+var_7], 0
		jz	short loc_61AC9
		jmp	loc_61C4A

loc_61AC9:
		cmp	[bp+var_8], 5Dh
		jnb	short loc_61AEA
		push	ds
		push	offset aPak
		push	ds
		push	offset aConvshps
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_212]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		jmp	short loc_61B03

loc_61AEA:
		push	ds
		push	offset aPak
		push	ds
		push	offset aConvshp2
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_212]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh

loc_61B03:
		mov	al, [bp+var_8]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_212]
		push	ax
		mov	ax, di
		add	ax, 43h
		push	ax
		call	sub_7281
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
		mov	[bx+2], ax
		mov	[bx], dx
		mov	ax, [bp+var_6]
		mov	dx, 0Ah
		imul	dx
		mov	bx, [bp+arg_4]
		mov	bx, [bx]
		add	bx, ax
		mov	al, [bp+var_11]
		mov	[bx+4], al
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
		mov	[bx+6], eax
		mov	al, [bp+var_9]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_262]
		push	ax
		mov	ax, di
		add	ax, 43h
		push	ax
		call	sub_7281
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
		mov	[bx+2], ax
		mov	[bx], dx
		mov	ax, [bp+var_6]
		mov	dx, 0Ah
		imul	dx
		mov	bx, [bp+arg_6]
		mov	bx, [bx]
		add	bx, ax
		mov	al, [bp+var_19]
		mov	[bx+4], al
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
		mov	[bx+6], eax
		jmp	loc_61DA4

loc_61C4A:
		cmp	[bp+var_7], 1
		jz	short loc_61C53
		jmp	loc_61D99

loc_61C53:
		mov	al, [bp+var_8]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_172]
		push	ax
		mov	ax, di
		add	ax, 43h
		push	ax
		call	sub_7281
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
		mov	[bx+2], ax
		mov	[bx], dx
		mov	ax, [bp+var_6]
		mov	dx, 0Ah
		imul	dx
		mov	bx, [bp+arg_4]
		mov	bx, [bx]
		add	bx, ax
		mov	al, [bp+var_21]
		mov	[bx+4], al
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
		mov	[bx+6], eax
		mov	al, [bp+var_9]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_1C2]
		push	ax
		mov	ax, di
		add	ax, 43h
		push	ax
		call	sub_7281
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
		mov	[bx+2], ax
		mov	[bx], dx
		mov	ax, [bp+var_6]
		mov	dx, 0Ah
		imul	dx
		mov	bx, [bp+arg_6]
		mov	bx, [bx]
		add	bx, ax
		mov	al, [bp+var_29]
		mov	[bx+4], al
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
		mov	[bx+6], eax
		jmp	short loc_61DA4

loc_61D99:
		push	101Ch
		call	Runtime_FatalErrorHandler_36797
		add	sp, 2

loc_61DA4:
		lea	ax, [bp+var_122]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	dx, [bp+var_6]
		shl	dx, 1
		mov	bx, [bp+arg_8]
		mov	bx, [bx]
		add	bx, dx
		mov	[bx], ax
		inc	[bp+var_6]

loc_61DC2:
		mov	al, [bp+var_2]
		mov	ah, 0
		cmp	ax, [bp+var_6]
		jle	short loc_61DCF
		jmp	loc_61A90

loc_61DCF:
		lea	ax, [bp+var_122]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		jmp	short loc_61DE9

loc_61DDE:
		push	103Dh
		call	Runtime_FatalErrorHandler_36797
		add	sp, 2

loc_61DE9:
		mov	al, [bp+var_2]
		mov	[bp+var_3], al
		mov	[bp+var_122], 498h
		lea	ax, [bp+var_122]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_122]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4
		mov	al, [bp+var_3]
		pop	di
		pop	si
		leave
		retf
sub_61893		endp

; START OF FUNCTION CHUNK FOR sub_61893
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_61893

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_61E1C		proc far

var_3D2		= word ptr -3D2h
var_3D0		= word ptr -3D0h
var_3CE		= word ptr -3CEh
var_3CC		= word ptr -3CCh
var_3C2		= word ptr -3C2h
var_3C0		= byte ptr -3C0h
var_3BF		= word ptr -3BFh
var_3BC		= word ptr -3BCh
var_3BA		= byte ptr -3BAh
var_3B9		= word ptr -3B9h
var_3B6		= word ptr -3B6h
var_3B4		= word ptr -3B4h
var_3B2		= byte ptr -3B2h
var_3B1		= word ptr -3B1h
var_3B0		= word ptr -3B0h
var_3AF		= word ptr -3AFh
var_3AE		= word ptr -3AEh
var_3AC		= word ptr -3ACh
var_3A2		= word ptr -3A2h
var_392		= word ptr -392h
var_390		= word ptr -390h
var_38E		= word ptr -38Eh
var_38C		= word ptr -38Ch
var_38A		= word ptr -38Ah
var_388		= word ptr -388h
var_384		= word ptr -384h
var_382		= word ptr -382h
var_380		= word ptr -380h
var_37E		= word ptr -37Eh
var_37C		= word ptr -37Ch
var_37A		= word ptr -37Ah
var_376		= word ptr -376h
var_374		= word ptr -374h
var_35E		= word ptr -35Eh
var_35C		= word ptr -35Ch
var_35A		= word ptr -35Ah
var_359		= word ptr -359h
var_358		= word ptr -358h
var_356		= word ptr -356h
var_354		= word ptr -354h
var_352		= word ptr -352h
var_350		= word ptr -350h
var_34F		= word ptr -34Fh
var_34E		= word ptr -34Eh
var_34C		= word ptr -34Ch
var_34A		= word ptr -34Ah
var_348		= word ptr -348h
var_346		= word ptr -346h
var_345		= dword ptr -345h
var_342		= word ptr -342h
var_341		= dword ptr -341h
var_33E		= word ptr -33Eh
var_33D		= dword ptr -33Dh
var_33A		= word ptr -33Ah
var_338		= word ptr -338h
var_336		= word ptr -336h
var_334		= word ptr -334h
var_332		= word ptr -332h
var_330		= word ptr -330h
var_32C		= dword ptr -32Ch
var_326		= word ptr -326h
var_31A		= word ptr -31Ah
var_314		= word ptr -314h
var_312		= word ptr -312h
var_304		= dword ptr -304h
var_300		= byte ptr -300h
var_2FF		= byte ptr -2FFh
var_2FE		= dword ptr -2FEh
var_2FA		= word ptr -2FAh
var_282		= word ptr -282h
var_280		= word ptr -280h
var_260		= word ptr -260h
var_203		= dword ptr -203h
var_1FF		= dword ptr -1FFh
var_1FB		= dword ptr -1FBh
var_1E6		= word ptr -1E6h
var_1E4		= word ptr -1E4h
var_1B8		= dword ptr -1B8h
var_1B4		= byte ptr -1B4h
var_1B3		= byte ptr -1B3h
var_1B2		= dword ptr -1B2h
var_1AE		= byte ptr -1AEh
var_1AD		= byte ptr -1ADh
var_1AC		= byte ptr -1ACh
var_1A8		= byte ptr -1A8h
var_158		= word ptr -158h
var_108		= word ptr -108h
var_B8		= dword ptr -0B8h
var_B4		= dword ptr -0B4h
var_B0		= word ptr -0B0h
var_AE		= word ptr -0AEh
var_AA		= dword ptr -0AAh
var_A6		= dword ptr -0A6h
var_A2		= word ptr -0A2h
var_A0		= word ptr -0A0h
var_9E		= dword ptr -9Eh
var_9C		= dword ptr -9Ch
var_9A		= dword ptr -9Ah
var_98		= dword ptr -98h
var_94		= word ptr -94h
var_92		= dword ptr -92h
var_90		= dword ptr -90h
var_8E		= dword ptr -8Eh
var_8C		= dword ptr -8Ch
var_88		= word ptr -88h
var_86		= word ptr -86h
var_84		= word ptr -84h
var_82		= word ptr -82h
var_80		= word ptr -80h
var_7F		= word ptr -7Fh
var_7E		= word ptr -7Eh
var_7C		= word ptr -7Ch
var_7A		= word ptr -7Ah
var_79		= word ptr -79h
var_78		= word ptr -78h
var_76		= word ptr -76h
var_75		= word ptr -75h
var_74		= word ptr -74h
var_73		= word ptr -73h
var_72		= dword ptr -72h
var_70		= dword ptr -70h
var_6D		= word ptr -6Dh
var_6C		= dword ptr -6Ch
var_6A		= dword ptr -6Ah
var_68		= dword ptr -68h
var_64		= dword ptr -64h
var_62		= dword ptr -62h
var_5E		= word ptr -5Eh
var_5C		= word ptr -5Ch
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
var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3D		= word ptr -3Dh
var_3B		= word ptr -3Bh
var_3A		= word ptr -3Ah
var_38		= byte ptr -38h
var_37		= byte ptr -37h
var_36		= word ptr -36h
var_34		= word ptr -34h
var_32		= word ptr -32h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_2C		= word ptr -2Ch
var_29		= byte ptr -29h
var_28		= byte ptr -28h
var_27		= byte ptr -27h
var_26		= word ptr -26h
var_1F		= byte ptr -1Fh
var_1E		= word ptr -1Eh
var_19		= byte ptr -19h
var_18		= byte ptr -18h
var_17		= byte ptr -17h
var_16		= word ptr -16h
var_C		= word ptr -0Ch
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 3C2h
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	byte_4F55C, 0
		mov	byte ptr [bp+var_C], 0
		mov	byte ptr [bp+var_16], 0
		mov	[bp+var_17], 0
		mov	bx, [di+2Ah]
		mov	byte ptr [bx], 0
		mov	[bp+var_1F], 0
		lea	ax, [bp+var_260]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_260], 480h
		mov	[bp+var_1FF], 100h
		mov	[bp+var_203], 0
		mov	[bp+var_260], 498h
		mov	[bp+var_1E4], 0
		xor	ax, ax
		mov	[bp+var_1E6], ax
		movsx	eax, ax
		mov	[bp+var_1FB], eax
		mov	[bp+var_1B8], 0
		mov	[bp+var_1B4], 2
		mov	[bp+var_1B3], 0
		mov	[bp+var_1B2], 0
		mov	al, 0
		mov	[bp+var_1AC], al
		mov	[bp+var_1AD], al
		mov	[bp+var_1AE], al
		mov	[bp+var_1A8], al
		push	1062h
		lea	ax, [bp+var_260]
		push	ax
		call	sub_545D
		add	sp, 4
		mov	[bp+var_28], al
		jmp	loc_65C96

loc_61EC7:
		mov	[bp+var_29], 0
		call	Input_Flush_116D1
		les	bx, [di+4]
		inc	word ptr [di+4]
		mov	al, es:[bx]
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 12h
		jbe	short loc_61EE5
		jmp	loc_65C8C

loc_61EE5:
		shl	bx, 1
		jmp	cs:off_65D39[bx]	; switch jump

loc_61EEC:
		jmp	loc_65C8E

loc_61EEF:
		cmp	byte_4F55C, 0
		jz	short loc_61F5B
		cmp	[bp+var_1B3], 0
		jz	short loc_61F1E
		cmp	[bp+var_1B8], 0
		jz	short loc_61F1E
		push	0
		mov	al, [bp+var_1B4]
		push	ax
		lea	ax, word ptr [bp+var_1B8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_61F1E

loc_61F1E:
		mov	[bp+var_1B8], 0
		mov	[bp+var_1B3], 0
		mov	[bp+var_1B2], 0
		mov	[bp+var_260], 498h
		lea	ax, [bp+var_260]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_260]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4
		pop	di
		pop	si
		leave
		retf

loc_61F5B:
		mov	[bp+var_32], 0
		mov	[bp+var_30], 98h
		mov	[bp+var_2E], 13Fh
		mov	[bp+var_2C], 0C7h
		mov	ax, di
		add	ax, 2Ch
		push	ax
		push	word_4D36E
		sub	sp, 8
		mov	ax, [bp+var_32]
		mov	[bp+var_3D2], ax
		mov	ax, [bp+var_30]
		mov	[bp+var_3D0], ax
		mov	ax, [bp+var_2E]
		mov	[bp+var_3CE], ax
		mov	ax, [bp+var_2C]
		mov	[bp+var_3CC], ax
		lea	ax, [bp+var_282]
		push	ax
		call	sub_30A1D
		add	sp, 0Eh
		mov	[bp+var_3A], 12C3h
		mov	[bp+var_38], 0Ah
		mov	[bp+var_3A], 12CBh
		mov	[bp+var_36], 0
		mov	[bp+var_34], 0
		push	di
		lea	ax, [bp+var_3A]
		push	ax
		call	sub_9796
		add	sp, 4
		push	0
		lea	ax, [bp+var_282]
		push	ax
		call	sub_30AD0
		add	sp, 4
		mov	al, [bp+var_37]
		mov	byte ptr [bp+var_3B], al
		lea	ax, [bp+var_3B]
		push	ax
		mov	ax, di
		add	ax, 2Ch
		push	ax
		mov	bx, [di+2Ch]
		call	dword ptr [bx+10h]
		add	sp, 4
		push	[bp+var_36]
		lea	ax, [bp+var_2FA]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	al, byte_4F55C
		mov	ah, 0
		or	ax, ax
		jz	short loc_6200E
		jmp	loc_62096

loc_6200E:
		push	[bp+var_34]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_62024
		cmp	word_4CA5B, 0
		jnz	short loc_62096

loc_62024:
		lea	ax, [bp+var_2FA]
		push	ax
		lea	ax, [bp+var_282]
		push	ax
		push	di
		push	cs
		call	near ptr Conv_DrawText_612E1
		add	sp, 6
		xor	eax, eax
		mov	[bp+var_40], eax
		mov	[bp+var_44], eax
		lea	ax, [bp+var_2FA]
		push	ax
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jnz	short loc_62057
		mov	ax, 8
		jmp	short loc_6205A

loc_62057:
		mov	ax, 32h

loc_6205A:
		mov	[bp+var_46], ax
		call	Input_Flush_116D1
		xor	si, si
		jmp	short loc_6208E

loc_62066:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_62071
		jmp	short loc_62093

loc_62071:
		mov	[bp+var_40], 0Ah
		mov	eax, dword_4DE15
		mov	[bp+var_44], eax
		lea	ax, word ptr [bp+var_44]
		push	ax
		call	Stopwatch_WaitElapsed_44E21
		add	sp, 2
		inc	si

loc_6208E:
		cmp	si, [bp+var_46]
		jl	short loc_62066

loc_62093:
		jmp	loc_621EC

loc_62096:
		mov	[bp+var_314], 129Fh
		mov	[bp+var_304], 0
		mov	[bp+var_300], 2
		mov	[bp+var_2FF], 0
		mov	[bp+var_2FE], 0
		mov	[bp+var_312], 0
		mov	[bp+var_314], 12AFh
		push	word_4CA5B
		lea	ax, [bp+var_314]
		push	ax
		call	VoicePlayer_SetDriver_B978
		add	sp, 4
		push	ds
		push	offset aVoc_1
		push	ds
		push	[bp+var_34]
		push	ds
		push	offset aF_1
		lea	ax, [bp+var_158]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_158]
		push	ax
		lea	ax, [bp+var_260]
		push	ax
		call	sub_57CD
		add	sp, 4
		or	al, al
		jz	short loc_62118
		lea	ax, word ptr [bp+var_1B8]
		push	ax
		lea	ax, [bp+var_314]
		push	ax
		call	sub_C8D7
		add	sp, 4
		jmp	short loc_6212A

loc_62118:
		lea	ax, [bp+var_158]
		push	ax
		lea	ax, [bp+var_314]
		push	ax
		call	sub_C97E
		add	sp, 4

loc_6212A:
		push	1
		lea	ax, [bp+var_158]
		push	ax
		lea	ax, [bp+var_260]
		push	ax
		call	sub_5538
		add	sp, 6
		push	0FFFFh
		lea	ax, [bp+var_314]
		push	ax
		call	sub_CB9D
		add	sp, 4
		push	2
		lea	ax, [bp+var_260]
		push	ax
		call	sub_5641
		add	sp, 4
		jmp	short loc_62184

loc_6215E:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_62184
		inc	[bp+var_29]
		cmp	[bp+var_312], 0
		jz	short loc_62182
		mov	bx, [bp+var_312]
		push	word ptr [bx+4]
		call	sub_506B
		add	sp, 2
		jmp	short loc_62182

loc_62182:
		jmp	short loc_62195

loc_62184:
		lea	ax, [bp+var_314]
		push	ax
		call	VoicePlayer_IsPlaying_CEB0
		add	sp, 2
		or	al, al
		jnz	short loc_6215E

loc_62195:
		call	sub_57C3
		mov	[bp+var_314], 129Fh
		lea	ax, [bp+var_314]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_2FF], 0
		jz	short loc_621D5
		cmp	[bp+var_304], 0
		jz	short loc_621D5
		push	0
		mov	al, [bp+var_300]
		push	ax
		lea	ax, word ptr [bp+var_304]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_621D5

loc_621D5:
		mov	[bp+var_304], 0
		mov	[bp+var_2FF], 0
		mov	[bp+var_2FE], 0

loc_621EC:
		call	Input_Flush_116D1
		mov	[bp+var_3A], 12CBh
		push	[bp+var_36]
		call	sub_330E8
		add	sp, 2
		push	[bp+var_34]
		call	sub_330E8
		add	sp, 2
		lea	ax, [bp+var_280]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		jmp	loc_65C8E

loc_6221C:
		mov	byte ptr [bp+var_3D+1], 1
		cmp	byte_4F55C, 0
		jz	short loc_6228C
		cmp	[bp+var_1B3], 0
		jz	short loc_6224F
		cmp	[bp+var_1B8], 0
		jz	short loc_6224F
		push	0
		mov	al, [bp+var_1B4]
		push	ax
		lea	ax, word ptr [bp+var_1B8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6224F

loc_6224F:
		mov	[bp+var_1B8], 0
		mov	[bp+var_1B3], 0
		mov	[bp+var_1B2], 0
		mov	[bp+var_260], 498h
		lea	ax, [bp+var_260]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_260]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4
		pop	di
		pop	si
		leave
		retf

loc_6228C:
		mov	ax, di
		add	ax, 1Ah
		mov	word ptr [bp+var_44+2], ax
		push	word ptr [bp+var_44+2]
		lea	ax, word ptr [bp+var_40]
		push	ax
		call	sub_3499B
		add	sp, 4
		push	100h
		push	0
		lea	ax, [bp+var_48]
		push	ax
		call	Palette_Alloc_34A1A
		add	sp, 6
		mov	ax, di
		add	ax, 0Ch
		push	ax
		push	0
		push	0Ah
		lea	ax, [bp+var_31A]
		push	ax
		call	LayerGroup_Construct_33CB2
		add	sp, 8
		mov	[bp+var_50], 0
		mov	[bp+var_4E], 98h
		mov	[bp+var_4C], 13Fh
		mov	[bp+var_4A], 0C7h
		mov	ax, di
		add	ax, 2Ch
		push	ax
		push	word_4D36E
		sub	sp, 8
		mov	ax, [bp+var_50]
		mov	[bp+var_3D2], ax
		mov	ax, [bp+var_4E]
		mov	[bp+var_3D0], ax
		mov	ax, [bp+var_4C]
		mov	[bp+var_3CE], ax
		mov	ax, [bp+var_4A]
		mov	[bp+var_3CC], ax
		lea	ax, word ptr [bp+var_33D+1]
		push	ax
		call	sub_30A1D
		add	sp, 0Eh
		push	0
		lea	ax, word ptr [bp+var_33D+1]
		push	ax
		call	sub_30AD0
		add	sp, 4
		mov	[bp+var_348], 12C3h
		mov	byte ptr [bp+var_346], 0
		mov	[bp+var_348], 1297h
		push	di
		lea	ax, [bp+var_348]
		push	ax
		call	ConvRec_ReadName_93FF
		add	sp, 4
		lea	ax, word ptr [bp+var_345]
		mov	[bp+var_52], ax
		lea	ax, [bp+var_58]
		push	ax
		lea	ax, [bp+var_56]
		push	ax
		lea	ax, [bp+var_54]
		push	ax
		push	[bp+var_52]
		push	di
		push	cs
		call	near ptr sub_61893
		add	sp, 0Ah
		mov	byte ptr [bp+var_5A+1], al
		mov	[bp+var_5C], 0
		jmp	short loc_623A7

loc_6236B:
		mov	ax, [bp+var_5C]
		shl	ax, 1
		mov	bx, [bp+var_58]
		add	bx, ax
		push	word ptr [bx]
		push	0
		mov	ax, [bp+var_5C]
		mov	dx, 0Ah
		imul	dx
		mov	dx, [bp+var_54]
		add	dx, ax
		push	dx
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [bp+var_62], ax
		push	word ptr [bp+var_62]
		lea	ax, [bp+var_31A]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		inc	[bp+var_5C]

loc_623A7:
		mov	al, byte ptr [bp+var_5A+1]
		mov	ah, 0
		cmp	ax, [bp+var_5C]
		jg	short loc_6236B
		mov	[bp+var_5C], 0
		jmp	short loc_62402

loc_623B8:
		mov	ax, [bp+var_5C]
		mov	dx, 0Ah
		imul	dx
		mov	dx, [bp+var_56]
		add	dx, ax
		mov	word ptr [bp+var_68], dx
		mov	word ptr [bp+var_64+1], 0
		push	word ptr [bp+var_68]
		lea	ax, word ptr [bp+var_68+2]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		push	word ptr [bp+var_68+2]
		mov	al, byte ptr [bp+var_64]
		push	ax
		lea	ax, word ptr [bp+var_68+2]
		push	ax
		lea	ax, [bp+var_48]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		lea	ax, word ptr [bp+var_68+2]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		inc	[bp+var_5C]

loc_62402:
		mov	al, byte ptr [bp+var_5A+1]
		mov	ah, 0
		cmp	ax, [bp+var_5C]
		jg	short loc_623B8
		mov	[bp+var_6A], 0
		mov	byte ptr [bp+var_68+2], 2
		mov	byte ptr [bp+var_68+3], 0
		mov	[bp+var_64], 0
		push	2
		lea	ax, word ptr [bp+var_6A]
		push	ax
		push	di
		push	cs
		call	near ptr ConvData_FindFigurePalette_61875
		add	sp, 6
		mov	[bp+var_6D], 0
		lea	ax, word ptr [bp+var_6A]
		push	ax
		lea	ax, word ptr [bp+var_70]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		push	word ptr [bp+var_70]
		mov	al, byte ptr [bp+var_70+2]
		push	ax
		lea	ax, word ptr [bp+var_70]
		push	ax
		lea	ax, [bp+var_48]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		lea	ax, word ptr [bp+var_70]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	byte ptr [bp+var_68+3], 0
		jz	short loc_6248E
		cmp	[bp+var_6A], 0
		jz	short loc_6248E
		push	0
		mov	al, byte ptr [bp+var_68+2]
		push	ax
		lea	ax, word ptr [bp+var_6A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6248E

loc_6248E:
		mov	[bp+var_6A], 0
		mov	byte ptr [bp+var_68+3], 0
		mov	[bp+var_64], 0
		mov	byte ptr [bp+var_5E+1], 1
		push	seg stub192
		push	offset sub_479E5
		push	1
		push	0Ah
		push	0Ah
		lea	ax, [bp+var_3AC]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	word ptr [bp+var_62+2], 0
		jmp	loc_62607

loc_624C7:
		inc	word ptr [di+4]
		mov	[bp+var_3BC], 12C3h
		mov	[bp+var_3BA], 1
		mov	[bp+var_3BC], 128Fh
		push	di
		lea	ax, [bp+var_3BC]
		push	ax
		call	ConvRec_ReadExtra_95B8
		add	sp, 4
		lea	ax, [bp+var_3B9]
		mov	word ptr [bp+var_62], ax
		push	word ptr [bp+var_62]
		call	CRT_Strlen
		add	sp, 2
		mov	dx, word ptr [bp+var_62]
		add	dx, ax
		mov	bx, dx
		mov	al, [bx-1]
		mov	byte ptr [bp+var_64+1], al
		inc	word ptr [bp+var_62+2]
		push	3
		mov	ax, word ptr [bp+var_62+2]
		mov	dx, 0Ah
		imul	dx
		lea	dx, [bp+var_3AC]
		add	ax, dx
		push	ax
		push	word ptr [bp+var_62]
		push	di
		push	cs
		call	near ptr ConvData_FindFigure_61857
		add	sp, 8
		mov	al, byte ptr [bp+var_64+1]
		push	ax
		push	[bp+var_3AE]
		push	[bp+var_3B0]
		mov	ax, word ptr [bp+var_62+2]
		mov	dx, 0Ah
		imul	dx
		lea	dx, [bp+var_3AC]
		add	ax, dx
		push	ax
		push	0
		call	ConvFigure_ConstructExtra_F3BC
		add	sp, 0Ah
		mov	word ptr [bp+var_68+2], ax
		push	word ptr [bp+var_68+2]
		lea	ax, [bp+var_31A]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		cmp	byte ptr [bp+var_5E+1], 0
		jnz	short loc_62568
		jmp	loc_62607

loc_62568:
		mov	[bp+var_70], 0
		mov	byte ptr [bp+var_6C], 2
		mov	byte ptr [bp+var_6C+1], 0
		mov	[bp+var_6A], 0
		push	2
		lea	ax, word ptr [bp+var_70]
		push	ax
		push	word ptr [bp+var_62]
		push	4
		push	di
		push	cs
		call	near ptr sub_615B2
		add	sp, 0Ah
		mov	[bp+var_73], 0
		lea	ax, word ptr [bp+var_70]
		push	ax
		lea	ax, [bp+var_76]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		push	[bp+var_76]
		mov	al, byte ptr [bp+var_74]
		push	ax
		lea	ax, [bp+var_76]
		push	ax
		lea	ax, [bp+var_48]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		mov	byte ptr [bp+var_5E+1], 0
		lea	ax, [bp+var_76]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	byte ptr [bp+var_6C+1], 0
		jz	short loc_625F3
		cmp	[bp+var_70], 0
		jz	short loc_625F3
		push	0
		mov	al, byte ptr [bp+var_6C]
		push	ax
		lea	ax, word ptr [bp+var_70]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_625F3

loc_625F3:
		mov	[bp+var_70], 0
		mov	byte ptr [bp+var_6C+1], 0
		mov	[bp+var_6A], 0

loc_62607:
		les	bx, [di+4]
		cmp	byte ptr es:[bx], 1
		jnz	short loc_62613
		jmp	loc_624C7

loc_62613:
		mov	ax, [di]
		add	ax, [di+8]
		cmp	ax, [di+4]
		ja	short loc_62622
		mov	ax, 1
		jmp	short loc_62624

loc_62622:
		xor	ax, ax

loc_62624:
		or	al, al
		jnz	short loc_62631
		les	bx, [di+4]
		cmp	byte ptr es:[bx], 2
		jz	short loc_626A8

loc_62631:
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_48]
		mov	al, byte ptr [bp+var_46]
		push	ax
		lea	ax, [bp+var_48]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		lea	ax, [bp+var_31A]
		push	ax
		call	sub_33DD2
		add	sp, 2
		xor	eax, eax
		mov	[bp+var_64], eax
		mov	[bp+var_68], eax
		call	Input_Flush_116D1
		mov	word ptr [bp+var_6A], 0
		jmp	short loc_626A2

loc_62678:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_62683
		jmp	short loc_626A8

loc_62683:
		mov	[bp+var_64], 0Ah
		mov	eax, dword_4DE15
		mov	[bp+var_68], eax
		lea	ax, word ptr [bp+var_68]
		push	ax
		call	Stopwatch_WaitElapsed_44E21
		add	sp, 2
		inc	word ptr [bp+var_6A]

loc_626A2:
		cmp	word ptr [bp+var_6A], 7
		jl	short loc_62678

loc_626A8:
		jmp	loc_62A59

loc_626AB:
		mov	[bp+var_3C2], 12C3h
		mov	[bp+var_3C0], 2
		mov	[bp+var_3C2], 1287h
		mov	[bp+var_3B1], 0
		mov	[bp+var_3AF], 0
		inc	word ptr [di+4]
		push	di
		lea	ax, [bp+var_3C2]
		push	ax
		call	sub_9642
		add	sp, 4
		push	3
		mov	ax, word ptr [bp+var_62+2]
		mov	dx, 0Ah
		imul	dx
		lea	dx, [bp+var_3AC]
		add	ax, dx
		push	ax
		lea	ax, [bp+var_3BF]
		push	ax
		push	di
		push	cs
		call	near ptr ConvData_FindFigure_61857
		add	sp, 8
		push	[bp+var_3B4]
		push	[bp+var_3B6]
		mov	ax, word ptr [bp+var_62+2]
		mov	dx, 0Ah
		imul	dx
		lea	dx, [bp+var_3AC]
		add	ax, dx
		push	ax
		push	0
		call	sub_EA1D
		add	sp, 8
		mov	si, ax
		push	si
		lea	ax, [bp+var_31A]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		cmp	byte ptr [bp+var_5E+1], 0
		jnz	short loc_62731
		jmp	loc_627CB

loc_62731:
		mov	[bp+var_6A], 0
		mov	byte ptr [bp+var_68+2], 2
		mov	byte ptr [bp+var_68+3], 0
		mov	[bp+var_64], 0
		push	2
		lea	ax, word ptr [bp+var_6A]
		push	ax
		push	di
		push	cs
		call	near ptr ConvData_FindFigurePalette_61875
		add	sp, 6
		mov	[bp+var_6D], 0
		lea	ax, word ptr [bp+var_6A]
		push	ax
		lea	ax, word ptr [bp+var_70]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		push	word ptr [bp+var_70]
		mov	al, byte ptr [bp+var_70+2]
		push	ax
		lea	ax, word ptr [bp+var_70]
		push	ax
		lea	ax, [bp+var_48]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		mov	byte ptr [bp+var_5E+1], 0
		lea	ax, word ptr [bp+var_70]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	byte ptr [bp+var_68+3], 0
		jz	short loc_627B7
		cmp	[bp+var_6A], 0
		jz	short loc_627B7
		push	0
		mov	al, byte ptr [bp+var_68+2]
		push	ax
		lea	ax, word ptr [bp+var_6A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_627B7

loc_627B7:
		mov	[bp+var_6A], 0
		mov	byte ptr [bp+var_68+3], 0
		mov	[bp+var_64], 0

loc_627CB:
		lea	ax, [bp+var_C]
		push	ax
		push	[bp+var_52]
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jz	short loc_62810
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_48]
		mov	al, byte ptr [bp+var_46]
		push	ax
		lea	ax, [bp+var_48]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		push	[bp+var_52]
		lea	ax, [bp+var_C]
		push	ax
		call	CRT_Strcpy
		add	sp, 4

loc_62810:
		mov	word ptr [bp+var_2FE+1], 0
		lea	ax, [bp+var_31A]
		push	ax
		call	sub_33DD2
		add	sp, 2
		cmp	byte ptr [bp+var_3D+1], 1
		jnz	short loc_62874
		mov	byte ptr [bp+var_3D+1], 0
		xor	eax, eax
		mov	[bp+var_64], eax
		mov	[bp+var_68], eax
		call	Input_Flush_116D1
		mov	word ptr [bp+var_6A], 0
		jmp	short loc_6286E

loc_62844:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_6284F
		jmp	short loc_62874

loc_6284F:
		mov	[bp+var_64], 0Ah
		mov	eax, dword_4DE15
		mov	[bp+var_68], eax
		lea	ax, word ptr [bp+var_68]
		push	ax
		call	Stopwatch_WaitElapsed_44E21
		add	sp, 2
		inc	word ptr [bp+var_6A]

loc_6286E:
		cmp	word ptr [bp+var_6A], 7
		jl	short loc_62844

loc_62874:
		push	[bp+var_3B1]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		ja	short loc_62887
		jmp	loc_62929

loc_62887:
		cmp	word_4CA5B, 0
		jnz	short loc_62891
		jmp	loc_62929

loc_62891:
		cmp	[bp+var_28], 0
		jnz	short loc_6289A
		jmp	loc_62929

loc_6289A:
		push	ds
		push	offset aVoc_2
		push	ds
		push	[bp+var_3B1]
		push	ds
		push	offset aF_2
		lea	ax, [bp+var_158]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_158]
		push	ax
		lea	ax, [bp+var_260]
		push	ax
		call	sub_57CD
		add	sp, 4
		or	al, al
		jz	short loc_628DC
		push	0Ah
		lea	ax, word ptr [bp+var_1B8]
		push	ax
		push	si
		call	TalkingHead_AttachVoice_E535
		add	sp, 6
		jmp	short loc_628FB

loc_628DC:
		lea	ax, [bp+var_158]
		push	ax
		push	si
		call	sub_E504
		add	sp, 4
		push	0Ah
		mov	ax, si
		add	ax, 40h
		push	ax
		push	si
		call	TalkingHead_AttachVoice_E535
		add	sp, 6

loc_628FB:
		push	1
		lea	ax, [bp+var_158]
		push	ax
		lea	ax, [bp+var_260]
		push	ax
		call	sub_5538
		add	sp, 6
		push	si
		call	TalkingHead_StartVoiceAndIsSpeaking_E4AD
		add	sp, 2
		push	2
		lea	ax, [bp+var_260]
		push	ax
		call	sub_5641
		add	sp, 4
		jmp	short loc_62936

loc_62929:
		push	[bp+var_3AF]
		push	si
		call	TalkingHead_SetLipText_E45A
		add	sp, 4

loc_62936:
		jmp	short loc_62969

loc_62938:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_6295C
		inc	[bp+var_29]
		cmp	word ptr [si+32h], 0
		jz	short loc_6295A
		mov	bx, [si+32h]
		push	word ptr [bx+4]
		call	sub_506B
		add	sp, 2
		jmp	short loc_6295A

loc_6295A:
		jmp	short loc_62976

loc_6295C:
		lea	ax, [bp+var_31A]
		push	ax
		call	sub_33DD2
		add	sp, 2

loc_62969:
		push	si
		call	TalkingHead_StartVoiceAndIsSpeaking_E4AD
		add	sp, 2
		or	al, al
		jnz	short loc_62938

loc_62976:
		call	sub_57C3
		push	si
		mov	bx, [si]
		call	dword ptr [bx+1Ch]
		add	sp, 2
		push	[bp+var_3B1]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_629A7
		cmp	word_4CA5B, 0
		jz	short loc_629A7
		mov	al, [bp+var_28]
		mov	ah, 0
		or	ax, ax
		jz	short loc_629A7
		jmp	loc_62A3B

loc_629A7:
		push	0
		lea	ax, word ptr [bp+var_33D+1]
		push	ax
		call	sub_30AD0
		add	sp, 4
		mov	al, [bp+var_3B2]
		mov	byte ptr [bp+var_62+1], al
		lea	ax, word ptr [bp+var_62+1]
		push	ax
		mov	ax, di
		add	ax, 2Ch
		push	ax
		mov	bx, [di+2Ch]
		call	dword ptr [bx+10h]
		add	sp, 4
		push	[bp+var_3AF]
		lea	ax, word ptr [bp+var_33D+1]
		push	ax
		push	di
		push	cs
		call	near ptr Conv_DrawText_612E1
		add	sp, 6
		push	[bp+var_3AF]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jnz	short loc_629F6
		mov	ax, 8
		jmp	short loc_629F9

loc_629F6:
		mov	ax, 32h

loc_629F9:
		mov	[bp+var_2], ax
		mov	al, [bp+var_29]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_62A3B
		mov	word ptr [bp+var_2FE+1], 0
		jmp	short loc_62A25

loc_62A0D:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_62A18
		jmp	short loc_62A3B

loc_62A18:
		lea	ax, [bp+var_31A]
		push	ax
		call	sub_33DD2
		add	sp, 2

loc_62A25:
		mov	ax, word ptr [bp+var_2FE+1]
		cmp	ax, [bp+var_2]
		jb	short loc_62A33
		mov	ax, 1
		jmp	short loc_62A35

loc_62A33:
		xor	ax, ax

loc_62A35:
		mov	ah, 0
		or	ax, ax
		jz	short loc_62A0D

loc_62A3B:
		mov	[bp+var_3C2], 1287h
		push	[bp+var_3B1]
		call	sub_330E8
		add	sp, 2
		push	[bp+var_3AF]
		call	sub_330E8
		add	sp, 2

loc_62A59:
		mov	ax, [di]
		add	ax, [di+8]
		cmp	ax, [di+4]
		ja	short loc_62A68
		mov	ax, 1
		jmp	short loc_62A6A

loc_62A68:
		xor	ax, ax

loc_62A6A:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_62A7C
		les	bx, [di+4]
		cmp	byte ptr es:[bx], 2
		jnz	short loc_62A7C
		jmp	loc_626AB

loc_62A7C:
		cmp	byte ptr [bp+var_3D+1], 1
		jnz	short loc_62AC9
		xor	eax, eax
		mov	[bp+var_64], eax
		mov	[bp+var_68], eax
		call	Input_Flush_116D1
		mov	word ptr [bp+var_6A], 0
		jmp	short loc_62AC3

loc_62A99:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_62AA4
		jmp	short loc_62AC9

loc_62AA4:
		mov	[bp+var_64], 0Ah
		mov	eax, dword_4DE15
		mov	[bp+var_68], eax
		lea	ax, word ptr [bp+var_68]
		push	ax
		call	Stopwatch_WaitElapsed_44E21
		add	sp, 2
		inc	word ptr [bp+var_6A]

loc_62AC3:
		cmp	word ptr [bp+var_6A], 7
		jl	short loc_62A99

loc_62AC9:
		push	seg stub192
		push	offset sub_479E0
		push	19h
		push	0
		push	0Ah
		push	[bp+var_54]
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg stub192
		push	offset sub_479E0
		push	19h
		push	0
		push	0Ah
		push	[bp+var_56]
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	[bp+var_58]
		call	sub_39C
		add	sp, 2
		push	seg stub192
		push	offset sub_479E0
		push	1
		push	0Ah
		push	0Ah
		lea	ax, [bp+var_3AC]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		lea	ax, [bp+var_33A]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_31A]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		lea	ax, [bp+var_48]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, word ptr [bp+var_40]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		jmp	loc_65C8E

loc_62B52:
		cmp	byte_4F55C, 0
		jz	short loc_62BBE
		cmp	[bp+var_1B3], 0
		jz	short loc_62B81
		cmp	[bp+var_1B8], 0
		jz	short loc_62B81
		push	0
		mov	al, [bp+var_1B4]
		push	ax
		lea	ax, word ptr [bp+var_1B8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_62B81

loc_62B81:
		mov	[bp+var_1B8], 0
		mov	[bp+var_1B3], 0
		mov	[bp+var_1B2], 0
		mov	[bp+var_260], 498h
		lea	ax, [bp+var_260]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_260]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4
		pop	di
		pop	si
		leave
		retf

loc_62BBE:
		call	Input_Flush_116D1
		mov	ax, di
		add	ax, 1Ah
		mov	word ptr [bp+var_40], ax
		push	word ptr [bp+var_40]
		lea	ax, word ptr [bp+var_40+2]
		push	ax
		call	sub_3499B
		add	sp, 4
		push	100h
		push	0
		lea	ax, [bp+var_46]
		push	ax
		call	Palette_Alloc_34A1A
		add	sp, 6
		mov	ax, di
		add	ax, 0Ch
		push	ax
		push	0
		push	0Ah
		lea	ax, [bp+var_31A]
		push	ax
		call	LayerGroup_Construct_33CB2
		add	sp, 8
		mov	[bp+var_4E], 0
		mov	[bp+var_4C], 98h
		mov	[bp+var_4A], 13Fh
		mov	[bp+var_48], 0C7h
		mov	ax, di
		add	ax, 2Ch
		push	ax
		push	word_4D36E
		sub	sp, 8
		mov	ax, [bp+var_4E]
		mov	[bp+var_3D2], ax
		mov	ax, [bp+var_4C]
		mov	[bp+var_3D0], ax
		mov	ax, [bp+var_4A]
		mov	[bp+var_3CE], ax
		mov	ax, [bp+var_48]
		mov	[bp+var_3CC], ax
		lea	ax, word ptr [bp+var_33D+1]
		push	ax
		call	sub_30A1D
		add	sp, 0Eh
		mov	[bp+var_35C], 12C3h
		mov	byte ptr [bp+var_35A], 3
		mov	[bp+var_35C], 127Fh
		mov	byte ptr [bp+var_33D], 0
		mov	[bp+var_342], 0
		mov	word ptr [bp+var_341+1], 0
		push	di
		lea	ax, [bp+var_35C]
		push	ax
		call	sub_9428
		add	sp, 4
		lea	ax, [bp+var_34F]
		mov	[bp+var_50], ax
		lea	ax, [bp+var_56]
		push	ax
		lea	ax, [bp+var_54]
		push	ax
		lea	ax, [bp+var_52]
		push	ax
		push	[bp+var_50]
		push	di
		push	cs
		call	near ptr sub_61893
		add	sp, 0Ah
		mov	byte ptr [bp+var_58+1], al
		mov	[bp+var_5C], 0
		jmp	short loc_62CF1

loc_62CA4:
		mov	ax, [bp+var_5C]
		shl	ax, 1
		mov	bx, [bp+var_56]
		add	bx, ax
		push	word ptr [bx]
		push	0
		mov	ax, [bp+var_5C]
		mov	dx, 0Ah
		imul	dx
		mov	dx, [bp+var_52]
		add	dx, ax
		push	dx
		push	0
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	[bp+var_7E], ax
		mov	al, byte ptr [bp+var_58+1]
		mov	ah, 0
		dec	ax
		cmp	ax, [bp+var_5C]
		jnz	short loc_62CDE
		mov	ax, [bp+var_7E]
		mov	[bp+var_5A], ax

loc_62CDE:
		push	[bp+var_7E]
		lea	ax, [bp+var_31A]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		inc	[bp+var_5C]

loc_62CF1:
		mov	al, byte ptr [bp+var_58+1]
		mov	ah, 0
		cmp	ax, [bp+var_5C]
		jg	short loc_62CA4
		mov	[bp+var_5C], 0
		jmp	short loc_62D52

loc_62D02:
		mov	ax, [bp+var_5C]
		mov	dx, 0Ah
		imul	dx
		mov	dx, [bp+var_54]
		add	dx, ax
		mov	[bp+var_84], dx
		mov	[bp+var_7F], 0
		push	[bp+var_84]
		lea	ax, [bp+var_82]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		push	[bp+var_82]
		mov	al, byte ptr [bp+var_80]
		push	ax
		lea	ax, [bp+var_82]
		push	ax
		lea	ax, [bp+var_46]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		lea	ax, [bp+var_82]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		inc	[bp+var_5C]

loc_62D52:
		mov	al, byte ptr [bp+var_58+1]
		mov	ah, 0
		cmp	ax, [bp+var_5C]
		jg	short loc_62D02
		lea	ax, [bp+var_359]
		mov	[bp+var_5E], ax
		mov	[bp+var_68], 0
		mov	byte ptr [bp+var_64], 2
		mov	byte ptr [bp+var_64+1], 0
		mov	[bp+var_62], 0
		push	3
		lea	ax, word ptr [bp+var_68]
		push	ax
		push	[bp+var_5E]
		push	di
		push	cs
		call	near ptr ConvData_FindFace_617FE
		add	sp, 8
		mov	[bp+var_72], 0
		mov	byte ptr [bp+var_70+2], 2
		mov	byte ptr [bp+var_6D], 0
		mov	[bp+var_6C], 0
		push	0
		push	2
		lea	ax, word ptr [bp+var_72]
		push	ax
		push	di
		push	cs
		call	near ptr ConvData_FindFacePalette_6181C
		add	sp, 8
		push	word ptr [bp+var_345+1]
		push	[bp+var_346]
		lea	ax, word ptr [bp+var_68]
		push	ax
		push	0
		call	TalkingHead_Construct_E108
		add	sp, 8
		mov	si, ax
		push	si
		lea	ax, [bp+var_31A]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		mov	al, byte ptr [bp+var_350]
		cbw
		push	ax
		push	si
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4
		mov	[bp+var_75], 0
		lea	ax, word ptr [bp+var_72]
		push	ax
		lea	ax, [bp+var_78]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		push	[bp+var_78]
		mov	al, byte ptr [bp+var_76]
		push	ax
		lea	ax, [bp+var_78]
		push	ax
		lea	ax, [bp+var_46]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_50]
		lea	ax, [bp+var_C]
		push	ax
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_62E3B
		push	[bp+var_5E]
		lea	ax, [bp+var_16]
		push	ax
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jz	short loc_62E7E

loc_62E3B:
		push	0
		mov	ax, di
		add	ax, 0Ch
		push	ax
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_46]
		mov	al, byte ptr [bp+var_44]
		push	ax
		lea	ax, [bp+var_46]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		push	[bp+var_50]
		lea	ax, [bp+var_C]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		push	[bp+var_5E]
		lea	ax, [bp+var_16]
		push	ax
		call	CRT_Strcpy
		add	sp, 4

loc_62E7E:
		push	0
		lea	ax, word ptr [bp+var_33D+1]
		push	ax
		call	sub_30AD0
		add	sp, 4
		mov	al, byte ptr [bp+var_33E]
		mov	byte ptr [bp+var_79], al
		lea	ax, [bp+var_79]
		push	ax
		mov	ax, di
		add	ax, 2Ch
		push	ax
		mov	bx, [di+2Ch]
		call	dword ptr [bx+10h]
		add	sp, 4
		mov	ax, [bp+var_342]
		mov	[bp+var_7C], ax
		mov	al, byte_4F55C
		mov	ah, 0
		or	ax, ax
		jnz	short loc_62EDE
		push	word ptr [bp+var_341+1]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_62ECE
		cmp	word_4CA5B, 0
		jnz	short loc_62EDE

loc_62ECE:
		push	[bp+var_7C]
		lea	ax, word ptr [bp+var_33D+1]
		push	ax
		push	di
		push	cs
		call	near ptr Conv_DrawText_612E1
		add	sp, 6

loc_62EDE:
		call	Input_Flush_116D1
		lea	ax, [bp+var_31A]
		push	ax
		call	sub_33DD2
		add	sp, 2
		push	word ptr [bp+var_341+1]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		ja	short loc_62F03
		jmp	loc_62F9C

loc_62F03:
		cmp	word_4CA5B, 0
		jnz	short loc_62F0D
		jmp	loc_62F9C

loc_62F0D:
		push	ds
		push	offset aVoc_3
		push	ds
		push	word ptr [bp+var_341+1]
		push	ds
		push	offset aF_3
		lea	ax, [bp+var_158]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_158]
		push	ax
		lea	ax, [bp+var_260]
		push	ax
		call	sub_57CD
		add	sp, 4
		or	al, al
		jz	short loc_62F4F
		push	0Ah
		lea	ax, word ptr [bp+var_1B8]
		push	ax
		push	si
		call	TalkingHead_AttachVoice_E535
		add	sp, 6
		jmp	short loc_62F6E

loc_62F4F:
		lea	ax, [bp+var_158]
		push	ax
		push	si
		call	sub_E504
		add	sp, 4
		push	0Ah
		mov	ax, si
		add	ax, 40h
		push	ax
		push	si
		call	TalkingHead_AttachVoice_E535
		add	sp, 6

loc_62F6E:
		push	1
		lea	ax, [bp+var_158]
		push	ax
		lea	ax, [bp+var_260]
		push	ax
		call	sub_5538
		add	sp, 6
		push	si
		call	TalkingHead_StartVoiceAndIsSpeaking_E4AD
		add	sp, 2
		push	2
		lea	ax, [bp+var_260]
		push	ax
		call	sub_5641
		add	sp, 4
		jmp	short loc_62FA9

loc_62F9C:
		push	[bp+var_342]
		push	si
		call	TalkingHead_SetLipText_E45A
		add	sp, 4

loc_62FA9:
		jmp	short loc_62FDE

loc_62FAB:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_62FD1
		inc	[bp+var_29]
		cmp	word ptr [si+32h], 0
		jz	short loc_62FCD
		mov	bx, [si+32h]
		push	word ptr [bx+4]
		call	sub_506B
		add	sp, 2
		jmp	short loc_62FCD

loc_62FCD:
		jmp	short loc_62FEB
		jmp	short loc_62FDE

loc_62FD1:
		lea	ax, [bp+var_31A]
		push	ax
		call	sub_33DD2
		add	sp, 2

loc_62FDE:
		push	si
		call	TalkingHead_StartVoiceAndIsSpeaking_E4AD
		add	sp, 2
		or	al, al
		jnz	short loc_62FAB

loc_62FEB:
		call	sub_57C3
		push	si
		mov	bx, [si]
		call	dword ptr [bx+1Ch]
		add	sp, 2
		push	word ptr [bp+var_341+1]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_63010
		cmp	word_4CA5B, 0
		jnz	short loc_6306C

loc_63010:
		push	[bp+var_342]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jnz	short loc_63025
		mov	ax, 8
		jmp	short loc_63028

loc_63025:
		mov	ax, 32h

loc_63028:
		mov	[bp+var_2], ax
		mov	al, [bp+var_29]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6306C
		mov	word ptr [bp+var_2FE+1], 0
		jmp	short loc_63056

loc_6303C:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_63049
		jmp	short loc_6306C
		jmp	short loc_63056

loc_63049:
		lea	ax, [bp+var_31A]
		push	ax
		call	sub_33DD2
		add	sp, 2

loc_63056:
		mov	ax, word ptr [bp+var_2FE+1]
		cmp	ax, [bp+var_2]
		jb	short loc_63064
		mov	ax, 1
		jmp	short loc_63066

loc_63064:
		xor	ax, ax

loc_63066:
		mov	ah, 0
		or	ax, ax
		jz	short loc_6303C

loc_6306C:
		jmp	loc_63732

loc_6306F:
		call	Input_Flush_116D1
		jmp	loc_6324C

loc_63077:
		inc	word ptr [di+4]
		push	di
		lea	ax, [bp+var_35C]
		push	ax
		call	sub_9428
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_33D+1]
		push	ax
		call	sub_30AD0
		add	sp, 4
		mov	ax, [bp+var_342]
		mov	[bp+var_7E], ax
		mov	al, byte_4F55C
		mov	ah, 0
		or	ax, ax
		jnz	short loc_630CE
		push	word ptr [bp+var_341+1]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_630BE
		cmp	word_4CA5B, 0
		jnz	short loc_630CE

loc_630BE:
		push	[bp+var_7E]
		lea	ax, word ptr [bp+var_33D+1]
		push	ax
		push	di
		push	cs
		call	near ptr Conv_DrawText_612E1
		add	sp, 6

loc_630CE:
		mov	word ptr [bp+var_2FE+1], 0
		call	Input_Flush_116D1
		push	word ptr [bp+var_341+1]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		ja	short loc_630EC
		jmp	loc_63185

loc_630EC:
		cmp	word_4CA5B, 0
		jnz	short loc_630F6
		jmp	loc_63185

loc_630F6:
		push	ds
		push	offset aVoc_4
		push	ds
		push	word ptr [bp+var_341+1]
		push	ds
		push	offset aF_4
		lea	ax, [bp+var_158]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_158]
		push	ax
		lea	ax, [bp+var_260]
		push	ax
		call	sub_57CD
		add	sp, 4
		or	al, al
		jz	short loc_63138
		push	0Ah
		lea	ax, word ptr [bp+var_1B8]
		push	ax
		push	si
		call	TalkingHead_AttachVoice_E535
		add	sp, 6
		jmp	short loc_63157

loc_63138:
		lea	ax, [bp+var_158]
		push	ax
		push	si
		call	sub_E504
		add	sp, 4
		push	0Ah
		mov	ax, si
		add	ax, 40h
		push	ax
		push	si
		call	TalkingHead_AttachVoice_E535
		add	sp, 6

loc_63157:
		push	1
		lea	ax, [bp+var_158]
		push	ax
		lea	ax, [bp+var_260]
		push	ax
		call	sub_5538
		add	sp, 6
		push	si
		call	TalkingHead_StartVoiceAndIsSpeaking_E4AD
		add	sp, 2
		push	2
		lea	ax, [bp+var_260]
		push	ax
		call	sub_5641
		add	sp, 4
		jmp	short loc_63192

loc_63185:
		push	[bp+var_342]
		push	si
		call	TalkingHead_SetLipText_E45A
		add	sp, 4

loc_63192:
		jmp	short loc_631C7

loc_63194:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_631BA
		inc	[bp+var_29]
		cmp	word ptr [si+32h], 0
		jz	short loc_631B6
		mov	bx, [si+32h]
		push	word ptr [bx+4]
		call	sub_506B
		add	sp, 2
		jmp	short loc_631B6

loc_631B6:
		jmp	short loc_631D4
		jmp	short loc_631C7

loc_631BA:
		lea	ax, [bp+var_31A]
		push	ax
		call	sub_33DD2
		add	sp, 2

loc_631C7:
		push	si
		call	TalkingHead_StartVoiceAndIsSpeaking_E4AD
		add	sp, 2
		or	al, al
		jnz	short loc_63194

loc_631D4:
		call	sub_57C3
		mov	al, [bp+var_29]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6324C
		mov	word ptr [bp+var_2FE+1], 0
		push	word ptr [bp+var_341+1]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jz	short loc_631FF
		cmp	word_4CA5B, 0
		jnz	short loc_6324C

loc_631FF:
		push	[bp+var_342]
		call	CRT_Strlen
		add	sp, 2
		or	ax, ax
		jnz	short loc_63214
		mov	ax, 8
		jmp	short loc_63217

loc_63214:
		mov	ax, 32h

loc_63217:
		mov	[bp+var_80], ax
		jmp	short loc_63236

loc_6321C:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_63229
		jmp	short loc_6324C
		jmp	short loc_63236

loc_63229:
		lea	ax, [bp+var_31A]
		push	ax
		call	sub_33DD2
		add	sp, 2

loc_63236:
		mov	ax, word ptr [bp+var_2FE+1]
		cmp	ax, [bp+var_80]
		jb	short loc_63244
		mov	ax, 1
		jmp	short loc_63246

loc_63244:
		xor	ax, ax

loc_63246:
		mov	ah, 0
		or	ax, ax
		jz	short loc_6321C

loc_6324C:
		mov	ax, [di]
		add	ax, [di+8]
		cmp	ax, [di+4]
		ja	short loc_6325B
		mov	ax, 1
		jmp	short loc_6325D

loc_6325B:
		xor	ax, ax

loc_6325D:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6326F
		les	bx, [di+4]
		cmp	byte ptr es:[bx], 4
		jnz	short loc_6326F
		jmp	loc_63077

loc_6326F:
		mov	ax, [di]
		add	ax, [di+8]
		cmp	ax, [di+4]
		ja	short loc_6327E
		mov	ax, 1
		jmp	short loc_63280

loc_6327E:
		xor	ax, ax

loc_63280:
		mov	ah, 0
		or	ax, ax
		jz	short loc_63289
		jmp	loc_63732

loc_63289:
		les	bx, [di+4]
		cmp	byte ptr es:[bx], 0Bh
		jz	short loc_63295
		jmp	loc_63732

loc_63295:
		call	Input_Flush_116D1
		inc	word ptr [di+4]
		mov	[bp+var_82], 12C3h
		mov	byte ptr [bp+var_80], 0Bh
		mov	[bp+var_82], 1277h
		push	di
		lea	ax, [bp+var_82]
		push	ax
		call	sub_9868
		add	sp, 4
		push	0
		lea	ax, word ptr [bp+var_33D+1]
		push	ax
		call	sub_30AD0
		add	sp, 4
		mov	ax, di
		add	ax, 1Ah
		mov	[bp+var_88], ax
		push	[bp+var_88]
		lea	ax, [bp+var_86]
		push	ax
		call	sub_3499B
		add	sp, 4
		mov	ax, di
		add	ax, 2Ch
		push	ax
		mov	ax, di
		add	ax, 1Ah
		push	ax
		lea	ax, [bp+var_376]
		push	ax
		call	Widget_ApplyStyleAndAllocate_36FD2
		add	sp, 6
		push	35h
		push	si
		call	TalkingHead_SetBaseFrame_E56E
		add	sp, 4
		push	108Fh
		push	si
		call	TalkingHead_SetLipText_E45A
		add	sp, 4
		lea	ax, [bp+var_31A]
		push	ax
		call	sub_33DD2
		add	sp, 2
		push	0
		mov	ax, di
		add	ax, 1Ah
		push	ax
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		mov	ax, di
		add	ax, 1Ah
		mov	word ptr [bp+var_8C+2], ax
		mov	[bp+var_384], 0
		mov	[bp+var_382], 0
		push	word ptr [bp+var_8C+2]
		lea	ax, [bp+var_384]
		push	ax
		call	TextFormat_ApplyStyleAttribute_357D1
		add	sp, 4
		mov	ax, word_4D36E
		mov	word ptr [bp+var_8C], ax
		mov	[bp+var_392], 0
		mov	[bp+var_390], 0
		push	word ptr [bp+var_8C]
		lea	ax, [bp+var_392]
		push	ax
		call	TextFormat_ApplyStyleAttribute_357D1
		add	sp, 4
		mov	word ptr [di+10h], 0
		mov	word ptr [di+12h], 0
		mov	word ptr [di+14h], 13Fh
		mov	word ptr [di+16h], 0C7h
		push	18h
		push	0
		push	[bp+var_5A]
		mov	bx, [bp+var_5A]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	18h
		push	0
		push	si
		mov	bx, [si]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	[bp+var_5A]
		mov	bx, [bp+var_5A]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		add	sp, 2
		push	si
		mov	bx, [si]
		call	dword ptr [bx+0Ch]
		add	sp, 2
		mov	word ptr [bp+var_8E], 1
		jmp	short loc_6344B

loc_633CD:
		mov	ax, 18h
		sub	ax, word ptr [bp+var_8E]
		mov	word ptr [bp+var_90], ax
		mov	ax, word ptr [bp+var_8E]
		shl	ax, 1
		add	ax, 97h
		mov	word ptr [bp+var_92], ax
		mov	[bp+var_380], 0
		mov	ax, word ptr [bp+var_90]
		mov	[bp+var_37E], ax
		mov	[bp+var_37C], 13Fh
		mov	ax, word ptr [bp+var_92]
		mov	[bp+var_37A], ax
		mov	ax, 18h
		sub	ax, word ptr [bp+var_8E]
		mov	[bp+var_94], ax
		mov	ax, word ptr [bp+var_8E]
		shl	ax, 1
		add	ax, 97h
		mov	word ptr [bp+var_98+2], ax
		mov	[bp+var_38E], 0
		mov	ax, [bp+var_94]
		mov	[bp+var_38C], ax
		mov	[bp+var_38A], 13Fh
		mov	ax, word ptr [bp+var_98+2]
		mov	[bp+var_388], ax
		lea	ax, [bp+var_384]
		push	ax
		lea	ax, [bp+var_392]
		push	ax
		call	UI_ApplyEncodingHelper_35A92
		add	sp, 4
		inc	word ptr [bp+var_8E]

loc_6344B:
		cmp	word ptr [bp+var_8E], 18h
		jg	short loc_63455
		jmp	loc_633CD

loc_63455:
		call	Input_Flush_116D1
		call	TextScrollDisplayB_ApplyHelperC_45522
		mov	byte ptr [bp+var_9E], 0
		mov	[bp+var_A0], 0
		mov	[bp+var_A2], 0
		push	0Fh
		mov	ax, di
		add	ax, 2Ch
		push	ax
		mov	bx, [di+2Ch]
		call	dword ptr [bx+8]
		add	sp, 4
		xor	eax, eax
		mov	[bp+var_A6], eax
		mov	[bp+var_AA], eax
		mov	[bp+var_A6], 3
		mov	eax, dword_4DE15
		mov	[bp+var_AA], eax

loc_634A0:
		lea	ax, word ptr [bp+var_9E]
		push	ax
		call	TextScroll_FormatAndApply_44826
		add	sp, 2
		cmp	byte ptr [bp+var_9E], 0
		jnz	short loc_634DD
		lea	ax, word ptr [bp+var_9E]
		push	ax
		call	sub_AB45
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jnz	short loc_634DB
		lea	ax, [bp+var_AE]
		push	ax
		lea	ax, word ptr [bp+var_9E]
		push	ax
		call	sub_A981
		add	sp, 4
		jmp	short loc_634DB

loc_634DB:
		jmp	short loc_634DD

loc_634DD:
		cmp	byte ptr [bp+var_9E], 0
		jz	short loc_634F4
		mov	ax, word ptr [bp+var_9C]
		mov	[bp+var_A0], ax
		mov	ax, word ptr [bp+var_9A]
		mov	[bp+var_A2], ax

loc_634F4:
		cmp	byte ptr [bp+var_9E], 2
		jnz	short loc_634FE
		jmp	loc_635E4

loc_634FE:
		mov	eax, [bp+var_AA]
		add	eax, [bp+var_A6]
		cmp	eax, dword_4DE15
		ja	short loc_63514
		mov	ax, 1
		jmp	short loc_63516

loc_63514:
		xor	ax, ax

loc_63516:
		or	al, al
		jnz	short loc_6351D
		jmp	loc_635E1

loc_6351D:
		mov	[bp+var_A6], 3
		mov	eax, dword_4DE15
		mov	[bp+var_AA], eax
		lea	ax, [bp+var_31A]
		push	ax
		call	Scene_AdvanceFrame_33E60
		add	sp, 2
		push	[bp+var_5A]
		mov	bx, [bp+var_5A]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		add	sp, 2
		push	si
		mov	bx, [si]
		call	dword ptr [bx+0Ch]
		add	sp, 2
		cmp	[bp+var_A0], 118h
		jge	short loc_63589
		cmp	[bp+var_A0], 76h
		jl	short loc_63589
		cmp	[bp+var_A2], 70h
		jle	short loc_63589
		cmp	[bp+var_A2], 0C7h
		jg	short loc_63589
		push	1090h
		lea	ax, [bp+var_3B0]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	bx, [di+2Ah]
		mov	byte ptr [bx], 1
		jmp	short loc_6359F

loc_63589:
		push	109Fh
		lea	ax, [bp+var_3B0]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	bx, [di+2Ah]
		mov	byte ptr [bx], 0

loc_6359F:
		lea	ax, [bp+var_3B0]
		push	ax
		push	0AFh
		push	2
		push	10AEh
		lea	ax, [bp+var_376]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_375C2
		add	sp, 0Ah
		push	word_4D36C
		call	sub_45695
		add	sp, 2
		push	word_4D36C
		push	word_4D36E
		call	UI_ApplyEncodingHelper_35A92
		add	sp, 4
		push	word_4D36C
		call	sub_456A7
		add	sp, 2

loc_635E1:
		jmp	loc_634A0

loc_635E4:
		mov	bx, [di+2Ah]
		mov	al, [bx]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_635FD
		mov	ax, [bp+var_7F]
		mov	[bp+var_B0], ax
		mov	ax, [bp+var_B0]
		add	[di+4], ax

loc_635FD:
		call	TextScrollDisplayB_ApplyHelperD_4555C
		mov	word ptr [bp+var_8E], 0
		jmp	loc_636C1

loc_6360B:
		mov	[bp+var_B8], 0
		mov	[bp+var_B4], 1
		mov	eax, dword_4DE15
		mov	[bp+var_B8], eax
		jmp	short loc_63628

loc_63628:
		mov	eax, [bp+var_B8]
		add	eax, [bp+var_B4]
		cmp	eax, dword_4DE15
		ja	short loc_6363E
		mov	ax, 1
		jmp	short loc_63640

loc_6363E:
		xor	ax, ax

loc_63640:
		mov	ah, 0
		or	ax, ax
		jz	short loc_63628
		push	0
		push	word ptr [bp+var_8E]
		push	13Fh
		push	word ptr [bp+var_8E]
		push	0
		mov	ax, di
		add	ax, 0Ch
		push	ax
		call	sub_37F22
		add	sp, 0Ch
		push	0
		mov	ax, word ptr [bp+var_8E]
		shl	ax, 1
		mov	dx, 0C7h
		sub	dx, ax
		push	dx
		push	13Fh
		mov	ax, word ptr [bp+var_8E]
		shl	ax, 1
		mov	dx, 0C7h
		sub	dx, ax
		push	dx
		push	0
		mov	ax, di
		add	ax, 0Ch
		push	ax
		call	sub_37F22
		add	sp, 0Ch
		push	0
		mov	ax, word ptr [bp+var_8E]
		shl	ax, 1
		mov	dx, 0C6h
		sub	dx, ax
		push	dx
		push	13Fh
		mov	ax, word ptr [bp+var_8E]
		shl	ax, 1
		mov	dx, 0C6h
		sub	dx, ax
		push	dx
		push	0
		mov	ax, di
		add	ax, 0Ch
		push	ax
		call	sub_37F22
		add	sp, 0Ch
		inc	word ptr [bp+var_8E]

loc_636C1:
		cmp	word ptr [bp+var_8E], 18h
		jge	short loc_636CB
		jmp	loc_6360B

loc_636CB:
		push	0FFE8h
		push	0
		push	[bp+var_5A]
		mov	bx, [bp+var_5A]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	0FFE8h
		push	0
		push	si
		mov	bx, [si]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	word ptr [di+10h], 0
		mov	word ptr [di+12h], 18h
		mov	word ptr [di+14h], 13Fh
		mov	word ptr [di+16h], 97h
		lea	ax, [bp+var_392]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_384]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_374]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_86]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2

loc_63732:
		mov	ax, [di]
		add	ax, [di+8]
		cmp	ax, [di+4]
		ja	short loc_63741
		mov	ax, 1
		jmp	short loc_63743

loc_63741:
		xor	ax, ax

loc_63743:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_63761
		les	bx, [di+4]
		cmp	byte ptr es:[bx], 4
		jnz	short loc_63755
		jmp	loc_6306F

loc_63755:
		les	bx, [di+4]
		cmp	byte ptr es:[bx], 0Bh
		jnz	short loc_63761
		jmp	loc_6306F

loc_63761:
		push	seg stub192
		push	offset sub_479E0
		push	19h
		push	0
		push	0Ah
		push	[bp+var_52]
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg stub192
		push	offset sub_479E0
		push	19h
		push	0
		push	0Ah
		push	[bp+var_54]
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	[bp+var_56]
		call	sub_39C
		add	sp, 2
		lea	ax, [bp+var_78]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	byte ptr [bp+var_6D], 0
		jz	short loc_637CA
		cmp	[bp+var_72], 0
		jz	short loc_637CA
		push	0
		mov	al, byte ptr [bp+var_70+2]
		push	ax
		lea	ax, word ptr [bp+var_72]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_637CA

loc_637CA:
		mov	[bp+var_72], 0
		mov	byte ptr [bp+var_6D], 0
		mov	[bp+var_6C], 0
		cmp	byte ptr [bp+var_64+1], 0
		jz	short loc_63802
		cmp	[bp+var_68], 0
		jz	short loc_63802
		push	0
		mov	al, byte ptr [bp+var_64]
		push	ax
		lea	ax, word ptr [bp+var_68]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_63802

loc_63802:
		mov	[bp+var_68], 0
		mov	byte ptr [bp+var_64+1], 0
		mov	[bp+var_62], 0
		mov	[bp+var_35C], 127Fh
		push	[bp+var_342]
		call	sub_330E8
		add	sp, 2
		push	word ptr [bp+var_341+1]
		call	sub_330E8
		add	sp, 2
		lea	ax, [bp+var_33A]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_31A]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		lea	ax, [bp+var_46]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, word ptr [bp+var_40+2]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		jmp	loc_65C8E

loc_6386B:
		mov	word ptr [bp+var_40], 12C3h
		mov	byte ptr [bp+var_40+2], 0Eh
		mov	word ptr [bp+var_40], 126Fh
		push	di
		lea	ax, word ptr [bp+var_40]
		push	ax
		call	ConvRec_ReadWing_98E8
		add	sp, 4
		mov	al, byte ptr [bp+var_3D]
		mov	[bp+var_18], al
		push	ds
		push	offset aIff
		push	ds
		push	offset aGameflo2_1
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_108]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_3A2]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_3A2], 480h
		mov	[bp+var_341], 100h
		mov	[bp+var_345], 0
		mov	[bp+var_3A2], 498h
		push	1
		lea	ax, [bp+var_108]
		push	ax
		lea	ax, [bp+var_3A2]
		push	ax
		mov	bx, [bp+var_3A2]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large dword_49A9E
		lea	ax, [bp+var_3A2]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		or	ax, ax
		jnz	short loc_63909
		push	10C3h
		call	Runtime_FatalErrorHandler_36797
		add	sp, 2

loc_63909:
		mov	byte ptr [bp+var_44+3], 0
		jmp	short loc_6396A

loc_6390F:
		push	1
		push	large dword_49AC0
		lea	ax, [bp+var_3A2]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		push	0
		push	large dword_49AC5
		lea	ax, [bp+var_3A2]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		lea	ax, [bp+var_3A2]
		push	ax
		call	ResourceRecord_ReadFinalField_42B64
		add	sp, 2
		mov	dl, byte ptr [bp+var_3D+1]
		mov	dh, 0
		cmp	ax, dx
		jnz	short loc_63953
		mov	byte ptr [bp+var_44+3], 1
		jmp	short loc_6399D

loc_63953:
		mov	eax, [bp+var_32C]
		mov	[bp+var_33D], eax
		lea	ax, [bp+var_3A2]
		push	ax
		call	ResourceRecord_ReleaseAndClear_42D38
		add	sp, 2

loc_6396A:
		cmp	[bp+var_326], 0
		jnz	short loc_63980
		lea	ax, [bp+var_3A2]
		push	ax
		call	ResourceRecord_ReadPayload_42DC6
		add	sp, 2
		jmp	short loc_63996

loc_63980:
		mov	bx, [bp+var_326]
		mov	eax, [bx+0Fh]
		cmp	eax, [bp+var_33D]
		jg	short loc_63994
		mov	ax, 1
		jmp	short loc_63996

loc_63994:
		xor	ax, ax

loc_63996:
		or	ax, ax
		jnz	short loc_6399D
		jmp	loc_6390F

loc_6399D:
		mov	al, byte ptr [bp+var_44+3]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_639B7
		mov	al, byte ptr [bp+var_3D+1]
		mov	ah, 0
		push	ax
		push	10EAh
		call	Runtime_FatalErrorHandler_36797
		add	sp, 4

loc_639B7:
		lea	ax, [bp+var_3A2]
		push	ax
		call	ResourceRecord_ReadFinalField_42B64
		add	sp, 2
		mov	[bp+var_27], al
		mov	eax, [bp+var_32C]
		mov	[bp+var_33D], eax
		push	0
		push	large dword_49AF2
		lea	ax, [bp+var_3A2]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jnz	short loc_639FA
		mov	al, byte ptr [bp+var_3D+1]
		mov	ah, 0
		push	ax
		push	1117h
		call	Runtime_FatalErrorHandler_36797
		add	sp, 4

loc_639FA:
		jmp	short loc_63A1A

loc_639FC:
		mov	al, [bp+var_1F]
		mov	ah, 0
		lea	dx, [bp+var_1E]
		add	ax, dx
		push	ax
		lea	ax, [bp+var_3A2]
		push	ax
		call	ResourceRecord_ReadFinalField_42B64
		add	sp, 2
		pop	bx
		mov	[bx], al
		inc	[bp+var_1F]

loc_63A1A:
		test	[bp+var_330], 1
		jz	short loc_63A39
		mov	eax, [bp+var_32C]
		dec	eax
		cmp	eax, [bp+var_33D]
		jnz	short loc_63A37
		inc	[bp+var_33D]
		jmp	short loc_63A37

loc_63A37:
		jmp	short loc_63A39

loc_63A39:
		mov	eax, [bp+var_33D]
		cmp	eax, [bp+var_32C]
		jl	short loc_63A4A
		mov	ax, 1
		jmp	short loc_63A4C

loc_63A4A:
		xor	ax, ax

loc_63A4C:
		or	ax, ax
		jz	short loc_639FC
		mov	eax, [bp+var_32C]
		mov	[bp+var_33D], eax
		cmp	[bp+var_27], 1
		jz	short loc_63A66
		cmp	[bp+var_27], 2
		jnz	short loc_63AB3

loc_63A66:
		push	0
		push	large dword_49B19
		lea	ax, [bp+var_3A2]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jnz	short loc_63A8F
		mov	al, byte ptr [bp+var_3D+1]
		mov	ah, 0
		push	ax
		push	113Eh
		call	Runtime_FatalErrorHandler_36797
		add	sp, 4

loc_63A8F:
		xor	si, si
		jmp	short loc_63AA4

loc_63A93:
		lea	ax, [bp+var_3A2]
		push	ax
		call	ResourceRecord_ReadFinalField_42B64
		add	sp, 2
		mov	byte ptr [bp+si+var_26], al
		inc	si

loc_63AA4:
		cmp	si, 5
		jl	short loc_63A93
		mov	eax, [bp+var_32C]
		mov	[bp+var_33D], eax

loc_63AB3:
		lea	ax, [bp+var_3A2]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		mov	al, [bp+var_27]
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 3
		jbe	short loc_63ACF
		jmp	loc_63C53

loc_63ACF:
		shl	bx, 1
		jmp	cs:off_65D31[bx]	; switch jump

loc_63AD6:
		mov	al, byte ptr [bp+var_1E]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0E9Ah]
		mov	ax, [di+2Ah]
		inc	ax
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	bx, [di+2Ah]
		mov	byte ptr [bx+15h], 0
		mov	bx, [di+2Ah]
		mov	byte ptr [bx+29h], 0
		jmp	loc_63C55

loc_63B01:
		mov	al, byte ptr [bp+var_1E]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0E9Ah]
		mov	ax, [di+2Ah]
		inc	ax
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		xor	si, si
		jmp	short loc_63B2A

loc_63B1F:
		mov	al, byte ptr [bp+si+var_26]
		cmp	al, byte ptr [bp+var_1E]
		jz	short loc_63B29
		jmp	short loc_63B2F

loc_63B29:
		inc	si

loc_63B2A:
		cmp	si, 5
		jl	short loc_63B1F

loc_63B2F:
		mov	al, byte ptr [bp+si+var_26]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0E9Ah]
		mov	ax, [di+2Ah]
		add	ax, 15h
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	word ptr [bp+var_44], 0
		jmp	short loc_63B6B

loc_63B52:
		lea	ax, [bp+var_26]
		mov	bx, word ptr [bp+var_44]
		add	bx, ax
		mov	al, [bx]
		cmp	al, byte ptr [bp+var_1E]
		jz	short loc_63B68
		cmp	word ptr [bp+var_44], si
		jz	short loc_63B68
		jmp	short loc_63B71

loc_63B68:
		inc	word ptr [bp+var_44]

loc_63B6B:
		cmp	word ptr [bp+var_44], 5
		jl	short loc_63B52

loc_63B71:
		lea	ax, [bp+var_26]
		mov	bx, word ptr [bp+var_44]
		add	bx, ax
		mov	al, [bx]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0E9Ah]
		mov	ax, [di+2Ah]
		add	ax, 29h
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		jmp	loc_63C55

loc_63B97:
		mov	al, byte ptr [bp+var_1E]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0E9Ah]
		mov	ax, [di+2Ah]
		inc	ax
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		xor	si, si
		jmp	short loc_63BC0

loc_63BB5:
		mov	al, byte ptr [bp+si+var_26]
		cmp	al, byte ptr [bp+var_1E]
		jz	short loc_63BBF
		jmp	short loc_63BC5

loc_63BBF:
		inc	si

loc_63BC0:
		cmp	si, 5
		jl	short loc_63BB5

loc_63BC5:
		mov	al, byte ptr [bp+si+var_26]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0E9Ah]
		mov	ax, [di+2Ah]
		add	ax, 15h
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	al, [di+6Bh]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0EA6h]
		mov	ax, [di+2Ah]
		add	ax, 29h
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		jmp	short loc_63C55

loc_63BFF:
		mov	al, byte ptr [bp+var_1E]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0E9Ah]
		mov	ax, [di+2Ah]
		inc	ax
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	al, [di+6Bh]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0EA6h]
		mov	ax, [di+2Ah]
		add	ax, 15h
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	al, [di+6Ch]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0EA6h]
		mov	ax, [di+2Ah]
		add	ax, 29h
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		jmp	short loc_63C55

loc_63C53:
		jmp	short loc_63C55

loc_63C55:
		mov	[bp+var_3A2], 498h
		lea	ax, [bp+var_3A2]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_3A2]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4
		jmp	loc_65C8E

loc_63C7A:
		mov	byte ptr [bp+var_C], 0
		mov	byte ptr [bp+var_16], 0
		mov	ax, word_4989E
		mov	word ptr [bp+var_40], ax
		mov	ax, word_498A0
		mov	word ptr [bp+var_40+2], ax
		mov	al, byte_498A2
		mov	byte ptr [bp+var_3D+1], al
		mov	ax, word_498A3
		mov	[bp+var_48], ax
		mov	ax, word_498A5
		mov	[bp+var_46], ax
		mov	ax, word_498A7
		mov	word ptr [bp+var_44], ax
		mov	al, byte_498A9
		mov	byte ptr [bp+var_44+2], al
		xor	si, si
		jmp	short loc_63CC0

loc_63CB0:
		mov	al, byte ptr [bp+si+var_1E]
		mov	ah, 0
		lea	dx, [bp+var_48]
		add	ax, dx
		mov	bx, ax
		mov	byte ptr [bx], 1
		inc	si

loc_63CC0:
		mov	al, [bp+var_1F]
		mov	ah, 0
		cmp	ax, si
		jg	short loc_63CB0
		mov	ax, di
		add	ax, 1Ah
		mov	[bp+var_4E], ax
		push	[bp+var_4E]
		lea	ax, [bp+var_4C]
		push	ax
		call	sub_3499B
		add	sp, 4
		mov	ax, di
		add	ax, 0Ch
		push	ax
		push	0
		push	0Ah
		lea	ax, [bp+var_31A]
		push	ax
		call	LayerGroup_Construct_33CB2
		add	sp, 8
		mov	ax, di
		add	ax, 2Ch
		push	ax
		mov	ax, di
		add	ax, 1Ah
		push	ax
		lea	ax, [bp+var_334]
		push	ax
		call	Widget_ApplyStyleAndAllocate_36FD2
		add	sp, 6
		cmp	[bp+var_18], 0
		jnz	short loc_63D34
		lea	ax, [bp+var_54]
		push	ax
		lea	ax, [bp+var_52]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		push	1157h
		push	di
		push	cs
		call	near ptr sub_61893
		add	sp, 0Ah
		mov	ah, 0
		mov	[bp+var_56], ax
		jmp	short loc_63D50

loc_63D34:
		lea	ax, [bp+var_54]
		push	ax
		lea	ax, [bp+var_52]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		push	115Eh
		push	di
		push	cs
		call	near ptr sub_61893
		add	sp, 0Ah
		mov	ah, 0
		mov	[bp+var_56], ax

loc_63D50:
		push	0
		mov	bx, [bp+var_54]
		push	word ptr [bx]
		push	0
		push	[bp+var_50]
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	[bp+var_58], ax
		push	[bp+var_58]
		lea	ax, [bp+var_31A]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		mov	si, 1
		jmp	short loc_63DB8

loc_63D7E:
		push	0
		mov	ax, si
		shl	ax, 1
		mov	bx, [bp+var_54]
		add	bx, ax
		push	word ptr [bx]
		push	0
		mov	ax, si
		mov	dx, 0Ah
		imul	dx
		mov	dx, [bp+var_50]
		add	dx, ax
		push	dx
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_98], ax
		push	word ptr [bp+var_98]
		push	[bp+var_58]
		call	LayerGroup_Add_33BD0
		add	sp, 4
		inc	si

loc_63DB8:
		cmp	si, [bp+var_56]
		jl	short loc_63D7E
		mov	word ptr [bp+var_62+2], 6
		lea	ax, [bp+var_5E]
		push	ax
		lea	ax, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_5A]
		push	ax
		push	1165h
		push	di
		push	cs
		call	near ptr sub_61893
		add	sp, 0Ah
		push	0
		mov	bx, [bp+var_5E]
		push	word ptr [bx]
		push	0
		push	[bp+var_5A]
		push	0
		call	OverlayImageLayer_Construct_F227
		add	sp, 0Ah
		mov	[bp+var_342], ax
		push	[bp+var_342]
		push	[bp+var_58]
		call	LayerGroup_Add_33BD0
		add	sp, 4
		mov	si, 1
		jmp	short loc_63E66

loc_63E07:
		cmp	byte ptr [bp+si+var_48], 0
		jz	short loc_63E65
		push	0
		mov	ax, si
		shl	ax, 1
		mov	bx, [bp+var_5E]
		add	bx, ax
		push	word ptr [bx]
		push	0
		mov	ax, si
		mov	dx, 0Ah
		imul	dx
		mov	dx, [bp+var_5A]
		add	dx, ax
		push	dx
		push	0
		call	OverlayImageLayer_Construct_F227
		add	sp, 0Ah
		mov	bx, si
		shl	bx, 1
		lea	dx, [bp+var_342]
		add	bx, dx
		mov	[bx], ax
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_342]
		add	bx, ax
		cmp	word ptr [bx], 0
		jz	short loc_63E65
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_342]
		add	bx, ax
		push	word ptr [bx]
		push	[bp+var_58]
		call	LayerGroup_Add_33BD0
		add	sp, 4

loc_63E65:
		inc	si

loc_63E66:
		cmp	si, 3
		jl	short loc_63E07
		mov	si, 4
		jmp	short loc_63ECF

loc_63E70:
		cmp	byte ptr [bp+si+var_4A+1], 0
		jz	short loc_63ECE
		push	0
		mov	ax, si
		shl	ax, 1
		mov	bx, [bp+var_5E]
		add	bx, ax
		push	word ptr [bx]
		push	0
		mov	ax, si
		mov	dx, 0Ah
		imul	dx
		mov	dx, [bp+var_5A]
		add	dx, ax
		push	dx
		push	0
		call	OverlayImageLayer_Construct_F227
		add	sp, 0Ah
		mov	bx, si
		shl	bx, 1
		lea	dx, [bp+var_342]
		add	bx, dx
		mov	[bx], ax
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_342]
		add	bx, ax
		cmp	word ptr [bx], 0
		jz	short loc_63ECE
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_342]
		add	bx, ax
		push	word ptr [bx]
		push	[bp+var_58]
		call	LayerGroup_Add_33BD0
		add	sp, 4

loc_63ECE:
		inc	si

loc_63ECF:
		cmp	si, 7
		jl	short loc_63E70
		push	100h
		push	0
		lea	ax, word ptr [bp+var_68+2]
		push	ax
		call	Palette_Alloc_34A1A
		add	sp, 6
		xor	si, si
		jmp	short loc_63F38

loc_63EE9:
		mov	ax, si
		mov	dx, 0Ah
		imul	dx
		mov	dx, [bp+var_52]
		add	dx, ax
		mov	word ptr [bp+var_9E], dx
		mov	word ptr [bp+var_9A+1], 0
		push	word ptr [bp+var_9E]
		lea	ax, word ptr [bp+var_9C]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		push	word ptr [bp+var_9C]
		mov	al, byte ptr [bp+var_9A]
		push	ax
		lea	ax, word ptr [bp+var_9C]
		push	ax
		lea	ax, word ptr [bp+var_68+2]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		lea	ax, word ptr [bp+var_9C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		inc	si

loc_63F38:
		cmp	si, [bp+var_56]
		jl	short loc_63EE9
		mov	ax, [bp+var_5C]
		mov	word ptr [bp+var_70+2], ax
		mov	word ptr [bp+var_6A+1], 0
		push	word ptr [bp+var_70+2]
		lea	ax, word ptr [bp+var_6C]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		push	word ptr [bp+var_6C]
		mov	al, byte ptr [bp+var_6A]
		push	ax
		lea	ax, word ptr [bp+var_6C]
		push	ax
		lea	ax, word ptr [bp+var_68+2]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	word ptr [bp+var_68+2]
		mov	al, byte ptr [bp+var_64]
		push	ax
		lea	ax, word ptr [bp+var_68+2]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		lea	ax, [bp+var_31A]
		push	ax
		call	sub_33DD2
		add	sp, 2
		mov	ax, di
		add	ax, 1Ah
		mov	word ptr [bp+var_70], ax
		mov	[bp+var_350], 0
		mov	[bp+var_34E], 0
		push	word ptr [bp+var_70]
		lea	ax, [bp+var_350]
		push	ax
		call	TextFormat_ApplyStyleAttribute_357D1
		add	sp, 4
		mov	ax, word_4D36E
		mov	word ptr [bp+var_72], ax
		mov	[bp+var_35E], 0
		mov	[bp+var_35C], 0
		push	word ptr [bp+var_72]
		lea	ax, [bp+var_35E]
		push	ax
		call	TextFormat_ApplyStyleAttribute_357D1
		add	sp, 4
		mov	word ptr [di+10h], 0
		mov	word ptr [di+12h], 0
		mov	word ptr [di+14h], 13Fh
		mov	word ptr [di+16h], 0C7h
		push	18h
		push	0
		push	[bp+var_58]
		mov	bx, [bp+var_58]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	[bp+var_58]
		mov	bx, [bp+var_58]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		add	sp, 2
		mov	[bp+var_74], 1
		jmp	short loc_64090

loc_6401F:
		mov	ax, 18h
		sub	ax, [bp+var_74]
		mov	[bp+var_76], ax
		mov	ax, [bp+var_74]
		shl	ax, 1
		add	ax, 97h
		mov	[bp+var_78], ax
		mov	[bp+var_34C], 0
		mov	ax, [bp+var_76]
		mov	[bp+var_34A], ax
		mov	[bp+var_348], 13Fh
		mov	ax, [bp+var_78]
		mov	[bp+var_346], ax
		mov	ax, 18h
		sub	ax, [bp+var_74]
		mov	[bp+var_7A], ax
		mov	ax, [bp+var_74]
		shl	ax, 1
		add	ax, 97h
		mov	[bp+var_7C], ax
		mov	[bp+var_35A], 0
		mov	ax, [bp+var_7A]
		mov	[bp+var_358], ax
		mov	[bp+var_356], 13Fh
		mov	ax, [bp+var_7C]
		mov	[bp+var_354], ax
		lea	ax, [bp+var_350]
		push	ax
		lea	ax, [bp+var_35E]
		push	ax
		call	UI_ApplyEncodingHelper_35A92
		add	sp, 4
		inc	[bp+var_74]

loc_64090:
		cmp	[bp+var_74], 18h
		jle	short loc_6401F
		call	Input_Flush_116D1
		mov	word_4F7D6, 1
		call	TextScrollDisplayB_ApplyHelperC_45522
		mov	byte ptr [bp+var_84], 0
		mov	[bp+var_86], 0
		mov	[bp+var_88], 0
		push	0Fh
		mov	ax, di
		add	ax, 2Ch
		push	ax
		mov	bx, [di+2Ch]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	byte ptr [bp+var_8C+3], 0
		mov	byte ptr [bp+var_37C], 0
		xor	eax, eax
		mov	[bp+var_8E], eax
		mov	[bp+var_92], eax
		mov	[bp+var_8E], 6
		mov	eax, dword_4DE15
		mov	[bp+var_92], eax

loc_640F1:
		lea	ax, [bp+var_84]
		push	ax
		call	TextScroll_FormatAndApply_44826
		add	sp, 2
		cmp	byte ptr [bp+var_84], 0
		jnz	short loc_6412E
		lea	ax, [bp+var_84]
		push	ax
		call	sub_AB45
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6412C
		lea	ax, word ptr [bp+var_98+2]
		push	ax
		lea	ax, [bp+var_84]
		push	ax
		call	sub_A981
		add	sp, 4
		jmp	short loc_6412C

loc_6412C:
		jmp	short loc_6412E

loc_6412E:
		cmp	byte ptr [bp+var_84], 0
		jz	short loc_64144
		mov	ax, [bp+var_82]
		mov	[bp+var_86], ax
		mov	ax, [bp+var_80]
		mov	[bp+var_88], ax

loc_64144:
		mov	ax, word_4F7D6
		mov	word ptr [bp+var_98], ax
		cmp	byte ptr [bp+var_8C+3], 0
		jz	short loc_64161
		cmp	word ptr [bp+var_98], 1
		jnz	short loc_64161
		mov	word ptr [bp+var_98], 0
		jmp	short loc_64180

loc_64161:
		mov	al, byte ptr [bp+var_8C+3]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6417A
		cmp	word ptr [bp+var_98], 0
		jnz	short loc_6417A
		mov	word ptr [bp+var_98], 1
		jmp	short loc_64180

loc_6417A:
		mov	word ptr [bp+var_98], 0FFFFh

loc_64180:
		cmp	word ptr [bp+var_98], 0FFFFh
		jz	short loc_641A0
		call	TextScrollDisplayB_ApplyHelperD_4555C
		mov	ax, word ptr [bp+var_98]
		mov	word ptr [bp+var_9A], ax
		mov	ax, word ptr [bp+var_9A]
		mov	word_4F7D6, ax
		call	TextScrollDisplayB_ApplyHelperC_45522

loc_641A0:
		cmp	byte ptr [bp+var_84], 2
		jnz	short loc_641B1
		cmp	byte ptr [bp+var_8C+3], 0
		jz	short loc_641B1
		jmp	loc_643E9

loc_641B1:
		mov	eax, [bp+var_92]
		add	eax, [bp+var_8E]
		cmp	eax, dword_4DE15
		ja	short loc_641C7
		mov	ax, 1
		jmp	short loc_641C9

loc_641C7:
		xor	ax, ax

loc_641C9:
		or	al, al
		jnz	short loc_641D0
		jmp	loc_643E6

loc_641D0:
		mov	[bp+var_8E], 6
		mov	eax, dword_4DE15
		mov	[bp+var_92], eax
		push	[bp+var_58]
		mov	bx, [bp+var_58]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		add	sp, 2
		push	0AFh
		lea	ax, [bp+var_37C]
		push	ax
		push	2
		push	116Ch
		lea	ax, [bp+var_334]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_375C2
		add	sp, 0Ah
		push	word_4D36C
		call	sub_45695
		add	sp, 2
		push	word_4D36C
		push	word_4D36E
		call	UI_ApplyEncodingHelper_35A92
		add	sp, 4
		push	word_4D36C
		call	sub_456A7
		add	sp, 2
		mov	si, 1
		jmp	short loc_6424F

loc_64237:
		cmp	byte ptr [bp+si+var_48], 0
		jz	short loc_6424E
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_342]
		add	bx, ax
		mov	bx, [bx]
		mov	word ptr [bx+1Bh], 0

loc_6424E:
		inc	si

loc_6424F:
		cmp	si, 3
		jl	short loc_64237
		mov	si, 4
		jmp	short loc_64271

loc_64259:
		cmp	byte ptr [bp+si+var_48], 0
		jz	short loc_64270
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_342]
		add	bx, ax
		mov	bx, [bx]
		mov	word ptr [bx+1Bh], 0

loc_64270:
		inc	si

loc_64271:
		cmp	si, 7
		jl	short loc_64259
		cmp	[bp+var_86], 1D2h
		jge	short loc_642BC
		cmp	[bp+var_86], 176h
		jl	short loc_642BC
		cmp	[bp+var_88], 47h
		jle	short loc_642BC
		cmp	[bp+var_88], 0BFh
		jg	short loc_642BC
		cmp	byte ptr [bp+var_48+1], 0
		jz	short loc_642BC
		push	1173h
		lea	ax, [bp+var_37C]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	bx, word ptr [bp+var_341+1]
		mov	word ptr [bx+1Bh], 1
		mov	byte ptr [bp+var_8C+3], 1
		jmp	loc_643E6

loc_642BC:
		cmp	[bp+var_86], 178h
		jge	short loc_64302
		cmp	[bp+var_86], 122h
		jl	short loc_64302
		cmp	[bp+var_88], 4Ah
		jle	short loc_64302
		cmp	[bp+var_88], 0C5h
		jg	short loc_64302
		cmp	byte ptr [bp+var_46], 0
		jz	short loc_64302
		push	1180h
		lea	ax, [bp+var_37C]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	bx, [bp+var_33E]
		mov	word ptr [bx+1Bh], 1
		mov	byte ptr [bp+var_8C+3], 2
		jmp	loc_643E6

loc_64302:
		cmp	[bp+var_86], 98h
		jge	short loc_64347
		cmp	[bp+var_86], 3Ah
		jl	short loc_64347
		cmp	[bp+var_88], 43h
		jle	short loc_64347
		cmp	[bp+var_88], 0C3h
		jg	short loc_64347
		cmp	byte ptr [bp+var_46+1], 0
		jz	short loc_64347
		push	118Ch
		lea	ax, [bp+var_37C]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	bx, [bp+var_336]
		mov	word ptr [bx+1Bh], 1
		mov	byte ptr [bp+var_8C+3], 6
		jmp	loc_643E6

loc_64347:
		cmp	[bp+var_86], 10Ah
		jge	short loc_6438C
		cmp	[bp+var_86], 0A8h
		jl	short loc_6438C
		cmp	[bp+var_88], 47h
		jle	short loc_6438C
		cmp	[bp+var_88], 0C1h
		jg	short loc_6438C
		cmp	byte ptr [bp+var_44], 0
		jz	short loc_6438C
		push	1197h
		lea	ax, [bp+var_37C]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	bx, [bp+var_33A]
		mov	word ptr [bx+1Bh], 1
		mov	byte ptr [bp+var_8C+3], 4
		jmp	short loc_643E6

loc_6438C:
		cmp	[bp+var_86], 234h
		jge	short loc_643D1
		cmp	[bp+var_86], 1E4h
		jl	short loc_643D1
		cmp	[bp+var_88], 45h
		jle	short loc_643D1
		cmp	[bp+var_88], 11Ah
		jg	short loc_643D1
		cmp	byte ptr [bp+var_44+1], 0
		jz	short loc_643D1
		push	11A5h
		lea	ax, [bp+var_37C]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	bx, [bp+var_338]
		mov	word ptr [bx+1Bh], 1
		mov	byte ptr [bp+var_8C+3], 5
		jmp	short loc_643E6

loc_643D1:
		push	11B0h
		lea	ax, [bp+var_37C]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	byte ptr [bp+var_8C+3], 0

loc_643E6:
		jmp	loc_640F1

loc_643E9:
		call	TextScrollDisplayB_ApplyHelperD_4555C
		mov	[bp+var_74], 0
		jmp	loc_644A5

loc_643F6:
		mov	[bp+var_9E], 0
		mov	[bp+var_9A], 1
		mov	eax, dword_4DE15
		mov	[bp+var_9E], eax
		jmp	short loc_64413

loc_64413:
		mov	eax, [bp+var_9E]
		add	eax, [bp+var_9A]
		cmp	eax, dword_4DE15
		ja	short loc_64429
		mov	ax, 1
		jmp	short loc_6442B

loc_64429:
		xor	ax, ax

loc_6442B:
		mov	ah, 0
		or	ax, ax
		jz	short loc_64413
		push	0
		push	[bp+var_74]
		push	13Fh
		push	[bp+var_74]
		push	0
		mov	ax, di
		add	ax, 0Ch
		push	ax
		call	sub_37F22
		add	sp, 0Ch
		push	0
		mov	ax, [bp+var_74]
		shl	ax, 1
		mov	dx, 0C7h
		sub	dx, ax
		push	dx
		push	13Fh
		mov	ax, [bp+var_74]
		shl	ax, 1
		mov	dx, 0C7h
		sub	dx, ax
		push	dx
		push	0
		mov	ax, di
		add	ax, 0Ch
		push	ax
		call	sub_37F22
		add	sp, 0Ch
		push	0
		mov	ax, [bp+var_74]
		shl	ax, 1
		mov	dx, 0C6h
		sub	dx, ax
		push	dx
		push	13Fh
		mov	ax, [bp+var_74]
		shl	ax, 1
		mov	dx, 0C6h
		sub	dx, ax
		push	dx
		push	0
		mov	ax, di
		add	ax, 0Ch
		push	ax
		call	sub_37F22
		add	sp, 0Ch
		inc	[bp+var_74]

loc_644A5:
		cmp	[bp+var_74], 18h
		jge	short loc_644AE
		jmp	loc_643F6

loc_644AE:
		push	0FFE8h
		push	0
		push	[bp+var_58]
		mov	bx, [bp+var_58]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	word ptr [di+10h], 0
		mov	word ptr [di+12h], 18h
		mov	word ptr [di+14h], 13Fh
		mov	word ptr [di+16h], 97h
		mov	al, [bp+var_27]
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 3
		jbe	short loc_644E3
		jmp	loc_646AA

loc_644E3:
		shl	bx, 1
		jmp	cs:off_65D29[bx]	; switch jump

loc_644EA:
		mov	al, byte ptr [bp+var_8C+3]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0E9Ah]
		mov	ax, [di+2Ah]
		inc	ax
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	bx, [di+2Ah]
		mov	byte ptr [bx+15h], 0
		mov	bx, [di+2Ah]
		mov	byte ptr [bx+29h], 0
		jmp	loc_646AA

loc_64516:
		mov	al, byte ptr [bp+var_8C+3]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0E9Ah]
		mov	ax, [di+2Ah]
		inc	ax
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	word ptr [bp+var_98], 0
		jmp	short loc_64550

loc_64539:
		lea	ax, [bp+var_26]
		mov	bx, word ptr [bp+var_98]
		add	bx, ax
		mov	al, [bx]
		cmp	al, byte ptr [bp+var_8C+3]
		jz	short loc_6454C
		jmp	short loc_64557

loc_6454C:
		inc	word ptr [bp+var_98]

loc_64550:
		cmp	word ptr [bp+var_98], 5
		jl	short loc_64539

loc_64557:
		lea	ax, [bp+var_26]
		mov	bx, word ptr [bp+var_98]
		add	bx, ax
		mov	al, [bx]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0E9Ah]
		mov	ax, [di+2Ah]
		add	ax, 15h
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	word ptr [bp+var_9A], 0
		jmp	short loc_645A4

loc_64583:
		lea	ax, [bp+var_26]
		mov	bx, word ptr [bp+var_9A]
		add	bx, ax
		mov	al, [bx]
		cmp	al, byte ptr [bp+var_8C+3]
		jz	short loc_645A0
		mov	ax, word ptr [bp+var_9A]
		cmp	ax, word ptr [bp+var_98]
		jz	short loc_645A0
		jmp	short loc_645AB

loc_645A0:
		inc	word ptr [bp+var_9A]

loc_645A4:
		cmp	word ptr [bp+var_9A], 5
		jl	short loc_64583

loc_645AB:
		lea	ax, [bp+var_26]
		mov	bx, word ptr [bp+var_9A]
		add	bx, ax
		mov	al, [bx]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0E9Ah]
		mov	ax, [di+2Ah]
		add	ax, 29h
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		jmp	loc_646AA

loc_645D2:
		mov	al, byte ptr [bp+var_8C+3]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0E9Ah]
		mov	ax, [di+2Ah]
		inc	ax
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	word ptr [bp+var_98], 0
		jmp	short loc_6460C

loc_645F5:
		lea	ax, [bp+var_26]
		mov	bx, word ptr [bp+var_98]
		add	bx, ax
		mov	al, [bx]
		cmp	al, byte ptr [bp+var_8C+3]
		jz	short loc_64608
		jmp	short loc_64613

loc_64608:
		inc	word ptr [bp+var_98]

loc_6460C:
		cmp	word ptr [bp+var_98], 5
		jl	short loc_645F5

loc_64613:
		lea	ax, [bp+var_26]
		mov	bx, word ptr [bp+var_98]
		add	bx, ax
		mov	al, [bx]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0E9Ah]
		mov	ax, [di+2Ah]
		add	ax, 15h
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	al, [di+6Bh]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0EA6h]
		mov	ax, [di+2Ah]
		add	ax, 29h
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		jmp	short loc_646AA

loc_64655:
		mov	al, byte ptr [bp+var_8C+3]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0E9Ah]
		mov	ax, [di+2Ah]
		inc	ax
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	al, [di+6Bh]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0EA6h]
		mov	ax, [di+2Ah]
		add	ax, 15h
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	al, [di+6Ch]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0EA6h]
		mov	ax, [di+2Ah]
		add	ax, 29h
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		jmp	short loc_646AA

loc_646AA:
		push	seg stub192
		push	offset sub_479E0
		push	19h
		push	0
		push	0Ah
		push	[bp+var_50]
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg stub192
		push	offset sub_479E0
		push	19h
		push	0
		push	0Ah
		push	[bp+var_52]
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	[bp+var_54]
		call	sub_39C
		add	sp, 2
		push	seg stub192
		push	offset sub_479E0
		push	19h
		push	0
		push	0Ah
		push	[bp+var_5A]
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg stub192
		push	offset sub_479E0
		push	19h
		push	0
		push	0Ah
		push	[bp+var_5C]
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	[bp+var_5E]
		call	sub_39C
		add	sp, 2
		lea	ax, [bp+var_35E]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_350]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, word ptr [bp+var_6C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, word ptr [bp+var_68+2]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_332]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_31A]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		lea	ax, [bp+var_4C]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		jmp	loc_65C8E

loc_64779:
		mov	byte ptr [bp+var_C], 0
		mov	byte ptr [bp+var_16], 0
		mov	ax, word_498AA
		mov	word ptr [bp+var_40], ax
		mov	ax, word_498AC
		mov	word ptr [bp+var_40+2], ax
		mov	al, byte_498AE
		mov	byte ptr [bp+var_3D+1], al
		mov	ax, word_498AF
		mov	[bp+var_46], ax
		mov	ax, word_498B1
		mov	word ptr [bp+var_44], ax
		mov	ax, word_498B3
		mov	word ptr [bp+var_44+2], ax
		xor	si, si
		jmp	short loc_647B9

loc_647A9:
		mov	al, byte ptr [bp+si+var_1E]
		mov	ah, 0
		lea	dx, [bp+var_46]
		add	ax, dx
		mov	bx, ax
		mov	byte ptr [bx], 1
		inc	si

loc_647B9:
		mov	al, [bp+var_1F]
		mov	ah, 0
		cmp	ax, si
		jg	short loc_647A9
		mov	al, [bp+var_19]
		mov	ah, 0
		lea	dx, [bp+var_46]
		add	ax, dx
		mov	bx, ax
		mov	byte ptr [bx], 0
		mov	ax, di
		add	ax, 1Ah
		mov	[bp+var_4C], ax
		push	[bp+var_4C]
		lea	ax, [bp+var_4A]
		push	ax
		call	sub_3499B
		add	sp, 4
		mov	ax, di
		add	ax, 0Ch
		push	ax
		push	0
		push	0Ah
		lea	ax, [bp+var_31A]
		push	ax
		call	LayerGroup_Construct_33CB2
		add	sp, 8
		mov	ax, di
		add	ax, 2Ch
		push	ax
		mov	ax, di
		add	ax, 1Ah
		push	ax
		lea	ax, [bp+var_334]
		push	ax
		call	Widget_ApplyStyleAndAllocate_36FD2
		add	sp, 6
		cmp	[bp+var_18], 0
		jnz	short loc_6483C
		lea	ax, [bp+var_52]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		lea	ax, [bp+var_4E]
		push	ax
		push	11B1h
		push	di
		push	cs
		call	near ptr sub_61893
		add	sp, 0Ah
		mov	ah, 0
		mov	[bp+var_54], ax
		jmp	short loc_64858

loc_6483C:
		lea	ax, [bp+var_52]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		lea	ax, [bp+var_4E]
		push	ax
		push	11B8h
		push	di
		push	cs
		call	near ptr sub_61893
		add	sp, 0Ah
		mov	ah, 0
		mov	[bp+var_54], ax

loc_64858:
		push	0
		mov	bx, [bp+var_52]
		push	word ptr [bx]
		push	0
		push	[bp+var_4E]
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	[bp+var_56], ax
		push	[bp+var_56]
		lea	ax, [bp+var_31A]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		mov	si, 1
		jmp	short loc_648C0

loc_64886:
		push	0
		mov	ax, si
		shl	ax, 1
		mov	bx, [bp+var_52]
		add	bx, ax
		push	word ptr [bx]
		push	0
		mov	ax, si
		mov	dx, 0Ah
		imul	dx
		mov	dx, [bp+var_4E]
		add	dx, ax
		push	dx
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_98+2], ax
		push	word ptr [bp+var_98+2]
		push	[bp+var_56]
		call	LayerGroup_Add_33BD0
		add	sp, 4
		inc	si

loc_648C0:
		cmp	si, [bp+var_54]
		jl	short loc_64886
		mov	[bp+var_5E], 6
		lea	ax, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_5A]
		push	ax
		lea	ax, [bp+var_58]
		push	ax
		push	11BFh
		push	di
		push	cs
		call	near ptr sub_61893
		add	sp, 0Ah
		push	0
		mov	bx, [bp+var_5C]
		push	word ptr [bx]
		push	0
		push	[bp+var_58]
		push	0
		call	OverlayImageLayer_Construct_F227
		add	sp, 0Ah
		mov	[bp+var_342], ax
		push	[bp+var_342]
		push	[bp+var_56]
		call	LayerGroup_Add_33BD0
		add	sp, 4
		mov	byte ptr [bp+var_44+1], 0
		mov	si, 1
		jmp	short loc_64963

loc_64913:
		cmp	byte ptr [bp+si+var_46], 0
		jz	short loc_64962
		push	0
		mov	ax, si
		shl	ax, 1
		mov	bx, [bp+var_5C]
		add	bx, ax
		push	word ptr [bx]
		push	0
		mov	ax, si
		mov	dx, 0Ah
		imul	dx
		mov	dx, [bp+var_58]
		add	dx, ax
		push	dx
		push	0
		call	OverlayImageLayer_Construct_F227
		add	sp, 0Ah
		mov	bx, si
		shl	bx, 1
		lea	dx, [bp+var_342]
		add	bx, dx
		mov	[bx], ax
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_342]
		add	bx, ax
		push	word ptr [bx]
		push	[bp+var_56]
		call	LayerGroup_Add_33BD0
		add	sp, 4

loc_64962:
		inc	si

loc_64963:
		cmp	si, 6
		jl	short loc_64913
		push	100h
		push	0
		lea	ax, word ptr [bp+var_64]
		push	ax
		call	Palette_Alloc_34A1A
		add	sp, 6
		xor	si, si
		jmp	short loc_649CC

loc_6497D:
		mov	ax, si
		mov	dx, 0Ah
		imul	dx
		mov	dx, [bp+var_50]
		add	dx, ax
		mov	word ptr [bp+var_9C], dx
		mov	word ptr [bp+var_98+1], 0
		push	word ptr [bp+var_9C]
		lea	ax, word ptr [bp+var_9A]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		push	word ptr [bp+var_9A]
		mov	al, byte ptr [bp+var_98]
		push	ax
		lea	ax, word ptr [bp+var_9A]
		push	ax
		lea	ax, word ptr [bp+var_64]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		lea	ax, word ptr [bp+var_9A]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		inc	si

loc_649CC:
		cmp	si, [bp+var_54]
		jl	short loc_6497D
		mov	ax, [bp+var_5A]
		mov	word ptr [bp+var_6C], ax
		mov	word ptr [bp+var_68+1], 0
		push	word ptr [bp+var_6C]
		lea	ax, word ptr [bp+var_6A]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		push	word ptr [bp+var_6A]
		mov	al, byte ptr [bp+var_68]
		push	ax
		lea	ax, word ptr [bp+var_6A]
		push	ax
		lea	ax, word ptr [bp+var_64]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	word ptr [bp+var_64]
		mov	al, byte ptr [bp+var_62]
		push	ax
		lea	ax, word ptr [bp+var_64]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		lea	ax, [bp+var_31A]
		push	ax
		call	sub_33DD2
		add	sp, 2
		mov	ax, di
		add	ax, 1Ah
		mov	word ptr [bp+var_70+2], ax
		mov	[bp+var_350], 0
		mov	[bp+var_34E], 0
		push	word ptr [bp+var_70+2]
		lea	ax, [bp+var_350]
		push	ax
		call	TextFormat_ApplyStyleAttribute_357D1
		add	sp, 4
		mov	ax, word_4D36E
		mov	word ptr [bp+var_70], ax
		mov	[bp+var_35E], 0
		mov	[bp+var_35C], 0
		push	word ptr [bp+var_70]
		lea	ax, [bp+var_35E]
		push	ax
		call	TextFormat_ApplyStyleAttribute_357D1
		add	sp, 4
		mov	word ptr [di+10h], 0
		mov	word ptr [di+12h], 0
		mov	word ptr [di+14h], 13Fh
		mov	word ptr [di+16h], 0C7h
		push	18h
		push	0
		push	[bp+var_56]
		mov	bx, [bp+var_56]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	[bp+var_56]
		mov	bx, [bp+var_56]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		add	sp, 2
		mov	word ptr [bp+var_72], 1
		jmp	short loc_64B24

loc_64AB3:
		mov	ax, 18h
		sub	ax, word ptr [bp+var_72]
		mov	[bp+var_74], ax
		mov	ax, word ptr [bp+var_72]
		shl	ax, 1
		add	ax, 97h
		mov	[bp+var_76], ax
		mov	[bp+var_34C], 0
		mov	ax, [bp+var_74]
		mov	[bp+var_34A], ax
		mov	[bp+var_348], 13Fh
		mov	ax, [bp+var_76]
		mov	[bp+var_346], ax
		mov	ax, 18h
		sub	ax, word ptr [bp+var_72]
		mov	[bp+var_78], ax
		mov	ax, word ptr [bp+var_72]
		shl	ax, 1
		add	ax, 97h
		mov	[bp+var_7A], ax
		mov	[bp+var_35A], 0
		mov	ax, [bp+var_78]
		mov	[bp+var_358], ax
		mov	[bp+var_356], 13Fh
		mov	ax, [bp+var_7A]
		mov	[bp+var_354], ax
		lea	ax, [bp+var_350]
		push	ax
		lea	ax, [bp+var_35E]
		push	ax
		call	UI_ApplyEncodingHelper_35A92
		add	sp, 4
		inc	word ptr [bp+var_72]

loc_64B24:
		cmp	word ptr [bp+var_72], 18h
		jle	short loc_64AB3
		call	Input_Flush_116D1
		mov	word_4F7D6, 1
		call	TextScrollDisplayB_ApplyHelperC_45522
		mov	byte ptr [bp+var_82], 0
		mov	[bp+var_84], 0
		mov	[bp+var_86], 0
		push	0Fh
		mov	ax, di
		add	ax, 2Ch
		push	ax
		mov	bx, [di+2Ch]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	byte ptr [bp+var_88+1], 0
		mov	byte ptr [bp+var_37C], 0
		xor	eax, eax
		mov	[bp+var_8C], eax
		mov	[bp+var_90], eax
		mov	[bp+var_8C], 6
		mov	eax, dword_4DE15
		mov	[bp+var_90], eax

loc_64B85:
		lea	ax, [bp+var_82]
		push	ax
		call	TextScroll_FormatAndApply_44826
		add	sp, 2
		cmp	byte ptr [bp+var_82], 0
		jnz	short loc_64BC2
		lea	ax, [bp+var_82]
		push	ax
		call	sub_AB45
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jnz	short loc_64BC0
		lea	ax, [bp+var_94]
		push	ax
		lea	ax, [bp+var_82]
		push	ax
		call	sub_A981
		add	sp, 4
		jmp	short loc_64BC0

loc_64BC0:
		jmp	short loc_64BC2

loc_64BC2:
		cmp	byte ptr [bp+var_82], 0
		jz	short loc_64BD7
		mov	ax, [bp+var_80]
		mov	[bp+var_84], ax
		mov	ax, [bp+var_7E]
		mov	[bp+var_86], ax

loc_64BD7:
		mov	ax, word_4F7D6
		mov	word ptr [bp+var_98+2], ax
		cmp	byte ptr [bp+var_88+1], 0
		jz	short loc_64BF4
		cmp	word ptr [bp+var_98+2], 1
		jnz	short loc_64BF4
		mov	word ptr [bp+var_98+2], 0
		jmp	short loc_64C13

loc_64BF4:
		mov	al, byte ptr [bp+var_88+1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_64C0D
		cmp	word ptr [bp+var_98+2], 0
		jnz	short loc_64C0D
		mov	word ptr [bp+var_98+2], 1
		jmp	short loc_64C13

loc_64C0D:
		mov	word ptr [bp+var_98+2], 0FFFFh

loc_64C13:
		cmp	word ptr [bp+var_98+2], 0FFFFh
		jz	short loc_64C33
		call	TextScrollDisplayB_ApplyHelperD_4555C
		mov	ax, word ptr [bp+var_98+2]
		mov	word ptr [bp+var_98], ax
		mov	ax, word ptr [bp+var_98]
		mov	word_4F7D6, ax
		call	TextScrollDisplayB_ApplyHelperC_45522

loc_64C33:
		cmp	byte ptr [bp+var_82], 2
		jnz	short loc_64C44
		cmp	byte ptr [bp+var_88+1], 0
		jz	short loc_64C44
		jmp	loc_64E7C

loc_64C44:
		mov	eax, [bp+var_90]
		add	eax, [bp+var_8C]
		cmp	eax, dword_4DE15
		ja	short loc_64C5A
		mov	ax, 1
		jmp	short loc_64C5C

loc_64C5A:
		xor	ax, ax

loc_64C5C:
		or	al, al
		jnz	short loc_64C63
		jmp	loc_64E79

loc_64C63:
		mov	[bp+var_8C], 6
		mov	eax, dword_4DE15
		mov	[bp+var_90], eax
		push	[bp+var_56]
		mov	bx, [bp+var_56]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		add	sp, 2
		push	0AFh
		lea	ax, [bp+var_37C]
		push	ax
		push	2
		push	11C6h
		lea	ax, [bp+var_334]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_375C2
		add	sp, 0Ah
		push	word_4D36C
		call	sub_45695
		add	sp, 2
		push	word_4D36C
		push	word_4D36E
		call	UI_ApplyEncodingHelper_35A92
		add	sp, 4
		push	word_4D36C
		call	sub_456A7
		add	sp, 2
		mov	si, 1
		jmp	short loc_64CE2

loc_64CCA:
		cmp	byte ptr [bp+si+var_46], 0
		jz	short loc_64CE1
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_342]
		add	bx, ax
		mov	bx, [bx]
		mov	word ptr [bx+1Bh], 0

loc_64CE1:
		inc	si

loc_64CE2:
		cmp	si, 3
		jl	short loc_64CCA
		mov	si, 4
		jmp	short loc_64D04

loc_64CEC:
		cmp	byte ptr [bp+si+var_46], 0
		jz	short loc_64D03
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_342]
		add	bx, ax
		mov	bx, [bx]
		mov	word ptr [bx+1Bh], 0

loc_64D03:
		inc	si

loc_64D04:
		cmp	si, 6
		jl	short loc_64CEC
		cmp	[bp+var_84], 1D2h
		jge	short loc_64D4F
		cmp	[bp+var_84], 176h
		jl	short loc_64D4F
		cmp	[bp+var_86], 47h
		jle	short loc_64D4F
		cmp	[bp+var_86], 0BFh
		jg	short loc_64D4F
		cmp	byte ptr [bp+var_46+1], 0
		jz	short loc_64D4F
		push	11CDh
		lea	ax, [bp+var_37C]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	bx, word ptr [bp+var_341+1]
		mov	word ptr [bx+1Bh], 1
		mov	byte ptr [bp+var_88+1], 1
		jmp	loc_64E79

loc_64D4F:
		cmp	[bp+var_84], 178h
		jge	short loc_64D95
		cmp	[bp+var_84], 122h
		jl	short loc_64D95
		cmp	[bp+var_86], 4Ah
		jle	short loc_64D95
		cmp	[bp+var_86], 0C5h
		jg	short loc_64D95
		cmp	byte ptr [bp+var_44], 0
		jz	short loc_64D95
		push	11DAh
		lea	ax, [bp+var_37C]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	bx, [bp+var_33E]
		mov	word ptr [bx+1Bh], 1
		mov	byte ptr [bp+var_88+1], 2
		jmp	loc_64E79

loc_64D95:
		cmp	[bp+var_84], 98h
		jge	short loc_64DDA
		cmp	[bp+var_84], 3Ah
		jl	short loc_64DDA
		cmp	[bp+var_86], 43h
		jle	short loc_64DDA
		cmp	[bp+var_86], 0C3h
		jg	short loc_64DDA
		cmp	byte ptr [bp+var_44+1], 0
		jz	short loc_64DDA
		push	11E6h
		lea	ax, [bp+var_37C]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	bx, word ptr [bp+var_33D+1]
		mov	word ptr [bx+1Bh], 1
		mov	byte ptr [bp+var_88+1], 3
		jmp	loc_64E79

loc_64DDA:
		cmp	[bp+var_84], 10Ah
		jge	short loc_64E1F
		cmp	[bp+var_84], 0A8h
		jl	short loc_64E1F
		cmp	[bp+var_86], 47h
		jle	short loc_64E1F
		cmp	[bp+var_86], 0C1h
		jg	short loc_64E1F
		cmp	byte ptr [bp+var_44+2], 0
		jz	short loc_64E1F
		push	11F2h
		lea	ax, [bp+var_37C]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	bx, [bp+var_33A]
		mov	word ptr [bx+1Bh], 1
		mov	byte ptr [bp+var_88+1], 4
		jmp	short loc_64E79

loc_64E1F:
		cmp	[bp+var_84], 234h
		jge	short loc_64E64
		cmp	[bp+var_84], 1E4h
		jl	short loc_64E64
		cmp	[bp+var_86], 45h
		jle	short loc_64E64
		cmp	[bp+var_86], 11Ah
		jg	short loc_64E64
		cmp	byte ptr [bp+var_44+3], 0
		jz	short loc_64E64
		push	1200h
		lea	ax, [bp+var_37C]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	bx, [bp+var_338]
		mov	word ptr [bx+1Bh], 1
		mov	byte ptr [bp+var_88+1], 5
		jmp	short loc_64E79

loc_64E64:
		push	120Bh
		lea	ax, [bp+var_37C]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	byte ptr [bp+var_88+1], 0

loc_64E79:
		jmp	loc_64B85

loc_64E7C:
		call	TextScrollDisplayB_ApplyHelperD_4555C
		mov	word ptr [bp+var_72], 0
		jmp	loc_64F38

loc_64E89:
		mov	[bp+var_9C], 0
		mov	[bp+var_98], 1
		mov	eax, dword_4DE15
		mov	[bp+var_9C], eax
		jmp	short loc_64EA6

loc_64EA6:
		mov	eax, [bp+var_9C]
		add	eax, [bp+var_98]
		cmp	eax, dword_4DE15
		ja	short loc_64EBC
		mov	ax, 1
		jmp	short loc_64EBE

loc_64EBC:
		xor	ax, ax

loc_64EBE:
		mov	ah, 0
		or	ax, ax
		jz	short loc_64EA6
		push	0
		push	word ptr [bp+var_72]
		push	13Fh
		push	word ptr [bp+var_72]
		push	0
		mov	ax, di
		add	ax, 0Ch
		push	ax
		call	sub_37F22
		add	sp, 0Ch
		push	0
		mov	ax, word ptr [bp+var_72]
		shl	ax, 1
		mov	dx, 0C7h
		sub	dx, ax
		push	dx
		push	13Fh
		mov	ax, word ptr [bp+var_72]
		shl	ax, 1
		mov	dx, 0C7h
		sub	dx, ax
		push	dx
		push	0
		mov	ax, di
		add	ax, 0Ch
		push	ax
		call	sub_37F22
		add	sp, 0Ch
		push	0
		mov	ax, word ptr [bp+var_72]
		shl	ax, 1
		mov	dx, 0C6h
		sub	dx, ax
		push	dx
		push	13Fh
		mov	ax, word ptr [bp+var_72]
		shl	ax, 1
		mov	dx, 0C6h
		sub	dx, ax
		push	dx
		push	0
		mov	ax, di
		add	ax, 0Ch
		push	ax
		call	sub_37F22
		add	sp, 0Ch
		inc	word ptr [bp+var_72]

loc_64F38:
		cmp	word ptr [bp+var_72], 18h
		jge	short loc_64F41
		jmp	loc_64E89

loc_64F41:
		push	0FFE8h
		push	0
		push	[bp+var_56]
		mov	bx, [bp+var_56]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	word ptr [di+10h], 0
		mov	word ptr [di+12h], 18h
		mov	word ptr [di+14h], 13Fh
		mov	word ptr [di+16h], 97h
		mov	al, [bp+var_27]
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 3
		jbe	short loc_64F76
		jmp	loc_6513D

loc_64F76:
		shl	bx, 1
		jmp	cs:off_65D21[bx]	; switch jump

loc_64F7D:
		mov	al, byte ptr [bp+var_88+1]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0E9Ah]
		mov	ax, [di+2Ah]
		inc	ax
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	bx, [di+2Ah]
		mov	byte ptr [bx+15h], 0
		mov	bx, [di+2Ah]
		mov	byte ptr [bx+29h], 0
		jmp	loc_6513D

loc_64FA9:
		mov	al, byte ptr [bp+var_88+1]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0E9Ah]
		mov	ax, [di+2Ah]
		inc	ax
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	word ptr [bp+var_98+2], 0
		jmp	short loc_64FE3

loc_64FCC:
		lea	ax, [bp+var_26]
		mov	bx, word ptr [bp+var_98+2]
		add	bx, ax
		mov	al, [bx]
		cmp	al, byte ptr [bp+var_88+1]
		jz	short loc_64FDF
		jmp	short loc_64FEA

loc_64FDF:
		inc	word ptr [bp+var_98+2]

loc_64FE3:
		cmp	word ptr [bp+var_98+2], 5
		jl	short loc_64FCC

loc_64FEA:
		lea	ax, [bp+var_26]
		mov	bx, word ptr [bp+var_98+2]
		add	bx, ax
		mov	al, [bx]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0E9Ah]
		mov	ax, [di+2Ah]
		add	ax, 15h
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	word ptr [bp+var_98], 0
		jmp	short loc_65037

loc_65016:
		lea	ax, [bp+var_26]
		mov	bx, word ptr [bp+var_98]
		add	bx, ax
		mov	al, [bx]
		cmp	al, byte ptr [bp+var_88+1]
		jz	short loc_65033
		mov	ax, word ptr [bp+var_98]
		cmp	ax, word ptr [bp+var_98+2]
		jz	short loc_65033
		jmp	short loc_6503E

loc_65033:
		inc	word ptr [bp+var_98]

loc_65037:
		cmp	word ptr [bp+var_98], 5
		jl	short loc_65016

loc_6503E:
		lea	ax, [bp+var_26]
		mov	bx, word ptr [bp+var_98]
		add	bx, ax
		mov	al, [bx]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0E9Ah]
		mov	ax, [di+2Ah]
		add	ax, 29h
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		jmp	loc_6513D

loc_65065:
		mov	al, byte ptr [bp+var_88+1]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0E9Ah]
		mov	ax, [di+2Ah]
		inc	ax
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	word ptr [bp+var_98+2], 0
		jmp	short loc_6509F

loc_65088:
		lea	ax, [bp+var_26]
		mov	bx, word ptr [bp+var_98+2]
		add	bx, ax
		mov	al, [bx]
		cmp	al, byte ptr [bp+var_88+1]
		jz	short loc_6509B
		jmp	short loc_650A6

loc_6509B:
		inc	word ptr [bp+var_98+2]

loc_6509F:
		cmp	word ptr [bp+var_98+2], 5
		jl	short loc_65088

loc_650A6:
		lea	ax, [bp+var_26]
		mov	bx, word ptr [bp+var_98+2]
		add	bx, ax
		mov	al, [bx]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0E9Ah]
		mov	ax, [di+2Ah]
		add	ax, 15h
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	al, [di+6Bh]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0EA6h]
		mov	ax, [di+2Ah]
		add	ax, 29h
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		jmp	short loc_6513D

loc_650E8:
		mov	al, byte ptr [bp+var_88+1]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0E9Ah]
		mov	ax, [di+2Ah]
		inc	ax
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	al, [di+6Bh]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0EA6h]
		mov	ax, [di+2Ah]
		add	ax, 15h
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	al, [di+6Ch]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0EA6h]
		mov	ax, [di+2Ah]
		add	ax, 29h
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		jmp	short loc_6513D

loc_6513D:
		push	seg stub192
		push	offset sub_479E0
		push	19h
		push	0
		push	0Ah
		push	[bp+var_4E]
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg stub192
		push	offset sub_479E0
		push	19h
		push	0
		push	0Ah
		push	[bp+var_50]
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	[bp+var_52]
		call	sub_39C
		add	sp, 2
		push	seg stub192
		push	offset sub_479E0
		push	19h
		push	0
		push	0Ah
		push	[bp+var_58]
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg stub192
		push	offset sub_479E0
		push	19h
		push	0
		push	0Ah
		push	[bp+var_5A]
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	[bp+var_5C]
		call	sub_39C
		add	sp, 2
		lea	ax, [bp+var_35E]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_350]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, word ptr [bp+var_6A]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, word ptr [bp+var_64]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_332]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_31A]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		lea	ax, [bp+var_4A]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		jmp	loc_65C8E

loc_6520C:
		mov	byte ptr [bp+var_C], 0
		mov	byte ptr [bp+var_16], 0
		mov	ax, word_498B5
		mov	word ptr [bp+var_40], ax
		mov	ax, word_498B7
		mov	word ptr [bp+var_40+2], ax
		mov	al, byte_498B9
		mov	byte ptr [bp+var_3D+1], al
		mov	ax, word_498BA
		mov	[bp+var_46], ax
		mov	ax, word_498BC
		mov	word ptr [bp+var_44], ax
		mov	ax, word_498BE
		mov	word ptr [bp+var_44+2], ax
		xor	si, si
		jmp	short loc_6524C

loc_6523C:
		mov	al, byte ptr [bp+si+var_1E]
		mov	ah, 0
		lea	dx, [bp+var_46]
		add	ax, dx
		mov	bx, ax
		mov	byte ptr [bx], 1
		inc	si

loc_6524C:
		mov	al, [bp+var_1F]
		mov	ah, 0
		cmp	ax, si
		jg	short loc_6523C
		mov	ax, di
		add	ax, 1Ah
		mov	[bp+var_4C], ax
		push	[bp+var_4C]
		lea	ax, [bp+var_4A]
		push	ax
		call	sub_3499B
		add	sp, 4
		mov	ax, di
		add	ax, 0Ch
		push	ax
		push	0
		push	0Ah
		lea	ax, [bp+var_31A]
		push	ax
		call	LayerGroup_Construct_33CB2
		add	sp, 8
		mov	ax, di
		add	ax, 2Ch
		push	ax
		mov	ax, di
		add	ax, 1Ah
		push	ax
		lea	ax, [bp+var_334]
		push	ax
		call	Widget_ApplyStyleAndAllocate_36FD2
		add	sp, 6
		cmp	[bp+var_18], 0
		jnz	short loc_652C0
		lea	ax, [bp+var_52]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		lea	ax, [bp+var_4E]
		push	ax
		push	120Ch
		push	di
		push	cs
		call	near ptr sub_61893
		add	sp, 0Ah
		mov	ah, 0
		mov	[bp+var_54], ax
		jmp	short loc_652DC

loc_652C0:
		lea	ax, [bp+var_52]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		lea	ax, [bp+var_4E]
		push	ax
		push	1213h
		push	di
		push	cs
		call	near ptr sub_61893
		add	sp, 0Ah
		mov	ah, 0
		mov	[bp+var_54], ax

loc_652DC:
		push	0
		mov	bx, [bp+var_52]
		push	word ptr [bx]
		push	0
		push	[bp+var_4E]
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	[bp+var_56], ax
		push	[bp+var_56]
		lea	ax, [bp+var_31A]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		mov	si, 1
		jmp	short loc_65344

loc_6530A:
		push	0
		mov	ax, si
		shl	ax, 1
		mov	bx, [bp+var_52]
		add	bx, ax
		push	word ptr [bx]
		push	0
		mov	ax, si
		mov	dx, 0Ah
		imul	dx
		mov	dx, [bp+var_4E]
		add	dx, ax
		push	dx
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [bp+var_98+2], ax
		push	word ptr [bp+var_98+2]
		push	[bp+var_56]
		call	LayerGroup_Add_33BD0
		add	sp, 4
		inc	si

loc_65344:
		cmp	si, [bp+var_54]
		jl	short loc_6530A
		mov	[bp+var_5E], 6
		lea	ax, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_5A]
		push	ax
		lea	ax, [bp+var_58]
		push	ax
		push	121Ah
		push	di
		push	cs
		call	near ptr sub_61893
		add	sp, 0Ah
		push	0
		mov	bx, [bp+var_5C]
		push	word ptr [bx]
		push	0
		push	[bp+var_58]
		push	0
		call	OverlayImageLayer_Construct_F227
		add	sp, 0Ah
		mov	word ptr [bp+var_341+1], ax
		push	word ptr [bp+var_341+1]
		push	[bp+var_56]
		call	LayerGroup_Add_33BD0
		add	sp, 4
		mov	si, 1
		jmp	short loc_653E3

loc_65393:
		cmp	byte ptr [bp+si+var_46], 0
		jz	short loc_653E2
		push	0
		mov	ax, si
		shl	ax, 1
		mov	bx, [bp+var_5C]
		add	bx, ax
		push	word ptr [bx]
		push	0
		mov	ax, si
		mov	dx, 0Ah
		imul	dx
		mov	dx, [bp+var_58]
		add	dx, ax
		push	dx
		push	0
		call	OverlayImageLayer_Construct_F227
		add	sp, 0Ah
		mov	bx, si
		shl	bx, 1
		lea	dx, word ptr [bp+var_341+1]
		add	bx, dx
		mov	[bx], ax
		mov	bx, si
		shl	bx, 1
		lea	ax, word ptr [bp+var_341+1]
		add	bx, ax
		push	word ptr [bx]
		push	[bp+var_56]
		call	LayerGroup_Add_33BD0
		add	sp, 4

loc_653E2:
		inc	si

loc_653E3:
		cmp	si, 6
		jl	short loc_65393
		push	100h
		push	0
		lea	ax, word ptr [bp+var_64]
		push	ax
		call	Palette_Alloc_34A1A
		add	sp, 6
		xor	si, si
		jmp	short loc_6544C

loc_653FD:
		mov	ax, si
		mov	dx, 0Ah
		imul	dx
		mov	dx, [bp+var_50]
		add	dx, ax
		mov	word ptr [bp+var_9C], dx
		mov	word ptr [bp+var_98+1], 0
		push	word ptr [bp+var_9C]
		lea	ax, word ptr [bp+var_9A]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		push	word ptr [bp+var_9A]
		mov	al, byte ptr [bp+var_98]
		push	ax
		lea	ax, word ptr [bp+var_9A]
		push	ax
		lea	ax, word ptr [bp+var_64]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		lea	ax, word ptr [bp+var_9A]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		inc	si

loc_6544C:
		cmp	si, [bp+var_54]
		jl	short loc_653FD
		mov	ax, [bp+var_5A]
		mov	word ptr [bp+var_6C], ax
		mov	word ptr [bp+var_68+1], 0
		push	word ptr [bp+var_6C]
		lea	ax, word ptr [bp+var_6A]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		push	word ptr [bp+var_6A]
		mov	al, byte ptr [bp+var_68]
		push	ax
		lea	ax, word ptr [bp+var_6A]
		push	ax
		lea	ax, word ptr [bp+var_64]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	word ptr [bp+var_64]
		mov	al, byte ptr [bp+var_62]
		push	ax
		lea	ax, word ptr [bp+var_64]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		lea	ax, [bp+var_31A]
		push	ax
		call	sub_33DD2
		add	sp, 2
		mov	ax, di
		add	ax, 1Ah
		mov	word ptr [bp+var_70+2], ax
		mov	[bp+var_34E], 0
		mov	[bp+var_34C], 0
		push	word ptr [bp+var_70+2]
		lea	ax, [bp+var_34E]
		push	ax
		call	TextFormat_ApplyStyleAttribute_357D1
		add	sp, 4
		mov	ax, word_4D36E
		mov	word ptr [bp+var_70], ax
		mov	[bp+var_35C], 0
		mov	[bp+var_35A], 0
		push	word ptr [bp+var_70]
		lea	ax, [bp+var_35C]
		push	ax
		call	TextFormat_ApplyStyleAttribute_357D1
		add	sp, 4
		mov	word ptr [di+10h], 0
		mov	word ptr [di+12h], 0
		mov	word ptr [di+14h], 13Fh
		mov	word ptr [di+16h], 0C7h
		push	18h
		push	0
		push	[bp+var_56]
		mov	bx, [bp+var_56]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	[bp+var_56]
		mov	bx, [bp+var_56]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		add	sp, 2
		mov	word ptr [bp+var_72], 1
		jmp	short loc_655A4

loc_65533:
		mov	ax, 18h
		sub	ax, word ptr [bp+var_72]
		mov	[bp+var_74], ax
		mov	ax, word ptr [bp+var_72]
		shl	ax, 1
		add	ax, 97h
		mov	[bp+var_76], ax
		mov	[bp+var_34A], 0
		mov	ax, [bp+var_74]
		mov	[bp+var_348], ax
		mov	[bp+var_346], 13Fh
		mov	ax, [bp+var_76]
		mov	word ptr [bp+var_345+1], ax
		mov	ax, 18h
		sub	ax, word ptr [bp+var_72]
		mov	[bp+var_78], ax
		mov	ax, word ptr [bp+var_72]
		shl	ax, 1
		add	ax, 97h
		mov	[bp+var_7A], ax
		mov	[bp+var_358], 0
		mov	ax, [bp+var_78]
		mov	[bp+var_356], ax
		mov	[bp+var_354], 13Fh
		mov	ax, [bp+var_7A]
		mov	[bp+var_352], ax
		lea	ax, [bp+var_34E]
		push	ax
		lea	ax, [bp+var_35C]
		push	ax
		call	UI_ApplyEncodingHelper_35A92
		add	sp, 4
		inc	word ptr [bp+var_72]

loc_655A4:
		cmp	word ptr [bp+var_72], 18h
		jle	short loc_65533
		call	Input_Flush_116D1
		mov	word_4F7D6, 1
		call	TextScrollDisplayB_ApplyHelperC_45522
		mov	byte ptr [bp+var_82], 0
		mov	[bp+var_84], 0
		mov	[bp+var_86], 0
		push	0Fh
		mov	ax, di
		add	ax, 2Ch
		push	ax
		mov	bx, [di+2Ch]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	byte ptr [bp+var_88+1], 0
		mov	byte ptr [bp+var_37A], 0
		xor	eax, eax
		mov	[bp+var_8C], eax
		mov	[bp+var_90], eax
		mov	[bp+var_8C], 6
		mov	eax, dword_4DE15
		mov	[bp+var_90], eax

loc_65605:
		lea	ax, [bp+var_82]
		push	ax
		call	TextScroll_FormatAndApply_44826
		add	sp, 2
		cmp	byte ptr [bp+var_82], 0
		jnz	short loc_65642
		lea	ax, [bp+var_82]
		push	ax
		call	sub_AB45
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jnz	short loc_65640
		lea	ax, [bp+var_94]
		push	ax
		lea	ax, [bp+var_82]
		push	ax
		call	sub_A981
		add	sp, 4
		jmp	short loc_65640

loc_65640:
		jmp	short loc_65642

loc_65642:
		cmp	byte ptr [bp+var_82], 0
		jz	short loc_65657
		mov	ax, [bp+var_80]
		mov	[bp+var_84], ax
		mov	ax, [bp+var_7E]
		mov	[bp+var_86], ax

loc_65657:
		mov	ax, word_4F7D6
		mov	word ptr [bp+var_98+2], ax
		cmp	byte ptr [bp+var_88+1], 0
		jz	short loc_65674
		cmp	word ptr [bp+var_98+2], 1
		jnz	short loc_65674
		mov	word ptr [bp+var_98+2], 0
		jmp	short loc_65693

loc_65674:
		mov	al, byte ptr [bp+var_88+1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6568D
		cmp	word ptr [bp+var_98+2], 0
		jnz	short loc_6568D
		mov	word ptr [bp+var_98+2], 1
		jmp	short loc_65693

loc_6568D:
		mov	word ptr [bp+var_98+2], 0FFFFh

loc_65693:
		cmp	word ptr [bp+var_98+2], 0FFFFh
		jz	short loc_656B3
		call	TextScrollDisplayB_ApplyHelperD_4555C
		mov	ax, word ptr [bp+var_98+2]
		mov	word ptr [bp+var_98], ax
		mov	ax, word ptr [bp+var_98]
		mov	word_4F7D6, ax
		call	TextScrollDisplayB_ApplyHelperC_45522

loc_656B3:
		cmp	byte ptr [bp+var_82], 2
		jnz	short loc_656C4
		cmp	byte ptr [bp+var_88+1], 0
		jz	short loc_656C4
		jmp	loc_658DA

loc_656C4:
		mov	eax, [bp+var_90]
		add	eax, [bp+var_8C]
		cmp	eax, dword_4DE15
		ja	short loc_656DA
		mov	ax, 1
		jmp	short loc_656DC

loc_656DA:
		xor	ax, ax

loc_656DC:
		or	al, al
		jnz	short loc_656E3
		jmp	loc_658D7

loc_656E3:
		mov	[bp+var_8C], 6
		mov	eax, dword_4DE15
		mov	[bp+var_90], eax
		push	[bp+var_56]
		mov	bx, [bp+var_56]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		add	sp, 2
		push	0AFh
		lea	ax, [bp+var_37A]
		push	ax
		push	2
		push	1221h
		lea	ax, [bp+var_334]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_375C2
		add	sp, 0Ah
		push	word_4D36C
		call	sub_45695
		add	sp, 2
		push	word_4D36C
		push	word_4D36E
		call	UI_ApplyEncodingHelper_35A92
		add	sp, 4
		push	word_4D36C
		call	sub_456A7
		add	sp, 2
		mov	si, 1
		jmp	short loc_65762

loc_6574A:
		cmp	byte ptr [bp+si+var_46], 0
		jz	short loc_65761
		mov	bx, si
		shl	bx, 1
		lea	ax, word ptr [bp+var_341+1]
		add	bx, ax
		mov	bx, [bx]
		mov	word ptr [bx+1Bh], 0

loc_65761:
		inc	si

loc_65762:
		cmp	si, 7
		jl	short loc_6574A
		cmp	[bp+var_84], 1D2h
		jge	short loc_657AD
		cmp	[bp+var_84], 176h
		jl	short loc_657AD
		cmp	[bp+var_86], 47h
		jle	short loc_657AD
		cmp	[bp+var_86], 0BFh
		jg	short loc_657AD
		cmp	byte ptr [bp+var_46+1], 0
		jz	short loc_657AD
		push	1228h
		lea	ax, [bp+var_37A]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	bx, [bp+var_33E]
		mov	word ptr [bx+1Bh], 1
		mov	byte ptr [bp+var_88+1], 1
		jmp	loc_658D7

loc_657AD:
		cmp	[bp+var_84], 178h
		jge	short loc_657F3
		cmp	[bp+var_84], 122h
		jl	short loc_657F3
		cmp	[bp+var_86], 4Ah
		jle	short loc_657F3
		cmp	[bp+var_86], 0C5h
		jg	short loc_657F3
		cmp	byte ptr [bp+var_44], 0
		jz	short loc_657F3
		push	1235h
		lea	ax, [bp+var_37A]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	bx, word ptr [bp+var_33D+1]
		mov	word ptr [bx+1Bh], 1
		mov	byte ptr [bp+var_88+1], 2
		jmp	loc_658D7

loc_657F3:
		cmp	[bp+var_84], 98h
		jge	short loc_65838
		cmp	[bp+var_84], 3Ah
		jl	short loc_65838
		cmp	[bp+var_86], 43h
		jle	short loc_65838
		cmp	[bp+var_86], 0C3h
		jg	short loc_65838
		cmp	byte ptr [bp+var_44+1], 0
		jz	short loc_65838
		push	1241h
		lea	ax, [bp+var_37A]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	bx, [bp+var_33A]
		mov	word ptr [bx+1Bh], 1
		mov	byte ptr [bp+var_88+1], 3
		jmp	loc_658D7

loc_65838:
		cmp	[bp+var_84], 10Ah
		jge	short loc_6587D
		cmp	[bp+var_84], 0A8h
		jl	short loc_6587D
		cmp	[bp+var_86], 47h
		jle	short loc_6587D
		cmp	[bp+var_86], 0C1h
		jg	short loc_6587D
		cmp	byte ptr [bp+var_44+2], 0
		jz	short loc_6587D
		push	124Dh
		lea	ax, [bp+var_37A]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	bx, [bp+var_338]
		mov	word ptr [bx+1Bh], 1
		mov	byte ptr [bp+var_88+1], 4
		jmp	short loc_658D7

loc_6587D:
		cmp	[bp+var_84], 234h
		jge	short loc_658C2
		cmp	[bp+var_84], 1E4h
		jl	short loc_658C2
		cmp	[bp+var_86], 45h
		jle	short loc_658C2
		cmp	[bp+var_86], 11Ah
		jg	short loc_658C2
		cmp	byte ptr [bp+var_44+3], 0
		jz	short loc_658C2
		push	125Bh
		lea	ax, [bp+var_37A]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	bx, [bp+var_336]
		mov	word ptr [bx+1Bh], 1
		mov	byte ptr [bp+var_88+1], 5
		jmp	short loc_658D7

loc_658C2:
		push	large 1266h
		lea	ax, [bp+var_37A]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	byte ptr [bp+var_88+1], 0

loc_658D7:
		jmp	loc_65605

loc_658DA:
		call	TextScrollDisplayB_ApplyHelperD_4555C
		mov	word ptr [bp+var_72], 0
		jmp	loc_65996

loc_658E7:
		mov	[bp+var_9C], 0
		mov	[bp+var_98], 1
		mov	eax, dword_4DE15
		mov	[bp+var_9C], eax
		jmp	short loc_65904

loc_65904:
		mov	eax, [bp+var_9C]
		add	eax, [bp+var_98]
		cmp	eax, dword_4DE15
		ja	short loc_6591A
		mov	ax, 1
		jmp	short loc_6591C

loc_6591A:
		xor	ax, ax

loc_6591C:
		mov	ah, 0
		or	ax, ax
		jz	short loc_65904
		push	0
		push	word ptr [bp+var_72]
		push	13Fh
		push	word ptr [bp+var_72]
		push	0
		mov	ax, di
		add	ax, 0Ch
		push	ax
		call	sub_37F22
		add	sp, 0Ch
		push	0
		mov	ax, word ptr [bp+var_72]
		shl	ax, 1
		mov	dx, 0C7h
		sub	dx, ax
		push	dx
		push	13Fh
		mov	ax, word ptr [bp+var_72]
		shl	ax, 1
		mov	dx, 0C7h
		sub	dx, ax
		push	dx
		push	0
		mov	ax, di
		add	ax, 0Ch
		push	ax
		call	sub_37F22
		add	sp, 0Ch
		push	0
		mov	ax, word ptr [bp+var_72]
		shl	ax, 1
		mov	dx, 0C6h
		sub	dx, ax
		push	dx
		push	13Fh
		mov	ax, word ptr [bp+var_72]
		shl	ax, 1
		mov	dx, 0C6h
		sub	dx, ax
		push	dx
		push	0
		mov	ax, di
		add	ax, 0Ch
		push	ax
		call	sub_37F22
		add	sp, 0Ch
		inc	word ptr [bp+var_72]

loc_65996:
		cmp	word ptr [bp+var_72], 18h
		jge	short loc_6599F
		jmp	loc_658E7

loc_6599F:
		push	0FFE8h
		push	0
		push	[bp+var_56]
		mov	bx, [bp+var_56]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	word ptr [di+10h], 0
		mov	word ptr [di+12h], 18h
		mov	word ptr [di+14h], 13Fh
		mov	word ptr [di+16h], 97h
		mov	al, [bp+var_27]
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 3
		jbe	short loc_659D4
		jmp	loc_65B9B

loc_659D4:
		shl	bx, 1
		jmp	cs:off_65D19[bx]	; switch jump

loc_659DB:
		mov	al, byte ptr [bp+var_88+1]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0E9Ah]
		mov	ax, [di+2Ah]
		inc	ax
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	bx, [di+2Ah]
		mov	byte ptr [bx+15h], 0
		mov	bx, [di+2Ah]
		mov	byte ptr [bx+29h], 0
		jmp	loc_65B9B

loc_65A07:
		mov	al, byte ptr [bp+var_88+1]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0E9Ah]
		mov	ax, [di+2Ah]
		inc	ax
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	word ptr [bp+var_98+2], 0
		jmp	short loc_65A41

loc_65A2A:
		lea	ax, [bp+var_26]
		mov	bx, word ptr [bp+var_98+2]
		add	bx, ax
		mov	al, [bx]
		cmp	al, byte ptr [bp+var_88+1]
		jz	short loc_65A3D
		jmp	short loc_65A48

loc_65A3D:
		inc	word ptr [bp+var_98+2]

loc_65A41:
		cmp	word ptr [bp+var_98+2], 5
		jl	short loc_65A2A

loc_65A48:
		lea	ax, [bp+var_26]
		mov	bx, word ptr [bp+var_98+2]
		add	bx, ax
		mov	al, [bx]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0E9Ah]
		mov	ax, [di+2Ah]
		add	ax, 15h
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	word ptr [bp+var_98], 0
		jmp	short loc_65A95

loc_65A74:
		lea	ax, [bp+var_26]
		mov	bx, word ptr [bp+var_98]
		add	bx, ax
		mov	al, [bx]
		cmp	al, byte ptr [bp+var_88+1]
		jz	short loc_65A91
		mov	ax, word ptr [bp+var_98]
		cmp	ax, word ptr [bp+var_98+2]
		jz	short loc_65A91
		jmp	short loc_65A9C

loc_65A91:
		inc	word ptr [bp+var_98]

loc_65A95:
		cmp	word ptr [bp+var_98], 5
		jl	short loc_65A74

loc_65A9C:
		lea	ax, [bp+var_26]
		mov	bx, word ptr [bp+var_98]
		add	bx, ax
		mov	al, [bx]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0E9Ah]
		mov	ax, [di+2Ah]
		add	ax, 29h
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		jmp	loc_65B9B

loc_65AC3:
		mov	al, byte ptr [bp+var_88+1]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0E9Ah]
		mov	ax, [di+2Ah]
		inc	ax
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	word ptr [bp+var_98+2], 0
		jmp	short loc_65AFD

loc_65AE6:
		lea	ax, [bp+var_26]
		mov	bx, word ptr [bp+var_98+2]
		add	bx, ax
		mov	al, [bx]
		cmp	al, byte ptr [bp+var_88+1]
		jz	short loc_65AF9
		jmp	short loc_65B04

loc_65AF9:
		inc	word ptr [bp+var_98+2]

loc_65AFD:
		cmp	word ptr [bp+var_98+2], 5
		jl	short loc_65AE6

loc_65B04:
		lea	ax, [bp+var_26]
		mov	bx, word ptr [bp+var_98+2]
		add	bx, ax
		mov	al, [bx]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0E9Ah]
		mov	ax, [di+2Ah]
		add	ax, 15h
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	al, [di+6Bh]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0EA6h]
		mov	ax, [di+2Ah]
		add	ax, 29h
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		jmp	short loc_65B9B

loc_65B46:
		mov	al, byte ptr [bp+var_88+1]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0E9Ah]
		mov	ax, [di+2Ah]
		inc	ax
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	al, [di+6Bh]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0EA6h]
		mov	ax, [di+2Ah]
		add	ax, 15h
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	al, [di+6Ch]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+0EA6h]
		mov	ax, [di+2Ah]
		add	ax, 29h
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		jmp	short loc_65B9B

loc_65B9B:
		push	seg stub192
		push	offset sub_479E0
		push	19h
		push	0
		push	0Ah
		push	[bp+var_4E]
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg stub192
		push	offset sub_479E0
		push	19h
		push	0
		push	0Ah
		push	[bp+var_50]
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	[bp+var_52]
		call	sub_39C
		add	sp, 2
		push	seg stub192
		push	offset sub_479E0
		push	19h
		push	0
		push	0Ah
		push	[bp+var_58]
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg stub192
		push	offset sub_479E0
		push	19h
		push	0
		push	0Ah
		push	[bp+var_5A]
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	[bp+var_5C]
		call	sub_39C
		add	sp, 2
		lea	ax, [bp+var_35C]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_34E]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, word ptr [bp+var_6A]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, word ptr [bp+var_64]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_332]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_31A]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		lea	ax, [bp+var_4A]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		jmp	short loc_65C8E

loc_65C69:
		mov	word ptr [bp+var_40], 12C3h
		mov	byte ptr [bp+var_40+2], 0Ch
		mov	word ptr [bp+var_40], 1267h
		push	di
		lea	ax, word ptr [bp+var_40]
		push	ax
		call	sub_98A8
		add	sp, 4
		mov	si, [bp+var_3D]
		add	[di+4], si
		jmp	short loc_65C8E

loc_65C8C:
		jmp	short loc_65C8E

loc_65C8E:
		cmp	[bp+var_17], 0
		jz	short loc_65C96
		jmp	short loc_65CB0

loc_65C96:
		mov	ax, [di]
		add	ax, [di+8]
		cmp	ax, [di+4]
		ja	short loc_65CA5
		mov	ax, 1
		jmp	short loc_65CA7

loc_65CA5:
		xor	ax, ax

loc_65CA7:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_65CB0
		jmp	loc_61EC7

loc_65CB0:
		cmp	[bp+var_1B3], 0
		jz	short loc_65CD8
		cmp	[bp+var_1B8], 0
		jz	short loc_65CD8
		push	0
		mov	al, [bp+var_1B4]
		push	ax
		lea	ax, word ptr [bp+var_1B8]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_65CD8

loc_65CD8:
		mov	[bp+var_1B8], 0
		mov	[bp+var_1B3], 0
		mov	[bp+var_1B2], 0
		mov	[bp+var_260], 498h
		lea	ax, [bp+var_260]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_260]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_61E1C		endp

; START OF FUNCTION CHUNK FOR sub_61E1C
		pop	di
		pop	si
		leave
		retf
off_65D19	dw offset loc_659DB
		dw offset loc_65A07
		dw offset loc_65AC3
		dw offset loc_65B46
off_65D21	dw offset loc_64F7D
		dw offset loc_64FA9
		dw offset loc_65065
		dw offset loc_650E8
off_65D29	dw offset loc_644EA
		dw offset loc_64516
		dw offset loc_645D2
		dw offset loc_64655
off_65D31	dw offset loc_63AD6
		dw offset loc_63B01
		dw offset loc_63B97
		dw offset loc_63BFF
off_65D39	dw offset loc_6221C
		dw offset loc_65C8C
		dw offset loc_65C8C
		dw offset loc_62B52
		dw offset loc_65C8C
		dw offset loc_65C8C
		dw offset loc_65C8C
		dw offset loc_65C8C
		dw offset loc_65C8C
		dw offset loc_65C8C
		dw offset loc_61EEF
		dw offset loc_65C8C
		dw offset loc_65C69
		dw offset loc_65C8C
		dw offset loc_6386B
		dw offset loc_63C7A
		dw offset loc_64779
		dw offset loc_6520C
		dw offset loc_61EEC
; END OF FUNCTION CHUNK FOR sub_61E1C

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_65D5F		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		xor	ax, ax
		pop	bp
		retf
sub_65D5F		endp

; START OF FUNCTION CHUNK FOR sub_65D5F
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_65D5F

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_65D6B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	ax, dx
		add	ax, 3
		pop	bp
		retf
sub_65D6B		endp

; START OF FUNCTION CHUNK FOR sub_65D6B
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_65D6B

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_65D7A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	ax, dx
		add	ax, 3
		pop	bp
		retf
sub_65D7A		endp

; START OF FUNCTION CHUNK FOR sub_65D7A
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_65D7A

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_65D89		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	ax, dx
		add	ax, 3
		pop	bp
		retf
sub_65D89		endp

; START OF FUNCTION CHUNK FOR sub_65D89
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_65D89

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_65D98		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_65E0A
		mov	word ptr [si], 12D3h
		push	si
		call	sub_71E4
		add	sp, 2
		cmp	byte ptr [si+23h], 0
		jz	short loc_65DDA
		cmp	dword ptr [si+1Eh], 0
		jz	short loc_65DDA
		push	0
		mov	al, [si+22h]
		push	ax
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_65DDA

loc_65DDA:
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0
		mov	word ptr [si], 1E4h
		push	si
		call	sub_36702
		add	sp, 2
		test	di, 1
		jz	short loc_65E0A
		push	si
		call	sub_39C
		add	sp, 2

loc_65E0A:
		pop	di
		pop	si
		pop	bp
		retf
sub_65D98		endp
ovr195		ends

ovr335		segment	para public 'OVERLAY' use16
		assume cs:ovr335
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B79C0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte_79400, 0
		mov	byte_79405, 0
		xor	eax, eax
		mov	[si+0Ch], eax
		mov	[si+8], eax
		mov	[si+4], eax
		mov	bx, [si]
		mov	ax, word_793EC
		mov	[bx+22h], ax
		inc	word_793EC
		pop	si
		pop	bp
		retf
sub_B79C0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PlayerComponent_ResetFieldsWrapper_A4B33 (sub_A4B33 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle PlayerComponent_ResetFields_A4B10.
; ==============================================================================================
PlayerComponent_ResetFieldsWrapper_B79EF		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr sub_B79C0
		pop	cx
		mov	bx, [si]
		mov	ax, [bp+arg_2]
		mov	[bx+1Eh], ax
		pop	si
		pop	bp
		retf
PlayerComponent_ResetFieldsWrapper_B79EF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PlayerComponent_Helper_A4B4B (sub_A4B4B de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, aucun appel externe visible (rôle exact non
; détaillé).
; ==============================================================================================
PlayerComponent_Helper_B7A07		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		add	di, 4
		mov	eax, [di]
		mov	[si+4], eax
		mov	eax, [di+4]
		mov	[si+8], eax
		mov	eax, [di+8]
		mov	[si+0Ch], eax
		pop	di
		pop	si
		pop	bp
		retf
PlayerComponent_Helper_B7A07		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B7A30		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		push	word ptr [si]
		call	sub_74EB0
		add	sp, 4
		push	di
		push	si
		nop
		push	cs
		call	near ptr sub_B7A54
		add	sp, 4
		pop	di
		pop	si
		pop	bp
		retf
sub_B7A30		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B7A54		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		push	cs
		call	near ptr sub_B79C0
		pop	cx
		pop	bp
		retf
sub_B7A54		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PlayerComponent_HelperB_A4BA6 (sub_A4BA6 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, aucun appel externe visible (rôle exact non
; détaillé).
; ==============================================================================================
PlayerComponent_HelperB_B7A62		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	eax, [di+10h]
		mov	[si+10h], eax
		pop	di
		pop	si
		pop	bp
		retf
PlayerComponent_HelperB_B7A62		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B7A79		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		push	word ptr [si]
		call	sub_74EB0
		add	sp, 4
		push	di
		push	si
		nop
		push	cs
		call	near ptr AircraftDynamics_ReadAtmoChunk_B7AB1
		add	sp, 4
		mov	bx, [si]
		mov	ax, word_793EC
		mov	[bx+22h], ax
		inc	word_793EC
		mov	dword ptr [si+14h], 100h
		pop	di
		pop	si
		pop	bp
		retf
sub_B7A79		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05. Comme AircraftDynamics_ReadAtmoChunk_A4BE1 de STRIKE (u32 -> [si+10h],
; modèle d'atmosphère global dword_7CE14 au premier avion), avec une instruction de plus avant
; la lecture : mov dword ptr [si+14h], 100h (nouveau champ en mémoire mis à 1,0 ; rôle non
; lu). Format de fichier inchangé.
; ==============================================================================================
AircraftDynamics_ReadAtmoChunk_B7AB1		proc far

var_72		= word ptr -72h
var_15		= dword ptr -15h
var_11		= dword ptr -11h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 72h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		xor	eax, eax
		mov	[si+0Ch], eax
		mov	[si+8], eax
		mov	[si+4], eax
		mov	ax, si
		add	ax, 4
		mov	dword ptr [si+14h], 100h
		push	0
		push	large 4F4D5441h
		push	di
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_B7B01
		push	di
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+10h], eax
		jmp	short loc_B7B0A

loc_B7B01:
		push	0A002h
		call	sub_1DDFE
		pop	cx

loc_B7B0A:
		cmp	dword_7CE14, 0
		jz	short loc_B7B15
		jmp	loc_B7BCF

loc_B7B15:
		lea	ax, [bp+var_72]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_72], 508h
		mov	[bp+var_11], 100h
		mov	[bp+var_15], 0
		mov	[bp+var_72], 0E61h
		push	1
		push	2D1Ah
		lea	ax, [bp+var_72]
		push	ax
		mov	bx, [bp+var_72]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_72]
		push	ax
		call	StreamReader_GetCapacity_6C5B4
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_4], eax
		mov	[bp+var_8], eax
		push	1
		push	0
		push	2
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		mov	eax, [bp+var_C]
		mov	dword_7CE14, eax
		mov	byte_7CE18, 2
		mov	byte_7CE19, 1
		mov	dword_7CE1A, 0
		mov	eax, [bp+var_8]
		mov	dword_7CE1A, eax
		push	0
		mov	al, byte_7CE18
		push	ax
		push	large dword_7CE14
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_72]
		push	ax
		call	sub_6B53F
		add	sp, 6
		push	0
		lea	ax, [bp+var_72]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4

loc_B7BCF:
		pop	di
		pop	si
		leave
		retf
AircraftDynamics_ReadAtmoChunk_B7AB1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B7BD3		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+arg_0]
		push	42h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_B7C62
		add	ax, 1Eh
		mov	[si], ax
		mov	ax, si
		add	ax, 1Eh
		mov	[si+4], ax
		mov	word ptr [si+1Ch], 0
		mov	word ptr [si+1Eh], 1BAEh
		mov	ax, si
		add	ax, 1Eh
		push	ax
		call	sub_74EBA
		pop	cx
		mov	bx, [si]
		sub	word ptr [bx-2], 18h
		mov	word ptr [si+2], 19B6h
		mov	word ptr [bx], 19D2h
		add	word ptr [bx-2], 18h
		mov	word ptr [si+6], 1B42h
		mov	bx, [si+4]
		mov	word ptr [bx], 1B5Eh
		xor	eax, eax
		mov	[si+10h], eax
		mov	[si+0Ch], eax
		mov	[si+8], eax
		mov	ax, si
		add	ax, 8
		mov	dword ptr [si+18h], 100h
		mov	word ptr [si+2], 1852h
		mov	word ptr [si+6], 186Eh
		mov	bx, [si]
		mov	word ptr [bx], 188Ah
		mov	dword ptr [si+18h], 100h
		mov	ax, si
		jmp	short loc_B7C64

loc_B7C62:
		mov	ax, si

loc_B7C64:
		mov	si, ax
		or	si, si
		jz	short loc_B7C6E
		mov	ax, [si]
		jmp	short loc_B7C70

loc_B7C6E:
		mov	ax, si

loc_B7C70:
		pop	si
		pop	bp
		retf
sub_B7BD3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B7C73		proc far

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
		push	42h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_B7C94
		jmp	loc_B7D27

loc_B7C94:
		add	ax, 1Eh
		mov	[si], ax
		mov	ax, si
		add	ax, 1Eh
		mov	[si+4], ax
		mov	word ptr [si+1Ch], 0
		mov	word ptr [si+1Eh], 1BAEh
		push	[bp+var_2]
		mov	ax, si
		add	ax, 1Eh
		push	ax
		call	sub_74EBF
		add	sp, 4
		mov	bx, [si]
		sub	word ptr [bx-2], 18h
		mov	word ptr [si+2], 19B6h
		mov	word ptr [bx], 19D2h
		add	word ptr [bx-2], 18h
		mov	word ptr [si+6], 1B42h
		mov	bx, [si+4]
		mov	word ptr [bx], 1B5Eh
		xor	eax, eax
		mov	[si+10h], eax
		mov	[si+0Ch], eax
		mov	[si+8], eax
		mov	ax, si
		add	ax, 8
		mov	dword ptr [si+18h], 100h
		mov	word ptr [si+2], 1852h
		mov	word ptr [si+6], 186Eh
		mov	bx, [si]
		mov	word ptr [bx], 188Ah
		xor	eax, eax
		mov	[si+10h], eax
		mov	[si+0Ch], eax
		mov	[si+8], eax
		mov	ax, si
		add	ax, 8
		mov	dword ptr [si+18h], 100h
		mov	ax, si
		jmp	short loc_B7D29

loc_B7D27:
		mov	ax, si

loc_B7D29:
		mov	si, ax
		or	si, si
		jz	short loc_B7D33
		mov	ax, [si]
		jmp	short loc_B7D35

loc_B7D33:
		mov	ax, si

loc_B7D35:
		pop	si
		leave
		retf
sub_B7C73		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B7D38		proc far

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
		push	42h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_B7D5A
		jmp	loc_B7DED

loc_B7D5A:
		add	ax, 1Eh
		mov	[di], ax
		mov	ax, di
		add	ax, 1Eh
		mov	[di+4], ax
		mov	word ptr [di+1Ch], 0
		mov	word ptr [di+1Eh], 1BAEh
		push	[bp+var_2]
		mov	ax, di
		add	ax, 1Eh
		push	ax
		call	sub_74EBF
		add	sp, 4
		mov	bx, [di]
		sub	word ptr [bx-2], 18h
		mov	word ptr [di+2], 19B6h
		mov	word ptr [bx], 19D2h
		add	word ptr [bx-2], 18h
		mov	word ptr [di+6], 1B42h
		mov	bx, [di+4]
		mov	word ptr [bx], 1B5Eh
		xor	eax, eax
		mov	[di+10h], eax
		mov	[di+0Ch], eax
		mov	[di+8], eax
		mov	ax, di
		add	ax, 8
		mov	dword ptr [di+18h], 100h
		mov	word ptr [di+2], 1852h
		mov	word ptr [di+6], 186Eh
		mov	bx, [di]
		mov	word ptr [bx], 188Ah
		xor	eax, eax
		mov	[di+10h], eax
		mov	[di+0Ch], eax
		mov	[di+8], eax
		mov	ax, di
		add	ax, 8
		mov	dword ptr [di+18h], 100h
		mov	ax, di
		jmp	short loc_B7DEF

loc_B7DED:
		mov	ax, di

loc_B7DEF:
		mov	di, ax
		push	si
		push	ax
		nop
		push	cs
		call	near ptr PlayerComponent_LoadFieldsWithRetryG_B7E09
		add	sp, 4
		or	di, di
		jz	short loc_B7E03
		mov	ax, [di]
		jmp	short loc_B7E05

loc_B7E03:
		mov	ax, di

loc_B7E05:
		pop	di
		pop	si
		leave
		retf
sub_B7D38		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PlayerComponent_LoadFieldsWithRetryG_A4F01 (sub_A4F01 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine sub_6CAC5 (sous-objet
; composite) et PlayerComponent_HelperB_A4BA6.
; ==============================================================================================
PlayerComponent_LoadFieldsWithRetryG_B7E09		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	di, di
		jz	short loc_B7E1C
		mov	ax, [di]
		jmp	short loc_B7E1E

loc_B7E1C:
		mov	ax, di

loc_B7E1E:
		push	ax
		push	word ptr [si]
		call	sub_74EB5
		add	sp, 4
		or	di, di
		jz	short loc_B7E34
		mov	ax, di
		add	ax, 4
		jmp	short loc_B7E36

loc_B7E34:
		mov	ax, di

loc_B7E36:
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		push	cs
		call	near ptr PlayerComponent_HelperB_B7A62
		add	sp, 4
		pop	di
		pop	si
		pop	bp
		retf
PlayerComponent_LoadFieldsWithRetryG_B7E09		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B7E48		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		push	word ptr [si]
		call	sub_74EB0
		add	sp, 4
		push	di
		mov	ax, si
		add	ax, 4
		push	ax
		push	cs
		call	near ptr AircraftDynamics_ReadAtmoChunk_B7AB1
		add	sp, 4
		mov	bx, [si]
		mov	ax, word_793EC
		mov	[bx+22h], ax
		inc	word_793EC
		pop	di
		pop	si
		pop	bp
		retf
sub_B7E48		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B7E7C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+arg_0]
		push	62h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_B7E94
		jmp	loc_B7F1A

loc_B7E94:
		add	ax, 4Ah
		mov	[si], ax
		mov	ax, si
		add	ax, 24h
		mov	[si+4Ah], ax
		mov	ax, si
		add	ax, 24h
		mov	[si+2], ax
		mov	word ptr [si+22h], 0
		mov	word ptr [si+48h], 0
		mov	word ptr [si+24h], 1BAEh
		mov	ax, si
		add	ax, 24h
		push	ax
		call	sub_74EBA
		pop	cx
		mov	bx, [si+2]
		sub	word ptr [bx-2], 0FFC0h
		mov	word ptr [si+4Ch], 1B42h
		mov	bx, [si+4Ah]
		mov	word ptr [bx], 1B5Eh
		xor	eax, eax
		mov	[si+56h], eax
		mov	[si+52h], eax
		mov	[si+4Eh], eax
		mov	ax, si
		add	ax, 4Eh
		mov	dword ptr [si+5Eh], 100h
		mov	bx, [si+2]
		add	word ptr [bx-2], 0FFC0h
		mov	word ptr [si+4], 192Ah
		mov	word ptr [bx], 194Ah
		mov	bx, [si]
		mov	word ptr [bx+2], 199Ah
		mov	dword ptr [bx+14h], 100h
		mov	byte ptr [si+15h], 0FFh
		mov	ax, si
		jmp	short loc_B7F1C

loc_B7F1A:
		mov	ax, si

loc_B7F1C:
		mov	si, ax
		or	si, si
		jz	short loc_B7F27
		mov	ax, [si+2]
		jmp	short loc_B7F29

loc_B7F27:
		mov	ax, si

loc_B7F29:
		pop	si
		pop	bp
		retf
sub_B7E7C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B7F2C		proc far

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
		push	62h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_B7F4D
		jmp	loc_B7FF4

loc_B7F4D:
		add	ax, 4Ah
		mov	[si], ax
		mov	ax, si
		add	ax, 24h
		mov	[si+4Ah], ax
		mov	ax, si
		add	ax, 24h
		mov	[si+2], ax
		mov	word ptr [si+22h], 0
		mov	word ptr [si+48h], 0
		mov	word ptr [si+24h], 1BAEh
		push	[bp+var_2]
		mov	ax, si
		add	ax, 24h
		push	ax
		call	sub_74EBF
		add	sp, 4
		mov	bx, [si+2]
		sub	word ptr [bx-2], 0FFC0h
		mov	word ptr [si+4Ch], 1B42h
		mov	bx, [si+4Ah]
		mov	word ptr [bx], 1B5Eh
		xor	eax, eax
		mov	[si+56h], eax
		mov	[si+52h], eax
		mov	[si+4Eh], eax
		mov	ax, si
		add	ax, 4Eh
		mov	dword ptr [si+5Eh], 100h
		mov	bx, [si+2]
		add	word ptr [bx-2], 0FFC0h
		mov	word ptr [si+4], 192Ah
		mov	word ptr [bx], 194Ah
		mov	bx, [si]
		mov	word ptr [bx+2], 199Ah
		xor	eax, eax
		mov	[bx+0Ch], eax
		mov	[bx+8], eax
		mov	[bx+4], eax
		mov	ax, [si]
		add	ax, 4
		mov	dword ptr [bx+14h], 100h
		mov	dword ptr [bx+14h], 100h
		mov	byte ptr [si+15h], 0FFh
		mov	ax, si
		jmp	short loc_B7FF6

loc_B7FF4:
		mov	ax, si

loc_B7FF6:
		mov	si, ax
		or	si, si
		jz	short loc_B8001
		mov	ax, [si+2]
		jmp	short loc_B8003

loc_B8001:
		mov	ax, si

loc_B8003:
		pop	si
		leave
		retf
sub_B7F2C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B8006		proc far

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
		push	62h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_B8028
		jmp	loc_B80CF

loc_B8028:
		add	ax, 4Ah
		mov	[di], ax
		mov	ax, di
		add	ax, 24h
		mov	[di+4Ah], ax
		mov	ax, di
		add	ax, 24h
		mov	[di+2], ax
		mov	word ptr [di+22h], 0
		mov	word ptr [di+48h], 0
		mov	word ptr [di+24h], 1BAEh
		push	[bp+var_2]
		mov	ax, di
		add	ax, 24h
		push	ax
		call	sub_74EBF
		add	sp, 4
		mov	bx, [di+2]
		sub	word ptr [bx-2], 0FFC0h
		mov	word ptr [di+4Ch], 1B42h
		mov	bx, [di+4Ah]
		mov	word ptr [bx], 1B5Eh
		xor	eax, eax
		mov	[di+56h], eax
		mov	[di+52h], eax
		mov	[di+4Eh], eax
		mov	ax, di
		add	ax, 4Eh
		mov	dword ptr [di+5Eh], 100h
		mov	bx, [di+2]
		add	word ptr [bx-2], 0FFC0h
		mov	word ptr [di+4], 192Ah
		mov	word ptr [bx], 194Ah
		mov	bx, [di]
		mov	word ptr [bx+2], 199Ah
		xor	eax, eax
		mov	[bx+0Ch], eax
		mov	[bx+8], eax
		mov	[bx+4], eax
		mov	ax, [di]
		add	ax, 4
		mov	dword ptr [bx+14h], 100h
		mov	dword ptr [bx+14h], 100h
		mov	byte ptr [di+15h], 0FFh
		mov	ax, di
		jmp	short loc_B80D1

loc_B80CF:
		mov	ax, di

loc_B80D1:
		mov	di, ax
		push	si
		push	ax
		nop
		push	cs
		call	near ptr PlayerComponent_LoadFieldsWithRetryH_B812D
		add	sp, 4
		or	di, di
		jz	short loc_B80E6
		mov	ax, [di+2]
		jmp	short loc_B80E8

loc_B80E6:
		mov	ax, di

loc_B80E8:
		pop	di
		pop	si
		leave
		retf
sub_B8006		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B80EC		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	eax, [di+0Ah]
		mov	[si+0Ah], eax
		mov	eax, [di+0Eh]
		mov	[si+0Eh], eax
		mov	al, [di+12h]
		mov	[si+12h], al
		mov	al, [di+13h]
		mov	[si+13h], al
		mov	al, [di+14h]
		mov	[si+14h], al
		mov	eax, [di+1Ah]
		mov	[si+1Ah], eax
		mov	eax, [di+1Eh]
		mov	[si+1Eh], eax
		pop	di
		pop	si
		pop	bp
		retf
sub_B80EC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PlayerComponent_LoadFieldsWithRetryH_A51B2 (sub_A51B2 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine sub_6CAC5,
; PlayerComponent_HelperB_A4BA6, PlayerComponent_HelperC_A5189.
; ==============================================================================================
PlayerComponent_LoadFieldsWithRetryH_B812D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	di, di
		jz	short loc_B8141
		mov	ax, [di+2]
		jmp	short loc_B8143

loc_B8141:
		mov	ax, di

loc_B8143:
		push	ax
		push	word ptr [si+2]
		call	sub_74EB5
		add	sp, 4
		or	di, di
		jz	short loc_B8157
		mov	ax, [di]
		jmp	short loc_B8159

loc_B8157:
		mov	ax, di

loc_B8159:
		push	ax
		push	word ptr [si]
		push	cs
		call	near ptr PlayerComponent_HelperB_B7A62
		add	sp, 4
		push	di
		push	si
		push	cs
		call	near ptr sub_B80EC
		add	sp, 4
		pop	di
		pop	si
		pop	bp
		retf
PlayerComponent_LoadFieldsWithRetryH_B812D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B8170		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		push	word ptr [si+2]
		call	sub_74EB0
		add	sp, 4
		push	di
		push	word ptr [si]
		push	cs
		call	near ptr AircraftDynamics_ReadAtmoChunk_B7AB1
		add	sp, 4
		push	di
		push	si
		nop
		push	cs
		call	near ptr AircraftDynamics_ReadThrustChunk_B81AC
		add	sp, 4
		mov	bx, [si+2]
		mov	ax, word_793EC
		mov	[bx+22h], ax
		inc	word_793EC
		pop	di
		pop	si
		pop	bp
		retf
sub_B8170		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05. Lecteur du chunk THRS, FORMAT CHANGÉ (19 octets au lieu de 7) : u32 ->
; [si+0Ah] (poussée max, comme STRIKE) ; NOUVEAU u32 -> [si+0Eh] (puissance, chevaux, utilisée
; par Aero_PropellerThrust_4710B) ; 3 u8 -> [si+12h], [si+13h], [si+14h] (STRIKE :
; [si+0Eh..10h]) ; NOUVEAU u32 -> [si+1Ah] ; NOUVEAU u32 -> [si+1Eh]
; (Aero_PropellerThrust_4710B : moitié = vitesse plancher). Erreur 0A003h si absent.
; ==============================================================================================
AircraftDynamics_ReadThrustChunk_B81AC		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	0
		push	large 53524854h
		push	di
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_B8228
		push	di
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+0Ah], eax
		push	di
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+0Eh], eax
		push	di
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	[si+12h], al
		push	di
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	[si+13h], al
		push	di
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	[si+14h], al
		push	di
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+1Ah], eax
		push	di
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+1Eh], eax
		jmp	short loc_B8231

loc_B8228:
		push	0A003h
		call	sub_1DDFE
		pop	cx

loc_B8231:
		pop	di
		pop	si
		pop	bp
		retf
AircraftDynamics_ReadThrustChunk_B81AC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B8235		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		push	word ptr [si]
		call	sub_74EB0
		add	sp, 4
		push	di
		push	si
		push	cs
		call	near ptr sub_B7A54
		add	sp, 4
		push	di
		push	word ptr [si+10h]
		push	cs
		call	near ptr AircraftDynamics_ReadAtmoChunk_B7AB1
		add	sp, 4
		push	di
		push	si
		nop
		push	cs
		call	near ptr AircraftDynamics_ReadStblChunk_B8279
		add	sp, 4
		mov	bx, [si]
		mov	ax, word_793EC
		mov	[bx+22h], ax
		inc	word_793EC
		pop	di
		pop	si
		pop	bp
		retf
sub_B8235		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; AircraftDynamics_ReadStblChunk_A52B8 (sub_A52B8 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, seg449. Lecteur du chunk 'STBL' de la
; hierarchie FORM DYNM (erreur 0xA004 si absent). sub_A52FD (helper) puis
; ResourceRecord_SeekAndRead('STBL', FourCC ASM 0x4C425453) + sub_64A7E (u32) -> [si+0x12].
; [si+0x12] = jdyn[0x12] = COEFF DE STABILITE / AUTORITE DE TANGAGE : echelle q' dans
; Aero_ComputeForcesMain (q' = q * jdyn[0x12] / 100). Detail: DATA_MODEL.md 6.2.
; ==============================================================================================
AircraftDynamics_ReadStblChunk_B8279		proc far

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
		call	near ptr PlayerComponent_HelperD_B82BE
		pop	cx
		push	0
		push	large 4C425453h
		push	di
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_B82B1
		push	di
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+12h], eax
		jmp	short loc_B82BA

loc_B82B1:
		push	0A004h
		call	sub_1DDFE
		pop	cx

loc_B82BA:
		pop	di
		pop	si
		pop	bp
		retf
AircraftDynamics_ReadStblChunk_B8279		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PlayerComponent_HelperD_A52FD (sub_A52FD de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, aucun appel externe visible (rôle exact non
; détaillé).
; ==============================================================================================
PlayerComponent_HelperD_B82BE		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_4], 0
		mov	eax, [bp+var_4]
		mov	[si+16h], eax
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		mov	[si+1Ah], eax
		pop	si
		leave
		retf
PlayerComponent_HelperD_B82BE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B82EB		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+arg_0]
		push	5Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_B8303
		jmp	loc_B83A6

loc_B8303:
		add	ax, 20h
		mov	[si], ax
		mov	ax, si
		add	ax, 46h
		mov	[si+10h], ax
		mov	ax, si
		add	ax, 20h
		mov	[si+46h], ax
		mov	word ptr [si+1Eh], 0
		mov	word ptr [si+44h], 0
		mov	word ptr [si+20h], 1BAEh
		mov	ax, si
		add	ax, 20h
		push	ax
		call	sub_74EBA
		pop	cx
		mov	bx, [si]
		sub	word ptr [bx-2], 0FFC0h
		mov	word ptr [si+48h], 1B42h
		mov	bx, [si+46h]
		mov	word ptr [bx], 1B5Eh
		xor	eax, eax
		mov	[si+52h], eax
		mov	[si+4Eh], eax
		mov	[si+4Ah], eax
		mov	ax, si
		add	ax, 4Ah
		mov	dword ptr [si+5Ah], 100h
		mov	bx, [si]
		add	word ptr [bx-2], 0FFC0h
		sub	word ptr [bx-2], 0Eh
		mov	word ptr [si+2], 1A22h
		mov	word ptr [bx], 1A52h
		push	si
		push	cs
		call	near ptr sub_B79C0
		pop	cx
		mov	bx, [si]
		add	word ptr [bx-2], 0Eh
		mov	word ptr [si+2], 1AA2h
		mov	word ptr [bx], 1AD6h
		mov	bx, [si+10h]
		mov	word ptr [bx+2], 1B26h
		push	si
		push	cs
		call	near ptr PlayerComponent_HelperD_B82BE
		pop	cx
		mov	bx, [si+10h]
		mov	dword ptr [bx+14h], 100h
		mov	ax, si
		jmp	short loc_B83A8

loc_B83A6:
		mov	ax, si

loc_B83A8:
		mov	si, ax
		or	si, si
		jz	short loc_B83B2
		mov	ax, [si]
		jmp	short loc_B83B4

loc_B83B2:
		mov	ax, si

loc_B83B4:
		pop	si
		pop	bp
		retf
sub_B82EB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B83B7		proc far

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
		push	5Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_B83D8
		jmp	loc_B84A6

loc_B83D8:
		add	ax, 20h
		mov	[si], ax
		mov	ax, si
		add	ax, 46h
		mov	[si+10h], ax
		mov	ax, si
		add	ax, 20h
		mov	[si+46h], ax
		mov	word ptr [si+1Eh], 0
		mov	word ptr [si+44h], 0
		mov	word ptr [si+20h], 1BAEh
		push	[bp+var_2]
		mov	ax, si
		add	ax, 20h
		push	ax
		call	sub_74EBF
		add	sp, 4
		mov	bx, [si]
		sub	word ptr [bx-2], 0FFC0h
		mov	word ptr [si+48h], 1B42h
		mov	bx, [si+46h]
		mov	word ptr [bx], 1B5Eh
		xor	eax, eax
		mov	[si+52h], eax
		mov	[si+4Eh], eax
		mov	[si+4Ah], eax
		mov	ax, si
		add	ax, 4Ah
		mov	dword ptr [si+5Ah], 100h
		mov	bx, [si]
		add	word ptr [bx-2], 0FFC0h
		sub	word ptr [bx-2], 0Eh
		mov	word ptr [si+2], 1A22h
		mov	word ptr [bx], 1A52h
		push	si
		push	cs
		call	near ptr sub_B79C0
		pop	cx
		mov	bx, [si]
		add	word ptr [bx-2], 0Eh
		mov	word ptr [si+2], 1AA2h
		mov	word ptr [bx], 1AD6h
		mov	bx, [si+10h]
		mov	word ptr [bx+2], 1B26h
		push	si
		push	cs
		call	near ptr sub_B79C0
		pop	cx
		mov	bx, [si+10h]
		xor	eax, eax
		mov	[bx+0Ch], eax
		mov	[bx+8], eax
		mov	[bx+4], eax
		mov	ax, [si+10h]
		add	ax, 4
		mov	dword ptr [bx+14h], 100h
		push	si
		push	cs
		call	near ptr PlayerComponent_HelperD_B82BE
		pop	cx
		mov	bx, [si+10h]
		mov	dword ptr [bx+14h], 100h
		mov	ax, si
		jmp	short loc_B84A8

loc_B84A6:
		mov	ax, si

loc_B84A8:
		mov	si, ax
		or	si, si
		jz	short loc_B84B2
		mov	ax, [si]
		jmp	short loc_B84B4

loc_B84B2:
		mov	ax, si

loc_B84B4:
		pop	si
		leave
		retf
sub_B83B7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B84B7		proc far

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
		push	5Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_B84D9
		jmp	loc_B85A7

loc_B84D9:
		add	ax, 20h
		mov	[di], ax
		mov	ax, di
		add	ax, 46h
		mov	[di+10h], ax
		mov	ax, di
		add	ax, 20h
		mov	[di+46h], ax
		mov	word ptr [di+1Eh], 0
		mov	word ptr [di+44h], 0
		mov	word ptr [di+20h], 1BAEh
		push	[bp+var_2]
		mov	ax, di
		add	ax, 20h
		push	ax
		call	sub_74EBF
		add	sp, 4
		mov	bx, [di]
		sub	word ptr [bx-2], 0FFC0h
		mov	word ptr [di+48h], 1B42h
		mov	bx, [di+46h]
		mov	word ptr [bx], 1B5Eh
		xor	eax, eax
		mov	[di+52h], eax
		mov	[di+4Eh], eax
		mov	[di+4Ah], eax
		mov	ax, di
		add	ax, 4Ah
		mov	dword ptr [di+5Ah], 100h
		mov	bx, [di]
		add	word ptr [bx-2], 0FFC0h
		sub	word ptr [bx-2], 0Eh
		mov	word ptr [di+2], 1A22h
		mov	word ptr [bx], 1A52h
		push	di
		push	cs
		call	near ptr sub_B79C0
		pop	cx
		mov	bx, [di]
		add	word ptr [bx-2], 0Eh
		mov	word ptr [di+2], 1AA2h
		mov	word ptr [bx], 1AD6h
		mov	bx, [di+10h]
		mov	word ptr [bx+2], 1B26h
		push	di
		push	cs
		call	near ptr sub_B79C0
		pop	cx
		mov	bx, [di+10h]
		xor	eax, eax
		mov	[bx+0Ch], eax
		mov	[bx+8], eax
		mov	[bx+4], eax
		mov	ax, [di+10h]
		add	ax, 4
		mov	dword ptr [bx+14h], 100h
		push	di
		push	cs
		call	near ptr PlayerComponent_HelperD_B82BE
		pop	cx
		mov	bx, [di+10h]
		mov	dword ptr [bx+14h], 100h
		mov	ax, di
		jmp	short loc_B85A9

loc_B85A7:
		mov	ax, di

loc_B85A9:
		mov	di, ax
		push	si
		push	ax
		nop
		push	cs
		call	near ptr PlayerComponent_LoadFieldsWithRetryK_B85DA
		add	sp, 4
		or	di, di
		jz	short loc_B85BD
		mov	ax, [di]
		jmp	short loc_B85BF

loc_B85BD:
		mov	ax, di

loc_B85BF:
		pop	di
		pop	si
		leave
		retf
sub_B84B7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PlayerComponent_HelperE_A55B9 (sub_A55B9 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, aucun appel externe visible (rôle exact non
; détaillé).
; ==============================================================================================
PlayerComponent_HelperE_B85C3		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	eax, [di+12h]
		mov	[si+12h], eax
		pop	di
		pop	si
		pop	bp
		retf
PlayerComponent_HelperE_B85C3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PlayerComponent_LoadFieldsWithRetryK_A55D0 (sub_A55D0 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine sub_6CAC5,
; PlayerComponent_Helper_A4B4B, PlayerComponent_HelperB_A4BA6, PlayerComponent_HelperE_A55B9.
; ==============================================================================================
PlayerComponent_LoadFieldsWithRetryK_B85DA		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	di, di
		jz	short loc_B85ED
		mov	ax, [di]
		jmp	short loc_B85EF

loc_B85ED:
		mov	ax, di

loc_B85EF:
		push	ax
		push	word ptr [si]
		call	sub_74EB5
		add	sp, 4
		push	di
		push	si
		push	cs
		call	near ptr PlayerComponent_Helper_B7A07
		add	sp, 4
		or	di, di
		jz	short loc_B860C
		mov	ax, [di+10h]
		jmp	short loc_B860E

loc_B860C:
		mov	ax, di

loc_B860E:
		push	ax
		push	word ptr [si+10h]
		push	cs
		call	near ptr PlayerComponent_HelperB_B7A62
		add	sp, 4
		push	di
		push	si
		push	cs
		call	near ptr PlayerComponent_HelperE_B85C3
		add	sp, 4
		pop	di
		pop	si
		pop	bp
		retf
PlayerComponent_LoadFieldsWithRetryK_B85DA		endp
ovr335		ends

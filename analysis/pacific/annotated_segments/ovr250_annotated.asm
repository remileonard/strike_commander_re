ovr250		segment	para public 'OVERLAY' use16
		assume cs:ovr250
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à HUDSymbol_ConstructVariantQ_82B80 (sub_82B80 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; alloue (0xBA octets), même motif que HUDSymbol_ConstructVariantA_804F0
; (Formation_ComputeGeometryHelper_56D43, sub_2AFB5, ReadFieldGroupA_64A19) — appelle aussi
; HUDSymbol_ConstructVariantC_82C2E.
; ==============================================================================================
HUDSymbol_ConstructVariantQ_913D0		proc far

var_34		= word ptr -34h
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 34h
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_913F0
		push	0BAh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_913F0
		jmp	loc_91479

loc_913F0:
		mov	ax, si
		add	ax, 20h
		push	ax
		call	Formation_ComputeGeometryHelper_58B0C
		pop	cx
		mov	word ptr [si+50h], 6D0h
		mov	ax, si
		add	ax, 53h
		push	ax
		call	String_ConstructEmpty
		pop	cx
		push	si
		call	sub_73DDD
		pop	cx
		mov	word ptr [si+50h], 7EEh
		mov	ax, si
		add	ax, 80h
		push	ax
		call	String_ConstructEmpty
		pop	cx
		mov	word ptr [si+89h], 0
		mov	word ptr [si+50h], 887h
		mov	word ptr [si+8Bh], 0
		mov	ax, si
		add	ax, 8Dh
		mov	ax, si
		add	ax, 99h
		mov	ax, si
		add	ax, 0A5h
		mov	ax, si
		add	ax, 0A9h
		mov	ax, si
		add	ax, 0ADh
		mov	ax, si
		add	ax, 0B1h
		mov	ax, si
		add	ax, 0B5h
		push	large 34h
		push	ss
		lea	ax, [bp+var_34]
		push	ax
		push	[bp+arg_2]
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		lea	ax, [bp+var_34]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr HUDSymbol_ConstructAndInitAngleB_9152C
		add	sp, 4

loc_91479:
		mov	ax, si
		pop	si
		leave
		retf
HUDSymbol_ConstructVariantQ_913D0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à HUDSymbol_ConstructVariantC_82C2E (sub_82C2E de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; même motif que HUDSymbol_ConstructVariantA_804F0 (variante de symbole HUD).
; ==============================================================================================
HUDSymbol_ConstructVariantC_9147E		proc far

var_34		= word ptr -34h
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 34h
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_9149E
		push	0BAh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_9149E
		jmp	loc_91527

loc_9149E:
		mov	ax, si
		add	ax, 20h
		push	ax
		call	Formation_ComputeGeometryHelper_58B0C
		pop	cx
		mov	word ptr [si+50h], 6D0h
		mov	ax, si
		add	ax, 53h
		push	ax
		call	String_ConstructEmpty
		pop	cx
		push	si
		call	sub_73DDD
		pop	cx
		mov	word ptr [si+50h], 7EEh
		mov	ax, si
		add	ax, 80h
		push	ax
		call	String_ConstructEmpty
		pop	cx
		mov	word ptr [si+89h], 0
		mov	word ptr [si+50h], 887h
		mov	word ptr [si+8Bh], 0
		mov	ax, si
		add	ax, 8Dh
		mov	ax, si
		add	ax, 99h
		mov	ax, si
		add	ax, 0A5h
		mov	ax, si
		add	ax, 0A9h
		mov	ax, si
		add	ax, 0ADh
		mov	ax, si
		add	ax, 0B1h
		mov	ax, si
		add	ax, 0B5h
		push	34h
		push	large [bp+arg_2]
		push	ss
		lea	ax, [bp+var_34]
		push	ax
		call	sub_37C3
		add	sp, 0Ah
		lea	ax, [bp+var_34]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr HUDSymbol_ConstructAndInitAngleB_9152C
		add	sp, 4

loc_91527:
		mov	ax, si
		pop	si
		leave
		retf
HUDSymbol_ConstructVariantC_9147E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à HUDSymbol_ConstructAndInitAngleB_82CDC (sub_82CDC de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; même motif que HUDSymbol_ConstructAndInitAngle_80701 (121 lignes).
; ==============================================================================================
HUDSymbol_ConstructAndInitAngleB_9152C		proc far

var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_11		= byte ptr -11h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [di+1Ch]
		mov	[bp+var_2], ax
		mov	ax, [di+1Eh]
		mov	[bp+var_4], ax
		mov	ax, [di+20h]
		mov	[bp+var_6], ax
		mov	ax, [di+22h]
		mov	[bp+var_8], ax
		push	1Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp+var_A], ax
		or	ax, ax
		jz	short loc_9159E
		mov	bx, [bp+var_A]
		mov	word ptr [bx], 698h
		mov	word ptr [bx+2], 0
		mov	word ptr [bx+4], 0
		mov	byte ptr [bx+0Fh], 0
		mov	word ptr [bx+10h], 0
		mov	word ptr [bx+12h], 0
		mov	byte ptr [bx+1Dh], 0
		push	[bp+var_8]
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		push	ax
		call	sub_73DB0
		add	sp, 0Ah
		mov	ax, [bp+var_A]
		jmp	short loc_915A1

loc_9159E:
		mov	ax, [bp+var_A]

loc_915A1:
		mov	[si+5Ch], ax
		sub	sp, 4
		mov	ax, di
		add	ax, 18h
		mov	[bp+var_C], ax
		mov	bx, [bp+var_C]
		mov	eax, [bx]
		mov	[bp+var_1A], eax
		sub	sp, 4
		mov	ax, [di+16h]
		mov	[bp+var_E], ax
		movsx	eax, [bp+var_E]
		shl	eax, 8
		mov	[bp+var_1E], eax
		push	large [di+12h]
		mov	ax, di
		add	ax, 0Ah
		push	ax
		push	word ptr [si+5Ch]
		push	si
		call	sub_73512
		add	sp, 12h
		mov	[bp+var_10], di
		push	8
		push	[bp+var_10]
		mov	ax, si
		add	ax, 53h
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	byte ptr [si+5Bh], 0
		mov	al, [di+8]
		mov	[bp+var_11], al
		and	ax, 1
		and	byte ptr [si+52h], 0FDh
		shl	al, 1
		or	[si+52h], al
		mov	eax, [di+24h]
		mov	[si+0A5h], eax
		add	di, 28h
		mov	eax, [di]
		mov	[si+99h], eax
		mov	eax, [di+4]
		mov	[si+9Dh], eax
		mov	eax, [di+8]
		mov	[si+0A1h], eax
		pop	di
		pop	si
		leave
		retf
HUDSymbol_ConstructAndInitAngleB_9152C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9163B		proc far

var_190		= dword ptr -190h
var_186		= dword ptr -186h
var_182		= dword ptr -182h
var_17E		= dword ptr -17Eh
var_17A		= dword ptr -17Ah
var_176		= dword ptr -176h
var_172		= dword ptr -172h
var_16E		= dword ptr -16Eh
var_16A		= dword ptr -16Ah
var_166		= dword ptr -166h
var_162		= dword ptr -162h
var_15E		= dword ptr -15Eh
var_15A		= dword ptr -15Ah
var_156		= dword ptr -156h
var_152		= dword ptr -152h
var_14E		= dword ptr -14Eh
var_14A		= dword ptr -14Ah
var_146		= dword ptr -146h
var_142		= dword ptr -142h
var_13E		= dword ptr -13Eh
var_13A		= dword ptr -13Ah
var_136		= dword ptr -136h
var_132		= dword ptr -132h
var_12E		= dword ptr -12Eh
var_12A		= dword ptr -12Ah
var_126		= dword ptr -126h
var_122		= dword ptr -122h
var_11E		= dword ptr -11Eh
var_11A		= dword ptr -11Ah
var_116		= dword ptr -116h
var_112		= dword ptr -112h
var_10E		= word ptr -10Eh
var_EA		= dword ptr -0EAh
var_E6		= dword ptr -0E6h
var_E2		= dword ptr -0E2h
var_DE		= dword ptr -0DEh
var_DA		= dword ptr -0DAh
var_D6		= dword ptr -0D6h
var_D2		= dword ptr -0D2h
var_CE		= dword ptr -0CEh
var_CA		= dword ptr -0CAh
var_C6		= dword ptr -0C6h
var_C2		= dword ptr -0C2h
var_BE		= dword ptr -0BEh
var_BA		= dword ptr -0BAh
var_B6		= dword ptr -0B6h
var_B2		= dword ptr -0B2h
var_AE		= dword ptr -0AEh
var_AA		= dword ptr -0AAh
var_A6		= dword ptr -0A6h
var_A2		= dword ptr -0A2h
var_9E		= dword ptr -9Eh
var_9A		= dword ptr -9Ah
var_96		= dword ptr -96h
var_92		= dword ptr -92h
var_8E		= dword ptr -8Eh
var_8A		= dword ptr -8Ah
var_86		= dword ptr -86h
var_82		= dword ptr -82h
var_7E		= dword ptr -7Eh
var_7A		= dword ptr -7Ah
var_76		= dword ptr -76h
var_72		= dword ptr -72h
var_6E		= dword ptr -6Eh
var_6A		= dword ptr -6Ah
var_66		= dword ptr -66h
var_62		= dword ptr -62h
var_5E		= dword ptr -5Eh
var_5A		= dword ptr -5Ah
var_56		= dword ptr -56h
var_52		= dword ptr -52h
var_4E		= dword ptr -4Eh
var_4A		= dword ptr -4Ah
var_46		= dword ptr -46h
var_42		= dword ptr -42h
var_3E		= dword ptr -3Eh
var_3A		= word ptr -3Ah
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= word ptr -24h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 186h
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+89h], 0
		jnz	short loc_91651
		jmp	loc_91CD4

loc_91651:
		mov	eax, dword_7976E
		sub	[si+0A9h], eax
		cmp	dword ptr [si+0A9h], 0
		jle	short loc_91667
		mov	ax, 1
		jmp	short loc_91669

loc_91667:
		xor	ax, ax

loc_91669:
		or	al, al
		jnz	short loc_91670
		jmp	loc_91CD4

loc_91670:
		cmp	word ptr [si+8Bh], 0
		jnz	short loc_9167A
		jmp	loc_91B3C

loc_9167A:
		push	word ptr [si+8Bh]
		mov	bx, [si+8Bh]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		cmp	al, 6
		jz	short loc_9168F
		jmp	loc_91A99

loc_9168F:
		mov	di, si
		add	di, 99h
		mov	eax, [di]
		mov	[bp+var_DE], eax
		mov	eax, [di+4]
		mov	[bp+var_DA], eax
		mov	eax, [di+8]
		mov	[bp+var_D6], eax
		mov	di, si
		add	di, 0ADh
		mov	eax, [bp+var_DE]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_DE], eax
		mov	eax, [bp+var_DA]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_DA], eax
		mov	eax, [bp+var_D6]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_D6], eax
		push	word ptr [si+89h]
		mov	bx, [si+89h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	di, ax
		mov	eax, [di]
		mov	[bp+var_EA], eax
		mov	eax, [di+4]
		mov	[bp+var_E6], eax
		mov	eax, [di+8]
		mov	[bp+var_E2], eax
		lea	ax, [bp+var_10E]
		push	ax
		call	Formation_ComputeGeometryHelper_58B0C
		pop	cx
		lea	ax, word ptr [bp+var_EA]
		push	ax
		lea	ax, [bp+var_10E]
		push	ax
		call	sub_59B77
		add	sp, 4
		lea	ax, [bp+var_10E]
		push	ax
		lea	ax, word ptr [bp+var_DE]
		push	ax
		call	sub_5A629
		add	sp, 4
		lea	ax, word ptr [bp+var_DE]
		push	ax
		push	word ptr [si+8Bh]
		push	si
		call	sub_2CADA
		add	sp, 6
		mov	di, [si+8Bh]
		add	di, 12h
		mov	eax, [di]
		add	[bp+var_DE], eax
		mov	eax, [di+4]
		add	[bp+var_DA], eax
		mov	eax, [di+8]
		add	[bp+var_D6], eax
		mov	di, si
		add	di, 14h
		mov	eax, [bp+var_DE]
		sub	eax, [di]
		mov	[bp+var_126], eax
		mov	eax, [bp+var_DA]
		sub	eax, [di+4]
		mov	[bp+var_122], eax
		mov	eax, [bp+var_D6]
		sub	eax, [di+8]
		mov	[bp+var_11E], eax
		mov	eax, [bp+var_126]
		mov	[bp+var_11A], eax
		mov	eax, [bp+var_122]
		mov	[bp+var_116], eax
		mov	eax, [bp+var_11E]
		mov	[bp+var_112], eax
		push	eax
		push	large [bp+var_116]
		push	large [bp+var_11A]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_30], eax
		mov	[bp+var_34], eax
		mov	eax, [si+0B1h]
		cmp	eax, [bp+var_34]
		jge	short loc_917FF
		mov	ax, 1
		jmp	short loc_91801

loc_917FF:
		xor	ax, ax

loc_91801:
		or	al, al
		jz	short loc_91880
		mov	ax, si
		add	ax, 0B1h
		push	ax
		lea	ax, word ptr [bp+var_11A]
		push	ax
		call	Vector_SetLength_57879
		add	sp, 4
		mov	eax, [bp+var_DE]
		sub	eax, [bp+var_11A]
		mov	[bp+var_132], eax
		mov	eax, [bp+var_DA]
		sub	eax, [bp+var_116]
		mov	[bp+var_12E], eax
		mov	eax, [bp+var_D6]
		sub	eax, [bp+var_112]
		mov	[bp+var_12A], eax
		mov	eax, [bp+var_132]
		mov	[bp+var_13E], eax
		mov	eax, [bp+var_12E]
		mov	[bp+var_13A], eax
		mov	eax, [bp+var_12A]
		mov	[bp+var_136], eax
		mov	eax, [bp+var_13E]
		mov	[si+14h], eax
		mov	eax, [bp+var_13A]
		mov	[si+18h], eax
		mov	eax, [bp+var_136]
		mov	[si+1Ch], eax
		jmp	short loc_918F7

loc_91880:
		mov	[bp+var_38], 400h
		mov	eax, [bp+var_11A]
		mov	edx, eax
		mov	ecx, [bp+var_38]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_11A], eax
		mov	eax, [bp+var_116]
		mov	edx, eax
		mov	ecx, [bp+var_38]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_116], eax
		mov	eax, [bp+var_112]
		mov	edx, eax
		mov	ecx, [bp+var_38]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_112], eax
		mov	eax, [bp+var_11A]
		add	[si+14h], eax
		mov	eax, [bp+var_116]
		add	[si+18h], eax
		mov	eax, [bp+var_112]
		add	[si+1Ch], eax

loc_918F7:
		mov	di, [si+8Bh]
		add	di, 12h
		mov	ax, si
		add	ax, 14h
		mov	[bp+var_3A], ax
		mov	eax, [di]
		mov	bx, [bp+var_3A]
		sub	eax, [bx]
		mov	[bp+var_156], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp+var_152], eax
		mov	eax, [di+8]
		sub	eax, [bx+8]
		mov	[bp+var_14E], eax
		mov	eax, [bp+var_156]
		mov	[bp+var_14A], eax
		mov	eax, [bp+var_152]
		mov	[bp+var_146], eax
		mov	eax, [bp+var_14E]
		mov	[bp+var_142], eax
		mov	di, si
		add	di, 2Ch
		push	eax
		push	large [bp+var_146]
		push	large [bp+var_14A]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_3E], eax
		mov	[bp+var_42], eax
		mov	eax, [di]
		mov	edx, [bp+var_42]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_46], eax
		mov	eax, [bp+var_46]
		mov	[bp+var_4A], eax
		mov	eax, [di+4]
		mov	edx, [bp+var_42]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4E], eax
		mov	eax, [bp+var_4E]
		mov	[bp+var_52], eax
		mov	eax, [di+8]
		mov	edx, [bp+var_42]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_56], eax
		mov	eax, [bp+var_56]
		mov	[bp+var_5A], eax
		mov	eax, [bp+var_4A]
		mov	[bp+var_16E], eax
		mov	eax, [bp+var_52]
		mov	[bp+var_16A], eax
		mov	eax, [bp+var_5A]
		mov	[bp+var_166], eax
		mov	eax, [bp+var_14A]
		mov	ebx, 0Ah
		cdq
		idiv	ebx
		mov	[bp+var_5E], eax
		mov	[bp+var_62], eax
		mov	eax, [bp+var_146]
		cdq
		idiv	ebx
		mov	[bp+var_66], eax
		mov	[bp+var_6A], eax
		mov	eax, [bp+var_142]
		cdq
		idiv	ebx
		mov	[bp+var_6E], eax
		mov	[bp+var_72], eax
		mov	eax, [bp+var_62]
		mov	[bp+var_17A], eax
		mov	eax, [bp+var_6A]
		mov	[bp+var_176], eax
		mov	eax, [bp+var_72]
		mov	[bp+var_172], eax
		mov	eax, [bp+var_16E]
		add	eax, [bp+var_17A]
		mov	[bp+var_186], eax
		mov	eax, [bp+var_16A]
		add	eax, [bp+var_176]
		mov	[bp+var_182], eax
		mov	eax, [bp+var_166]
		add	eax, [bp+var_172]
		mov	[bp+var_17E], eax
		mov	eax, [bp+var_186]
		mov	[bp+var_162], eax
		mov	eax, [bp+var_182]
		mov	[bp+var_15E], eax
		mov	eax, [bp+var_17E]
		mov	[bp+var_15A], eax
		lea	ax, word ptr [bp+var_162]
		push	ax
		mov	ax, si
		add	ax, 20h
		push	ax
		call	sub_59B77
		add	sp, 4
		mov	al, 1
		jmp	loc_91CDD

loc_91A99:
		mov	di, [si+8Bh]
		add	di, 12h
		mov	eax, [di]
		mov	[si+8Dh], eax
		mov	eax, [di+4]
		mov	[si+91h], eax
		mov	eax, [di+8]
		mov	[si+95h], eax
		mov	di, [si+8Bh]
		add	di, 12h
		mov	ax, si
		add	ax, 14h
		mov	[bp+var_2], ax
		mov	eax, [di]
		mov	bx, [bp+var_2]
		sub	eax, [bx]
		mov	[bp+var_8A], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp+var_86], eax
		mov	eax, [di+8]
		sub	eax, [bx+8]
		mov	[bp+var_82], eax
		mov	eax, [bp+var_8A]
		mov	[bp+var_96], eax
		mov	eax, [bp+var_86]
		mov	[bp+var_92], eax
		mov	eax, [bp+var_82]
		mov	[bp+var_8E], eax
		mov	eax, [bp+var_96]
		mov	[bp+var_7E], eax
		mov	eax, [bp+var_92]
		mov	[bp+var_7A], eax
		mov	eax, [bp+var_8E]
		mov	[bp+var_76], eax
		lea	ax, word ptr [bp+var_7E]
		push	ax
		mov	ax, si
		add	ax, 20h
		push	ax
		call	sub_59B77
		add	sp, 4

loc_91B3C:
		mov	di, si
		add	di, 2Ch
		mov	eax, [si+0ADh]
		neg	eax
		mov	[bp+var_6], eax
		mov	[bp+var_A], eax
		mov	eax, [di]
		mov	edx, [bp+var_A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_E], eax
		mov	eax, [bp+var_E]
		mov	[bp+var_12], eax
		mov	eax, [di+4]
		mov	edx, [bp+var_A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_16], eax
		mov	eax, [bp+var_16]
		mov	[bp+var_1A], eax
		mov	eax, [di+8]
		mov	edx, [bp+var_A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_1E], eax
		mov	eax, [bp+var_1E]
		mov	[bp+var_22], eax
		mov	eax, [bp+var_12]
		mov	[bp+var_A2], eax
		mov	eax, [bp+var_1A]
		mov	[bp+var_9E], eax
		mov	eax, [bp+var_22]
		mov	[bp+var_9A], eax
		lea	ax, word ptr [bp+var_A2]
		push	ax
		sub	sp, 4
		mov	di, si
		add	di, 95h
		mov	eax, [di]
		mov	[bp+var_190], eax
		push	si
		call	sub_2CB53
		add	sp, 8
		mov	di, si
		add	di, 8Dh
		mov	eax, [di]
		add	eax, [bp+var_A2]
		mov	[bp+var_AE], eax
		mov	eax, [di+4]
		add	eax, [bp+var_9E]
		mov	[bp+var_AA], eax
		mov	eax, [di+8]
		add	eax, [bp+var_9A]
		mov	[bp+var_A6], eax
		mov	eax, [bp+var_AE]
		mov	[bp+var_BA], eax
		mov	eax, [bp+var_AA]
		mov	[bp+var_B6], eax
		mov	eax, [bp+var_A6]
		mov	[bp+var_B2], eax
		mov	eax, [bp+var_BA]
		mov	[si+14h], eax
		mov	eax, [bp+var_B6]
		mov	[si+18h], eax
		mov	eax, [bp+var_B2]
		mov	[si+1Ch], eax
		mov	di, si
		add	di, 8Dh
		mov	ax, si
		add	ax, 14h
		mov	[bp+var_24], ax
		mov	eax, [di]
		mov	bx, [bp+var_24]
		sub	eax, [bx]
		mov	[bp+var_D2], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp+var_CE], eax
		mov	eax, [di+8]
		sub	eax, [bx+8]
		mov	[bp+var_CA], eax
		mov	eax, [bp+var_D2]
		mov	[bp+var_C6], eax
		mov	eax, [bp+var_CE]
		mov	[bp+var_C2], eax
		mov	eax, [bp+var_CA]
		mov	[bp+var_BE], eax
		lea	ax, word ptr [bp+var_C6]
		push	ax
		mov	ax, si
		add	ax, 20h
		push	ax
		call	sub_59B77
		add	sp, 4
		mov	eax, [si+0B5h]
		mov	edx, dword_7976E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_28], eax
		mov	eax, [bp+var_28]
		mov	[bp+var_2C], eax
		sub	[si+0ADh], eax
		mov	al, 1
		jmp	short loc_91CDD

loc_91CD4:
		mov	al, [si+0B9h]
		mov	byte_7CEF8, al
		mov	al, 0

loc_91CDD:
		pop	di
		pop	si
		leave
		retf
sub_9163B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; StreamReader_DestructWrapper_3D231 (sub_3D231 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à StreamReader_DestructWrapper_659C1 (sub_659C1 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, référencée via vtable
; (DATA XREF seg339) — enveloppe appelant StreamReader_Destruct_638FF. Référencée directement
; par TextRenderer_Main (sub_27477, seg048).
; ==============================================================================================
StreamReader_DestructWrapper_91CE1		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		call	sub_73DF6
		pop	cx
		pop	bp
		retf
StreamReader_DestructWrapper_91CE1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_91CF0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 8
		pop	bp
		retf
sub_91CF0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; HUDSymbol_ReleaseRefConditional_834B8 (sub_834B8 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, invalide une référence faible
; (WeakRef_InvalidateIfSet, 20 lignes).
; ==============================================================================================
HUDSymbol_ReleaseRefConditional_91CFA		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	sub_73530
		pop	cx
		mov	ax, si
		add	ax, 8Bh
		push	ax
		call	WeakRef_InvalidateIfSet
		pop	cx
		pop	si
		pop	bp
		retf
HUDSymbol_ReleaseRefConditional_91CFA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_91D17		proc far

var_84		= dword ptr -84h
var_80		= dword ptr -80h
var_7C		= dword ptr -7Ch
var_78		= dword ptr -78h
var_74		= dword ptr -74h
var_70		= dword ptr -70h
var_6C		= dword ptr -6Ch
var_68		= dword ptr -68h
var_64		= dword ptr -64h
var_60		= dword ptr -60h
var_5C		= dword ptr -5Ch
var_58		= dword ptr -58h
var_54		= dword ptr -54h
var_50		= dword ptr -50h
var_4C		= dword ptr -4Ch
var_48		= dword ptr -48h
var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= word ptr -28h
var_26		= word ptr -26h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= word ptr -14h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 84h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		or	di, di
		jnz	short loc_91D2D
		jmp	loc_91FFA

loc_91D2D:
		cmp	[bp+arg_2], 0
		jnz	short loc_91D36
		jmp	loc_91FFA

loc_91D36:
		push	di
		mov	bx, [di]
		call	dword ptr [bx+38h]
		pop	cx
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0
		jnz	short loc_91D49
		jmp	loc_91FFA

loc_91D49:
		mov	[bp+var_4], ax
		push	ax
		mov	ax, si
		add	ax, 89h
		push	ax
		call	SetReference16
		add	sp, 4
		mov	ax, [bp+arg_2]
		mov	[bp+var_6], ax
		push	ax
		mov	ax, si
		add	ax, 8Bh
		push	ax
		call	SetReference16
		add	sp, 4
		mov	ax, [si+8Bh]
		add	ax, 12h
		mov	[bp+var_8], ax
		mov	bx, [bp+var_8]
		mov	eax, [bx]
		mov	[si+8Dh], eax
		mov	eax, [bx+4]
		mov	[si+91h], eax
		mov	eax, [bx+8]
		mov	[si+95h], eax
		mov	eax, [si+0A5h]
		mov	[si+0A9h], eax
		mov	bx, [si+8Bh]
		mov	eax, [bx+20h]
		mov	[si+0ADh], eax
		cmp	dword ptr [si+0ADh], 15E00h
		jge	short loc_91DBE
		mov	ax, 1
		jmp	short loc_91DC0

loc_91DBE:
		xor	ax, ax

loc_91DC0:
		or	al, al
		jz	short loc_91DD1
		mov	eax, [si+0ADh]
		shl	eax, 1
		mov	[si+0ADh], eax

loc_91DD1:
		mov	eax, [si+0ADh]
		mov	[si+0B1h], eax
		mov	ax, si
		add	ax, 0ADh
		mov	[bp+var_A], ax
		mov	eax, [si+0B1h]
		mov	bx, [bp+var_A]
		sub	eax, [bx]
		mov	[bp+var_E], eax
		mov	[bp+var_12], eax
		mov	ax, si
		add	ax, 0A5h
		mov	[bp+var_14], ax
		mov	eax, [bp+var_12]
		mov	edx, eax
		mov	bx, [bp+var_14]
		mov	ecx, [bx]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_1C], eax
		mov	[si+0B5h], eax
		push	di
		push	ss
		lea	ax, word ptr [bp+var_60]
		push	ax
		mov	bx, [di]
		call	dword ptr [bx+50h]
		add	sp, 6
		mov	eax, [bp+var_60]
		mov	[bp+var_54], eax
		mov	eax, [bp+var_5C]
		mov	[bp+var_50], eax
		mov	eax, [bp+var_58]
		mov	[bp+var_4C], eax
		push	eax
		push	large [bp+var_50]
		push	large [bp+var_54]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_20], eax
		mov	[bp+var_24], eax
		cmp	[bp+var_24], 80h
		jg	short loc_91EDA
		mov	di, [si+8Bh]
		add	di, 12h
		mov	ax, [bp+var_2]
		add	ax, 12h
		mov	[bp+var_26], ax
		mov	eax, [di]
		mov	bx, [bp+var_26]
		sub	eax, [bx]
		mov	[bp+var_6C], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp+var_68], eax
		mov	eax, [di+8]
		sub	eax, [bx+8]
		mov	[bp+var_64], eax
		mov	eax, [bp+var_6C]
		mov	[bp+var_78], eax
		mov	eax, [bp+var_68]
		mov	[bp+var_74], eax
		mov	eax, [bp+var_64]
		mov	[bp+var_70], eax
		mov	eax, [bp+var_78]
		mov	[bp+var_54], eax
		mov	eax, [bp+var_74]
		mov	[bp+var_50], eax
		mov	eax, [bp+var_70]
		mov	[bp+var_4C], eax

loc_91EDA:
		lea	ax, word ptr [bp+var_54]
		push	ax
		mov	ax, si
		add	ax, 20h
		push	ax
		call	sub_59B77
		add	sp, 4
		mov	di, [si+8Bh]
		add	di, 12h
		mov	eax, [di]
		mov	[si+14h], eax
		mov	eax, [di+4]
		mov	[si+18h], eax
		mov	eax, [di+8]
		mov	[si+1Ch], eax
		mov	di, si
		add	di, 2Ch
		mov	ax, si
		add	ax, 0B1h
		mov	[bp+var_28], ax
		mov	eax, [di]
		mov	bx, [bp+var_28]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_2C]
		mov	[bp+var_30], eax
		mov	eax, [di+4]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_34], eax
		mov	eax, [bp+var_34]
		mov	[bp+var_38], eax
		mov	eax, [di+8]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_3C]
		mov	[bp+var_40], eax
		mov	eax, [bp+var_30]
		mov	[bp+var_84], eax
		mov	eax, [bp+var_38]
		mov	[bp+var_80], eax
		mov	eax, [bp+var_40]
		mov	[bp+var_7C], eax
		mov	eax, [bp+var_84]
		sub	[si+14h], eax
		mov	eax, [bp+var_80]
		sub	[si+18h], eax
		mov	eax, [bp+var_7C]
		sub	[si+1Ch], eax
		push	word ptr [si+8Bh]
		mov	bx, [si+8Bh]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		cmp	al, 6
		jz	short loc_91FD2
		push	word ptr [si+8Bh]
		mov	bx, [si+8Bh]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		cmp	al, 18h
		jz	short loc_91FD2
		push	word ptr [si+8Bh]
		mov	bx, [si+8Bh]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		cmp	al, 17h
		jnz	short loc_91FE9

loc_91FD2:
		mov	eax, [si+0A9h]
		shl	eax, 1
		mov	[bp+var_44], eax
		mov	[bp+var_48], eax
		mov	[si+0A9h], eax
		jmp	short loc_91FF3

loc_91FE9:
		mov	eax, [si+0B1h]
		mov	[si+0ADh], eax

loc_91FF3:
		mov	al, [bp+arg_6]
		mov	[si+0B9h], al

loc_91FFA:
		pop	di
		pop	si
		leave
		retf
sub_91D17		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à HUDSymbol_ConstructVariantD_837BB (sub_837BB de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; même motif que HUDSymbol_ConstructVariantA_804F0.
; ==============================================================================================
HUDSymbol_ConstructVariantD_91FFE		proc far

var_52		= word ptr -52h
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 52h
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_9201B
		push	0ADh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_9207B

loc_9201B:
		mov	ax, si
		add	ax, 20h
		push	ax
		call	Formation_ComputeGeometryHelper_58B0C
		pop	cx
		mov	word ptr [si+50h], 6D0h
		mov	ax, si
		add	ax, 53h
		push	ax
		call	String_ConstructEmpty
		pop	cx
		push	si
		call	sub_73DDD
		pop	cx
		mov	word ptr [si+50h], 7EEh
		mov	ax, si
		add	ax, 80h
		push	ax
		call	String_ConstructEmpty
		pop	cx
		mov	word ptr [si+89h], 0
		mov	word ptr [si+50h], 863h
		push	large 52h
		push	ss
		lea	ax, [bp+var_52]
		push	ax
		push	[bp+arg_2]
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		lea	ax, [bp+var_52]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr HUDSymbol_ConstructAndInitAngleC_92102
		add	sp, 4

loc_9207B:
		mov	ax, si
		pop	si
		leave
		retf
HUDSymbol_ConstructVariantD_91FFE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à HUDSymbol_ConstructVariantE_8383D (sub_8383D de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; même motif que HUDSymbol_ConstructVariantA_804F0.
; ==============================================================================================
HUDSymbol_ConstructVariantE_92080		proc far

var_52		= word ptr -52h
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 52h
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_9209D
		push	0ADh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_920FD

loc_9209D:
		mov	ax, si
		add	ax, 20h
		push	ax
		call	Formation_ComputeGeometryHelper_58B0C
		pop	cx
		mov	word ptr [si+50h], 6D0h
		mov	ax, si
		add	ax, 53h
		push	ax
		call	String_ConstructEmpty
		pop	cx
		push	si
		call	sub_73DDD
		pop	cx
		mov	word ptr [si+50h], 7EEh
		mov	ax, si
		add	ax, 80h
		push	ax
		call	String_ConstructEmpty
		pop	cx
		mov	word ptr [si+89h], 0
		mov	word ptr [si+50h], 863h
		push	52h
		push	large [bp+arg_2]
		push	ss
		lea	ax, [bp+var_52]
		push	ax
		call	sub_37C3
		add	sp, 0Ah
		lea	ax, [bp+var_52]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr HUDSymbol_ConstructAndInitAngleC_92102
		add	sp, 4

loc_920FD:
		mov	ax, si
		pop	si
		leave
		retf
HUDSymbol_ConstructVariantE_92080		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à HUDSymbol_ConstructAndInitAngleC_838BF (sub_838BF de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine allocation, copie de chaîne, Utility_Helper_55E11 (seg116).
; ==============================================================================================
HUDSymbol_ConstructAndInitAngleC_92102		proc far

var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_F		= byte ptr -0Fh
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [di+4Ah]
		mov	[bp+var_2], ax
		mov	ax, [di+4Ch]
		mov	[bp+var_4], ax
		mov	ax, [di+4Eh]
		mov	[bp+var_6], ax
		mov	ax, [di+50h]
		mov	[bp+var_8], ax
		push	1Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp+var_A], ax
		or	ax, ax
		jz	short loc_92174
		mov	bx, [bp+var_A]
		mov	word ptr [bx], 698h
		mov	word ptr [bx+2], 0
		mov	word ptr [bx+4], 0
		mov	byte ptr [bx+0Fh], 0
		mov	word ptr [bx+10h], 0
		mov	word ptr [bx+12h], 0
		mov	byte ptr [bx+1Dh], 0
		push	[bp+var_8]
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		push	ax
		call	sub_73DB0
		add	sp, 0Ah
		mov	ax, [bp+var_A]
		jmp	short loc_92177

loc_92174:
		mov	ax, [bp+var_A]

loc_92177:
		mov	[si+5Ch], ax
		sub	sp, 4
		mov	ax, di
		add	ax, 46h
		mov	[bp+var_C], ax
		mov	bx, [bp+var_C]
		mov	eax, [bx]
		mov	[bp+var_18], eax
		sub	sp, 4
		mov	ax, [di+44h]
		mov	[bp+var_E], ax
		movsx	eax, [bp+var_E]
		shl	eax, 8
		mov	[bp+var_1C], eax
		push	large [di+40h]
		mov	ax, di
		add	ax, 16h
		push	ax
		push	word ptr [si+5Ch]
		push	si
		call	sub_73512
		add	sp, 12h
		push	large [di+12h]
		push	large [di+0Eh]
		push	large [di+0Ah]
		mov	ax, si
		add	ax, 14h
		push	ax
		call	Utility_Helper_57BDA
		add	sp, 0Eh
		mov	al, [di+8]
		mov	[bp+var_F], al
		and	ax, 1
		and	byte ptr [si+52h], 0FDh
		shl	al, 1
		or	[si+52h], al
		mov	ax, [di+1Eh]
		mov	[si+8Bh], ax
		push	20h
		mov	ax, di
		add	ax, 20h
		push	ax
		mov	ax, si
		add	ax, 8Dh
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	byte ptr [si+0ACh], 0
		pop	di
		pop	si
		leave
		retf
HUDSymbol_ConstructAndInitAngleC_92102		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à HUDSymbol_ConstructWithMatrix_839CA (sub_839CA de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine une opération de conteneur, SetReference16, Matrix_BuildFromAngle_56D72 (seg116).
; ==============================================================================================
HUDSymbol_ConstructWithMatrix_9220D		proc far

var_C		= dword ptr -0Ch
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	si, [bp+arg_0]
		mov	ax, si
		add	ax, 80h
		mov	[bp+var_2], ds
		mov	[bp+var_4], ax
		push	[bp+var_2]
		push	ax
		push	67ADh
		call	Container_Op_1E66D
		add	sp, 6
		mov	[bp+var_6], ax
		push	ax
		mov	ax, si
		add	ax, 89h
		push	ax
		call	SetReference16
		add	sp, 4
		mov	ax, si
		add	ax, 20h
		push	ax
		call	Matrix_BuildFromAngle_58B3B
		pop	cx
		sub	sp, 4
		mov	[bp+var_C], 200h
		push	ds
		mov	ax, si
		add	ax, 8Dh
		push	ax
		push	ds
		push	offset unk_7CEFE
		call	GlyphObject_Helper9_15CE5
		add	sp, 0Ch
		cmp	word ptr [si+5Ch], 0
		jz	short loc_9227C
		push	si
		call	sub_73DF6
		pop	cx
		jmp	short loc_92282

loc_9227C:
		mov	al, [si+52h]
		and	ax, 1

loc_92282:
		pop	si
		leave
		retf
HUDSymbol_ConstructWithMatrix_9220D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_92285		proc far

var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 32h
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+89h], 0
		jnz	short loc_9229A
		jmp	loc_9232C

loc_9229A:
		mov	di, [si+89h]
		add	di, 12h
		mov	dx, si
		add	dx, 14h
		mov	eax, [di]
		mov	bx, dx
		sub	eax, [bx]
		mov	[bp+var_32], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp+var_2E], eax
		mov	eax, [di+8]
		sub	eax, [bx+8]
		mov	[bp+var_2A], eax
		mov	eax, [bp+var_32]
		mov	[bp+var_26], eax
		mov	eax, [bp+var_2E]
		mov	[bp+var_22], eax
		mov	eax, [bp+var_2A]
		mov	[bp+var_1E], eax
		push	eax
		push	large [bp+var_22]
		push	large [bp+var_26]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_16], eax
		mov	[bp+var_1A], eax
		cmp	[bp+var_1A], 3E800h
		jge	short loc_9230F
		mov	ax, 1
		jmp	short loc_92311

loc_9230F:
		xor	ax, ax

loc_92311:
		or	al, al
		jz	short loc_9232C
		lea	ax, word ptr [bp+var_26]
		push	ax
		mov	ax, si
		add	ax, 20h
		push	ax
		call	sub_59B77
		add	sp, 4
		mov	al, 1
		jmp	loc_923AC

loc_9232C:
		mov	ax, [si+8Bh]
		mov	[bp+var_2], ax
		movsx	eax, [bp+var_2]
		shl	eax, 8
		mov	[bp+var_6], eax
		lea	ax, word ptr [bp+var_6]
		push	ax
		mov	ax, si
		add	ax, 20h
		push	ax
		call	Vector_RotateHeading2D_57513
		add	sp, 4
		mov	ax, [si+8Bh]
		mov	[bp+var_8], ax
		movsx	eax, [bp+var_8]
		shl	eax, 8
		mov	[bp+var_C], eax
		lea	ax, word ptr [bp+var_C]
		push	ax
		mov	ax, si
		add	ax, 2Ch
		push	ax
		call	Vector_RotateHeading2D_57513
		add	sp, 4
		mov	ax, [si+8Bh]
		mov	[bp+var_E], ax
		movsx	eax, [bp+var_E]
		shl	eax, 8
		mov	[bp+var_12], eax
		lea	ax, word ptr [bp+var_12]
		push	ax
		mov	ax, si
		add	ax, 38h
		push	ax
		call	Vector_RotateHeading2D_57513
		add	sp, 4
		mov	ax, si
		add	ax, 20h
		push	ax
		call	Matrix_OrthonormalizeKeepRow1_59429
		pop	cx
		mov	al, 1

loc_923AC:
		pop	di
		pop	si
		leave
		retf
sub_92285		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_923B0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 7
		pop	bp
		retf
sub_923B0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à HUDSymbol_RenderGraphWrapper_83B85 (sub_83B85 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle UIScreen_RenderGraphVGA_509EE (seg113).
; ==============================================================================================
HUDSymbol_RenderGraphWrapper_923BA		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	sub_519BE
		pop	cx
		cmp	word ptr [si+89h], 0
		jz	short loc_923E3
		mov	bx, [si+89h]
		cmp	byte ptr [bx+3], 0
		jz	short loc_923E3
		push	si
		push	bx
		mov	bx, [bx]
		call	dword ptr [bx+1Ch]
		add	sp, 4

loc_923E3:
		pop	si
		pop	bp
		retf
HUDSymbol_RenderGraphWrapper_923BA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à HUDSymbol_ConstructVariantF_83BB1 (sub_83BB1 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; même motif que HUDSymbol_ConstructVariantA_804F0.
; ==============================================================================================
HUDSymbol_ConstructVariantF_923E6		proc far

var_24		= word ptr -24h
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 24h
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_92403
		push	9Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_9247D

loc_92403:
		mov	ax, si
		add	ax, 20h
		push	ax
		call	Formation_ComputeGeometryHelper_58B0C
		pop	cx
		mov	word ptr [si+50h], 6D0h
		mov	ax, si
		add	ax, 53h
		push	ax
		call	String_ConstructEmpty
		pop	cx
		push	si
		call	sub_73DDD
		pop	cx
		mov	word ptr [si+50h], 7EEh
		mov	ax, si
		add	ax, 80h
		push	ax
		call	String_ConstructEmpty
		pop	cx
		mov	word ptr [si+89h], 0
		mov	word ptr [si+50h], 812h
		mov	ax, si
		add	ax, 8Ch
		mov	ax, si
		add	ax, 90h
		mov	ax, si
		add	ax, 94h
		mov	word ptr [si+98h], 0
		mov	ax, si
		add	ax, 9Ah
		push	large 24h
		push	ss
		lea	ax, [bp+var_24]
		push	ax
		push	[bp+arg_2]
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		lea	ax, [bp+var_24]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr HUDSymbol_ConstructAndInitAngleD_9251E
		add	sp, 4

loc_9247D:
		mov	ax, si
		pop	si
		leave
		retf
HUDSymbol_ConstructVariantF_923E6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à HUDSymbol_ConstructVariantG_83C4D (sub_83C4D de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; même motif que HUDSymbol_ConstructVariantA_804F0.
; ==============================================================================================
HUDSymbol_ConstructVariantG_92482		proc far

var_24		= word ptr -24h
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 24h
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_9249F
		push	9Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_92519

loc_9249F:
		mov	ax, si
		add	ax, 20h
		push	ax
		call	Formation_ComputeGeometryHelper_58B0C
		pop	cx
		mov	word ptr [si+50h], 6D0h
		mov	ax, si
		add	ax, 53h
		push	ax
		call	String_ConstructEmpty
		pop	cx
		push	si
		call	sub_73DDD
		pop	cx
		mov	word ptr [si+50h], 7EEh
		mov	ax, si
		add	ax, 80h
		push	ax
		call	String_ConstructEmpty
		pop	cx
		mov	word ptr [si+89h], 0
		mov	word ptr [si+50h], 812h
		mov	ax, si
		add	ax, 8Ch
		mov	ax, si
		add	ax, 90h
		mov	ax, si
		add	ax, 94h
		mov	word ptr [si+98h], 0
		mov	ax, si
		add	ax, 9Ah
		push	24h
		push	large [bp+arg_2]
		push	ss
		lea	ax, [bp+var_24]
		push	ax
		call	sub_37C3
		add	sp, 0Ah
		lea	ax, [bp+var_24]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr HUDSymbol_ConstructAndInitAngleD_9251E
		add	sp, 4

loc_92519:
		mov	ax, si
		pop	si
		leave
		retf
HUDSymbol_ConstructVariantG_92482		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à HUDSymbol_ConstructAndInitAngleD_83CE9 (sub_83CE9 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; même motif que HUDSymbol_ConstructAndInitAngle_80701.
; ==============================================================================================
HUDSymbol_ConstructAndInitAngleD_9251E		proc far

var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_11		= byte ptr -11h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [di+1Ch]
		mov	[bp+var_2], ax
		mov	ax, [di+1Eh]
		mov	[bp+var_4], ax
		mov	ax, [di+20h]
		mov	[bp+var_6], ax
		mov	ax, [di+22h]
		mov	[bp+var_8], ax
		push	1Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp+var_A], ax
		or	ax, ax
		jz	short loc_92590
		mov	bx, [bp+var_A]
		mov	word ptr [bx], 698h
		mov	word ptr [bx+2], 0
		mov	word ptr [bx+4], 0
		mov	byte ptr [bx+0Fh], 0
		mov	word ptr [bx+10h], 0
		mov	word ptr [bx+12h], 0
		mov	byte ptr [bx+1Dh], 0
		push	[bp+var_8]
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		push	ax
		call	sub_73DB0
		add	sp, 0Ah
		mov	ax, [bp+var_A]
		jmp	short loc_92593

loc_92590:
		mov	ax, [bp+var_A]

loc_92593:
		mov	[si+5Ch], ax
		sub	sp, 4
		mov	ax, di
		add	ax, 18h
		mov	[bp+var_C], ax
		mov	bx, [bp+var_C]
		mov	eax, [bx]
		mov	[bp+var_1A], eax
		sub	sp, 4
		mov	ax, [di+16h]
		mov	[bp+var_E], ax
		movsx	eax, [bp+var_E]
		shl	eax, 8
		mov	[bp+var_1E], eax
		push	large [di+12h]
		mov	ax, di
		add	ax, 0Ah
		push	ax
		push	word ptr [si+5Ch]
		push	si
		call	sub_73512
		add	sp, 12h
		mov	[bp+var_10], di
		push	8
		push	[bp+var_10]
		mov	ax, si
		add	ax, 53h
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	byte ptr [si+5Bh], 0
		mov	al, [di+8]
		mov	[bp+var_11], al
		and	ax, 1
		and	byte ptr [si+52h], 0FDh
		shl	al, 1
		or	[si+52h], al
		mov	byte ptr [si+8Bh], 1
		pop	di
		pop	si
		leave
		retf
HUDSymbol_ConstructAndInitAngleD_9251E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9260C		proc far

var_56		= dword ptr -56h
var_4E		= dword ptr -4Eh
var_4A		= dword ptr -4Ah
var_46		= dword ptr -46h
var_42		= dword ptr -42h
var_3E		= dword ptr -3Eh
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= word ptr -26h
var_24		= dword ptr -24h
var_20		= word ptr -20h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 4Eh
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	word ptr [si+89h]
		mov	bx, [si+89h]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		or	ax, dx
		jz	short loc_92638
		push	word ptr [si+89h]
		mov	bx, [si+89h]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		jmp	short loc_9263A

loc_92638:
		mov	al, 1Ch

loc_9263A:
		cmp	al, 6
		jnz	short loc_9265A
		mov	bx, [si+89h]
		push	large [bx+5Fh]
		call	sub_7456B
		add	sp, 4
		mov	bx, [si+89h]
		les	bx, [bx+5Fh]
		mov	byte ptr es:[bx+55h], 0

loc_9265A:
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		push	ax
		mov	ax, si
		add	ax, 89h
		push	ax
		call	SetReference16
		add	sp, 4
		mov	bx, [si+89h]
		mov	eax, [bx+20h]
		mov	[si+94h], eax
		cmp	dword ptr [si+94h], 15E00h
		jge	short loc_9268C
		mov	ax, 1
		jmp	short loc_9268E

loc_9268C:
		xor	ax, ax

loc_9268E:
		or	al, al
		jz	short loc_926DC
		mov	eax, [si+94h]
		shl	eax, 1
		mov	[bp+var_6], eax
		mov	[bp+var_A], eax
		mov	[si+8Ch], eax
		mov	[bp+var_E], 119h
		mov	eax, [si+94h]
		mov	edx, [bp+var_E]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+94h], eax
		mov	eax, [si+8Ch]
		shl	eax, 1
		mov	[bp+var_12], eax
		mov	[bp+var_16], eax
		mov	[si+90h], eax
		jmp	short loc_926FB

loc_926DC:
		mov	eax, [si+94h]
		mov	[si+8Ch], eax
		mov	eax, [si+8Ch]
		shl	eax, 1
		mov	[bp+var_1A], eax
		mov	[bp+var_1E], eax
		mov	[si+90h], eax

loc_926FB:
		mov	ax, [bp+arg_4]
		mov	[bp+var_20], ax
		movsx	eax, [bp+var_20]
		shl	eax, 8
		mov	[bp+var_24], eax
		mov	eax, [bp+var_24]
		mov	dword_76F67, eax
		mov	ax, [bp+arg_6]
		mov	[bp+var_26], ax
		movsx	eax, [bp+var_26]
		shl	eax, 8
		mov	[bp+var_2A], eax
		mov	eax, [bp+var_2A]
		mov	dword_76F6B, eax
		mov	ax, si
		add	ax, 20h
		push	ax
		call	Matrix_BuildFromAngle_58B3B
		pop	cx
		push	83Bh
		mov	ax, si
		add	ax, 20h
		push	ax
		call	Matrix_BuildAxisZ_59085
		add	sp, 4
		push	837h
		mov	ax, si
		add	ax, 20h
		push	ax
		call	Matrix_BuildAxisX_58C8C
		add	sp, 4
		mov	ax, si
		add	ax, 20h
		push	ax
		call	Matrix_OrthonormalizeKeepRow1_59429
		pop	cx
		mov	eax, [si+2Ch]
		neg	eax
		mov	[bp+var_42], eax
		mov	eax, [si+30h]
		neg	eax
		mov	[bp+var_3E], eax
		mov	eax, [si+34h]
		neg	eax
		mov	[bp+var_3A], eax
		mov	eax, [bp+var_42]
		mov	[bp+var_4E], eax
		mov	eax, [bp+var_3E]
		mov	[bp+var_4A], eax
		mov	eax, [bp+var_3A]
		mov	[bp+var_46], eax
		mov	eax, [bp+var_4E]
		mov	[bp+var_36], eax
		mov	eax, [bp+var_4A]
		mov	[bp+var_32], eax
		mov	eax, [bp+var_46]
		mov	[bp+var_2E], eax
		mov	di, si
		add	di, 8Ch
		mov	eax, [bp+var_36]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_36], eax
		mov	eax, [bp+var_32]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_32], eax
		mov	eax, [bp+var_2E]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_2E], eax
		mov	di, [si+89h]
		add	di, 12h
		mov	eax, [di]
		add	[bp+var_36], eax
		mov	eax, [di+4]
		add	[bp+var_32], eax
		mov	eax, [di+8]
		add	[bp+var_2E], eax
		mov	eax, [bp+var_36]
		mov	[si+14h], eax
		mov	eax, [bp+var_32]
		mov	[si+18h], eax
		mov	eax, [bp+var_2E]
		mov	[si+1Ch], eax
		push	si
		call	Camera_DetachParent
		pop	cx
		push	si
		nop
		push	cs
		call	near ptr sub_92C8A
		pop	cx
		sub	sp, 4
		mov	[bp+var_56], 200h
		push	large dword_7C87E
		push	ds
		push	offset unk_7CEFE
		call	GlyphObject_Helper9_15CE5
		add	sp, 0Ch
		mov	byte ptr [si+8Bh], 1
		pop	di
		pop	si
		leave
		retf
sub_9260C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 11 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à HUDSymbol_ComputeApproachDisplay_83FC9 (sub_83FC9 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 207 lignes, NON DÉTAILLÉE — combine SetReference16 (×2), Math_VectorLength3D_Scaled_54F57,
; Math_ElevationAngle_552E1, Math_HeadingAngle_553CF (seg116) — affichage HUD d'angle
; d'approche.
; ==============================================================================================
HUDSymbol_ComputeApproachDisplay_92864		proc far

var_50		= dword ptr -50h
var_4C		= dword ptr -4Ch
var_48		= dword ptr -48h
var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 50h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_2], di
		push	[bp+var_2]
		mov	ax, si
		add	ax, 89h
		push	ax
		call	SetReference16
		add	sp, 4
		mov	[bp+var_4], di
		push	[bp+var_4]
		mov	ax, si
		add	ax, 98h
		push	ax
		call	SetReference16
		add	sp, 4
		mov	bx, [si+89h]
		mov	eax, [bx+20h]
		mov	[si+94h], eax
		cmp	dword ptr [si+94h], 15E00h
		jge	short loc_928B7
		mov	ax, 1
		jmp	short loc_928B9

loc_928B7:
		xor	ax, ax

loc_928B9:
		or	al, al
		jz	short loc_928F3
		mov	[bp+var_8], 180h
		mov	eax, [si+94h]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+94h], eax
		mov	eax, [si+94h]
		shl	eax, 2
		mov	[bp+var_C], eax
		mov	[bp+var_10], eax
		mov	[si+90h], eax
		jmp	short loc_92908

loc_928F3:
		mov	eax, [si+94h]
		shl	eax, 1
		mov	[bp+var_14], eax
		mov	[bp+var_18], eax
		mov	[si+90h], eax

loc_92908:
		add	di, 12h
		mov	cx, [bp+arg_4]
		mov	eax, [di]
		mov	bx, cx
		sub	eax, [bx]
		mov	[bp+var_50], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp+var_4C], eax
		mov	eax, [di+8]
		sub	eax, [bx+8]
		mov	[bp+var_48], eax
		mov	eax, [bp+var_50]
		mov	[bp+var_44], eax
		mov	eax, [bp+var_4C]
		mov	[bp+var_40], eax
		mov	eax, [bp+var_48]
		mov	[bp+var_3C], eax
		lea	ax, word ptr [bp+var_44]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_1C]
		push	ax
		call	Math_VectorLength3D_Scaled_56D92
		add	sp, 6
		mov	eax, [bp+var_1C]
		mov	[si+8Ch], eax
		mov	di, si
		add	di, 90h
		mov	eax, [di]
		mov	[bp+var_20], eax
		mov	di, si
		add	di, 94h
		mov	eax, [di]
		mov	[bp+var_24], eax
		mov	di, si
		add	di, 8Ch
		mov	eax, [di]
		mov	[bp+var_28], eax
		mov	eax, [bp+var_24]
		cmp	eax, [bp+var_28]
		jle	short loc_9299A
		mov	ax, 1
		jmp	short loc_9299C

loc_9299A:
		xor	ax, ax

loc_9299C:
		or	al, al
		jz	short loc_929A5
		lea	ax, word ptr [bp+var_24]
		jmp	short loc_929A8

loc_929A5:
		lea	ax, word ptr [bp+var_28]

loc_929A8:
		mov	di, ax
		mov	eax, [di]
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_20]
		cmp	eax, [bp+var_2C]
		jge	short loc_929C0
		mov	ax, 1
		jmp	short loc_929C2

loc_929C0:
		xor	ax, ax

loc_929C2:
		or	al, al
		jz	short loc_929CB
		lea	ax, word ptr [bp+var_20]
		jmp	short loc_929CE

loc_929CB:
		lea	ax, word ptr [bp+var_2C]

loc_929CE:
		mov	di, ax
		mov	eax, [di]
		mov	[bp+var_30], eax
		mov	[si+8Ch], eax
		lea	ax, word ptr [bp+var_44]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_34]
		push	ax
		call	sub_5711C
		add	sp, 6
		mov	eax, [bp+var_34]
		mov	dword_76F67, eax
		lea	ax, word ptr [bp+var_44]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_38]
		push	ax
		call	sub_5720C
		add	sp, 6
		mov	eax, [bp+var_38]
		mov	dword_76F6B, eax
		mov	byte ptr [si+8Bh], 1
		pop	di
		pop	si
		leave
		retf
HUDSymbol_ComputeApproachDisplay_92864		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à HUDSymbol_ComputeBearingDisplay_8417C (sub_8417C de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 217 lignes, NON DÉTAILLÉE — combine Math_SinDeg_54876, Camera_TransformPoint,
; Math_AsinOfRatio_54A76 (seg115) — affichage HUD de gisement. ⚠️ (2026-09-24) Math_Sin_5483F
; / Math_Cos_54876 et leurs versions brutes sont INVERSEES (voir Math_CosDeg_5483F) : toute
; mention de sinus/cosinus tiree de ces noms dans ce resume est a relire.
; ==============================================================================================
HUDSymbol_ComputeBearingDisplay_92A17		proc far

var_4C		= dword ptr -4Ch
var_48		= dword ptr -48h
var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= word ptr -2Ch
var_2A		= word ptr -2Ah
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	eax, [di]
		neg	eax
		mov	[bp+var_8], eax
		mov	[bp+var_C], eax
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_4]
		push	ax
		call	sub_566A3
		add	sp, 6
		mov	ax, si
		add	ax, 8Ch
		mov	[bp+var_12], ax
		mov	bx, [bp+var_12]
		mov	eax, [bx]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_10], eax
		mov	ax, [si+89h]
		add	ax, 1Ah
		mov	[bp+var_14], ax
		mov	bx, [bp+var_14]
		mov	eax, [bx]
		add	[bp+var_10], eax
		push	si
		call	Camera_TransformPoint
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_1C], eax
		shl	eax, 8
		mov	[bp+var_18], eax
		mov	eax, [si]
		shl	eax, 1
		mov	[bp+var_20], eax
		mov	[bp+var_24], eax
		add	[bp+var_18], eax
		mov	eax, [bp+var_18]
		cmp	eax, [bp+var_10]
		jle	short loc_92AB6
		mov	ax, 1
		jmp	short loc_92AB8

loc_92AB6:
		xor	ax, ax

loc_92AB8:
		or	al, al
		jnz	short loc_92ABF
		jmp	loc_92BCD

loc_92ABF:
		mov	ax, si
		add	ax, 8Ch
		mov	[bp+var_2A], ax
		mov	bx, [bp+var_2A]
		mov	eax, [bx]
		mov	[bp+var_28], eax
		mov	ax, [si+89h]
		add	ax, 1Ah
		mov	[bp+var_2C], ax
		mov	bx, [bp+var_2C]
		mov	eax, [bx]
		sub	[bp+var_18], eax
		mov	eax, [bp+var_4]
		cmp	eax, dword_77B16
		jle	short loc_92AF5
		mov	ax, 1
		jmp	short loc_92AF7

loc_92AF5:
		xor	ax, ax

loc_92AF7:
		or	al, al
		jz	short loc_92B21
		mov	eax, [bp+var_18]
		mov	edx, eax
		mov	ecx, [bp+var_4]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_30], eax
		mov	eax, [bp+var_30]
		mov	[bp+var_34], eax
		mov	[bp+var_28], eax

loc_92B21:
		mov	eax, [si+8Ch]
		cmp	eax, [bp+var_18]
		jle	short loc_92B31
		mov	ax, 1
		jmp	short loc_92B33

loc_92B31:
		xor	ax, ax

loc_92B33:
		or	al, al
		jz	short loc_92B95
		mov	eax, [bp+var_4]
		cmp	eax, dword_77B16
		jg	short loc_92B47
		mov	ax, 1
		jmp	short loc_92B49

loc_92B47:
		xor	ax, ax

loc_92B49:
		or	al, al
		jnz	short loc_92B5F
		cmp	[bp+var_28], 0
		jg	short loc_92B59
		mov	ax, 1
		jmp	short loc_92B5B

loc_92B59:
		xor	ax, ax

loc_92B5B:
		or	al, al
		jz	short loc_92B8A

loc_92B5F:
		mov	ax, si
		add	ax, 8Ch
		push	ax
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_38]
		push	ax
		call	Math_AsinOfRatio_568A3
		add	sp, 8
		mov	eax, [bp+var_38]
		neg	eax
		mov	[bp+var_3C], eax
		mov	[bp+var_40], eax
		mov	[di], eax
		jmp	short loc_92BCD

loc_92B8A:
		mov	eax, [bp+var_28]
		mov	[si+8Ch], eax
		jmp	short loc_92BCD

loc_92B95:
		mov	[bp+var_44], 0FFFFEC00h
		mov	eax, [bp+var_44]
		mov	dword_76F67, eax
		mov	eax, [bp+var_18]
		mov	edx, eax
		mov	ecx, dword_77B16
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_48], eax
		mov	eax, [bp+var_48]
		mov	[bp+var_4C], eax
		mov	[si+8Ch], eax

loc_92BCD:
		pop	di
		pop	si
		leave
		retf
HUDSymbol_ComputeBearingDisplay_92A17		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_92BD1		proc far

var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	sub_73526
		pop	cx
		cmp	word ptr [si+89h], 0
		jnz	short loc_92BEC
		jmp	loc_92C81

loc_92BEC:
		mov	ax, [si+89h]
		mov	[bp+var_2], ax
		push	ax
		mov	ax, si
		add	ax, 98h
		push	ax
		call	SetReference16
		add	sp, 4
		mov	al, byte_76F66
		mov	ah, 0
		or	ax, ax
		jnz	short loc_92C24
		mov	[bp+var_6], 0
		mov	eax, [bp+var_6]
		mov	dword_76F6B, eax
		mov	dword_76F67, eax
		mov	byte_76F66, 1

loc_92C24:
		push	large 0
		push	word ptr [si+89h]
		push	si
		push	cs
		call	near ptr sub_9260C
		add	sp, 8
		mov	byte ptr [si+8Bh], 1
		mov	[bp+var_A], 200h
		mov	eax, [bp+var_A]
		mov	[si+9Ah], eax
		cmp	byte_7CAC2, 1
		jnz	short loc_92C60
		test	byte_7CAC5, 30h
		jz	short loc_92C5C
		mov	ax, 1
		jmp	short loc_92C5E

loc_92C5C:
		xor	ax, ax

loc_92C5E:
		jmp	short loc_92C75

loc_92C60:
		cmp	byte_7D32D, 1
		jz	short loc_92C6E
		cmp	byte_7D365, 1
		jnz	short loc_92C73

loc_92C6E:
		mov	ax, 1
		jmp	short loc_92C75

loc_92C73:
		xor	ax, ax

loc_92C75:
		or	al, al
		jz	short loc_92C81
		push	si
		mov	bx, [si+50h]
		call	dword ptr [bx+10h]
		pop	cx

loc_92C81:
		mov	al, [si+52h]
		and	ax, 1
		pop	si
		leave
		retf
sub_92BD1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_92C8A		proc far

var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+89h], 0
		jnz	short loc_92CA5
		push	0B00Bh
		call	sub_1DDFE
		pop	cx

loc_92CA5:
		mov	di, [si+89h]
		mov	bx, [si+89h]
		mov	ax, [bx+10h]
		mov	dx, [bx+0Eh]
		add	dx, 36h
		mov	word_7C880, ax
		mov	word ptr dword_7C87E, dx
		test	byte ptr [bx+2], 10h
		jnz	short loc_92CC6
		jmp	loc_92E15

loc_92CC6:
		cmp	byte ptr [bx+51h], 1
		jz	short loc_92CCF
		jmp	loc_92DC6

loc_92CCF:
		les	bx, [bx+0Eh]
		mov	ax, es:[bx+3Fh]
		or	ax, es:[bx+41h]
		jz	short loc_92CF2
		mov	bx, [si+89h]
		mov	bx, [bx+0Eh]
		mov	ax, es:[bx+41h]
		mov	dx, es:[bx+3Fh]
		mov	word_7C880, ax
		mov	word ptr dword_7C87E, dx

loc_92CF2:
		push	word ptr [si+89h]
		mov	bx, [si+89h]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		mov	ah, 0
		mov	[bp+var_2], ax
		mov	cx, 4
		mov	bx, offset word_92E19

loc_92D0B:
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_2]
		jz	short loc_92D1B
		add	bx, 2
		loop	short loc_92D0B
		jmp	loc_92E15

loc_92D1B:
		jmp	word ptr cs:[bx+8] ; switch jump

loc_92D1F:
		mov	eax, dword_7C87E
		mov	[bp+var_6], eax
		mov	[bp+var_A], 0
		mov	bx, [si+89h]
		mov	ax, [bx+5Ah]
		or	ax, [bx+5Ch]
		jz	short loc_92D4C
		mov	ax, [bx+5Ch]
		mov	dx, [bx+5Ah]
		add	dx, 1Ah
		mov	word ptr [bp+var_A+2], ax
		mov	word ptr [bp+var_A], dx
		jmp	short loc_92D4C

loc_92D4C:
		mov	ax, word ptr [bp+var_A+2]
		mov	dx, word ptr [bp+var_A]
		add	dx, 74h
		mov	word_7C880, ax
		mov	word ptr dword_7C87E, dx
		push	ax
		push	dx
		push	seg seg008
		push	offset loc_5612
		call	sub_38D6
		add	sp, 8
		push	seg seg008
		push	offset loc_563A
		push	seg seg008
		push	offset loc_5612
		call	CRT_MemFamily_Extra2
		add	sp, 8
		push	large [bp+var_6]
		push	seg seg008
		push	offset loc_5612
		call	CRT_MemFamily_Extra2
		add	sp, 8
		mov	word_7C880, seg seg008
		mov	word ptr dword_7C87E, 122h
		jmp	short loc_92E15

loc_92DA0:
		mov	ax, di
		add	ax, 52h
		add	ax, 74h
		mov	word_7C880, ds
		mov	word ptr dword_7C87E, ax
		jmp	short loc_92E15

loc_92DB1:
		cmp	byte ptr [di+0E2h], 7Eh
		jz	short loc_92E15
		mov	ax, di
		add	ax, 0E2h
		mov	word_7C880, ds
		mov	word ptr dword_7C87E, ax
		jmp	short loc_92E15

loc_92DC6:
		push	word ptr [si+89h]
		mov	bx, [si+89h]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		mov	ah, 0
		cmp	ax, 17h
		jz	short loc_92DE2
		cmp	ax, 18h
		jz	short loc_92DE2
		jmp	short loc_92DEE

loc_92DE2:
		mov	ax, di
		add	ax, 0E2h
		mov	word_7C880, ds
		mov	word ptr dword_7C87E, ax

loc_92DEE:
		mov	bx, [si+89h]
		les	bx, [bx+0Eh]
		mov	ax, es:[bx+3Fh]
		or	ax, es:[bx+41h]
		jz	short loc_92E15
		mov	bx, [si+89h]
		mov	bx, [bx+0Eh]
		mov	ax, es:[bx+41h]
		mov	dx, es:[bx+3Fh]
		mov	word_7C880, ax
		mov	word ptr dword_7C87E, dx

loc_92E15:
		pop	di
		pop	si
		leave
		retf
sub_92C8A		endp

; START OF FUNCTION CHUNK FOR sub_92C8A
word_92E19	dw 6
		dw 15h
		dw 17h
		dw 18h
off_92E21	dw offset loc_92D1F
		dw offset loc_92DA0
		dw offset loc_92DB1
		dw offset loc_92DB1
; END OF FUNCTION CHUNK FOR sub_92C8A

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_92E29		proc far

var_50		= dword ptr -50h
var_4C		= dword ptr -4Ch
var_48		= dword ptr -48h
var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 50h
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+89h], 0
		jnz	short loc_92E3E
		jmp	loc_931DA

loc_92E3E:
		push	word ptr [si+89h]
		mov	bx, [si+89h]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		or	ax, dx
		jz	short loc_92E5F
		push	word ptr [si+89h]
		mov	bx, [si+89h]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		jmp	short loc_92E61

loc_92E5F:
		mov	al, 1Ch

loc_92E61:
		cmp	al, 6
		jnz	short loc_92E75
		mov	bx, [si+89h]
		push	large [bx+5Fh]
		call	sub_3E140
		add	sp, 4

loc_92E75:
		push	2
		push	0
		call	sub_5235
		add	sp, 4
		or	al, al
		jnz	short loc_92E88
		jmp	loc_92F47

loc_92E88:
		push	0
		call	sub_5292
		pop	cx
		neg	ax
		sar	ax, 1
		mov	[bp+var_2], ax
		movsx	eax, [bp+var_2]
		shl	eax, 8
		add	dword_76F6B, eax
		cmp	dword_76F6B, 0
		jge	short loc_92EB2
		mov	ax, 1
		jmp	short loc_92EB4

loc_92EB2:
		xor	ax, ax

loc_92EB4:
		or	al, al
		jz	short loc_92EC1
		add	dword_76F6B, 16800h

loc_92EC1:
		cmp	dword_76F6B, 16800h
		jl	short loc_92ED1
		mov	ax, 1
		jmp	short loc_92ED3

loc_92ED1:
		xor	ax, ax

loc_92ED3:
		or	al, al
		jz	short loc_92EE0
		sub	dword_76F6B, 16800h

loc_92EE0:
		push	0
		call	sub_52A1
		pop	cx
		sar	ax, 1
		mov	[bp+var_4], ax
		movsx	eax, [bp+var_4]
		shl	eax, 8
		add	dword_76F67, eax
		cmp	dword_76F67, 0FFFFA600h
		jge	short loc_92F0B
		mov	ax, 1
		jmp	short loc_92F0D

loc_92F0B:
		xor	ax, ax

loc_92F0D:
		or	al, al
		jz	short loc_92F21
		mov	[bp+var_8], 0FFFFA600h
		mov	eax, [bp+var_8]
		mov	dword_76F67, eax

loc_92F21:
		cmp	dword_76F67, 5A00h
		jle	short loc_92F31
		mov	ax, 1
		jmp	short loc_92F33

loc_92F31:
		xor	ax, ax

loc_92F33:
		or	al, al
		jz	short loc_92F47
		mov	[bp+var_C], 5A00h
		mov	eax, [bp+var_C]
		mov	dword_76F67, eax

loc_92F47:
		cmp	byte_7D32B, 1
		jnz	short loc_92F52
		mov	al, 1
		jmp	short loc_92F54

loc_92F52:
		mov	al, 0

loc_92F54:
		or	al, al
		jz	short loc_92FA9
		mov	di, si
		add	di, 94h
		mov	eax, [si+90h]
		sub	eax, [di]
		mov	[bp+var_10], eax
		mov	[bp+var_14], eax
		mov	ebx, 17h
		cdq
		idiv	ebx
		mov	[bp+var_18], eax
		mov	[bp+var_1C], eax
		add	[si+8Ch], eax
		mov	eax, [si+8Ch]
		cmp	eax, [si+90h]
		jle	short loc_92F97
		mov	ax, 1
		jmp	short loc_92F99

loc_92F97:
		xor	ax, ax

loc_92F99:
		or	al, al
		jz	short loc_93009
		mov	eax, [si+90h]
		mov	[si+8Ch], eax
		jmp	short loc_93009

loc_92FA9:
		cmp	byte_7D32A, 1
		jnz	short loc_92FB4
		mov	al, 1
		jmp	short loc_92FB6

loc_92FB4:
		mov	al, 0

loc_92FB6:
		or	al, al
		jz	short loc_93009
		mov	di, si
		add	di, 94h
		mov	eax, [si+90h]
		sub	eax, [di]
		mov	[bp+var_20], eax
		mov	[bp+var_24], eax
		mov	ebx, 17h
		cdq
		idiv	ebx
		mov	[bp+var_28], eax
		mov	[bp+var_2C], eax
		sub	[si+8Ch], eax
		mov	eax, [si+8Ch]
		cmp	eax, [si+94h]
		jge	short loc_92FF9
		mov	ax, 1
		jmp	short loc_92FFB

loc_92FF9:
		xor	ax, ax

loc_92FFB:
		or	al, al
		jz	short loc_93009
		mov	eax, [si+94h]
		mov	[si+8Ch], eax

loc_93009:
		mov	al, byte_79787
		mov	ah, 0
		or	ax, ax
		jz	short loc_93015
		jmp	loc_930BD

loc_93015:
		mov	al, [si+8Bh]
		mov	ah, 0
		or	ax, ax
		jz	short loc_93022
		jmp	loc_930BD

loc_93022:
		mov	al, byte_7CAC3
		mov	ah, 0
		cmp	ax, word_775E3
		jz	short loc_93034
		mov	al, byte_7CAC3
		mov	ah, 0
		jmp	short loc_93036

loc_93034:
		xor	ax, ax

loc_93036:
		cmp	ax, 40h
		jz	short loc_9303E
		jmp	loc_930BD

loc_9303E:
		mov	bx, [si+89h]
		cmp	byte_7CAC2, 1
		jnz	short loc_93059
		test	byte_7CAC5, 30h
		jz	short loc_93055
		mov	ax, 1
		jmp	short loc_93057

loc_93055:
		xor	ax, ax

loc_93057:
		jmp	short loc_9306E

loc_93059:
		cmp	byte_7D32D, 1
		jz	short loc_93067
		cmp	byte_7D365, 1
		jnz	short loc_9306C

loc_93067:
		mov	ax, 1
		jmp	short loc_9306E

loc_9306C:
		xor	ax, ax

loc_9306E:
		or	al, al
		jz	short loc_9308E
		push	2
		push	large 3A98h
		push	bx
		push	word ptr [si+98h]
		push	67ADh
		call	sub_1E90D
		add	sp, 0Ch
		mov	bx, ax
		jmp	short loc_930A8

loc_9308E:
		push	1
		push	large 3A98h
		push	bx
		push	word ptr [si+98h]
		push	67ADh
		call	sub_1E90D
		add	sp, 0Ch
		mov	bx, ax

loc_930A8:
		or	bx, bx
		jz	short loc_930BD
		push	word_76F6C
		push	word_76F68
		push	bx
		push	si
		push	cs
		call	near ptr sub_9260C
		add	sp, 8

loc_930BD:
		cmp	byte ptr [si+8Bh], 0
		jz	short loc_930CB
		mov	byte ptr [si+8Bh], 0
		jmp	short loc_930D6

loc_930CB:
		push	837h
		push	si
		push	cs
		call	near ptr HUDSymbol_ComputeBearingDisplay_92A17
		add	sp, 4

loc_930D6:
		mov	ax, si
		add	ax, 20h
		push	ax
		call	Matrix_BuildFromAngle_58B3B
		pop	cx
		push	83Bh
		mov	ax, si
		add	ax, 20h
		push	ax
		call	Matrix_BuildAxisZ_59085
		add	sp, 4
		push	837h
		mov	ax, si
		add	ax, 20h
		push	ax
		call	Matrix_BuildAxisX_58C8C
		add	sp, 4
		mov	ax, si
		add	ax, 20h
		push	ax
		call	Matrix_OrthonormalizeKeepRow1_59429
		pop	cx
		mov	eax, [si+2Ch]
		neg	eax
		mov	[bp+var_44], eax
		mov	eax, [si+30h]
		neg	eax
		mov	[bp+var_40], eax
		mov	eax, [si+34h]
		neg	eax
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_44]
		mov	[bp+var_50], eax
		mov	eax, [bp+var_40]
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_3C]
		mov	[bp+var_48], eax
		mov	eax, [bp+var_50]
		mov	[bp+var_38], eax
		mov	eax, [bp+var_4C]
		mov	[bp+var_34], eax
		mov	eax, [bp+var_48]
		mov	[bp+var_30], eax
		mov	di, si
		add	di, 8Ch
		mov	eax, [bp+var_38]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_38], eax
		mov	eax, [bp+var_34]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_34], eax
		mov	eax, [bp+var_30]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_30], eax
		mov	di, [si+89h]
		add	di, 12h
		mov	eax, [di]
		add	[bp+var_38], eax
		mov	eax, [di+4]
		add	[bp+var_34], eax
		mov	eax, [di+8]
		add	[bp+var_30], eax
		mov	eax, [bp+var_38]
		mov	[si+14h], eax
		mov	eax, [bp+var_34]
		mov	[si+18h], eax
		mov	eax, [bp+var_30]
		mov	[si+1Ch], eax
		mov	al, 1
		jmp	short loc_931FC

loc_931DA:
		mov	eax, dword_7976E
		sub	[si+9Ah], eax
		cmp	dword ptr [si+9Ah], 0
		jle	short loc_931F0
		mov	ax, 1
		jmp	short loc_931F2

loc_931F0:
		xor	ax, ax

loc_931F2:
		or	al, al
		jz	short loc_931FA
		mov	al, 1
		jmp	short loc_931FC

loc_931FA:
		mov	al, 0

loc_931FC:
		pop	di
		pop	si
		leave
		retf
sub_92E29		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_93200		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 9
		pop	bp
		retf
sub_93200		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à HUDSymbol_ConstructVariantH_84753 (sub_84753 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; même motif que HUDSymbol_ConstructVariantA_804F0.
; ==============================================================================================
HUDSymbol_ConstructVariantH_9320A		proc far

var_24		= word ptr -24h
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 24h
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_93227
		push	8Dh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_9328D

loc_93227:
		mov	ax, si
		add	ax, 20h
		push	ax
		call	Formation_ComputeGeometryHelper_58B0C
		pop	cx
		mov	word ptr [si+50h], 6D0h
		mov	ax, si
		add	ax, 53h
		push	ax
		call	String_ConstructEmpty
		pop	cx
		push	si
		call	sub_73DDD
		pop	cx
		mov	word ptr [si+50h], 7EEh
		mov	ax, si
		add	ax, 80h
		push	ax
		call	String_ConstructEmpty
		pop	cx
		mov	word ptr [si+89h], 0
		mov	word ptr [si+50h], 83Fh
		mov	word ptr [si+8Bh], 0
		push	large 24h
		push	ss
		lea	ax, [bp+var_24]
		push	ax
		push	[bp+arg_2]
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		lea	ax, [bp+var_24]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr HUDSymbol_ConstructAndInitAngleE_9331A
		add	sp, 4

loc_9328D:
		mov	ax, si
		pop	si
		leave
		retf
HUDSymbol_ConstructVariantH_9320A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à HUDSymbol_ConstructVariantI_847DB (sub_847DB de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; même motif que HUDSymbol_ConstructVariantA_804F0.
; ==============================================================================================
HUDSymbol_ConstructVariantI_93292		proc far

var_24		= word ptr -24h
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 24h
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_932AF
		push	8Dh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_93315

loc_932AF:
		mov	ax, si
		add	ax, 20h
		push	ax
		call	Formation_ComputeGeometryHelper_58B0C
		pop	cx
		mov	word ptr [si+50h], 6D0h
		mov	ax, si
		add	ax, 53h
		push	ax
		call	String_ConstructEmpty
		pop	cx
		push	si
		call	sub_73DDD
		pop	cx
		mov	word ptr [si+50h], 7EEh
		mov	ax, si
		add	ax, 80h
		push	ax
		call	String_ConstructEmpty
		pop	cx
		mov	word ptr [si+89h], 0
		mov	word ptr [si+50h], 83Fh
		mov	word ptr [si+8Bh], 0
		push	24h
		push	large [bp+arg_2]
		push	ss
		lea	ax, [bp+var_24]
		push	ax
		call	sub_37C3
		add	sp, 0Ah
		lea	ax, [bp+var_24]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr HUDSymbol_ConstructAndInitAngleE_9331A
		add	sp, 4

loc_93315:
		mov	ax, si
		pop	si
		leave
		retf
HUDSymbol_ConstructVariantI_93292		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à HUDSymbol_ConstructAndInitAngleE_84863 (sub_84863 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; même motif que HUDSymbol_ConstructAndInitAngle_80701 (sans copie finale de chaîne).
; ==============================================================================================
HUDSymbol_ConstructAndInitAngleE_9331A		proc far

var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_B		= byte ptr -0Bh
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	bx, [bp+arg_2]
		mov	ax, [bx+1Ch]
		mov	[bp+var_2], ax
		mov	ax, [bx+1Eh]
		mov	[bp+var_4], ax
		mov	ax, [bx+20h]
		mov	[bp+var_6], ax
		mov	ax, [bx+22h]
		mov	[bp+var_8], ax
		push	1Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_93387
		mov	word ptr [di], 698h
		mov	word ptr [di+2], 0
		mov	word ptr [di+4], 0
		mov	byte ptr [di+0Fh], 0
		mov	word ptr [di+10h], 0
		mov	word ptr [di+12h], 0
		mov	byte ptr [di+1Dh], 0
		push	[bp+var_8]
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		push	ax
		call	sub_73DB0
		add	sp, 0Ah
		mov	ax, di
		jmp	short loc_93389

loc_93387:
		mov	ax, di

loc_93389:
		mov	[si+5Ch], ax
		sub	sp, 4
		mov	di, [bp+arg_2]
		add	di, 18h
		mov	eax, [di]
		mov	[bp+var_14], eax
		sub	sp, 4
		mov	bx, [bp+arg_2]
		mov	ax, [bx+16h]
		mov	[bp+var_A], ax
		movsx	eax, [bp+var_A]
		shl	eax, 8
		mov	[bp+var_18], eax
		push	large [bx+12h]
		mov	ax, [bp+arg_2]
		add	ax, 0Ah
		push	ax
		push	word ptr [si+5Ch]
		push	si
		call	sub_73512
		add	sp, 12h
		mov	bx, [bp+arg_2]
		mov	al, [bx+8]
		mov	[bp+var_B], al
		and	ax, 1
		and	byte ptr [si+52h], 0FDh
		shl	al, 1
		or	[si+52h], al
		pop	di
		pop	si
		leave
		retf
HUDSymbol_ConstructAndInitAngleE_9331A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à HUDSymbol_ConstructWithContainerOp_8492E (sub_8492E de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine une opération de conteneur et SetReference16 (×2).
; ==============================================================================================
HUDSymbol_ConstructWithContainerOp_933E5		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+89h], 0
		jnz	short loc_93422
		mov	ax, si
		add	ax, 80h
		mov	[bp+var_2], ds
		mov	[bp+var_4], ax
		push	[bp+var_2]
		push	ax
		push	67ADh
		call	Container_Op_1E66D
		add	sp, 6
		mov	[bp+var_6], ax
		push	ax
		mov	ax, si
		add	ax, 89h
		push	ax
		call	SetReference16
		add	sp, 4

loc_93422:
		cmp	word ptr [si+89h], 0
		jz	short loc_93464
		mov	bx, [si+89h]
		les	bx, [bx+5Fh]
		mov	ax, es:[bx+0Eh]
		mov	[bp+var_8], ax
		push	ax
		mov	ax, si
		add	ax, 8Bh
		push	ax
		call	SetReference16
		add	sp, 4
		cmp	word ptr [si+8Bh], 0
		jz	short loc_93464
		push	si
		call	sub_73DF6
		pop	cx
		or	al, al
		jz	short loc_93464
		push	si
		mov	bx, [si+50h]
		call	dword ptr [bx+10h]
		pop	cx
		mov	al, 1
		jmp	short loc_93466

loc_93464:
		mov	al, 0

loc_93466:
		pop	si
		leave
		retf
HUDSymbol_ConstructWithContainerOp_933E5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_93469		proc far

var_10A		= dword ptr -10Ah
var_106		= dword ptr -106h
var_102		= dword ptr -102h
var_FE		= dword ptr -0FEh
var_FA		= dword ptr -0FAh
var_F6		= dword ptr -0F6h
var_F2		= dword ptr -0F2h
var_EE		= dword ptr -0EEh
var_EA		= dword ptr -0EAh
var_E6		= dword ptr -0E6h
var_E2		= dword ptr -0E2h
var_DE		= dword ptr -0DEh
var_DA		= dword ptr -0DAh
var_D6		= dword ptr -0D6h
var_D2		= dword ptr -0D2h
var_CE		= dword ptr -0CEh
var_CA		= dword ptr -0CAh
var_C6		= dword ptr -0C6h
var_C2		= dword ptr -0C2h
var_BE		= dword ptr -0BEh
var_BA		= dword ptr -0BAh
var_B6		= dword ptr -0B6h
var_B2		= dword ptr -0B2h
var_AE		= dword ptr -0AEh
var_AA		= dword ptr -0AAh
var_A6		= dword ptr -0A6h
var_A2		= dword ptr -0A2h
var_9E		= dword ptr -9Eh
var_9A		= dword ptr -9Ah
var_96		= dword ptr -96h
var_92		= dword ptr -92h
var_8E		= dword ptr -8Eh
var_8A		= dword ptr -8Ah
var_86		= dword ptr -86h
var_82		= dword ptr -82h
var_7E		= dword ptr -7Eh
var_7A		= word ptr -7Ah
var_78		= word ptr -78h
var_76		= word ptr -76h
var_74		= dword ptr -74h
var_70		= dword ptr -70h
var_6C		= dword ptr -6Ch
var_68		= dword ptr -68h
var_64		= dword ptr -64h
var_60		= dword ptr -60h
var_5C		= dword ptr -5Ch
var_58		= dword ptr -58h
var_54		= dword ptr -54h
var_50		= dword ptr -50h
var_4C		= dword ptr -4Ch
var_48		= dword ptr -48h
var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 10Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+89h], 0
		jnz	short loc_9347F
		jmp	loc_9387B

loc_9347F:
		cmp	word ptr [si+8Bh], 0
		jnz	short loc_93489
		jmp	loc_9387B

loc_93489:
		mov	di, [si+89h]
		add	di, 20h
		mov	eax, [di]
		mov	[bp+var_4], eax
		mov	di, [si+8Bh]
		add	di, 12h
		mov	cx, [si+89h]
		add	cx, 12h
		mov	eax, [di]
		mov	bx, cx
		sub	eax, [bx]
		mov	[bp+var_92], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp+var_8E], eax
		mov	eax, [di+8]
		sub	eax, [bx+8]
		mov	[bp+var_8A], eax
		mov	eax, [bp+var_92]
		mov	[bp+var_86], eax
		mov	eax, [bp+var_8E]
		mov	[bp+var_82], eax
		mov	eax, [bp+var_8A]
		mov	[bp+var_7E], eax
		lea	ax, word ptr [bp+var_86]
		push	ax
		mov	ax, si
		add	ax, 20h
		push	ax
		call	sub_59B77
		add	sp, 4
		mov	di, si
		add	di, 20h
		mov	eax, [di]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_C], eax
		mov	eax, [di+4]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_14], eax
		mov	eax, [di+8]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_AA], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_A6], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_A2], eax
		mov	[bp+var_20], 80h
		mov	eax, [bp+var_AA]
		mov	edx, [bp+var_20]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_24], eax
		mov	eax, [bp+var_24]
		mov	[bp+var_28], eax
		mov	eax, [bp+var_A6]
		mov	edx, [bp+var_20]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_2C]
		mov	[bp+var_30], eax
		mov	eax, [bp+var_A2]
		mov	edx, [bp+var_20]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_34], eax
		mov	eax, [bp+var_34]
		mov	[bp+var_38], eax
		mov	eax, [bp+var_28]
		mov	[bp+var_9E], eax
		mov	eax, [bp+var_30]
		mov	[bp+var_9A], eax
		mov	eax, [bp+var_38]
		mov	[bp+var_96], eax
		mov	eax, [bp+var_4]
		neg	eax
		mov	[bp+var_3C], eax
		mov	[bp+var_40], eax
		mov	di, si
		add	di, 2Ch
		mov	eax, [di]
		mov	edx, [bp+var_40]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_44], eax
		mov	eax, [bp+var_44]
		mov	[bp+var_48], eax
		mov	eax, [di+4]
		mov	edx, [bp+var_40]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_4C]
		mov	[bp+var_50], eax
		mov	eax, [di+8]
		mov	edx, [bp+var_40]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_54], eax
		mov	eax, [bp+var_54]
		mov	[bp+var_58], eax
		mov	eax, [bp+var_48]
		mov	[bp+var_C2], eax
		mov	eax, [bp+var_50]
		mov	[bp+var_BE], eax
		mov	eax, [bp+var_58]
		mov	[bp+var_BA], eax
		mov	[bp+var_5C], 1CCh
		mov	eax, [bp+var_C2]
		mov	edx, [bp+var_5C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_60], eax
		mov	eax, [bp+var_60]
		mov	[bp+var_64], eax
		mov	eax, [bp+var_BE]
		mov	edx, [bp+var_5C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_68], eax
		mov	eax, [bp+var_68]
		mov	[bp+var_6C], eax
		mov	eax, [bp+var_BA]
		mov	edx, [bp+var_5C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_70], eax
		mov	eax, [bp+var_70]
		mov	[bp+var_74], eax
		mov	eax, [bp+var_64]
		mov	[bp+var_B6], eax
		mov	eax, [bp+var_6C]
		mov	[bp+var_B2], eax
		mov	eax, [bp+var_74]
		mov	[bp+var_AE], eax
		mov	eax, [bp+var_B6]
		add	eax, [bp+var_9E]
		mov	[bp+var_DA], eax
		mov	eax, [bp+var_B2]
		add	eax, [bp+var_9A]
		mov	[bp+var_D6], eax
		mov	eax, [bp+var_AE]
		add	eax, [bp+var_96]
		mov	[bp+var_D2], eax
		mov	eax, [bp+var_DA]
		mov	[bp+var_CE], eax
		mov	eax, [bp+var_D6]
		mov	[bp+var_CA], eax
		mov	eax, [bp+var_D2]
		mov	[bp+var_C6], eax
		lea	ax, word ptr [bp+var_CE]
		push	ax
		push	word ptr [si+89h]
		push	si
		call	sub_2CADA
		add	sp, 6
		mov	di, [si+89h]
		add	di, 12h
		mov	eax, [di]
		add	eax, [bp+var_CE]
		mov	[bp+var_E6], eax
		mov	eax, [di+4]
		add	eax, [bp+var_CA]
		mov	[bp+var_E2], eax
		mov	eax, [di+8]
		add	eax, [bp+var_C6]
		mov	[bp+var_DE], eax
		mov	eax, [bp+var_E6]
		mov	[bp+var_F2], eax
		mov	eax, [bp+var_E2]
		mov	[bp+var_EE], eax
		mov	eax, [bp+var_DE]
		mov	[bp+var_EA], eax
		mov	eax, [bp+var_F2]
		mov	[si+14h], eax
		mov	eax, [bp+var_EE]
		mov	[si+18h], eax
		mov	eax, [bp+var_EA]
		mov	[si+1Ch], eax
		mov	di, [si+8Bh]
		add	di, 12h
		mov	cx, si
		add	cx, 14h
		mov	eax, [di]
		mov	bx, cx
		sub	eax, [bx]
		mov	[bp+var_FE], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp+var_FA], eax
		mov	eax, [di+8]
		sub	eax, [bx+8]
		mov	[bp+var_F6], eax
		mov	eax, [bp+var_FE]
		mov	[bp+var_10A], eax
		mov	eax, [bp+var_FA]
		mov	[bp+var_106], eax
		mov	eax, [bp+var_F6]
		mov	[bp+var_102], eax
		mov	eax, [bp+var_10A]
		mov	[bp+var_86], eax
		mov	eax, [bp+var_106]
		mov	[bp+var_82], eax
		mov	eax, [bp+var_102]
		mov	[bp+var_7E], eax
		lea	ax, word ptr [bp+var_86]
		push	ax
		mov	ax, si
		add	ax, 20h
		push	ax
		call	sub_59B77
		add	sp, 4
		mov	al, byte_7CAC3
		mov	ah, 0
		cmp	ax, word_775E3
		jz	short loc_9383E
		mov	al, byte_7CAC3
		mov	ah, 0
		jmp	short loc_93840

loc_9383E:
		xor	ax, ax

loc_93840:
		cmp	ax, 42h
		jnz	short loc_93877
		mov	ax, [si+89h]
		mov	[bp+var_76], ax
		mov	ax, [si+8Bh]
		mov	[bp+var_78], ax
		push	ax
		mov	ax, si
		add	ax, 89h
		push	ax
		call	SetReference16
		add	sp, 4
		mov	ax, [bp+var_76]
		mov	[bp+var_7A], ax
		push	ax
		mov	ax, si
		add	ax, 8Bh
		push	ax
		call	SetReference16
		add	sp, 4

loc_93877:
		mov	al, 1
		jmp	short loc_9387D

loc_9387B:
		mov	al, 0

loc_9387D:
		pop	di
		pop	si
		leave
		retf
sub_93469		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_93881		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 0Ah
		pop	bp
		retf
sub_93881		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9388B		proc far
		push	bp
		mov	bp, sp
		mov	dword_76F67, 0
		mov	dword_76F6B, 0
		pop	bp
		retf
sub_9388B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_938A2		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_938E5
		mov	ax, si
		add	ax, 8Bh
		push	ax
		call	WeakRef_InvalidateIfSet
		pop	cx
		mov	ax, si
		add	ax, 89h
		push	ax
		call	WeakRef_InvalidateIfSet
		pop	cx
		push	0
		push	si
		call	sub_73E05
		add	sp, 4
		test	di, 1
		jz	short loc_938E3
		push	si
		call	sub_3B2
		pop	cx
		jmp	short loc_938E5

loc_938E3:
		jmp	short loc_938E5

loc_938E5:
		pop	di
		pop	si
		pop	bp
		retf
sub_938A2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_938E9		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_93920
		mov	ax, si
		add	ax, 89h
		push	ax
		call	WeakRef_InvalidateIfSet
		pop	cx
		push	0
		push	si
		call	sub_73E05
		add	sp, 4
		test	di, 1
		jz	short loc_9391E
		push	si
		call	sub_3B2
		pop	cx
		jmp	short loc_93920

loc_9391E:
		jmp	short loc_93920

loc_93920:
		pop	di
		pop	si
		pop	bp
		retf
sub_938E9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_93924		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_93967
		mov	ax, si
		add	ax, 8Bh
		push	ax
		call	WeakRef_InvalidateIfSet
		pop	cx
		mov	ax, si
		add	ax, 89h
		push	ax
		call	WeakRef_InvalidateIfSet
		pop	cx
		push	0
		push	si
		call	sub_73E05
		add	sp, 4
		test	di, 1
		jz	short loc_93965
		push	si
		call	sub_3B2
		pop	cx
		jmp	short loc_93967

loc_93965:
		jmp	short loc_93967

loc_93967:
		pop	di
		pop	si
		pop	bp
		retf
sub_93924		endp
ovr250		ends

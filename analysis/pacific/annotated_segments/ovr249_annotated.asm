ovr249		segment	para public 'OVERLAY' use16
		assume cs:ovr249
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à HUDSymbol_ConstructVariantA_804F0 (sub_804F0 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; alloue (CRT_Malloc16_Retry), combine Formation_ComputeGeometryHelper_56D43 (seg116) et
; String_ConstructEmpty — premier d'une famille de constructeurs de symboles HUD très
; similaires (voir aussi ovr244).
; ==============================================================================================
HUDSymbol_ConstructVariantA_8ED30		proc far

var_84		= word ptr -84h
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 84h
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_8ED51
		push	142h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_8ED51
		jmp	loc_8EE33

loc_8ED51:
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
		mov	word ptr [si+98h], 0
		mov	word ptr [si+50h], 7CAh
		mov	word ptr [si+9Fh], 0
		mov	word ptr [si+0A1h], 0
		mov	ax, si
		add	ax, 0A4h
		mov	ax, si
		add	ax, 0B0h
		mov	ax, si
		add	ax, 0BCh
		mov	ax, si
		add	ax, 0C0h
		mov	ax, si
		add	ax, 0C4h
		mov	ax, si
		add	ax, 0D0h
		mov	ax, si
		add	ax, 0DCh
		mov	ax, si
		add	ax, 0E8h
		mov	ax, si
		add	ax, 0F4h
		mov	ax, si
		add	ax, 100h
		mov	ax, si
		add	ax, 104h
		mov	ax, si
		add	ax, 108h
		mov	ax, si
		add	ax, 10Dh
		mov	ax, si
		add	ax, 119h
		mov	ax, si
		add	ax, 125h
		mov	ax, si
		add	ax, 129h
		mov	ax, si
		add	ax, 12Dh
		mov	ax, si
		add	ax, 131h
		mov	ax, si
		add	ax, 135h
		mov	ax, si
		add	ax, 139h
		mov	ax, si
		add	ax, 13Dh
		push	large 24h
		push	ss
		lea	ax, [bp+var_84]
		push	ax
		push	[bp+arg_2]
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		lea	ax, [bp+var_84]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr HUDSymbol_ConstructAndInitAngle_8EF41
		add	sp, 4

loc_8EE33:
		mov	ax, si
		pop	si
		leave
		retf
HUDSymbol_ConstructVariantA_8ED30		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à HUDSymbol_ConstructVariantB_805F8 (sub_805F8 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; même motif que HUDSymbol_ConstructVariantA_804F0 (variante de symbole HUD).
; ==============================================================================================
HUDSymbol_ConstructVariantB_8EE38		proc far

var_84		= word ptr -84h
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 84h
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_8EE59
		push	142h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_8EE59
		jmp	loc_8EF3C

loc_8EE59:
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
		mov	word ptr [si+98h], 0
		mov	word ptr [si+50h], 7CAh
		mov	word ptr [si+9Fh], 0
		mov	word ptr [si+0A1h], 0
		mov	ax, si
		add	ax, 0A4h
		mov	ax, si
		add	ax, 0B0h
		mov	ax, si
		add	ax, 0BCh
		mov	ax, si
		add	ax, 0C0h
		mov	ax, si
		add	ax, 0C4h
		mov	ax, si
		add	ax, 0D0h
		mov	ax, si
		add	ax, 0DCh
		mov	ax, si
		add	ax, 0E8h
		mov	ax, si
		add	ax, 0F4h
		mov	ax, si
		add	ax, 100h
		mov	ax, si
		add	ax, 104h
		mov	ax, si
		add	ax, 108h
		mov	ax, si
		add	ax, 10Dh
		mov	ax, si
		add	ax, 119h
		mov	ax, si
		add	ax, 125h
		mov	ax, si
		add	ax, 129h
		mov	ax, si
		add	ax, 12Dh
		mov	ax, si
		add	ax, 131h
		mov	ax, si
		add	ax, 135h
		mov	ax, si
		add	ax, 139h
		mov	ax, si
		add	ax, 13Dh
		push	84h
		push	large [bp+arg_2]
		push	ss
		lea	ax, [bp+var_84]
		push	ax
		call	sub_37C3
		add	sp, 0Ah
		lea	ax, [bp+var_84]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr HUDSymbol_ConstructAndInitAngle_8EF41
		add	sp, 4

loc_8EF3C:
		mov	ax, si
		pop	si
		leave
		retf
HUDSymbol_ConstructVariantB_8EE38		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à HUDSymbol_ConstructAndInitAngle_80701 (sub_80701 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 191 lignes, NON DÉTAILLÉE — combine allocation, copie de chaîne, Math_Tan_548AD (seg115).
; ==============================================================================================
HUDSymbol_ConstructAndInitAngle_8EF41		proc far

var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_18		= dword ptr -18h
var_14		= word ptr -14h
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
		sub	sp, 18h
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
		jz	short loc_8EFB3
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
		jmp	short loc_8EFB6

loc_8EFB3:
		mov	ax, [bp+var_A]

loc_8EFB6:
		mov	[si+5Ch], ax
		sub	sp, 4
		mov	ax, di
		add	ax, 18h
		mov	[bp+var_C], ax
		mov	bx, [bp+var_C]
		mov	eax, [bx]
		mov	[bp+var_20], eax
		sub	sp, 4
		mov	ax, [di+16h]
		mov	[bp+var_E], ax
		movsx	eax, [bp+var_E]
		shl	eax, 8
		mov	[bp+var_24], eax
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
		mov	cx, di
		add	cx, 24h
		mov	bx, cx
		mov	eax, [bx]
		mov	[si+0A4h], eax
		mov	eax, [bx+4]
		mov	[si+0A8h], eax
		mov	eax, [bx+8]
		mov	[si+0ACh], eax
		mov	cx, di
		add	cx, 30h
		mov	bx, cx
		mov	eax, [bx]
		mov	[si+0B0h], eax
		mov	eax, [bx+4]
		mov	[si+0B4h], eax
		mov	eax, [bx+8]
		mov	[si+0B8h], eax
		mov	eax, [di+3Ch]
		mov	[si+0BCh], eax
		mov	cx, di
		add	cx, 40h
		mov	bx, cx
		mov	eax, [bx]
		mov	[si+0C4h], eax
		mov	eax, [bx+4]
		mov	[si+0C8h], eax
		mov	eax, [bx+8]
		mov	[si+0CCh], eax
		mov	cx, di
		add	cx, 4Ch
		mov	bx, cx
		mov	eax, [bx]
		mov	[si+0D0h], eax
		mov	eax, [bx+4]
		mov	[si+0D4h], eax
		mov	eax, [bx+8]
		mov	[si+0D8h], eax
		mov	eax, [di+58h]
		mov	[si+125h], eax
		mov	eax, [di+5Ch]
		mov	[si+129h], eax
		mov	eax, [di+60h]
		mov	[si+12Dh], eax
		mov	eax, [di+64h]
		mov	[si+131h], eax
		mov	ax, si
		add	ax, 60h
		mov	[bp+var_14], ax
		mov	eax, [si+131h]
		mov	bx, [bp+var_14]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+131h], eax
		mov	ax, si
		add	ax, 131h
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_18]
		push	ax
		call	Math_Tan_566DA
		add	sp, 6
		mov	eax, [bp+var_18]
		mov	[si+135h], eax
		mov	eax, [di+68h]
		mov	[si+100h], eax
		mov	eax, [di+6Ch]
		mov	[si+104h], eax
		mov	eax, [di+70h]
		mov	[si+108h], eax
		mov	cx, di
		add	cx, 74h
		mov	bx, cx
		mov	eax, [bx]
		mov	[si+0DCh], eax
		mov	eax, [bx+4]
		mov	[si+0E0h], eax
		mov	eax, [bx+8]
		mov	[si+0E4h], eax
		mov	eax, [di+80h]
		mov	[si+139h], eax
		mov	byte ptr [si+0A3h], 7
		pop	di
		pop	si
		leave
		retf
HUDSymbol_ConstructAndInitAngle_8EF41		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à HUDSymbol_Helper_80922
; (sub_80922 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, thunk voisin uniquement (28 lignes).
; ==============================================================================================
HUDSymbol_Helper_8F162		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+9Fh], 0
		jz	short loc_8F186
		cmp	word ptr [si+89h], 0
		jz	short loc_8F186
		push	si
		call	sub_73DF6
		pop	cx
		push	si
		mov	bx, [si+50h]
		call	dword ptr [bx+10h]
		pop	cx

loc_8F186:
		mov	al, [si+52h]
		and	ax, 1
		pop	si
		pop	bp
		retf
HUDSymbol_Helper_8F162		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à HUDSymbol_Helper2_8094F
; (sub_8094F de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, thunk voisin uniquement (18 lignes).
; ==============================================================================================
HUDSymbol_Helper2_8F18F		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	dx, [bp+arg_0]
		mov	[bp+var_4], 100h
		mov	eax, [bp+var_4]
		mov	dword_7977E, eax
		push	dx
		call	sub_73DFB
		pop	cx
		leave
		retf
HUDSymbol_Helper2_8F18F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8F1B1		proc far

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
		sub	sp, 48h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [si+9Fh]
		add	di, 12h
		mov	eax, [di]
		mov	[si+14h], eax
		mov	eax, [di+4]
		mov	[si+18h], eax
		mov	eax, [di+8]
		mov	[si+1Ch], eax
		mov	di, si
		add	di, 0E8h
		mov	eax, [di]
		mov	[bp+var_30], eax
		mov	eax, [di+4]
		mov	[bp+var_2C], eax
		mov	eax, [di+8]
		mov	[bp+var_28], eax
		push	word ptr [si+9Fh]
		mov	bx, [si+9Fh]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		lea	ax, word ptr [bp+var_30]
		push	ax
		call	sub_5A629
		add	sp, 4
		mov	eax, [bp+var_30]
		add	[si+14h], eax
		mov	eax, [bp+var_2C]
		add	[si+18h], eax
		mov	eax, [bp+var_28]
		add	[si+1Ch], eax
		mov	di, [si+89h]
		add	di, 12h
		mov	cx, si
		add	cx, 14h
		mov	eax, [di]
		mov	bx, cx
		sub	eax, [bx]
		mov	[bp+var_3C], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp+var_38], eax
		mov	eax, [di+8]
		sub	eax, [bx+8]
		mov	[bp+var_34], eax
		mov	eax, [bp+var_3C]
		mov	[bp+var_48], eax
		mov	eax, [bp+var_38]
		mov	[bp+var_44], eax
		mov	eax, [bp+var_34]
		mov	[bp+var_40], eax
		mov	eax, [bp+var_48]
		mov	[bp+var_24], eax
		mov	eax, [bp+var_44]
		mov	[bp+var_20], eax
		mov	eax, [bp+var_40]
		mov	[bp+var_1C], eax
		cmp	dword ptr [si+0C0h], 0
		jle	short loc_8F297
		mov	ax, 1
		jmp	short loc_8F299

loc_8F297:
		xor	ax, ax

loc_8F299:
		or	al, al
		jz	short loc_8F2BB
		lea	ax, word ptr [bp+var_24]
		push	ax
		mov	ax, si
		add	ax, 20h
		push	ax
		call	sub_59B77
		add	sp, 4
		mov	eax, dword_7976E
		sub	[si+0C0h], eax
		jmp	loc_8F39B

loc_8F2BB:
		mov	al, [si+9Eh]
		mov	ah, 0
		cmp	ax, 9
		jz	short loc_8F2CB
		cmp	ax, 1Ah
		jnz	short loc_8F326

loc_8F2CB:
		mov	di, si
		add	di, 0D0h
		mov	eax, [di]
		mov	[si+0E8h], eax
		mov	eax, [di+4]
		mov	[si+0ECh], eax
		mov	eax, [di+8]
		mov	[si+0F0h], eax
		mov	bx, [si+89h]
		mov	eax, [bx+20h]
		shl	eax, 3
		mov	[bp+var_4], eax
		mov	[bp+var_8], eax
		mov	[si+8Ch], eax
		mov	eax, [bp+var_24]
		mov	[si+0F4h], eax
		mov	eax, [bp+var_20]
		mov	[si+0F8h], eax
		mov	eax, [bp+var_1C]
		mov	[si+0FCh], eax
		mov	byte ptr [si+0A3h], 2
		jmp	short loc_8F39B

loc_8F326:
		mov	di, si
		add	di, 0C4h
		mov	eax, [di]
		mov	[si+0E8h], eax
		mov	eax, [di+4]
		mov	[si+0ECh], eax
		mov	eax, [di+8]
		mov	[si+0F0h], eax
		mov	di, si
		add	di, 100h
		mov	bx, [si+89h]
		mov	eax, [bx+20h]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_10], eax
		mov	[si+8Ch], eax
		mov	di, si
		add	di, 104h
		mov	eax, [bx+20h]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_18], eax
		mov	[si+90h], eax
		mov	byte ptr [si+0A3h], 1

loc_8F39B:
		pop	di
		pop	si
		leave
		retf
sub_8F1B1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8F39F		proc far

var_1CC		= dword ptr -1CCh
var_1C8		= dword ptr -1C8h
var_1C4		= dword ptr -1C4h
var_1C0		= dword ptr -1C0h
var_1BC		= dword ptr -1BCh
var_1B8		= dword ptr -1B8h
var_1B4		= dword ptr -1B4h
var_1B0		= dword ptr -1B0h
var_1AC		= dword ptr -1ACh
var_1A8		= dword ptr -1A8h
var_1A4		= dword ptr -1A4h
var_1A0		= dword ptr -1A0h
var_19C		= dword ptr -19Ch
var_198		= dword ptr -198h
var_194		= dword ptr -194h
var_190		= dword ptr -190h
var_18C		= dword ptr -18Ch
var_188		= dword ptr -188h
var_184		= dword ptr -184h
var_180		= dword ptr -180h
var_17C		= dword ptr -17Ch
var_178		= dword ptr -178h
var_174		= dword ptr -174h
var_170		= dword ptr -170h
var_16C		= dword ptr -16Ch
var_168		= dword ptr -168h
var_164		= dword ptr -164h
var_160		= dword ptr -160h
var_15C		= dword ptr -15Ch
var_158		= dword ptr -158h
var_154		= dword ptr -154h
var_150		= dword ptr -150h
var_14C		= dword ptr -14Ch
var_148		= dword ptr -148h
var_144		= dword ptr -144h
var_140		= dword ptr -140h
var_13C		= dword ptr -13Ch
var_138		= dword ptr -138h
var_134		= dword ptr -134h
var_130		= dword ptr -130h
var_12C		= dword ptr -12Ch
var_128		= dword ptr -128h
var_124		= dword ptr -124h
var_120		= dword ptr -120h
var_11C		= dword ptr -11Ch
var_118		= dword ptr -118h
var_114		= dword ptr -114h
var_110		= dword ptr -110h
var_10C		= dword ptr -10Ch
var_108		= dword ptr -108h
var_104		= dword ptr -104h
var_100		= dword ptr -100h
var_FC		= dword ptr -0FCh
var_F8		= dword ptr -0F8h
var_F4		= dword ptr -0F4h
var_F0		= dword ptr -0F0h
var_EC		= dword ptr -0ECh
var_E8		= word ptr -0E8h
var_C4		= dword ptr -0C4h
var_C0		= dword ptr -0C0h
var_BC		= dword ptr -0BCh
var_B8		= dword ptr -0B8h
var_B4		= dword ptr -0B4h
var_B0		= dword ptr -0B0h
var_AC		= dword ptr -0ACh
var_A8		= dword ptr -0A8h
var_A4		= dword ptr -0A4h
var_A0		= dword ptr -0A0h
var_9C		= dword ptr -9Ch
var_98		= dword ptr -98h
var_94		= word ptr -94h
var_92		= dword ptr -92h
var_8E		= dword ptr -8Eh
var_8A		= dword ptr -8Ah
var_86		= dword ptr -86h
var_82		= dword ptr -82h
var_7E		= dword ptr -7Eh
var_7A		= word ptr -7Ah
var_78		= dword ptr -78h
var_74		= dword ptr -74h
var_70		= word ptr -70h
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
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
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
		sub	sp, 1CCh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, si
		add	di, 0C4h
		mov	eax, [di]
		mov	[bp+var_B8], eax
		mov	eax, [di+4]
		mov	[bp+var_B4], eax
		mov	eax, [di+8]
		mov	[bp+var_B0], eax
		mov	di, si
		add	di, 8Ch
		mov	eax, [bp+var_B8]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_B8], eax
		mov	eax, [bp+var_B4]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_B4], eax
		mov	eax, [bp+var_B0]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_B0], eax
		push	word ptr [si+89h]
		mov	bx, [si+89h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	di, ax
		mov	eax, [di]
		mov	[bp+var_C4], eax
		mov	eax, [di+4]
		mov	[bp+var_C0], eax
		mov	eax, [di+8]
		mov	[bp+var_BC], eax
		lea	ax, [bp+var_E8]
		push	ax
		call	Formation_ComputeGeometryHelper_58B0C
		pop	cx
		lea	ax, word ptr [bp+var_C4]
		push	ax
		lea	ax, [bp+var_E8]
		push	ax
		call	sub_59B77
		add	sp, 4
		lea	ax, [bp+var_E8]
		push	ax
		lea	ax, word ptr [bp+var_B8]
		push	ax
		call	sub_5A629
		add	sp, 4
		lea	ax, word ptr [bp+var_B8]
		push	ax
		push	word ptr [si+89h]
		push	si
		call	sub_2CADA
		add	sp, 6
		mov	di, [si+89h]
		add	di, 12h
		mov	eax, [di]
		add	[bp+var_B8], eax
		mov	eax, [di+4]
		add	[bp+var_B4], eax
		mov	eax, [di+8]
		add	[bp+var_B0], eax
		mov	di, si
		add	di, 14h
		mov	eax, [bp+var_B8]
		sub	eax, [di]
		mov	[bp+var_100], eax
		mov	eax, [bp+var_B4]
		sub	eax, [di+4]
		mov	[bp+var_FC], eax
		mov	eax, [bp+var_B0]
		sub	eax, [di+8]
		mov	[bp+var_F8], eax
		mov	eax, [bp+var_100]
		mov	[bp+var_F4], eax
		mov	eax, [bp+var_FC]
		mov	[bp+var_F0], eax
		mov	eax, [bp+var_F8]
		mov	[bp+var_EC], eax
		mov	di, si
		add	di, 125h
		mov	eax, [bp+var_F4]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_F4], eax
		mov	eax, [bp+var_F0]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_F0], eax
		mov	eax, [bp+var_EC]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_EC], eax
		mov	eax, [bp+var_F4]
		add	[si+14h], eax
		mov	eax, [bp+var_F0]
		add	[si+18h], eax
		mov	eax, [bp+var_EC]
		add	[si+1Ch], eax
		mov	di, [si+89h]
		add	di, 12h
		mov	ax, si
		add	ax, 119h
		mov	[bp+var_2], ax
		mov	eax, [di]
		mov	bx, [bp+var_2]
		add	eax, [bx]
		mov	[bp+var_118], eax
		mov	eax, [di+4]
		add	eax, [bx+4]
		mov	[bp+var_114], eax
		mov	eax, [di+8]
		add	eax, [bx+8]
		mov	[bp+var_110], eax
		mov	eax, [bp+var_118]
		mov	[bp+var_124], eax
		mov	eax, [bp+var_114]
		mov	[bp+var_120], eax
		mov	eax, [bp+var_110]
		mov	[bp+var_11C], eax
		mov	di, si
		add	di, 14h
		mov	eax, [bp+var_124]
		sub	eax, [di]
		mov	[bp+var_130], eax
		mov	eax, [bp+var_120]
		sub	eax, [di+4]
		mov	[bp+var_12C], eax
		mov	eax, [bp+var_11C]
		sub	eax, [di+8]
		mov	[bp+var_128], eax
		mov	eax, [bp+var_130]
		mov	[bp+var_10C], eax
		mov	eax, [bp+var_12C]
		mov	[bp+var_108], eax
		mov	eax, [bp+var_128]
		mov	[bp+var_104], eax
		mov	di, si
		add	di, 2Ch
		push	eax
		push	large [bp+var_108]
		push	large [bp+var_10C]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
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
		mov	[bp+var_148], eax
		mov	eax, [bp+var_1A]
		mov	[bp+var_144], eax
		mov	eax, [bp+var_22]
		mov	[bp+var_140], eax
		mov	di, si
		add	di, 12Dh
		mov	eax, [bp+var_10C]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_26], eax
		mov	eax, [bp+var_26]
		mov	[bp+var_2A], eax
		mov	eax, [bp+var_108]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_2E], eax
		mov	eax, [bp+var_2E]
		mov	[bp+var_32], eax
		mov	eax, [bp+var_104]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_36], eax
		mov	eax, [bp+var_36]
		mov	[bp+var_3A], eax
		mov	eax, [bp+var_2A]
		mov	[bp+var_154], eax
		mov	eax, [bp+var_32]
		mov	[bp+var_150], eax
		mov	eax, [bp+var_3A]
		mov	[bp+var_14C], eax
		mov	eax, [bp+var_148]
		add	eax, [bp+var_154]
		mov	[bp+var_160], eax
		mov	eax, [bp+var_144]
		add	eax, [bp+var_150]
		mov	[bp+var_15C], eax
		mov	eax, [bp+var_140]
		add	eax, [bp+var_14C]
		mov	[bp+var_158], eax
		mov	eax, [bp+var_160]
		mov	[bp+var_13C], eax
		mov	eax, [bp+var_15C]
		mov	[bp+var_138], eax
		mov	eax, [bp+var_158]
		mov	[bp+var_134], eax
		lea	ax, word ptr [bp+var_10C]
		push	ax
		lea	ax, word ptr [bp+var_13C]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_3E]
		push	ax
		call	sub_578DF
		add	sp, 8
		mov	eax, [si+131h]
		cmp	eax, [bp+var_3E]
		jge	short loc_8F78A
		mov	ax, 1
		jmp	short loc_8F78C

loc_8F78A:
		xor	ax, ax

loc_8F78C:
		or	al, al
		jnz	short loc_8F793
		jmp	loc_8F867

loc_8F793:
		mov	eax, [bp+var_13C]
		sub	eax, [bp+var_10C]
		mov	[bp+var_178], eax
		mov	eax, [bp+var_138]
		sub	eax, [bp+var_108]
		mov	[bp+var_174], eax
		mov	eax, [bp+var_134]
		sub	eax, [bp+var_104]
		mov	[bp+var_170], eax
		mov	eax, [bp+var_178]
		mov	[bp+var_16C], eax
		mov	eax, [bp+var_174]
		mov	[bp+var_168], eax
		mov	eax, [bp+var_170]
		mov	[bp+var_164], eax
		push	large [bp+var_104]
		push	large [bp+var_108]
		push	large [bp+var_10C]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_46], eax
		mov	[bp+var_42], eax
		mov	di, si
		add	di, 135h
		mov	eax, [bp+var_42]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_42], eax
		mov	eax, [bp+var_16C]
		mov	[bp+var_13C], eax
		mov	eax, [bp+var_168]
		mov	[bp+var_138], eax
		mov	eax, [bp+var_164]
		mov	[bp+var_134], eax
		lea	ax, word ptr [bp+var_42]
		push	ax
		lea	ax, word ptr [bp+var_13C]
		push	ax
		call	Vector_SetLength_57879
		add	sp, 4
		mov	eax, [bp+var_10C]
		add	[bp+var_13C], eax
		mov	eax, [bp+var_108]
		add	[bp+var_138], eax
		mov	eax, [bp+var_104]
		add	[bp+var_134], eax

loc_8F867:
		lea	ax, word ptr [bp+var_13C]
		push	ax
		mov	ax, si
		add	ax, 20h
		push	ax
		call	sub_59B77
		add	sp, 4
		cmp	word ptr [si+0A1h], 0
		jnz	short loc_8F884
		jmp	loc_8FC90

loc_8F884:
		mov	di, [si+0A1h]
		add	di, 12h
		mov	eax, [di]
		mov	[bp+var_16C], eax
		mov	eax, [di+4]
		mov	[bp+var_168], eax
		mov	eax, [di+8]
		mov	[bp+var_164], eax
		mov	di, [si+89h]
		add	di, 12h
		mov	eax, [di]
		mov	[bp+var_178], eax
		mov	eax, [di+4]
		mov	[bp+var_174], eax
		mov	eax, [di+8]
		mov	[bp+var_170], eax
		mov	eax, [bp+var_16C]
		sub	[bp+var_178], eax
		mov	eax, [bp+var_168]
		sub	[bp+var_174], eax
		mov	eax, [bp+var_164]
		sub	[bp+var_170], eax
		push	word ptr [si+0A1h]
		push	ss
		lea	ax, word ptr [bp+var_184]
		push	ax
		mov	bx, [si+0A1h]
		mov	bx, [bx]
		call	dword ptr [bx+50h]
		add	sp, 6
		lea	ax, word ptr [bp+var_178]
		push	ax
		lea	ax, word ptr [bp+var_184]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_190]
		push	ax
		call	Targeting_ComputeGeometryHelperB_56FBA
		add	sp, 8
		mov	eax, [bp+var_190]
		mov	[bp+var_184], eax
		mov	eax, [bp+var_18C]
		mov	[bp+var_180], eax
		mov	eax, [bp+var_188]
		mov	[bp+var_17C], eax
		lea	ax, word ptr [bp+var_178]
		push	ax
		mov	ax, si
		add	ax, 119h
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_19C]
		push	ax
		call	Targeting_ComputeGeometryHelperB_56FBA
		add	sp, 8
		mov	eax, [bp+var_19C]
		sub	[bp+var_184], eax
		mov	eax, [bp+var_198]
		sub	[bp+var_180], eax
		mov	eax, [bp+var_194]
		sub	[bp+var_17C], eax
		push	large [bp+var_17C]
		push	large [bp+var_180]
		push	large [bp+var_184]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_46], eax
		mov	[bp+var_42], eax
		push	large [bp+var_170]
		push	large [bp+var_174]
		push	large [bp+var_178]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_4E], eax
		mov	[bp+var_4A], eax
		mov	di, si
		add	di, 104h
		mov	bx, [si+0A1h]
		mov	eax, [bx+20h]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_5A], eax
		mov	eax, [bp+var_5A]
		mov	[bp+var_56], eax
		cmp	[bp+var_42], 0
		jle	short loc_8F9DE
		mov	ax, 1
		jmp	short loc_8F9E0

loc_8F9DE:
		xor	ax, ax

loc_8F9E0:
		or	al, al
		jz	short loc_8FA0C
		mov	eax, [bp+var_4A]
		mov	edx, eax
		mov	ecx, [bp+var_42]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_5E], eax
		mov	eax, [bp+var_5E]
		mov	[bp+var_62], eax
		mov	[bp+var_52], eax
		jmp	short loc_8FA1C

loc_8FA0C:
		mov	[bp+var_66], 138800h
		mov	eax, [bp+var_66]
		mov	[bp+var_52], eax

loc_8FA1C:
		mov	eax, [si+108h]
		cmp	eax, [bp+var_52]
		jl	short loc_8FA2C
		mov	ax, 1
		jmp	short loc_8FA2E

loc_8FA2C:
		xor	ax, ax

loc_8FA2E:
		or	al, al
		jnz	short loc_8FA4A
		mov	eax, [bp+var_4A]
		cmp	eax, [bp+var_56]
		jge	short loc_8FA41
		mov	ax, 1
		jmp	short loc_8FA43

loc_8FA41:
		xor	ax, ax

loc_8FA43:
		or	al, al
		jnz	short loc_8FA4A
		jmp	loc_8FC90

loc_8FA4A:
		push	3
		push	large 80h
		lea	ax, word ptr [bp+var_184]
		push	ax
		call	sub_57677
		add	sp, 8
		lea	ax, word ptr [bp+var_178]
		push	ax
		lea	ax, word ptr [bp+var_184]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_6A]
		push	ax
		call	Math_DotProduct3D_56E96
		add	sp, 8
		cmp	[bp+var_6A], 0
		jle	short loc_8FA82
		mov	ax, 1
		jmp	short loc_8FA84

loc_8FA82:
		xor	ax, ax

loc_8FA84:
		or	al, al
		jnz	short loc_8FA8B
		jmp	loc_8FC90

loc_8FA8B:
		mov	byte ptr [si+0A3h], 3
		mov	[bp+var_6E], 80h
		mov	eax, [bp+var_6E]
		mov	dword_7977E, eax
		mov	di, si
		add	di, 14h
		mov	ax, [si+0A1h]
		add	ax, 12h
		mov	[bp+var_70], ax
		mov	eax, [di]
		mov	bx, [bp+var_70]
		sub	eax, [bx]
		mov	[bp+var_1A8], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp+var_1A4], eax
		mov	eax, [di+8]
		sub	eax, [bx+8]
		mov	[bp+var_1A0], eax
		mov	eax, [bp+var_1A8]
		mov	[bp+var_1B4], eax
		mov	eax, [bp+var_1A4]
		mov	[bp+var_1B0], eax
		mov	eax, [bp+var_1A0]
		mov	[bp+var_1AC], eax
		mov	eax, [bp+var_1B4]
		mov	[si+0F4h], eax
		mov	eax, [bp+var_1B0]
		mov	[si+0F8h], eax
		mov	eax, [bp+var_1AC]
		mov	[si+0FCh], eax
		mov	di, si
		add	di, 100h
		mov	bx, [si+0A1h]
		mov	eax, [bx+20h]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_74], eax
		mov	eax, [bp+var_74]
		mov	[bp+var_78], eax
		mov	[si+8Ch], eax
		mov	eax, [bp+var_56]
		mov	[si+90h], eax
		mov	di, si
		add	di, 38h
		mov	ax, si
		add	ax, 8Ch
		mov	[bp+var_7A], ax
		mov	eax, [di]
		mov	bx, [bp+var_7A]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_7E], eax
		mov	eax, [bp+var_7E]
		mov	[bp+var_82], eax
		mov	eax, [di+4]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_86], eax
		mov	eax, [bp+var_86]
		mov	[bp+var_8A], eax
		mov	eax, [di+8]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_8E], eax
		mov	eax, [bp+var_8E]
		mov	[bp+var_92], eax
		mov	eax, [bp+var_82]
		mov	[bp+var_1C0], eax
		mov	eax, [bp+var_8A]
		mov	[bp+var_1BC], eax
		mov	eax, [bp+var_92]
		mov	[bp+var_1B8], eax
		mov	eax, [bp+var_1C0]
		add	[si+0F4h], eax
		mov	eax, [bp+var_1BC]
		add	[si+0F8h], eax
		mov	eax, [bp+var_1B8]
		add	[si+0FCh], eax
		mov	di, si
		add	di, 20h
		mov	ax, si
		add	ax, 8Ch
		mov	[bp+var_94], ax
		mov	eax, [di]
		mov	bx, [bp+var_94]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_98], eax
		mov	eax, [bp+var_98]
		mov	[bp+var_9C], eax
		mov	eax, [di+4]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_A0], eax
		mov	eax, [bp+var_A0]
		mov	[bp+var_A4], eax
		mov	eax, [di+8]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_A8], eax
		mov	eax, [bp+var_A8]
		mov	[bp+var_AC], eax
		mov	eax, [bp+var_9C]
		mov	[bp+var_1CC], eax
		mov	eax, [bp+var_A4]
		mov	[bp+var_1C8], eax
		mov	eax, [bp+var_AC]
		mov	[bp+var_1C4], eax
		mov	eax, [bp+var_1CC]
		sub	[si+0F4h], eax
		mov	eax, [bp+var_1C8]
		sub	[si+0F8h], eax
		mov	eax, [bp+var_1C4]
		sub	[si+0FCh], eax

loc_8FC90:
		pop	di
		pop	si
		leave
		retf
sub_8F39F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à HUDSymbol_RenderWithClipTestB_81467 (sub_81467 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 392 lignes, NON DÉTAILLÉE — variante de HUDSymbol_RenderWithClipTest_80B74, ajoute
; Vector_SetLength_55A9E (seg116).
; ==============================================================================================
HUDSymbol_RenderWithClipTestB_8FC94		proc far

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
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= word ptr -22h
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
		sub	sp, 0DEh
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+0A1h], 0
		jnz	short loc_8FCAA
		jmp	loc_90076

loc_8FCAA:
		mov	di, si
		add	di, 0F4h
		mov	eax, [di]
		mov	[bp+var_66], eax
		mov	eax, [di+4]
		mov	[bp+var_62], eax
		mov	eax, [di+8]
		mov	[bp+var_5E], eax
		lea	ax, word ptr [bp+var_66]
		push	ax
		push	word ptr [si+89h]
		push	si
		call	sub_2CADA
		add	sp, 6
		mov	di, [si+0A1h]
		add	di, 12h
		mov	eax, [di]
		add	[bp+var_66], eax
		mov	eax, [di+4]
		add	[bp+var_62], eax
		mov	eax, [di+8]
		add	[bp+var_5E], eax
		mov	di, si
		add	di, 14h
		mov	eax, [bp+var_66]
		sub	eax, [di]
		mov	[bp+var_7E], eax
		mov	eax, [bp+var_62]
		sub	eax, [di+4]
		mov	[bp+var_7A], eax
		mov	eax, [bp+var_5E]
		sub	eax, [di+8]
		mov	[bp+var_76], eax
		mov	eax, [bp+var_7E]
		mov	[bp+var_72], eax
		mov	eax, [bp+var_7A]
		mov	[bp+var_6E], eax
		mov	eax, [bp+var_76]
		mov	[bp+var_6A], eax
		mov	eax, [si+125h]
		shl	eax, 1
		mov	[bp+var_14], eax
		mov	[bp+var_18], eax
		mov	eax, [bp+var_72]
		mov	edx, eax
		mov	ecx, [bp+var_18]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_72], eax
		mov	eax, [bp+var_6E]
		mov	edx, eax
		mov	ecx, [bp+var_18]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_6E], eax
		mov	eax, [bp+var_6A]
		mov	edx, eax
		mov	ecx, [bp+var_18]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_6A], eax
		push	large [bp+var_6A]
		push	large [bp+var_6E]
		push	large [bp+var_72]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_1C], eax
		mov	[bp+var_20], eax
		mov	eax, [si+90h]
		cmp	eax, [bp+var_20]
		jge	short loc_8FDC4
		mov	ax, 1
		jmp	short loc_8FDC6

loc_8FDC4:
		xor	ax, ax

loc_8FDC6:
		or	al, al
		jz	short loc_8FE3E
		mov	ax, si
		add	ax, 90h
		push	ax
		lea	ax, word ptr [bp+var_72]
		push	ax
		call	Vector_SetLength_57879
		add	sp, 4
		mov	eax, [bp+var_66]
		sub	eax, [bp+var_72]
		mov	[bp+var_8A], eax
		mov	eax, [bp+var_62]
		sub	eax, [bp+var_6E]
		mov	[bp+var_86], eax
		mov	eax, [bp+var_5E]
		sub	eax, [bp+var_6A]
		mov	[bp+var_82], eax
		mov	eax, [bp+var_8A]
		mov	[bp+var_96], eax
		mov	eax, [bp+var_86]
		mov	[bp+var_92], eax
		mov	eax, [bp+var_82]
		mov	[bp+var_8E], eax
		mov	eax, [bp+var_96]
		mov	[si+14h], eax
		mov	eax, [bp+var_92]
		mov	[si+18h], eax
		mov	eax, [bp+var_8E]
		mov	[si+1Ch], eax
		jmp	short loc_8FEA7

loc_8FE3E:
		mov	di, si
		add	di, 125h
		mov	eax, [bp+var_72]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_72], eax
		mov	eax, [bp+var_6E]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_6E], eax
		mov	eax, [bp+var_6A]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_6A], eax
		mov	eax, [bp+var_72]
		add	[si+14h], eax
		mov	eax, [bp+var_6E]
		add	[si+18h], eax
		mov	eax, [bp+var_6A]
		add	[si+1Ch], eax

loc_8FEA7:
		mov	di, [si+89h]
		add	di, 12h
		mov	ax, si
		add	ax, 14h
		mov	[bp+var_22], ax
		mov	eax, [di]
		mov	bx, [bp+var_22]
		sub	eax, [bx]
		mov	[bp+var_AE], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp+var_AA], eax
		mov	eax, [di+8]
		sub	eax, [bx+8]
		mov	[bp+var_A6], eax
		mov	eax, [bp+var_AE]
		mov	[bp+var_A2], eax
		mov	eax, [bp+var_AA]
		mov	[bp+var_9E], eax
		mov	eax, [bp+var_A6]
		mov	[bp+var_9A], eax
		mov	di, si
		add	di, 2Ch
		push	eax
		push	large [bp+var_9E]
		push	large [bp+var_A2]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_26], eax
		mov	[bp+var_2A], eax
		mov	eax, [di]
		mov	edx, [bp+var_2A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_2E], eax
		mov	eax, [bp+var_2E]
		mov	[bp+var_32], eax
		mov	eax, [di+4]
		mov	edx, [bp+var_2A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_36], eax
		mov	eax, [bp+var_36]
		mov	[bp+var_3A], eax
		mov	eax, [di+8]
		mov	edx, [bp+var_2A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_3E], eax
		mov	eax, [bp+var_3E]
		mov	[bp+var_42], eax
		mov	eax, [bp+var_32]
		mov	[bp+var_C6], eax
		mov	eax, [bp+var_3A]
		mov	[bp+var_C2], eax
		mov	eax, [bp+var_42]
		mov	[bp+var_BE], eax
		mov	di, si
		add	di, 12Dh
		mov	eax, [bp+var_A2]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_46], eax
		mov	eax, [bp+var_46]
		mov	[bp+var_4A], eax
		mov	eax, [bp+var_9E]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_4E], eax
		mov	eax, [bp+var_4E]
		mov	[bp+var_52], eax
		mov	eax, [bp+var_9A]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_56], eax
		mov	eax, [bp+var_56]
		mov	[bp+var_5A], eax
		mov	eax, [bp+var_4A]
		mov	[bp+var_D2], eax
		mov	eax, [bp+var_52]
		mov	[bp+var_CE], eax
		mov	eax, [bp+var_5A]
		mov	[bp+var_CA], eax
		mov	eax, [bp+var_C6]
		add	eax, [bp+var_D2]
		mov	[bp+var_DE], eax
		mov	eax, [bp+var_C2]
		add	eax, [bp+var_CE]
		mov	[bp+var_DA], eax
		mov	eax, [bp+var_BE]
		add	eax, [bp+var_CA]
		mov	[bp+var_D6], eax
		mov	eax, [bp+var_DE]
		mov	[bp+var_BA], eax
		mov	eax, [bp+var_DA]
		mov	[bp+var_B6], eax
		mov	eax, [bp+var_D6]
		mov	[bp+var_B2], eax
		lea	ax, word ptr [bp+var_BA]
		push	ax
		mov	ax, si
		add	ax, 20h
		push	ax
		call	sub_59B77
		add	sp, 4
		jmp	short loc_900CB

loc_90076:
		mov	di, si
		add	di, 100h
		mov	bx, [si+89h]
		mov	eax, [bx+20h]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		mov	[si+8Ch], eax
		mov	di, si
		add	di, 104h
		mov	eax, [bx+20h]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_10], eax
		mov	[si+90h], eax
		mov	byte ptr [si+0A3h], 1

loc_900CB:
		pop	di
		pop	si
		leave
		retf
HUDSymbol_RenderWithClipTestB_8FC94		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_900CF		proc far

var_B8		= dword ptr -0B8h
var_B4		= dword ptr -0B4h
var_B0		= dword ptr -0B0h
var_AC		= dword ptr -0ACh
var_A8		= dword ptr -0A8h
var_A4		= dword ptr -0A4h
var_A0		= dword ptr -0A0h
var_9C		= dword ptr -9Ch
var_98		= dword ptr -98h
var_94		= dword ptr -94h
var_90		= dword ptr -90h
var_8C		= dword ptr -8Ch
var_88		= dword ptr -88h
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
		sub	sp, 0B8h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, si
		add	di, 119h
		mov	eax, [di]
		mov	[bp+var_7C], eax
		mov	eax, [di+4]
		mov	[bp+var_78], eax
		mov	eax, [di+8]
		mov	[bp+var_74], eax
		cmp	byte ptr [si+9Eh], 1Ah
		jnz	short loc_9010F
		mov	[bp+var_4], 0
		mov	eax, [bp+var_4]
		mov	[bp+var_74], eax

loc_9010F:
		lea	ax, word ptr [bp+var_7C]
		push	ax
		call	Vector_NormalizeInPlace_57715
		pop	cx
		mov	eax, [si+8Ch]
		sar	eax, 1
		mov	[bp+var_8], eax
		mov	[bp+var_C], eax
		mov	eax, [bp+var_7C]
		mov	edx, [bp+var_C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_14], eax
		mov	eax, [bp+var_78]
		mov	edx, [bp+var_C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_74]
		mov	edx, [bp+var_C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_20], eax
		mov	eax, [bp+var_20]
		mov	[bp+var_24], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_88], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_84], eax
		mov	eax, [bp+var_24]
		mov	[bp+var_80], eax
		mov	di, si
		add	di, 0E8h
		mov	eax, [di]
		mov	[bp+var_7C], eax
		mov	eax, [di+4]
		mov	[bp+var_78], eax
		mov	eax, [di+8]
		mov	[bp+var_74], eax
		push	word ptr [si+89h]
		mov	bx, [si+89h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		lea	ax, word ptr [bp+var_7C]
		push	ax
		call	sub_5A629
		add	sp, 4
		lea	ax, word ptr [bp+var_7C]
		push	ax
		call	Vector_NormalizeInPlace_57715
		pop	cx
		mov	eax, [si+8Ch]
		sar	eax, 1
		mov	[bp+var_28], eax
		mov	[bp+var_2C], eax
		neg	eax
		mov	[bp+var_30], eax
		mov	[bp+var_34], eax
		mov	eax, [bp+var_7C]
		mov	edx, [bp+var_34]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_38], eax
		mov	eax, [bp+var_38]
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_78]
		mov	edx, [bp+var_34]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_40], eax
		mov	eax, [bp+var_40]
		mov	[bp+var_44], eax
		mov	eax, [bp+var_74]
		mov	edx, [bp+var_34]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_48], eax
		mov	eax, [bp+var_48]
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_3C]
		mov	[bp+var_94], eax
		mov	eax, [bp+var_44]
		mov	[bp+var_90], eax
		mov	eax, [bp+var_4C]
		mov	[bp+var_8C], eax
		mov	eax, [bp+var_94]
		add	[bp+var_88], eax
		mov	eax, [bp+var_90]
		add	[bp+var_84], eax
		mov	eax, [bp+var_8C]
		add	[bp+var_80], eax
		mov	di, si
		add	di, 0F4h
		mov	eax, [bp+var_88]
		sub	eax, [di]
		mov	[bp+var_AC], eax
		mov	eax, [bp+var_84]
		sub	eax, [di+4]
		mov	[bp+var_A8], eax
		mov	eax, [bp+var_80]
		sub	eax, [di+8]
		mov	[bp+var_A4], eax
		mov	eax, [bp+var_AC]
		mov	[bp+var_A0], eax
		mov	eax, [bp+var_A8]
		mov	[bp+var_9C], eax
		mov	eax, [bp+var_A4]
		mov	[bp+var_98], eax
		mov	di, si
		add	di, 129h
		mov	eax, [bp+var_A0]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_A0], eax
		mov	eax, [bp+var_9C]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_9C], eax
		mov	eax, [bp+var_98]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_98], eax
		mov	eax, [bp+var_A0]
		add	[si+0F4h], eax
		mov	eax, [bp+var_9C]
		add	[si+0F8h], eax
		mov	eax, [bp+var_98]
		add	[si+0FCh], eax
		mov	di, si
		add	di, 0F4h
		mov	eax, [di]
		mov	[bp+var_B8], eax
		mov	eax, [di+4]
		mov	[bp+var_B4], eax
		mov	eax, [di+8]
		mov	[bp+var_B0], eax
		lea	ax, word ptr [bp+var_B8]
		push	ax
		mov	ax, si
		add	ax, 20h
		push	ax
		call	sub_59B77
		add	sp, 4
		mov	di, [si+89h]
		add	di, 12h
		mov	eax, [di]
		mov	[si+14h], eax
		mov	eax, [di+4]
		mov	[si+18h], eax
		mov	eax, [di+8]
		mov	[si+1Ch], eax
		mov	di, si
		add	di, 0F4h
		mov	eax, [di]
		sub	[si+14h], eax
		mov	eax, [di+4]
		sub	[si+18h], eax
		mov	eax, [di+8]
		sub	[si+1Ch], eax
		cmp	dword ptr [si+121h], 0
		jge	short loc_903BC
		mov	ax, 1
		jmp	short loc_903BE

loc_903BC:
		xor	ax, ax

loc_903BE:
		or	al, al
		jnz	short loc_903C5
		jmp	loc_90469

loc_903C5:
		push	si
		call	Camera_TransformPoint
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_54], eax
		shl	eax, 8
		mov	[bp+var_58], eax
		mov	eax, [bp+var_58]
		mov	[bp+var_50], eax
		mov	eax, [si+115h]
		sub	eax, [bp+var_50]
		mov	[bp+var_60], eax
		mov	[bp+var_5C], eax
		mov	eax, [si+121h]
		neg	eax
		mov	[bp+var_64], eax
		mov	[bp+var_68], eax
		mov	eax, [bp+var_5C]
		mov	edx, eax
		mov	ecx, [bp+var_68]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_5C], eax
		mov	eax, [si+108h]
		sar	eax, 1
		mov	[bp+var_6C], eax
		mov	[bp+var_70], eax
		mov	eax, [bp+var_5C]
		cmp	eax, [bp+var_70]
		jg	short loc_9043E
		mov	ax, 1
		jmp	short loc_90440

loc_9043E:
		xor	ax, ax

loc_90440:
		or	al, al
		jz	short loc_90469
		mov	byte ptr [si+0A3h], 4
		mov	di, si
		add	di, 119h
		mov	eax, [di]
		mov	[si+0F4h], eax
		mov	eax, [di+4]
		mov	[si+0F8h], eax
		mov	eax, [di+8]
		mov	[si+0FCh], eax

loc_90469:
		pop	di
		pop	si
		leave
		retf
sub_900CF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à HUDSymbol_RenderWithClipTestC_81C26 (sub_81C26 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 379 lignes, NON DÉTAILLÉE — variante de HUDSymbol_RenderWithClipTest_80B74.
; ==============================================================================================
HUDSymbol_RenderWithClipTestC_9046D		proc far

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
var_82		= word ptr -82h
var_5E		= dword ptr -5Eh
var_5A		= dword ptr -5Ah
var_56		= dword ptr -56h
var_52		= dword ptr -52h
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
var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0FAh
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+0A1h], 0
		jnz	short loc_90483
		jmp	loc_9087B

loc_90483:
		mov	di, si
		add	di, 0DCh
		mov	eax, [di]
		mov	[bp+var_52], eax
		mov	eax, [di+4]
		mov	[bp+var_4E], eax
		mov	eax, [di+8]
		mov	[bp+var_4A], eax
		mov	di, si
		add	di, 8Ch
		mov	eax, [bp+var_52]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_52], eax
		mov	eax, [bp+var_4E]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4E], eax
		mov	eax, [bp+var_4A]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4A], eax
		push	word ptr [si+0A1h]
		mov	bx, [si+0A1h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	di, ax
		mov	eax, [di]
		mov	[bp+var_5E], eax
		mov	eax, [di+4]
		mov	[bp+var_5A], eax
		mov	eax, [di+8]
		mov	[bp+var_56], eax
		lea	ax, [bp+var_82]
		push	ax
		call	Formation_ComputeGeometryHelper_58B0C
		pop	cx
		lea	ax, word ptr [bp+var_5E]
		push	ax
		lea	ax, [bp+var_82]
		push	ax
		call	sub_59B77
		add	sp, 4
		lea	ax, [bp+var_82]
		push	ax
		lea	ax, word ptr [bp+var_52]
		push	ax
		call	sub_5A629
		add	sp, 4
		lea	ax, word ptr [bp+var_52]
		push	ax
		push	word ptr [si+0A1h]
		push	si
		call	sub_2CADA
		add	sp, 6
		mov	di, [si+0A1h]
		add	di, 12h
		mov	eax, [di]
		add	[bp+var_52], eax
		mov	eax, [di+4]
		add	[bp+var_4E], eax
		mov	eax, [di+8]
		add	[bp+var_4A], eax
		mov	di, si
		add	di, 14h
		mov	eax, [bp+var_52]
		sub	eax, [di]
		mov	[bp+var_9A], eax
		mov	eax, [bp+var_4E]
		sub	eax, [di+4]
		mov	[bp+var_96], eax
		mov	eax, [bp+var_4A]
		sub	eax, [di+8]
		mov	[bp+var_92], eax
		mov	eax, [bp+var_9A]
		mov	[bp+var_8E], eax
		mov	eax, [bp+var_96]
		mov	[bp+var_8A], eax
		mov	eax, [bp+var_92]
		mov	[bp+var_86], eax
		push	eax
		push	large [bp+var_8A]
		push	large [bp+var_8E]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_4], eax
		mov	[bp+var_8], eax
		mov	eax, [si+90h]
		cmp	eax, [bp+var_8]
		jge	short loc_905DE
		mov	ax, 1
		jmp	short loc_905E0

loc_905DE:
		xor	ax, ax

loc_905E0:
		or	al, al
		jz	short loc_9065C
		mov	ax, si
		add	ax, 90h
		push	ax
		lea	ax, word ptr [bp+var_8E]
		push	ax
		call	Vector_SetLength_57879
		add	sp, 4
		mov	eax, [bp+var_52]
		sub	eax, [bp+var_8E]
		mov	[bp+var_A6], eax
		mov	eax, [bp+var_4E]
		sub	eax, [bp+var_8A]
		mov	[bp+var_A2], eax
		mov	eax, [bp+var_4A]
		sub	eax, [bp+var_86]
		mov	[bp+var_9E], eax
		mov	eax, [bp+var_A6]
		mov	[bp+var_B2], eax
		mov	eax, [bp+var_A2]
		mov	[bp+var_AE], eax
		mov	eax, [bp+var_9E]
		mov	[bp+var_AA], eax
		mov	eax, [bp+var_B2]
		mov	[si+14h], eax
		mov	eax, [bp+var_AE]
		mov	[si+18h], eax
		mov	eax, [bp+var_AA]
		mov	[si+1Ch], eax
		jmp	short loc_906D3

loc_9065C:
		mov	[bp+var_C], 400h
		mov	eax, [bp+var_8E]
		mov	edx, eax
		mov	ecx, [bp+var_C]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_8E], eax
		mov	eax, [bp+var_8A]
		mov	edx, eax
		mov	ecx, [bp+var_C]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_8A], eax
		mov	eax, [bp+var_86]
		mov	edx, eax
		mov	ecx, [bp+var_C]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_86], eax
		mov	eax, [bp+var_8E]
		add	[si+14h], eax
		mov	eax, [bp+var_8A]
		add	[si+18h], eax
		mov	eax, [bp+var_86]
		add	[si+1Ch], eax

loc_906D3:
		mov	di, [si+0A1h]
		add	di, 12h
		mov	ax, si
		add	ax, 14h
		mov	[bp+var_E], ax
		mov	eax, [di]
		mov	bx, [bp+var_E]
		sub	eax, [bx]
		mov	[bp+var_CA], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp+var_C6], eax
		mov	eax, [di+8]
		sub	eax, [bx+8]
		mov	[bp+var_C2], eax
		mov	eax, [bp+var_CA]
		mov	[bp+var_BE], eax
		mov	eax, [bp+var_C6]
		mov	[bp+var_BA], eax
		mov	eax, [bp+var_C2]
		mov	[bp+var_B6], eax
		mov	di, si
		add	di, 2Ch
		push	eax
		push	large [bp+var_BA]
		push	large [bp+var_BE]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_12], eax
		mov	[bp+var_16], eax
		mov	eax, [di]
		mov	edx, [bp+var_16]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_1A], eax
		mov	eax, [bp+var_1A]
		mov	[bp+var_1E], eax
		mov	eax, [di+4]
		mov	edx, [bp+var_16]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_22], eax
		mov	eax, [bp+var_22]
		mov	[bp+var_26], eax
		mov	eax, [di+8]
		mov	edx, [bp+var_16]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_2A], eax
		mov	eax, [bp+var_2A]
		mov	[bp+var_2E], eax
		mov	eax, [bp+var_1E]
		mov	[bp+var_E2], eax
		mov	eax, [bp+var_26]
		mov	[bp+var_DE], eax
		mov	eax, [bp+var_2E]
		mov	[bp+var_DA], eax
		mov	eax, [bp+var_BE]
		mov	ebx, 0Ah
		cdq
		idiv	ebx
		mov	[bp+var_32], eax
		mov	[bp+var_36], eax
		mov	eax, [bp+var_BA]
		cdq
		idiv	ebx
		mov	[bp+var_3A], eax
		mov	[bp+var_3E], eax
		mov	eax, [bp+var_B6]
		cdq
		idiv	ebx
		mov	[bp+var_42], eax
		mov	[bp+var_46], eax
		mov	eax, [bp+var_36]
		mov	[bp+var_EE], eax
		mov	eax, [bp+var_3E]
		mov	[bp+var_EA], eax
		mov	eax, [bp+var_46]
		mov	[bp+var_E6], eax
		mov	eax, [bp+var_E2]
		add	eax, [bp+var_EE]
		mov	[bp+var_FA], eax
		mov	eax, [bp+var_DE]
		add	eax, [bp+var_EA]
		mov	[bp+var_F6], eax
		mov	eax, [bp+var_DA]
		add	eax, [bp+var_E6]
		mov	[bp+var_F2], eax
		mov	eax, [bp+var_FA]
		mov	[bp+var_D6], eax
		mov	eax, [bp+var_F6]
		mov	[bp+var_D2], eax
		mov	eax, [bp+var_F2]
		mov	[bp+var_CE], eax
		lea	ax, word ptr [bp+var_D6]
		push	ax
		mov	ax, si
		add	ax, 20h
		push	ax
		call	sub_59B77
		add	sp, 4
		mov	eax, dword_7976E
		sub	[si+13Dh], eax
		jmp	short loc_90880

loc_9087B:
		mov	byte ptr [si+0A3h], 5

loc_90880:
		pop	di
		pop	si
		leave
		retf
HUDSymbol_RenderWithClipTestC_9046D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à HUDSymbol_ComputeTransform_8203D (sub_8203D de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine longueur vectorielle et UI_ApplyLineOfSightAndTransform_57DAE (127 lignes).
; ==============================================================================================
HUDSymbol_ComputeTransform_90884		proc far

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
		sub	sp, 38h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, si
		add	di, 119h
		mov	eax, [di]
		mov	[bp+var_20], eax
		mov	eax, [di+4]
		mov	[bp+var_1C], eax
		mov	eax, [di+8]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_20]
		mov	edx, dword_79774
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_20], eax
		mov	eax, [bp+var_1C]
		mov	edx, dword_79774
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_18]
		mov	edx, dword_79774
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_18], eax
		mov	[bp+var_4], 0CCh
		mov	eax, [bp+var_4]
		mov	edx, dword_7976E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_C], eax
		mov	eax, [si+0FCh]
		mov	edx, [bp+var_C]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+0FCh], eax
		mov	eax, [si+0FCh]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_20]
		add	[si+14h], eax
		mov	eax, [bp+var_1C]
		add	[si+18h], eax
		mov	eax, [bp+var_18]
		add	[si+1Ch], eax
		mov	di, [si+89h]
		add	di, 12h
		mov	cx, si
		add	cx, 14h
		mov	eax, [di]
		mov	bx, cx
		sub	eax, [bx]
		mov	[bp+var_38], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp+var_34], eax
		mov	eax, [di+8]
		sub	eax, [bx+8]
		mov	[bp+var_30], eax
		mov	eax, [bp+var_38]
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_34]
		mov	[bp+var_28], eax
		mov	eax, [bp+var_30]
		mov	[bp+var_24], eax
		push	eax
		push	large [bp+var_28]
		push	large [bp+var_2C]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_10], eax
		mov	[bp+var_14], eax
		mov	[si+90h], eax
		lea	ax, word ptr [bp+var_2C]
		push	ax
		mov	ax, si
		add	ax, 20h
		push	ax
		call	sub_59B77
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
HUDSymbol_ComputeTransform_90884		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à HUDSymbol_RenderWithLOSCheckB_82181 (sub_82181 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 474 lignes, NON DÉTAILLÉE — combine Vector_NormalizeInPlace_5593A, Math_CosDeg_5483F
; (seg115), Camera_TransformPoint. ⚠️ (2026-09-24) Math_Sin_5483F / Math_Cos_54876 et leurs
; versions brutes sont INVERSEES (voir Math_CosDeg_5483F) : toute mention de sinus/cosinus
; tiree de ces noms dans ce resume est a relire.
; ==============================================================================================
HUDSymbol_RenderWithLOSCheckB_909C8		proc far

var_112		= dword ptr -112h
var_10E		= dword ptr -10Eh
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
var_7A		= dword ptr -7Ah
var_76		= dword ptr -76h
var_72		= dword ptr -72h
var_6E		= dword ptr -6Eh
var_6A		= word ptr -6Ah
var_68		= word ptr -68h
var_66		= dword ptr -66h
var_62		= dword ptr -62h
var_5E		= dword ptr -5Eh
var_5A		= dword ptr -5Ah
var_56		= word ptr -56h
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
		sub	sp, 112h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	al, [si+10Ch]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_90A47
		mov	[bp+var_4], 7800h
		mov	eax, [bp+var_4]
		mov	[si+121h], eax
		mov	byte ptr [si+10Ch], 1
		mov	di, si
		add	di, 14h
		mov	eax, [di]
		mov	[si+0F4h], eax
		mov	eax, [di+4]
		mov	[si+0F8h], eax
		mov	eax, [di+8]
		mov	[si+0FCh], eax
		mov	eax, [si+11Dh]
		mov	[si+0E8h], eax
		mov	eax, [si+119h]
		mov	[si+0ECh], eax
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		mov	[si+0F0h], eax
		mov	ax, si
		add	ax, 0E8h
		push	ax
		call	Vector_NormalizeInPlace_57715
		pop	cx
		jmp	loc_90ECD

loc_90A47:
		mov	di, si
		add	di, 119h
		mov	[bp+var_C], 80h
		mov	eax, [di]
		mov	edx, [bp+var_C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_14], eax
		mov	eax, [di+4]
		mov	edx, [bp+var_C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_1C], eax
		mov	eax, [di+8]
		mov	edx, [bp+var_C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_20], eax
		mov	eax, [bp+var_20]
		mov	[bp+var_24], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_A6], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_A2], eax
		mov	eax, [bp+var_24]
		mov	[bp+var_9E], eax
		mov	eax, [bp+var_A6]
		mov	edx, dword_7976E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_28], eax
		mov	eax, [bp+var_28]
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_A2]
		mov	edx, dword_7976E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_30], eax
		mov	eax, [bp+var_30]
		mov	[bp+var_34], eax
		mov	eax, [bp+var_9E]
		mov	edx, dword_7976E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_38], eax
		mov	eax, [bp+var_38]
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_2C]
		mov	[bp+var_B2], eax
		mov	eax, [bp+var_34]
		mov	[bp+var_AE], eax
		mov	eax, [bp+var_3C]
		mov	[bp+var_AA], eax
		mov	eax, [bp+var_B2]
		sub	[si+119h], eax
		mov	eax, [bp+var_AE]
		sub	[si+11Dh], eax
		mov	eax, [bp+var_AA]
		sub	[si+121h], eax
		mov	di, si
		add	di, 119h
		mov	eax, [di]
		mov	edx, dword_79774
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_40], eax
		mov	eax, [bp+var_40]
		mov	[bp+var_44], eax
		mov	eax, [di+4]
		mov	edx, dword_79774
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_48], eax
		mov	eax, [bp+var_48]
		mov	[bp+var_4C], eax
		mov	eax, [di+8]
		mov	edx, dword_79774
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_50], eax
		mov	eax, [bp+var_50]
		mov	[bp+var_54], eax
		mov	eax, [bp+var_44]
		mov	[bp+var_BE], eax
		mov	eax, [bp+var_4C]
		mov	[bp+var_BA], eax
		mov	eax, [bp+var_54]
		mov	[bp+var_B6], eax
		mov	eax, [bp+var_BE]
		add	[si+0F4h], eax
		mov	eax, [bp+var_BA]
		add	[si+0F8h], eax
		mov	eax, [bp+var_B6]
		add	[si+0FCh], eax
		mov	di, si
		add	di, 0F4h
		mov	ax, si
		add	ax, 10Dh
		mov	[bp+var_56], ax
		mov	eax, [di]
		mov	bx, [bp+var_56]
		sub	eax, [bx]
		mov	[bp+var_D6], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp+var_D2], eax
		mov	eax, [di+8]
		sub	eax, [bx+8]
		mov	[bp+var_CE], eax
		mov	eax, [bp+var_D6]
		mov	[bp+var_CA], eax
		mov	eax, [bp+var_D2]
		mov	[bp+var_C6], eax
		mov	eax, [bp+var_CE]
		mov	[bp+var_C2], eax
		push	eax
		push	large [bp+var_C6]
		push	large [bp+var_CA]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_5E], eax
		mov	[bp+var_5A], eax
		mov	eax, [si+90h]
		cmp	eax, [bp+var_5A]
		jle	short loc_90C6F
		mov	ax, 1
		jmp	short loc_90C71

loc_90C6F:
		xor	ax, ax

loc_90C71:
		or	al, al
		jnz	short loc_90C78
		jmp	loc_90E0C

loc_90C78:
		mov	di, si
		add	di, 0E8h
		mov	ax, si
		add	ax, 90h
		mov	[bp+var_6A], ax
		mov	eax, [di]
		mov	bx, [bp+var_6A]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_6E], eax
		mov	eax, [bp+var_6E]
		mov	[bp+var_72], eax
		mov	eax, [di+4]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_76], eax
		mov	eax, [bp+var_76]
		mov	[bp+var_7A], eax
		mov	eax, [di+8]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_7E], eax
		mov	eax, [bp+var_7E]
		mov	[bp+var_82], eax
		mov	eax, [bp+var_72]
		mov	[bp+var_FA], eax
		mov	eax, [bp+var_7A]
		mov	[bp+var_F6], eax
		mov	eax, [bp+var_82]
		mov	[bp+var_F2], eax
		mov	[bp+var_86], 5A00h
		mov	eax, [bp+var_5A]
		mov	edx, [bp+var_86]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_8A], eax
		mov	eax, [bp+var_8A]
		mov	[bp+var_8E], eax
		mov	di, si
		add	di, 90h
		mov	eax, [bp+var_8E]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_92], eax
		mov	eax, [bp+var_92]
		mov	[bp+var_96], eax
		lea	ax, word ptr [bp+var_96]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_9A]
		push	ax
		call	Math_CosDeg_5666C
		add	sp, 6
		mov	eax, [bp+var_FA]
		mov	edx, [bp+var_9A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_FA], eax
		mov	eax, [bp+var_F6]
		mov	edx, [bp+var_9A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_F6], eax
		mov	eax, [bp+var_F2]
		mov	edx, [bp+var_9A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_F2], eax
		mov	di, si
		add	di, 0F4h
		mov	eax, [di]
		add	eax, [bp+var_FA]
		mov	[bp+var_106], eax
		mov	eax, [di+4]
		add	eax, [bp+var_F6]
		mov	[bp+var_102], eax
		mov	eax, [di+8]
		add	eax, [bp+var_F2]
		mov	[bp+var_FE], eax
		mov	eax, [bp+var_106]
		mov	[bp+var_112], eax
		mov	eax, [bp+var_102]
		mov	[bp+var_10E], eax
		mov	eax, [bp+var_FE]
		mov	[bp+var_10A], eax
		mov	eax, [bp+var_112]
		mov	[si+14h], eax
		mov	eax, [bp+var_10E]
		mov	[si+18h], eax
		mov	eax, [bp+var_10A]
		mov	[si+1Ch], eax
		jmp	short loc_90E29

loc_90E0C:
		mov	di, si
		add	di, 0F4h
		mov	eax, [di]
		mov	[si+14h], eax
		mov	eax, [di+4]
		mov	[si+18h], eax
		mov	eax, [di+8]
		mov	[si+1Ch], eax

loc_90E29:
		push	si
		call	Camera_TransformPoint
		push	dx
		push	ax
		pop	eax
		pop	cx
		add	eax, 14h
		mov	[bp+var_66], eax
		shl	eax, 8
		mov	[bp+var_62], eax
		mov	eax, [si+1Ch]
		cmp	eax, [bp+var_62]
		jge	short loc_90E53
		mov	ax, 1
		jmp	short loc_90E55

loc_90E53:
		xor	ax, ax

loc_90E55:
		or	al, al
		jz	short loc_90E66
		mov	eax, [bp+var_62]
		mov	[si+0FCh], eax
		mov	[si+1Ch], eax

loc_90E66:
		mov	di, si
		add	di, 10Dh
		mov	ax, si
		add	ax, 14h
		mov	[bp+var_68], ax
		mov	eax, [di]
		mov	bx, [bp+var_68]
		sub	eax, [bx]
		mov	[bp+var_EE], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp+var_EA], eax
		mov	eax, [di+8]
		sub	eax, [bx+8]
		mov	[bp+var_E6], eax
		mov	eax, [bp+var_EE]
		mov	[bp+var_E2], eax
		mov	eax, [bp+var_EA]
		mov	[bp+var_DE], eax
		mov	eax, [bp+var_E6]
		mov	[bp+var_DA], eax
		lea	ax, word ptr [bp+var_E2]
		push	ax
		mov	ax, si
		add	ax, 20h
		push	ax
		call	sub_59B77
		add	sp, 4

loc_90ECD:
		mov	eax, dword_7976E
		sub	[si+13Dh], eax
		pop	di
		pop	si
		leave
		retf
HUDSymbol_RenderWithLOSCheckB_909C8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_90EDA		proc far

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
		sub	sp, 1Eh
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+89h], 0
		jnz	short loc_90EEF
		jmp	loc_90FC1

loc_90EEF:
		mov	di, [si+89h]
		add	di, 12h
		mov	eax, [di]
		mov	[si+10Dh], eax
		mov	eax, [di+4]
		mov	[si+111h], eax
		mov	eax, [di+8]
		mov	[si+115h], eax
		push	word ptr [si+89h]
		push	ss
		lea	ax, word ptr [bp+var_1E]
		push	ax
		mov	bx, [si+89h]
		mov	bx, [bx]
		call	dword ptr [bx+50h]
		add	sp, 6
		mov	eax, [bp+var_1E]
		mov	[si+119h], eax
		mov	eax, [bp+var_1A]
		mov	[si+11Dh], eax
		mov	eax, [bp+var_16]
		mov	[si+121h], eax
		cmp	byte ptr [si+9Eh], 9
		jz	short loc_90F4E
		cmp	byte ptr [si+9Eh], 8
		jnz	short loc_90F67

loc_90F4E:
		mov	bx, [si+89h]
		mov	ax, [bx+5Ah]
		mov	[bp+var_2], ax
		push	ax
		mov	ax, si
		add	ax, 0A1h
		push	ax
		call	SetReference16
		add	sp, 4

loc_90F67:
		cmp	byte ptr [si+9Eh], 1Ah
		jnz	short loc_90F7D
		mov	bx, [si+89h]
		cmp	byte ptr [bx+64h], 0
		jz	short loc_90F7D
		mov	byte ptr [si+0A3h], 1

loc_90F7D:
		mov	al, [si+0A3h]
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 4
		jbe	short loc_90F8D
		jmp	loc_91097

loc_90F8D:
		shl	bx, 1
		jmp	cs:off_9109D[bx]	; switch jump

loc_90F94:
		push	si
		push	cs
		call	near ptr sub_8F1B1
		pop	cx
		jmp	loc_91097

loc_90F9D:
		push	si
		push	cs
		call	near ptr sub_8F39F
		pop	cx
		jmp	loc_91097

loc_90FA6:
		push	si
		push	cs
		call	near ptr HUDSymbol_RenderWithClipTestB_8FC94
		pop	cx
		jmp	loc_91097

loc_90FAF:
		push	si
		push	cs
		call	near ptr sub_900CF
		pop	cx
		jmp	loc_91097

loc_90FB8:
		push	si
		push	cs
		call	near ptr HUDSymbol_ComputeTransform_90884
		pop	cx
		jmp	loc_91097

loc_90FC1:
		cmp	dword ptr [si+13Dh], 0
		jle	short loc_90FCE
		mov	ax, 1
		jmp	short loc_90FD0

loc_90FCE:
		xor	ax, ax

loc_90FD0:
		or	al, al
		jnz	short loc_90FD7
		jmp	loc_9108C

loc_90FD7:
		cmp	word ptr [si+0A1h], 0
		jnz	short loc_90FE1
		jmp	loc_9106F

loc_90FE1:
		push	word ptr [si+0A1h]
		mov	bx, [si+0A1h]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		cmp	al, 6
		jnz	short loc_9106F
		mov	di, [si+0A1h]
		push	word ptr [di+52h]
		mov	bx, [di+52h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	bx, ax
		mov	al, [bx+92h]
		shr	ax, 5
		and	ax, 1
		or	al, al
		jz	short loc_9106F
		cmp	byte ptr [si+0A3h], 6
		jz	short loc_9106F
		mov	di, si
		add	di, 100h
		mov	bx, [si+0A1h]
		mov	eax, [bx+20h]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_6], eax
		mov	eax, [bp+var_6]
		mov	[bp+var_A], eax
		mov	[si+8Ch], eax
		mov	di, si
		add	di, 104h
		mov	eax, [bx+20h]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_E], eax
		mov	eax, [bp+var_E]
		mov	[bp+var_12], eax
		mov	[si+90h], eax
		mov	byte ptr [si+0A3h], 6

loc_9106F:
		mov	al, [si+0A3h]
		mov	ah, 0
		cmp	ax, 6
		jz	short loc_9107C
		jmp	short loc_91084

loc_9107C:
		push	si
		push	cs
		call	near ptr HUDSymbol_RenderWithClipTestC_9046D
		pop	cx
		jmp	short loc_91097

loc_91084:
		push	si
		push	cs
		call	near ptr HUDSymbol_RenderWithLOSCheckB_909C8
		pop	cx
		jmp	short loc_91097

loc_9108C:
		mov	al, [si+141h]
		mov	byte_7CEF8, al
		mov	al, 0
		jmp	short loc_91099

loc_91097:
		mov	al, 1

loc_91099:
		pop	di
		pop	si
		leave
		retf
sub_90EDA		endp

; START OF FUNCTION CHUNK FOR sub_90EDA
off_9109D	dw offset loc_90F94
		dw offset loc_90F9D
		dw offset loc_90FAF
		dw offset loc_90FA6
		dw offset loc_90FB8
; END OF FUNCTION CHUNK FOR sub_90EDA

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_910A7		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 0Ch
		pop	bp
		retf
sub_910A7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_910B1		proc far

var_42		= dword ptr -42h
var_3E		= dword ptr -3Eh
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= byte ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h

		push	bp
		mov	bp, sp
		sub	sp, 42h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		mov	[bp+var_2], di
		push	[bp+var_2]
		mov	ax, si
		add	ax, 89h
		push	ax
		call	SetReference16
		add	sp, 4
		mov	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		push	ax
		mov	ax, si
		add	ax, 9Fh
		push	ax
		call	SetReference16
		add	sp, 4
		mov	ax, [bp+arg_6]
		mov	[bp+var_6], ax
		push	ax
		mov	ax, si
		add	ax, 0A1h
		push	ax
		call	SetReference16
		add	sp, 4
		push	di
		mov	bx, [di]
		call	dword ptr [bx+34h]
		pop	cx
		mov	[si+9Eh], al
		mov	al, [bp+arg_8]
		mov	[si+141h], al
		cmp	byte ptr [si+141h], 3
		jz	short loc_91120
		cmp	byte ptr [si+141h], 9
		jz	short loc_91120
		jmp	loc_911C0

loc_91120:
		mov	di, [bp+arg_A]
		mov	eax, [di]
		mov	[si+14h], eax
		mov	eax, [di+4]
		mov	[si+18h], eax
		mov	eax, [di+8]
		mov	[si+1Ch], eax
		push	[bp+arg_C]
		mov	ax, si
		add	ax, 20h
		push	ax
		call	AI_ComputeGeometryHelper_58BF2
		add	sp, 4
		mov	di, si
		add	di, 14h
		mov	dx, [si+9Fh]
		add	dx, 12h
		mov	eax, [di]
		mov	bx, dx
		sub	eax, [bx]
		mov	[bp+var_12], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp+var_E], eax
		mov	eax, [di+8]
		sub	eax, [bx+8]
		mov	[bp+var_A], eax
		mov	eax, [bp+var_12]
		mov	[bp+var_1E], eax
		mov	eax, [bp+var_E]
		mov	[bp+var_1A], eax
		mov	eax, [bp+var_A]
		mov	[bp+var_16], eax
		mov	eax, [bp+var_1E]
		mov	[si+0E8h], eax
		mov	eax, [bp+var_1A]
		mov	[si+0ECh], eax
		mov	eax, [bp+var_16]
		mov	[si+0F0h], eax
		mov	eax, [si+0BCh]
		mov	[si+0C0h], eax
		mov	byte ptr [si+0A3h], 0
		jmp	loc_912DA

loc_911C0:
		mov	al, [si+9Eh]
		mov	ah, 0
		cmp	ax, 9
		jz	short loc_911D0
		cmp	ax, 1Ah
		jnz	short loc_911F2

loc_911D0:
		mov	di, si
		add	di, 0B0h
		mov	eax, [di]
		mov	[si+0E8h], eax
		mov	eax, [di+4]
		mov	[si+0ECh], eax
		mov	eax, [di+8]
		mov	[si+0F0h], eax
		jmp	short loc_91212

loc_911F2:
		mov	di, si
		add	di, 0A4h
		mov	eax, [di]
		mov	[si+0E8h], eax
		mov	eax, [di+4]
		mov	[si+0ECh], eax
		mov	eax, [di+8]
		mov	[si+0F0h], eax

loc_91212:
		mov	di, si
		add	di, 0E8h
		mov	eax, [di]
		mov	[bp+var_2A], eax
		mov	eax, [di+4]
		mov	[bp+var_26], eax
		mov	eax, [di+8]
		mov	[bp+var_22], eax
		push	word ptr [si+9Fh]
		mov	bx, [si+9Fh]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		lea	ax, word ptr [bp+var_2A]
		push	ax
		call	sub_5A629
		add	sp, 4
		mov	eax, [bp+var_2A]
		mov	[si+14h], eax
		mov	eax, [bp+var_26]
		mov	[si+18h], eax
		mov	eax, [bp+var_22]
		mov	[si+1Ch], eax
		mov	di, [si+9Fh]
		add	di, 12h
		mov	eax, [di]
		add	[si+14h], eax
		mov	eax, [di+4]
		add	[si+18h], eax
		mov	eax, [di+8]
		add	[si+1Ch], eax
		mov	eax, [bp+var_2A]
		neg	eax
		mov	[bp+var_36], eax
		mov	eax, [bp+var_26]
		neg	eax
		mov	[bp+var_32], eax
		mov	eax, [bp+var_22]
		neg	eax
		mov	[bp+var_2E], eax
		mov	eax, [bp+var_36]
		mov	[bp+var_42], eax
		mov	eax, [bp+var_32]
		mov	[bp+var_3E], eax
		mov	eax, [bp+var_2E]
		mov	[bp+var_3A], eax
		lea	ax, word ptr [bp+var_42]
		push	ax
		mov	ax, si
		add	ax, 20h
		push	ax
		call	sub_59B77
		add	sp, 4
		mov	eax, [si+0BCh]
		mov	[si+0C0h], eax
		mov	byte ptr [si+0A3h], 0

loc_912DA:
		mov	byte ptr [si+10Ch], 0
		mov	eax, [si+139h]
		mov	[si+13Dh], eax
		pop	di
		pop	si
		leave
		retf
sub_910B1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à HUDSymbol_ReleaseAllRefs_82A91 (sub_82A91 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; invalide 4 références faibles (WeakRef_InvalidateIfSet ×4).
; ==============================================================================================
HUDSymbol_ReleaseAllRefs_912ED		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_91348
		mov	ax, si
		add	ax, 0A1h
		push	ax
		call	WeakRef_InvalidateIfSet
		pop	cx
		mov	ax, si
		add	ax, 9Fh
		push	ax
		call	WeakRef_InvalidateIfSet
		pop	cx
		mov	ax, si
		add	ax, 98h
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
		jz	short loc_91346
		push	si
		call	sub_3B2
		pop	cx
		jmp	short loc_91348

loc_91346:
		jmp	short loc_91348

loc_91348:
		pop	di
		pop	si
		pop	bp
		retf
HUDSymbol_ReleaseAllRefs_912ED		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9134C		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_91383
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
		jz	short loc_91381
		push	si
		call	sub_3B2
		pop	cx
		jmp	short loc_91383

loc_91381:
		jmp	short loc_91383

loc_91383:
		pop	di
		pop	si
		pop	bp
		retf
sub_9134C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_91387		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_913CA
		mov	ax, si
		add	ax, 98h
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
		jz	short loc_913C8
		push	si
		call	sub_3B2
		pop	cx
		jmp	short loc_913CA

loc_913C8:
		jmp	short loc_913CA

loc_913CA:
		pop	di
		pop	si
		pop	bp
		retf
sub_91387		endp
ovr249		ends

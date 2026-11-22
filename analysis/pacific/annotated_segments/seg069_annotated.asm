seg069		segment	para public 'CODE' use16
		assume cs:seg069
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 50h, 9Ah, 0B2h, 3, 0, 0, 59h, 0EBh, 2

loc_29AC9:
		db 0EBh, 0

loc_29ACB:
		db 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_29ACD		proc far
		push	bp
		mov	bp, sp
		mov	al, 1
		pop	bp
		retf
sub_29ACD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Poly_SelectDetailLevel_2BCA4 (sub_2BCA4 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; LUE 2026-10-16 (rendu des objets, OBJECT_RENDER.md). CHOIX DU NIVEAU DE DÉTAIL (ex-
; Damage_SelectWeightedComponent, aucun rapport avec les dégâts). Args (apparence, profondeur
; en m entière). Seuil = profondeur × 0B33Ah (179,2) ÷ dword_72202 (échelle de projection).
; Pour i de 7 à 1 : si distance +64h[i] ≠ 0 et distance ≤ seuil → i ; sinon si byte_6E8CE ≥ i
; → i. Sinon 0.
; ==============================================================================================
Poly_SelectDetailLevel_29AD4		proc far

var_22		= dword ptr -22h
var_1E		= word ptr -1Eh
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 22h
		mov	[bp+var_8], 0B33Ah
		mov	eax, [bp+arg_4]
		mov	[bp+var_C], eax
		shl	eax, 8
		mov	[bp+var_10], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_10]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		mov	edx, eax
		mov	ecx, dword_7CA10
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_4], eax
		mov	[bp+var_1E], 8
		jmp	short loc_29B78

loc_29B38:
		mov	ax, [bp+var_1E]
		shl	ax, 2
		les	bx, [bp+arg_0]
		add	bx, ax
		cmp	dword ptr es:[bx+5Ah], 0
		jz	short loc_29B78
		mov	eax, es:[bx+5Ah]
		mov	[bp+var_22], eax
		shl	eax, 8
		cmp	eax, [bp+var_4]
		jg	short loc_29B63
		mov	ax, 1
		jmp	short loc_29B65

loc_29B63:
		xor	ax, ax

loc_29B65:
		or	al, al
		jz	short loc_29B6E

loc_29B69:
		mov	al, byte ptr [bp+var_1E]
		jmp	short loc_29B7F

loc_29B6E:
		mov	al, byte_77956
		mov	ah, 0
		cmp	ax, [bp+var_1E]
		jge	short loc_29B69

loc_29B78:
		dec	[bp+var_1E]
		jg	short loc_29B38
		mov	al, 0

loc_29B7F:
		leave
		retf
Poly_SelectDetailLevel_29AD4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_29B81		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+92h]
		cmp	ax, word_7977C
		jz	short loc_29BED
		mov	ax, word_7977C
		mov	es:[bx+92h], ax
		mov	eax, es:[bx+8Ch]
		sub	eax, dword_7976E
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jg	short loc_29BD8
		mov	ax, [bp+arg_0]
		add	ax, 7Ch
		push	[bp+arg_2]
		push	ax
		call	sub_50903
		add	sp, 4
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+88h]
		mov	es:[bx+8Ch], eax
		mov	al, 1
		jmp	short loc_29BEF

loc_29BD8:
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		les	bx, [bp+arg_0]
		mov	es:[bx+8Ch], eax

loc_29BED:
		mov	al, 0

loc_29BEF:
		leave
		retf
sub_29B81		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_29BF1		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		add	ax, 18h
		pop	bp
		retf
sub_29BF1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_29BFF		proc far

arg_0		= word ptr  6
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		mov	al, [bp+arg_4]
		and	ax, 1
		les	bx, [bp+arg_0]
		and	byte ptr es:[bx+7Ah], 0FEh
		or	es:[bx+7Ah], al
		pop	bp
		retf
sub_29BFF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_29C16		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	al, es:[bx+7Ah]
		and	ax, 1
		pop	bp
		retf
sub_29C16		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_29C25		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	al, es:[bx+7Ah]
		shr	ax, 1
		and	ax, 1
		pop	bp
		retf
sub_29C25		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_29C36		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+2]
		add	ax, 12h
		push	ax
		push	word ptr es:[bx+2]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		mov	ax, [bp+arg_0]
		add	ax, 48h
		push	[bp+arg_2]
		push	ax
		call	Damage_ComputeHelperC_58A33
		add	sp, 8
		pop	bp
		retf
sub_29C36		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_29C67		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_29C36
		add	sp, 4
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_29D43
		add	sp, 4
		pop	bp
		retf
sub_29C67		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_29C83		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		les	bx, [bp+arg_0]
		les	bx, es:[bx+4]
		mov	ax, es:[bx+6]
		mov	dx, es:[bx+4]
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		xor	dx, dx
		jmp	short loc_29CAF

loc_29CA2:
		les	bx, [bp+var_4]
		and	byte ptr es:[bx+29h], 0FEh
		inc	dx
		add	[bp+var_4], 2Ah

loc_29CAF:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+4]
		cmp	es:[bx+2], dx
		jg	short loc_29CA2
		leave
		retf
sub_29C83		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_29CBE		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		les	bx, [bp+arg_0]
		les	bx, es:[bx+4]
		mov	ax, es:[bx+6]
		mov	dx, es:[bx+4]
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		xor	dx, dx
		jmp	short loc_29CF4

loc_29CDD:
		les	bx, [bp+var_4]
		and	byte ptr es:[bx+29h], 0FDh
		and	byte ptr es:[bx+29h], 0FBh
		and	byte ptr es:[bx+29h], 0F7h
		inc	dx
		add	[bp+var_4], 2Ah

loc_29CF4:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+4]
		cmp	es:[bx+2], dx
		jg	short loc_29CDD
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+2]
		cmp	byte ptr [bx+2Ch], 0
		jz	short loc_29D41
		mov	bx, [bp+arg_0]
		les	bx, es:[bx+4]
		mov	ax, es:[bx+6]
		mov	dx, es:[bx+4]
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		xor	dx, dx
		jmp	short loc_29D34

loc_29D27:
		les	bx, [bp+var_4]
		and	byte ptr es:[bx+29h], 0FEh
		inc	dx
		add	[bp+var_4], 2Ah

loc_29D34:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+4]
		cmp	es:[bx+2], dx
		jg	short loc_29D27

loc_29D41:
		leave
		retf
sub_29CBE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_29D43		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	0
		les	bx, [bp+arg_0]
		les	bx, es:[bx+4]
		mov	al, es:[bx+0Ch]
		push	ax
		push	word ptr es:[bx+0Ah]
		push	word ptr es:[bx+8]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		les	bx, [bp+arg_0]
		les	bx, es:[bx+4]
		mov	ax, es:[bx+6]
		mov	dx, es:[bx+4]
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		xor	dx, dx
		jmp	short loc_29D90

loc_29D83:
		les	bx, [bp+var_4]
		and	byte ptr es:[bx+29h], 0FEh
		inc	dx
		add	[bp+var_4], 2Ah

loc_29D90:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+4]
		cmp	es:[bx+2], dx
		jg	short loc_29D83
		leave
		retf
sub_29D43		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_29D9F		proc far

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
var_110		= word ptr -110h
var_EC		= dword ptr -0ECh
var_E8		= dword ptr -0E8h
var_E4		= dword ptr -0E4h
var_E0		= dword ptr -0E0h
var_DC		= dword ptr -0DCh
var_D8		= dword ptr -0D8h
var_D4		= dword ptr -0D4h
var_D0		= dword ptr -0D0h
var_CC		= dword ptr -0CCh
var_C8		= dword ptr -0C8h
var_C4		= dword ptr -0C4h
var_C0		= dword ptr -0C0h
var_BC		= dword ptr -0BCh
var_B8		= dword ptr -0B8h
var_B4		= dword ptr -0B4h
var_B0		= dword ptr -0B0h
var_AC		= dword ptr -0ACh
var_A8		= dword ptr -0A8h
var_A4		= word ptr -0A4h
var_A2		= dword ptr -0A2h
var_9E		= dword ptr -9Eh
var_9A		= dword ptr -9Ah
var_96		= dword ptr -96h
var_92		= dword ptr -92h
var_8E		= dword ptr -8Eh
var_8A		= dword ptr -8Ah
var_86		= word ptr -86h
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
var_5A		= dword ptr -5Ah
var_58		= dword ptr -58h
var_56		= dword ptr -56h
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
var_1C		= word ptr -1Ch
var_1A		= dword ptr -1Ah
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_5		= byte ptr -5
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 140h
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	bx, word_7CFB4
		mov	di, [bx+4]
		inc	di
		mov	eax, [di]
		mov	[bp+var_C8], eax
		mov	eax, [di+4]
		mov	[bp+var_C4], eax
		mov	eax, [di+8]
		mov	[bp+var_C0], eax
		les	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+4], 0
		jnz	short loc_29DE1
		push	600Ch
		call	sub_1DDFE
		pop	cx

loc_29DE1:
		mov	dword_77959, 0
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+7Ah]
		and	ax, 1
		or	al, al
		jnz	short loc_29DFB
		jmp	loc_2A7CC

loc_29DFB:
		and	byte ptr es:[bx+7Ah], 0FDh
		lea	ax, [bp+var_110]
		push	ax
		call	Formation_ComputeGeometryHelper_58B0C
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+8], 0
		mov	bx, es:[bx+2]
		cmp	word ptr [bx+26h], 0
		jz	short loc_29E22
		mov	ax, 1
		jmp	short loc_29E24

loc_29E22:
		xor	ax, ax

loc_29E24:
		mov	[bp+var_5], al
		cmp	[bp+var_5], 0
		jz	short loc_29E77
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+2]
		call	Debris_ResolveForceBuffer
		pop	cx
		mov	di, ax
		mov	eax, [di]
		mov	[bp+var_EC], eax
		mov	eax, [di+4]
		mov	[bp+var_E8], eax
		mov	eax, [di+8]
		mov	[bp+var_E4], eax
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+2]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		call	dword ptr [bx+7Ch]

loc_29E66:
		pop	cx
		push	ax
		lea	ax, [bp+var_110]
		push	ax
		call	AI_ComputeGeometryHelper_58BF2
		add	sp, 4
		jmp	short loc_29EB3

loc_29E77:
		les	bx, word ptr [bp+arg_0]
		mov	di, es:[bx+2]
		add	di, 12h
		mov	eax, [di]
		mov	[bp+var_EC], eax
		mov	eax, [di+4]
		mov	[bp+var_E8], eax
		mov	eax, [di+8]
		mov	[bp+var_E4], eax
		push	word ptr es:[bx+2]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		jmp	short loc_29E66
		mov	eax, [bp+var_24]
		add	dword_77959, eax

loc_29EB3:
		mov	eax, [bp+var_EC]
		sub	eax, [si+14h]
		mov	[bp+var_D4], eax
		mov	[bp+var_E0], eax
		mov	eax, [bp+var_E8]
		sub	eax, [si+18h]
		mov	[bp+var_D0], eax
		mov	[bp+var_DC], eax
		mov	eax, [bp+var_E4]
		sub	eax, [si+1Ch]
		mov	[bp+var_CC], eax
		mov	[bp+var_D8], eax
		push	62F4h
		lea	ax, word ptr [bp+var_E0]
		push	ax
		call	Matrix_WorldToLocal_5A569
		add	sp, 4
		mov	eax, [bp+var_DC]
		mov	[bp+var_4], eax
		les	bx, word ptr [bp+arg_0]
		mov	di, es:[bx+2]
		add	di, 20h
		mov	eax, [di]
		mov	[bp+var_A], eax
		push	large [bp+var_D8]
		push	large [bp+var_DC]
		push	large [bp+var_E0]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_12], eax
		mov	[bp+var_E], eax
		cmp	eax, [bp+var_A]
		jge	short loc_29F56
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+4]
		mov	al, es:[bx+7Ah]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_29F53
		jmp	loc_2A7D4

loc_29F53:
		jmp	loc_2A3DC

loc_29F56:
		mov	eax, dword_7CC84
		mov	[bp+var_24], eax
		shl	eax, 8
		mov	[bp+var_28], eax
		mov	eax, [bp+var_28]
		mov	[bp+var_20], eax
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+2]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_2C+2], dx
		mov	word ptr [bp+var_2C], ax
		mov	eax, [bp+var_20]
		shl	eax, 2
		mov	[bp+var_20], eax
		cmp	[bp+var_2C], 0
		jnz	short loc_29F9A
		jmp	loc_2A01A

loc_29F9A:
		les	bx, word ptr [bp+var_2C]
		cmp	byte ptr es:[bx+17h], 1
		jnz	short loc_2A01A
		shl	eax, 2
		mov	[bp+var_20], eax
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+2]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		cmp	al, 6
		jnz	short loc_2A01A
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+2]
		push	ss
		lea	ax, word ptr [bp+var_11C]
		push	ax
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		call	dword ptr [bx+50h]
		add	sp, 6
		push	large [bp+var_114]
		push	large [bp+var_118]
		push	large [bp+var_11C]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_30], eax
		mov	[bp+var_34], eax
		cmp	[bp+var_34], 0
		jnz	short loc_2A009
		mov	ax, 1
		jmp	short loc_2A00B

loc_2A009:
		xor	ax, ax

loc_2A00B:
		or	al, al
		jz	short loc_2A01A
		mov	eax, [bp+var_20]
		sar	eax, 1
		mov	[bp+var_20], eax

loc_2A01A:
		cmp	[bp+var_2C], 0
		jz	short loc_2A055
		push	large [bp+var_2C]
		les	bx, word ptr [bp+var_2C]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		cmp	al, 18h
		jz	short loc_2A049
		push	large [bp+var_2C]
		les	bx, word ptr [bp+var_2C]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		cmp	al, 17h
		jnz	short loc_2A055

loc_2A049:
		mov	eax, [bp+var_20]
		shl	eax, 5
		mov	[bp+var_20], eax

loc_2A055:
		mov	eax, [bp+var_20]
		add	eax, [bp+var_A]
		mov	[bp+var_38], eax
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_4]
		cmp	eax, [bp+var_3C]
		jle	short loc_2A074
		mov	ax, 1
		jmp	short loc_2A076

loc_2A074:
		xor	ax, ax

loc_2A076:
		or	al, al
		jz	short loc_2A07D
		jmp	loc_2A7CC

loc_2A07D:
		mov	eax, dword_77B0E
		sub	eax, [bp+var_A]
		mov	[bp+var_40], eax
		mov	[bp+var_44], eax
		mov	eax, [bp+var_4]
		cmp	eax, [bp+var_44]
		jge	short loc_2A09C
		mov	ax, 1
		jmp	short loc_2A09E

loc_2A09C:
		xor	ax, ax

loc_2A09E:
		or	al, al
		jz	short loc_2A0A5
		jmp	loc_2A7CC

loc_2A0A5:
		mov	eax, [bp+var_A]
		mov	[bp+var_48], eax
		mov	di, si
		add	di, 68h
		mov	eax, [bp+var_48]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_48], eax
		mov	di, si
		add	di, 70h
		mov	eax, [bp+var_4]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_4C]
		mov	[bp+var_50], eax
		add	[bp+var_48], eax
		mov	eax, [bp+var_D8]
		or	eax, eax
		jge	short loc_2A0F6
		neg	eax

loc_2A0F6:
		mov	[bp+var_54], eax
		mov	eax, [bp+var_54]
		mov	[bp+var_58], eax
		cmp	eax, [bp+var_48]
		jle	short loc_2A10D
		mov	ax, 1
		jmp	short loc_2A10F

loc_2A10D:
		xor	ax, ax

loc_2A10F:
		or	al, al
		jz	short loc_2A116
		jmp	loc_2A7CC

loc_2A116:
		mov	eax, [bp+var_A]
		mov	[bp+var_70], eax
		mov	di, si
		add	di, 6Ch
		mov	eax, [bp+var_70]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_70], eax
		mov	di, si
		add	di, 74h
		mov	eax, [bp+var_4]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_74], eax
		mov	eax, [bp+var_74]
		mov	[bp+var_78], eax
		add	[bp+var_70], eax
		mov	eax, [bp+var_E0]
		or	eax, eax
		jge	short loc_2A167
		neg	eax

loc_2A167:
		mov	[bp+var_7C], eax
		mov	eax, [bp+var_7C]
		mov	[bp+var_80], eax
		cmp	eax, [bp+var_70]
		jle	short loc_2A17E
		mov	ax, 1
		jmp	short loc_2A180

loc_2A17E:
		xor	ax, ax

loc_2A180:
		or	al, al
		jz	short loc_2A187
		jmp	loc_2A7CC

loc_2A187:
		mov	eax, [bp+var_4]
		cmp	eax, [bp+var_A]
		jg	short loc_2A194
		jmp	loc_2A383

loc_2A194:
		push	eax
		push	large dword_7CA10
		push	large [bp+var_A]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_74], eax
		mov	[bp+var_78], eax
		mov	[bp+var_70], eax
		cmp	[bp+var_70], 0
		jnz	short loc_2A1C1
		jmp	loc_2A7CC

loc_2A1C1:
		cmp	[bp+var_70], 180h
		jle	short loc_2A1CE
		jmp	loc_2A383

loc_2A1CE:
		cmp	[bp+var_5], 0
		jz	short loc_2A1D7
		jmp	loc_2A7D4

loc_2A1D7:
		mov	eax, [bp+var_4]
		mov	[bp+var_7C], eax
		mov	eax, [bp+var_7C]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0Ch], eax
		mov	eax, [bp+var_E0]
		mov	[bp+var_80], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_84], eax
		mov	ax, word_7CA0C
		mov	[bp+var_86], ax
		push	large [bp+var_84]
		push	large dword_7CA10
		push	large [bp+var_80]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_8A], eax
		mov	[bp+var_8E], eax
		movsx	eax, [bp+var_86]
		shl	eax, 8
		mov	edx, [bp+var_8E]
		add	edx, eax
		mov	[bp+var_92], edx
		mov	eax, [bp+var_92]
		mov	[bp+var_96], eax
		sar	eax, 8
		mov	[bp+var_9A], eax
		cmp	[bp+var_9A], 7D00h
		jle	short loc_2A268
		mov	[bp+var_9A], 7D00h
		jmp	short loc_2A27E

loc_2A268:
		cmp	[bp+var_9A], 0FFFF8300h
		jge	short loc_2A27E
		mov	[bp+var_9A], 0FFFF8300h
		jmp	short loc_2A27E

loc_2A27E:
		mov	ax, word ptr [bp+var_9A]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+12h], ax
		mov	eax, [bp+var_D8]
		mov	[bp+var_9E], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_A2], eax
		mov	ax, word_7CA0E
		mov	[bp+var_A4], ax
		push	large [bp+var_A2]
		push	large dword_7CA14
		push	large [bp+var_9E]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_A8], eax
		mov	[bp+var_AC], eax
		movsx	eax, [bp+var_A4]
		shl	eax, 8
		sub	eax, [bp+var_AC]
		mov	[bp+var_B0], eax
		mov	[bp+var_B4], eax
		sar	eax, 8
		mov	[bp+var_B8], eax
		cmp	[bp+var_B8], 7D00h
		jle	short loc_2A300
		mov	[bp+var_B8], 7D00h
		jmp	short loc_2A316

loc_2A300:
		cmp	[bp+var_B8], 0FFFF8300h
		jge	short loc_2A316
		mov	[bp+var_B8], 0FFFF8300h
		jmp	short loc_2A316

loc_2A316:
		mov	ax, word ptr [bp+var_B8]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+14h], ax
		mov	word ptr es:[bx+10h], 1Ah
		les	bx, es:[bx+4]
		mov	al, es:[bx+7Bh]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+16h], al
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 0Ah
		mov	word ptr [bp+var_BC+2], ax
		mov	word ptr [bp+var_BC], dx
		mov	ax, word_7CBC8
		shl	ax, 2
		mov	dx, word_7CBDC
		sub	dx, 100h
		cmp	ax, dx
		jbe	short loc_2A35E
		mov	ax, 1
		jmp	short loc_2A360

loc_2A35E:
		xor	ax, ax

loc_2A360:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2A378
		push	large [bp+var_BC]
		push	6496h
		call	sub_293E7
		add	sp, 6
		jmp	short loc_2A378

loc_2A378:
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+8], 0
		jmp	loc_2A7CC

loc_2A383:
		mov	eax, dword_7CC84
		mov	[bp+var_5C], eax
		shl	eax, 8
		sub	eax, [bp+var_A]
		mov	[bp+var_60], eax
		mov	[bp+var_64], eax
		mov	eax, [bp+var_4]
		cmp	eax, [bp+var_64]
		jge	short loc_2A3AA
		mov	ax, 1
		jmp	short loc_2A3AC

loc_2A3AA:
		xor	ax, ax

loc_2A3AC:
		or	al, al
		jz	short loc_2A3DC
		mov	eax, dword_77B0E
		add	eax, [bp+var_A]
		mov	[bp+var_68], eax
		mov	[bp+var_6C], eax
		mov	eax, [bp+var_4]
		cmp	eax, [bp+var_6C]
		jle	short loc_2A3CF
		mov	ax, 1
		jmp	short loc_2A3D1

loc_2A3CF:
		xor	ax, ax

loc_2A3D1:
		or	al, al
		jz	short loc_2A3DC
		mov	byte_778FC, 1
		jmp	short loc_2A3E1

loc_2A3DC:
		mov	byte_778FC, 0

loc_2A3E1:
		push	0
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+4]
		mov	al, es:[bx+0Ch]
		push	ax
		push	word ptr es:[bx+0Ah]
		push	word ptr es:[bx+8]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	eax, [bp+var_4]
		sar	eax, 8
		push	eax
		les	bx, word ptr [bp+arg_0]
		push	large es:[bx+4]
		push	cs
		call	near ptr Poly_SelectDetailLevel_29AD4
		add	sp, 8
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+9], al
		push	0
		les	bx, es:[bx+4]
		mov	al, es:[bx+0Ch]
		push	ax
		push	word ptr es:[bx+0Ah]
		push	word ptr es:[bx+8]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	[bp+var_14], dx
		mov	[bp+var_16], ax
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+9]
		mov	ah, 0
		shl	ax, 2
		les	bx, es:[bx+4]
		add	bx, ax
		mov	ax, es:[bx+24h]
		mov	dx, es:[bx+22h]
		mov	word ptr [bp+var_1A+2], ax
		mov	word ptr [bp+var_1A], dx
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+9]
		mov	ah, 0
		shl	ax, 1
		les	bx, es:[bx+4]
		add	bx, ax
		mov	ax, es:[bx+42h]
		mov	[bp+var_1C], ax
		cmp	[bp+var_1A], 0
		jnz	short loc_2A488
		jmp	loc_2A7D4

loc_2A488:
		lea	ax, word ptr [bp+var_140]
		push	ax
		call	Damage_ComputeHelperA_58243
		pop	cx
		cmp	[bp+var_5], 0
		jz	short loc_2A4D8
		mov	ax, word ptr [bp+arg_0]
		add	ax, 48h
		push	word ptr [bp+arg_0+2]
		push	ax
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+2]
		mov	bx, [bx+24h]
		push	large [bx+0Ah]
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+2]
		mov	bx, [bx+24h]
		les	bx, [bx+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+10h]
		add	sp, 4
		push	dx
		push	ax
		lea	ax, word ptr [bp+var_140]
		push	ax
		call	Damage_ComputeMainHelper_58322
		add	sp, 0Ah
		jmp	short loc_2A4F2

loc_2A4D8:
		lea	ax, word ptr [bp+var_D4]
		push	ax
		push	62F4h
		lea	ax, [bp+var_110]
		push	ax
		lea	ax, word ptr [bp+var_140]
		push	ax
		call	Damage_ComputeHelperB_58297
		add	sp, 8

loc_2A4F2:
		mov	eax, [bp+var_140]
		mov	[bp+var_20], eax
		mov	eax, [bp+var_20]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+18h], eax
		mov	eax, [bp+var_13C]
		mov	[bp+var_24], eax
		mov	eax, [bp+var_24]
		mov	es:[bx+1Ch], eax
		mov	eax, [bp+var_138]
		mov	[bp+var_28], eax
		mov	eax, [bp+var_28]
		mov	es:[bx+20h], eax
		mov	eax, [bp+var_134]
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_2C]
		mov	es:[bx+24h], eax
		mov	eax, [bp+var_130]
		mov	[bp+var_30], eax
		mov	eax, [bp+var_30]
		mov	es:[bx+28h], eax
		mov	eax, [bp+var_12C]
		mov	[bp+var_34], eax
		mov	eax, [bp+var_34]
		mov	es:[bx+2Ch], eax
		mov	eax, [bp+var_128]
		mov	[bp+var_38], eax
		mov	eax, [bp+var_38]
		mov	es:[bx+30h], eax
		mov	eax, [bp+var_124]
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_3C]
		mov	es:[bx+34h], eax
		mov	eax, [bp+var_120]
		mov	[bp+var_40], eax
		mov	eax, [bp+var_40]
		mov	es:[bx+38h], eax
		mov	eax, [bp+var_11C]
		mov	[bp+var_44], eax
		mov	eax, [bp+var_44]
		mov	es:[bx+3Ch], eax
		mov	eax, [bp+var_118]
		mov	[bp+var_48], eax
		mov	eax, [bp+var_48]
		mov	es:[bx+40h], eax
		mov	eax, [bp+var_114]
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_4C]
		mov	es:[bx+44h], eax
		lea	ax, [bp+var_110]
		push	ax
		lea	ax, word ptr [bp+var_D4]
		push	ax
		call	Matrix_WorldToLocal_5A569
		add	sp, 4
		push	0
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+4]
		mov	al, es:[bx+0Ch]
		push	ax
		push	word ptr es:[bx+0Ah]
		push	word ptr es:[bx+8]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		lea	ax, [bp+var_110]
		push	ax
		lea	ax, word ptr [bp+var_C8]
		push	ax
		call	Matrix_WorldToLocal_5A569
		add	sp, 4
		lea	ax, word ptr [bp+var_C8]
		push	ax
		call	Vector_NormalizeInPlace_57715
		pop	cx
		mov	byte_7795D, 0
		mov	byte ptr [bp+var_54+3], 0
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+2]
		push	large [bx+0Eh]
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+2]
		les	bx, [bx+0Eh]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		cmp	al, 17h
		jz	short loc_2A66A
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+2]
		push	large [bx+0Eh]
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+2]
		les	bx, [bx+0Eh]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		cmp	al, 18h
		jnz	short loc_2A67D

loc_2A66A:
		mov	byte_7795D, 1
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+2]
		mov	al, [bx+119h]
		mov	byte ptr [bp+var_54+3], al

loc_2A67D:
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_29CBE
		add	sp, 4
		xor	di, di
		jmp	loc_2A7A9

loc_2A68D:
		les	bx, word ptr [bp+var_1A]
		mov	ax, [bp+var_14]
		mov	dx, [bp+var_16]
		add	dx, es:[bx]
		mov	word ptr [bp+var_50+2], ax
		mov	word ptr [bp+var_50], dx
		mov	word_77957, 0
		cmp	[bp+var_50], 0
		jnz	short loc_2A6AF
		jmp	loc_2A7A4

loc_2A6AF:
		lea	ax, word ptr [bp+var_D4]
		push	ax
		lea	ax, word ptr [bp+var_140]
		push	ax
		push	word ptr [bp+var_50+2]
		push	dx
		les	bx, word ptr [bp+var_50]
		mov	bx, es:[bx]
		call	dword ptr [bx+14h]
		add	sp, 8
		or	al, al
		jnz	short loc_2A6D0
		jmp	loc_2A7A4

loc_2A6D0:
		lea	ax, word ptr [bp+var_C8]
		push	ax
		push	large [bp+var_50]
		les	bx, word ptr [bp+var_50]
		mov	bx, es:[bx]
		call	dword ptr [bx+20h]
		add	sp, 6
		cmp	byte_7795D, 0
		jz	short loc_2A715
		cmp	byte ptr [bp+var_54+3], 0
		jz	short loc_2A715
		lea	ax, word ptr [bp+var_D4]
		push	ax
		lea	ax, word ptr [bp+var_C8]
		push	ax
		lea	ax, word ptr [bp+var_140]
		push	ax
		push	large [bp+var_50]
		push	si
		push	large [bp+arg_0]
		call	sub_73CE4
		add	sp, 10h
		jmp	loc_2A7A4

loc_2A715:
		push	large [bp+var_50]
		les	bx, word ptr [bp+var_50]
		mov	bx, es:[bx]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	word ptr [bp+var_54], dx
		mov	word ptr [bp+var_56], ax
		cmp	[bp+var_56], 0
		jz	short loc_2A7A4
		mov	eax, [bp+var_56]
		mov	[bp+var_5A], eax
		mov	ax, word_7CBC8
		shl	ax, 2
		mov	dx, word_7CBDC
		sub	dx, 100h
		cmp	ax, dx
		jbe	short loc_2A751
		mov	ax, 1
		jmp	short loc_2A753

loc_2A751:
		xor	ax, ax

loc_2A753:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2A76A
		push	large [bp+var_5A]
		push	6496h
		call	sub_293E7
		add	sp, 6
		jmp	short loc_2A76A

loc_2A76A:
		mov	eax, dword_77959
		sar	eax, 8
		mov	ah, 0
		mov	word ptr [bp+var_5C], ax
		movsx	eax, word ptr [bp+var_5C]
		shl	eax, 8
		mov	[bp+var_60], eax
		les	bx, word ptr [bp+var_56]
		add	es:[bx+2], eax
		cmp	byte_7795D, 0
		jz	short loc_2A7A4
		mov	[bp+var_64], 7D00h
		mov	eax, [bp+var_64]
		add	es:[bx+2], eax

loc_2A7A4:
		inc	di
		add	word ptr [bp+var_1A], 2

loc_2A7A9:
		cmp	di, [bp+var_1C]
		jge	short loc_2A7B1
		jmp	loc_2A68D

loc_2A7B1:
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+9], 0
		jz	short loc_2A7C2
		mov	byte ptr es:[bx+8], 0
		jmp	short loc_2A7D4

loc_2A7C2:
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+8], 1
		jmp	short loc_2A7D4

loc_2A7CC:
		les	bx, word ptr [bp+arg_0]
		or	byte ptr es:[bx+7Ah], 2

loc_2A7D4:
		pop	di
		pop	si
		leave
		retf
sub_29D9F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2A7D8		proc far
		push	bp
		mov	bp, sp
		mov	al, 1
		pop	bp
		retf
sub_2A7D8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2A7DF		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		push	large es:[bx+4]
		push	cs
		call	near ptr sub_29B81
		add	sp, 4
		or	al, al
		jz	short loc_2A81E
		les	bx, [bp+arg_0]
		les	bx, es:[bx+4]
		cmp	word ptr es:[bx+90h], 0
		jz	short loc_2A81E
		les	bx, [bp+arg_0]
		inc	word ptr es:[bx+78h]
		mov	ax, es:[bx+78h]
		les	bx, es:[bx+4]
		cmp	ax, es:[bx+90h]
		jl	short loc_2A81E
		mov	al, 0
		jmp	short loc_2A820

loc_2A81E:
		mov	al, 1

loc_2A820:
		pop	bp
		retf
sub_2A7DF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2A822		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	[bp+arg_4]
		push	large [bp+arg_0]
		push	large 0
		call	sub_73CA5
		add	sp, 0Ah
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		leave
		retf
sub_2A822		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2A842		proc far
		push	bp
		mov	bp, sp
		mov	dword_77959, 0
		pop	bp
		retf
sub_2A842		endp
seg069		ends

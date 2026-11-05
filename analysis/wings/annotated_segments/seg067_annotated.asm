seg067		segment	para public 'CODE' use16
		assume cs:seg067
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 26h, 0C6h, 47h, 8, 0, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2F667		proc far
		push	bp
		mov	bp, sp
		mov	al, 0
		pop	bp
		retf
sub_2F667		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2F66E		proc far
		push	bp
		mov	bp, sp
		mov	al, 1
		pop	bp
		retf
sub_2F66E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Poly_SelectDetailLevel_29AD4 (sub_29AD4 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Poly_SelectDetailLevel_2BCA4 (sub_2BCA4 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; LUE 2026-10-16 (rendu des objets, OBJECT_RENDER.md). CHOIX DU NIVEAU DE DÉTAIL (ex-
; Damage_SelectWeightedComponent, aucun rapport avec les dégâts). Args (apparence, profondeur
; en m entière). Seuil = profondeur × 0B33Ah (179,2) ÷ dword_72202 (échelle de projection).
; Pour i de 7 à 1 : si distance +64h[i] ≠ 0 et distance ≤ seuil → i ; sinon si byte_6E8CE ≥ i
; → i. Sinon 0.
; ==============================================================================================
Poly_SelectDetailLevel_2F675		proc far

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
		mov	ecx, dword_5FF62
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_4], eax
		mov	[bp+var_1E], 8
		jmp	short loc_2F719

loc_2F6D9:
		mov	ax, [bp+var_1E]
		shl	ax, 2
		les	bx, [bp+arg_0]
		add	bx, ax
		cmp	dword ptr es:[bx+68h], 0
		jz	short loc_2F719
		mov	eax, es:[bx+68h]
		mov	[bp+var_22], eax
		shl	eax, 8
		cmp	eax, [bp+var_4]
		jg	short loc_2F704
		mov	ax, 1
		jmp	short loc_2F706

loc_2F704:
		xor	ax, ax

loc_2F706:
		or	al, al
		jz	short loc_2F70F

loc_2F70A:
		mov	al, byte ptr [bp+var_1E]
		jmp	short loc_2F720

loc_2F70F:
		mov	al, byte_5C344
		mov	ah, 0
		cmp	ax, [bp+var_1E]
		jge	short loc_2F70A

loc_2F719:
		dec	[bp+var_1E]
		jg	short loc_2F6D9
		mov	al, 0

loc_2F720:
		leave
		retf
Poly_SelectDetailLevel_2F675		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2F722		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+0A0h]
		cmp	ax, word_5C5AC
		jz	short loc_2F78E
		mov	ax, word_5C5AC
		mov	es:[bx+0A0h], ax
		mov	eax, es:[bx+9Ah]
		sub	eax, dword_5C59E
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jg	short loc_2F779
		mov	ax, [bp+arg_0]
		add	ax, 8Ah
		push	[bp+arg_2]
		push	ax
		call	sub_3865A
		add	sp, 4
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+96h]
		mov	es:[bx+9Ah], eax
		mov	al, 1
		jmp	short loc_2F790

loc_2F779:
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		les	bx, [bp+arg_0]
		mov	es:[bx+9Ah], eax

loc_2F78E:
		mov	al, 0

loc_2F790:
		leave
		retf
sub_2F722		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2F792		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		add	ax, 2Fh
		pop	bp
		retf
sub_2F792		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2F7A0		proc far

arg_0		= word ptr  6
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		mov	al, [bp+arg_4]
		and	ax, 1
		les	bx, [bp+arg_0]
		and	byte ptr es:[bx+9Dh], 0FEh
		or	es:[bx+9Dh], al
		pop	bp
		retf
sub_2F7A0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2F7B9		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	al, es:[bx+9Dh]
		and	ax, 1
		pop	bp
		retf
sub_2F7B9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2F7C9		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	al, es:[bx+9Dh]
		shr	ax, 1
		and	ax, 1
		pop	bp
		retf
sub_2F7C9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2F7DB		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+6]
		add	ax, 12h
		push	ax
		push	word ptr es:[bx+6]
		mov	bx, es:[bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		mov	ax, [bp+arg_0]
		add	ax, 5Fh
		push	[bp+arg_2]
		push	ax
		call	Damage_ComputeHelperC_3B449
		add	sp, 8
		pop	bp
		retf
sub_2F7DB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2F80C		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_2F7DB
		add	sp, 4
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_2F8E8
		add	sp, 4
		pop	bp
		retf
sub_2F80C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2F828		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		les	bx, [bp+arg_0]
		les	bx, es:[bx+2]
		mov	ax, es:[bx+6]
		mov	dx, es:[bx+4]
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		xor	dx, dx
		jmp	short loc_2F854

loc_2F847:
		les	bx, [bp+var_4]
		and	byte ptr es:[bx+29h], 0FEh
		inc	dx
		add	[bp+var_4], 2Ah

loc_2F854:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+2]
		cmp	es:[bx+2], dx
		jg	short loc_2F847
		leave
		retf
sub_2F828		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2F863		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		les	bx, [bp+arg_0]
		les	bx, es:[bx+2]
		mov	ax, es:[bx+6]
		mov	dx, es:[bx+4]
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		xor	dx, dx
		jmp	short loc_2F899

loc_2F882:
		les	bx, [bp+var_4]
		and	byte ptr es:[bx+29h], 0FDh
		and	byte ptr es:[bx+29h], 0FBh
		and	byte ptr es:[bx+29h], 0F7h
		inc	dx
		add	[bp+var_4], 2Ah

loc_2F899:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+2]
		cmp	es:[bx+2], dx
		jg	short loc_2F882
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+6]
		cmp	byte ptr [bx+2Ch], 0
		jz	short loc_2F8E6
		mov	bx, [bp+arg_0]
		les	bx, es:[bx+2]
		mov	ax, es:[bx+6]
		mov	dx, es:[bx+4]
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		xor	dx, dx
		jmp	short loc_2F8D9

loc_2F8CC:
		les	bx, [bp+var_4]
		and	byte ptr es:[bx+29h], 0FEh
		inc	dx
		add	[bp+var_4], 2Ah

loc_2F8D9:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+2]
		cmp	es:[bx+2], dx
		jg	short loc_2F8CC

loc_2F8E6:
		leave
		retf
sub_2F863		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2F8E8		proc far

var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	si
		push	0
		les	bx, [bp+arg_0]
		les	bx, es:[bx+2]
		mov	al, es:[bx+16h]
		push	ax
		push	word ptr es:[bx+14h]
		push	word ptr es:[bx+12h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		les	bx, [bp+arg_0]
		les	bx, es:[bx+2]
		mov	ax, es:[bx+6]
		mov	dx, es:[bx+4]
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		xor	si, si
		jmp	short loc_2F936

loc_2F929:
		les	bx, [bp+var_4]
		and	byte ptr es:[bx+29h], 0FEh
		inc	si
		add	[bp+var_4], 2Ah

loc_2F936:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+2]
		cmp	es:[bx+2], si
		jg	short loc_2F929
		push	0
		mov	al, es:[bx+16h]
		push	ax
		push	word ptr es:[bx+14h]
		push	word ptr es:[bx+12h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		mov	[bp+var_6], dx
		mov	[bp+var_8], ax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+2]
		mov	ax, es:[bx+2Ah]
		mov	dx, es:[bx+28h]
		mov	[bp+var_A], ax
		mov	[bp+var_C], dx
		mov	ax, es:[bx+26h]
		mov	[bp+var_E], ax
		xor	si, si
		jmp	short loc_2F9AB

loc_2F983:
		les	bx, [bp+var_C]
		mov	ax, [bp+var_8]
		add	ax, es:[bx]
		push	[bp+var_6]
		push	ax
		push	es
		les	ax, [bp+var_8]
		mov	dx, es
		pop	es
		add	ax, es:[bx]
		mov	bx, ax
		mov	es, dx
		mov	bx, es:[bx]
		call	dword ptr [bx]
		add	sp, 4
		inc	si
		add	[bp+var_C], 2

loc_2F9AB:
		cmp	si, [bp+var_E]
		jl	short loc_2F983
		pop	si
		leave
		retf
sub_2F8E8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2F9B3		proc far

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
var_F8		= word ptr -0F8h
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
		mov	bx, word_60289
		mov	di, [bx+4]
		inc	di
		mov	eax, [di]
		mov	[bp+var_C8], eax
		mov	eax, [di+4]
		mov	[bp+var_C4], eax
		mov	eax, [di+8]
		mov	[bp+var_C0], eax
		les	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+2], 0
		jnz	short loc_2F9F5
		push	600Ch
		call	sub_9D47
		pop	cx

loc_2F9F5:
		mov	dword_5C347, 0
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+9Dh]
		and	ax, 1
		or	al, al
		jnz	short loc_2FA10
		jmp	loc_30350

loc_2FA10:
		and	byte ptr es:[bx+9Dh], 0FDh
		lea	ax, [bp+var_110]
		push	ax
		call	Formation_ComputeGeometryHelper_3B522
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+8], 0
		mov	bx, es:[bx+6]
		cmp	word ptr [bx+26h], 0
		jz	short loc_2FA38
		mov	ax, 1
		jmp	short loc_2FA3A

loc_2FA38:
		xor	ax, ax

loc_2FA3A:
		mov	[bp+var_5], al
		cmp	[bp+var_5], 0
		jz	short loc_2FA7E
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+6]
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
		push	word ptr es:[bx+6]
		mov	bx, es:[bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+7Ch]
		jmp	short loc_2FAAF

loc_2FA7E:
		les	bx, word ptr [bp+arg_0]
		mov	di, es:[bx+6]
		add	di, 12h
		mov	eax, [di]
		mov	[bp+var_EC], eax
		mov	eax, [di+4]
		mov	[bp+var_E8], eax
		mov	eax, [di+8]
		mov	[bp+var_E4], eax
		push	word ptr es:[bx+6]
		mov	bx, es:[bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]

loc_2FAAF:
		pop	cx
		push	ax
		lea	ax, [bp+var_110]
		push	ax
		call	AI_ComputeGeometryHelper_3B608
		add	sp, 4
		cmp	[bp+var_5], 0
		jnz	short loc_2FAC7
		jmp	loc_2FB4D

loc_2FAC7:
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+6]
		cmp	dword ptr [bx+1Ah], 0
		jge	short loc_2FB4D
		mov	eax, [bp+var_EC]
		sub	eax, [si+14h]
		mov	[bp+var_11C], eax
		mov	eax, [bp+var_E8]
		sub	eax, [si+18h]
		mov	[bp+var_118], eax
		mov	eax, [bp+var_E4]
		sub	eax, [si+1Ch]
		mov	[bp+var_114], eax
		lea	ax, word ptr [bp+var_11C]
		push	ax
		lea	ax, [bp+var_F8]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_24]
		push	ax
		call	Math_DotProduct3D_397FD
		add	sp, 8
		mov	eax, [bp+var_24]
		mov	[bp+var_20], eax
		mov	[bp+var_28], 0
		cmp	[bp+var_20], 0
		jge	short loc_2FB35
		mov	[bp+var_28], 400h

loc_2FB35:
		cmp	[bp+var_20], 0
		jle	short loc_2FB44
		mov	[bp+var_28], 0FFFFFC00h

loc_2FB44:
		mov	eax, [bp+var_28]
		add	dword_5C347, eax

loc_2FB4D:
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
		push	6256h
		lea	ax, word ptr [bp+var_E0]
		push	ax
		call	Matrix_WorldToLocal_3CF4B
		add	sp, 4
		mov	eax, [bp+var_DC]
		mov	[bp+var_4], eax
		les	bx, word ptr [bp+arg_0]
		mov	di, es:[bx+6]
		add	di, 20h
		mov	eax, [di]
		mov	[bp+var_A], eax
		push	large [bp+var_D8]
		push	large [bp+var_DC]
		push	large [bp+var_E0]
		call	Math_VectorLength3D_Raw_3CA71
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_12], eax
		mov	[bp+var_E], eax
		cmp	eax, [bp+var_A]
		jge	short loc_2FBF1
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+2]
		mov	al, es:[bx+88h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2FBEE
		jmp	loc_30359

loc_2FBEE:
		jmp	loc_30032

loc_2FBF1:
		mov	eax, dword_60174
		mov	[bp+var_24], eax
		shl	eax, 8
		mov	[bp+var_28], eax
		mov	eax, [bp+var_28]
		mov	[bp+var_20], eax
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+6]
		mov	bx, es:[bx+6]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_2C+2], dx
		mov	word ptr [bp+var_2C], ax
		cmp	[bp+var_2C], 0
		jnz	short loc_2FC29
		jmp	loc_2FCAC

loc_2FC29:
		les	bx, word ptr [bp+var_2C]
		cmp	byte ptr es:[bx+15h], 1
		jnz	short loc_2FCAC
		mov	eax, [bp+var_20]
		shl	eax, 1
		mov	[bp+var_20], eax
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+6]
		mov	bx, es:[bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		cmp	al, 6
		jnz	short loc_2FCAC
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+6]
		push	ss
		lea	ax, word ptr [bp+var_11C]
		push	ax
		mov	bx, es:[bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+50h]
		add	sp, 6
		push	large [bp+var_114]
		push	large [bp+var_118]
		push	large [bp+var_11C]
		call	Math_VectorLength3D_Raw_3CA71
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_30], eax
		mov	[bp+var_34], eax
		cmp	[bp+var_34], 0
		jnz	short loc_2FC9B
		mov	ax, 1
		jmp	short loc_2FC9D

loc_2FC9B:
		xor	ax, ax

loc_2FC9D:
		or	al, al
		jz	short loc_2FCAC
		mov	eax, [bp+var_20]
		sar	eax, 1
		mov	[bp+var_20], eax

loc_2FCAC:
		mov	eax, [bp+var_20]
		add	eax, [bp+var_A]
		mov	[bp+var_38], eax
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_4]
		cmp	eax, [bp+var_3C]
		jle	short loc_2FCCB
		mov	ax, 1
		jmp	short loc_2FCCD

loc_2FCCB:
		xor	ax, ax

loc_2FCCD:
		or	al, al
		jz	short loc_2FCD4
		jmp	loc_30350

loc_2FCD4:
		mov	eax, dword_5C382
		sub	eax, [bp+var_A]
		mov	[bp+var_40], eax
		mov	[bp+var_44], eax
		mov	eax, [bp+var_4]
		cmp	eax, [bp+var_44]
		jge	short loc_2FCF3
		mov	ax, 1
		jmp	short loc_2FCF5

loc_2FCF3:
		xor	ax, ax

loc_2FCF5:
		or	al, al
		jz	short loc_2FCFC
		jmp	loc_30350

loc_2FCFC:
		mov	eax, [bp+var_A]
		mov	[bp+var_48], eax
		mov	di, si
		add	di, 66h
		mov	eax, [bp+var_48]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_48], eax
		mov	di, si
		add	di, 6Eh
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
		jge	short loc_2FD4D
		neg	eax

loc_2FD4D:
		mov	[bp+var_54], eax
		mov	eax, [bp+var_54]
		mov	[bp+var_58], eax
		cmp	eax, [bp+var_48]
		jle	short loc_2FD64
		mov	ax, 1
		jmp	short loc_2FD66

loc_2FD64:
		xor	ax, ax

loc_2FD66:
		or	al, al
		jz	short loc_2FD6D
		jmp	loc_30350

loc_2FD6D:
		mov	eax, [bp+var_A]
		mov	[bp+var_70], eax
		mov	di, si
		add	di, 6Ah
		mov	eax, [bp+var_70]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_70], eax
		add	si, 72h
		mov	eax, [bp+var_4]
		mov	edx, [si]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_74], eax
		mov	eax, [bp+var_74]
		mov	[bp+var_78], eax
		add	[bp+var_70], eax
		mov	eax, [bp+var_E0]
		or	eax, eax
		jge	short loc_2FDBC
		neg	eax

loc_2FDBC:
		mov	[bp+var_7C], eax
		mov	eax, [bp+var_7C]
		mov	[bp+var_80], eax
		cmp	eax, [bp+var_70]
		jle	short loc_2FDD3
		mov	ax, 1
		jmp	short loc_2FDD5

loc_2FDD3:
		xor	ax, ax

loc_2FDD5:
		or	al, al
		jz	short loc_2FDDC
		jmp	loc_30350

loc_2FDDC:
		mov	eax, [bp+var_4]
		cmp	eax, [bp+var_A]
		jg	short loc_2FDE9
		jmp	loc_2FFD9

loc_2FDE9:
		push	eax
		push	large dword_5FF62
		push	large [bp+var_A]
		call	Math_FixedMulDiv_3C82C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_74], eax
		mov	[bp+var_78], eax
		mov	[bp+var_70], eax
		cmp	[bp+var_70], 19h
		jg	short loc_2FE16
		jmp	loc_30350

loc_2FE16:
		cmp	[bp+var_70], 133h
		jle	short loc_2FE23
		jmp	loc_2FFD9

loc_2FE23:
		cmp	[bp+var_5], 0
		jz	short loc_2FE2C
		jmp	loc_30359

loc_2FE2C:
		mov	eax, [bp+var_4]
		mov	[bp+var_7C], eax
		mov	eax, [bp+var_7C]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+23h], eax
		mov	eax, [bp+var_E0]
		mov	[bp+var_80], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_84], eax
		mov	ax, word_5FF5E
		mov	[bp+var_86], ax
		push	large [bp+var_84]
		push	large dword_5FF62
		push	large [bp+var_80]
		call	Math_FixedMulDiv_3C82C
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
		jle	short loc_2FEBD
		mov	[bp+var_9A], 7D00h
		jmp	short loc_2FED3

loc_2FEBD:
		cmp	[bp+var_9A], 0FFFF8300h
		jge	short loc_2FED3
		mov	[bp+var_9A], 0FFFF8300h
		jmp	short loc_2FED3

loc_2FED3:
		mov	ax, word ptr [bp+var_9A]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+2Ah], ax
		mov	eax, [bp+var_D8]
		mov	[bp+var_9E], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_A2], eax
		mov	ax, word_5FF60
		mov	[bp+var_A4], ax
		push	large [bp+var_A2]
		push	large dword_5FF66
		push	large [bp+var_9E]
		call	Math_FixedMulDiv_3C82C
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
		jle	short loc_2FF55
		mov	[bp+var_B8], 7D00h
		jmp	short loc_2FF6B

loc_2FF55:
		cmp	[bp+var_B8], 0FFFF8300h
		jge	short loc_2FF6B
		mov	[bp+var_B8], 0FFFF8300h
		jmp	short loc_2FF6B

loc_2FF6B:
		mov	ax, word ptr [bp+var_B8]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+2Ch], ax
		mov	word ptr es:[bx+27h], 1Ah
		les	bx, es:[bx+2]
		mov	al, es:[bx+89h]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+29h], al
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 21h
		mov	word ptr [bp+var_BC+2], ax
		mov	word ptr [bp+var_BC], dx
		mov	ax, word_6009C
		shl	ax, 2
		mov	dx, word_600B0
		sub	dx, 100h
		cmp	ax, dx
		jbe	short loc_2FFB4
		mov	ax, 1
		jmp	short loc_2FFB6

loc_2FFB4:
		xor	ax, ax

loc_2FFB6:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2FFCE
		push	large [bp+var_BC]
		push	637Ah
		call	sub_33F39
		add	sp, 6
		jmp	short loc_2FFCE

loc_2FFCE:
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+8], 1
		jmp	loc_30350

loc_2FFD9:
		mov	eax, dword_60174
		mov	[bp+var_5C], eax
		shl	eax, 8
		sub	eax, [bp+var_A]
		mov	[bp+var_60], eax
		mov	[bp+var_64], eax
		mov	eax, [bp+var_4]
		cmp	eax, [bp+var_64]
		jge	short loc_30000
		mov	ax, 1
		jmp	short loc_30002

loc_30000:
		xor	ax, ax

loc_30002:
		or	al, al
		jz	short loc_30032
		mov	eax, dword_5C382
		add	eax, [bp+var_A]
		mov	[bp+var_68], eax
		mov	[bp+var_6C], eax
		mov	eax, [bp+var_4]
		cmp	eax, [bp+var_6C]
		jle	short loc_30025
		mov	ax, 1
		jmp	short loc_30027

loc_30025:
		xor	ax, ax

loc_30027:
		or	al, al
		jz	short loc_30032
		mov	byte_5C354, 1
		jmp	short loc_30037

loc_30032:
		mov	byte_5C354, 0

loc_30037:
		push	0
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+2]
		mov	al, es:[bx+16h]
		push	ax
		push	word ptr es:[bx+14h]
		push	word ptr es:[bx+12h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		mov	eax, [bp+var_4]
		sar	eax, 8
		push	eax
		les	bx, word ptr [bp+arg_0]
		push	large es:[bx+2]
		push	cs
		call	near ptr Poly_SelectDetailLevel_2F675
		add	sp, 8
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+2Eh], al
		push	0
		les	bx, es:[bx+2]
		mov	al, es:[bx+16h]
		push	ax
		push	word ptr es:[bx+14h]
		push	word ptr es:[bx+12h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		mov	[bp+var_14], dx
		mov	[bp+var_16], ax
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+2Eh]
		mov	ah, 0
		shl	ax, 2
		les	bx, es:[bx+2]
		add	bx, ax
		mov	ax, es:[bx+32h]
		mov	dx, es:[bx+30h]
		mov	word ptr [bp+var_1A+2], ax
		mov	word ptr [bp+var_1A], dx
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+2Eh]
		mov	ah, 0
		shl	ax, 1
		les	bx, es:[bx+2]
		add	bx, ax
		mov	ax, es:[bx+50h]
		mov	[bp+var_1C], ax
		cmp	[bp+var_1A], 0
		jnz	short loc_300DE
		jmp	loc_30359

loc_300DE:
		lea	ax, word ptr [bp+var_140]
		push	ax
		call	Damage_ComputeHelperA_3AC59
		pop	cx
		cmp	[bp+var_5], 0
		jz	short loc_3012E
		mov	ax, word ptr [bp+arg_0]
		add	ax, 5Fh
		push	word ptr [bp+arg_0+2]
		push	ax
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+6]
		mov	bx, [bx+24h]
		push	large [bx+0Ah]
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+6]
		mov	bx, [bx+24h]
		les	bx, [bx+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+10h]
		add	sp, 4
		push	dx
		push	ax
		lea	ax, word ptr [bp+var_140]
		push	ax
		call	Damage_ComputeMainHelper_3AD38
		add	sp, 0Ah
		jmp	short loc_30148

loc_3012E:
		lea	ax, word ptr [bp+var_D4]
		push	ax
		push	6256h
		lea	ax, [bp+var_110]
		push	ax
		lea	ax, word ptr [bp+var_140]
		push	ax
		call	Damage_ComputeHelperB_3ACAD
		add	sp, 8

loc_30148:
		mov	eax, [bp+var_140]
		mov	[bp+var_20], eax
		mov	eax, [bp+var_20]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+2Fh], eax
		mov	eax, [bp+var_13C]
		mov	[bp+var_24], eax
		mov	eax, [bp+var_24]
		mov	es:[bx+33h], eax
		mov	eax, [bp+var_138]
		mov	[bp+var_28], eax
		mov	eax, [bp+var_28]
		mov	es:[bx+37h], eax
		mov	eax, [bp+var_134]
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_2C]
		mov	es:[bx+3Bh], eax
		mov	eax, [bp+var_130]
		mov	[bp+var_30], eax
		mov	eax, [bp+var_30]
		mov	es:[bx+3Fh], eax
		mov	eax, [bp+var_12C]
		mov	[bp+var_34], eax
		mov	eax, [bp+var_34]
		mov	es:[bx+43h], eax
		mov	eax, [bp+var_128]
		mov	[bp+var_38], eax
		mov	eax, [bp+var_38]
		mov	es:[bx+47h], eax
		mov	eax, [bp+var_124]
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_3C]
		mov	es:[bx+4Bh], eax
		mov	eax, [bp+var_120]
		mov	[bp+var_40], eax
		mov	eax, [bp+var_40]
		mov	es:[bx+4Fh], eax
		mov	eax, [bp+var_11C]
		mov	[bp+var_44], eax
		mov	eax, [bp+var_44]
		mov	es:[bx+53h], eax
		mov	eax, [bp+var_118]
		mov	[bp+var_48], eax
		mov	eax, [bp+var_48]
		mov	es:[bx+57h], eax
		mov	eax, [bp+var_114]
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_4C]
		mov	es:[bx+5Bh], eax
		lea	ax, [bp+var_110]
		push	ax
		lea	ax, word ptr [bp+var_D4]
		push	ax
		call	Matrix_WorldToLocal_3CF4B
		add	sp, 4
		push	0
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+2]
		mov	al, es:[bx+16h]
		push	ax
		push	word ptr es:[bx+14h]
		push	word ptr es:[bx+12h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		lea	ax, [bp+var_110]
		push	ax
		lea	ax, word ptr [bp+var_C8]
		push	ax
		call	Matrix_WorldToLocal_3CF4B
		add	sp, 4
		lea	ax, word ptr [bp+var_C8]
		push	ax
		call	Vector_NormalizeInPlace_3A0DC
		pop	cx
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_2F863
		add	sp, 4
		xor	si, si
		jmp	loc_3033E

loc_30283:
		les	bx, word ptr [bp+var_1A]
		mov	ax, [bp+var_14]
		mov	dx, [bp+var_16]
		add	dx, es:[bx]
		mov	word ptr [bp+var_50+2], ax
		mov	word ptr [bp+var_50], dx
		mov	word_5C345, 0
		cmp	[bp+var_50], 0
		jnz	short loc_302A5
		jmp	loc_30339

loc_302A5:
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
		jz	short loc_30339
		lea	ax, word ptr [bp+var_C8]
		push	ax
		push	large [bp+var_50]
		les	bx, word ptr [bp+var_50]
		mov	bx, es:[bx]
		call	dword ptr [bx+20h]
		add	sp, 6
		push	large [bp+var_50]
		les	bx, word ptr [bp+var_50]
		mov	bx, es:[bx]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	word ptr [bp+var_54+2], dx
		mov	word ptr [bp+var_54], ax
		cmp	[bp+var_54], 0
		jz	short loc_30339
		mov	eax, [bp+var_54]
		mov	[bp+var_58], eax
		mov	ax, word_6009C
		shl	ax, 2
		mov	dx, word_600B0
		sub	dx, 100h
		cmp	ax, dx
		jbe	short loc_30314
		mov	ax, 1
		jmp	short loc_30316

loc_30314:
		xor	ax, ax

loc_30316:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_3032D
		push	large [bp+var_58]
		push	637Ah
		call	sub_33F39
		add	sp, 6
		jmp	short loc_3032D

loc_3032D:
		les	bx, word ptr [bp+var_54]
		mov	eax, dword_5C347
		add	es:[bx+2], eax

loc_30339:
		inc	si
		add	word ptr [bp+var_1A], 2

loc_3033E:
		cmp	si, [bp+var_1C]
		jge	short loc_30346
		jmp	loc_30283

loc_30346:
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+8], 1
		jmp	short loc_30359

loc_30350:
		les	bx, word ptr [bp+arg_0]
		or	byte ptr es:[bx+9Dh], 2

loc_30359:
		pop	di
		pop	si
		leave
		retf
sub_2F9B3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3035D		proc far
		push	bp
		mov	bp, sp
		mov	al, 1
		pop	bp
		retf
sub_3035D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_30364		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		push	large es:[bx+2]
		push	cs
		call	near ptr sub_2F722
		add	sp, 4
		or	al, al
		jz	short loc_303A5
		les	bx, [bp+arg_0]
		les	bx, es:[bx+2]
		cmp	word ptr es:[bx+9Eh], 0
		jz	short loc_303A5
		les	bx, [bp+arg_0]
		inc	word ptr es:[bx+9Bh]
		mov	ax, es:[bx+9Bh]
		les	bx, es:[bx+2]
		cmp	ax, es:[bx+9Eh]
		jl	short loc_303A5
		mov	al, 0
		jmp	short loc_303A7

loc_303A5:
		mov	al, 1

loc_303A7:
		pop	bp
		retf
sub_30364		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_303A9		proc far

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
		call	sub_594A5
		add	sp, 0Ah
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		leave
		retf
sub_303A9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_303C9		proc far
		push	bp
		mov	bp, sp
sub_303C9		endp

; START OF FUNCTION CHUNK FOR sub_303C9
		db 66h, 0C7h
		push	es
		daa
; END OF FUNCTION CHUNK FOR sub_303C9
seg067		ends

seg106		segment	para public 'CODE' use16
		assume cs:seg106
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 56h, 8Bh, 1Ch, 0FFh, 5Fh, 3Ch, 59h, 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_42DDA		proc far
		push	bp
		mov	bp, sp
		mov	al, 14h
		pop	bp
		retf
sub_42DDA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_42DE1		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_42E29
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 1E04h
		push	0
		push	word ptr [bp+arg_0+2]
		push	bx
		call	sub_3C42E
		add	sp, 6
		test	si, 1
		jz	short loc_42E29
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8

loc_42E29:
		pop	si
		leave
		retf
sub_42DE1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_42E2C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 14h
		pop	bp
		retf
sub_42E2C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_42E36		proc far

var_1C		= dword ptr -1Ch
var_18		= word ptr -18h
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 1
		mov	ax, [bp+arg_2]
		mov	[si+5Ah], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		push	ax
		mov	ax, si
		add	ax, 5Ch
		push	ax
		call	SetReference16
		add	sp, 4
		mov	di, [bp+arg_6]
		mov	eax, [di]
		mov	[si+5Eh], eax
		mov	eax, [di+4]
		mov	[si+62h], eax
		mov	eax, [di+8]
		mov	[si+66h], eax
		cmp	word ptr [si+5Ah], 0A5h
		jnz	short loc_42EF2
		mov	di, si
		add	di, 12h
		mov	ax, si
		add	ax, 16h
		mov	[bp+var_E], ax
		mov	eax, [di]
		mov	[bp+var_C], eax
		mov	bx, [bp+var_E]
		mov	eax, [bx]
		mov	[bp+var_8], eax
		mov	di, si
		add	di, 5Eh
		mov	ax, si
		add	ax, 62h
		mov	[bp+var_18], ax
		mov	eax, [di]
		mov	[bp+var_16], eax
		mov	bx, [bp+var_18]
		mov	eax, [bx]
		mov	[bp+var_12], eax
		lea	ax, word ptr [bp+var_16]
		push	ax
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_1C]
		push	ax
		call	Math_Distance2D_58192
		add	sp, 8
		cmp	[bp+var_1C], 6400h
		jge	short loc_42EE2
		mov	ax, 1
		jmp	short loc_42EE4

loc_42EE2:
		xor	ax, ax

loc_42EE4:
		or	al, al
		jz	short loc_42EF2
		mov	word ptr [si+5Ah], 0
		mov	[bp+var_2], 0

loc_42EF2:
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
sub_42E36		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_42EF9		proc far

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
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 24h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	dx, si
		add	dx, 12h
		mov	eax, [di]
		mov	bx, dx
		sub	eax, [bx]
		mov	[bp+var_18], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp+var_14], eax
		mov	eax, [di+8]
		sub	eax, [bx+8]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_24], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_20], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_24]
		mov	[bp+var_C], eax
		mov	eax, [bp+var_20]
		mov	[bp+var_8], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_4], eax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		lea	ax, word ptr [bp+var_C]
		push	ax
		call	Matrix_WorldToLocal_5A569
		add	sp, 4
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_42F85
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_42EF9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_42F85		proc far

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
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		call	Vector_NormalizeInPlace_57715
		pop	cx
		push	di
		push	ss
		lea	ax, word ptr [bp+var_C]
		push	ax
		call	Math_AsinDeg_567D3
		add	sp, 6
		mov	eax, [bp+var_C]
		mov	[bp+var_4], eax
		les	bx, [si+0Eh]
		mov	bx, es:[bx+49h]
		mov	eax, [bx+2Ch]
		mov	edx, dword_7976E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_14], eax
		mov	[bp+var_8], eax
		mov	eax, [bp+var_4]
		cmp	eax, [bp+var_8]
		jle	short loc_42FE7
		mov	ax, 1
		jmp	short loc_42FE9

loc_42FE7:
		xor	ax, ax

loc_42FE9:
		or	al, al
		jz	short loc_42FF3
		mov	eax, [bp+var_8]
		jmp	short loc_43026

loc_42FF3:
		mov	eax, [bp+var_8]
		neg	eax
		mov	[bp+var_18], eax
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_4]
		cmp	eax, [bp+var_1C]
		jge	short loc_43011
		mov	ax, 1
		jmp	short loc_43013

loc_43011:
		xor	ax, ax

loc_43013:
		or	al, al
		jz	short loc_4302A
		mov	eax, [bp+var_8]
		neg	eax
		mov	[bp+var_20], eax
		mov	[bp+var_24], eax

loc_43026:
		mov	[bp+var_4], eax

loc_4302A:
		cmp	si, word_7CD76
		jnz	short loc_4303E
		cmp	[bp+var_4], 0
		jnz	short loc_4303C
		mov	ax, 1
		jmp	short loc_4303E

loc_4303C:
		xor	ax, ax

loc_4303E:
		cmp	[bp+var_4], 0
		jz	short loc_4304A
		mov	ax, 1
		jmp	short loc_4304C

loc_4304A:
		xor	ax, ax

loc_4304C:
		or	al, al
		jnz	short loc_43053
		jmp	loc_43152

loc_43053:
		push	si
		push	ss
		lea	ax, word ptr [bp+var_4C]
		push	ax
		mov	bx, [si]
		call	dword ptr [bx+50h]
		add	sp, 6
		push	large [bp+var_44]
		push	large [bp+var_48]
		push	large [bp+var_4C]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_2C], eax
		mov	[bp+var_28], eax
		mov	eax, [bp+var_4C]
		mov	[bp+var_34], eax
		mov	eax, [bp+var_48]
		mov	[bp+var_30], eax
		lea	di, word ptr [bp+var_34]
		mov	eax, [di]
		mov	[bp+var_38], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_3C], eax
		mov	[bp+var_40], eax
		push	eax
		call	sub_59E37
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_40], eax
		push	large [bp+var_3C]
		call	Math_CosRaw_59E7D
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_34]
		mov	edx, [bp+var_3C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_34], eax
		push	large [bp+var_40]
		push	large [bp+var_30]
		call	Math_FixedMultiply_59E08
		push	dx
		push	ax
		pop	eax
		add	sp, 8
		add	[bp+var_34], eax
		mov	eax, [bp+var_30]
		mov	edx, [bp+var_3C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_30], eax
		push	large [bp+var_40]
		push	large [bp+var_38]
		call	Math_FixedMultiply_59E08
		push	dx
		push	ax
		pop	eax
		add	sp, 8
		sub	[bp+var_30], eax
		mov	eax, [bp+var_34]
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_30]
		mov	[bp+var_48], eax
		lea	ax, word ptr [bp+var_28]
		push	ax
		lea	ax, word ptr [bp+var_4C]
		push	ax
		call	Vector_SetLength_57879
		add	sp, 4
		lea	ax, word ptr [bp+var_4C]
		push	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+54h]
		add	sp, 4

loc_43152:
		pop	di
		pop	si
		leave
		retf
sub_42F85		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 6 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GroundObj_AccelerateToCruise_45675 (sub_45675 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; 144L, LUE 2026-10-15. ACCELERATION D'UN OBJET GRND en route (etat 0xA5) : v = vitesse
; (vtable+0x4C) ; si |v| < 0xC80 (12,5 m/s) : direction = v (ou le nez, ligne 1 de
; l'orientation, si v = 0), increment = min(0x40 = 0,25 m/s, 12,5 - |v|), v +=
; Vector_SetLength_55A9E(direction, increment), ecrit (vtable+0x50). PAR FRAME (pas de dt) :
; +0,25 m/s par frame jusqu'a 12,5 m/s. Ex-'GroundObj_AccelerateToCruise_45675'.
; ==============================================================================================
GroundObj_AccelerateToCruise_43156		proc far

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
		push	si
		push	ss
		lea	ax, word ptr [bp+var_2C]
		push	ax
		mov	bx, [si]
		call	dword ptr [bx+50h]
		add	sp, 6
		mov	eax, [bp+var_2C]
		mov	[bp+var_38], eax
		mov	eax, [bp+var_28]
		mov	[bp+var_34], eax
		mov	eax, [bp+var_24]
		mov	[bp+var_30], eax
		push	eax
		push	large [bp+var_28]
		push	large [bp+var_2C]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_8], eax
		mov	[bp+var_4], eax
		mov	[bp+var_10], 0C80h
		mov	eax, [bp+var_10]
		mov	[bp+var_C], eax
		mov	eax, [bp+var_4]
		cmp	eax, [bp+var_C]
		jge	short loc_431C4
		mov	ax, 1
		jmp	short loc_431C6

loc_431C4:
		xor	ax, ax

loc_431C6:
		or	al, al
		jnz	short loc_431CD
		jmp	loc_43274

loc_431CD:
		cmp	[bp+var_4], 0
		jnz	short loc_431D9
		mov	ax, 1
		jmp	short loc_431DB

loc_431D9:
		xor	ax, ax

loc_431DB:
		or	al, al
		jz	short loc_43202
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	di, ax
		mov	eax, [di]
		mov	[bp+var_38], eax
		mov	eax, [di+4]
		mov	[bp+var_34], eax
		mov	eax, [di+8]
		mov	[bp+var_30], eax

loc_43202:
		mov	[bp+var_18], 40h
		mov	eax, [bp+var_18]
		mov	[bp+var_14], eax
		mov	eax, [bp+var_C]
		sub	eax, [bp+var_4]
		mov	[bp+var_1C], eax
		mov	[bp+var_20], eax
		cmp	eax, [bp+var_14]
		jge	short loc_4322D
		mov	ax, 1
		jmp	short loc_4322F

loc_4322D:
		xor	ax, ax

loc_4322F:
		or	al, al
		jz	short loc_4323F
		mov	eax, [bp+var_C]
		sub	eax, [bp+var_4]
		mov	[bp+var_14], eax

loc_4323F:
		lea	ax, word ptr [bp+var_14]
		push	ax
		lea	ax, word ptr [bp+var_38]
		push	ax
		call	Vector_SetLength_57879
		add	sp, 4
		mov	eax, [bp+var_38]
		add	[bp+var_2C], eax
		mov	eax, [bp+var_34]
		add	[bp+var_28], eax
		mov	eax, [bp+var_30]
		add	[bp+var_24], eax
		lea	ax, word ptr [bp+var_2C]
		push	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+54h]
		add	sp, 4

loc_43274:
		pop	di
		pop	si
		leave
		retf
GroundObj_AccelerateToCruise_43156		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 6 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GroundObj_Decelerate_45797 (sub_45797 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, 127L, LUE
; 2026-10-15. FREINAGE D'UN OBJET GRND (tout etat autre que 0xA5) : si |v| > 0 : v -=
; Vector_SetLength_55A9E(v, min(0x40 = 0,25 m/s, |v|)) ; l'objet s'arrete a raison de 0,25 m/s
; par frame. Ex-'GroundObj_Decelerate_45797'.
; ==============================================================================================
GroundObj_Decelerate_43278		proc far

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
		sub	sp, 40h
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	ss
		lea	ax, word ptr [bp+var_1C]
		push	ax
		mov	bx, [si]
		call	dword ptr [bx+50h]
		add	sp, 6
		mov	eax, [bp+var_1C]
		mov	[bp+var_28], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_24], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_20], eax
		push	eax
		push	large [bp+var_18]
		push	large [bp+var_1C]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_8], eax
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jle	short loc_432D2
		mov	ax, 1
		jmp	short loc_432D4

loc_432D2:
		xor	ax, ax

loc_432D4:
		or	al, al
		jnz	short loc_432DB
		jmp	loc_43361

loc_432DB:
		mov	[bp+var_10], 40h
		mov	eax, [bp+var_10]
		mov	[bp+var_C], eax
		mov	eax, [bp+var_4]
		cmp	eax, [bp+var_C]
		jge	short loc_432FA
		mov	ax, 1
		jmp	short loc_432FC

loc_432FA:
		xor	ax, ax

loc_432FC:
		or	al, al
		jz	short loc_43308
		mov	eax, [bp+var_4]
		mov	[bp+var_C], eax

loc_43308:
		lea	ax, word ptr [bp+var_C]
		push	ax
		lea	ax, word ptr [bp+var_1C]
		push	ax
		call	Vector_SetLength_57879
		add	sp, 4
		mov	eax, [bp+var_28]
		sub	eax, [bp+var_1C]
		mov	[bp+var_34], eax
		mov	eax, [bp+var_24]
		sub	eax, [bp+var_18]
		mov	[bp+var_30], eax
		mov	eax, [bp+var_20]
		sub	eax, [bp+var_14]
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_34]
		mov	[bp+var_40], eax
		mov	eax, [bp+var_30]
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_2C]
		mov	[bp+var_38], eax
		lea	ax, word ptr [bp+var_40]
		push	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+54h]
		add	sp, 4

loc_43361:
		pop	si
		leave
		retf
GroundObj_Decelerate_43278		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_43364		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	StreamReader_DestructWrapper_3B3C6
		pop	cx
		or	al, al
		jz	short loc_433A5
		cmp	word ptr [si+5Ah], 0A5h
		jnz	short loc_43393
		push	si
		push	cs
		call	near ptr GroundObj_AccelerateToCruise_43156
		pop	cx
		mov	ax, si
		add	ax, 5Eh
		push	ax
		push	si
		push	cs
		call	near ptr sub_42EF9
		add	sp, 4
		jmp	short loc_43399

loc_43393:
		push	si
		push	cs
		call	near ptr GroundObj_Decelerate_43278
		pop	cx

loc_43399:
		push	si
		mov	bx, [si]
		call	dword ptr [bx+90h]
		pop	cx
		mov	al, 1
		jmp	short loc_433A7

loc_433A5:
		mov	al, 0

loc_433A7:
		pop	si
		pop	bp
		retf
sub_43364		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_433AA		proc far

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
		cmp	word ptr [si+52h], 0
		jz	short loc_43436
		mov	di, [si+52h]
		add	di, 2
		mov	eax, [di]
		mov	edx, dword_79774
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		mov	eax, [di+4]
		mov	edx, dword_79774
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_10], eax
		mov	eax, [di+8]
		mov	edx, dword_79774
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_38], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_34], eax
		mov	dx, ss
		lea	ax, word ptr [bp+var_3C]
		jmp	short loc_43453

loc_43436:
		mov	eax, dword_79CEC
		mov	[bp+var_3C], eax
		mov	eax, dword_79CF0
		mov	[bp+var_38], eax
		mov	eax, dword_79CF4
		mov	[bp+var_34], eax
		mov	dx, ss
		lea	ax, word ptr [bp+var_3C]

loc_43453:
		push	large [bp+var_34]
		push	large [bp+var_38]
		push	large [bp+var_3C]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_20], eax
		mov	[bp+var_1C], eax
		cmp	[bp+var_1C], 0
		jle	short loc_4347F
		mov	ax, 1
		jmp	short loc_43481

loc_4347F:
		xor	ax, ax

loc_43481:
		or	al, al
		jnz	short loc_43488
		jmp	loc_4352A

loc_43488:
		lea	ax, word ptr [bp+var_34]
		push	ax
		lea	ax, word ptr [bp+var_38]
		push	ax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	si
		call	WorldObject_TranslateBy_36A6C
		add	sp, 8
		push	1
		lea	ax, word ptr [bp+var_30]
		push	ax
		mov	ax, si
		add	ax, 12h
		push	ax
		push	word_79788
		push	ss
		lea	ax, word ptr [bp+var_24]
		push	ax
		call	Ground_HeightUnderPoint_3664D
		add	sp, 0Ch
		mov	eax, [bp+var_24]
		mov	[si+1Ah], eax
		mov	eax, [bp+var_3C]
		mov	[bp+var_48], eax
		mov	eax, [bp+var_38]
		mov	[bp+var_44], eax
		mov	eax, [bp+var_34]
		mov	[bp+var_40], eax
		lea	ax, word ptr [bp+var_48]
		push	ax
		call	Vector_NormalizeInPlace_57715
		pop	cx
		mov	eax, [bp+var_48]
		mov	[si+39h], eax
		mov	eax, [bp+var_44]
		mov	[si+3Dh], eax
		mov	eax, [bp+var_40]
		mov	[si+41h], eax
		mov	ax, si
		add	ax, 39h
		mov	eax, [bp+var_30]
		mov	[si+45h], eax
		mov	eax, [bp+var_2C]
		mov	[si+49h], eax
		mov	eax, [bp+var_28]
		mov	[si+4Dh], eax
		mov	ax, si
		add	ax, 45h
		mov	ax, si
		add	ax, 2Dh
		push	ax
		call	Matrix_ApplyToVectorZ_594AE
		pop	cx

loc_4352A:
		pop	di
		pop	si
		leave
		retf
sub_433AA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Widget_SetFlagBit0_F898 (sub_F898 de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : code identique instruction par instruction à Widget_SetFlagBit0_A127B
; (sub_A127B de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, pose le bit 0 du champ de flags (+0x10) d'un widget.
; ==============================================================================================
Widget_SetFlagBit0_4352E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	byte ptr [si+2], 40h
		pop	si
		pop	bp
		retf
Widget_SetFlagBit0_4352E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4353C		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	large [bp+arg_2]
		push	si
		call	sub_3C4B2
		add	sp, 6
		push	si
		push	cs
		call	near ptr Widget_SetFlagBit0_4352E
		pop	cx
		pop	si
		pop	bp
		retf
sub_4353C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_43559		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_43590
		mov	word ptr [si], 2658h
		mov	ax, si
		add	ax, 5Ch
		push	ax
		call	WeakRef_InvalidateIfSet
		pop	cx
		push	0
		push	si
		call	sub_3C510
		add	sp, 4
		test	di, 1
		jz	short loc_43590
		push	si
		call	sub_3B2
		pop	cx
sub_43559		endp
seg106		ends

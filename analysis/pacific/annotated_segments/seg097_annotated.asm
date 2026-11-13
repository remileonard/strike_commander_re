seg097		segment	para public 'CODE' use16
		assume cs:seg097
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 83h, 0C4h, 8, 0B0h, 0

loc_3CA65:
		db 5Fh, 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE EN PARTIE 2026-11-13. Contact d'un avion (arg 2) avec un objet (arg 3). Objet de
; type 23 (méthode +52 ; le porte-avions) : hauteur = dword_7CDE6 (1er champ de CARD, 33 m) ;
; le calcul hauteur + garde au sol (Aircraft_GroundClearance_3DF89) − 2 m est fait puis écrasé
; par 2100h (33 m exactement). Si c'est le joueur : SetReference16(6646h, objet). Si
; l'altitude de l'avion est sous 33 m : altitude = sol sous le point
; (Ground_HeightUnderPoint_3664D) + 33 m. Avion « au sol » ([dynamique+32] = 1), train sorti
; noté dans byte_78EB9 ; renvoie 0 (pas d'écrasement). Objet TERRAIN : autre branche (vitesse
; > 20 m/s, sol + garde, byte_776BC = 1), non détaillée. Appelant non tracé (méthode de
; contact).
; ==============================================================================================
Aircraft_ContactWithObject_3CA69		proc far

var_78		= dword ptr -78h
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
var_46		= word ptr -46h
var_44		= dword ptr -44h
var_42		= dword ptr -42h
var_40		= dword ptr -40h
var_3E		= dword ptr -3Eh
var_3C		= dword ptr -3Ch
var_3A		= dword ptr -3Ah
var_38		= dword ptr -38h
var_36		= dword ptr -36h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_12		= dword ptr -12h
var_10		= dword ptr -10h
var_E		= dword ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= byte ptr -8
var_6		= dword ptr -6
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 6Eh
		push	si
		push	di
		mov	di, [bp+arg_4]
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+49h]
		mov	bx, es:[bx+49h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	bx, ax
		mov	al, [bx+92h]
		shr	ax, 5
		and	ax, 1
		mov	[bp+var_1], al
		mov	si, di
		mov	eax, [si+5Ah]
		mov	[bp+var_6], eax
		mov	[bp+var_8], 1Ch
		push	[bp+arg_6]
		mov	bx, [bp+arg_6]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		or	ax, dx
		jz	short loc_3CAC0
		push	[bp+arg_6]
		mov	bx, [bp+arg_6]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		mov	[bp+var_8], al

loc_3CAC0:
		cmp	[bp+var_8], 8
		jnz	short loc_3CAD3
		mov	bx, [bp+arg_6]
		cmp	[bx+5Ch], di
		jnz	short loc_3CAD3
		mov	al, 0
		jmp	loc_3D015

loc_3CAD3:
		push	8
		push	ds
		push	offset aTERRAIN
		mov	bx, [bp+arg_6]
		push	large [bx+6]
		call	CRT_MemFamily_Extra7
		add	sp, 0Ah
		or	ax, ax
		jnz	short loc_3CAF1
		mov	ax, 1
		jmp	short loc_3CAF3

loc_3CAF1:
		xor	ax, ax

loc_3CAF3:
		or	al, al
		jnz	short loc_3CB00
		cmp	[bp+var_8], 17h
		jz	short loc_3CB00
		jmp	loc_3CEED

loc_3CB00:
		cmp	[bp+var_8], 17h
		jz	short loc_3CB09
		jmp	loc_3CC02

loc_3CB09:
		mov	eax, dword_7CDE6
		mov	[bp+var_C], eax
		push	di
		push	ss
		lea	ax, word ptr [bp+var_10]
		push	ax
		call	Aircraft_GroundClearance_3DF89
		add	sp, 6
		mov	eax, [bp+var_10]
		add	[bp+var_C], eax
		sub	[bp+var_C], 200h
		mov	[bp+var_14], 2100h
		mov	eax, [bp+var_14]
		mov	[bp+var_C], eax
		cmp	di, word_7CADA
		jnz	short loc_3CB57
		mov	ax, [bp+arg_6]
		mov	word ptr [bp+var_18+2], ax
		push	ax
		push	6646h
		call	SetReference16
		add	sp, 4

loc_3CB57:
		mov	eax, [di+1Ah]
		cmp	eax, [bp+var_C]
		jge	short loc_3CB66
		mov	ax, 1
		jmp	short loc_3CB68

loc_3CB66:
		xor	ax, ax

loc_3CB68:
		or	al, al
		jz	short loc_3CBCF
		mov	ax, di
		add	ax, 1Ah
		mov	word ptr [bp+var_18], ax
		push	0
		mov	[bp+var_1C], 0
		mov	eax, [bp+var_1C]
		mov	[bp+var_56], eax
		mov	[bp+var_20], 0
		mov	eax, [bp+var_20]
		mov	[bp+var_52], eax
		mov	[bp+var_24], 100h
		mov	eax, [bp+var_24]
		mov	[bp+var_4E], eax
		lea	ax, word ptr [bp+var_56]
		push	ax
		mov	ax, di
		add	ax, 12h
		push	ax
		push	word_79788
		push	ss
		lea	ax, word ptr [bp+var_28]
		push	ax
		call	Ground_HeightUnderPoint_3664D
		add	sp, 0Ch
		mov	eax, [bp+var_C]
		add	eax, [bp+var_28]
		mov	bx, word ptr [bp+var_18]
		mov	[bx], eax

loc_3CBCF:
		push	word ptr [si+52h]
		mov	bx, [si+52h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	bx, ax
		mov	al, [bx+92h]
		shr	ax, 2
		and	ax, 1
		or	al, al
		jz	short loc_3CBF0
		or	byte_78EB9, 1

loc_3CBF0:
		mov	byte ptr [bp+var_2C+3], 1
		mov	bx, [si+52h]
		mov	al, byte ptr [bp+var_2C+3]
		mov	[bx+20h], al
		mov	al, 0
		jmp	loc_3D015

loc_3CC02:
		mov	bx, [si+52h]
		mov	al, [bx+20h]
		mov	byte ptr [bp+var_C+3], al
		cmp	word_7CADA, di
		jnz	short loc_3CC28
		cmp	byte ptr [bp+var_C+3], 0
		jz	short loc_3CC23
		cmp	byte_776BC, 0
		jz	short loc_3CC23
		mov	ax, 1
		jmp	short loc_3CC25

loc_3CC23:
		xor	ax, ax

loc_3CC25:
		mov	byte ptr [bp+var_C+3], al

loc_3CC28:
		mov	al, byte ptr [bp+var_C+3]
		mov	ah, 0
		or	ax, ax
		jz	short loc_3CC34
		jmp	loc_3CDF3

loc_3CC34:
		push	word ptr [si+52h]
		mov	bx, [si+52h]
		mov	bx, [bx]
		call	dword ptr [bx+14h]
		pop	cx
		mov	bx, [si+52h]
		mov	al, [bx+20h]
		mov	byte ptr [bp+var_C+3], al
		cmp	byte ptr [bp+var_C+3], 0
		jnz	short loc_3CC52
		jmp	loc_3CDF3

loc_3CC52:
		push	8
		push	ds
		push	offset aTERRAIN
		mov	bx, [bp+arg_6]
		push	large [bx+6]
		call	CRT_MemFamily_Extra7
		add	sp, 0Ah
		or	ax, ax
		jnz	short loc_3CC70
		mov	ax, 1
		jmp	short loc_3CC72

loc_3CC70:
		xor	ax, ax

loc_3CC72:
		or	al, al
		jnz	short loc_3CC79
		jmp	loc_3CD35

loc_3CC79:
		push	di
		push	ss
		lea	ax, word ptr [bp+var_56]
		push	ax
		mov	bx, [di]
		call	dword ptr [bx+50h]
		add	sp, 6
		push	large [bp+var_4E]
		push	large [bp+var_52]
		push	large [bp+var_56]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_E], eax
		mov	[bp+var_12], eax
		cmp	[bp+var_12], 1400h
		jle	short loc_3CCB6
		mov	ax, 1
		jmp	short loc_3CCB8

loc_3CCB6:
		xor	ax, ax

loc_3CCB8:
		or	al, al
		jz	short loc_3CD2D
		mov	ax, di
		add	ax, 1Ah
		mov	word ptr [bp+var_14], ax
		push	1
		mov	[bp+var_18], 0
		mov	eax, [bp+var_18]
		mov	[bp+var_62], eax
		mov	[bp+var_1C], 0
		mov	eax, [bp+var_1C]
		mov	[bp+var_5E], eax
		mov	[bp+var_20], 100h
		mov	eax, [bp+var_20]
		mov	[bp+var_5A], eax
		lea	ax, word ptr [bp+var_62]
		push	ax
		mov	ax, di
		add	ax, 12h
		push	ax
		push	word_79788
		push	ss
		lea	ax, word ptr [bp+var_24]
		push	ax
		call	Ground_HeightUnderPoint_3664D
		add	sp, 0Ch
		push	di
		push	ss
		lea	ax, word ptr [bp+var_28]
		push	ax
		call	Aircraft_GroundClearance_3DF89
		add	sp, 6
		mov	eax, [bp+var_24]
		add	eax, [bp+var_28]
		mov	bx, word ptr [bp+var_14]
		mov	[bx], eax

loc_3CD2D:
		mov	byte_776BC, 1
		jmp	loc_3CDBB

loc_3CD35:
		mov	eax, dword_7CDE6
		mov	[bp+var_2C], eax
		push	di
		push	ss
		lea	ax, word ptr [bp+var_30]
		push	ax
		call	Aircraft_GroundClearance_3DF89
		add	sp, 6
		mov	eax, [bp+var_30]
		add	[bp+var_2C], eax
		mov	byte_78EB6, 1
		mov	ax, di
		add	ax, 1Ah
		mov	word ptr [bp+var_34+2], ax
		push	0
		mov	[bp+var_36], 0
		mov	eax, [bp+var_36]
		mov	[bp+var_6E], eax
		mov	[bp+var_3A], 0
		mov	eax, [bp+var_3A]
		mov	[bp+var_6A], eax
		mov	[bp+var_3E], 100h
		mov	eax, [bp+var_3E]
		mov	[bp+var_66], eax
		lea	ax, word ptr [bp+var_6E]
		push	ax
		mov	ax, di
		add	ax, 12h
		push	ax
		push	word_79788
		push	ss
		lea	ax, word ptr [bp+var_42]
		push	ax
		call	Ground_HeightUnderPoint_3664D
		add	sp, 0Ch
		mov	eax, [bp+var_2C]
		add	eax, [bp+var_42]
		mov	bx, word ptr [bp+var_34+2]
		mov	[bx], eax

loc_3CDBB:
		cmp	di, word_7CADA
		jnz	short loc_3CDF3
		cmp	byte_7CEF8, 4
		jnz	short loc_3CDF3
		push	word ptr [si+52h]
		mov	bx, [si+52h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	bx, ax
		mov	al, [bx+92h]
		shr	ax, 2
		and	ax, 1
		or	al, al
		jz	short loc_3CDF3
		push	0
		push	large 0
		push	0Bh
		call	sub_5EB62
		add	sp, 8

loc_3CDF3:
		mov	al, byte ptr [bp+var_C+3]
		mov	ah, 0
		or	ax, ax
		jz	short loc_3CE05
		cmp	[bp+var_1], 0
		jnz	short loc_3CE05
		jmp	loc_3CEE8

loc_3CE05:
		or	byte ptr [si+77h], 1
		push	0
		mov	[bp+var_30], 0
		mov	eax, [bp+var_30]
		mov	[bp+var_6E], eax
		mov	[bp+var_34], 0
		mov	eax, [bp+var_34]
		mov	[bp+var_6A], eax
		mov	[bp+var_38], 100h
		mov	eax, [bp+var_38]
		mov	[bp+var_66], eax
		lea	ax, word ptr [bp+var_6E]
		push	ax
		mov	ax, di
		add	ax, 12h
		push	ax
		push	word_79788
		push	ss
		lea	ax, word ptr [bp+var_2C]
		push	ax
		call	Ground_HeightUnderPoint_3664D
		add	sp, 0Ch
		mov	eax, [si+20h]
		sar	eax, 1
		mov	[bp+var_3C], eax
		mov	[bp+var_40], eax
		add	[bp+var_2C], eax
		mov	eax, [di+1Ah]
		cmp	eax, [bp+var_2C]
		jge	short loc_3CE78
		mov	ax, 1
		jmp	short loc_3CE7A

loc_3CE78:
		xor	ax, ax

loc_3CE7A:
		or	al, al
		jz	short loc_3CE86
		mov	eax, [bp+var_2C]
		mov	[di+1Ah], eax

loc_3CE86:
		cmp	di, word_7CADA
		jnz	short loc_3CE91
		mov	byte_7769D, 0

loc_3CE91:
		mov	[bp+var_44], 1400h
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+1Bh], 0
		jz	short loc_3CEC4
		les	bx, es:[bx+1Bh]
		mov	ax, es:[bx+8]
		mov	[bp+var_46], ax
		movsx	eax, [bp+var_46]
		shl	eax, 8
		mov	[bp+var_4A], eax
		mov	eax, [bp+var_4A]
		mov	[bp+var_44], eax

loc_3CEC4:
		push	4
		sub	sp, 4
		mov	eax, [bp+var_44]
		mov	[bp+var_78], eax
		mov	ax, di
		add	ax, 12h
		push	ax
		push	word_79788
		call	sub_368C5
		add	sp, 0Ah
		mov	al, 1
		jmp	loc_3D015

loc_3CEE8:
		mov	al, 0
		jmp	loc_3D015

loc_3CEED:
		mov	byte ptr [bp+var_C+3], 0
		cmp	di, word_7CADA
		jnz	short loc_3CF64
		mov	al, byte_77698
		mov	ah, 0
		or	ax, ax
		jnz	short loc_3CF64
		mov	byte_776BB, 1
		cmp	byte_7CB18, 0
		jz	short loc_3CF20
		cmp	byte_7CEF8, 5
		jz	short loc_3CF20
		push	4
		push	67B7h
		call	sub_737CD
		add	sp, 4

loc_3CF20:
		mov	bx, [bp+arg_6]
		mov	al, [bx+2]
		and	al, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_3CF32
		mov	byte ptr [bp+var_C+3], 1

loc_3CF32:
		mov	bx, [bp+arg_6]
		push	large [bx+0Eh]
		les	bx, [bx+0Eh]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		cmp	al, 18h
		jz	short loc_3CF60
		mov	bx, [bp+arg_6]
		push	large [bx+0Eh]
		les	bx, [bx+0Eh]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		cmp	al, 17h
		jnz	short loc_3CF64

loc_3CF60:
		mov	byte ptr [bp+var_C+3], 1

loc_3CF64:
		push	[bp+arg_6]
		push	large [si+5Ah]
		les	bx, [si+5Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		push	[bp+arg_6]
		mov	bx, [bp+arg_6]
		mov	bx, [bx]
		call	dword ptr [bx+38h]
		pop	cx
		mov	word ptr [bp+var_C], ax
		push	ax
		mov	ax, si
		add	ax, 73h
		push	ax
		call	SetReference16
		add	sp, 4
		les	bx, word ptr [bp+var_6]
		cmp	byte ptr es:[bx+0BCh], 3
		jz	short loc_3D013
		mov	al, [bp+arg_8]
		push	ax
		push	[bp+arg_6]
		push	large [si+63h]
		call	sub_3A6E6
		add	sp, 8
		push	large [si+5Fh]
		call	sub_3F8AD
		add	sp, 4
		push	large [si+63h]
		call	sub_3AE15
		add	sp, 4
		mov	word ptr [bp+var_E], ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+7Ch]
		cmp	ax, word ptr [bp+var_E]
		jle	short loc_3CFE0
		cmp	byte ptr [bp+var_C+3], 0
		jz	short loc_3D013

loc_3CFE0:
		cmp	di, word_7CADA
		jnz	short loc_3D00F
		push	[bp+arg_6]
		mov	bx, [bp+arg_6]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		mov	ah, 0
		cmp	ax, 8
		jz	short loc_3D003
		cmp	ax, 9
		jz	short loc_3D003
		cmp	ax, 0Fh
		jnz	short loc_3D00A

loc_3D003:
		mov	byte_7769D, 2
		jmp	short loc_3D00F

loc_3D00A:
		mov	byte_7769D, 1

loc_3D00F:
		mov	al, 1
		jmp	short loc_3D015

loc_3D013:
		mov	al, 0

loc_3D015:
		pop	di
		pop	si
		leave
		retf
Aircraft_ContactWithObject_3CA69		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3D019		proc far

var_DE		= word ptr -0DEh
var_A8		= dword ptr -0A8h
var_A4		= dword ptr -0A4h
var_A0		= byte ptr -0A0h
var_95		= word ptr -95h
var_93		= byte ptr -93h
var_52		= word ptr -52h
var_50		= byte ptr -50h
var_4F		= byte ptr -4Fh
var_4E		= word ptr -4Eh
var_4C		= dword ptr -4Ch
var_44		= word ptr -44h
var_42		= word ptr -42h
var_15		= dword ptr -15h
var_D		= word ptr -0Dh
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_A		= byte ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 0DEh
		push	si
		push	di
		mov	di, [bp+arg_4]
		mov	si, di
		mov	eax, [si+5Ah]
		mov	[bp+var_4], eax
		cmp	di, word_7CADA
		jnz	short loc_3D057
		mov	al, byte_77698
		mov	ah, 0
		or	ax, ax
		jnz	short loc_3D057
		mov	byte_776BB, 1
		cmp	byte_7CB18, 0
		jz	short loc_3D057
		push	4
		push	67B7h
		call	sub_737CD
		add	sp, 4

loc_3D057:
		mov	[bp+var_52], 0DAEh
		mov	[bp+var_4C], 0
		mov	[bp+var_4E], 0
		mov	[bp+var_50], 0
		mov	[bp+var_4F], 0
		mov	[bp+var_52], 15EAh
		lea	ax, [bp+var_52]
		push	ax
		call	Debris_BodyReset
		pop	cx
		mov	[bp+var_52], 22A4h
		mov	[bp+var_15], 0
		mov	[bp+var_D], 0
		lea	ax, [bp+var_52]
		push	ax
		call	ParticleEmitter_Reset
		pop	cx
		mov	[bp+var_DE], 16A8h
		xor	eax, eax
		mov	[bp+var_A4], eax
		mov	[bp+var_A8], eax
		mov	[bp+var_A0], al
		push	ss
		lea	ax, [bp+var_DE]
		push	ax
		call	sub_741CA
		add	sp, 4
		mov	[bp+var_DE], 1F1Ch
		mov	[bp+var_95], 0
		mov	[bp+var_DE], 1EC4h
		mov	[bp+var_93], 0
		mov	[bp+var_DE], 1EDCh
		mov	[bp+var_DE], 1EFCh
		lea	ax, [bp+var_DE]
		mov	[bp+var_42], ss
		mov	[bp+var_44], ax
		les	bx, [bp+arg_6]
		mov	ax, es:[bx+19h]
		mov	[bp+var_6], ax
		push	ax
		lea	ax, [bp+var_D]
		push	ax
		call	SetReference16
		add	sp, 4
		lea	ax, [bp+var_52]
		push	ax
		push	large [si+5Ah]
		les	bx, [si+5Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		lea	ax, [bp+var_52]
		push	ax
		call	sub_4E875
		pop	cx
		mov	[bp+var_8], ax
		push	ax
		mov	ax, si
		add	ax, 73h
		push	ax
		call	SetReference16
		add	sp, 4
		les	bx, word ptr [bp+var_4]
		cmp	byte ptr es:[bx+0BCh], 3
		jnz	short loc_3D143
		jmp	loc_3D1F3

loc_3D143:
		push	large [si+63h]
		call	sub_3AE15
		add	sp, 4
		les	bx, [bp+arg_6]
		les	bx, es:[bx]
		mov	dx, es:[bx+59h]
		cmp	byte ptr [si+51h], 1
		jnz	short loc_3D174
		mov	ax, word_7CB07
		cmp	ax, 1
		jz	short loc_3D16E
		cmp	ax, 2
		jz	short loc_3D172
		jmp	short loc_3D174

loc_3D16E:
		sar	dx, 1
		jmp	short loc_3D174

loc_3D172:
		sar	dx, 1

loc_3D174:
		mov	al, [bp+arg_A]
		push	ax
		push	dx
		push	large [si+63h]
		call	sub_3A740
		add	sp, 8
		push	large [si+63h]
		call	sub_3AE15
		add	sp, 4
		mov	[bp+var_A], ax
		cmp	di, word_7CADA
		jnz	short loc_3D1AB
		push	0
		push	large 0
		push	8
		call	sub_5EB62
		add	sp, 8
		jmp	short loc_3D1BA

loc_3D1AB:
		push	0
		push	large 0
		push	9
		call	sub_5EB62
		add	sp, 8

loc_3D1BA:
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+7Ch]
		cmp	ax, [bp+var_A]
		jg	short loc_3D1F3
		cmp	di, word_7CADA
		jnz	short loc_3D1D1
		mov	byte_7769D, 3

loc_3D1D1:
		push	2
		push	ss
		lea	ax, [bp+var_DE]
		push	ax
		call	sub_4DC07
		add	sp, 6
		push	2
		lea	ax, [bp+var_52]
		push	ax
		call	sub_4E882
		add	sp, 4
		mov	al, 1
		jmp	short loc_3D213

loc_3D1F3:
		push	2
		push	ss
		lea	ax, [bp+var_DE]
		push	ax
		call	sub_4DC07
		add	sp, 6
		push	2
		lea	ax, [bp+var_52]
		push	ax
		call	sub_4E882
		add	sp, 4
		mov	al, 0

loc_3D213:
		pop	di
		pop	si
		leave
		retf
sub_3D019		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3D217		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	dx, [bp+arg_4]
		mov	si, [bp+arg_0]
		mov	di, dx
		add	di, 2Dh
		or	si, si
		jz	short loc_3D22F
		mov	ax, si
		jmp	short loc_3D239

loc_3D22F:
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_3D239:
		or	ax, ax
		jz	short loc_3D257
		mov	eax, [di]
		mov	[si], eax
		mov	eax, [di+4]
		mov	[si+4], eax
		mov	eax, [di+8]
		mov	[si+8], eax
		mov	ax, si
		jmp	short loc_3D259

loc_3D257:
		mov	ax, si

loc_3D259:
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
sub_3D217		endp
seg097		ends

seg022		segment	para public 'CODE' use16
		assume cs:seg022
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 2, 93h, 5, 83h, 0C4h, 4

loc_B976:
		db 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; VoicePlayer_SetDriver_7A3D (sub_7A3D de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants
; et contexte à revérifier ici. — far, LUE 2026-10-17. Lecteur de voix numérisée : +2 = pilote
; numérique (word_4684B dans mid1).
; ==============================================================================================
VoicePlayer_SetDriver_B978		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+2], ax
		pop	si
		pop	bp
		retf
VoicePlayer_SetDriver_B978		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B988		proc far

var_6E		= word ptr -6Eh
var_11		= dword ptr -11h
var_D		= dword ptr -0Dh
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 6Eh
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jnz	short loc_B99B
		jmp	loc_BACC

loc_B99B:
		lea	ax, [bp+var_6E]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_6E], 480h
		mov	[bp+var_D], 100h
		mov	[bp+var_11], 0
		mov	[bp+var_6E], 5BDh
		push	1
		push	[bp+arg_2]
		lea	ax, [bp+var_6E]
		push	ax
		mov	bx, [bp+var_6E]
		call	dword ptr [bx+14h]
		add	sp, 6
		or	al, al
		jnz	short loc_B9DA
		jmp	loc_BABE

loc_B9DA:
		lea	ax, [bp+var_6E]
		push	ax
		call	StreamReader_GetCapacity_4154E
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		mov	[si+0Ch], eax
		cmp	byte ptr [si+15h], 0
		jz	short loc_BA19
		cmp	dword ptr [si+10h], 0
		jz	short loc_BA19
		push	0
		mov	al, [si+14h]
		push	ax
		mov	ax, si
		add	ax, 10h
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_BA19

loc_BA19:
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		mov	eax, [si+0Ch]
		mov	[bp+var_4], eax
		push	1
		push	8
		push	2
		push	large [bp+var_4]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		mov	eax, [bp+var_8]
		mov	[si+10h], eax
		mov	byte ptr [si+14h], 2
		mov	byte ptr [si+15h], 1
		mov	dword ptr [si+16h], 0
		mov	eax, [bp+var_4]
		mov	[si+16h], eax
		push	0
		mov	al, [si+14h]
		push	ax
		push	word ptr [si+12h]
		push	word ptr [si+10h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_6E]
		push	ax
		call	sub_404D9
		add	sp, 6
		push	0
		mov	al, [si+14h]
		push	ax
		push	word ptr [si+12h]
		push	word ptr [si+10h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		mov	[si+0Ah], dx
		mov	[si+8], ax
		mov	ax, [bp+arg_4]
		mov	[si+4], ax
		mov	ax, [bp+arg_6]
		mov	[si+6], ax

loc_BABE:
		push	0
		lea	ax, [bp+var_6E]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4

loc_BACC:
		pop	si
		leave
		retf
sub_B988		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à VoicePlayer_Stop_7B5A (sub_7B5A de OPTEST.EXE). Résumé
; repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-17. Si un
; pilote est attaché : si la méthode virtuelle +4 renvoie vrai, arrête la lecture (sub_30BDC)
; ; libère le bloc VOC possédé (+16) et remet son descripteur à zéro.
; ==============================================================================================
VoicePlayer_Stop_BACF		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jz	short loc_BB39
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		add	sp, 2
		or	al, al
		jz	short loc_BAFF
		cmp	word ptr [si+2], 0
		jz	short loc_BAFF
		mov	bx, [si+2]
		push	word ptr [bx+4]
		call	sub_506B
		add	sp, 2
		jmp	short loc_BAFF

loc_BAFF:
		cmp	byte ptr [si+15h], 0
		jz	short loc_BB25
		cmp	dword ptr [si+10h], 0
		jz	short loc_BB25
		push	0
		mov	al, [si+14h]
		push	ax
		mov	ax, si
		add	ax, 10h
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_BB25

loc_BB25:
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0

loc_BB39:
		pop	si
		pop	bp
		retf
VoicePlayer_Stop_BACF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BB3C		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jz	short loc_BB65
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr VoicePlayer_SetDriver_B978
		add	sp, 4
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	si
		push	cs
		call	near ptr sub_B988
		add	sp, 8

loc_BB65:
		pop	si
		pop	bp
		retf
sub_BB3C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BB68		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jz	short loc_BBAE
		cmp	dword ptr [si+10h], 0
		jz	short loc_BB81
		mov	ax, 1
		jmp	short loc_BB83

loc_BB81:
		xor	ax, ax

loc_BB83:
		or	ax, ax
		jz	short loc_BBAE
		push	ds
		mov	ax, si
		add	ax, 4
		push	ax
		push	0
		mov	bx, [si+2]
		push	word ptr [bx+4]
		call	sub_5041
		add	sp, 8
		push	0
		mov	bx, [si+2]
		push	word ptr [bx+4]
		call	sub_5065
		add	sp, 4

loc_BBAE:
		pop	si
		pop	bp
		retf
sub_BB68		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BBB1		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jz	short loc_BBDF
		push	0
		mov	bx, [si+2]
		push	word ptr [bx+4]
		call	sub_504D
		add	sp, 4
		cmp	ax, 3
		jnz	short loc_BBD8
		mov	ax, 1
		jmp	short loc_BBDA

loc_BBD8:
		xor	ax, ax

loc_BBDA:
		pop	si
		pop	bp
		retf
		jmp	short loc_BBE4

loc_BBDF:
		mov	al, 1
		pop	si
		pop	bp
		retf
sub_BBB1		endp

; START OF FUNCTION CHUNK FOR sub_BBB1

loc_BBE4:
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_BBB1

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BBE7		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jz	short loc_BC15
		push	0
		mov	bx, [si+2]
		push	word ptr [bx+4]
		call	sub_504D
		add	sp, 4
		cmp	ax, 2
		jnz	short loc_BC0E
		mov	ax, 1
		jmp	short loc_BC10

loc_BC0E:
		xor	ax, ax

loc_BC10:
		pop	si
		pop	bp
		retf
		jmp	short loc_BC1A

loc_BC15:
		mov	al, 0
		pop	si
		pop	bp
		retf
sub_BBE7		endp

; START OF FUNCTION CHUNK FOR sub_BBE7

loc_BC1A:
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_BBE7

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BC1D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jz	short loc_BC4B
		push	0
		mov	bx, [si+2]
		push	word ptr [bx+4]
		call	sub_504D
		add	sp, 4
		cmp	ax, 1
		jnz	short loc_BC44
		mov	ax, 1
		jmp	short loc_BC46

loc_BC44:
		xor	ax, ax

loc_BC46:
		pop	si
		pop	bp
		retf
		jmp	short loc_BC50

loc_BC4B:
		mov	al, 1
		pop	si
		pop	bp
		retf
sub_BC1D		endp

; START OF FUNCTION CHUNK FOR sub_BC1D

loc_BC50:
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_BC1D

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BC53		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jz	short loc_BC80
		push	0
		mov	bx, [si+2]
		push	word ptr [bx+4]
		call	sub_504D
		add	sp, 4
		or	ax, ax
		jnz	short loc_BC79
		mov	ax, 1
		jmp	short loc_BC7B

loc_BC79:
		xor	ax, ax

loc_BC7B:
		pop	si
		pop	bp
		retf
		jmp	short loc_BC85

loc_BC80:
		mov	al, 1
		pop	si
		pop	bp
		retf
sub_BC53		endp

; START OF FUNCTION CHUNK FOR sub_BC53

loc_BC85:
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_BC53

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE par position d'appel dans les cinématiques : position d'appel (53 sur
; 53), à sub_7D11 (sub_7D11 de OPTEST.EXE). Code non comparé instruction par instruction. —
; ==============================================================================================
MidgameEngine_7D11_BC88		proc far

var_A		= word ptr -0Ah
var_7		= byte ptr -7
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	eax, [si+10h]
		cmp	eax, [di]
		jnz	short loc_BCA2
		jmp	loc_BD2B

loc_BCA2:
		cmp	byte ptr [si+15h], 0
		jz	short loc_BCC8
		cmp	dword ptr [si+10h], 0
		jz	short loc_BCC8
		push	0
		mov	al, [si+14h]
		push	ax
		mov	ax, si
		add	ax, 10h
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_BCC8

loc_BCC8:
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		mov	[bp+var_2], di
		mov	bx, [bp+var_2]
		mov	eax, [bx]
		mov	[bp+var_6], eax
		mov	bx, [bp+var_2]
		mov	al, [bx+4]
		mov	[bp+var_7], al
		mov	eax, [bp+var_6]
		mov	[si+10h], eax
		mov	al, [bp+var_7]
		mov	[si+14h], al
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		mov	bx, [bp+var_2]
		mov	eax, [bx+6]
		mov	[si+16h], eax
		cmp	byte ptr [di+5], 0
		jz	short loc_BD2B
		mov	[bp+var_A], di
		mov	bx, [bp+var_A]
		mov	byte ptr [bx+5], 0
		mov	byte ptr [si+15h], 1

loc_BD2B:
		pop	di
		pop	si
		leave
		retf
MidgameEngine_7D11_BC88		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BD2F		proc far

var_4C		= word ptr -4Ch
var_49		= byte ptr -49h
var_48		= dword ptr -48h
var_44		= word ptr -44h
var_42		= dword ptr -42h
var_3E		= word ptr -3Eh
var_3C		= word ptr -3Ch
var_3A		= word ptr -3Ah
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
		sub	sp, 4Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_4]
		mov	[si+1Ah], ax
		cmp	word ptr [si+2], 0
		jnz	short loc_BD49
		jmp	loc_C292

loc_BD49:
		mov	eax, [si+10h]
		mov	bx, [bp+arg_2]
		cmp	eax, [bx]
		jnz	short loc_BD58
		jmp	loc_BDEA

loc_BD58:
		cmp	byte ptr [si+15h], 0
		jz	short loc_BD7E
		cmp	dword ptr [si+10h], 0
		jz	short loc_BD7E
		push	0
		mov	al, [si+14h]
		push	ax
		mov	ax, si
		add	ax, 10h
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_BD7E

loc_BD7E:
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		mov	ax, [bp+arg_2]
		mov	[bp+var_44], ax
		mov	bx, [bp+var_44]
		mov	eax, [bx]
		mov	[bp+var_48], eax
		mov	bx, [bp+var_44]
		mov	al, [bx+4]
		mov	[bp+var_49], al
		mov	eax, [bp+var_48]
		mov	[si+10h], eax
		mov	al, [bp+var_49]
		mov	[si+14h], al
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		mov	bx, [bp+var_44]
		mov	eax, [bx+6]
		mov	[si+16h], eax
		mov	bx, [bp+arg_2]
		cmp	byte ptr [bx+5], 0
		jz	short loc_BDEA
		mov	ax, [bp+arg_2]
		mov	[bp+var_4C], ax
		mov	bx, [bp+var_4C]
		mov	byte ptr [bx+5], 0
		mov	byte ptr [si+15h], 1

loc_BDEA:
		push	0
		mov	bx, [bp+arg_2]
		mov	al, [bx+4]
		push	ax
		mov	bx, [bp+arg_2]
		push	word ptr [bx+2]
		push	word ptr [bx]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	al, es:[bx+1Eh]
		mov	ah, 0
		mov	dx, 100h
		sub	dx, ax
		movsx	ebx, dx
		mov	eax, 0F4240h
		cdq
		idiv	ebx
		mov	[bp+var_14], eax
		movsx	ebx, word ptr [si+1Ah]
		mov	eax, [bp+var_14]
		cdq
		idiv	ebx
		mov	[bp+var_10], eax
		xor	di, di
		mov	[bp+var_1C], 0
		jmp	short loc_BE5D

loc_BE4B:
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		mov	dword ptr [bx+si+1Ch], 0FFFFFFFEh
		inc	[bp+var_1C]

loc_BE5D:
		cmp	[bp+var_1C], 200h
		jl	short loc_BE4B
		les	bx, [bp+var_4]
		mov	eax, es:[bx+1Ah]
		sar	eax, 8
		add	eax, 0FFFFFFFEh
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		cdq
		idiv	[bp+var_10]
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_10]
		imul	eax, [bp+var_2C]
		mov	edx, [bp+var_C]
		sub	edx, eax
		mov	[bp+var_30], edx
		mov	[bp+var_34], 0
		jmp	loc_C067

loc_BEA8:
		mov	[bp+var_24], 0F423Fh
		mov	[bp+var_28], 0
		mov	[bp+var_20], 0
		mov	[bp+var_8], 0
		mov	eax, [bp+var_34]
		imul	eax, [bp+var_14]
		movsx	ebx, word ptr [si+1Ah]
		cdq
		idiv	ebx
		add	eax, 20h
		mov	[bp+var_38], eax
		mov	eax, [bp+var_34]
		cmp	eax, [bp+var_2C]
		jl	short loc_BEF0
		jmp	loc_BFA9

loc_BEF0:
		mov	eax, [bp+var_38]
		mov	[bp+var_1C], eax
		jmp	short loc_BF51

loc_BEFA:
		les	bx, [bp+var_4]
		add	bx, word ptr [bp+var_1C]
		movzx	eax, byte ptr es:[bx]
		cmp	eax, [bp+var_28]
		jle	short loc_BF1A
		les	bx, [bp+var_4]
		add	bx, word ptr [bp+var_1C]
		movzx	eax, byte ptr es:[bx]
		mov	[bp+var_28], eax

loc_BF1A:
		les	bx, [bp+var_4]
		add	bx, word ptr [bp+var_1C]
		movzx	eax, byte ptr es:[bx]
		cmp	eax, [bp+var_24]
		jge	short loc_BF3A
		les	bx, [bp+var_4]
		add	bx, word ptr [bp+var_1C]
		movzx	eax, byte ptr es:[bx]
		mov	[bp+var_24], eax

loc_BF3A:
		les	bx, [bp+var_4]
		add	bx, word ptr [bp+var_1C]
		movzx	eax, byte ptr es:[bx]
		add	[bp+var_8], eax
		inc	[bp+var_20]
		inc	[bp+var_1C]

loc_BF51:
		mov	eax, [bp+var_38]
		add	eax, [bp+var_10]
		cmp	eax, [bp+var_1C]
		jge	short loc_BEFA
		cmp	[bp+var_20], 0
		jz	short loc_BF89
		mov	eax, [bp+var_8]
		imul	eax, eax, 3E8h
		xor	edx, edx
		div	[bp+var_20]
		sub	eax, 1F400h
		mov	bx, di
		shl	bx, 2
		mov	[bx+si+1Ch], eax
		jmp	short loc_BF96

loc_BF89:
		mov	bx, di
		shl	bx, 2
		mov	dword ptr [bx+si+1Ch], 0

loc_BF96:
		mov	ax, word ptr [bp+var_28]
		sub	ax, word ptr [bp+var_24]
		mov	[bp+var_3E], ax
		cmp	di, 200h
		jge	short loc_BFA6
		inc	di

loc_BFA6:
		jmp	loc_C063

loc_BFA9:
		cmp	[bp+var_30], 0
		jg	short loc_BFB3
		jmp	loc_C063

loc_BFB3:
		mov	eax, [bp+var_38]
		mov	[bp+var_1C], eax
		jmp	short loc_C014

loc_BFBD:
		les	bx, [bp+var_4]
		add	bx, word ptr [bp+var_1C]
		movzx	eax, byte ptr es:[bx]
		cmp	eax, [bp+var_28]
		jle	short loc_BFDD
		les	bx, [bp+var_4]
		add	bx, word ptr [bp+var_1C]
		movzx	eax, byte ptr es:[bx]
		mov	[bp+var_28], eax

loc_BFDD:
		les	bx, [bp+var_4]
		add	bx, word ptr [bp+var_1C]
		movzx	eax, byte ptr es:[bx]
		cmp	eax, [bp+var_24]
		jge	short loc_BFFD
		les	bx, [bp+var_4]
		add	bx, word ptr [bp+var_1C]
		movzx	eax, byte ptr es:[bx]
		mov	[bp+var_24], eax

loc_BFFD:
		les	bx, [bp+var_4]
		add	bx, word ptr [bp+var_1C]
		movzx	eax, byte ptr es:[bx]
		add	[bp+var_8], eax
		inc	[bp+var_20]
		inc	[bp+var_1C]

loc_C014:
		mov	eax, [bp+var_C]
		add	eax, 20h
		cmp	eax, [bp+var_1C]
		jg	short loc_BFBD
		cmp	[bp+var_20], 0
		jz	short loc_C04C
		mov	eax, [bp+var_8]
		imul	eax, eax, 3E8h
		xor	edx, edx
		div	[bp+var_20]
		sub	eax, 1F400h
		mov	bx, di
		shl	bx, 2
		mov	[bx+si+1Ch], eax
		jmp	short loc_C059

loc_C04C:
		mov	bx, di
		shl	bx, 2
		mov	dword ptr [bx+si+1Ch], 0

loc_C059:
		mov	ax, word ptr [bp+var_28]
		sub	ax, word ptr [bp+var_24]
		mov	[bp+var_3E], ax
		inc	di

loc_C063:
		inc	[bp+var_34]

loc_C067:
		mov	eax, [bp+var_34]
		cmp	eax, [bp+var_2C]
		jg	short loc_C074
		jmp	loc_BEA8

loc_C074:
		mov	[bp+var_24], 270Fh
		mov	[bp+var_28], 0FFFFD8F1h
		mov	[bp+var_1C], 0
		jmp	short loc_C0DA

loc_C08E:
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		mov	eax, [bx+si+1Ch]
		cmp	eax, [bp+var_28]
		jle	short loc_C0B2
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		mov	eax, [bx+si+1Ch]
		mov	[bp+var_28], eax
		mov	ax, word ptr [bp+var_1C]
		mov	[bp+var_3C], ax

loc_C0B2:
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		mov	eax, [bx+si+1Ch]
		cmp	eax, [bp+var_24]
		jge	short loc_C0D6
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		mov	eax, [bx+si+1Ch]
		mov	[bp+var_24], eax
		mov	ax, word ptr [bp+var_1C]
		mov	[bp+var_3A], ax

loc_C0D6:
		inc	[bp+var_1C]

loc_C0DA:
		movsx	eax, di
		cmp	eax, [bp+var_1C]
		jg	short loc_C08E
		mov	[bp+var_24], 270Fh
		mov	[bp+var_28], 0FFFFD8F1h
		mov	[bp+var_1C], 0
		jmp	short loc_C154

loc_C0FE:
		movsx	eax, [bp+var_3A]
		cmp	eax, [bp+var_1C]
		jz	short loc_C150
		movsx	eax, [bp+var_3C]
		cmp	eax, [bp+var_1C]
		jz	short loc_C150
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		mov	eax, [bx+si+1Ch]
		cmp	eax, [bp+var_28]
		jle	short loc_C132
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		mov	eax, [bx+si+1Ch]
		mov	[bp+var_28], eax

loc_C132:
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		mov	eax, [bx+si+1Ch]
		cmp	eax, [bp+var_24]
		jge	short loc_C150
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		mov	eax, [bx+si+1Ch]
		mov	[bp+var_24], eax

loc_C150:
		inc	[bp+var_1C]

loc_C154:
		movsx	eax, di
		cmp	eax, [bp+var_1C]
		jg	short loc_C0FE
		push	large [bp+var_28]
		call	CRT_NormalizeSign32
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 4
		push	eax
		push	large [bp+var_24]
		call	CRT_NormalizeSign32
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 4
		pop	edx
		cmp	edx, eax
		jle	short loc_C1AC
		push	large [bp+var_28]
		call	CRT_NormalizeSign32
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 4
		mov	[bp+var_42], eax
		jmp	short loc_C1C5

loc_C1AC:
		push	large [bp+var_24]
		call	CRT_NormalizeSign32
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 4
		mov	[bp+var_42], eax

loc_C1C5:
		mov	[bp+var_1C], 0
		jmp	loc_C283

loc_C1D0:
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		push	word ptr [bx+si+1Ch]
		call	CRT_Abs16_361
		add	sp, 2
		movsx	eax, ax
		push	eax
		mov	eax, [bp+var_42]
		pop	edx
		sub	eax, edx
		imul	eax, eax, 64h
		cdq
		idiv	[bp+var_42]
		mov	[bp+var_18], eax
		cmp	[bp+var_18], 5Fh
		jl	short loc_C215
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		mov	dword ptr [bx+si+1Ch], 0FFFFFFFFh
		jmp	short loc_C27F

loc_C215:
		cmp	[bp+var_18], 4Eh
		jl	short loc_C22C
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		mov	dword ptr [bx+si+1Ch], 8
		jmp	short loc_C27F

loc_C22C:
		cmp	[bp+var_18], 41h
		jl	short loc_C243
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		mov	dword ptr [bx+si+1Ch], 3
		jmp	short loc_C27F

loc_C243:
		cmp	[bp+var_18], 2Ah
		jl	short loc_C25A
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		mov	dword ptr [bx+si+1Ch], 2
		jmp	short loc_C27F

loc_C25A:
		cmp	[bp+var_18], 19h
		jl	short loc_C271
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		mov	dword ptr [bx+si+1Ch], 0Ah
		jmp	short loc_C27F

loc_C271:
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		mov	dword ptr [bx+si+1Ch], 0Bh

loc_C27F:
		inc	[bp+var_1C]

loc_C283:
		movsx	eax, di
		cmp	eax, [bp+var_1C]
		jle	short loc_C290
		jmp	loc_C1D0

loc_C290:
		xor	di, di

loc_C292:
		pop	di
		pop	si
		leave
		retf
sub_BD2F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C296		proc far

var_6E		= word ptr -6Eh
var_11		= dword ptr -11h
var_D		= dword ptr -0Dh
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6Eh
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jnz	short loc_C2A9
		jmp	loc_C3A9

loc_C2A9:
		lea	ax, [bp+var_6E]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_6E], 480h
		mov	[bp+var_D], 100h
		mov	[bp+var_11], 0
		mov	[bp+var_6E], 5BDh
		push	1
		push	[bp+arg_2]
		lea	ax, [bp+var_6E]
		push	ax
		mov	bx, [bp+var_6E]
		call	dword ptr [bx+14h]
		add	sp, 6
		or	al, al
		jnz	short loc_C2E8
		jmp	loc_C39B

loc_C2E8:
		cmp	byte ptr [si+15h], 0
		jz	short loc_C30E
		cmp	dword ptr [si+10h], 0
		jz	short loc_C30E
		push	0
		mov	al, [si+14h]
		push	ax
		mov	ax, si
		add	ax, 10h
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_C30E

loc_C30E:
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		lea	ax, [bp+var_6E]
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
		mov	eax, [bp+var_8]
		mov	[si+10h], eax
		mov	byte ptr [si+14h], 2
		mov	byte ptr [si+15h], 1
		mov	dword ptr [si+16h], 0
		mov	eax, [bp+var_4]
		mov	[si+16h], eax
		push	0
		mov	al, [si+14h]
		push	ax
		push	word ptr [si+12h]
		push	word ptr [si+10h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_6E]
		push	ax
		call	sub_404D9
		add	sp, 6

loc_C39B:
		push	0
		lea	ax, [bp+var_6E]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4

loc_C3A9:
		pop	si
		leave
		retf
sub_C296		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C3AC		proc far

var_80		= word ptr -80h
var_1F		= dword ptr -1Fh
var_13		= word ptr -13h
var_F		= dword ptr -0Fh
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 80h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		cmp	word ptr [si+2], 0
		jnz	short loc_C3C4
		jmp	loc_C4B1

loc_C3C4:
		lea	ax, [bp+var_80]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_4331C
		add	sp, 2
		push	1
		push	[bp+arg_2]
		lea	ax, [bp+var_80]
		push	ax
		mov	bx, [bp+var_80]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	di
		lea	ax, [bp+var_80]
		push	ax
		call	IndexedRecordReader_AdvanceIndex_436B6
		add	sp, 4
		cmp	byte ptr [si+15h], 0
		jz	short loc_C415
		cmp	dword ptr [si+10h], 0
		jz	short loc_C415
		push	0
		mov	al, [si+14h]
		push	ax
		mov	ax, si
		add	ax, 10h
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_C415

loc_C415:
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		mov	ax, [bp+var_13]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_C43A
		mov	eax, [bp+var_1F]
		jmp	short loc_C43E

loc_C43A:
		mov	eax, [bp+var_F]

loc_C43E:
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
		mov	eax, [bp+var_8]
		mov	[si+10h], eax
		mov	byte ptr [si+14h], 2
		mov	byte ptr [si+15h], 1
		mov	dword ptr [si+16h], 0
		mov	eax, [bp+var_4]
		mov	[si+16h], eax
		push	0
		mov	al, [si+14h]
		push	ax
		push	word ptr [si+12h]
		push	word ptr [si+10h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		lea	ax, [bp+var_80]
		push	ax
		call	sub_43519
		add	sp, 8
		push	2
		lea	ax, [bp+var_80]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4

loc_C4B1:
		pop	di
		pop	si
		leave
		retf
sub_C3AC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE par position d'appel dans les cinématiques : position d'appel (43 sur
; 43), à sub_83FE (sub_83FE de OPTEST.EXE). Code non comparé instruction par instruction. —
; ==============================================================================================
MidgameEngine_83FE_C4B5		proc far

var_22		= word ptr -22h
var_1A		= byte ptr -1Ah
var_17		= byte ptr -17h
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_D		= byte ptr -0Dh
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 22h
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	byte_4A642, 0
		jnz	short loc_C4E7
		inc	byte_4A642
		mov	dword_4EF32, 0
		mov	byte_4EF36, 2
		mov	byte_4EF37, 0
		mov	dword_4EF38, 0

loc_C4E7:
		cmp	word ptr [si+2], 0
		jnz	short loc_C4F0
		jmp	loc_C79E

loc_C4F0:
		cmp	dword ptr [si+10h], 0
		jz	short loc_C4FC
		mov	ax, 1
		jmp	short loc_C4FE

loc_C4FC:
		xor	ax, ax

loc_C4FE:
		or	ax, ax
		jnz	short loc_C505
		jmp	loc_C79E

loc_C505:
		cmp	byte_4EF37, 0
		jz	short loc_C52A
		cmp	dword_4EF32, 0
		jz	short loc_C52A
		push	0
		mov	al, byte_4EF36
		push	ax
		push	6552h
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_C52A

loc_C52A:
		mov	dword_4EF32, 0
		mov	byte_4EF37, 0
		mov	dword_4EF38, 0
		mov	eax, [si+16h]
		mov	[bp+var_4], eax
		push	0
		push	8
		push	2
		push	large [bp+var_4]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		mov	eax, [bp+var_8]
		mov	dword_4EF32, eax
		mov	byte_4EF36, 2
		mov	byte_4EF37, 1
		mov	dword_4EF38, 0
		mov	eax, [bp+var_4]
		mov	dword_4EF38, eax
		cmp	dword_4EF32, 0
		jnz	short loc_C592
		jmp	loc_C6F4

loc_C592:
		cmp	dword ptr [si+10h], 0
		jnz	short loc_C59C
		jmp	loc_C6B8

loc_C59C:
		cmp	dword_4EF32, 0
		jz	short loc_C5B2
		mov	eax, [si+16h]
		cmp	eax, dword_4EF38
		jg	short loc_C5B2
		jmp	loc_C63F

loc_C5B2:
		cmp	byte_4EF37, 0
		jz	short loc_C5D7
		cmp	dword_4EF32, 0
		jz	short loc_C5D7
		push	0
		mov	al, byte_4EF36
		push	ax
		push	6552h
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_C5D7

loc_C5D7:
		mov	dword_4EF32, 0
		mov	byte_4EF37, 0
		mov	dword_4EF38, 0
		mov	eax, [si+16h]
		mov	[bp+var_C], eax
		mov	al, [si+14h]
		mov	[bp+var_D], al
		push	1
		push	0
		mov	al, [bp+var_D]
		push	ax
		push	large [bp+var_C]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word ptr [bp+var_12+2], dx
		mov	word ptr [bp+var_12], ax
		mov	eax, [bp+var_12]
		mov	dword_4EF32, eax
		mov	al, [bp+var_D]
		mov	byte_4EF36, al
		mov	byte_4EF37, 1
		mov	dword_4EF38, 0
		mov	eax, [bp+var_C]
		mov	dword_4EF38, eax
		jmp	short loc_C63F

loc_C63F:
		cmp	byte_4EF36, 3
		jnz	short loc_C66F
		cmp	byte ptr [si+14h], 3
		jnz	short loc_C66F
		push	0
		push	3
		push	large [si+16h]
		push	word ptr [si+12h]
		push	word ptr [si+10h]
		push	word_4EF34
		push	word ptr dword_4EF32
		push	6C14h
		call	Memory_TypedAllocDispatch_3296E
		add	sp, 12h
		jmp	short loc_C6B6

loc_C66F:
		push	0
		push	2
		push	large [si+16h]
		push	0
		mov	al, [si+14h]
		push	ax
		push	word ptr [si+12h]
		push	word ptr [si+10h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		mov	al, byte_4EF36
		push	ax
		push	word_4EF34
		push	word ptr dword_4EF32
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	6C14h
		call	Memory_TypedAllocDispatch_3296E
		add	sp, 12h

loc_C6B6:
		jmp	short loc_C6B8

loc_C6B8:
		cmp	byte ptr [si+15h], 0
		jz	short loc_C6DE
		cmp	dword ptr [si+10h], 0
		jz	short loc_C6DE
		push	0
		mov	al, [si+14h]
		push	ax
		mov	ax, si
		add	ax, 10h
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_C6DE

loc_C6DE:
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		jmp	short loc_C72C

loc_C6F4:
		mov	ax, si
		add	ax, 10h
		mov	di, ax
		mov	eax, [di]
		mov	[bp+var_16], eax
		mov	al, [di+4]
		mov	[bp+var_17], al
		mov	eax, [bp+var_16]
		mov	dword_4EF32, eax
		mov	al, [bp+var_17]
		mov	byte_4EF36, al
		mov	byte_4EF37, 0
		mov	dword_4EF38, 0
		mov	eax, [di+6]
		mov	dword_4EF38, eax

loc_C72C:
		push	6552h
		lea	ax, [bp+var_22]
		push	ax
		call	sub_5D11
		add	sp, 4
		mov	bx, [si+2]
		mov	al, [bx+79h]
		shr	ax, 2
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jz	short loc_C753
		cmp	[bp+var_1A], 0
		jnz	short loc_C782

loc_C753:
		push	[bp+arg_2]
		lea	ax, [bp+var_22]
		push	ax
		call	sub_5D59
		add	sp, 2
		push	dx
		push	ax
		mov	bx, [si+2]
		push	word ptr [bx+4]
		call	sub_5053
		add	sp, 8
		push	0
		mov	bx, [si+2]
		push	word ptr [bx+4]
		call	sub_5065
		add	sp, 4

loc_C782:
		mov	eax, dword_4DE15
		mov	[si+81Dh], eax
		mov	byte ptr [si+81Ch], 1
		push	2
		lea	ax, [bp+var_22]
		push	ax
		call	sub_5C1C
		add	sp, 4

loc_C79E:
		pop	di
		pop	si
		leave
		retf
MidgameEngine_83FE_C4B5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; VoicePlayer_GetLipFrame_8466 (sub_8466 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — far, LUE 2026-10-17. Image de bouche de la voix en
; cours : -1 sans pilote ; sinon indice = temps écoulé du chronomètre +2076 (sub_3EFDF) × +26
; / 60 ; indice < 512 : mot de la table en +28 + indice × 4 ; sinon -2 (fin). Le remplissage
; de cette table n'est pas lu.
; ==============================================================================================
VoicePlayer_GetLipFrame_C7A2		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, 0FFFFh
		cmp	word ptr [si+2], 0
		jz	short loc_C7FE
		mov	ax, si
		add	ax, 81Ch
		push	ax
		call	Stopwatch_Elapsed_44DDD
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		movsx	edx, word ptr [si+1Ah]
		imul	eax, edx
		mov	ebx, 3Ch
		xor	edx, edx
		div	ebx
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 200h
		jge	short loc_C7FB
		mov	bx, word ptr [bp+var_4]
		shl	bx, 2
		mov	di, [bx+si+1Ch]
		jmp	short loc_C7FE

loc_C7FB:
		mov	di, 0FFFEh

loc_C7FE:
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
VoicePlayer_GetLipFrame_C7A2		endp

; START OF FUNCTION CHUNK FOR VoicePlayer_GetLipFrame_C7A2
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR VoicePlayer_GetLipFrame_C7A2

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à VoicePlayer_IsDone_84CC
; (sub_84CC de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — far, LUE 2026-10-21. Vrai quand la réplique du lecteur de voix est finie : sans
; pilote ([si+2] = 0) renvoie 1 ; sinon appelle sub_30BD0 (fonction 124 du pilote son,
; AIL_VOC_playback_status, mov ax, 7Ch / jmp AIL_call_driver_3041C) et renvoie 1 si l'état
; vaut 3 (DAC_DONE d'AIL.INC), 0 sinon (cmp ax, 3).
; ==============================================================================================
VoicePlayer_IsDone_C808		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jz	short loc_C834
		mov	bx, [si+2]
		push	word ptr [bx+4]
		call	sub_505F
		add	sp, 2
		cmp	ax, 3
		jnz	short loc_C82D
		mov	ax, 1
		jmp	short loc_C82F

loc_C82D:
		xor	ax, ax

loc_C82F:
		pop	si
		pop	bp
		retf
		jmp	short loc_C839

loc_C834:
		mov	al, 1
		pop	si
		pop	bp
		retf
VoicePlayer_IsDone_C808		endp

; START OF FUNCTION CHUNK FOR VoicePlayer_IsDone_C808

loc_C839:
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR VoicePlayer_IsDone_C808

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; VoicePlayer_IsPlaying_8500 (sub_8500 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants
; et contexte à revérifier ici. — far, LUE 2026-10-21. Vrai pendant la lecture de la réplique
; : sans pilote ([si+2] = 0) renvoie 0 ; sinon appelle sub_30BD0 (AIL_VOC_playback_status,
; fonction 124 du pilote son) et renvoie 1 si l'état vaut 2 (DAC_PLAYING d'AIL.INC), 0 sinon
; (cmp ax, 2). Utilisée par la cinématique mid2 (sub_6B9C0) pour attendre la fin d'une
; réplique (tant que en cours).
; ==============================================================================================
VoicePlayer_IsPlaying_C83C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jz	short loc_C868
		mov	bx, [si+2]
		push	word ptr [bx+4]
		call	sub_505F
		add	sp, 2
		cmp	ax, 2
		jnz	short loc_C861
		mov	ax, 1
		jmp	short loc_C863

loc_C861:
		xor	ax, ax

loc_C863:
		pop	si
		pop	bp
		retf
		jmp	short loc_C86D

loc_C868:
		mov	al, 0
		pop	si
		pop	bp
		retf
VoicePlayer_IsPlaying_C83C		endp

; START OF FUNCTION CHUNK FOR VoicePlayer_IsPlaying_C83C

loc_C86D:
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR VoicePlayer_IsPlaying_C83C

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C870		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jz	short loc_C89C
		mov	bx, [si+2]
		push	word ptr [bx+4]
		call	sub_505F
		add	sp, 2
		cmp	ax, 1
		jnz	short loc_C895
		mov	ax, 1
		jmp	short loc_C897

loc_C895:
		xor	ax, ax

loc_C897:
		pop	si
		pop	bp
		retf
		jmp	short loc_C8A1

loc_C89C:
		mov	al, 1
		pop	si
		pop	bp
		retf
sub_C870		endp

; START OF FUNCTION CHUNK FOR sub_C870

loc_C8A1:
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_C870

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C8A4		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jz	short loc_C8CF
		mov	bx, [si+2]
		push	word ptr [bx+4]
		call	sub_505F
		add	sp, 2
		or	ax, ax
		jnz	short loc_C8C8
		mov	ax, 1
		jmp	short loc_C8CA

loc_C8C8:
		xor	ax, ax

loc_C8CA:
		pop	si
		pop	bp
		retf
		jmp	short loc_C8D4

loc_C8CF:
		mov	al, 1
		pop	si
		pop	bp
		retf
sub_C8A4		endp

; START OF FUNCTION CHUNK FOR sub_C8A4

loc_C8D4:
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_C8A4

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C8D7		proc far

var_A		= word ptr -0Ah
var_7		= byte ptr -7
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	eax, [si+10h]
		cmp	eax, [di]
		jnz	short loc_C8F1
		jmp	loc_C97A

loc_C8F1:
		cmp	byte ptr [si+15h], 0
		jz	short loc_C917
		cmp	dword ptr [si+10h], 0
		jz	short loc_C917
		push	0
		mov	al, [si+14h]
		push	ax
		mov	ax, si
		add	ax, 10h
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_C917

loc_C917:
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		mov	[bp+var_2], di
		mov	bx, [bp+var_2]
		mov	eax, [bx]
		mov	[bp+var_6], eax
		mov	bx, [bp+var_2]
		mov	al, [bx+4]
		mov	[bp+var_7], al
		mov	eax, [bp+var_6]
		mov	[si+10h], eax
		mov	al, [bp+var_7]
		mov	[si+14h], al
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		mov	bx, [bp+var_2]
		mov	eax, [bx+6]
		mov	[si+16h], eax
		cmp	byte ptr [di+5], 0
		jz	short loc_C97A
		mov	[bp+var_A], di
		mov	bx, [bp+var_A]
		mov	byte ptr [bx+5], 0
		mov	byte ptr [si+15h], 1

loc_C97A:
		pop	di
		pop	si
		leave
		retf
sub_C8D7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C97E		proc far

var_6E		= word ptr -6Eh
var_11		= dword ptr -11h
var_D		= dword ptr -0Dh
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6Eh
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jnz	short loc_C991
		jmp	loc_CA91

loc_C991:
		lea	ax, [bp+var_6E]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_6E], 480h
		mov	[bp+var_D], 100h
		mov	[bp+var_11], 0
		mov	[bp+var_6E], 5BDh
		push	1
		push	[bp+arg_2]
		lea	ax, [bp+var_6E]
		push	ax
		mov	bx, [bp+var_6E]
		call	dword ptr [bx+14h]
		add	sp, 6
		or	al, al
		jnz	short loc_C9D0
		jmp	loc_CA83

loc_C9D0:
		cmp	byte ptr [si+15h], 0
		jz	short loc_C9F6
		cmp	dword ptr [si+10h], 0
		jz	short loc_C9F6
		push	0
		mov	al, [si+14h]
		push	ax
		mov	ax, si
		add	ax, 10h
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_C9F6

loc_C9F6:
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		lea	ax, [bp+var_6E]
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
		mov	eax, [bp+var_8]
		mov	[si+10h], eax
		mov	byte ptr [si+14h], 2
		mov	byte ptr [si+15h], 1
		mov	dword ptr [si+16h], 0
		mov	eax, [bp+var_4]
		mov	[si+16h], eax
		push	0
		mov	al, [si+14h]
		push	ax
		push	word ptr [si+12h]
		push	word ptr [si+10h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_6E]
		push	ax
		call	sub_404D9
		add	sp, 6

loc_CA83:
		push	0
		lea	ax, [bp+var_6E]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4

loc_CA91:
		pop	si
		leave
		retf
sub_C97E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_CA94		proc far

var_80		= word ptr -80h
var_1F		= dword ptr -1Fh
var_13		= word ptr -13h
var_F		= dword ptr -0Fh
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 80h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		cmp	word ptr [si+2], 0
		jnz	short loc_CAAC
		jmp	loc_CB99

loc_CAAC:
		lea	ax, [bp+var_80]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_4331C
		add	sp, 2
		push	1
		push	[bp+arg_2]
		lea	ax, [bp+var_80]
		push	ax
		mov	bx, [bp+var_80]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	di
		lea	ax, [bp+var_80]
		push	ax
		call	IndexedRecordReader_AdvanceIndex_436B6
		add	sp, 4
		cmp	byte ptr [si+15h], 0
		jz	short loc_CAFD
		cmp	dword ptr [si+10h], 0
		jz	short loc_CAFD
		push	0
		mov	al, [si+14h]
		push	ax
		mov	ax, si
		add	ax, 10h
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_CAFD

loc_CAFD:
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		mov	ax, [bp+var_13]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_CB22
		mov	eax, [bp+var_1F]
		jmp	short loc_CB26

loc_CB22:
		mov	eax, [bp+var_F]

loc_CB26:
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
		mov	eax, [bp+var_8]
		mov	[si+10h], eax
		mov	byte ptr [si+14h], 2
		mov	byte ptr [si+15h], 1
		mov	dword ptr [si+16h], 0
		mov	eax, [bp+var_4]
		mov	[si+16h], eax
		push	0
		mov	al, [si+14h]
		push	ax
		push	word ptr [si+12h]
		push	word ptr [si+10h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		lea	ax, [bp+var_80]
		push	ax
		call	sub_43519
		add	sp, 8
		push	2
		lea	ax, [bp+var_80]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4

loc_CB99:
		pop	di
		pop	si
		leave
		retf
sub_CA94		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_CB9D		proc far

var_22		= word ptr -22h
var_1A		= byte ptr -1Ah
var_17		= byte ptr -17h
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_D		= byte ptr -0Dh
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 22h
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	byte_4A643, 0
		jnz	short loc_CBCF
		inc	byte_4A643
		mov	dword_4EF3C, 0
		mov	byte_4EF40, 2
		mov	byte_4EF41, 0
		mov	dword_4EF42, 0

loc_CBCF:
		cmp	word ptr [si+2], 0
		jnz	short loc_CBD8
		jmp	loc_CE78

loc_CBD8:
		cmp	dword ptr [si+10h], 0
		jz	short loc_CBE4
		mov	ax, 1
		jmp	short loc_CBE6

loc_CBE4:
		xor	ax, ax

loc_CBE6:
		or	ax, ax
		jnz	short loc_CBED
		jmp	loc_CE78

loc_CBED:
		cmp	byte_4EF41, 0
		jz	short loc_CC12
		cmp	dword_4EF3C, 0
		jz	short loc_CC12
		push	0
		mov	al, byte_4EF40
		push	ax
		push	655Ch
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_CC12

loc_CC12:
		mov	dword_4EF3C, 0
		mov	byte_4EF41, 0
		mov	dword_4EF42, 0
		mov	eax, [si+16h]
		mov	[bp+var_4], eax
		push	0
		push	8
		push	2
		push	large [bp+var_4]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		mov	eax, [bp+var_8]
		mov	dword_4EF3C, eax
		mov	byte_4EF40, 2
		mov	byte_4EF41, 1
		mov	dword_4EF42, 0
		mov	eax, [bp+var_4]
		mov	dword_4EF42, eax
		cmp	dword_4EF3C, 0
		jnz	short loc_CC7A
		jmp	loc_CDDC

loc_CC7A:
		cmp	dword ptr [si+10h], 0
		jnz	short loc_CC84
		jmp	loc_CDA0

loc_CC84:
		cmp	dword_4EF3C, 0
		jz	short loc_CC9A
		mov	eax, [si+16h]
		cmp	eax, dword_4EF42
		jg	short loc_CC9A
		jmp	loc_CD27

loc_CC9A:
		cmp	byte_4EF41, 0
		jz	short loc_CCBF
		cmp	dword_4EF3C, 0
		jz	short loc_CCBF
		push	0
		mov	al, byte_4EF40
		push	ax
		push	655Ch
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_CCBF

loc_CCBF:
		mov	dword_4EF3C, 0
		mov	byte_4EF41, 0
		mov	dword_4EF42, 0
		mov	eax, [si+16h]
		mov	[bp+var_C], eax
		mov	al, [si+14h]
		mov	[bp+var_D], al
		push	1
		push	0
		mov	al, [bp+var_D]
		push	ax
		push	large [bp+var_C]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word ptr [bp+var_12+2], dx
		mov	word ptr [bp+var_12], ax
		mov	eax, [bp+var_12]
		mov	dword_4EF3C, eax
		mov	al, [bp+var_D]
		mov	byte_4EF40, al
		mov	byte_4EF41, 1
		mov	dword_4EF42, 0
		mov	eax, [bp+var_C]
		mov	dword_4EF42, eax
		jmp	short loc_CD27

loc_CD27:
		cmp	byte_4EF40, 3
		jnz	short loc_CD57
		cmp	byte ptr [si+14h], 3
		jnz	short loc_CD57
		push	0
		push	3
		push	large [si+16h]
		push	word ptr [si+12h]
		push	word ptr [si+10h]
		push	word_4EF3E
		push	word ptr dword_4EF3C
		push	6C14h
		call	Memory_TypedAllocDispatch_3296E
		add	sp, 12h
		jmp	short loc_CD9E

loc_CD57:
		push	0
		push	2
		push	large [si+16h]
		push	0
		mov	al, [si+14h]
		push	ax
		push	word ptr [si+12h]
		push	word ptr [si+10h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		mov	al, byte_4EF40
		push	ax
		push	word_4EF3E
		push	word ptr dword_4EF3C
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	6C14h
		call	Memory_TypedAllocDispatch_3296E
		add	sp, 12h

loc_CD9E:
		jmp	short loc_CDA0

loc_CDA0:
		cmp	byte ptr [si+15h], 0
		jz	short loc_CDC6
		cmp	dword ptr [si+10h], 0
		jz	short loc_CDC6
		push	0
		mov	al, [si+14h]
		push	ax
		mov	ax, si
		add	ax, 10h
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_CDC6

loc_CDC6:
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		jmp	short loc_CE14

loc_CDDC:
		mov	ax, si
		add	ax, 10h
		mov	di, ax
		mov	eax, [di]
		mov	[bp+var_16], eax
		mov	al, [di+4]
		mov	[bp+var_17], al
		mov	eax, [bp+var_16]
		mov	dword_4EF3C, eax
		mov	al, [bp+var_17]
		mov	byte_4EF40, al
		mov	byte_4EF41, 0
		mov	dword_4EF42, 0
		mov	eax, [di+6]
		mov	dword_4EF42, eax

loc_CE14:
		push	655Ch
		lea	ax, [bp+var_22]
		push	ax
		call	sub_5D11
		add	sp, 4
		mov	bx, [si+2]
		mov	al, [bx+79h]
		shr	ax, 2
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jz	short loc_CE3B
		cmp	[bp+var_1A], 0
		jnz	short loc_CE6A

loc_CE3B:
		push	[bp+arg_2]
		lea	ax, [bp+var_22]
		push	ax
		call	sub_5D59
		add	sp, 2
		push	dx
		push	ax
		mov	bx, [si+2]
		push	word ptr [bx+4]
		call	sub_5053
		add	sp, 8
		push	0
		mov	bx, [si+2]
		push	word ptr [bx+4]
		call	sub_5065
		add	sp, 4

loc_CE6A:
		push	2
		lea	ax, [bp+var_22]
		push	ax
		call	sub_5C1C
		add	sp, 4

loc_CE78:
		pop	di
		pop	si
		leave
		retf
sub_CB9D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à VoicePlayer_IsDone_84CC
; (sub_84CC de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — far, LUE 2026-10-21. Vrai quand la réplique du lecteur de voix est finie : sans
; pilote ([si+2] = 0) renvoie 1 ; sinon appelle sub_30BD0 (fonction 124 du pilote son,
; AIL_VOC_playback_status, mov ax, 7Ch / jmp AIL_call_driver_3041C) et renvoie 1 si l'état
; vaut 3 (DAC_DONE d'AIL.INC), 0 sinon (cmp ax, 3).
; ==============================================================================================
VoicePlayer_IsDone_CE7C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jz	short loc_CEA8
		mov	bx, [si+2]
		push	word ptr [bx+4]
		call	sub_505F
		add	sp, 2
		cmp	ax, 3
		jnz	short loc_CEA1
		mov	ax, 1
		jmp	short loc_CEA3

loc_CEA1:
		xor	ax, ax

loc_CEA3:
		pop	si
		pop	bp
		retf
		jmp	short loc_CEAD

loc_CEA8:
		mov	al, 1
		pop	si
		pop	bp
		retf
VoicePlayer_IsDone_CE7C		endp

; START OF FUNCTION CHUNK FOR VoicePlayer_IsDone_CE7C

loc_CEAD:
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR VoicePlayer_IsDone_CE7C

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; VoicePlayer_IsPlaying_8500 (sub_8500 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants
; et contexte à revérifier ici. — far, LUE 2026-10-21. Vrai pendant la lecture de la réplique
; : sans pilote ([si+2] = 0) renvoie 0 ; sinon appelle sub_30BD0 (AIL_VOC_playback_status,
; fonction 124 du pilote son) et renvoie 1 si l'état vaut 2 (DAC_PLAYING d'AIL.INC), 0 sinon
; (cmp ax, 2). Utilisée par la cinématique mid2 (sub_6B9C0) pour attendre la fin d'une
; réplique (tant que en cours).
; ==============================================================================================
VoicePlayer_IsPlaying_CEB0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jz	short loc_CEDC
		mov	bx, [si+2]
		push	word ptr [bx+4]
		call	sub_505F
		add	sp, 2
		cmp	ax, 2
		jnz	short loc_CED5
		mov	ax, 1
		jmp	short loc_CED7

loc_CED5:
		xor	ax, ax

loc_CED7:
		pop	si
		pop	bp
		retf
		jmp	short loc_CEE1

loc_CEDC:
		mov	al, 0
		pop	si
		pop	bp
		retf
VoicePlayer_IsPlaying_CEB0		endp

; START OF FUNCTION CHUNK FOR VoicePlayer_IsPlaying_CEB0

loc_CEE1:
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR VoicePlayer_IsPlaying_CEB0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_CEE4		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jz	short loc_CF10
		mov	bx, [si+2]
		push	word ptr [bx+4]
		call	sub_505F
		add	sp, 2
		cmp	ax, 1
		jnz	short loc_CF09
		mov	ax, 1
		jmp	short loc_CF0B

loc_CF09:
		xor	ax, ax

loc_CF0B:
		pop	si
		pop	bp
		retf
		jmp	short loc_CF15

loc_CF10:
		mov	al, 1
		pop	si
		pop	bp
		retf
sub_CEE4		endp

; START OF FUNCTION CHUNK FOR sub_CEE4

loc_CF15:
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_CEE4

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_CF18		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jz	short loc_CF43
		mov	bx, [si+2]
		push	word ptr [bx+4]
		call	sub_505F
		add	sp, 2
		or	ax, ax
		jnz	short loc_CF3C
		mov	ax, 1
		jmp	short loc_CF3E

loc_CF3C:
		xor	ax, ax

loc_CF3E:
		pop	si
		pop	bp
		retf
		jmp	short loc_CF48

loc_CF43:
		mov	al, 1
		pop	si
		pop	bp
		retf
sub_CF18		endp

; START OF FUNCTION CHUNK FOR sub_CF18

loc_CF48:
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_CF18

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_CF4B		proc far
		push	bp
		mov	bp, sp
		cmp	byte_4A643, 0
		jz	short loc_CF91
		cmp	byte_4EF41, 0
		jz	short loc_CF7A
		cmp	dword_4EF3C, 0
		jz	short loc_CF7A
		push	0
		mov	al, byte_4EF40
		push	ax
		push	655Ch
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_CF7A

loc_CF7A:
		mov	dword_4EF3C, 0
		mov	byte_4EF41, 0
		mov	dword_4EF42, 0

loc_CF91:
		cmp	byte_4A642, 0
		jz	short loc_CFD4
		cmp	byte_4EF37, 0
		jz	short loc_CFBD
		cmp	dword_4EF32, 0
		jz	short loc_CFBD
		push	0
		mov	al, byte_4EF36
		push	ax
		push	6552h
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_CFBD

loc_CFBD:
		mov	dword_4EF32, 0
		mov	byte_4EF37, 0
sub_CF4B		endp

; START OF FUNCTION CHUNK FOR sub_CF4B
		db 66h, 0C7h, 6, 58h, 65h
; END OF FUNCTION CHUNK FOR sub_CF4B
seg022		ends

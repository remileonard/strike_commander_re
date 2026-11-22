seg133		segment	para public 'CODE' use16
		assume cs:seg133
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Music_IsMissileTargetingPlayer_58ED5 (sub_58ED5 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. —
; Ex-'Weapon_HUDBox_DrawElementA_58ED5'. far. LUE 2026-10-06. Parcourt les objets du monde
; (World_IterateObjects) : vrai si un objet de categorie 8 (missile, vtable+8) a pour cible
; [obj+0x55] le joueur (word_722E6).
; ==============================================================================================
Music_IsMissileTargetingPlayer_5B6C3		proc far

var_C		= word ptr -0Ch
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	ax, [bp+arg_0]
		mov	[bp+var_1], 0
		mov	ax, word_7CADA
		mov	[bp+var_4], ax
		mov	[bp+var_6], 0
		jmp	short loc_5B717

loc_5B6DE:
		mov	si, [bp+var_6]
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_A+2], dx
		mov	word ptr [bp+var_A], ax
		cmp	[bp+var_A], 0
		jz	short loc_5B717
		push	dx
		push	ax
		les	bx, word ptr [bp+var_A]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		cmp	al, 8
		jnz	short loc_5B717
		mov	ax, [si+5Ah]
		mov	[bp+var_C], ax
		cmp	ax, [bp+var_4]
		jnz	short loc_5B717
		mov	[bp+var_1], 1
		jmp	short loc_5B72A

loc_5B717:
		lea	ax, [bp+var_6]
		push	ax
		push	67ADh
		call	sub_1E7CF
		add	sp, 4
		or	ax, ax
		jnz	short loc_5B6DE

loc_5B72A:
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
Music_IsMissileTargetingPlayer_5B6C3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5B730		proc far

var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= word ptr -16h
var_15		= word ptr -15h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 3Ah
		push	si
		push	di
		mov	bx, [bp+arg_0]
		mov	[bp+var_1], 0
		mov	si, [bp+arg_4]
		add	si, 12h
		mov	di, [bp+arg_2]
		add	di, 12h
		mov	eax, [si]
		sub	eax, [di]
		mov	[bp+var_2E], eax
		mov	eax, [si+4]
		sub	eax, [di+4]
		mov	[bp+var_2A], eax
		mov	eax, [si+8]
		sub	eax, [di+8]
		mov	[bp+var_26], eax
		mov	eax, [bp+var_2E]
		mov	[bp+var_22], eax
		mov	eax, [bp+var_2A]
		mov	[bp+var_1E], eax
		mov	eax, [bp+var_26]
		mov	[bp+var_1A], eax
		push	eax
		push	large [bp+var_1E]
		push	large [bp+var_22]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_A], eax
		mov	[bp+var_E], eax
		mov	eax, [bp+var_E]
		mov	edx, dword_79762
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		mov	[bp+var_6], eax
		sar	eax, 8
		cmp	eax, 5DCh
		jle	short loc_5B7CF
		jmp	loc_5B855

loc_5B7CF:
		push	3
		push	large 100h
		lea	ax, word ptr [bp+var_22]
		push	ax
		call	sub_57677
		add	sp, 8
		push	[bp+arg_2]
		mov	bx, [bp+arg_2]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	si, ax
		mov	eax, [si]
		mov	[bp+var_3A], eax
		mov	eax, [si+4]
		mov	[bp+var_36], eax
		mov	eax, [si+8]
		mov	[bp+var_32], eax
		lea	ax, word ptr [bp+var_22]
		push	ax
		lea	ax, word ptr [bp+var_3A]
		push	ax
		push	ss
		lea	ax, [bp+var_16]
		push	ax
		call	sub_578DF
		add	sp, 8
		cmp	[bp+var_15], 2Dh
		jge	short loc_5B855
		push	[bp+arg_4]
		mov	bx, [bp+arg_4]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		lea	ax, word ptr [bp+var_22]
		push	ax
		call	Matrix_WorldToLocal_5A569
		add	sp, 4
		cmp	[bp+var_1E], 0
		jge	short loc_5B84B
		mov	ax, 1
		jmp	short loc_5B84D

loc_5B84B:
		xor	ax, ax

loc_5B84D:
		or	al, al
		jz	short loc_5B855
		mov	[bp+var_1], 1

loc_5B855:
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
sub_5B730		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5B85C		proc far

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
var_7		= byte ptr -7
var_6		= word ptr -6
var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 30h
		push	si
		push	di
		mov	bx, [bp+arg_0]
		mov	[bp+var_1], 0
		mov	ax, word_7CADA
		mov	[bp+var_4], ax
		mov	[bp+var_6], ax
		mov	bx, [bp+var_6]
		les	bx, [bx+5Fh]
		mov	si, es:[bx+0Eh]
		or	si, si
		jnz	short loc_5B885
		jmp	loc_5B957

loc_5B885:
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		or	ax, dx
		jz	short loc_5B898
		push	si
		mov	bx, [si]
		call	dword ptr [bx+34h]
		pop	cx
		jmp	short loc_5B89A

loc_5B898:
		mov	al, 1Ch

loc_5B89A:
		cmp	al, 6
		jz	short loc_5B8A1
		jmp	loc_5B95B

loc_5B8A1:
		mov	di, si
		push	word ptr [di+52h]
		mov	bx, [di+52h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	bx, ax
		mov	al, [bx+92h]
		shr	ax, 5
		and	ax, 1
		mov	[bp+var_7], al
		mov	ah, 0
		or	ax, ax
		jz	short loc_5B8C7
		jmp	loc_5B95B

loc_5B8C7:
		add	si, 12h
		mov	di, [bp+var_6]
		add	di, 12h
		mov	eax, [si]
		sub	eax, [di]
		mov	[bp+var_30], eax
		mov	eax, [si+4]
		sub	eax, [di+4]
		mov	[bp+var_2C], eax
		mov	eax, [si+8]
		sub	eax, [di+8]
		mov	[bp+var_28], eax
		mov	eax, [bp+var_30]
		mov	[bp+var_24], eax
		mov	eax, [bp+var_2C]
		mov	[bp+var_20], eax
		mov	eax, [bp+var_28]
		mov	[bp+var_1C], eax
		push	eax
		push	large [bp+var_20]
		push	large [bp+var_24]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_10], eax
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	edx, dword_79762
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_C], eax
		sar	eax, 8
		cmp	eax, 5DCh
		jge	short loc_5B957
		mov	[bp+var_1], 1
		jmp	short loc_5B95B

loc_5B957:
		mov	[bp+var_1], 0

loc_5B95B:
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
sub_5B85C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5B962		proc far

var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= byte ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= byte ptr -4
var_3		= byte ptr -3
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 26h
		push	si
		push	di
		mov	ax, [bp+arg_0]
		mov	[bp+var_1], 0
		mov	[bp+var_2], 0
		mov	si, word_79B8C
		cmp	word ptr [si+5Fh], 0
		jz	short loc_5B99A
		push	large 0
		mov	bx, [si+5Fh]
		push	large [bx+10h]
		mov	ax, [bx+2]
		add	ax, 40h
		push	ax
		call	Expr_VM_ExecuteSingleInstruction_530DB
		add	sp, 0Ah
		jmp	short loc_5B99A

loc_5B99A:
		push	0FFh
		call	GameVar_Get_56414
		pop	cx
		add	ax, 100h
		push	ax
		call	GameVar_Get_56414
		pop	cx
		mov	[bp+var_3], al
		cmp	[bp+var_3], 0
		jz	short loc_5B9BA
		mov	[bp+var_2], 1

loc_5B9BA:
		mov	[bp+var_4], 0
		mov	[bp+var_6], 0
		jmp	loc_5BADF

loc_5B9C6:
		mov	si, [bp+var_6]
		cmp	si, [bp+arg_2]
		jnz	short loc_5B9D1
		jmp	loc_5BADF

loc_5B9D1:
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		cmp	[bp+var_C], 0
		jnz	short loc_5B9E7
		jmp	loc_5BAD6

loc_5B9E7:
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		or	ax, dx
		jz	short loc_5B9FA
		push	si
		mov	bx, [si]
		call	dword ptr [bx+34h]
		pop	cx
		jmp	short loc_5B9FC

loc_5B9FA:
		mov	al, 1Ch

loc_5B9FC:
		mov	[bp+var_E], al
		mov	ah, 0
		mov	[bp+var_8], ax
		mov	cx, 7
		mov	bx, offset word_5BB05

loc_5BA0A:
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_8]
		jz	short loc_5BA1A
		add	bx, 2
		loop	short loc_5BA0A
		jmp	loc_5BAD6

loc_5BA1A:
		jmp	word ptr cs:[bx+0Eh] ; switch jump

loc_5BA1E:
		cmp	[bp+var_E], 6
		jnz	short loc_5BA43
		push	word ptr [si+52h]
		mov	bx, [si+52h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	bx, ax
		mov	al, [bx+92h]
		shr	ax, 5
		and	ax, 1
		or	al, al
		jz	short loc_5BA43
		jmp	loc_5BAD6

loc_5BA43:
		cmp	[bp+var_E], 1
		jnz	short loc_5BA52
		cmp	[bp+var_2], 0
		jz	short loc_5BA52
		jmp	loc_5BAD6

loc_5BA52:
		mov	di, si
		cmp	byte ptr [di+51h], 0FFh
		jnz	short loc_5BAD6
		mov	si, word_7CADA
		add	si, 12h
		mov	eax, [si]
		mov	[bp+var_26], eax
		mov	eax, [si+4]
		mov	[bp+var_22], eax
		mov	eax, [si+8]
		mov	[bp+var_1E], eax
		mov	si, di
		add	si, 12h
		mov	eax, [si]
		sub	[bp+var_26], eax
		mov	eax, [si+4]
		sub	[bp+var_22], eax
		mov	eax, [si+8]
		sub	[bp+var_1E], eax
		push	large [bp+var_1E]
		push	large [bp+var_22]
		push	large [bp+var_26]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_16], eax
		mov	[bp+var_1A], eax
		sar	eax, 8
		mov	[bp+var_12], eax
		cmp	[bp+var_12], 4858h
		jge	short loc_5BAD6
		cmp	[bp+var_E], 6
		jnz	short loc_5BAD2
		or	[bp+var_1], 1
		jmp	short loc_5BAD6

loc_5BAD2:
		or	[bp+var_1], 2

loc_5BAD6:
		cmp	[bp+var_1], 3
		jnz	short loc_5BADF
		inc	[bp+var_4]

loc_5BADF:
		lea	ax, [bp+var_6]
		push	ax
		push	67ADh
		call	sub_1E7CF
		add	sp, 4
		or	ax, ax
		jz	short loc_5BAFE
		mov	al, [bp+var_4]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5BAFE
		jmp	loc_5B9C6

loc_5BAFE:
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
sub_5B962		endp

; START OF FUNCTION CHUNK FOR sub_5B962
word_5BB05	dw 1
		dw 6
		dw 13h
		dw 14h
		dw 15h
		dw 17h
		dw 18h
off_5BB13	dw offset loc_5BA1E
		dw offset loc_5BA1E
		dw offset loc_5BA1E
		dw offset loc_5BA1E
		dw offset loc_5BA1E
		dw offset loc_5BA1E
		dw offset loc_5BA1E
; END OF FUNCTION CHUNK FOR sub_5B962

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5BB21		proc far

var_4		= byte ptr -4
var_3		= byte ptr -3
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	ax, [bp+arg_0]
		mov	[bp+var_1], 0
		mov	di, 0FFFFh
		mov	[bp+var_2], 0
		cmp	[bp+arg_2], 0
		jz	short loc_5BB75
		push	[bp+arg_4]
		push	ax
		push	cs
		call	near ptr sub_5B962
		add	sp, 4
		mov	dl, al
		or	dl, dl
		jz	short loc_5BB6E
		mov	al, byte_79D88
		and	al, 1
		mov	[bp+var_3], al
		mov	al, dl
		and	al, 1
		mov	[bp+var_4], al
		cmp	[bp+var_3], 0
		jz	short loc_5BB79
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5BB79
		mov	di, 1
		jmp	short loc_5BB79

loc_5BB6E:
		cmp	byte_79D88, 0
		jz	short loc_5BB79

loc_5BB75:
		mov	[bp+var_2], 1

loc_5BB79:
		cmp	[bp+var_2], 0
		jz	short loc_5BBE4
		mov	si, word_79B8C
		cmp	word ptr [si+5Fh], 0
		jz	short loc_5BBA4
		push	large 0
		mov	bx, [si+5Fh]
		push	large [bx+10h]
		mov	ax, [bx+2]
		add	ax, 40h
		push	ax
		call	Expr_VM_ExecuteSingleInstruction_530DB
		add	sp, 0Ah
		jmp	short loc_5BBA4

loc_5BBA4:
		push	0FFh
		call	GameVar_Get_56414
		pop	cx
		add	ax, 100h
		push	ax
		call	GameVar_Get_56414
		pop	cx
		mov	[bp+var_3], al
		cmp	[bp+var_3], 0
		jz	short loc_5BBD5
		mov	ax, si
		add	ax, 79h
		push	ax
		call	sub_1AC03
		pop	cx
		or	al, al
		jz	short loc_5BBD5
		mov	di, 11h
		jmp	short loc_5BBE4

loc_5BBD5:
		cmp	byte_79D87, 0
		jz	short loc_5BBE4
		mov	di, 3
		mov	byte_79D87, 0

loc_5BBE4:
		cmp	di, 0FFFFh
		jz	short loc_5BBF1
		mov	word_79D77, di
		mov	[bp+var_1], 1

loc_5BBF1:
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
sub_5BB21		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5BBF8		proc far

var_8		= dword ptr -8
var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, 0FFFFh
		cmp	byte_7769E, 0
		jz	short loc_5BC10
		jmp	loc_5BD4F

loc_5BC10:
		cmp	byte_77698, 0
		jz	short loc_5BC1A
		jmp	loc_5BD4F

loc_5BC1A:
		cmp	byte_7CEF8, 0Ch
		jnz	short loc_5BC24
		jmp	loc_5BD4F

loc_5BC24:
		cmp	byte_7D06A, 0Bh
		jnz	short loc_5BC2E
		jmp	loc_5BD4F

loc_5BC2E:
		mov	ax, word_7CADA
		mov	[bp+var_2], ax
		cmp	byte_79D76, 3
		jnz	short loc_5BC3E
		jmp	loc_5BD4F

loc_5BC3E:
		mov	[bp+var_3], 0
		push	0
		push	si
		push	cs
		call	near ptr sub_5B962
		add	sp, 4
		mov	byte_79D88, al
		mov	bx, word_79D77
		sub	bx, 4
		cmp	bx, 0Fh
		ja	short loc_5BC96
		shl	bx, 1
		jmp	cs:off_5BD55[bx]	; switch jump

loc_5BC62:
		cmp	word_7D06D, 0
		jz	short loc_5BC8A
		push	word_7D06F
		mov	bx, word_7D06D
		push	word ptr [bx+4]
		call	sub_1DC07
		add	sp, 4
		cmp	ax, 2
		jnz	short loc_5BC86
		mov	ax, 1
		jmp	short loc_5BC88

loc_5BC86:
		xor	ax, ax

loc_5BC88:
		jmp	short loc_5BC8C

loc_5BC8A:
		mov	al, 1

loc_5BC8C:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5BC96
		mov	[bp+var_3], 1

loc_5BC96:
		cmp	byte_79D88, 0
		jnz	short loc_5BCA0
		jmp	loc_5BD2C

loc_5BCA0:
		mov	byte_79D87, 1
		cmp	word_7CAE2, 0
		jz	short loc_5BCB1
		mov	ax, 1
		jmp	short loc_5BCB3

loc_5BCB1:
		xor	ax, ax

loc_5BCB3:
		or	al, al
		jz	short loc_5BCBC
		mov	di, 0Dh
		jmp	short loc_5BD21

loc_5BCBC:
		push	si
		push	cs
		call	near ptr sub_5B85C
		pop	cx
		or	al, al
		jz	short loc_5BCCB
		mov	di, 12h
		jmp	short loc_5BD21

loc_5BCCB:
		mov	bx, [bp+var_2]
		mov	eax, [bx+63h]
		mov	[bp+var_8], eax
		push	large [bp+var_8]
		call	sub_41658
		add	sp, 4
		or	al, al
		jz	short loc_5BCEB
		mov	di, 2
		jmp	short loc_5BD21

loc_5BCEB:
		push	large [bp+var_8]
		call	DamageSys_IsSeriouslyDamaged_41612
		add	sp, 4
		or	al, al
		jz	short loc_5BD00
		mov	di, 0Ah
		jmp	short loc_5BD21

loc_5BD00:
		test	byte_79D88, 1
		jz	short loc_5BD15
		mov	al, [bp+var_3]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5BD21
		mov	di, 9
		jmp	short loc_5BD21

loc_5BD15:
		mov	al, [bp+var_3]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5BD21
		mov	di, 1

loc_5BD21:
		cmp	di, 0FFFFh
		jz	short loc_5BD4F
		mov	word_79D77, di
		jmp	short loc_5BD4F

loc_5BD2C:
		push	0
		push	0
		push	si
		push	cs
		call	near ptr sub_5BB21
		add	sp, 6
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5BD4F
		mov	al, [bp+var_3]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5BD4F
		mov	al, byte_79B8E
		mov	ah, 0
		mov	word_79D77, ax

loc_5BD4F:
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
sub_5BBF8		endp

; START OF FUNCTION CHUNK FOR sub_5BBF8
off_5BD55	dw offset loc_5BC62
		dw offset loc_5BC96
		dw offset loc_5BC96
		dw offset loc_5BC96
		dw offset loc_5BC96
		dw offset loc_5BC96
		dw offset loc_5BC96
		dw offset loc_5BC62
		dw offset loc_5BC62
		dw offset loc_5BC96
		dw offset loc_5BC96
		dw offset loc_5BC62
		dw offset loc_5BC62
		dw offset loc_5BC96
		dw offset loc_5BC96
		dw offset loc_5BC62
; END OF FUNCTION CHUNK FOR sub_5BBF8

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5BD75		proc far

var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	al, 20h
		out	20h, al
		cmp	word_79D77, 0FFFFh
		jnz	short loc_5BD8A
		jmp	loc_5BF5B

loc_5BD8A:
		mov	al, byte_79D76
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 3
		jbe	short loc_5BD99
		jmp	loc_5BF56

loc_5BD99:
		shl	bx, 1
		jmp	cs:off_5BF5E[bx]	; switch jump

loc_5BDA0:
		mov	ax, 4700h
		mov	dx, word_7AB82
		int	67h
		mov	al, byte ptr word_79D77
		mov	byte_7D06A, al
		mov	ah, 0
		mov	[bp+var_2], ax
		mov	si, 693Dh
		push	0
		imul	ax, ax, 0Ch
		mov	dx, word ptr dword_79D6E
		add	dx, ax
		push	word_79D70
		push	dx
		push	si
		call	sub_5CA19
		add	sp, 8
		mov	al, byte_79D64
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5BDF0
		cmp	word ptr [si], 0
		jz	short loc_5BDF0
		push	word ptr [si+2]
		mov	bx, [si]
		push	word ptr [bx+4]
		call	sub_1DBF5
		add	sp, 4
		jmp	short loc_5BDF0

loc_5BDF0:
		mov	byte_7D07B, 1

loc_5BDF5:
		mov	byte_79D76, 1

loc_5BDFA:
		mov	ax, 4800h
		mov	dx, word_7AB82
		int	67h
		jmp	loc_5BF5B

loc_5BE06:
		mov	al, byte_7D06A
		mov	ah, 0
		cmp	ax, word_79D77
		jz	short loc_5BE67
		mov	al, byte_76D40
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5BE3D
		cmp	word_7D06D, 0
		jz	short loc_5BE36
		push	word_7D06F
		mov	bx, word_7D06D
		push	word ptr [bx+4]
		call	sub_1DC2B
		add	sp, 4
		jmp	short loc_5BE38

loc_5BE36:
		xor	ax, ax

loc_5BE38:
		mov	word_7D06B, ax
		jmp	short loc_5BE5F

loc_5BE3D:
		cmp	word_7D06D, 0
		jz	short loc_5BE59
		push	word_7D06F
		mov	bx, word_7D06D
		push	word ptr [bx+4]
		call	sub_1DC2B
		add	sp, 4
		jmp	short loc_5BE5B

loc_5BE59:
		xor	ax, ax

loc_5BE5B:
		inc	ax
		mov	word_7D06B, ax

loc_5BE5F:
		mov	byte_79D76, 2
		jmp	loc_5BF5B

loc_5BE67:
		cmp	word_7D06D, 0
		jz	short loc_5BE8F
		push	word_7D06F
		mov	bx, word_7D06D
		push	word ptr [bx+4]
		call	sub_1DC07
		add	sp, 4
		cmp	ax, 2
		jnz	short loc_5BE8B
		mov	ax, 1
		jmp	short loc_5BE8D

loc_5BE8B:
		xor	ax, ax

loc_5BE8D:
		jmp	short loc_5BE91

loc_5BE8F:
		mov	al, 1

loc_5BE91:
		or	al, al
		jnz	short loc_5BE98
		jmp	loc_5BF5B

loc_5BE98:
		mov	ax, word_79D79
		mov	word_79D77, ax
		jmp	loc_5BF5B

loc_5BEA1:
		mov	al, byte_7D06A
		mov	ah, 0
		cmp	ax, word_79D77
		jnz	short loc_5BEB4
		mov	byte_79D76, 1
		jmp	loc_5BF5B

loc_5BEB4:
		cmp	word_7D06D, 0
		jz	short loc_5BED0
		push	word_7D06F
		mov	bx, word_7D06D
		push	word ptr [bx+4]
		call	sub_1DC2B
		add	sp, 4
		jmp	short loc_5BED2

loc_5BED0:
		xor	ax, ax

loc_5BED2:
		cmp	ax, word_7D06B
		jnz	short loc_5BF06
		cmp	word_7D06D, 0
		jz	short loc_5BF00
		push	word_7D06F
		mov	bx, word_7D06D
		push	word ptr [bx+4]
		call	sub_1DC07
		add	sp, 4
		cmp	ax, 2
		jnz	short loc_5BEFC
		mov	ax, 1
		jmp	short loc_5BEFE

loc_5BEFC:
		xor	ax, ax

loc_5BEFE:
		jmp	short loc_5BF02

loc_5BF00:
		mov	al, 1

loc_5BF02:
		or	al, al
		jz	short loc_5BF5B

loc_5BF06:
		mov	ax, 4700h
		mov	dx, word_7AB82
		int	67h
		nop
		push	cs
		call	near ptr sub_5BF66
		jmp	loc_5BDFA

loc_5BF17:
		cmp	word_7D07F, 0
		jz	short loc_5BF3F
		push	word_7D081
		mov	bx, word_7D07F
		push	word ptr [bx+4]
		call	sub_1DC07
		add	sp, 4
		cmp	ax, 2
		jnz	short loc_5BF3B
		mov	ax, 1
		jmp	short loc_5BF3D

loc_5BF3B:
		xor	ax, ax

loc_5BF3D:
		jmp	short loc_5BF41

loc_5BF3F:
		mov	al, 1

loc_5BF41:
		or	al, al
		jz	short loc_5BF5B
		mov	ax, 4700h
		mov	dx, word_7AB82
		int	67h
		nop
		push	cs
		call	near ptr sub_5C154
		jmp	loc_5BDF5

loc_5BF56:
		mov	byte_79D64, 1

loc_5BF5B:
		pop	si
		leave
		retf
sub_5BD75		endp

; START OF FUNCTION CHUNK FOR sub_5BD75
off_5BF5E	dw offset loc_5BDA0
		dw offset loc_5BE06
		dw offset loc_5BEA1
		dw offset loc_5BF17
; END OF FUNCTION CHUNK FOR sub_5BD75

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5BF66		proc far

var_8		= word ptr -8
var_5		= byte ptr -5
var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	bx, word_79D77
		sub	bx, 4
		cmp	bx, 0Fh
		ja	short loc_5BFA9
		shl	bx, 1
		jmp	cs:off_5C134[bx]	; switch jump

loc_5BF80:
		mov	al, byte_7D06A
		mov	ah, 0
		cmp	ax, 5
		jz	short loc_5BF99
		cmp	ax, 12h
		jz	short loc_5BF91
		jmp	short loc_5BFA1

loc_5BF91:
		mov	word_79D79, 9
		jmp	short loc_5BFA9

loc_5BF99:
		mov	word_79D79, 1
		jmp	short loc_5BFA9

loc_5BFA1:
		mov	al, byte_7D06A
		mov	ah, 0
		mov	word_79D79, ax

loc_5BFA9:
		mov	al, byte_7D06A
		mov	ah, 0
		imul	ax, ax, 0Ch
		mov	dx, word_79D70
		mov	bx, word ptr dword_79D6E
		add	bx, ax
		mov	[bp+var_2], dx
		mov	[bp+var_4], bx
		mov	es, [bp+var_2]
		mov	al, es:[bx+0Ah]
		mov	ah, 0
		push	ax
		mov	ax, word_7D06B
		cwd
		pop	bx
		idiv	bx
		mov	word_7D06B, dx
		cmp	word_7D06B, 0
		jz	short loc_5BFE3
		inc	word_7D06B
		jmp	short loc_5BFEF

loc_5BFE3:
		les	bx, [bp+var_4]
		mov	al, es:[bx+0Bh]
		mov	ah, 0
		mov	word_7D06B, ax

loc_5BFEF:
		mov	al, byte_7D06A
		mov	ah, 0
		shl	ax, 2
		les	bx, word ptr dword_79D7F
		add	bx, ax
		les	bx, es:[bx]
		add	bx, word_79D77
		mov	dl, es:[bx]
		cmp	dl, 0FFh
		jnz	short loc_5C012
		mov	[bp+var_5], 0
		jmp	short loc_5C02C

loc_5C012:
		mov	al, dl
		mov	ah, 0
		shl	ax, 2
		les	bx, word ptr dword_79D7B
		add	bx, ax
		les	bx, es:[bx]
		add	bx, word_7D06B
		mov	al, es:[bx]
		mov	[bp+var_5], al

loc_5C02C:
		mov	al, [bp+var_5]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5C089
		push	693Dh
		call	Music_ChannelStopSequence_5C915
		pop	cx
		mov	al, byte ptr word_79D77
		mov	byte_7D06A, al
		mov	ah, 0
		mov	[bp+var_8], ax
		mov	si, 693Dh
		push	0
		imul	ax, ax, 0Ch
		mov	dx, word ptr dword_79D6E
		add	dx, ax
		push	word_79D70
		push	dx
		push	si
		call	sub_5CA19
		add	sp, 8
		cmp	word ptr [si], 0
		jz	short loc_5C07C
		push	word ptr [si+2]
		mov	bx, [si]
		push	word ptr [bx+4]
		call	sub_1DBF5
		add	sp, 4
		jmp	short loc_5C07C

loc_5C07C:
		mov	byte_7D07B, 1
		mov	byte_79D76, 1
		jmp	loc_5C131

loc_5C089:
		cmp	[bp+var_5], 0FFh
		jnz	short loc_5C093
		mov	[bp+var_5], 0

loc_5C093:
		test	[bp+var_5], 80h
		jz	short loc_5C09F
		and	[bp+var_5], 7Fh
		jmp	short loc_5C0AD

loc_5C09F:
		push	693Dh
		call	Music_ChannelStopSequence_5C915
		pop	cx
		mov	byte_7D07B, 0

loc_5C0AD:
		mov	al, [bp+var_5]
		mov	ah, 0
		cmp	ax, word_79D68
		jle	short loc_5C0F3
		mov	byte_79D64, 2
		movzx	eax, byte_7D06A
		mov	dword_7C9C0, eax
		movsx	eax, word_79D77
		mov	dword_7C9C4, eax
		movzx	eax, [bp+var_5]
		mov	dword_7C9CC, eax
		movsx	eax, word_79D68
		mov	dword_7C9D0, eax
		mov	byte_79D76, 1
		mov	al, byte_7D06A
		mov	ah, 0
		mov	word_79D77, ax
		jmp	short loc_5C131

loc_5C0F3:
		mov	si, 694Fh
		push	0
		mov	al, [bp+var_5]
		mov	ah, 0
		dec	ax
		imul	ax, ax, 0Ah
		mov	dx, word ptr dword_79D72
		add	dx, ax
		push	word_79D74
		push	dx
		push	si
		call	sub_5CA19
		add	sp, 8
		cmp	word ptr [si], 0
		jz	short loc_5C12C
		push	word ptr [si+2]
		mov	bx, [si]
		push	word ptr [bx+4]
		call	sub_1DBF5
		add	sp, 4
		jmp	short loc_5C12C

loc_5C12C:
		mov	byte_79D76, 3

loc_5C131:
		pop	si
		leave
		retf
sub_5BF66		endp

; START OF FUNCTION CHUNK FOR sub_5BF66
off_5C134	dw offset loc_5BF80
		dw offset loc_5BFA9
		dw offset loc_5BFA9
		dw offset loc_5BFA9
		dw offset loc_5BFA9
		dw offset loc_5BFA9
		dw offset loc_5BFA9
		dw offset loc_5BFA9
		dw offset loc_5BF80
		dw offset loc_5BFA9
		dw offset loc_5BFA9
		dw offset loc_5BF80
		dw offset loc_5BF80
		dw offset loc_5BFA9
		dw offset loc_5BFA9
		dw offset loc_5BF80
; END OF FUNCTION CHUNK FOR sub_5BF66

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5C154		proc far

var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	694Fh
		call	Music_ChannelStopSequence_5C915
		pop	cx
		mov	byte_7D08D, 0
		cmp	byte_7D07B, 1
		jnz	short loc_5C179
		push	693Dh
		call	Music_ChannelStopSequence_5C915
		pop	cx

loc_5C179:
		mov	al, byte ptr word_79D77
		mov	byte_7D06A, al
		mov	ah, 0
		mov	[bp+var_2], ax
		mov	si, 693Dh
		push	0
		imul	ax, ax, 0Ch
		mov	dx, word ptr dword_79D6E
		add	dx, ax
		push	word_79D70
		push	dx
		push	si
		call	sub_5CA19
		add	sp, 8
		cmp	word ptr [si], 0
		jz	short loc_5C1B7
		push	word ptr [si+2]
		mov	bx, [si]
		push	word ptr [bx+4]
		call	sub_1DBF5
		add	sp, 4
		jmp	short loc_5C1B7

loc_5C1B7:
		mov	byte_7D07B, 1
		pop	si
		leave
		retf
sub_5C154		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5C1BF		proc far

var_86		= word ptr -86h
var_74		= word ptr -74h
var_25		= dword ptr -25h
var_19		= word ptr -19h
var_17		= dword ptr -17h
var_15		= dword ptr -15h
var_13		= dword ptr -13h
var_E		= dword ptr -0Eh
var_C		= dword ptr -0Ch
var_A		= dword ptr -0Ah
var_8		= dword ptr -8
var_6		= dword ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 86h
		push	si
		push	di
		mov	ax, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	si, [bp+arg_4]
		push	1
		push	ax
		call	sub_75432
		add	sp, 4
		cmp	si, 0FFFFh
		jz	short loc_5C1E4
		jmp	loc_5C2E1

loc_5C1E4:
		mov	word ptr [bp+var_4+2], di
		lea	ax, [bp+var_74]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_74], 508h
		mov	[bp+var_13], 100h
		mov	[bp+var_17], 0
		mov	[bp+var_74], 0E61h
		push	1
		push	word ptr [bp+var_4+2]
		lea	ax, [bp+var_74]
		push	ax
		mov	bx, [bp+var_74]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_74]
		push	ax
		call	StreamReader_GetCapacity_6C5B4
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_6], eax
		cmp	byte_7D093, 0
		jz	short loc_5C254
		cmp	dword_7D08E, 0
		jz	short loc_5C254
		push	0
		mov	al, byte_7D092
		push	ax
		push	695Eh
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_5C254

loc_5C254:
		mov	dword_7D08E, 0
		mov	byte_7D093, 0
		mov	dword_7D094, 0
		mov	eax, [bp+var_6]
		mov	[bp+var_A], eax
		push	1
		push	0
		push	3
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_C], dx
		mov	word ptr [bp+var_E], ax
		mov	eax, [bp+var_E]
		mov	dword_7D08E, eax
		mov	byte_7D092, 3
		mov	byte_7D093, 1
		mov	dword_7D094, 0
		mov	eax, [bp+var_A]
		mov	dword_7D094, eax
		push	0
		mov	al, byte_7D092
		push	ax
		push	large dword_7D08E
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_74]
		push	ax
		call	sub_6B53F
		add	sp, 6
		push	0
		lea	ax, [bp+var_74]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		jmp	loc_5C3D4

loc_5C2E1:
		push	1
		push	di
		lea	ax, [bp+var_86]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_7437
		add	sp, 6
		push	si
		lea	ax, [bp+var_86]
		push	ax
		call	sub_7844
		add	sp, 4
		mov	ax, [bp+var_19]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_5C310
		mov	eax, [bp+var_25]
		jmp	short loc_5C314

loc_5C310:
		mov	eax, [bp+var_15]

loc_5C314:
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jnz	short loc_5C322
		jmp	loc_5C3C8

loc_5C322:
		cmp	byte_7D093, 0
		jz	short loc_5C347
		cmp	dword_7D08E, 0
		jz	short loc_5C347
		push	0
		mov	al, byte_7D092
		push	ax
		push	695Eh
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_5C347

loc_5C347:
		mov	dword_7D08E, 0
		mov	byte_7D093, 0
		mov	dword_7D094, 0
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		push	1
		push	0
		push	3
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_A], dx
		mov	word ptr [bp+var_C], ax
		mov	eax, [bp+var_C]
		mov	dword_7D08E, eax
		mov	byte_7D092, 3
		mov	byte_7D093, 1
		mov	dword_7D094, 0
		mov	eax, [bp+var_8]
		mov	dword_7D094, eax
		push	0
		mov	al, byte_7D092
		push	ax
		push	large dword_7D08E
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	si
		lea	ax, [bp+var_86]
		push	ax
		call	sub_75C8
		add	sp, 8

loc_5C3C8:
		push	2
		lea	ax, [bp+var_86]
		push	ax
		call	IndexedRecordReader_Destruct_73BD

loc_5C3D4:
		add	sp, 4
		push	0
		mov	al, byte_7D092
		push	ax
		push	large dword_7D08E
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		or	ax, dx
		jz	short loc_5C419
		mov	si, 693Dh
		push	0
		push	695Eh
		push	si
		call	sub_5C9C1
		add	sp, 6
		cmp	word ptr [si], 0
		jz	short loc_5C419
		push	word ptr [si+2]
		mov	bx, [si]
		push	word ptr [bx+4]
		call	sub_1DBF5
		add	sp, 4
		jmp	short loc_5C419

loc_5C419:
		pop	di
		pop	si
		leave
		retf
sub_5C1BF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5C41D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		cmp	word_7D06D, 0
		jz	short loc_5C44B
		push	word_7D06F
		mov	bx, word_7D06D
		push	word ptr [bx+4]
		call	sub_1DC07
		add	sp, 4
		cmp	ax, 1
		jnz	short loc_5C447
		mov	ax, 1
		jmp	short loc_5C449

loc_5C447:
		xor	ax, ax

loc_5C449:
		jmp	short loc_5C44D

loc_5C44B:
		mov	al, 0

loc_5C44D:
		or	al, al
		jz	short loc_5C4C3
		cmp	word_7D06D, 0
		jz	short loc_5C473
		push	large 3E80000h
		push	word_7D06F
		mov	bx, word_7D06D
		push	word ptr [bx+4]
		call	sub_1DC19
		add	sp, 8
		jmp	short loc_5C473

loc_5C473:
		cmp	word_7D06D, 0
		jz	short loc_5C49B
		push	word_7D06F
		mov	bx, word_7D06D
		push	word ptr [bx+4]
		call	sub_1DC07
		add	sp, 4
		cmp	ax, 1
		jnz	short loc_5C497
		mov	ax, 1
		jmp	short loc_5C499

loc_5C497:
		xor	ax, ax

loc_5C499:
		jmp	short loc_5C49D

loc_5C49B:
		mov	al, 0

loc_5C49D:
		or	al, al
		jz	short loc_5C4C3
		cmp	word_7D06D, 0
		jz	short loc_5C4BD
		push	word_7D06F
		mov	bx, word_7D06D
		push	word ptr [bx+4]
		call	sub_1DC0D
		add	sp, 4
		jmp	short loc_5C4BF

loc_5C4BD:
		xor	ax, ax

loc_5C4BF:
		or	ax, ax
		jnz	short loc_5C473

loc_5C4C3:
		push	693Dh
		call	Music_ChannelStopSequence_5C915
		pop	cx
		cmp	byte_7D093, 0
		jz	short loc_5C4F1
		cmp	dword_7D08E, 0
		jz	short loc_5C4F1
		push	0
		mov	al, byte_7D092
		push	ax
		push	695Eh
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_5C4F1

loc_5C4F1:
		mov	dword_7D08E, 0
		mov	byte_7D093, 0
		mov	dword_7D094, 0
		pop	bp
		retf
sub_5C41D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5C50A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		cmp	word_7D06D, 0
		jz	short loc_5C538
		push	word_7D06F
		mov	bx, word_7D06D
		push	word ptr [bx+4]
		call	sub_1DC07
		add	sp, 4
		cmp	ax, 1
		jnz	short loc_5C534
		mov	ax, 1
		jmp	short loc_5C536

loc_5C534:
		xor	ax, ax

loc_5C536:
		jmp	short loc_5C53A

loc_5C538:
		mov	al, 0

loc_5C53A:
		pop	bp
		retf
sub_5C50A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5C53C		proc far
		push	bp
		mov	bp, sp
		mov	word_7D071, 0D7Ch
		mov	ax, word_7AFA2
		mov	word_7D073, ax
		mov	word_7AFA2, 6941h
		mov	word_7D071, 0D84h
		mov	dword_7D075, 0
		mov	byte_7D079, 0
		mov	word_7D06D, 0
		mov	word_7D06F, 0FFFFh
		mov	word_7D083, 0D7Ch
		mov	ax, word_7AFA2
		mov	word_7D085, ax
		mov	word_7AFA2, 6953h
		mov	word_7D083, 0D84h
		mov	dword_7D087, 0
		mov	byte_7D08B, 0
		mov	word_7D07F, 0
		mov	word_7D081, 0FFFFh
		mov	dword_7D08E, 0
		mov	byte_7D092, 2
		mov	byte_7D093, 0
		mov	dword_7D094, 0
		pop	bp
		retf
sub_5C53C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5C5C1		proc far
		push	bp
		mov	bp, sp
		cmp	byte_7D093, 0
		jz	short loc_5C5E9
		cmp	dword_7D08E, 0
		jz	short loc_5C5E9
		push	0
		mov	al, byte_7D092
		push	ax
		push	695Eh
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_5C5E9

loc_5C5E9:
		mov	dword_7D08E, 0
		mov	byte_7D093, 0
		mov	dword_7D094, 0
		push	694Fh
		call	Music_ChannelStopSequence_5C915
		pop	cx
		push	2
		push	6953h
		call	sub_1CD03
		add	sp, 4
		push	693Dh
		call	Music_ChannelStopSequence_5C915
		pop	cx
sub_5C5C1		endp

; START OF FUNCTION CHUNK FOR sub_5C5C1
		db 6Ah
; END OF FUNCTION CHUNK FOR sub_5C5C1
seg133		ends

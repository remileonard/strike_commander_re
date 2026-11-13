seg025		segment	para public 'CODE' use16
		assume cs:seg025
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 56h, 8, 8Bh, 46h, 6, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_FBE7		proc far

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
var_42		= word ptr -42h
var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= word ptr -12h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 7Eh
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	[bp+var_1], 0
		mov	[bp+var_4], 1
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0D4h]
		mov	al, [bx+51h]
		cmp	al, [si+51h]
		jz	short loc_FC10
		mov	[bp+var_4], 2

loc_FC10:
		mov	[bp+var_8], 400h
		lea	ax, word ptr [bp+var_8]
		push	ax
		push	word ptr [si+52h]
		mov	bx, [si+52h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	bx, ax
		push	word ptr [bx]
		push	ss
		lea	ax, [bp+var_42]
		push	ax
		call	Physics_ApplyForceAtPoint
		add	sp, 8
		mov	eax, dword_7C83B
		mov	[bp+var_4E], eax
		mov	eax, dword_7C83F
		mov	[bp+var_4A], eax
		mov	eax, dword_7C843
		mov	[bp+var_46], eax
		mov	di, si
		add	di, 12h
		mov	eax, [di]
		sub	[bp+var_4E], eax
		mov	eax, [di+4]
		sub	[bp+var_4A], eax
		mov	eax, [di+8]
		sub	[bp+var_46], eax
		lea	ax, word ptr [bp+var_4E]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_C]
		push	ax
		call	Math_VectorLength3D_Scaled_56D92
		add	sp, 6
		push	si
		push	ss
		lea	ax, word ptr [bp+var_66]
		push	ax
		mov	bx, [si]
		call	dword ptr [bx+50h]
		add	sp, 6
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+2]
		push	ss
		lea	ax, word ptr [bp+var_72]
		push	ax
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		call	dword ptr [bx+50h]
		add	sp, 6
		mov	eax, [bp+var_66]
		sub	eax, [bp+var_72]
		mov	[bp+var_7E], eax
		mov	eax, [bp+var_62]
		sub	eax, [bp+var_6E]
		mov	[bp+var_7A], eax
		mov	eax, [bp+var_5E]
		sub	eax, [bp+var_6A]
		mov	[bp+var_76], eax
		mov	eax, [bp+var_7E]
		mov	[bp+var_5A], eax
		mov	eax, [bp+var_7A]
		mov	[bp+var_56], eax
		mov	eax, [bp+var_76]
		mov	[bp+var_52], eax
		lea	ax, word ptr [bp+var_4E]
		push	ax
		lea	ax, word ptr [bp+var_5A]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_10]
		push	ax
		call	sub_578DF
		add	sp, 8
		mov	ax, 32h
		cwd
		idiv	[bp+var_4]
		mov	[bp+var_12], ax
		movsx	eax, [bp+var_12]
		shl	eax, 8
		cmp	eax, [bp+var_C]
		jle	short loc_FD13
		mov	ax, 1
		jmp	short loc_FD15

loc_FD13:
		xor	ax, ax

loc_FD15:
		or	al, al
		jz	short loc_FD1D
		mov	[bp+var_1], 1

loc_FD1D:
		lea	ax, word ptr [bp+var_5A]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_16]
		push	ax
		call	Math_VectorLength3D_Scaled_56D92
		add	sp, 6
		cmp	[bp+var_16], 0
		jle	short loc_FD3A
		mov	ax, 1
		jmp	short loc_FD3C

loc_FD3A:
		xor	ax, ax

loc_FD3C:
		or	al, al
		jnz	short loc_FD43
		jmp	loc_FE0B

loc_FD43:
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jz	short loc_FD4F
		jmp	loc_FE0B

loc_FD4F:
		cmp	[bp+var_10], 5A00h
		jge	short loc_FD5E
		mov	ax, 1
		jmp	short loc_FD60

loc_FD5E:
		xor	ax, ax

loc_FD60:
		or	al, al
		jnz	short loc_FD67
		jmp	loc_FE0B

loc_FD67:
		lea	ax, word ptr [bp+var_10]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_1E]
		push	ax
		call	sub_566A3
		add	sp, 6
		mov	eax, [bp+var_C]
		mov	edx, [bp+var_1E]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_22], eax
		mov	eax, [bp+var_22]
		mov	[bp+var_1A], eax
		cmp	[bp+var_1A], 3200h
		jge	short loc_FDA3
		mov	ax, 1
		jmp	short loc_FDA5

loc_FDA3:
		xor	ax, ax

loc_FDA5:
		or	al, al
		jz	short loc_FE0B
		lea	ax, word ptr [bp+var_10]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_2A]
		push	ax
		call	Math_CosDeg_5666C
		add	sp, 6
		mov	eax, [bp+var_C]
		mov	edx, [bp+var_2A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_2E], eax
		mov	eax, [bp+var_2E]
		mov	[bp+var_26], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_16]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_36], eax
		mov	eax, [bp+var_36]
		mov	[bp+var_32], eax
		mov	eax, [bp+var_26]
		cmp	eax, [bp+var_32]
		jg	short loc_FE01
		mov	ax, 1
		jmp	short loc_FE03

loc_FE01:
		xor	ax, ax

loc_FE03:
		or	al, al
		jz	short loc_FE0B
		mov	[bp+var_1], 1

loc_FE0B:
		cmp	[bp+var_1], 0
		jz	short loc_FE36
		mov	ax, si
		add	ax, 12h
		push	ax
		lea	ax, [bp+var_42]
		push	ax
		push	large [bp+arg_0]
		call	sub_BD4C
		add	sp, 8
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+1EFh], 3
		mov	byte ptr es:[bx+161h], 0

loc_FE36:
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
sub_FBE7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_FE3D		proc far

var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= dword ptr -6
var_1		= byte ptr -1
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	si
		mov	[bp+var_1], 0
		mov	[bp+var_6], 400h
		les	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_FE7C
		cmp	byte ptr es:[bx+1EFh], 3
		jnz	short loc_FE7C
		push	large es:[bx+0Dh]
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		mov	[bp+var_1], 1
		jmp	loc_FEFF

loc_FE7C:
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+1EFh], 3
		jnz	short loc_FE8D
		mov	byte ptr es:[bx+1EFh], 0

loc_FE8D:
		mov	[bp+var_8], 0
		jmp	short loc_FEE3

loc_FE94:
		mov	si, [bp+var_8]
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		cmp	[bp+var_C], 0
		jz	short loc_FEE3
		les	bx, word ptr [bp+var_C]
		cmp	byte ptr es:[bx+17h], 1
		jnz	short loc_FEE3
		les	bx, word ptr [bp+arg_0]
		cmp	es:[bx+2], si
		jz	short loc_FEE3
		push	dx
		push	ax
		les	bx, word ptr [bp+var_C]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		cmp	al, 6
		jnz	short loc_FEE3
		mov	[bp+var_E], si
		push	[bp+var_E]
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_FBE7
		add	sp, 6
		mov	[bp+var_1], al

loc_FEE3:
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_FEFF
		lea	ax, [bp+var_8]
		push	ax
		push	67ADh
		call	sub_1E7CF
		add	sp, 4
		or	ax, ax
		jnz	short loc_FE94

loc_FEFF:
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
sub_FE3D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-13. Dit si l'IA peut chercher une cible. Rôle de l'avion = octet 5 du chunk
; JINF (rangé à +101 de l'objet type ; 0 SBD, SB2C, VAL, JUDY ; 1 TBD, TBF, JILL, KATETORP ; 2
; BETTY, EMILY, KATE ; 3 chasseurs ; 4 BAKA, ZEROK). Rôle 3 : oui, sauf si GOAL 9
; ([entité+359]) et en formation ([entité+357]). Autre rôle : oui si touché ([entité+506]), en
; formation et GOAL 9 ; ou si touché et sérieusement endommagé
; (DamageSys_IsSeriouslyDamaged_41612) ; sinon non.
; ==============================================================================================
Targeting_MayAcquireTarget_FF05		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0D4h]
		mov	bx, es:[bx+0D4h]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	bx, ax
		mov	es, dx
		cmp	byte ptr es:[bx+65h], 3
		jz	short loc_FF74
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+1FAh], 0
		jz	short loc_FF43
		cmp	byte ptr es:[bx+165h], 0
		jz	short loc_FF43
		cmp	byte ptr es:[bx+167h], 0
		jnz	short loc_FF87

loc_FF43:
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0D4h]
		mov	ax, [bx+65h]
		mov	dx, [bx+63h]
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		push	ax
		push	dx
		call	DamageSys_IsSeriouslyDamaged_41612
		add	sp, 4
		or	al, al
		jz	short loc_FF70
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+1FAh], 0
		jnz	short loc_FF87

loc_FF70:
		mov	al, 0
		jmp	short loc_FF89

loc_FF74:
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+167h], 0
		jz	short loc_FF87
		cmp	byte ptr es:[bx+165h], 0
		jnz	short loc_FF70

loc_FF87:
		mov	al, 1

loc_FF89:
		leave
		retf
Targeting_MayAcquireTarget_FF05		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE EN PARTIE 2026-11-13. Recherche de cible aérienne, [entité+495] = 1 au début. Avion
; du camp 1 sans IA ennemie active à l'image précédente (byte_776B9) : rien.
; Targeting_MayAcquireTarget_FF05 refuse : rien. Rôle JINF ≠ 3, en formation et GOAL 9 :
; quitte la formation ([entité+357] = 0), message radio 18 au joueur (« Here I come! » chez
; JESTER), renvoie 0. Sinon choisit la cible selon [entité+178] (sub_101C0, sub_10197,
; sub_10173), la range dans [entité+501] ; camp 255 : AI_BehaviorStateMachine_B968, autre camp
; : sub_E30A.
; ==============================================================================================
Targeting_AcquireTarget_FF8B		proc far

var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	[bp+var_1], 0
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+1EFh], 1
		mov	al, byte_776B9
		mov	ah, 0
		or	ax, ax
		jnz	short loc_FFCF
		mov	bx, es:[bx+0D4h]
		cmp	byte ptr [bx+51h], 1
		jnz	short loc_FFCF
		mov	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+1EFh], 1
		jz	short loc_FFC0
		jmp	loc_1016E

loc_FFC0:
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+1EFh], 0
		jmp	loc_1016E
		jmp	loc_1016E

loc_FFCF:
		push	large [bp+arg_0]
		push	cs
		call	near ptr Targeting_MayAcquireTarget_FF05
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_FFF3
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+1EFh], 1
		jz	short loc_FFEE
		jmp	loc_1016E

loc_FFEE:
		jmp	short loc_FFC0
		jmp	loc_1016E

loc_FFF3:
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+0D4h]
		mov	bx, es:[bx+0D4h]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	bx, ax
		mov	es, dx
		cmp	byte ptr es:[bx+65h], 3
		jz	short loc_10042
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+165h], 0
		jz	short loc_10042
		cmp	byte ptr es:[bx+167h], 0
		jz	short loc_10042
		mov	byte ptr es:[bx+165h], 0
		push	1
		push	12h
		push	word_7CADA
		push	word ptr [bp+arg_0+2]
		push	bx
		call	sub_EA0E
		add	sp, 0Ah

loc_1003D:
		mov	al, 0
		jmp	loc_10171

loc_10042:
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+135h], 3
		jnz	short loc_10064
		mov	ax, es:[bx+1F5h]
		cmp	ax, es:[bx+1F3h]
		jnz	short loc_10064
		mov	al, es:[bx+1FAh]
		mov	ah, 0
		or	ax, ax
		jz	short loc_1003D

loc_10064:
		les	bx, word ptr [bp+arg_0]
		cmp	word ptr es:[bx+1F5h], 0
		jz	short loc_100CB
		push	word ptr es:[bx+1F5h]
		mov	bx, es:[bx+1F5h]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		or	ax, dx
		jz	short loc_10097
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+1F5h]
		mov	bx, es:[bx+1F5h]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		jmp	short loc_10099

loc_10097:
		mov	al, 1Ch

loc_10099:
		cmp	al, 6
		jnz	short loc_100CB
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+1F5h]
		mov	bx, es:[bx+1F5h]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	bx, ax
		mov	es, dx
		cmp	byte ptr es:[bx+65h], 3
		jnz	short loc_100CB
		mov	eax, dword_7C7DF
		shl	eax, 1
		cmp	eax, dword_7C7D9
		jle	short loc_100CB
		jmp	loc_1016E

loc_100CB:
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+0B2h], 2
		jnz	short loc_100E1
		push	word ptr [bp+arg_0+2]
		push	bx
		nop
		push	cs
		call	sub_101C0
		jmp	short loc_10100

loc_100E1:
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+0B2h], 1
		jnz	short loc_100F7
		push	word ptr [bp+arg_0+2]
		push	bx
		nop
		push	cs
		call	near ptr sub_10197
		jmp	short loc_10100

loc_100F7:
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_10173

loc_10100:
		add	sp, 4
		mov	dx, ax
		or	dx, dx
		jnz	short loc_10119
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+1EFh], 1
		jnz	short loc_1016E
		jmp	loc_FFC0
		jmp	short loc_1016E

loc_10119:
		les	bx, word ptr [bp+arg_0]
		cmp	word ptr es:[bx+1F5h], 0
		jz	short loc_1012B
		cmp	es:[bx+1F5h], dx
		jz	short loc_1016E

loc_1012B:
		mov	[bp+var_4], dx
		push	[bp+var_4]
		mov	ax, word ptr [bp+arg_0]
		add	ax, 1F5h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_39519
		add	sp, 6
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0D4h]
		cmp	byte ptr [bx+51h], 0FFh
		jnz	short loc_10162
		push	large [bp+arg_0]
		call	AI_BehaviorStateMachine_B968
		add	sp, 4
		mov	[bp+var_1], al
		jmp	short loc_1016E

loc_10162:
		push	large [bp+arg_0]
		call	sub_E30A
		add	sp, 4

loc_1016E:
		mov	al, [bp+var_1]

loc_10171:
		leave
		retf
Targeting_AcquireTarget_FF8B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_10173		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		xor	dx, dx
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+1FAh], 0
		jz	short loc_10193
		push	1
		push	[bp+arg_2]
		push	bx
		call	sub_BEB6
		add	sp, 6
		mov	dx, ax

loc_10193:
		mov	ax, dx
		pop	bp
		retf
sub_10173		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_10197		proc far

var_2		= word ptr -2
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+1FAh]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_101AF
		xor	ax, ax
		jmp	short loc_101BE

loc_101AF:
		push	large [bp+arg_0]
		nop
		push	cs
		call	sub_101C0
		add	sp, 4
		mov	[bp+var_2], ax

loc_101BE:
		leave
		retf
sub_10197		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_101C0		proc near

var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= dword ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= byte ptr -8
var_6		= word ptr -6
var_4		= byte ptr -4
var_2		= word ptr -2
arg_2		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		push	di
		mov	[bp+var_2], 0
		les	bx, [bp+arg_2]
		mov	bx, es:[bx+0D4h]
		mov	al, [bx+51h]
		mov	[bp+var_4], al
		mov	[bp+var_6], 0
		mov	[bp+var_A], 0FC18h
		jmp	loc_10306

loc_101E8:
		mov	si, [bp+var_6]
		mov	ax, si
		or	ax, ax
		jnz	short loc_101F4
		jmp	loc_10306

loc_101F4:
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		or	ax, dx
		jz	short loc_10207
		push	si
		mov	bx, [si]
		call	dword ptr [bx+34h]
		pop	cx
		jmp	short loc_10209

loc_10207:
		mov	al, 1Ch

loc_10209:
		cmp	al, 6
		jz	short loc_10210
		jmp	loc_10306

loc_10210:
		mov	al, [si+51h]
		mov	[bp+var_8], al
		mov	al, [bp+var_4]
		cmp	al, [bp+var_8]
		jnz	short loc_10221
		jmp	loc_10306

loc_10221:
		cmp	[bp+var_8], 0
		jnz	short loc_1022A
		jmp	loc_10306

loc_1022A:
		xor	di, di
		push	si
		les	bx, [bp+arg_2]
		push	large es:[bx+0C0h]
		call	sub_9D0A
		add	sp, 6
		mov	ax, [si+52h]
		mov	[bp+var_C], ax
		cmp	[bp+var_C], 0
		jz	short loc_1026D
		push	ax
		mov	bx, [bp+var_C]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	dx, ax
		or	dx, dx
		jz	short loc_1026D
		mov	bx, dx
		mov	al, [bx+92h]
		shr	ax, 5
		and	ax, 1
		or	al, al
		jz	short loc_1026D
		jmp	loc_10306

loc_1026D:
		mov	eax, [si+5Ah]
		mov	[bp+var_10], eax
		les	bx, word ptr [bp+var_10]
		cmp	byte ptr es:[bx+6], 1
		jnz	short loc_1028E
		mov	ax, es:[bx+1F5h]
		les	bx, [bp+arg_2]
		cmp	ax, es:[bx+0D4h]
		jz	short loc_10298

loc_1028E:
		les	bx, word ptr [bp+var_10]
		cmp	byte ptr es:[bx+6], 2
		jnz	short loc_102FB

loc_10298:
		mov	eax, dword_7C7D9
		cmp	eax, dword_7C7DF
		jge	short loc_102FB
		mov	ax, word ptr dword_7C7DF
		sub	ax, word ptr dword_7C7D9
		mov	[bp+var_12], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		mov	di, ax
		cmp	word_7C7D7, 3Ch
		jge	short loc_102E1
		mov	ax, 3Ch
		sub	ax, word_7C7D7
		mov	[bp+var_14], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		movsx	eax, ax
		imul	eax, dword_7C7DF
		mov	ebx, 0Ah
		cdq
		idiv	ebx
		add	di, ax

loc_102E1:
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		mov	bx, ax
		mov	es, dx
		cmp	byte ptr es:[bx+65h], 3
		jz	short loc_102FB
		mov	ax, di
		cwd
		sub	ax, dx
		mov	di, ax
		sar	di, 1

loc_102FB:
		cmp	di, [bp+var_A]
		jle	short loc_10306
		mov	[bp+var_A], di
		mov	[bp+var_2], si

loc_10306:
		lea	ax, [bp+var_6]
		push	ax
		push	67ADh
		call	sub_1E7CF
		add	sp, 4
		or	ax, ax
		jz	short loc_1031C
		jmp	loc_101E8

loc_1031C:
		mov	ax, [bp+var_2]
		pop	di
sub_101C0		endp
seg025		ends

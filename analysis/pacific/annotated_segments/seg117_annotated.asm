seg117		segment	para public 'CODE' use16
		assume cs:seg117
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4C052		proc far
		push	bp
		mov	bp, sp
		mov	al, 12h
		pop	bp
		retf
sub_4C052		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4C059		proc far

var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_20		= word ptr -20h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 20h
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+5Bh], 0
		jnz	short loc_4C06C
		jmp	loc_4C17E

loc_4C06C:
		mov	ax, si
		add	ax, 52h
		push	ax
		call	Timer_Tick_506DD
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_4C091
		les	bx, [si+0Eh]
		cmp	byte ptr es:[bx+58h], 0
		jz	short loc_4C08D
		mov	al, 0
		jmp	loc_4C185

loc_4C08D:
		mov	byte ptr [si+5Bh], 0

loc_4C091:
		cmp	word_79797, 0
		jnz	short loc_4C09B
		jmp	loc_4C17E

loc_4C09B:
		mov	eax, dword_7976E
		sub	[si+57h], eax
		cmp	dword ptr [si+57h], 0
		jg	short loc_4C0AF
		mov	ax, 1
		jmp	short loc_4C0B1

loc_4C0AF:
		xor	ax, ax

loc_4C0B1:
		or	al, al
		jnz	short loc_4C0B8
		jmp	loc_4C17E

loc_4C0B8:
		mov	ax, [si+10h]
		mov	dx, [si+0Eh]
		add	dx, 52h
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	[si+57h], eax
		sub	sp, 4
		mov	ax, [si+10h]
		mov	dx, [si+0Eh]
		add	dx, 4Eh
		mov	[bp+var_A], ax
		mov	[bp+var_C], dx
		les	bx, [bp+var_C]
		mov	eax, es:[bx]
		mov	[bp+var_26], eax
		sub	sp, 4
		mov	[bp+var_10], 0
		mov	eax, [bp+var_10]
		mov	[bp+var_2A], eax
		sub	sp, 4
		mov	[bp+var_14], 0
		mov	eax, [bp+var_14]
		mov	[bp+var_2E], eax
		lea	ax, [bp+var_20]
		push	ax
		call	Utility_Helper_57C2E
		add	sp, 0Eh
		cmp	word ptr [si+26h], 0
		jz	short loc_4C134
		mov	ax, 1
		jmp	short loc_4C136

loc_4C134:
		xor	ax, ax

loc_4C136:
		or	al, al
		jz	short loc_4C15E
		lea	ax, [bp+var_20]
		push	ax
		push	si
		call	Debris_ResolveForceBuffer
		pop	cx
		push	ax
		les	bx, [si+0Eh]
		mov	al, es:[bx+49h]
		mov	ah, 0
		push	ax
		push	word_79797
		nop
		push	cs
		call	near ptr sub_4D430
		add	sp, 8
		jmp	short loc_4C17E

loc_4C15E:
		lea	ax, [bp+var_20]
		push	ax
		mov	ax, si
		add	ax, 12h
		push	ax
		les	bx, [si+0Eh]
		mov	al, es:[bx+49h]
		mov	ah, 0
		push	ax
		push	word_79797
		nop
		push	cs
		call	near ptr sub_4D430
		add	sp, 8

loc_4C17E:
		push	si
		call	StreamReader_DestructWrapper_3B3C6
		pop	cx

loc_4C185:
		pop	si
		leave
		retf
sub_4C059		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4C188		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 12h
		pop	bp
		retf
sub_4C188		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 14 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Particle_InitFromSmokeModel_4C168 (sub_4C168 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; INITIALISE UNE PARTICULE DEPUIS SON MODÈLE DE FUMÉE (ex-ParticleEmitter_InitFromChunk) :
; particule +0x06 = modèle, +0x20 = taille de début (modèle +0x0D), +0x24 = durée de vie
; (modèle +0x05), +0x28 = teinte de début (modèle +0x15 << 8), vitesse +0x1A/+0x1C/+0x1E = 0,
; image +0x2E = 0, +0x2D = 2. Appelée par ParticlePool_AllocElement.
; ==============================================================================================
Particle_InitFromSmokeModel_4C192		proc far

var_E		= dword ptr -0Eh
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	si
		les	bx, [bp+arg_0]
		mov	ax, [bp+arg_4]
		mov	es:[bx+1Ch], ax
		mov	si, es:[bx+1Ch]
		add	si, 0Dh
		mov	eax, [si]
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		mov	es:[bx+32h], eax
		mov	si, es:[bx+1Ch]
		add	si, 5
		mov	eax, [si]
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	es:[bx+36h], eax
		mov	bx, es:[bx+1Ch]
		mov	ax, [bx+15h]
		mov	[bp+var_A], ax
		movsx	eax, [bp+var_A]
		shl	eax, 8
		mov	[bp+var_E], eax
		mov	eax, [bp+var_E]
		mov	bx, [bp+arg_0]
		mov	es:[bx+3Ah], eax
		mov	word ptr es:[bx+2Ch], 0
		mov	word ptr es:[bx+2Eh], 0
		mov	word ptr es:[bx+30h], 0
		and	byte ptr es:[bx+3Eh], 0FDh
		mov	byte ptr es:[bx+3Fh], 64h
		mov	byte ptr es:[bx+40h], 0
		pop	si
		leave
		retf
Particle_InitFromSmokeModel_4C192		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4C218		proc far

var_6A		= dword ptr -6Ah
var_66		= dword ptr -66h
var_62		= dword ptr -62h
var_5E		= dword ptr -5Eh
var_5A		= dword ptr -5Ah
var_56		= dword ptr -56h
var_52		= dword ptr -52h
var_4E		= dword ptr -4Eh
var_4A		= word ptr -4Ah
var_48		= dword ptr -48h
var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= word ptr -2Ch
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6Ah
		push	si
		mov	[bp+var_1], 0
		les	bx, [bp+arg_0]
		and	byte ptr es:[bx+3Eh], 0FDh
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 20h
		mov	[bp+var_4], ax
		mov	[bp+var_6], dx
		les	si, [bp+var_6]
		mov	eax, es:[si]
		mov	[bp+var_6A], eax
		mov	eax, es:[si+4]
		mov	[bp+var_66], eax
		mov	eax, es:[si+8]
		mov	[bp+var_62], eax
		mov	eax, dword_7CA18
		sub	[bp+var_6A], eax
		mov	eax, dword_7CA1C
		sub	[bp+var_66], eax
		mov	eax, dword_7CA20
		sub	[bp+var_62], eax
		push	62F4h
		lea	ax, word ptr [bp+var_6A]
		push	ax
		call	Matrix_WorldToLocal_5A569
		add	sp, 4
		mov	eax, [bp+var_66]
		cmp	eax, dword_7CA04
		jle	short loc_4C28E
		mov	ax, 1
		jmp	short loc_4C290

loc_4C28E:
		xor	ax, ax

loc_4C290:
		or	al, al
		jnz	short loc_4C297
		jmp	loc_4C423

loc_4C297:
		mov	eax, dword_7CC84
		mov	[bp+var_A], eax
		shl	eax, 8
		cmp	eax, [bp+var_66]
		jl	short loc_4C2AE
		mov	ax, 1
		jmp	short loc_4C2B0

loc_4C2AE:
		xor	ax, ax

loc_4C2B0:
		or	al, al
		jnz	short loc_4C2B7
		jmp	loc_4C423

loc_4C2B7:
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 32h
		mov	[bp+var_14], ax
		mov	[bp+var_16], dx
		les	bx, [bp+var_16]
		mov	eax, es:[bx]
		mov	[bp+var_1A], eax
		push	large [bp+var_66]
		push	eax
		push	large dword_7CA10
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_1E], eax
		mov	[bp+var_12], eax
		mov	[bp+var_22], 99h
		cmp	eax, [bp+var_22]
		jle	short loc_4C303
		mov	ax, 1
		jmp	short loc_4C305

loc_4C303:
		xor	ax, ax

loc_4C305:
		or	al, al
		jnz	short loc_4C30C
		jmp	loc_4C423

loc_4C30C:
		mov	eax, [bp+var_6A]
		mov	[bp+var_26], eax
		mov	eax, [bp+var_66]
		mov	[bp+var_2A], eax
		mov	ax, word_7CA0C
		mov	[bp+var_2C], ax
		push	large [bp+var_2A]
		push	large dword_7CA10
		push	large [bp+var_26]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_30], eax
		mov	[bp+var_34], eax
		movsx	eax, [bp+var_2C]
		shl	eax, 8
		mov	edx, [bp+var_34]
		add	edx, eax
		mov	[bp+var_38], edx
		mov	eax, [bp+var_38]
		mov	[bp+var_3C], eax
		sar	eax, 8
		mov	[bp+var_40], eax
		cmp	[bp+var_40], 7D00h
		jle	short loc_4C37B
		mov	[bp+var_40], 7D00h
		jmp	short loc_4C38F

loc_4C37B:
		cmp	[bp+var_40], 0FFFF8300h
		jge	short loc_4C38F
		mov	[bp+var_40], 0FFFF8300h
		jmp	short loc_4C38F

loc_4C38F:
		mov	ax, word ptr [bp+var_40]
		les	bx, [bp+arg_0]
		mov	es:[bx+0Ch], ax
		mov	eax, [bp+var_62]
		mov	[bp+var_44], eax
		mov	eax, [bp+var_66]
		mov	[bp+var_48], eax
		mov	ax, word_7CA0E
		mov	[bp+var_4A], ax
		push	large [bp+var_48]
		push	large dword_7CA14
		push	large [bp+var_44]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_4E], eax
		mov	[bp+var_52], eax
		movsx	eax, [bp+var_4A]
		shl	eax, 8
		sub	eax, [bp+var_52]
		mov	[bp+var_56], eax
		mov	[bp+var_5A], eax
		sar	eax, 8
		mov	[bp+var_5E], eax
		cmp	[bp+var_5E], 7D00h
		jle	short loc_4C401
		mov	[bp+var_5E], 7D00h
		jmp	short loc_4C415

loc_4C401:
		cmp	[bp+var_5E], 0FFFF8300h
		jge	short loc_4C415
		mov	[bp+var_5E], 0FFFF8300h
		jmp	short loc_4C415

loc_4C415:
		mov	ax, word ptr [bp+var_5E]
		les	bx, [bp+arg_0]
		mov	es:[bx+0Eh], ax
		mov	[bp+var_1], 1

loc_4C423:
		mov	eax, [bp+var_66]
		mov	[bp+var_E], eax
		mov	eax, [bp+var_E]
		les	bx, [bp+arg_0]
		mov	es:[bx+2], eax
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
sub_4C218		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4C43D		proc far

var_5C		= word ptr -5Ch
var_5A		= dword ptr -5Ah
var_56		= dword ptr -56h
var_52		= dword ptr -52h
var_4E		= dword ptr -4Eh
var_4A		= word ptr -4Ah
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
var_14		= dword ptr -14h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 5Ch
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 36h
		mov	[bp+var_6], ax
		mov	[bp+var_8], dx
		les	bx, [bp+var_8]
		mov	eax, es:[bx]
		mov	[bp+var_4], eax
		mov	eax, dword_7976E
		sub	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jle	short loc_4C471
		mov	ax, 1
		jmp	short loc_4C473

loc_4C471:
		xor	ax, ax

loc_4C473:
		or	al, al
		jnz	short loc_4C47A
		jmp	loc_4C739

loc_4C47A:
		les	bx, [bp+arg_0]
		mov	al, es:[bx+3Eh]
		shr	ax, 1
		and	ax, 1
		or	al, al
		jz	short loc_4C491
		mov	byte ptr es:[bx+3Fh], 64h
		jmp	short loc_4C4A7

loc_4C491:
		les	bx, [bp+arg_0]
		mov	al, es:[bx+3Fh]
		add	al, 0FFh
		mov	es:[bx+3Fh], al
		or	al, al
		jnz	short loc_4C4A7
		mov	al, 0
		jmp	loc_4C73B

loc_4C4A7:
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+1Ch]
		mov	al, [bx]
		mov	ah, 0
		cmp	ax, 1
		jz	short loc_4C4C4
		cmp	ax, 2
		jz	short loc_4C4C4
		cmp	ax, 4
		jz	short loc_4C4C4
		jmp	loc_4C665

loc_4C4C4:
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+1Ch]
		cmp	word ptr [bx+23h], 0
		jnz	short loc_4C4D4
		jmp	loc_4C665

loc_4C4D4:
		mov	bx, [bp+arg_0]
		movzx	eax, byte ptr es:[bx+41h]
		mov	[bp+var_48], eax
		mov	bx, es:[bx+1Ch]
		mov	ax, [bx+21h]
		mov	[bp+var_4A], ax
		movsx	eax, [bp+var_4A]
		shl	eax, 8
		mov	[bp+var_4E], eax
		mov	eax, [bp+var_4E]
		mov	edx, dword_7976E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_52], eax
		mov	eax, [bp+var_52]
		mov	[bp+var_56], eax
		add	[bp+var_48], eax
		mov	bx, [bp+arg_0]
		mov	al, byte ptr [bp+var_48]
		and	al, 0FFh
		mov	es:[bx+41h], al
		mov	[bp+var_5A], 100h
		mov	eax, [bp+var_48]
		cmp	eax, [bp+var_5A]
		jle	short loc_4C53C
		mov	ax, 1
		jmp	short loc_4C53E

loc_4C53C:
		xor	ax, ax

loc_4C53E:
		or	al, al
		jnz	short loc_4C545
		jmp	loc_4C665

loc_4C545:
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+1Ch]
		cmp	word ptr [bx+25h], 0
		jz	short loc_4C563
		mov	bx, [bp+arg_0]
		mov	bx, es:[bx+1Ch]
		mov	al, [bx+20h]
		mov	ah, 0
		dec	ax
		mov	cx, ax
		jmp	short loc_4C58F

loc_4C563:
		push	0
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+1Eh]
		mov	al, [bx+4]
		push	ax
		mov	bx, [bp+arg_0]
		mov	bx, es:[bx+1Eh]
		push	large [bx]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		call	sub_6AB8C
		dec	ax
		mov	cx, ax

loc_4C58F:
		les	bx, [bp+arg_0]
		mov	al, es:[bx+40h]
		mov	ah, 0
		mov	bx, es:[bx+1Ch]
		add	ax, [bx+23h]
		mov	[bp+var_5C], ax
		mov	bx, [bp+arg_0]
		mov	bx, es:[bx+1Ch]
		mov	al, [bx+1Fh]
		cbw
		sub	ax, 52h
		mov	bx, ax
		cmp	bx, 5
		jbe	short loc_4C5BA
		jmp	loc_4C665

loc_4C5BA:
		shl	bx, 1
		jmp	cs:off_4C73D[bx]	; switch jump

loc_4C5C1:
		cmp	[bp+var_5C], cx
		jg	short loc_4C5CC
		cmp	[bp+var_5C], 0
		jge	short loc_4C5D1

loc_4C5CC:
		mov	al, 0
		jmp	loc_4C73B

loc_4C5D1:
		les	bx, [bp+arg_0]
		mov	al, byte ptr [bp+var_5C]
		mov	es:[bx+40h], al
		jmp	loc_4C665

loc_4C5DE:
		les	bx, [bp+arg_0]
		mov	al, byte ptr [bp+var_5C]
		mov	es:[bx+40h], al
		mov	al, es:[bx+40h]
		mov	ah, 0
		cmp	ax, cx
		jle	short loc_4C5F7
		mov	byte ptr es:[bx+40h], 0

loc_4C5F7:
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+40h], 0FFh
		jnz	short loc_4C665
		mov	es:[bx+40h], cl
		jmp	short loc_4C665

loc_4C607:
		les	bx, [bp+arg_0]
		mov	al, byte ptr [bp+var_5C]
		mov	es:[bx+40h], al
		mov	al, es:[bx+40h]
		mov	ah, 0
		cmp	ax, cx
		jl	short loc_4C62B
		mov	bx, es:[bx+1Ch]
		mov	word ptr [bx+23h], 0FFFFh
		mov	bx, [bp+arg_0]
		mov	es:[bx+40h], cl

loc_4C62B:
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+40h], 0
		ja	short loc_4C665
		mov	bx, es:[bx+1Ch]
		mov	word ptr [bx+23h], 1
		mov	bx, [bp+arg_0]
		mov	byte ptr es:[bx+40h], 0
		jmp	short loc_4C665

loc_4C648:
		cmp	[bp+var_5C], cx
		jle	short loc_4C65B
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+1Ch]
		mov	word ptr [bx+23h], 0
		jmp	short loc_4C665

loc_4C65B:
		les	bx, [bp+arg_0]
		mov	al, byte ptr [bp+var_5C]
		mov	es:[bx+40h], al

loc_4C665:
		mov	eax, [bp+var_4]
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		les	bx, [bp+arg_0]
		mov	es:[bx+36h], eax
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 32h
		mov	[bp+var_E], ax
		mov	[bp+var_10], dx
		les	bx, [bp+var_10]
		mov	eax, es:[bx]
		mov	[bp+var_14], eax
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+1Ch]
		mov	eax, [bx+9]
		mov	edx, dword_7976E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_14]
		add	eax, [bp+var_1C]
		mov	[bp+var_20], eax
		mov	[bp+var_24], eax
		mov	[bp+var_28], eax
		mov	eax, [bp+var_28]
		mov	bx, [bp+arg_0]
		mov	es:[bx+32h], eax
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 3Ah
		mov	[bp+var_2A], ax
		mov	[bp+var_2C], dx
		les	bx, [bp+var_2C]
		mov	eax, es:[bx]
		mov	[bp+var_30], eax
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+1Ch]
		mov	eax, [bx+11h]
		mov	edx, dword_7976E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_34], eax
		mov	eax, [bp+var_34]
		mov	[bp+var_38], eax
		mov	eax, [bp+var_30]
		add	eax, [bp+var_38]
		mov	[bp+var_3C], eax
		mov	[bp+var_40], eax
		mov	[bp+var_44], eax
		mov	eax, [bp+var_44]
		mov	bx, [bp+arg_0]
		mov	es:[bx+3Ah], eax
		mov	al, 1
		jmp	short loc_4C73B

loc_4C739:
		mov	al, 0

loc_4C73B:
		leave
		retf
sub_4C43D		endp

; START OF FUNCTION CHUNK FOR sub_4C43D
off_4C73D	dw offset loc_4C607
		dw offset loc_4C648
		dw offset loc_4C5C1
		dw offset loc_4C665
		dw offset loc_4C665
		dw offset loc_4C5DE
; END OF FUNCTION CHUNK FOR sub_4C43D

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 12 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Particle_IntegrateVelocity (sub_4C71A de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-28.
; Si la vitesse (+0x1A/+0x1C/+0x1E, trois int16 en 1/256 m/s, movsx eax, word ptr) n'est pas
; nulle : position (+0x0A/+0x0E/+0x12) += vitesse × dt (dword_7045E). Vitesse posée par
; Particle_SpawnWithColor (mots bas du vecteur passé) ; nulle pour les particules d'une
; traînée.
; ==============================================================================================
Particle_IntegrateVelocity		proc far

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
		sub	sp, 30h
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+2Ch]
		or	ax, es:[bx+2Eh]
		or	ax, es:[bx+30h]
		jnz	short loc_4C763
		jmp	loc_4C81A

loc_4C763:
		movsx	eax, word ptr es:[bx+2Ch]
		mov	[bp+var_24], eax
		movsx	eax, word ptr es:[bx+2Eh]
		mov	[bp+var_20], eax
		movsx	eax, word ptr es:[bx+30h]
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_24]
		mov	edx, dword_79774
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		mov	eax, [bp+var_20]
		mov	edx, dword_79774
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_1C]
		mov	edx, dword_79774
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_30], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_28], eax
		mov	eax, es:[bx+20h]
		add	eax, [bp+var_30]
		mov	es:[bx+20h], eax
		mov	eax, es:[bx+24h]
		add	eax, [bp+var_2C]
		mov	es:[bx+24h], eax
		mov	eax, es:[bx+28h]
		add	eax, [bp+var_28]
		mov	es:[bx+28h], eax

loc_4C81A:
		leave
		retf
Particle_IntegrateVelocity		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4C81C		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_4C81C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4C821		proc far

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
var_A4		= dword ptr -0A4h
var_A2		= dword ptr -0A2h
var_9E		= dword ptr -9Eh
var_9A		= dword ptr -9Ah
var_96		= dword ptr -96h
var_92		= dword ptr -92h
var_8E		= dword ptr -8Eh
var_8C		= dword ptr -8Ch
var_8A		= dword ptr -8Ah
var_86		= dword ptr -86h
var_84		= dword ptr -84h
var_80		= dword ptr -80h
var_7C		= dword ptr -7Ch
var_78		= dword ptr -78h
var_74		= dword ptr -74h
var_72		= dword ptr -72h
var_70		= dword ptr -70h
var_6E		= dword ptr -6Eh
var_6C		= dword ptr -6Ch
var_6A		= dword ptr -6Ah
var_68		= dword ptr -68h
var_64		= dword ptr -64h
var_62		= dword ptr -62h
var_60		= dword ptr -60h
var_5E		= dword ptr -5Eh
var_5C		= dword ptr -5Ch
var_5A		= dword ptr -5Ah
var_56		= word ptr -56h
var_54		= dword ptr -54h
var_50		= dword ptr -50h
var_4C		= dword ptr -4Ch
var_48		= dword ptr -48h
var_44		= dword ptr -44h
var_40		= word ptr -40h
var_3E		= word ptr -3Eh
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0D4h
		push	si
		push	di
		mov	[bp+var_4], 0
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+1Ch]
		mov	al, [bx]
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 4
		jbe	short loc_4C847
		jmp	loc_4D023

loc_4C847:
		shl	bx, 1
		jmp	cs:off_4D02D[bx]	; switch jump

loc_4C84E:
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 32h
		mov	[bp+var_A], ax
		mov	[bp+var_C], dx
		les	bx, [bp+var_C]
		mov	eax, es:[bx]
		mov	[bp+var_10], eax
		mov	eax, dword_7CA10
		mov	edx, [bp+var_10]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_18], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 2
		mov	[bp+var_1A], ax
		mov	[bp+var_1C], dx
		les	bx, [bp+var_1C]
		mov	eax, es:[bx]
		mov	[bp+var_20], eax
		mov	eax, [bp+var_18]
		mov	edx, eax
		mov	ecx, [bp+var_20]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_24], eax
		mov	eax, [bp+var_24]
		mov	[bp+var_28], eax
		mov	si, word ptr [bp+var_28+1]
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+0Ch]
		sub	ax, si
		cmp	ax, word_7CA50
		jle	short loc_4C8D5
		jmp	loc_4D023

loc_4C8D5:
		mov	ax, es:[bx+0Ch]
		add	ax, si
		cmp	ax, word_7CA4C
		jge	short loc_4C8E4
		jmp	loc_4D023

loc_4C8E4:
		mov	ax, es:[bx+0Eh]
		sub	ax, si
		cmp	ax, word_7CA52
		jle	short loc_4C8F3
		jmp	loc_4D023

loc_4C8F3:
		mov	ax, es:[bx+0Eh]
		add	ax, si
		cmp	ax, word_7CA4E
		jge	short loc_4C902
		jmp	loc_4D023

loc_4C902:
		or	byte ptr es:[bx+3Eh], 2
		mov	eax, es:[bx+3Ah]
		sar	eax, 8
		cmp	eax, 0
		jg	short loc_4C927
		mov	[bp+var_2C], 100h
		mov	eax, [bp+var_2C]
		mov	es:[bx+3Ah], eax

loc_4C927:
		les	bx, word ptr [bp+arg_0]
		mov	eax, es:[bx+3Ah]
		sar	eax, 8
		mov	di, ax
		or	di, di
		jge	short loc_4C93F
		xor	dx, dx
		xor	ax, ax
		jmp	short loc_4C95C

loc_4C93F:
		push	0
		mov	al, byte_7CC70
		push	ax
		push	large dword_7CC6C
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	bx, di
		shl	bx, 8
		add	ax, bx

loc_4C95C:
		mov	word ptr [bp+var_54+2], dx
		mov	word ptr [bp+var_54], ax
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx+6], 1Dh
		push	2
		push	dx
		push	ax
		call	sub_634A4
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+14h], eax
		mov	es:[bx+18h], si
		mov	[bp+var_56], si
		movsx	eax, [bp+var_56]
		mov	edx, dword_77B12
		imul	edx, eax
		mov	[bp+var_5A], edx
		mov	eax, [bp+var_5A]
		mov	[bp+var_5E], eax
		mov	ax, word ptr [bp+var_5E+1]
		mov	es:[bx+1Ah], ax
		mov	[bp+var_62], 7D000h
		mov	eax, [bp+var_62]
		add	es:[bx+2], eax
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		jmp	loc_4D023

loc_4C9C7:
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 32h
		mov	[bp+var_2E], ax
		mov	[bp+var_30], dx
		les	bx, [bp+var_30]
		mov	eax, es:[bx]
		mov	[bp+var_34], eax
		mov	eax, dword_7CA10
		mov	edx, [bp+var_34]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_38], eax
		mov	eax, [bp+var_38]
		mov	[bp+var_3C], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 2
		mov	[bp+var_3E], ax
		mov	[bp+var_40], dx
		les	bx, [bp+var_40]
		mov	eax, es:[bx]
		mov	[bp+var_44], eax
		mov	eax, [bp+var_3C]
		mov	edx, eax
		mov	ecx, [bp+var_44]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_48], eax
		mov	eax, [bp+var_48]
		mov	[bp+var_4C], eax
		mov	si, word ptr [bp+var_4C+1]
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+0Ch]
		sub	ax, si
		cmp	ax, word_7CA50
		jle	short loc_4CA4E
		jmp	loc_4D023

loc_4CA4E:
		mov	ax, es:[bx+0Ch]
		add	ax, si
		cmp	ax, word_7CA4C
		jge	short loc_4CA5D
		jmp	loc_4D023

loc_4CA5D:
		mov	ax, es:[bx+0Eh]
		sub	ax, si
		cmp	ax, word_7CA52
		jle	short loc_4CA6C
		jmp	loc_4D023

loc_4CA6C:
		mov	ax, es:[bx+0Eh]
		add	ax, si
		cmp	ax, word_7CA4E
		jge	short loc_4CA7B
		jmp	loc_4D023

loc_4CA7B:
		cmp	si, 0C8h
		jle	short loc_4CA84
		mov	si, 0C8h

loc_4CA84:
		les	bx, word ptr [bp+arg_0]
		or	byte ptr es:[bx+3Eh], 2
		mov	eax, es:[bx+3Ah]
		sar	eax, 8
		cmp	eax, 0
		jg	short loc_4CAAC
		mov	[bp+var_50], 100h
		mov	eax, [bp+var_50]
		mov	es:[bx+3Ah], eax

loc_4CAAC:
		les	bx, word ptr [bp+arg_0]
		mov	eax, es:[bx+3Ah]
		sar	eax, 8
		mov	di, ax
		or	di, di
		jge	short loc_4CAC4
		xor	dx, dx
		xor	ax, ax
		jmp	short loc_4CAE1

loc_4CAC4:
		push	0
		mov	al, byte_7CC70
		push	ax
		push	large dword_7CC6C
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	bx, di
		shl	bx, 8
		add	ax, bx

loc_4CAE1:
		mov	word ptr [bp+var_54+2], dx
		mov	word ptr [bp+var_54], ax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 20h
		mov	[bp+var_56], ax
		mov	word ptr [bp+var_5A+2], dx
		les	di, word ptr [bp+var_5A+2]
		mov	eax, es:[di]
		mov	[bp+var_C8], eax
		mov	eax, es:[di+4]
		mov	[bp+var_C4], eax
		mov	eax, es:[di+8]
		mov	[bp+var_C0], eax
		mov	eax, dword_7CA18
		sub	eax, [bp+var_C8]
		mov	[bp+var_D4], eax
		mov	eax, dword_7CA1C
		sub	eax, [bp+var_C4]
		mov	[bp+var_D0], eax
		mov	eax, dword_7CA20
		sub	eax, [bp+var_C0]
		mov	[bp+var_CC], eax
		mov	eax, [bp+var_D4]
		mov	[bp+var_BC], eax
		mov	eax, [bp+var_D0]
		mov	[bp+var_B8], eax
		mov	eax, [bp+var_CC]
		mov	[bp+var_B4], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 28h
		mov	word ptr [bp+var_5A], ax
		mov	word ptr [bp+var_5C], dx
		les	bx, word ptr [bp+var_5C]
		mov	eax, es:[bx]
		mov	[bp+var_60], eax
		mov	eax, dword_7CA20
		sub	eax, [bp+var_60]
		mov	[bp+var_64], eax
		mov	[bp+var_68], eax
		push	large [bp+var_B4]
		push	large [bp+var_B8]
		push	large [bp+var_BC]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_6C], eax
		mov	[bp+var_70], eax
		mov	eax, [bp+var_68]
		mov	edx, eax
		mov	ecx, [bp+var_70]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_74], eax
		mov	eax, [bp+var_74]
		mov	[bp+var_78], eax
		lea	ax, word ptr [bp+var_78]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_7C]
		push	ax
		call	Math_AsinDeg_567D3
		add	sp, 6
		mov	bx, word ptr [bp+var_7C+1]
		cmp	bx, 0B4h
		jle	short loc_4CBEE
		mov	ax, 0B4h
		sub	ax, bx
		mov	bx, ax

loc_4CBEE:
		mov	word ptr [bp+var_84+2], bx
		mov	[bp+var_86], 5A00h
		movsx	eax, word ptr [bp+var_84+2]
		shl	eax, 8
		mov	[bp+var_8A], eax
		mov	eax, [bp+var_8A]
		mov	edx, eax
		mov	ecx, [bp+var_86]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_8E], eax
		mov	eax, [bp+var_8E]
		mov	[bp+var_80], eax
		mov	word ptr [bp+var_92], si
		movsx	eax, word ptr [bp+var_92]
		shl	eax, 8
		mov	[bp+var_96], eax
		mov	eax, [bp+var_96]
		mov	edx, [bp+var_80]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_9A], eax
		mov	eax, [bp+var_9A]
		mov	[bp+var_9E], eax
		mov	ax, word ptr [bp+var_9E+1]
		mov	word ptr [bp+var_92+2], ax
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx+6], 1Dh
		push	2
		push	large [bp+var_54]
		call	sub_634A4
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+14h], eax
		mov	es:[bx+18h], si
		mov	ax, word ptr [bp+var_92+2]
		mov	es:[bx+1Ah], ax
		mov	[bp+var_A2], 7D000h
		mov	eax, [bp+var_A2]
		add	es:[bx+2], eax
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		jmp	loc_4D023

loc_4CCB8:
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 32h
		mov	[bp+var_56], ax
		mov	word ptr [bp+var_5A+2], dx
		les	bx, word ptr [bp+var_5A+2]
		mov	eax, es:[bx]
		mov	[bp+var_5C], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 2
		mov	word ptr [bp+var_5E], ax
		mov	word ptr [bp+var_60], dx
		les	bx, word ptr [bp+var_60]
		mov	eax, es:[bx]
		mov	[bp+var_64], eax
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+1Eh]
		mov	ax, [bx+0Eh]
		mov	word ptr [bp+var_68+2], ax
		movsx	eax, word ptr [bp+var_68+2]
		mov	edx, [bp+var_64]
		imul	edx, eax
		mov	[bp+var_6A], edx
		mov	eax, [bp+var_6A]
		mov	[bp+var_6E], eax
		push	eax
		push	large dword_7CA10
		push	large [bp+var_5C]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_72], eax
		mov	[bp+var_54], eax
		les	bx, word ptr [bp+arg_0]
		mov	ax, word ptr [bp+var_54]
		mov	es:[bx+8], ax
		cmp	word ptr es:[bx+8], 4
		jge	short loc_4CD47
		mov	ax, 4
		jmp	short loc_4CD4E

loc_4CD47:
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+8]

loc_4CD4E:
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+8], ax
		cmp	word ptr es:[bx+8], 2000h
		jge	short loc_4CD63
		mov	ax, es:[bx+8]
		jmp	short loc_4CD66

loc_4CD63:
		mov	ax, 2000h

loc_4CD66:
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+8], ax
		mov	bx, es:[bx+1Eh]
		mov	ax, [bx+0Eh]
		mov	word ptr [bp+var_74], ax
		movsx	eax, word ptr [bp+var_74]
		mov	edx, [bp+var_54]
		imul	edx, eax
		mov	[bp+var_78], edx
		mov	eax, [bp+var_78]
		mov	[bp+var_7C], eax
		mov	si, word ptr [bp+var_7C+1]
		mov	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+0Ch]
		sub	ax, si
		cmp	ax, word_7CA50
		jle	short loc_4CDA5
		jmp	loc_4D023

loc_4CDA5:
		mov	ax, es:[bx+0Ch]
		add	ax, si
		cmp	ax, word_7CA4C
		jge	short loc_4CDB4
		jmp	loc_4D023

loc_4CDB4:
		mov	ax, es:[bx+0Eh]
		sub	ax, si
		cmp	ax, word_7CA52
		jle	short loc_4CDC3
		jmp	loc_4D023

loc_4CDC3:
		mov	ax, es:[bx+0Eh]
		add	ax, si
		cmp	ax, word_7CA4E
		jge	short loc_4CDD2
		jmp	loc_4D023

loc_4CDD2:
		or	byte ptr es:[bx+3Eh], 2
		mov	bx, es:[bx+1Ch]
		cmp	word ptr [bx+25h], 0
		jz	short loc_4CE00
		mov	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+40h]
		mov	ah, 0
		mov	bx, es:[bx+1Ch]
		mov	bx, [bx+25h]
		add	bx, ax
		mov	al, [bx]
		mov	ah, 0
		mov	bx, word ptr [bp+arg_0]
		mov	es:[bx+0Ah], ax
		jmp	short loc_4CE0D

loc_4CE00:
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+40h]
		mov	ah, 0
		mov	es:[bx+0Ah], ax

loc_4CE0D:
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+1Eh]
		mov	eax, [bx+0Ah]
		mov	bx, word ptr [bp+arg_0]
		mov	es:[bx+10h], eax
		mov	word ptr es:[bx+6], 1Bh
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		jmp	loc_4D023

loc_4CE31:
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 32h
		mov	word ptr [bp+var_80+2], ax
		mov	word ptr [bp+var_80], dx
		les	bx, word ptr [bp+var_80]
		mov	eax, es:[bx]
		mov	[bp+var_84], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 2
		mov	word ptr [bp+var_86], ax
		mov	word ptr [bp+var_8A+2], dx
		les	bx, word ptr [bp+var_8A+2]
		mov	eax, es:[bx]
		mov	[bp+var_8C], eax
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+1Eh]
		mov	ax, [bx+0Eh]
		mov	word ptr [bp+var_8E], ax
		movsx	eax, word ptr [bp+var_8E]
		mov	edx, [bp+var_8C]
		imul	edx, eax
		mov	[bp+var_92], edx
		mov	eax, [bp+var_92]
		mov	[bp+var_96], eax
		push	eax
		push	large dword_7CA10
		push	large [bp+var_84]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_9A], eax
		mov	[bp+var_9E], eax
		mov	[bp+var_54], eax
		les	bx, word ptr [bp+arg_0]
		mov	ax, word ptr [bp+var_54]
		mov	es:[bx+8], ax
		cmp	word ptr es:[bx+8], 4
		jge	short loc_4CED2
		mov	ax, 4
		jmp	short loc_4CED9

loc_4CED2:
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+8]

loc_4CED9:
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+8], ax
		cmp	word ptr es:[bx+8], 2000h
		jge	short loc_4CEEE
		mov	ax, es:[bx+8]
		jmp	short loc_4CEF1

loc_4CEEE:
		mov	ax, 2000h

loc_4CEF1:
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+8], ax
		mov	bx, es:[bx+1Eh]
		mov	ax, [bx+0Eh]
		mov	word ptr [bp+var_A2+2], ax
		movsx	eax, word ptr [bp+var_A2+2]
		mov	edx, [bp+var_54]
		imul	edx, eax
		mov	[bp+var_A4], edx
		mov	eax, [bp+var_A4]
		mov	[bp+var_A8], eax
		mov	si, word ptr [bp+var_A8+1]
		mov	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+0Ch]
		sub	ax, si
		cmp	ax, word_7CA50
		jle	short loc_4CF36
		jmp	loc_4D023

loc_4CF36:
		mov	ax, es:[bx+0Ch]
		add	ax, si
		cmp	ax, word_7CA4C
		jge	short loc_4CF45
		jmp	loc_4D023

loc_4CF45:
		mov	ax, es:[bx+0Eh]
		sub	ax, si
		cmp	ax, word_7CA52
		jle	short loc_4CF54
		jmp	loc_4D023

loc_4CF54:
		mov	ax, es:[bx+0Eh]
		add	ax, si
		cmp	ax, word_7CA4E
		jge	short loc_4CF63
		jmp	loc_4D023

loc_4CF63:
		or	byte ptr es:[bx+3Eh], 2
		mov	eax, es:[bx+3Ah]
		sar	eax, 8
		cmp	eax, 0
		jg	short loc_4CF8A
		mov	[bp+var_AC], 100h
		mov	eax, [bp+var_AC]
		mov	es:[bx+3Ah], eax

loc_4CF8A:
		les	bx, word ptr [bp+arg_0]
		mov	eax, es:[bx+3Ah]
		sar	eax, 8
		mov	si, ax
		or	si, si
		jge	short loc_4CFA2
		xor	dx, dx
		xor	ax, ax
		jmp	short loc_4CFBF

loc_4CFA2:
		push	0
		mov	al, byte_7CC70
		push	ax
		push	large dword_7CC6C
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	bx, si
		shl	bx, 8
		add	ax, bx

loc_4CFBF:
		mov	word ptr [bp+var_B0+2], dx
		mov	word ptr [bp+var_B0], ax
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+1Eh]
		mov	eax, [bx+0Ah]
		mov	bx, word ptr [bp+arg_0]
		mov	es:[bx+10h], eax
		mov	word ptr es:[bx+6], 1Ch
		push	2
		push	large [bp+var_B0]
		call	sub_634A4
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+14h], eax
		mov	bx, es:[bx+1Ch]
		mov	al, [bx+19h]
		mov	ah, 0
		mov	bx, word ptr [bp+arg_0]
		mov	es:[bx+18h], ax
		mov	bx, es:[bx+1Ch]
		mov	al, [bx+1Ah]
		mov	ah, 0
		mov	bx, word ptr [bp+arg_0]
		mov	es:[bx+1Ah], ax
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax

loc_4D023:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		pop	di
		pop	si
		leave
		retf
sub_4C821		endp

; START OF FUNCTION CHUNK FOR sub_4C821
off_4D02D	dw offset loc_4C84E
		dw offset loc_4CCB8
		dw offset loc_4CE31
		dw offset loc_4C9C7
		dw offset loc_4CCB8
; END OF FUNCTION CHUNK FOR sub_4C821

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4D037		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_4D050
		push	33h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_4D098

loc_4D050:
		mov	word ptr [si], 0DAEh
		mov	dword ptr [si+6], 0
		mov	word ptr [si+4], 0
		mov	byte ptr [si+2], 0
		mov	byte ptr [si+3], 0
		mov	word ptr [si], 2E64h
		mov	word ptr [si+17h], 0
		mov	word ptr [si+15h], 0
		mov	byte ptr [si+19h], 2
		mov	byte ptr [si+1Ah], 0
		mov	dword ptr [si+1Bh], 0
		mov	byte ptr [si+0Ah], 0
		mov	word ptr [si+0Dh], 0
		mov	dword ptr [si+27h], 0

loc_4D098:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_4D037		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 7 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ParticlePool_InsertElement (sub_4CCF2 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,41L — si sous la
; capacité (+0x31 < +0x13), insère un pointeur dans le tableau circulaire (+0x2D, pas 4),
; positionne un flag si un champ (+6) est non nul : insertion d'un élément dans le pool
; circulaire d'émetteur (avec flag de type spécial).
; ==============================================================================================
ParticlePool_InsertElement		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+2Fh]
		cmp	ax, [si+13h]
		jge	short loc_4D0D3
		les	bx, [si+2Bh]
		mov	eax, [bp+arg_2]
		mov	es:[bx], eax
		les	bx, word ptr [bp+arg_2]
		cmp	word ptr es:[bx+6], 0
		jz	short loc_4D0C8
		or	byte ptr es:[bx+3Eh], 1
		jmp	short loc_4D0C8

loc_4D0C8:
		add	word ptr [si+2Bh], 4
		inc	word ptr [si+2Fh]
		mov	al, 1
		jmp	short loc_4D0D5

loc_4D0D3:
		mov	al, 0

loc_4D0D5:
		pop	si
		pop	bp
		retf
ParticlePool_InsertElement		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 7 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ParticlePool_RemoveElement (sub_4CD2D de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,27L — efface le
; flag associé (+0x2C bit0), retire l'élément du tableau circulaire (+0x2D) en compactant :
; retrait d'un élément du pool circulaire d'émetteur.
; ==============================================================================================
ParticlePool_RemoveElement		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		les	bx, word ptr [bp+arg_2]
		les	bx, es:[bx]
		and	byte ptr es:[bx+3Eh], 0FEh
		sub	word ptr [si+2Bh], 4
		dec	word ptr [si+2Fh]
		mov	eax, [si+2Bh]
		cmp	eax, [bp+arg_2]
		jz	short loc_4D109
		les	bx, [si+2Bh]
		mov	eax, es:[bx]
		les	bx, word ptr [bp+arg_2]
		mov	es:[bx], eax

loc_4D109:
		pop	si
		pop	bp
		retf
ParticlePool_RemoveElement		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4D10C		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si+27h]
		mov	[bp+var_4], eax
		jmp	short loc_4D13F

loc_4D120:
		les	bx, word ptr [bp+var_4]
		mov	eax, es:[bx]
		cmp	eax, [bp+arg_2]
		jnz	short loc_4D13B
		push	word ptr [bp+var_4+2]
		push	bx
		push	si
		push	cs
		call	near ptr ParticlePool_RemoveElement
		add	sp, 6
		jmp	short loc_4D147

loc_4D13B:
		add	word ptr [bp+var_4], 4

loc_4D13F:
		mov	ax, [si+2Bh]
		cmp	ax, word ptr [bp+var_4]
		ja	short loc_4D120

loc_4D147:
		pop	si
		leave
		retf
sub_4D10C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4D14A		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+0Ah], 0
		jz	short loc_4D192
		mov	eax, [si+27h]
		mov	[bp+var_4], eax
		jmp	short loc_4D18A

loc_4D164:
		les	bx, word ptr [bp+var_4]
		push	large es:[bx]
		push	cs
		call	near ptr sub_4C43D
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_4D186
		push	large [bp+var_4]
		push	si
		push	cs
		call	near ptr ParticlePool_RemoveElement
		add	sp, 6
		jmp	short loc_4D18A

loc_4D186:
		add	word ptr [bp+var_4], 4

loc_4D18A:
		mov	ax, [si+2Bh]
		cmp	ax, word ptr [bp+var_4]
		ja	short loc_4D164

loc_4D192:
		mov	al, 1
		pop	si
		leave
		retf
sub_4D14A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4D197		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+0Ah], 0
		jz	short loc_4D222
		mov	eax, [si+27h]
		mov	[bp+var_4], eax
		jmp	short loc_4D21A

loc_4D1B1:
		les	bx, word ptr [bp+var_4]
		push	large es:[bx]
		push	cs
		call	near ptr sub_4C218
		add	sp, 4
		or	al, al
		jz	short loc_4D216
		les	bx, word ptr [bp+var_4]
		push	large es:[bx]
		push	cs
		call	near ptr sub_4C821
		add	sp, 4
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		cmp	[bp+var_8], 0
		jz	short loc_4D216
		mov	eax, [bp+var_8]
		mov	[bp+var_C], eax
		mov	ax, word_7CBC8
		shl	ax, 2
		mov	dx, word_7CBDC
		sub	dx, 100h
		cmp	ax, dx
		jbe	short loc_4D1FD
		mov	ax, 1
		jmp	short loc_4D1FF

loc_4D1FD:
		xor	ax, ax

loc_4D1FF:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_4D216
		push	large [bp+var_C]
		push	6496h
		call	sub_293E7
		add	sp, 6
		jmp	short loc_4D216

loc_4D216:
		add	word ptr [bp+var_4], 4

loc_4D21A:
		mov	ax, [si+2Bh]
		cmp	ax, word ptr [bp+var_4]
		ja	short loc_4D1B1

loc_4D222:
		pop	si
		leave
		retf
sub_4D197		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4D225		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+0Ah], 0
		jz	short loc_4D259
		mov	eax, [si+27h]
		mov	[bp+var_4], eax
		jmp	short loc_4D251

loc_4D23F:
		les	bx, word ptr [bp+var_4]
		push	large es:[bx]
		push	cs
		call	near ptr Particle_IntegrateVelocity
		add	sp, 4
		add	word ptr [bp+var_4], 4

loc_4D251:
		mov	ax, [si+2Bh]
		cmp	ax, word ptr [bp+var_4]
		ja	short loc_4D23F

loc_4D259:
		pop	si
		leave
		retf
sub_4D225		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4D25C		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_4D271
		jmp	loc_4D325

loc_4D271:
		mov	word ptr [si], 2E64h
		cmp	byte ptr [si+0Ah], 0
		jz	short loc_4D282
		push	si
		nop
		push	cs
		call	near ptr sub_4D329
		pop	cx

loc_4D282:
		push	word ptr [si+0Dh]
		call	sub_3B2
		pop	cx
		push	seg seg117
		push	offset sub_4DBB0
		push	large 190000h
		push	10h
		push	word ptr [si+11h]
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	0
		push	2
		mov	ax, si
		add	ax, 27h
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		mov	ax, si
		add	ax, 15h
		mov	dx, ds
		or	ax, dx
		jz	short loc_4D30D
		cmp	byte ptr [si+1Ah], 0
		jz	short loc_4D2F5
		mov	ax, [si+15h]
		or	ax, [si+17h]
		jz	short loc_4D2F5
		push	0
		mov	al, [si+19h]
		push	ax
		mov	ax, [si+17h]
		mov	dx, [si+15h]
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		lea	ax, [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_4D2F5

loc_4D2F5:
		mov	word ptr [si+17h], 0
		mov	word ptr [si+15h], 0
		mov	byte ptr [si+1Ah], 0
		mov	dword ptr [si+1Bh], 0
		jmp	short loc_4D30D

loc_4D30D:
		push	0
		push	si
		call	sub_1E120
		add	sp, 4
		test	di, 1
		jz	short loc_4D325
		push	si
		call	sub_3B2
		pop	cx

loc_4D325:
		pop	di
		pop	si
		leave
		retf
sub_4D25C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4D329		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si+27h]
		mov	[si+2Bh], eax
		mov	word ptr [si+2Fh], 0
		push	0
		mov	al, [si+19h]
		push	ax
		push	large [si+15h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		xor	dx, dx
		jmp	short loc_4D36C

loc_4D35F:
		les	bx, [bp+var_4]
		and	byte ptr es:[bx+3Eh], 0FEh
		inc	dx
		add	[bp+var_4], 42h

loc_4D36C:
		cmp	[si+13h], dx
		jg	short loc_4D35F
		mov	byte ptr [si+0Ah], 0
		pop	si
		leave
		retf
sub_4D329		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4D378		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	[bp+var_4], 0
		cmp	dx, 0FFFFh
		jnz	short loc_4D396
		jmp	loc_4D426

loc_4D396:
		mov	ax, [di+2Fh]
		cmp	ax, [di+13h]
		jl	short loc_4D3A1
		jmp	loc_4D426

loc_4D3A1:
		mov	eax, [di+1Fh]
		mov	[bp+var_4], eax
		mov	ax, dx
		imul	ax, ax, 2Ah
		mov	dx, [di+0Dh]
		add	dx, ax
		push	dx
		push	large [bp+var_4]
		push	cs
		call	near ptr Particle_InitFromSmokeModel_4C192
		add	sp, 6
		add	word ptr [di+1Fh], 42h
		mov	ax, [di+1Fh]
		cmp	ax, [di+23h]
		jb	short loc_4D3E6
		push	0
		mov	al, [di+19h]
		push	ax
		push	large [di+15h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	[di+21h], dx
		mov	[di+1Fh], ax

loc_4D3E6:
		mov	ax, [di+13h]
		dec	ax
		cmp	[di+2Fh], ax
		jge	short loc_4D426
		jmp	short loc_4D418

loc_4D3F1:
		add	word ptr [di+1Fh], 42h
		mov	ax, [di+1Fh]
		cmp	ax, [di+23h]
		jbe	short loc_4D418
		push	0
		mov	al, [di+19h]
		push	ax
		push	large [di+15h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	[di+21h], dx
		mov	[di+1Fh], ax

loc_4D418:
		les	bx, [di+1Fh]
		mov	al, es:[bx+3Eh]
		and	ax, 1
		or	al, al
		jnz	short loc_4D3F1

loc_4D426:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		pop	di
		pop	si
		leave
		retf
sub_4D378		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4D430		proc far

var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= word ptr -1Eh
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 36h
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	si, [bp+arg_2]
		cmp	byte ptr [di+0Ah], 0
		jnz	short loc_4D447
		jmp	loc_4D5A7

loc_4D447:
		push	si
		push	di
		push	cs
		call	near ptr sub_4D378
		add	sp, 4
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_4D460
		jmp	loc_4D5A7

loc_4D460:
		mov	ax, si
		imul	ax, ax, 2Ah
		mov	dx, [di+0Dh]
		add	dx, ax
		mov	[bp+var_6], dx
		mov	bx, [bp+var_6]
		mov	ax, [bx+1Bh]
		call	Math_RandomJitter_56C57
		movsx	eax, ax
		mov	[bp+var_12], eax
		mov	bx, [bp+var_6]
		mov	ax, [bx+1Bh]
		call	Math_RandomJitter_56C57
		movsx	eax, ax
		mov	[bp+var_E], eax
		mov	bx, [bp+var_6]
		mov	ax, [bx+1Bh]
		call	Math_RandomJitter_56C57
		movsx	eax, ax
		mov	[bp+var_A], eax
		push	[bp+arg_6]
		lea	ax, word ptr [bp+var_12]
		push	ax
		push	ss
		lea	ax, [bp+var_1E]
		push	ax
		call	ChaseCamera_ComputeGeometryHelper_57096
		add	sp, 8
		mov	si, [bp+arg_4]
		mov	eax, [si]
		add	eax, [bp+var_12]
		mov	[bp+var_2A], eax
		mov	eax, [si+4]
		add	eax, [bp+var_E]
		mov	[bp+var_26], eax
		mov	eax, [si+8]
		add	eax, [bp+var_A]
		mov	[bp+var_22], eax
		mov	eax, [bp+var_2A]
		mov	[bp+var_36], eax
		mov	eax, [bp+var_26]
		mov	[bp+var_32], eax
		mov	eax, [bp+var_22]
		mov	[bp+var_2E], eax
		les	bx, word ptr [bp+var_4]
		mov	eax, [bp+var_36]
		mov	es:[bx+20h], eax
		mov	eax, [bp+var_32]
		mov	es:[bx+24h], eax
		mov	eax, [bp+var_2E]
		mov	es:[bx+28h], eax
		mov	ax, word ptr [bp+var_4]
		add	ax, 20h
		mov	dx, [bp+arg_6]
		mov	si, dx
		mov	ax, [si]
		mov	es:[bx+2Ch], ax
		mov	ax, [si+4]
		mov	es:[bx+2Eh], ax
		mov	ax, [si+8]
		mov	es:[bx+30h], ax
		mov	bx, [bp+var_6]
		cmp	byte ptr [bx+27h], 0FFh
		jz	short loc_4D59B
		cmp	byte ptr [bx+28h], 64h
		jnz	short loc_4D55A
		mov	al, [bx+27h]
		mov	ah, 0
		shl	ax, 4
		mov	dx, [di+11h]
		add	dx, ax
		mov	bx, word ptr [bp+var_4]
		mov	es:[bx+1Eh], dx
		jmp	short loc_4D59B

loc_4D55A:
		mov	bx, [bp+var_6]
		mov	al, [bx+28h]
		mov	ah, 0
		call	Math_RandomChance_56C8A
		or	al, al
		jz	short loc_4D584
		mov	bx, [bp+var_6]
		mov	al, [bx+27h]
		mov	ah, 0
		shl	ax, 4
		mov	dx, [di+11h]
		add	dx, ax
		les	bx, word ptr [bp+var_4]
		mov	es:[bx+1Eh], dx
		jmp	short loc_4D59B

loc_4D584:
		mov	bx, [bp+var_6]
		mov	al, [bx+29h]
		mov	ah, 0
		shl	ax, 4
		mov	dx, [di+11h]
		add	dx, ax
		les	bx, word ptr [bp+var_4]
		mov	es:[bx+1Eh], dx

loc_4D59B:
		push	large [bp+var_4]
		push	di
		push	cs
		call	near ptr ParticlePool_InsertElement
		add	sp, 6

loc_4D5A7:
		pop	di
		pop	si
		leave
		retf
sub_4D430		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4D5AB		proc far

var_24		= dword ptr -24h
var_20		= word ptr -20h
var_1E		= dword ptr -1Eh
var_1A		= word ptr -1Ah
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= dword ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 24h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	cx, [bp+arg_2]
		cmp	byte ptr [si+0Ah], 0
		jnz	short loc_4D5C2
		jmp	loc_4D6F7

loc_4D5C2:
		mov	ax, cx
		imul	ax, ax, 2Ah
		mov	di, [si+0Dh]
		add	di, ax
		push	cx
		push	si
		push	cs
		call	near ptr sub_4D378
		add	sp, 4
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		or	ax, dx
		jnz	short loc_4D5E2
		jmp	loc_4D6F7

loc_4D5E2:
		mov	dx, [bp+arg_4]
		mov	bx, dx
		mov	eax, [bx]
		les	bx, word ptr [bp+var_4]
		mov	es:[bx+20h], eax
		mov	bx, dx
		mov	eax, [bx+4]
		mov	bx, word ptr [bp+var_4]
		mov	es:[bx+24h], eax
		mov	bx, dx
		mov	eax, [bx+8]
		mov	bx, word ptr [bp+var_4]
		mov	es:[bx+28h], eax
		mov	ax, word ptr [bp+var_4]
		add	ax, 20h
		mov	ax, word ptr [bp+var_4+2]
		mov	dx, word ptr [bp+var_4]
		add	dx, 36h
		mov	[bp+var_6], ax
		mov	[bp+var_8], dx
		les	bx, [bp+var_8]
		mov	eax, es:[bx]
		mov	[bp+var_C], eax
		sub	eax, [bp+arg_6]
		mov	[bp+var_10], eax
		mov	[bp+var_14], eax
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		les	bx, word ptr [bp+var_4]
		mov	es:[bx+36h], eax
		cmp	dword ptr es:[bx+36h], 0
		jg	short loc_4D655
		jmp	loc_4D6F7

loc_4D655:
		mov	ax, di
		add	ax, 0Dh
		mov	[bp+var_1A], ax
		mov	bx, [bp+var_1A]
		mov	eax, [bx]
		mov	[bp+var_1E], eax
		mov	eax, [bp+var_1E]
		mov	bx, word ptr [bp+var_4]
		mov	es:[bx+32h], eax
		mov	ax, [di+15h]
		mov	[bp+var_20], ax
		movsx	eax, [bp+var_20]
		shl	eax, 8
		mov	[bp+var_24], eax
		mov	eax, [bp+var_24]
		mov	es:[bx+3Ah], eax
		mov	byte ptr es:[bx+40h], 0
		cmp	byte ptr [di+27h], 0FFh
		jz	short loc_4D6EB
		cmp	byte ptr [di+28h], 64h
		jnz	short loc_4D6B3
		mov	al, [di+27h]
		mov	ah, 0
		shl	ax, 4
		mov	dx, [si+11h]
		add	dx, ax
		mov	es:[bx+1Eh], dx
		jmp	short loc_4D6EB

loc_4D6B3:
		mov	al, [di+28h]
		mov	ah, 0
		call	Math_RandomChance_56C8A
		or	al, al
		jz	short loc_4D6D7
		mov	al, [di+27h]
		mov	ah, 0
		shl	ax, 4
		mov	dx, [si+11h]
		add	dx, ax
		les	bx, word ptr [bp+var_4]
		mov	es:[bx+1Eh], dx
		jmp	short loc_4D6EB

loc_4D6D7:
		mov	al, [di+29h]
		mov	ah, 0
		shl	ax, 4
		mov	dx, [si+11h]
		add	dx, ax
		les	bx, word ptr [bp+var_4]
		mov	es:[bx+1Eh], dx

loc_4D6EB:
		push	large [bp+var_4]
		push	si
		push	cs
		call	near ptr ParticlePool_InsertElement
		add	sp, 6

loc_4D6F7:
		pop	di
		pop	si
		leave
		retf
sub_4D5AB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4D6FB		proc far

var_EC		= dword ptr -0ECh
var_E8		= dword ptr -0E8h
var_E4		= dword ptr -0E4h
var_E0		= dword ptr -0E0h
var_DC		= dword ptr -0DCh
var_D8		= dword ptr -0D8h
var_D4		= word ptr -0D4h
var_C8		= dword ptr -0C8h
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
var_94		= dword ptr -94h
var_90		= dword ptr -90h
var_8C		= dword ptr -8Ch
var_88		= dword ptr -88h
var_84		= dword ptr -84h
var_80		= word ptr -80h
var_7E		= word ptr -7Eh
var_7C		= word ptr -7Ch
var_7A		= word ptr -7Ah
var_78		= dword ptr -78h
var_74		= word ptr -74h
var_72		= dword ptr -72h
var_6E		= dword ptr -6Eh
var_6A		= word ptr -6Ah
var_68		= dword ptr -68h
var_64		= dword ptr -64h
var_60		= dword ptr -60h
var_5C		= dword ptr -5Ch
var_58		= dword ptr -58h
var_54		= dword ptr -54h
var_50		= word ptr -50h
var_4E		= dword ptr -4Eh
var_4A		= word ptr -4Ah
var_48		= dword ptr -48h
var_44		= word ptr -44h
var_42		= word ptr -42h
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
var_18		= word ptr -18h
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= dword ptr  0Eh
arg_C		= word ptr  12h

		push	bp
		mov	bp, sp
		sub	sp, 0ECh
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+0Ah], 0
		jnz	short loc_4D710
		jmp	loc_4DB8A

loc_4D710:
		mov	di, [bp+arg_6]
		mov	ax, [bp+arg_4]
		mov	[bp+var_2], ax
		mov	eax, [di]
		mov	bx, [bp+var_2]
		sub	eax, [bx]
		mov	[bp+var_B0], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp+var_AC], eax
		mov	eax, [di+8]
		sub	eax, [bx+8]
		mov	[bp+var_A8], eax
		mov	eax, [bp+var_B0]
		mov	[bp+var_A4], eax
		mov	eax, [bp+var_AC]
		mov	[bp+var_A0], eax
		mov	eax, [bp+var_A8]
		mov	[bp+var_9C], eax
		lea	ax, word ptr [bp+var_A4]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_6]
		push	ax
		call	Math_VectorLength3D_Scaled_56D92
		add	sp, 6
		mov	ax, [bp+arg_2]
		imul	ax, ax, 2Ah
		mov	di, [si+0Dh]
		add	di, ax
		mov	ax, di
		inc	ax
		mov	[bp+var_A], ax
		mov	eax, [bp+var_6]
		mov	edx, eax
		mov	bx, [bp+var_A]
		mov	ecx, [bx]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_E], eax
		mov	eax, [bp+var_E]
		mov	[bp+var_12], eax
		mov	ax, word ptr [bp+var_12+1]
		mov	[bp+var_8], ax
		cmp	[bp+var_8], 0
		jnz	short loc_4D7C7
		cmp	[bp+var_6], 0
		jle	short loc_4D7BE
		mov	ax, 1
		jmp	short loc_4D7C0

loc_4D7BE:
		xor	ax, ax

loc_4D7C0:
		or	al, al
		jz	short loc_4D7C7
		inc	[bp+var_8]

loc_4D7C7:
		cmp	[bp+var_8], 0
		jg	short loc_4D7D0
		jmp	loc_4DB8A

loc_4D7D0:
		mov	ax, [bp+arg_4]
		mov	[bp+var_18], ax
		mov	bx, [bp+var_18]
		mov	eax, [bx]
		mov	[bp+var_C8], eax
		mov	eax, [bx+4]
		mov	[bp+var_C4], eax
		mov	eax, [bx+8]
		mov	[bp+var_C0], eax
		mov	[bp+var_3C], 0
		mov	eax, [bp+var_3C]
		mov	[bp+var_1C], eax
		mov	[bp+var_40], 0
		mov	eax, [bp+var_40]
		mov	[bp+var_28], eax
		cmp	[bp+arg_C], 0
		jnz	short loc_4D823
		mov	eax, [di+0Dh]
		mov	[bp+var_20], eax
		jmp	short loc_4D849

loc_4D823:
		mov	bx, [bp+arg_C]
		les	bx, [bx+0Eh]
		mov	ax, es:[bx+0Ah]
		mov	dx, es:[bx+8]
		add	dx, 10h
		mov	[bp+var_42], ax
		mov	[bp+var_44], dx
		les	bx, [bp+var_44]
		mov	eax, es:[bx]
		mov	[bp+var_48], eax
		mov	[bp+var_20], eax

loc_4D849:
		mov	ax, [di+15h]
		mov	[bp+var_4A], ax
		movsx	eax, [bp+var_4A]
		shl	eax, 8
		mov	[bp+var_4E], eax
		mov	eax, [bp+var_4E]
		mov	[bp+var_24], eax
		mov	ax, [bp+var_8]
		mov	[bp+var_50], ax
		movsx	ebx, [bp+var_50]
		mov	eax, [bp+arg_8]
		cdq
		idiv	ebx
		mov	[bp+var_54], eax
		mov	[bp+var_58], eax
		mov	[bp+var_2C], eax
		mov	eax, [di+9]
		mov	edx, [bp+var_2C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_5C], eax
		mov	eax, [bp+var_5C]
		mov	[bp+var_60], eax
		mov	[bp+var_30], eax
		mov	eax, [di+11h]
		mov	edx, [bp+var_2C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_64], eax
		mov	eax, [bp+var_64]
		mov	[bp+var_68], eax
		mov	[bp+var_34], eax
		mov	ax, [di+21h]
		mov	[bp+var_6A], ax
		movsx	eax, [bp+var_6A]
		mov	edx, [bp+var_2C]
		imul	edx, eax
		mov	[bp+var_6E], edx
		mov	eax, [bp+var_6E]
		mov	[bp+var_72], eax
		mov	[bp+var_38], eax
		mov	ax, [bp+var_8]
		mov	[bp+var_74], ax
		movsx	eax, [bp+var_74]
		shl	eax, 8
		mov	[bp+var_78], eax
		mov	eax, [bp+var_A4]
		mov	edx, eax
		mov	ecx, [bp+var_78]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_A4], eax
		mov	eax, [bp+var_A0]
		mov	edx, eax
		mov	ecx, [bp+var_78]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_A0], eax
		mov	eax, [bp+var_9C]
		mov	edx, eax
		mov	ecx, [bp+var_78]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_9C], eax
		mov	ax, [bp+var_8]
		dec	ax
		mov	[bp+var_7C], ax
		mov	[bp+var_7A], 0
		jmp	loc_4DB7F

loc_4D95D:
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_4D378
		add	sp, 4
		mov	word ptr [bp+var_16+2], dx
		mov	word ptr [bp+var_16], ax
		cmp	[bp+var_16], 0
		jnz	short loc_4D978
		jmp	loc_4DB8A

loc_4D978:
		les	bx, word ptr [bp+var_16]
		mov	eax, [bp+var_C8]
		mov	es:[bx+20h], eax
		mov	eax, [bp+var_C4]
		mov	es:[bx+24h], eax
		mov	eax, [bp+var_C0]
		mov	es:[bx+28h], eax
		mov	ax, word ptr [bp+var_16]
		add	ax, 20h
		mov	ax, word ptr [bp+var_16+2]
		mov	dx, word ptr [bp+var_16]
		add	dx, 36h
		mov	[bp+var_7E], ax
		mov	[bp+var_80], dx
		les	bx, [bp+var_80]
		mov	eax, es:[bx]
		mov	[bp+var_84], eax
		sub	eax, [bp+arg_8]
		mov	[bp+var_88], eax
		mov	[bp+var_8C], eax
		mov	[bp+var_90], eax
		mov	eax, [bp+var_90]
		les	bx, word ptr [bp+var_16]
		mov	es:[bx+36h], eax
		cmp	dword ptr es:[bx+36h], 0
		jg	short loc_4D9E5
		jmp	loc_4DB8A

loc_4D9E5:
		mov	eax, [bp+var_20]
		mov	[bp+var_94], eax
		mov	eax, [bp+var_94]
		mov	es:[bx+32h], eax
		mov	eax, [bp+var_24]
		mov	[bp+var_98], eax
		mov	eax, [bp+var_98]
		mov	es:[bx+3Ah], eax
		mov	eax, [bp+var_28]
		sar	eax, 8
		mov	es:[bx+40h], al
		cmp	byte ptr [di+27h], 0FFh
		jz	short loc_4DA6E
		cmp	byte ptr [di+28h], 64h
		jnz	short loc_4DA36
		mov	al, [di+27h]
		mov	ah, 0
		shl	ax, 4
		mov	dx, [si+11h]
		add	dx, ax
		mov	es:[bx+1Eh], dx
		jmp	short loc_4DA6E

loc_4DA36:
		mov	al, [di+28h]
		mov	ah, 0
		call	Math_RandomChance_56C8A
		or	al, al
		jz	short loc_4DA5A
		mov	al, [di+27h]
		mov	ah, 0
		shl	ax, 4
		mov	dx, [si+11h]
		add	dx, ax
		les	bx, word ptr [bp+var_16]
		mov	es:[bx+1Eh], dx
		jmp	short loc_4DA6E

loc_4DA5A:
		mov	al, [di+29h]
		mov	ah, 0
		shl	ax, 4
		mov	dx, [si+11h]
		add	dx, ax
		les	bx, word ptr [bp+var_16]
		mov	es:[bx+1Eh], dx

loc_4DA6E:
		push	large [bp+var_16]
		push	si
		push	cs
		call	near ptr ParticlePool_InsertElement
		add	sp, 6
		mov	eax, [bp+var_2C]
		add	[bp+arg_8], eax
		mov	eax, [bp+var_30]
		add	[bp+var_20], eax
		mov	eax, [bp+var_34]
		add	[bp+var_24], eax
		mov	eax, [bp+var_38]
		add	[bp+var_28], eax
		mov	ax, [di+1Bh]
		call	Math_RandomJitter_56C57
		movsx	eax, ax
		mov	[bp+var_BC], eax
		mov	ax, [di+1Bh]
		call	Math_RandomJitter_56C57
		movsx	eax, ax
		mov	[bp+var_B8], eax
		mov	ax, [di+1Bh]
		call	Math_RandomJitter_56C57
		movsx	eax, ax
		mov	[bp+var_B4], eax
		lea	ax, word ptr [bp+var_A4]
		push	ax
		lea	ax, word ptr [bp+var_BC]
		push	ax
		push	ss
		lea	ax, [bp+var_D4]
		push	ax
		call	ChaseCamera_ComputeGeometryHelper_57096
		add	sp, 8
		cmp	[bp+var_7A], 0
		jz	short loc_4DAF3
		mov	ax, [bp+var_7A]
		cmp	ax, [bp+var_7C]
		jnz	short loc_4DB13

loc_4DAF3:
		mov	eax, [bp+var_A4]
		add	[bp+var_C8], eax
		mov	eax, [bp+var_A0]
		add	[bp+var_C4], eax
		mov	eax, [bp+var_9C]
		add	[bp+var_C0], eax
		jmp	short loc_4DB7C

loc_4DB13:
		mov	eax, [bp+var_A4]
		add	eax, [bp+var_BC]
		mov	[bp+var_E0], eax
		mov	eax, [bp+var_A0]
		add	eax, [bp+var_B8]
		mov	[bp+var_DC], eax
		mov	eax, [bp+var_9C]
		add	eax, [bp+var_B4]
		mov	[bp+var_D8], eax
		mov	eax, [bp+var_E0]
		mov	[bp+var_EC], eax
		mov	eax, [bp+var_DC]
		mov	[bp+var_E8], eax
		mov	eax, [bp+var_D8]
		mov	[bp+var_E4], eax
		mov	eax, [bp+var_EC]
		add	[bp+var_C8], eax
		mov	eax, [bp+var_E8]
		add	[bp+var_C4], eax
		mov	eax, [bp+var_E4]
		add	[bp+var_C0], eax

loc_4DB7C:
		inc	[bp+var_7A]

loc_4DB7F:
		mov	ax, [bp+var_7A]
		cmp	ax, [bp+var_8]
		jge	short loc_4DB8A
		jmp	loc_4D95D

loc_4DB8A:
		pop	di
		pop	si
		leave
		retf
sub_4D6FB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4DB8E		proc far
		push	bp
		mov	bp, sp
		mov	word_7CE7A, 338h
		mov	word_7CE7A, 2E60h
		and	byte_7CEB8, 0FEh
		mov	word_7CE80, 0
		mov	word_7CE98, 0
		pop	bp
		retf
sub_4DB8E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4DBB0		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_4DC03
		cmp	byte ptr [si+5], 0
		jz	short loc_4DBDF
		cmp	dword ptr [si], 0
		jz	short loc_4DBDF
		push	0
		mov	al, [si+4]
		push	ax
		push	si
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_4DBDF

loc_4DBDF:
		mov	dword ptr [si], 0
		mov	byte ptr [si+5], 0
		mov	dword ptr [si+6], 0
		test	di, 1
		jz	short loc_4DC01
		push	si
		call	sub_3B2
		pop	cx
sub_4DBB0		endp

; START OF FUNCTION CHUNK FOR sub_4DBB0
		db 0EBh
; END OF FUNCTION CHUNK FOR sub_4DBB0
seg117		ends

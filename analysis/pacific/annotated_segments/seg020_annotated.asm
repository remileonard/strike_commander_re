seg020		segment	para public 'CODE' use16
		assume cs:seg020
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A032		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_A032		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A037		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_A037		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-15. Note de la manœuvre 3 (esquive) : 0 si la cible n'est pas un avion, si
; elle ne vise pas l'avion (word_7C7D7 > 20°), si elle n'est pas derrière (|word_7C7D3| <
; 150°) ou si elle est à plus de 2000 m. Niveau 2 : 0 si la dernière manœuvre finie était la 3
; ou au-delà de 1000 m, sinon 4. Autres niveaux : 5 à moins de 1000 m, sinon 4.
; ==============================================================================================
MVRS_ID3_ScoreJink_A03C		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		cmp	byte_7C7C2, 6
		jz	short loc_A04D

loc_A049:
		mov	al, 0
		jmp	short loc_A0BB

loc_A04D:
		cmp	word_7C7D7, 14h
		jg	short loc_A049
		mov	ax, word_7C7D3
		mov	[bp+var_2], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		cmp	ax, 96h
		jl	short loc_A049
		mov	eax, dword_7C7D9
		cmp	eax, dword_7C7DF
		jg	short loc_A049
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		cmp	byte ptr es:[bx+0B2h], 2
		jnz	short loc_A09F
		cmp	byte ptr es:[bx+19h], 3
		jz	short loc_A049
		mov	eax, dword_7C7DF
		mov	ebx, 2
		cdq
		idiv	ebx
		cmp	eax, dword_7C7D9
		jle	short loc_A049
		jmp	short loc_A0B9
		jmp	short loc_A049

loc_A09F:
		mov	eax, dword_7C7DF
		mov	ebx, 2
		cdq
		idiv	ebx
		cmp	eax, dword_7C7D9
		jle	short loc_A0B9
		mov	al, 5
		jmp	short loc_A0BB

loc_A0B9:
		mov	al, 4

loc_A0BB:
		leave
		retf
MVRS_ID3_ScoreJink_A03C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-15. Note de la manœuvre 5 (Immelmann) : 0 si la cible n'est pas un avion,
; au-dessus de 8333 m, si la vitesse est inférieure à champ 23 ÷ 2 + 2 × champ 24 du JDYN, si
; l'assiette sort de −10° à +20°, ou si les systèmes 4, 3 et 0 ont des dégâts (sub_415CD). 7
; de face à moins de 200 m (cible < 20° du nez, nez opposés > 160°). Sinon : + 3 sous 1000 m ;
; + 3 si la cible est à plus de 150° du nez, + 1 à plus de 90°.
; ==============================================================================================
MVRS_ID5_ScoreImmelmann_A0BD		proc far

var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		mov	[bp+var_1], 0
		cmp	byte_7C7C2, 6
		jz	short loc_A0D3

loc_A0CE:
		mov	al, 0
		jmp	loc_A1A6

loc_A0D3:
		mov	eax, dword_7C837
		cmp	eax, dword_7C7F7
		jg	short loc_A0CE
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx+0Bh]
		mov	ax, [bx+9Dh]
		cwd
		sub	ax, dx
		sar	ax, 1
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx+0Bh]
		mov	dx, [bx+9Fh]
		shl	dx, 1
		add	ax, dx
		cmp	ax, word_7C829
		ja	short loc_A0CE
		cmp	word_7C82D, 0FFF6h
		jl	short loc_A0CE
		cmp	word_7C82D, 14h
		jg	short loc_A0CE
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		push	large es:[bx+0DAh]
		call	sub_415CD
		add	sp, 4
		or	al, al
		jnz	short loc_A0CE
		cmp	dword_7C7D9, 0C8h
		jge	short loc_A161
		mov	ax, word_7C7D3
		mov	[bp+var_4], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		cmp	ax, 14h
		jge	short loc_A161
		mov	ax, word_7C7D5
		mov	[bp+var_6], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		cmp	ax, 0A0h
		jle	short loc_A161
		mov	al, 7
		jmp	short loc_A1A6

loc_A161:
		cmp	dword_7C837, 3E8h
		jge	short loc_A174
		mov	al, [bp+var_1]
		add	al, 3
		mov	[bp+var_1], al

loc_A174:
		mov	ax, word_7C7D3
		mov	[bp+var_8], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		cmp	ax, 96h
		jle	short loc_A18B
		mov	al, [bp+var_1]
		add	al, 3
		jmp	short loc_A1A0

loc_A18B:
		mov	ax, word_7C7D3
		mov	[bp+var_A], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		cmp	ax, 5Ah
		jle	short loc_A1A3
		mov	al, [bp+var_1]
		inc	al

loc_A1A0:
		mov	[bp+var_1], al

loc_A1A3:
		mov	al, [bp+var_1]

loc_A1A6:
		leave
		retf
MVRS_ID5_ScoreImmelmann_A0BD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-14. Note du nœud 7 (vol vers la cible) : 5 si la cible est un avion
; (byte_7C7C2 = 6), sinon 0. Pendant le tournoi, la direction voulue dword_7C811 vaut le nez
; (MVRS_SetupOwnState_9578) : la qualité de visée du nœud 22 prend un écart nul, il note 10 à
; moins de 2000 m et l'emporte sur ce 5.
; ==============================================================================================
MVRS_ID7_ScoreFollowTarget_A1A8		proc far
		push	bp
		mov	bp, sp
		cmp	byte_7C7C2, 6
		jz	short loc_A1B6
		mov	al, 0
		jmp	short loc_A1B8

loc_A1B6:
		mov	al, 5

loc_A1B8:
		pop	bp
		retf
MVRS_ID7_ScoreFollowTarget_A1A8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-15. Note de la manœuvre 14 : 0 si la dernière manœuvre finie est l'attaque
; au sol (19) ou sous pilote automatique ; 10 si l'avion pique sous le plancher de son niveau
; (word_7C804) ; sinon 0.
; ==============================================================================================
MVRS_ID14_ScoreGroundAvoid_A1BA		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		cmp	byte ptr es:[bx+19h], 13h
		jz	short loc_A211
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx+0Bh]
		cmp	byte ptr [bx+85h], 0FFh
		jz	short loc_A1E2
		mov	ax, 1
		jmp	short loc_A1E4

loc_A1E2:
		xor	ax, ax

loc_A1E4:
		or	al, al
		jnz	short loc_A211
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		mov	al, es:[bx+0B2h]
		cbw
		shl	ax, 1
		mov	bx, ax
		movzx	eax, word ptr [bx+60D4h]
		cmp	eax, dword_7C837
		jl	short loc_A211
		cmp	word_7C82D, 0
		jge	short loc_A211
		mov	al, 0Ah
		jmp	short loc_A213

loc_A211:
		mov	al, 0

loc_A213:
		pop	bp
		retf
MVRS_ID14_ScoreGroundAvoid_A1BA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-15. Note de la manœuvre 15 : 0 sous pilote automatique ; 10 si le bit 6 de
; [modèle+146] est posé, ou si l'avion monte plus lentement que le champ 24 du JDYN ; sinon 0.
; Le même test déclenche le réflexe 15 dans AI_TopLevelThink_B0C4.
; ==============================================================================================
MVRS_ID15_ScoreStallRecovery_A215		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx+0Bh]
		cmp	byte ptr [bx+85h], 0FFh
		jz	short loc_A22F
		mov	ax, 1
		jmp	short loc_A231

loc_A22F:
		xor	ax, ax

loc_A231:
		or	al, al
		jz	short loc_A239
		mov	al, 0
		jmp	short loc_A275

loc_A239:
		xor	dx, dx
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+92h]
		shr	ax, 6
		and	ax, 1
		or	al, al
		jnz	short loc_A270
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx+0Bh]
		mov	ax, [bx+9Fh]
		cmp	ax, word_7C829
		jbe	short loc_A273
		cmp	word_7C82D, 0
		jle	short loc_A273

loc_A270:
		mov	dx, 0Ah

loc_A273:
		mov	al, dl

loc_A275:
		pop	bp
		retf
MVRS_ID15_ScoreStallRecovery_A215		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-15. Note de la manœuvre 4 (dégagement en montée) : 0 si la cible n'est pas
; un avion ou au-dessus de 8333 m de hauteur ; 9 si la dernière manœuvre finie était la 6 ; 0
; si la cible est à moins de 90° du nez, ou si elle vise l'avion (< 90°) à moins de 2000 m.
; Dernière manœuvre 4 : 9 sous 1000 m, sinon + 3. Visée de la cible < 155° : + 1, sinon + 3.
; Sous le plancher du niveau : + 4, sinon sous 1000 m : + 2. Plafond 8.
; ==============================================================================================
MVRS_ID4_ScoreClimbAway_A277		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	cl, 0
		cmp	byte_7C7C2, 6
		jz	short loc_A28B

loc_A286:
		mov	al, 0
		jmp	loc_A331

loc_A28B:
		mov	eax, dword_7C837
		cmp	eax, dword_7C7F7
		jg	short loc_A286
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		cmp	byte ptr es:[bx+19h], 6
		jz	short loc_A2DF
		mov	ax, word_7C7D3
		mov	[bp+var_2], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		cmp	ax, 5Ah
		jl	short loc_A286
		cmp	word_7C7D7, 5Ah
		jge	short loc_A2C6
		mov	eax, dword_7C7D9
		cmp	eax, dword_7C7DF
		jl	short loc_A286

loc_A2C6:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		cmp	byte ptr es:[bx+19h], 4
		jnz	short loc_A2E6
		cmp	dword_7C837, 3E8h
		jge	short loc_A2E3

loc_A2DF:
		mov	al, 9
		jmp	short loc_A331

loc_A2E3:
		add	cl, 3

loc_A2E6:
		cmp	word_7C7D7, 9Bh
		jge	short loc_A2F2
		inc	cl
		jmp	short loc_A2F5

loc_A2F2:
		add	cl, 3

loc_A2F5:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		mov	al, es:[bx+0B2h]
		cbw
		shl	ax, 1
		mov	bx, ax
		movzx	eax, word ptr [bx+60D4h]
		cmp	eax, dword_7C837
		jle	short loc_A318
		add	cl, 4
		jmp	short loc_A326

loc_A318:
		cmp	dword_7C837, 3E8h
		jge	short loc_A326
		add	cl, 2

loc_A326:
		cmp	cl, 8
		jbe	short loc_A32F
		mov	al, 8
		jmp	short loc_A331

loc_A32F:
		mov	al, cl

loc_A331:
		leave
		retf
MVRS_ID4_ScoreClimbAway_A277		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-15. Note de la manœuvre 6 (split-S) : 0 si la cible n'est pas un avion, si
; elle ne vise pas l'avion (> 30°), au-delà de 1800 m, si l'assiette sort de −12° à +20°, si
; la dernière manœuvre finie n'est pas la 7, ou sous 2 × le plancher du niveau. Sinon : + 2 si
; la vitesse est inférieure à 2 × champ 24 du JDYN ; + 2 si la cible est à plus de 135° du nez
; ; + 4 à moins de 4000 m ; + 1 si l'octet +167 du JDYN ≥ 3 ; − 1 si l'octet +168 ≥ 3. Plafond
; 8.
; ==============================================================================================
MVRS_ID6_ScoreSplitS_A333		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		xor	cx, cx
		cmp	byte_7C7C2, 6
		jz	short loc_A347

loc_A342:
		mov	al, 0
		jmp	loc_A406

loc_A347:
		cmp	word_7C7D7, 1Eh
		jg	short loc_A342
		mov	eax, dword_7C7D9
		cmp	eax, dword_7C7EB
		jg	short loc_A342
		cmp	word_7C82D, 0FFF4h
		jl	short loc_A342
		cmp	word_7C82D, 14h
		jg	short loc_A342
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		cmp	byte ptr es:[bx+19h], 7
		jnz	short loc_A342
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		mov	al, es:[bx+0B2h]
		cbw
		shl	ax, 1
		mov	bx, ax
		mov	ax, [bx+60D4h]
		shl	ax, 1
		movzx	eax, ax
		cmp	eax, dword_7C837
		jg	short loc_A342
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx+0Bh]
		mov	ax, [bx+9Fh]
		shl	ax, 1
		cmp	ax, word_7C829
		jbe	short loc_A3B1
		add	cx, 2

loc_A3B1:
		mov	ax, word_7C7D3
		mov	[bp+var_2], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		cmp	ax, 87h
		jle	short loc_A3C4
		add	cx, 2

loc_A3C4:
		mov	eax, dword_7C7DF
		shl	eax, 1
		cmp	eax, dword_7C7D9
		jle	short loc_A3D5
		add	cx, 4

loc_A3D5:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx+0Bh]
		cmp	byte ptr [bx+0A7h], 3
		jb	short loc_A3E8
		inc	cx

loc_A3E8:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx+0Bh]
		cmp	byte ptr [bx+0A8h], 3
		jb	short loc_A3FB
		dec	cx

loc_A3FB:
		cmp	cx, 8
		jle	short loc_A404
MVRS_ID6_ScoreSplitS_A333		endp
seg020		ends

seg023		segment	para public 'CODE' use16
		assume cs:seg023
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 38h, 5, 0, 0, 0, 0, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05. Même rôle que Goal_SetObjective_A307 : refuse tout ordre si
; [entité+355] ≠ 0 ; liste de 21 ordres (word_C6E8, cibles à +42). 167, 173, 174, 175 : cible
; → [entité+291] (sub_39519), ordre → [entité+265]. 168 et 112 partagent un cas, 169 et 191 un
; autre ; 193 a le sien. Fin : Goal_IsComplete_C73C.
; ==============================================================================================
Goal_SetObjective_C2A8		proc far

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
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= dword ptr -1Eh
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 82h
		push	si
		push	di
		mov	di, [bp+arg_4]
		mov	si, [bp+arg_8]
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+163h]
		mov	ah, 0
		or	ax, ax
		jz	short loc_C2C8
		jmp	loc_C6C2

loc_C2C8:
		mov	[bp+var_20], di
		mov	cx, 15h
		mov	bx, offset word_C6E8

loc_C2D1:
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_20]
		jz	short loc_C2E1
		add	bx, 2
		loop	short loc_C2D1
		jmp	loc_C6B9

loc_C2E1:
		jmp	word ptr cs:[bx+2Ah] ; switch jump
		jmp	loc_C6C2

loc_C2E8:
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+109h], di
		mov	ax, [bp+arg_6]
		mov	[bp+var_2], ax
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 0FBh
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_39519
		add	sp, 6
		mov	ax, [bp+arg_6]
		mov	[bp+var_4], ax
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 123h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_39519
		add	sp, 6
		jmp	loc_C6C2

loc_C325:
		push	0
		mov	ax, word ptr [bp+arg_0]
		add	ax, 0FBh
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_39519
		add	sp, 6
		mov	eax, [si]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0FDh], eax
		mov	eax, [si+4]
		mov	es:[bx+101h], eax
		mov	eax, [si+8]
		mov	es:[bx+105h], eax
		mov	es:[bx+109h], di
		jmp	loc_C6C2

loc_C361:
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+109h], di
		jmp	loc_C6C2

loc_C36C:
		mov	dx, [bp+arg_A]
		mov	bx, dx
		mov	eax, [bx]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+117h], eax
		mov	bx, dx
		mov	eax, [bx+4]
		mov	bx, word ptr [bp+arg_0]
		mov	es:[bx+11Bh], eax
		mov	bx, dx
		mov	eax, [bx+8]
		mov	bx, word ptr [bp+arg_0]
		mov	es:[bx+11Fh], eax
		mov	eax, [si]
		mov	es:[bx+10Bh], eax
		mov	eax, [si+4]
		mov	es:[bx+10Fh], eax
		mov	eax, [si+8]
		mov	es:[bx+113h], eax
		mov	es:[bx+109h], di
		mov	si, [bp+arg_A]
		add	si, 4
		mov	eax, [si]
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		jmp	loc_C6AE

loc_C3D1:
		mov	dx, [bp+arg_A]
		mov	bx, dx
		mov	eax, [bx]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+10Bh], eax
		mov	bx, dx
		mov	eax, [bx+4]
		mov	bx, word ptr [bp+arg_0]
		mov	es:[bx+10Fh], eax
		mov	bx, dx
		mov	eax, [bx+8]
		mov	bx, word ptr [bp+arg_0]
		mov	es:[bx+113h], eax
		mov	es:[bx+109h], di
		mov	eax, [si]
		mov	es:[bx+117h], eax
		mov	eax, [si+4]
		mov	es:[bx+11Bh], eax
		mov	eax, [si+8]
		mov	es:[bx+11Fh], eax
		jmp	loc_C6C2

loc_C425:
		mov	ax, [bp+arg_A]
		mov	[bp+var_22], ax
		mov	[bp+var_26], 0
		mov	eax, [bp+var_26]
		mov	[bp+var_5E], eax
		mov	[bp+var_2A], 0BB800h
		mov	eax, [bp+var_2A]
		mov	[bp+var_5A], eax
		mov	[bp+var_2E], 3E800h
		mov	eax, [bp+var_2E]
		mov	[bp+var_56], eax
		mov	di, si
		mov	eax, [di]
		mov	[bp+var_52], eax
		mov	eax, [di+4]
		mov	[bp+var_4E], eax
		mov	eax, [di+8]
		mov	[bp+var_4A], eax
		lea	ax, [bp+var_82]
		push	ax
		call	Formation_ComputeGeometryHelper_58B0C
		pop	cx
		mov	di, [bp+var_22]
		add	di, 12h
		mov	eax, [di]
		mov	[bp+var_3A], eax
		mov	eax, [di+4]
		mov	[bp+var_36], eax
		mov	eax, [di+8]
		mov	[bp+var_32], eax
		mov	eax, [bp+var_3A]
		mov	[bp+var_46], eax
		mov	eax, [bp+var_36]
		mov	[bp+var_42], eax
		mov	eax, [bp+var_32]
		mov	[bp+var_3E], eax
		lea	ax, [bp+var_82]
		push	ax
		lea	ax, word ptr [bp+var_52]
		push	ax
		call	Matrix_WorldToLocal_5A569
		add	sp, 4
		lea	ax, [bp+var_82]
		push	ax
		lea	ax, word ptr [bp+var_5E]
		push	ax
		call	Matrix_WorldToLocal_5A569
		add	sp, 4
		mov	eax, [bp+var_52]
		add	[bp+var_46], eax
		mov	eax, [bp+var_4E]
		add	[bp+var_42], eax
		mov	eax, [bp+var_4A]
		add	[bp+var_3E], eax
		mov	eax, [bp+var_52]
		add	[bp+var_3A], eax
		mov	eax, [bp+var_4E]
		add	[bp+var_36], eax
		mov	eax, [bp+var_4A]
		add	[bp+var_32], eax
		mov	eax, [bp+var_5E]
		add	[bp+var_3A], eax
		mov	eax, [bp+var_5A]
		add	[bp+var_36], eax
		mov	eax, [bp+var_56]
		add	[bp+var_32], eax
		mov	eax, [bp+var_3A]
		mov	[si], eax
		mov	eax, [bp+var_36]
		mov	[si+4], eax
		mov	eax, [bp+var_32]
		mov	[si+8], eax
		les	bx, word ptr [bp+arg_0]
		mov	eax, [bp+var_46]
		mov	es:[bx+10Bh], eax
		mov	eax, [bp+var_42]
		mov	es:[bx+10Fh], eax
		mov	eax, [bp+var_3E]
		mov	es:[bx+113h], eax
		mov	word ptr es:[bx+109h], 0A2h
		jmp	loc_C6C2

loc_C560:
		mov	al, byte ptr [bp+arg_A]
		mov	byte ptr [bp+var_22], al
		push	1
		push	ax
		push	[bp+arg_6]
		push	large [bp+arg_0]
		call	sub_EA0E
		add	sp, 0Ah
		jmp	loc_C6C2

loc_C57B:
		mov	ax, [bp+arg_6]
		mov	[bp+var_A], ax
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 123h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_39519
		add	sp, 6
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+109h], di
		jmp	loc_C6C2

loc_C59F:
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+109h], di
		mov	di, si
		mov	eax, [di]
		mov	es:[bx+10Bh], eax
		mov	eax, [di+4]
		mov	es:[bx+10Fh], eax
		mov	eax, [di+8]
		mov	es:[bx+113h], eax
		mov	eax, [si]
		mov	es:[bx+0FDh], eax
		mov	eax, [si+4]
		mov	es:[bx+101h], eax
		mov	eax, [si+8]
		mov	es:[bx+105h], eax
		push	0
		mov	ax, word ptr [bp+arg_0]
		add	ax, 0FBh
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_39519
		add	sp, 6
		mov	bx, [bp+arg_A]
		mov	eax, [bx]
		sar	eax, 8
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+125h], eax
		mov	si, [bp+arg_A]
		add	si, 4
		mov	eax, [si]
		mov	[bp+var_E], eax
		mov	eax, [bp+var_E]
		mov	es:[bx+12Dh], eax
		mov	si, [bp+arg_A]
		add	si, 8
		mov	eax, [si]
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		mov	es:[bx+129h], eax
		jmp	loc_C6C2

loc_C63B:
		mov	eax, [si]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+136h], eax
		mov	eax, [si+4]
		mov	es:[bx+13Ah], eax
		mov	eax, [si+8]
		mov	es:[bx+13Eh], eax
		jmp	short loc_C6C2

loc_C65D:
		add	si, 8
		mov	eax, [si]
		mov	[bp+var_16], eax
		mov	eax, [bp+var_16]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+129h], eax
		jmp	short loc_C6C2

loc_C676:
		mov	ax, [bp+arg_6]
		mov	[bp+var_18], ax
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 131h
		jmp	short loc_C692

loc_C685:
		mov	ax, [bp+arg_6]
		mov	[bp+var_1A], ax
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 133h

loc_C692:
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_39519
		add	sp, 6
		jmp	short loc_C6C2

loc_C6A0:
		add	si, 4
		mov	eax, [si]
		mov	[bp+var_1E], eax
		mov	eax, [bp+var_1E]

loc_C6AE:
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+12Dh], eax
		jmp	short loc_C6C2

loc_C6B9:
		push	801Ah
		call	sub_1DDFE
		pop	cx

loc_C6C2:
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+163h], 0
		jnz	short loc_C6DD
		push	word ptr [bp+arg_0+2]
		push	bx
		nop
		push	cs
		call	near ptr Goal_IsComplete_C73C
		add	sp, 4
		or	al, al
		jz	short loc_C6E2

loc_C6DD:
		mov	ax, 1
		jmp	short loc_C6E4

loc_C6E2:
		xor	ax, ax

loc_C6E4:
		pop	di
		pop	si
		leave
		retf
Goal_SetObjective_C2A8		endp

; START OF FUNCTION CHUNK FOR Goal_SetObjective_C2A8
word_C6E8	dw 70h
		dw 0A1h
		dw 0A2h
		dw 0A4h
		dw 0A5h
		dw 0A7h
		dw 0A8h
		dw 0A9h
		dw 0AAh
		dw 0ABh
		dw 0ACh
		dw 0ADh
		dw 0AEh
		dw 0AFh
		dw 0B1h
		dw 0B2h
		dw 0B3h
		dw 0B4h
		dw 0B5h
		dw 0BFh
		dw 0C1h
off_C712	dw offset loc_C2E8
		dw offset loc_C361
		dw offset loc_C3D1
		dw offset loc_C36C
		dw offset loc_C36C
		dw offset loc_C57B
		dw offset loc_C2E8
		dw offset loc_C325
		dw offset loc_C6C2
		dw offset loc_C560
		dw offset loc_C59F
		dw offset loc_C57B
		dw offset loc_C57B
		dw offset loc_C57B
		dw offset loc_C65D
		dw offset loc_C6A0
		dw offset loc_C676
		dw offset loc_C63B
		dw offset loc_C685
		dw offset loc_C325
		dw offset loc_C425
; END OF FUNCTION CHUNK FOR Goal_SetObjective_C2A8

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05. Selon [entité+265] (liste de 15 valeurs, word_C8E0) : 167, 173, 174 et
; 175 partagent un cas, 112 et 168 un autre.
; ==============================================================================================
Goal_IsComplete_C73C		proc far

var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 28h
		push	si
		mov	[bp+var_1], 0
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+109h]
		mov	[bp+var_4], ax
		mov	cx, 0Fh
		mov	bx, offset word_C8E0

loc_C758:
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_4]
		jz	short loc_C768
		add	bx, 2
		loop	short loc_C758
		jmp	loc_C8D1

loc_C768:
		jmp	word ptr cs:[bx+1Eh] ; switch jump

loc_C76C:
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	bx, [bx]
		mov	al, [bx+20h]
		mov	ah, 0

loc_C77A:
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	[bp+var_1], al
		jmp	loc_C8DA

loc_C785:
		mov	[bp+var_1], 0
		jmp	loc_C8DA

loc_C78C:
		jmp	loc_C881

loc_C78F:
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_C7A5
		les	bx, es:[bx+0Dh]
		cmp	byte ptr es:[bx+0Ch], 11h
		jz	short loc_C7C2

loc_C7A5:
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	bx, [bx]
		cmp	byte ptr [bx+20h], 0
		jnz	short loc_C7C2
		mov	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+15h], 0
		jz	short loc_C7C2
		jmp	loc_C8CA

loc_C7C2:
		mov	ax, 1
		jmp	loc_C8CC
		jmp	loc_C8CA

loc_C7CB:
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+19h], 12h
		jnz	short loc_C7D8
		jmp	loc_C8CA

loc_C7D8:
		jmp	short loc_C7C2
		jmp	loc_C8CA

loc_C7DD:
		les	bx, [bp+arg_0]
		mov	si, es:[bx+0D4h]
		add	si, 12h
		mov	eax, [si]
		mov	[bp+var_1C], eax
		mov	eax, [si+4]
		mov	[bp+var_18], eax
		mov	eax, [si+8]
		mov	[bp+var_14], eax
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 10Bh
		mov	[bp+var_6], ax
		mov	[bp+var_8], dx
		les	si, [bp+var_8]
		mov	eax, es:[si]
		mov	[bp+var_28], eax
		mov	eax, es:[si+4]
		mov	[bp+var_24], eax
		mov	eax, es:[si+8]
		mov	[bp+var_20], eax
		mov	eax, [bp+var_28]
		sub	[bp+var_1C], eax
		mov	eax, [bp+var_24]
		sub	[bp+var_18], eax
		mov	eax, [bp+var_20]
		sub	[bp+var_14], eax
		mov	[bp+var_14], 0
		push	large [bp+var_14]
		push	large [bp+var_18]
		push	large [bp+var_1C]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_C], eax
		mov	[bp+var_10], eax
		cmp	[bp+var_10], 1F400h
		jle	short loc_C87B
		mov	ax, 1
		jmp	short loc_C87D

loc_C87B:
		xor	ax, ax

loc_C87D:
		or	al, al
		jz	short loc_C8DA

loc_C881:
		mov	[bp+var_1], 1
		jmp	short loc_C8DA

loc_C887:
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0D4h]
		cmp	byte ptr [bx+51h], 1
		jnz	short loc_C89F
		mov	dx, word_79B93
		sub	dx, word_79B95
		jmp	short loc_C8A7

loc_C89F:
		mov	dx, word_79B8F
		sub	dx, word_79B91

loc_C8A7:
		mov	ax, dx
		jmp	loc_C77A

loc_C8AC:
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+123h], 0
		jz	short loc_C8CA
		jmp	loc_C7C2
		jmp	short loc_C8CA

loc_C8BC:
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+123h], 0
		jz	short loc_C8CA
		jmp	loc_C7C2

loc_C8CA:
		xor	ax, ax

loc_C8CC:
		mov	[bp+var_1], al
		jmp	short loc_C8DA

loc_C8D1:
		push	801Bh
		call	sub_1DDFE
		pop	cx

loc_C8DA:
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
Goal_IsComplete_C73C		endp

; START OF FUNCTION CHUNK FOR Goal_IsComplete_C73C
word_C8E0	dw 0FFFFh
		dw 70h
		dw 0A1h
		dw 0A2h
		dw 0A4h
		dw 0A5h
		dw 0A7h
		dw 0A8h
		dw 0A9h
		dw 0AAh
		dw 0ACh
		dw 0ADh
		dw 0AEh
		dw 0AFh
		dw 0BFh
off_C8FE	dw offset loc_C76C
		dw offset loc_C8AC
		dw offset loc_C78F
		dw offset loc_C7CB
		dw offset loc_C7DD
		dw offset loc_C7DD
		dw offset loc_C8BC
		dw offset loc_C8AC
		dw offset loc_C887
		dw offset loc_C785
		dw offset loc_C78C
		dw offset loc_C8BC
		dw offset loc_C8BC
		dw offset loc_C8BC
		dw offset loc_C78C
; END OF FUNCTION CHUNK FOR Goal_IsComplete_C73C

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-13. Gestionnaire GOAL 7 (propre à Pacific Strike). Si l'octet « en
; formation » [entité+357] est non nul : Goal_FollowLeader_C93E et renvoie son résultat ;
; sinon renvoie 0.
; ==============================================================================================
Goal_FollowLeaderInFormation_C91C		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	dl, 0
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+165h], 0
		jz	short loc_C93A
		push	[bp+arg_2]
		push	bx
		nop
		push	cs
		call	near ptr Goal_FollowLeader_C93E
		add	sp, 4
		mov	dl, al

loc_C93A:
		mov	al, dl
		pop	bp
		retf
Goal_FollowLeaderInFormation_C91C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-13. Gestionnaire GOAL 8 (propre à Pacific Strike). Chef = [entité+305],
; rangé par l'ordre 179 (Goal_SetObjective_C2A8, cas loc_C676), que le chargeur de mission
; passe avec l'allié par défaut du PART (seg125, push 0B3h). Pas de chef : renvoie 0. Chef
; détruit (bit 5 de l'octet +146 de son objet monde) : chef effacé, renvoie 0. Sinon
; sub_FA7E(entité), puis si [entité+353] = 0 : comportement en cours [entité+13] (méthode +12)
; ou sub_D2AC(entité) (lit le chef, probable vol en formation, non lue) ; renvoie 1.
; ==============================================================================================
Goal_FollowLeader_C93E		proc far

var_1		= byte ptr -1
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	[bp+var_1], 1
		les	bx, word ptr [bp+arg_0]
		cmp	word ptr es:[bx+131h], 0
		jnz	short loc_C95A
		mov	[bp+var_1], 0
		jmp	loc_C9DF

loc_C95A:
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+131h]
		push	word ptr [bx+52h]
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+131h]
		mov	bx, [bx+52h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	bx, ax
		mov	al, [bx+92h]
		shr	ax, 5
		and	ax, 1
		or	al, al
		jz	short loc_C9A0
		mov	[bp+var_1], 0
		push	0
		mov	ax, word ptr [bp+arg_0]
		add	ax, 131h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_39519
		add	sp, 6
		jmp	short loc_C9DF

loc_C9A0:
		push	large [bp+arg_0]
		call	sub_FA7E
		add	sp, 4
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+161h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_C9DF
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_C9D3
		push	large es:[bx+0Dh]
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		jmp	short loc_C9DC

loc_C9D3:
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_D2AC

loc_C9DC:
		add	sp, 4

loc_C9DF:
		mov	al, [bp+var_1]
		leave
		retf
Goal_FollowLeader_C93E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05. Traitement de l'ordre en cours [entité+265] (liste de 14 valeurs,
; word_CFC9) : 174 = cas de 167, 175 = cas de 173. Cible au sol (octet +23 = 2) : demande au
; nœud d'attaque au sol [entité+196] (méthodes +4 puis +8) avec le mode 0 (167, 174) ou 1
; (173, 175) ; autre cible : sub_B968 pour 167/174, échec pour 173/175.
; ==============================================================================================
Goal_ExecuteObjective_C9E4		proc far

var_46		= dword ptr -46h
var_42		= dword ptr -42h
var_3E		= dword ptr -3Eh
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2E		= word ptr -2Eh
var_2C		= word ptr -2Ch
var_2A		= word ptr -2Ah
var_28		= dword ptr -28h
var_24		= byte ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= dword ptr -1Eh
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 46h
		push	si
		push	large [bp+arg_0]
		push	cs
		call	near ptr Goal_IsComplete_C73C
		add	sp, 4
		mov	[bp+var_1], al
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+163h], 0
		jnz	short loc_CA07
		jmp	loc_CB2D

loc_CA07:
		mov	[bp+var_1], 1
		mov	al, es:[bx+135h]
		mov	ah, 0
		cmp	ax, 3
		jz	short loc_CA70
		les	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_CA3A

loc_CA22:
		les	bx, word ptr [bp+arg_0]
		push	large es:[bx+0Dh]
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]

loc_CA34:
		add	sp, 4
		jmp	loc_CB1C

loc_CA3A:
		mov	[bp+var_2E], 0
		xor	ax, ax
		mov	[bp+var_2A], ax
		mov	[bp+var_2C], ax
		mov	[bp+var_C], 200h
		mov	eax, [bp+var_C]
		mov	[bp+var_28], eax
		mov	[bp+var_24], 0
		lea	ax, [bp+var_2E]
		push	ax
		les	bx, word ptr [bp+arg_0]
		push	large es:[bx+0C0h]
		les	bx, es:[bx+0C0h]
		jmp	loc_CB05

loc_CA70:
		les	bx, word ptr [bp+arg_0]
		cmp	word ptr es:[bx+1F3h], 0
		jnz	short loc_CA84
		mov	byte ptr es:[bx+163h], 0
		jmp	loc_CB1C

loc_CA84:
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+1F3h]
		mov	bx, es:[bx+1F3h]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	[bp+var_4], dx
		mov	[bp+var_6], ax
		les	bx, [bp+var_6]
		cmp	byte ptr es:[bx+17h], 2
		jnz	short loc_CB10
		les	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_CAB4
		jmp	loc_CA22

loc_CAB4:
		mov	[bp+var_2E], 0
		xor	ax, ax
		mov	[bp+var_2A], ax
		mov	[bp+var_2C], ax
		mov	[bp+var_C], 200h
		mov	eax, [bp+var_C]
		mov	[bp+var_28], eax
		mov	[bp+var_24], 0
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+1F3h]
		mov	word ptr [bp+var_E], ax
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 1F1h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_39519
		add	sp, 6
		lea	ax, [bp+var_2E]
		push	ax
		les	bx, word ptr [bp+arg_0]
		push	large es:[bx+0C4h]
		les	bx, es:[bx+0C4h]

loc_CB05:
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 6
		jmp	short loc_CB1C

loc_CB10:
		push	large [bp+arg_0]
		call	sub_E009
		jmp	loc_CA34

loc_CB1C:
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+163h], 0
		jnz	short loc_CB2A
		jmp	loc_CFC3

loc_CB2A:
		jmp	loc_CFC3

loc_CB2D:
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0D4h]
		cmp	byte ptr [bx+51h], 0FFh
		jnz	short loc_CB40
		mov	ax, 1
		jmp	short loc_CB42

loc_CB40:
		xor	ax, ax

loc_CB42:
		mov	dl, al
		cmp	[bp+var_1], 0
		jnz	short loc_CB4D
		jmp	loc_CFC3

loc_CB4D:
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+109h]
		mov	[bp+var_8], ax
		mov	cx, 0Eh
		mov	bx, offset word_CFC9

loc_CB5E:
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_8]
		jz	short loc_CB6E
		add	bx, 2
		loop	short loc_CB5E
		jmp	loc_CFBA

loc_CB6E:
		jmp	word ptr cs:[bx+1Ch] ; switch jump

loc_CB72:
		or	dl, dl
		jz	short loc_CB7B
		mov	byte ptr dword_776AF, 1

loc_CB7B:
		les	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_CB9E

loc_CB86:
		les	bx, word ptr [bp+arg_0]
		push	large es:[bx+0Dh]
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]

loc_CB98:
		add	sp, 4
		jmp	loc_CFC3

loc_CB9E:
		push	large [bp+arg_0]
		call	AI_BehaviorStateMachine_B968
		add	sp, 4
		mov	[bp+var_1], al
		mov	ah, 0
		or	ax, ax
		jnz	short loc_CBCB
		push	large [bp+arg_0]
		call	sub_B4D4
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jz	short loc_CBC8
		jmp	loc_CFC3

loc_CBC8:
		jmp	loc_CC56

loc_CBCB:
		les	bx, word ptr [bp+arg_0]
		cmp	word ptr es:[bx+1F1h], 0
		jnz	short loc_CBD9
		jmp	loc_CFC3

loc_CBD9:
		mov	ax, es:[bx+1F1h]
		mov	word ptr [bp+var_C+2], ax
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 123h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_39519
		jmp	loc_CFB5

loc_CBF4:
		push	large [bp+arg_0]
		call	sub_DB46
		jmp	loc_CD16

loc_CC00:
		push	large [bp+arg_0]
		call	sub_B4D4
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jz	short loc_CC15
		jmp	loc_CFC3

loc_CC15:
		jmp	short loc_CC56

loc_CC17:
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_D5E4
		jmp	loc_CB98

loc_CC23:
		or	dl, dl
		jz	short loc_CC2C
		mov	byte ptr dword_776AF, 1

loc_CC2C:
		push	large [bp+arg_0]
		call	sub_B4D4
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jz	short loc_CC41
		jmp	loc_CFC3

loc_CC41:
		push	large [bp+arg_0]
		call	AI_BehaviorStateMachine_B968
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jz	short loc_CC56
		jmp	loc_CFC3

loc_CC56:
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr Goal_WanderRandom_D001
		jmp	loc_CB98

loc_CC62:
		or	dl, dl
		jz	short loc_CC6B
		mov	byte ptr dword_776AF, 1

loc_CC6B:
		mov	[bp+var_E], 0
		les	bx, word ptr [bp+arg_0]
		cmp	word ptr es:[bx+123h], 0
		jz	short loc_CC93
		push	word ptr es:[bx+123h]
		mov	bx, es:[bx+123h]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_C], dx
		mov	word ptr [bp+var_E], ax

loc_CC93:
		les	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_CCA1
		jmp	loc_CB86

loc_CCA1:
		cmp	[bp+var_E], 0
		jz	short loc_CD0D
		les	bx, word ptr [bp+var_E]
		cmp	byte ptr es:[bx+17h], 2
		jnz	short loc_CD0D
		mov	[bp+var_2E], 0
		xor	ax, ax
		mov	[bp+var_2A], ax
		mov	[bp+var_2C], ax
		mov	[bp+var_12], 200h
		mov	eax, [bp+var_12]
		mov	[bp+var_28], eax
		mov	[bp+var_24], 0
		lea	ax, [bp+var_2E]
		push	ax
		les	bx, word ptr [bp+arg_0]
		push	large es:[bx+0C4h]
		les	bx, es:[bx+0C4h]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6
		or	al, al
		jnz	short loc_CCF5
		jmp	loc_CDB0

loc_CCF5:
		lea	ax, [bp+var_2E]

loc_CCF8:
		push	ax
		les	bx, word ptr [bp+arg_0]
		push	large es:[bx+0C4h]
		les	bx, es:[bx+0C4h]
		jmp	loc_CFAF
		jmp	loc_CDB0

loc_CD0D:
		push	large [bp+arg_0]
		call	AI_BehaviorStateMachine_B968

loc_CD16:
		add	sp, 4
		mov	[bp+var_1], al
		jmp	loc_CFC3

loc_CD1F:
		mov	[bp+var_2E], 0
		xor	ax, ax
		mov	[bp+var_2A], ax
		mov	[bp+var_2C], ax
		mov	[bp+var_12], 200h
		mov	eax, [bp+var_12]
		mov	[bp+var_28], eax
		mov	[bp+var_24], 0
		mov	[bp+var_16], 0
		les	bx, word ptr [bp+arg_0]
		cmp	word ptr es:[bx+123h], 0
		jz	short loc_CD68
		push	word ptr es:[bx+123h]
		mov	bx, es:[bx+123h]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_16+2], dx
		mov	word ptr [bp+var_16], ax

loc_CD68:
		les	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_CD76
		jmp	loc_CB86

loc_CD76:
		cmp	[bp+var_16], 0
		jz	short loc_CDB0
		les	bx, word ptr [bp+var_16]
		cmp	byte ptr es:[bx+17h], 2
		jnz	short loc_CDB0
		mov	[bp+var_24], 1
		lea	ax, [bp+var_2E]
		push	ax
		les	bx, word ptr [bp+arg_0]
		push	large es:[bx+0C4h]
		les	bx, es:[bx+0C4h]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6
		or	al, al
		jz	short loc_CDB0
		lea	ax, [bp+var_2E]
		jmp	loc_CCF8

loc_CDB0:
		mov	[bp+var_1], 0
		jmp	loc_CFC3

loc_CDB7:
		les	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_CDC5
		jmp	loc_CB86

loc_CDC5:
		mov	[bp+var_2E], 0
		xor	ax, ax
		mov	[bp+var_2A], ax
		mov	[bp+var_2C], ax
		mov	[bp+var_12], 200h
		mov	eax, [bp+var_12]
		mov	[bp+var_28], eax
		mov	[bp+var_24], 0
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 10Bh
		mov	word ptr [bp+var_16+2], ax
		mov	word ptr [bp+var_16], dx
		les	si, word ptr [bp+var_16]
		mov	eax, es:[si]
		mov	[bp+var_3A], eax
		mov	eax, es:[si+4]
		mov	[bp+var_36], eax
		mov	eax, es:[si+8]
		mov	[bp+var_32], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 117h
		mov	[bp+var_18], ax
		mov	[bp+var_1A], dx
		les	si, [bp+var_1A]
		mov	eax, es:[si]
		mov	[bp+var_46], eax
		mov	eax, es:[si+4]
		mov	[bp+var_42], eax
		mov	eax, es:[si+8]
		mov	[bp+var_3E], eax
		lea	ax, word ptr [bp+var_3A]
		mov	[bp+var_2C], ax
		lea	ax, word ptr [bp+var_46]
		mov	[bp+var_2A], ax
		les	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+11h], 0
		jnz	short loc_CEB6
		mov	eax, [bp+arg_0]
		mov	[bp+var_1E], eax
		push	1
		push	0
		push	2
		push	large 98h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_20], dx
		mov	[bp+var_22], ax
		or	ax, dx
		jz	short loc_CEA5
		push	large [bp+var_1E]
		push	dx
		push	[bp+var_22]
		call	sub_10323
		add	sp, 8
		les	bx, [bp+var_22]
		mov	word ptr es:[bx], 54Eh
		mov	byte ptr es:[bx+0Ch], 12h
		mov	dx, [bp+var_20]
		mov	ax, [bp+var_22]
		jmp	short loc_CEAB

loc_CEA5:
		mov	dx, [bp+var_20]
		mov	ax, [bp+var_22]

loc_CEAB:
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+13h], dx
		mov	es:[bx+11h], ax

loc_CEB6:
		lea	ax, [bp+var_2E]
		push	ax
		les	bx, word ptr [bp+arg_0]
		push	large es:[bx+11h]
		les	bx, es:[bx+11h]
		jmp	loc_CFAF

loc_CEC9:
		les	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_CED7
		jmp	loc_CB86

loc_CED7:
		mov	[bp+var_2E], 0
		xor	ax, ax
		mov	[bp+var_2A], ax
		mov	[bp+var_2C], ax
		mov	[bp+var_12], 200h
		mov	eax, [bp+var_12]
		mov	[bp+var_28], eax
		mov	[bp+var_24], 0
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+0D4h]
		mov	bx, es:[bx+0D4h]
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
		lea	ax, word ptr [bp+var_3A]
		mov	[bp+var_2A], ax
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+0D4h]
		add	ax, 12h
		mov	[bp+var_2C], ax
		cmp	dword ptr es:[bx+15h], 0
		jnz	short loc_CF9F
		mov	eax, [bp+arg_0]
		mov	[bp+var_16], eax
		push	1
		push	0
		push	2
		push	large 45h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_18], dx
		mov	[bp+var_1A], ax
		or	ax, dx
		jz	short loc_CF8E
		push	large [bp+var_16]
		push	dx
		push	[bp+var_1A]
		call	sub_10323
		add	sp, 8
		les	bx, [bp+var_1A]
		mov	word ptr es:[bx], 53Eh
		mov	byte ptr es:[bx+0Ch], 11h
		mov	dx, [bp+var_18]
		mov	ax, [bp+var_1A]
		jmp	short loc_CF94

loc_CF8E:
		mov	dx, [bp+var_18]
		mov	ax, [bp+var_1A]

loc_CF94:
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+17h], dx
		mov	es:[bx+15h], ax

loc_CF9F:
		lea	ax, [bp+var_2E]
		push	ax
		les	bx, word ptr [bp+arg_0]
		push	large es:[bx+15h]
		les	bx, es:[bx+15h]

loc_CFAF:
		mov	bx, es:[bx]
		call	dword ptr [bx+8]

loc_CFB5:
		add	sp, 6
		jmp	short loc_CFC3

loc_CFBA:
		push	801Ch
		call	sub_1DDFE
		pop	cx

loc_CFC3:
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
Goal_ExecuteObjective_C9E4		endp

; START OF FUNCTION CHUNK FOR Goal_ExecuteObjective_C9E4
word_CFC9	dw 0FFFFh
		dw 0A1h
		dw 0A2h
		dw 0A4h
		dw 0A5h
		dw 0A7h
		dw 0A8h
		dw 0A9h
		dw 0AAh
		dw 0ACh
		dw 0ADh
		dw 0AEh
		dw 0AFh
		dw 0BFh
off_CFE5	dw offset loc_CC00
		dw offset loc_CEC9
		dw offset loc_CDB7
		dw offset loc_CC17
		dw offset loc_CC17
		dw offset loc_CC62
		dw offset loc_CC23
		dw offset loc_CC23
		dw offset loc_CBF4
		dw offset loc_CB72
		dw offset loc_CD1F
		dw offset loc_CC62
		dw offset loc_CD1F
		dw offset loc_CC00
; END OF FUNCTION CHUNK FOR Goal_ExecuteObjective_C9E4

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-13. Gestionnaire GOAL 3 : même algorithme que Goal_WanderRandom de STRIKE.
; Comportement en cours : sa méthode +12. Sinon, sauf si le nœud de navigation [entité+7] n'a
; pas atteint son point (+26 = 0) et que le dernier comportement est le 21 : direction =
; normalise(rand()%20000 − 10000, rand()%20000 − 10000, 0), point = moi + direction × 30000 m
; dans le plan, altitude = moi + borne(sol sous moi + [entité+297] − mon altitude, ±1000 m) ;
; vitesse = direction × [entité+301]. [entité+297] et [entité+301] sont posés par les ordres
; 177 et 178 de Goal_SetObjective_C2A8. Lance le nœud [entité+192] (méthode +8). Renvoie
; toujours 1. Différence relevée : pas de minuteur de 30 s (seulement 2 s, 200h).
; ==============================================================================================
Goal_WanderRandom_D001		proc far

var_68		= dword ptr -68h
var_64		= dword ptr -64h
var_60		= dword ptr -60h
var_5C		= dword ptr -5Ch
var_58		= dword ptr -58h
var_54		= dword ptr -54h
var_50		= dword ptr -50h
var_4C		= dword ptr -4Ch
var_48		= dword ptr -48h
var_44		= word ptr -44h
var_42		= word ptr -42h
var_40		= word ptr -40h
var_3E		= dword ptr -3Eh
var_3A		= byte ptr -3Ah
var_38		= dword ptr -38h
var_34		= word ptr -34h
var_32		= word ptr -32h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
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
		sub	sp, 68h
		push	si
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_D028
		push	large es:[bx+0Dh]
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		jmp	loc_D2A7

loc_D028:
		mov	[bp+var_44], 0
		xor	ax, ax
		mov	[bp+var_40], ax
		mov	[bp+var_42], ax
		mov	[bp+var_4], 200h
		mov	eax, [bp+var_4]
		mov	[bp+var_3E], eax
		mov	[bp+var_3A], 0
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		cmp	byte ptr es:[bx+1Ah], 0
		jnz	short loc_D064
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+19h], 15h
		jnz	short loc_D064
		jmp	loc_D28C

loc_D064:
		call	CRT_Rand
		mov	bx, 4E20h
		cwd
		idiv	bx
		add	dx, 0D8F0h
		movsx	eax, dx
		mov	[bp+var_8], eax
		shl	eax, 8
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_50], eax
		call	CRT_Rand
		mov	bx, 4E20h
		cwd
		idiv	bx
		add	dx, 0D8F0h
		movsx	eax, dx
		mov	[bp+var_10], eax
		shl	eax, 8
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_4C], eax
		mov	[bp+var_48], 0
		lea	ax, word ptr [bp+var_50]
		push	ax
		call	Vector_NormalizeInPlace_57715
		pop	cx
		mov	eax, [bp+var_50]
		mov	[bp+var_5C], eax
		mov	eax, [bp+var_4C]
		mov	[bp+var_58], eax
		mov	eax, [bp+var_48]
		mov	[bp+var_54], eax
		mov	[bp+var_18], 753000h
		mov	eax, [bp+var_50]
		mov	edx, [bp+var_18]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_50], eax
		mov	eax, [bp+var_4C]
		mov	edx, [bp+var_18]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_48]
		mov	edx, [bp+var_18]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_48], eax
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 129h
		mov	[bp+var_1A], ax
		mov	[bp+var_1C], dx
		les	bx, [bp+var_1C]
		mov	eax, es:[bx]
		mov	[bp+var_20], eax
		mov	eax, [bp+var_20]
		mov	[bp+var_48], eax
		push	0
		mov	[bp+var_24], 0
		mov	eax, [bp+var_24]
		mov	[bp+var_68], eax
		mov	[bp+var_28], 0
		mov	eax, [bp+var_28]
		mov	[bp+var_64], eax
		mov	[bp+var_2C], 100h
		mov	eax, [bp+var_2C]
		mov	[bp+var_60], eax
		lea	ax, word ptr [bp+var_68]
		push	ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+0D4h]
		add	ax, 12h
		push	ax
		push	word_79788
		push	ss
		lea	ax, word ptr [bp+var_30]
		push	ax
		call	Ground_HeightUnderPoint_3664D
		add	sp, 0Ch
		mov	eax, [bp+var_30]
		add	[bp+var_48], eax
		les	bx, [bp+arg_0]
		mov	si, es:[bx+0D4h]
		add	si, 1Ah
		mov	eax, [si]
		sub	[bp+var_48], eax
		cmp	[bp+var_48], 0FFFC1800h
		jge	short loc_D1C4
		mov	[bp+var_48], 0FFFC1800h
		jmp	short loc_D1D6

loc_D1C4:
		cmp	[bp+var_48], 3E800h
		jle	short loc_D1D6
		mov	[bp+var_48], 3E800h

loc_D1D6:
		les	bx, [bp+arg_0]
		mov	si, es:[bx+0D4h]
		add	si, 12h
		mov	eax, [si]
		add	[bp+var_50], eax
		mov	eax, [si+4]
		add	[bp+var_4C], eax
		mov	eax, [si+8]
		add	[bp+var_48], eax
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 12Dh
		mov	[bp+var_32], ax
		mov	[bp+var_34], dx
		les	bx, [bp+var_34]
		mov	eax, es:[bx]
		mov	[bp+var_38], eax
		mov	eax, [bp+var_5C]
		mov	edx, [bp+var_38]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_5C], eax
		mov	eax, [bp+var_58]
		mov	edx, [bp+var_38]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_58], eax
		mov	eax, [bp+var_54]
		mov	edx, [bp+var_38]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_54], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	eax, [bp+var_50]
		mov	es:[bx+2], eax
		mov	eax, [bp+var_4C]
		mov	es:[bx+6], eax
		mov	eax, [bp+var_48]
		mov	es:[bx+0Ah], eax
		mov	eax, [bp+var_5C]
		mov	es:[bx+0Eh], eax
		mov	eax, [bp+var_58]
		mov	es:[bx+12h], eax
		mov	eax, [bp+var_54]
		mov	es:[bx+16h], eax

loc_D28C:
		lea	ax, [bp+var_44]
		push	ax
		les	bx, [bp+arg_0]
		push	large es:[bx+0C0h]
		les	bx, es:[bx+0C0h]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 6

loc_D2A7:
		mov	al, 1
		pop	si
		leave
		retf
Goal_WanderRandom_D001		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D2AC		proc far

var_78		= dword ptr -78h
var_74		= dword ptr -74h
var_70		= dword ptr -70h
var_6C		= dword ptr -6Ch
var_68		= dword ptr -68h
var_66		= dword ptr -66h
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
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_2C		= word ptr -2Ch
var_2A		= dword ptr -2Ah
var_26		= byte ptr -26h
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
		sub	sp, 78h
		push	si
		push	di
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_D2D4
		push	large es:[bx+0Dh]
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		jmp	loc_D5E0

loc_D2D4:
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+131h]
		push	word ptr [bx+52h]
		mov	bx, [bp+arg_0]
		mov	bx, es:[bx+131h]
		mov	bx, [bx+52h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	bx, ax
		mov	al, [bx+92h]
		shr	ax, 5
		and	ax, 1
		or	al, al
		jz	short loc_D314
		push	0
		mov	ax, [bp+arg_0]
		add	ax, 131h
		push	[bp+arg_2]
		push	ax
		call	sub_39519
		jmp	loc_D5DD

loc_D314:
		mov	[bp+var_30], 0
		xor	ax, ax
		mov	[bp+var_2C], ax
		mov	[bp+var_2E], ax
		mov	[bp+var_4], 200h
		mov	eax, [bp+var_4]
		mov	[bp+var_2A], eax
		mov	[bp+var_26], 0
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+131h], 0
		jnz	short loc_D349
		push	801Dh
		call	sub_1DDFE
		pop	cx

loc_D349:
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+131h]
		mov	bx, es:[bx+131h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	si, ax
		mov	eax, [si]
		mov	[bp+var_3C], eax
		mov	eax, [si+4]
		mov	[bp+var_38], eax
		mov	eax, [si+8]
		mov	[bp+var_34], eax
		les	bx, [bp+arg_0]
		mov	si, es:[bx+131h]
		add	si, 12h
		mov	eax, [si]
		mov	[bp+var_48], eax
		mov	eax, [si+4]
		mov	[bp+var_44], eax
		mov	eax, [si+8]
		mov	[bp+var_40], eax
		mov	[bp+var_8], eax
		mov	ax, es:[bx+131h]
		cmp	ax, word_7CADA
		jnz	short loc_D3AF
		mov	eax, dword_776A2
		jmp	short loc_D3FE

loc_D3AF:
		push	0
		mov	[bp+var_C], 0
		mov	eax, [bp+var_C]
		mov	[bp+var_54], eax
		mov	[bp+var_10], 0
		mov	eax, [bp+var_10]
		mov	[bp+var_50], eax
		mov	[bp+var_14], 100h
		mov	eax, [bp+var_14]
		mov	[bp+var_4C], eax
		lea	ax, word ptr [bp+var_54]
		push	ax
		lea	ax, word ptr [bp+var_48]
		push	ax
		push	word_79788
		push	ss
		lea	ax, word ptr [bp+var_18]
		push	ax
		call	Ground_HeightUnderPoint_3664D
		add	sp, 0Ch
		mov	eax, [bp+var_18]

loc_D3FE:
		sub	[bp+var_8], eax
		cmp	[bp+var_8], 14D00h
		jle	short loc_D411
		mov	ax, 1
		jmp	short loc_D413

loc_D411:
		xor	ax, ax

loc_D413:
		or	al, al
		jnz	short loc_D41A
		jmp	loc_D4DE

loc_D41A:
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 136h
		mov	word ptr [bp+var_20+2], ax
		mov	word ptr [bp+var_20], dx
		les	si, word ptr [bp+var_20]
		mov	eax, es:[si]
		mov	[bp+var_6C], eax
		mov	eax, es:[si+4]
		mov	[bp+var_68], eax
		mov	eax, es:[si+8]
		mov	[bp+var_64], eax
		mov	eax, [bp+var_6C]
		or	eax, eax
		jge	short loc_D453
		neg	eax

loc_D453:
		mov	[bp+var_6C], eax
		les	bx, [bp+arg_0]
		mov	si, es:[bx+0D4h]
		add	si, 12h
		mov	di, es:[bx+131h]
		add	di, 12h
		mov	eax, [si]
		sub	eax, [di]
		mov	[bp+var_78], eax
		mov	eax, [si+4]
		sub	eax, [di+4]
		mov	[bp+var_74], eax
		mov	eax, [si+8]
		sub	eax, [di+8]
		mov	[bp+var_70], eax
		lea	ax, word ptr [bp+var_78]
		push	ax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		call	sub_A41D
		add	sp, 4
		or	ax, ax
		jge	short loc_D4AB
		mov	eax, [bp+var_6C]
		neg	eax
		mov	[bp+var_6C], eax

loc_D4AB:
		lea	ax, word ptr [bp+var_6C]
		mov	[bp+var_2E], ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+131h]
		mov	[bp+var_30], ax
		mov	[bp+var_24], 200h
		mov	eax, [bp+var_24]
		mov	[bp+var_2A], eax
		lea	ax, [bp+var_30]
		push	ax
		push	large es:[bx+0CCh]
		les	bx, es:[bx+0CCh]
		jmp	loc_D5D7

loc_D4DE:
		add	[bp+var_40], 3E800h
		mov	[bp+var_1C], 0C800h
		mov	eax, [bp+var_3C]
		mov	edx, [bp+var_1C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_38]
		mov	edx, [bp+var_1C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_38], eax
		mov	eax, [bp+var_34]
		mov	edx, [bp+var_1C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_34], eax
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+131h]
		mov	si, [bx+52h]
		add	si, 2
		mov	eax, [si]
		mov	[bp+var_60], eax
		mov	eax, [si+4]
		mov	[bp+var_5C], eax
		mov	eax, [si+8]
		mov	[bp+var_58], eax
		mov	eax, [bp+var_60]
		add	[bp+var_3C], eax
		mov	eax, [bp+var_5C]
		add	[bp+var_38], eax
		mov	eax, [bp+var_58]
		add	[bp+var_34], eax
		mov	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	eax, [bp+var_48]
		mov	es:[bx+2], eax
		mov	eax, [bp+var_44]
		mov	es:[bx+6], eax
		mov	eax, [bp+var_40]
		mov	es:[bx+0Ah], eax
		mov	eax, [bp+var_3C]
		mov	es:[bx+0Eh], eax
		mov	eax, [bp+var_38]
		mov	es:[bx+12h], eax
		mov	eax, [bp+var_34]
		mov	es:[bx+16h], eax
		mov	word ptr [bp+var_6C], 0
		xor	ax, ax
		mov	word ptr [bp+var_68], ax
		mov	word ptr [bp+var_6C+2], ax
		mov	[bp+var_20], 200h
		mov	eax, [bp+var_20]
		mov	[bp+var_66], eax
		mov	byte ptr [bp+var_64+2], 0
		lea	ax, word ptr [bp+var_6C]
		push	ax
		les	bx, [bp+arg_0]
		push	large es:[bx+0C0h]
		les	bx, es:[bx+0C0h]

loc_D5D7:
		mov	bx, es:[bx]
		call	dword ptr [bx+8]

loc_D5DD:
		add	sp, 6

loc_D5E0:
		pop	di
		pop	si
		leave
		retf
sub_D2AC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D5E4		proc far

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
var_40		= word ptr -40h
var_3E		= word ptr -3Eh
var_3C		= word ptr -3Ch
var_3A		= dword ptr -3Ah
var_36		= byte ptr -36h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 94h
		push	si
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_D60C
		push	large es:[bx+0Dh]
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		jmp	loc_D868

loc_D60C:
		mov	[bp+var_40], 0
		xor	ax, ax
		mov	[bp+var_3C], ax
		mov	[bp+var_3E], ax
		mov	[bp+var_4], 200h
		mov	eax, [bp+var_4]
		mov	[bp+var_3A], eax
		mov	[bp+var_36], 0
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 10Bh
		mov	[bp+var_6], ax
		mov	[bp+var_8], dx
		les	si, [bp+var_8]
		mov	eax, es:[si]
		mov	[bp+var_4C], eax
		mov	eax, es:[si+4]
		mov	[bp+var_48], eax
		mov	eax, es:[si+8]
		mov	[bp+var_44], eax
		lea	ax, word ptr [bp+var_4C]
		mov	[bp+var_3E], ax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	byte ptr es:[bx+1Ah], 0
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 10Bh
		mov	[bp+var_A], ax
		mov	[bp+var_C], dx
		les	si, [bp+var_C]
		mov	eax, es:[si]
		mov	[bp+var_58], eax
		mov	eax, es:[si+4]
		mov	[bp+var_54], eax
		mov	eax, es:[si+8]
		mov	[bp+var_50], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	eax, [bp+var_58]
		mov	es:[bx+2], eax
		mov	eax, [bp+var_54]
		mov	es:[bx+6], eax
		mov	eax, [bp+var_50]
		mov	es:[bx+0Ah], eax
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+109h], 0A5h
		jz	short loc_D6D0
		cmp	word ptr es:[bx+109h], 0A4h
		jnz	short loc_D71D

loc_D6D0:
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 117h
		mov	[bp+var_E], ax
		mov	[bp+var_10], dx
		les	si, [bp+var_10]
		mov	eax, es:[si]
		mov	[bp+var_64], eax
		mov	eax, es:[si+4]
		mov	[bp+var_60], eax
		mov	eax, es:[si+8]
		mov	[bp+var_5C], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	eax, [bp+var_64]
		mov	es:[bx+0Eh], eax
		mov	eax, [bp+var_60]
		mov	es:[bx+12h], eax
		mov	eax, [bp+var_5C]
		jmp	loc_D848

loc_D71D:
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 10Bh
		mov	[bp+var_12], ax
		mov	[bp+var_14], dx
		les	si, [bp+var_14]
		mov	eax, es:[si]
		mov	[bp+var_70], eax
		mov	eax, es:[si+4]
		mov	[bp+var_6C], eax
		mov	eax, es:[si+8]
		mov	[bp+var_68], eax
		les	bx, [bp+arg_0]
		mov	si, es:[bx+0D4h]
		add	si, 12h
		mov	eax, [bp+var_70]
		sub	eax, [si]
		mov	[bp+var_7C], eax
		mov	eax, [bp+var_6C]
		sub	eax, [si+4]
		mov	[bp+var_78], eax
		mov	eax, [bp+var_68]
		sub	eax, [si+8]
		mov	[bp+var_74], eax
		mov	eax, [bp+var_7C]
		mov	[bp+var_88], eax
		mov	eax, [bp+var_78]
		mov	[bp+var_84], eax
		mov	eax, [bp+var_74]
		mov	[bp+var_80], eax
		lea	ax, word ptr [bp+var_88]
		push	ax
		call	Vector_NormalizeInPlace_57715
		pop	cx
		mov	si, ax
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 12Dh
		mov	[bp+var_16], ax
		mov	[bp+var_18], dx
		les	bx, [bp+var_18]
		mov	eax, es:[bx]
		mov	[bp+var_1C], eax
		mov	eax, [si]
		mov	edx, [bp+var_1C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_20], eax
		mov	eax, [bp+var_20]
		mov	[bp+var_24], eax
		mov	eax, [si+4]
		mov	edx, [bp+var_1C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_28], eax
		mov	eax, [bp+var_28]
		mov	[bp+var_2C], eax
		mov	eax, [si+8]
		mov	edx, [bp+var_1C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_30], eax
		mov	eax, [bp+var_30]
		mov	[bp+var_34], eax
		mov	eax, [bp+var_24]
		mov	[bp+var_94], eax
		mov	eax, [bp+var_2C]
		mov	[bp+var_90], eax
		mov	eax, [bp+var_34]
		mov	[bp+var_8C], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	eax, [bp+var_94]
		mov	es:[bx+0Eh], eax
		mov	eax, [bp+var_90]
		mov	es:[bx+12h], eax
		mov	eax, [bp+var_8C]

loc_D848:
		mov	es:[bx+16h], eax
		lea	ax, [bp+var_40]
		push	ax
		les	bx, [bp+arg_0]
		push	large es:[bx+0C0h]
		les	bx, es:[bx+0C0h]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 6

loc_D868:
		pop	si
		leave
		retf
sub_D5E4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D86B		proc far

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
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 78h
		push	si
		push	di
		mov	si, [bp+arg_4]
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+131h]
		mov	bx, es:[bx+131h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	di, ax
		mov	eax, [di]
		mov	[bp+var_24], eax
		mov	eax, [di+4]
		mov	[bp+var_20], eax
		mov	eax, [di+8]
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_24]
		mov	[bp+var_60], eax
		mov	eax, [bp+var_20]
		mov	[bp+var_5C], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_58], eax
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 136h
		mov	[bp+var_6], ax
		mov	[bp+var_8], dx
		les	di, [bp+var_8]
		mov	eax, es:[di]
		mov	[bp+var_30], eax
		mov	eax, es:[di+4]
		mov	[bp+var_2C], eax
		mov	eax, es:[di+8]
		mov	[bp+var_28], eax
		mov	[bp+var_4C], 0
		mov	eax, [bp+var_5C]
		mov	[bp+var_54], eax
		mov	eax, [bp+var_60]
		neg	eax
		mov	[bp+var_50], eax
		lea	ax, word ptr [bp+var_54]
		push	ax
		call	Vector_NormalizeInPlace_57715
		pop	cx
		lea	ax, word ptr [bp+var_60]
		push	ax
		lea	ax, word ptr [bp+var_54]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_6C]
		push	ax
		call	Vector_CrossProduct3D_56EF2
		add	sp, 8
		mov	eax, [bp+var_6C]
		mov	[bp+var_48], eax
		mov	eax, [bp+var_68]
		mov	[bp+var_44], eax
		mov	eax, [bp+var_64]
		mov	[bp+var_40], eax
		mov	eax, [bp+var_54]
		mov	edx, [bp+var_30]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_54], eax
		mov	eax, [bp+var_50]
		mov	edx, [bp+var_30]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_50], eax
		mov	eax, [bp+var_4C]
		mov	edx, [bp+var_30]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_60]
		mov	edx, [bp+var_2C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_60], eax
		mov	eax, [bp+var_5C]
		mov	edx, [bp+var_2C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_5C], eax
		mov	eax, [bp+var_58]
		mov	edx, [bp+var_2C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_58], eax
		mov	eax, [bp+var_48]
		mov	edx, [bp+var_28]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_48], eax
		mov	eax, [bp+var_44]
		mov	edx, [bp+var_28]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_44], eax
		mov	eax, [bp+var_40]
		mov	edx, [bp+var_28]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_40], eax
		mov	eax, [bp+var_54]
		mov	[si], eax
		mov	eax, [bp+var_50]
		mov	[si+4], eax
		mov	eax, [bp+var_4C]
		mov	[si+8], eax
		mov	eax, [bp+var_60]
		add	[si], eax
		mov	eax, [bp+var_5C]
		add	[si+4], eax
		mov	eax, [bp+var_58]
		add	[si+8], eax
		mov	eax, [bp+var_48]
		add	[si], eax
		mov	eax, [bp+var_44]
		add	[si+4], eax
		mov	eax, [bp+var_40]
		add	[si+8], eax
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+131h]
		mov	eax, [bx+1Ah]
		mov	[bp+var_4], eax
		push	0
		mov	[bp+var_C], 0
		mov	eax, [bp+var_C]
		mov	[bp+var_78], eax
		mov	[bp+var_10], 0
		mov	eax, [bp+var_10]
		mov	[bp+var_74], eax
		mov	[bp+var_14], 100h
		mov	eax, [bp+var_14]
		mov	[bp+var_70], eax
		lea	ax, word ptr [bp+var_78]
		push	ax
		mov	bx, [bp+arg_0]
		mov	ax, es:[bx+131h]
		add	ax, 12h
		push	ax
		push	word_79788
		push	ss
		lea	ax, word ptr [bp+var_18]
		push	ax
		call	Ground_HeightUnderPoint_3664D
		add	sp, 0Ch
		mov	eax, [bp+var_18]
		sub	[bp+var_4], eax
		mov	eax, [bp+var_4]
		add	eax, [si+8]
		cmp	eax, 1F400h
		jge	short loc_DAB8
		mov	dword ptr [si+8], 1F400h

loc_DAB8:
		pop	di
		pop	si
		leave
		retf
sub_D86B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DABC		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_DAFE
		push	0
		push	large [bp+arg_0]
		call	sub_10441
		add	sp, 6
		test	si, 1
		jz	short loc_DAFE
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_DAFE

loc_DAFE:
		pop	si
		leave
		retf
sub_DABC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DB01		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_DB43
		push	0
		push	large [bp+arg_0]
		call	sub_10441
		add	sp, 6
		test	si, 1
		jz	short loc_DB43
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
sub_DB01		endp

; START OF FUNCTION CHUNK FOR sub_DB01
		db 83h, 0C4h
; END OF FUNCTION CHUNK FOR sub_DB01
seg023		ends

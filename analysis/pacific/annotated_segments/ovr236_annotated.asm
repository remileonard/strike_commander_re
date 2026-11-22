ovr236		segment	para public 'OVERLAY' use16
		assume cs:ovr236
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_84340		proc far

var_2		= word ptr -2
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		les	bx, word ptr [bp+arg_0]
		cmp	word ptr es:[bx+27h], 0
		jz	short loc_84355
		mov	ax, 1
		jmp	short loc_84357

loc_84355:
		xor	ax, ax

loc_84357:
		mov	ah, 0
		or	ax, ax
		jz	short loc_84360
		jmp	loc_843E8

loc_84360:
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+2]
		mov	[bp+var_2], ax
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 1Ah
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_736E4
		add	sp, 6
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0D4h]
		mov	ax, [bx+61h]
		mov	dx, [bx+5Fh]
		mov	bx, word ptr [bp+arg_0]
		mov	es:[bx+0D8h], ax
		mov	es:[bx+0D6h], dx
		mov	bx, es:[bx+0D4h]
		mov	ax, [bx+65h]
		mov	dx, [bx+63h]
		mov	bx, word ptr [bp+arg_0]
		mov	es:[bx+0DCh], ax
		mov	es:[bx+0DAh], dx
		mov	bx, es:[bx+0D4h]
		push	word ptr [bx+52h]
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0D4h]
		mov	bx, [bx+52h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0Bh], ax
		push	word ptr [bp+arg_0+2]
		push	bx
		nop
		push	cs
		call	near ptr sub_849F2
		add	sp, 4
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr PilotProfile_LoadFromPROF_843EA
		add	sp, 4

loc_843E8:
		leave
		retf
sub_84340		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05. (structure) Lit INTEL\\<nom>.IFF : PROF, _AI_, MVRS, GOAL ; crée les
; nœuds d'IA, dont le nœud n° 19 (attaque au sol, 72 octets, table 4C8h) rangé en
; [entité+196].
; ==============================================================================================
PilotProfile_LoadFromPROF_843EA		proc far

var_148		= word ptr -148h
var_EB		= dword ptr -0EBh
var_E7		= dword ptr -0E7h
var_E3		= dword ptr -0E3h
var_D6		= dword ptr -0D6h
var_D2		= dword ptr -0D2h
var_CE		= word ptr -0CEh
var_CC		= word ptr -0CCh
var_A0		= word ptr -0A0h
var_50		= word ptr -50h
var_48		= byte ptr -48h
var_46		= word ptr -46h
var_44		= word ptr -44h
var_42		= word ptr -42h
var_40		= dword ptr -40h
var_3C		= word ptr -3Ch
var_3A		= word ptr -3Ah
var_38		= dword ptr -38h
var_34		= word ptr -34h
var_32		= word ptr -32h
var_30		= dword ptr -30h
var_2C		= word ptr -2Ch
var_2A		= word ptr -2Ah
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= dword ptr -18h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= dword ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 148h
		push	si
		push	di
		push	seg seg225
		push	0
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+2]
		push	large [bx+6]
		push	ds
		push	offset aINTEL
		lea	ax, [bp+var_A0]
		push	ax
		call	sub_29540
		add	sp, 0Eh
		lea	ax, [bp+var_148]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_148], 508h
		mov	[bp+var_E7], 100h
		mov	[bp+var_EB], 0
		mov	[bp+var_148], 520h
		mov	[bp+var_CC], 0
		xor	ax, ax
		mov	[bp+var_CE], ax
		movsx	eax, ax
		mov	[bp+var_E3], eax
		push	large 464F5250h
		lea	ax, [bp+var_A0]
		push	ax
		lea	ax, [bp+var_148]
		push	ax
		call	ResourceRecord_InitAndValidate_6D646
		add	sp, 8
		or	ax, ax
		jnz	short loc_84472
		jmp	loc_849CE

loc_84472:
		push	0
		push	large 5F49415Fh
		lea	ax, [bp+var_148]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_8448E
		jmp	loc_849CE

loc_8448E:
		mov	eax, [bp+arg_0]
		mov	[bp+var_8], eax
		push	1
		push	0
		push	2
		push	large 15h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_A], dx
		mov	[bp+var_C], ax
		or	ax, dx
		jz	short loc_844E7
		push	large [bp+var_8]
		push	dx
		push	[bp+var_C]
		call	sub_10323
		add	sp, 8
		les	bx, [bp+var_C]
		mov	word ptr es:[bx], 4E8h
		mov	eax, [bp+var_8]
		mov	es:[bx+0Dh], eax
		mov	word ptr es:[bx], 4F8h
		mov	byte ptr es:[bx+0Ch], 15h
		mov	dx, [bp+var_A]
		mov	ax, [bp+var_C]
		jmp	short loc_844ED

loc_844E7:
		mov	dx, [bp+var_A]
		mov	ax, [bp+var_C]

loc_844ED:
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0C2h], dx
		mov	es:[bx+0C0h], ax
		mov	eax, [bp+arg_0]
		mov	[bp+var_10], eax
		push	1
		push	0
		push	2
		push	large 21h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_12], dx
		mov	[bp+var_14], ax
		or	ax, dx
		jz	short loc_84553
		push	large [bp+var_10]
		push	dx
		push	[bp+var_14]
		call	sub_10323
		add	sp, 8
		les	bx, [bp+var_14]
		mov	word ptr es:[bx], 4E8h
		mov	eax, [bp+var_10]
		mov	es:[bx+0Dh], eax
		mov	word ptr es:[bx], 4D8h
		mov	byte ptr es:[bx+0Ch], 14h
		mov	dx, [bp+var_12]
		mov	ax, [bp+var_14]
		jmp	short loc_84559

loc_84553:
		mov	dx, [bp+var_12]
		mov	ax, [bp+var_14]

loc_84559:
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0CAh], dx
		mov	es:[bx+0C8h], ax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 1BDh
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		mov	eax, [bp+arg_0]
		mov	[bp+var_18], eax
		push	1
		push	0
		push	2
		push	large 48h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_1A], dx
		mov	[bp+var_1C], ax
		or	ax, dx
		jnz	short loc_8459F
		jmp	loc_84635

loc_8459F:
		push	large [bp+var_18]
		push	dx
		push	[bp+var_1C]
		call	sub_10323
		add	sp, 8
		les	bx, [bp+var_1C]
		mov	word ptr es:[bx], 4E8h
		mov	eax, [bp+var_18]
		mov	es:[bx+0Dh], eax
		mov	word ptr es:[bx], 4C8h
		mov	word ptr es:[bx+33h], 0
		mov	word ptr es:[bx+35h], 0
		mov	[bp+var_20], 0
		mov	eax, [bp+var_20]
		mov	[bp+var_24], eax
		mov	eax, [bp+var_24]
		mov	es:[bx+37h], eax
		mov	byte ptr es:[bx+0Ch], 13h
		mov	byte ptr es:[bx+31h], 0
		push	0
		mov	ax, [bp+var_1C]
		add	ax, 33h
		push	[bp+var_1A]
		push	ax
		call	sub_39519
		add	sp, 6
		push	0
		mov	ax, [bp+var_1C]
		add	ax, 35h
		push	[bp+var_1A]
		push	ax
		call	sub_39519
		add	sp, 6
		les	bx, [bp+var_1C]
		mov	dword ptr es:[bx+3Ch], 0
		mov	byte ptr es:[bx+46h], 0
		mov	dx, [bp+var_1A]
		mov	ax, [bp+var_1C]
		jmp	short loc_8463B

loc_84635:
		mov	dx, [bp+var_1A]
		mov	ax, [bp+var_1C]

loc_8463B:
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0C6h], dx
		mov	es:[bx+0C4h], ax
		les	bx, [bp+var_4]
		mov	es:[bx+2], dx
		mov	es:[bx], ax
		mov	byte ptr es:[bx+4], 0
		add	[bp+var_4], 5
		mov	eax, [bp+arg_0]
		mov	[bp+var_28], eax
		push	1
		push	0
		push	2
		push	large 20h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_2A], dx
		mov	[bp+var_2C], ax
		or	ax, dx
		jz	short loc_846C8
		push	large [bp+var_28]
		push	dx
		push	[bp+var_2C]
		call	sub_10323
		add	sp, 8
		les	bx, [bp+var_2C]
		mov	word ptr es:[bx], 4E8h
		mov	eax, [bp+var_28]
		mov	es:[bx+0Dh], eax
		mov	word ptr es:[bx], 4B8h
		mov	word ptr es:[bx+1Eh], 0
		mov	dword ptr es:[bx+18h], 0FFFFFF9Ch
		mov	byte ptr es:[bx+11h], 0
		mov	byte ptr es:[bx+0Ch], 16h
		mov	dx, [bp+var_2A]
		mov	ax, [bp+var_2C]
		jmp	short loc_846CE

loc_846C8:
		mov	dx, [bp+var_2A]
		mov	ax, [bp+var_2C]

loc_846CE:
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0D2h], dx
		mov	es:[bx+0D0h], ax
		les	bx, [bp+var_4]
		mov	es:[bx+2], dx
		mov	es:[bx], ax
		mov	byte ptr es:[bx+4], 0
		add	[bp+var_4], 5
		mov	eax, [bp+arg_0]
		mov	[bp+var_30], eax
		push	1
		push	0
		push	2
		push	large 15h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_32], dx
		mov	[bp+var_34], ax
		or	ax, dx
		jz	short loc_84747
		push	large [bp+var_30]
		push	dx
		push	[bp+var_34]
		call	sub_10323
		add	sp, 8
		les	bx, [bp+var_34]
		mov	word ptr es:[bx], 4E8h
		mov	eax, [bp+var_30]
		mov	es:[bx+0Dh], eax
		mov	word ptr es:[bx], 4A8h
		mov	byte ptr es:[bx+0Ch], 0Eh
		mov	dx, [bp+var_32]
		mov	ax, [bp+var_34]
		jmp	short loc_8474D

loc_84747:
		mov	dx, [bp+var_32]
		mov	ax, [bp+var_34]

loc_8474D:
		les	bx, [bp+var_4]
		mov	es:[bx+2], dx
		mov	es:[bx], ax
		mov	byte ptr es:[bx+4], 0
		add	[bp+var_4], 5
		mov	eax, [bp+arg_0]
		mov	[bp+var_38], eax
		push	1
		push	0
		push	2
		push	large 15h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_3A], dx
		mov	[bp+var_3C], ax
		or	ax, dx
		jz	short loc_847B9
		push	large [bp+var_38]
		push	dx
		push	[bp+var_3C]
		call	sub_10323
		add	sp, 8
		les	bx, [bp+var_3C]
		mov	word ptr es:[bx], 4E8h
		mov	eax, [bp+var_38]
		mov	es:[bx+0Dh], eax
		mov	word ptr es:[bx], 498h
		mov	byte ptr es:[bx+0Ch], 0Fh
		mov	dx, [bp+var_3A]
		mov	ax, [bp+var_3C]
		jmp	short loc_847BF

loc_847B9:
		mov	dx, [bp+var_3A]
		mov	ax, [bp+var_3C]

loc_847BF:
		les	bx, [bp+var_4]
		mov	es:[bx+2], dx
		mov	es:[bx], ax
		mov	byte ptr es:[bx+4], 0
		add	[bp+var_4], 5
		mov	eax, [bp+arg_0]
		mov	[bp+var_40], eax
		push	1
		push	0
		push	2
		push	large 17h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_42], dx
		mov	[bp+var_44], ax
		or	ax, dx
		jz	short loc_84831
		push	large [bp+var_40]
		push	dx
		push	[bp+var_44]
		call	sub_10323
		add	sp, 8
		les	bx, [bp+var_44]
		mov	word ptr es:[bx], 4E8h
		mov	eax, [bp+var_40]
		mov	es:[bx+0Dh], eax
		mov	word ptr es:[bx], 488h
		mov	word ptr es:[bx+11h], 0
		mov	byte ptr es:[bx+0Ch], 7
		mov	dx, [bp+var_42]
		mov	ax, [bp+var_44]
		jmp	short loc_84837

loc_84831:
		mov	dx, [bp+var_42]
		mov	ax, [bp+var_44]

loc_84837:
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0CEh], dx
		mov	es:[bx+0CCh], ax
		les	bx, [bp+var_4]
		mov	es:[bx+2], dx
		mov	es:[bx], ax
		mov	byte ptr es:[bx+4], 0
		add	[bp+var_4], 5
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx+1BBh], 5
		push	0
		push	large 5352564Dh
		lea	ax, [bp+var_148]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_848F4
		mov	eax, [bp+var_D6]
		mov	ebx, 2
		cdq
		idiv	ebx
		mov	di, ax
		xor	si, si
		jmp	short loc_848DB

loc_84890:
		lea	ax, [bp+var_148]
		push	ax
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	[bp+var_48], al
		push	ax
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_84B24
		add	sp, 6
		les	bx, [bp+var_4]
		mov	es:[bx+2], dx
		mov	es:[bx], ax
		lea	ax, [bp+var_148]
		push	ax
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		les	bx, [bp+var_4]
		mov	es:[bx+4], al
		cmp	dword ptr es:[bx], 0
		jz	short loc_848DA
		les	bx, word ptr [bp+arg_0]
		inc	word ptr es:[bx+1BBh]
		add	[bp+var_4], 5

loc_848DA:
		inc	si

loc_848DB:
		cmp	si, di
		jge	short loc_848EA
		les	bx, word ptr [bp+arg_0]
		cmp	word ptr es:[bx+1BBh], 0Ah
		jl	short loc_84890

loc_848EA:
		mov	eax, [bp+var_D2]
		mov	[bp+var_E3], eax

loc_848F4:
		mov	eax, [bp+var_D2]
		mov	[bp+var_E3], eax
		push	0
		push	large 4C414F47h
		lea	ax, [bp+var_148]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_84920
		push	8002h
		call	sub_1DDFE
		pop	cx

loc_84920:
		mov	di, word ptr [bp+var_D6]
		mov	ax, di
		inc	ax
		cmp	ax, 0Ah
		jle	short loc_8492F
		mov	di, 9

loc_8492F:
		xor	si, si
		mov	[bp+var_46], 0
		jmp	short loc_849A1

loc_84938:
		lea	ax, [bp+var_148]
		push	ax
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	[bp+var_48], al
		cmp	[bp+var_48], 1
		jnz	short loc_84957
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+1F9h], 1
		jmp	short loc_849A0

loc_84957:
		cmp	[bp+var_48], 9
		jnz	short loc_84968
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+167h], 1
		jmp	short loc_849A0

loc_84968:
		mov	ax, [bp+var_46]
		shl	ax, 3
		mov	dx, word ptr [bp+arg_0]
		add	dx, ax
		add	dx, 16Bh
		push	word ptr [bp+arg_0+2]
		push	dx
		mov	al, [bp+var_48]
		push	ax
		push	large [bp+arg_0]
		push	ss
		lea	ax, [bp+var_50]
		push	ax
		nop
		push	cs
		call	near ptr PilotProfile_GoalHandlerFromValue_84AA0
		add	sp, 0Ah
		lea	ax, [bp+var_50]
		push	ss
		push	ax
		mov	cx, 8
		call	CRT_Fmemcpy
		inc	[bp+var_46]

loc_849A0:
		inc	si

loc_849A1:
		cmp	si, di
		jl	short loc_84938
		mov	ax, [bp+var_46]
		shl	ax, 3
		mov	dx, word ptr [bp+arg_0]
		add	dx, ax
		add	dx, 16Bh
		push	word ptr [bp+arg_0+2]
		push	dx
		push	ds
		push	offset unk_76B06
		mov	cx, 8
		call	CRT_Fmemcpy
		mov	eax, [bp+var_D2]
		mov	[bp+var_E3], eax

loc_849CE:
		mov	[bp+var_148], 520h
		lea	ax, [bp+var_148]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		push	0
		lea	ax, [bp+var_148]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
PilotProfile_LoadFromPROF_843EA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_849F2		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		cmp	word_76B0E, 0
		jz	short loc_849FF
		jmp	loc_84A9E

loc_849FF:
		mov	word_76B0E, 1
		mov	dword_7C7DF, 7D0h
		mov	dword_7C7E3, 0FA0h
		mov	dword_7C7E7, 0AFC8h
		mov	dword_7C7EB, 708h
		mov	dword_7C7EF, 4524h
		mov	dword_7C7F3, 1388h
		mov	dword_7C7F7, 208Dh
		mov	word_7C804, 0FAh
		mov	word_7C806, 0C8h
		mov	word_7C808, 96h
		mov	byte_7C7FB, 0Eh
		mov	byte_7C7FC, 0Fh
		mov	byte_7C7FD, 10h
		mov	byte_7C7FE, 0Eh
		mov	byte_7C7FF, 0Fh
		mov	byte_7C800, 10h
		mov	byte_7C801, 3Ch
		mov	byte_7C802, 46h
		mov	byte_7C803, 50h
		mov	word_7C80A, 96h
		mov	word_7C80C, 0AFh
		mov	word_7C80E, 0FAh
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0E6h], 3

loc_84A9E:
		pop	bp
		retf
sub_849F2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-13. Appelée par PilotProfile_LoadFromPROF_843EA pour chaque valeur du chunk
; GOAL autre que 1 et 9 : recopie l'emplacement de 8 octets (pointeur far du gestionnaire) de
; la table dseg 76B10 + 8 × (valeur − 2). 2 = Goal_ExecuteObjective_C9E4, 3 =
; Goal_WanderRandom_D001, 4 = AI_BehaviorStateMachine_B968, 5 = Goal_MoraleReaction_B712, 7 =
; Goal_FollowLeaderInFormation_C91C, 8 = Goal_FollowLeader_C93E. 6 : cas par défaut, erreur
; 32776 (push 8008h) et emplacement vide. Les valeurs 1 et 9 sont traitées par le chargeur
; (octets [entité+505] et [entité+359]) sans emplacement.
; ==============================================================================================
PilotProfile_GoalHandlerFromValue_84AA0		proc far

arg_0		= dword ptr  6
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		mov	al, [bp+arg_8]
		mov	ah, 0
		sub	ax, 2
		mov	bx, ax
		cmp	bx, 6
		ja	short loc_84AF5
		shl	bx, 1
		jmp	cs:off_84B16[bx]	; switch jump

loc_84AB9:
		push	large [bp+arg_0]
		push	ds
		push	offset unk_76B10
		jmp	short loc_84B06

loc_84AC3:
		push	large [bp+arg_0]
		push	ds
		push	offset unk_76B18
		jmp	short loc_84B06

loc_84ACD:
		push	large [bp+arg_0]
		push	ds
		push	offset unk_76B20
		jmp	short loc_84B06

loc_84AD7:
		push	large [bp+arg_0]
		push	ds
		push	offset unk_76B28
		jmp	short loc_84B06

loc_84AE1:
		push	large [bp+arg_0]
		push	ds
		push	offset unk_76B30
		jmp	short loc_84B06

loc_84AEB:
		push	large [bp+arg_0]
		push	ds
		push	offset unk_76B38
		jmp	short loc_84B06

loc_84AF5:
		push	8008h
		call	sub_1DDFE
		pop	cx
		push	large [bp+arg_0]
		push	ds
		push	offset unk_76B40

loc_84B06:
		mov	cx, 8
		call	CRT_Fmemcpy
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	bp
		retf
PilotProfile_GoalHandlerFromValue_84AA0		endp

; START OF FUNCTION CHUNK FOR PilotProfile_GoalHandlerFromValue_84AA0
off_84B16	dw offset loc_84AB9
		dw offset loc_84AC3
		dw offset loc_84ACD
		dw offset loc_84AD7
		dw offset loc_84AF5
		dw offset loc_84AE1
		dw offset loc_84AEB
; END OF FUNCTION CHUNK FOR PilotProfile_GoalHandlerFromValue_84AA0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_84B24		proc far

var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= dword ptr -1Ch
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= dword ptr -14h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 20h
		mov	al, [bp+arg_4]
		mov	ah, 0
		sub	ax, 3
		mov	bx, ax
		cmp	bx, 3
		jbe	short loc_84B3C
		jmp	loc_84CCC

loc_84B3C:
		shl	bx, 1
		jmp	cs:off_84CD2[bx]	; switch jump

loc_84B43:
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	1
		push	0
		push	2
		push	large 16h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_6], dx
		mov	[bp+var_8], ax
		or	ax, dx
		jz	short loc_84B9C
		push	large [bp+var_4]
		push	dx
		push	[bp+var_8]
		call	sub_10323
		add	sp, 8
		les	bx, [bp+var_8]
		mov	word ptr es:[bx], 4E8h
		mov	eax, [bp+var_4]
		mov	es:[bx+0Dh], eax
		mov	word ptr es:[bx], 478h
		mov	byte ptr es:[bx+0Ch], 6
		mov	dx, [bp+var_6]
		mov	ax, [bp+var_8]
		jmp	short loc_84BA2

loc_84B9C:
		mov	dx, [bp+var_6]
		mov	ax, [bp+var_8]

loc_84BA2:
		jmp	loc_84CD0

loc_84BA5:
		mov	eax, [bp+arg_0]
		mov	[bp+var_C], eax
		push	1
		push	0
		push	2
		push	large 15h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_E], dx
		mov	[bp+var_10], ax
		or	ax, dx
		jz	short loc_84BFE
		push	large [bp+var_C]
		push	dx
		push	[bp+var_10]
		call	sub_10323
		add	sp, 8
		les	bx, [bp+var_10]
		mov	word ptr es:[bx], 4E8h
		mov	eax, [bp+var_C]
		mov	es:[bx+0Dh], eax
		mov	word ptr es:[bx], 468h
		mov	byte ptr es:[bx+0Ch], 4
		mov	dx, [bp+var_E]
		mov	ax, [bp+var_10]
		jmp	short loc_84BA2

loc_84BFE:
		mov	dx, [bp+var_E]
		mov	ax, [bp+var_10]
		jmp	short loc_84BA2

loc_84C06:
		mov	eax, [bp+arg_0]
		mov	[bp+var_14], eax
		push	1
		push	0
		push	2
		push	large 18h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_16], dx
		mov	[bp+var_18], ax
		or	ax, dx
		jz	short loc_84C60
		push	large [bp+var_14]
		push	dx
		push	[bp+var_18]
		call	sub_10323
		add	sp, 8
		les	bx, [bp+var_18]
		mov	word ptr es:[bx], 4E8h
		mov	eax, [bp+var_14]
		mov	es:[bx+0Dh], eax
		mov	word ptr es:[bx], 458h
		mov	byte ptr es:[bx+0Ch], 3
		mov	dx, [bp+var_16]
		mov	ax, [bp+var_18]
		jmp	loc_84BA2

loc_84C60:
		mov	dx, [bp+var_16]
		mov	ax, [bp+var_18]
		jmp	loc_84BA2

loc_84C69:
		mov	eax, [bp+arg_0]
		mov	[bp+var_1C], eax
		push	1
		push	0
		push	2
		push	large 17h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_1E], dx
		mov	[bp+var_20], ax
		or	ax, dx
		jz	short loc_84CC3
		push	large [bp+var_1C]
		push	dx
		push	[bp+var_20]
		call	sub_10323
		add	sp, 8
		les	bx, [bp+var_20]
		mov	word ptr es:[bx], 4E8h
		mov	eax, [bp+var_1C]
		mov	es:[bx+0Dh], eax
		mov	word ptr es:[bx], 448h
		mov	byte ptr es:[bx+0Ch], 5
		mov	dx, [bp+var_1E]
		mov	ax, [bp+var_20]
		jmp	loc_84BA2

loc_84CC3:
		mov	dx, [bp+var_1E]
		mov	ax, [bp+var_20]
		jmp	loc_84BA2

loc_84CCC:
		xor	dx, dx
		xor	ax, ax

loc_84CD0:
		leave
		retf
sub_84B24		endp

; START OF FUNCTION CHUNK FOR sub_84B24
off_84CD2	dw offset loc_84C06
		dw offset loc_84BA5
		dw offset loc_84C69
		dw offset loc_84B43
; END OF FUNCTION CHUNK FOR sub_84B24

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_84CDA		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+2], 0
		pop	bp
		retf
sub_84CDA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_84CE8		proc far

var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	large [bp+arg_0]
		call	sub_9FDC
		add	sp, 4
		les	bx, word ptr [bp+arg_0]
		mov	ax, [bp+arg_4]
		mov	es:[bx+2], ax
		mov	byte ptr es:[bx+6], 1
		push	1
		push	0
		push	2
		push	large 25h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		or	ax, dx
		jz	short loc_84D55
		les	bx, [bp+var_4]
		mov	word ptr es:[bx], 3C8h
		push	dx
		push	bx
		call	WorldObjectA_ResetPositionVector_9EE7
		add	sp, 4
		les	bx, [bp+var_4]
		mov	word ptr es:[bx], 440h
		push	[bp+var_2]
		push	bx
		call	sub_1180E
		add	sp, 4
		mov	dx, [bp+var_2]
		mov	ax, [bp+var_4]
		jmp	short loc_84D5B

loc_84D55:
		mov	dx, [bp+var_2]
		mov	ax, [bp+var_4]

loc_84D5B:
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+9], dx
		mov	es:[bx+7], ax
		mov	byte ptr es:[bx+1FAh], 0
		mov	byte ptr es:[bx+1EFh], 0
		mov	ax, es:[bx+2]
		mov	es:[bx+0D4h], ax
		mov	dword ptr es:[bx+0D6h], 0
		mov	dword ptr es:[bx+0DAh], 0
		mov	word ptr es:[bx+0Bh], 0
		push	0
		mov	ax, word ptr [bp+arg_0]
		add	ax, 0FBh
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_39519
		add	sp, 6
		les	bx, word ptr [bp+arg_0]
		mov	dword ptr es:[bx+125h], 7530h
		mov	word ptr es:[bx+109h], 0FFFFh
		mov	[bp+var_8], 7D000h
		mov	eax, [bp+var_8]
		mov	es:[bx+129h], eax
		mov	[bp+var_C], 4600h
		mov	eax, [bp+var_C]
		mov	es:[bx+12Dh], eax
		mov	dword ptr es:[bx+0FDh], 0
		mov	dword ptr es:[bx+101h], 0
		mov	dword ptr es:[bx+105h], 3E800h
		mov	dword ptr es:[bx+136h], 12C00h
		mov	dword ptr es:[bx+13Ah], 0
		mov	dword ptr es:[bx+13Eh], 0
		mov	al, 0
		mov	es:[bx+0F9h], al
		mov	es:[bx+0FAh], al
		mov	es:[bx+0F8h], al
		mov	es:[bx+0F7h], al
		xor	eax, eax
		mov	es:[bx+15h], eax
		mov	es:[bx+11h], eax
		mov	es:[bx+0Dh], eax
		mov	es:[bx+0C4h], eax
		mov	es:[bx+0C0h], eax
		mov	es:[bx+0C8h], eax
		mov	es:[bx+0CCh], eax
		mov	es:[bx+0D0h], eax
		push	0
		mov	ax, word ptr [bp+arg_0]
		add	ax, 123h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_39519
		add	sp, 6
		push	0
		mov	ax, word ptr [bp+arg_0]
		add	ax, 131h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_39519
		add	sp, 6
		push	0
		mov	ax, word ptr [bp+arg_0]
		add	ax, 133h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_39519
		add	sp, 6
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+163h], 0
		mov	ax, word ptr [bp+arg_0]
		add	ax, 16Bh
		push	word ptr [bp+arg_0+2]
		push	ax
		push	ds
		push	offset unk_76B48
		mov	cx, 8
		call	CRT_Fmemcpy
		les	bx, word ptr [bp+arg_0]
		mov	eax, 0FFFFFF9Ch
		mov	es:[bx+152h], eax
		mov	es:[bx+14Eh], eax
		mov	es:[bx+0E7h], eax
		mov	es:[bx+142h], eax
		mov	es:[bx+148h], eax
		mov	es:[bx+0EFh], eax
		mov	byte ptr es:[bx+0EBh], 0
		mov	al, 0FFh
		mov	es:[bx+146h], al
		mov	es:[bx+147h], al
		mov	byte ptr es:[bx+164h], 0
		mov	word ptr es:[bx+1BBh], 0
		mov	dword ptr es:[bx+1BDh], 0
		mov	byte ptr es:[bx+19h], 0
		mov	[bp+var_10], 0
		mov	eax, [bp+var_10]
		mov	es:[bx+15Ah], eax
		mov	word ptr es:[bx+15Eh], 0
		mov	al, 0
		mov	es:[bx+162h], al
		mov	es:[bx+16Ah], al
		mov	es:[bx+169h], al
		mov	es:[bx+166h], al
		mov	es:[bx+168h], al
		mov	es:[bx+167h], al
		mov	es:[bx+1F9h], al
		mov	es:[bx+161h], al
		mov	es:[bx+160h], al
		mov	byte ptr es:[bx+165h], 1
		mov	byte ptr es:[bx+135h], 0
		mov	dword ptr es:[bx+156h], 0
		leave
		retf
sub_84CE8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_84F79		proc far

var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jnz	short loc_84F8E
		jmp	loc_85111

loc_84F8E:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 420h
		mov	ax, word ptr [bp+arg_0]
		add	ax, 4
		push	word ptr [bp+arg_0+2]
		push	ax
		call	Cursor_SlotFree
		add	sp, 4
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 1BDh
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		xor	di, di
		jmp	short loc_84FDE

loc_84FBC:
		les	bx, [bp+var_4]
		cmp	dword ptr es:[bx], 0
		jz	short loc_84FD9
		push	3
		push	large es:[bx]
		les	bx, es:[bx]
		mov	bx, es:[bx]
		call	dword ptr [bx]
		add	sp, 6
		jmp	short loc_84FD9

loc_84FD9:
		inc	di
		add	[bp+var_4], 5

loc_84FDE:
		les	bx, word ptr [bp+arg_0]
		cmp	es:[bx+1BBh], di
		jg	short loc_84FBC
		cmp	dword ptr es:[bx+0C0h], 0
		jz	short loc_85008
		push	3
		push	large es:[bx+0C0h]
		les	bx, es:[bx+0C0h]
		mov	bx, es:[bx]
		call	dword ptr [bx]
		add	sp, 6
		jmp	short loc_85008

loc_85008:
		les	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+0C8h], 0
		jz	short loc_8502B
		push	3
		push	large es:[bx+0C8h]
		les	bx, es:[bx+0C8h]
		mov	bx, es:[bx]
		call	dword ptr [bx]
		add	sp, 6
		jmp	short loc_8502B

loc_8502B:
		les	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+156h], 0
		jz	short loc_85045
		push	large es:[bx+156h]
		call	sub_3C0
		add	sp, 4

loc_85045:
		les	bx, word ptr [bp+arg_0]
		mov	dword ptr es:[bx+156h], 0
		mov	ax, word ptr [bp+arg_0]
		add	ax, 1F7h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_394FD
		add	sp, 4
		mov	ax, word ptr [bp+arg_0]
		add	ax, 1F5h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_394FD
		add	sp, 4
		mov	ax, word ptr [bp+arg_0]
		add	ax, 1F3h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_394FD
		add	sp, 4
		mov	ax, word ptr [bp+arg_0]
		add	ax, 1F1h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_394FD
		add	sp, 4
		mov	ax, word ptr [bp+arg_0]
		add	ax, 133h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_394FD
		add	sp, 4
		mov	ax, word ptr [bp+arg_0]
		add	ax, 131h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_394FD
		add	sp, 4
		mov	ax, word ptr [bp+arg_0]
		add	ax, 123h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_394FD
		add	sp, 4
		mov	ax, word ptr [bp+arg_0]
		add	ax, 0FBh
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_394FD
		add	sp, 4
		push	0
		push	large [bp+arg_0]
		call	SubObject_NotifyEvent
		add	sp, 6
		test	si, 1
		jz	short loc_85111
		mov	eax, [bp+arg_0]
		mov	[bp+var_8], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_8]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8

loc_85111:
		pop	di
		pop	si
		leave
		retf
sub_84F79		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_85115		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_85157
		push	0
		push	large [bp+arg_0]
		call	sub_10441
		add	sp, 6
		test	si, 1
		jz	short loc_85157
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_85157

loc_85157:
		pop	si
		leave
		retf
sub_85115		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8515A		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_8519C
		push	0
		push	large [bp+arg_0]
		call	sub_10441
		add	sp, 6
		test	si, 1
		jz	short loc_8519C
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_8519C

loc_8519C:
		pop	si
		leave
		retf
sub_8515A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8519F		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_851E1
		push	0
		push	large [bp+arg_0]
		call	sub_10441
		add	sp, 6
		test	si, 1
		jz	short loc_851E1
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_851E1

loc_851E1:
		pop	si
		leave
		retf
sub_8519F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_851E4		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_85226
		push	0
		push	large [bp+arg_0]
		call	sub_10441
		add	sp, 6
		test	si, 1
		jz	short loc_85226
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_85226

loc_85226:
		pop	si
		leave
		retf
sub_851E4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_85229		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_8527D
		mov	ax, word ptr [bp+arg_0]
		add	ax, 11h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_394FD
		add	sp, 4
		push	0
		push	large [bp+arg_0]
		call	sub_10441
		add	sp, 6
		test	si, 1
		jz	short loc_8527D
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_8527D

loc_8527D:
		pop	si
		leave
		retf
sub_85229		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_85280		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_852C2
		push	0
		push	large [bp+arg_0]
		call	sub_10441
		add	sp, 6
		test	si, 1
		jz	short loc_852C2
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_852C2

loc_852C2:
		pop	si
		leave
		retf
sub_85280		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_852C5		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_85307
		push	0
		push	large [bp+arg_0]
		call	sub_10441
		add	sp, 6
		test	si, 1
		jz	short loc_85307
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_85307

loc_85307:
		pop	si
		leave
		retf
sub_852C5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8530A		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_8535E
		mov	ax, word ptr [bp+arg_0]
		add	ax, 1Eh
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_394FD
		add	sp, 4
		push	0
		push	large [bp+arg_0]
		call	sub_10441
		add	sp, 6
		test	si, 1
		jz	short loc_8535E
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_8535E

loc_8535E:
		pop	si
		leave
		retf
sub_8530A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_85361		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_853C7
		mov	ax, word ptr [bp+arg_0]
		add	ax, 35h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_394FD
		add	sp, 4
		mov	ax, word ptr [bp+arg_0]
		add	ax, 33h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_394FD
		add	sp, 4
		push	0
		push	large [bp+arg_0]
		call	sub_10441
		add	sp, 6
		test	si, 1
		jz	short loc_853C7
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_853C7

loc_853C7:
		pop	si
		leave
		retf
sub_85361		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_853CA		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_8540C
		push	0
		push	large [bp+arg_0]
		call	sub_10441
		add	sp, 6
		test	si, 1
		jz	short loc_8540C
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_8540C

loc_8540C:
		pop	si
		leave
		retf
sub_853CA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8540F		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_85451
		push	0
		push	large [bp+arg_0]
		call	sub_10441
		add	sp, 6
		test	si, 1
		jz	short loc_85451
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_85451

loc_85451:
		pop	si
		leave
		retf
sub_8540F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_85454		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_85496
		push	0
		push	large [bp+arg_0]
		call	sub_10441
		add	sp, 6
		test	si, 1
		jz	short loc_85496
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_85496

loc_85496:
		pop	si
		leave
		retf
sub_85454		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à AircraftDamageModel_ReleaseStreamAndDestruct_7556A
; (sub_7556A de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, combine ResourceRecord_Helper_645A5 (seg193), StreamReader_ReleaseBuffer_65643
; (seg195), libère l'objet (sub_338).
; ==============================================================================================
AircraftDamageModel_ReleaseStreamAndDestruct_85499		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_854CB
		mov	word ptr [si], 520h
		push	si
		call	ResourceRecord_Helper_6D61E
		pop	cx
		push	0
		push	si
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		test	di, 1
		jz	short loc_854CB
		push	si
		call	sub_3B2
		pop	cx

loc_854CB:
		pop	di
		pop	si
		pop	bp
		retf
AircraftDamageModel_ReleaseStreamAndDestruct_85499		endp
ovr236		ends

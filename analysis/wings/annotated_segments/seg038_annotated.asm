seg038		segment	para public 'CODE' use16
		assume cs:seg038
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5, 0B8h, 1, 0, 0EBh, 2, 33h, 0C0h, 0EBh, 2

loc_1B42A:
		db 0B0h, 1, 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à SoundFX_FindFreeChannel_5C62E (sub_5C62E de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 7 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à SoundFX_FindFreeChannel_598A6 (sub_598A6 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. —
; Ex-'Weapon_HUDBox_TimerCaseC_598A6'. far. LUE 2026-10-06. Systeme d'effets sonores : 5
; canaux de sequence XMIDI a +0x92 (pas 0x11 : struct canal, +0xE = numero d'effet, 0x0F =
; libre, +0xF = emetteur). Renvoie le premier canal dont la sequence ne joue pas
; (AIL_sequence_status_603DE != 1), ou -1.
; ==============================================================================================
SoundFX_FindFreeChannel_1B42F		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		jmp	short loc_1B47F

loc_1B43B:
		mov	bx, di
		imul	bx, bx, 11h
		cmp	word ptr [bx+si+0F6h], 0
		jz	short loc_1B472
		mov	bx, di
		imul	bx, bx, 11h
		push	word ptr [bx+si+0F8h]
		mov	bx, di
		imul	bx, bx, 11h
		mov	bx, [bx+si+0F6h]
		push	word ptr [bx+4]
		call	sub_9CCF
		add	sp, 4
		cmp	ax, 1
		jnz	short loc_1B46E
		mov	ax, 1
		jmp	short loc_1B470

loc_1B46E:
		xor	ax, ax

loc_1B470:
		jmp	short loc_1B474

loc_1B472:
		mov	al, 0

loc_1B474:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1B47E
		mov	ax, di
		jmp	short loc_1B487

loc_1B47E:
		inc	di

loc_1B47F:
		cmp	di, 4
		jl	short loc_1B43B
		mov	ax, 0FFFFh

loc_1B487:
		pop	di
		pop	si
		pop	bp
		retf
SoundFX_FindFreeChannel_1B42F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à SoundFX_Play3D_5C68A (sub_5C68A de PACIFIC.EXE).
; Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à SoundFX_Play3D_59902 (sub_59902 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — Ex-'Weapon_HUDBox_TimerCaseD_59902'.
; far. LUE 2026-10-06. (systeme, effet, distance, emetteur) : volume = 100 - d/10 si d < 1000,
; 5 si d < 5000, sinon rien ; sur un canal libre : Music_ChannelRegisterSequence_59FF5
; (sequence de l'effet en systeme+6+effet x 10), AIL_set_relative_volume_603F0,
; AIL_start_sequence_603CC ; memorise effet et emetteur.
; ==============================================================================================
SoundFX_Play3D_1B48B		proc far

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= dword ptr  0Ah
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr SoundFX_FindFreeChannel_1B42F
		pop	cx
		mov	dx, ax
		cmp	dx, 0FFFFh
		jnz	short loc_1B4A6
		jmp	loc_1B558

loc_1B4A6:
		imul	ax, ax, 11h
		mov	dx, si
		add	dx, ax
		add	dx, 0F6h
		mov	[bp+var_2], dx
		cmp	[bp+arg_4], 3E8h
		jge	short loc_1B4D4
		mov	eax, [bp+arg_4]
		mov	ebx, 0Ah
		cdq
		idiv	ebx
		mov	di, 64h
		sub	di, ax
		jmp	short loc_1B4E1

loc_1B4D4:
		cmp	[bp+arg_4], 1388h
		jge	short loc_1B4E1
		mov	di, 5

loc_1B4E1:
		or	di, di
		jge	short loc_1B4E9
		xor	ax, ax
		jmp	short loc_1B4EB

loc_1B4E9:
		mov	ax, di

loc_1B4EB:
		mov	[bp+var_4], ax
		cmp	[bp+var_4], 0
		jz	short loc_1B558
		mov	di, [bp+var_2]
		push	0
		mov	al, [bp+arg_2]
		mov	ah, 0
		imul	ax, ax, 0Ah
		mov	dx, si
		add	dx, ax
		add	dx, 6
		push	dx
		push	di
		call	sub_1A769
		add	sp, 6
		mov	ax, [bp+var_4]
		mov	[bp+var_6], ax
		cmp	word ptr [di], 0
		jz	short loc_1B532
		push	0
		push	ax
		push	word ptr [di+2]
		mov	bx, [di]
		push	word ptr [bx+4]
		call	sub_9CE1
		add	sp, 8
		jmp	short loc_1B532

loc_1B532:
		cmp	word ptr [di], 0
		jz	short loc_1B549
		push	word ptr [di+2]
		mov	bx, [di]
		push	word ptr [bx+4]
		call	sub_9CBD
		add	sp, 4
		jmp	short loc_1B549

loc_1B549:
		mov	bx, [bp+var_2]
		mov	al, [bp+arg_2]
		mov	[bx+0Eh], al
		mov	ax, [bp+arg_8]
		mov	[bx+0Fh], ax

loc_1B558:
		pop	di
		pop	si
		leave
		retf
SoundFX_Play3D_1B48B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à SoundFX_UpdateVolume3D_5C75B (sub_5C75B de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à SoundFX_UpdateVolume3D_599D3 (sub_599D3 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. —
; Ex-'Weapon_HUDBox_TimerCaseE_599D3'. far. LUE 2026-10-06. Meme loi de volume que
; SoundFX_Play3D_59902 pour l'effet (effet, emetteur) en cours ; volume nul ->
; Music_ChannelStopSequence_59F1D et canal libere.
; ==============================================================================================
SoundFX_UpdateVolume3D_1B55C		proc far

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= dword ptr  0Ah
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	loc_1B606

loc_1B56F:
		mov	ax, [bp+var_2]
		imul	ax, ax, 11h
		mov	di, si
		add	di, ax
		add	di, 0F6h
		mov	al, [di+0Eh]
		cmp	al, [bp+arg_2]
		jnz	short loc_1B603
		mov	ax, [di+0Fh]
		cmp	ax, [bp+arg_8]
		jnz	short loc_1B603
		cmp	[bp+arg_4], 3E8h
		jge	short loc_1B5B0
		mov	eax, [bp+arg_4]
		mov	ebx, 0Ah
		cdq
		idiv	ebx
		mov	dx, 64h
		sub	dx, ax
		mov	[bp+var_4], dx
		jmp	short loc_1B5BF

loc_1B5B0:
		cmp	[bp+arg_4], 1388h
		jge	short loc_1B5BF
		mov	[bp+var_4], 5

loc_1B5BF:
		cmp	[bp+var_4], 0
		jge	short loc_1B5C9
		xor	ax, ax
		jmp	short loc_1B5CC

loc_1B5C9:
		mov	ax, [bp+var_4]

loc_1B5CC:
		mov	dx, ax
		or	dx, dx
		jz	short loc_1B5F3
		mov	[bp+var_6], dx
		cmp	word ptr [di], 0
		jz	short loc_1B5F1
		push	0
		push	[bp+var_6]
		push	word ptr [di+2]
		mov	bx, [di]
		push	word ptr [bx+4]
		call	sub_9CE1
		add	sp, 8
		jmp	short loc_1B603

loc_1B5F1:
		jmp	short loc_1B603

loc_1B5F3:
		push	di
		call	Music_ChannelStopSequence_1A6AA
		pop	cx
		mov	byte ptr [di+0Eh], 19h
		mov	word ptr [di+0Fh], 0

loc_1B603:
		inc	[bp+var_2]

loc_1B606:
		cmp	[bp+var_2], 4
		jge	short loc_1B60F
		jmp	loc_1B56F

loc_1B60F:
		pop	di
		pop	si
		leave
		retf
SoundFX_UpdateVolume3D_1B55C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à SoundFX_StopEffect_5C812 (sub_5C812 de PACIFIC.EXE).
; Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à SoundFX_StopEffect_59A8A (sub_59A8A de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. —
; Ex-'Weapon_HUDBox_TimerCaseF_59A8A'. far. LUE 2026-10-06. Arrete l'effet (effet, emetteur)
; et libere son canal.
; ==============================================================================================
SoundFX_StopEffect_1B613		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_1B656

loc_1B625:
		mov	ax, [bp+var_2]
		imul	ax, ax, 11h
		mov	di, si
		add	di, ax
		add	di, 0F6h
		mov	al, [di+0Eh]
		cmp	al, [bp+arg_2]
		jnz	short loc_1B653
		mov	ax, [di+0Fh]
		cmp	ax, [bp+arg_4]
		jnz	short loc_1B653
		push	di
		call	Music_ChannelStopSequence_1A6AA
		pop	cx
		mov	byte ptr [di+0Eh], 19h
		mov	word ptr [di+0Fh], 0

loc_1B653:
		inc	[bp+var_2]

loc_1B656:
		cmp	[bp+var_2], 4
		jl	short loc_1B625
		pop	di
		pop	si
		leave
		retf
SoundFX_StopEffect_1B613		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à SoundFX_IsPlaying_5C85F (sub_5C85F de PACIFIC.EXE).
; Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à SoundFX_IsPlaying_59AD7 (sub_59AD7 de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. —
; Ex-'Weapon_HUDBox_TimerCaseG_59AD7'. far. LUE 2026-10-06. Vrai si l'effet (effet, emetteur)
; occupe un canal.
; ==============================================================================================
SoundFX_IsPlaying_1B660		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	cx, [bp+arg_0]
		xor	di, di
		jmp	short loc_1B68E

loc_1B66C:
		mov	ax, di
		imul	ax, ax, 11h
		mov	si, cx
		add	si, ax
		add	si, 0F6h
		mov	al, [si+0Eh]
		cmp	al, [bp+arg_2]
		jnz	short loc_1B68D
		mov	ax, [si+0Fh]
		cmp	ax, [bp+arg_4]
		jnz	short loc_1B68D
		mov	al, 1
		jmp	short loc_1B695

loc_1B68D:
		inc	di

loc_1B68E:
		cmp	di, 4
		jl	short loc_1B66C
		mov	al, 0

loc_1B695:
		pop	di
		pop	si
		pop	bp
		retf
SoundFX_IsPlaying_1B660		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1B699		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_1B699		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1B6A1		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_4], 0
		jmp	short loc_1B70C
		mov	ax, [bp+var_4]
		imul	ax, ax, 11h
		mov	dx, si
		add	dx, ax
		add	dx, 0F6h
		mov	[bp+var_2], dx
		mov	bx, [bp+var_2]
		cmp	byte ptr [bx+0Eh], 19h
		jz	short loc_1B709
		mov	di, [bp+var_2]
		cmp	word ptr [di], 0
		jz	short loc_1B6F3
		push	word ptr [di+2]
		mov	bx, [di]
		push	word ptr [bx+4]
		call	sub_9CCF
		add	sp, 4
		cmp	ax, 2
		jnz	short loc_1B6EF
		mov	ax, 1
		jmp	short loc_1B6F1

loc_1B6EF:
		xor	ax, ax

loc_1B6F1:
		jmp	short loc_1B6F5

loc_1B6F3:
		mov	al, 1

loc_1B6F5:
		or	al, al
		jz	short loc_1B709
		push	[bp+var_2]
		call	Music_ChannelStopSequence_1A6AA
		pop	cx
		mov	bx, [bp+var_2]
		mov	byte ptr [bx+0Eh], 19h

loc_1B709:
		inc	[bp+var_4]

loc_1B70C:
		cmp	[bp+var_4], 4
sub_1B6A1		endp
seg038		ends

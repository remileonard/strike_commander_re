seg134		segment	para public 'CODE' use16
		assume cs:seg134
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 2, 68h, 41h, 69h, 9Ah, 0B3h, 2, 0A5h, 1Ch, 83h, 0C4h, 4, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 7 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à SoundFX_FindFreeChannel_598A6 (sub_598A6 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. —
; Ex-'Weapon_HUDBox_TimerCaseC_598A6'. far. LUE 2026-10-06. Systeme d'effets sonores : 5
; canaux de sequence XMIDI a +0x92 (pas 0x11 : struct canal, +0xE = numero d'effet, 0x0F =
; libre, +0xF = emetteur). Renvoie le premier canal dont la sequence ne joue pas
; (AIL_sequence_status_603DE != 1), ou -1.
; ==============================================================================================
SoundFX_FindFreeChannel_5C62E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		jmp	short loc_5C67E

loc_5C63A:
		mov	bx, di
		imul	bx, bx, 11h
		cmp	word ptr [bx+si+114h], 0
		jz	short loc_5C671
		mov	bx, di
		imul	bx, bx, 11h
		push	word ptr [bx+si+116h]
		mov	bx, di
		imul	bx, bx, 11h
		mov	bx, [bx+si+114h]
		push	word ptr [bx+4]
		call	sub_1DC07
		add	sp, 4
		cmp	ax, 1
		jnz	short loc_5C66D
		mov	ax, 1
		jmp	short loc_5C66F

loc_5C66D:
		xor	ax, ax

loc_5C66F:
		jmp	short loc_5C673

loc_5C671:
		mov	al, 0

loc_5C673:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5C67D
		mov	ax, di
		jmp	short loc_5C686

loc_5C67D:
		inc	di

loc_5C67E:
		cmp	di, 1
		jl	short loc_5C63A
		mov	ax, 0FFFFh

loc_5C686:
		pop	di
		pop	si
		pop	bp
		retf
SoundFX_FindFreeChannel_5C62E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à SoundFX_Play3D_59902 (sub_59902 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. —
; Ex-'Weapon_HUDBox_TimerCaseD_59902'. far. LUE 2026-10-06. (systeme, effet, distance,
; emetteur) : volume = 100 - d/10 si d < 1000, 5 si d < 5000, sinon rien ; sur un canal libre
; : Music_ChannelRegisterSequence_59FF5 (sequence de l'effet en systeme+6+effet x 10),
; AIL_set_relative_volume_603F0, AIL_start_sequence_603CC ; memorise effet et emetteur.
; ==============================================================================================
SoundFX_Play3D_5C68A		proc far

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
		call	near ptr SoundFX_FindFreeChannel_5C62E
		pop	cx
		mov	dx, ax
		cmp	dx, 0FFFFh
		jnz	short loc_5C6A5
		jmp	loc_5C757

loc_5C6A5:
		imul	ax, ax, 11h
		mov	dx, si
		add	dx, ax
		add	dx, 114h
		mov	[bp+var_2], dx
		cmp	[bp+arg_4], 3E8h
		jge	short loc_5C6D3
		mov	eax, [bp+arg_4]
		mov	ebx, 0Ah
		cdq
		idiv	ebx
		mov	di, 64h
		sub	di, ax
		jmp	short loc_5C6E0

loc_5C6D3:
		cmp	[bp+arg_4], 1388h
		jge	short loc_5C6E0
		mov	di, 5

loc_5C6E0:
		or	di, di
		jge	short loc_5C6E8
		xor	ax, ax
		jmp	short loc_5C6EA

loc_5C6E8:
		mov	ax, di

loc_5C6EA:
		mov	[bp+var_4], ax
		cmp	[bp+var_4], 0
		jz	short loc_5C757
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
		call	sub_5C9C1
		add	sp, 6
		mov	ax, [bp+var_4]
		mov	[bp+var_6], ax
		cmp	word ptr [di], 0
		jz	short loc_5C731
		push	0
		push	ax
		push	word ptr [di+2]
		mov	bx, [di]
		push	word ptr [bx+4]
		call	sub_1DC19
		add	sp, 8
		jmp	short loc_5C731

loc_5C731:
		cmp	word ptr [di], 0
		jz	short loc_5C748
		push	word ptr [di+2]
		mov	bx, [di]
		push	word ptr [bx+4]
		call	sub_1DBF5
		add	sp, 4
		jmp	short loc_5C748

loc_5C748:
		mov	bx, [bp+var_2]
		mov	al, [bp+arg_2]
		mov	[bx+0Eh], al
		mov	ax, [bp+arg_8]
		mov	[bx+0Fh], ax

loc_5C757:
		pop	di
		pop	si
		leave
		retf
SoundFX_Play3D_5C68A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à SoundFX_UpdateVolume3D_599D3 (sub_599D3 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. —
; Ex-'Weapon_HUDBox_TimerCaseE_599D3'. far. LUE 2026-10-06. Meme loi de volume que
; SoundFX_Play3D_59902 pour l'effet (effet, emetteur) en cours ; volume nul ->
; Music_ChannelStopSequence_59F1D et canal libere.
; ==============================================================================================
SoundFX_UpdateVolume3D_5C75B		proc far

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
		jmp	loc_5C805

loc_5C76E:
		mov	ax, [bp+var_2]
		imul	ax, ax, 11h
		mov	di, si
		add	di, ax
		add	di, 114h
		mov	al, [di+0Eh]
		cmp	al, [bp+arg_2]
		jnz	short loc_5C802
		mov	ax, [di+0Fh]
		cmp	ax, [bp+arg_8]
		jnz	short loc_5C802
		cmp	[bp+arg_4], 3E8h
		jge	short loc_5C7AF
		mov	eax, [bp+arg_4]
		mov	ebx, 0Ah
		cdq
		idiv	ebx
		mov	dx, 64h
		sub	dx, ax
		mov	[bp+var_4], dx
		jmp	short loc_5C7BE

loc_5C7AF:
		cmp	[bp+arg_4], 1388h
		jge	short loc_5C7BE
		mov	[bp+var_4], 5

loc_5C7BE:
		cmp	[bp+var_4], 0
		jge	short loc_5C7C8
		xor	ax, ax
		jmp	short loc_5C7CB

loc_5C7C8:
		mov	ax, [bp+var_4]

loc_5C7CB:
		mov	dx, ax
		or	dx, dx
		jz	short loc_5C7F2
		mov	[bp+var_6], dx
		cmp	word ptr [di], 0
		jz	short loc_5C7F0
		push	0
		push	[bp+var_6]
		push	word ptr [di+2]
		mov	bx, [di]
		push	word ptr [bx+4]
		call	sub_1DC19
		add	sp, 8
		jmp	short loc_5C802

loc_5C7F0:
		jmp	short loc_5C802

loc_5C7F2:
		push	di
		call	Music_ChannelStopSequence_5C915
		pop	cx
		mov	byte ptr [di+0Eh], 1Ch
		mov	word ptr [di+0Fh], 0

loc_5C802:
		inc	[bp+var_2]

loc_5C805:
		cmp	[bp+var_2], 1
		jge	short loc_5C80E
		jmp	loc_5C76E

loc_5C80E:
		pop	di
		pop	si
		leave
		retf
SoundFX_UpdateVolume3D_5C75B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à SoundFX_StopEffect_59A8A (sub_59A8A de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. —
; Ex-'Weapon_HUDBox_TimerCaseF_59A8A'. far. LUE 2026-10-06. Arrete l'effet (effet, emetteur)
; et libere son canal.
; ==============================================================================================
SoundFX_StopEffect_5C812		proc far

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
		jmp	short loc_5C855

loc_5C824:
		mov	ax, [bp+var_2]
		imul	ax, ax, 11h
		mov	di, si
		add	di, ax
		add	di, 114h
		mov	al, [di+0Eh]
		cmp	al, [bp+arg_2]
		jnz	short loc_5C852
		mov	ax, [di+0Fh]
		cmp	ax, [bp+arg_4]
		jnz	short loc_5C852
		push	di
		call	Music_ChannelStopSequence_5C915
		pop	cx
		mov	byte ptr [di+0Eh], 1Ch
		mov	word ptr [di+0Fh], 0

loc_5C852:
		inc	[bp+var_2]

loc_5C855:
		cmp	[bp+var_2], 1
		jl	short loc_5C824
		pop	di
		pop	si
		leave
		retf
SoundFX_StopEffect_5C812		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à SoundFX_IsPlaying_59AD7 (sub_59AD7 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. —
; Ex-'Weapon_HUDBox_TimerCaseG_59AD7'. far. LUE 2026-10-06. Vrai si l'effet (effet, emetteur)
; occupe un canal.
; ==============================================================================================
SoundFX_IsPlaying_5C85F		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	cx, [bp+arg_0]
		xor	di, di
		jmp	short loc_5C88D

loc_5C86B:
		mov	ax, di
		imul	ax, ax, 11h
		mov	si, cx
		add	si, ax
		add	si, 114h
		mov	al, [si+0Eh]
		cmp	al, [bp+arg_2]
		jnz	short loc_5C88C
		mov	ax, [si+0Fh]
		cmp	ax, [bp+arg_4]
		jnz	short loc_5C88C
		mov	al, 1
		jmp	short loc_5C894

loc_5C88C:
		inc	di

loc_5C88D:
		cmp	di, 1
		jl	short loc_5C86B
		mov	al, 0

loc_5C894:
		pop	di
		pop	si
		pop	bp
		retf
SoundFX_IsPlaying_5C85F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5C898		proc far

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
		jmp	short loc_5C903

loc_5C8AA:
		mov	ax, [bp+var_4]
		imul	ax, ax, 11h
		mov	dx, si
		add	dx, ax
		add	dx, 114h
		mov	[bp+var_2], dx
		mov	bx, [bp+var_2]
		cmp	byte ptr [bx+0Eh], 1Ch
		jz	short loc_5C900
		mov	di, [bp+var_2]
		cmp	word ptr [di], 0
		jz	short loc_5C8EA
		push	word ptr [di+2]
		mov	bx, [di]
		push	word ptr [bx+4]
		call	sub_1DC07
		add	sp, 4
		cmp	ax, 2
		jnz	short loc_5C8E6
		mov	ax, 1
		jmp	short loc_5C8E8

loc_5C8E6:
		xor	ax, ax

loc_5C8E8:
		jmp	short loc_5C8EC

loc_5C8EA:
		mov	al, 1

loc_5C8EC:
		or	al, al
		jz	short loc_5C900
		push	[bp+var_2]
		call	Music_ChannelStopSequence_5C915
		pop	cx
		mov	bx, [bp+var_2]
		mov	byte ptr [bx+0Eh], 1Ch

loc_5C900:
		inc	[bp+var_4]

loc_5C903:
		cmp	[bp+var_4], 1
		jl	short loc_5C8AA
		pop	di
		pop	si
		leave
		retf
sub_5C898		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5C90D		proc far
		push	bp
		mov	bp, sp
sub_5C90D		endp
seg134		ends

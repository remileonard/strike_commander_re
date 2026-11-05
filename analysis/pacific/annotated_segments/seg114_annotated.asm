seg114		segment	para public 'CODE' use16
		assume cs:seg114
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0, 0, 0, 0, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; JDYN_IsEngineDestroyed_47FCD (sub_47FCD de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — Ex-'Physics_TestGlobalWindActive' (nom errone :
; aucun vent). far, 52L, LUE 2026-09-25. Appelle la methode +0x34 de la vtable secondaire (=
; JDYN_UpdateDamageGains_494DD, recalcule les gains de degats), puis renvoie 1 si dword_72A2C
; (gain moteur) == 0 (cmp dword_72A2C,0 / jnz / mov ax,1), sinon 0. Test 'moteur detruit',
; appele depuis UIScreen_RenderOrLayoutList_54503.
; ==============================================================================================
JDYN_IsEngineDestroyed_47CA6		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si+2]
		call	dword ptr [bx+34h]
		pop	cx
		cmp	dword_7CE36, 0
		jnz	short loc_47CC2
		mov	ax, 1
		jmp	short loc_47CC4

loc_47CC2:
		xor	ax, ax

loc_47CC4:
		or	al, al
		jz	short loc_47CCC
		mov	al, 1
		jmp	short loc_47CCE

loc_47CCC:
		mov	al, 0

loc_47CCE:
		pop	si
		pop	bp
		retf
JDYN_IsEngineDestroyed_47CA6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_47CD1		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		cmp	word_7CB07, 0
		jnz	short loc_47CF9
		mov	bx, [si]
		mov	bx, [bx+1Eh]
		les	bx, [bx+5Fh]
		mov	eax, es:[bx+28h]
		sar	eax, 8
		mov	[bp+var_4], eax
		jmp	short loc_47D01

loc_47CF9:
		mov	[bp+var_4], 0

loc_47D01:
		mov	bx, [si]
		mov	ax, [bx+1Eh]
		cmp	ax, word_7CADA
		mov	bx, [si]
		mov	eax, [bx+1Ah]
		sar	eax, 8
		mov	edx, [si+8Ah]
		sar	edx, 8
		add	eax, edx
		add	eax, [bp+var_4]
		mov	[bp+var_8], eax
		shld	edx, eax, 10h
		pop	si
		leave
		retf
sub_47CD1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. Comparée le 2026-11-05 à Aero_ComputeDragFromFlags75 de STRIKE.EXE : même calcul
; (constantes identiques une fois compensé le décalage des champs de JDYN en mémoire : +17,
; +29 au-delà de +128) ; différences de forme seulement (résultat rendu par adresse d'une
; variable globale, cache une fois par image).
; ==============================================================================================
Aero_ComputeDragFromFlags_47D30		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	byte_79464, 0
		jnz	short loc_47D43
		inc	byte_79464

loc_47D43:
		mov	dword_7CE3A, 100h
		mov	al, [si+92h]
		and	ax, 1
		or	al, al
		jz	short loc_47D9A
		mov	di, si
		add	di, 48h
		mov	eax, [di]
		add	dword_7CE3A, eax
		mov	al, [si+92h]
		shr	ax, 2
		and	ax, 1
		or	al, al
		jz	short loc_47D7F

loc_47D72:
		mov	di, si
		add	di, 4Ch
		mov	eax, [di]
		add	dword_7CE3A, eax

loc_47D7F:
		mov	si, [si+10h]
		add	si, 10h
		mov	eax, dword_7CE3A
		mov	edx, [si]
		imul	edx
		shrd	eax, edx, 8
		mov	dword_7CE3A, eax
		jmp	short loc_47DB3

loc_47D9A:
		mov	al, [si+92h]
		shr	ax, 2
		and	ax, 1
		or	al, al
		jnz	short loc_47D72
		mov	bx, [si+10h]
		mov	eax, [bx+10h]
		mov	dword_7CE3A, eax

loc_47DB3:
		mov	ax, 670Ah
		pop	di
		pop	si
		pop	bp
		retf
Aero_ComputeDragFromFlags_47D30		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. Comparée le 2026-11-05 à Aero_ComputeAoAWithTrim_480CA de STRIKE.EXE : même calcul
; (constantes identiques une fois compensé le décalage des champs de JDYN en mémoire : +17,
; +29 au-delà de +128) ; différences de forme seulement (résultat rendu par adresse d'une
; variable globale, cache une fois par image).
; ==============================================================================================
Aero_ComputeAoAWithTrim_47DBA		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		cmp	byte_79465, 0
		jnz	short loc_47DCF
		inc	byte_79465

loc_47DCF:
		push	si
		call	Aero_FlowAngle_AoA_46922
		pop	cx
		mov	bx, ax
		mov	eax, [bx]
		mov	dword_7CE3E, eax
		mov	al, [si+5Dh]
		mov	ah, 0
		mov	[bp+var_2], ax
		movsx	eax, [bp+var_2]
		shl	eax, 8
		add	dword_7CE3E, eax
		mov	al, [si+92h]
		shr	ax, 1
		and	ax, 1
		or	al, al
		jz	short loc_47E18
		mov	al, [si+5Eh]
		mov	ah, 0
		mov	[bp+var_4], ax
		movsx	eax, [bp+var_4]
		shl	eax, 8
		add	dword_7CE3E, eax

loc_47E18:
		mov	ax, 670Eh
		pop	si
		leave
		retf
Aero_ComputeAoAWithTrim_47DBA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05. Comme Aero_ComputeLiftAndSideForce_4812B de STRIKE (portance
; k·dword_7CE2E·α_eff·q, force latérale), avec : (1) force latérale k÷8 au lieu de k÷4 (sar
; eax, 3) ; (2) DÉCROCHAGE aussi par la vitesse : si |α_eff| > α_décrochage (jdyn[5Ch]) OU si
; la vitesse est sous Vs = partie entière du dernier champ de THRS ([si+41h], ÷8 de moins si
; le bit 1 de [si+92h] est posé) ; (3) le décrochage (portance nulle, bit 6 = pas au sol)
; n'est appliqué que si word_7977C > 10 images, l'objet est celui de word_7CADA (joueur) ET
; word_7CB07 < 2 (option de difficulté : à 2, pas de décrochage).
; ==============================================================================================
Aero_ComputeLiftAndSideForce_47E1E		proc far

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
var_40		= dword ptr -40h
var_3C		= word ptr -3Ch
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_32		= word ptr -32h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= word ptr -28h
var_26		= word ptr -26h
var_24		= dword ptr -24h
var_20		= word ptr -20h
var_1E		= dword ptr -1Eh
var_1A		= word ptr -1Ah
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= word ptr -0Ch
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 66h
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	byte_79466, 0
		jnz	short loc_47E34
		inc	byte_79466

loc_47E34:
		push	word ptr [si]
		call	Physics_ResolveWindVectorCached_463B3
		pop	cx
		mov	di, ax
		push	si
		push	cs
		call	near ptr Aero_ComputeAoAWithTrim_47DBA
		pop	cx
		mov	[bp+var_6], ax
		mov	bx, [bp+var_6]
		mov	eax, [bx]
		mov	[bp+var_4], eax
		push	si
		call	Aero_FlowAngle_Sideslip_469CA
		pop	cx
		mov	[bp+var_C], ax
		mov	bx, [bp+var_C]
		mov	eax, [bx]
		mov	[bp+var_A], eax
		mov	eax, [bp+var_4]
		or	eax, eax
		jge	short loc_47E71
		neg	eax

loc_47E71:
		mov	[bp+var_10], eax
		mov	eax, [bp+var_A]
		or	eax, eax
		jge	short loc_47E81
		neg	eax

loc_47E81:
		mov	[bp+var_14], eax
		push	word ptr [si+10h]
		call	Aero_DynamicPressure_46C16
		pop	cx
		mov	[bp+var_1A], ax
		mov	bx, [bp+var_1A]
		mov	eax, [bx]
		mov	[bp+var_18], eax
		sar	eax, 8
		mov	[bp+var_18], eax
		mov	ax, si
		add	ax, 72h
		mov	[bp+var_20], ax
		mov	bx, [bp+var_20]
		mov	eax, [bx]
		mov	[bp+var_1E], eax
		sar	eax, 3
		mov	[bp+var_1E], eax
		mov	al, [si+5Ch]
		mov	ah, 0
		mov	[bp+var_26], ax
		movsx	eax, [bp+var_26]
		shl	eax, 8
		mov	[bp+var_24], eax
		mov	ax, [si+41h]
		mov	[bp+var_28], ax
		mov	al, [si+92h]
		shr	ax, 1
		and	ax, 1
		or	al, al
		jz	short loc_47EEE
		mov	ax, [si+41h]
		sar	ax, 3
		sub	[bp+var_28], ax

loc_47EEE:
		mov	eax, [bp+var_10]
		cmp	eax, [bp+var_24]
		jg	short loc_47F4D
		mov	bx, [si]
		push	word ptr [bx+1Eh]
		push	ss
		lea	ax, word ptr [bp+var_5A]
		push	ax
		mov	bx, [bx+1Eh]
		mov	bx, [bx]
		call	dword ptr [bx+50h]
		add	sp, 6
		push	large [bp+var_52]
		push	large [bp+var_56]
		push	large [bp+var_5A]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_2C], eax
		mov	[bp+var_30], eax
		mov	ax, [bp+var_28]
		mov	[bp+var_32], ax
		movsx	eax, [bp+var_32]
		shl	eax, 8
		cmp	eax, [bp+var_30]
		jle	short loc_47F47
		mov	ax, 1
		jmp	short loc_47F49

loc_47F47:
		xor	ax, ax

loc_47F49:
		or	al, al
		jz	short loc_47F91

loc_47F4D:
		cmp	word_7977C, 0Ah
		jbe	short loc_47F91
		cmp	word_7CB07, 2
		jge	short loc_47F91
		mov	bx, [si]
		mov	ax, [bx+1Eh]
		cmp	ax, word_7CADA
		jnz	short loc_47F91
		xor	eax, eax
		mov	dword_7CE4A, eax
		mov	dword_7CE46, eax
		mov	dword_7CE42, eax
		mov	al, [bx+20h]
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		and	ax, 1
		and	byte ptr [si+92h], 0BFh
		shl	al, 6
		or	[si+92h], al
		jmp	loc_4806E

loc_47F91:
		mov	eax, [bp+var_4]
		cmp	eax, [bp+var_24]
		jle	short loc_47FA1
		mov	eax, [bp+var_24]
		jmp	short loc_47FB5

loc_47FA1:
		mov	eax, [bp+var_24]
		neg	eax
		cmp	eax, [bp+var_4]
		jle	short loc_47FB9
		mov	eax, [bp+var_24]
		neg	eax

loc_47FB5:
		mov	[bp+var_4], eax

loc_47FB9:
		mov	ax, si
		add	ax, 72h
		mov	[bp+var_42], ax
		mov	bx, [bp+var_42]
		mov	eax, [bx]
		mov	[bp+var_40], eax
		mov	eax, [bp+var_40]
		mov	edx, dword_7CE2E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_40], eax
		mov	eax, [bp+var_40]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_40], eax
		mov	eax, [bp+var_40]
		mov	edx, [bp+var_18]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_40], eax
		mov	dword_7CE42, 0
		mov	eax, [di+8]
		neg	eax
		mov	dword_7CE46, eax
		mov	eax, [di+4]
		mov	dword_7CE4A, eax
		push	6712h
		call	Vector_NormalizeInPlace_57715
		pop	cx
		mov	eax, dword_7CE42
		mov	edx, [bp+var_40]
		imul	edx
		shrd	eax, edx, 8
		mov	dword_7CE42, eax
		mov	eax, dword_7CE46
		mov	edx, [bp+var_40]
		imul	edx
		shrd	eax, edx, 8
		mov	dword_7CE46, eax
		mov	eax, dword_7CE4A
		mov	edx, [bp+var_40]
		imul	edx
		shrd	eax, edx, 8
		mov	dword_7CE4A, eax
		and	byte ptr [si+92h], 0BFh

loc_4806E:
		mov	eax, [bp+var_14]
		cmp	eax, [bp+var_24]
		jg	short loc_480E7
		mov	bx, [si]
		push	word ptr [bx+1Eh]
		push	ss
		lea	ax, word ptr [bp+var_66]
		push	ax
		mov	bx, [bx+1Eh]
		mov	bx, [bx]
		call	dword ptr [bx+50h]
		add	sp, 6
		push	large [bp+var_5E]
		push	large [bp+var_62]
		push	large [bp+var_66]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_36], eax
		mov	[bp+var_3A], eax
		mov	ax, [si+9Fh]
		mov	[bp+var_3C], ax
		movsx	eax, [bp+var_3C]
		shl	eax, 8
		cmp	eax, [bp+var_3A]
		jle	short loc_480C8
		mov	ax, 1
		jmp	short loc_480CA

loc_480C8:
		xor	ax, ax

loc_480CA:
		or	al, al
		jz	short loc_480F9
		cmp	word_7977C, 0Ah
		jbe	short loc_480F9
		cmp	word_7CB07, 2
		jge	short loc_480F9
		mov	bx, [si]
		mov	ax, [bx+1Eh]
		cmp	ax, word_7CADA
		jnz	short loc_480F9

loc_480E7:
		xor	eax, eax
		mov	[bp+var_46], eax
		mov	[bp+var_4A], eax
		mov	[bp+var_4E], eax
		jmp	loc_48189

loc_480F9:
		mov	eax, [bp+var_1E]
		mov	[bp+var_40], eax
		mov	eax, [bp+var_40]
		mov	edx, [bp+var_A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_40], eax
		mov	eax, [bp+var_40]
		mov	edx, [bp+var_18]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_40], eax
		mov	eax, [di+4]
		mov	[bp+var_4E], eax
		mov	eax, [di]
		neg	eax
		mov	[bp+var_4A], eax
		mov	[bp+var_46], 0
		lea	ax, word ptr [bp+var_4E]
		push	ax
		call	Vector_NormalizeInPlace_57715
		pop	cx
		mov	eax, [bp+var_4E]
		mov	edx, [bp+var_40]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4E], eax
		mov	eax, [bp+var_4A]
		mov	edx, [bp+var_40]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4A], eax
		mov	eax, [bp+var_46]
		mov	edx, [bp+var_40]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_46], eax

loc_48189:
		mov	eax, [bp+var_4E]
		add	dword_7CE42, eax
		mov	eax, [bp+var_4A]
		add	dword_7CE46, eax
		mov	eax, [bp+var_46]
		add	dword_7CE4A, eax
		mov	ax, 6712h
		pop	di
		pop	si
		leave
		retf
Aero_ComputeLiftAndSideForce_47E1E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05. Comme Aero_ComputeDragWithFeedback_48400 de STRIKE (traînée = q·(k·α'²
; + k/8·β² + traînée des drapeaux), terme au sol, direction opposée au flux), avec : option
; word_7CB07 = 1 : la part de |α_eff| au-delà de L = calage (jdyn[5Dh]) + 1 compte × 0,797 (α
; < 0) ou × 0,656 (α > 0) ; = 2 : × 0,5 ou × 0,328 ; = 0 : inchangé. Bloc « V > Vref
; (jdyn[9Dh]) : vecteur de [si+10h] × V/Vref » sans effet (vecteur réécrit ensuite à
; loc_4862A).
; ==============================================================================================
Aero_ComputeDragWithFeedback_481AB		proc far

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
var_3C		= dword ptr -3Ch
var_38		= word ptr -38h
var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2E		= word ptr -2Eh
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= word ptr -24h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= word ptr -12h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, si
		add	di, 6Eh
		mov	eax, [di]
		mov	[bp+var_4], eax
		sar	eax, 3
		mov	[bp+var_4], eax
		push	si
		push	cs
		call	near ptr Aero_ComputeAoAWithTrim_47DBA
		pop	cx
		mov	di, ax
		mov	eax, [di]
		mov	[bp+var_8], eax
		push	si
		call	Aero_FlowAngle_Sideslip_469CA
		pop	cx
		mov	di, ax
		mov	eax, [di]
		mov	[bp+var_C], eax
		mov	al, [si+5Dh]
		mov	ah, 0
		inc	ax
		mov	[bp+var_12], ax
		movsx	eax, [bp+var_12]
		shl	eax, 8
		mov	[bp+var_10], eax
		mov	ax, word_7CB07
		cmp	ax, 1
		jz	short loc_48212
		cmp	ax, 2
		jnz	short loc_4820F
		jmp	loc_48316

loc_4820F:
		jmp	loc_48410

loc_48212:
		cmp	[bp+var_8], 0
		jl	short loc_4821C
		jmp	loc_482A8

loc_4821C:
		mov	eax, [bp+var_10]
		neg	eax
		cmp	eax, [bp+var_8]
		jg	short loc_4822C
		jmp	loc_48410

loc_4822C:
		mov	eax, [bp+var_8]
		neg	eax
		sub	eax, [bp+var_10]
		mov	[bp+var_48], eax
		shl	eax, 8
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_4C]
		mov	[bp+var_44], eax
		mov	[bp+var_50], 0CCh
		mov	eax, [bp+var_44]
		mov	edx, [bp+var_50]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_54], eax
		mov	eax, [bp+var_54]
		mov	[bp+var_58], eax
		mov	[bp+var_44], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_5C], eax
		shl	eax, 8
		mov	edx, [bp+var_44]
		add	edx, eax
		mov	[bp+var_60], edx
		mov	eax, [bp+var_60]
		mov	[bp+var_64], eax
		neg	eax
		mov	[bp+var_68], eax
		mov	[bp+var_6C], eax

loc_4829D:
		sar	eax, 8
		mov	[bp+var_8], eax
		jmp	loc_48410

loc_482A8:
		mov	eax, [bp+var_8]
		cmp	eax, [bp+var_10]
		jg	short loc_482B5
		jmp	loc_48410

loc_482B5:
		sub	eax, [bp+var_10]
		mov	[bp+var_48], eax
		shl	eax, 8
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_4C]
		mov	[bp+var_44], eax
		mov	[bp+var_50], 0A8h
		mov	eax, [bp+var_44]
		mov	edx, [bp+var_50]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_54], eax
		mov	eax, [bp+var_54]
		mov	[bp+var_58], eax
		mov	[bp+var_44], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_5C], eax
		shl	eax, 8
		mov	edx, [bp+var_44]
		add	edx, eax
		mov	[bp+var_60], edx
		mov	eax, [bp+var_60]
		mov	[bp+var_64], eax
		jmp	short loc_4829D

loc_48316:
		cmp	[bp+var_8], 0
		jl	short loc_48320
		jmp	loc_483A4

loc_48320:
		mov	eax, [bp+var_10]
		neg	eax
		cmp	eax, [bp+var_8]
		jg	short loc_48330
		jmp	loc_48410

loc_48330:
		mov	eax, [bp+var_8]
		neg	eax
		sub	eax, [bp+var_10]
		mov	[bp+var_48], eax
		shl	eax, 8
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_4C]
		mov	[bp+var_44], eax
		mov	[bp+var_50], 80h
		mov	eax, [bp+var_44]
		mov	edx, [bp+var_50]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_54], eax
		mov	eax, [bp+var_54]
		mov	[bp+var_58], eax
		mov	[bp+var_44], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_5C], eax
		shl	eax, 8
		mov	edx, [bp+var_44]
		add	edx, eax
		mov	[bp+var_60], edx
		mov	eax, [bp+var_60]
		mov	[bp+var_64], eax
		neg	eax
		mov	[bp+var_68], eax
		mov	[bp+var_6C], eax
		jmp	loc_4829D

loc_483A4:
		mov	eax, [bp+var_8]
		cmp	eax, [bp+var_10]
		jle	short loc_48410
		sub	eax, [bp+var_10]
		mov	[bp+var_48], eax
		shl	eax, 8
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_4C]
		mov	[bp+var_44], eax
		mov	[bp+var_50], 54h
		mov	eax, [bp+var_44]
		mov	edx, [bp+var_50]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_54], eax
		mov	eax, [bp+var_54]
		mov	[bp+var_58], eax
		mov	[bp+var_44], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_5C], eax
		shl	eax, 8
		mov	edx, [bp+var_44]
		add	edx, eax
		mov	[bp+var_60], edx
		mov	eax, [bp+var_60]
		mov	[bp+var_64], eax
		jmp	loc_4829D

loc_48410:
		push	word ptr [si+10h]
		call	Aero_DynamicPressure_46C16
		pop	cx
		mov	di, ax
		mov	eax, [di]
		mov	[bp+var_16], eax
		sar	eax, 8
		mov	[bp+var_16], eax
		push	si
		push	cs
		call	near ptr Aero_ComputeDragFromFlags_47D30
		pop	cx
		mov	di, ax
		mov	eax, [di]
		mov	[bp+var_1A], eax
		push	word ptr [si]
		call	Physics_ResolveWindVectorCached_463B3
		pop	cx
		mov	di, ax
		mov	ax, si
		add	ax, 6Eh
		mov	[bp+var_24], ax
		mov	bx, [bp+var_24]
		mov	eax, [bx]
		mov	[bp+var_22], eax
		mov	eax, [bp+var_22]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_22], eax
		mov	eax, [bp+var_22]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_22], eax
		mov	eax, [bp+var_22]
		mov	[bp+var_1E], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_22], eax
		mov	eax, [bp+var_22]
		mov	edx, [bp+var_C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_22], eax
		mov	eax, [bp+var_22]
		mov	edx, [bp+var_C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_22], eax
		mov	eax, [bp+var_22]
		add	[bp+var_1E], eax
		mov	eax, [bp+var_1A]
		add	[bp+var_1E], eax
		mov	eax, [bp+var_1E]
		mov	edx, [bp+var_16]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_1E], eax
		mov	bx, [si]
		push	large [bx+0Ah]
		push	large [bx+6]
		push	large [bx+2]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_28], eax
		mov	[bp+var_2C], eax
		mov	ax, [si+9Dh]
		mov	[bp+var_2E], ax
		movsx	eax, [bp+var_2E]
		shl	eax, 8
		cmp	eax, [bp+var_2C]
		jge	short loc_48516
		mov	ax, 1
		jmp	short loc_48518

loc_48516:
		xor	ax, ax

loc_48518:
		or	al, al
		jnz	short loc_4851F
		jmp	loc_485AF

loc_4851F:
		mov	bx, [si]
		push	large [bx+0Ah]
		push	large [bx+6]
		push	large [bx+2]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_32], eax
		mov	[bp+var_36], eax
		mov	ax, [si+9Dh]
		mov	[bp+var_38], ax
		movsx	ebx, [bp+var_38]
		mov	eax, [bp+var_36]
		cdq
		idiv	ebx
		mov	[bp+var_3C], eax
		mov	[bp+var_40], eax
		mov	bx, [si+10h]
		mov	eax, [bx+4]
		mov	edx, [bp+var_40]
		imul	edx
		shrd	eax, edx, 8
		mov	[bx+4], eax
		mov	ax, [si+10h]
		add	ax, 4
		mov	eax, [bx+8]
		mov	edx, [bp+var_40]
		imul	edx
		shrd	eax, edx, 8
		mov	[bx+8], eax
		mov	ax, [si+10h]
		add	ax, 8
		mov	eax, [bx+0Ch]
		mov	edx, [bp+var_40]
		imul	edx
		shrd	eax, edx, 8
		mov	[bx+0Ch], eax
		mov	ax, [si+10h]
		add	ax, 0Ch

loc_485AF:
		mov	bx, [si]
		cmp	byte ptr [bx+20h], 0
		jz	short loc_4862A
		mov	eax, [si+50h]
		mov	[bp+var_48], eax
		shl	eax, 8
		mov	[bp+var_44], eax
		mov	al, [si+92h]
		and	ax, 1
		or	al, al
		jz	short loc_485E2
		mov	eax, [si+54h]
		mov	[bp+var_4C], eax
		shl	eax, 8
		add	[bp+var_44], eax

loc_485E2:
		mov	eax, [di+4]
		or	eax, eax
		jge	short loc_485EE
		neg	eax

loc_485EE:
		mov	[bp+var_50], eax
		cmp	[bp+var_50], 100h
		jge	short loc_4861A
		mov	ax, di
		add	ax, 4
		mov	word ptr [bp+var_54+2], ax
		mov	eax, [bp+var_44]
		mov	bx, word ptr [bp+var_54+2]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_44], eax

loc_4861A:
		mov	eax, [bp+var_44]
		sar	eax, 8
		mov	[bp+var_44], eax
		add	[bp+var_1E], eax

loc_4862A:
		mov	eax, [di]
		neg	eax
		mov	bx, [si+10h]
		mov	[bx+4], eax
		mov	eax, [di+4]
		neg	eax
		mov	[bx+8], eax
		mov	eax, [di+8]
		neg	eax
		mov	[bx+0Ch], eax
		mov	ax, [si+10h]
		add	ax, 4
		push	ax
		call	Vector_Normalize3D_57796
		pop	cx
		mov	bx, [si+10h]
		mov	eax, [bx+4]
		mov	edx, [bp+var_1E]
		imul	edx
		shrd	eax, edx, 8
		mov	[bx+4], eax
		mov	ax, [si+10h]
		add	ax, 4
		mov	eax, [bx+8]
		mov	edx, [bp+var_1E]
		imul	edx
		shrd	eax, edx, 8
		mov	[bx+8], eax
		mov	ax, [si+10h]
		add	ax, 8
		mov	eax, [bx+0Ch]
		mov	edx, [bp+var_1E]
		imul	edx
		shrd	eax, edx, 8
		mov	[bx+0Ch], eax
		mov	ax, [si+10h]
		add	ax, 0Ch
		mov	ax, [si+10h]
		add	ax, 4
		pop	di
		pop	si
		leave
		retf
Aero_ComputeDragWithFeedback_481AB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05. Comme Aero_SumLinearForces_48639 de STRIKE (F = poussée÷256 + portance
; + traînée ; accel = F/masse ; facteur de charge [si+99h] ; + gravité), SAUF bit 5 de
; [si+92h] : STRIKE met poussée et portance à 0 ; ici la poussée est divisée par 512 (20000h),
; la portance est gardée et la traînée est ajoutée deux fois. Rend l'adresse de dword_7CE4E.
; ==============================================================================================
Aero_SumLinearForces_486B5		proc far

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
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 28h
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	byte_79467, 0
		jnz	short loc_486CB
		inc	byte_79467

loc_486CB:
		push	si
		push	cs
		call	near ptr Aero_ComputeLiftAndSideForce_47E1E
		pop	cx
		mov	[bp+var_2], ax
		mov	ax, si
		add	ax, 1Eh
		push	ax
		call	sub_46F56
		pop	cx
		mov	[bp+var_4], ax
		push	si
		push	cs
		call	near ptr Aero_ComputeDragWithFeedback_481AB
		pop	cx
		mov	di, ax
		mov	ax, si
		add	ax, 22h
		push	ax
		call	sub_47526
		pop	cx
		mov	[bp+var_6], ax
		mov	bx, [bp+var_6]
		mov	eax, [bx]
		mov	[bp+var_28], eax
		mov	eax, [bx+4]
		mov	[bp+var_24], eax
		mov	eax, [bx+8]
		mov	[bp+var_20], eax
		push	si
		push	cs
		call	near ptr Aero_ComputeLiftAndSideForce_47E1E
		pop	cx
		mov	[bp+var_8], ax
		mov	bx, [bp+var_8]
		mov	eax, [bx]
		mov	bx, [bp+var_2]
		mov	[bx], eax
		mov	bx, [bp+var_8]
		mov	eax, [bx+4]
		mov	bx, [bp+var_2]
		mov	[bx+4], eax
		mov	bx, [bp+var_8]
		mov	eax, [bx+8]
		mov	bx, [bp+var_2]
		mov	[bx+8], eax
		mov	ax, si
		add	ax, 1Eh
		push	ax
		call	sub_46F56
		pop	cx
		mov	[bp+var_A], ax
		mov	bx, [bp+var_A]
		mov	eax, [bx]
		mov	bx, [bp+var_4]
		mov	[bx], eax
		mov	bx, [bp+var_A]
		mov	eax, [bx+4]
		mov	bx, [bp+var_4]
		mov	[bx+4], eax
		mov	bx, [bp+var_A]
		mov	eax, [bx+8]
		mov	bx, [bp+var_4]
		mov	[bx+8], eax
		push	si
		push	cs
		call	near ptr Aero_ComputeDragWithFeedback_481AB
		pop	cx
		mov	[bp+var_C], ax
		mov	bx, [bp+var_C]
		mov	eax, [bx]
		mov	[di], eax
		mov	eax, [bx+4]
		mov	[di+4], eax
		mov	eax, [bx+8]
		mov	[di+8], eax
		mov	al, [si+92h]
		shr	ax, 5
		and	ax, 1
		or	al, al
		jz	short loc_48802
		mov	[bp+var_10], 20000h
		mov	eax, [bp+var_28]
		mov	edx, eax
		mov	ecx, [bp+var_10]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_28], eax
		mov	eax, [bp+var_24]
		mov	edx, eax
		mov	ecx, [bp+var_10]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_24], eax
		mov	eax, [bp+var_20]
		mov	edx, eax
		mov	ecx, [bp+var_10]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_20], eax

loc_48802:
		mov	eax, [bp+var_28]
		sar	eax, 8
		mov	[bp+var_28], eax
		mov	eax, [bp+var_24]
		sar	eax, 8
		mov	[bp+var_24], eax
		mov	eax, [bp+var_20]
		sar	eax, 8
		mov	[bp+var_20], eax
		push	si
		mov	bx, [si+2]
		call	dword ptr [bx+3Ch]
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_18], eax
		shl	eax, 8
		mov	[bp+var_14], eax
		sar	eax, 8
		mov	[bp+var_14], eax
		mov	eax, [bp+var_28]
		mov	dword_7CE4E, eax
		mov	eax, [bp+var_24]
		mov	dword_7CE52, eax
		mov	eax, [bp+var_20]
		mov	dword_7CE56, eax
		mov	ax, [bp+var_2]
		mov	[bp+var_1A], ax
		mov	bx, [bp+var_1A]
		mov	eax, [bx]
		add	dword_7CE4E, eax
		mov	eax, [bx+4]
		add	dword_7CE52, eax
		mov	eax, [bx+8]
		add	dword_7CE56, eax
		mov	[bp+var_1C], di
		mov	bx, [bp+var_1C]
		mov	eax, [bx]
		add	dword_7CE4E, eax
		mov	eax, [bx+4]
		add	dword_7CE52, eax
		mov	eax, [bx+8]
		add	dword_7CE56, eax
		mov	al, [si+92h]
		shr	ax, 5
		and	ax, 1
		or	al, al
		jz	short loc_488C9
		mov	eax, [di]
		add	dword_7CE4E, eax
		mov	eax, [di+4]
		add	dword_7CE52, eax
		mov	eax, [di+8]
		add	dword_7CE56, eax

loc_488C9:
		mov	eax, dword_7CE4E
		mov	edx, eax
		mov	ecx, [bp+var_14]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	dword_7CE4E, eax
		mov	eax, dword_7CE52
		mov	edx, eax
		mov	ecx, [bp+var_14]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	dword_7CE52, eax
		mov	eax, dword_7CE56
		mov	edx, eax
		mov	ecx, [bp+var_14]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	dword_7CE56, eax
		mov	eax, dword_7CE56
		neg	eax
		mov	[si+99h], eax
		mov	eax, [si+99h]
		mov	edx, eax
		mov	ecx, dword_7942B
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[si+99h], eax
		mov	si, [bp+var_4]
		mov	eax, [si]
		add	dword_7CE4E, eax
		mov	eax, [si+4]
		add	dword_7CE52, eax
		mov	eax, [si+8]
		add	dword_7CE56, eax
		mov	ax, 671Eh
		pop	di
		pop	si
		leave
		retf
Aero_SumLinearForces_486B5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05. Remplace Aero_ComputeAoACommand_48862 de STRIKE : PLUS DE LOI DE CHARGE
; (ni masse, ni q, ni cos du tangage, ni facteur 1,5). Bit 5 ou q < 1 → consigne [si+16h] = 0.
; m = manche [ctrl+1Fh] ÷ 16, ÷ 2 si négatif (STRIKE : ÷ 3), × dword_7CE26 (gain de la
; gouverne de profondeur) ; bit 6 (décrochage) → m = 0. T = α_max (jdyn[76h], champ 20 de
; JDYN) × m. Cas joueur, bit 4 à 0, byte_7CEF8 = 4 et dword_7977E = 1,0 : T += calage, fin.
; Sinon : c = −calage (−volets jdyn[5Eh] si bit 1) ; si m = 0, T = α actuelle ; T gardée si
; elle est entre c et c + T×gain, sinon T = c + T×gain ; bornée à ± α_max × gain ; puis si
; décrochage ou m ≠ 0 : T = α_max × m.
; ==============================================================================================
Aero_ComputeAoACommand_48964		proc far

var_30		= dword ptr -30h
var_2C		= word ptr -2Ch
var_2A		= word ptr -2Ah
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_22		= dword ptr -22h
var_20		= dword ptr -20h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 30h
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	word ptr [si+10h]
		call	Aero_DynamicPressure_46C16
		pop	cx
		mov	di, ax
		mov	eax, [di]
		mov	[bp+var_4], eax
		mov	al, [si+92h]
		shr	ax, 5
		and	ax, 1
		or	al, al
		jnz	short loc_48999
		cmp	[bp+var_4], 100h
		jge	short loc_489A4

loc_48999:
		mov	dword ptr [si+16h], 0
		jmp	loc_48C3F

loc_489A4:
		push	si
		call	Aero_FlowAngle_AoA_46922
		pop	cx
		mov	di, ax
		mov	al, [si+92h]
		shr	ax, 5
		and	ax, 1
		or	al, al
		jz	short loc_48A0B
		movzx	eax, byte ptr [si+94h]
		mov	[bp+var_1A], eax
		mov	[bp+var_1E], 80h
		mov	eax, [bp+var_1E]
		sub	[bp+var_1A], eax
		mov	[bp+var_22], 800h
		mov	eax, [bp+var_22]
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_1A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_8], eax
		add	[bp+var_8], 800h
		add	[bp+var_8], 200h
		jmp	short loc_48A39

loc_48A0B:
		les	bx, [bp+arg_2]
		mov	ax, es:[bx+1Fh]
		mov	[bp+var_A], ax
		movsx	eax, [bp+var_A]
		shl	eax, 8
		mov	[bp+var_E], eax
		mov	eax, [bp+var_E]
		mov	[bp+var_8], eax
		mov	ebx, 10h
		cdq
		idiv	ebx
		mov	[bp+var_8], eax

loc_48A39:
		cmp	[bp+var_8], 0
		jge	short loc_48A4B
		mov	eax, [bp+var_8]
		sar	eax, 1
		mov	[bp+var_8], eax

loc_48A4B:
		mov	eax, [bp+var_8]
		mov	edx, dword_7CE26
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_8], eax
		mov	al, [si+92h]
		shr	ax, 6
		and	ax, 1
		or	al, al
		jz	short loc_48A76
		mov	[bp+var_8], 0

loc_48A76:
		mov	al, [si+76h]
		mov	ah, 0
		mov	[bp+var_14], ax
		movsx	eax, [bp+var_14]
		shl	eax, 8
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_12], eax
		mov	al, [si+92h]
		shr	ax, 4
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_48AEF
		mov	bx, [si]
		mov	ax, [bx+1Eh]
		cmp	ax, word_7CADA
		jnz	short loc_48AEF
		cmp	byte_7CEF8, 4
		jnz	short loc_48AEF
		cmp	dword_7977E, 100h
		jnz	short loc_48AD1
		mov	ax, 1
		jmp	short loc_48AD3

loc_48AD1:
		xor	ax, ax

loc_48AD3:
		or	al, al
		jz	short loc_48AEF
		mov	al, [si+5Dh]
		mov	ah, 0
		mov	[bp+var_16], ax
		movsx	eax, [bp+var_16]
		shl	eax, 8
		add	[bp+var_12], eax
		jmp	loc_48C37

loc_48AEF:
		mov	al, [si+5Dh]
		mov	ah, 0
		neg	ax
		movsx	eax, ax
		shl	eax, 8
		mov	[bp+var_1A], eax
		mov	al, [si+92h]
		shr	ax, 1
		and	ax, 1
		or	al, al
		jz	short loc_48B24
		mov	al, [si+5Eh]
		mov	ah, 0
		mov	word ptr [bp+var_1E+2], ax
		movsx	eax, word ptr [bp+var_1E+2]
		shl	eax, 8
		sub	[bp+var_1A], eax

loc_48B24:
		mov	[bp+var_20], 0
		mov	[bp+var_24], 0
		mov	eax, [bp+var_1A]
		add	[bp+var_24], eax
		add	[bp+var_20], eax
		mov	eax, [bp+var_12]
		mov	edx, dword_7CE26
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		add	[bp+var_24], eax
		cmp	[bp+var_8], 0
		jnz	short loc_48B6B
		mov	eax, [di]
		mov	[bp+var_12], eax

loc_48B6B:
		mov	eax, [bp+var_12]
		cmp	eax, [bp+var_20]
		jle	short loc_48B87
		mov	eax, [bp+var_24]
		cmp	eax, [bp+var_12]
		jg	short loc_48B97
		cmp	eax, [bp+var_20]
		jge	short loc_48B9F
		jmp	short loc_48B97

loc_48B87:
		mov	eax, [bp+var_24]
		cmp	eax, [bp+var_12]
		jl	short loc_48B97
		cmp	eax, [bp+var_20]
		jle	short loc_48B9F

loc_48B97:
		mov	eax, [bp+var_24]
		mov	[bp+var_12], eax

loc_48B9F:
		mov	al, [si+76h]
		mov	ah, 0
		mov	[bp+var_2A], ax
		movsx	eax, [bp+var_2A]
		shl	eax, 8
		mov	[bp+var_28], eax
		mov	eax, [bp+var_28]
		mov	edx, dword_7CE26
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_28], eax
		mov	eax, [bp+var_12]
		cmp	eax, [bp+var_28]
		jle	short loc_48BD9
		mov	eax, [bp+var_28]
		jmp	short loc_48BED

loc_48BD9:
		mov	eax, [bp+var_28]
		neg	eax
		cmp	eax, [bp+var_12]
		jle	short loc_48BF1
		mov	eax, [bp+var_28]
		neg	eax

loc_48BED:
		mov	[bp+var_12], eax

loc_48BF1:
		mov	al, [si+92h]
		shr	ax, 6
		and	ax, 1
		or	al, al
		jnz	short loc_48C06
		cmp	[bp+var_8], 0
		jz	short loc_48C37

loc_48C06:
		mov	al, [si+76h]
		mov	ah, 0
		mov	[bp+var_2C], ax
		movsx	eax, [bp+var_2C]
		shl	eax, 8
		mov	[bp+var_30], eax
		mov	eax, [bp+var_30]
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_12], eax

loc_48C37:
		mov	eax, [bp+var_12]
		mov	[si+16h], eax

loc_48C3F:
		pop	di
		pop	si
		leave
		retf
Aero_ComputeAoACommand_48964		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_48C43		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	byte_79468, 0
		jnz	short loc_48C56
		inc	byte_79468

loc_48C56:
		push	si
		call	Aero_ComputeForcesMain_47600
		pop	cx
		mov	bx, ax
		mov	eax, [bx]
		mov	dword_7CE5A, eax
		push	word ptr [si]
		call	Physics_ResolveWindVectorCached_463B3
		pop	cx
		mov	di, ax
		mov	bx, [si]
		cmp	byte ptr [bx+20h], 0
		jz	short loc_48C8B
		mov	eax, [di+4]
		cmp	eax, [si+3Ch]
		jge	short loc_48C8B
		sub	dword_7CE5A, 1400h

loc_48C8B:
		mov	ax, 672Ah
		pop	di
		pop	si
		pop	bp
		retf
sub_48C43		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. Apparié 2026-11-05 à Aero_ComputeControlFlags75Bit5C de STRIKE (roulis), ratio 0,90 ;
; constantes identiques une fois les champs décalés ; lignes ajoutées autour du drapeau au sol
; non relues.
; ==============================================================================================
Aero_RollCommand_48C92		proc far

var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_26		= dword ptr -26h
var_24		= dword ptr -24h
var_22		= dword ptr -22h
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
		sub	sp, 38h
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	byte_79469, 0
		jnz	short loc_48CA8
		inc	byte_79469

loc_48CA8:
		mov	al, [si+92h]
		shr	ax, 5
		and	ax, 1
		or	al, al
		jnz	short loc_48CB9
		jmp	loc_48DC8

loc_48CB9:
		mov	bx, [si]
		mov	al, [bx+20h]
		mov	ah, 0
		or	ax, ax
		jz	short loc_48CC7
		jmp	loc_48DC8

loc_48CC7:
		movzx	eax, byte ptr [si+94h]
		mov	[bp+var_1C], eax
		mov	[bp+var_24], 80h
		mov	eax, [bp+var_24]
		sub	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		shl	eax, 1
		mov	[bp+var_1C], eax
		mov	[bp+var_20], eax
		mov	eax, [si+8Eh]
		mov	ebx, 2
		cdq
		idiv	ebx
		mov	[bp+var_28], eax
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_20]
		mov	edx, [bp+var_2C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_20], eax
		mov	eax, [si+8Eh]
		cdq
		idiv	ebx
		mov	[bp+var_30], eax
		mov	[bp+var_34], eax
		add	[bp+var_20], eax
		mov	di, si
		add	di, 8
		mov	eax, [di]
		mov	[bp+var_38], eax
		mov	eax, [bp+var_20]
		cmp	eax, [bp+var_38]
		jle	short loc_48D4D
		mov	ax, 1
		jmp	short loc_48D4F

loc_48D4D:
		xor	ax, ax

loc_48D4F:
		or	al, al
		jz	short loc_48D86
		mov	eax, [bp+var_38]
		mov	[bp+var_4], eax
		mov	eax, [bp+var_1C]
		add	[bp+var_4], eax
		mov	eax, [bp+var_4]
		cmp	eax, [bp+var_20]
		jle	short loc_48D72
		mov	ax, 1
		jmp	short loc_48D74

loc_48D72:
		xor	ax, ax

loc_48D74:
		or	al, al
		jnz	short loc_48D7B
		jmp	loc_48EA5

loc_48D7B:
		mov	eax, [bp+var_20]
		mov	[bp+var_4], eax
		jmp	loc_48EA5

loc_48D86:
		mov	eax, [bp+var_20]
		cmp	eax, [bp+var_38]
		jge	short loc_48D95
		mov	ax, 1
		jmp	short loc_48D97

loc_48D95:
		xor	ax, ax

loc_48D97:
		or	al, al
		jnz	short loc_48D9E
		jmp	loc_48EA5

loc_48D9E:
		mov	eax, [bp+var_38]
		mov	[bp+var_4], eax
		mov	eax, [bp+var_1C]
		add	[bp+var_4], eax
		mov	eax, [bp+var_4]
		cmp	eax, [bp+var_20]
		jge	short loc_48DBD
		mov	ax, 1
		jmp	short loc_48DBF

loc_48DBD:
		xor	ax, ax

loc_48DBF:
		or	al, al
		jnz	short loc_48DC6
		jmp	loc_48EA5

loc_48DC6:
		jmp	short loc_48D7B

loc_48DC8:
		mov	[bp+var_4], 0
		mov	bx, [si]
		cmp	byte ptr [bx+20h], 0
		jz	short loc_48E1A
		push	word ptr [bx+1Eh]
		mov	bx, [bx+1Eh]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_20]
		push	ax
		call	Matrix_RollAngle_59A30
		add	sp, 6
		mov	eax, [bp+var_20]
		neg	eax
		mov	[bp+var_24], eax
		mov	[bp+var_1C], eax
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		mov	edx, dword_7976A
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4], eax

loc_48E1A:
		mov	bx, [si]
		mov	al, [bx+20h]
		mov	ah, 0
		or	ax, ax
		jz	short loc_48E4F
		push	large [bx+0Ah]
		push	large [bx+6]
		push	large [bx+2]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_8], eax
		mov	[bp+var_C], eax
		cmp	[bp+var_C], 2800h
		jle	short loc_48EA5

loc_48E4F:
		les	bx, [bp+arg_2]
		mov	ax, es:[bx+21h]
		mov	word ptr [bp+var_20+2], ax
		movsx	eax, word ptr [bp+var_20+2]
		shl	eax, 8
		mov	[bp+var_1C], eax
		mov	[bp+var_22], eax
		mov	ebx, 10h
		cdq
		idiv	ebx
		mov	[bp+var_22], eax
		push	si
		nop
		push	cs
		call	near ptr Aero_MaxRollRate_4B590
		pop	cx
		mov	di, ax
		mov	eax, [di]
		mov	[bp+var_26], eax
		mov	eax, [bp+var_26]
		mov	edx, [bp+var_22]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_26], eax
		mov	eax, [bp+var_26]
		add	[bp+var_4], eax

loc_48EA5:
		mov	di, si
		add	di, 8Eh
		mov	eax, [di]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		mov	edx, dword_7CE2A
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_10], eax
		mov	eax, [bp+var_4]
		cmp	eax, [bp+var_10]
		jle	short loc_48ED7
		mov	eax, [bp+var_10]
		jmp	short loc_48EEB

loc_48ED7:
		mov	eax, [bp+var_10]
		neg	eax
		cmp	eax, [bp+var_4]
		jle	short loc_48EEF
		mov	eax, [bp+var_10]
		neg	eax

loc_48EEB:
		mov	[bp+var_4], eax

loc_48EEF:
		mov	di, si
		add	di, 8
		mov	eax, [di]
		mov	[bp+var_14], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_14]
		sub	[bp+var_18], eax
		mov	eax, [bp+var_18]
		mov	edx, dword_7976A
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		mov	dword_7CE5E, eax
		mov	eax, [si+58h]
		cmp	eax, dword_7CE5E
		jge	short loc_48F35
		jmp	short loc_48F4A

loc_48F35:
		mov	eax, [si+58h]
		neg	eax
		cmp	eax, dword_7CE5E
		jle	short loc_48F4E
		mov	eax, [si+58h]
		neg	eax

loc_48F4A:
		mov	dword_7CE5E, eax

loc_48F4E:
		mov	ax, 672Eh
		pop	di
		pop	si
		leave
		retf
Aero_RollCommand_48C92		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. Apparié 2026-11-05 à Aero_ResetAccumulatorFlags75Bit5 de STRIKE (consigne de lacet,
; palonnier), constantes identiques une fois les champs décalés.
; ==============================================================================================
Aero_YawCommand_48F55		proc far

var_10		= dword ptr -10h
var_C		= word ptr -0Ch
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		mov	si, [bp+arg_0]
		mov	al, [si+92h]
		shr	ax, 5
		and	ax, 1
		or	al, al
		jz	short loc_48F77
		mov	dword ptr [si+1Ah], 0
		jmp	short loc_48FE7

loc_48F77:
		les	bx, [bp+arg_2]
		mov	ax, es:[bx+23h]
		mov	[bp+var_6], ax
		movsx	eax, [bp+var_6]
		shl	eax, 8
		mov	[bp+var_4], eax
		mov	[bp+var_A], eax
		mov	ebx, 10h
		cdq
		idiv	ebx
		mov	[bp+var_A], eax
		mov	al, [si+77h]
		mov	ah, 0
		mov	[bp+var_C], ax
		movsx	eax, [bp+var_C]
		shl	eax, 8
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		mov	[si+1Ah], eax
		mov	eax, [si+1Ah]
		mov	edx, dword_7CE22
		imul	edx
		shrd	eax, edx, 8
		mov	[si+1Ah], eax
		mov	eax, [si+1Ah]
		mov	edx, [bp+var_A]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+1Ah], eax

loc_48FE7:
		pop	si
		leave
		retf
Aero_YawCommand_48F55		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_48FEA		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		cmp	byte_7946A, 0
		jnz	short loc_48FFB
		inc	byte_7946A

loc_48FFB:
		push	ax
		call	Aero_ComputeForcesMain_47600
		pop	cx
		mov	bx, ax
		mov	eax, [bx+8]
		mov	dword_7CE62, eax
		mov	ax, 6732h
		pop	bp
		retf
sub_48FEA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05. Équivalent d'Aero_ControlOrchestrator_48FC2 :
; Aero_ComputeAoACommand_48964, sub_48F55 (consigne de lacet), puis trois moments : sub_48FEA,
; Aero_RollCommand_48C92, sub_48C43, rangés dans le vecteur statique 6736h
; (Utility_Helper_57C2E). L'ordre des trois derniers diffère de STRIKE ; leurs rôles exacts
; sont repris par ressemblance, non relus.
; ==============================================================================================
Aero_ControlOrchestrator_49011		proc far

var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	byte_7946B, 0
		jnz	short loc_49024
		inc	byte_7946B

loc_49024:
		push	large [bp+arg_2]
		push	si
		push	cs
		call	near ptr Aero_ComputeAoACommand_48964
		add	sp, 6
		push	large [bp+arg_2]
		push	si
		push	cs
		call	near ptr Aero_YawCommand_48F55
		add	sp, 6
		sub	sp, 4
		push	si
		push	cs
		call	near ptr sub_48FEA
		pop	cx
		mov	di, ax
		mov	eax, [di]
		mov	[bp+var_8], eax
		sub	sp, 4
		push	large [bp+arg_2]
		push	si
		push	cs
		call	near ptr Aero_RollCommand_48C92
		add	sp, 6
		mov	di, ax
		mov	eax, [di]
		mov	[bp+var_C], eax
		sub	sp, 4
		push	si
		push	cs
		call	near ptr sub_48C43
		pop	cx
		mov	si, ax
		mov	eax, [si]
		mov	[bp+var_10], eax
		push	6736h
		call	Utility_Helper_57C2E
		add	sp, 0Eh
		mov	ax, 6736h
		pop	di
		pop	si
		pop	bp
		retf
Aero_ControlOrchestrator_49011		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4908A		proc far

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
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_D		= byte ptr -0Dh
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4Ah
		push	si
		push	di
		mov	di, [bp+arg_0]
		cmp	byte_7CB09, 0
		jnz	short loc_4909F
		jmp	loc_49136

loc_4909F:
		mov	bx, [di]
		mov	ax, [bx+1Eh]
		cmp	ax, word_7CADA
		jz	short loc_490AD
		jmp	loc_49136

loc_490AD:
		mov	al, [di+92h]
		shr	ax, 5
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_4912D
		push	0
		mov	[bp+var_4], 0
		mov	eax, [bp+var_4]
		mov	[bp+var_3E], eax
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		mov	[bp+var_3A], eax
		mov	[bp+var_C], 100h
		mov	eax, [bp+var_C]
		mov	[bp+var_36], eax
		lea	ax, word ptr [bp+var_3E]
		push	ax
		mov	ax, [bx+1Eh]
		add	ax, 12h
		push	ax
		push	word_79788
		call	sub_3677E
		add	sp, 8
		or	al, al
		jz	short loc_49124
		mov	bx, [di]
		mov	bx, [bx+1Eh]
		cmp	dword ptr [bx+1Ah], 200h
		jge	short loc_4911E
		mov	ax, 1
		jmp	short loc_49120

loc_4911E:
		xor	ax, ax

loc_49120:
		or	al, al
		jnz	short loc_4912D

loc_49124:
		mov	bx, [di]
		mov	byte ptr [bx+20h], 1
		jmp	loc_492DF

loc_4912D:
		mov	bx, [di]
		mov	byte ptr [bx+20h], 0
		jmp	loc_492DF

loc_49136:
		push	0
		mov	[bp+var_12], 0
		mov	eax, [bp+var_12]
		mov	[bp+var_4A], eax
		mov	[bp+var_16], 0
		mov	eax, [bp+var_16]
		mov	[bp+var_46], eax
		mov	[bp+var_1A], 100h
		mov	eax, [bp+var_1A]
		mov	[bp+var_42], eax
		lea	ax, word ptr [bp+var_4A]
		push	ax
		mov	bx, [di]
		mov	ax, [bx+1Eh]
		add	ax, 12h
		push	ax
		push	word_79788
		call	sub_3677E
		add	sp, 8
		or	al, al
		jz	short loc_491A4
		mov	bx, [di]
		mov	bx, [bx+1Eh]
		cmp	dword ptr [bx+1Ah], 200h
		jge	short loc_49199
		mov	ax, 1
		jmp	short loc_4919B

loc_49199:
		xor	ax, ax

loc_4919B:
		or	al, al
		jz	short loc_491A4
		mov	ax, 1
		jmp	short loc_491A6

loc_491A4:
		xor	ax, ax

loc_491A6:
		mov	[bp+var_D], al
		mov	bx, [di]
		push	word ptr [bx+1Eh]
		mov	bx, [bx+1Eh]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	si, ax
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_1E]
		push	ax
		call	Matrix_RollAngle_59A30
		add	sp, 6
		mov	eax, [bp+var_1E]
		or	eax, eax
		jge	short loc_491D3
		neg	eax

loc_491D3:
		mov	[bp+var_1E], eax
		push	si
		push	ss
		lea	ax, word ptr [bp+var_22]
		push	ax
		call	sub_59A03
		add	sp, 6
		mov	si, [di]
		add	si, 2
		mov	eax, [si]
		mov	[bp+var_2A], eax
		mov	eax, [si+4]
		mov	[bp+var_26], eax
		lea	ax, word ptr [bp+var_2A]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_2E]
		push	ax
		call	Math_VectorLength3D_Scaled_Variant_57CA1
		add	sp, 6
		mov	bx, [di]
		mov	eax, [di+5Fh]
		neg	eax
		cmp	[bx+0Ah], eax
		jg	short loc_4921C
		jmp	loc_492D9

loc_4921C:
		mov	al, [di+67h]
		mov	ah, 0
		movsx	eax, ax
		shl	eax, 8
		cmp	eax, [bp+var_1E]
		jg	short loc_49232
		jmp	loc_492D9

loc_49232:
		mov	al, [di+68h]
		mov	ah, 0
		movsx	eax, ax
		shl	eax, 8
		cmp	eax, [bp+var_22]
		jg	short loc_49248
		jmp	loc_492D9

loc_49248:
		mov	al, [di+69h]
		mov	ah, 0
		movsx	eax, ax
		shl	eax, 8
		neg	eax
		cmp	eax, [bp+var_22]
		jge	short loc_492D9
		mov	eax, [di+63h]
		cmp	eax, [bp+var_2E]
		jle	short loc_492D9
		mov	al, [di+92h]
		shr	ax, 2
		and	ax, 1
		or	al, al
		jz	short loc_492D9
		mov	al, [di+92h]
		shr	ax, 5
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_492D9
		mov	al, [bp+var_D]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_492D9
		mov	byte ptr [bx+20h], 1
		mov	si, di
		add	si, 5Fh
		mov	eax, [si]
		mov	[bp+var_32], eax
		sar	eax, 1
		mov	[bp+var_32], eax
		neg	eax
		cmp	[bx+0Ah], eax
		jge	short loc_492C6
		mov	eax, [bp+var_32]
		sar	eax, 1
		mov	edx, [bx+0Ah]
		add	edx, eax
		neg	edx
		mov	[bx+0Ah], edx
		jmp	short loc_492DF

loc_492C6:
		mov	bx, [di]
		cmp	dword ptr [bx+0Ah], 0
		jge	short loc_492DF
		mov	dword ptr [bx+0Ah], 0
		jmp	short loc_492DF

loc_492D9:
		mov	bx, [di]
		mov	byte ptr [bx+20h], 0

loc_492DF:
		pop	di
		pop	si
		leave
		retf
sub_4908A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_492E3		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	bx, [si]
		push	word ptr [bx+1Eh]
		mov	bx, [bx+1Eh]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	di, ax
		mov	eax, [di]
		mov	bx, [si]
		mov	[bx+2], eax
		mov	eax, [di+4]
		mov	[bx+6], eax
		mov	eax, [di+8]
		mov	[bx+0Ah], eax
		mov	eax, [bx+2]
		mov	edx, [bp+arg_2]
		imul	edx
		shrd	eax, edx, 8
		mov	[bx+2], eax
		mov	ax, [si]
		add	ax, 2
		mov	eax, [bx+6]
		mov	edx, [bp+arg_2]
		imul	edx
		shrd	eax, edx, 8
		mov	[bx+6], eax
		mov	ax, [si]
		add	ax, 6
		mov	eax, [bx+0Ah]
		mov	edx, [bp+arg_2]
		imul	edx
		shrd	eax, edx, 8
		mov	[bx+0Ah], eax
		mov	ax, [si]
		add	ax, 0Ah
		les	bx, [bp+arg_6]
		mov	byte ptr es:[bx+1Eh], 5
		pop	di
		pop	si
		pop	bp
		retf
sub_492E3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. Apparié 2026-11-05 à JDYN_JumpToPoint_49242 de STRIKE, ratio 0,95 ; deux constantes de
; STRIKE (253, 254) absentes ici ; non relu.
; ==============================================================================================
JDYN_JumpToPoint_4936E		proc far

var_5A		= word ptr -5Ah
var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= dword ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 5Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		mov	dword ptr [di+8], 0
		push	di
		call	Vector_NormalizeInPlace_57715
		pop	cx
		mov	ax, di
		add	ax, 4
		mov	[bp+var_2], ax
		mov	eax, [di]
		neg	eax
		mov	[bp+var_6], eax
		mov	[bp+var_A], eax
		mov	[bp+var_E], 0
		mov	bx, [bp+var_2]
		mov	eax, [bx]
		mov	[bp+var_36], eax
		mov	eax, [bp+var_A]
		mov	[bp+var_32], eax
		mov	eax, [bp+var_E]
		mov	[bp+var_2E], eax
		push	di
		lea	ax, word ptr [bp+var_36]
		push	ax
		lea	ax, [bp+var_5A]
		push	ax
		call	Map_ApplyRotationTransform_58B8E
		add	sp, 6
		lea	ax, [bp+var_5A]
		push	ax
		mov	bx, [si]
		push	word ptr [bx+1Eh]
		mov	bx, [bx+1Eh]
		mov	bx, [bx]
		call	dword ptr [bx+40h]
		add	sp, 4
		xor	eax, eax
		mov	[bp+var_2E], eax
		mov	[bp+var_32], eax
		mov	[bp+var_36], eax
		mov	eax, [bp+arg_6]
		mov	[bp+var_32], eax
		lea	ax, [bp+var_5A]
		push	ax
		lea	ax, word ptr [bp+var_36]
		push	ax
		call	sub_5A629
		add	sp, 4
		mov	bx, [si]
		mov	eax, [bp+var_36]
		mov	[bx+2], eax
		mov	eax, [bp+var_32]
		mov	[bx+6], eax
		mov	eax, [bp+var_2E]
		mov	[bx+0Ah], eax
		push	si
		mov	bx, [si+2]
		call	dword ptr [bx+34h]
		pop	cx
		mov	di, [bp+arg_2]
		mov	eax, [di]
		mov	[bp+var_36], eax
		mov	eax, [di+4]
		mov	[bp+var_32], eax
		mov	eax, [di+8]
		mov	[bp+var_2E], eax
		mov	bx, [si]
		mov	di, [bx+1Eh]
		add	di, 12h
		mov	eax, [di]
		sub	[bp+var_36], eax
		mov	eax, [di+4]
		sub	[bp+var_32], eax
		mov	eax, [di+8]
		sub	[bp+var_2E], eax
		push	large [bp+var_2E]
		push	large [bp+var_32]
		push	large [bp+var_36]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_16], eax
		mov	[bp+var_12], eax
		mov	bx, [si]
		push	large [bx+0Ah]
		push	large [bx+6]
		push	large [bx+2]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_1E], eax
		mov	[bp+var_1A], eax
		mov	eax, [bp+var_12]
		mov	[bp+var_22], eax
		mov	eax, [bp+var_22]
		mov	edx, eax
		mov	ecx, [bp+var_1A]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_22], eax
		mov	[bp+var_26], 0FFFFF700h
		mov	eax, [bp+var_26]
		mov	edx, dword_7CE1E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_26], eax
		add	[bp+var_26], 0A00h
		mov	eax, [bp+var_26]
		mov	edx, [bp+var_22]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_26], eax
		mov	di, si
		add	di, 44h
		mov	eax, [bp+var_26]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_26], eax
		mov	eax, [si+8Ah]
		cmp	eax, [bp+var_26]
		jge	short loc_49535
		mov	dword ptr [si+8Ah], 0
		jmp	short loc_4953E

loc_49535:
		mov	eax, [bp+var_26]
		sub	[si+8Ah], eax

loc_4953E:
		mov	di, [bp+arg_2]
		mov	eax, [di]
		mov	bx, [si]
		mov	bx, [bx+1Eh]
		mov	[bx+12h], eax
		mov	eax, [di+4]
		mov	bx, [si]
		mov	bx, [bx+1Eh]
		mov	[bx+16h], eax
		mov	eax, [di+8]
		mov	bx, [si]
		mov	bx, [bx+1Eh]
		mov	[bx+1Ah], eax
		mov	bx, [si]
		mov	ax, [bx+1Eh]
		add	ax, 12h
		push	word ptr [bx+1Eh]
		mov	bx, [bx+1Eh]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		pop	cx
		xor	eax, eax
		mov	[si+0Ch], eax
		mov	[si+8], eax
		mov	[si+4], eax
		mov	bx, [si]
		mov	byte ptr [bx+20h], 0
		push	8
		mov	ax, si
		add	ax, 22h
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_2A]
		push	ax
		call	Aero_PropellerThrust_4710B
		add	sp, 8
		mov	eax, [bp+var_2A]
		mov	[si+28h], eax
		pop	di
		pop	si
		leave
		retf
JDYN_JumpToPoint_4936E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_495B1		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	0Ah
		mov	ax, si
		add	ax, 22h
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_4]
		push	ax
		call	Aero_PropellerThrust_4710B
		add	sp, 8
		mov	eax, [bp+var_4]
		mov	[si+28h], eax
		pop	si
		leave
		retf
sub_495B1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_495DB		proc far

var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= dword ptr -10h
var_E		= dword ptr -0Eh
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		mov	si, [bp+arg_0]
		mov	dword_7CE1E, 100h
		mov	dword_7CE22, 100h
		mov	dword_7CE26, 100h
		mov	dword_7CE2A, 100h
		mov	dword_7CE2E, 100h
		mov	dword_7CE32, 100h
		mov	dword_7CE36, 100h
		mov	bx, [si]
		mov	bx, [bx+1Eh]
		mov	ax, [bx+65h]
		mov	dx, [bx+63h]
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		les	bx, [bp+var_4]
		cmp	byte ptr es:[bx+3Ch], 0
		jz	short loc_49644
		mov	ax, 1
		jmp	short loc_49646

loc_49644:
		xor	ax, ax

loc_49646:
		or	al, al
		jz	short loc_496A4
		les	bx, [bp+var_4]
		mov	al, es:[bx+1]
		mov	ah, 0
		mov	[bp+var_A], ax
		movsx	eax, [bp+var_A]
		shl	eax, 8
		mov	[bp+var_8], eax
		mov	al, es:[bx+3Ch]
		mov	ah, 0
		mov	word ptr [bp+var_10], ax
		movsx	eax, word ptr [bp+var_10]
		shl	eax, 8
		mov	[bp+var_E], eax
		mov	eax, [bp+var_8]
		mov	dword_7CE1E, eax
		mov	eax, [bp+var_E]
		sub	dword_7CE1E, eax
		mov	eax, dword_7CE1E
		mov	edx, eax
		mov	ecx, [bp+var_8]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	dword_7CE1E, eax

loc_496A4:
		les	bx, [bp+var_4]
		cmp	byte ptr es:[bx+3Dh], 0
		jz	short loc_496B3
		mov	ax, 1
		jmp	short loc_496B5

loc_496B3:
		xor	ax, ax

loc_496B5:
		or	al, al
		jz	short loc_49713
		les	bx, [bp+var_4]
		mov	al, es:[bx+2]
		mov	ah, 0
		mov	[bp+var_A], ax
		movsx	eax, [bp+var_A]
		shl	eax, 8
		mov	[bp+var_8], eax
		mov	al, es:[bx+3Dh]
		mov	ah, 0
		mov	word ptr [bp+var_10], ax
		movsx	eax, word ptr [bp+var_10]
		shl	eax, 8
		mov	[bp+var_E], eax
		mov	eax, [bp+var_8]
		mov	dword_7CE22, eax
		mov	eax, [bp+var_E]
		sub	dword_7CE22, eax
		mov	eax, dword_7CE22
		mov	edx, eax
		mov	ecx, [bp+var_8]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	dword_7CE22, eax

loc_49713:
		les	bx, [bp+var_4]
		cmp	byte ptr es:[bx+3Eh], 0
		jz	short loc_49722
		mov	ax, 1
		jmp	short loc_49724

loc_49722:
		xor	ax, ax

loc_49724:
		or	al, al
		jz	short loc_49782
		les	bx, [bp+var_4]
		mov	al, es:[bx+3]
		mov	ah, 0
		mov	[bp+var_A], ax
		movsx	eax, [bp+var_A]
		shl	eax, 8
		mov	[bp+var_8], eax
		mov	al, es:[bx+3Eh]
		mov	ah, 0
		mov	word ptr [bp+var_10], ax
		movsx	eax, word ptr [bp+var_10]
		shl	eax, 8
		mov	[bp+var_E], eax
		mov	eax, [bp+var_8]
		mov	dword_7CE26, eax
		mov	eax, [bp+var_E]
		sub	dword_7CE26, eax
		mov	eax, dword_7CE26
		mov	edx, eax
		mov	ecx, [bp+var_8]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	dword_7CE26, eax

loc_49782:
		les	bx, [bp+var_4]
		cmp	byte ptr es:[bx+3Fh], 0
		jz	short loc_49791
		mov	ax, 1
		jmp	short loc_49793

loc_49791:
		xor	ax, ax

loc_49793:
		or	al, al
		jz	short loc_497F1
		les	bx, [bp+var_4]
		mov	al, es:[bx+4]
		mov	ah, 0
		mov	[bp+var_A], ax
		movsx	eax, [bp+var_A]
		shl	eax, 8
		mov	[bp+var_8], eax
		mov	al, es:[bx+3Fh]
		mov	ah, 0
		mov	word ptr [bp+var_10], ax
		movsx	eax, word ptr [bp+var_10]
		shl	eax, 8
		mov	[bp+var_E], eax
		mov	eax, [bp+var_8]
		mov	dword_7CE2A, eax
		mov	eax, [bp+var_E]
		sub	dword_7CE2A, eax
		mov	eax, dword_7CE2A
		mov	edx, eax
		mov	ecx, [bp+var_8]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	dword_7CE2A, eax

loc_497F1:
		les	bx, [bp+var_4]
		cmp	byte ptr es:[bx+40h], 0
		jz	short loc_49800
		mov	ax, 1
		jmp	short loc_49802

loc_49800:
		xor	ax, ax

loc_49802:
		or	al, al
		jnz	short loc_4981E
		les	bx, [bp+var_4]
		cmp	byte ptr es:[bx+41h], 0
		jz	short loc_49815
		mov	ax, 1
		jmp	short loc_49817

loc_49815:
		xor	ax, ax

loc_49817:
		or	al, al
		jnz	short loc_4981E
		jmp	loc_498AC

loc_4981E:
		les	bx, [bp+var_4]
		mov	al, es:[bx+6]
		mov	ah, 0
		mov	[bp+var_A], ax
		movsx	eax, [bp+var_A]
		shl	eax, 8
		mov	[bp+var_8], eax
		mov	al, es:[bx+5]
		mov	ah, 0
		mov	word ptr [bp+var_E+2], ax
		movsx	eax, word ptr [bp+var_E+2]
		shl	eax, 8
		add	[bp+var_8], eax
		mov	al, es:[bx+41h]
		mov	ah, 0
		mov	[bp+var_12], ax
		movsx	eax, [bp+var_12]
		shl	eax, 8
		mov	[bp+var_10], eax
		mov	al, es:[bx+40h]
		mov	ah, 0
		mov	[bp+var_14], ax
		movsx	eax, [bp+var_14]
		shl	eax, 8
		add	[bp+var_10], eax
		mov	eax, [bp+var_8]
		mov	dword_7CE2E, eax
		mov	eax, [bp+var_10]
		sub	dword_7CE2E, eax
		mov	eax, dword_7CE2E
		mov	edx, eax
		mov	ecx, [bp+var_8]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	dword_7CE2E, eax
		mov	eax, dword_7CE2E
		mov	dword_7CE32, eax

loc_498AC:
		les	bx, [bp+var_4]
		cmp	byte ptr es:[bx+3Bh], 0
		jz	short loc_498BB
		mov	ax, 1
		jmp	short loc_498BD

loc_498BB:
		xor	ax, ax

loc_498BD:
		or	al, al
		jz	short loc_4991A
		les	bx, [bp+var_4]
		mov	al, es:[bx]
		mov	ah, 0
		mov	[bp+var_A], ax
		movsx	eax, [bp+var_A]
		shl	eax, 8
		mov	[bp+var_8], eax
		mov	al, es:[bx+3Bh]
		mov	ah, 0
		mov	word ptr [bp+var_10], ax
		movsx	eax, word ptr [bp+var_10]
		shl	eax, 8
		mov	[bp+var_E], eax
		mov	eax, [bp+var_8]
		mov	dword_7CE36, eax
		mov	eax, [bp+var_E]
		sub	dword_7CE36, eax
		mov	eax, dword_7CE36
		mov	edx, eax
		mov	ecx, [bp+var_8]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	dword_7CE36, eax

loc_4991A:
		pop	si
		leave
		retf
sub_495DB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4991D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_4991D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. Comparée 2026-11-05 à Autopilot_NosePitchRelax_498B5 de STRIKE : suite d'instructions
; identique.
; ==============================================================================================
Autopilot_NosePitchRelax_49925		proc far

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
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 5Ch
		push	si
		push	di
		mov	bx, [bp+arg_0]
		mov	si, [bp+arg_2]
		mov	[bp+var_4], 500h
		push	[bp+arg_4]
		push	ss
		lea	ax, word ptr [bp+var_8]
		push	ax
		call	sub_5711C
		add	sp, 6
		mov	ax, si
		add	ax, 0Ch
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_C]
		push	ax
		call	sub_5711C
		add	sp, 6
		mov	eax, [bp+var_8]
		sub	eax, [bp+var_C]
		mov	[bp+var_14], eax
		mov	[bp+var_10], eax
		cmp	[bp+var_10], 0
		jnz	short loc_49978
		jmp	loc_49AEC

loc_49978:
		mov	eax, [bp+var_4]
		mov	edx, dword_7976E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_10]
		or	eax, eax
		jge	short loc_499A1
		neg	eax

loc_499A1:
		mov	[bp+var_20], eax
		mov	eax, [bp+var_20]
		mov	[bp+var_24], eax
		cmp	eax, [bp+var_18]
		jge	short loc_499B8
		mov	ax, 1
		jmp	short loc_499BA

loc_499B8:
		xor	ax, ax

loc_499BA:
		or	al, al
		jz	short loc_499C8
		mov	eax, [bp+var_10]
		mov	[bp+var_18], eax
		jmp	short loc_499ED

loc_499C8:
		cmp	[bp+var_10], 0
		jge	short loc_499D4
		mov	ax, 1
		jmp	short loc_499D6

loc_499D4:
		xor	ax, ax

loc_499D6:
		or	al, al
		jz	short loc_499ED
		mov	eax, [bp+var_18]
		neg	eax
		mov	[bp+var_28], eax
		mov	[bp+var_2C], eax
		mov	[bp+var_18], eax

loc_499ED:
		mov	eax, [bp+var_18]
		mov	edx, eax
		mov	ecx, [bp+var_10]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_34], eax
		mov	eax, [bp+var_34]
		mov	[bp+var_30], eax
		mov	di, si
		add	di, 0Ch
		mov	eax, [di]
		mov	[bp+var_44], eax
		mov	eax, [di+4]
		mov	[bp+var_40], eax
		mov	eax, [di+8]
		mov	[bp+var_3C], eax
		mov	[bp+var_38], 0
		mov	eax, [bp+var_38]
		mov	[bp+var_3C], eax
		lea	ax, word ptr [bp+var_44]
		push	ax
		call	Vector_NormalizeInPlace_57715
		pop	cx
		mov	di, si
		add	di, 0Ch
		mov	eax, [bp+var_44]
		sub	eax, [di]
		mov	[bp+var_5C], eax
		mov	eax, [bp+var_40]
		sub	eax, [di+4]
		mov	[bp+var_58], eax
		mov	eax, [bp+var_3C]
		sub	eax, [di+8]
		mov	[bp+var_54], eax
		mov	eax, [bp+var_5C]
		mov	[bp+var_50], eax
		mov	eax, [bp+var_58]
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_54]
		mov	[bp+var_48], eax
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
		mov	eax, [bp+var_48]
		mov	edx, [bp+var_30]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_48], eax
		mov	eax, [bp+var_50]
		add	[si+0Ch], eax
		mov	eax, [bp+var_4C]
		add	[si+10h], eax
		mov	eax, [bp+var_48]
		add	[si+14h], eax
		mov	ax, si
		add	ax, 0Ch
		push	ax
		call	Vector_NormalizeInPlace_57715
		pop	cx
		push	si
		call	Matrix_OrthonormalizeKeepRow1_59429
		pop	cx

loc_49AEC:
		pop	di
		pop	si
		leave
		retf
Autopilot_NosePitchRelax_49925		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. Comparée 2026-11-05 à Autopilot_BankForTurn_49A7C de STRIKE : mêmes constantes (ratio
; 0,98).
; ==============================================================================================
Autopilot_BankForTurn_49AF0		proc far

var_54		= dword ptr -54h
var_50		= dword ptr -50h
var_4C		= dword ptr -4Ch
var_48		= dword ptr -48h
var_44		= dword ptr -44h
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
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 54h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		mov	[bp+var_4], 0A00h
		push	[bp+arg_2]
		push	ss
		lea	ax, word ptr [bp+var_8]
		push	ax
		call	Matrix_RollAngle_59A30
		add	sp, 6
		mov	[bp+var_E], di
		mov	bx, [bp+var_E]
		mov	eax, [bx]
		mov	[bp+var_C], eax
		mov	[bp+var_10], di
		mov	bx, [bp+var_10]
		mov	eax, [bx]
		or	eax, eax
		jge	short loc_49B34
		neg	eax

loc_49B34:
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_18], eax
		cmp	[bp+var_18], 0A00h
		jge	short loc_49B4F
		mov	ax, 1
		jmp	short loc_49B51

loc_49B4F:
		xor	ax, ax

loc_49B51:
		or	al, al
		jz	short loc_49B68
		mov	[bp+var_1C], 0
		mov	eax, [bp+var_1C]
		mov	[bp+var_C], eax
		jmp	loc_49C0C

loc_49B68:
		mov	eax, [di]
		cmp	eax, [bp+var_4]
		jle	short loc_49B76
		mov	ax, 1
		jmp	short loc_49B78

loc_49B76:
		xor	ax, ax

loc_49B78:
		or	al, al
		jz	short loc_49B87
		mov	eax, [bp+var_4]
		mov	[bp+var_C], eax
		jmp	loc_49C0C

loc_49B87:
		mov	eax, [bp+var_4]
		neg	eax
		mov	[bp+var_20], eax
		mov	[bp+var_24], eax
		mov	eax, [di]
		cmp	eax, [bp+var_24]
		jge	short loc_49BA4
		mov	ax, 1
		jmp	short loc_49BA6

loc_49BA4:
		xor	ax, ax

loc_49BA6:
		or	al, al
		jz	short loc_49BBF
		mov	eax, [bp+var_4]
		neg	eax
		mov	[bp+var_28], eax
		mov	[bp+var_2C], eax
		mov	[bp+var_C], eax
		jmp	short loc_49C0C

loc_49BBF:
		cmp	dword ptr [di], 0A00h
		jle	short loc_49BCD
		mov	ax, 1
		jmp	short loc_49BCF

loc_49BCD:
		xor	ax, ax

loc_49BCF:
		or	al, al
		jz	short loc_49BEA
		mov	eax, [di]
		add	eax, 0FFFFF600h
		mov	[bp+var_30], eax
		mov	[bp+var_34], eax
		mov	[bp+var_C], eax
		jmp	short loc_49C0C

loc_49BEA:
		cmp	dword ptr [di], 0FFFFF600h
		jge	short loc_49BF8
		mov	ax, 1
		jmp	short loc_49BFA

loc_49BF8:
		xor	ax, ax

loc_49BFA:
		or	al, al
		jz	short loc_49C0C
		add	dword ptr [di], 0A00h
		mov	eax, [di]
		mov	[bp+var_C], eax

loc_49C0C:
		mov	eax, [bp+var_C]
		sub	eax, [bp+var_8]
		mov	[bp+var_3C], eax
		mov	[bp+var_38], eax
		cmp	[bp+var_38], 0
		jnz	short loc_49C26
		jmp	loc_49CB4

loc_49C26:
		mov	eax, [si+8Eh]
		mov	edx, dword_7976E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_44], eax
		mov	eax, [bp+var_44]
		mov	[bp+var_40], eax
		mov	eax, [bp+var_38]
		or	eax, eax
		jge	short loc_49C50
		neg	eax

loc_49C50:
		mov	[bp+var_48], eax
		mov	eax, [bp+var_48]
		mov	[bp+var_4C], eax
		cmp	eax, [bp+var_40]
		jge	short loc_49C67
		mov	ax, 1
		jmp	short loc_49C69

loc_49C67:
		xor	ax, ax

loc_49C69:
		or	al, al
		jz	short loc_49C77
		mov	eax, [bp+var_38]
		mov	[bp+var_40], eax
		jmp	short loc_49C9C

loc_49C77:
		cmp	[bp+var_38], 0
		jge	short loc_49C83
		mov	ax, 1
		jmp	short loc_49C85

loc_49C83:
		xor	ax, ax

loc_49C85:
		or	al, al
		jz	short loc_49C9C
		mov	eax, [bp+var_40]
		neg	eax
		mov	[bp+var_50], eax
		mov	[bp+var_54], eax
		mov	[bp+var_40], eax

loc_49C9C:
		lea	ax, word ptr [bp+var_40]
		push	ax
		push	[bp+arg_2]
		call	Matrix_BuildAxisY_58E8E
		add	sp, 4
		push	[bp+arg_2]
		call	Matrix_OrthonormalizeKeepRow1_59429
		pop	cx

loc_49CB4:
		pop	di
		pop	si
		leave
		retf
Autopilot_BankForTurn_49AF0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. Comparée 2026-11-05 à Autopilot_FlyToPointKinematic_49C2E de STRIKE : même suite
; d'instructions (ratio 1,0), mais constantes différentes (STRIKE : 5, 20, 25, 50 ; ici : 1,
; 2, 3, 10, 360) ; non relue.
; ==============================================================================================
Autopilot_FlyToPointKinematic_49CB8		proc far

var_276		= dword ptr -276h
var_272		= dword ptr -272h
var_26E		= dword ptr -26Eh
var_26A		= dword ptr -26Ah
var_266		= dword ptr -266h
var_262		= dword ptr -262h
var_25E		= dword ptr -25Eh
var_25A		= dword ptr -25Ah
var_256		= dword ptr -256h
var_252		= dword ptr -252h
var_24E		= dword ptr -24Eh
var_24A		= dword ptr -24Ah
var_246		= dword ptr -246h
var_242		= dword ptr -242h
var_23E		= dword ptr -23Eh
var_23A		= dword ptr -23Ah
var_236		= dword ptr -236h
var_232		= dword ptr -232h
var_22E		= dword ptr -22Eh
var_22A		= dword ptr -22Ah
var_226		= dword ptr -226h
var_222		= dword ptr -222h
var_21E		= dword ptr -21Eh
var_21A		= dword ptr -21Ah
var_216		= dword ptr -216h
var_212		= dword ptr -212h
var_20E		= dword ptr -20Eh
var_20A		= dword ptr -20Ah
var_206		= dword ptr -206h
var_202		= dword ptr -202h
var_1FE		= dword ptr -1FEh
var_1FA		= dword ptr -1FAh
var_1F6		= dword ptr -1F6h
var_1F2		= dword ptr -1F2h
var_1EE		= dword ptr -1EEh
var_1EA		= dword ptr -1EAh
var_1E6		= dword ptr -1E6h
var_1E2		= dword ptr -1E2h
var_1DE		= dword ptr -1DEh
var_1DA		= dword ptr -1DAh
var_1D6		= dword ptr -1D6h
var_1D2		= dword ptr -1D2h
var_1CE		= dword ptr -1CEh
var_1CA		= dword ptr -1CAh
var_1C6		= dword ptr -1C6h
var_1C2		= dword ptr -1C2h
var_1BE		= dword ptr -1BEh
var_1BA		= dword ptr -1BAh
var_1B6		= dword ptr -1B6h
var_1B2		= dword ptr -1B2h
var_1AE		= dword ptr -1AEh
var_1AA		= dword ptr -1AAh
var_1A6		= dword ptr -1A6h
var_1A2		= dword ptr -1A2h
var_19E		= dword ptr -19Eh
var_19A		= dword ptr -19Ah
var_196		= dword ptr -196h
var_192		= dword ptr -192h
var_18E		= dword ptr -18Eh
var_18A		= dword ptr -18Ah
var_186		= dword ptr -186h
var_182		= dword ptr -182h
var_17E		= dword ptr -17Eh
var_17A		= dword ptr -17Ah
var_176		= dword ptr -176h
var_172		= dword ptr -172h
var_16E		= dword ptr -16Eh
var_16A		= dword ptr -16Ah
var_166		= dword ptr -166h
var_162		= dword ptr -162h
var_15E		= dword ptr -15Eh
var_15A		= dword ptr -15Ah
var_156		= dword ptr -156h
var_152		= dword ptr -152h
var_14E		= dword ptr -14Eh
var_14A		= dword ptr -14Ah
var_146		= dword ptr -146h
var_142		= dword ptr -142h
var_13E		= dword ptr -13Eh
var_13A		= dword ptr -13Ah
var_136		= dword ptr -136h
var_132		= dword ptr -132h
var_12E		= dword ptr -12Eh
var_12A		= dword ptr -12Ah
var_126		= dword ptr -126h
var_122		= dword ptr -122h
var_11E		= dword ptr -11Eh
var_11A		= dword ptr -11Ah
var_116		= word ptr -116h
var_114		= dword ptr -114h
var_110		= dword ptr -110h
var_10C		= dword ptr -10Ch
var_108		= dword ptr -108h
var_104		= dword ptr -104h
var_100		= dword ptr -100h
var_FC		= dword ptr -0FCh
var_F8		= dword ptr -0F8h
var_F4		= dword ptr -0F4h
var_F0		= dword ptr -0F0h
var_EC		= dword ptr -0ECh
var_E8		= dword ptr -0E8h
var_E4		= dword ptr -0E4h
var_E0		= dword ptr -0E0h
var_DC		= dword ptr -0DCh
var_D8		= dword ptr -0D8h
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
var_A0		= dword ptr -0A0h
var_9C		= dword ptr -9Ch
var_98		= dword ptr -98h
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
var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= word ptr -24h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 276h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	bx, [si]
		push	word ptr [bx+1Eh]
		mov	bx, [bx+1Eh]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	di, ax
		mov	bx, [si]
		mov	ax, [bx+1Eh]
		add	ax, 12h
		mov	[bp+var_2], ax
		mov	bx, [bp+var_2]
		mov	eax, [bx]
		mov	[bp+var_17A], eax
		mov	eax, [bx+4]
		mov	[bp+var_176], eax
		mov	eax, [bx+8]
		mov	[bp+var_172], eax
		mov	ax, [bp+arg_4]
		mov	dx, [bp+arg_2]
		add	dx, 2
		mov	[bp+var_4], ax
		mov	[bp+var_6], dx
		les	ax, [bp+var_6]
		mov	[bp+var_8], ax
		mov	bx, [bp+var_8]
		mov	eax, es:[bx]
		mov	[bp+var_186], eax
		mov	eax, es:[bx+4]
		mov	[bp+var_182], eax
		mov	eax, es:[bx+8]
		mov	[bp+var_17E], eax
		mov	ax, [bp+arg_4]
		mov	dx, [bp+arg_2]
		add	dx, 0Eh
		mov	[bp+var_A], ax
		mov	[bp+var_C], dx
		les	ax, [bp+var_C]
		mov	[bp+var_E], ax
		mov	bx, [bp+var_E]
		mov	eax, es:[bx]
		mov	[bp+var_192], eax
		mov	eax, es:[bx+4]
		mov	[bp+var_18E], eax
		mov	eax, es:[bx+8]
		mov	[bp+var_18A], eax
		push	eax
		push	large [bp+var_18E]
		push	large [bp+var_192]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_16], eax
		mov	[bp+var_12], eax
		lea	ax, word ptr [bp+var_192]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_1A]
		push	ax
		call	sub_5720C
		add	sp, 6
		mov	eax, [bp+var_186]
		sub	eax, [bp+var_17A]
		mov	[bp+var_19E], eax
		mov	eax, [bp+var_182]
		sub	eax, [bp+var_176]
		mov	[bp+var_19A], eax
		mov	eax, [bp+var_17E]
		sub	eax, [bp+var_172]
		mov	[bp+var_196], eax
		mov	eax, [bp+var_19E]
		mov	[bp+var_1AA], eax
		mov	eax, [bp+var_19A]
		mov	[bp+var_1A6], eax
		mov	eax, [bp+var_196]
		mov	[bp+var_1A2], eax
		push	eax
		push	large [bp+var_1A6]
		push	large [bp+var_1AA]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_22], eax
		mov	[bp+var_1E], eax
		mov	ax, [si]
		add	ax, 2
		mov	[bp+var_24], ax
		mov	bx, [bp+var_24]
		mov	eax, [bx]
		mov	[bp+var_16E], eax
		mov	eax, [bx+4]
		mov	[bp+var_16A], eax
		mov	eax, [bx+8]
		mov	[bp+var_166], eax
		mov	[bp+var_28], 0
		mov	eax, [bp+var_28]
		mov	[bp+var_166], eax
		push	eax
		push	large [bp+var_16A]
		push	large [bp+var_16E]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_30], eax
		mov	[bp+var_2C], eax
		mov	[bp+var_34], 300h
		mov	[bp+var_38], 200h
		mov	[bp+var_3C], 100h
		mov	[bp+var_40], 0A00h
		mov	eax, dword_7976E
		mov	[bp+var_44], eax
		cmp	[bp+var_44], 33h
		jge	short loc_49E90
		mov	[bp+var_44], 33h

loc_49E90:
		mov	eax, [bp+var_12]
		mov	edx, [bp+var_44]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_4C]
		mov	[bp+var_48], eax
		mov	eax, [bp+var_12]
		mov	edx, dword_7976E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_54], eax
		mov	eax, [bp+var_54]
		mov	[bp+var_50], eax
		mov	[bp+var_58], 324h
		mov	eax, [bp+var_12]
		imul	eax, eax, 0B4h
		mov	[bp+var_60], eax
		mov	[bp+var_64], eax
		mov	eax, [bp+var_64]
		mov	edx, eax
		mov	ecx, [bp+var_38]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_68], eax
		mov	eax, [bp+var_68]
		mov	[bp+var_6C], eax
		mov	eax, [bp+var_6C]
		mov	edx, eax
		mov	ecx, [bp+var_58]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_70], eax
		mov	eax, [bp+var_70]
		mov	[bp+var_5C], eax
		mov	eax, [bp+var_192]
		mov	[bp+var_16E], eax
		mov	eax, [bp+var_18E]
		mov	[bp+var_16A], eax
		mov	eax, [bp+var_18A]
		mov	[bp+var_166], eax
		mov	[bp+var_74], 0
		mov	eax, [bp+var_74]
		mov	[bp+var_166], eax
		lea	ax, word ptr [bp+var_16E]
		push	ax
		call	Vector_NormalizeInPlace_57715
		pop	cx
		mov	eax, [bp+var_5C]
		sub	eax, [bp+var_50]
		mov	[bp+var_78], eax
		mov	[bp+var_7C], eax
		mov	eax, [bp+var_16E]
		mov	edx, [bp+var_7C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_16E], eax
		mov	eax, [bp+var_16A]
		mov	edx, [bp+var_7C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_16A], eax
		mov	eax, [bp+var_166]
		mov	edx, [bp+var_7C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_166], eax
		mov	eax, [bp+var_16A]
		mov	[bp+var_1B6], eax
		mov	eax, [bp+var_16E]
		neg	eax
		mov	[bp+var_80], eax
		mov	[bp+var_84], eax
		mov	[bp+var_1B2], eax
		mov	[bp+var_88], 0
		mov	eax, [bp+var_88]
		mov	[bp+var_1AE], eax
		mov	eax, [bp+var_186]
		add	eax, [bp+var_1B6]
		mov	[bp+var_1DA], eax
		mov	eax, [bp+var_182]
		add	eax, [bp+var_1B2]
		mov	[bp+var_1D6], eax
		mov	eax, [bp+var_17E]
		add	eax, [bp+var_1AE]
		mov	[bp+var_1D2], eax
		mov	eax, [bp+var_1DA]
		mov	[bp+var_1E6], eax
		mov	eax, [bp+var_1D6]
		mov	[bp+var_1E2], eax
		mov	eax, [bp+var_1D2]
		mov	[bp+var_1DE], eax
		mov	eax, [bp+var_1E6]
		mov	[bp+var_1CE], eax
		mov	eax, [bp+var_1E2]
		mov	[bp+var_1CA], eax
		mov	eax, [bp+var_1DE]
		mov	[bp+var_1C6], eax
		mov	eax, [bp+var_186]
		sub	eax, [bp+var_1B6]
		mov	[bp+var_1F2], eax
		mov	eax, [bp+var_182]
		sub	eax, [bp+var_1B2]
		mov	[bp+var_1EE], eax
		mov	eax, [bp+var_17E]
		sub	eax, [bp+var_1AE]
		mov	[bp+var_1EA], eax
		mov	eax, [bp+var_1F2]
		mov	[bp+var_1FE], eax
		mov	eax, [bp+var_1EE]
		mov	[bp+var_1FA], eax
		mov	eax, [bp+var_1EA]
		mov	[bp+var_1F6], eax
		mov	eax, [bp+var_1FE]
		mov	[bp+var_1C2], eax
		mov	eax, [bp+var_1FA]
		mov	[bp+var_1BE], eax
		mov	eax, [bp+var_1F6]
		mov	[bp+var_1BA], eax
		mov	eax, [bp+var_1C2]
		sub	eax, [bp+var_17A]
		mov	[bp+var_20A], eax
		mov	eax, [bp+var_1BE]
		sub	eax, [bp+var_176]
		mov	[bp+var_206], eax
		mov	eax, [bp+var_1BA]
		sub	eax, [bp+var_172]
		mov	[bp+var_202], eax
		mov	eax, [bp+var_20A]
		mov	[bp+var_216], eax
		mov	eax, [bp+var_206]
		mov	[bp+var_212], eax
		mov	eax, [bp+var_202]
		mov	[bp+var_20E], eax
		push	eax
		push	large [bp+var_212]
		push	large [bp+var_216]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_90], eax
		mov	[bp+var_8C], eax
		mov	eax, [bp+var_1CE]
		sub	eax, [bp+var_17A]
		mov	[bp+var_222], eax
		mov	eax, [bp+var_1CA]
		sub	eax, [bp+var_176]
		mov	[bp+var_21E], eax
		mov	eax, [bp+var_1C6]
		sub	eax, [bp+var_172]
		mov	[bp+var_21A], eax
		mov	eax, [bp+var_222]
		mov	[bp+var_22E], eax
		mov	eax, [bp+var_21E]
		mov	[bp+var_22A], eax
		mov	eax, [bp+var_21A]
		mov	[bp+var_226], eax
		push	eax
		push	large [bp+var_22A]
		push	large [bp+var_22E]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_98], eax
		mov	[bp+var_94], eax
		mov	ax, di
		add	ax, 0Ch
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_9C]
		push	ax
		call	sub_5720C
		add	sp, 6
		mov	eax, [bp+var_1A]
		sub	eax, [bp+var_9C]
		mov	[bp+var_A4], eax
		mov	[bp+var_A0], eax
		cmp	byte ptr [si+85h], 0
		jnz	short loc_4A236
		mov	eax, [bp+var_8C]
		cmp	eax, [bp+var_94]
		jge	short loc_4A1D2
		mov	ax, 1
		jmp	short loc_4A1D4

loc_4A1D2:
		xor	ax, ax

loc_4A1D4:
		or	al, al
		jz	short loc_4A201
		mov	eax, [bp+var_5C]
		sub	eax, [bp+var_50]
		mov	[bp+var_A8], eax
		mov	[bp+var_AC], eax
		mov	eax, [bp+var_8C]
		cmp	eax, [bp+var_AC]
		jle	short loc_4A1FB
		mov	ax, 1
		jmp	short loc_4A1FD

loc_4A1FB:
		xor	ax, ax

loc_4A1FD:
		or	al, al
		jnz	short loc_4A22A

loc_4A201:
		mov	eax, [bp+var_5C]
		sub	eax, [bp+var_50]
		mov	[bp+var_B0], eax
		mov	[bp+var_B4], eax
		mov	eax, [bp+var_94]
		cmp	eax, [bp+var_B4]
		jge	short loc_4A224
		mov	ax, 1
		jmp	short loc_4A226

loc_4A224:
		xor	ax, ax

loc_4A226:
		or	al, al
		jz	short loc_4A231

loc_4A22A:
		mov	byte ptr [si+85h], 1
		jmp	short loc_4A236

loc_4A231:
		mov	byte ptr [si+85h], 2

loc_4A236:
		mov	eax, [bp+var_8C]
		cmp	eax, [bp+var_5C]
		jge	short loc_4A246
		mov	ax, 1
		jmp	short loc_4A248

loc_4A246:
		xor	ax, ax

loc_4A248:
		or	al, al
		jz	short loc_4A253
		cmp	byte ptr [si+85h], 1
		jz	short loc_4A270

loc_4A253:
		mov	eax, [bp+var_94]
		cmp	eax, [bp+var_5C]
		jge	short loc_4A263
		mov	ax, 1
		jmp	short loc_4A265

loc_4A263:
		xor	ax, ax

loc_4A265:
		or	al, al
		jz	short loc_4A286
		cmp	byte ptr [si+85h], 2
		jnz	short loc_4A286

loc_4A270:
		mov	[bp+var_B8], 0
		mov	eax, [bp+var_B8]
		mov	[bp+var_A0], eax
		jmp	loc_4A4E2

loc_4A286:
		mov	eax, [bp+var_5C]
		add	eax, [bp+var_50]
		mov	[bp+var_BC], eax
		mov	[bp+var_C0], eax
		mov	eax, [bp+var_8C]
		cmp	eax, [bp+var_C0]
		jge	short loc_4A2A9
		mov	ax, 1
		jmp	short loc_4A2AB

loc_4A2A9:
		xor	ax, ax

loc_4A2AB:
		or	al, al
		jz	short loc_4A2D8
		cmp	byte ptr [si+85h], 1
		jnz	short loc_4A2D8
		cmp	[bp+var_A0], 0
		jle	short loc_4A2C3
		mov	ax, 1
		jmp	short loc_4A2C5

loc_4A2C3:
		xor	ax, ax

loc_4A2C5:
		or	al, al
		jnz	short loc_4A2CC
		jmp	loc_4A4E2

loc_4A2CC:
		sub	[bp+var_A0], 16800h
		jmp	loc_4A4E2

loc_4A2D8:
		mov	eax, [bp+var_5C]
		add	eax, [bp+var_50]
		mov	[bp+var_C4], eax
		mov	[bp+var_C8], eax
		mov	eax, [bp+var_94]
		cmp	eax, [bp+var_C8]
		jge	short loc_4A2FB
		mov	ax, 1
		jmp	short loc_4A2FD

loc_4A2FB:
		xor	ax, ax

loc_4A2FD:
		or	al, al
		jz	short loc_4A32A
		cmp	byte ptr [si+85h], 2
		jnz	short loc_4A32A
		cmp	[bp+var_A0], 0
		jge	short loc_4A315
		mov	ax, 1
		jmp	short loc_4A317

loc_4A315:
		xor	ax, ax

loc_4A317:
		or	al, al
		jnz	short loc_4A31E
		jmp	loc_4A4E2

loc_4A31E:
		add	[bp+var_A0], 16800h
		jmp	loc_4A4E2

loc_4A32A:
		cmp	byte ptr [si+85h], 1
		jz	short loc_4A334
		jmp	loc_4A3C0

loc_4A334:
		mov	eax, [bp+var_1C2]
		sub	eax, [bp+var_17A]
		mov	[bp+var_252], eax
		mov	eax, [bp+var_1BE]
		sub	eax, [bp+var_176]
		mov	[bp+var_24E], eax
		mov	eax, [bp+var_1BA]
		sub	eax, [bp+var_172]
		mov	[bp+var_24A], eax
		mov	eax, [bp+var_252]
		mov	[bp+var_25E], eax
		mov	eax, [bp+var_24E]
		mov	[bp+var_25A], eax
		mov	eax, [bp+var_24A]
		mov	[bp+var_256], eax
		lea	ax, word ptr [bp+var_25E]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_152]
		push	ax
		call	sub_5720C
		add	sp, 6
		mov	eax, [bp+var_152]
		mov	[bp+var_14E], eax
		lea	ax, word ptr [bp+var_8C]
		push	ax
		lea	ax, word ptr [bp+var_5C]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_162]
		push	ax
		call	Math_AsinOfRatio_568A3
		add	sp, 8
		mov	eax, [bp+var_162]
		add	[bp+var_14E], eax
		jmp	loc_4A449

loc_4A3C0:
		mov	eax, [bp+var_1CE]
		sub	eax, [bp+var_17A]
		mov	[bp+var_26A], eax
		mov	eax, [bp+var_1CA]
		sub	eax, [bp+var_176]
		mov	[bp+var_266], eax
		mov	eax, [bp+var_1C6]
		sub	eax, [bp+var_172]
		mov	[bp+var_262], eax
		mov	eax, [bp+var_26A]
		mov	[bp+var_276], eax
		mov	eax, [bp+var_266]
		mov	[bp+var_272], eax
		mov	eax, [bp+var_262]
		mov	[bp+var_26E], eax
		lea	ax, word ptr [bp+var_276]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_156]
		push	ax
		call	sub_5720C
		add	sp, 6
		mov	eax, [bp+var_156]
		mov	[bp+var_14E], eax
		lea	ax, word ptr [bp+var_94]
		push	ax
		lea	ax, word ptr [bp+var_5C]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_162]
		push	ax
		call	Math_AsinOfRatio_568A3
		add	sp, 8
		mov	eax, [bp+var_162]
		sub	[bp+var_14E], eax

loc_4A449:
		cmp	[bp+var_14E], 0FFFF4C00h
		jge	short loc_4A459
		mov	ax, 1
		jmp	short loc_4A45B

loc_4A459:
		xor	ax, ax

loc_4A45B:
		or	al, al
		jz	short loc_4A46A
		add	[bp+var_14E], 16800h
		jmp	short loc_4A489

loc_4A46A:
		cmp	[bp+var_14E], 0B400h
		jle	short loc_4A47A
		mov	ax, 1
		jmp	short loc_4A47C

loc_4A47A:
		xor	ax, ax

loc_4A47C:
		or	al, al
		jz	short loc_4A489
		sub	[bp+var_14E], 16800h

loc_4A489:
		mov	eax, [bp+var_14E]
		sub	eax, [bp+var_9C]
		mov	[bp+var_15A], eax
		mov	[bp+var_15E], eax
		mov	[bp+var_A0], eax
		cmp	[bp+var_A0], 0B400h
		jle	short loc_4A4B2
		mov	ax, 1
		jmp	short loc_4A4B4

loc_4A4B2:
		xor	ax, ax

loc_4A4B4:
		or	al, al
		jz	short loc_4A4C3
		sub	[bp+var_A0], 16800h
		jmp	short loc_4A4E2

loc_4A4C3:
		cmp	[bp+var_A0], 0FFFF4C00h
		jge	short loc_4A4D3
		mov	ax, 1
		jmp	short loc_4A4D5

loc_4A4D3:
		xor	ax, ax

loc_4A4D5:
		or	al, al
		jz	short loc_4A4E2
		add	[bp+var_A0], 16800h

loc_4A4E2:
		mov	eax, [bp+var_38]
		mov	edx, dword_7976E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_D0], eax
		mov	eax, [bp+var_D0]
		mov	[bp+var_CC], eax
		mov	eax, [bp+var_A0]
		or	eax, eax
		jge	short loc_4A50F
		neg	eax

loc_4A50F:
		mov	[bp+var_D4], eax
		mov	eax, [bp+var_D4]
		mov	[bp+var_D8], eax
		cmp	eax, [bp+var_CC]
		jge	short loc_4A52A
		mov	ax, 1
		jmp	short loc_4A52C

loc_4A52A:
		xor	ax, ax

loc_4A52C:
		or	al, al
		jz	short loc_4A53C
		mov	eax, [bp+var_A0]
		mov	[bp+var_CC], eax
		jmp	short loc_4A566

loc_4A53C:
		cmp	[bp+var_A0], 0
		jge	short loc_4A549
		mov	ax, 1
		jmp	short loc_4A54B

loc_4A549:
		xor	ax, ax

loc_4A54B:
		or	al, al
		jz	short loc_4A566
		mov	eax, [bp+var_CC]
		neg	eax
		mov	[bp+var_DC], eax
		mov	[bp+var_E0], eax
		mov	[bp+var_CC], eax

loc_4A566:
		lea	ax, word ptr [bp+var_CC]
		push	ax
		mov	ax, di
		add	ax, 0Ch
		push	ax
		call	Vector_RotateHeading2D_57513
		add	sp, 4
		push	di
		call	Matrix_OrthonormalizeKeepRow1_59429
		pop	cx
		lea	ax, word ptr [bp+var_A0]
		push	ax
		push	di
		push	si
		push	cs
		call	near ptr Autopilot_BankForTurn_49AF0
		add	sp, 6
		mov	eax, [bp+var_40]
		mov	[bp+var_E4], eax
		push	0
		mov	[bp+var_EC], 0
		mov	eax, [bp+var_EC]
		mov	[bp+var_23A], eax
		mov	[bp+var_F0], 0
		mov	eax, [bp+var_F0]
		mov	[bp+var_236], eax
		mov	[bp+var_F4], 100h
		mov	eax, [bp+var_F4]
		mov	[bp+var_232], eax
		lea	ax, word ptr [bp+var_23A]
		push	ax
		lea	ax, word ptr [bp+var_17A]
		push	ax
		push	word_79788
		push	ss
		lea	ax, word ptr [bp+var_E8]
		push	ax
		call	sub_3664D
		add	sp, 0Ch
		add	[bp+var_E8], 0FA00h
		mov	eax, [bp+var_17E]
		cmp	eax, [bp+var_E8]
		jge	short loc_4A608
		mov	ax, 1
		jmp	short loc_4A60A

loc_4A608:
		xor	ax, ax

loc_4A60A:
		or	al, al
		jz	short loc_4A63B
		mov	eax, [bp+var_172]
		cmp	eax, [bp+var_E8]
		jge	short loc_4A61F
		mov	ax, 1
		jmp	short loc_4A621

loc_4A61F:
		xor	ax, ax

loc_4A621:
		or	al, al
		jz	short loc_4A631
		mov	eax, [bp+var_E8]
		mov	[bp+var_17E], eax
		jmp	short loc_4A63B

loc_4A631:
		mov	eax, [bp+var_172]
		mov	[bp+var_17E], eax

loc_4A63B:
		mov	eax, [bp+var_17E]
		sub	eax, [bp+var_172]
		mov	[bp+var_F8], eax
		mov	[bp+var_FC], eax
		mov	eax, [bp+var_FC]
		or	eax, eax
		jge	short loc_4A65C
		neg	eax

loc_4A65C:
		mov	[bp+var_100], eax
		mov	eax, [bp+var_100]
		mov	[bp+var_104], eax
		cmp	eax, [bp+var_E4]
		jge	short loc_4A677
		mov	ax, 1
		jmp	short loc_4A679

loc_4A677:
		xor	ax, ax

loc_4A679:
		or	al, al
		jz	short loc_4A698
		mov	eax, [bp+var_17E]
		sub	eax, [bp+var_172]
		mov	[bp+var_108], eax
		mov	[bp+var_10C], eax
		mov	[bp+var_E4], eax
		jmp	short loc_4A6C6

loc_4A698:
		mov	eax, [bp+var_172]
		cmp	eax, [bp+var_17E]
		jle	short loc_4A6A9
		mov	ax, 1
		jmp	short loc_4A6AB

loc_4A6A9:
		xor	ax, ax

loc_4A6AB:
		or	al, al
		jz	short loc_4A6C6
		mov	eax, [bp+var_E4]
		neg	eax
		mov	[bp+var_110], eax
		mov	[bp+var_114], eax
		mov	[bp+var_E4], eax

loc_4A6C6:
		mov	ax, di
		add	ax, 0Ch
		mov	[bp+var_116], ax
		mov	bx, [bp+var_116]
		mov	eax, [bx]
		mov	[bp+var_246], eax
		mov	eax, [bx+4]
		mov	[bp+var_242], eax
		mov	eax, [bx+8]
		mov	[bp+var_23E], eax
		mov	eax, [bp+var_3C]
		mov	edx, dword_7976E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_11E], eax
		mov	eax, [bp+var_11E]
		mov	[bp+var_11A], eax
		mov	eax, [bp+var_12]
		sub	eax, [bp+var_2C]
		mov	[bp+var_122], eax
		mov	[bp+var_126], eax
		mov	eax, [bp+var_126]
		or	eax, eax
		jge	short loc_4A72C
		neg	eax

loc_4A72C:
		mov	[bp+var_12A], eax
		mov	eax, [bp+var_12A]
		mov	[bp+var_12E], eax
		cmp	eax, [bp+var_11A]
		jge	short loc_4A747
		mov	ax, 1
		jmp	short loc_4A749

loc_4A747:
		xor	ax, ax

loc_4A749:
		or	al, al
		jz	short loc_4A757
		mov	eax, [bp+var_12]
		mov	[bp+var_2C], eax
		jmp	short loc_4A77F

loc_4A757:
		mov	eax, [bp+var_2C]
		cmp	eax, [bp+var_12]
		jle	short loc_4A766
		mov	ax, 1
		jmp	short loc_4A768

loc_4A766:
		xor	ax, ax

loc_4A768:
		or	al, al
		jz	short loc_4A776
		mov	eax, [bp+var_12]
		mov	[bp+var_2C], eax
		jmp	short loc_4A77F

loc_4A776:
		mov	eax, [bp+var_11A]
		add	[bp+var_2C], eax

loc_4A77F:
		mov	[bp+var_132], 0
		mov	eax, [bp+var_132]
		mov	[bp+var_23E], eax
		lea	ax, word ptr [bp+var_246]
		push	ax
		call	Vector_NormalizeInPlace_57715
		pop	cx
		mov	eax, [bp+var_246]
		mov	edx, [bp+var_2C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_246], eax
		mov	eax, [bp+var_242]
		mov	edx, [bp+var_2C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_242], eax
		mov	eax, [bp+var_23E]
		mov	edx, [bp+var_2C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_23E], eax
		mov	eax, [bp+var_E4]
		mov	[bp+var_23E], eax
		mov	bx, [si]
		mov	eax, [bp+var_246]
		mov	[bx+2], eax
		mov	eax, [bp+var_242]
		mov	[bx+6], eax
		mov	eax, [bp+var_23E]
		mov	[bx+0Ah], eax
		mov	ax, [si]
		add	ax, 2
		push	ax
		push	di
		push	si
		push	cs
		call	near ptr Autopilot_NosePitchRelax_49925
		add	sp, 6
		mov	eax, dword_79CEC
		mov	[si+4], eax
		mov	eax, dword_79CF0
		mov	[si+8], eax
		mov	eax, dword_79CF4
		mov	[si+0Ch], eax
		mov	eax, [bp+var_1A]
		sub	eax, [bp+var_9C]
		mov	[bp+var_136], eax
		mov	[bp+var_13A], eax
		mov	[bp+var_A0], eax
		cmp	[bp+var_A0], 0FFFE9D00h
		jge	short loc_4A855
		mov	ax, 1
		jmp	short loc_4A857

loc_4A855:
		xor	ax, ax

loc_4A857:
		or	al, al
		jnz	short loc_4A8A3
		cmp	[bp+var_A0], 16300h
		jle	short loc_4A86B
		mov	ax, 1
		jmp	short loc_4A86D

loc_4A86B:
		xor	ax, ax

loc_4A86D:
		or	al, al
		jnz	short loc_4A8A3
		mov	eax, [bp+var_A0]
		or	eax, eax
		jge	short loc_4A87E
		neg	eax

loc_4A87E:
		mov	[bp+var_13E], eax
		mov	eax, [bp+var_13E]
		mov	[bp+var_142], eax
		cmp	[bp+var_142], 500h
		jge	short loc_4A89D
		mov	ax, 1
		jmp	short loc_4A89F

loc_4A89D:
		xor	ax, ax

loc_4A89F:
		or	al, al
		jz	short loc_4A8D3

loc_4A8A3:
		mov	eax, [bp+var_48]
		imul	eax, eax, 14h
		mov	[bp+var_146], eax
		mov	[bp+var_14A], eax
		mov	eax, [bp+var_1E]
		cmp	eax, [bp+var_14A]
		jge	short loc_4A8C5
		mov	ax, 1
		jmp	short loc_4A8C7

loc_4A8C5:
		xor	ax, ax

loc_4A8C7:
		or	al, al
		jz	short loc_4A8D3
		les	bx, [bp+arg_2]
		mov	byte ptr es:[bx+1Ah], 1

loc_4A8D3:
		pop	di
		pop	si
		leave
		retf
Autopilot_FlyToPointKinematic_49CB8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4A8D7		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr Aero_SumLinearForces_486B5
		pop	cx
		push	ax
		push	word ptr [si]
		call	Physics_IntegratePosition_462A6
		add	sp, 4
		mov	al, 1
		pop	si
		pop	bp
		retf
sub_4A8D7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far, 950 instructions. LUE 2026-11-05. Tick physique de l'avion (équivalent de
; PhysicsTicks). Ordre : gains de dégâts ([bx+34h]) ; AU SOL : joueur + variable 667 posée +
; vitesse < 20 m/s → au sol forcé, sol = dword_776A2 (120 m s'il est sous 10 m) ; autres :
; sub_3664D ; décollage (au sol effacé) si l'altitude dépasse sol + garde
; (Aircraft_GroundClearance_3DF89) + dword_7CDE6 (si 667 à 0) + 10 m ; sub_4B53B ; MOTEUR :
; carburant ≤ 0 → poussée 0 ; cran ≤ arrondi(10·g) ; poussée = Aero_PropellerThrust_4710B × g
; (dword_7CE36) ; carburant −= (10 − 9·dword_7CE1E)·sfc·(cran·0,199 si ≤ 5, sinon cran·0,297 ;
; facteur sauté au cran 0)·dt, comme STRIKE ; COMMANDES → drapeaux [si+92h] (bit 0 aérofreins,
; bit 1 avec son 18, bit 2 train, bits 4, 5 (méthode +44h), bits 7-8 compteur 0..2), chaque
; organe bloqué si détruit (octets +42h..+44h de l'objet de dégâts contre leurs maxima +7..+9)
; ; 1re image : bit 2 si vitesse nulle, cran 4 sinon ; PILOTE AUTOMATIQUE si jdyn[85h] ≠ 255
; et bit 5 à 0 ; FORCES : Aero_SumLinearForces_486B5 ; VITESSE BORNÉE à 2 × Vref (jdyn[9Dh]) ;
; Aero_ControlOrchestrator_49011 ; Physics_IntegrateSecondaryPosition ; au sol sous 25 m/s :
; lacet = −([ctrl+21h]/16 · V)/4 (STRIKE : 40 m/s) ; Physics_IntegratePosition_462A6 ; AU SOL
; : vitesse projetée sur le sol, annulée sous 5/256 ; jdyn[79h] = 10, [7Dh] = 20, [81h] = 0,5
; ; tangage du nez (sub_59A03) : à l'arrêt hors de 10 ± 0,5° → remis à 10° (méthode +2Ch) ;
; sous 20 m/s : vitesse de tangage menée vers 10°, bornée à 0,5·dt (roulette de queue).
; ==============================================================================================
PhysicsTicks_4A8F4		proc far

var_E6		= dword ptr -0E6h
var_E2		= dword ptr -0E2h
var_DE		= dword ptr -0DEh
var_DA		= dword ptr -0DAh
var_D6		= dword ptr -0D6h
var_D2		= dword ptr -0D2h
var_CE		= dword ptr -0CEh
var_CA		= dword ptr -0CAh
var_C6		= dword ptr -0C6h
var_C2		= dword ptr -0C2h
var_BE		= dword ptr -0BEh
var_BA		= dword ptr -0BAh
var_AA		= dword ptr -0AAh
var_A6		= dword ptr -0A6h
var_A2		= dword ptr -0A2h
var_9E		= dword ptr -9Eh
var_9A		= dword ptr -9Ah
var_96		= dword ptr -96h
var_92		= dword ptr -92h
var_8E		= dword ptr -8Eh
var_8A		= dword ptr -8Ah
var_86		= dword ptr -86h
var_82		= dword ptr -82h
var_80		= dword ptr -80h
var_7E		= dword ptr -7Eh
var_7C		= dword ptr -7Ch
var_7A		= dword ptr -7Ah
var_78		= dword ptr -78h
var_76		= dword ptr -76h
var_74		= dword ptr -74h
var_72		= dword ptr -72h
var_70		= dword ptr -70h
var_6E		= dword ptr -6Eh
var_6C		= dword ptr -6Ch
var_6A		= dword ptr -6Ah
var_68		= dword ptr -68h
var_66		= dword ptr -66h
var_64		= dword ptr -64h
var_62		= dword ptr -62h
var_60		= dword ptr -60h
var_5E		= dword ptr -5Eh
var_5C		= dword ptr -5Ch
var_5A		= dword ptr -5Ah
var_58		= dword ptr -58h
var_56		= dword ptr -56h
var_54		= dword ptr -54h
var_50		= dword ptr -50h
var_4C		= dword ptr -4Ch
var_48		= word ptr -48h
var_46		= dword ptr -46h
var_42		= dword ptr -42h
var_3E		= dword ptr -3Eh
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2E		= word ptr -2Eh
var_2C		= word ptr -2Ch
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_21		= byte ptr -21h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_13		= byte ptr -13h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0E6h
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si+2]
		call	dword ptr [bx+34h]
		pop	cx
		mov	eax, [bp+arg_2]
		mov	[bp+var_4], eax
		les	bx, word ptr [bp+var_4]
		mov	ax, es:[bx+23h]
		mov	[bp+var_A], ax
		movsx	eax, [bp+var_A]
		shl	eax, 8
		mov	[bp+var_8], eax
		mov	[bp+var_E], eax
		mov	[bp+var_12], 0
		cmp	word_7977C, 0
		jnz	short loc_4A940
		mov	bx, [si]
		mov	byte ptr [bx+20h], 1

loc_4A940:
		mov	[bp+var_13], 0
		mov	bx, [si]
		mov	ax, [bx+1Eh]
		cmp	ax, word_7CADA
		jnz	short loc_4A9B4
		push	29Bh
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_4A9B4
		push	word_7CADA
		push	ss
		lea	ax, word ptr [bp+var_C2]
		push	ax
		mov	bx, word_7CADA
		mov	bx, [bx]
		call	dword ptr [bx+50h]
		add	sp, 6
		push	large [bp+var_BA]
		push	large [bp+var_BE]
		push	large [bp+var_C2]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_18], eax
		mov	[bp+var_1C], eax
		cmp	[bp+var_1C], 1400h
		jge	short loc_4A9A4
		mov	ax, 1
		jmp	short loc_4A9A6

loc_4A9A4:
		xor	ax, ax

loc_4A9A6:
		or	al, al
		jz	short loc_4A9B4
		mov	[bp+var_13], 1
		mov	bx, [si]
		mov	byte ptr [bx+20h], 1

loc_4A9B4:
		mov	bx, [si]
		cmp	byte ptr [bx+20h], 0
		jnz	short loc_4A9BF
		jmp	loc_4AA83

loc_4A9BF:
		mov	ax, [bx+1Eh]
		cmp	ax, word_7CADA
		jnz	short loc_4AA20
		cmp	word_7977C, 0
		jbe	short loc_4AA20
		mov	eax, dword_776A2
		mov	[bp+var_20], eax
		cmp	[bp+var_13], 0
		jz	short loc_4AA02
		cmp	[bp+var_20], 0A00h
		jge	short loc_4A9EC
		mov	ax, 1
		jmp	short loc_4A9EE

loc_4A9EC:
		xor	ax, ax

loc_4A9EE:
		or	al, al
		jz	short loc_4AA02
		mov	[bp+var_26], 7800h
		mov	eax, [bp+var_26]
		mov	[bp+var_20], eax

loc_4AA02:
		mov	[bp+var_21], 1
		mov	bx, [si]
		mov	bx, [bx+1Eh]
		mov	eax, [bx+1Ah]
		cmp	eax, [bp+var_20]
		jge	short loc_4AA54
		mov	bx, [si]
		mov	bx, [bx+1Eh]
		mov	[bp+var_20], eax
		jmp	short loc_4AA54

loc_4AA20:
		push	1
		lea	ax, word ptr [bp+var_CE]
		push	ax
		mov	bx, [si]
		mov	ax, [bx+1Eh]
		add	ax, 12h
		push	ax
		push	word_79788
		push	ss
		lea	ax, word ptr [bp+var_54]
		push	ax
		call	sub_3664D
		add	sp, 0Ch
		mov	eax, [bp+var_54]
		mov	[bp+var_20], eax
		mov	bx, word_79788
		mov	al, [bx+207h]
		mov	[bp+var_21], al

loc_4AA54:
		cmp	word_77C4D, 0
		jz	short loc_4AA7B
		mov	bx, [si]
		mov	byte ptr [bx+20h], 1
		mov	byte_776BC, 1
		mov	bx, [bx+1Eh]
		mov	eax, [bx+1Ah]
		add	eax, 0FFFFFB00h
		sub	eax, [bp+var_20]
		mov	[bp+var_12], eax

loc_4AA7B:
		mov	eax, [bp+var_12]
		add	[bp+var_20], eax

loc_4AA83:
		mov	bx, [si]
		cmp	byte ptr [bx+20h], 0
		jnz	short loc_4AA8E
		jmp	loc_4AB46

loc_4AA8E:
		cmp	word_7977C, 3
		ja	short loc_4AA98
		jmp	loc_4AB46

loc_4AA98:
		cmp	[bp+var_21], 0
		jnz	short loc_4AAA1
		jmp	loc_4AB46

loc_4AAA1:
		push	si
		mov	bx, [si+2]
		call	dword ptr [bx+38h]
		pop	cx
		mov	bx, [si]
		push	word ptr [bx+1Eh]
		push	ss
		lea	ax, word ptr [bp+var_2A]
		push	ax
		call	Aircraft_GroundClearance_3DF89
		add	sp, 6
		mov	eax, [bp+var_2A]
		add	[bp+var_20], eax
		push	29Bh
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jnz	short loc_4AAD8
		mov	eax, dword_7CDE6
		add	[bp+var_20], eax

loc_4AAD8:
		add	[bp+var_20], 0A00h
		mov	bx, [si]
		mov	bx, [bx+1Eh]
		mov	eax, [bx+1Ah]
		cmp	eax, [bp+var_20]
		jle	short loc_4AB0D
		mov	bx, [si]
		mov	byte ptr [bx+20h], 0
		mov	ax, [bx+1Eh]
		cmp	ax, word_7CADA
		jnz	short loc_4AB0D
		mov	byte_78EB9, 0
		mov	byte_78EB6, 0
		mov	byte_78EB8, 0

loc_4AB0D:
		mov	bx, [si]
		mov	ax, [bx+1Eh]
		cmp	ax, word_7CADA
		jnz	short loc_4AB46
		mov	al, byte_776BC
		mov	ah, 0
		or	ax, ax
		jnz	short loc_4AB46
		mov	al, [bp+var_13]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_4AB46
		mov	byte ptr [bx+20h], 0
		mov	ax, [bx+1Eh]
		cmp	ax, word_7CADA
		jnz	short loc_4AB46
		mov	byte_78EB9, 0
		mov	byte_78EB6, 0
		mov	byte_78EB8, 0

loc_4AB46:
		push	si
		nop
		push	cs
		call	near ptr sub_4B53B
		pop	cx
		cmp	dword ptr [si+8Ah], 0
		jg	short loc_4AB71
		mov	dword ptr [si+8Ah], 0
		mov	dword ptr [si+28h], 0
		les	bx, word ptr [bp+var_4]
		mov	byte ptr es:[bx+1Eh], 0
		jmp	loc_4ACEA

loc_4AB71:
		les	bx, word ptr [bp+var_4]
		mov	al, es:[bx+1Eh]
		mov	byte ptr [bp+var_54+2], al
		mov	eax, dword_7CE36
		imul	eax, eax, 0Ah
		mov	[bp+var_5A], eax
		mov	[bp+var_56], eax
		cmp	[bp+var_56], 0
		jge	short loc_4AB9C
		add	eax, 0FFFFFF80h
		sar	eax, 8
		jmp	short loc_4ABAA

loc_4AB9C:
		mov	eax, [bp+var_56]
		add	eax, 80h
		sar	eax, 8

loc_4ABAA:
		mov	byte ptr [bp+var_5C], al
		mov	al, byte ptr [bp+var_54+2]
		cmp	al, byte ptr [bp+var_5C]
		jle	short loc_4ABBB
		mov	al, byte ptr [bp+var_5C]
		mov	byte ptr [bp+var_54+2], al

loc_4ABBB:
		mov	al, byte ptr [bp+var_54+2]
		mov	byte ptr [bp+var_5E], al
		les	bx, word ptr [bp+var_4]
		mov	es:[bx+1Eh], al
		mov	byte ptr [bp+var_60], al
		push	ax
		mov	ax, si
		add	ax, 22h
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_64]
		push	ax
		call	Aero_PropellerThrust_4710B
		add	sp, 8
		mov	eax, [bp+var_64]
		mov	[si+28h], eax
		mov	eax, [si+28h]
		mov	edx, dword_7CE36
		imul	edx
		shrd	eax, edx, 8
		mov	[si+28h], eax
		cmp	byte ptr [bp+var_54+2], 5
		jg	short loc_4AC3C
		mov	al, byte ptr [bp+var_54+2]
		cbw
		mov	word ptr [bp+var_6A], ax
		movsx	eax, word ptr [bp+var_6A]
		shl	eax, 8
		mov	[bp+var_6E], eax
		mov	eax, [bp+var_6E]
		mov	[bp+var_68], eax
		mov	[bp+var_72], 33h
		mov	eax, [bp+var_68]
		mov	edx, [bp+var_72]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_68], eax
		jmp	short loc_4AC74

loc_4AC3C:
		mov	al, byte ptr [bp+var_54+2]
		cbw
		mov	word ptr [bp+var_74], ax
		movsx	eax, word ptr [bp+var_74]
		shl	eax, 8
		mov	[bp+var_78], eax
		mov	eax, [bp+var_78]
		mov	[bp+var_68], eax
		mov	[bp+var_7C], 4Ch
		mov	eax, [bp+var_68]
		mov	edx, [bp+var_7C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_68], eax

loc_4AC74:
		mov	[bp+var_80], 0FFFFF700h
		mov	eax, [bp+var_80]
		mov	edx, dword_7CE1E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_80], eax
		add	[bp+var_80], 0A00h
		mov	di, si
		add	di, 44h
		mov	eax, [bp+var_80]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_80], eax
		cmp	[bp+var_68], 0
		jle	short loc_4ACCC
		mov	eax, [bp+var_80]
		mov	edx, [bp+var_68]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_80], eax

loc_4ACCC:
		mov	eax, [bp+var_80]
		mov	edx, dword_7976E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_80], eax
		mov	eax, [bp+var_80]
		sub	[si+8Ah], eax

loc_4ACEA:
		mov	bx, [si]
		mov	bx, [bx+1Eh]
		mov	ax, [bx+65h]
		mov	dx, [bx+63h]
		mov	[bp+var_2C], ax
		mov	[bp+var_2E], dx
		les	bx, word ptr [bp+var_4]
		mov	al, es:[bx+1Ch]
		shr	ax, 6
		and	ax, 1
		or	al, al
		jz	short loc_4AD55
		les	bx, [bp+var_2E]
		cmp	byte ptr es:[bx+44h], 0
		jz	short loc_4AD1B
		mov	ax, 1
		jmp	short loc_4AD1D

loc_4AD1B:
		xor	ax, ax

loc_4AD1D:
		or	al, al
		jz	short loc_4AD33
		les	bx, [bp+var_2E]
		mov	al, es:[bx+44h]
		cmp	al, es:[bx+9]
		jb	short loc_4AD33
		mov	ax, 1
		jmp	short loc_4AD35

loc_4AD33:
		xor	ax, ax

loc_4AD35:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_4AD55
		mov	al, [si+92h]
		and	ax, 1
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		and	ax, 1
		and	byte ptr [si+92h], 0FEh
		or	[si+92h], al

loc_4AD55:
		les	bx, word ptr [bp+var_4]
		mov	al, es:[bx+1Ch]
		shr	ax, 5
		and	ax, 1
		or	al, al
		jnz	short loc_4AD69
		jmp	loc_4ADEA

loc_4AD69:
		les	bx, [bp+var_2E]
		cmp	byte ptr es:[bx+43h], 0
		jz	short loc_4AD78
		mov	ax, 1
		jmp	short loc_4AD7A

loc_4AD78:
		xor	ax, ax

loc_4AD7A:
		or	al, al
		jz	short loc_4AD90
		les	bx, [bp+var_2E]
		mov	al, es:[bx+43h]
		cmp	al, es:[bx+8]
		jb	short loc_4AD90
		mov	ax, 1
		jmp	short loc_4AD92

loc_4AD90:
		xor	ax, ax

loc_4AD92:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_4ADE2
		mov	al, [si+92h]
		shr	ax, 1
		and	ax, 1
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		and	ax, 1
		and	byte ptr [si+92h], 0FDh
		shl	al, 1
		or	[si+92h], al
		push	word_7CEF9
		mov	bx, word_7CEF9
		mov	bx, [bx+50h]
		call	dword ptr [bx+1Ch]
		pop	cx
		mov	bx, [si]
		cmp	ax, [bx+1Eh]
		jz	short loc_4ADD3
		cmp	byte_7769B, 0
		jz	short loc_4ADE2

loc_4ADD3:
		push	0
		push	large 0
		push	12h
		call	sub_5EB62
		add	sp, 8

loc_4ADE2:
		les	bx, word ptr [bp+var_4]
		and	byte ptr es:[bx+1Ch], 0DFh

loc_4ADEA:
		les	bx, word ptr [bp+var_4]
		mov	al, es:[bx+1Dh]
		and	ax, 1
		or	al, al
		jz	short loc_4AE18
		mov	al, [si+92h]
		shr	ax, 4
		and	ax, 1
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		and	ax, 1
		and	byte ptr [si+92h], 0EFh
		shl	al, 4
		or	[si+92h], al

loc_4AE18:
		les	bx, word ptr [bp+var_4]
		mov	al, es:[bx+1Dh]
		shr	ax, 1
		and	ax, 1
		or	al, al
		jz	short loc_4AE5E
		mov	al, [si+92h]
		shr	ax, 5
		and	ax, 1
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		and	ax, 1
		and	byte ptr [si+92h], 0DFh
		shl	al, 5
		or	[si+92h], al
		mov	al, [si+92h]
		shr	ax, 5
		and	ax, 1
		or	al, al
		jz	short loc_4AE5E
		push	si
		mov	bx, [si+2]
		call	dword ptr [bx+44h]
		pop	cx

loc_4AE5E:
		les	bx, word ptr [bp+var_4]
		mov	al, es:[bx+1Dh]
		shr	ax, 2
		and	ax, 1
		or	al, al
		jz	short loc_4AEA1
		mov	ax, [si+92h]
		shr	ax, 7
		and	ax, 3
		cmp	al, 2
		jnb	short loc_4AE9B
		mov	ax, [si+92h]
		shr	ax, 7
		and	ax, 3
		inc	al
		and	ax, 3
		and	word ptr [si+92h], 0FE7Fh
		shl	ax, 7
		or	[si+92h], ax
		jmp	short loc_4AEA1

loc_4AE9B:
		and	word ptr [si+92h], 0FE7Fh

loc_4AEA1:
		les	bx, word ptr [bp+var_4]
		mov	al, es:[bx+1Ch]
		shr	ax, 7
		and	ax, 1
		or	al, al
		jz	short loc_4AF01
		les	bx, [bp+var_2E]
		cmp	byte ptr es:[bx+42h], 0
		jz	short loc_4AEC1
		mov	ax, 1
		jmp	short loc_4AEC3

loc_4AEC1:
		xor	ax, ax

loc_4AEC3:
		or	al, al
		jz	short loc_4AED9
		les	bx, [bp+var_2E]
		mov	al, es:[bx+42h]
		cmp	al, es:[bx+7]
		jb	short loc_4AED9
		mov	ax, 1
		jmp	short loc_4AEDB

loc_4AED9:
		xor	ax, ax

loc_4AEDB:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_4AF01
		mov	al, [si+92h]
		shr	ax, 2
		and	ax, 1
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		and	ax, 1
		and	byte ptr [si+92h], 0FBh
		shl	al, 2
		or	[si+92h], al

loc_4AF01:
		cmp	word_7977C, 0
		jnz	short loc_4AF36
		mov	bx, [si]
		push	large [bx+0Ah]
		push	large [bx+6]
		push	large [bx+2]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_32], eax
		mov	[bp+var_36], eax
		cmp	[bp+var_36], 0
		jnz	short loc_4AF36
		or	byte ptr [si+92h], 4

loc_4AF36:
		cmp	word_7977C, 0
		jnz	short loc_4AF6E
		mov	bx, [si]
		push	large [bx+0Ah]
		push	large [bx+6]
		push	large [bx+2]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_3A], eax
		mov	[bp+var_3E], eax
		cmp	[bp+var_3E], 0
		jz	short loc_4AF6E
		les	bx, word ptr [bp+var_4]
		mov	byte ptr es:[bx+1Eh], 4

loc_4AF6E:
		cmp	byte ptr [si+85h], 0FFh
		jz	short loc_4AF96
		mov	al, [si+92h]
		shr	ax, 5
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_4AF96
		push	large [bp+arg_2]
		push	si
		push	cs
		call	near ptr Autopilot_FlyToPointKinematic_49CB8
		add	sp, 6
		mov	al, 1
		jmp	loc_4B537

loc_4AF96:
		push	si
		push	cs
		call	near ptr Aero_SumLinearForces_486B5
		pop	cx
		mov	di, ax
		mov	eax, [di]
		mov	bx, [si]
		mov	[bx+0Eh], eax
		mov	eax, [di+4]
		mov	[bx+12h], eax
		mov	eax, [di+8]
		mov	[bx+16h], eax
		push	large [bx+0Ah]
		push	large [bx+6]
		push	large [bx+2]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_42], eax
		mov	[bp+var_46], eax
		mov	ax, [si+9Dh]
		shl	ax, 1
		mov	[bp+var_48], ax
		movsx	eax, [bp+var_48]
		shl	eax, 8
		cmp	eax, [bp+var_46]
		jge	short loc_4AFF4
		mov	ax, 1
		jmp	short loc_4AFF6

loc_4AFF4:
		xor	ax, ax

loc_4AFF6:
		or	al, al
		jnz	short loc_4AFFD
		jmp	loc_4B0F9

loc_4AFFD:
		mov	di, [si]
		add	di, 2
		mov	eax, [di]
		mov	[bp+var_CE], eax
		mov	eax, [di+4]
		mov	[bp+var_CA], eax
		mov	eax, [di+8]
		mov	[bp+var_C6], eax
		lea	ax, word ptr [bp+var_CE]
		push	ax
		call	Vector_NormalizeInPlace_57715
		pop	cx
		mov	bx, [si+9Dh]
		movsx	eax, bx
		mov	edx, [bp+var_CE]
		imul	edx, eax
		mov	[bp+var_54], edx
		mov	eax, [bp+var_54]
		mov	[bp+var_58], eax
		movsx	eax, bx
		mov	edx, [bp+var_CA]
		imul	edx, eax
		mov	[bp+var_5C], edx
		mov	eax, [bp+var_5C]
		mov	[bp+var_60], eax
		movsx	eax, bx
		mov	edx, [bp+var_C6]
		imul	edx, eax
		mov	[bp+var_64], edx
		mov	eax, [bp+var_64]
		mov	[bp+var_68], eax
		mov	eax, [bp+var_58]
		mov	[bp+var_DA], eax
		mov	eax, [bp+var_60]
		mov	[bp+var_D6], eax
		mov	eax, [bp+var_68]
		mov	[bp+var_D2], eax
		mov	eax, [bp+var_DA]
		shl	eax, 1
		mov	[bp+var_6C], eax
		mov	[bp+var_70], eax
		mov	eax, [bp+var_D6]
		shl	eax, 1
		mov	[bp+var_74], eax
		mov	[bp+var_78], eax
		mov	eax, [bp+var_D2]
		shl	eax, 1
		mov	[bp+var_7C], eax
		mov	[bp+var_80], eax
		mov	eax, [bp+var_70]
		mov	[bp+var_E6], eax
		mov	eax, [bp+var_78]
		mov	[bp+var_E2], eax
		mov	eax, [bp+var_80]
		mov	[bp+var_DE], eax
		mov	bx, [si]
		mov	eax, [bp+var_E6]
		mov	[bx+2], eax
		mov	eax, [bp+var_E2]
		mov	[bx+6], eax
		mov	eax, [bp+var_DE]
		mov	[bx+0Ah], eax

loc_4B0F9:
		push	large [bp+var_4]
		push	si
		push	cs
		call	near ptr Aero_ControlOrchestrator_49011
		add	sp, 6
		push	ax
		push	si
		call	Physics_IntegrateSecondaryPosition
		add	sp, 4
		mov	bx, [si]
		cmp	byte ptr [bx+20h], 0
		jnz	short loc_4B11A
		jmp	loc_4B1BE

loc_4B11A:
		push	large [bx+0Ah]
		push	large [bx+6]
		push	large [bx+2]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_4C], eax
		mov	[bp+var_50], eax
		cmp	[bp+var_50], 1900h
		jge	short loc_4B1BE
		les	bx, word ptr [bp+var_4]
		mov	ax, es:[bx+21h]
		mov	word ptr [bp+var_56], ax
		movsx	eax, word ptr [bp+var_56]
		shl	eax, 8
		mov	[bp+var_54], eax
		mov	ebx, 10h
		cdq
		idiv	ebx
		mov	[bp+var_54], eax
		mov	bx, [si]
		push	large [bx+0Ah]
		push	large [bx+6]
		push	large [bx+2]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_5A], eax
		mov	[bp+var_5E], eax
		mov	eax, [bp+var_54]
		mov	edx, [bp+var_5E]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_54], eax
		mov	ebx, 4
		mov	eax, [bp+var_54]
		cdq
		idiv	ebx
		mov	[bp+var_54], eax
		neg	eax
		mov	[bp+var_54], eax
		mov	[si+0Ch], eax

loc_4B1BE:
		mov	ax, [si]
		add	ax, 0Eh
		push	ax
		push	word ptr [si]
		call	Physics_IntegratePosition_462A6
		add	sp, 4
		mov	bx, [si]
		cmp	byte ptr [bx+20h], 0
		jnz	short loc_4B1D9
		jmp	loc_4B535

loc_4B1D9:
		push	word ptr [bx+1Eh]
		mov	bx, [bx+1Eh]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	word ptr [bp+var_54+2], ax
		mov	di, [si]
		add	di, 2
		mov	eax, [di]
		mov	[bp+var_CE], eax
		mov	eax, [di+4]
		mov	[bp+var_CA], eax
		mov	eax, [di+8]
		mov	[bp+var_C6], eax
		push	word ptr [bp+var_54+2]
		lea	ax, word ptr [bp+var_CE]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_DA]
		push	ax
		call	Targeting_ComputeGeometryHelperB_56FBA
		add	sp, 8
		mov	eax, [bp+var_DA]
		sub	[bp+var_CE], eax
		mov	eax, [bp+var_D6]
		sub	[bp+var_CA], eax
		mov	eax, [bp+var_D2]
		sub	[bp+var_C6], eax
		cmp	[bp+var_C6], 0
		jge	short loc_4B24C
		mov	[bp+var_C6], 0

loc_4B24C:
		push	large [bp+var_C6]
		push	large [bp+var_CA]
		push	large [bp+var_CE]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_56], eax
		mov	[bp+var_5A], eax
		cmp	[bp+var_5A], 5
		jge	short loc_4B288
		xor	eax, eax
		mov	[bp+var_C6], eax
		mov	[bp+var_CA], eax
		mov	[bp+var_CE], eax

loc_4B288:
		mov	bx, [si]
		mov	eax, [bp+var_CE]
		mov	[bx+2], eax
		mov	eax, [bp+var_CA]
		mov	[bx+6], eax
		mov	eax, [bp+var_C6]
		mov	[bx+0Ah], eax
		mov	dword ptr [si+79h], 0A00h
		mov	dword ptr [si+7Dh], 1400h
		mov	dword ptr [si+81h], 80h
		push	word ptr [bp+var_54+2]
		push	ss
		lea	ax, word ptr [bp+var_66]
		push	ax
		call	sub_59A03
		add	sp, 6
		mov	bx, [si]
		push	large [bx+0Ah]
		push	large [bx+6]
		push	large [bx+2]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_6A], eax
		mov	[bp+var_6E], eax
		cmp	[bp+var_6E], 0
		jnz	short loc_4B2FC
		mov	ax, 1
		jmp	short loc_4B2FE

loc_4B2FC:
		xor	ax, ax

loc_4B2FE:
		or	al, al
		jnz	short loc_4B305
		jmp	loc_4B39F

loc_4B305:
		mov	eax, [si+79h]
		mov	[bp+var_5E], eax
		sub	[bp+var_5E], 80h
		mov	[bp+var_62], eax
		add	[bp+var_62], 80h
		mov	[bp+var_72], 0
		mov	eax, [bp+var_72]
		mov	[si+4], eax
		mov	eax, [bp+var_66]
		cmp	eax, [bp+var_62]
		jle	short loc_4B340
		mov	ax, 1
		jmp	short loc_4B342

loc_4B340:
		xor	ax, ax

loc_4B342:
		or	al, al
		jnz	short loc_4B35E
		mov	eax, [bp+var_66]
		cmp	eax, [bp+var_5E]
		jge	short loc_4B355
		mov	ax, 1
		jmp	short loc_4B357

loc_4B355:
		xor	ax, ax

loc_4B357:
		or	al, al
		jnz	short loc_4B35E
		jmp	loc_4B4F3

loc_4B35E:
		mov	[bp+var_76], 0
		lea	ax, word ptr [bp+var_76]
		push	ax
		mov	[bp+var_7A], 0
		lea	ax, word ptr [bp+var_7A]
		push	ax
		mov	eax, [si+79h]
		sub	eax, [bp+var_66]
		mov	[bp+var_7E], eax
		mov	[bp+var_82], eax
		lea	ax, word ptr [bp+var_82]
		push	ax
		mov	bx, [si]
		push	word ptr [bx+1Eh]
		mov	bx, [bx+1Eh]
		mov	bx, [bx]
		call	dword ptr [bx+2Ch]
		add	sp, 8
		jmp	loc_4B4F3

loc_4B39F:
		mov	bx, [si]
		push	large [bx+0Ah]
		push	large [bx+6]
		push	large [bx+2]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_86], eax
		mov	[bp+var_8A], eax
		mov	eax, [si+7Dh]
		cmp	eax, [bp+var_8A]
		jle	short loc_4B3D3
		mov	ax, 1
		jmp	short loc_4B3D5

loc_4B3D3:
		xor	ax, ax

loc_4B3D5:
		or	al, al
		jnz	short loc_4B3DC
		jmp	loc_4B4F3

loc_4B3DC:
		mov	di, si
		add	di, 79h
		mov	eax, [di]
		mov	[bp+var_92], eax
		mov	eax, [bp+var_66]
		sub	[bp+var_92], eax
		mov	di, si
		add	di, 81h
		mov	eax, [di]
		mov	[bp+var_96], eax
		mov	eax, [bp+var_96]
		mov	edx, dword_7976E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_96], eax
		cmp	[bp+var_92], 0
		jle	short loc_4B424
		mov	ax, 1
		jmp	short loc_4B426

loc_4B424:
		xor	ax, ax

loc_4B426:
		or	al, al
		jz	short loc_4B470
		mov	eax, [bp+var_92]
		cmp	eax, [bp+var_96]
		jge	short loc_4B43B
		mov	ax, 1
		jmp	short loc_4B43D

loc_4B43B:
		xor	ax, ax

loc_4B43D:
		or	al, al
		jz	short loc_4B464
		mov	eax, [bp+var_92]
		mov	edx, dword_7976A
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_92], eax
		mov	eax, [bp+var_92]
		mov	[si+4], eax
		jmp	loc_4B4F3

loc_4B464:
		mov	eax, [si+81h]
		mov	[si+4], eax
		jmp	loc_4B4F3

loc_4B470:
		cmp	[bp+var_92], 0
		jge	short loc_4B47D
		mov	ax, 1
		jmp	short loc_4B47F

loc_4B47D:
		xor	ax, ax

loc_4B47F:
		or	al, al
		jz	short loc_4B4E1
		mov	eax, [bp+var_92]
		neg	eax
		mov	[bp+var_9A], eax
		mov	[bp+var_9E], eax
		cmp	eax, [bp+var_96]
		jge	short loc_4B4A1
		mov	ax, 1
		jmp	short loc_4B4A3

loc_4B4A1:
		xor	ax, ax

loc_4B4A3:
		or	al, al
		jz	short loc_4B4C9
		mov	eax, [bp+var_92]
		mov	edx, dword_7976A
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_92], eax
		mov	eax, [bp+var_92]
		mov	[si+4], eax
		jmp	short loc_4B4F3

loc_4B4C9:
		mov	eax, [si+81h]
		neg	eax
		mov	[bp+var_A2], eax
		mov	[bp+var_A6], eax
		mov	[si+4], eax
		jmp	short loc_4B4F3

loc_4B4E1:
		mov	[bp+var_AA], 0
		mov	eax, [bp+var_AA]
		mov	[si+4], eax

loc_4B4F3:
		push	word ptr [bp+var_54+2]
		push	ss
		lea	ax, word ptr [bp+var_8E]
		push	ax
		call	sub_59A03
		add	sp, 6
		mov	eax, [bp+var_8E]
		mov	edx, dword_7976A
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_8E], eax
		mov	eax, [bp+var_8E]
		neg	eax
		cmp	[si+4], eax
		jge	short loc_4B535
		mov	eax, [bp+var_8E]
		neg	eax
		mov	[si+4], eax

loc_4B535:
		mov	al, 1

loc_4B537:
		pop	di
		pop	si
		leave
		retf
PhysicsTicks_4A8F4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4B53B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	byte_793EE, 0
		mov	byte_79405, 0
		mov	byte_79400, 0
		mov	byte_79448, 0
		mov	byte_7940A, 0
		mov	byte_7940F, 0
		mov	byte_79410, 0
		mov	byte_7941D, 0
		mov	byte_7942A, 0
		mov	byte_7943B, 0
		pop	bp
		retf
sub_4B53B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4B575		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, 100h
		call	Math_RandomScale_56C2F
		mov	[si+94h], al
		or	byte ptr [si+92h], 20h
		pop	si
		pop	bp
		retf
sub_4B575		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. Apparié 2026-11-05 à Aero_MaxRollRate_4AF35 de STRIKE, ratio 0,89 ; constantes
; identiques une fois les champs décalés.
; ==============================================================================================
Aero_MaxRollRate_4B590		proc far

var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= word ptr -20h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= word ptr -12h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 34h
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	byte_7946E, 0
		jnz	short loc_4B5A6
		inc	byte_7946E

loc_4B5A6:
		mov	bx, [si]
		push	large [bx+0Ah]
		push	large [bx+6]
		push	large [bx+2]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_8], eax
		mov	[bp+var_4], eax
		push	si
		call	Aero_FlowAngle_AoA_46922
		pop	cx
		mov	di, ax
		push	si
		call	Aero_FlowAngle_Sideslip_469CA
		pop	cx
		mov	[bp+var_12], ax
		mov	eax, [di]
		mov	[bp+var_10], eax
		mov	bx, [bp+var_12]
		mov	eax, [bx]
		mov	[bp+var_C], eax
		push	large 0
		push	eax
		push	large [bp+var_10]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_1A], eax
		mov	[bp+var_16], eax
		mov	eax, [si+8Eh]
		mov	dword_7CE76, eax
		mov	al, [si+5Ch]
		mov	ah, 0
		add	ax, 0FFFBh
		mov	[bp+var_20], ax
		movsx	eax, [bp+var_20]
		shl	eax, 8
		mov	[bp+var_1E], eax
		mov	eax, [bp+var_16]
		cmp	eax, [bp+var_1E]
		jle	short loc_4B639
		mov	ax, 1
		jmp	short loc_4B63B

loc_4B639:
		xor	ax, ax

loc_4B63B:
		or	al, al
		jz	short loc_4B677
		mov	eax, [bp+var_16]
		sub	eax, [bp+var_1E]
		mov	[bp+var_24], eax
		mov	[bp+var_28], eax
		add	eax, 100h
		mov	[bp+var_2C], eax
		mov	[bp+var_30], eax
		mov	eax, dword_7CE76
		mov	edx, eax
		mov	ecx, [bp+var_30]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	dword_7CE76, eax

loc_4B677:
		mov	ax, [si+92h]
		shr	ax, 7
		and	ax, 3
		cmp	al, 2
		jnz	short loc_4B6A1
		mov	[bp+var_34], 99h
		mov	eax, dword_7CE76
		mov	edx, [bp+var_34]
		imul	edx
		shrd	eax, edx, 8
		mov	dword_7CE76, eax

loc_4B6A1:
		mov	eax, [si+6Ah]
		cmp	eax, [bp+var_4]
		jle	short loc_4B6DB
		mov	eax, dword_7CE76
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	dword_7CE76, eax
		add	si, 6Ah
		mov	eax, dword_7CE76
		mov	edx, eax
		mov	ecx, [si]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	dword_7CE76, eax

loc_4B6DB:
		mov	ax, 6746h
		pop	di
		pop	si
		leave
		retf
Aero_MaxRollRate_4B590		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4B6E2		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	ax, dx
		pop	bp
		retf
sub_4B6E2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4B6EC		proc far
		push	bp
		mov	bp, sp
		pop	bp
sub_4B6EC		endp
seg114		ends

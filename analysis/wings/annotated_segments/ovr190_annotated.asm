ovr190		segment	para public 'OVERLAY' use16
		assume cs:ovr190
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à AudioQueue_Helper_C0EA5 (sub_C0EA5 de PACIFIC.EXE).
; Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à AudioQueue_Helper_AB82E (sub_AB82E de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, aucun appel externe visible
; (33 lignes).
; ==============================================================================================
AudioQueue_Helper_6CC20		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte_5B760, 1
		mov	word ptr [si+4], 0
		xor	dx, dx
		jmp	short loc_6CC40

loc_6CC35:
		mov	bx, dx
		imul	bx, bx, 11h
		mov	byte ptr [bx+si+104h], 19h
		inc	dx

loc_6CC40:
		cmp	dx, 4
		jl	short loc_6CC35
		pop	si
		pop	bp
		retf
AudioQueue_Helper_6CC20		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6CC48		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr AudioQueue_Helper_6CC20
		pop	cx
		mov	ax, [bp+arg_2]
		mov	[si+4], ax
		push	si
		nop
		push	cs
		call	near ptr sub_6CC99
		pop	cx
		xor	di, di
		jmp	short loc_6CC81

loc_6CC67:
		push	word ptr [si+4]
		mov	ax, di
		imul	ax, ax, 11h
		mov	dx, si
		add	dx, ax
		add	dx, 0F6h
		push	dx
		call	sub_1A714
		add	sp, 4
		inc	di

loc_6CC81:
		cmp	di, 4
		jl	short loc_6CC67
		pop	di
		pop	si
		pop	bp
		retf
sub_6CC48		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; ResourceRecord_WriteFieldWrapper_C0C23 (sub_C0C23 de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code
; identique instruction par instruction à ResourceRecord_WriteFieldWrapper_3C848 (sub_3C848 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à
; ResourceRecord_WriteFieldWrapper_64FD8 (sub_64FD8 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, enveloppe appelant sub_6501E.
; Référencée par sub_A8F22.
; ==============================================================================================
ResourceRecord_WriteFieldWrapper_6CC8A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		nop
		push	cs
		call	near ptr SoundFX_StopAllChannels_6CE6B
		pop	cx
		pop	bp
		retf
ResourceRecord_WriteFieldWrapper_6CC8A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6CC99		proc far

var_E4		= word ptr -0E4h
var_E2		= word ptr -0E2h
var_E0		= word ptr -0E0h
var_DE		= word ptr -0DEh
var_DC		= dword ptr -0DCh
var_D8		= byte ptr -0D8h
var_D6		= word ptr -0D6h
var_75		= dword ptr -75h
var_69		= word ptr -69h
var_65		= dword ptr -65h
var_5E		= word ptr -5Eh
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= dword ptr -0Ah
var_6		= word ptr -6
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0E4h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	al, byte_5CF9C
		mov	ah, 0
		cmp	ax, 1
		jz	short loc_6CCB9
		cmp	ax, 3
		jnz	short loc_6CCC8
		push	1A42h
		jmp	short loc_6CCBC

loc_6CCB9:
		push	1A47h

loc_6CCBC:
		lea	ax, [bp+var_6]
		push	ax
		call	CRT_Strcpy
		add	sp, 4

loc_6CCC8:
		push	ss
		lea	ax, [bp+var_6]
		push	ax
		push	ds
		push	offset aSoundfx
		push	ds
		push	offset aSOUND
		lea	ax, [bp+var_5E]
		push	ax
		call	sub_1F0C4
		add	sp, 0Eh
		lea	ax, [bp+var_D6]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_54888
		pop	cx
		push	1
		lea	ax, [bp+var_5E]
		push	ax
		lea	ax, [bp+var_D6]
		push	ax
		mov	bx, [bp+var_D6]
		call	dword ptr [bx+14h]
		add	sp, 6
		mov	[bp+var_E0], 96Dh
		mov	ax, word_5DD68
		mov	[bp+var_DE], ax
		lea	ax, [bp+var_E0]
		mov	word_5DD68, ax
		mov	[bp+var_E0], 975h
		mov	[bp+var_DC], 0
		mov	[bp+var_D8], 0
		mov	[bp+var_E4], 0
		mov	[bp+var_E2], 0FFFFh
		push	word ptr [si+4]
		lea	ax, [bp+var_E4]
		push	ax
		call	sub_1A714
		add	sp, 4
		xor	di, di
		jmp	loc_6CE36

loc_6CD4A:
		push	di
		lea	ax, [bp+var_D6]
		push	ax
		call	IndexedRecordReader_AdvanceIndex_54C22
		add	sp, 4
		mov	ax, [bp+var_69]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_6CD69
		mov	eax, [bp+var_75]
		jmp	short loc_6CD6D

loc_6CD69:
		mov	eax, [bp+var_65]

loc_6CD6D:
		mov	[bp+var_A], eax
		push	1
		push	0
		push	3
		push	eax
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	[bp+var_C], dx
		mov	[bp+var_E], ax
		mov	bx, di
		imul	bx, bx, 0Ah
		mov	ax, [bp+var_C]
		mov	dx, [bp+var_E]
		mov	[bx+si+8], ax
		mov	[bx+si+6], dx
		mov	bx, di
		imul	bx, bx, 0Ah
		mov	byte ptr [bx+si+0Ah], 3
		mov	bx, di
		imul	bx, bx, 0Ah
		mov	byte ptr [bx+si+0Bh], 1
		mov	bx, di
		imul	bx, bx, 0Ah
		mov	dword ptr [bx+si+0Ch], 0
		mov	bx, di
		imul	bx, bx, 0Ah
		mov	eax, [bp+var_A]
		mov	[bx+si+0Ch], eax
		mov	bx, di
		imul	bx, bx, 0Ah
		cmp	byte ptr [bx+si+0Ah], 3
		jnz	short loc_6CDF3
		push	0
		mov	bx, di
		imul	bx, bx, 0Ah
		mov	al, [bx+si+0Ah]
		push	ax
		mov	bx, di
		imul	bx, bx, 0Ah
		push	large [bx+si+6]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_6CDFE

loc_6CDF3:
		mov	bx, di
		imul	bx, bx, 0Ah
		mov	dx, [bx+si+8]
		mov	ax, [bx+si+6]

loc_6CDFE:
		push	dx
		push	ax
		push	di
		lea	ax, [bp+var_D6]
		push	ax
		call	sub_54A85
		add	sp, 8
		push	0
		mov	ax, di
		imul	ax, ax, 0Ah
		mov	dx, si
		add	dx, ax
		add	dx, 6
		push	dx
		lea	ax, [bp+var_E4]
		push	ax
		call	sub_1A769
		add	sp, 6
		lea	ax, [bp+var_E4]
		push	ax
		call	Music_ChannelStopSequence_1A6AA
		pop	cx
		inc	di

loc_6CE36:
		cmp	di, 18h
		jge	short loc_6CE3E
		jmp	loc_6CD4A

loc_6CE3E:
		lea	ax, [bp+var_E4]
		push	ax
		call	Music_ChannelStopSequence_1A6AA
		pop	cx
		push	2
		lea	ax, [bp+var_E0]
		push	ax
		call	sub_19116
		add	sp, 4
		push	2
		lea	ax, [bp+var_D6]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_6CC99		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à SoundFX_StopAllChannels_C0DE7 (sub_C0DE7 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à SoundFX_StopAllChannels_AB770 (sub_AB770 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. —
; Ex-'AudioQueue_AdvanceSlotEntry_AB770'. far. LUE 2026-10-06. Arrete et libere les 5 canaux
; d'effets.
; ==============================================================================================
SoundFX_StopAllChannels_6CE6B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		jmp	short loc_6CE96

loc_6CE77:
		mov	ax, di
		imul	ax, ax, 11h
		mov	dx, si
		add	dx, ax
		add	dx, 0F6h
		push	dx
		call	Music_ChannelStopSequence_1A6AA
		pop	cx
		mov	bx, di
		imul	bx, bx, 11h
		mov	byte ptr [bx+si+104h], 19h
		inc	di

loc_6CE96:
		cmp	di, 4
		jl	short loc_6CE77
		pop	di
		pop	si
		pop	bp
		retf
SoundFX_StopAllChannels_6CE6B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à AudioQueue_AdvanceAndRelease_C0E1B (sub_C0E1B de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 10 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à AudioQueue_AdvanceAndRelease_AB7A4 (sub_AB7A4 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine SoundFX_StopAllChannels_AB770 et Memory_TypedFree_5C7B6.
; ==============================================================================================
AudioQueue_AdvanceAndRelease_6CE9F		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	byte_5B760, 0
		jz	short loc_6CF25
		mov	byte_5B760, 0
		push	si
		push	cs
		call	near ptr SoundFX_StopAllChannels_6CE6B
		pop	cx
		xor	di, di
		jmp	short loc_6CF20

loc_6CEBD:
		mov	bx, di
		imul	bx, bx, 0Ah
		cmp	byte ptr [bx+si+0Bh], 0
		jz	short loc_6CEFA
		mov	bx, di
		imul	bx, bx, 0Ah
		mov	ax, [bx+si+6]
		or	ax, [bx+si+8]
		jz	short loc_6CEFA
		push	0
		mov	bx, di
		imul	bx, bx, 0Ah
		mov	al, [bx+si+0Ah]
		push	ax
		mov	ax, di
		imul	ax, ax, 0Ah
		mov	dx, si
		add	dx, ax
		add	dx, 6
		push	dx
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_6CEFA

loc_6CEFA:
		mov	bx, di
		imul	bx, bx, 0Ah
		mov	word ptr [bx+si+8], 0
		mov	word ptr [bx+si+6], 0
		mov	bx, di
		imul	bx, bx, 0Ah
		mov	byte ptr [bx+si+0Bh], 0
		mov	bx, di
		imul	bx, bx, 0Ah
		mov	dword ptr [bx+si+0Ch], 0
		inc	di

loc_6CF20:
		cmp	di, 18h
		jl	short loc_6CEBD

loc_6CF25:
		pop	di
		pop	si
		pop	bp
		retf
AudioQueue_AdvanceAndRelease_6CE9F		endp
ovr190		ends

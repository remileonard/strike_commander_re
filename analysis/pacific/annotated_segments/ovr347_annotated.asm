ovr347		segment	para public 'OVERLAY' use16
		assume cs:ovr347
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à AudioQueue_InitAndProcess_AB540 (sub_AB540 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine AudioQueue_Helper_AB82E, AudioQueue_LoadAndPlayEntry_AB592, Music_ChannelInit_59F87
; (seg123).
; ==============================================================================================
AudioQueue_InitAndProcess_C0BE0		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		nop
		push	cs
		call	near ptr AudioQueue_Helper_C0EA5
		pop	cx
		mov	ax, [bp+arg_2]
		mov	[si+4], ax
		push	si
		nop
		push	cs
		call	near ptr sub_C0C32
		pop	cx
		xor	di, di
		jmp	short loc_C0C1A

loc_C0C00:
		push	word ptr [si+4]
		mov	ax, di
		imul	ax, ax, 11h
		mov	dx, si
		add	dx, ax
		add	dx, 114h
		push	dx
		call	sub_5C97F
		add	sp, 4
		inc	di

loc_C0C1A:
		cmp	di, 1
		jl	short loc_C0C00
		pop	di
		pop	si
		pop	bp
		retf
AudioQueue_InitAndProcess_C0BE0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; ResourceRecord_WriteFieldWrapper_3C848 (sub_3C848 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à ResourceRecord_WriteFieldWrapper_64FD8 (sub_64FD8 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; enveloppe appelant sub_6501E. Référencée par sub_A8F22.
; ==============================================================================================
ResourceRecord_WriteFieldWrapper_C0C23		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		nop
		push	cs
		call	near ptr SoundFX_StopAllChannels_C0DE7
		pop	cx
		pop	bp
		retf
ResourceRecord_WriteFieldWrapper_C0C23		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C0C32		proc far

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
		mov	al, byte_79E66
		mov	ah, 0
		cmp	ax, 1
		jnz	short loc_C0C4D
		push	3670h
		jmp	short loc_C0C50

loc_C0C4D:
		push	3675h

loc_C0C50:
		lea	ax, [bp+var_6]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		push	ss
		lea	ax, [bp+var_6]
		push	ax
		push	ds
		push	offset aSoundfx
		push	ds
		push	offset aSOUND
		lea	ax, [bp+var_5E]
		push	ax
		call	sub_29540
		add	sp, 0Eh
		lea	ax, [bp+var_D6]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_7407
		pop	cx
		push	1
		lea	ax, [bp+var_5E]
		push	ax
		lea	ax, [bp+var_D6]
		push	ax
		mov	bx, [bp+var_D6]
		call	dword ptr [bx+14h]
		add	sp, 6
		mov	[bp+var_E0], 0D7Ch
		mov	ax, word_7AFA2
		mov	[bp+var_DE], ax
		lea	ax, [bp+var_E0]
		mov	word_7AFA2, ax
		mov	[bp+var_E0], 0D84h
		mov	[bp+var_DC], 0
		mov	[bp+var_D8], 0
		mov	[bp+var_E4], 0
		mov	[bp+var_E2], 0FFFFh
		push	word ptr [si+4]
		lea	ax, [bp+var_E4]
		push	ax
		call	sub_5C97F
		add	sp, 4
		xor	di, di
		jmp	loc_C0DB2

loc_C0CDE:
		push	di
		lea	ax, [bp+var_D6]
		push	ax
		call	sub_7844
		add	sp, 4
		mov	ax, [bp+var_69]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_C0CFD
		mov	eax, [bp+var_75]
		jmp	short loc_C0D01

loc_C0CFD:
		mov	eax, [bp+var_65]

loc_C0D01:
		mov	[bp+var_A], eax
		push	1
		push	0
		push	3
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
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
		push	0
		mov	bx, di
		imul	bx, bx, 0Ah
		mov	al, [bx+si+0Ah]
		push	ax
		mov	bx, di
		imul	bx, bx, 0Ah
		push	large [bx+si+6]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		lea	ax, [bp+var_D6]
		push	ax
		call	sub_75C8
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
		call	sub_5C9C1
		add	sp, 6
		lea	ax, [bp+var_E4]
		push	ax
		call	Music_ChannelStopSequence_5C915
		pop	cx
		inc	di

loc_C0DB2:
		cmp	di, 1Bh
		jge	short loc_C0DBA
		jmp	loc_C0CDE

loc_C0DBA:
		lea	ax, [bp+var_E4]
		push	ax
		call	Music_ChannelStopSequence_5C915
		pop	cx
		push	2
		lea	ax, [bp+var_E0]
		push	ax
		call	sub_1CD03
		add	sp, 4
		push	2
		lea	ax, [bp+var_D6]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_C0C32		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à SoundFX_StopAllChannels_AB770 (sub_AB770 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. —
; Ex-'AudioQueue_AdvanceSlotEntry_AB770'. far. LUE 2026-10-06. Arrete et libere les 5 canaux
; d'effets.
; ==============================================================================================
SoundFX_StopAllChannels_C0DE7		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		jmp	short loc_C0E12

loc_C0DF3:
		mov	ax, di
		imul	ax, ax, 11h
		mov	dx, si
		add	dx, ax
		add	dx, 114h
		push	dx
		call	Music_ChannelStopSequence_5C915
		pop	cx
		mov	bx, di
		imul	bx, bx, 11h
		mov	byte ptr [bx+si+122h], 1Ch
		inc	di

loc_C0E12:
		cmp	di, 1
		jl	short loc_C0DF3
		pop	di
		pop	si
		pop	bp
		retf
SoundFX_StopAllChannels_C0DE7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 10 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à AudioQueue_AdvanceAndRelease_AB7A4 (sub_AB7A4 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine SoundFX_StopAllChannels_AB770 et Memory_TypedFree_5C7B6.
; ==============================================================================================
AudioQueue_AdvanceAndRelease_C0E1B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	byte_79D9E, 0
		jz	short loc_C0EA1
		mov	byte_79D9E, 0
		push	si
		push	cs
		call	near ptr SoundFX_StopAllChannels_C0DE7
		pop	cx
		xor	di, di
		jmp	short loc_C0E9C

loc_C0E39:
		mov	bx, di
		imul	bx, bx, 0Ah
		cmp	byte ptr [bx+si+0Bh], 0
		jz	short loc_C0E76
		mov	bx, di
		imul	bx, bx, 0Ah
		mov	ax, [bx+si+6]
		or	ax, [bx+si+8]
		jz	short loc_C0E76
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
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_C0E76

loc_C0E76:
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

loc_C0E9C:
		cmp	di, 1Bh
		jl	short loc_C0E39

loc_C0EA1:
		pop	di
		pop	si
		pop	bp
		retf
AudioQueue_AdvanceAndRelease_C0E1B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à AudioQueue_Helper_AB82E (sub_AB82E de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, aucun appel
; externe visible (33 lignes).
; ==============================================================================================
AudioQueue_Helper_C0EA5		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte_79D9E, 1
		mov	word ptr [si+4], 0
		xor	dx, dx
		jmp	short loc_C0EC5

loc_C0EBA:
		mov	bx, dx
		imul	bx, bx, 11h
		mov	byte ptr [bx+si+122h], 1Ch
		inc	dx

loc_C0EC5:
		cmp	dx, 1
		jl	short loc_C0EBA
		pop	si
		pop	bp
		retf
AudioQueue_Helper_C0EA5		endp
ovr347		ends

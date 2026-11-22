seg150		segment	byte public 'CODE' use16
		assume cs:seg150
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à IndexedRecordReader_Destruct_659D0 (sub_659D0 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; destructeur (tag 402Ah) : ferme le flux (StreamReader_CloseHook_63D6E), libère un champ
; (+0x75) et le flux lui-même (StreamReader_Close_63BD5), libère l'objet si demandé.
; Référencée par sub_33485 et sub_3350E (proches du cœur IA).
; ==============================================================================================
IndexedRecordReader_Destruct_3D240	proc far		; CODE XREF: sub_449C+268P
					; sub_449C+31AP ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si

loc_3D24D:				; DATA XREF: seg170:0586o
		jz	short loc_3D286
		mov	word ptr [si], 49B0h
		push	si
		call	StreamReader_ValidateState_3B625
		pop	cx
		or	al, al
		jz	short loc_3D265
		push	si
		call	StreamReader_CloseHook_3B5DE
		pop	cx

loc_3D265:				; CODE XREF: IndexedRecordReader_Destruct_3D240+1Cj
		push	word ptr [si+75h]
		call	sub_308
		pop	cx
		push	0
		push	si
		call	StreamReader_Close_3B445
		add	sp, 4
		test	di, 1
		jz	short loc_3D286
		push	si
		call	sub_308
		pop	cx

loc_3D286:				; CODE XREF: IndexedRecordReader_Destruct_3D240:loc_3D24Dj
					; IndexedRecordReader_Destruct_3D240+3Dj
		pop	di
		pop	si
		pop	bp
		retf
IndexedRecordReader_Destruct_3D240	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à IndexedRecordReader_ConstructVariantA_65A1A (sub_65A1A
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; alloue (sub_658), construit un StreamReader (StreamReader_ConstructVariantA_63A39, seg190)
; et initialise les champs d'index (sub_65B03).
; ==============================================================================================
IndexedRecordReader_ConstructVariantA_3D28A	proc far		; CODE XREF: sub_702F+11P seg011:091BP ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_3D2A3
		push	77h ; 'w'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_3D2B5

loc_3D2A3:				; CODE XREF: IndexedRecordReader_ConstructVariantA_3D28A+9j
		push	si
		call	StreamReader_ConstructVariantA_3B2A9
		pop	cx
		mov	word ptr [si], 49B0h
		push	si
		nop
		push	cs
		call	near ptr IndexedRecordReader_InitFields_3D373
		pop	cx

loc_3D2B5:				; CODE XREF: IndexedRecordReader_ConstructVariantA_3D28A+17j
		mov	ax, si
		pop	si
		pop	bp
		retf
IndexedRecordReader_ConstructVariantA_3D28A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à IndexedRecordReader_ConstructVariantB_65A4A (sub_65A4A
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; même motif que ConstructVariantA avec dispatch vtable [bx+0x14] additionnel.
; ==============================================================================================
IndexedRecordReader_ConstructVariantB_3D2BA	proc far		; CODE XREF: sub_449C+137P
					; sub_5803+63P	...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_3D2D3
		push	77h ; 'w'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_3D2F5

loc_3D2D3:				; CODE XREF: IndexedRecordReader_ConstructVariantB_3D2BA+9j
		push	si
		call	StreamReader_ConstructVariantA_3B2A9
		pop	cx
		mov	word ptr [si], 49B0h
		push	si
		nop
		push	cs
		call	near ptr IndexedRecordReader_InitFields_3D373
		pop	cx
		mov	al, [bp+arg_4]
		push	ax
		push	[bp+arg_2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+14h]
		add	sp, 6

loc_3D2F5:				; CODE XREF: IndexedRecordReader_ConstructVariantB_3D2BA+17j
		mov	ax, si
		pop	si
		pop	bp
		retf
IndexedRecordReader_ConstructVariantB_3D2BA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à IndexedRecordReader_ConstructVariantC_65A8A (sub_65A8A
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; alloue (sub_658), construit via StreamReader_ConstructAndBind_63B23 (seg190) et initialise
; les champs d'index (sub_65B03), dispatch vtable [bx+0xC].
; ==============================================================================================
IndexedRecordReader_ConstructVariantC_3D2FA	proc far		; CODE XREF: sub_5F6FF+5DP

var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_3D316
		push	77h ; 'w'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_3D36E

loc_3D316:				; CODE XREF: IndexedRecordReader_ConstructVariantC_3D2FA+Cj
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	eax, [bp+arg_4]
		mov	[bp+var_6], eax
		mov	eax, [bp+arg_8]
		mov	[bp+var_A], eax
		mov	word ptr [si], 3B55h
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], seg seg001
		mov	word ptr [si+2], 3Bh ; ';'
		mov	word ptr [si], 4939h
		push	0
		push	eax
		push	large [bp+var_6]
		push	[bp+var_2]
		push	si
		call	StreamReader_ConstructAndBind_3B393
		add	sp, 0Eh
		mov	word ptr [si], 49B0h
		push	si
		nop
		push	cs
		call	near ptr IndexedRecordReader_InitFields_3D373
		pop	cx
		push	si
		mov	bx, [si]
		call	dword ptr [bx+0Ch]
		pop	cx

loc_3D36E:				; CODE XREF: IndexedRecordReader_ConstructVariantC_3D2FA+1Aj
		mov	ax, si
		pop	si
		leave
		retf
IndexedRecordReader_ConstructVariantC_3D2FA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; IndexedRecordReader_InitFields_65B03 (sub_65B03 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, initialise les champs d'index de l'objet
; (+0x5D compteur courant, +0x5F total, +0x61/+0x65 position, +0x75 cache) à zéro. Appelée par
; les trois constructeurs ConstructVariant*.
; ==============================================================================================
IndexedRecordReader_InitFields_3D373	proc far		; CODE XREF: IndexedRecordReader_ConstructVariantA_3D28A+27p
					; IndexedRecordReader_ConstructVariantB_3D2BA+27p ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		xor	ax, ax
		mov	[si+5Dh], ax
		mov	[si+5Fh], ax
		movsx	eax, ax
		mov	[si+65h], eax
		mov	[si+61h], eax
		mov	word ptr [si+75h], 0
		pop	si
		pop	bp
		retf
IndexedRecordReader_InitFields_3D373	endp

; ���������������������������������������������������������������������������

loc_3D396:				; DATA XREF: dseg:49BCo
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+6]
		push	si
		call	StreamReader_PrepareForRead_3B7B6
		pop	cx
		push	large 4
		push	large 4
		push	ss
		lea	ax, [bp-4]
		push	ax
		push	si
		call	StreamReader_ReadTyped_3B811
		add	sp, 0Eh
		mov	eax, [bp-4]
		mov	ebx, 4
		cdq
		idiv	ebx
		dec	ax
		mov	[si+5Dh], ax
		mov	word ptr [si+5Fh], 0
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		xor	eax, eax
		shld	edx, eax, 10h
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à IndexedRecordReader_ReadIndexTable_65B73 (sub_65B73 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 129 lignes, NON DÉTAILLÉE — combine Memory_TypedFreeWrapperC_5C6F3 (×2),
; StreamReader_ReadTyped_63FA1, sub_66068 et Memory_TypedFree_5C7B6 (×2) — probable chargement
; complet de la table d'index en mémoire.
; ==============================================================================================
IndexedRecordReader_ReadIndexTable_3D3E3	proc far		; CODE XREF: IndexedRecordReader_SeekToIndex_3D4DD+88p

var_16		= word ptr -16h
var_14		= dword	ptr -14h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_A		= dword	ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 16h
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_4], 400h
		push	1
		push	0
		push	2
		mov	eax, [bp+var_4]
		add	eax, 0Fh
		push	eax
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		mov	[bp+var_C], 3000h
		push	1
		push	0
		push	2
		mov	eax, [bp+var_C]
		add	eax, 0Fh
		push	eax
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	[bp+var_E], dx
		mov	[bp+var_10], ax
		mov	bx, [si+59h]
		mov	ax, [bx+2]
		mov	word_479F0, ax
		mov	word_47A07, 0
		mov	word_479E8, 0
		mov	eax, [bp+var_8]
		mov	[bp+var_14], eax
		mov	cx, word ptr [bp+var_14+2]
		mov	bx, word ptr [bp+var_14]
		mov	dx, bx
		and	dx, 0Fh
		or	dx, dx
		jz	short loc_3D470
		sub	bx, dx
		inc	cx
		jmp	short $+2

loc_3D470:				; CODE XREF: IndexedRecordReader_ReadIndexTable_3D3E3+86j
		mov	seg_47A01, cx
		mov	word_479FF, bx
		mov	ax, word ptr [bp+var_4]
		mov	word_47A03, ax
		mov	dx, [bp+var_E]
		cmp	[bp+var_10], 0
		jz	short loc_3D488
		inc	dx

loc_3D488:				; CODE XREF: IndexedRecordReader_ReadIndexTable_3D3E3+A2j
		mov	word_479F4, dx
		mov	eax, [bp+arg_A]
		mov	dword ptr word_479FB, eax
		push	large 0FFFFFFFFh
		push	large [bp+var_4]
		push	large [dword ptr word_479FF]
		push	si
		call	StreamReader_ReadTyped_3B811
		add	sp, 0Eh
		call	LZW_Decompress_3D8D8
		mov	[bp+var_16], ax
		push	0
		push	2
		lea	ax, [bp+var_10]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		push	0
		push	2
		lea	ax, [bp+var_8]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		mov	ax, [bp+var_16]
		pop	si
		leave
		retf
IndexedRecordReader_ReadIndexTable_3D3E3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; IndexedRecordReader_SeekToIndex_65C6D (sub_65C6D de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — ⚠️ far, 123 lignes, NON DÉTAILLÉE — combine
; Runtime_FatalErrorHandlerWithTag (sub_5F4A9), IndexedRecordReader_AdvanceIndex_65E2C,
; StreamReader_ReadTyped_63FA1 et IndexedRecordReader_ReadIndexTable_65B73 — positionnement
; sur une entrée d'index donnée.
; ==============================================================================================
IndexedRecordReader_SeekToIndex_3D4DD	proc far		; CODE XREF: sub_449C+251P
					; sub_449C+303P ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	[bp+arg_4], 0
		jnz	short loc_3D4FB
		push	1D01h
		push	si
		call	DisplayContext_CommitFrameWithTag_2FD1E
		add	sp, 4

loc_3D4FB:				; CODE XREF: IndexedRecordReader_SeekToIndex_3D4DD+10j
		cmp	di, 0FFFFh
		jz	short loc_3D50E
		push	di
		push	si
		nop
		push	cs
		call	near ptr IndexedRecordReader_AdvanceIndex_3D69C
		add	sp, 4
		or	al, al
		jz	short loc_3D579

loc_3D50E:				; CODE XREF: IndexedRecordReader_SeekToIndex_3D4DD+21j
		mov	ax, [si+6Dh]
		and	ax, 0C0h
		or	ax, ax
		jz	short loc_3D534
		cmp	ax, 0C0h ; '�'
		jnz	short loc_3D56D
		push	large dword ptr	[si+65h]
		push	large dword ptr	[si+61h]
		push	large [bp+arg_4]
		push	si
		call	StreamReader_ReadTyped_3B811
		add	sp, 0Eh
		jmp	short loc_3D579
; ���������������������������������������������������������������������������

loc_3D534:				; CODE XREF: IndexedRecordReader_SeekToIndex_3D4DD+39j
		mov	ax, [si+6Dh]
		and	ax, 0C0h
		cmp	ax, 0C0h ; '�'
		jnz	short loc_3D545
		mov	eax, [si+61h]
		jmp	short loc_3D549
; ���������������������������������������������������������������������������

loc_3D545:				; CODE XREF: IndexedRecordReader_SeekToIndex_3D4DD+60j
		mov	eax, [si+71h]

loc_3D549:				; CODE XREF: IndexedRecordReader_SeekToIndex_3D4DD+66j
		push	eax
		push	large [bp+arg_4]
		mov	eax, [si+61h]
		add	eax, 0FFFFFFFCh
		push	eax
		mov	eax, [si+65h]
		add	eax, 4
		push	eax
		push	si
		push	cs
		call	near ptr IndexedRecordReader_ReadIndexTable_3D3E3
		add	sp, 12h
		jmp	short loc_3D579
; ���������������������������������������������������������������������������

loc_3D56D:				; CODE XREF: IndexedRecordReader_SeekToIndex_3D4DD+3Ej
		push	1D00h
		push	si
		call	DisplayContext_CommitFrameWithTag_2FD1E
		add	sp, 4

loc_3D579:				; CODE XREF: IndexedRecordReader_SeekToIndex_3D4DD+2Fj
					; IndexedRecordReader_SeekToIndex_3D4DD+55j ...
		pop	di
		pop	si
		pop	bp
		retf
IndexedRecordReader_SeekToIndex_3D4DD	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		inc	word ptr [si+5Fh]
		mov	ax, [si+5Fh]
		cmp	ax, [si+5Dh]
		jnz	short loc_3D59B
		push	1D02h
		push	si
		call	DisplayContext_CommitFrameWithTag_2FD1E
		add	sp, 4

loc_3D59B:				; CODE XREF: seg150:034Dj
		push	word ptr [si+5Fh]
		push	si
		nop
		push	cs
		call	near ptr IndexedRecordReader_AdvanceIndex_3D69C
		add	sp, 4
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	ax, [si+5Fh]
		dec	word ptr [si+5Fh]
		or	ax, ax
		jnz	short loc_3D5C7
		push	1D02h
		push	si
		call	DisplayContext_CommitFrameWithTag_2FD1E
		add	sp, 4

loc_3D5C7:				; CODE XREF: seg150:0379j
		push	word ptr [si+5Fh]
		push	si
		nop
		push	cs
		call	near ptr IndexedRecordReader_AdvanceIndex_3D69C
		add	sp, 4
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		cmp	word ptr [si+5Dh], 0
		jz	short loc_3D616
		mov	ax, [si+5Dh]
		shl	ax, 2
		push	ax
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[si+75h], ax
		cmp	word ptr [si+75h], 0
		jz	short loc_3D616
		push	large 4
		mov	ax, [si+5Dh]
		inc	ax
		shl	ax, 2
		movsx	eax, ax
		push	eax
		push	ds
		push	word ptr [si+75h]
		push	si
		call	StreamReader_ReadTyped_3B811
		add	sp, 0Eh

loc_3D616:				; CODE XREF: seg150:03A1j seg150:03B7j
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; IndexedRecordReader_ReadEntry_65DA9 (sub_65DA9 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, lit une entrée via
; StreamReader_ReadTyped_63FA1, gestion d'erreur (Runtime_FatalErrorHandlerWithTag). Appelée
; deux fois par sub_65E2C.
; ==============================================================================================
IndexedRecordReader_ReadEntry_3D619	proc far		; CODE XREF: IndexedRecordReader_AdvanceIndex_3D69C+11p
					; IndexedRecordReader_AdvanceIndex_3D69C+3Ep

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	[bp+var_4], 0
		cmp	[si+5Dh], dx
		jbe	short loc_3D684
		cmp	word ptr [si+75h], 0
		jz	short loc_3D64C
		mov	ax, dx
		shl	ax, 2
		mov	bx, [si+75h]
		add	bx, ax
		mov	eax, [bx]
		mov	[bp+var_4], eax
		jmp	short loc_3D669
; ���������������������������������������������������������������������������

loc_3D64C:				; CODE XREF: IndexedRecordReader_ReadEntry_3D619+1Ej
		mov	ax, dx
		inc	ax
		shl	ax, 2
		movsx	eax, ax
		push	eax
		push	large 4
		push	ss
		lea	ax, [bp+var_4]
		push	ax
		push	si
		call	StreamReader_ReadTyped_3B811
		add	sp, 0Eh

loc_3D669:				; CODE XREF: IndexedRecordReader_ReadEntry_3D619+31j
		mov	eax, [bp+var_4]
		sar	eax, 18h
		mov	word_496EA, ax
		mov	eax, [bp+var_4]
		and	eax, 0FFFFFFh
		mov	[bp+var_4], eax
		jmp	short loc_3D690
; ���������������������������������������������������������������������������

loc_3D684:				; CODE XREF: IndexedRecordReader_ReadEntry_3D619+18j
		push	1D02h
		push	si
		call	DisplayContext_CommitFrameWithTag_2FD1E
		add	sp, 4

loc_3D690:				; CODE XREF: IndexedRecordReader_ReadEntry_3D619+69j
		mov	eax, [bp+var_4]
		shld	edx, eax, 10h
		pop	si
		leave
		retf
IndexedRecordReader_ReadEntry_3D619	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; IndexedRecordReader_AdvanceIndex_65E2C (sub_65E2C de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far, 115 lignes, NON DÉTAILLÉE —
; combine IndexedRecordReader_ReadEntry_65DA9 (×2), StreamReader_GetCapacity_64062,
; StreamReader_SeekVariant_63DF6, StreamReader_ReadTyped_63FA1 — avance vers l'entrée d'index
; suivante et positionne le flux.
; ==============================================================================================
IndexedRecordReader_AdvanceIndex_3D69C	proc far		; CODE XREF: sub_449C+147P
					; sub_702F+71P	...

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		push	si
		push	cs
		call	near ptr IndexedRecordReader_ReadEntry_3D619
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_4], eax
		mov	ax, word_496EA
		mov	[si+6Dh], ax
		mov	[si+5Fh], di
		inc	di
		cmp	[si+5Dh], di
		jnz	short loc_3D6D7
		push	si
		call	StreamReader_GetCapacity_3B8D2
		push	dx
		push	ax
		pop	eax
		pop	cx
		jmp	short loc_3D6E4
; ���������������������������������������������������������������������������

loc_3D6D7:				; CODE XREF: IndexedRecordReader_AdvanceIndex_3D69C+2Cj
		push	di
		push	si
		push	cs
		call	near ptr IndexedRecordReader_ReadEntry_3D619
		push	dx
		push	ax
		pop	eax
		add	sp, 4

loc_3D6E4:				; CODE XREF: IndexedRecordReader_AdvanceIndex_3D69C+39j
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		sub	eax, [bp+var_4]
		mov	[si+61h], eax
		mov	eax, [bp+var_4]
		mov	[si+65h], eax
		push	eax
		push	si
		call	StreamReader_SeekVariant_3B666
		add	sp, 6
		test	word ptr [si+6Dh], 0C0h
		jnz	short loc_3D727
		push	large dword ptr	[si+65h]
		push	large 4
		push	ds
		mov	ax, si
		add	ax, 71h	; 'q'
		push	ax
		push	si
		call	StreamReader_ReadTyped_3B811
		add	sp, 0Eh
		jmp	short loc_3D72F
; ���������������������������������������������������������������������������

loc_3D727:				; CODE XREF: IndexedRecordReader_AdvanceIndex_3D69C+70j
		mov	eax, [si+61h]
		mov	[si+71h], eax

loc_3D72F:				; CODE XREF: IndexedRecordReader_AdvanceIndex_3D69C+89j
		mov	al, 1
		pop	di
		pop	si
		leave
		retf
IndexedRecordReader_AdvanceIndex_3D69C	endp

; ���������������������������������������������������������������������������

loc_3D735:				; DATA XREF: dseg:49B0o
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+6]
		mov	word ptr [bp-4], 0
		mov	word ptr [bp-2], 0
		push	large dword ptr	[si+69h]
		push	large dword ptr	[si+65h]
		push	large dword ptr	[si+61h]
		push	word ptr [si+5Fh]
		push	word ptr [si+5Dh]
		push	4970h
		lea	ax, [bp-4]
		push	ax
		call	DisplaySurface_ConstructWithMode_2F21E
		add	sp, 14h
		push	word ptr [bp-4]
		mov	ax, si
		add	ax, 6
		push	ax
		call	CachedObject_DestructSubobjects_2F1CF
		add	sp, 4
		push	si
		call	StreamReader_Destruct_3B16F
		pop	cx
		lea	ax, [bp-4]
		push	ax
		call	Member_ClearAndFree_2F278
		pop	cx
		pop	si
		leave
		retf
seg150		ends

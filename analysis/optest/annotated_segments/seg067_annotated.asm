seg067		segment	byte public 'CODE' use16
		assume cs:seg067
		;org 7
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

loc_2B177:				; DATA XREF: dseg:3B29o
		push	bp
		mov	bp, sp
		sub	sp, 4

loc_2B17D:				; DATA XREF: seg170:02E6o
		mov	ax, [bp+6]
		push	0
		push	large dword ptr	[bp+8]
		push	ss
		lea	ax, [bp-4]
		push	ax
		call	Registry_MainOperation_2A359
		add	sp, 0Ah
		mov	eax, [bp-4]
		shld	edx, eax, 10h
		leave
		retf
; ���������������������������������������������������������������������������

loc_2B19E:				; DATA XREF: dseg:3B2Do
		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	ax, [bp+6]
		mov	si, [bp+8]
		cmp	dword ptr [si],	0
		jz	short loc_2B1D8
		mov	eax, [si]
		mov	[bp-4],	eax
		mov	dword ptr [bp-8], 0
		mov	[bp-8],	eax
		push	ss
		lea	ax, [bp-8]
		push	ax
		call	Registry_MainOperationVariant_2A50F
		add	sp, 4
		mov	dword ptr [si],	0

loc_2B1D8:				; CODE XREF: seg067:003Fj
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_2B1DB:				; DATA XREF: dseg:3B35o
		push	bp
		mov	bp, sp
		sub	sp, 8
		mov	ax, [bp+6]
		mov	eax, [bp+8]
		mov	[bp-4],	eax
		mov	dword ptr [bp-8], 0
		mov	[bp-8],	eax
		push	ss
		lea	ax, [bp-8]
		push	ax
		call	PagedMemory_WriteByte_2AE02
		add	sp, 4
		leave
		retf
; ���������������������������������������������������������������������������

loc_2B207:				; DATA XREF: dseg:3B39o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		call	Registry_LookupVariant_2A778
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2B214:				; DATA XREF: dseg:3B3Do
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	ax, 1
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	al, byte_46B44
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2B22A:				; DATA XREF: dseg:3B25o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	byte_46B44, 0
		call	PagedMemory_CheckDriverPresent_2AA32
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 7 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PagedMemory_ReadTextResource_5C14E (sub_5C14E de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 66 lignes, NON DÉTAILLÉE — alloue (sub_658), combine sub_5F4A9 et
; PagedMemory_InitSubsystem_5BB0D. Référencée directement par TextRenderer_Main (sub_27477,
; seg048) — probable point d'entrée « charger une ressource texte depuis la mémoire paginée ».
; ==============================================================================================
PagedMemory_ReadTextResource_2B23C	proc far		; CODE XREF: sub_5D287+300P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_2B255
		push	0Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_2B2B2

loc_2B255:				; CODE XREF: PagedMemory_ReadTextResource_2B23C+9j
		mov	word ptr [si], 13A4h
		mov	ax, word_4703A
		mov	[si+2],	ax
		mov	word_4703A, si
		mov	word ptr [si+4], 3B55h
		mov	word ptr [si+0Ah], 0
		mov	word ptr [si+0Ch], 0
		mov	word ptr [si+8], seg seg001
		mov	word ptr [si+6], 3Bh ; ';'
		mov	word ptr [si], 3B5Dh
		mov	word ptr [si+4], 3B85h
		mov	word ptr [si], 3B25h
		mov	word ptr [si+4], 3B4Dh
		cmp	byte_46B44, 0
		jz	short loc_2B2A8
		push	300h
		mov	ax, si
		add	ax, 4
		push	ax
		call	DisplayContext_CommitFrameWithTag_2FD1E
		add	sp, 4
		jmp	short loc_2B2AD
; ���������������������������������������������������������������������������

loc_2B2A8:				; CODE XREF: PagedMemory_ReadTextResource_2B23C+57j
		call	PagedMemory_InitSubsystem_2ABFB

loc_2B2AD:				; CODE XREF: PagedMemory_ReadTextResource_2B23C+6Aj
		mov	byte_46B44, 1

loc_2B2B2:				; CODE XREF: PagedMemory_ReadTextResource_2B23C+17j
		mov	ax, si
		pop	si
		pop	bp
		retf
PagedMemory_ReadTextResource_2B23C	endp

; ���������������������������������������������������������������������������

loc_2B2B7:				; CODE XREF: seg067:01CBj
					; DATA XREF: dseg:3B49o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_2B2F2
		mov	word ptr [si], 3B25h
		mov	word ptr [si+4], 3B4Dh
		mov	byte_46B44, 0
		call	PagedMemory_CheckDriverPresent_2AA32
		mov	ax, si
		add	ax, 0Ah
		push	ax
		call	Member_ClearAndFree_2F278
		pop	cx
		test	di, 1
		jz	short loc_2B2F2
		push	si
		call	sub_308
		pop	cx

loc_2B2F2:				; CODE XREF: seg067:0154j seg067:0179j
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2B2F6:				; DATA XREF: dseg:3B31o
		push	bp
		mov	bp, sp
		mov	dx, [bp+6]
		push	1514h
		mov	ax, dx
		add	ax, 4
		push	ax
		call	DisplayContext_CommitFrameWithTag_2FD1E
		add	sp, 4
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2B30F:				; DATA XREF: dseg:3B41o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		push	0
		push	0
		push	0
		call	PagedMemory_ReadFormattedString_2AF2E
		add	sp, 6
		mov	ax, 1
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2B328:				; DATA XREF: dseg:3B45o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	al, 3
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2B332:				; DATA XREF: dseg:3B51o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFFCh
		nop
		nop
		jmp	loc_2B2B7
; ���������������������������������������������������������������������������

loc_2B33E:				; DATA XREF: dseg:3B59o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_2B368
		mov	ax, si
		add	ax, 6
		push	ax
		call	Member_ClearAndFree_2F278
		pop	cx
		test	di, 1
		jz	short loc_2B368
		push	si
		call	sub_308
		pop	cx
		jmp	short $+2

loc_2B368:				; CODE XREF: seg067:01DBj seg067:01EDj
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2B36C:				; CODE XREF: seg067:023Aj
					; DATA XREF: dseg:3B81o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_2B39D
		mov	word ptr [si], 3B5Dh
		mov	word ptr [si+4], 3B85h
		mov	ax, si
		add	ax, 0Ah
		push	ax
		call	Member_ClearAndFree_2F278
		pop	cx
		test	di, 1
		jz	short loc_2B39D
		push	si
		call	sub_308
		pop	cx

loc_2B39D:				; CODE XREF: seg067:0209j seg067:0224j
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2B3A1:				; DATA XREF: dseg:3B89o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFFCh
		nop
		nop
		jmp	loc_2B36C
seg067		ends

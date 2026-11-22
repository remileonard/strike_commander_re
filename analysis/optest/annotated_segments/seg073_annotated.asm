seg073		segment	byte public 'CODE' use16
		assume cs:seg073
		;org 9
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

loc_2BDA9:				; DATA XREF: dseg:3DBBo
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		push	word ptr [bp+8]
		call	CRT_Malloc16_Retry
		pop	cx
		mov	dx, ds
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2BDBC:				; DATA XREF: dseg:3DBFo
		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+6]
		mov	si, [bp+8]
		cmp	dword ptr [si],	0
		jz	short loc_2BDDE
		push	large dword ptr	[si]
		call	sub_316
		add	sp, 4
		mov	dword ptr [si],	0

loc_2BDDE:				; CODE XREF: seg073:002Aj
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2BDE1:				; DATA XREF: dseg:3DC3o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		push	word ptr [bp+10h]
		push	word ptr [bp+0Ch]
		push	word ptr [bp+8]
		call	CRT_Memmove
		add	sp, 6
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2BDFA:				; DATA XREF: dseg:3DCBo
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		call	DisplayCache_GetHeadValue_2C557
		movzx	eax, ax
		shld	edx, eax, 10h
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2BE10:				; DATA XREF: dseg:3DD3o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		call	Heap_Validate
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	al, byte_46DAC
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 8 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PagedResourceC_Construct_5CD3A (sub_5CD3A de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; constructeur multi-héritage (Borland) : alloue si besoin (sub_658, 0x0E octets), chaîne
; l'instance dans une liste globale (word_70EA8), pose successivement les tags vtable des
; classes de base héritées (129Eh, 39E3h, 39EBh/3A13h — la classe PagedTextObject de seg128 —,
; puis 3C45h/3C6Dh pour cette classe finale). Lors de la toute première construction
; (byte_70CCA==0), enregistre un gestionnaire global (sub_5F460, tag 3C1Bh). Référencée par
; Memory_AllocatorTableConstructor_5C9D3 (seg131).
; ==============================================================================================
PagedResourceC_Construct_2BE28	proc far		; CODE XREF: Memory_AllocatorTableConstructor_2BAC1+56P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_2BE41
		push	0Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_2BE97

loc_2BE41:				; CODE XREF: PagedResourceC_Construct_2BE28+9j
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
		mov	word ptr [si], 3DB7h
		mov	word ptr [si+4], 3DDFh
		cmp	byte_46DAC, 0
		jz	short loc_2BE92
		push	3D8Dh
		mov	ax, si
		add	ax, 4
		push	ax
		call	DisplayContext_CommitFrame_2FCD5
		add	sp, 4

loc_2BE92:				; CODE XREF: PagedResourceC_Construct_2BE28+57j
		mov	byte_46DAC, 1

loc_2BE97:				; CODE XREF: PagedResourceC_Construct_2BE28+17j
		mov	ax, si
		pop	si
		pop	bp
		retf
PagedResourceC_Construct_2BE28	endp

; ���������������������������������������������������������������������������

loc_2BE9C:				; DATA XREF: dseg:3DC7o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	dx, [bp+0Ah]
		mov	ax, [bp+8]
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2BEAA:				; DATA XREF: dseg:3DCFo
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		xor	ax, ax
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2BEB4:				; DATA XREF: dseg:3DD7o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	al, 1
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2BEBE:				; CODE XREF: seg073:0155j
					; DATA XREF: dseg:3DDBo
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_2BEE8
		mov	ax, si
		add	ax, 0Ah
		push	ax
		call	Member_ClearAndFree_2F278
		pop	cx
		test	di, 1
		jz	short loc_2BEE8
		push	si
		call	sub_308
		pop	cx
		jmp	short $+2

loc_2BEE8:				; CODE XREF: seg073:012Bj seg073:013Dj
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2BEEC:				; DATA XREF: dseg:3DE3o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFFCh
		nop
		nop
		jmp	loc_2BEBE
seg073		ends

seg154		segment	byte public 'CODE' use16
		assume cs:seg154
		;org 0Ch
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ==============================================================================================
; far, point de retour vers lequel le gestionnaire d'exception (loc_5EEDD) reprend l'exécution
; normale via un retf construit manuellement.
; ==============================================================================================
PagedMemory_ExceptionHandler_ReturnPoint_5EEDC:				; DATA XREF: seg154:0035o
		push	bp

; ==============================================================================================
; ⭐ far, 156 lignes, NON DÉTAILLÉE — référencée via vtable (DATA XREF seg216) et par sub_5EFB4
; (installation via int 15h). Gestionnaire d'exception matérielle : vérifie un sélecteur sur
; la pile (0xFFFCh), examine le segment de code fautif (seg339) via byte_70EA6, puis décode
; l'instruction fautive (recherche du préfixe opérande 0x66 et des opcodes 0xF6/0xF7, groupe
; DIV/IDIV/TEST/NOT/NEG) — probable gestionnaire d'exception de division ou d'opcode invalide
; lié à l'accès à la mémoire paginée. Sinon reprend l'exécution via
; PagedMemory_ExceptionHandler_ReturnPoint_5EEDC. Candidat pour session dédiée si le mécanisme
; de mémoire paginée doit être élucidé complètement.
; ==============================================================================================
PagedMemory_ExceptionHandler_5EEDD:				; DATA XREF: seg216:0596o
		mov	bp, sp
		leave
		pop	cx
		push	cx
		call	VROOMM_StubThunk_6B70F
		pop	cx
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 6
		cmp	word ptr [bp+2], 0FFFCh
		jnz	short locret_5EF03
		push	ds
		push	seg seg339
		pop	ds
		cmp	byte_70EA6, 0
		pop	ds
		jnz	short loc_5EF09

locret_5EF03:				; CODE XREF: seg154:0024j
		leave
		push	cs
		push	offset PagedMemory_ExceptionHandler_ReturnPoint_5EEDC
		retf
; ���������������������������������������������������������������������������

loc_5EF09:				; CODE XREF: seg154:0031j
		push	ds
		push	es
		push	eax
		push	ebx
		push	ecx
		push	edx
		push	seg seg339
		pop	ds
		mov	ax, [bp+4]
		mov	dx, [bp+6]
		mov	[bp-2],	dx
		mov	[bp-4],	ax
		mov	al, 0
		mov	[bp-6],	al
		mov	[bp-5],	al
		mov	cl, al

loc_5EF2D:				; CODE XREF: seg154:0088j
		jmp	short loc_5EF5C
; ���������������������������������������������������������������������������

loc_5EF2F:				; CODE XREF: seg154:loc_5EF62j
		les	bx, [bp-4]
		inc	word ptr [bp-4]
		mov	al, es:[bx]

loc_5EF38:
		mov	ah, 0

loc_5EF3A:
		cmp	ax, 66h	; 'f'
		jz	short loc_5EF4B
		cmp	ax, 0F6h ; '�'

loc_5EF42:
		jz	short loc_5EF51
		cmp	ax, 0F7h ; '�'
		jz	short loc_5EF5A
		jmp	short loc_5EF5C
; ���������������������������������������������������������������������������

loc_5EF4B:				; CODE XREF: seg154:006Dj
		mov	byte ptr [bp-5], 1
		jmp	short loc_5EF5C
; ���������������������������������������������������������������������������

loc_5EF51:				; CODE XREF: seg154:loc_5EF42j
		mov	al, 1
		mov	[bp-6],	al
		mov	cl, al
		jmp	short loc_5EF2D
; ���������������������������������������������������������������������������

loc_5EF5A:				; CODE XREF: seg154:0077j
		mov	cl, 1

loc_5EF5C:				; CODE XREF: seg154:loc_5EF2Dj
					; seg154:0079j	...
		mov	al, cl
		mov	ah, 0
		or	ax, ax

loc_5EF62:
		jz	short loc_5EF2F
		les	bx, [bp-4]
		cmp	byte ptr es:[bx], 36h ;	'6'
		jz	short loc_5EF73
		cmp	byte ptr es:[bx], 3Eh ;	'>'
		jnz	short loc_5EF79

loc_5EF73:				; CODE XREF: seg154:009Bj
		add	word ptr [bp-4], 3
		jmp	short loc_5EF7C
; ���������������������������������������������������������������������������

loc_5EF79:				; CODE XREF: seg154:00A1j
		inc	word ptr [bp-4]

loc_5EF7C:				; CODE XREF: seg154:00A7j
		mov	ax, [bp-4]
		mov	[bp+4],	ax
		pop	edx
		pop	ecx
		pop	ebx
		pop	eax
		cmp	byte ptr [bp-6], 0
		jz	short loc_5EF95
		mov	ax, 7Fh	; ''

loc_5EF93:
		jmp	short loc_5EFAB
; ���������������������������������������������������������������������������

loc_5EF95:				; CODE XREF: seg154:00BEj
		cmp	byte ptr [bp-5], 0
		jz	short loc_5EFA6

loc_5EF9B:
		mov	eax, 7FFFFFFFh

loc_5EFA1:
		xor	edx, edx

loc_5EFA4:
		jmp	short loc_5EFAB
; ���������������������������������������������������������������������������

loc_5EFA6:				; CODE XREF: seg154:00C9j
		mov	ax, 7FFFh
		xor	dx, dx

loc_5EFAB:				; CODE XREF: seg154:loc_5EF93j
					; seg154:loc_5EFA4j
		pop	es
		pop	ds
		leave
		add	sp, 2
		iret
; ���������������������������������������������������������������������������
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⭐ far, installe PagedMemory_ExceptionHandler_5EEDD (adresse seg154:0x1Ah) via int 15h
; fonction 1209h avec signature bx=5346h ("SF") — même mécanisme de détection/enregistrement
; que PagedMemory_DetectDriverSignatureA/B (seg127). Référencée par
; PagedMemory_InitSubsystem_5BB0D (seg127) — confirme le lien direct entre ce gestionnaire
; d'exception et le sous-système de mémoire paginée.
; ==============================================================================================
PagedMemory_InstallExceptionHandler_5EFB4	proc far		; CODE XREF: PagedMemory_InitSubsystem_5BB0D+8FP

var_4		= dword	ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	di
		mov	word ptr [bp+var_4+2], seg seg154

loc_5EFC0:
		mov	word ptr [bp+var_4], 1Ah
		les	di, [bp+var_4]
		mov	ax, 1209h
		mov	bx, 5346h
		int	15h

loc_5EFD0:
		pop	di
		leave
		retf
PagedMemory_InstallExceptionHandler_5EFB4	endp

seg154		ends

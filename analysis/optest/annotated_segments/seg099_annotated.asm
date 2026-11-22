seg099		segment	byte public 'CODE' use16
		assume cs:seg099
		;org 1
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

loc_2F751:				; DATA XREF: seg099:002Ao
		push	bp

loc_2F752:				; DATA XREF: seg170:03EEo
		mov	bp, sp
		leave
		pop	cx
		push	cx
		call	sub_30D3
		pop	cx
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 6
		cmp	word ptr [bp+2], 0FFFCh
		jnz	short locret_2F778
		push	ds
		push	seg dseg
		pop	ds
		cmp	byte_47038, 0
		pop	ds
		jnz	short loc_2F77E

locret_2F778:				; CODE XREF: seg099:0019j
		leave
		push	cs
		push	offset loc_2F751
		retf
; ���������������������������������������������������������������������������

loc_2F77E:				; CODE XREF: seg099:0026j
		push	ds
		push	es
		push	eax
		push	ebx
		push	ecx
		push	edx
		push	seg dseg
		pop	ds
		mov	ax, [bp+4]
		mov	dx, [bp+6]
		mov	[bp-2],	dx
		mov	[bp-4],	ax
		mov	al, 0
		mov	[bp-6],	al
		mov	[bp-5],	al
		mov	cl, al

loc_2F7A2:				; CODE XREF: seg099:007Dj
		jmp	short loc_2F7D1
; ���������������������������������������������������������������������������

loc_2F7A4:				; CODE XREF: seg099:0087j
		les	bx, [bp-4]
		inc	word ptr [bp-4]
		mov	al, es:[bx]
		mov	ah, 0
		cmp	ax, 66h	; 'f'
		jz	short loc_2F7C0
		cmp	ax, 0F6h ; '�'
		jz	short loc_2F7C6
		cmp	ax, 0F7h ; '�'
		jz	short loc_2F7CF
		jmp	short loc_2F7D1
; ���������������������������������������������������������������������������

loc_2F7C0:				; CODE XREF: seg099:0062j
		mov	byte ptr [bp-5], 1
		jmp	short loc_2F7D1
; ���������������������������������������������������������������������������

loc_2F7C6:				; CODE XREF: seg099:0067j
		mov	al, 1
		mov	[bp-6],	al
		mov	cl, al
		jmp	short loc_2F7A2
; ���������������������������������������������������������������������������

loc_2F7CF:				; CODE XREF: seg099:006Cj
		mov	cl, 1

loc_2F7D1:				; CODE XREF: seg099:loc_2F7A2j
					; seg099:006Ej	...
		mov	al, cl
		mov	ah, 0
		or	ax, ax
		jz	short loc_2F7A4
		les	bx, [bp-4]
		cmp	byte ptr es:[bx], 36h ;	'6'
		jz	short loc_2F7E8
		cmp	byte ptr es:[bx], 3Eh ;	'>'
		jnz	short loc_2F7EE

loc_2F7E8:				; CODE XREF: seg099:0090j
		add	word ptr [bp-4], 3
		jmp	short loc_2F7F1
; ���������������������������������������������������������������������������

loc_2F7EE:				; CODE XREF: seg099:0096j
		inc	word ptr [bp-4]

loc_2F7F1:				; CODE XREF: seg099:009Cj
		mov	ax, [bp-4]
		mov	[bp+4],	ax
		pop	edx
		pop	ecx
		pop	ebx
		pop	eax
		cmp	byte ptr [bp-6], 0
		jz	short loc_2F80A
		mov	ax, 7Fh	; ''
		jmp	short loc_2F820
; ���������������������������������������������������������������������������

loc_2F80A:				; CODE XREF: seg099:00B3j
		cmp	byte ptr [bp-5], 0
		jz	short loc_2F81B
		mov	eax, 7FFFFFFFh
		xor	edx, edx
		jmp	short loc_2F820
; ���������������������������������������������������������������������������

loc_2F81B:				; CODE XREF: seg099:00BEj
		mov	ax, 7FFFh
		xor	dx, dx

loc_2F820:				; CODE XREF: seg099:00B8j seg099:00C9j
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
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PagedMemory_InstallExceptionHandler_5EFB4 (sub_5EFB4
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⭐
; far, installe PagedMemory_ExceptionHandler_5EEDD (adresse seg154:0x1Ah) via int 15h fonction
; 1209h avec signature bx=5346h ("SF") — même mécanisme de détection/enregistrement que
; PagedMemory_DetectDriverSignatureA/B (seg127). Référencée par
; PagedMemory_InitSubsystem_5BB0D (seg127) — confirme le lien direct entre ce gestionnaire
; d'exception et le sous-système de mémoire paginée.
; ==============================================================================================
PagedMemory_InstallExceptionHandler_2F829	proc far		; CODE XREF: PagedMemory_InitSubsystem_2ABFB+8FP

var_4		= dword	ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	di
		mov	word ptr [bp+var_4+2], seg seg099
		mov	word ptr [bp+var_4], 0Fh
		les	di, [bp+var_4]
		mov	ax, 1209h
		mov	bx, 5346h
		int	15h
		pop	di
		leave
		retf
PagedMemory_InstallExceptionHandler_2F829	endp

seg099		ends

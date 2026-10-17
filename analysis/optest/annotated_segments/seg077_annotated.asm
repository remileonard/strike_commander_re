seg077		segment	byte public 'CODE' use16
		assume cs:seg077
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PagedResourceB_TreeSearchRecursive_5D482 (sub_5D482 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, fonction récursive (s'appelle
; elle-même ×2) avec gestion d'erreur (sub_6B70F). Référencée par
; PagedMemory_InitSubsystem_5BB0D (seg127) — probable recherche/parcours dans une structure
; arborescente de blocs paginés.
; ==============================================================================================
PagedResourceB_TreeSearchRecursive_2C570	proc far		; CODE XREF: PagedMemory_InitSubsystem_2ABFB+87P
					; PagedResourceB_TreeSearchRecursive_2C570+1Bp ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		enter	0, 0
		movzx	eax, [bp+arg_2]
		or	ax, ax
		jge	short loc_2C5A1
		sub	ax, 7FFEh
		push	ax
		push	[bp+arg_0]
		add	[bp+arg_0], ax
		sub	[bp+arg_2], ax
		push	cs
		call	near ptr PagedResourceB_TreeSearchRecursive_2C570
		add	sp, 4
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr PagedResourceB_TreeSearchRecursive_2C570
		add	sp, 4
		jmp	locret_2C641
; ���������������������������������������������������������������������������

loc_2C5A1:				; CODE XREF: PagedResourceB_TreeSearchRecursive_2C570+Bj
		cmp	ax, 1
		ja	short loc_2C5AC
		mov	ax, 1401h
		jmp	short loc_2C5BF
; ���������������������������������������������������������������������������
		align 2

loc_2C5AC:				; CODE XREF: PagedResourceB_TreeSearchRecursive_2C570+34j
		movzx	ebx, [bp+arg_0]
		add	eax, ebx
		test	eax, 0FFFF0000h
		jz	short loc_2C5CA
		mov	ax, 1402h

loc_2C5BF:				; CODE XREF: PagedResourceB_TreeSearchRecursive_2C570+39j
		push	ax
		call	sub_30D3
		add	sp, 2
		jmp	short locret_2C641
; ���������������������������������������������������������������������������

loc_2C5CA:				; CODE XREF: PagedResourceB_TreeSearchRecursive_2C570+4Aj
		mov	ax, [bp+arg_0]
		mov	bx, [bp+arg_2]
		dec	bx
		add	ax, bx
		mov	es, ax
		mov	word ptr es:0, 0FFFFh
		mov	word ptr es:4, 1209h
		mov	ax, [bp+arg_0]
		mov	es, ax
		mov	es:0, bx
		mov	word ptr es:2, 0
		mov	es, ax
		cmp	word_46F0A, 0
		jnz	short loc_2C60A
		mov	word_46F0A, ax
		mov	es:4, ax
		mov	es:6, ax
		jmp	short loc_2C629
; ���������������������������������������������������������������������������

loc_2C60A:				; CODE XREF: PagedResourceB_TreeSearchRecursive_2C570+8Bj
		mov	bx, word_46F0A
		mov	fs, bx
		mov	es:6, bx
		mov	bx, fs:4
		mov	es:4, bx
		mov	gs, bx
		mov	fs:4, ax
		mov	gs:6, ax

loc_2C629:				; CODE XREF: PagedResourceB_TreeSearchRecursive_2C570+98j
		cmp	word_46F3E, 0
		jz	short loc_2C635
		mov	word_46F40, ax
		jmp	short loc_2C638
; ���������������������������������������������������������������������������

loc_2C635:				; CODE XREF: PagedResourceB_TreeSearchRecursive_2C570+BEj
		mov	word_46F3E, ax

loc_2C638:				; CODE XREF: PagedResourceB_TreeSearchRecursive_2C570+C3j
		mov	ax, [bp+arg_0]
		mov	word_46F0A, ax
		mov	ax, 1

locret_2C641:				; CODE XREF: PagedResourceB_TreeSearchRecursive_2C570+2Ej
					; PagedResourceB_TreeSearchRecursive_2C570+58j
		leave
		retf
PagedResourceB_TreeSearchRecursive_2C570	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PagedResourceB_Write_5D555 (sub_5D555 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, implémentation de l'écriture pour la classe
; PagedResourceB (seg129) — gestion d'erreur via sub_6B70F. Référencée par
; PagedResourceB_Method_Write_5C2CF. | 2026-09-26 : c'est l'ALLOCATION du tas de blocs
; (paragraphes, liste libre word_70E28) utilisee par Memory_TypedFreeWrapper_5C6F3 pour
; l'allocateur d'index 2 (PagedResourceB) ; la memoire rendue N'EST PAS mise a zero.
; ==============================================================================================
PagedResourceB_Write_2C643	proc far		; CODE XREF: seg068:002AP
					; PagedResourceB_Read_2C9FC+1Bp

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		enter	0, 0
		push	di
		mov	di, 6
		cmp	[bp+arg_6], 0
		jz	short loc_2C654
		mov	di, 4

loc_2C654:				; CODE XREF: PagedResourceB_Write_2C643+Cj
		mov	eax, [bp+arg_0]
		or	eax, eax
		jz	short loc_2C6D3
		nop
		nop
		add	eax, 13h
		shr	eax, 4
		or	ax, ax
		jle	short loc_2C6DD
		nop
		nop
		mov	bx, word_46F0A
		or	bx, bx
		jz	short loc_2C6D8
		nop
		nop
		mov	dx, bx
		mov	es, bx

loc_2C67B:				; CODE XREF: PagedResourceB_Write_2C643+48j
		mov	bx, es:[di]
		mov	es, bx
		mov	cx, es:0
		sub	cx, ax
		jge	short loc_2C693
		cmp	dx, bx
		jnz	short loc_2C67B
		mov	ax, 1403h
		jmp	short loc_2C6E0
; ���������������������������������������������������������������������������
		db 90h
; ���������������������������������������������������������������������������

loc_2C693:				; CODE XREF: PagedResourceB_Write_2C643+44j
		or	cx, cx
		jnz	short loc_2C6F5
		mov	dx, es:4
		cmp	bx, dx
		jnz	short loc_2C6A8
		mov	word_46F0A, 0
		jmp	short loc_2C6CA
; ���������������������������������������������������������������������������

loc_2C6A8:				; CODE XREF: PagedResourceB_Write_2C643+5Bj
		cmp	bx, word_46F0A
		jnz	short loc_2C6B7
		mov	bx, es:6
		mov	word_46F0A, bx

loc_2C6B7:				; CODE XREF: PagedResourceB_Write_2C643+69j
		mov	fs, dx
		mov	bx, es:6
		mov	fs:6, bx
		mov	fs, bx
		mov	fs:4, dx

loc_2C6CA:				; CODE XREF: PagedResourceB_Write_2C643+63j
		neg	word ptr es:0
		mov	dx, es
		jmp	short loc_2C717
; ���������������������������������������������������������������������������

loc_2C6D3:				; CODE XREF: PagedResourceB_Write_2C643+18j
		mov	ax, 1404h
		jmp	short loc_2C6E0
; ���������������������������������������������������������������������������

loc_2C6D8:				; CODE XREF: PagedResourceB_Write_2C643+30j
		mov	ax, 1406h
		jmp	short loc_2C6E0
; ���������������������������������������������������������������������������

loc_2C6DD:				; CODE XREF: PagedResourceB_Write_2C643+26j
		mov	ax, 1405h

loc_2C6E0:				; CODE XREF: PagedResourceB_Write_2C643+4Dj
					; PagedResourceB_Write_2C643+93j ...
		cmp	[bp+arg_4], 0
		jz	short loc_2C6EF
		push	ax
		call	sub_30D3
		add	sp, 2

loc_2C6EF:				; CODE XREF: PagedResourceB_Write_2C643+A1j
		xor	dx, dx
		xor	ax, ax
		jmp	short loc_2C71A
; ���������������������������������������������������������������������������

loc_2C6F5:				; CODE XREF: PagedResourceB_Write_2C643+52j
		mov	es:0, cx
		add	cx, bx
		mov	es, cx
		mov	es:0, ax
		neg	word ptr es:0
		mov	es:2, bx
		mov	dx, cx
		add	cx, ax
		mov	es, cx
		mov	es:2, dx

loc_2C717:				; CODE XREF: PagedResourceB_Write_2C643+8Ej
		mov	ax, 4

loc_2C71A:				; CODE XREF: PagedResourceB_Write_2C643+B0j
		pop	di
		leave
		retf
PagedResourceB_Write_2C643	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PagedResourceB_Release_5D62F (sub_5D62F de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, appelle sub_5D6B3 — implémentation de la
; libération pour PagedResourceB. Référencée par PagedResourceB_Method_ReleaseIfSet_5C2E6
; (seg129) et Runtime_HeapFreeHook_5D937.
; ==============================================================================================
PagedResourceB_Release_2C71D	proc far		; CODE XREF: seg068:0047P
					; Runtime_HeapFreeHook_2CA25+1Bp

arg_0		= word ptr  6

		enter	0, 0
		push	[bp+arg_0]
		push	cs
		call	near ptr PagedResourceB_ReleaseInternal_2C7A1
		nop
		add	sp, 2
		or	ax, ax
		jz	short locret_2C79F
		mov	ax, [bp+arg_0]
		mov	es, ax
		mov	ax, es:2
		or	ax, ax
		jz	short loc_2C760
		mov	fs, ax
		cmp	word ptr fs:0, 0
		jle	short loc_2C760
		mov	ax, es:0
		sub	fs:0, ax
		mov	ax, fs
		add	ax, fs:0
		mov	es, ax
		mov	word ptr es:2, fs
		jmp	short locret_2C79F
; ���������������������������������������������������������������������������

loc_2C760:				; CODE XREF: PagedResourceB_Release_2C71D+1Ej
					; PagedResourceB_Release_2C71D+28j
		mov	ax, [bp+arg_0]
		mov	es, ax
		neg	word ptr es:0
		mov	es, ax
		cmp	word_46F0A, 0
		jnz	short loc_2C780
		mov	word_46F0A, ax
		mov	es:4, ax
		mov	es:6, ax
		jmp	short locret_2C79F
; ���������������������������������������������������������������������������

loc_2C780:				; CODE XREF: PagedResourceB_Release_2C71D+54j
		mov	bx, word_46F0A
		mov	fs, bx
		mov	es:6, bx
		mov	bx, fs:4
		mov	es:4, bx
		mov	gs, bx
		mov	fs:4, ax
		mov	gs:6, ax

locret_2C79F:				; CODE XREF: PagedResourceB_Release_2C71D+11j
					; PagedResourceB_Release_2C71D+41j ...
		leave
		retf
PagedResourceB_Release_2C71D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PagedResourceB_ReleaseInternal_5D6B3 (sub_5D6B3 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, appelle sub_5D7A7 — sous-routine interne de
; PagedResourceB_Release_5D62F.
; ==============================================================================================
PagedResourceB_ReleaseInternal_2C7A1	proc far		; CODE XREF: PagedResourceB_Release_2C71D+8p

arg_0		= word ptr  6

		enter	0, 0
		mov	ax, [bp+arg_0]
		mov	es, ax
		mov	bx, es:0
		or	bx, bx
		jge	short loc_2C7DE
		neg	bx
		add	bx, ax
		mov	fs, bx
		cmp	fs:2, ax
		jnz	short loc_2C7DE
		mov	bx, es:2
		or	bx, bx
		jz	short loc_2C7E8
		nop
		nop
		mov	fs, bx
		mov	cx, fs:0
		or	cx, cx
		jge	short loc_2C7D8
		neg	cx

loc_2C7D8:				; CODE XREF: PagedResourceB_ReleaseInternal_2C7A1+33j
		add	bx, cx
		cmp	ax, bx
		jz	short loc_2C7E8

loc_2C7DE:				; CODE XREF: PagedResourceB_ReleaseInternal_2C7A1+10j
					; PagedResourceB_ReleaseInternal_2C7A1+1Dj
		push	cs
		call	near ptr PagedResourceB_ReleaseInternalCore_2C895
		nop
		xor	ax, ax
		jmp	short locret_2C857
; ���������������������������������������������������������������������������
		align 2

loc_2C7E8:				; CODE XREF: PagedResourceB_ReleaseInternal_2C7A1+26j
					; PagedResourceB_ReleaseInternal_2C7A1+3Bj
		mov	ax, [bp+arg_0]
		mov	es, ax
		mov	bx, es:0
		neg	bx
		mov	dx, bx
		add	dx, ax
		mov	fs, dx
		mov	cx, fs:0
		or	cx, cx
		jle	short loc_2C854
		add	bx, cx
		mov	es:0, bx
		neg	word ptr es:0
		mov	ax, es
		add	bx, ax
		mov	fs, bx
		mov	word ptr fs:2, es
		mov	ax, dx
		mov	es, ax
		cmp	es:4, ax
		jnz	short loc_2C82D
		mov	word_46F0A, 0
		jmp	short loc_2C854
; ���������������������������������������������������������������������������

loc_2C82D:				; CODE XREF: PagedResourceB_ReleaseInternal_2C7A1+82j
		mov	dx, word_46F0A
		cmp	ax, dx
		jnz	short loc_2C83C
		mov	ax, es:6
		mov	word_46F0A, ax

loc_2C83C:				; CODE XREF: PagedResourceB_ReleaseInternal_2C7A1+92j
		mov	bx, es:4
		mov	cx, es:6
		mov	es, bx
		mov	es:6, cx
		mov	es, cx
		mov	es:4, bx

loc_2C854:				; CODE XREF: PagedResourceB_ReleaseInternal_2C7A1+60j
					; PagedResourceB_ReleaseInternal_2C7A1+8Aj
		mov	ax, 1

locret_2C857:				; CODE XREF: PagedResourceB_ReleaseInternal_2C7A1+44j
		leave
		retf
PagedResourceB_ReleaseInternal_2C7A1	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; DisplayCache_Helper_5D76B (sub_5D76B de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, référencée directement par UIScreen_RenderGraphVGA
; (sub_509EE, seg113) et TextRenderer_ReleaseCachedGlyph (sub_5CA9E, seg132).
; ==============================================================================================
DisplayCache_Helper_2C859	proc far		; CODE XREF: TextRenderer_ReleaseCachedGlyph_2BB8C+4EP
					; sub_C3AD0+52P
		enter	2, 0
		xor	cx, cx
		xor	eax, eax
		mov	bx, word_46F0A
		mov	es, bx
		mov	dx, bx

loc_2C86A:				; CODE XREF: DisplayCache_Helper_2C859+2Bj
		inc	cx
		cmp	cx, 3E8h
		jb	short loc_2C876
		xor	eax, eax
		jmp	short loc_2C88E
; ���������������������������������������������������������������������������

loc_2C876:				; CODE XREF: DisplayCache_Helper_2C859+16j
		mov	bx, es:6
		mov	es, bx
		add	ax, es:0
		cmp	bx, dx
		jnz	short loc_2C86A
		shl	eax, 4
		sub	eax, 4

loc_2C88E:				; CODE XREF: DisplayCache_Helper_2C859+1Bj
		shld	edx, eax, 10h
		leave
		retf
DisplayCache_Helper_2C859	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PagedResourceB_ReleaseInternalCore_5D7A7 (sub_5D7A7 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, cœur de la libération de
; ressource paginée (gestion d'erreur sub_6B70F). Appelée par
; PagedResourceB_ReleaseInternal_5D6B3.
; ==============================================================================================
PagedResourceB_ReleaseInternalCore_2C895	proc far		; CODE XREF: PagedResourceB_ReleaseInternal_2C7A1+3Ep

var_2		= word ptr -2

		enter	2, 0
		mov	[bp+var_2], 0
		mov	bx, word_46F3E
		or	bx, bx
		jz	locret_2C945

loc_2C8A8:				; CODE XREF: PagedResourceB_ReleaseInternalCore_2C895+A1j
		mov	es, bx
		xor	ax, ax
		or	es:2, ax
		jnz	loc_2C939

loc_2C8B5:				; CODE XREF: PagedResourceB_ReleaseInternalCore_2C895+82j
					; PagedResourceB_ReleaseInternalCore_2C895+8Bj
		mov	ax, bx
		mov	cx, es:0
		or	cx, cx
		jge	short loc_2C8C2
		neg	cx

loc_2C8C2:				; CODE XREF: PagedResourceB_ReleaseInternalCore_2C895+29j
		add	ax, cx
		mov	fs, ax
		cmp	word ptr fs:0, 0FFFFh
		jnz	short loc_2C8D7
		cmp	word ptr fs:4, 1209h
		jz	short loc_2C922

loc_2C8D7:				; CODE XREF: PagedResourceB_ReleaseInternalCore_2C895+37j
		cmp	fs:2, bx
		jz	short loc_2C8E0
		jmp	short loc_2C939
; ���������������������������������������������������������������������������

loc_2C8E0:				; CODE XREF: PagedResourceB_ReleaseInternalCore_2C895+47j
		cmp	cx, es:0
		jnz	short loc_2C90D
		mov	gs, es:6
		cmp	bx, gs:4
		jz	short loc_2C901

loc_2C8F3:				; CODE XREF: PagedResourceB_ReleaseInternalCore_2C895+76j
		cmp	word ptr gs:0, 0
		jge	short loc_2C939
		mov	ax, gs
		mov	es, ax
		jmp	short loc_2C939
; ���������������������������������������������������������������������������

loc_2C901:				; CODE XREF: PagedResourceB_ReleaseInternalCore_2C895+5Cj
		mov	gs, es:4
		cmp	bx, gs:6
		jnz	short loc_2C8F3

loc_2C90D:				; CODE XREF: PagedResourceB_ReleaseInternalCore_2C895+50j
		mov	bx, fs
		mov	es, bx
		cmp	word ptr es:0, 0FFFFh
		jnz	short loc_2C8B5
		cmp	word ptr es:4, 1209h
		jnz	short loc_2C8B5

loc_2C922:				; CODE XREF: PagedResourceB_ReleaseInternalCore_2C895+40j
		cmp	word_46F40, 0
		jz	short locret_2C945
		inc	[bp+var_2]
		cmp	[bp+var_2], 1
		ja	short locret_2C945
		mov	bx, word_46F40
		jmp	loc_2C8A8
; ���������������������������������������������������������������������������

loc_2C939:				; CODE XREF: PagedResourceB_ReleaseInternalCore_2C895+1Cj
					; PagedResourceB_ReleaseInternalCore_2C895+49j ...
		mov	ax, 1407h
		push	ax
		call	sub_30D3
		add	sp, 2

locret_2C945:				; CODE XREF: PagedResourceB_ReleaseInternalCore_2C895+Fj
					; PagedResourceB_ReleaseInternalCore_2C895+92j ...
		leave
		retf
PagedResourceB_ReleaseInternalCore_2C895	endp

; ���������������������������������������������������������������������������
		enter	0Ch, 0
		push	di
		mov	al, [bp+6]
		shl	ax, 8
		mov	al, [bp+6]
		push	ax
		shl	eax, 10h
		pop	ax
		mov	bx, word_46F0A
		mov	es, bx

loc_2C961:				; CODE XREF: seg077:046Aj
		mov	bx, es:6
		mov	es, bx
		movzx	ecx, word ptr es:0
		shl	ecx, 4
		mov	[bp-4],	ecx
		mov	edx, es:0
		mov	[bp-8],	edx
		mov	edx, es:4
		mov	[bp-0Ch], edx

loc_2C98B:				; CODE XREF: seg077:044Ej
		mov	ecx, [bp-4]
		test	ecx, 0FFFF0000h
		jnz	short loc_2C9A1
		sub	[bp-4],	ecx
		shr	cx, 2
		jmp	short loc_2C9AC
; ���������������������������������������������������������������������������

loc_2C9A1:				; CODE XREF: seg077:0426j
		sub	dword ptr [bp-4], 10000h
		mov	cx, 4000h

loc_2C9AC:				; CODE XREF: seg077:042Fj
		xor	di, di
		rep stosd
		mov	dx, es
		add	dx, 1000h
		mov	es, dx
		assume es:nothing
		cmp	dword ptr [bp-4], 0
		jnz	short loc_2C98B
		mov	es, bx
		assume es:nothing
		mov	edx, [bp-8]
		mov	es:0, edx
		mov	edx, [bp-0Ch]
		mov	es:4, edx
		cmp	bx, word_46F0A
		jnz	short loc_2C961
		pop	di
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PagedResourceB_ReadHelper_5D8F1 (sub_5D8F1 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — near, appelle
; PagedResourceB_TreeSearchRecursive_5D482 — sous-routine interne de
; PagedResourceB_Read_5D90E.
; ==============================================================================================
PagedResourceB_ReadHelper_2C9DF	proc near		; CODE XREF: PagedResourceB_Read_2C9FC+Bp
		mov	ah, 48h	; 'H'
		mov	bx, 0FFFFh
		int	21h		; DOS -	2+ - ALLOCATE MEMORY
					; BX = number of 16-byte paragraphs desired
		jnb	short loc_2C9EE
		mov	ah, 48h
		int	21h		; DOS -	2+ - ALLOCATE MEMORY
					; BX = number of 16-byte paragraphs desired
		jb	short loc_2C9F9

loc_2C9EE:				; CODE XREF: PagedResourceB_ReadHelper_2C9DF+7j
		push	bx
		push	ax
		push	cs
		call	near ptr PagedResourceB_TreeSearchRecursive_2C570
		add	sp, 4
		jmp	short locret_2C9FB
; ���������������������������������������������������������������������������

loc_2C9F9:				; CODE XREF: PagedResourceB_ReadHelper_2C9DF+Dj
		xor	ax, ax

locret_2C9FB:				; CODE XREF: PagedResourceB_ReadHelper_2C9DF+18j
		retn
PagedResourceB_ReadHelper_2C9DF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PagedResourceB_Read_5D90E (sub_5D90E de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, implémentation de la lecture pour PagedResourceB :
; PagedResourceB_ReadHelper_5D8F1 puis PagedResourceB_Write_5D555. Référencée par sub_694 et
; PagedResourceB_Method_ReadDefault_5C2BF (seg129).
; ==============================================================================================
PagedResourceB_Read_2C9FC	proc far		; CODE XREF: CRT_Malloc32_Retry+2DP PagedResourceB_Method_ReadDefault_2B3AD+6P	...

arg_0		= dword	ptr  6

		enter	0, 0
		cmp	word_46F0A, 0
		jnz	short loc_2CA0E
		call	PagedResourceB_ReadHelper_2C9DF
		or	ax, ax
		jz	short loc_2CA1F

loc_2CA0E:				; CODE XREF: PagedResourceB_Read_2C9FC+9j
		push	0
		push	0
		push	large [bp+arg_0]
		push	cs
		call	near ptr PagedResourceB_Write_2C643
		add	sp, 8
		jmp	short locret_2CA23
; ���������������������������������������������������������������������������

loc_2CA1F:				; CODE XREF: PagedResourceB_Read_2C9FC+10j
		xor	ax, ax
		xor	dx, dx

locret_2CA23:				; CODE XREF: PagedResourceB_Read_2C9FC+21j
		leave
		retf
PagedResourceB_Read_2C9FC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Runtime_HeapFreeHook_5D937 (sub_5D937 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, appelle PagedResourceB_Release_5D62F —
; référencée par sub_346 (fonction de libération omniprésente), probable point d'accroche
; entre le tas générique et la libération de ressources paginées.
; ==============================================================================================
Runtime_HeapFreeHook_2CA25	proc far		; CODE XREF: sub_316+1BP

arg_0		= word ptr  6
arg_2		= word ptr  8

		enter	0, 0
		movzx	edx, [bp+arg_2]
		movzx	eax, [bp+arg_0]
		shl	edx, 4
		add	edx, eax
		shr	edx, 4
		push	dx
		push	cs
		call	near ptr PagedResourceB_Release_2C71D
		add	sp, 2
		leave
		retf
Runtime_HeapFreeHook_2CA25	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PagedResourceB_Init_5D95A (sub_5D95A de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, implémentation de l'initialisation pour PagedResourceB.
; Référencée par PagedResourceB_Method_Init_5C324 (seg129).
; ==============================================================================================
PagedResourceB_Init_2CA48	proc far		; CODE XREF: seg068:0078P
		push	di
		xor	eax, eax
		mov	cx, 3E8h
		mov	bx, word_46F0A
		or	bx, bx
		jz	short loc_2CA81
		mov	di, bx

loc_2CA59:				; CODE XREF: PagedResourceB_Init_2CA48+28j
		mov	es, bx
		mov	dx, es:0
		cmp	dx, ax
		jbe	short loc_2CA66
		mov	ax, dx

loc_2CA66:				; CODE XREF: PagedResourceB_Init_2CA48+1Aj
		mov	bx, es:6
		cmp	di, bx
		jz	short loc_2CA72
		dec	cx
		jnz	short loc_2CA59

loc_2CA72:				; CODE XREF: PagedResourceB_Init_2CA48+25j
		shl	eax, 4
		sub	eax, 4
		shld	edx, eax, 10h
		jmp	short loc_2CA85
; ���������������������������������������������������������������������������

loc_2CA81:				; CODE XREF: PagedResourceB_Init_2CA48+Dj
		xor	ax, ax
		xor	dx, dx

loc_2CA85:				; CODE XREF: PagedResourceB_Init_2CA48+37j
		pop	di
		retf
PagedResourceB_Init_2CA48	endp

seg077		ends

seg138		segment	byte public 'CODE' use16
		assume cs:seg138
		;org 2
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, fonction récursive (s'appelle elle-même ×2) avec gestion d'erreur (sub_6B70F).
; Référencée par PagedMemory_InitSubsystem_5BB0D (seg127) — probable recherche/parcours dans
; une structure arborescente de blocs paginés.
; ==============================================================================================
PagedResourceB_TreeSearchRecursive_5D482	proc far		; CODE XREF: PagedMemory_InitSubsystem_5BB0D+87P
					; PagedResourceB_TreeSearchRecursive_5D482+1Bp ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		enter	0, 0
		movzx	eax, [bp+arg_2]
		or	ax, ax
		jge	short loc_5D4B3
		sub	ax, 7FFEh
		push	ax
		push	[bp+arg_0]
		add	[bp+arg_0], ax
		sub	[bp+arg_2], ax
		push	cs
		call	near ptr PagedResourceB_TreeSearchRecursive_5D482
		add	sp, 4
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr PagedResourceB_TreeSearchRecursive_5D482
		add	sp, 4
		jmp	locret_5D553
; ���������������������������������������������������������������������������

loc_5D4B3:				; CODE XREF: PagedResourceB_TreeSearchRecursive_5D482+Bj
		cmp	ax, 1
		ja	short loc_5D4BE
		mov	ax, 1401h
		jmp	short loc_5D4D1
; ���������������������������������������������������������������������������
		align 2

loc_5D4BE:				; CODE XREF: PagedResourceB_TreeSearchRecursive_5D482+34j
		movzx	ebx, [bp+arg_0]
		add	eax, ebx
		test	eax, 0FFFF0000h
		jz	short loc_5D4DC
		mov	ax, 1402h

loc_5D4D1:				; CODE XREF: PagedResourceB_TreeSearchRecursive_5D482+39j
		push	ax
		call	VROOMM_StubThunk_6B70F
		add	sp, 2
		jmp	short locret_5D553
; ���������������������������������������������������������������������������

loc_5D4DC:				; CODE XREF: PagedResourceB_TreeSearchRecursive_5D482+4Aj
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
		cmp	word_70E28, 0
		jnz	short loc_5D51C

loc_5D50F:
		mov	word_70E28, ax
		mov	es:4, ax

loc_5D516:
		mov	es:6, ax
		jmp	short loc_5D53B
; ���������������������������������������������������������������������������

loc_5D51C:				; CODE XREF: PagedResourceB_TreeSearchRecursive_5D482+8Bj
		mov	bx, word_70E28

loc_5D520:
		mov	fs, bx

loc_5D522:
		mov	es:6, bx
		mov	bx, fs:4
		mov	es:4, bx

loc_5D531:
		mov	gs, bx
		mov	fs:4, ax
		mov	gs:6, ax

loc_5D53B:				; CODE XREF: PagedResourceB_TreeSearchRecursive_5D482+98j
		cmp	word_70E5C, 0
		jz	short loc_5D547
		mov	word_70E5E, ax
		jmp	short loc_5D54A
; ���������������������������������������������������������������������������

loc_5D547:				; CODE XREF: PagedResourceB_TreeSearchRecursive_5D482+BEj
		mov	word_70E5C, ax

loc_5D54A:				; CODE XREF: PagedResourceB_TreeSearchRecursive_5D482+C3j
		mov	ax, [bp+arg_0]
		mov	word_70E28, ax
		mov	ax, 1

locret_5D553:				; CODE XREF: PagedResourceB_TreeSearchRecursive_5D482+2Ej
					; PagedResourceB_TreeSearchRecursive_5D482+58j
		leave

locret_5D554:
		retf
PagedResourceB_TreeSearchRecursive_5D482	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, implémentation de l'écriture pour la classe PagedResourceB (seg129) — gestion d'erreur
; via sub_6B70F. Référencée par PagedResourceB_Method_Write_5C2CF.
; ==============================================================================================
PagedResourceB_Write_5D555	proc far		; CODE XREF: seg129:002CP
					; PagedResourceB_Read_5D90E+1Bp

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		enter	0, 0
		push	di
		mov	di, 6

loc_5D55D:
		cmp	[bp+arg_6], 0
		jz	short loc_5D566

loc_5D563:
		mov	di, 4

loc_5D566:				; CODE XREF: PagedResourceB_Write_5D555+Cj
		mov	eax, [bp+arg_0]
		or	eax, eax
		jz	short loc_5D5E5
		nop
		nop
		add	eax, 13h
		shr	eax, 4
		or	ax, ax
		jle	short loc_5D5EF
		nop
		nop
		mov	bx, word_70E28
		or	bx, bx
		jz	short loc_5D5EA
		nop
		nop
		mov	dx, bx
		mov	es, bx

loc_5D58D:				; CODE XREF: PagedResourceB_Write_5D555+48j
		mov	bx, es:[di]
		mov	es, bx
		mov	cx, es:0
		sub	cx, ax
		jge	short loc_5D5A5
		cmp	dx, bx
		jnz	short loc_5D58D
		mov	ax, 1403h
		jmp	short loc_5D5F2
; ���������������������������������������������������������������������������
		db 90h
; ���������������������������������������������������������������������������

loc_5D5A5:				; CODE XREF: PagedResourceB_Write_5D555+44j
		or	cx, cx
		jnz	short loc_5D607
		mov	dx, es:4
		cmp	bx, dx
		jnz	short loc_5D5BA
		mov	word_70E28, 0
		jmp	short loc_5D5DC
; ���������������������������������������������������������������������������

loc_5D5BA:				; CODE XREF: PagedResourceB_Write_5D555+5Bj
		cmp	bx, word_70E28
		jnz	short loc_5D5C9
		mov	bx, es:6
		mov	word_70E28, bx

loc_5D5C9:				; CODE XREF: PagedResourceB_Write_5D555+69j
		mov	fs, dx
		mov	bx, es:6
		mov	fs:6, bx
		mov	fs, bx
		mov	fs:4, dx

loc_5D5DC:				; CODE XREF: PagedResourceB_Write_5D555+63j
		neg	word ptr es:0
		mov	dx, es
		jmp	short loc_5D629
; ���������������������������������������������������������������������������

loc_5D5E5:				; CODE XREF: PagedResourceB_Write_5D555+18j
		mov	ax, 1404h
		jmp	short loc_5D5F2
; ���������������������������������������������������������������������������

loc_5D5EA:				; CODE XREF: PagedResourceB_Write_5D555+30j
		mov	ax, 1406h
		jmp	short loc_5D5F2
; ���������������������������������������������������������������������������

loc_5D5EF:				; CODE XREF: PagedResourceB_Write_5D555+26j
		mov	ax, 1405h

loc_5D5F2:				; CODE XREF: PagedResourceB_Write_5D555+4Dj
					; PagedResourceB_Write_5D555+93j ...
		cmp	[bp+arg_4], 0

loc_5D5F6:
		jz	short loc_5D601
		push	ax
		call	VROOMM_StubThunk_6B70F
		add	sp, 2

loc_5D601:				; CODE XREF: PagedResourceB_Write_5D555:loc_5D5F6j
		xor	dx, dx
		xor	ax, ax
		jmp	short loc_5D62C
; ���������������������������������������������������������������������������

loc_5D607:				; CODE XREF: PagedResourceB_Write_5D555+52j
		mov	es:0, cx
		add	cx, bx
		mov	es, cx

loc_5D610:
		mov	es:0, ax
		neg	word ptr es:0
		mov	es:2, bx
		mov	dx, cx
		add	cx, ax
		mov	es, cx
		mov	es:2, dx

loc_5D629:				; CODE XREF: PagedResourceB_Write_5D555+8Ej
		mov	ax, 4

loc_5D62C:				; CODE XREF: PagedResourceB_Write_5D555+B0j
		pop	di
		leave
		retf
PagedResourceB_Write_5D555	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle sub_5D6B3 — implémentation de la libération pour PagedResourceB. Référencée par
; PagedResourceB_Method_ReleaseIfSet_5C2E6 (seg129) et Runtime_HeapFreeHook_5D937.
; ==============================================================================================
PagedResourceB_Release_5D62F	proc far		; CODE XREF: seg129:0049P
					; Runtime_HeapFreeHook_5D937:loc_5D952p

arg_0		= word ptr  6

		enter	0, 0

loc_5D633:
		push	[bp+arg_0]
		push	cs

loc_5D637:
		call	near ptr PagedResourceB_ReleaseInternal_5D6B3
		nop
		add	sp, 2
		or	ax, ax
		jz	short locret_5D6B1

loc_5D642:
		mov	ax, [bp+arg_0]
		mov	es, ax
		mov	ax, es:2
		or	ax, ax
		jz	short loc_5D672
		mov	fs, ax
		cmp	word ptr fs:0, 0
		jle	short loc_5D672
		mov	ax, es:0
		sub	fs:0, ax
		mov	ax, fs
		add	ax, fs:0
		mov	es, ax
		mov	word ptr es:2, fs
		jmp	short locret_5D6B1
; ���������������������������������������������������������������������������

loc_5D672:				; CODE XREF: PagedResourceB_Release_5D62F+1Ej
					; PagedResourceB_Release_5D62F+28j
		mov	ax, [bp+arg_0]
		mov	es, ax
		neg	word ptr es:0
		mov	es, ax
		cmp	word_70E28, 0
		jnz	short loc_5D692
		mov	word_70E28, ax
		mov	es:4, ax
		mov	es:6, ax
		jmp	short locret_5D6B1
; ���������������������������������������������������������������������������

loc_5D692:				; CODE XREF: PagedResourceB_Release_5D62F+54j
		mov	bx, word_70E28
		mov	fs, bx
		mov	es:6, bx
		mov	bx, fs:4
		mov	es:4, bx
		mov	gs, bx
		mov	fs:4, ax
		mov	gs:6, ax

locret_5D6B1:				; CODE XREF: PagedResourceB_Release_5D62F+11j
					; PagedResourceB_Release_5D62F+41j ...
		leave
		retf
PagedResourceB_Release_5D62F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle sub_5D7A7 — sous-routine interne de PagedResourceB_Release_5D62F.
; ==============================================================================================
PagedResourceB_ReleaseInternal_5D6B3	proc far		; CODE XREF: PagedResourceB_Release_5D62F:loc_5D637p

arg_0		= word ptr  6

		enter	0, 0
		mov	ax, [bp+arg_0]
		mov	es, ax
		mov	bx, es:0
		or	bx, bx
		jge	short loc_5D6F0
		neg	bx
		add	bx, ax
		mov	fs, bx
		cmp	fs:2, ax
		jnz	short loc_5D6F0
		mov	bx, es:2
		or	bx, bx
		jz	short loc_5D6FA
		nop
		nop
		mov	fs, bx
		mov	cx, fs:0
		or	cx, cx
		jge	short loc_5D6EA
		neg	cx

loc_5D6EA:				; CODE XREF: PagedResourceB_ReleaseInternal_5D6B3+33j
		add	bx, cx
		cmp	ax, bx
		jz	short loc_5D6FA

loc_5D6F0:				; CODE XREF: PagedResourceB_ReleaseInternal_5D6B3+10j
					; PagedResourceB_ReleaseInternal_5D6B3+1Dj
		push	cs
		call	near ptr PagedResourceB_ReleaseInternalCore_5D7A7
		nop
		xor	ax, ax
		jmp	short locret_5D769
; ���������������������������������������������������������������������������
		align 2

loc_5D6FA:				; CODE XREF: PagedResourceB_ReleaseInternal_5D6B3+26j
					; PagedResourceB_ReleaseInternal_5D6B3+3Bj
		mov	ax, [bp+arg_0]
		mov	es, ax

loc_5D6FF:
		mov	bx, es:0
		neg	bx
		mov	dx, bx

loc_5D708:
		add	dx, ax
		mov	fs, dx
		mov	cx, fs:0
		or	cx, cx

loc_5D713:
		jle	short loc_5D766
		add	bx, cx
		mov	es:0, bx
		neg	word ptr es:0
		mov	ax, es

loc_5D723:
		add	bx, ax
		mov	fs, bx

loc_5D727:
		mov	word ptr fs:2, es

loc_5D72C:
		mov	ax, dx
		mov	es, ax

loc_5D730:
		cmp	es:4, ax
		jnz	short loc_5D73F

loc_5D737:
		mov	word_70E28, 0

loc_5D73D:
		jmp	short loc_5D766
; ���������������������������������������������������������������������������

loc_5D73F:				; CODE XREF: PagedResourceB_ReleaseInternal_5D6B3+82j
		mov	dx, word_70E28
		cmp	ax, dx
		jnz	short loc_5D74E
		mov	ax, es:6
		mov	word_70E28, ax

loc_5D74E:				; CODE XREF: PagedResourceB_ReleaseInternal_5D6B3+92j
		mov	bx, es:4
		mov	cx, es:6
		mov	es, bx
		mov	es:6, cx
		mov	es, cx

loc_5D761:
		mov	es:4, bx

loc_5D766:				; CODE XREF: PagedResourceB_ReleaseInternal_5D6B3:loc_5D713j
					; PagedResourceB_ReleaseInternal_5D6B3:loc_5D73Dj
		mov	ax, 1

locret_5D769:				; CODE XREF: PagedResourceB_ReleaseInternal_5D6B3+44j
		leave
		retf
PagedResourceB_ReleaseInternal_5D6B3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, référencée directement par UIScreen_RenderGraphVGA (sub_509EE, seg113) et
; TextRenderer_ReleaseCachedGlyph (sub_5CA9E, seg132).
; ==============================================================================================
DisplayCache_Helper_5D76B	proc far		; CODE XREF: UIScreen_RenderGraphVGA_509EE+52P
					; TextRenderer_ReleaseCachedGlyph_5CA9E+4EP
		enter	2, 0
		xor	cx, cx
		xor	eax, eax
		mov	bx, word_70E28
		mov	es, bx
		mov	dx, bx

loc_5D77C:				; CODE XREF: DisplayCache_Helper_5D76B+2Bj
		inc	cx
		cmp	cx, 3E8h
		jb	short loc_5D788
		xor	eax, eax
		jmp	short loc_5D7A0
; ���������������������������������������������������������������������������

loc_5D788:				; CODE XREF: DisplayCache_Helper_5D76B+16j
		mov	bx, es:6
		mov	es, bx
		add	ax, es:0
		cmp	bx, dx
		jnz	short loc_5D77C
		shl	eax, 4
		sub	eax, 4

loc_5D7A0:				; CODE XREF: DisplayCache_Helper_5D76B+1Bj
		shld	edx, eax, 10h
		leave
		retf
DisplayCache_Helper_5D76B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, cœur de la libération de ressource paginée (gestion d'erreur sub_6B70F). Appelée par
; PagedResourceB_ReleaseInternal_5D6B3.
; ==============================================================================================
PagedResourceB_ReleaseInternalCore_5D7A7	proc far		; CODE XREF: PagedResourceB_ReleaseInternal_5D6B3+3Ep

var_2		= word ptr -2

		enter	2, 0
		mov	[bp+var_2], 0
		mov	bx, word_70E5C
		or	bx, bx
		jz	locret_5D857

loc_5D7BA:				; CODE XREF: PagedResourceB_ReleaseInternalCore_5D7A7+A1j
		mov	es, bx
		xor	ax, ax
		or	es:2, ax
		jnz	loc_5D84B

loc_5D7C7:				; CODE XREF: PagedResourceB_ReleaseInternalCore_5D7A7+82j
					; PagedResourceB_ReleaseInternalCore_5D7A7+8Bj
		mov	ax, bx
		mov	cx, es:0
		or	cx, cx
		jge	short loc_5D7D4
		neg	cx

loc_5D7D4:				; CODE XREF: PagedResourceB_ReleaseInternalCore_5D7A7+29j
		add	ax, cx
		mov	fs, ax
		cmp	word ptr fs:0, 0FFFFh
		jnz	short loc_5D7E9
		cmp	word ptr fs:4, 1209h
		jz	short loc_5D834

loc_5D7E9:				; CODE XREF: PagedResourceB_ReleaseInternalCore_5D7A7+37j
		cmp	fs:2, bx
		jz	short loc_5D7F2
		jmp	short loc_5D84B
; ���������������������������������������������������������������������������

loc_5D7F2:				; CODE XREF: PagedResourceB_ReleaseInternalCore_5D7A7+47j
		cmp	cx, es:0
		jnz	short loc_5D81F

loc_5D7F9:
		mov	gs, es:6

loc_5D7FE:
		cmp	bx, gs:4
		jz	short loc_5D813

loc_5D805:				; CODE XREF: PagedResourceB_ReleaseInternalCore_5D7A7:loc_5D81Dj
		cmp	word ptr gs:0, 0
		jge	short loc_5D84B
		mov	ax, gs
		mov	es, ax
		jmp	short loc_5D84B
; ���������������������������������������������������������������������������

loc_5D813:				; CODE XREF: PagedResourceB_ReleaseInternalCore_5D7A7+5Cj
		mov	gs, es:4

loc_5D818:
		cmp	bx, gs:6

loc_5D81D:
		jnz	short loc_5D805

loc_5D81F:				; CODE XREF: PagedResourceB_ReleaseInternalCore_5D7A7+50j
		mov	bx, fs

loc_5D821:
		mov	es, bx

loc_5D823:
		cmp	word ptr es:0, 0FFFFh
		jnz	short loc_5D7C7

loc_5D82B:
		cmp	word ptr es:4, 1209h
		jnz	short loc_5D7C7

loc_5D834:				; CODE XREF: PagedResourceB_ReleaseInternalCore_5D7A7+40j
		cmp	word_70E5E, 0
		jz	short locret_5D857
		inc	[bp+var_2]
		cmp	[bp+var_2], 1
		ja	short locret_5D857
		mov	bx, word_70E5E
		jmp	loc_5D7BA
; ���������������������������������������������������������������������������

loc_5D84B:				; CODE XREF: PagedResourceB_ReleaseInternalCore_5D7A7+1Cj
					; PagedResourceB_ReleaseInternalCore_5D7A7+49j ...
		mov	ax, 1407h
		push	ax
		call	VROOMM_StubThunk_6B70F

loc_5D854:
		add	sp, 2

locret_5D857:				; CODE XREF: PagedResourceB_ReleaseInternalCore_5D7A7+Fj
					; PagedResourceB_ReleaseInternalCore_5D7A7+92j ...
		leave
		retf
PagedResourceB_ReleaseInternalCore_5D7A7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, référencée par sub_14279 (proche de UIScreen_Construct, seg114).
; ==============================================================================================
PagedResourceB_Helper_5D859	proc far		; CODE XREF: Program_InitVideoFontArgs+A1P
					; MissionScenario_ConstructAndBindUI_A81E0+33P

var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= byte ptr  6

		enter	0Ch, 0
		push	di
		mov	al, [bp+arg_0]
		shl	ax, 8
		mov	al, [bp+arg_0]
		push	ax
		shl	eax, 10h
		pop	ax
		mov	bx, word_70E28
		mov	es, bx

loc_5D873:				; CODE XREF: PagedResourceB_Helper_5D859+93j
		mov	bx, es:6
		mov	es, bx
		movzx	ecx, word ptr es:0
		shl	ecx, 4
		mov	[bp+var_4], ecx
		mov	edx, es:0
		mov	[bp+var_8], edx
		mov	edx, es:4
		mov	[bp+var_C], edx

loc_5D89D:				; CODE XREF: PagedResourceB_Helper_5D859+77j
		mov	ecx, [bp+var_4]
		test	ecx, 0FFFF0000h
		jnz	short loc_5D8B3
		sub	[bp+var_4], ecx
		shr	cx, 2
		jmp	short loc_5D8BE
; ���������������������������������������������������������������������������

loc_5D8B3:				; CODE XREF: PagedResourceB_Helper_5D859+4Fj
		sub	[bp+var_4], 10000h
		mov	cx, 4000h

loc_5D8BE:				; CODE XREF: PagedResourceB_Helper_5D859+58j
		xor	di, di
		rep stosd
		mov	dx, es
		add	dx, 1000h
		mov	es, dx
		assume es:nothing
		cmp	[bp+var_4], 0
		jnz	short loc_5D89D
		mov	es, bx
		assume es:nothing
		mov	edx, [bp+var_8]
		mov	es:0, edx
		mov	edx, [bp+var_C]
		mov	es:4, edx
		cmp	bx, word_70E28
		jnz	short loc_5D873
		pop	di
		leave
		retf
PagedResourceB_Helper_5D859	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; near, appelle PagedResourceB_TreeSearchRecursive_5D482 — sous-routine interne de
; PagedResourceB_Read_5D90E.
; ==============================================================================================
PagedResourceB_ReadHelper_5D8F1	proc near		; CODE XREF: PagedResourceB_Read_5D90E+Bp
		mov	ah, 48h	; 'H'

loc_5D8F3:
		mov	bx, 0FFFFh
		int	21h		; DOS -	2+ - ALLOCATE MEMORY
					; BX = number of 16-byte paragraphs desired
		jnb	short loc_5D900
		mov	ah, 48h

loc_5D8FC:				; DOS -	2+ - ALLOCATE MEMORY
		int	21h		; BX = number of 16-byte paragraphs desired
		jb	short loc_5D90B

loc_5D900:				; CODE XREF: PagedResourceB_ReadHelper_5D8F1+7j
		push	bx
		push	ax
		push	cs

loc_5D903:
		call	near ptr PagedResourceB_TreeSearchRecursive_5D482
		add	sp, 4
		jmp	short locret_5D90D
; ���������������������������������������������������������������������������

loc_5D90B:				; CODE XREF: PagedResourceB_ReadHelper_5D8F1+Dj
		xor	ax, ax

locret_5D90D:				; CODE XREF: PagedResourceB_ReadHelper_5D8F1+18j
		retn
PagedResourceB_ReadHelper_5D8F1	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, implémentation de la lecture pour PagedResourceB : PagedResourceB_ReadHelper_5D8F1 puis
; PagedResourceB_Write_5D555. Référencée par sub_694 et
; PagedResourceB_Method_ReadDefault_5C2BF (seg129).
; ==============================================================================================
PagedResourceB_Read_5D90E	proc far		; CODE XREF: CRT_Malloc32_Retry+2DP PagedResourceB_Method_ReadDefault_5C2BF+6P	...

arg_0		= dword	ptr  6

		enter	0, 0
		cmp	word_70E28, 0
		jnz	short loc_5D920
		call	PagedResourceB_ReadHelper_5D8F1
		or	ax, ax
		jz	short loc_5D931

loc_5D920:				; CODE XREF: PagedResourceB_Read_5D90E+9j
		push	0
		push	0
		push	large [bp+arg_0]
		push	cs
		call	near ptr PagedResourceB_Write_5D555
		add	sp, 8
		jmp	short locret_5D935
; ���������������������������������������������������������������������������

loc_5D931:				; CODE XREF: PagedResourceB_Read_5D90E+10j
		xor	ax, ax

loc_5D933:
		xor	dx, dx

locret_5D935:				; CODE XREF: PagedResourceB_Read_5D90E+21j
		leave
		retf
PagedResourceB_Read_5D90E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle PagedResourceB_Release_5D62F — référencée par sub_346 (fonction de libération
; omniprésente), probable point d'accroche entre le tas générique et la libération de
; ressources paginées.
; ==============================================================================================
Runtime_HeapFreeHook_5D937	proc far		; CODE XREF: CRT_Free_NearOrFar+1BP

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

loc_5D952:
		call	near ptr PagedResourceB_Release_5D62F
		add	sp, 2
		leave
		retf
Runtime_HeapFreeHook_5D937	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; far, implémentation de l'initialisation pour PagedResourceB. Référencée par
; PagedResourceB_Method_Init_5C324 (seg129).
; ==============================================================================================
PagedResourceB_Init_5D95A	proc far		; CODE XREF: seg129:007AP
		push	di
		xor	eax, eax
		mov	cx, 3E8h
		mov	bx, word_70E28
		or	bx, bx
		jz	short loc_5D993
		mov	di, bx

loc_5D96B:				; CODE XREF: PagedResourceB_Init_5D95A+28j
		mov	es, bx
		mov	dx, es:0
		cmp	dx, ax
		jbe	short loc_5D978
		mov	ax, dx

loc_5D978:				; CODE XREF: PagedResourceB_Init_5D95A+1Aj
		mov	bx, es:6
		cmp	di, bx
		jz	short loc_5D984
		dec	cx
		jnz	short loc_5D96B

loc_5D984:				; CODE XREF: PagedResourceB_Init_5D95A+25j
		shl	eax, 4
		sub	eax, 4

loc_5D98C:
		shld	edx, eax, 10h
		jmp	short loc_5D997
; ���������������������������������������������������������������������������

loc_5D993:				; CODE XREF: PagedResourceB_Init_5D95A+Dj
		xor	ax, ax
		xor	dx, dx

loc_5D997:				; CODE XREF: PagedResourceB_Init_5D95A+37j
		pop	di
		retf
PagedResourceB_Init_5D95A	endp

seg138		ends

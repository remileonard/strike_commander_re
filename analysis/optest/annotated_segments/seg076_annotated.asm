seg076		segment	byte public 'CODE' use16
		assume cs:seg076
		;org 2
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Runtime_StackCheckHelperA_5D104 (sub_5D104 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — near, helper interne de
; Runtime_StackOverflowCheck_5D22B (rôle exact non détaillé, code d'exécution unique au
; premier appel).
; ==============================================================================================
Runtime_StackCheckHelperA_2C1F2	proc near		; CODE XREF: Runtime_StackOverflowCheck_2C319+Dp
		mov	bx, word_43148

loc_2C1F6:				; DATA XREF: seg170:032Eo
		add	bx, 4
		and	bx, 0FFFEh
		mov	di, 0FFF6h
		sub	di, word_43156
		and	di, 0FFFEh
		mov	cx, di
		sub	cx, bx
		mov	[bx], cx
		mov	word ptr [bx+2], 0
		mov	word ptr [di], 1
		mov	word ptr [di+4], 1209h
		mov	[di+2],	bx
		mov	word_46F04, bx
		mov	word_46F06, di
		cmp	word_46F02, 0
		jnz	short loc_2C238
		mov	word_46F02, bx
		mov	[bx+4],	bx
		mov	[bx+6],	bx
		jmp	short loc_2C26A
; ���������������������������������������������������������������������������

loc_2C238:				; CODE XREF: Runtime_StackCheckHelperA_2C1F2+38j
		mov	di, word_46F02
		mov	dx, di
		mov	cx, [bx]
		cmp	cx, [di]
		jnb	short loc_2C24A
		mov	word_46F02, bx
		jmp	short loc_2C255
; ���������������������������������������������������������������������������

loc_2C24A:				; CODE XREF: Runtime_StackCheckHelperA_2C1F2+50j
					; Runtime_StackCheckHelperA_2C1F2+61j
		mov	di, [di+6]
		cmp	di, dx
		jz	short loc_2C255
		cmp	cx, [di]
		ja	short loc_2C24A

loc_2C255:				; CODE XREF: Runtime_StackCheckHelperA_2C1F2+56j
					; Runtime_StackCheckHelperA_2C1F2+5Dj
		mov	di, [di+4]
		mov	ax, [di+6]
		mov	[bx+6],	ax
		mov	[bx+4],	di
		mov	[di+6],	bx
		mov	di, [bx+6]
		mov	[di+4],	bx

loc_2C26A:				; CODE XREF: Runtime_StackCheckHelperA_2C1F2+44j
		mov	ax, 1
		mov	byte_46F08, al
		retn
Runtime_StackCheckHelperA_2C1F2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Runtime_StackCheckHelperB_5D183 (sub_5D183 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — near, helper interne appelé par
; Runtime_StackOverflowCheck_5D22B et Heap_FreeAndCoalesce_5D30E.
; ==============================================================================================
Runtime_StackCheckHelperB_2C271	proc near		; CODE XREF: Runtime_StackOverflowCheck_2C319+B6p
					; Heap_FreeAndCoalesce_2C3FC+47p

arg_0		= word ptr  4

		enter	0, 0
		mov	dx, word_46F02
		mov	bx, [bp+arg_0]
		mov	cx, [bx]
		mov	di, [bx+6]
		cmp	di, [bx+4]
		jnz	short loc_2C29C
		cmp	di, bx
		jz	locret_2C317
		mov	word_46F02, bx
		cmp	cx, [di]
		jbe	locret_2C317
		mov	word_46F02, di
		jmp	short locret_2C317
; ���������������������������������������������������������������������������

loc_2C29C:				; CODE XREF: Runtime_StackCheckHelperB_2C271+13j
		cmp	cx, [di]
		jbe	short loc_2C2A4
		cmp	di, dx
		jnz	short loc_2C2AF

loc_2C2A4:				; CODE XREF: Runtime_StackCheckHelperB_2C271+2Dj
		mov	di, [bx+4]
		cmp	cx, [di]
		jnb	short locret_2C317
		cmp	bx, dx
		jz	short locret_2C317

loc_2C2AF:				; CODE XREF: Runtime_StackCheckHelperB_2C271+31j
		push	di
		push	bx
		cmp	[bx+6],	bx
		jnz	short loc_2C2BE
		mov	word_46F02, 0
		jmp	short loc_2C2D8
; ���������������������������������������������������������������������������

loc_2C2BE:				; CODE XREF: Runtime_StackCheckHelperB_2C271+43j
		mov	dx, word_46F02
		cmp	bx, dx
		jnz	short loc_2C2CC
		mov	ax, [bx+6]
		mov	word_46F02, ax

loc_2C2CC:				; CODE XREF: Runtime_StackCheckHelperB_2C271+53j
		mov	di, [bx+6]
		mov	bx, [bx+4]
		mov	[di+4],	bx
		mov	[bx+6],	di

loc_2C2D8:				; CODE XREF: Runtime_StackCheckHelperB_2C271+4Bj
		pop	bx
		pop	di
		mov	dx, word_46F02
		cmp	[bx+4],	di
		jz	short loc_2C2F2

loc_2C2E3:				; CODE XREF: Runtime_StackCheckHelperB_2C271+7Fj
		mov	si, di
		mov	di, [di+6]
		cmp	di, dx
		jz	short loc_2C301
		cmp	[di], cx
		jnb	short loc_2C301
		jmp	short loc_2C2E3
; ���������������������������������������������������������������������������

loc_2C2F2:				; CODE XREF: Runtime_StackCheckHelperB_2C271+70j
					; Runtime_StackCheckHelperB_2C271+8Cj
		mov	si, di
		mov	di, [di+4]
		cmp	si, dx
		jz	short loc_2C2FF
		cmp	[di], cx
		ja	short loc_2C2F2

loc_2C2FF:				; CODE XREF: Runtime_StackCheckHelperB_2C271+88j
		xchg	si, di

loc_2C301:				; CODE XREF: Runtime_StackCheckHelperB_2C271+79j
					; Runtime_StackCheckHelperB_2C271+7Dj
		mov	[bx+4],	si
		mov	[bx+6],	di
		mov	[si+6],	bx
		mov	[di+4],	bx
		mov	di, dx
		cmp	cx, [di]
		jnb	short locret_2C317
		mov	word_46F02, bx

locret_2C317:				; CODE XREF: Runtime_StackCheckHelperB_2C271+17j
					; Runtime_StackCheckHelperB_2C271+21j ...
		leave
		retn
Runtime_StackCheckHelperB_2C271	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Runtime_StackOverflowCheck_5D22B (sub_5D22B de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — ⭐ far, vérification de dépassement de pile du
; runtime Borland : compare SP à une limite (word_70E24) et lève une erreur (code 0x1308 via
; sub_6B70F) si dépassement imminent. Appelée par le cœur de l'allocateur (sub_658) et
; sub_261C, ainsi que dans des dizaines d'autres segments — fait partie du runtime C/C++
; standard, pas du code spécifique au jeu.
; ==============================================================================================
Runtime_StackOverflowCheck_2C319	proc far		; CODE XREF: CRT_Malloc16_Retry+1EP seg000:1C21P	...

var_2		= word ptr -2
arg_0		= word ptr  6

		enter	2, 0
		push	si
		push	di
		cmp	byte_46F08, 0
		jnz	short loc_2C329
		call	Runtime_StackCheckHelperA_2C1F2

loc_2C329:				; CODE XREF: Runtime_StackOverflowCheck_2C319+Bj
		cmp	byte_46F09, 0
		jnz	loc_2C3F2
		cmp	sp, word_46F06
		jnb	short loc_2C34B
		inc	byte_46F09
		mov	ax, 1308h
		push	ax
		call	sub_30D3
		add	sp, 2
		jmp	loc_2C3F2
; ���������������������������������������������������������������������������

loc_2C34B:				; CODE XREF: Runtime_StackOverflowCheck_2C319+1Dj
		mov	ax, [bp+arg_0]
		or	ax, ax
		jz	loc_2C3D8
		add	ax, 5
		and	al, 0FEh
		cmp	ax, 8
		jnb	short loc_2C361
		mov	ax, 8

loc_2C361:				; CODE XREF: Runtime_StackOverflowCheck_2C319+43j
		cmp	ax, [bp+arg_0]
		jb	short loc_2C3E2
		mov	bx, word_46F02
		or	bx, bx
		jz	short loc_2C3DD
		mov	dx, bx

loc_2C370:				; CODE XREF: Runtime_StackOverflowCheck_2C319+62j
		mov	cx, [bx]
		sub	cx, ax
		jnb	short loc_2C382
		mov	bx, [bx+6]
		cmp	dx, bx
		jnz	short loc_2C370
		mov	ax, 1303h
		jmp	short loc_2C3E5
; ���������������������������������������������������������������������������

loc_2C382:				; CODE XREF: Runtime_StackOverflowCheck_2C319+5Bj
		mov	[bp+var_2], bx
		cmp	cx, 0Ah
		jnb	short loc_2C3B9
		or	word ptr [bx], 1
		cmp	[bx+6],	bx
		jnz	short loc_2C39A
		mov	word_46F02, 0
		jmp	short loc_2C3B4
; ���������������������������������������������������������������������������

loc_2C39A:				; CODE XREF: Runtime_StackOverflowCheck_2C319+77j
		mov	dx, word_46F02
		cmp	bx, dx
		jnz	short loc_2C3A8
		mov	ax, [bx+6]
		mov	word_46F02, ax

loc_2C3A8:				; CODE XREF: Runtime_StackOverflowCheck_2C319+87j
		mov	di, [bx+6]
		mov	bx, [bx+4]
		mov	[di+4],	bx
		mov	[bx+6],	di

loc_2C3B4:				; CODE XREF: Runtime_StackOverflowCheck_2C319+7Fj
		mov	ax, [bp+var_2]
		jmp	short loc_2C3F5
; ���������������������������������������������������������������������������

loc_2C3B9:				; CODE XREF: Runtime_StackOverflowCheck_2C319+6Fj
		mov	di, bx
		add	di, [bx]
		add	[di+2],	cx
		mov	[bx], cx
		mov	di, bx
		add	di, cx
		or	al, 1
		mov	[di], ax
		mov	[di+2],	bx
		push	di
		push	bx
		call	Runtime_StackCheckHelperB_2C271
		pop	bx
		pop	di
		mov	ax, di
		jmp	short loc_2C3F5
; ���������������������������������������������������������������������������

loc_2C3D8:				; CODE XREF: Runtime_StackOverflowCheck_2C319+37j
		mov	ax, 1304h
		jmp	short loc_2C3E5
; ���������������������������������������������������������������������������

loc_2C3DD:				; CODE XREF: Runtime_StackOverflowCheck_2C319+53j
		mov	ax, 1306h
		jmp	short loc_2C3E5
; ���������������������������������������������������������������������������

loc_2C3E2:				; CODE XREF: Runtime_StackOverflowCheck_2C319+4Bj
		mov	ax, 1305h

loc_2C3E5:				; CODE XREF: Runtime_StackOverflowCheck_2C319+67j
					; Runtime_StackOverflowCheck_2C319+C2j ...
		inc	byte_46F09
		push	ax
		call	sub_30D3
		add	sp, 2

loc_2C3F2:				; CODE XREF: Runtime_StackOverflowCheck_2C319+15j
					; Runtime_StackOverflowCheck_2C319+2Fj
		mov	ax, 0FFFCh

loc_2C3F5:				; CODE XREF: Runtime_StackOverflowCheck_2C319+9Ej
					; Runtime_StackOverflowCheck_2C319+BDj
		add	ax, 4
		pop	di
		pop	si
		leave
		retf
Runtime_StackOverflowCheck_2C319	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Heap_FreeAndCoalesce_5D30E (sub_5D30E de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — ⭐ far, désallocateur de tas bas niveau (Borland) :
; valide le bloc (Heap_ValidateBlock_5D3AA), fusionne les blocs libres adjacents (test du bit
; « utilisé » dans l'en-tête de bloc). Appelée par sub_338 et sub_346 (les fonctions de
; libération omniprésentes dans toute la base) — implémentation runtime standard, pas
; spécifique au jeu.
; ==============================================================================================
Heap_FreeAndCoalesce_2C3FC	proc far		; CODE XREF: sub_308+6P sub_316+DP ...

arg_0		= word ptr  6

		enter	0, 0
		push	si
		push	di
		cmp	[bp+arg_0], 0
		jz	loc_2C494
		cmp	byte_46F09, 0
		jnz	loc_2C494
		sub	[bp+arg_0], 4
		push	[bp+arg_0]
		call	Heap_ValidateBlock_2C498
		add	sp, 2
		or	ax, ax
		jz	short loc_2C494
		mov	bx, [bp+arg_0]
		mov	di, [bx+2]
		or	di, di
		jz	short loc_2C449
		test	word ptr [di], 1
		jnz	short loc_2C449
		mov	ax, [bx]
		and	ax, 0FFFEh
		add	[di], ax
		mov	bx, di
		add	bx, [di]
		mov	[bx+2],	di
		push	di
		call	Runtime_StackCheckHelperB_2C271
		pop	di
		jmp	short loc_2C494
; ���������������������������������������������������������������������������

loc_2C449:				; CODE XREF: Heap_FreeAndCoalesce_2C3FC+30j
					; Heap_FreeAndCoalesce_2C3FC+36j
		mov	bx, [bp+arg_0]
		and	word ptr [bx], 0FFFEh
		cmp	word_46F02, 0
		jnz	short loc_2C462
		mov	word_46F02, bx
		mov	[bx+4],	bx
		mov	[bx+6],	bx
		jmp	short loc_2C494
; ���������������������������������������������������������������������������

loc_2C462:				; CODE XREF: Heap_FreeAndCoalesce_2C3FC+58j
		mov	di, word_46F02
		mov	dx, di
		mov	cx, [bx]
		cmp	cx, [di]
		jnb	short loc_2C474
		mov	word_46F02, bx
		jmp	short loc_2C47F
; ���������������������������������������������������������������������������

loc_2C474:				; CODE XREF: Heap_FreeAndCoalesce_2C3FC+70j
					; Heap_FreeAndCoalesce_2C3FC+81j
		mov	di, [di+6]
		cmp	di, dx
		jz	short loc_2C47F
		cmp	cx, [di]
		ja	short loc_2C474

loc_2C47F:				; CODE XREF: Heap_FreeAndCoalesce_2C3FC+76j
					; Heap_FreeAndCoalesce_2C3FC+7Dj
		mov	di, [di+4]
		mov	ax, [di+6]
		mov	[bx+6],	ax
		mov	[bx+4],	di
		mov	[di+6],	bx
		mov	di, [bx+6]
		mov	[di+4],	bx

loc_2C494:				; CODE XREF: Heap_FreeAndCoalesce_2C3FC+Aj
					; Heap_FreeAndCoalesce_2C3FC+13j ...
		pop	di
		pop	si
		leave
		retf
Heap_FreeAndCoalesce_2C3FC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Heap_ValidateBlock_5D3AA (sub_5D3AA de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — near, valide l'intégrité d'un bloc de tas avant libération
; (gestion d'erreur sub_6B70F, détails via Heap_ValidateBlockDetailed_5CFF8, seg136). Appelée
; par Heap_FreeAndCoalesce_5D30E.
; ==============================================================================================
Heap_ValidateBlock_2C498	proc near		; CODE XREF: Heap_FreeAndCoalesce_2C3FC+1Ep

arg_0		= word ptr  4

		enter	0, 0
		mov	di, [bp+arg_0]
		mov	bx, [di]
		test	bx, 1
		jz	short loc_2C4D2
		cmp	[bx+di+1], di
		jnz	short loc_2C4D2
		mov	si, [di+2]
		or	si, si
		jz	short loc_2C4BC
		add	si, [si]
		and	si, 0FFFEh
		cmp	si, di
		jnz	short loc_2C4D2

loc_2C4BC:				; CODE XREF: Heap_ValidateBlock_2C498+19j
		cmp	sp, word_46F06
		jnb	short loc_2C4E2
		mov	ax, 1308h
		push	ax
		call	sub_30D3
		add	sp, 2
		xor	ax, ax
		jmp	short locret_2C52B
; ���������������������������������������������������������������������������

loc_2C4D2:				; CODE XREF: Heap_ValidateBlock_2C498+Dj
					; Heap_ValidateBlock_2C498+12j ...
		xor	ax, ax
		push	ax
		push	ax
		call	Heap_ValidateBlockDetailed_2C0E6
		add	sp, 4
		xor	ax, ax
		jmp	short locret_2C52B
; ���������������������������������������������������������������������������

loc_2C4E2:				; CODE XREF: Heap_ValidateBlock_2C498+28j
		and	bx, 0FFFEh
		mov	si, bx
		add	si, di
		mov	cx, [si]
		test	cx, 1
		jnz	short loc_2C528
		add	bx, cx
		mov	[di], bx
		or	word ptr [di], 1
		mov	ax, di
		add	bx, ax
		mov	[bx+2],	di
		mov	bx, si
		cmp	[bx+6],	bx
		jnz	short loc_2C50E
		mov	word_46F02, 0
		jmp	short loc_2C528
; ���������������������������������������������������������������������������

loc_2C50E:				; CODE XREF: Heap_ValidateBlock_2C498+6Cj
		mov	dx, word_46F02
		cmp	bx, dx
		jnz	short loc_2C51C
		mov	ax, [bx+6]
		mov	word_46F02, ax

loc_2C51C:				; CODE XREF: Heap_ValidateBlock_2C498+7Cj
		mov	di, [bx+6]
		mov	bx, [bx+4]
		mov	[di+4],	bx
		mov	[bx+6],	di

loc_2C528:				; CODE XREF: Heap_ValidateBlock_2C498+57j
					; Heap_ValidateBlock_2C498+74j
		mov	ax, 1

locret_2C52B:				; CODE XREF: Heap_ValidateBlock_2C498+38j
					; Heap_ValidateBlock_2C498+48j
		leave
		retn
Heap_ValidateBlock_2C498	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; DisplayCache_ComputeChecksum_5D43F (sub_5D43F de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, parcourt une petite liste chaînée
; (word_70E20, max 4 nœuds) et accumule une somme de contrôle. Référencée par sub_3844F,
; HUD_RenderSymbologyMain (sub_3E744) et UIScreen_RenderGraphVGA (sub_509EE, seg113) —
; probable cache/liste de zones à rafraîchir pour l'affichage.
; ==============================================================================================
DisplayCache_ComputeChecksum_2C52D	proc far		; CODE XREF: sub_C3AD0+4CP
		push	di
		cmp	byte_46F09, 0
		jnz	short loc_2C553
		xor	ax, ax
		mov	di, 3E8h
		mov	cx, 4
		mov	bx, word_46F02
		mov	dx, bx

loc_2C543:				; CODE XREF: DisplayCache_ComputeChecksum_2C52D+22j
		mov	bx, [bx+6]
		add	ax, [bx]
		sub	ax, cx
		dec	di
		jz	short loc_2C553
		cmp	bx, dx
		jnz	short loc_2C543
		jmp	short loc_2C555
; ���������������������������������������������������������������������������

loc_2C553:				; CODE XREF: DisplayCache_ComputeChecksum_2C52D+6j
					; DisplayCache_ComputeChecksum_2C52D+1Ej
		xor	ax, ax

loc_2C555:				; CODE XREF: DisplayCache_ComputeChecksum_2C52D+24j
		pop	di
		retf
DisplayCache_ComputeChecksum_2C52D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; DisplayCache_GetHeadValue_5D469 (sub_5D469 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, lit la valeur en tête de la même liste
; chaînée (word_70E20) que DisplayCache_ComputeChecksum_5D43F. Référencée par
; PagedResourceC_Method_GetValue_5CD0C (seg134) et sub_5E89E.
; ==============================================================================================
DisplayCache_GetHeadValue_2C557	proc far		; CODE XREF: seg073:0060P
					; DisplaySurface_CloneOrResize_2F113+4BP ...
		push	di
		xor	ax, ax
		cmp	byte_46F09, 0
		jnz	short loc_2C56E
		mov	bx, word_46F02
		or	bx, bx
		jz	short loc_2C56E
		mov	bx, [bx+4]
		mov	ax, [bx]

loc_2C56E:				; CODE XREF: DisplayCache_GetHeadValue_2C557+8j
					; DisplayCache_GetHeadValue_2C557+10j
		pop	di
		retf
DisplayCache_GetHeadValue_2C557	endp

seg076		ends

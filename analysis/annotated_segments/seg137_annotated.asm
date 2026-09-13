seg137		segment	byte public 'CODE' use16
		assume cs:seg137
		;org 4
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; near, helper interne de Runtime_StackOverflowCheck_5D22B (rôle exact non détaillé, code
; d'exécution unique au premier appel).
; ==============================================================================================
Runtime_StackCheckHelperA_5D104	proc near		; CODE XREF: Runtime_StackOverflowCheck_5D22B:loc_5D238p
		mov	bx, word_6D14C

loc_5D108:				; DATA XREF: seg216:off_6A2EEo
		add	bx, 4
		and	bx, 0FFFEh
		mov	di, 0FFF6h
		sub	di, word_6D4B4

loc_5D115:
		and	di, 0FFFEh
		mov	cx, di
		sub	cx, bx
		mov	[bx], cx

loc_5D11E:
		mov	word ptr [bx+2], 0

loc_5D123:
		mov	word ptr [di], 1
		mov	word ptr [di+4], 1209h
		mov	[di+2],	bx
		mov	word_70E22, bx

loc_5D133:
		mov	word_70E24, di
		cmp	word_70E20, 0

loc_5D13C:
		jnz	short loc_5D14A
		mov	word_70E20, bx
		mov	[bx+4],	bx
		mov	[bx+6],	bx
		jmp	short loc_5D17C
; ���������������������������������������������������������������������������

loc_5D14A:				; CODE XREF: Runtime_StackCheckHelperA_5D104:loc_5D13Cj
		mov	di, word_70E20
		mov	dx, di
		mov	cx, [bx]
		cmp	cx, [di]
		jnb	short loc_5D15C
		mov	word_70E20, bx
		jmp	short loc_5D167
; ���������������������������������������������������������������������������

loc_5D15C:				; CODE XREF: Runtime_StackCheckHelperA_5D104+50j
					; Runtime_StackCheckHelperA_5D104+61j
		mov	di, [di+6]
		cmp	di, dx
		jz	short loc_5D167
		cmp	cx, [di]
		ja	short loc_5D15C

loc_5D167:				; CODE XREF: Runtime_StackCheckHelperA_5D104+56j
					; Runtime_StackCheckHelperA_5D104+5Dj
		mov	di, [di+4]
		mov	ax, [di+6]
		mov	[bx+6],	ax
		mov	[bx+4],	di
		mov	[di+6],	bx
		mov	di, [bx+6]
		mov	[di+4],	bx

loc_5D17C:				; CODE XREF: Runtime_StackCheckHelperA_5D104+44j
		mov	ax, 1
		mov	byte_70E26, al
		retn
Runtime_StackCheckHelperA_5D104	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; near, helper interne appelé par Runtime_StackOverflowCheck_5D22B et
; Heap_FreeAndCoalesce_5D30E.
; ==============================================================================================
Runtime_StackCheckHelperB_5D183	proc near		; CODE XREF: Runtime_StackOverflowCheck_5D22B+B6p
					; Heap_FreeAndCoalesce_5D30E+47p

arg_0		= word ptr  4

		enter	0, 0
		mov	dx, word_70E20
		mov	bx, [bp+arg_0]
		mov	cx, [bx]
		mov	di, [bx+6]
		cmp	di, [bx+4]
		jnz	short loc_5D1AE
		cmp	di, bx
		jz	locret_5D229
		mov	word_70E20, bx
		cmp	cx, [di]
		jbe	locret_5D229
		mov	word_70E20, di
		jmp	short locret_5D229
; ���������������������������������������������������������������������������

loc_5D1AE:				; CODE XREF: Runtime_StackCheckHelperB_5D183+13j
		cmp	cx, [di]
		jbe	short loc_5D1B6
		cmp	di, dx
		jnz	short loc_5D1C1

loc_5D1B6:				; CODE XREF: Runtime_StackCheckHelperB_5D183+2Dj
		mov	di, [bx+4]
		cmp	cx, [di]
		jnb	short locret_5D229
		cmp	bx, dx
		jz	short locret_5D229

loc_5D1C1:				; CODE XREF: Runtime_StackCheckHelperB_5D183+31j
		push	di
		push	bx
		cmp	[bx+6],	bx
		jnz	short loc_5D1D0
		mov	word_70E20, 0
		jmp	short loc_5D1EA
; ���������������������������������������������������������������������������

loc_5D1D0:				; CODE XREF: Runtime_StackCheckHelperB_5D183+43j
		mov	dx, word_70E20
		cmp	bx, dx
		jnz	short loc_5D1DE
		mov	ax, [bx+6]
		mov	word_70E20, ax

loc_5D1DE:				; CODE XREF: Runtime_StackCheckHelperB_5D183+53j
		mov	di, [bx+6]
		mov	bx, [bx+4]
		mov	[di+4],	bx
		mov	[bx+6],	di

loc_5D1EA:				; CODE XREF: Runtime_StackCheckHelperB_5D183+4Bj
		pop	bx
		pop	di
		mov	dx, word_70E20
		cmp	[bx+4],	di

loc_5D1F3:
		jz	short loc_5D204

loc_5D1F5:				; CODE XREF: Runtime_StackCheckHelperB_5D183+7Fj
		mov	si, di
		mov	di, [di+6]
		cmp	di, dx
		jz	short loc_5D213
		cmp	[di], cx
		jnb	short loc_5D213
		jmp	short loc_5D1F5
; ���������������������������������������������������������������������������

loc_5D204:				; CODE XREF: Runtime_StackCheckHelperB_5D183:loc_5D1F3j
					; Runtime_StackCheckHelperB_5D183+8Cj
		mov	si, di
		mov	di, [di+4]
		cmp	si, dx
		jz	short loc_5D211
		cmp	[di], cx
		ja	short loc_5D204

loc_5D211:				; CODE XREF: Runtime_StackCheckHelperB_5D183+88j
		xchg	si, di

loc_5D213:				; CODE XREF: Runtime_StackCheckHelperB_5D183+79j
					; Runtime_StackCheckHelperB_5D183+7Dj
		mov	[bx+4],	si
		mov	[bx+6],	di
		mov	[si+6],	bx

loc_5D21C:
		mov	[di+4],	bx
		mov	di, dx
		cmp	cx, [di]

loc_5D223:
		jnb	short locret_5D229

loc_5D225:
		mov	word_70E20, bx

locret_5D229:				; CODE XREF: Runtime_StackCheckHelperB_5D183+17j
					; Runtime_StackCheckHelperB_5D183+21j ...
		leave
		retn
Runtime_StackCheckHelperB_5D183	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⭐ far, vérification de dépassement de pile du runtime Borland : compare SP à une limite
; (word_70E24) et lève une erreur (code 0x1308 via sub_6B70F) si dépassement imminent. Appelée
; par le cœur de l'allocateur (sub_658) et sub_261C, ainsi que dans des dizaines d'autres
; segments — fait partie du runtime C/C++ standard, pas du code spécifique au jeu.
; ==============================================================================================
Runtime_StackOverflowCheck_5D22B	proc far		; CODE XREF: CRT_Malloc16_Retry+1EP Stdio_SetupFileStruct+A3P	...

var_2		= word ptr -2
arg_0		= word ptr  6

		enter	2, 0
		push	si
		push	di
		cmp	byte_70E26, 0
		jnz	short loc_5D23B

loc_5D238:
		call	Runtime_StackCheckHelperA_5D104

loc_5D23B:				; CODE XREF: Runtime_StackOverflowCheck_5D22B+Bj
		cmp	byte_70E27, 0
		jnz	loc_5D304
		cmp	sp, word_70E24
		jnb	short loc_5D25D
		inc	byte_70E27
		mov	ax, 1308h

loc_5D251:
		push	ax

loc_5D252:
		call	VROOMM_StubThunk_6B70F

loc_5D257:
		add	sp, 2
		jmp	loc_5D304
; ���������������������������������������������������������������������������

loc_5D25D:				; CODE XREF: Runtime_StackOverflowCheck_5D22B+1Dj
		mov	ax, [bp+arg_0]
		or	ax, ax

loc_5D262:
		jz	loc_5D2EA
		add	ax, 5
		and	al, 0FEh
		cmp	ax, 8
		jnb	short loc_5D273
		mov	ax, 8

loc_5D273:				; CODE XREF: Runtime_StackOverflowCheck_5D22B+43j
		cmp	ax, [bp+arg_0]
		jb	short loc_5D2F4
		mov	bx, word_70E20
		or	bx, bx
		jz	short loc_5D2EF
		mov	dx, bx

loc_5D282:				; CODE XREF: Runtime_StackOverflowCheck_5D22B+62j
		mov	cx, [bx]
		sub	cx, ax
		jnb	short loc_5D294
		mov	bx, [bx+6]
		cmp	dx, bx
		jnz	short loc_5D282
		mov	ax, 1303h
		jmp	short loc_5D2F7
; ���������������������������������������������������������������������������

loc_5D294:				; CODE XREF: Runtime_StackOverflowCheck_5D22B+5Bj
		mov	[bp+var_2], bx
		cmp	cx, 0Ah
		jnb	short loc_5D2CB
		or	word ptr [bx], 1
		cmp	[bx+6],	bx
		jnz	short loc_5D2AC
		mov	word_70E20, 0
		jmp	short loc_5D2C6
; ���������������������������������������������������������������������������

loc_5D2AC:				; CODE XREF: Runtime_StackOverflowCheck_5D22B+77j
		mov	dx, word_70E20
		cmp	bx, dx
		jnz	short loc_5D2BA
		mov	ax, [bx+6]
		mov	word_70E20, ax

loc_5D2BA:				; CODE XREF: Runtime_StackOverflowCheck_5D22B+87j
		mov	di, [bx+6]
		mov	bx, [bx+4]
		mov	[di+4],	bx
		mov	[bx+6],	di

loc_5D2C6:				; CODE XREF: Runtime_StackOverflowCheck_5D22B+7Fj
		mov	ax, [bp+var_2]
		jmp	short loc_5D307
; ���������������������������������������������������������������������������

loc_5D2CB:				; CODE XREF: Runtime_StackOverflowCheck_5D22B+6Fj
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
		call	Runtime_StackCheckHelperB_5D183
		pop	bx
		pop	di
		mov	ax, di
		jmp	short loc_5D307
; ���������������������������������������������������������������������������

loc_5D2EA:				; CODE XREF: Runtime_StackOverflowCheck_5D22B:loc_5D262j
		mov	ax, 1304h
		jmp	short loc_5D2F7
; ���������������������������������������������������������������������������

loc_5D2EF:				; CODE XREF: Runtime_StackOverflowCheck_5D22B+53j
		mov	ax, 1306h

loc_5D2F2:
		jmp	short loc_5D2F7
; ���������������������������������������������������������������������������

loc_5D2F4:				; CODE XREF: Runtime_StackOverflowCheck_5D22B+4Bj
		mov	ax, 1305h

loc_5D2F7:				; CODE XREF: Runtime_StackOverflowCheck_5D22B+67j
					; Runtime_StackOverflowCheck_5D22B+C2j ...
		inc	byte_70E27
		push	ax

loc_5D2FC:
		call	VROOMM_StubThunk_6B70F
		add	sp, 2

loc_5D304:				; CODE XREF: Runtime_StackOverflowCheck_5D22B+15j
					; Runtime_StackOverflowCheck_5D22B+2Fj
		mov	ax, 0FFFCh

loc_5D307:				; CODE XREF: Runtime_StackOverflowCheck_5D22B+9Ej
					; Runtime_StackOverflowCheck_5D22B+BDj
		add	ax, 4
		pop	di
		pop	si
		leave
		retf
Runtime_StackOverflowCheck_5D22B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⭐ far, désallocateur de tas bas niveau (Borland) : valide le bloc
; (Heap_ValidateBlock_5D3AA), fusionne les blocs libres adjacents (test du bit « utilisé »
; dans l'en-tête de bloc). Appelée par sub_338 et sub_346 (les fonctions de libération
; omniprésentes dans toute la base) — implémentation runtime standard, pas spécifique au jeu.
; ==============================================================================================
Heap_FreeAndCoalesce_5D30E	proc far		; CODE XREF: CRT_FreeNear_Wrap+6P CRT_Free_NearOrFar+DP ...

arg_0		= word ptr  6

		enter	0, 0
		push	si
		push	di
		cmp	[bp+arg_0], 0

loc_5D318:
		jz	loc_5D3A6
		cmp	byte_70E27, 0
		jnz	loc_5D3A6
		sub	[bp+arg_0], 4
		push	[bp+arg_0]
		call	Heap_ValidateBlock_5D3AA
		add	sp, 2
		or	ax, ax

loc_5D334:
		jz	short loc_5D3A6

loc_5D336:
		mov	bx, [bp+arg_0]

loc_5D339:
		mov	di, [bx+2]
		or	di, di
		jz	short loc_5D35B

loc_5D340:
		test	word ptr [di], 1
		jnz	short loc_5D35B

loc_5D346:
		mov	ax, [bx]
		and	ax, 0FFFEh
		add	[di], ax
		mov	bx, di
		add	bx, [di]

loc_5D351:
		mov	[bx+2],	di
		push	di
		call	Runtime_StackCheckHelperB_5D183
		pop	di
		jmp	short loc_5D3A6
; ���������������������������������������������������������������������������

loc_5D35B:				; CODE XREF: Heap_FreeAndCoalesce_5D30E+30j
					; Heap_FreeAndCoalesce_5D30E+36j
		mov	bx, [bp+arg_0]
		and	word ptr [bx], 0FFFEh
		cmp	word_70E20, 0
		jnz	short loc_5D374
		mov	word_70E20, bx
		mov	[bx+4],	bx
		mov	[bx+6],	bx
		jmp	short loc_5D3A6
; ���������������������������������������������������������������������������

loc_5D374:				; CODE XREF: Heap_FreeAndCoalesce_5D30E+58j
		mov	di, word_70E20
		mov	dx, di
		mov	cx, [bx]
		cmp	cx, [di]
		jnb	short loc_5D386
		mov	word_70E20, bx
		jmp	short loc_5D391
; ���������������������������������������������������������������������������

loc_5D386:				; CODE XREF: Heap_FreeAndCoalesce_5D30E+70j
					; Heap_FreeAndCoalesce_5D30E+81j
		mov	di, [di+6]
		cmp	di, dx
		jz	short loc_5D391
		cmp	cx, [di]
		ja	short loc_5D386

loc_5D391:				; CODE XREF: Heap_FreeAndCoalesce_5D30E+76j
					; Heap_FreeAndCoalesce_5D30E+7Dj
		mov	di, [di+4]
		mov	ax, [di+6]
		mov	[bx+6],	ax
		mov	[bx+4],	di
		mov	[di+6],	bx
		mov	di, [bx+6]
		mov	[di+4],	bx

loc_5D3A6:				; CODE XREF: Heap_FreeAndCoalesce_5D30E:loc_5D318j
					; Heap_FreeAndCoalesce_5D30E+13j ...
		pop	di
		pop	si
		leave
		retf
Heap_FreeAndCoalesce_5D30E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; near, valide l'intégrité d'un bloc de tas avant libération (gestion d'erreur sub_6B70F,
; détails via Heap_ValidateBlockDetailed_5CFF8, seg136). Appelée par
; Heap_FreeAndCoalesce_5D30E.
; ==============================================================================================
Heap_ValidateBlock_5D3AA	proc near		; CODE XREF: Heap_FreeAndCoalesce_5D30E+1Ep

arg_0		= word ptr  4

		enter	0, 0
		mov	di, [bp+arg_0]
		mov	bx, [di]
		test	bx, 1
		jz	short loc_5D3E4
		cmp	[bx+di+1], di
		jnz	short loc_5D3E4
		mov	si, [di+2]
		or	si, si
		jz	short loc_5D3CE
		add	si, [si]
		and	si, 0FFFEh
		cmp	si, di
		jnz	short loc_5D3E4

loc_5D3CE:				; CODE XREF: Heap_ValidateBlock_5D3AA+19j
		cmp	sp, word_70E24
		jnb	short loc_5D3F4
		mov	ax, 1308h
		push	ax
		call	VROOMM_StubThunk_6B70F
		add	sp, 2
		xor	ax, ax
		jmp	short locret_5D43D
; ���������������������������������������������������������������������������

loc_5D3E4:				; CODE XREF: Heap_ValidateBlock_5D3AA+Dj
					; Heap_ValidateBlock_5D3AA+12j ...
		xor	ax, ax
		push	ax
		push	ax
		call	Heap_ValidateBlockDetailed_5CFF8
		add	sp, 4
		xor	ax, ax
		jmp	short locret_5D43D
; ���������������������������������������������������������������������������

loc_5D3F4:				; CODE XREF: Heap_ValidateBlock_5D3AA+28j
		and	bx, 0FFFEh
		mov	si, bx
		add	si, di
		mov	cx, [si]
		test	cx, 1
		jnz	short loc_5D43A
		add	bx, cx
		mov	[di], bx
		or	word ptr [di], 1
		mov	ax, di
		add	bx, ax
		mov	[bx+2],	di
		mov	bx, si

loc_5D413:
		cmp	[bx+6],	bx
		jnz	short loc_5D420

loc_5D418:
		mov	word_70E20, 0
		jmp	short loc_5D43A
; ���������������������������������������������������������������������������

loc_5D420:				; CODE XREF: Heap_ValidateBlock_5D3AA+6Cj
		mov	dx, word_70E20
		cmp	bx, dx

loc_5D426:
		jnz	short loc_5D42E
		mov	ax, [bx+6]
		mov	word_70E20, ax

loc_5D42E:				; CODE XREF: Heap_ValidateBlock_5D3AA:loc_5D426j
		mov	di, [bx+6]

loc_5D431:
		mov	bx, [bx+4]
		mov	[di+4],	bx

loc_5D437:
		mov	[bx+6],	di

loc_5D43A:				; CODE XREF: Heap_ValidateBlock_5D3AA+57j
					; Heap_ValidateBlock_5D3AA+74j
		mov	ax, 1

locret_5D43D:				; CODE XREF: Heap_ValidateBlock_5D3AA+38j
					; Heap_ValidateBlock_5D3AA+48j
		leave
		retn
Heap_ValidateBlock_5D3AA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; far, parcourt une petite liste chaînée (word_70E20, max 4 nœuds) et accumule une somme de
; contrôle. Référencée par sub_3844F, HUD_RenderSymbologyMain (sub_3E744) et
; UIScreen_RenderGraphVGA (sub_509EE, seg113) — probable cache/liste de zones à rafraîchir
; pour l'affichage.
; ==============================================================================================
DisplayCache_ComputeChecksum_5D43F	proc far		; CODE XREF: Debris_SpawnAtAttachPoint+10P
					; HUD_RenderSymbologyMain:loc_3E8B6P	...
		push	di
		cmp	byte_70E27, 0
		jnz	short loc_5D465
		xor	ax, ax
		mov	di, 3E8h
		mov	cx, 4

loc_5D44F:
		mov	bx, word_70E20
		mov	dx, bx

loc_5D455:				; CODE XREF: DisplayCache_ComputeChecksum_5D43F+22j
		mov	bx, [bx+6]
		add	ax, [bx]
		sub	ax, cx
		dec	di
		jz	short loc_5D465
		cmp	bx, dx
		jnz	short loc_5D455

loc_5D463:
		jmp	short loc_5D467
; ���������������������������������������������������������������������������

loc_5D465:				; CODE XREF: DisplayCache_ComputeChecksum_5D43F+6j
					; DisplayCache_ComputeChecksum_5D43F+1Ej
		xor	ax, ax

loc_5D467:				; CODE XREF: DisplayCache_ComputeChecksum_5D43F:loc_5D463j
		pop	di
		retf
DisplayCache_ComputeChecksum_5D43F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; far, lit la valeur en tête de la même liste chaînée (word_70E20) que
; DisplayCache_ComputeChecksum_5D43F. Référencée par PagedResourceC_Method_GetValue_5CD0C
; (seg134) et sub_5E89E.
; ==============================================================================================
DisplayCache_GetHeadValue_5D469	proc far		; CODE XREF: seg134:0062P
					; DisplaySurface_CloneOrResize_5E89E+4BP ...
		push	di
		xor	ax, ax
		cmp	byte_70E27, 0
		jnz	short loc_5D480
		mov	bx, word_70E20
		or	bx, bx
		jz	short loc_5D480
		mov	bx, [bx+4]
		mov	ax, [bx]

loc_5D480:				; CODE XREF: DisplayCache_GetHeadValue_5D469+8j
					; DisplayCache_GetHeadValue_5D469+10j
		pop	di
		retf
DisplayCache_GetHeadValue_5D469	endp

seg137		ends

seg144		segment	byte public 'CODE' use16
		assume cs:seg144
		;org 0Fh
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à StreamReader_Destruct_638FF (sub_638FF de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, destructeur de
; la classe « lecteur de flux tamponné » : détruit des sous-objets (sub_5E9A9/sub_5E95A),
; dispatch vtable (DisplayContext_Method_PassThrough_5F458) et libère un membre
; (Member_ClearAndFree_5EA03). Référencée dans le cluster environnant.
; ==============================================================================================
StreamReader_Destruct_3B16F	proc far		; CODE XREF: seg147:0055P StreamReader_DestructWrapper_3D231+7P ...

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_4], 0
		mov	[bp+var_2], 0
		mov	al, [si+4Ch]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+48E8h]
		push	large dword ptr	[si+4Dh]
		push	large dword ptr	[si+55h]
		mov	ax, si
		add	ax, 0Ah
		push	ax
		push	4905h
		lea	ax, [bp+var_4]
		push	ax
		call	DisplaySurface_ConstructWithMode_2F21E
		add	sp, 10h
		push	[bp+var_4]
		mov	ax, si
		add	ax, 6
		push	ax
		call	CachedObject_DestructSubobjects_2F1CF
		add	sp, 4
		push	si
		call	sub_2FCCD
		pop	cx
		lea	ax, [bp+var_4]
		push	ax
		call	Member_ClearAndFree_2F278
		pop	cx
		pop	si
		leave
		retf
StreamReader_Destruct_3B16F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; StreamReader_Helper_63962 (sub_63962 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, combine StreamReader_ValidateState_63DB5, sub_2A82
; (externe) et Runtime_FatalErrorHandlerWithTag_UNRESOLVED (sub_5F4A9). Appelée par sub_639F1
; et sub_63B23.
; ==============================================================================================
StreamReader_Helper_3B1D2	proc far		; CODE XREF: StreamReader_ValidateAndDispatch_3B261+Cp
					; StreamReader_ConstructAndBind_3B393+2Fp

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr StreamReader_ValidateState_3B625
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_3B202
		or	di, di
		jz	short loc_3B1FC
		push	di
		mov	ax, si
		add	ax, 0Ah
		push	ax
		call	CRT_Strcpy
		jmp	short loc_3B20B
; ���������������������������������������������������������������������������

loc_3B1FC:				; CODE XREF: StreamReader_Helper_3B1D2+1Aj
		mov	byte ptr [si+0Ah], 0
		jmp	short loc_3B20E
; ���������������������������������������������������������������������������

loc_3B202:				; CODE XREF: StreamReader_Helper_3B1D2+16j
		push	1912h
		push	si
		call	DisplayContext_CommitFrameWithTag_2FD1E

loc_3B20B:				; CODE XREF: StreamReader_Helper_3B1D2+28j
		add	sp, 4

loc_3B20E:				; CODE XREF: StreamReader_Helper_3B1D2+2Ej
		pop	di
		pop	si
		pop	bp
		retf
StreamReader_Helper_3B1D2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; StreamReader_Helper_639A2 (sub_639A2 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, combine StreamReader_ValidateState_63DB5 et
; Runtime_FatalErrorHandlerWithTag (sub_5F4A9). Appelée par sub_639F1.
; ==============================================================================================
StreamReader_Helper_3B212	proc far		; CODE XREF: StreamReader_ValidateAndDispatch_3B261+18p

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		nop
		push	cs
		call	near ptr StreamReader_ValidateState_3B625
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_3B22E
		mov	al, [bp+arg_2]
		mov	[si+4Ch], al
		jmp	short loc_3B23A
; ���������������������������������������������������������������������������

loc_3B22E:				; CODE XREF: StreamReader_Helper_3B212+12j
		push	1913h
		push	si
		call	DisplayContext_CommitFrameWithTag_2FD1E
		add	sp, 4

loc_3B23A:				; CODE XREF: StreamReader_Helper_3B212+1Aj
		pop	si
		pop	bp
		retf
StreamReader_Helper_3B212	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; StreamReader_Helper_639CD (sub_639CD de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, combine Runtime_FatalErrorHandlerWithTag (sub_5F4A9).
; Appelée par sub_63A88 et sub_63D2D.
; ==============================================================================================
StreamReader_Helper_3B23D	proc far		; CODE XREF: StreamReader_ConstructVariantB_3B2F8+40p
					; StreamReader_ReadDispatchB_3B59D+28p

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+59h], 0
		jnz	short loc_3B252
		mov	ax, [bp+arg_2]
		mov	[si+59h], ax
		jmp	short loc_3B25E
; ���������������������������������������������������������������������������

loc_3B252:				; CODE XREF: StreamReader_Helper_3B23D+Bj
		push	1990h
		push	si
		call	DisplayContext_CommitFrameWithTag_2FD1E
		add	sp, 4

loc_3B25E:				; CODE XREF: StreamReader_Helper_3B23D+13j
		pop	si
		pop	bp
		retf
StreamReader_Helper_3B23D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; StreamReader_ValidateAndDispatch_639F1 (sub_639F1 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine
; StreamReader_Helper_63962 et StreamReader_Helper_639A2. Appelée par sub_63D0E.
; ==============================================================================================
StreamReader_ValidateAndDispatch_3B261	proc far		; CODE XREF: StreamReader_ReadDispatch_3B57E+10p

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr StreamReader_Helper_3B1D2
		add	sp, 4
		mov	al, [bp+arg_4]
		push	ax
		push	si
		push	cs
		call	near ptr StreamReader_Helper_3B212
		add	sp, 4
		pop	si
		pop	bp
		retf
StreamReader_ValidateAndDispatch_3B261	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; StreamReader_Helper_63A12 (sub_63A12 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, appelée par sub_63A39 (constructeur, seg009), sub_63A88
; (seg195), sub_63AD3 (sub_A713E) et sub_63B23 (sub_33346) — helper commun d'initialisation,
; largement utilisé par des sous-systèmes très divers.
; ==============================================================================================
StreamReader_Helper_3B282	proc far		; CODE XREF: StreamReader_ConstructVariantA_3B2A9+46p
					; StreamReader_ConstructVariantB_3B2F8+37p ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		xor	eax, eax
		mov	[si+55h], eax
		mov	[si+51h], eax
		mov	[si+4Dh], eax
		mov	word ptr [si+5Bh], 0
		mov	word ptr [si+59h], 0
		mov	byte ptr [si+0Ah], 0
		pop	si
		pop	bp
		retf
StreamReader_Helper_3B282	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à StreamReader_ConstructVariantA_63A39 (sub_63A39 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; alloue (sub_658) et initialise (StreamReader_Helper_63A12). Référencée directement depuis
; seg009 (cœur du jeu/boucle principale).
; ==============================================================================================
StreamReader_ConstructVariantA_3B2A9	proc far		; CODE XREF: sub_3B0B+45P seg009:063CP ...

var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_3B2C5
		push	5Dh ; ']'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_3B2F3

loc_3B2C5:				; CODE XREF: StreamReader_ConstructVariantA_3B2A9+Cj
		mov	word ptr [si], 3B55h
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], seg seg001
		mov	word ptr [si+2], 3Bh ; ';'
		mov	word ptr [si], 4939h
		mov	eax, off_4790E
		mov	[bp+var_4], eax
		mov	[si+2],	eax
		push	si
		push	cs
		call	near ptr StreamReader_Helper_3B282
		pop	cx

loc_3B2F3:				; CODE XREF: StreamReader_ConstructVariantA_3B2A9+1Aj
		mov	ax, si
		pop	si
		leave
		retf
StreamReader_ConstructVariantA_3B2A9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à StreamReader_ConstructVariantB_63A88 (sub_63A88 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; alloue (sub_658), initialise (StreamReader_Helper_63A12, StreamReader_Helper_639CD).
; Référencée depuis seg195.
; ==============================================================================================
StreamReader_ConstructVariantB_3B2F8	proc far		; CODE XREF: seg149:0099P

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_3B311
		push	5Dh ; ']'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_3B33E

loc_3B311:				; CODE XREF: StreamReader_ConstructVariantB_3B2F8+9j
		mov	word ptr [si], 3B55h
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], seg seg001
		mov	word ptr [si+2], 3Bh ; ';'
		mov	word ptr [si], 4939h
		push	si
		push	cs
		call	near ptr StreamReader_Helper_3B282
		pop	cx
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr StreamReader_Helper_3B23D
		add	sp, 4

loc_3B33E:				; CODE XREF: StreamReader_ConstructVariantB_3B2F8+17j
		mov	ax, si
		pop	si
		pop	bp
		retf
StreamReader_ConstructVariantB_3B2F8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à StreamReader_ConstructVariantC_63AD3 (sub_63AD3 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; alloue (sub_658), initialise (StreamReader_Helper_63A12, sub_63D0E). Référencée par
; sub_A713E.
; ==============================================================================================
StreamReader_ConstructVariantC_3B343	proc far		; CODE XREF: sub_59E81+13P
					; sub_C3170+69P

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_3B35C
		push	5Dh ; ']'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_3B38E

loc_3B35C:				; CODE XREF: StreamReader_ConstructVariantC_3B343+9j
		mov	word ptr [si], 3B55h
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], seg seg001
		mov	word ptr [si+2], 3Bh ; ';'
		mov	word ptr [si], 4939h
		push	si
		push	cs
		call	near ptr StreamReader_Helper_3B282
		pop	cx
		mov	al, [bp+arg_4]
		push	ax
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr StreamReader_ReadDispatch_3B57E
		add	sp, 6

loc_3B38E:				; CODE XREF: StreamReader_ConstructVariantC_3B343+17j
		mov	ax, si
		pop	si
		pop	bp
		retf
StreamReader_ConstructVariantC_3B343	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; StreamReader_ConstructAndBind_63B23 (sub_63B23 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — ⚠️ far, 99 lignes, NON DÉTAILLÉE — combine
; StreamReader_Helper_63A12, StreamReader_Helper_63962, dispatch vtable et sub_63D2D.
; Référencée par sub_33346 (proche du cœur IA).
; ==============================================================================================
StreamReader_ConstructAndBind_3B393	proc far		; CODE XREF: sub_29C6B+12EP
					; StreamReader_ParseFormattedValue_3B97E+4EP ...

var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh
arg_C		= word ptr  12h

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	al, [si+0Ah]
		mov	[bp+var_1], al
		push	si
		push	cs
		call	near ptr StreamReader_Helper_3B282
		pop	cx
		mov	ax, si
		add	ax, 0Ah
		cmp	ax, [bp+arg_C]
		jnz	short loc_3B3BD
		mov	al, [bp+var_1]
		mov	[si+0Ah], al

loc_3B3BD:				; CODE XREF: StreamReader_ConstructAndBind_3B393+22j
		push	[bp+arg_C]
		push	si
		push	cs
		call	near ptr StreamReader_Helper_3B1D2
		add	sp, 4
		mov	[si+5Bh], di
		mov	al, [di+4Ch]
		mov	[si+4Ch], al
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		pop	cx
		or	al, al
		jz	short loc_3B403
		mov	eax, [di+51h]
		add	[bp+arg_4], eax
		add	[bp+arg_8], eax
		push	large [bp+arg_8]
		push	large [bp+arg_4]
		push	word ptr [di+59h]
		push	si
		nop
		push	cs
		call	near ptr StreamReader_ReadDispatchB_3B59D
		add	sp, 0Ch
		push	si
		mov	bx, [si]
		call	dword ptr [bx+0Ch]
		pop	cx

loc_3B403:				; CODE XREF: StreamReader_ConstructAndBind_3B393+47j
		pop	di
		pop	si
		leave
		retf
StreamReader_ConstructAndBind_3B393	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; StreamReader_CloseUnderlying_63B97 (sub_63B97 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, combine StreamReader_ValidateState_63DB5 et
; sub_63D6E, dispatch vtable [bx]. Appelée par sub_63BD5.
; ==============================================================================================
StreamReader_CloseUnderlying_3B407	proc far		; CODE XREF: StreamReader_Close_3B445+15p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		nop
		push	cs
		call	near ptr StreamReader_ValidateState_3B625
		pop	cx
		or	al, al
		jz	short loc_3B420
		push	si
		nop
		push	cs
		call	near ptr StreamReader_CloseHook_3B5DE
		pop	cx

loc_3B420:				; CODE XREF: StreamReader_CloseUnderlying_3B407+10j
		cmp	word ptr [si+5Bh], 0
		jnz	short loc_3B442
		cmp	word ptr [si+59h], 0
		jz	short loc_3B43D
		push	3
		push	word ptr [si+59h]
		mov	bx, [si+59h]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short $+2

loc_3B43D:				; CODE XREF: StreamReader_CloseUnderlying_3B407+23j
		mov	word ptr [si+59h], 0

loc_3B442:				; CODE XREF: StreamReader_CloseUnderlying_3B407+1Dj
		pop	si
		pop	bp
		retf
StreamReader_CloseUnderlying_3B407	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à StreamReader_Close_63BD5 (sub_63BD5 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, ferme et libère
; le flux (StreamReader_CloseUnderlying_63B97, Member_ClearAndFree_5EA03, sub_338). Référencée
; directement par TextRenderer_Main (sub_27477, seg048).
; ==============================================================================================
StreamReader_Close_3B445	proc far		; CODE XREF: StreamReader_ReleaseBuffer_3CEB3+33P
					; IndexedRecordReader_Destruct_3D240+31P ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_3B477
		mov	word ptr [si], 4939h
		push	si
		push	cs
		call	near ptr StreamReader_CloseUnderlying_3B407
		pop	cx
		mov	ax, si
		add	ax, 6
		push	ax
		call	Member_ClearAndFree_2F278
		pop	cx
		test	di, 1
		jz	short loc_3B477
		push	si
		call	sub_308
		pop	cx

loc_3B477:				; CODE XREF: StreamReader_Close_3B445+Dj
					; StreamReader_Close_3B445+29j
		pop	di
		pop	si
		pop	bp
		retf
StreamReader_Close_3B445	endp

; ���������������������������������������������������������������������������

loc_3B47B:				; DATA XREF: dseg:13F9o dseg:4949o ...
		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+6]
		push	4
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_3B49B
		mov	word ptr [si], 48C8h
		mov	word ptr [si+2], 0
		jmp	short loc_3B49D
; ���������������������������������������������������������������������������

loc_3B49B:				; CODE XREF: seg144:032Ej
		mov	ax, si

loc_3B49D:				; CODE XREF: seg144:0339j
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; StreamReader_DispatchRead_63C30 (sub_63C30 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, dispatch vtable [bx+0x10] avec gestion
; d'erreur (Runtime_FatalErrorHandlerWithTag, sub_5F4A9). Appelée par sub_63C61.
; ==============================================================================================
StreamReader_DispatchRead_3B4A0	proc far		; CODE XREF: StreamReader_ReadBlock_3B4D1+3Fp

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+59h], 0
		jnz	short loc_3B4C2
		push	si
		mov	bx, [si]
		call	dword ptr [bx+10h]
		pop	cx
		mov	[si+59h], ax
		cmp	word ptr [si+59h], 0
		jnz	short loc_3B4CE
		push	19E0h
		jmp	short loc_3B4C5
; ���������������������������������������������������������������������������

loc_3B4C2:				; CODE XREF: StreamReader_DispatchRead_3B4A0+Bj
		push	1990h

loc_3B4C5:				; CODE XREF: StreamReader_DispatchRead_3B4A0+20j
		push	si
		call	DisplayContext_CommitFrameWithTag_2FD1E
		add	sp, 4

loc_3B4CE:				; CODE XREF: StreamReader_DispatchRead_3B4A0+1Bj
		pop	si
		pop	bp
		retf
StreamReader_DispatchRead_3B4A0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; StreamReader_ReadBlock_63C61 (sub_63C61 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — ⚠️ far, 115 lignes, NON DÉTAILLÉE — combine
; sub_6410E, StreamReader_DispatchRead_63C30 et dispatch vtable multiple
; ([bx+8]/[bx+0x10]/[bx+0x18]/[bx+0xC]). Appelée par sub_63D0E et sub_63D2D — cœur de lecture
; par blocs du flux tamponné.
; ==============================================================================================
StreamReader_ReadBlock_3B4D1	proc far		; CODE XREF: StreamReader_ReadDispatch_3B57E+18p
					; StreamReader_ReadDispatchB_3B59D+3Ap ...

var_3		= byte ptr -3
var_2		= byte ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		cmp	byte ptr [si+4Ch], 1
		jnz	short loc_3B4F7
		mov	ax, si
		add	ax, 0Ah
		push	ax
		push	si
		call	StreamReader_ParseFormattedValue_3B97E
		add	sp, 4
		mov	[bp+var_2], al

loc_3B4F7:				; CODE XREF: StreamReader_ReadBlock_3B4D1+12j
		cmp	[bp+var_2], 0
		jnz	short loc_3B578
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		pop	cx
		or	al, al
		jz	short loc_3B578
		cmp	word ptr [si+59h], 0
		jnz	short loc_3B514
		push	si
		push	cs
		call	near ptr StreamReader_DispatchRead_3B4A0
		pop	cx

loc_3B514:				; CODE XREF: StreamReader_ReadBlock_3B4D1+3Bj
		cmp	word ptr [si+59h], 0
		jz	short loc_3B56C
		mov	al, [si+4Ch]
		push	ax
		mov	ax, si
		add	ax, 0Ah
		push	ax
		push	word ptr [si+59h]
		mov	bx, [si+59h]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6
		mov	[bp+var_3], al
		cmp	[bp+var_3], 0
		jz	short loc_3B567
		xor	eax, eax
		mov	[si+51h], eax
		mov	[si+4Dh], eax
		push	word ptr [si+59h]
		mov	bx, [si+59h]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+55h], eax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+0Ch]
		pop	cx
		mov	[bp+var_2], 1
		jmp	short loc_3B578
; ���������������������������������������������������������������������������

loc_3B567:				; CODE XREF: StreamReader_ReadBlock_3B4D1+68j
		push	1910h
		jmp	short loc_3B56F
; ���������������������������������������������������������������������������

loc_3B56C:				; CODE XREF: StreamReader_ReadBlock_3B4D1+47j
		push	19E0h

loc_3B56F:				; CODE XREF: StreamReader_ReadBlock_3B4D1+99j
		push	si
		call	DisplayContext_CommitFrameWithTag_2FD1E
		add	sp, 4

loc_3B578:				; CODE XREF: StreamReader_ReadBlock_3B4D1+2Aj
					; StreamReader_ReadBlock_3B4D1+35j ...
		mov	al, [bp+var_2]
		pop	si
		leave
		retf
StreamReader_ReadBlock_3B4D1	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; StreamReader_ReadDispatch_63D0E (sub_63D0E de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, combine
; StreamReader_ValidateAndDispatch_639F1 et StreamReader_ReadBlock_63C61. Appelée par
; sub_63AD3.
; ==============================================================================================
StreamReader_ReadDispatch_3B57E	proc far		; CODE XREF: StreamReader_ConstructVariantC_3B343+45p
					; StreamReader_OpenAndRegister_3BB91+10P ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, [bp+arg_4]
		push	ax
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr StreamReader_ValidateAndDispatch_3B261
		add	sp, 6
		push	si
		push	cs
		call	near ptr StreamReader_ReadBlock_3B4D1
		pop	cx
		pop	si
		pop	bp
		retf
StreamReader_ReadDispatch_3B57E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; StreamReader_ReadDispatchB_63D2D (sub_63D2D de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, combine StreamReader_Helper_639CD et
; StreamReader_ReadBlock_63C61. Appelée par sub_63B23.
; ==============================================================================================
StreamReader_ReadDispatchB_3B59D	proc far		; CODE XREF: StreamReader_ConstructAndBind_3B393+63p

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dword ptr [si+4Dh], 0
		mov	eax, [bp+arg_4]
		mov	[si+51h], eax
		mov	eax, [bp+arg_8]
		sub	eax, [bp+arg_4]
		mov	[si+55h], eax
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr StreamReader_Helper_3B23D
		add	sp, 4
		cmp	word ptr [si+5Bh], 0
		jz	short loc_3B5D5
		mov	al, 1
		jmp	short loc_3B5DB
; ���������������������������������������������������������������������������

loc_3B5D5:				; CODE XREF: StreamReader_ReadDispatchB_3B59D+32j
		push	si
		push	cs
		call	near ptr StreamReader_ReadBlock_3B4D1
		pop	cx

loc_3B5DB:				; CODE XREF: StreamReader_ReadDispatchB_3B59D+36j
		pop	si
		pop	bp
		retf
StreamReader_ReadDispatchB_3B59D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; StreamReader_CloseHook_63D6E (sub_63D6E de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, combine StreamReader_ValidateState_63DB5,
; dispatch vtable [bx+0x14] et Runtime_FatalErrorHandlerWithTag. Référencée directement par
; sub_27F9E (proche de TextRenderer).
; ==============================================================================================
StreamReader_CloseHook_3B5DE	proc far		; CODE XREF: sub_C13D+215P
					; seg063:00F3P	...

var_2		= byte ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		cmp	word ptr [si+5Bh], 0
		jnz	short loc_3B61F
		push	si
		nop
		push	cs
		call	near ptr StreamReader_ValidateState_3B625
		pop	cx
		or	al, al
		jz	short loc_3B61B
		push	word ptr [si+59h]
		mov	bx, [si+59h]
		mov	bx, [bx]
		call	dword ptr [bx+14h]
		pop	cx
		or	al, al
		jnz	short loc_3B61B
		push	1980h
		push	si
		call	DisplayContext_CommitFrameWithTag_2FD1E
		add	sp, 4
		jmp	short loc_3B61F
; ���������������������������������������������������������������������������

loc_3B61B:				; CODE XREF: StreamReader_CloseHook_3B5DE+1Dj
					; StreamReader_CloseHook_3B5DE+2Dj
		mov	[bp+var_2], 1

loc_3B61F:				; CODE XREF: StreamReader_CloseHook_3B5DE+12j
					; StreamReader_CloseHook_3B5DE+3Bj
		mov	al, [bp+var_2]
		pop	si
		leave
		retf
StreamReader_CloseHook_3B5DE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; StreamReader_ValidateState_63DB5 (sub_63DB5 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, fonction de garde utilisée dans tout le
; cluster StreamReader (rôle exact non détaillé — vérification d'état avant opération).
; Référencée directement par sub_27355 (proche de TextRenderer).
; ==============================================================================================
StreamReader_ValidateState_3B625	proc far		; CODE XREF: StreamReader_Helper_3B1D2+Ep StreamReader_Helper_3B212+Ap ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dl, 0
		cmp	word ptr [si+59h], 0
		jz	short loc_3B646
		mov	bx, [si+59h]
		cmp	word ptr [bx+2], 0
		jz	short loc_3B642
		mov	ax, 1
		jmp	short loc_3B644
; ���������������������������������������������������������������������������

loc_3B642:				; CODE XREF: StreamReader_ValidateState_3B625+16j
		xor	ax, ax

loc_3B644:				; CODE XREF: StreamReader_ValidateState_3B625+1Bj
		mov	dl, al

loc_3B646:				; CODE XREF: StreamReader_ValidateState_3B625+Dj
		mov	al, dl
		pop	si
		pop	bp
		retf
StreamReader_ValidateState_3B625	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; StreamReader_CheckBufferValid_63DDB (sub_63DDB de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, appelée par Handle_ReadAndOffsetField-style
; StreamReader_ReadTyped_63FA1 pour vérifier la validité du tampon après une lecture.
; ==============================================================================================
StreamReader_CheckBufferValid_3B64B	proc far		; CODE XREF: StreamReader_ReadTyped_3B811+5Ep

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si+4Dh]
		cmp	eax, [si+55h]
		jl	short loc_3B661
		mov	ax, 1
		jmp	short loc_3B663
; ���������������������������������������������������������������������������

loc_3B661:				; CODE XREF: StreamReader_CheckBufferValid_3B64B+Fj
		xor	ax, ax

loc_3B663:				; CODE XREF: StreamReader_CheckBufferValid_3B64B+14j
		pop	si
		pop	bp
		retf
StreamReader_CheckBufferValid_3B64B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; StreamReader_SeekVariant_63DF6 (sub_63DF6 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — ⚠️ far, 90 lignes, NON DÉTAILLÉE — dispatch vtable
; [bx+0xC], StreamReader_ValidateState_63DB5, sub_6404E. Référencée par sub_641EB.
; ==============================================================================================
StreamReader_SeekVariant_3B666	proc far		; CODE XREF: StreamReader_PrepareParse_3BA5B+BP
					; StreamReader_ParseFormattedString_3BA87+47P ...

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		cmp	[bp+arg_2], 0
		jl	short loc_3B681
		mov	eax, [si+55h]
		cmp	eax, [bp+arg_2]
		jge	short loc_3B686

loc_3B681:				; CODE XREF: StreamReader_SeekVariant_3B666+Fj
		push	1941h
		jmp	short loc_3B6D1
; ���������������������������������������������������������������������������

loc_3B686:				; CODE XREF: StreamReader_SeekVariant_3B666+19j
		push	0
		mov	eax, [bp+arg_2]
		add	eax, [si+51h]
		push	eax
		push	word ptr [si+59h]
		mov	bx, [si+59h]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		push	dx
		push	ax
		pop	eax
		add	sp, 8
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0FFFFFFFFh
		jz	short loc_3B6B9
		sub	eax, [si+51h]
		mov	[si+4Dh], eax
		jmp	short loc_3B6DA
; ���������������������������������������������������������������������������

loc_3B6B9:				; CODE XREF: StreamReader_SeekVariant_3B666+47j
		push	si
		push	cs
		call	near ptr StreamReader_ValidateState_3B625
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_3B6CE
		push	si
		nop
		push	cs
		call	near ptr StreamReader_ReportError_3B8BE
		pop	cx
		jmp	short $+2

loc_3B6CE:				; CODE XREF: StreamReader_SeekVariant_3B666+5Dj
		push	1914h

loc_3B6D1:				; CODE XREF: StreamReader_SeekVariant_3B666+1Ej
		push	si
		call	DisplayContext_CommitFrameWithTag_2FD1E
		add	sp, 4

loc_3B6DA:				; CODE XREF: StreamReader_SeekVariant_3B666+51j
		pop	si
		leave
		retf
StreamReader_SeekVariant_3B666	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+6]
		mov	eax, [si+4Dh]
		add	eax, [bp+8]
		mov	[bp-4],	eax
		cmp	dword ptr [bp-4], 0
		jl	short loc_3B746
		mov	eax, [si+55h]
		cmp	eax, [bp-4]
		jl	short loc_3B746
		push	1
		push	large dword ptr	[bp+8]
		push	word ptr [si+59h]
		mov	bx, [si+59h]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		push	dx
		push	ax
		pop	eax
		add	sp, 8
		mov	[bp-4],	eax
		cmp	dword ptr [bp-4], 0FFFFFFFFh
		jz	short loc_3B731
		sub	eax, [si+51h]
		mov	[si+4Dh], eax
		jmp	short loc_3B752
; ���������������������������������������������������������������������������

loc_3B731:				; CODE XREF: seg144:05C5j
		push	si
		push	cs
		call	near ptr StreamReader_ValidateState_3B625
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_3B746
		push	si
		nop
		push	cs
		call	near ptr StreamReader_ReportError_3B8BE
		pop	cx
		jmp	short $+2

loc_3B746:				; CODE XREF: seg144:0598j seg144:05A2j ...
		push	1943h
		push	si
		call	DisplayContext_CommitFrameWithTag_2FD1E
		add	sp, 4

loc_3B752:				; CODE XREF: seg144:05CFj
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; StreamReader_RefillBuffer_63EE5 (sub_63EE5 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, recharge le tampon depuis le flux sous-jacent
; (dispatch vtable [bx+0xC]), StreamReader_ValidateState_63DB5, sub_6404E. Appelée par
; StreamReader_ReadTyped_63FA1 en cas de dépassement de tampon.
; ==============================================================================================
StreamReader_RefillBuffer_3B755	proc far		; CODE XREF: StreamReader_ReadTyped_3B811+68p

var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	0
		mov	eax, [si+51h]
		add	eax, [si+55h]
		push	eax
		push	word ptr [si+59h]
		mov	bx, [si+59h]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		push	dx
		push	ax
		pop	eax
		add	sp, 8
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0FFFFFFFFh
		jz	short loc_3B792
		sub	eax, [si+51h]
		mov	[si+4Dh], eax
		jmp	short loc_3B7B3
; ���������������������������������������������������������������������������

loc_3B792:				; CODE XREF: StreamReader_RefillBuffer_3B755+31j
		push	si
		push	cs
		call	near ptr StreamReader_ValidateState_3B625
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_3B7A7
		push	si
		nop
		push	cs
		call	near ptr StreamReader_ReportError_3B8BE
		pop	cx
		jmp	short $+2

loc_3B7A7:				; CODE XREF: StreamReader_RefillBuffer_3B755+47j
		push	1940h
		push	si
		call	DisplayContext_CommitFrameWithTag_2FD1E
		add	sp, 4

loc_3B7B3:				; CODE XREF: StreamReader_RefillBuffer_3B755+3Bj
		pop	si
		leave
		retf
StreamReader_RefillBuffer_3B755	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; StreamReader_PrepareForRead_63F46 (sub_63F46 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, prépare le flux avant lecture (dispatch
; vtable [bx+0xC], StreamReader_ValidateState_63DB5, sub_6404E). Référencée par
; Music_LoadTimbreFromLibrary_5A577 (seg124).
; ==============================================================================================
StreamReader_PrepareForRead_3B7B6	proc far		; CODE XREF: sub_74F1+10P seg150:0161P

var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	0
		push	large dword ptr	[si+51h]
		push	word ptr [si+59h]
		mov	bx, [si+59h]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		push	dx
		push	ax
		pop	eax
		add	sp, 8
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0FFFFFFFFh
		jz	short loc_3B7ED
		sub	eax, [si+51h]
		mov	[si+4Dh], eax
		jmp	short loc_3B80E
; ���������������������������������������������������������������������������

loc_3B7ED:				; CODE XREF: StreamReader_PrepareForRead_3B7B6+2Bj
		push	si
		push	cs
		call	near ptr StreamReader_ValidateState_3B625
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_3B802
		push	si
		nop
		push	cs
		call	near ptr StreamReader_ReportError_3B8BE
		pop	cx
		jmp	short $+2

loc_3B802:				; CODE XREF: StreamReader_PrepareForRead_3B7B6+41j
		push	1940h
		push	si
		call	DisplayContext_CommitFrameWithTag_2FD1E
		add	sp, 4

loc_3B80E:				; CODE XREF: StreamReader_PrepareForRead_3B7B6+35j
		pop	si
		leave
		retf
StreamReader_PrepareForRead_3B7B6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; StreamReader_ReadTyped_63FA1 (sub_63FA1 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — ⭐ far, lecture typée à travers le flux tamponné :
; gère la position courante (+0x4D) et le tampon (+0x51), dispatch vers l'objet flux sous-
; jacent (+0x59, méthode virtuelle « Read »), avec repli sur
; StreamReader_RefillBuffer_63EE5/CheckBufferValid_63DDB selon le résultat. Référencée
; massivement (Handle_ReadWordField_63511, Handle_ReadByteField_63534, seg188, et de nombreux
; autres segments) — fonction centrale du système de lecture typée par handle.
; ==============================================================================================
StreamReader_ReadTyped_3B811	proc far		; CODE XREF: sub_74F1+29P sub_74F1+AAP ...

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= dword	ptr  0Ch
arg_A		= dword	ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [bp+arg_A]
		mov	[bp+var_8], eax
		cmp	[bp+arg_A], 0FFFFFFFFh
		jnz	short loc_3B832
		mov	eax, [si+4Dh]
		mov	[bp+var_8], eax

loc_3B832:				; CODE XREF: StreamReader_ReadTyped_3B811+17j
		push	large [bp+arg_6]
		mov	eax, [bp+var_8]
		add	eax, [si+51h]
		push	eax
		push	large [bp+arg_2]
		push	word ptr [si+59h]
		mov	bx, [si+59h]
		mov	bx, [bx]
		call	dword ptr [bx+4]
		push	dx
		push	ax
		pop	eax
		add	sp, 0Eh
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0FFFFFFFFh
		jz	short loc_3B87F
		mov	eax, [bp+var_8]
		add	eax, [bp+var_4]
		mov	[si+4Dh], eax
		push	si
		push	cs
		call	near ptr StreamReader_CheckBufferValid_3B64B
		pop	cx
		or	al, al
		jz	short loc_3B8A0
		push	si
		push	cs
		call	near ptr StreamReader_RefillBuffer_3B755
		pop	cx
		jmp	short loc_3B8A0
; ���������������������������������������������������������������������������

loc_3B87F:				; CODE XREF: StreamReader_ReadTyped_3B811+4Ej
		push	si
		push	cs
		call	near ptr StreamReader_ValidateState_3B625
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_3B894
		push	si
		nop
		push	cs
		call	near ptr StreamReader_ReportError_3B8BE
		pop	cx
		jmp	short $+2

loc_3B894:				; CODE XREF: StreamReader_ReadTyped_3B811+78j
		push	1920h
		push	si
		call	DisplayContext_CommitFrameWithTag_2FD1E
		add	sp, 4

loc_3B8A0:				; CODE XREF: StreamReader_ReadTyped_3B811+64j
					; StreamReader_ReadTyped_3B811+6Cj
		mov	eax, [bp+var_4]
		shld	edx, eax, 10h
		pop	si
		leave
		retf
StreamReader_ReadTyped_3B811	endp

; ���������������������������������������������������������������������������

loc_3B8AC:				; DATA XREF: dseg:055Eo dseg:069Bo ...
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	al, 1
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_3B8B6	proc far		; CODE XREF: seg149:0016P
					; DATA XREF: dseg:13F5o ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_3B8B6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; StreamReader_ReportError_6404E (sub_6404E de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, enveloppe Runtime_FatalErrorHandlerWithTag
; (sub_5F4A9, tag 1911h) — signale une erreur du flux tamponné.
; ==============================================================================================
StreamReader_ReportError_3B8BE	proc far		; CODE XREF: StreamReader_SeekVariant_3B666+62p
					; seg144:05E0p	...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	1911h
		push	ax
		call	DisplayContext_CommitFrameWithTag_2FD1E
		add	sp, 4
		pop	bp
		retf
StreamReader_ReportError_3B8BE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; StreamReader_GetCapacity_64062 (sub_64062 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, retourne la capacité du tampon (+0x55, 32
; bits). Référencée directement par sub_27355 et sub_27F9E (proches de TextRenderer).
; ==============================================================================================
StreamReader_GetCapacity_3B8D2	proc far		; CODE XREF: sub_7A4D+56P sub_8256+53P ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si+55h]
		shld	edx, eax, 10h
		pop	si
		pop	bp
		retf
StreamReader_GetCapacity_3B8D2	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	eax, [si+4Dh]
		shld	edx, eax, 10h
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; StreamReader_ComputeHeaderOffset_64088 (sub_64088 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, ajoute une constante (0xA,
; taille d'en-tête ?) à un handle/offset. Référencée depuis seg193.
; ==============================================================================================
StreamReader_ComputeHeaderOffset_3B8F8	proc far		; CODE XREF: seg147:002CP

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	ax, dx
		add	ax, 0Ah
		pop	bp
		retf
StreamReader_ComputeHeaderOffset_3B8F8	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		mov	eax, [bp+6]
		mov	off_4790E, eax
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		push	ax
		push	cs
		call	near ptr StreamReader_ReadBlock_3B4D1
		pop	cx
		pop	bp
		retf
seg144		ends

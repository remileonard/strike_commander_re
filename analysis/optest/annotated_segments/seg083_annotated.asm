seg083		segment	byte public 'CODE' use16
		assume cs:seg083
		;org 1
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CachedObject_Allocate_5DA48 (sub_5DA48 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, alloue via
; sub_658. Référencée depuis seg209 (segment distant non encore couvert).
; ==============================================================================================
CachedObject_Allocate_2D201	proc far		; CODE XREF: seg163:02E6P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si

loc_2D205:				; DATA XREF: seg170:036Eo
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_2D21A
		push	20h ; ' '
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_2D25B

loc_2D21A:				; CODE XREF: CachedObject_Allocate_2D201+9j
		mov	word ptr [si], 11BCh
		mov	word ptr [si], 11C8h
		mov	word ptr [si], 3F28h
		mov	dword ptr [si+6], 0
		mov	byte ptr [si+0Ah], 2
		mov	byte ptr [si+0Bh], 0
		mov	dword ptr [si+0Ch], 0
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+14h], 2
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		mov	word ptr [si+1Ah], 0

loc_2D25B:				; CODE XREF: CachedObject_Allocate_2D201+17j
		mov	ax, si
		pop	si
		pop	bp
		retf
CachedObject_Allocate_2D201	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_2D260	proc far		; CODE XREF: Gameflow_KillBoard_51049+17DP

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_2D279
		push	20h ; ' '
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_2D2C1

loc_2D279:				; CODE XREF: sub_2D260+9j
		mov	word ptr [si], 11BCh
		mov	word ptr [si], 11C8h
		mov	word ptr [si], 3F28h
		mov	dword ptr [si+6], 0
		mov	byte ptr [si+0Ah], 2
		mov	byte ptr [si+0Bh], 0
		mov	dword ptr [si+0Ch], 0
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+14h], 2
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr CachedObject_DestructHelper_2D5ED
		add	sp, 4

loc_2D2C1:				; CODE XREF: sub_2D260+17j
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_2D260	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		or	si, si
		jnz	short loc_2D2DF
		push	20h ; ' '
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_2D330

loc_2D2DF:				; CODE XREF: seg083:00CFj
		mov	word ptr [si], 11BCh
		mov	word ptr [si], 11C8h
		mov	word ptr [si], 3F28h
		mov	dword ptr [si+6], 0
		mov	byte ptr [si+0Ah], 2
		mov	byte ptr [si+0Bh], 0
		mov	dword ptr [si+0Ch], 0
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+14h], 2
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		mov	al, [bp+0Eh]
		push	ax
		mov	al, [bp+0Ch]
		push	ax
		push	large dword ptr	[bp+8]
		push	si
		nop
		push	cs
		call	near ptr CachedObject_DestructHelper_2D63F
		add	sp, 0Ah

loc_2D330:				; CODE XREF: seg083:00DDj
		mov	ax, si
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+6]
		or	si, si
		jnz	short loc_2D351
		push	20h ; ' '
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_2D3B1

loc_2D351:				; CODE XREF: seg083:0141j
		mov	word ptr [si], 11BCh
		mov	word ptr [si], 11C8h
		mov	word ptr [si], 3F28h
		mov	dword ptr [si+6], 0
		mov	byte ptr [si+0Ah], 2
		mov	byte ptr [si+0Bh], 0
		mov	dword ptr [si+0Ch], 0
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+14h], 2
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		push	word ptr [bp+8]
		push	si
		nop
		push	cs
		call	near ptr CachedObject_DestructHelper_2D5ED
		add	sp, 4
		mov	ax, [bp+0Ah]
		mov	[bp-2],	ax
		mov	ax, [bp+0Ch]
		mov	[bp-4],	ax
		mov	ax, [bp-2]
		mov	[si+2],	ax
		mov	ax, [bp-4]
		mov	[si+4],	ax

loc_2D3B1:				; CODE XREF: seg083:014Fj
		mov	ax, si
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	si, [bp+6]
		or	si, si
		jnz	short loc_2D3D2
		push	20h ; ' '
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_2D43B

loc_2D3D2:				; CODE XREF: seg083:01C2j
		mov	word ptr [si], 11BCh
		mov	word ptr [si], 11C8h
		mov	word ptr [si], 3F28h
		mov	dword ptr [si+6], 0
		mov	byte ptr [si+0Ah], 2
		mov	byte ptr [si+0Bh], 0
		mov	dword ptr [si+0Ch], 0
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+14h], 2
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		push	word ptr [bp+8]
		push	si
		nop
		push	cs
		call	near ptr CachedObject_DestructHelper_2D5ED
		add	sp, 4
		mov	ax, [bp+0Ah]
		mov	[bp-2],	ax
		mov	ax, [bp+0Ch]
		mov	[bp-4],	ax
		mov	ax, [bp-2]
		mov	[si+2],	ax
		mov	ax, [bp-4]
		mov	[si+4],	ax
		mov	ax, [bp+0Eh]
		mov	[bp-6],	ax
		mov	[si+1Ah], ax

loc_2D43B:				; CODE XREF: seg083:01D0j
		mov	ax, si
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CachedObject_Destruct_5DC87 (sub_5DC87 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, destructeur :
; appelle sub_5DD29 puis libère deux blocs (Memory_TypedFree_5C7B6 ×2) et l'objet lui-même
; (sub_338). Référencée depuis seg209.
; ==============================================================================================
CachedObject_Destruct_2D440	proc far		; CODE XREF: seg163:02F6P
					; Gameflow_KillBoard_51049+75EP

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_2D452
		jmp	loc_2D4DE
; ���������������������������������������������������������������������������

loc_2D452:				; CODE XREF: CachedObject_Destruct_2D440+Dj
		mov	word ptr [si], 3F28h
		push	si
		nop
		push	cs
		call	near ptr CachedObject_ReleaseFields_2D4E2
		pop	cx
		cmp	byte ptr [si+15h], 0
		jz	short loc_2D483
		cmp	dword ptr [si+10h], 0
		jz	short loc_2D483
		push	0
		mov	al, [si+14h]
		push	ax
		mov	ax, si
		add	ax, 10h
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_2D483:				; CODE XREF: CachedObject_Destruct_2D440+21j
					; CachedObject_Destruct_2D440+28j
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		cmp	byte ptr [si+0Bh], 0
		jz	short loc_2D4BD
		cmp	dword ptr [si+6], 0
		jz	short loc_2D4BD
		push	0
		mov	al, [si+0Ah]
		push	ax
		mov	ax, si
		add	ax, 6
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_2D4BD:				; CODE XREF: CachedObject_Destruct_2D440+5Bj
					; CachedObject_Destruct_2D440+62j
		mov	dword ptr [si+6], 0
		mov	byte ptr [si+0Bh], 0
		mov	dword ptr [si+0Ch], 0
		test	di, 1
		jz	short loc_2D4DE
		push	si
		call	sub_308
		pop	cx

loc_2D4DE:				; CODE XREF: CachedObject_Destruct_2D440+Fj
					; CachedObject_Destruct_2D440+95j
		pop	di
		pop	si
		pop	bp
		retf
CachedObject_Destruct_2D440	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CachedObject_ReleaseFields_5DD29 (sub_5DD29 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; libère les champs internes d'un objet mis en cache (Memory_TypedFree_5C7B6 ×2). Appelée par
; CachedObject_Destruct_5DC87.
; ==============================================================================================
CachedObject_ReleaseFields_2D4E2	proc far		; CODE XREF: CachedObject_Destruct_2D440+19p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+0Bh], 0
		jz	short loc_2D50F
		cmp	dword ptr [si+6], 0
		jz	short loc_2D50F
		push	0
		mov	al, [si+0Ah]
		push	ax
		mov	ax, si
		add	ax, 6
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_2D50F:				; CODE XREF: CachedObject_ReleaseFields_2D4E2+Bj
					; CachedObject_ReleaseFields_2D4E2+12j
		mov	dword ptr [si+6], 0
		mov	byte ptr [si+0Bh], 0
		mov	dword ptr [si+0Ch], 0
		cmp	byte ptr [si+15h], 0
		jz	short loc_2D549
		cmp	dword ptr [si+10h], 0
		jz	short loc_2D549
		push	0
		mov	al, [si+14h]
		push	ax
		mov	ax, si
		add	ax, 10h
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_2D549:				; CODE XREF: CachedObject_ReleaseFields_2D4E2+45j
					; CachedObject_ReleaseFields_2D4E2+4Cj
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		pop	si
		pop	bp
		retf
CachedObject_ReleaseFields_2D4E2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CachedObject_DestructCore_5DDA7 (sub_5DDA7 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; cœur de destruction partagé (Memory_TypedFree_5C7B6 ×2). Appelée par
; CachedObject_DestructHelper_5DE34/5DE86.
; ==============================================================================================
CachedObject_DestructCore_2D560	proc far		; CODE XREF: CachedObject_DestructHelper_2D5ED+Dp CachedObject_DestructHelper_2D63F+Cp

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+0Bh], 0
		jz	short loc_2D58D
		cmp	dword ptr [si+6], 0
		jz	short loc_2D58D
		push	0
		mov	al, [si+0Ah]
		push	ax
		mov	ax, si
		add	ax, 6
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_2D58D:				; CODE XREF: CachedObject_DestructCore_2D560+Bj
					; CachedObject_DestructCore_2D560+12j
		mov	dword ptr [si+6], 0
		mov	byte ptr [si+0Bh], 0
		mov	dword ptr [si+0Ch], 0
		cmp	byte ptr [si+15h], 0
		jz	short loc_2D5C7
		cmp	dword ptr [si+10h], 0
		jz	short loc_2D5C7
		push	0
		mov	al, [si+14h]
		push	ax
		mov	ax, si
		add	ax, 10h
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_2D5C7:				; CODE XREF: CachedObject_DestructCore_2D560+45j
					; CachedObject_DestructCore_2D560+4Cj
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		mov	word ptr [si+2], 0
		mov	word ptr [si+4], 0
		mov	word ptr [si+1Ah], 0
		pop	si
		pop	bp
		retf
CachedObject_DestructCore_2D560	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; CachedObject_DestructHelper_5DE34 (sub_5DE34 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, appelle CachedObject_DestructCore_5DDA7.
; Référencée en interne du segment.
; ==============================================================================================
CachedObject_DestructHelper_2D5ED	proc far		; CODE XREF: sub_2D260+5Bp
					; seg083:0193p	...

var_5		= byte ptr -5
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr CachedObject_DestructCore_2D560
		pop	cx
		mov	di, [bp+arg_2]
		mov	eax, [di]
		mov	[bp+var_4], eax
		mov	al, [di+4]
		mov	[bp+var_5], al
		mov	eax, [bp+var_4]
		mov	[si+6],	eax
		mov	al, [bp+var_5]
		mov	[si+0Ah], al
		mov	byte ptr [si+0Bh], 0
		mov	dword ptr [si+0Ch], 0
		mov	eax, [di+6]
		mov	[si+0Ch], eax
		mov	di, [bp+arg_2]
		mov	byte ptr [di+5], 0
		mov	byte ptr [si+0Bh], 1
		pop	di
		pop	si
		leave
		retf
CachedObject_DestructHelper_2D5ED	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; CachedObject_DestructHelper_5DE86 (sub_5DE86 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, appelle CachedObject_DestructCore_5DDA7.
; Référencée par CachedObject_ConstructVariantB_5DB0D.
; ==============================================================================================
CachedObject_DestructHelper_2D63F	proc far		; CODE XREF: seg083:012Ap

var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= byte ptr  0Ch
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr CachedObject_DestructCore_2D560
		pop	cx
		mov	eax, [bp+arg_2]
		mov	[bp+var_4], eax
		mov	al, [bp+arg_6]
		mov	[bp+var_5], al
		mov	al, [bp+arg_8]
		mov	[bp+var_6], al
		mov	eax, [bp+var_4]
		mov	[si+6],	eax
		mov	al, [bp+var_5]
		mov	[si+0Ah], al
		mov	al, [bp+var_6]
		mov	[si+0Bh], al
		mov	dword ptr [si+0Ch], 0
		pop	si
		leave
		retf
CachedObject_DestructHelper_2D63F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CachedObject_BuildAndTransform_5DEC9 (sub_5DEC9 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 131 lignes, NON DÉTAILLÉE — combine Memory_TypedAllocDispatchB_5C832 ×2, sub_625CC,
; sub_5E74E, Memory_TypedFreeWrapper_5C6F3 (seg131). Référencée par sub_5E00C.
; ==============================================================================================
CachedObject_BuildAndTransform_2D682	proc far		; CODE XREF: CachedObject_BuildComposite_2D7C5+2Ep

var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 16h
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	dword ptr [si+6], 0
		jz	short loc_2D699
		mov	ax, 1
		jmp	short loc_2D69B
; ���������������������������������������������������������������������������

loc_2D699:				; CODE XREF: CachedObject_BuildAndTransform_2D682+10j
		xor	ax, ax

loc_2D69B:				; CODE XREF: CachedObject_BuildAndTransform_2D682+15j
		or	ax, ax
		jnz	short loc_2D6A2
		jmp	loc_2D75D
; ���������������������������������������������������������������������������

loc_2D6A2:				; CODE XREF: CachedObject_BuildAndTransform_2D682+1Bj
		xor	ax, ax
		mov	[bp+var_4], ax
		mov	[bp+var_2], ax
		push	0
		mov	al, [si+0Ah]
		push	ax
		push	large dword ptr	[si+6]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		call	Struct_GetElementCountMinusOne_33352
		mov	[bp+var_E], ax
		xor	di, di
		jmp	short loc_2D711
; ���������������������������������������������������������������������������

loc_2D6CD:				; CODE XREF: CachedObject_BuildAndTransform_2D682+92j
		push	ss
		lea	ax, [bp+var_C]
		push	ax
		push	large 0
		push	0
		mov	al, [si+0Ah]
		push	ax
		push	large dword ptr	[si+6]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		call	Font_ComputeGlyphBoundingBox_2EF02
		mov	dx, [bp+var_8]
		sub	dx, [bp+var_C]
		inc	dx
		cmp	dx, [bp+var_2]
		jle	short loc_2D701
		mov	[bp+var_2], dx

loc_2D701:				; CODE XREF: CachedObject_BuildAndTransform_2D682+7Aj
		mov	dx, [bp+var_6]
		sub	dx, [bp+var_A]
		inc	dx
		cmp	dx, [bp+var_4]
		jle	short loc_2D710
		mov	[bp+var_4], dx

loc_2D710:				; CODE XREF: CachedObject_BuildAndTransform_2D682+89j
		inc	di

loc_2D711:				; CODE XREF: CachedObject_BuildAndTransform_2D682+49j
		cmp	di, [bp+var_E]
		jl	short loc_2D6CD
		mov	ax, [bp+var_2]
		imul	[bp+var_4]
		movsx	eax, ax
		mov	[bp+var_12], eax
		push	0
		push	0
		push	2
		push	eax
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_16+2],	dx
		mov	word ptr [bp+var_16], ax
		mov	eax, [bp+var_16]
		mov	[si+10h], eax
		mov	byte ptr [si+14h], 2
		mov	byte ptr [si+15h], 1
		mov	dword ptr [si+16h], 0
		mov	eax, [bp+var_12]
		mov	[si+16h], eax

loc_2D75D:				; CODE XREF: CachedObject_BuildAndTransform_2D682+1Dj
		pop	di
		pop	si
		leave
		retf
CachedObject_BuildAndTransform_2D682	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	ax, [bp+8]
		mov	[si+1Ah], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CachedObject_AllocateAndInit_5DFBE (sub_5DFBE de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine Memory_TypedAllocDispatchB_5C832 et sub_61F52. Référencée en interne (loc_5DFF4).
; ==============================================================================================
CachedObject_AllocateAndInit_2D777	proc far		; CODE XREF: sub_2D7AD+Fp
					; TextScrollDisplayB_UpdateObjectState_3F7AE+4CP
					; DATA XREF: ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+1Ah]
		push	0
		mov	al, [si+0Ah]
		push	ax
		push	large dword ptr	[si+6]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	word_46F44
		call	Shape_DrawSpans_32CD8
		add	sp, 0Ch
		pop	si
		pop	bp
		retf
CachedObject_AllocateAndInit_2D777	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_2D7AD	proc far		; CODE XREF: Gameflow_KillBoard_51049+3FDP
					; DATA XREF: dseg:3F28o

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+4]
		push	word ptr [si+2]
		push	si
		push	cs
		call	near ptr CachedObject_AllocateAndInit_2D777
		add	sp, 6
		pop	si
		pop	bp
		retf
sub_2D7AD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CachedObject_BuildComposite_5E00C (sub_5E00C de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 85 lignes, NON DÉTAILLÉE — combine Memory_TypedAllocDispatchB_5C832 ×3,
; CachedObject_BuildAndTransform_5DEC9, sub_62BFE. Référencée par sub_67F8A.
; ==============================================================================================
CachedObject_BuildComposite_2D7C5	proc far		; CODE XREF: TextScrollDisplayB_UpdateObjectState_3F7AE+41P
					; DATA XREF: dseg:3F2Co

var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	0
		mov	al, [si+14h]
		push	ax
		push	large dword ptr	[si+10h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_2D812
		push	si
		push	cs
		call	near ptr CachedObject_BuildAndTransform_2D682
		pop	cx
		push	0
		mov	al, [si+14h]
		push	ax
		push	large dword ptr	[si+10h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_2D812:				; CODE XREF: CachedObject_BuildComposite_2D7C5+2Aj
		cmp	[bp+var_4], 0
		jz	short loc_2D855
		push	word ptr [si+1Ah]
		push	0
		mov	al, [si+0Ah]
		push	ax
		push	large dword ptr	[si+6]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [si+4]
		push	word ptr [si+2]
		push	large [bp+var_4]
		push	word_46F44
		call	Render_DrawOrMeasureTextVariantB_33984
		add	sp, 10h
		mov	ax, [si+2]
		mov	[si+1Ch], ax
		mov	ax, [si+4]
		mov	[si+1Eh], ax

loc_2D855:				; CODE XREF: CachedObject_BuildComposite_2D7C5+52j
		pop	si
		leave
		retf
CachedObject_BuildComposite_2D7C5	endp

; ���������������������������������������������������������������������������

loc_2D858:				; DATA XREF: dseg:3F30o
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+6]
		push	word ptr [si+4]
		push	word ptr [si+2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	ax, [bp+8]
		mov	[bp-2],	ax
		mov	ax, [bp+0Ah]
		mov	[bp-4],	ax
		mov	ax, [bp-2]
		add	[si+2],	ax
		mov	ax, [bp-4]
		add	[si+4],	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		pop	cx
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_2D899:				; DATA XREF: dseg:3F38o
		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	si, [bp+6]
		push	word ptr [si+4]
		push	word ptr [si+2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	ax, [bp+0Ah]
		mov	[bp-2],	ax
		mov	ax, [bp+0Ch]
		mov	[bp-4],	ax
		mov	ax, [bp-2]
		add	[si+2],	ax
		mov	ax, [bp-4]
		add	[si+4],	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		pop	cx
		mov	ax, [bp+8]
		mov	[bp-6],	ax
		mov	[si+1Ah], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CachedObject_BuildVariant_5E12A (sub_5E12A de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine Memory_TypedAllocDispatchB_5C832 ×2 et sub_625E2. Référencée par sub_67FF8.
; ==============================================================================================
CachedObject_BuildVariant_2D8E3	proc far		; CODE XREF: TextScrollDisplayB_UpdateObjectStateB_3F81C+2FP
					; DATA XREF: dseg:3F40o

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	0
		mov	al, [si+14h]
		push	ax
		push	large dword ptr	[si+10h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jz	short loc_2D93F
		push	word ptr [si+1Ah]
		push	0
		mov	al, [si+0Ah]
		push	ax
		push	large dword ptr	[si+6]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	large [bp+var_4]
		push	word_46F44
		call	Render_DrawOrMeasureTextVariant_33368
		add	sp, 10h

loc_2D93F:				; CODE XREF: CachedObject_BuildVariant_2D8E3+2Aj
		pop	si
		leave
		retf
CachedObject_BuildVariant_2D8E3	endp

; ���������������������������������������������������������������������������

loc_2D942:				; DATA XREF: dseg:3F3Co
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+6]
		push	word ptr [si+4]
		push	word ptr [si+2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	ax, [bp+8]
		mov	[bp-2],	ax
		mov	ax, [bp+0Ah]
		mov	[bp-4],	ax
		mov	ax, [bp-2]
		mov	[si+2],	ax
		mov	ax, [bp-4]
		mov	[si+4],	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		pop	cx
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_2D983:				; DATA XREF: dseg:3F44o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		cmp	byte ptr [si+15h], 0
		jz	short loc_2D9B0
		cmp	dword ptr [si+10h], 0
		jz	short loc_2D9B0
		push	0
		mov	al, [si+14h]
		push	ax
		mov	ax, si
		add	ax, 10h
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_2D9B0:				; CODE XREF: seg083:078Ej seg083:0795j
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		pop	si
		pop	bp
		retf
seg083		ends

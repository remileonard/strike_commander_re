seg093		segment	byte public 'CODE' use16
		assume cs:seg093
		;org 0Ch
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, SOMME DES RÉSISTANCES (octet +0) de tous les composants de dégâts (liste SYSM : +0 far
; ptr tableau, +4 nombre). Enregistrement SYSM de 20 o (DamageSys_LoadRecord_9CBE0) : +0 uint8
; résistance (points), +1 uint8 dégâts subis, +2 nom (chaîne, ≤ 9 o, ex. RUDDER), +0x0B second
; nom (chaîne, ≤ 9 o, rôle non établi). Ex-Roster_* : ce n'est PAS un roster de pilotes.
; ==============================================================================================
DamageSys_SumMaxPoints_43CDC	proc far		; CODE XREF: AI_EjectDecision_50FF+53P AI_ComputeMorale_CD4A+3FP ...

var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp

loc_43CDD:				; DATA XREF: seg216:03AEo
		mov	bp, sp
		sub	sp, 4
		xor	dx, dx
		les	bx, [bp+arg_0]
		mov	eax, es:[bx]
		mov	[bp+var_4], eax
		xor	cx, cx
		jmp	short loc_43D02
; ���������������������������������������������������������������������������

loc_43CF3:				; CODE XREF: DamageSys_SumMaxPoints_43CDC+2Dj
		les	bx, [bp+var_4]
		mov	al, es:[bx]
		mov	ah, 0
		add	dx, ax
		inc	cx
		add	word ptr [bp+var_4], 14h

loc_43D02:				; CODE XREF: DamageSys_SumMaxPoints_43CDC+15j
		les	bx, [bp+arg_0]
		cmp	es:[bx+4], cx
		jg	short loc_43CF3
		mov	ax, dx
		leave
		retf
DamageSys_SumMaxPoints_43CDC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, SOMME DES DÉGÂTS SUBIS (octet +1) de tous les composants de dégâts. Enregistrement SYSM
; de 20 o (DamageSys_LoadRecord_9CBE0) : +0 uint8 résistance (points), +1 uint8 dégâts subis,
; +2 nom (chaîne, ≤ 9 o, ex. RUDDER), +0x0B second nom (chaîne, ≤ 9 o, rôle non établi). Ex-
; Roster_* : ce n'est PAS un roster de pilotes.
; ==============================================================================================
DamageSys_SumDamage_43D0F	proc far		; CODE XREF: AI_EjectDecision_50FF+3DP seg004:2023P ...

var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		xor	dx, dx
		les	bx, [bp+arg_0]
		mov	eax, es:[bx]
		mov	[bp+var_4], eax
		xor	cx, cx
		jmp	short loc_43D36
; ���������������������������������������������������������������������������

loc_43D26:				; CODE XREF: DamageSys_SumDamage_43D0F+2Ej
		les	bx, [bp+var_4]
		mov	al, es:[bx+1]
		mov	ah, 0
		add	dx, ax
		inc	cx
		add	word ptr [bp+var_4], 14h

loc_43D36:				; CODE XREF: DamageSys_SumDamage_43D0F+15j
		les	bx, [bp+arg_0]
		cmp	es:[bx+4], cx
		jg	short loc_43D26
		mov	ax, dx
		leave
		retf
DamageSys_SumDamage_43D0F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LE COMPOSANT NOMMÉ EST-IL TOUCHÉ ? Parcourt la liste (pas de 14h), compare le nom +2
; (CRT_MemFamily_Extra4) et renvoie 1 si ses dégâts (+1) > 0. Enregistrement SYSM de 20 o
; (DamageSys_LoadRecord_9CBE0) : +0 uint8 résistance (points), +1 uint8 dégâts subis, +2 nom
; (chaîne, ≤ 9 o, ex. RUDDER), +0x0B second nom (chaîne, ≤ 9 o, rôle non établi). Ex-Roster_*
; : ce n'est PAS un roster de pilotes.
; ==============================================================================================
DamageSys_IsDamaged_43D43	proc far		; CODE XREF: seg016:0045P seg016:04CEP ...

var_6		= dword	ptr -6
var_1		= byte ptr -1
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	[bp+var_1], 0
		les	bx, [bp+arg_0]
		mov	eax, es:[bx]
		mov	[bp+var_6], eax
		xor	si, si
		jmp	short loc_43D8C
; ���������������������������������������������������������������������������

loc_43D5D:				; CODE XREF: DamageSys_IsDamaged_43D43+50j
		push	large [bp+arg_4]
		mov	ax, word ptr [bp+var_6]
		add	ax, 2
		push	word ptr [bp+var_6+2]
		push	ax
		call	CRT_MemFamily_Extra4
		add	sp, 8
		or	ax, ax
		jnz	short loc_43D87
		les	bx, [bp+var_6]
		cmp	byte ptr es:[bx+1], 0
		jbe	short loc_43D87
		mov	[bp+var_1], 1
		jmp	short loc_43D95
; ���������������������������������������������������������������������������

loc_43D87:				; CODE XREF: DamageSys_IsDamaged_43D43+32j
					; DamageSys_IsDamaged_43D43+3Cj
		inc	si
		add	word ptr [bp+var_6], 14h

loc_43D8C:				; CODE XREF: DamageSys_IsDamaged_43D43+18j
		les	bx, [bp+arg_0]
		cmp	es:[bx+4], si
		jg	short loc_43D5D

loc_43D95:				; CODE XREF: DamageSys_IsDamaged_43D43+42j
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
DamageSys_IsDamaged_43D43	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, recherche par nom puis compare dégâts subis (+1) et résistance (+0) du composant (sens
; exact du test non vérifié : détruit ?). Enregistrement SYSM de 20 o
; (DamageSys_LoadRecord_9CBE0) : +0 uint8 résistance (points), +1 uint8 dégâts subis, +2 nom
; (chaîne, ≤ 9 o, ex. RUDDER), +0x0B second nom (chaîne, ≤ 9 o, rôle non établi). Ex-Roster_*
; : ce n'est PAS un roster de pilotes.
; ==============================================================================================
DamageSys_CompareDamageToMax_43D9B	proc far		; CODE XREF: seg034:057DP seg103:2C1BP ...

var_6		= dword	ptr -6
var_1		= byte ptr -1
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	[bp+var_1], 1
		les	bx, [bp+arg_0]
		mov	eax, es:[bx]
		mov	[bp+var_6], eax
		xor	si, si
		jmp	short loc_43DE6
; ���������������������������������������������������������������������������

loc_43DB5:				; CODE XREF: DamageSys_CompareDamageToMax_43D9B+52j
		push	large [bp+arg_4]
		mov	ax, word ptr [bp+var_6]
		add	ax, 2
		push	word ptr [bp+var_6+2]
		push	ax
		call	CRT_MemFamily_Extra4
		add	sp, 8
		or	ax, ax
		jnz	short loc_43DE1
		les	bx, [bp+var_6]
		mov	al, es:[bx+1]
		cmp	al, es:[bx]
		jnb	short loc_43DE1
		mov	[bp+var_1], 0
		jmp	short loc_43DEF
; ���������������������������������������������������������������������������

loc_43DE1:				; CODE XREF: DamageSys_CompareDamageToMax_43D9B+32j
					; DamageSys_CompareDamageToMax_43D9B+3Ej
		inc	si
		add	word ptr [bp+var_6], 14h

loc_43DE6:				; CODE XREF: DamageSys_CompareDamageToMax_43D9B+18j
		les	bx, [bp+arg_0]
		cmp	es:[bx+4], si
		jg	short loc_43DB5

loc_43DEF:				; CODE XREF: DamageSys_CompareDamageToMax_43D9B+44j
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
DamageSys_CompareDamageToMax_43D9B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, DÉGÂTS SUBIS (+1) du composant nommé (somme bornée à 8 bits). Utilisé par
; JDYN_UpdateDamageGains_494DD : gain = (résistance − dégâts) / résistance. Enregistrement
; SYSM de 20 o (DamageSys_LoadRecord_9CBE0) : +0 uint8 résistance (points), +1 uint8 dégâts
; subis, +2 nom (chaîne, ≤ 9 o, ex. RUDDER), +0x0B second nom (chaîne, ≤ 9 o, rôle non
; établi). Ex-Roster_* : ce n'est PAS un roster de pilotes.
; ==============================================================================================
DamageSys_DamageOf_43DF5	proc far		; CODE XREF: seg103:15B3P seg103:1636P ...

var_6		= dword	ptr -6
var_1		= byte ptr -1
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	[bp+var_1], 0
		les	bx, [bp+arg_0]
		mov	eax, es:[bx]
		mov	[bp+var_6], eax
		xor	si, si
		jmp	short loc_43E38
; ���������������������������������������������������������������������������

loc_43E0F:				; CODE XREF: DamageSys_DamageOf_43DF5+4Aj
		push	large [bp+arg_4]
		mov	ax, word ptr [bp+var_6]
		add	ax, 2
		push	word ptr [bp+var_6+2]
		push	ax
		call	CRT_MemFamily_Extra4
		add	sp, 8
		or	ax, ax
		jnz	short loc_43E33
		les	bx, [bp+var_6]
		mov	al, es:[bx+1]
		add	[bp+var_1], al

loc_43E33:				; CODE XREF: DamageSys_DamageOf_43DF5+32j
		inc	si
		add	word ptr [bp+var_6], 14h

loc_43E38:				; CODE XREF: DamageSys_DamageOf_43DF5+18j
		les	bx, [bp+arg_0]
		cmp	es:[bx+4], si
		jg	short loc_43E0F
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
DamageSys_DamageOf_43DF5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, RÉSISTANCE (+0) du composant nommé. Enregistrement SYSM de 20 o
; (DamageSys_LoadRecord_9CBE0) : +0 uint8 résistance (points), +1 uint8 dégâts subis, +2 nom
; (chaîne, ≤ 9 o, ex. RUDDER), +0x0B second nom (chaîne, ≤ 9 o, rôle non établi). Ex-Roster_*
; : ce n'est PAS un roster de pilotes.
; ==============================================================================================
DamageSys_MaxPointsOf_43E47	proc far		; CODE XREF: seg103:1591P seg103:1614P ...

var_6		= dword	ptr -6
var_1		= byte ptr -1
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	[bp+var_1], 0
		les	bx, [bp+arg_0]
		mov	eax, es:[bx]
		mov	[bp+var_6], eax
		xor	si, si
		jmp	short loc_43E89
; ���������������������������������������������������������������������������

loc_43E61:				; CODE XREF: DamageSys_MaxPointsOf_43E47:loc_43E90j
		push	large [bp+arg_4]
		mov	ax, word ptr [bp+var_6]
		add	ax, 2
		push	word ptr [bp+var_6+2]
		push	ax
		call	CRT_MemFamily_Extra4
		add	sp, 8
		or	ax, ax
		jnz	short loc_43E84
		les	bx, [bp+var_6]
		mov	al, es:[bx]
		add	[bp+var_1], al

loc_43E84:				; CODE XREF: DamageSys_MaxPointsOf_43E47+32j
		inc	si
		add	word ptr [bp+var_6], 14h

loc_43E89:				; CODE XREF: DamageSys_MaxPointsOf_43E47+18j
		les	bx, [bp+arg_0]
		cmp	es:[bx+4], si

loc_43E90:
		jg	short loc_43E61

loc_43E92:
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
DamageSys_MaxPointsOf_43E47	endp

seg093		ends

seg093		segment	byte public 'CODE' use16
		assume cs:seg093
		;org 0Ch
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,34L — parcourt une table d'entrées de 20 octets et somme un champ (offset+0) : somme
; d'un attribut sur une liste de pilotes/entrées de roster.
; ==============================================================================================
Roster_SumAttributeA	proc far		; CODE XREF: AI_MissileThreatTrigger_A+53P Radio_SelectContextMessage+3FP ...

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

loc_43CF3:				; CODE XREF: Roster_SumAttributeA+2Dj
		les	bx, [bp+var_4]
		mov	al, es:[bx]
		mov	ah, 0
		add	dx, ax
		inc	cx
		add	word ptr [bp+var_4], 14h

loc_43D02:				; CODE XREF: Roster_SumAttributeA+15j
		les	bx, [bp+arg_0]
		cmp	es:[bx+4], cx
		jg	short loc_43CF3
		mov	ax, dx
		leave
		retf
Roster_SumAttributeA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,32L — variante de sub_43CDC sommant le champ offset+1 : somme d'un second attribut de
; roster (probable score/kills).
; ==============================================================================================
Roster_SumAttributeB	proc far		; CODE XREF: AI_MissileThreatTrigger_A+3DP seg004:2023P ...

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

loc_43D26:				; CODE XREF: Roster_SumAttributeB+2Ej
		les	bx, [bp+var_4]
		mov	al, es:[bx+1]
		mov	ah, 0
		add	dx, ax
		inc	cx
		add	word ptr [bp+var_4], 14h

loc_43D36:				; CODE XREF: Roster_SumAttributeB+15j
		les	bx, [bp+arg_0]
		cmp	es:[bx+4], cx
		jg	short loc_43D26
		mov	ax, dx
		leave
		retf
Roster_SumAttributeB	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,52L — parcourt une liste de 20 octets/entrée, compare un nom (sub_2DC4=strcmp) puis
; teste un flag (offset+1 > 0) : recherche d'un pilote par nom avec test d'un attribut
; (probable statut actif).
; ==============================================================================================
Roster_FindByNameAndFlag	proc far		; CODE XREF: seg016:0045P seg016:04CEP ...

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

loc_43D5D:				; CODE XREF: Roster_FindByNameAndFlag+50j
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

loc_43D87:				; CODE XREF: Roster_FindByNameAndFlag+32j
					; Roster_FindByNameAndFlag+3Cj
		inc	si
		add	word ptr [bp+var_6], 14h

loc_43D8C:				; CODE XREF: Roster_FindByNameAndFlag+18j
		les	bx, [bp+arg_0]
		cmp	es:[bx+4], si
		jg	short loc_43D5D

loc_43D95:				; CODE XREF: Roster_FindByNameAndFlag+42j
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
Roster_FindByNameAndFlag	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,53L — variante comparant deux champs (offset+1 vs offset+0, ordre) : recherche par nom
; avec test d'ordre de deux attributs (probable rang/ancienneté).
; ==============================================================================================
Roster_FindByNameOrder	proc far		; CODE XREF: seg034:057DP seg103:2C1BP ...

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

loc_43DB5:				; CODE XREF: Roster_FindByNameOrder+52j
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

loc_43DE1:				; CODE XREF: Roster_FindByNameOrder+32j
					; Roster_FindByNameOrder+3Ej
		inc	si
		add	word ptr [bp+var_6], 14h

loc_43DE6:				; CODE XREF: Roster_FindByNameOrder+18j
		les	bx, [bp+arg_0]
		cmp	es:[bx+4], si
		jg	short loc_43DB5

loc_43DEF:				; CODE XREF: Roster_FindByNameOrder+44j
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
Roster_FindByNameOrder	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,46L — recherche par nom (sub_2DC4) puis somme le champ+1 (avec accumulateur borné 8-bit)
; : somme d'un attribut du pilote trouvé (probable total de victoires).
; ==============================================================================================
Roster_SumFoundAttributeA	proc far		; CODE XREF: seg103:15B3P seg103:1636P ...

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

loc_43E0F:				; CODE XREF: Roster_SumFoundAttributeA+4Aj
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

loc_43E33:				; CODE XREF: Roster_SumFoundAttributeA+32j
		inc	si
		add	word ptr [bp+var_6], 14h

loc_43E38:				; CODE XREF: Roster_SumFoundAttributeA+18j
		les	bx, [bp+arg_0]
		cmp	es:[bx+4], si
		jg	short loc_43E0F
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
Roster_SumFoundAttributeA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,50L — variante sommant le champ+0 : somme d'un second attribut du pilote trouvé.
; ==============================================================================================
Roster_SumFoundAttributeB	proc far		; CODE XREF: seg103:1591P seg103:1614P ...

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

loc_43E61:				; CODE XREF: Roster_SumFoundAttributeB:loc_43E90j
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

loc_43E84:				; CODE XREF: Roster_SumFoundAttributeB+32j
		inc	si
		add	word ptr [bp+var_6], 14h

loc_43E89:				; CODE XREF: Roster_SumFoundAttributeB+18j
		les	bx, [bp+arg_0]
		cmp	es:[bx+4], si

loc_43E90:
		jg	short loc_43E61

loc_43E92:
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
Roster_SumFoundAttributeB	endp

seg093		ends

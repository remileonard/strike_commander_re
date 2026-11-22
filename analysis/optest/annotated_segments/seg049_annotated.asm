seg049		segment	byte public 'CODE' use16
		assume cs:seg049
		;org 0Ch
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1FD9C	proc far		; CODE XREF: sub_1220C+35P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0
		jnz	short loc_1FDB9
		push	329Ch
		push	si
		nop
		push	cs
		call	near ptr sub_1FFCC
		add	sp, 4
		mov	[si+2],	ax
		mov	[si], ax

loc_1FDB9:				; CODE XREF: sub_1FD9C+Aj
		pop	si
		pop	bp
		retf
sub_1FD9C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Container_Construct (sub_21E90 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,28L — constructeur
; d'une liste chaînée vide (tête/queue à 0, type 0x1104) : constructeur de conteneur liste
; générique (template C++).
; ==============================================================================================
Container_Construct	proc far		; CODE XREF: sub_1FE2E+1Dp

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		xor	ax, ax
		mov	[si+2],	ax
		mov	[si], ax
		push	329Ch
		push	si
		nop
		push	cs
		call	near ptr sub_1FFCC
		add	sp, 4
		mov	[si+2],	ax
		mov	[si], ax
		pop	si
		pop	bp
		retf
Container_Construct	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Container_ConstructTyped (sub_21EB2 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far,24L — variante de sub_21E90 avec type paramétrable :
; constructeur de conteneur liste générique (variante paramétrée).
; ==============================================================================================
Container_ConstructTyped	proc far		; CODE XREF: seg049:0090p

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		xor	ax, ax
		mov	[si+2],	ax
		mov	[si], ax
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr sub_1FFCC
		add	sp, 4
		mov	[si+2],	ax
		mov	[si], ax
		pop	si
		pop	bp
		retf
Container_ConstructTyped	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		or	si, si
		jnz	short loc_1FE1B
		push	0Ah
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_1FE26

loc_1FE1B:				; CODE XREF: seg049:0079j
		push	word ptr [bp+8]
		push	si
		push	cs
		call	near ptr Container_ConstructTyped
		add	sp, 4

loc_1FE26:				; CODE XREF: seg049:0089j
		mov	ax, si
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1FE2E	proc far		; CODE XREF: seg055:085DP

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_1FE49
		push	0Ah
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_1FE51

loc_1FE49:				; CODE XREF: sub_1FE2E+9j
		push	si
		push	cs
		call	near ptr Container_Construct
		add	sp, 2

loc_1FE51:				; CODE XREF: sub_1FE2E+19j
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_1FE2E	endp

; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1FE59	proc far		; CODE XREF: seg055:0949P

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_1FE80
		push	si
		nop
		push	cs
		call	near ptr sub_2036D
		add	sp, 2
		test	di, 1
		jz	short loc_1FE80
		push	si
		call	sub_308
		add	sp, 2

loc_1FE80:				; CODE XREF: sub_1FE59+Dj
					; sub_1FE59+1Cj
		pop	di
		pop	si
		pop	bp
		retf
sub_1FE59	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+6]
		xor	di, di
		push	word ptr [bp+8]
		push	si
		nop
		push	cs
		call	near ptr sub_1FFCC
		add	sp, 4
		mov	[bp-2],	ax
		cmp	word ptr [bp-2], 0
		jz	short loc_1FED9
		mov	ax, [bp-2]
		mov	[bp-4],	ax
		mov	ax, [bp+0Ah]
		mov	[bp-6],	ax
		mov	word ptr [bp-8], 0
		cmp	word ptr [bp-4], 0
		jz	short loc_1FED6
		cmp	word ptr [bp-6], 0
		jz	short loc_1FED6
		push	word ptr [bp-6]
		push	word ptr [bp-4]
		nop
		push	cs
		call	near ptr List_AppendTail_20D45
		add	sp, 4
		mov	[bp-8],	ax
		jmp	short $+2

loc_1FED6:				; CODE XREF: seg049:012Bj seg049:0131j
		mov	di, [bp-8]

loc_1FED9:				; CODE XREF: seg049:0114j
		or	di, di
		jz	short loc_1FEE3
		mov	al, 1
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_1FEE3:				; CODE XREF: seg049:014Bj
		mov	al, 0
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1FEED	proc far		; CODE XREF: sub_1220C+20EP
					; seg026:1537P	...

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [si]
		mov	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		mov	[bp+var_6], 0
		or	di, di
		jz	short loc_1FF20
		cmp	[bp+var_4], 0
		jz	short loc_1FF20
		push	[bp+var_4]
		push	di
		nop
		push	cs
		call	near ptr List_AppendTail_20D45
		add	sp, 4
		mov	[bp+var_6], ax
		jmp	short $+2

loc_1FF20:				; CODE XREF: sub_1FEED+1Aj
					; sub_1FEED+20j
		mov	ax, [bp+var_6]
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0
		jz	short loc_1FF32
		mov	al, 1
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_1FF32:				; CODE XREF: sub_1FEED+3Dj
		mov	al, 0
		pop	di
		pop	si
		leave
		retf
sub_1FEED	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Container_UnlinkNode
; (sub_21FC6 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far,36L — retire un nœud (di) de la liste chaînée (mise à jour tête/queue/liens) :
; unlink de nœud dans le conteneur liste (opération interne).
; ==============================================================================================
Container_UnlinkNode	proc far		; CODE XREF: sub_20326+25p

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	di, [bp+arg_4]
		cmp	[si], di
		jnz	short loc_1FF53
		mov	ax, [di+9]
		mov	[si], ax

loc_1FF53:				; CODE XREF: Container_UnlinkNode+10j
		cmp	[si+2],	di
		jnz	short loc_1FF5B
		mov	[si+2],	dx

loc_1FF5B:				; CODE XREF: Container_UnlinkNode+1Aj
		or	dx, dx
		jz	short loc_1FF67
		mov	ax, [di+9]
		mov	bx, dx
		mov	[bx+9],	ax

loc_1FF67:				; CODE XREF: Container_UnlinkNode+21j
		pop	di
		pop	si
		pop	bp
		retf
Container_UnlinkNode	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Container_FindAndRemove (sub_21FF5 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,29L — recherche
; (sub_22555) puis retire (sub_2235C) une entrée par clé : suppression d'une entrée du
; conteneur par clé (find+remove).
; ==============================================================================================
Container_FindAndRemove	proc far		; CODE XREF: seg049:0212p

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr sub_20554
		add	sp, 4
		mov	di, ax
		push	di
		push	si
		nop
		push	cs
		call	near ptr sub_20326
		add	sp, 4
		mov	ax, di
		pop	di
		pop	si
		pop	bp
		retf
Container_FindAndRemove	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		push	word ptr [bp+8]
		push	si
		push	cs
		call	near ptr Container_FindAndRemove
		add	sp, 4
		mov	di, ax
		or	di, di
		jz	short loc_1FFB9
		push	3
		push	di
		nop
		push	cs
		call	near ptr sub_20D1A
		add	sp, 4

loc_1FFB9:				; CODE XREF: seg049:021Cj
		or	di, di
		jz	short loc_1FFC2
		mov	ax, 1
		jmp	short loc_1FFC4
; ���������������������������������������������������������������������������

loc_1FFC2:				; CODE XREF: seg049:022Bj
		xor	ax, ax

loc_1FFC4:				; CODE XREF: seg049:0230j
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1FFCC	proc far		; CODE XREF: sub_1FD9C+12p
					; Container_Construct+14p ...

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr sub_20554
		add	sp, 4
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0
		jnz	short loc_20045
		mov	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		push	0Fh
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jz	short loc_2002E
		push	di
		call	sub_C7A3
		add	sp, 2
		push	8
		push	[bp+var_4]
		push	di
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	byte ptr [di+8], 0
		mov	word ptr [di+9], 0
		xor	ax, ax
		mov	[di+0Dh], ax
		mov	[di+0Bh], ax
		mov	ax, di
		jmp	short loc_20030
; ���������������������������������������������������������������������������

loc_2002E:				; CODE XREF: sub_1FFCC+34j
		mov	ax, di

loc_20030:				; CODE XREF: sub_1FFCC+60j
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0
		jz	short loc_20045
		push	[bp+var_2]
		push	si
		nop
		push	cs
		call	near ptr Container_Append
		add	sp, 4

loc_20045:				; CODE XREF: sub_1FFCC+1Ej
					; sub_1FFCC+6Bj
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
sub_1FFCC	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Container_Append
; (sub_220BF de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far,35L — insère un nœud en fin de liste (chaînage tête/queue) : append au conteneur
; liste.
; ==============================================================================================
Container_Append	proc far		; CODE XREF: sub_1FFCC+73p

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	di, di
		jz	short loc_2007C
		mov	word ptr [di+9], 0
		cmp	word ptr [si+2], 0
		jnz	short loc_20073
		mov	ax, di
		mov	[si+2],	ax
		mov	[si], ax
		jmp	short loc_2007C
; ���������������������������������������������������������������������������

loc_20073:				; CODE XREF: Container_Append+18j
		mov	bx, [si+2]
		mov	[bx+9],	di
		mov	[si+2],	di

loc_2007C:				; CODE XREF: Container_Append+Dj
					; Container_Append+21j
		pop	di
		pop	si
		pop	bp
		retf
Container_Append	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+6]
		xor	di, di
		mov	word ptr [bp-2], 0
		jmp	short loc_20095
; ���������������������������������������������������������������������������

loc_20094:				; CODE XREF: seg049:0314j
		inc	di

loc_20095:				; CODE XREF: seg049:0302j
		lea	ax, [bp-2]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_204D0
		add	sp, 4
		or	ax, ax
		jnz	short loc_20094
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		mov	word ptr [bp-2], 0
		jmp	short loc_200CE
; ���������������������������������������������������������������������������

loc_200C5:				; CODE XREF: seg049:034Dj
		mov	ax, di
		dec	di
		or	ax, ax
		jl	short loc_200CE
		jmp	short loc_200DF
; ���������������������������������������������������������������������������

loc_200CE:				; CODE XREF: seg049:0333j seg049:033Aj
		lea	ax, [bp-2]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_204D0
		add	sp, 4
		or	ax, ax
		jnz	short loc_200C5

loc_200DF:				; CODE XREF: seg049:033Cj
		mov	ax, [bp-2]
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_200EA	proc far		; CODE XREF: seg046:01B7P

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		push	word ptr [si]
		nop
		push	cs
		call	near ptr sub_20EA7
		add	sp, 4
		pop	si
		pop	bp
		retf
sub_200EA	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	word ptr [si]
		nop
		push	cs
		call	near ptr sub_20E68
		add	sp, 2
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_20115	proc far		; CODE XREF: sub_C3F07+13P

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_2], 0
		jmp	short loc_20142
; ���������������������������������������������������������������������������

loc_2012A:				; CODE XREF: sub_20115+4Aj
		mov	bx, [bp+var_2]
		cmp	byte ptr [bx+5], 1
		jnz	short loc_20142
		push	di
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx+1Ch]
		add	sp, 4

loc_20142:				; CODE XREF: sub_20115+13j
					; sub_20115+1Cj
		cmp	[bp+var_2], 0
		jnz	short loc_20152
		mov	bx, [si]
		mov	ax, [bx+0Bh]
		mov	[bp+var_2], ax
		jmp	short loc_2015B
; ���������������������������������������������������������������������������

loc_20152:				; CODE XREF: sub_20115+31j
		mov	bx, [bp+var_2]
		mov	ax, [bx+2]
		mov	[bp+var_2], ax

loc_2015B:				; CODE XREF: sub_20115+3Bj
		cmp	[bp+var_2], 0
		jnz	short loc_2012A
		pop	di
		pop	si
		leave
		retf
sub_20115	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_20165	proc far		; CODE XREF: sub_22487+279P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	word_462C5, 0
		xor	di, di
		jmp	short loc_20186
; ���������������������������������������������������������������������������

loc_20177:				; CODE XREF: sub_20165+24j
		mov	bx, di
		shl	bx, 2
		mov	dword ptr [bx+647Eh], 0
		inc	di

loc_20186:				; CODE XREF: sub_20165+10j
		cmp	di, 8
		jl	short loc_20177
		push	word ptr [si]
		nop
		push	cs
		call	near ptr sub_20199
		add	sp, 2
		pop	di
		pop	si
		pop	bp
		retf
sub_20165	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_20199	proc far		; CODE XREF: sub_20165+2Ap
					; sub_214D3+34P

var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= byte ptr -0Ch
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		mov	[bp+var_2], 0
		jmp	loc_202C1
; ���������������������������������������������������������������������������

loc_201AE:				; CODE XREF: sub_20199+145j
		inc	word_462C5
		call	sub_67A6
		shl	eax, 10h
		shrd	eax, edx, 10h
		mov	[bp+var_6], eax
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jnz	short loc_20238
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 2
		mov	word ptr [bp+var_14+2],	dx
		mov	word ptr [bp+var_14], ax
		cmp	[bp+var_14], 0
		jz	short loc_20238
		push	0
		push	[bp+var_2]
		push	word ptr [bp+var_14+2]
		push	word ptr [bp+var_14]
		les	bx, [bp+var_14]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 8
		or	al, al
		jz	short loc_20238
		push	[bp+var_2]
		push	di
		push	si
		nop
		push	cs
		call	near ptr Container_RemoveNode
		add	sp, 6
		cmp	[bp+var_2], 0
		jz	short loc_20232
		push	3
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 4
		jmp	short $+2

loc_20232:				; CODE XREF: sub_20199+85j
		mov	[bp+var_2], di
		jmp	loc_202C1
; ���������������������������������������������������������������������������

loc_20238:				; CODE XREF: sub_20199+3Dj
					; sub_20199+57j ...
		call	sub_67A6
		shl	eax, 10h
		shrd	eax, edx, 10h
		mov	[bp+var_A], eax
		mov	[bp+var_C], 0
		mov	eax, [bp+var_A]
		sub	eax, [bp+var_6]
		mov	[bp+var_10], eax
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 2
		or	ax, dx
		jz	short loc_2027C
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		add	sp, 2
		mov	[bp+var_C], al

loc_2027C:				; CODE XREF: sub_20199+D0j
		cmp	[bp+var_C], 6
		jnz	short loc_2028D
		mov	eax, [bp+var_10]
		add	dword_4949E, eax
		jmp	short loc_202BE
; ���������������������������������������������������������������������������

loc_2028D:				; CODE XREF: sub_20199+E7j
		cmp	[bp+var_C], 0Ch
		jz	short loc_20299
		cmp	[bp+var_C], 12h
		jnz	short loc_202A4

loc_20299:				; CODE XREF: sub_20199+F8j
		mov	eax, [bp+var_10]
		add	dword_494A2, eax
		jmp	short loc_202BE
; ���������������������������������������������������������������������������

loc_202A4:				; CODE XREF: sub_20199+FEj
		cmp	[bp+var_C], 0Bh
		jnz	short loc_202B5
		mov	eax, [bp+var_10]
		add	dword_494A6, eax
		jmp	short loc_202BE
; ���������������������������������������������������������������������������

loc_202B5:				; CODE XREF: sub_20199+10Fj
		mov	eax, [bp+var_10]
		add	dword_494AA, eax

loc_202BE:				; CODE XREF: sub_20199+F2j
					; sub_20199+109j ...
		mov	di, [bp+var_2]

loc_202C1:				; CODE XREF: sub_20199+12j
					; sub_20199+9Cj
		cmp	[bp+var_2], 0
		jnz	short loc_202CF
		mov	ax, [si+0Bh]
		mov	[bp+var_2], ax
		jmp	short loc_202D8
; ���������������������������������������������������������������������������

loc_202CF:				; CODE XREF: sub_20199+12Cj
		mov	bx, [bp+var_2]
		mov	ax, [bx+2]
		mov	[bp+var_2], ax

loc_202D8:				; CODE XREF: sub_20199+134j
		cmp	[bp+var_2], 0
		jz	short loc_202E1
		jmp	loc_201AE
; ���������������������������������������������������������������������������

loc_202E1:				; CODE XREF: sub_20199+143j
		pop	di
		pop	si
		leave
		retf
sub_20199	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_202E5	proc far		; CODE XREF: sub_22487+2A8P

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_20304
; ���������������������������������������������������������������������������

loc_202F6:				; CODE XREF: sub_202E5+3Cj
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx+14h]
		add	sp, 2

loc_20304:				; CODE XREF: sub_202E5+Fj
		cmp	[bp+var_2], 0
		jnz	short loc_20314
		mov	bx, [si]
		mov	ax, [bx+0Bh]
		mov	[bp+var_2], ax
		jmp	short loc_2031D
; ���������������������������������������������������������������������������

loc_20314:				; CODE XREF: sub_202E5+23j
		mov	bx, [bp+var_2]
		mov	ax, [bx+2]
		mov	[bp+var_2], ax

loc_2031D:				; CODE XREF: sub_202E5+2Dj
		cmp	[bp+var_2], 0
		jnz	short loc_202F6
		pop	si
		leave
		retf
sub_202E5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_20326	proc far		; CODE XREF: Container_FindAndRemove+1Ap

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	[bp+arg_2], 0
		jz	short loc_20363
		mov	di, [si]
		mov	[bp+var_2], 0
		jmp	short loc_2035F
; ���������������������������������������������������������������������������

loc_20340:				; CODE XREF: sub_20326+3Bj
		cmp	di, [bp+arg_2]
		jnz	short loc_20359
		push	di
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr Container_UnlinkNode
		add	sp, 6
		mov	al, 1
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		jmp	short loc_2035F
; ���������������������������������������������������������������������������

loc_20359:				; CODE XREF: sub_20326+1Dj
		mov	[bp+var_2], di
		mov	di, [di+9]

loc_2035F:				; CODE XREF: sub_20326+18j
					; sub_20326+31j
		or	di, di
		jnz	short loc_20340

loc_20363:				; CODE XREF: sub_20326+Fj
		mov	al, 0
		pop	di
		pop	si
		leave
		retf
sub_20326	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_2036D	proc far		; CODE XREF: sub_1FE59+12p
					; sub_C39F6+39P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		jmp	short loc_2038A
; ���������������������������������������������������������������������������

loc_20377:				; CODE XREF: sub_2036D+20j
		mov	bx, [si]
		mov	di, [bx+9]
		push	3
		push	word ptr [si]
		nop
		push	cs
		call	near ptr sub_20D1A
		add	sp, 4
		mov	[si], di

loc_2038A:				; CODE XREF: sub_2036D+8j
		cmp	word ptr [si], 0
		jnz	short loc_20377
		xor	ax, ax
		mov	[si+2],	ax
		mov	[si], ax
		pop	di
		pop	si
		pop	bp
		retf
sub_2036D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_2039A	proc far		; CODE XREF: seg026:143DP seg026:15A3P ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [si]
		jmp	short loc_203BF
; ���������������������������������������������������������������������������

loc_203A6:				; CODE XREF: sub_2039A+27j
		push	[bp+arg_2]
		push	di
		nop
		push	cs
		call	near ptr sub_20F26
		add	sp, 4
		or	al, al
		jz	short loc_203BC
		mov	al, 1
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_203BC:				; CODE XREF: sub_2039A+1Aj
		mov	di, [di+9]

loc_203BF:				; CODE XREF: sub_2039A+Aj
		or	di, di
		jnz	short loc_203A6
		mov	al, 0
		pop	di
		pop	si
		pop	bp
		retf
sub_2039A	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_203CD	proc far		; CODE XREF: sub_C2596+6FP

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [si]
		jmp	short loc_203F2
; ���������������������������������������������������������������������������

loc_203D9:				; CODE XREF: sub_203CD+27j
		push	[bp+arg_2]
		push	di
		nop
		push	cs
		call	near ptr sub_21043
		add	sp, 4
		or	al, al
		jz	short loc_203EF
		mov	al, 1
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_203EF:				; CODE XREF: sub_203CD+1Aj
		mov	di, [di+9]

loc_203F2:				; CODE XREF: sub_203CD+Aj
		or	di, di
		jnz	short loc_203D9
		mov	al, 0
		pop	di
		pop	si
		pop	bp
		retf
sub_203CD	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		mov	si, [bp+6]
		mov	eax, [bp+8]
		mov	[bp-0Eh], eax
		push	8
		push	word ptr [bp-0Ch]
		push	word ptr [bp-0Eh]
		push	ss
		lea	ax, [bp-0Ah]
		push	ax
		call	CRT_MemFamily_Extra8
		add	sp, 0Ah
		mov	byte ptr [bp-2], 0
		mov	word ptr [bp-10h], 0
		jmp	short loc_20463
; ���������������������������������������������������������������������������

loc_20432:				; CODE XREF: seg049:06E2j
		mov	bx, [bp-10h]
		mov	eax, [bx+6]
		mov	[bp-14h], eax
		push	8
		push	word ptr [bp-12h]
		push	word ptr [bp-14h]
		push	ss
		lea	ax, [bp-0Ah]
		push	ax
		call	CRT_MemFamily_Extra7
		add	sp, 0Ah
		or	ax, ax
		jnz	short loc_2045B
		mov	ax, 1
		jmp	short loc_2045D
; ���������������������������������������������������������������������������

loc_2045B:				; CODE XREF: seg049:06C4j
		xor	ax, ax

loc_2045D:				; CODE XREF: seg049:06C9j
		or	al, al
		jz	short loc_20463
		jmp	short loc_20474
; ���������������������������������������������������������������������������

loc_20463:				; CODE XREF: seg049:06A0j seg049:06CFj
		lea	ax, [bp-10h]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_204D0
		add	sp, 4
		or	ax, ax
		jnz	short loc_20432

loc_20474:				; CODE XREF: seg049:06D1j
		mov	ax, [bp-10h]
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		push	word ptr [bp+8]
		push	si
		nop
		push	cs
		call	near ptr sub_20554
		add	sp, 4
		mov	[si+4],	ax
		cmp	word ptr [si+4], 0
		jz	short loc_204C1
		mov	di, [bp+0Ah]
		cmp	word ptr [di], 0
		jnz	short loc_204AC
		mov	bx, [si+4]
		mov	ax, [bx+0Bh]
		mov	[di], ax
		jmp	short loc_204B3
; ���������������������������������������������������������������������������

loc_204AC:				; CODE XREF: seg049:0710j
		mov	bx, [di]
		mov	ax, [bx+2]
		mov	[di], ax

loc_204B3:				; CODE XREF: seg049:071Aj
		cmp	word ptr [di], 0
		jz	short loc_204C1
		mov	bx, [bp+0Ah]
		mov	ax, [bx]
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_204C1:				; CODE XREF: seg049:0708j seg049:0726j
		mov	bx, [bp+0Ah]
		xor	ax, ax
		mov	[bx], ax
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_204D0	proc far		; CODE XREF: sub_8867+206P
					; seg049:030Cp	...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word ptr [di], 0
		jnz	short loc_204EF
		mov	ax, [si]
		mov	[si+4],	ax
		xor	ax, ax
		mov	[si+8],	ax
		mov	[si+6],	ax
		jmp	short loc_2050E
; ���������������������������������������������������������������������������

loc_204EF:				; CODE XREF: sub_204D0+Ej
		mov	ax, [di]
		mov	[si+8],	ax
		push	word ptr [si+8]
		push	si
		nop
		push	cs
		call	near ptr sub_20597
		add	sp, 4
		mov	[si+4],	ax
		cmp	word ptr [si+4], 0
		jnz	short loc_2050E
		mov	word ptr [si+8], 0

loc_2050E:				; CODE XREF: sub_204D0+1Dj
					; sub_204D0+37j
		jmp	short loc_20541
; ���������������������������������������������������������������������������

loc_20510:				; CODE XREF: sub_204D0+75j
		cmp	word ptr [si+8], 0
		jnz	short loc_20521
		mov	bx, [si+4]
		mov	ax, [bx+0Bh]
		mov	[si+8],	ax
		jmp	short loc_20530
; ���������������������������������������������������������������������������

loc_20521:				; CODE XREF: sub_204D0+44j
		mov	ax, [si+8]
		mov	[si+6],	ax
		mov	bx, [si+8]
		mov	ax, [bx+2]
		mov	[si+8],	ax

loc_20530:				; CODE XREF: sub_204D0+4Fj
		cmp	word ptr [si+8], 0
		jz	short loc_20538
		jmp	short loc_20547
; ���������������������������������������������������������������������������

loc_20538:				; CODE XREF: sub_204D0+64j
		mov	bx, [si+4]
		mov	ax, [bx+9]
		mov	[si+4],	ax

loc_20541:				; CODE XREF: sub_204D0:loc_2050Ej
		cmp	word ptr [si+4], 0
		jnz	short loc_20510

loc_20547:				; CODE XREF: sub_204D0+66j
		mov	ax, [si+8]
		mov	[di], ax
		pop	di
		pop	si
		pop	bp
		retf
sub_204D0	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_20554	proc far		; CODE XREF: Container_FindAndRemove+Ep
					; sub_1FFCC+11p ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	di, [si]
		jmp	short loc_20589
; ���������������������������������������������������������������������������

loc_20563:				; CODE XREF: sub_20554+37j
		mov	eax, [di]
		mov	bx, dx
		cmp	eax, [bx]
		jnz	short loc_2057E
		mov	eax, [di+4]
		mov	bx, dx
		cmp	eax, [bx+4]
		jnz	short loc_2057E
		mov	ax, 1
		jmp	short loc_20580
; ���������������������������������������������������������������������������

loc_2057E:				; CODE XREF: sub_20554+17j
					; sub_20554+23j
		xor	ax, ax

loc_20580:				; CODE XREF: sub_20554+28j
		or	al, al
		jz	short loc_20586
		jmp	short loc_2058D
; ���������������������������������������������������������������������������

loc_20586:				; CODE XREF: sub_20554+2Ej
		mov	di, [di+9]

loc_20589:				; CODE XREF: sub_20554+Dj
		or	di, di
		jnz	short loc_20563

loc_2058D:				; CODE XREF: sub_20554+30j
		mov	ax, di
		pop	di
		pop	si
		pop	bp
		retf
sub_20554	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_20597	proc far		; CODE XREF: sub_204D0+2Ap

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	cx, [bp+arg_2]
		xor	di, di
		mov	dx, [si]
		or	cx, cx
		jnz	short loc_205B0
		mov	ax, dx
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_205B0:				; CODE XREF: sub_20597+11j
		jmp	short loc_205D5
; ���������������������������������������������������������������������������

loc_205B2:				; CODE XREF: sub_20597+40j
		or	di, di
		jnz	short loc_205BD
		mov	bx, dx
		mov	di, [bx+0Bh]
		jmp	short loc_205CC
; ���������������������������������������������������������������������������

loc_205BD:				; CODE XREF: sub_20597+1Dj
		cmp	di, cx
		jnz	short loc_205C9
		mov	ax, dx
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		jmp	short loc_205CC
; ���������������������������������������������������������������������������

loc_205C9:				; CODE XREF: sub_20597+28j
		mov	di, [di+2]

loc_205CC:				; CODE XREF: sub_20597+24j
					; sub_20597+30j
		or	di, di
		jnz	short loc_205D5
		mov	bx, dx
		mov	dx, [bx+9]

loc_205D5:				; CODE XREF: sub_20597:loc_205B0j
					; sub_20597+37j
		or	dx, dx
		jnz	short loc_205B2
		xor	ax, ax
		pop	di
		pop	si
		pop	bp
		retf
sub_20597	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		mov	byte ptr [bp-1], 0
		jmp	short loc_20635
; ���������������������������������������������������������������������������

loc_205F7:				; CODE XREF: seg049:08B0j
		push	word ptr [di]
		mov	bx, [di]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 2
		mov	[bp-4],	dx
		mov	[bp-6],	ax
		cmp	dword ptr [bp-6], 0
		jz	short loc_20635
		push	word ptr [di]
		mov	bx, [di]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		add	sp, 2
		cmp	al, 8
		jz	short loc_2062F
		push	word ptr [di]
		mov	bx, [di]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		add	sp, 2
		cmp	al, 6
		jnz	short loc_20635

loc_2062F:				; CODE XREF: seg049:088Dj
		mov	byte ptr [bp-1], 1
		jmp	short loc_20642
; ���������������������������������������������������������������������������

loc_20635:				; CODE XREF: seg049:0865j seg049:087Dj ...
		push	di
		push	si
		push	cs
		call	near ptr sub_204D0
		add	sp, 4
		or	ax, ax
		jnz	short loc_205F7

loc_20642:				; CODE XREF: seg049:08A3j
		mov	al, [bp-1]
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 1Eh
		push	si
		push	di
		mov	si, [bp+6]
		mov	ax, [bp+8]
		mov	[bp-2],	ax
		mov	ax, [bp+0Ah]
		mov	[bp-4],	ax
		jmp	loc_20719
; ���������������������������������������������������������������������������

loc_20667:				; CODE XREF: seg049:0999j
		push	word ptr [bp-4]
		mov	bx, [bp-4]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 2
		mov	[bp-6],	dx
		mov	[bp-8],	ax
		cmp	dword ptr [bp-8], 0
		jnz	short loc_20684
		jmp	loc_20719
; ���������������������������������������������������������������������������

loc_20684:				; CODE XREF: seg049:08EFj
		les	bx, [bp-8]
		mov	al, es:[bx+11h]
		cmp	al, [bp+10h]
		jz	short loc_20693
		jmp	loc_20719
; ���������������������������������������������������������������������������

loc_20693:				; CODE XREF: seg049:08FEj
		mov	ax, [bp-4]
		add	ax, 12h
		mov	di, ax
		mov	eax, [di]
		mov	[bp-1Eh], eax
		mov	eax, [di+4]
		mov	[bp-1Ah], eax
		mov	eax, [di+8]
		mov	[bp-16h], eax
		mov	ax, [bp-2]
		add	ax, 12h
		mov	[bp-0Ah], ax
		mov	bx, [bp-0Ah]
		mov	eax, [bx]
		sub	[bp-1Eh], eax
		mov	bx, [bp-0Ah]
		mov	eax, [bx+4]
		sub	[bp-1Ah], eax
		mov	bx, [bp-0Ah]
		mov	eax, [bx+8]
		sub	[bp-16h], eax
		push	large dword ptr	[bp-16h]
		push	large dword ptr	[bp-1Ah]
		push	large dword ptr	[bp-1Eh]
		call	Math_VectorLength3D_Raw_26DF9
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp-0Eh], eax
		mov	eax, [bp-0Eh]
		mov	[bp-12h], eax
		mov	eax, [bp-12h]
		sar	eax, 8
		cmp	eax, [bp+0Ch]
		jge	short loc_20719
		mov	ax, [bp-4]
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_20719:				; CODE XREF: seg049:08D4j seg049:08F1j ...
		lea	ax, [bp-4]
		push	ax
		push	si
		push	cs
		call	near ptr sub_204D0
		add	sp, 4
		or	ax, ax
		jz	short loc_2072C
		jmp	loc_20667
; ���������������������������������������������������������������������������

loc_2072C:				; CODE XREF: seg049:0997j
		mov	word ptr [bp-4], 0
		jmp	loc_207E6
; ���������������������������������������������������������������������������

loc_20734:				; CODE XREF: seg049:0A6Ej
		push	word ptr [bp-4]
		mov	bx, [bp-4]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 2
		mov	[bp-6],	dx
		mov	[bp-8],	ax
		cmp	dword ptr [bp-8], 0
		jnz	short loc_20751
		jmp	loc_207E6
; ���������������������������������������������������������������������������

loc_20751:				; CODE XREF: seg049:09BCj
		les	bx, [bp-8]
		mov	al, es:[bx+11h]
		cmp	al, [bp+10h]
		jz	short loc_20760
		jmp	loc_207E6
; ���������������������������������������������������������������������������

loc_20760:				; CODE XREF: seg049:09CBj
		mov	ax, [bp-4]
		add	ax, 12h
		mov	di, ax
		mov	eax, [di]
		mov	[bp-1Eh], eax
		mov	eax, [di+4]
		mov	[bp-1Ah], eax
		mov	eax, [di+8]
		mov	[bp-16h], eax
		mov	ax, [bp-2]
		add	ax, 12h
		mov	[bp-0Ah], ax
		mov	bx, [bp-0Ah]
		mov	eax, [bx]
		sub	[bp-1Eh], eax
		mov	bx, [bp-0Ah]
		mov	eax, [bx+4]
		sub	[bp-1Ah], eax
		mov	bx, [bp-0Ah]
		mov	eax, [bx+8]
		sub	[bp-16h], eax
		push	large dword ptr	[bp-16h]
		push	large dword ptr	[bp-1Ah]
		push	large dword ptr	[bp-1Eh]
		call	Math_VectorLength3D_Raw_26DF9
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp-0Eh], eax
		mov	eax, [bp-0Eh]
		mov	[bp-12h], eax
		mov	eax, [bp-12h]
		sar	eax, 8
		cmp	eax, [bp+0Ch]
		jge	short loc_207E6
		mov	ax, [bp-4]
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_207E6:				; CODE XREF: seg049:09A1j seg049:09BEj ...
		lea	ax, [bp-4]
		push	ax
		push	si
		push	cs
		call	near ptr sub_204D0
		add	sp, 4
		or	ax, ax
		jz	short loc_20801
		mov	ax, [bp-4]
		cmp	ax, [bp+0Ah]
		jz	short loc_20801
		jmp	loc_20734
; ���������������������������������������������������������������������������

loc_20801:				; CODE XREF: seg049:0A64j seg049:0A6Cj
		xor	ax, ax
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 7Ch
		push	si
		push	di
		mov	si, [bp+6]
		mov	word ptr [bp-2], 0
		mov	word ptr [bp-4], 0
		mov	eax, [bp+0Ch]
		mov	[bp-0Ch], eax
		mov	eax, [bp-0Ch]
		shl	eax, 8
		mov	[bp-8],	eax
		mov	word ptr [bp-0Eh], 0
		mov	dword ptr [bp-12h], 0
		mov	ax, [bp+10h]
		mov	[bp-18h], ax
		movsx	eax, word ptr [bp-18h]
		shl	eax, 8
		mov	[bp-1Ch], eax
		lea	ax, [bp-1Ch]
		push	ax
		push	ss
		lea	ax, [bp-16h]
		push	ax
		call	sub_22E2A
		add	sp, 6
		push	word ptr [bp+8]
		mov	bx, [bp+8]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		add	sp, 2
		add	ax, 0Ch
		mov	[bp-1Eh], ax
		mov	bx, [bp-1Eh]
		mov	eax, [bx]
		mov	[bp-70h], eax
		mov	bx, [bp-1Eh]
		mov	eax, [bx+4]
		mov	[bp-6Ch], eax
		mov	bx, [bp-1Eh]
		mov	eax, [bx+8]
		mov	[bp-68h], eax
		mov	dword ptr [bp-22h], 0
		cmp	word ptr [bp+0Ah], 0
		jz	short loc_2090E
		mov	bx, [bp+0Ah]
		mov	eax, [bx+12h]
		mov	bx, [bp+8]
		sub	eax, [bx+12h]
		mov	[bp-7Ch], eax
		mov	bx, [bp+0Ah]
		mov	eax, [bx+16h]
		mov	bx, [bp+8]
		sub	eax, [bx+16h]
		mov	[bp-78h], eax
		mov	bx, [bp+0Ah]
		mov	eax, [bx+1Ah]
		mov	bx, [bp+8]
		sub	eax, [bx+1Ah]
		mov	[bp-74h], eax
		push	large dword ptr	[bp-74h]
		push	large dword ptr	[bp-78h]
		push	large dword ptr	[bp-7Ch]
		call	Math_VectorLength3D_Raw_26DF9
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp-26h], eax
		mov	eax, [bp-26h]
		mov	[bp-2Ah], eax
		mov	eax, [bp-2Ah]
		mov	[bp-22h], eax

loc_2090E:				; CODE XREF: seg049:0B15j
		cmp	byte ptr [bp+14h], 0
		jz	short loc_2093E
		mov	eax, [bp+0Ch]
		mov	[bp-36h], eax
		mov	eax, [bp-36h]
		shl	eax, 8
		sub	eax, [bp-22h]
		mov	[bp-3Ah], eax
		mov	eax, [bp-3Ah]
		mov	[bp-3Eh], eax
		mov	eax, [bp-3Eh]
		mov	[bp-2Eh], eax
		jmp	short loc_20959
; ���������������������������������������������������������������������������

loc_2093E:				; CODE XREF: seg049:0B82j
		mov	eax, [bp-22h]
		neg	eax
		mov	[bp-42h], eax
		mov	eax, [bp-42h]
		mov	[bp-46h], eax
		mov	eax, [bp-46h]
		mov	[bp-2Eh], eax

loc_20959:				; CODE XREF: seg049:0BACj
		mov	word ptr [bp-48h], 0
		jmp	loc_20B14
; ���������������������������������������������������������������������������

loc_20961:				; CODE XREF: seg049:0D94j
		push	word ptr [bp-48h]
		mov	bx, [bp-48h]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 2
		mov	[bp-4Ah], dx
		mov	[bp-4Ch], ax
		cmp	dword ptr [bp-4Ch], 0
		jnz	short loc_2097E
		jmp	loc_20B14
; ���������������������������������������������������������������������������

loc_2097E:				; CODE XREF: seg049:0BE9j
		mov	di, [bp-48h]
		mov	ax, [bp-48h]
		cmp	ax, [bp+8]
		jnz	short loc_2098C
		jmp	loc_20B14
; ���������������������������������������������������������������������������

loc_2098C:				; CODE XREF: seg049:0BF7j
		mov	ax, [bp-48h]
		cmp	ax, [bp+0Ah]
		jnz	short loc_20997
		jmp	loc_20B14
; ���������������������������������������������������������������������������

loc_20997:				; CODE XREF: seg049:0C02j
		les	bx, [bp-4Ch]
		mov	al, es:[bx+11h]
		cmp	al, [bp+12h]
		jz	short loc_209A6
		jmp	loc_20B14
; ���������������������������������������������������������������������������

loc_209A6:				; CODE XREF: seg049:0C11j
		mov	eax, [di+12h]
		mov	bx, [bp+8]
		sub	eax, [bx+12h]
		mov	[bp-7Ch], eax
		mov	eax, [di+16h]
		mov	bx, [bp+8]
		sub	eax, [bx+16h]
		mov	[bp-78h], eax
		mov	eax, [di+1Ah]
		mov	bx, [bp+8]
		sub	eax, [bx+1Ah]
		mov	[bp-74h], eax
		push	large dword ptr	[bp-74h]
		push	large dword ptr	[bp-78h]
		push	large dword ptr	[bp-7Ch]
		call	Math_VectorLength3D_Raw_26DF9
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp-54h], eax
		mov	eax, [bp-54h]
		mov	[bp-50h], eax
		mov	eax, [bp+0Ch]
		mov	[bp-58h], eax
		mov	eax, [bp-58h]
		shl	eax, 8
		cmp	eax, [bp-50h]
		jle	short loc_20A17
		mov	ax, 1
		jmp	short loc_20A19
; ���������������������������������������������������������������������������

loc_20A17:				; CODE XREF: seg049:0C80j
		xor	ax, ax

loc_20A19:				; CODE XREF: seg049:0C85j
		or	al, al
		jnz	short loc_20A20
		jmp	loc_20B14
; ���������������������������������������������������������������������������

loc_20A20:				; CODE XREF: seg049:0C8Bj
		lea	ax, [bp-7Ch]
		push	ax
		call	sub_24127
		add	sp, 2
		cmp	word ptr [bp+10h], 0B4h	; '�'
		jz	short loc_20A60
		lea	ax, [bp-70h]
		push	ax
		lea	ax, [bp-7Ch]
		push	ax
		push	ss
		lea	ax, [bp-5Ch]
		push	ax
		call	Math_DotProduct3D_2375C
		add	sp, 8
		mov	eax, [bp-5Ch]
		cmp	eax, [bp-16h]
		jl	short loc_20A57
		mov	ax, 1
		jmp	short loc_20A59
; ���������������������������������������������������������������������������

loc_20A57:				; CODE XREF: seg049:0CC0j
		xor	ax, ax

loc_20A59:				; CODE XREF: seg049:0CC5j
		or	al, al
		jnz	short loc_20A60
		jmp	loc_20B14
; ���������������������������������������������������������������������������

loc_20A60:				; CODE XREF: seg049:0CA1j seg049:0CCBj
		mov	eax, [bp-50h]
		cmp	eax, [bp-8]
		jge	short loc_20A6F
		mov	ax, 1
		jmp	short loc_20A71
; ���������������������������������������������������������������������������

loc_20A6F:				; CODE XREF: seg049:0CD8j
		xor	ax, ax

loc_20A71:				; CODE XREF: seg049:0CDDj
		or	al, al
		jz	short loc_20A82
		mov	eax, [bp-50h]
		mov	[bp-8],	eax
		mov	[bp-4],	di
		jmp	short loc_20AA2
; ���������������������������������������������������������������������������

loc_20A82:				; CODE XREF: seg049:0CE3j
		mov	eax, [bp-50h]
		cmp	eax, [bp-12h]
		jle	short loc_20A91
		mov	ax, 1
		jmp	short loc_20A93
; ���������������������������������������������������������������������������

loc_20A91:				; CODE XREF: seg049:0CFAj
		xor	ax, ax

loc_20A93:				; CODE XREF: seg049:0CFFj
		or	al, al
		jz	short loc_20AA2
		mov	eax, [bp-50h]
		mov	[bp-12h], eax
		mov	[bp-0Eh], di

loc_20AA2:				; CODE XREF: seg049:0CF0j seg049:0D05j
		mov	eax, [bp-50h]
		sub	eax, [bp-22h]
		mov	[bp-60h], eax
		mov	eax, [bp-60h]
		mov	[bp-64h], eax
		mov	eax, [bp-64h]
		mov	[bp-32h], eax
		cmp	byte ptr [bp+14h], 0
		jz	short loc_20AED
		cmp	dword ptr [bp-32h], 0
		jle	short loc_20AEB
		mov	eax, [bp-32h]
		cmp	eax, [bp-2Eh]
		jge	short loc_20ADA
		mov	ax, 1
		jmp	short loc_20ADC
; ���������������������������������������������������������������������������

loc_20ADA:				; CODE XREF: seg049:0D43j
		xor	ax, ax

loc_20ADC:				; CODE XREF: seg049:0D48j
		or	al, al
		jz	short loc_20AEB
		mov	eax, [bp-32h]
		mov	[bp-2Eh], eax
		mov	[bp-2],	di

loc_20AEB:				; CODE XREF: seg049:0D39j seg049:0D4Ej
		jmp	short loc_20B14
; ���������������������������������������������������������������������������

loc_20AED:				; CODE XREF: seg049:0D32j
		cmp	dword ptr [bp-32h], 0
		jge	short loc_20B14
		mov	eax, [bp-32h]
		cmp	eax, [bp-2Eh]
		jle	short loc_20B03
		mov	ax, 1
		jmp	short loc_20B05
; ���������������������������������������������������������������������������

loc_20B03:				; CODE XREF: seg049:0D6Cj
		xor	ax, ax

loc_20B05:				; CODE XREF: seg049:0D71j
		or	al, al
		jz	short loc_20B14
		mov	eax, [bp-32h]
		mov	[bp-2Eh], eax
		mov	[bp-2],	di

loc_20B14:				; CODE XREF: seg049:0BCEj seg049:0BEBj ...
		lea	ax, [bp-48h]
		push	ax
		push	si
		push	cs
		call	near ptr sub_204D0
		add	sp, 4
		or	ax, ax
		jz	short loc_20B27
		jmp	loc_20961
; ���������������������������������������������������������������������������

loc_20B27:				; CODE XREF: seg049:0D92j
		cmp	word ptr [bp-2], 0
		jz	short loc_20B33
		mov	ax, [bp-2]
		mov	[bp+0Ah], ax

loc_20B33:				; CODE XREF: seg049:0D9Bj
		cmp	byte ptr [bp+14h], 0
		jz	short loc_20B4D
		cmp	word ptr [bp-2], 0
		jnz	short loc_20B4B
		cmp	word ptr [bp-4], 0
		jz	short loc_20B4B
		mov	ax, [bp-4]
		mov	[bp+0Ah], ax

loc_20B4B:				; CODE XREF: seg049:0DADj seg049:0DB3j
		jmp	short loc_20B5F
; ���������������������������������������������������������������������������

loc_20B4D:				; CODE XREF: seg049:0DA7j
		cmp	word ptr [bp-2], 0
		jnz	short loc_20B5F
		cmp	word ptr [bp-0Eh], 0
		jz	short loc_20B5F
		mov	ax, [bp-0Eh]
		mov	[bp+0Ah], ax

loc_20B5F:				; CODE XREF: seg049:loc_20B4Bj
					; seg049:0DC1j	...
		mov	ax, [bp+0Ah]
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 46h
		push	si
		push	di
		mov	si, [bp+6]
		mov	word ptr [bp-2], 0
		mov	eax, [bp+0Ah]
		inc	eax
		mov	[bp-6],	eax
		mov	ax, [bp+8]
		mov	[bp-8],	ax
		mov	ax, [bp+0Eh]
		mov	[bp-0Eh], ax
		movsx	eax, word ptr [bp-0Eh]
		shl	eax, 8
		mov	[bp-12h], eax
		lea	ax, [bp-12h]
		push	ax
		push	ss
		lea	ax, [bp-0Ch]
		push	ax
		call	sub_22E2A
		add	sp, 6
		push	word ptr [bp-8]
		mov	bx, [bp-8]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		add	sp, 2
		add	ax, 0Ch
		mov	[bp-14h], ax
		mov	bx, [bp-14h]
		mov	eax, [bx]
		mov	[bp-3Ah], eax
		mov	bx, [bp-14h]
		mov	eax, [bx+4]
		mov	[bp-36h], eax
		mov	bx, [bp-14h]
		mov	eax, [bx+8]
		mov	[bp-32h], eax
		mov	word ptr [bp-16h], 0
		jmp	loc_20CFC
; ���������������������������������������������������������������������������

loc_20BEA:				; CODE XREF: seg049:0F7Cj
		push	word ptr [bp-16h]
		mov	bx, [bp-16h]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 2
		mov	[bp-18h], dx
		mov	[bp-1Ah], ax
		cmp	dword ptr [bp-1Ah], 0
		jnz	short loc_20C07
		jmp	loc_20CFC
; ���������������������������������������������������������������������������

loc_20C07:				; CODE XREF: seg049:0E72j
		mov	ax, [bp-16h]
		mov	[bp-1Ch], ax
		mov	ax, [bp-1Ch]
		add	ax, 12h
		mov	di, ax
		mov	eax, [di]
		mov	[bp-46h], eax
		mov	eax, [di+4]
		mov	[bp-42h], eax
		mov	eax, [di+8]
		mov	[bp-3Eh], eax
		mov	ax, [bp-8]
		add	ax, 12h
		mov	[bp-1Eh], ax
		mov	bx, [bp-1Eh]
		mov	eax, [bx]
		sub	[bp-46h], eax
		mov	bx, [bp-1Eh]
		mov	eax, [bx+4]
		sub	[bp-42h], eax
		mov	bx, [bp-1Eh]
		mov	eax, [bx+8]
		sub	[bp-3Eh], eax
		push	large dword ptr	[bp-3Eh]
		push	large dword ptr	[bp-42h]
		push	large dword ptr	[bp-46h]
		call	Math_VectorLength3D_Raw_26DF9
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp-26h], eax
		mov	eax, [bp-26h]
		mov	[bp-2Ah], eax
		mov	eax, [bp-2Ah]
		sar	eax, 8
		mov	[bp-22h], eax
		cmp	byte ptr [bp+10h], 0
		jz	short loc_20C9C
		les	bx, [bp-1Ah]
		mov	al, es:[bx+11h]
		cmp	al, [bp+10h]
		jnz	short loc_20CFC

loc_20C9C:				; CODE XREF: seg049:0EFEj
		cmp	byte ptr [bp+12h], 17h
		jz	short loc_20CB9
		push	word ptr [bp-18h]
		push	word ptr [bp-1Ah]
		les	bx, [bp-1Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		cmp	al, [bp+12h]
		jnz	short loc_20CFC

loc_20CB9:				; CODE XREF: seg049:0F10j
		mov	eax, [bp-22h]
		cmp	eax, [bp-6]
		jge	short loc_20CFC
		lea	ax, [bp-46h]
		push	ax
		call	sub_24127
		add	sp, 2
		lea	ax, [bp-3Ah]
		push	ax
		lea	ax, [bp-46h]
		push	ax
		push	ss
		lea	ax, [bp-2Eh]
		push	ax
		call	Math_DotProduct3D_2375C
		add	sp, 8
		mov	eax, [bp-2Eh]
		cmp	eax, [bp-0Ch]
		jl	short loc_20CFC
		mov	ax, [bp-1Ch]
		mov	[bp-2],	ax
		mov	eax, [bp-22h]
		mov	[bp-6],	eax

loc_20CFC:				; CODE XREF: seg049:0E57j seg049:0E74j ...
		lea	ax, [bp-16h]
		push	ax
		push	si
		push	cs
		call	near ptr sub_204D0
		add	sp, 4
		or	ax, ax
		jz	short loc_20D0F
		jmp	loc_20BEA
; ���������������������������������������������������������������������������

loc_20D0F:				; CODE XREF: seg049:0F7Aj
		mov	ax, [bp-2]
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_20D1A	proc far		; CODE XREF: seg049:0223p
					; sub_2036D+15p ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_20D41
		push	si
		nop
		push	cs
		call	near ptr Container_Op_20EEC
		add	sp, 2
		test	di, 1
		jz	short loc_20D41
		push	si
		call	sub_308
		add	sp, 2

loc_20D41:				; CODE XREF: sub_20D1A+Dj
					; sub_20D1A+1Cj
		pop	di
		pop	si
		pop	bp
		retf
sub_20D1A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à List_AppendTail_22C23
; (sub_22C23 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, ajoute un nœud en fin de liste chaînée : met le suivant du nœud (+2) à 0, met à
; jour la queue (+0xD) et la tête (+0xB) de l'en-tête, chaîne l'ancien dernier nœud. Même
; disposition que WorldObjects_CallSlot1COnActive_2217D /
; WorldObjects_UpdateAllAndRemoveDead_221F2. Anciennement Container_KeyCompare (ne compare
; rien).
; ==============================================================================================
List_AppendTail_20D45	proc far		; CODE XREF: seg049:013Bp
					; sub_1FEED+28p ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	di, di
		jz	short loc_20D72
		mov	word ptr [di+2], 0
		cmp	word ptr [si+0Dh], 0
		jnz	short loc_20D69
		mov	ax, di
		mov	[si+0Dh], ax
		mov	[si+0Bh], ax
		jmp	short loc_20D72
; ���������������������������������������������������������������������������

loc_20D69:				; CODE XREF: List_AppendTail_20D45+18j
		mov	bx, [si+0Dh]
		mov	[bx+2],	di
		mov	[si+0Dh], di

loc_20D72:				; CODE XREF: List_AppendTail_20D45+Dj
					; List_AppendTail_20D45+22j
		mov	ax, di
		pop	di
		pop	si
		pop	bp
		retf
List_AppendTail_20D45	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Container_RemoveNode
; (sub_22C56 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far,40L — retire un nœud spécifique par pointeur (unlink direct) : suppression
; directe d'un nœud connu du conteneur.
; ==============================================================================================
Container_RemoveNode	proc far		; CODE XREF: sub_20199+7Bp
					; sub_20F26+20p ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	di, [bp+arg_4]
		cmp	[si+0Bh], di
		jnz	short loc_20D95
		mov	ax, [di+2]
		mov	[si+0Bh], ax

loc_20D95:				; CODE XREF: Container_RemoveNode+11j
		cmp	[si+0Dh], di
		jnz	short loc_20D9D
		mov	[si+0Dh], dx

loc_20D9D:				; CODE XREF: Container_RemoveNode+1Cj
		or	dx, dx
		jz	short loc_20DA9
		mov	ax, [di+2]
		mov	bx, dx
		mov	[bx+2],	ax

loc_20DA9:				; CODE XREF: Container_RemoveNode+23j
		mov	word ptr [di+2], 0
		pop	di
		pop	si
		pop	bp
		retf
Container_RemoveNode	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_20DB2	proc far		; CODE XREF: sub_211F1+36P
					; seg050:01EFP	...

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_20DD1
; ���������������������������������������������������������������������������

loc_20DC3:				; CODE XREF: sub_20DB2+3Aj
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		add	sp, 2

loc_20DD1:				; CODE XREF: sub_20DB2+Fj
		cmp	[bp+var_2], 0
		jnz	short loc_20DDF
		mov	ax, [si+0Bh]
		mov	[bp+var_2], ax
		jmp	short loc_20DE8
; ���������������������������������������������������������������������������

loc_20DDF:				; CODE XREF: sub_20DB2+23j
		mov	bx, [bp+var_2]
		mov	ax, [bx+2]
		mov	[bp+var_2], ax

loc_20DE8:				; CODE XREF: sub_20DB2+2Bj
		cmp	[bp+var_2], 0
		jnz	short loc_20DC3
		pop	si
		leave
		retf
sub_20DB2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_20DF1	proc far		; CODE XREF: sub_212BA+3BP

var_C		= word ptr -0Ch
var_A		= dword	ptr -0Ah
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_6]
		mov	[bp+var_6], 0
		jmp	short loc_20E2E
; ���������������������������������������������������������������������������

loc_20E06:				; CODE XREF: sub_20DF1+58j
		push	[bp+var_6]
		push	ss
		lea	ax, [bp+var_A]
		push	ax
		call	sub_21318
		add	sp, 6
		mov	eax, [bp+var_A]
		mov	[bp+var_4], eax
		mov	eax, [di]
		cmp	eax, [bp+var_4]
		jge	short loc_20E2E
		mov	eax, [bp+var_4]
		mov	[di], eax

loc_20E2E:				; CODE XREF: sub_20DF1+13j
					; sub_20DF1+34j
		cmp	[bp+var_6], 0
		jnz	short loc_20E3C
		mov	ax, [si+0Bh]
		mov	[bp+var_6], ax
		jmp	short loc_20E45
; ���������������������������������������������������������������������������

loc_20E3C:				; CODE XREF: sub_20DF1+41j
		mov	bx, [bp+var_6]
		mov	ax, [bx+2]
		mov	[bp+var_6], ax

loc_20E45:				; CODE XREF: sub_20DF1+49j
		cmp	[bp+var_6], 0
		jnz	short loc_20E06
		mov	[bp+var_C], di
		mov	bx, [bp+var_C]
		mov	eax, [bx]
		mov	bx, [bp+arg_0]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_20DF1	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_20E68	proc far		; CODE XREF: seg049:037Cp seg050:0113P ...

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_20E87
; ���������������������������������������������������������������������������

loc_20E79:				; CODE XREF: sub_20E68+3Aj
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 2

loc_20E87:				; CODE XREF: sub_20E68+Fj
		cmp	[bp+var_2], 0
		jnz	short loc_20E95
		mov	ax, [si+0Bh]
		mov	[bp+var_2], ax
		jmp	short loc_20E9E
; ���������������������������������������������������������������������������

loc_20E95:				; CODE XREF: sub_20E68+23j
		mov	bx, [bp+var_2]
		mov	ax, [bx+2]
		mov	[bp+var_2], ax

loc_20E9E:				; CODE XREF: sub_20E68+2Bj
		cmp	[bp+var_2], 0
		jnz	short loc_20E79
		pop	si
		leave
		retf
sub_20E68	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_20EA7	proc far		; CODE XREF: sub_200EA+Ep seg050:0447P

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_2], 0
		jmp	short loc_20ECB
; ���������������������������������������������������������������������������

loc_20EBC:				; CODE XREF: sub_20EA7+3Fj
		push	di
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx+4]
		add	sp, 4

loc_20ECB:				; CODE XREF: sub_20EA7+13j
		cmp	[bp+var_2], 0
		jnz	short loc_20ED9
		mov	ax, [si+0Bh]
		mov	[bp+var_2], ax
		jmp	short loc_20EE2
; ���������������������������������������������������������������������������

loc_20ED9:				; CODE XREF: sub_20EA7+28j
		mov	bx, [bp+var_2]
		mov	ax, [bx+2]
		mov	[bp+var_2], ax

loc_20EE2:				; CODE XREF: sub_20EA7+30j
		cmp	[bp+var_2], 0
		jnz	short loc_20EBC
		pop	di
		pop	si
		leave
		retf
sub_20EA7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Container_Op_22DAB
; (sub_22DAB de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far,41L — (cluster conteneur) — accesseur/test additionnel, non détaillé.
; ==============================================================================================
Container_Op_20EEC	proc far		; CODE XREF: sub_20D1A+12p

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [si+0Bh]
		jmp	short loc_20F16
; ���������������������������������������������������������������������������

loc_20EFC:				; CODE XREF: Container_Op_20EEC+2Cj
		mov	ax, [di+2]
		mov	[bp+var_2], ax
		or	di, di
		jz	short loc_20F13
		push	3
		push	di
		mov	bx, [di]
		call	dword ptr [bx+18h]
		add	sp, 4
		jmp	short $+2

loc_20F13:				; CODE XREF: Container_Op_20EEC+18j
		mov	di, [bp+var_2]

loc_20F16:				; CODE XREF: Container_Op_20EEC+Ej
		or	di, di
		jnz	short loc_20EFC
		xor	ax, ax
		mov	[si+0Dh], ax
		mov	[si+0Bh], ax
		pop	di
		pop	si
		leave
		retf
Container_Op_20EEC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_20F26	proc far		; CODE XREF: sub_2039A+12p
					; Debris_ContainerOpWrapper_C2578+13P

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		mov	di, [si+0Bh]
		jmp	short loc_20F69
; ���������������������������������������������������������������������������

loc_20F3B:				; CODE XREF: sub_20F26+45j
		cmp	di, [bp+arg_2]
		jnz	short loc_20F63
		push	di
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr Container_RemoveNode
		add	sp, 6
		or	di, di
		jz	short loc_20F5D
		push	3
		push	di
		mov	bx, [di]
		call	dword ptr [bx+18h]
		add	sp, 4
		jmp	short $+2

loc_20F5D:				; CODE XREF: sub_20F26+28j
		mov	al, 1
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_20F63:				; CODE XREF: sub_20F26+18j
		mov	[bp+var_2], di
		mov	di, [di+2]

loc_20F69:				; CODE XREF: sub_20F26+13j
		or	di, di
		jnz	short loc_20F3B
		mov	al, 0
		pop	di
		pop	si
		leave
		retf
sub_20F26	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+6]
		mov	dx, [bp+8]
		mov	word ptr [bp-2], 0
		jmp	short loc_20F94
; ���������������������������������������������������������������������������

loc_20F8B:				; CODE XREF: seg049:121Fj
		mov	ax, dx
		dec	dx
		or	ax, ax
		jg	short loc_20F94
		jmp	short loc_20FB1
; ���������������������������������������������������������������������������

loc_20F94:				; CODE XREF: seg049:11F9j seg049:1200j
		cmp	word ptr [bp-2], 0
		jnz	short loc_20FA2
		mov	ax, [si+0Bh]
		mov	[bp-2],	ax
		jmp	short loc_20FAB
; ���������������������������������������������������������������������������

loc_20FA2:				; CODE XREF: seg049:1208j
		mov	bx, [bp-2]
		mov	ax, [bx+2]
		mov	[bp-2],	ax

loc_20FAB:				; CODE XREF: seg049:1210j
		cmp	word ptr [bp-2], 0
		jnz	short loc_20F8B

loc_20FB1:				; CODE XREF: seg049:1202j
		mov	ax, [bp-2]
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		mov	si, [bp+6]
		mov	eax, [bp+8]
		mov	[bp-0Eh], eax
		push	8
		push	word ptr [bp-0Ch]
		push	word ptr [bp-0Eh]
		push	ss
		lea	ax, [bp-0Ah]
		push	ax
		call	CRT_MemFamily_Extra8
		add	sp, 0Ah
		mov	byte ptr [bp-2], 0
		mov	word ptr [bp-10h], 0
		jmp	short loc_2101D
; ���������������������������������������������������������������������������

loc_20FEC:				; CODE XREF: seg049:12A8j
		mov	bx, [bp-10h]
		mov	eax, [bx+6]
		mov	[bp-14h], eax
		push	8
		push	word ptr [bp-12h]
		push	word ptr [bp-14h]
		push	ss
		lea	ax, [bp-0Ah]
		push	ax
		call	CRT_MemFamily_Extra7
		add	sp, 0Ah
		or	ax, ax
		jnz	short loc_21015
		mov	ax, 1
		jmp	short loc_21017
; ���������������������������������������������������������������������������

loc_21015:				; CODE XREF: seg049:127Ej
		xor	ax, ax

loc_21017:				; CODE XREF: seg049:1283j
		or	al, al
		jz	short loc_2101D
		jmp	short loc_2103A
; ���������������������������������������������������������������������������

loc_2101D:				; CODE XREF: seg049:125Aj seg049:1289j
		cmp	word ptr [bp-10h], 0
		jnz	short loc_2102B
		mov	ax, [si+0Bh]
		mov	[bp-10h], ax
		jmp	short loc_21034
; ���������������������������������������������������������������������������

loc_2102B:				; CODE XREF: seg049:1291j
		mov	bx, [bp-10h]
		mov	ax, [bx+2]
		mov	[bp-10h], ax

loc_21034:				; CODE XREF: seg049:1299j
		cmp	word ptr [bp-10h], 0
		jnz	short loc_20FEC

loc_2103A:				; CODE XREF: seg049:128Bj
		mov	ax, [bp-10h]
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_21043	proc far		; CODE XREF: sub_203CD+12p
					; sub_C261A+2AP

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		mov	di, [si+0Bh]
		jmp	short loc_21075
; ���������������������������������������������������������������������������

loc_21058:				; CODE XREF: sub_21043+34j
		cmp	di, [bp+arg_2]
		jnz	short loc_2106F
		push	di
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr Container_RemoveNode
		add	sp, 6
		mov	al, 1
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_2106F:				; CODE XREF: sub_21043+18j
		mov	[bp+var_2], di
		mov	di, [di+2]

loc_21075:				; CODE XREF: sub_21043+13j
		or	di, di
		jnz	short loc_21058
		mov	al, 0
		pop	di
		pop	si
		leave
		retf
sub_21043	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf
seg049		ends

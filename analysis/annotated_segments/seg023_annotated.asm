seg023		segment	byte public 'CODE' use16
		assume cs:seg023
		;org 0Fh
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,43L — itère un tableau de pointeurs d'objets (+0x17, compteur +0x15) et appelle
; vtable[0xC] sur chacun : notification en masse (init/attach) des enfants d'un conteneur UI.
; ==============================================================================================
UI_NotifyChildrenInit	proc far		; CODE XREF: UI_ContainerCloseDispatch+9p

var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp

loc_19AA2:
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	eax, [si+17h]
		mov	[bp+var_4], eax
		xor	di, di

loc_19AB4:
		jmp	short loc_19AD7
; ���������������������������������������������������������������������������

loc_19AB6:				; CODE XREF: UI_NotifyChildrenInit+3Bj
		push	word ptr [si+13h]
		mov	ax, si
		add	ax, 0Dh
		push	ax
		les	bx, [bp+var_4]
		push	large dword ptr	es:[bx]
		les	bx, es:[bx]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 8
		inc	di
		add	word ptr [bp+var_4], 4

loc_19AD7:				; CODE XREF: UI_NotifyChildrenInit:loc_19AB4j
		cmp	[si+15h], di
		jg	short loc_19AB6
		pop	di
		pop	si
		leave
		retf
UI_NotifyChildrenInit	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,42L — itère un second tableau (indexé, +0x23/+0x29) et appelle vtable[4] : notification
; (update) des enfants d'un second groupe du conteneur.
; ==============================================================================================
UI_NotifyChildrenUpdate	proc far		; CODE XREF: UI_ContainerLifecycle+60p

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [si+25h]
		mov	dx, [si+23h]
		mov	bx, [si+29h]
		shl	bx, 2
		add	dx, bx
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		xor	di, di
		jmp	short loc_19B1E
; ���������������������������������������������������������������������������

loc_19B03:				; CODE XREF: UI_NotifyChildrenUpdate+41j
		push	[bp+arg_2]
		les	bx, [bp+var_4]
		push	large dword ptr	es:[bx]
		les	bx, es:[bx]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6
		inc	di
		add	word ptr [bp+var_4], 4

loc_19B1E:				; CODE XREF: UI_NotifyChildrenUpdate+21j
		cmp	[si+21h], di
		jg	short loc_19B03
		pop	di
		pop	si
		leave
		retf
UI_NotifyChildrenUpdate	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,41L — itère le tableau +0x23 (compteur +0x1D) et appelle vtable[8] : notification (draw)
; des enfants du conteneur.
; ==============================================================================================
UI_NotifyChildrenDraw	proc far		; CODE XREF: UI_ContainerCloseDispatch+Fp

var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di

loc_19B2F:
		mov	si, [bp+arg_0]

loc_19B32:
		mov	eax, [si+23h]

loc_19B36:
		mov	[bp+var_4], eax
		xor	di, di
		jmp	short loc_19B56
; ���������������������������������������������������������������������������

loc_19B3E:				; CODE XREF: UI_NotifyChildrenDraw+32j
		les	bx, [bp+var_4]
		push	large dword ptr	es:[bx]
		les	bx, es:[bx]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		inc	di
		add	word ptr [bp+var_4], 4

loc_19B56:				; CODE XREF: UI_NotifyChildrenDraw+15j
		cmp	[si+1Dh], di
		jg	short loc_19B3E
		pop	di
		pop	si
		leave
		retf
UI_NotifyChildrenDraw	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,42L — variante de sub_19AE0 (compteur +0x21) appelant vtable[8] : notification (draw)
; d'un groupe alternatif d'enfants.
; ==============================================================================================
UI_NotifyChildrenDrawAlt	proc far		; CODE XREF: UI_ContainerCloseDispatch+2Ep

var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [si+25h]
		mov	dx, [si+23h]
		mov	bx, [si+29h]
		shl	bx, 2
		add	dx, bx
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		xor	di, di
		jmp	short loc_19B9A
; ���������������������������������������������������������������������������

loc_19B82:				; CODE XREF: UI_NotifyChildrenDrawAlt+3Ej
		les	bx, [bp+var_4]
		push	large dword ptr	es:[bx]
		les	bx, es:[bx]
		mov	bx, es:[bx]

loc_19B8F:
		call	dword ptr [bx+8]
		add	sp, 4
		inc	di
		add	word ptr [bp+var_4], 4

loc_19B9A:				; CODE XREF: UI_NotifyChildrenDrawAlt+21j
		cmp	[si+21h], di
		jg	short loc_19B82
		pop	di
		pop	si
		leave
		retf
UI_NotifyChildrenDrawAlt	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	al, [si+4]
		cmp	al, [bp+8]
		jz	short loc_19BC2
		push	0

loc_19BB4:
		mov	ax, [si]
		add	ax, 5Eh	; '^'
		push	ax
		call	SetReference16
		add	sp, 4

loc_19BC2:				; CODE XREF: seg023:0120j
		mov	al, [bp+8]
		mov	[si+4],	al
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,371L — teste le chevauchement/inclusion entre plusieurs rectangles passés en arguments
; (4 paires min/max) : routine générique de clipping/intersection rectangulaire de l'UI,
; utilisée par le gestionnaire de défilement sub_17944.
; ==============================================================================================
UI_RectIntersectTest	proc far		; CODE XREF: seg020:0314P
					; UI_ScrollClamp+CFP

var_2E		= word ptr -2Eh
var_2C		= word ptr -2Ch
var_2A		= dword	ptr -2Ah
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= dword	ptr -20h
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= dword	ptr -16h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= dword	ptr -0Ch
var_8		= word ptr -8
var_6		= dword	ptr -6
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= dword	ptr  0Ch
arg_A		= dword	ptr  10h
arg_E		= dword	ptr  14h
arg_12		= dword	ptr  18h
arg_16		= word ptr  1Ch

		push	bp
		mov	bp, sp
		sub	sp, 2Eh
		push	si
		push	di
		mov	ax, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	si, [bp+arg_16]
		mov	dl, 0
		mov	bx, [bp+arg_4]
		mov	eax, [bx]
		mov	[si], eax
		les	bx, [bp+arg_6]
		mov	ax, es:[bx+2]
		cmp	ax, [si+2]
		jle	short loc_19BF8
		mov	ax, 1
		jmp	short loc_19BFA
; ���������������������������������������������������������������������������

loc_19BF8:				; CODE XREF: UI_RectIntersectTest+26j
		xor	ax, ax

loc_19BFA:				; CODE XREF: UI_RectIntersectTest+2Bj
		mov	[bp+var_1], al
		les	bx, [bp+arg_A]
		mov	ax, es:[bx+2]
		cmp	ax, [si+2]
		jge	short loc_19C0E
		mov	ax, 1
		jmp	short loc_19C10
; ���������������������������������������������������������������������������

loc_19C0E:				; CODE XREF: UI_RectIntersectTest+3Cj
		xor	ax, ax

loc_19C10:				; CODE XREF: UI_RectIntersectTest+41j
		mov	[bp+var_2], al
		cmp	[bp+var_1], 0
		jnz	short loc_19C1C
		jmp	loc_19C9C
; ���������������������������������������������������������������������������

loc_19C1C:				; CODE XREF: UI_RectIntersectTest+4Cj
		les	bx, [bp+arg_E]
		mov	ax, es:[bx+2]
		sub	ax, [di+2]
		mov	[bp+var_8], ax
		movsx	eax, [bp+var_8]
		shl	eax, 8

loc_19C32:
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_6], eax

loc_19C3E:
		mov	ax, [si]
		sub	ax, [di]

loc_19C42:
		mov	[bp+var_E], ax

loc_19C45:
		movsx	eax, [bp+var_E]
		mov	edx, [bp+var_6]
		imul	edx, eax
		mov	[bp+var_6], edx
		mov	ax, [si+2]
		sub	ax, [di+2]
		mov	[bp+var_10], ax
		movsx	ebx, [bp+var_10]
		mov	eax, [bp+var_6]
		cdq
		idiv	ebx
		mov	[bp+var_6], eax
		cmp	[bp+var_6], 0
		jge	short loc_19C82
		add	eax, 0FFFFFF80h
		sar	eax, 8
		jmp	short loc_19C90
; ���������������������������������������������������������������������������

loc_19C82:				; CODE XREF: UI_RectIntersectTest+ABj
		mov	eax, [bp+var_6]
		add	eax, 80h ; '�'
		sar	eax, 8

loc_19C90:				; CODE XREF: UI_RectIntersectTest+B5j
		mov	dx, [di]
		add	dx, ax
		mov	[si], dx
		les	bx, [bp+arg_E]
		jmp	loc_19D22
; ���������������������������������������������������������������������������

loc_19C9C:				; CODE XREF: UI_RectIntersectTest+4Ej
		cmp	[bp+var_2], 0
		jnz	short loc_19CA5

loc_19CA2:
		jmp	loc_19D2B
; ���������������������������������������������������������������������������

loc_19CA5:				; CODE XREF: UI_RectIntersectTest+D5j
		les	bx, [bp+arg_12]
		mov	ax, es:[bx+2]
		sub	ax, [di+2]
		mov	[bp+var_12], ax
		movsx	eax, [bp+var_12]
		shl	eax, 8
		mov	[bp+var_16], eax
		mov	eax, [bp+var_16]
		mov	[bp+var_6], eax
		mov	ax, [si]
		sub	ax, [di]
		mov	[bp+var_18], ax
		movsx	eax, [bp+var_18]
		mov	edx, [bp+var_6]
		imul	edx, eax
		mov	[bp+var_6], edx
		mov	ax, [si+2]
		sub	ax, [di+2]
		mov	[bp+var_1A], ax
		movsx	ebx, [bp+var_1A]
		mov	eax, [bp+var_6]
		cdq
		idiv	ebx
		mov	[bp+var_6], eax
		cmp	[bp+var_6], 0
		jge	short loc_19D0B
		add	eax, 0FFFFFF80h
		sar	eax, 8
		jmp	short loc_19D19
; ���������������������������������������������������������������������������

loc_19D0B:				; CODE XREF: UI_RectIntersectTest+134j
		mov	eax, [bp+var_6]
		add	eax, 80h ; '�'
		sar	eax, 8

loc_19D19:				; CODE XREF: UI_RectIntersectTest+13Ej
		mov	dx, [di]
		add	dx, ax
		mov	[si], dx
		les	bx, [bp+arg_12]

loc_19D22:				; CODE XREF: UI_RectIntersectTest+CEj
		mov	ax, es:[bx+2]
		mov	[si+2],	ax
		mov	dl, 1

loc_19D2B:				; CODE XREF: UI_RectIntersectTest:loc_19CA2j
		or	dl, dl
		jz	short loc_19D53
		mov	ax, [si]
		les	bx, [bp+arg_E]
		cmp	ax, es:[bx]
		jge	short loc_19D3E

loc_19D39:
		mov	ax, 1

loc_19D3C:
		jmp	short loc_19D40
; ���������������������������������������������������������������������������

loc_19D3E:				; CODE XREF: UI_RectIntersectTest+16Cj
		xor	ax, ax

loc_19D40:				; CODE XREF: UI_RectIntersectTest:loc_19D3Cj
		mov	cl, al

loc_19D42:
		mov	ax, [si]
		les	bx, [bp+arg_12]
		cmp	ax, es:[bx]
		jle	short loc_19D70

loc_19D4C:				; CODE XREF: UI_RectIntersectTest+1A3j
		mov	ax, 1
		jmp	short loc_19D72
; ���������������������������������������������������������������������������
		jmp	short loc_19D70
; ���������������������������������������������������������������������������

loc_19D53:				; CODE XREF: UI_RectIntersectTest+162j
		mov	ax, [si]
		les	bx, [bp+arg_6]
		cmp	ax, es:[bx]
		jge	short loc_19D62
		mov	ax, 1
		jmp	short loc_19D64
; ���������������������������������������������������������������������������

loc_19D62:				; CODE XREF: UI_RectIntersectTest+190j
		xor	ax, ax

loc_19D64:				; CODE XREF: UI_RectIntersectTest+195j
		mov	cl, al
		mov	ax, [si]
		les	bx, [bp+arg_A]
		cmp	ax, es:[bx]
		jg	short loc_19D4C

loc_19D70:				; CODE XREF: UI_RectIntersectTest+17Fj
					; UI_RectIntersectTest+186j
		xor	ax, ax

loc_19D72:				; CODE XREF: UI_RectIntersectTest+184j
		mov	bl, al
		or	cl, cl
		jnz	short loc_19D7B
		jmp	loc_19DFB
; ���������������������������������������������������������������������������

loc_19D7B:				; CODE XREF: UI_RectIntersectTest+1ABj
		les	bx, [bp+arg_E]
		mov	ax, es:[bx]
		sub	ax, [di]
		mov	[bp+var_1C], ax
		movsx	eax, [bp+var_1C]
		shl	eax, 8
		mov	[bp+var_20], eax

loc_19D93:
		mov	eax, [bp+var_20]

loc_19D97:
		mov	[bp+var_6], eax
		mov	ax, [si+2]

loc_19D9E:
		sub	ax, [di+2]

loc_19DA1:
		mov	[bp+var_22], ax
		movsx	eax, [bp+var_22]
		mov	edx, [bp+var_6]
		imul	edx, eax
		mov	[bp+var_6], edx
		mov	ax, [si]
		sub	ax, [di]
		mov	[bp+var_24], ax
		movsx	ebx, [bp+var_24]
		mov	eax, [bp+var_6]
		cdq
		idiv	ebx
		mov	[bp+var_6], eax
		cmp	[bp+var_6], 0
		jge	short loc_19DDF
		add	eax, 0FFFFFF80h
		sar	eax, 8
		jmp	short loc_19DED
; ���������������������������������������������������������������������������

loc_19DDF:				; CODE XREF: UI_RectIntersectTest+208j
		mov	eax, [bp+var_6]
		add	eax, 80h ; '�'
		sar	eax, 8

loc_19DED:				; CODE XREF: UI_RectIntersectTest+212j
		mov	dx, [di+2]
		add	dx, ax
		mov	[si+2],	dx
		les	bx, [bp+arg_E]
		jmp	loc_19E7F
; ���������������������������������������������������������������������������

loc_19DFB:				; CODE XREF: UI_RectIntersectTest+1ADj
		or	bl, bl
		jnz	short loc_19E02
		jmp	loc_19E86
; ���������������������������������������������������������������������������

loc_19E02:				; CODE XREF: UI_RectIntersectTest+232j
		les	bx, [bp+arg_12]
		mov	ax, es:[bx]
		sub	ax, [di]
		mov	[bp+var_26], ax
		movsx	eax, [bp+var_26]
		shl	eax, 8
		mov	[bp+var_2A], eax
		mov	eax, [bp+var_2A]
		mov	[bp+var_6], eax

loc_19E22:
		mov	ax, [si+2]
		sub	ax, [di+2]
		mov	[bp+var_2C], ax
		movsx	eax, [bp+var_2C]

loc_19E30:
		mov	edx, [bp+var_6]
		imul	edx, eax
		mov	[bp+var_6], edx

loc_19E3C:
		mov	ax, [si]
		sub	ax, [di]

loc_19E40:
		mov	[bp+var_2E], ax

loc_19E43:
		movsx	ebx, [bp+var_2E]
		mov	eax, [bp+var_6]
		cdq
		idiv	ebx
		mov	[bp+var_6], eax
		cmp	[bp+var_6], 0
		jge	short loc_19E66
		add	eax, 0FFFFFF80h
		sar	eax, 8
		jmp	short loc_19E74
; ���������������������������������������������������������������������������

loc_19E66:				; CODE XREF: UI_RectIntersectTest+28Fj
		mov	eax, [bp+var_6]
		add	eax, 80h ; '�'
		sar	eax, 8

loc_19E74:				; CODE XREF: UI_RectIntersectTest+299j
		mov	dx, [di+2]
		add	dx, ax
		mov	[si+2],	dx
		les	bx, [bp+arg_12]

loc_19E7F:				; CODE XREF: UI_RectIntersectTest+22Dj
		mov	ax, es:[bx]
		mov	[si], ax
		mov	dl, 1

loc_19E86:				; CODE XREF: UI_RectIntersectTest+234j
		mov	al, dl
		pop	di
		pop	si
		leave
		retf
UI_RectIntersectTest	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,68L — machine à 3 états (+4, valeurs 0/1/2) orchestrant sub_19EF6/sub_19F64/sub_19F9F
; selon l'état courant : dispatcher de cycle de vie d'un widget conteneur (ouverture/mise à
; jour/fermeture).
; ==============================================================================================
UI_ContainerLifecycle	proc far		; CODE XREF: seg015:0AD2P seg015:0AE6P

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	bx, [si]
		mov	bx, [bx+2]
		les	bx, [bx+5Ah]
		mov	al, es:[bx+13h]
		mov	[si+4],	al
		push	si
		nop
		push	cs
		call	near ptr UI_NotifyChildrenDrawFirst
		pop	cx
		push	di
		push	si
		nop
		push	cs
		call	near ptr UI_NotifyChildrenUpdateArg
		add	sp, 4
		mov	al, [si+4]
		mov	ah, 0
		cmp	ax, 1
		jz	short loc_19EC8
		cmp	ax, 2
		jz	short loc_19ED1
		jmp	short loc_19EF2
; ���������������������������������������������������������������������������

loc_19EC8:				; CODE XREF: UI_ContainerLifecycle+33j
		push	di
		push	si
		nop
		push	cs
		call	near ptr UI_NotifyChildrenUpdateArg2
		jmp	short loc_19EEF
; ���������������������������������������������������������������������������

loc_19ED1:				; CODE XREF: UI_ContainerLifecycle+38j
		push	0
		push	6
		call	Weapon_HUDBox_TimerCaseJ_5A95E
		add	sp, 4
		push	0
		push	7
		call	Weapon_HUDBox_TimerCaseJ_5A95E
		add	sp, 4
		push	di
		push	si
		push	cs
		call	near ptr UI_NotifyChildrenUpdate

loc_19EEF:				; CODE XREF: UI_ContainerLifecycle+43j
		add	sp, 4

loc_19EF2:				; CODE XREF: UI_ContainerLifecycle+3Aj
		pop	di
		pop	si
		pop	bp
		retf
UI_ContainerLifecycle	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,36L — itère +0x17 (compteur +0x15) appelant vtable[8] : notification (draw) d'une
; première liste d'enfants.
; ==============================================================================================
UI_NotifyChildrenDrawFirst	proc far		; CODE XREF: UI_ContainerLifecycle+1Dp

var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	eax, [si+17h]
		mov	[bp+var_4], eax
		xor	di, di
		jmp	short loc_19F26
; ���������������������������������������������������������������������������

loc_19F0D:				; CODE XREF: UI_NotifyChildrenDrawFirst+33j
		push	si
		les	bx, [bp+var_4]
		push	large dword ptr	es:[bx]
		les	bx, es:[bx]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 6
		inc	di
		add	word ptr [bp+var_4], 4

loc_19F26:				; CODE XREF: UI_NotifyChildrenDrawFirst+15j
		cmp	[si+15h], di
		jg	short loc_19F0D
		pop	di
		pop	si
		leave
		retf
UI_NotifyChildrenDrawFirst	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,48L — orchestre sub_19A9F/sub_19B27 puis dispatche selon état (+4) vers sub_19FE6 ou une
; autre liste : dispatcher de fermeture/transition d'état du conteneur.
; ==============================================================================================
UI_ContainerCloseDispatch	proc far		; CODE XREF: seg015:loc_15065P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr UI_NotifyChildrenInit
		pop	cx
		push	si
		push	cs
		call	near ptr UI_NotifyChildrenDraw
		pop	cx

loc_19F42:
		mov	al, [si+4]
		mov	ah, 0
		cmp	ax, 1
		jz	short loc_19F53
		cmp	ax, 2
		jz	short loc_19F5B
		jmp	short loc_19F61
; ���������������������������������������������������������������������������

loc_19F53:				; CODE XREF: UI_ContainerCloseDispatch+1Bj
		push	si
		nop
		push	cs
		call	near ptr UI_NotifyChildrenDrawFinal
		jmp	short loc_19F60
; ���������������������������������������������������������������������������

loc_19F5B:				; CODE XREF: UI_ContainerCloseDispatch+20j
		push	si
		push	cs
		call	near ptr UI_NotifyChildrenDrawAlt

loc_19F60:				; CODE XREF: UI_ContainerCloseDispatch+2Aj
		pop	cx

loc_19F61:				; CODE XREF: UI_ContainerCloseDispatch+22j
		pop	si
		pop	bp
		retf
UI_ContainerCloseDispatch	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,37L — itère +0x23 (compteur +0x1D) appelant vtable[4] avec un paramètre : notification
; (update) avec argument d'une liste d'enfants.
; ==============================================================================================
UI_NotifyChildrenUpdateArg	proc far		; CODE XREF: UI_ContainerLifecycle+25p

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	eax, [si+23h]
		mov	[bp+var_4], eax
		xor	di, di
		jmp	short loc_19F96
; ���������������������������������������������������������������������������

loc_19F7B:				; CODE XREF: UI_NotifyChildrenUpdateArg+35j
		push	[bp+arg_2]
		les	bx, [bp+var_4]
		push	large dword ptr	es:[bx]
		les	bx, es:[bx]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6
		inc	di
		add	word ptr [bp+var_4], 4

loc_19F96:				; CODE XREF: UI_NotifyChildrenUpdateArg+15j
		cmp	[si+1Dh], di
		jg	short loc_19F7B
		pop	di
		pop	si
		leave
		retf
UI_NotifyChildrenUpdateArg	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,44L — itère un tableau indexé (+0x23/+0x27) appelant vtable[4] avec argument :
; notification (update) d'un groupe alternatif avec argument.
; ==============================================================================================
UI_NotifyChildrenUpdateArg2	proc far		; CODE XREF: UI_ContainerLifecycle+40p

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp

loc_19FA2:
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [si+25h]
		mov	dx, [si+23h]
		mov	bx, [si+27h]
		shl	bx, 2
		add	dx, bx
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		xor	di, di
		jmp	short loc_19FDD
; ���������������������������������������������������������������������������

loc_19FC2:				; CODE XREF: UI_NotifyChildrenUpdateArg2+41j
		push	[bp+arg_2]
		les	bx, [bp+var_4]
		push	large dword ptr	es:[bx]
		les	bx, es:[bx]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6
		inc	di
		add	word ptr [bp+var_4], 4

loc_19FDD:				; CODE XREF: UI_NotifyChildrenUpdateArg2+21j
		cmp	[si+1Fh], di
		jg	short loc_19FC2
		pop	di
		pop	si
		leave
		retf
UI_NotifyChildrenUpdateArg2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,40L — itère un tableau indexé (+0x23/+0x27) appelant vtable[8] : notification (draw)
; finale d'un groupe d'enfants lors de la fermeture.
; ==============================================================================================
UI_NotifyChildrenDrawFinal	proc far		; CODE XREF: UI_ContainerCloseDispatch+27p

var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [si+25h]
		mov	dx, [si+23h]
		mov	bx, [si+27h]
		shl	bx, 2
		add	dx, bx
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		xor	di, di
		jmp	short loc_1A021
; ���������������������������������������������������������������������������

loc_1A009:				; CODE XREF: UI_NotifyChildrenDrawFinal+3Ej
		les	bx, [bp+var_4]
		push	large dword ptr	es:[bx]
		les	bx, es:[bx]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		inc	di
		add	word ptr [bp+var_4], 4

loc_1A021:				; CODE XREF: UI_NotifyChildrenDrawFinal+21j
		cmp	[si+1Fh], di
		jg	short loc_1A009
		pop	di
		pop	si
		leave
		retf
UI_NotifyChildrenDrawFinal	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		mov	ax, [si+5]
		add	ax, [si+0Dh]
		cmp	ax, [di]
		jg	short loc_1A064
		mov	ax, [si+9]
		add	ax, [si+0Dh]
		cmp	ax, [di]
		jl	short loc_1A064
		mov	ax, [si+7]
		add	ax, [si+0Fh]
		cmp	ax, [di+2]
		jg	short loc_1A064
		mov	ax, [si+0Bh]
		add	ax, [si+0Fh]
		cmp	ax, [di+2]
		jl	short loc_1A064

loc_1A05F:
		mov	ax, 1
		jmp	short loc_1A066
; ���������������������������������������������������������������������������

loc_1A064:				; CODE XREF: seg023:05ADj seg023:05B7j ...
		xor	ax, ax

loc_1A066:				; CODE XREF: seg023:05D2j
		pop	di
		pop	si
		pop	bp
		retf
seg023		ends

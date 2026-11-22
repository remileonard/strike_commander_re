seg043		segment	byte public 'CODE' use16
		assume cs:seg043
		;org 6
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1D446	proc far		; CODE XREF: seg046:01F1P
					; DATA XREF: seg170:021Eo

var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp

loc_1D447:				; DATA XREF: seg170:0216o
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	eax, [si+4]
		mov	[bp+var_4], eax
		xor	di, di
		jmp	short loc_1D47A
; ���������������������������������������������������������������������������

loc_1D45D:				; CODE XREF: sub_1D446+37j
		les	bx, [bp+var_4]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		les	bx, [bp+var_4]
		les	bx, es:[bx]
		mov	bx, es:[bx]
		call	dword ptr [bx]
		add	sp, 4
		add	word ptr [bp+var_4], 4
		inc	di

loc_1D47A:				; CODE XREF: sub_1D446+15j
		cmp	[si+2],	di
		jg	short loc_1D45D
		pop	di
		pop	si
		leave
		retf
sub_1D446	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1D483	proc far		; CODE XREF: seg043:01AFp
					; sub_C36F7+C0P

var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word ptr [si], 0
		jz	short loc_1D499
		jmp	loc_1D565
; ���������������������������������������������������������������������������

loc_1D499:				; CODE XREF: sub_1D483+11j
		mov	ax, di
		shl	ax, 2
		movzx	eax, ax
		mov	[bp+var_4], eax
		push	3172h
		push	1
		push	0
		push	2
		push	large [bp+var_4]
		push	661Ah
		call	Memory_TypedFreeWrapperB_2B862
		add	sp, 0Eh
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		mov	eax, [bp+var_8]
		mov	[si+0Ch], eax
		mov	byte ptr [si+10h], 2
		mov	byte ptr [si+11h], 1
		mov	dword ptr [si+12h], 0
		mov	eax, [bp+var_4]
		mov	[si+12h], eax
		push	0
		mov	al, [si+10h]
		push	ax
		push	word ptr [si+0Eh]
		push	word ptr [si+0Ch]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		mov	[si+6],	dx
		mov	[si+4],	ax
		mov	[si], di
		mov	word ptr [si+2], 0
		push	3190h
		push	1
		push	0
		push	3
		push	large 0FFFCh
		push	661Ah
		call	Memory_TypedFreeWrapperB_2B862
		add	sp, 0Eh
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		mov	eax, [bp+var_C]
		mov	[si+16h], eax
		mov	byte ptr [si+1Ah], 3
		mov	byte ptr [si+1Bh], 1
		mov	dword ptr [si+1Ch], 0
		mov	dword ptr [si+1Ch], 0FFFCh
		push	0
		mov	al, [si+1Ah]
		push	ax
		push	word ptr [si+18h]
		push	word ptr [si+16h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		mov	[si+0Ah], dx
		mov	[si+8],	ax

loc_1D565:				; CODE XREF: sub_1D483+13j
		pop	di
		pop	si
		leave
		retf
sub_1D483	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1D569	proc far		; CODE XREF: seg046:01D4P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jz	short loc_1D59C
		push	0
		mov	al, [si+1Ah]
		push	ax
		push	word ptr [si+18h]
		push	word ptr [si+16h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		mov	[si+0Ah], dx
		mov	[si+8],	ax
		push	si
		call	Parser_BuildHashIndex_27454
		add	sp, 2

loc_1D59C:				; CODE XREF: sub_1D569+Bj
		pop	si
		pop	bp
		retf
sub_1D569	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		or	si, si
		jnz	short loc_1D5BA
		push	20h ; ' '
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_1D5F5

loc_1D5BA:				; CODE XREF: seg043:0168j
		mov	dword ptr [si+0Ch], 0
		mov	byte ptr [si+10h], 2
		mov	byte ptr [si+11h], 0
		mov	dword ptr [si+12h], 0
		mov	dword ptr [si+16h], 0
		mov	byte ptr [si+1Ah], 2
		mov	byte ptr [si+1Bh], 0
		mov	dword ptr [si+1Ch], 0
		push	word ptr [bp+8]
		push	si
		push	cs
		call	near ptr sub_1D483
		add	sp, 4

loc_1D5F5:				; CODE XREF: seg043:0178j
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

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Widget_DestructTwoLabels (sub_2AF07 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,56L — libère
; deux chaînes conditionnelles (offsets +0xC et +0x16 via sub_5C7B6) puis réinitialise leurs
; champs : destructeur de widget avec libération de deux libellés associés.
; ==============================================================================================
Widget_DestructTwoLabels	proc far		; CODE XREF: seg046:07CDP
					; sub_C39F6+18P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+11h], 0
		jz	short loc_1D62A
		cmp	dword ptr [si+0Ch], 0
		jz	short loc_1D62A
		push	0
		mov	al, [si+10h]
		push	ax
		mov	ax, si
		add	ax, 0Ch
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_1D62A:				; CODE XREF: Widget_DestructTwoLabels+Bj
					; Widget_DestructTwoLabels+12j
		mov	dword ptr [si+0Ch], 0
		mov	byte ptr [si+11h], 0
		mov	dword ptr [si+12h], 0
		cmp	byte ptr [si+1Bh], 0
		jz	short loc_1D664
		cmp	dword ptr [si+16h], 0
		jz	short loc_1D664
		push	0
		mov	al, [si+1Ah]
		push	ax
		mov	ax, si
		add	ax, 16h
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_1D664:				; CODE XREF: Widget_DestructTwoLabels+45j
					; Widget_DestructTwoLabels+4Cj
		mov	dword ptr [si+16h], 0
		mov	byte ptr [si+1Bh], 0
		mov	dword ptr [si+1Ch], 0
		mov	word ptr [si], 0
		pop	si
		pop	bp
		retf
Widget_DestructTwoLabels	endp

seg043		ends

seg082		segment	byte public 'CODE' use16
		assume cs:seg082
		;org 6
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-17. Palette {+0 nombre de couleurs (arg_4), +2 premier indice (arg_2), +3
; tableau RVB de 3 octets par couleur alloué par sub_D57}.
; ==============================================================================================
Palette_Alloc_2CC76	proc far		; CODE XREF: sub_3B0B+C1P sub_3D2E+1DP ...

arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si

loc_2CC7A:				; DATA XREF: seg170:0366o
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_4]
		mov	al, [bp+arg_2]
		mov	[si+2],	al
		mov	[si], dx
		push	seg seg082
		push	offset loc_2D1E7
		push	1
		push	dx
		push	large 30000h
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[si+3],	ax
		pop	si
		pop	bp
		retf
Palette_Alloc_2CC76	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_2CCA5	proc far		; CODE XREF: Palette_LoadFromResource_2CCE5+7Cp
					; sub_2CD9E+1Cp

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	eax, [bp+arg_2]
		mov	[bp+var_4], eax
		mov	di, [si+3]
		xor	dx, dx
		jmp	short loc_2CCDD
; ���������������������������������������������������������������������������

loc_2CCBF:				; CODE XREF: sub_2CCA5+3Aj
		les	bx, [bp+var_4]
		mov	al, es:[bx]
		mov	[di], al
		mov	al, es:[bx+1]
		mov	[di+1],	al
		mov	al, es:[bx+2]
		mov	[di+2],	al
		inc	dx
		add	word ptr [bp+var_4], 3
		add	di, 3

loc_2CCDD:				; CODE XREF: sub_2CCA5+18j
		cmp	[si], dx
		ja	short loc_2CCBF
		pop	di
		pop	si
		leave
		retf
sub_2CCA5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-17. Charge une palette depuis un bloc de ressource : octet premier indice,
; mot nombre de couleurs, puis RVB (3 octets par couleur, copiés par sub_2CCA5) ; libère
; ensuite le bloc source.
; ==============================================================================================
Palette_LoadFromResource_2CCE5	proc far		; CODE XREF: sub_5803+20DP
					; sub_5803+38BP ...

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word ptr [si+3], 0
		jz	short loc_2CD07
		push	word ptr [si+3]
		call	sub_308
		pop	cx
		mov	word ptr [si+3], 0

loc_2CD07:				; CODE XREF: Palette_LoadFromResource_2CCE5+12j
		push	0
		mov	al, [di+4]
		push	ax
		push	large dword ptr	[di]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	al, es:[bx]
		mov	[si+2],	al
		add	word ptr [bp+var_4], 2
		les	bx, [bp+var_4]
		mov	ax, es:[bx]
		mov	[si], ax
		add	word ptr [bp+var_4], 2
		push	seg seg082
		push	offset loc_2D1E7
		push	1
		push	word ptr [si]
		push	large 30000h
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[si+3],	ax
		cmp	word ptr [si+3], 0
		jz	short loc_2CD67
		push	large [bp+var_4]
		push	si
		push	cs
		call	near ptr sub_2CCA5
		add	sp, 6

loc_2CD67:				; CODE XREF: Palette_LoadFromResource_2CCE5+74j
		cmp	byte ptr [di+5], 0
		jz	short loc_2CD87
		cmp	dword ptr [di],	0
		jz	short loc_2CD87
		push	0
		mov	al, [di+4]
		push	ax
		push	di
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_2CD87:				; CODE XREF: Palette_LoadFromResource_2CCE5+86j
					; Palette_LoadFromResource_2CCE5+8Cj
		mov	dword ptr [di],	0
		mov	byte ptr [di+5], 0
		mov	dword ptr [di+6], 0
		pop	di
		pop	si
		leave
		retf
Palette_LoadFromResource_2CCE5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_2CD9E	proc far		; CODE XREF: Palette_FadeToColor_2D09C+82p

arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= word ptr  0Ah
arg_6		= dword	ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_4]
		mov	al, [bp+arg_2]
		push	ax
		push	si
		push	cs
		call	near ptr Palette_Alloc_2CC76
		add	sp, 6
		push	large [bp+arg_6]
		push	si
		push	cs
		call	near ptr sub_2CCA5
		add	sp, 6
		pop	si
		pop	bp
		retf
sub_2CD9E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_2CDC3	proc far		; CODE XREF: sub_CE2C+1DP
					; sub_5E1A1+C9P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+3], 0
		jz	short loc_2CDDE
		mov	al, [si+2]
		push	ax
		push	word ptr [si]
		push	word ptr [si+3]
		call	sub_2EFB7

loc_2CDDE:				; CODE XREF: sub_2CDC3+Bj
		pop	si
		pop	bp
		retf
sub_2CDC3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-17. Envoie une plage de la palette à la carte VGA (sub_2F024), bornée à la
; palette. Avec un pas non nul, découpe l'envoi en morceaux de nombre / pas couleurs, chacun
; après une attente de balayage (sub_2F050).
; ==============================================================================================
Palette_Upload_2CDE1	proc far		; CODE XREF: sub_3D2E+55P sub_6162+A0P ...

var_6		= word ptr -6
var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	cl, [bp+arg_2]
		mov	di, [bp+arg_4]
		cmp	word ptr [si+3], 0
		jnz	short loc_2CDFB
		jmp	loc_2CEA9
; ���������������������������������������������������������������������������

loc_2CDFB:				; CODE XREF: Palette_Upload_2CDE1+15j
		cmp	[si+2],	cl
		jbe	short loc_2CE03
		mov	cl, [si+2]

loc_2CE03:				; CODE XREF: Palette_Upload_2CDE1+1Dj
		mov	al, [si+2]
		mov	ah, 0
		add	ax, [si]
		mov	dl, cl
		mov	dh, 0
		add	dx, di
		cmp	ax, dx
		jnb	short loc_2CE23
		mov	al, [si+2]
		mov	ah, 0
		add	ax, [si]
		mov	dl, cl
		mov	dh, 0
		sub	ax, dx
		mov	di, ax

loc_2CE23:				; CODE XREF: Palette_Upload_2CDE1+31j
		mov	al, cl
		mov	ah, 0
		mov	dl, [si+2]
		mov	dh, 0
		sub	ax, dx
		imul	ax, 3
		mov	si, [si+3]
		add	si, ax
		cmp	[bp+arg_6], 0
		jz	short loc_2CEA1
		mov	ax, di
		xor	dx, dx
		div	[bp+arg_6]
		mov	[bp+var_2], ax
		mov	[bp+var_3], cl
		mov	[bp+var_6], di
		mov	ax, di
		xor	dx, dx
		div	[bp+arg_6]
		or	dx, dx
		jz	short loc_2CE99
		inc	[bp+var_2]
		jmp	short loc_2CE99
; ���������������������������������������������������������������������������

loc_2CE5C:				; CODE XREF: Palette_Upload_2CDE1+BCj
		call	sub_2F050
		mov	al, [bp+var_3]
		push	ax
		push	[bp+var_2]
		push	si
		call	sub_2F024
		mov	al, [bp+var_3]
		add	al, byte ptr [bp+var_2]
		mov	[bp+var_3], al
		mov	ax, [bp+var_2]
		imul	ax, 3
		add	si, ax
		mov	ax, [bp+var_6]
		sub	ax, [bp+var_2]
		mov	[bp+var_6], ax
		mov	dx, ax
		cmp	dx, [bp+var_2]
		jge	short loc_2CE93
		mov	ax, dx
		jmp	short loc_2CE96
; ���������������������������������������������������������������������������

loc_2CE93:				; CODE XREF: Palette_Upload_2CDE1+ACj
		mov	ax, [bp+var_2]

loc_2CE96:				; CODE XREF: Palette_Upload_2CDE1+B0j
		mov	[bp+var_2], ax

loc_2CE99:				; CODE XREF: Palette_Upload_2CDE1+74j
					; Palette_Upload_2CDE1+79j
		cmp	[bp+var_2], 0
		ja	short loc_2CE5C
		jmp	short loc_2CEA9
; ���������������������������������������������������������������������������

loc_2CEA1:				; CODE XREF: Palette_Upload_2CDE1+59j
		push	cx
		push	di
		push	si
		call	sub_2F024

loc_2CEA9:				; CODE XREF: Palette_Upload_2CDE1+17j
					; Palette_Upload_2CDE1+BEj
		pop	di
		pop	si
		leave
		retf
Palette_Upload_2CDE1	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	cl, [bp+8]
		mov	di, [bp+0Ah]
		cmp	word ptr [si+3], 0
		jz	short loc_2CF04
		cmp	[si+2],	cl
		jbe	short loc_2CEC9
		mov	cl, [si+2]

loc_2CEC9:				; CODE XREF: seg082:0254j
		mov	al, [si+2]
		mov	ah, 0
		add	ax, [si]
		mov	dl, cl
		mov	dh, 0
		add	dx, di
		cmp	ax, dx
		jnb	short loc_2CEE9
		mov	al, [si+2]
		mov	ah, 0
		add	ax, [si]
		mov	dl, cl
		mov	dh, 0
		sub	ax, dx
		mov	di, ax

loc_2CEE9:				; CODE XREF: seg082:0268j
		push	cx
		push	di
		mov	al, cl
		mov	ah, 0
		mov	dl, [si+2]
		mov	dh, 0
		sub	ax, dx
		imul	ax, 3
		mov	dx, [si+3]
		add	dx, ax
		push	dx
		call	sub_2EFB7

loc_2CF04:				; CODE XREF: seg082:024Fj
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-17. Remplit une plage (premier indice, nombre) de la palette avec une seule
; couleur RVB (pointeur arg_2).
; ==============================================================================================
Palette_FillRange_2CF08	proc far		; CODE XREF: sub_3D2E+40P
					; Palette_FadeFromColor_2D165+47p ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	cl, [bp+arg_4]
		cmp	word ptr [si+3], 0
		jz	short loc_2CF7C
		cmp	[si+2],	cl
		jbe	short loc_2CF21
		mov	cl, [si+2]

loc_2CF21:				; CODE XREF: Palette_FillRange_2CF08+14j
		mov	al, [si+2]
		mov	ah, 0
		add	ax, [si]
		mov	dl, cl
		mov	dh, 0
		add	dx, [bp+arg_6]
		cmp	ax, dx
		jnb	short loc_2CF43
		mov	al, [si+2]
		mov	ah, 0
		add	ax, [si]
		mov	dl, cl
		mov	dh, 0
		sub	ax, dx
		mov	[bp+arg_6], ax

loc_2CF43:				; CODE XREF: Palette_FillRange_2CF08+29j
		mov	di, [si+3]
		mov	al, cl
		mov	ah, 0
		mov	dl, [si+2]
		mov	dh, 0
		sub	ax, dx
		imul	ax, 3
		mov	dx, [si+3]
		add	dx, ax
		mov	[si+3],	dx
		xor	dx, dx
		jmp	short loc_2CF77
; ���������������������������������������������������������������������������

loc_2CF60:				; CODE XREF: Palette_FillRange_2CF08+72j
		mov	bx, [bp+arg_2]
		mov	al, [bx]
		mov	[di], al
		mov	al, [bx+1]
		mov	[di+1],	al
		mov	al, [bx+2]
		mov	[di+2],	al
		inc	dx
		add	di, 3

loc_2CF77:				; CODE XREF: Palette_FillRange_2CF08+56j
		cmp	dx, [bp+arg_6]
		jb	short loc_2CF60

loc_2CF7C:				; CODE XREF: Palette_FillRange_2CF08+Fj
		pop	di
		pop	si
		pop	bp
		retf
Palette_FillRange_2CF08	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-17. Copie la palette source dans la palette destination, à partir du
; premier indice de la source. Les cinématiques composent ainsi les 256 couleurs à partir de
; palettes partielles.
; ==============================================================================================
Palette_CopyInto_2CF80	proc far		; CODE XREF: sub_5803+8C2P
					; sub_5803+8E1P ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	cl, [bp+arg_4]
		cmp	word ptr [si+3], 0
		jz	short loc_2CFE5
		cmp	word ptr [di+3], 0
		jz	short loc_2CFE5
		cmp	[si+2],	cl
		jbe	short loc_2CFA2
		mov	cl, [si+2]

loc_2CFA2:				; CODE XREF: Palette_CopyInto_2CF80+1Dj
		mov	al, [si+2]
		mov	ah, 0
		add	ax, [si]
		mov	dl, cl
		mov	dh, 0
		add	dx, [bp+arg_6]
		cmp	ax, dx
		jnb	short $+2
		mov	cx, [di+3]
		mov	al, [di+2]
		mov	ah, 0
		imul	ax, 3
		mov	si, [si+3]
		add	si, ax
		xor	dx, dx
		jmp	short loc_2CFE1
; ���������������������������������������������������������������������������

loc_2CFC8:				; CODE XREF: Palette_CopyInto_2CF80+63j
		mov	bx, cx
		mov	al, [bx]
		mov	[si], al
		mov	al, [bx+1]
		mov	[si+1],	al
		mov	al, [bx+2]
		mov	[si+2],	al
		inc	dx
		add	cx, 3
		add	si, 3

loc_2CFE1:				; CODE XREF: Palette_CopyInto_2CF80+46j
		cmp	[di], dx
		ja	short loc_2CFC8

loc_2CFE5:				; CODE XREF: Palette_CopyInto_2CF80+12j
					; Palette_CopyInto_2CF80+18j
		pop	di
		pop	si
		pop	bp
		retf
Palette_CopyInto_2CF80	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	cl, [bp+0Ah]
		cmp	[si+2],	cl
		jnb	short loc_2D010
		mov	al, [si+2]
		mov	ah, 0
		add	ax, [si]
		mov	dl, cl
		mov	dh, 0
		cmp	ax, dx
		jbe	short loc_2D010
		push	cx
		push	word ptr [bp+8]
		call	sub_2F002

loc_2D010:				; CODE XREF: seg082:0386j seg082:0395j
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-17. Une étape de fondu de la palette arg_0 vers la palette arg_2
; (Palette_StepTowardTarget_2ED93) ; renvoie 0 quand le fondu est terminé.
; ==============================================================================================
Palette_FadeStep_2D013	proc far		; CODE XREF: Palette_FadeToColor_2D09C+A5p
					; Palette_FadeFromColor_2D165+67p

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
		mov	di, [bp+arg_2]
		mov	al, [di+2]
		mov	ah, 0
		imul	ax, 3
		mov	dx, [si+3]
		add	dx, ax
		mov	[bp+var_2], dx
		mov	ax, [di+3]
		mov	[bp+var_4], ax
		push	dx
		push	ax
		mov	ax, [di]
		imul	ax, 3
		push	ax
		call	Palette_StepTowardTarget_2ED93
		pop	di
		pop	si
		leave
		retf
Palette_FadeStep_2D013	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-17. Libère le tableau RVB, puis l'objet si bit 1 de l'argument.
; ==============================================================================================
Palette_Destruct_2D048	proc far		; CODE XREF: sub_3B0B+149P
					; sub_3D2E+71P	...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_2D073
		cmp	word ptr [si+3], 0
		jz	short loc_2D066
		push	word ptr [si+3]
		call	sub_308
		pop	cx

loc_2D066:				; CODE XREF: Palette_Destruct_2D048+13j
		test	di, 1
		jz	short loc_2D073
		push	si
		call	sub_308
		pop	cx

loc_2D073:				; CODE XREF: Palette_Destruct_2D048+Dj
					; Palette_Destruct_2D048+22j
		pop	di
		pop	si
		pop	bp
		retf
Palette_Destruct_2D048	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-17. Palette_LoadFromResource_2CCE5 puis Palette_Upload_2CDE1 sans
; découpage.
; ==============================================================================================
Palette_LoadAndUpload_2D077	proc far		; CODE XREF: sub_51049+1C4P

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr Palette_LoadFromResource_2CCE5
		add	sp, 4
		push	0
		push	word ptr [si]
		mov	al, [si+2]
		push	ax
		push	si
		push	cs
		call	near ptr Palette_Upload_2CDE1
		add	sp, 8
		pop	si
		pop	bp
		retf
Palette_LoadAndUpload_2D077	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-17. Fondu de disparition : construit une palette unie (couleur arg_2) sur
; la plage, puis répète Palette_FadeStep_2D013 de la palette courante vers elle et
; Palette_Upload_2CDE1 (pas arg_4) jusqu'à la fin.
; ==============================================================================================
Palette_FadeToColor_2D09C	proc far		; CODE XREF: sub_4AD86+712P
					; sub_6B9C0+5377P ...

var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_9		= byte ptr -9
var_8		= word ptr -8
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= byte ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		push	di
		mov	di, [bp+arg_0]
		push	seg seg082
		push	offset loc_2D1E7
		push	1
		push	[bp+arg_8]
		push	large 30000h
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[bp+var_2], ax
		xor	dx, dx
		jmp	short loc_2D0F9
; ���������������������������������������������������������������������������

loc_2D0C7:				; CODE XREF: Palette_FadeToColor_2D09C+60j
		mov	ax, dx
		imul	ax, 3
		mov	bx, [bp+var_2]
		add	bx, ax
		mov	si, [bp+arg_2]
		mov	al, [si]
		mov	[bx], al
		mov	ax, dx
		imul	ax, 3
		mov	bx, [bp+var_2]
		add	bx, ax
		mov	al, [si+2]
		mov	[bx+2],	al
		mov	ax, dx
		imul	ax, 3
		mov	bx, [bp+var_2]
		add	bx, ax
		mov	al, [si+1]
		mov	[bx+1],	al
		inc	dx

loc_2D0F9:				; CODE XREF: Palette_FadeToColor_2D09C+29j
		cmp	dx, [bp+arg_8]
		jb	short loc_2D0C7
		mov	al, [bp+arg_6]
		mov	[bp+var_9], al
		mov	ax, [bp+arg_8]
		mov	[bp+var_C], ax
		mov	ax, [bp+var_2]
		mov	[bp+var_E], ax
		push	ds
		push	ax
		push	[bp+var_C]
		mov	al, [bp+var_9]
		push	ax
		lea	ax, [bp+var_8]
		push	ax
		push	cs
		call	near ptr sub_2CD9E
		add	sp, 0Ah
		jmp	short loc_2D13B
; ���������������������������������������������������������������������������

loc_2D126:				; CODE XREF: Palette_FadeToColor_2D09C+ADj
		mov	ax, [bp+arg_4]
		mov	[bp+var_10], ax
		push	ax
		push	word ptr [di]
		mov	al, [di+2]
		push	ax
		push	di
		push	cs
		call	near ptr Palette_Upload_2CDE1
		add	sp, 8

loc_2D13B:				; CODE XREF: Palette_FadeToColor_2D09C+88j
		lea	ax, [bp+var_8]
		push	ax
		push	di
		push	cs
		call	near ptr Palette_FadeStep_2D013
		add	sp, 4
		or	al, al
		jnz	short loc_2D126
		push	[bp+var_2]
		call	sub_308
		pop	cx
		push	2
		lea	ax, [bp+var_8]
		push	ax
		push	cs
		call	near ptr Palette_Destruct_2D048
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
Palette_FadeToColor_2D09C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-17. Fondu d'apparition : garde une copie de la palette cible, remplit la
; plage (premier indice, nombre) avec une couleur unie (arg_2, noir dans mid1), puis répète
; Palette_FadeStep_2D013 vers la copie et Palette_Upload_2CDE1 (pas arg_4) jusqu'à la fin.
; ==============================================================================================
Palette_FadeFromColor_2D165	proc far		; CODE XREF: sub_4AD86+68BP
					; Midgame1_PlayPart1_5FCF0+FD3P ...

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_7		= byte ptr -7
var_6		= word ptr -6
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= byte ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	al, [bp+arg_6]
		mov	[bp+var_7], al
		mov	ax, [bp+arg_8]
		mov	[bp+var_A], ax
		push	ax
		mov	al, [bp+var_7]
		push	ax
		lea	ax, [bp+var_6]
		push	ax
		push	cs
		call	near ptr Palette_Alloc_2CC76
		add	sp, 6
		mov	di, si
		push	word ptr [di]
		mov	al, [di+2]
		push	ax
		push	di
		lea	ax, [bp+var_6]
		push	ax
		push	cs
		call	near ptr Palette_CopyInto_2CF80
		add	sp, 8
		push	[bp+arg_8]
		mov	al, [bp+arg_6]
		push	ax
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr Palette_FillRange_2CF08
		jmp	short loc_2D1C3
; ���������������������������������������������������������������������������

loc_2D1B1:				; CODE XREF: Palette_FadeFromColor_2D165+6Fj
		mov	ax, [bp+arg_4]
		mov	[bp+var_C], ax
		push	ax
		push	word ptr [si]
		mov	al, [si+2]
		push	ax
		push	si
		push	cs
		call	near ptr Palette_Upload_2CDE1

loc_2D1C3:				; CODE XREF: Palette_FadeFromColor_2D165+4Aj
		add	sp, 8
		lea	ax, [bp+var_6]
		push	ax
		push	si
		push	cs
		call	near ptr Palette_FadeStep_2D013
		add	sp, 4
		or	al, al
		jnz	short loc_2D1B1
		push	2
		lea	ax, [bp+var_6]
		push	ax
		push	cs
		call	near ptr Palette_Destruct_2D048
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
Palette_FadeFromColor_2D165	endp

; ���������������������������������������������������������������������������

loc_2D1E7:				; DATA XREF: Palette_Alloc_2CC76+15o
					; Palette_LoadFromResource_2CCE5+58o ...
		push	bp
		mov	bp, sp
		mov	dx, [bp+6]
		or	dx, dx
		jnz	short loc_2D1FD
		push	3
		call	CRT_Malloc16_Retry
		pop	cx
		mov	dx, ax
		or	ax, ax

loc_2D1FD:				; CODE XREF: seg082:057Fj
		mov	ax, dx
		pop	bp
		retf
seg082		ends

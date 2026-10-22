seg084		segment	byte public 'CODE' use16
		assume cs:seg084
		;org 7
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_2D9C7	proc far		; CODE XREF: sub_2D9C7+1Bp
					; sub_2DA16+14p ...
		push	bp
		mov	bp, sp
		push	si
		push	8
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_2DA0B
		or	si, si
		jz	short loc_2D9DF
		jmp	short loc_2D9E8
; ���������������������������������������������������������������������������

loc_2D9DF:				; CODE XREF: sub_2D9C7+14j
		push	8
		push	cs
		call	near ptr sub_2D9C7
		pop	cx
		mov	si, ax

loc_2D9E8:				; CODE XREF: sub_2D9C7+16j
		or	ax, ax
		jz	short loc_2DA07
		mov	word ptr [si], 4008h
		mov	word ptr [si+2], 0
		mov	word ptr [si+4], 0
		mov	word ptr [si], 400Ch
		mov	word ptr [si+6], 0
		mov	ax, si
		jmp	short loc_2DA09
; ���������������������������������������������������������������������������

loc_2DA07:				; CODE XREF: sub_2D9C7+23j
		mov	ax, si

loc_2DA09:				; CODE XREF: sub_2D9C7+3Ej
		jmp	short loc_2DA0D
; ���������������������������������������������������������������������������

loc_2DA0B:				; CODE XREF: sub_2D9C7+10j
		mov	ax, si

loc_2DA0D:				; CODE XREF: sub_2D9C7:loc_2DA09j
		mov	dx, ax
		or	dx, dx
		mov	ax, dx
		pop	si
		pop	bp
		retf
sub_2D9C7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_2DA16	proc far		; CODE XREF: LayerGroup_Add_2DB84+13p

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		push	8
		push	cs
		call	near ptr sub_2D9C7
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_2DA50
		mov	word ptr [di], 4008h
		mov	word ptr [di+2], 0
		mov	word ptr [di+4], 0
		mov	word ptr [di], 400Ch
		mov	ax, [bp+var_2]
		mov	[di+6],	ax
		mov	ax, di
		jmp	short loc_2DA52
; ���������������������������������������������������������������������������

loc_2DA50:				; CODE XREF: sub_2DA16+1Cj
		mov	ax, di

loc_2DA52:				; CODE XREF: sub_2DA16+38j
		mov	di, ax
		mov	ax, [bp+arg_2]
		mov	[di+6],	ax
		push	di
		push	si
		call	LinkedList_InsertAtTail_2FA3F
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_2DA16	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+6]
		mov	ax, [bp+8]
		mov	[bp-2],	ax
		push	8
		push	cs
		call	near ptr sub_2D9C7
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_2DAA2
		mov	word ptr [di], 4008h
		mov	word ptr [di+2], 0
		mov	word ptr [di+4], 0
		mov	word ptr [di], 400Ch
		mov	ax, [bp-2]
		mov	[di+6],	ax
		mov	ax, di
		jmp	short loc_2DAA4
; ���������������������������������������������������������������������������

loc_2DAA2:				; CODE XREF: seg084:00C4j
		mov	ax, di

loc_2DAA4:				; CODE XREF: seg084:00E0j
		mov	di, ax
		mov	ax, [bp+8]
		mov	[di+6],	ax
		push	di
		push	si
		call	LinkedList_InsertAtHead_2FA11
		add	sp, 4
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_2DABA	proc far		; CODE XREF: sub_2DABA+2Cp
					; sub_2DB1C+15p

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_2DB00
; ���������������������������������������������������������������������������

loc_2DACC:				; CODE XREF: sub_2DABA+55j
		mov	bx, [bp+var_2]
		push	word ptr [bx+6]
		mov	bx, [bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+14h]
		pop	cx
		mov	bx, [bp+var_2]
		mov	ax, [bx+6]
		add	ax, 4
		push	ax
		push	cs
		call	near ptr sub_2DABA
		pop	cx
		mov	bx, [bp+var_2]
		mov	di, [bx+6]
		or	di, di
		jz	short loc_2DB00
		push	3
		push	di
		mov	bx, [di]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short $+2

loc_2DB00:				; CODE XREF: sub_2DABA+10j
					; sub_2DABA+38j
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	sub_2FC4A
		add	sp, 4
		or	ax, ax
		jnz	short loc_2DACC
		push	si
		call	sub_2FC0C
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_2DABA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_2DB1C	proc far		; CODE XREF: sub_2DB51+1Cp
					; DATA XREF: dseg:18BBo

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_2DB4D
		mov	word ptr [si], 18BBh
		push	si
		push	cs
		call	near ptr sub_2DABA
		pop	cx
		mov	word ptr [si], 18B7h
		push	si
		call	sub_2FC0C
		pop	cx
		test	di, 1
		jz	short loc_2DB4D
		push	si
		call	sub_308
		pop	cx

loc_2DB4D:				; CODE XREF: sub_2DB1C+Dj
					; sub_2DB1C+28j
		pop	di
		pop	si
		pop	bp
		retf
sub_2DB1C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_2DB51	proc far		; CODE XREF: sub_AD6F+25P
					; Scene_Destruct_2DCFC+1Cp ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_2DB80
		mov	word ptr [si], 18BFh
		push	2
		mov	ax, si
		add	ax, 4
		push	ax
		push	cs
		call	near ptr sub_2DB1C
		add	sp, 4
		test	di, 1
		jz	short loc_2DB80
		push	si
		call	sub_308
		pop	cx

loc_2DB80:				; CODE XREF: sub_2DB51+Dj
					; sub_2DB51+26j
		pop	di
		pop	si
		pop	bp
		retf
sub_2DB51	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-17. Ajoute un calque à la liste +4 d'une scène ou d'un calque parent
; (sub_2DA16), puis le rattache au parent (sub_2DBAB, pas lue). Un calque enfant est dessiné
; par rapport à son parent.
; ==============================================================================================
LayerGroup_Add_2DB84	proc far		; CODE XREF: sub_5803+29DP
					; sub_6162+7CP	...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		mov	ax, si
		add	ax, 4
		push	ax
		push	cs
		call	near ptr sub_2DA16
		add	sp, 4
		push	si
		push	di
		nop
		push	cs
		call	near ptr sub_2DBAB
		add	sp, 4
		pop	di
		pop	si
		pop	bp
		retf
LayerGroup_Add_2DB84	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_2DBAB	proc far		; CODE XREF: LayerGroup_Add_2DB84+1Dp

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jnz	short loc_2DBBE
		mov	ax, [bp+arg_2]
		mov	[si+2],	ax

loc_2DBBE:				; CODE XREF: sub_2DBAB+Bj
		pop	si
		pop	bp
		retf
sub_2DBAB	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-17. Cherche le calque dans la liste +4, le retire (sub_2FB99) et le détruit
; (destructeur virtuel, argument 3).
; ==============================================================================================
LayerGroup_Remove_2DBC1	proc far		; CODE XREF: sub_6162+EEP sub_AD6F+1AP ...

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_2DC05
; ���������������������������������������������������������������������������

loc_2DBD2:				; CODE XREF: LayerGroup_Remove_2DBC1+58j
		mov	bx, [bp+var_2]
		mov	ax, [bx+6]
		cmp	ax, [bp+arg_2]
		jnz	short loc_2DC05
		push	bx
		mov	ax, si
		add	ax, 4
		push	ax
		call	LinkedList_Remove_2FB99
		add	sp, 4
		cmp	[bp+var_2], 0
		jz	short loc_2DC03
		push	3
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_2DC1B
; ���������������������������������������������������������������������������

loc_2DC03:				; CODE XREF: LayerGroup_Remove_2DBC1+2Fj
		jmp	short loc_2DC1B
; ���������������������������������������������������������������������������

loc_2DC05:				; CODE XREF: LayerGroup_Remove_2DBC1+Fj
					; LayerGroup_Remove_2DBC1+1Aj
		lea	ax, [bp+var_2]
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_2FC4A
		add	sp, 4
		or	ax, ax
		jnz	short loc_2DBD2

loc_2DC1B:				; CODE XREF: LayerGroup_Remove_2DBC1+40j
					; LayerGroup_Remove_2DBC1:loc_2DC03j
		pop	si
		leave
		retf
LayerGroup_Remove_2DBC1	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	word ptr [si+2], 0
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-17. Appelle la méthode virtuelle +28 (avance d'une image) de chaque calque
; de la liste +4.
; ==============================================================================================
LayerGroup_AdvanceAll_2DC2D	proc far		; CODE XREF: seg004:0264P seg014:0D39P ...

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_2DC4D
; ���������������������������������������������������������������������������

loc_2DC3E:				; CODE XREF: LayerGroup_AdvanceAll_2DC2D+34j
		mov	bx, [bp+var_2]
		push	word ptr [bx+6]
		mov	bx, [bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+1Ch]
		pop	cx

loc_2DC4D:				; CODE XREF: LayerGroup_AdvanceAll_2DC2D+Fj
		lea	ax, [bp+var_2]
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_2FC4A
		add	sp, 4
		or	ax, ax
		jnz	short loc_2DC3E
		pop	si
		leave
		retf
LayerGroup_AdvanceAll_2DC2D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-17. Constructeur de base d'un groupe de calques (31 octets, alloué si nul)
; : liste de calques en +4, position +12/+14 = 0, durée d'image via Scene_SetFps_2DE27(arg_2),
; +18 = arg_4 (palette ou style, 255 = aucun ; sinon appliqué par sub_2EC80), +19 = arg_6
; (surface de dessin), compteur d'images +29 = 0.
; ==============================================================================================
LayerGroup_Construct_2DC66	proc far		; CODE XREF: sub_4C1F+30P Scene_Create_C55E+26P ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_2DC7F
		push	1Fh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_2DCF7

loc_2DC7F:				; CODE XREF: LayerGroup_Construct_2DC66+9j
		mov	word ptr [si], 18BFh
		mov	word ptr [si+4], 18B7h
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], 18BBh
		mov	word ptr [si+2], 0
		mov	word ptr [si+0Ah], 11BCh
		mov	word ptr [si+0Ch], 0
		mov	word ptr [si+0Eh], 0
		mov	word ptr [si+0Ah], 11C8h
		mov	word ptr [si], 3FD8h
		mov	word ptr [si+0Ah], 3FF8h
		xor	eax, eax
		mov	[si+19h], eax
		mov	[si+15h], eax
		cmp	[bp+arg_4], 0FFh
		jz	short loc_2DCDA
		mov	al, [bp+arg_4]
		push	ax
		push	word_46F44
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4

loc_2DCDA:				; CODE XREF: LayerGroup_Construct_2DC66+62j
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr Scene_SetFps_2DE27
		add	sp, 4
		mov	al, [bp+arg_4]
		mov	[si+12h], al
		mov	ax, [bp+arg_6]
		mov	[si+13h], ax
		mov	word ptr [si+1Dh], 0

loc_2DCF7:				; CODE XREF: LayerGroup_Construct_2DC66+17j
		mov	ax, si
		pop	si
		pop	bp
		retf
LayerGroup_Construct_2DC66	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-17. Destructeur de groupe de calques / scène : vide la liste (sub_2DB51),
; libère l'objet si bit 1 de l'argument.
; ==============================================================================================
Scene_Destruct_2DCFC	proc far		; CODE XREF: sub_3B0B+1B5P
					; seg002:0D03P	...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_2DD2B
		mov	word ptr [si], 3FD8h
		mov	word ptr [si+0Ah], 3FF8h
		push	0
		push	si
		push	cs
		call	near ptr sub_2DB51
		add	sp, 4
		test	di, 1
		jz	short loc_2DD2B
		push	si
		call	sub_308
		pop	cx

loc_2DD2B:				; CODE XREF: Scene_Destruct_2DCFC+Dj
					; Scene_Destruct_2DCFC+26j
		pop	di
		pop	si
		pop	bp
		retf
Scene_Destruct_2DCFC	endp

; ���������������������������������������������������������������������������

loc_2DD2F:				; DATA XREF: dseg:0536o dseg:05B2o ...
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2DD37:				; CODE XREF: seg002:0D45J seg002:0E79J ...
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2DD3F:				; CODE XREF: seg002:0D2DJ seg002:0E61J ...
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2DD47:				; DATA XREF: dseg:0526o dseg:05A2o ...
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	ax, [si+0Ch]
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2DD54:				; DATA XREF: dseg:052Ao dseg:05A6o ...
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	ax, [si+0Eh]
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2DD61:				; CODE XREF: seg002:0D39J seg002:0E6DJ ...
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+6]
		mov	ax, [bp+8]
		mov	[bp-2],	ax
		mov	ax, [bp+0Ah]
		mov	[bp-4],	ax
		mov	ax, [bp-2]
		add	[si+0Ch], ax
		mov	ax, [bp-4]
		add	[si+0Eh], ax
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_2DD86	proc far		; CODE XREF: Conv_PlayScript_5AA4E+778P
					; Conv_PlayScript_5AA4E+7AEP ...

var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		movzx	eax, word ptr [si+10h]
		mov	[bp+var_6], eax
		mov	[si+19h], eax
		mov	eax, dword_47ABB
		mov	[si+15h], eax
		cmp	byte ptr [si+12h], 0FFh
		jz	short loc_2DDD9
		mov	al, [si+12h]
		push	ax
		push	word_46F44
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4
		jmp	short loc_2DDD9
; ���������������������������������������������������������������������������

loc_2DDC2:				; CODE XREF: sub_2DD86+67j
		push	word ptr [si+0Eh]
		push	word ptr [si+0Ch]
		mov	bx, [bp+var_2]
		push	word ptr [bx+6]
		mov	bx, [bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6

loc_2DDD9:				; CODE XREF: sub_2DD86+28j
					; sub_2DD86+3Aj
		lea	ax, [bp+var_2]
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_2FC4A
		add	sp, 4
		or	ax, ax
		jnz	short loc_2DDC2
		push	word_46F44
		push	word ptr [si+13h]
		call	UI_ApplyEncodingHelper_2EC65
		add	sp, 4
		push	si
		mov	bx, [si]
		call	dword ptr [bx+1Ch]
		pop	cx
		mov	ax, si
		add	ax, 15h
		push	ax
		call	Stopwatch_WaitElapsed_3F023
		pop	cx
		pop	si
		leave
		retf
sub_2DD86	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-17. Méthode virtuelle +28 de la scène : avance tous les calques
; (LayerGroup_AdvanceAll_2DC2D) puis incrémente le compteur d'images +29 (comparé par les
; cinématiques pour déclencher sons et changements).
; ==============================================================================================
Scene_AdvanceFrame_2DE14	proc far		; CODE XREF: Conv_PlayScript_5AA4E+1235P
					; DATA XREF: dseg:053Eo ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr LayerGroup_AdvanceAll_2DC2D
		pop	cx
		inc	word ptr [si+1Dh]
		pop	si
		pop	bp
		retf
Scene_AdvanceFrame_2DE14	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-17. Durée d'une image de scène (+16) = 60 / arg_2 tics, au moins 1 (tics à
; 60 Hz). Utilisé avec 10, 15 et 20 images par seconde dans la cinématique mid1.
; ==============================================================================================
Scene_SetFps_2DE27	proc far		; CODE XREF: LayerGroup_Construct_2DC66+7Ap
					; Midgame1_PlayPart1_5FCF0+12F3P ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	bx, [bp+arg_2]
		mov	ax, 3Ch	; '<'
		xor	dx, dx
		div	bx
		cmp	ax, 1
		jge	short loc_2DE42
		mov	ax, 1
		jmp	short loc_2DE49
; ���������������������������������������������������������������������������

loc_2DE42:				; CODE XREF: Scene_SetFps_2DE27+14j
		mov	ax, 3Ch	; '<'
		xor	dx, dx
		div	bx

loc_2DE49:				; CODE XREF: Scene_SetFps_2DE27+19j
		mov	[si+10h], ax
		pop	si
		pop	bp
		retf
Scene_SetFps_2DE27	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_2DE4F	proc far		; CODE XREF: Layer_ConstructAtOrigin_2DE95+6Bp
					; seg084:05C0p	...

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
		mov	di, [bp+arg_2]
		mov	eax, [di]
		mov	[bp+var_4], eax
		mov	al, [di+4]
		mov	[bp+var_5], al
		mov	eax, [bp+var_4]
		mov	[si+11h], eax
		mov	al, [bp+var_5]
		mov	[si+15h], al
		mov	byte ptr [si+16h], 0
		mov	dword ptr [si+17h], 0
		mov	eax, [di+6]
		mov	[si+17h], eax
		mov	word ptr [si+1Bh], 0
		pop	di
		pop	si
		leave
		retf
sub_2DE4F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-21. Calque de base (1Dh octets, alloué si nul), même table de méthodes que
; Layer_Construct_2DF9B (dseg 18DFh = 6367) : ressource arg_2 attachée par sub_2DE4F, position
; +0Ch et +0Eh mises à 0. Équivaut à Layer_Construct_2DF9B(objet, ressource, 0, 0). mid12 :
; mid12 0 et 1.
; ==============================================================================================
Layer_ConstructAtOrigin_2DE95	proc far		; CODE XREF: seg014:1157P seg014:1328P ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_2DEAE
		push	1Dh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_2DF10

loc_2DEAE:				; CODE XREF: Layer_ConstructAtOrigin_2DE95+9j
		mov	word ptr [si], 18BFh
		mov	word ptr [si+4], 18B7h
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], 18BBh
		mov	word ptr [si+2], 0
		mov	word ptr [si+0Ah], 11BCh
		mov	word ptr [si+0Ah], 11C8h
		mov	word ptr [si+0Ah], 11D8h
		mov	word ptr [si], 18DFh
		mov	word ptr [si+0Ah], 18FFh
		mov	dword ptr [si+11h], 0
		mov	byte ptr [si+15h], 2
		mov	byte ptr [si+16h], 0
		mov	dword ptr [si+17h], 0
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_2DE4F
		add	sp, 4
		mov	word ptr [si+0Ch], 0
		mov	word ptr [si+0Eh], 0

loc_2DF10:				; CODE XREF: Layer_ConstructAtOrigin_2DE95+17j
		mov	ax, si
		pop	si
		pop	bp
		retf
Layer_ConstructAtOrigin_2DE95	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		or	si, si
		jnz	short loc_2DF2E
		push	1Dh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_2DF96

loc_2DF2E:				; CODE XREF: seg084:055Ej
		mov	word ptr [si], 18BFh
		mov	word ptr [si+4], 18B7h
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], 18BBh
		mov	word ptr [si+2], 0
		mov	word ptr [si+0Ah], 11BCh
		mov	word ptr [si+0Ah], 11C8h
		mov	word ptr [si+0Ah], 11D8h
		mov	word ptr [si], 18DFh
		mov	word ptr [si+0Ah], 18FFh
		mov	dword ptr [si+11h], 0
		mov	byte ptr [si+15h], 2
		mov	byte ptr [si+16h], 0
		mov	dword ptr [si+17h], 0
		push	word ptr [bp+8]
		push	si
		push	cs
		call	near ptr sub_2DE4F
		add	sp, 4
		mov	word ptr [si+0Ch], 0
		mov	word ptr [si+0Eh], 0
		mov	ax, [bp+0Ah]
		mov	[si+1Bh], ax

loc_2DF96:				; CODE XREF: seg084:056Cj
		mov	ax, si
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-17. Calque de base (29 octets, alloué si nul) : liste d'enfants +4,
; descripteur de ressource d'images +17 (type 2, attaché par sub_2DE4F, pas lue), position x
; +12 = arg_4, y +14 = arg_6 (pixels, écran 320 × 200). Table de méthodes dseg 6367.
; ==============================================================================================
Layer_Construct_2DF9B	proc far		; CODE XREF: sub_5803+26BP
					; sub_5803+425P ...

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_2DFB7
		push	1Dh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_2E027

loc_2DFB7:				; CODE XREF: Layer_Construct_2DF9B+Cj
		mov	word ptr [si], 18BFh
		mov	word ptr [si+4], 18B7h
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], 18BBh
		mov	word ptr [si+2], 0
		mov	word ptr [si+0Ah], 11BCh
		mov	word ptr [si+0Ah], 11C8h
		mov	word ptr [si+0Ah], 11D8h
		mov	word ptr [si], 18DFh
		mov	word ptr [si+0Ah], 18FFh
		mov	dword ptr [si+11h], 0
		mov	byte ptr [si+15h], 2
		mov	byte ptr [si+16h], 0
		mov	dword ptr [si+17h], 0
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_2DE4F
		add	sp, 4
		mov	ax, [bp+arg_4]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		mov	[si+0Ch], ax
		mov	ax, [bp+var_4]
		mov	[si+0Eh], ax

loc_2E027:				; CODE XREF: Layer_Construct_2DF9B+1Aj
		mov	ax, si
		pop	si
		leave
		retf
Layer_Construct_2DF9B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-17. Comme Layer_Construct_2DF9B, avec le numéro d'image affichée +27 =
; arg_8 : image fixe n de la ressource.
; ==============================================================================================
ImageLayer_Construct_2E02C	proc far		; CODE XREF: ScaledImageLayer_Construct_9391+28P ScaledMovingLayer_Construct_9544+4FP ...

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_2E048
		push	1Dh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_2E0BE

loc_2E048:				; CODE XREF: ImageLayer_Construct_2E02C+Cj
		mov	word ptr [si], 18BFh
		mov	word ptr [si+4], 18B7h
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], 18BBh
		mov	word ptr [si+2], 0
		mov	word ptr [si+0Ah], 11BCh
		mov	word ptr [si+0Ah], 11C8h
		mov	word ptr [si+0Ah], 11D8h
		mov	word ptr [si], 18DFh
		mov	word ptr [si+0Ah], 18FFh
		mov	dword ptr [si+11h], 0
		mov	byte ptr [si+15h], 2
		mov	byte ptr [si+16h], 0
		mov	dword ptr [si+17h], 0
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_2DE4F
		add	sp, 4
		mov	ax, [bp+arg_4]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		mov	[si+0Ch], ax
		mov	ax, [bp+var_4]
		mov	[si+0Eh], ax
		mov	ax, [bp+arg_8]
		mov	[si+1Bh], ax

loc_2E0BE:				; CODE XREF: ImageLayer_Construct_2E02C+1Aj
		mov	ax, si
		pop	si
		leave
		retf
ImageLayer_Construct_2E02C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_2E0C3	proc far		; CODE XREF: seg005:0C72P sub_A100+7BP ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_2E135
		mov	word ptr [si], 18DFh
		mov	word ptr [si+0Ah], 18FFh
		push	si
		push	si
		push	cs
		call	near ptr LayerGroup_Remove_2DBC1
		add	sp, 4
		cmp	byte ptr [si+16h], 0
		jz	short loc_2E10A
		cmp	dword ptr [si+11h], 0
		jz	short loc_2E10A
		push	0
		mov	al, [si+15h]
		push	ax
		mov	ax, si
		add	ax, 11h
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_2E10A:				; CODE XREF: sub_2E0C3+25j
					; sub_2E0C3+2Cj
		mov	dword ptr [si+11h], 0
		mov	byte ptr [si+16h], 0
		mov	dword ptr [si+17h], 0
		push	0
		push	si
		push	cs
		call	near ptr sub_2DB51
		add	sp, 4
		test	di, 1
		jz	short loc_2E135
		push	si
		call	sub_308
		pop	cx

loc_2E135:				; CODE XREF: sub_2E0C3+Dj
					; sub_2E0C3+69j
		pop	di
		pop	si
		pop	bp
		retf
sub_2E0C3	endp

; ���������������������������������������������������������������������������

; ==============================================================================================
; far, LUE 2026-10-17. Méthode +4 : x du calque (+12) plus x absolu du parent (+2) s'il
; existe.
; ==============================================================================================
Layer_GetX_2E139:				; DATA XREF: dseg:1332o dseg:1362o ...
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		cmp	word ptr [si+2], 0
		jz	short loc_2E157
		push	word ptr [si+2]
		mov	bx, [si+2]
		mov	bx, [bx]
		call	dword ptr [bx+4]
		pop	cx
		add	ax, [si+0Ch]
		jmp	short loc_2E15A
; ���������������������������������������������������������������������������

loc_2E157:				; CODE XREF: seg084:0784j
		mov	ax, [si+0Ch]

loc_2E15A:				; CODE XREF: seg084:0795j
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, LUE 2026-10-17. Méthode +8 : y du calque (+14) plus y absolu du parent (+2) s'il
; existe.
; ==============================================================================================
Layer_GetY_2E15D:				; DATA XREF: dseg:1336o dseg:1366o ...
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		cmp	word ptr [si+2], 0
		jz	short loc_2E17B
		push	word ptr [si+2]
		mov	bx, [si+2]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		pop	cx
		add	ax, [si+0Eh]
		jmp	short loc_2E17E
; ���������������������������������������������������������������������������

loc_2E17B:				; CODE XREF: seg084:07A8j
		mov	ax, [si+0Eh]

loc_2E17E:				; CODE XREF: seg084:07B9j
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-17. Si l'image +27 n'est pas -1 : dessine l'image +27 de la ressource +17
; en (x, y) sur la surface word_46F44 (sub_32CD8, reprise sous le nom
; Render_MeasureOrDrawTextString_32CD8) ; puis dessine les enfants (méthode +16) à cette
; position.
; ==============================================================================================
Layer_DrawAt_2E181	proc far		; CODE XREF: Layer_DrawAtOwnPos_2E202+24p
					; seg084:0891p

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_2], di
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	dx, [si+1Bh]
		cmp	dx, 0FFFFh
		jz	short loc_2E1CC
		push	dx
		push	0
		mov	al, [si+15h]
		push	ax
		push	large dword ptr	[si+11h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	word_46F44
		call	Render_MeasureOrDrawTextString_32CD8
		add	sp, 0Ch
		jmp	short $+2

loc_2E1CC:				; CODE XREF: Layer_DrawAt_2E181+1Dj
		mov	[bp+var_6], 0
		jmp	short loc_2E1E8
; ���������������������������������������������������������������������������

loc_2E1D3:				; CODE XREF: Layer_DrawAt_2E181+7Bj
		push	[bp+arg_4]
		push	di
		mov	bx, [bp+var_6]
		push	word ptr [bx+6]
		mov	bx, [bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6

loc_2E1E8:				; CODE XREF: Layer_DrawAt_2E181+50j
		lea	ax, [bp+var_6]
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_2FC4A
		add	sp, 4
		or	ax, ax
		jnz	short loc_2E1D3
		pop	di
		pop	si
		leave
		retf
Layer_DrawAt_2E181	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-17. Dessine le calque à sa position absolue (méthodes +4 et +8 = x et y
; absolus, Layer_GetX_2E139 / Layer_GetY_2E15D) par Layer_DrawAt_2E181.
; ==============================================================================================
Layer_DrawAtOwnPos_2E202	proc far		; CODE XREF: seg004:019BP seg005:0CACJ ...

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		pop	cx
		mov	[bp+var_2], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		pop	cx
		mov	[bp+var_4], ax
		push	ax
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr Layer_DrawAt_2E181
		add	sp, 6
		pop	si
		leave
		retf
Layer_DrawAtOwnPos_2E202	endp

; ���������������������������������������������������������������������������

; ==============================================================================================
; far, LUE 2026-10-17. Méthode +16 des calques : dessine en (x du calque + x du parent, y du
; calque + y du parent) par Layer_DrawAt_2E181.
; ==============================================================================================
Layer_Draw_2E22F:				; CODE XREF: seg005:0CB8J seg014:28C1J ...
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+6]
		mov	ax, [si+0Ch]
		add	ax, [bp+8]
		mov	[bp-2],	ax
		mov	ax, [si+0Eh]
		add	ax, [bp+0Ah]
		mov	[bp-4],	ax
		push	ax
		push	word ptr [bp-2]
		push	si
		push	cs
		call	near ptr Layer_DrawAt_2E181
		add	sp, 6
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, LUE 2026-10-17. Méthode +20 : libère le bloc de la ressource d'images +17 s'il est
; possédé (Memory_TypedFree_2B8A4) et remet le descripteur à zéro.
; ==============================================================================================
Layer_ReleaseResource_2E25A:				; DATA XREF: dseg:1372o dseg:15FBo ...
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		cmp	byte ptr [si+16h], 0
		jz	short loc_2E287
		cmp	dword ptr [si+11h], 0
		jz	short loc_2E287
		push	0
		mov	al, [si+15h]
		push	ax
		mov	ax, si
		add	ax, 11h
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_2E287:				; CODE XREF: seg084:08A5j seg084:08ACj
		mov	dword ptr [si+11h], 0
		mov	byte ptr [si+16h], 0
		mov	dword ptr [si+17h], 0
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-21. Ajoute (arg_2, arg_4) à la position du calque (+0Ch, +0Eh). mid3 :
; replace un décor défilant de 640 pixels quand il sort à gauche (x absolu < −319).
; ==============================================================================================
Layer_MoveBy_2E29E	proc far		; CODE XREF: seg005:0CA0J seg005:0CC4J ...

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		add	[si+0Ch], ax
		mov	ax, [bp+var_4]
		add	[si+0Eh], ax
		pop	si
		leave
		retf
Layer_MoveBy_2E29E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-17. Méthode +28 du calque de base (vtable dseg 6367) : avance seulement les
; enfants (LayerGroup_AdvanceAll_2DC2D) ; l'image affichée ne change pas.
; ==============================================================================================
Layer_Advance_2E2C3	proc far		; CODE XREF: seg014:1D5BP seg014:1E3FP
					; DATA XREF: ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		push	cs
		call	near ptr LayerGroup_AdvanceAll_2DC2D
		pop	cx
		pop	bp
		retf
Layer_Advance_2E2C3	endp

; ���������������������������������������������������������������������������

; ==============================================================================================
; far, LUE 2026-10-17. Méthode +28 du calque mobile (vtable dseg 6519, construit en ligne par
; les cinématiques : Layer_Construct_2DF9B puis vitesse +29 et +31 à 0) : x (+12) += vitesse x
; (+29), y (+14) += vitesse y (+31), en pixels par image de scène ; puis avance les enfants.
; ==============================================================================================
MovingLayer_Advance_2E2D1:				; DATA XREF: dseg:1603o dseg:1663o ...
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+6]
		mov	ax, [si+1Dh]
		mov	[bp-2],	ax
		mov	ax, [si+1Fh]
		mov	[bp-4],	ax
		mov	ax, [bp-2]
		add	[si+0Ch], ax
		mov	ax, [bp-4]
		add	[si+0Eh], ax
		push	si
		push	cs
		call	near ptr LayerGroup_AdvanceAll_2DC2D
		pop	cx
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_2E2FC	proc far		; CODE XREF: seg014:2731P seg014:27E4P ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_2E32B
		mov	word ptr [si], 1977h
		mov	word ptr [si+0Ah], 1997h
		push	0
		push	si
		push	cs
		call	near ptr sub_2E0C3
		add	sp, 4
		test	di, 1
		jz	short loc_2E32B
		push	si
		call	sub_308
		pop	cx

loc_2E32B:				; CODE XREF: sub_2E2FC+Dj
					; sub_2E2FC+26j
		pop	di
		pop	si
		pop	bp
		retf
sub_2E2FC	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+6]
		mov	ax, [bp+8]
		mov	[bp-2],	ax
		mov	ax, [bp+0Ah]
		mov	[bp-4],	ax
		mov	ax, [bp-2]
		mov	[si+21h], ax
		mov	ax, [bp-4]
		mov	[si+23h], ax
		mov	ax, [bp+0Ch]
		mov	[bp-6],	ax
		mov	ax, [bp+0Eh]
		mov	[bp-8],	ax
		mov	ax, [bp-6]
		mov	[si+25h], ax
		mov	ax, [bp-8]
		mov	[si+27h], ax
		mov	ax, [bp+10h]
		mov	[si+2Dh], ax
		mov	word ptr [si+2Fh], 0
		mov	word ptr [si+29h], 0
		mov	word ptr [si+2Bh], 0
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+6]
		mov	ax, [si+0Ch]
		mov	[bp-2],	ax
		mov	ax, [si+0Eh]
		mov	[bp-4],	ax
		mov	ax, [bp-2]
		mov	[si+21h], ax
		mov	ax, [bp-4]
		mov	[si+23h], ax
		mov	ax, [si+0Ch]
		add	ax, [bp+8]
		mov	[bp-6],	ax
		mov	ax, [si+0Eh]
		add	ax, [bp+0Ah]
		mov	[bp-8],	ax
		mov	ax, [bp-6]
		mov	[si+25h], ax
		mov	ax, [bp-8]
		mov	[si+27h], ax
		mov	ax, [bp+0Ch]
		mov	[si+2Dh], ax
		mov	word ptr [si+2Fh], 0
		mov	word ptr [si+29h], 0
		mov	word ptr [si+2Bh], 0
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_2E3D9	proc far		; CODE XREF: seg084:0B29p

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+2Fh]
		cmp	ax, [si+2Dh]
		jbe	short loc_2E3EE
		jmp	loc_2E4C4
; ���������������������������������������������������������������������������

loc_2E3EE:				; CODE XREF: sub_2E3D9+10j
		mov	ax, [si+27h]
		sub	ax, [si+23h]
		xor	dx, dx
		div	word ptr [si+2Dh]
		push	ax
		mov	ax, [si+25h]
		sub	ax, [si+21h]
		xor	dx, dx
		div	word ptr [si+2Dh]
		push	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	ax, [si+25h]
		sub	ax, [si+21h]
		xor	dx, dx
		div	word ptr [si+2Dh]
		mov	[bp+var_2], dx
		mov	ax, [si+27h]
		sub	ax, [si+23h]
		xor	dx, dx
		div	word ptr [si+2Dh]
		mov	[bp+var_4], dx
		mov	ax, [bp+var_2]
		add	[si+29h], ax
		mov	ax, [bp+var_4]
		add	[si+2Bh], ax
		mov	ax, [si+29h]
		cmp	ax, [si+2Dh]
		jbe	short loc_2E444
		mov	ax, 1
		jmp	short loc_2E446
; ���������������������������������������������������������������������������

loc_2E444:				; CODE XREF: sub_2E3D9+64j
		xor	ax, ax

loc_2E446:				; CODE XREF: sub_2E3D9+69j
		mov	[bp+var_6], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		or	ax, ax
		jz	short loc_2E47C
		cmp	word ptr [si+29h], 0
		jge	short loc_2E45D
		mov	ax, 0FFFFh
		jmp	short loc_2E460
; ���������������������������������������������������������������������������

loc_2E45D:				; CODE XREF: sub_2E3D9+7Dj
		mov	ax, 1

loc_2E460:				; CODE XREF: sub_2E3D9+82j
		add	[si+0Ch], ax
		cmp	word ptr [si+29h], 0
		jge	short loc_2E46E
		mov	ax, 0FFFFh
		jmp	short loc_2E471
; ���������������������������������������������������������������������������

loc_2E46E:				; CODE XREF: sub_2E3D9+8Ej
		mov	ax, 1

loc_2E471:				; CODE XREF: sub_2E3D9+93j
		imul	word ptr [si+2Dh]
		mov	dx, [si+29h]
		sub	dx, ax
		mov	[si+29h], dx

loc_2E47C:				; CODE XREF: sub_2E3D9+77j
		mov	ax, [si+2Bh]
		cmp	ax, [si+2Dh]
		jbe	short loc_2E489
		mov	ax, 1
		jmp	short loc_2E48B
; ���������������������������������������������������������������������������

loc_2E489:				; CODE XREF: sub_2E3D9+A9j
		xor	ax, ax

loc_2E48B:				; CODE XREF: sub_2E3D9+AEj
		mov	[bp+var_8], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		or	ax, ax
		jz	short loc_2E4C1
		cmp	word ptr [si+2Bh], 0
		jge	short loc_2E4A2
		mov	ax, 0FFFFh
		jmp	short loc_2E4A5
; ���������������������������������������������������������������������������

loc_2E4A2:				; CODE XREF: sub_2E3D9+C2j
		mov	ax, 1

loc_2E4A5:				; CODE XREF: sub_2E3D9+C7j
		add	[si+0Eh], ax
		cmp	word ptr [si+2Bh], 0
		jge	short loc_2E4B3
		mov	ax, 0FFFFh
		jmp	short loc_2E4B6
; ���������������������������������������������������������������������������

loc_2E4B3:				; CODE XREF: sub_2E3D9+D3j
		mov	ax, 1

loc_2E4B6:				; CODE XREF: sub_2E3D9+D8j
		imul	word ptr [si+2Dh]
		mov	dx, [si+2Bh]
		sub	dx, ax
		mov	[si+2Bh], dx

loc_2E4C1:				; CODE XREF: sub_2E3D9+BCj
		inc	word ptr [si+2Fh]

loc_2E4C4:				; CODE XREF: sub_2E3D9+12j
		pop	si
		leave
		retf
sub_2E3D9	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	ax, [si+2Fh]
		cmp	ax, [si+2Dh]
		jnz	short loc_2E4DB
		mov	ax, 1
		jmp	short loc_2E4DD
; ���������������������������������������������������������������������������

loc_2E4DB:				; CODE XREF: seg084:0B14j
		xor	ax, ax

loc_2E4DD:				; CODE XREF: seg084:0B19j
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2E4E0:				; DATA XREF: dseg:3FC4o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	si
		push	cs
		call	near ptr sub_2E3D9
		pop	cx
		push	si
		push	cs
		call	near ptr LayerGroup_AdvanceAll_2DC2D
		pop	cx
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2E4F6:				; DATA XREF: dseg:3FA8o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_2E525
		mov	word ptr [si], 3FA8h
		mov	word ptr [si+0Ah], 3FC8h
		push	0
		push	si
		push	cs
		call	near ptr sub_2E2FC
		add	sp, 4
		test	di, 1
		jz	short loc_2E525
		push	si
		call	sub_308
		pop	cx

loc_2E525:				; CODE XREF: seg084:0B43j seg084:0B5Cj
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		or	si, si
		jnz	short loc_2E542
		push	1Dh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_2E598

loc_2E542:				; CODE XREF: seg084:0B72j
		mov	word ptr [si], 18BFh
		mov	word ptr [si+4], 18B7h
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], 18BBh
		mov	word ptr [si+2], 0
		mov	word ptr [si+0Ah], 11BCh
		mov	word ptr [si+0Ah], 11C8h
		mov	word ptr [si+0Ah], 11D8h
		mov	word ptr [si], 18DFh
		mov	word ptr [si+0Ah], 18FFh
		mov	dword ptr [si+11h], 0
		mov	byte ptr [si+15h], 2
		mov	byte ptr [si+16h], 0
		mov	dword ptr [si+17h], 0
		mov	word ptr [si], 3F78h
		mov	word ptr [si+0Ah], 3F98h

loc_2E598:				; CODE XREF: seg084:0B80j
		mov	ax, si
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		or	si, si
		jnz	short loc_2E5B6
		push	1Dh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_2E5CA

loc_2E5B6:				; CODE XREF: seg084:0BE6j
		push	word ptr [bp+8]
		push	si
		push	cs
		call	near ptr Layer_ConstructAtOrigin_2DE95
		add	sp, 4
		mov	word ptr [si], 3F78h
		mov	word ptr [si+0Ah], 3F98h

loc_2E5CA:				; CODE XREF: seg084:0BF4j
		mov	ax, si
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-17. Calque animé : Layer_Construct_2DF9B puis table de méthodes dseg 16248,
; dont +28 = AnimLayer_Advance_2E607. L'image affichée +27 commence à 0.
; ==============================================================================================
AnimLayer_Construct_2E5CF	proc far		; CODE XREF: Midgame1_PlayPart1_5FCF0+10E8P
					; Midgame1_PlayPart1_5FCF0+2C8CP ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_2E5E8
		push	1Dh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_2E602

loc_2E5E8:				; CODE XREF: AnimLayer_Construct_2E5CF+9j
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [si], 3F78h
		mov	word ptr [si+0Ah], 3F98h

loc_2E602:				; CODE XREF: AnimLayer_Construct_2E5CF+17j
		mov	ax, si
		pop	si
		pop	bp
		retf
AnimLayer_Construct_2E5CF	endp

; ���������������������������������������������������������������������������

; ==============================================================================================
; far, LUE 2026-10-17. Méthode +28 du calque animé : si l'image +27 est inférieure au nombre
; d'images de la ressource moins 1 (Struct_GetElementCountMinusOne_33352), l'incrémente ; puis
; avance les enfants (LayerGroup_AdvanceAll_2DC2D). L'animation se bloque sur sa dernière
; image.
; ==============================================================================================
AnimLayer_Advance_2E607:				; DATA XREF: dseg:3F94o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	0
		mov	al, [si+15h]
		push	ax
		push	large dword ptr	[si+11h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		or	ax, dx
		jz	short loc_2E64B
		push	0
		mov	al, [si+15h]
		push	ax
		push	large dword ptr	[si+11h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		call	Struct_GetElementCountMinusOne_33352
		cmp	ax, [si+1Bh]
		jbe	short loc_2E64B
		inc	word ptr [si+1Bh]

loc_2E64B:				; CODE XREF: seg084:0C65j seg084:0C86j
		push	si
		push	cs
		call	near ptr LayerGroup_AdvanceAll_2DC2D
		pop	cx
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-17. Renvoie 1 si l'image +27 a atteint la dernière image de la ressource
; (Struct_GetElementCountMinusOne_33352), ou si aucune ressource n'est attachée.
; ==============================================================================================
AnimLayer_IsFinished_2E654	proc far		; CODE XREF: Midgame1_PlayPart1_5FCF0+122FP
					; Midgame1_PlayPart1_5FCF0+2D82P ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	0
		mov	al, [si+15h]
		push	ax
		push	large dword ptr	[si+11h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		or	ax, dx
		jz	short loc_2E69E
		push	0
		mov	al, [si+15h]
		push	ax
		push	large dword ptr	[si+11h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		call	Struct_GetElementCountMinusOne_33352
		cmp	ax, [si+1Bh]
		jnz	short loc_2E69A
		mov	ax, 1
		jmp	short loc_2E69C
; ���������������������������������������������������������������������������

loc_2E69A:				; CODE XREF: AnimLayer_IsFinished_2E654+3Fj
		xor	ax, ax

loc_2E69C:				; CODE XREF: AnimLayer_IsFinished_2E654+44j
		jmp	short loc_2E6A0
; ���������������������������������������������������������������������������

loc_2E69E:				; CODE XREF: AnimLayer_IsFinished_2E654+1Ej
		mov	al, 1

loc_2E6A0:				; CODE XREF: AnimLayer_IsFinished_2E654:loc_2E69Cj
		pop	si
		pop	bp
		retf
AnimLayer_IsFinished_2E654	endp

; ���������������������������������������������������������������������������

loc_2E6A3:				; DATA XREF: dseg:3F78o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_2E6D2
		mov	word ptr [si], 3F78h
		mov	word ptr [si+0Ah], 3F98h
		push	0
		push	si
		push	cs
		call	near ptr sub_2E0C3
		add	sp, 4
		test	di, 1
		jz	short loc_2E6D2
		push	si
		call	sub_308
		pop	cx

loc_2E6D2:				; CODE XREF: seg084:0CF0j seg084:0D09j
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-17. Méthode +28 de l'animation en boucle (table de méthodes dseg 4958,
; calque fabriqué directement dans les cinématiques : Layer_Construct_2DF9B puis table, mode
; +29). Mode 0 : image +27 + 1, remise à 0 quand elle atteint
; Struct_GetElementCountMinusOne_33352 ; mode 1 : image − 1, sans borne. Puis avance les
; enfants. mid1 : mid1 20 (scènes 4 et 10), mid1 23 (scène 7).
; ==============================================================================================
LoopAnimLayer_Advance_2E6D6	proc far		; CODE XREF: seg084:0E80p
					; DATA XREF: dseg:137Ao

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	0
		mov	al, [si+15h]
		push	ax
		push	large dword ptr	[si+11h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		or	ax, dx
		jz	short loc_2E74D
		push	0
		mov	al, [si+15h]
		push	ax
		push	large dword ptr	[si+11h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		or	ax, dx
		jz	short loc_2E74D
		mov	al, [si+1Dh]
		mov	ah, 0
		or	ax, ax
		jz	short loc_2E71F
		cmp	ax, 1
		jz	short loc_2E74A
		jmp	short loc_2E74D
; ���������������������������������������������������������������������������

loc_2E71F:				; CODE XREF: LoopAnimLayer_Advance_2E6D6+40j
		inc	word ptr [si+1Bh]
		push	0
		mov	al, [si+15h]
		push	ax
		push	large dword ptr	[si+11h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		call	Struct_GetElementCountMinusOne_33352
		cmp	ax, [si+1Bh]
		jnz	short loc_2E74D
		mov	word ptr [si+1Bh], 0
		jmp	short loc_2E74D
; ���������������������������������������������������������������������������

loc_2E74A:				; CODE XREF: LoopAnimLayer_Advance_2E6D6+45j
		dec	word ptr [si+1Bh]

loc_2E74D:				; CODE XREF: LoopAnimLayer_Advance_2E6D6+1Ej
					; LoopAnimLayer_Advance_2E6D6+37j ...
		push	si
		push	cs
		call	near ptr LayerGroup_AdvanceAll_2DC2D
		pop	cx
		pop	si
		pop	bp
		retf
LoopAnimLayer_Advance_2E6D6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_2E756	proc far		; CODE XREF: seg084:0EA9p
					; DATA XREF: dseg:135Eo

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_2E785
		mov	word ptr [si], 135Eh
		mov	word ptr [si+0Ah], 137Eh
		push	0
		push	si
		push	cs
		call	near ptr sub_2E0C3
		add	sp, 4
		test	di, 1
		jz	short loc_2E785
		push	si
		call	sub_308
		pop	cx

loc_2E785:				; CODE XREF: sub_2E756+Dj
					; sub_2E756+26j
		pop	di
		pop	si
		pop	bp
		retf
sub_2E756	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_2E789	proc far		; CODE XREF: seg084:0E72p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+1Bh], 0
		jnz	short loc_2E79B
		mov	ax, 1
		jmp	short loc_2E79D
; ���������������������������������������������������������������������������

loc_2E79B:				; CODE XREF: sub_2E789+Bj
		xor	ax, ax

loc_2E79D:				; CODE XREF: sub_2E789+10j
		pop	si
		pop	bp
		retf
sub_2E789	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_2E7A0	proc far		; CODE XREF: seg084:0E62p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	0
		mov	al, [si+15h]
		push	ax
		push	large dword ptr	[si+11h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		or	ax, dx
		jz	short loc_2E7EB
		push	0
		mov	al, [si+15h]
		push	ax
		push	large dword ptr	[si+11h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		call	Struct_GetElementCountMinusOne_33352
		dec	ax
		cmp	ax, [si+1Bh]
		jnz	short loc_2E7E7
		mov	ax, 1
		jmp	short loc_2E7E9
; ���������������������������������������������������������������������������

loc_2E7E7:				; CODE XREF: sub_2E7A0+40j
		xor	ax, ax

loc_2E7E9:				; CODE XREF: sub_2E7A0+45j
		jmp	short loc_2E7ED
; ���������������������������������������������������������������������������

loc_2E7EB:				; CODE XREF: sub_2E7A0+1Ej
		mov	al, 1

loc_2E7ED:				; CODE XREF: sub_2E7A0:loc_2E7E9j
		pop	si
		pop	bp
		retf
sub_2E7A0	endp

; ���������������������������������������������������������������������������

loc_2E7F0:				; DATA XREF: dseg:3F64o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	0
		mov	al, [si+15h]
		push	ax
		push	large dword ptr	[si+11h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		or	ax, dx
		jz	short loc_2E844
		mov	al, [si+1Dh]
		mov	ah, 0
		or	ax, ax
		jz	short loc_2E820
		cmp	ax, 1
		jz	short loc_2E830
		jmp	short loc_2E83E
; ���������������������������������������������������������������������������

loc_2E820:				; CODE XREF: seg084:0E57j
		push	si
		push	cs
		call	near ptr sub_2E7A0
		pop	cx
		or	al, al
		jz	short loc_2E83E
		mov	byte ptr [si+1Dh], 1
		jmp	short loc_2E83E
; ���������������������������������������������������������������������������

loc_2E830:				; CODE XREF: seg084:0E5Cj
		push	si
		push	cs
		call	near ptr sub_2E789
		pop	cx
		or	al, al
		jz	short loc_2E83E
		mov	byte ptr [si+1Dh], 0

loc_2E83E:				; CODE XREF: seg084:0E5Ej seg084:0E68j ...
		push	si
		push	cs
		call	near ptr LoopAnimLayer_Advance_2E6D6
		pop	cx

loc_2E844:				; CODE XREF: seg084:0E4Ej
		push	si
		push	cs
		call	near ptr LayerGroup_AdvanceAll_2DC2D
		pop	cx
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2E84D:				; DATA XREF: dseg:3F48o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_2E87C
		mov	word ptr [si], 3F48h
		mov	word ptr [si+0Ah], 3F68h
		push	0
		push	si
		push	cs
		call	near ptr sub_2E756
		add	sp, 4
		test	di, 1
		jz	short loc_2E87C
		push	si
		call	sub_308
		pop	cx

loc_2E87C:				; CODE XREF: seg084:0E9Aj seg084:0EB3j
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2E880:				; DATA XREF: dseg:3F74o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	Layer_Draw_2E22F
; ���������������������������������������������������������������������������

loc_2E88C:				; DATA XREF: dseg:3F70o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	near ptr Layer_MoveBy_2E29E
; ���������������������������������������������������������������������������

loc_2E898:				; DATA XREF: dseg:3F68o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	near ptr Layer_DrawAtOwnPos_2E202
; ���������������������������������������������������������������������������

loc_2E8A4:				; DATA XREF: dseg:3FA4o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	Layer_Draw_2E22F
; ���������������������������������������������������������������������������

loc_2E8B0:				; DATA XREF: dseg:3FA0o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	near ptr Layer_MoveBy_2E29E
; ���������������������������������������������������������������������������

loc_2E8BC:				; DATA XREF: dseg:3F98o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	near ptr Layer_DrawAtOwnPos_2E202
; ���������������������������������������������������������������������������

loc_2E8C8:				; DATA XREF: dseg:3FD4o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	Layer_Draw_2E22F
; ���������������������������������������������������������������������������

loc_2E8D4:				; DATA XREF: dseg:3FD0o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	near ptr Layer_MoveBy_2E29E
; ���������������������������������������������������������������������������

loc_2E8E0:				; DATA XREF: dseg:3FC8o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	near ptr Layer_DrawAtOwnPos_2E202
; ���������������������������������������������������������������������������

loc_2E8EC:				; DATA XREF: dseg:4004o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	loc_2DD3F
; ���������������������������������������������������������������������������

loc_2E8F8:				; DATA XREF: dseg:4000o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	loc_2DD61
; ���������������������������������������������������������������������������

loc_2E904:				; DATA XREF: dseg:3FF8o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	loc_2DD37
; ���������������������������������������������������������������������������

loc_2E910:				; DATA XREF: dseg:4008o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	ax, [bp+8]
		or	si, si
		jz	short loc_2E92E
		mov	word ptr [si], 4008h
		test	ax, 1
		jz	short loc_2E92E
		push	si
		call	sub_308
		pop	cx

loc_2E92E:				; CODE XREF: seg084:0F5Cj seg084:0F65j
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2E931:				; DATA XREF: dseg:400Co
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	dx, [bp+8]
		or	ax, ax
		jz	short loc_2E94D
		test	dx, 1
		jz	short loc_2E94D
		push	ax
		call	sub_308
		pop	cx
		jmp	short $+2

loc_2E94D:				; CODE XREF: seg084:0F7Cj seg084:0F82j
		pop	bp
		retf
seg084		ends

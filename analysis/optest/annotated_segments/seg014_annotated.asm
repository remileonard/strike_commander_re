seg014		segment	byte public 'CODE' use16
		assume cs:seg014
		;org 1
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-21. Calque image tourné et mis à l'échelle (taille 23h, tables 19A7h /
; 19CBh) : ImageLayer_Construct_2E02C(ressource arg_2, x arg_4, y arg_6, image arg_E), puis
; +1Dh = arg_8 (angle), +1Fh = arg_A (échelle, 256 = taille d'origine), +21h = arg_C (octet
; passé comme dernier argument du dessin, rôle non établi). Dessin :
; ScaledImageLayer_Draw_93E4. mid12 : angle 0, échelle 200 ou 160, dernier argument 0.
; ==============================================================================================
ScaledImageLayer_Construct_9391	proc far		; CODE XREF: sub_81470+127AP
					; sub_81470+129AP ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]

loc_9398:				; DATA XREF: seg170:012Eo
		or	si, si
		jnz	short loc_93AC
		push	23h ; '#'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_93DC

loc_93AC:				; CODE XREF: ScaledImageLayer_Construct_9391+9j
		push	[bp+arg_E]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	word ptr [si], 19A7h
		mov	word ptr [si+0Ah], 19CBh
		mov	ax, [bp+arg_8]
		mov	[si+1Dh], ax
		mov	ax, [bp+arg_A]
		mov	[si+1Fh], ax
		mov	ax, [bp+arg_C]
		mov	[si+21h], ax

loc_93DC:				; CODE XREF: ScaledImageLayer_Construct_9391+19j
		mov	ax, si
		pop	si
		pop	bp
		retf
ScaledImageLayer_Construct_9391	endp

; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, LUE 2026-10-21. Méthode +20h de ScaledImageLayer : si l'image ≠ −1,
; Render_DrawRotatedScaledShape_39A7A(word_46F44, x, y, forme, image, +1Dh angle, +1Fh
; échelle, +21h).
; ==============================================================================================
ScaledImageLayer_Draw_93E4:				; DATA XREF: dseg:19C7o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+0Ch]
		cmp	di, 0FFFFh
		jz	short loc_9429
		push	word ptr [si+21h]
		push	word ptr [si+1Fh]
		push	word ptr [si+1Dh]
		push	di
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [bp+0Ah]
		push	word ptr [bp+8]
		push	word_46F44
		call	Render_DrawRotatedScaledShape_39A7A
		add	sp, 12h

loc_9429:				; CODE XREF: seg014:0062j
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_942D	proc far		; CODE XREF: seg014:011Ep seg014:014Bp

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	word ptr [si+1Bh]
		push	[bp+arg_4]
		push	di
		push	si
		mov	bx, [si]
		call	dword ptr [bx+20h]
		add	sp, 8
		mov	[bp+var_2], 0
		jmp	short loc_946A
; ���������������������������������������������������������������������������

loc_9452:				; CODE XREF: sub_942D+51j
		push	[bp+arg_4]
		push	di
		mov	bx, [bp+var_2]
		push	word ptr [bx+6]
		mov	bx, [bp+var_2]
		mov	bx, [bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6

loc_946A:				; CODE XREF: sub_942D+23j
		lea	ax, [bp+var_2]
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_2FC4A
		add	sp, 4
		or	ax, ax
		jnz	short loc_9452
		pop	di
		pop	si
		leave
		retf
sub_942D	endp

; ���������������������������������������������������������������������������

loc_9484:				; CODE XREF: seg014:2DAAj
					; DATA XREF: dseg:19B3o
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+6]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		add	sp, 2
		mov	[bp-2],	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		add	sp, 2
		mov	[bp-4],	ax
		push	word ptr [bp-4]
		push	word ptr [bp-2]
		push	si
		push	cs
		call	near ptr sub_942D
		add	sp, 6
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_94B7:				; CODE XREF: seg014:2D92j
					; DATA XREF: dseg:19B7o
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
		push	word ptr [bp-4]
		push	word ptr [bp-2]
		push	si
		push	cs
		call	near ptr sub_942D
		add	sp, 6
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	ax, [bp+8]
		mov	[si+1Dh], ax
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-21. Pose l'échelle d'un ScaledImageLayer : [arg_0 + 1Fh] = arg_2 (1/256,
; 256 = taille d'origine). mid15 : zoom des deux avions du premier plan, de 32 à 255.
; ==============================================================================================
ScaledImageLayer_SetScale_94F4	proc far		; CODE XREF: sub_8B630+12AFP
					; sub_8B630+1350P

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+1Fh], ax
		pop	si
		pop	bp
		retf
ScaledImageLayer_SetScale_94F4	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	ax, [bp+8]
		mov	[si+21h], ax
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	ax, [si+1Dh]
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	ax, [si+1Fh]
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	ax, [si+21h]
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
; far, LUE 2026-10-21. Calque mobile à l'échelle (taille 25h, tables 1943h / 1967h) :
; ImageLayer_Construct_2E02C(ressource arg_2, x arg_4, y arg_6, image arg_10), vitesse +1Dh =
; arg_C, +1Fh = arg_E, échelles +21h = arg_8 (largeur) et +23h = arg_A (hauteur), en 1/256
; (256 = taille d'origine). Dessin : ScaledMovingLayer_DrawImage_C056 par sub_95D7. mid5 :
; mid5 5, échelle 300.
; ==============================================================================================
ScaledMovingLayer_Construct_9544	proc far		; CODE XREF: sub_768F0+828BP
					; sub_768F0+82AEP ...

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h
arg_10		= word ptr  16h

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_9562
		push	25h ; '%'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_95CF

loc_9562:				; CODE XREF: ScaledMovingLayer_Construct_9544+Cj
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_6], ax
		mov	ax, [bp+arg_C]
		mov	[bp+var_8], ax
		mov	ax, [bp+arg_E]
		mov	[bp+var_A], ax
		mov	ax, [bp+arg_10]
		mov	[bp+var_C], ax
		push	[bp+var_C]
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		push	si
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	word ptr [si], 1977h
		mov	word ptr [si+0Ah], 1997h
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+1Fh], 0
		mov	ax, [bp+var_8]
		mov	[si+1Dh], ax
		mov	ax, [bp+var_A]
		mov	[si+1Fh], ax
		mov	word ptr [si], 1943h
		mov	word ptr [si+0Ah], 1967h
		mov	ax, [bp+arg_8]
		mov	[si+21h], ax
		mov	ax, [bp+arg_A]
		mov	[si+23h], ax

loc_95CF:				; CODE XREF: ScaledMovingLayer_Construct_9544+1Cj
		mov	ax, si
		pop	si
		leave
		retf
ScaledMovingLayer_Construct_9544	endp

; ���������������������������������������������������������������������������
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-21. Méthode +20h (image courante +1Bh) en (arg_2, arg_4), puis dessin des
; enfants. Appelée par loc_962E (position propre) et loc_9661 (position + décalage du parent).
; ==============================================================================================
ScaledMovingLayer_DrawAt_95D7	proc far		; CODE XREF: seg014:02C8p seg014:02F5p

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	word ptr [si+1Bh]
		push	[bp+arg_4]
		push	di
		push	si
		mov	bx, [si]
		call	dword ptr [bx+20h]
		add	sp, 8
		mov	[bp+var_2], 0
		jmp	short loc_9614
; ���������������������������������������������������������������������������

loc_95FC:				; CODE XREF: ScaledMovingLayer_DrawAt_95D7+51j
		push	[bp+arg_4]
		push	di
		mov	bx, [bp+var_2]
		push	word ptr [bx+6]
		mov	bx, [bp+var_2]
		mov	bx, [bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6

loc_9614:				; CODE XREF: ScaledMovingLayer_DrawAt_95D7+23j
		lea	ax, [bp+var_2]
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_2FC4A
		add	sp, 4
		or	ax, ax
		jnz	short loc_95FC
		pop	di
		pop	si
		leave
		retf
ScaledMovingLayer_DrawAt_95D7	endp

; ���������������������������������������������������������������������������

loc_962E:				; CODE XREF: seg014:2D2Dj
					; DATA XREF: dseg:194Fo
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+6]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		add	sp, 2
		mov	[bp-2],	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		add	sp, 2
		mov	[bp-4],	ax
		push	word ptr [bp-4]
		push	word ptr [bp-2]
		push	si
		push	cs
		call	near ptr ScaledMovingLayer_DrawAt_95D7
		add	sp, 6
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_9661:				; CODE XREF: seg014:2D15j
					; DATA XREF: dseg:1953o
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
		push	word ptr [bp-4]
		push	word ptr [bp-2]
		push	si
		push	cs
		call	near ptr ScaledMovingLayer_DrawAt_95D7
		add	sp, 6
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	ax, [bp+8]
		mov	[si+21h], ax
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	ax, [bp+8]
		mov	[si+23h], ax
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		or	si, si
		jnz	short loc_96C9
		push	25h ; '%'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_96F9

loc_96C9:				; CODE XREF: seg014:0327j
		push	word ptr [bp+16h]
		push	word ptr [bp+14h]
		push	word ptr [bp+12h]
		push	word ptr [bp+0Ch]
		push	word ptr [bp+0Ah]
		push	word ptr [bp+8]
		push	si
		nop
		push	cs
		call	near ptr MovingOverlayLayer_Construct_A837
		add	sp, 0Eh
		mov	word ptr [si], 190Fh
		mov	word ptr [si+0Ah], 1933h
		mov	ax, [bp+0Eh]
		mov	[si+21h], ax
		mov	ax, [bp+10h]
		mov	[si+23h], ax

loc_96F9:				; CODE XREF: seg014:0337j
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

sub_9701	proc far		; CODE XREF: seg014:03F2p seg014:041Fp

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	word ptr [si+1Bh]
		push	[bp+arg_4]
		push	di
		push	si
		mov	bx, [si]
		call	dword ptr [bx+20h]
		add	sp, 8
		mov	[bp+var_2], 0
		jmp	short loc_973E
; ���������������������������������������������������������������������������

loc_9726:				; CODE XREF: sub_9701+51j
		push	[bp+arg_4]
		push	di
		mov	bx, [bp+var_2]
		push	word ptr [bx+6]
		mov	bx, [bp+var_2]
		mov	bx, [bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6

loc_973E:				; CODE XREF: sub_9701+23j
		lea	ax, [bp+var_2]
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_2FC4A
		add	sp, 4
		or	ax, ax
		jnz	short loc_9726
		pop	di
		pop	si
		leave
		retf
sub_9701	endp

; ���������������������������������������������������������������������������

loc_9758:				; CODE XREF: seg014:2C8Ej
					; DATA XREF: dseg:191Bo
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+6]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		add	sp, 2
		mov	[bp-2],	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		add	sp, 2
		mov	[bp-4],	ax
		push	word ptr [bp-4]
		push	word ptr [bp-2]
		push	si
		push	cs
		call	near ptr sub_9701
		add	sp, 6
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_978B:				; CODE XREF: seg014:2C76j
					; DATA XREF: dseg:191Fo
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
		push	word ptr [bp-4]
		push	word ptr [bp-2]
		push	si
		push	cs
		call	near ptr sub_9701
		add	sp, 6
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	ax, [bp+8]
		mov	[si+21h], ax
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	ax, [bp+8]
		mov	[si+23h], ax
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-17. Libère le texte précédent (+29), copie le nouveau (sub_26D7), le passe
; en minuscules (CRT_Strlwr_2769) et place le curseur +31 au début.
; ==============================================================================================
TalkingHead_CopyLipText_97D8	proc far		; CODE XREF: sub_9A8B+70p TalkingHead_SetLipText_9C4F+Cp

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+1Dh]
		call	Heap_FreeAndCoalesce_2C3FC
		add	sp, 2
		mov	word ptr [si+1Dh], 0
		push	[bp+arg_2]
		call	CRT_Strdup
		add	sp, 2
		mov	[si+1Dh], ax
		push	word ptr [si+1Dh]
		call	CRT_Strlwr_2769
		add	sp, 2
		mov	ax, [si+1Dh]
		mov	[si+1Fh], ax
		pop	si
		pop	bp
		retf
TalkingHead_CopyLipText_97D8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_9811	proc far		; CODE XREF: seg014:0E24p seg014:0ED3p ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_9830
		push	853h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jnz	short loc_9830
		jmp	loc_98EC
; ���������������������������������������������������������������������������

loc_9830:				; CODE XREF: sub_9811+9j sub_9811+1Aj
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
		mov	word ptr [si], 1883h
		mov	word ptr [si+0Ah], 18A7h
		mov	word ptr [si+21h], 185Fh
		mov	dword ptr [si+31h], 0
		mov	byte ptr [si+35h], 2
		mov	byte ptr [si+36h], 0
		mov	dword ptr [si+37h], 0
		mov	word ptr [si+23h], 0
		mov	word ptr [si+21h], 186Fh
		xor	eax, eax
		mov	[si+83Eh], eax
		mov	[si+842h], eax
		xor	ax, ax
		mov	[si+1Dh], ax
		mov	[si+1Fh], ax
		mov	ax, 0FFFFh
		mov	[si+846h], ax
		mov	[si+84Ch], ax
		mov	[si+84Ah], ax
		mov	word ptr [si+84Eh], 0
		mov	word ptr [si+848h], 22h	; '"'
		mov	byte ptr [si+850h], 0
		mov	byte ptr [si+851h], 0
		mov	byte ptr [si+852h], 1

loc_98EC:				; CODE XREF: sub_9811+1Cj
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_9811	endp

; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-17. Tête parlante synchronisée sur les lèvres (2131 octets, vtable dseg
; 6275) : Layer_Construct_2DF9B ; lecteur de voix intégré en +33 (vtables dseg 6239/6255,
; comme le lecteur de voix des cinématiques) ; texte de lèvres +29 (copie) et curseur +31 = 0
; ; image de base +2118 = image affichée +2124 = -1 ; bouche +2122 = -1 ; +2120 = 34 ; +2126 =
; 0 ; mode voix +2129 = 0 ; clignement permis +2130 = 1.
; ==============================================================================================
TalkingHead_Construct_98F4	proc far		; CODE XREF: seg014:0E60p ConvFigure_ConstructSpeaking_A207+27p ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_9913
		push	853h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jnz	short loc_9913
		jmp	loc_9994
; ���������������������������������������������������������������������������

loc_9913:				; CODE XREF: TalkingHead_Construct_98F4+9j TalkingHead_Construct_98F4+1Aj
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [si], 1883h
		mov	word ptr [si+0Ah], 18A7h
		mov	word ptr [si+21h], 185Fh
		mov	dword ptr [si+31h], 0
		mov	byte ptr [si+35h], 2
		mov	byte ptr [si+36h], 0
		mov	dword ptr [si+37h], 0
		mov	word ptr [si+23h], 0
		mov	word ptr [si+21h], 186Fh
		xor	eax, eax
		mov	[si+83Eh], eax
		mov	[si+842h], eax
		xor	ax, ax
		mov	[si+1Dh], ax
		mov	[si+1Fh], ax
		mov	ax, 0FFFFh
		mov	[si+846h], ax
		mov	[si+84Ch], ax
		mov	[si+84Ah], ax
		mov	word ptr [si+84Eh], 0
		mov	word ptr [si+848h], 22h	; '"'
		mov	byte ptr [si+850h], 0
		mov	byte ptr [si+851h], 0
		mov	byte ptr [si+852h], 1

loc_9994:				; CODE XREF: TalkingHead_Construct_98F4+1Cj
		mov	ax, si
		pop	si
		pop	bp
		retf
TalkingHead_Construct_98F4	endp

; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		or	si, si
		jnz	short loc_99BB
		push	853h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jnz	short loc_99BB
		jmp	loc_9A83
; ���������������������������������������������������������������������������

loc_99BB:				; CODE XREF: seg014:0615j seg014:0626j
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
		mov	word ptr [si], 1883h
		mov	word ptr [si+0Ah], 18A7h
		mov	word ptr [si+21h], 185Fh
		mov	dword ptr [si+31h], 0
		mov	byte ptr [si+35h], 2
		mov	byte ptr [si+36h], 0
		mov	dword ptr [si+37h], 0
		mov	word ptr [si+23h], 0
		mov	word ptr [si+21h], 186Fh
		xor	eax, eax
		mov	[si+83Eh], eax
		mov	[si+842h], eax
		xor	ax, ax
		mov	[si+1Dh], ax
		mov	[si+1Fh], ax
		mov	ax, 0FFFFh
		mov	[si+846h], ax
		mov	[si+84Ch], ax
		mov	[si+84Ah], ax
		mov	word ptr [si+84Eh], 0
		mov	word ptr [si+848h], 22h	; '"'
		mov	byte ptr [si+850h], 0
		mov	byte ptr [si+851h], 0
		mov	byte ptr [si+852h], 1
		push	word ptr [bp+8]
		push	si
		nop
		push	cs
		call	near ptr sub_9B09
		add	sp, 4

loc_9A83:				; CODE XREF: seg014:0628j
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

sub_9A8B	proc far		; CODE XREF: seg014:1EE7p

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_9AA7
		push	853h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_9B01

loc_9AA7:				; CODE XREF: sub_9A8B+9j
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_2]
		push	si
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [si], 1883h
		mov	word ptr [si+0Ah], 18A7h
		mov	word ptr [si+21h], 185Fh
		mov	dword ptr [si+31h], 0
		mov	byte ptr [si+35h], 2
		mov	byte ptr [si+36h], 0
		mov	dword ptr [si+37h], 0
		mov	word ptr [si+23h], 0
		mov	word ptr [si+21h], 186Fh
		xor	eax, eax
		mov	[si+83Eh], eax
		mov	[si+842h], eax
		push	[bp+arg_4]
		push	si
		push	cs
		call	near ptr TalkingHead_CopyLipText_97D8
		add	sp, 4

loc_9B01:				; CODE XREF: sub_9A8B+1Aj
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_9A8B	endp

; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_9B09	proc far		; CODE XREF: seg014:06EDp seg014:0F19p

var_BA		= word ptr -0BAh
var_5D		= dword	ptr -5Dh
var_59		= dword	ptr -59h
var_55		= dword	ptr -55h
var_4D		= dword	ptr -4Dh
var_48		= dword	ptr -48h
var_44		= dword	ptr -44h
var_12		= word ptr -12h
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0BAh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		lea	ax, [bp+var_BA]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_BA], 556h
		mov	[bp+var_59], 100h
		mov	[bp+var_5D], 0
		mov	[bp+var_BA], 56Eh
		push	1
		push	15CCh
		lea	ax, [bp+var_BA]
		push	ax
		mov	bx, [bp+var_BA]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_BA]
		push	ax
		call	sub_3C491
		add	sp, 2
		push	0
		push	large [dword_445F6]
		lea	ax, [bp+var_BA]
		push	ax
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		jmp	short loc_9BB5
; ���������������������������������������������������������������������������

loc_9B78:				; CODE XREF: sub_9B09+B5j
		lea	ax, [bp+var_BA]
		push	ax
		lea	ax, [bp+var_12]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		push	di
		lea	ax, [bp+var_12]
		push	ax
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jz	short loc_9BB3
		mov	eax, [bp+var_44]
		mov	[bp+var_55], eax
		lea	ax, [bp+var_BA]
		push	ax
		call	ResourceRecord_ComputeAlignedBounds_3C431
		add	sp, 2
		jmp	short loc_9BB5
; ���������������������������������������������������������������������������
		jmp	short loc_9BB5
; ���������������������������������������������������������������������������

loc_9BB3:				; CODE XREF: sub_9B09+8Fj
		jmp	short loc_9BC0
; ���������������������������������������������������������������������������

loc_9BB5:				; CODE XREF: sub_9B09+6Dj sub_9B09+A6j ...
		mov	eax, [bp+var_4D]
		cmp	eax, dword_445FB
		jz	short loc_9B78

loc_9BC0:				; CODE XREF: sub_9B09:loc_9BB3j
		mov	eax, [bp+var_48]
		mov	[bp+var_4], eax
		push	1
		push	0
		push	2
		push	large [bp+var_4]
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		mov	eax, [bp+var_8]
		mov	[si+11h], eax
		mov	byte ptr [si+15h], 2
		mov	byte ptr [si+16h], 1
		mov	dword ptr [si+17h], 0
		mov	eax, [bp+var_4]
		mov	[si+17h], eax
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_BA]
		push	ax
		call	ResourceRecord_ReadDwordFieldB_3C36F
		add	sp, 6
		mov	[bp+var_BA], 56Eh
		lea	ax, [bp+var_BA]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_BA]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_9B09	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-17. Donne le texte de lèvres : TalkingHead_CopyLipText_97D8. mid1 lui passe
; « Back off, almost got tone. Blah blah blah » (dseg 7904 et 7946).
; ==============================================================================================
TalkingHead_SetLipText_9C4F	proc far		; CODE XREF: seg018:00FEP
					; Conv_PlayScript_5AA4E+6CCP ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr TalkingHead_CopyLipText_97D8
		add	sp, 4
		pop	si
		pop	bp
		retf
TalkingHead_SetLipText_9C4F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-21. Appelée à chaque tour de la boucle d'attente (« tant que la tête parle
; »). Au premier appel (compteur +84Eh = 0, réplique prête +850h, pas encore partie +851h) :
; bouche +84Ah = VoicePlayer_GetLipFrame_8466, lance la réplique (méthode +10h du lecteur,
; −1), +851h = 1. Puis compteur + 1 ; renvoie +851h (1 tant que la tête parle). +851h est
; remis à 0 par TalkingHead_Advance_9F5A quand la réplique ne joue plus ou que la table
; renvoie −2.
; ==============================================================================================
TalkingHead_StartVoiceAndIsSpeaking_9C64	proc far		; CODE XREF: sub_6B9C0+1947P
					; sub_6B9C0+1C8BP ...

arg_0		= word ptr  6

; FUNCTION CHUNK AT 0932 SIZE 00000003 BYTES

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+84Eh], 0
		jnz	short loc_9CAB
		cmp	byte ptr [si+850h], 0
		jz	short loc_9CAB
		mov	al, [si+851h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9CAB
		mov	ax, si
		add	ax, 21h	; '!'
		push	ax
		call	VoicePlayer_GetLipFrame_8466
		add	sp, 2
		mov	[si+84Ah], ax
		push	0FFFFh
		mov	ax, si
		add	ax, 21h	; '!'
		push	ax
		mov	bx, [si+21h]
		call	dword ptr [bx+10h]
		add	sp, 4
		mov	byte ptr [si+851h], 1

loc_9CAB:				; CODE XREF: TalkingHead_StartVoiceAndIsSpeaking_9C64+Cj TalkingHead_StartVoiceAndIsSpeaking_9C64+13j	...
		inc	word ptr [si+84Eh]
		cmp	byte ptr [si+851h], 0
		jz	short loc_9CBD
		mov	al, 1
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		jmp	short loc_9CC2
; ���������������������������������������������������������������������������

loc_9CBD:				; CODE XREF: TalkingHead_StartVoiceAndIsSpeaking_9C64+50j
		mov	al, 0
		pop	si
		pop	bp
		retf
TalkingHead_StartVoiceAndIsSpeaking_9C64	endp

; ���������������������������������������������������������������������������
; START	OF FUNCTION CHUNK FOR TalkingHead_StartVoiceAndIsSpeaking_9C64

loc_9CC2:				; CODE XREF: TalkingHead_StartVoiceAndIsSpeaking_9C64+57j
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK	FOR TalkingHead_StartVoiceAndIsSpeaking_9C64
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	word_4684B
		mov	ax, si
		add	ax, 21h	; '!'
		push	ax
		call	VoicePlayer_SetDriver_7A3D
		add	sp, 4
		push	word ptr [bp+8]
		mov	ax, si
		add	ax, 21h	; '!'
		push	ax
		call	sub_8256
		add	sp, 4
		mov	byte ptr [si+850h], 1
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-21. Met la tête parlante en mode voix : pilote du lecteur intégré (+21h,
; VoicePlayer_SetDriver_7A3D), charge la réplique arg_2 avec sa table de bouches pour la
; cadence arg_4 (VoicePlayer_LoadWithLipSync_7D52), +850h = 1 (réplique prête), compteur +84Eh
; = 0.
; ==============================================================================================
TalkingHead_AttachVoice_9CF7	proc far		; CODE XREF: sub_6B9C0+18FFP
					; sub_6B9C0+1C43P ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word_4684B
		mov	ax, si
		add	ax, 21h	; '!'
		push	ax
		call	VoicePlayer_SetDriver_7A3D
		add	sp, 4
		push	[bp+arg_4]
		push	[bp+arg_2]
		mov	ax, si
		add	ax, 21h	; '!'
		push	ax
		call	VoicePlayer_LoadWithLipSync_7D52
		add	sp, 6
		mov	byte ptr [si+850h], 1
		mov	word ptr [si+84Eh], 0
		pop	si
		pop	bp
		retf
TalkingHead_AttachVoice_9CF7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-17. Image de base +2118 et image affichée +2124 = arg_2.
; ==============================================================================================
TalkingHead_SetBaseFrame_9D32	proc far		; CODE XREF: seg018:00F0P
					; Conv_PlayScript_5AA4E+B44P ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+846h], ax
		mov	[si+84Ch], ax
		pop	si
		pop	bp
		retf
TalkingHead_SetBaseFrame_9D32	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-17. Dessine en (x, y) : image 0 de la ressource (la tête), puis l'image
; affichée +2124 si différente de -1, puis la bouche +2122 si différente de -1, puis les
; enfants.
; ==============================================================================================
TalkingHead_DrawAt_9D47	proc far		; CODE XREF: seg014:0AE2p seg014:1F12p

var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_2], di
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		push	0
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	word_46F44
		call	Shape_DrawSpans_32CD8
		add	sp, 0Ch
		cmp	word ptr [si+84Ch], 0FFFFh
		jz	short loc_9DD8
		mov	[bp+var_6], di
		mov	ax, [bp+arg_4]
		mov	[bp+var_8], ax
		mov	ax, [si+84Ch]
		mov	[bp+var_A], ax
		cmp	[bp+var_A], 0FFFFh
		jz	short loc_9DD8
		push	[bp+var_A]
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_8]
		push	[bp+var_6]
		push	word_46F44
		call	Shape_DrawSpans_32CD8
		add	sp, 0Ch
		jmp	short $+2

loc_9DD8:				; CODE XREF: TalkingHead_DrawAt_9D47+49j TalkingHead_DrawAt_9D47+5Fj
		cmp	word ptr [si+84Ah], 0FFFFh
		jz	short loc_9E25
		mov	[bp+var_C], di
		mov	ax, [bp+arg_4]
		mov	[bp+var_E], ax
		mov	ax, [si+84Ah]
		mov	[bp+var_10], ax
		cmp	[bp+var_10], 0FFFFh
		jz	short loc_9E25
		push	[bp+var_10]
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_E]
		push	[bp+var_C]
		push	word_46F44
		call	Shape_DrawSpans_32CD8
		add	sp, 0Ch
		jmp	short $+2

loc_9E25:				; CODE XREF: TalkingHead_DrawAt_9D47+96j TalkingHead_DrawAt_9D47+ACj
		mov	[bp+var_12], 0
		jmp	short loc_9E44
; ���������������������������������������������������������������������������

loc_9E2C:				; CODE XREF: TalkingHead_DrawAt_9D47+111j
		push	[bp+arg_4]
		push	di
		mov	bx, [bp+var_12]
		push	word ptr [bx+6]
		mov	bx, [bp+var_12]
		mov	bx, [bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6

loc_9E44:				; CODE XREF: TalkingHead_DrawAt_9D47+E3j
		lea	ax, [bp+var_12]
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_2FC4A
		add	sp, 4
		or	ax, ax
		jnz	short loc_9E2C
		pop	di
		pop	si
		leave
		retf
TalkingHead_DrawAt_9D47	endp

; ���������������������������������������������������������������������������

; ==============================================================================================
; far, LUE 2026-10-21. Méthode +32 (dessin) des tables 182Bh et 1883h (TalkingHead) :
; TalkingHead_DrawAt_9D47 (tête, image de base, bouche, enfants), puis l'image 1 de la
; ressource (coiffure) et l'image du champ +848h (toujours 34, posé par
; TalkingHead_Construct_98F4 : habits), à la même position. mid2 dessine ainsi Tex et Stern
; habillés ; la tête casquée de mid1 (TalkingHeadOverlay_DrawAt_B28E) n'utilise pas cette
; méthode.
; ==============================================================================================
TalkingHead_DrawDressed_9E5E:				; DATA XREF: dseg:184Bo dseg:18A3o
		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		push	word ptr [bp+0Ah]
		push	di
		push	si
		push	cs
		call	near ptr TalkingHead_DrawAt_9D47
		add	sp, 6
		mov	[bp-2],	di
		mov	ax, [bp+0Ah]
		mov	[bp-4],	ax
		push	1
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [bp-4]
		push	word ptr [bp-2]
		push	word_46F44
		call	Shape_DrawSpans_32CD8
		add	sp, 0Ch
		mov	[bp-6],	di
		mov	ax, [bp+0Ah]
		mov	[bp-8],	ax
		mov	ax, [si+848h]
		mov	[bp-0Ah], ax
		cmp	word ptr [bp-0Ah], 0FFFFh
		jz	short loc_9EF4
		push	word ptr [bp-0Ah]
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [bp-8]
		push	word ptr [bp-6]
		push	word_46F44
		call	Shape_DrawSpans_32CD8
		add	sp, 0Ch
		jmp	short $+2

loc_9EF4:				; CODE XREF: seg014:0B32j
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, LUE 2026-10-17. Méthode +12 : méthode +32 (dessin) à la position absolue (méthodes +4,
; +8).
; ==============================================================================================
TalkingHead_DrawAtOwnPos_9EF8:				; CODE XREF: seg014:2881j seg014:2B9Cj
					; DATA XREF: ...
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+6]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		add	sp, 2
		mov	[bp-2],	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		add	sp, 2
		mov	[bp-4],	ax
		push	word ptr [bp-4]
		push	word ptr [bp-2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+20h]
		add	sp, 6
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, LUE 2026-10-17. Méthode +16 : méthode +32 (dessin) en (x du calque + x du parent, y + y
; du parent).
; ==============================================================================================
TalkingHead_Draw_9F2C:				; CODE XREF: seg014:2869j seg014:2B84j
					; DATA XREF: ...
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
		push	word ptr [bp-4]
		push	word ptr [bp-2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+20h]
		add	sp, 6
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, LUE 2026-10-17. Méthode +28, une fois par image de scène. Bouche +2122 = -1. Image
; affichée +2124 : 12 si CRT_Rand × 30 / 32768 = 0 (une fois sur 30) et clignement permis
; (+2130), sinon l'image de base +2118 ; toujours l'image de base si celle-ci dépasse 20. Mode
; voix (+2129 posé) : bouche = VoicePlayer_GetLipFrame_8466 du lecteur intégré tant qu'il joue
; ; -2 ou fin : mode voix coupé. Mode texte : lit une lettre du texte (+31 avance d'un
; caractère par image) : « er » -> bouche 6, « th » -> 9, « ch » -> 6 (deuxième lettre sautée)
; ; « h » saute le caractère suivant ; « e » suivi d'un caractère qui n'est pas une lettre
; minuscule prend ce caractère à la place ; sinon une lettre a..z donne la bouche = chiffre de
; la table word_445AC (« 06891599098769362999252999 », un chiffre par lettre) + 2 ; autre
; caractère : bouche -1. Puis avance les enfants.
; ==============================================================================================
TalkingHead_Advance_9F5A:				; DATA XREF: dseg:1693o dseg:189Fo
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	di, [bp+6]
		mov	ax, word_445B0
		mov	[bp-4],	ax
		mov	al, byte_445B2
		mov	[bp-2],	al
		mov	word ptr [di+84Ah], 0FFFFh
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 1Eh
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_9FA2
		cmp	byte ptr [di+852h], 0
		jz	short loc_9FA2
		mov	word ptr [di+84Ch], 0Ch
		jmp	short loc_9FAA
; ���������������������������������������������������������������������������

loc_9FA2:				; CODE XREF: seg014:0C01j seg014:0C08j
		mov	ax, [di+846h]
		mov	[di+84Ch], ax

loc_9FAA:				; CODE XREF: seg014:0C10j
		cmp	word ptr [di+846h], 14h
		jle	short loc_9FB9
		mov	ax, [di+846h]
		mov	[di+84Ch], ax

loc_9FB9:				; CODE XREF: seg014:0C1Fj
		cmp	byte ptr [di+851h], 0
		jz	short loc_A007
		mov	ax, di
		add	ax, 21h	; '!'
		push	ax
		mov	bx, [di+21h]
		call	dword ptr [bx+4]
		add	sp, 2
		or	al, al
		jz	short loc_9FE7
		mov	ax, di
		add	ax, 21h	; '!'
		push	ax
		call	VoicePlayer_GetLipFrame_8466
		add	sp, 2
		mov	[di+84Ah], ax
		jmp	short loc_9FF2
; ���������������������������������������������������������������������������

loc_9FE7:				; CODE XREF: seg014:0C41j
		mov	word ptr [di+84Ah], 0FFFFh
		mov	byte ptr [di+851h], 0

loc_9FF2:				; CODE XREF: seg014:0C55j
		cmp	word ptr [di+84Ah], 0FFFEh
		jnz	short loc_A004
		mov	byte ptr [di+851h], 0
		mov	word ptr [di+84Ah], 0FFFFh

loc_A004:				; CODE XREF: seg014:0C67j
		jmp	loc_A0C8
; ���������������������������������������������������������������������������

loc_A007:				; CODE XREF: seg014:0C2Ej
		cmp	word ptr [di+1Dh], 0
		jnz	short loc_A010
		jmp	loc_A0C8
; ���������������������������������������������������������������������������

loc_A010:				; CODE XREF: seg014:0C7Bj
		mov	bx, [di+1Fh]
		mov	al, [bx]
		mov	[bp-4],	al
		or	al, al
		jnz	short loc_A01F
		jmp	loc_A0C8
; ���������������������������������������������������������������������������

loc_A01F:				; CODE XREF: seg014:0C8Aj
		inc	word ptr [di+1Fh]
		mov	al, [bp-4]
		cbw
		cmp	ax, 68h	; 'h'
		jz	short loc_A070
		jg	short loc_A039
		cmp	ax, 63h	; 'c'
		jz	short loc_A088
		cmp	ax, 65h	; 'e'
		jz	short loc_A040
		jmp	short loc_A09B
; ���������������������������������������������������������������������������

loc_A039:				; CODE XREF: seg014:0C9Bj
		cmp	ax, 74h	; 't'
		jz	short loc_A075
		jmp	short loc_A09B
; ���������������������������������������������������������������������������

loc_A040:				; CODE XREF: seg014:0CA5j
		mov	bx, [di+1Fh]
		cmp	byte ptr [bx], 7Ah ; 'z'
		jg	short loc_A050
		mov	bx, [di+1Fh]
		cmp	byte ptr [bx], 61h ; 'a'
		jge	short loc_A05D

loc_A050:				; CODE XREF: seg014:0CB6j
		mov	bx, [di+1Fh]
		inc	word ptr [di+1Fh]
		mov	al, [bx]
		mov	[bp-4],	al
		jmp	short loc_A06E
; ���������������������������������������������������������������������������

loc_A05D:				; CODE XREF: seg014:0CBEj
		mov	bx, [di+1Fh]
		cmp	byte ptr [bx], 72h ; 'r'
		jnz	short loc_A06E
		mov	word ptr [di+84Ah], 6
		inc	word ptr [di+1Fh]

loc_A06E:				; CODE XREF: seg014:0CCBj seg014:0CD3j
		jmp	short loc_A09B
; ���������������������������������������������������������������������������

loc_A070:				; CODE XREF: seg014:0C99j
		inc	word ptr [di+1Fh]
		jmp	short loc_A09B
; ���������������������������������������������������������������������������

loc_A075:				; CODE XREF: seg014:0CACj
		mov	bx, [di+1Fh]
		cmp	byte ptr [bx], 68h ; 'h'
		jnz	short loc_A086
		mov	word ptr [di+84Ah], 9
		inc	word ptr [di+1Fh]

loc_A086:				; CODE XREF: seg014:0CEBj
		jmp	short loc_A09B
; ���������������������������������������������������������������������������

loc_A088:				; CODE XREF: seg014:0CA0j
		mov	bx, [di+1Fh]
		cmp	byte ptr [bx], 68h ; 'h'
		jnz	short loc_A099
		mov	word ptr [di+84Ah], 6
		inc	word ptr [di+1Fh]

loc_A099:				; CODE XREF: seg014:0CFEj
		jmp	short $+2

loc_A09B:				; CODE XREF: seg014:0CA7j seg014:0CAEj ...
		cmp	word ptr [di+84Ah], 0FFFFh
		jnz	short loc_A0C8
		cmp	byte ptr [bp-4], 61h ; 'a'
		jl	short loc_A0C8
		cmp	byte ptr [bp-4], 7Ah ; 'z'
		jg	short loc_A0C8
		mov	al, [bp-4]
		cbw
		add	ax, word_445AC
		mov	bx, ax
		mov	al, [bx-61h]
		cbw
		add	ax, 0FFD0h
		mov	[di+84Ah], ax
		add	word ptr [di+84Ah], 2

loc_A0C8:				; CODE XREF: seg014:loc_A004j
					; seg014:0C7Dj	...
		push	di
		call	LayerGroup_AdvanceAll_2DC2D
		add	sp, 2
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-22. Vrai (1) si la tête n'a pas de texte de lèvres ([+1Dh] = 0) ou si le
; curseur [+1Fh] est sur la fin de la chaîne ; faux sinon. Les conversations attendent ainsi
; la fin d'une réplique.
; ==============================================================================================
TalkingHead_IsLipTextDone_A0D5	proc far		; CODE XREF: Conv_PlayScript_5AA4E+78CP
					; Conv_PlayScript_5AA4E+DC0P ...

arg_0		= word ptr  6

; FUNCTION CHUNK AT 0D6D SIZE 00000003 BYTES

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+1Dh], 0
		jnz	short loc_A0E9
		mov	al, 1
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		jmp	short loc_A0FD
; ���������������������������������������������������������������������������

loc_A0E9:				; CODE XREF: TalkingHead_IsLipTextDone_A0D5+Bj
		mov	bx, [si+1Fh]
		cmp	byte ptr [bx], 0
		jz	short loc_A0F8
		mov	al, 0
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		jmp	short loc_A0FD
; ���������������������������������������������������������������������������

loc_A0F8:				; CODE XREF: TalkingHead_IsLipTextDone_A0D5+1Aj
		mov	al, 1
		pop	si
		pop	bp
		retf
TalkingHead_IsLipTextDone_A0D5	endp

; ���������������������������������������������������������������������������
; START	OF FUNCTION CHUNK FOR TalkingHead_IsLipTextDone_A0D5

loc_A0FD:				; CODE XREF: TalkingHead_IsLipTextDone_A0D5+12j TalkingHead_IsLipTextDone_A0D5+21j
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK	FOR TalkingHead_IsLipTextDone_A0D5

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_A100	proc far		; CODE XREF: seg014:283Fp seg014:2B36p
					; DATA XREF: ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_A112
		jmp	loc_A192
; ���������������������������������������������������������������������������

loc_A112:				; CODE XREF: sub_A100+Dj
		mov	word ptr [si], 1883h
		mov	word ptr [si+0Ah], 18A7h
		push	word ptr [si+1Dh]
		call	Heap_FreeAndCoalesce_2C3FC
		add	sp, 2
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+21h], 185Fh
		mov	ax, si
		add	ax, 21h	; '!'
		push	ax
		call	VoicePlayer_Stop_7B5A
		add	sp, 2
		cmp	byte ptr [si+36h], 0
		jz	short loc_A164
		cmp	dword ptr [si+31h], 0
		jz	short loc_A164
		push	0
		mov	al, [si+35h]
		push	ax
		mov	ax, si
		add	ax, 31h	; '1'
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_A164:				; CODE XREF: sub_A100+42j sub_A100+49j
		mov	dword ptr [si+31h], 0
		mov	byte ptr [si+36h], 0
		mov	dword ptr [si+37h], 0
		push	0
		push	si
		call	sub_2E0C3
		add	sp, 4
		test	di, 1
		jz	short loc_A192
		push	si
		call	sub_308
		add	sp, 2

loc_A192:				; CODE XREF: sub_A100+Fj sub_A100+87j
		pop	di
		pop	si
		pop	bp
		retf
sub_A100	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		or	si, si
		jnz	short loc_A1B2
		push	855h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_A1C3

loc_A1B2:				; CODE XREF: seg014:0E0Fj
		push	si
		push	cs
		call	near ptr sub_9811
		add	sp, 2
		mov	word ptr [si], 182Bh
		mov	word ptr [si+0Ah], 184Fh

loc_A1C3:				; CODE XREF: seg014:0E20j
		mov	ax, si
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		or	si, si
		jnz	short loc_A1E7
		push	855h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_A1FF

loc_A1E7:				; CODE XREF: seg014:0E44j
		push	0
		push	0
		push	word ptr [bp+8]
		push	si
		push	cs
		call	near ptr TalkingHead_Construct_98F4
		add	sp, 8
		mov	word ptr [si], 182Bh
		mov	word ptr [si+0Ah], 184Fh

loc_A1FF:				; CODE XREF: seg014:0E55j
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
; far, LUE 2026-10-22. Personnage qui parle d'une scène de groupe (commande 02h) :
; TalkingHead_Construct_98F4 (855h octets), tables 182Bh / 184Fh. Avance (loc_A3E1) : une
; lettre du texte de lèvres par image, bouche [+84Ah] = table « 04302500000340143000353000 »
; (dseg 15B1h, lettres a à z) + 1, −1 hors minuscule. Dessin ConvFigure_DrawSpeaking_A2B7.
; ==============================================================================================
ConvFigure_ConstructSpeaking_A207	proc far		; CODE XREF: Conv_PlayScript_5AA4E+414P

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_A223
		push	855h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_A23D

loc_A223:				; CODE XREF: ConvFigure_ConstructSpeaking_A207+9j
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr TalkingHead_Construct_98F4
		add	sp, 8
		mov	word ptr [si], 182Bh
		mov	word ptr [si+0Ah], 184Fh

loc_A23D:				; CODE XREF: ConvFigure_ConstructSpeaking_A207+1Aj
		mov	ax, si
		pop	si
		pop	bp
		retf
ConvFigure_ConstructSpeaking_A207	endp

; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		or	si, si
		jnz	short loc_A261
		push	855h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_A2AF

loc_A261:				; CODE XREF: seg014:0EBEj
		push	si
		push	cs
		call	near ptr sub_9811
		add	sp, 2
		mov	word ptr [si], 182Bh
		mov	word ptr [si+0Ah], 184Fh
		xor	ax, ax
		mov	[si+1Dh], ax
		mov	[si+1Fh], ax
		mov	ax, 0FFFFh
		mov	[si+846h], ax
		mov	[si+84Ch], ax
		mov	[si+84Ah], ax
		mov	word ptr [si+84Eh], 0
		mov	word ptr [si+848h], 22h	; '"'
		mov	byte ptr [si+850h], 0
		mov	byte ptr [si+851h], 0
		mov	byte ptr [si+852h], 1
		push	word ptr [bp+8]
		push	si
		push	cs
		call	near ptr sub_9B09
		add	sp, 4

loc_A2AF:				; CODE XREF: seg014:0ECFj
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
; far, LUE 2026-10-22. Dessine le personnage qui parle : image 0 de sa forme (corps) en (x,
; y), puis l'image [+84Ah] (bouche) au même point si ≠ −1, puis les enfants (méthode +10h).
; ==============================================================================================
ConvFigure_DrawSpeaking_A2B7	proc far		; CODE XREF: seg014:101Bp seg014:1048p

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_2], di
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		push	0
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	word_46F44
		call	Shape_DrawSpans_32CD8
		add	sp, 0Ch
		cmp	word ptr [si+84Ah], 0FFFFh
		jz	short loc_A348
		mov	[bp+var_6], di
		mov	ax, [bp+arg_4]
		mov	[bp+var_8], ax
		mov	ax, [si+84Ah]
		mov	[bp+var_A], ax
		cmp	[bp+var_A], 0FFFFh
		jz	short loc_A348
		push	[bp+var_A]
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_8]
		push	[bp+var_6]
		push	word_46F44
		call	Shape_DrawSpans_32CD8
		add	sp, 0Ch
		jmp	short $+2

loc_A348:				; CODE XREF: ConvFigure_DrawSpeaking_A2B7+49j ConvFigure_DrawSpeaking_A2B7+5Fj
		mov	[bp+var_C], 0
		jmp	short loc_A367
; ���������������������������������������������������������������������������

loc_A34F:				; CODE XREF: ConvFigure_DrawSpeaking_A2B7+C4j
		push	[bp+arg_4]
		push	di
		mov	bx, [bp+var_C]
		push	word ptr [bx+6]
		mov	bx, [bp+var_C]
		mov	bx, [bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6

loc_A367:				; CODE XREF: ConvFigure_DrawSpeaking_A2B7+96j
		lea	ax, [bp+var_C]
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_2FC4A
		add	sp, 4
		or	ax, ax
		jnz	short loc_A34F
		pop	di
		pop	si
		leave
		retf
ConvFigure_DrawSpeaking_A2B7	endp

; ���������������������������������������������������������������������������

loc_A381:				; CODE XREF: seg014:2B78j
					; DATA XREF: dseg:1837o
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+6]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		add	sp, 2
		mov	[bp-2],	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		add	sp, 2
		mov	[bp-4],	ax
		push	word ptr [bp-4]
		push	word ptr [bp-2]
		push	si
		push	cs
		call	near ptr ConvFigure_DrawSpeaking_A2B7
		add	sp, 6
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_A3B4:				; CODE XREF: seg014:2B60j
					; DATA XREF: dseg:183Bo
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
		push	word ptr [bp-4]
		push	word ptr [bp-2]
		push	si
		push	cs
		call	near ptr ConvFigure_DrawSpeaking_A2B7
		add	sp, 6
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, LUE 2026-10-22. Méthode +1Ch du personnage qui parle : lettre suivante du texte de
; lèvres ; bouche [+84Ah] = chiffre de la table dseg 15B1h pour la lettre (a à z) + 1, −1
; sinon ; puis avance des enfants.
; ==============================================================================================
ConvFigure_AdvanceSpeaking_A3E1:				; DATA XREF: dseg:1847o
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+6]
		mov	ax, word_445B3
		mov	[bp-4],	ax
		mov	al, byte_445B5
		mov	[bp-2],	al
		mov	word ptr [si+84Ah], 0FFFFh
		cmp	word ptr [si+1Dh], 0
		jz	short loc_A43E
		mov	bx, [si+1Fh]
		mov	al, [bx]
		mov	[bp-4],	al
		or	al, al
		jz	short loc_A43E
		inc	word ptr [si+1Fh]
		cmp	word ptr [si+84Ah], 0FFFFh
		jnz	short loc_A43E
		cmp	byte ptr [bp-4], 61h ; 'a'
		jl	short loc_A43E
		cmp	byte ptr [bp-4], 7Ah ; 'z'
		jg	short loc_A43E
		mov	al, [bp-4]
		cbw
		add	ax, word_445AE
		mov	bx, ax
		mov	al, [bx-61h]
		cbw
		add	ax, 0FFD0h
		mov	[si+84Ah], ax
		inc	word ptr [si+84Ah]

loc_A43E:				; CODE XREF: seg014:1071j seg014:107Dj ...
		push	si
		call	LayerGroup_AdvanceAll_2DC2D
		add	sp, 2
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		or	si, si
		jnz	short loc_A465
		push	1Dh
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_A4C0

loc_A465:				; CODE XREF: seg014:10C3j
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
		mov	word ptr [si], 17FBh
		mov	word ptr [si+0Ah], 181Bh
		mov	word ptr [si+1Bh], 1

loc_A4C0:				; CODE XREF: seg014:10D3j
		mov	ax, si
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		or	si, si
		jnz	short loc_A4E3
		push	1Dh
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_A4FD

loc_A4E3:				; CODE XREF: seg014:1141j
		push	word ptr [bp+8]
		push	si
		call	Layer_ConstructAtOrigin_2DE95
		add	sp, 4
		mov	word ptr [si], 17FBh
		mov	word ptr [si+0Ah], 181Bh
		mov	word ptr [si+1Bh], 1

loc_A4FD:				; CODE XREF: seg014:1151j
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
; far, LUE 2026-10-17. Animation jouée par-dessus l'image 0 de sa ressource :
; Layer_Construct_2DF9B, vtable dseg 6139, image +27 = 1 au départ.
; ==============================================================================================
OverlayAnimLayer_Construct_A505	proc far		; CODE XREF: Midgame1_PlayPart2_671C0+2110P
					; Midgame1_PlayPart2_671C0+28B5P

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_A520
		push	1Dh
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_A540

loc_A520:				; CODE XREF: OverlayAnimLayer_Construct_A505+9j
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [si], 17FBh
		mov	word ptr [si+0Ah], 181Bh
		mov	word ptr [si+1Bh], 1

loc_A540:				; CODE XREF: OverlayAnimLayer_Construct_A505+19j
		mov	ax, si
		pop	si
		pop	bp
		retf
OverlayAnimLayer_Construct_A505	endp

; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, LUE 2026-10-17. Méthode +16 d'OverlayAnimLayer, même code que OverlayLayer_Draw_AA17 :
; image 0 de la ressource dessous, puis image +27 et enfants.
; ==============================================================================================
OverlayAnimLayer_Draw_A548:				; CODE XREF: seg014:2B07j
					; DATA XREF: dseg:180Bo
		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+6]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		add	sp, 2
		mov	[bp-2],	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		add	sp, 2
		mov	[bp-4],	ax
		mov	ax, [bp-2]
		mov	[bp-6],	ax
		mov	ax, [bp-4]
		mov	[bp-8],	ax
		push	0
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [bp-8]
		push	word ptr [bp-6]
		push	word_46F44
		call	Shape_DrawSpans_32CD8
		add	sp, 0Ch
		push	si
		call	Layer_DrawAtOwnPos_2E202
		add	sp, 2
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, LUE 2026-10-17. Méthode +28 : si l'image +27 est inférieure à
; Struct_GetElementCountMinusOne_33352 - 1, l'incrémente (s'arrête une image avant la limite
; d'AnimLayer_Advance_2E607) ; puis avance les enfants.
; ==============================================================================================
OverlayAnimLayer_Advance_A5AF:				; DATA XREF: dseg:1817o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		or	ax, dx
		jz	short loc_A5F8
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		call	Struct_GetElementCountMinusOne_33352
		dec	ax
		cmp	ax, [si+1Bh]
		jbe	short loc_A5F8
		inc	word ptr [si+1Bh]

loc_A5F8:				; CODE XREF: seg014:123Fj seg014:1263j
		push	si
		call	LayerGroup_AdvanceAll_2DC2D
		add	sp, 2
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		or	si, si
		jnz	short loc_A61F
		push	21h ; '!'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_A688

loc_A61F:				; CODE XREF: seg014:127Dj
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
		mov	word ptr [si], 1977h
		mov	word ptr [si+0Ah], 1997h
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+1Fh], 0
		mov	word ptr [si], 17CBh
		mov	word ptr [si+0Ah], 17EBh

loc_A688:				; CODE XREF: seg014:128Dj
		mov	ax, si
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+6]
		or	si, si
		jnz	short loc_A6AE
		push	21h ; '!'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_A6DC

loc_A6AE:				; CODE XREF: seg014:130Cj
		mov	ax, [bp+8]
		mov	[bp-2],	ax
		push	word ptr [bp-2]
		push	si
		call	Layer_ConstructAtOrigin_2DE95
		add	sp, 4
		mov	word ptr [si], 1977h
		mov	word ptr [si+0Ah], 1997h
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+1Fh], 0
		mov	word ptr [si], 17CBh
		mov	word ptr [si+0Ah], 17EBh

loc_A6DC:				; CODE XREF: seg014:131Cj
		mov	ax, si
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
		sub	sp, 6
		push	si
		mov	si, [bp+6]
		or	si, si
		jnz	short loc_A702
		push	21h ; '!'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_A742

loc_A702:				; CODE XREF: seg014:1360j
		mov	ax, [bp+8]
		mov	[bp-2],	ax
		mov	ax, [bp+0Ah]
		mov	[bp-4],	ax
		mov	ax, [bp+0Ch]
		mov	[bp-6],	ax
		push	word ptr [bp-6]
		push	word ptr [bp-4]
		push	word ptr [bp-2]
		push	si
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [si], 1977h
		mov	word ptr [si+0Ah], 1997h
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+1Fh], 0
		mov	word ptr [si], 17CBh
		mov	word ptr [si+0Ah], 17EBh

loc_A742:				; CODE XREF: seg014:1370j
		mov	ax, si
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
		sub	sp, 8
		push	si
		mov	si, [bp+6]
		or	si, si
		jnz	short loc_A768
		push	21h ; '!'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_A7B1

loc_A768:				; CODE XREF: seg014:13C6j
		mov	ax, [bp+8]
		mov	[bp-2],	ax
		mov	ax, [bp+0Ah]
		mov	[bp-4],	ax
		mov	ax, [bp+0Ch]
		mov	[bp-6],	ax
		mov	ax, [bp+0Eh]
		mov	[bp-8],	ax
		push	word ptr [bp-8]
		push	word ptr [bp-6]
		push	word ptr [bp-4]
		push	word ptr [bp-2]
		push	si
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	word ptr [si], 1977h
		mov	word ptr [si+0Ah], 1997h
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+1Fh], 0
		mov	word ptr [si], 17CBh
		mov	word ptr [si+0Ah], 17EBh

loc_A7B1:				; CODE XREF: seg014:13D6j
		mov	ax, si
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
		sub	sp, 0Ah
		push	si
		mov	si, [bp+6]
		or	si, si
		jnz	short loc_A7D7
		push	21h ; '!'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_A82F

loc_A7D7:				; CODE XREF: seg014:1435j
		mov	ax, [bp+8]
		mov	[bp-2],	ax
		mov	ax, [bp+0Ah]
		mov	[bp-4],	ax
		mov	ax, [bp+0Ch]
		mov	[bp-6],	ax
		mov	ax, [bp+0Eh]
		mov	[bp-8],	ax
		mov	ax, [bp+10h]
		mov	[bp-0Ah], ax
		push	word ptr [bp-6]
		push	word ptr [bp-4]
		push	word ptr [bp-2]
		push	si
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [si], 1977h
		mov	word ptr [si+0Ah], 1997h
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+1Fh], 0
		mov	ax, [bp-8]
		mov	[si+1Dh], ax
		mov	ax, [bp-0Ah]
		mov	[si+1Fh], ax
		mov	word ptr [si], 17CBh
		mov	word ptr [si+0Ah], 17EBh

loc_A82F:				; CODE XREF: seg014:1445j
		mov	ax, si
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-21. Calque mobile sur fond (taille 21h, tables de méthodes 17CBh / 17EBh) :
; ImageLayer_Construct_2E02C(ressource arg_2, x arg_4, y arg_6, image arg_C), vitesse +1Dh =
; arg_8, +1Fh = arg_A ; avance comme un calque mobile (MovingLayer_Advance_2E2D1), dessin
; MovingOverlayLayer_Draw_A8BE. mid3 : mid3 8 et mid3 3.
; ==============================================================================================
MovingOverlayLayer_Construct_A837	proc far		; CODE XREF: seg014:034Ep
					; sub_71680+2E39P ...

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_A855
		push	21h ; '!'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_A8B6

loc_A855:				; CODE XREF: MovingOverlayLayer_Construct_A837+Cj
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_6], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_8], ax
		mov	ax, [bp+arg_A]
		mov	[bp+var_A], ax
		mov	ax, [bp+arg_C]
		mov	[bp+var_C], ax
		push	[bp+var_C]
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		push	si
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	word ptr [si], 1977h
		mov	word ptr [si+0Ah], 1997h
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+1Fh], 0
		mov	ax, [bp+var_8]
		mov	[si+1Dh], ax
		mov	ax, [bp+var_A]
		mov	[si+1Fh], ax
		mov	word ptr [si], 17CBh
		mov	word ptr [si+0Ah], 17EBh

loc_A8B6:				; CODE XREF: MovingOverlayLayer_Construct_A837+1Cj
		mov	ax, si
		pop	si
		leave
		retf
MovingOverlayLayer_Construct_A837	endp

; ���������������������������������������������������������������������������
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, LUE 2026-10-21. Méthode +10h de MovingOverlayLayer : image 0 de la ressource à la
; position du calque (Shape_DrawSpans_32CD8), puis Layer_DrawAtOwnPos_2E202 (image courante).
; ==============================================================================================
MovingOverlayLayer_Draw_A8BE:				; CODE XREF: seg014:2AADj
					; DATA XREF: dseg:17DBo
		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+6]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		add	sp, 2
		mov	[bp-2],	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		add	sp, 2
		mov	[bp-4],	ax
		mov	ax, [bp-2]
		mov	[bp-6],	ax
		mov	ax, [bp-4]
		mov	[bp-8],	ax
		push	0
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [bp-8]
		push	word ptr [bp-6]
		push	word_46F44
		call	Shape_DrawSpans_32CD8
		add	sp, 0Ch
		push	si
		call	Layer_DrawAtOwnPos_2E202
		add	sp, 2
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		or	si, si
		jnz	short loc_A940
		push	1Dh
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_A996

loc_A940:				; CODE XREF: seg014:159Ej
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
		mov	word ptr [si], 179Bh
		mov	word ptr [si+0Ah], 17BBh

loc_A996:				; CODE XREF: seg014:15AEj
		mov	ax, si
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		or	si, si
		jnz	short loc_A9B9
		push	1Dh
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_A9CE

loc_A9B9:				; CODE XREF: seg014:1617j
		push	word ptr [bp+8]
		push	si
		call	Layer_ConstructAtOrigin_2DE95
		add	sp, 4
		mov	word ptr [si], 179Bh
		mov	word ptr [si+0Ah], 17BBh

loc_A9CE:				; CODE XREF: seg014:1627j
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
; far, LUE 2026-10-17. Image fixe posée sur l'image 0 de sa propre ressource :
; ImageLayer_Construct_2E02C, vtable dseg 6043, dessin OverlayLayer_Draw_AA17, avance de base
; Layer_Advance_2E2C3.
; ==============================================================================================
OverlayImageLayer_Construct_A9D6	proc far		; CODE XREF: Gameflow_ShowKillMarks_506AA+374P
					; Conv_PlayScript_5AA4E+1ACAP ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_A9F1
		push	1Dh
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_AA0F

loc_A9F1:				; CODE XREF: OverlayImageLayer_Construct_A9D6+9j
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	word ptr [si], 179Bh
		mov	word ptr [si+0Ah], 17BBh

loc_AA0F:				; CODE XREF: OverlayImageLayer_Construct_A9D6+19j
		mov	ax, si
		pop	si
		pop	bp
		retf
OverlayImageLayer_Construct_A9D6	endp

; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, LUE 2026-10-17. Méthode +16 commune à OverlayImageLayer et OverlayAnimLayer : dessine
; l'image 0 de la ressource à la position absolue du calque, puis l'image +27 et les enfants
; par Layer_DrawAtOwnPos_2E202. (loc_A548 est une copie identique.)
; ==============================================================================================
OverlayLayer_Draw_AA17:				; CODE XREF: seg014:2A54j
					; DATA XREF: dseg:17ABo
		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+6]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		add	sp, 2
		mov	[bp-2],	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		add	sp, 2
		mov	[bp-4],	ax
		mov	ax, [bp-2]
		mov	[bp-6],	ax
		mov	ax, [bp-4]
		mov	[bp-8],	ax
		push	0
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [bp-8]
		push	word ptr [bp-6]
		push	word_46F44
		call	Shape_DrawSpans_32CD8
		add	sp, 0Ch
		push	si
		call	Layer_DrawAtOwnPos_2E202
		add	sp, 2
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		or	si, si
		jnz	short loc_AA99
		push	21h ; '!'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_AAEF

loc_AA99:				; CODE XREF: seg014:16F7j
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
		mov	word ptr [si], 176Bh
		mov	word ptr [si+0Ah], 178Bh

loc_AAEF:				; CODE XREF: seg014:1707j
		mov	ax, si
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		or	si, si
		jnz	short loc_AB12
		push	21h ; '!'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_AB63

loc_AB12:				; CODE XREF: seg014:1770j
		push	word ptr [bp+8]
		push	si
		call	Layer_ConstructAtOrigin_2DE95
		add	sp, 4
		mov	word ptr [si], 176Bh
		mov	word ptr [si+0Ah], 178Bh
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		call	Struct_GetElementCountMinusOne_33352
		mov	[si+1Eh], ax
		cmp	word ptr [si+1Eh], 1
		jle	short loc_AB5F
		cmp	byte ptr [si+20h], 33h ; '3'
		jle	short loc_AB5F
		mov	byte ptr [si+1Dh], 1
		mov	word ptr [si+1Bh], 1
		jmp	short loc_AB63
; ���������������������������������������������������������������������������

loc_AB5F:				; CODE XREF: seg014:17BCj seg014:17C2j
		mov	byte ptr [si+1Dh], 0

loc_AB63:				; CODE XREF: seg014:1780j seg014:17CDj
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
; far, LUE 2026-10-22. Figurant d'une scène de groupe (commande 01h) : Layer_Construct_2DF9B
; (21h octets), tables 176Bh / 178Bh ; [+20h] = dernier caractère du nom de figure. Si la
; forme a plus d'une image et que ce caractère est > « 3 », mode animé ([+1Dh] = 1, image
; [+1Bh] = 1). Dessin loc_ABEB : image 0, puis en mode animé l'image courante ; avance
; loc_AC58 : image 1 à n − 1 en boucle.
; ==============================================================================================
ConvFigure_ConstructExtra_AB6B	proc far		; CODE XREF: Conv_PlayScript_5AA4E+2ABP

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_AB86
		push	21h ; '!'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_ABE3

loc_AB86:				; CODE XREF: ConvFigure_ConstructExtra_AB6B+9j
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [si], 176Bh
		mov	word ptr [si+0Ah], 178Bh
		mov	al, [bp+arg_8]
		mov	[si+20h], al
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		call	Struct_GetElementCountMinusOne_33352
		mov	[si+1Eh], ax
		cmp	word ptr [si+1Eh], 1
		jle	short loc_ABDF
		cmp	byte ptr [si+20h], 33h ; '3'
		jle	short loc_ABDF
		mov	byte ptr [si+1Dh], 1
		mov	word ptr [si+1Bh], 1
		jmp	short loc_ABE3
; ���������������������������������������������������������������������������

loc_ABDF:				; CODE XREF: ConvFigure_ConstructExtra_AB6B+61j ConvFigure_ConstructExtra_AB6B+67j
		mov	byte ptr [si+1Dh], 0

loc_ABE3:				; CODE XREF: ConvFigure_ConstructExtra_AB6B+19j ConvFigure_ConstructExtra_AB6B+72j
		mov	ax, si
		pop	si
		pop	bp
		retf
ConvFigure_ConstructExtra_AB6B	endp

; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, LUE 2026-10-22. Méthode +10h du figurant : image 0 de sa forme en (x, y) ; puis, en
; mode animé ([+1Dh] ≠ 0), l'image courante [+1Bh] (Layer_DrawAtOwnPos_2E202).
; ==============================================================================================
ConvFigure_DrawExtra_ABEB:				; CODE XREF: seg014:29FBj
					; DATA XREF: dseg:177Bo
		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+6]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		add	sp, 2
		mov	[bp-2],	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		add	sp, 2
		mov	[bp-4],	ax
		mov	ax, [bp-2]
		mov	[bp-6],	ax
		mov	ax, [bp-4]
		mov	[bp-8],	ax
		push	0
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [bp-8]
		push	word ptr [bp-6]
		push	word_46F44
		call	Shape_DrawSpans_32CD8
		add	sp, 0Ch
		cmp	byte ptr [si+1Dh], 0
		jz	short loc_AC55
		push	si
		call	Layer_DrawAtOwnPos_2E202
		add	sp, 2

loc_AC55:				; CODE XREF: seg014:18BAj
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, LUE 2026-10-22. Méthode +1Ch du figurant : en mode animé, image +1 jusqu'à n − 1 puis
; retour à 1 ; puis avance des enfants.
; ==============================================================================================
ConvFigure_AdvanceExtra_AC58:				; DATA XREF: dseg:1787o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		cmp	byte ptr [si+1Dh], 0
		jz	short loc_AC78
		mov	ax, [si+1Eh]
		dec	ax
		cmp	ax, [si+1Bh]
		jbe	short loc_AC73
		inc	word ptr [si+1Bh]
		jmp	short loc_AC78
; ���������������������������������������������������������������������������

loc_AC73:				; CODE XREF: seg014:18DCj
		mov	word ptr [si+1Bh], 1

loc_AC78:				; CODE XREF: seg014:18D3j seg014:18E1j
		push	si
		call	LayerGroup_AdvanceAll_2DC2D
		add	sp, 2
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_AC84	proc far		; CODE XREF: sub_AEF4+20p

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_AC9F
		push	15h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_ACE9

loc_AC9F:				; CODE XREF: sub_AC84+9j
		mov	word ptr [si], 18BFh
		mov	word ptr [si+4], 18B7h
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], 18BBh
		mov	word ptr [si+2], 0
		mov	word ptr [si+0Ah], 11BCh
		mov	word ptr [si+0Ah], 11C8h
		mov	word ptr [si+0Ah], 11D8h
		mov	word ptr [si], 173Bh
		mov	word ptr [si+0Ah], 175Bh
		mov	ax, [bp+arg_2]
		mov	[si+11h], ax
		mov	word ptr [si+0Ch], 0
		mov	word ptr [si+0Eh], 0
		mov	word ptr [si+13h], 0

loc_ACE9:				; CODE XREF: sub_AC84+19j
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_AC84	endp

; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-21. Calque de texte (15h octets, alloué si nul, tables 173Bh / 175Bh) :
; zone de texte +11h = arg_2, x +0Ch = arg_4, y +0Eh = arg_6, chaîne +13h = 0. Dessin sub_ADC7
; : si la chaîne ≠ 0, Widget_RenderComplexLayoutWrapper_31A3B(zone, format dseg 15E0h « X%Y%S
; », x, y, chaîne), puis les enfants. mid33 : inscriptions de la pierre tombale (noms du
; joueur).
; ==============================================================================================
TextLayer_Construct_ACF1	proc far		; CODE XREF: Gameflow_Catalog_52662+311P
					; Gameflow_Catalog_52662+327P ...

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
		jnz	short loc_AD0F
		push	15h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_AD67

loc_AD0F:				; CODE XREF: TextLayer_Construct_ACF1+Cj
		mov	word ptr [si], 18BFh
		mov	word ptr [si+4], 18B7h
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], 18BBh
		mov	word ptr [si+2], 0
		mov	word ptr [si+0Ah], 11BCh
		mov	word ptr [si+0Ah], 11C8h
		mov	word ptr [si+0Ah], 11D8h
		mov	word ptr [si], 173Bh
		mov	word ptr [si+0Ah], 175Bh
		mov	ax, [bp+arg_2]
		mov	[si+11h], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		mov	[si+0Ch], ax
		mov	ax, [bp+var_4]
		mov	[si+0Eh], ax
		mov	word ptr [si+13h], 0

loc_AD67:				; CODE XREF: TextLayer_Construct_ACF1+1Cj
		mov	ax, si
		pop	si
		leave
		retf
TextLayer_Construct_ACF1	endp

; ���������������������������������������������������������������������������
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_AD6F	proc far		; CODE XREF: seg014:294Bp
					; DATA XREF: dseg:173Bo

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_ADAB
		mov	word ptr [si], 173Bh
		mov	word ptr [si+0Ah], 175Bh
		push	si
		push	si
		call	LayerGroup_Remove_2DBC1
		add	sp, 4
		push	0
		push	si
		call	sub_2DB51
		add	sp, 4
		test	di, 1
		jz	short loc_ADAB
		push	si
		call	sub_308
		add	sp, 2

loc_ADAB:				; CODE XREF: sub_AD6F+Dj sub_AD6F+31j
		pop	di
		pop	si
		pop	bp
		retf
sub_AD6F	endp

; ���������������������������������������������������������������������������

loc_ADAF:				; DATA XREF: dseg:171Fo dseg:174Fo
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-21. Pose la chaîne d'un TextLayer : [arg_0 + 13h] = arg_2 (pointeur
; proche).
; ==============================================================================================
TextLayer_SetText_ADB7	proc far		; CODE XREF: Gameflow_Catalog_52662+742P
					; Gameflow_Catalog_52662+781P ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+13h], ax
		pop	si
		pop	bp
		retf
TextLayer_SetText_ADB7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_ADC7	proc far		; CODE XREF: seg014:1B1Bp seg014:1B48p ...

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word ptr [si+13h], 0
		jz	short loc_ADF0
		push	word ptr [si+13h]
		push	[bp+arg_4]
		push	di
		push	15E0h
		push	word ptr [si+11h]
		call	Widget_RenderComplexLayoutWrapper_31A3B
		add	sp, 0Ah

loc_ADF0:				; CODE XREF: sub_ADC7+12j
		mov	[bp+var_2], 0
		jmp	short loc_AE0F
; ���������������������������������������������������������������������������

loc_ADF7:				; CODE XREF: sub_ADC7+5Cj
		push	[bp+arg_4]
		push	di
		mov	bx, [bp+var_2]
		push	word ptr [bx+6]
		mov	bx, [bp+var_2]
		mov	bx, [bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6

loc_AE0F:				; CODE XREF: sub_ADC7+2Ej
		lea	ax, [bp+var_2]
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_2FC4A
		add	sp, 4
		or	ax, ax
		jnz	short loc_ADF7
		pop	di
		pop	si
		leave
		retf
sub_ADC7	endp

; ���������������������������������������������������������������������������

loc_AE29:				; DATA XREF: dseg:170Fo dseg:173Fo
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		cmp	word ptr [si+2], 0
		jz	short loc_AE4C
		push	word ptr [si+2]
		mov	bx, [si+2]
		mov	bx, [bx]
		call	dword ptr [bx+4]
		add	sp, 2
		add	ax, [si+0Ch]
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		jmp	short loc_AE52
; ���������������������������������������������������������������������������

loc_AE4C:				; CODE XREF: seg014:1AA4j
		mov	ax, [si+0Ch]
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_AE52:				; CODE XREF: seg014:1ABAj
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_AE55:				; DATA XREF: dseg:1713o dseg:1743o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		cmp	word ptr [si+2], 0
		jz	short loc_AE78
		push	word ptr [si+2]
		mov	bx, [si+2]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 2
		add	ax, [si+0Eh]
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		jmp	short loc_AE7E
; ���������������������������������������������������������������������������

loc_AE78:				; CODE XREF: seg014:1AD0j
		mov	ax, [si+0Eh]
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_AE7E:				; CODE XREF: seg014:1AE6j
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_AE81:				; CODE XREF: seg014:29B9j
					; DATA XREF: dseg:1747o
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+6]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		add	sp, 2
		mov	[bp-2],	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		add	sp, 2
		mov	[bp-4],	ax
		push	word ptr [bp-4]
		push	word ptr [bp-2]
		push	si
		push	cs
		call	near ptr sub_ADC7
		add	sp, 6
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_AEB4:				; CODE XREF: seg014:29A1j
					; DATA XREF: dseg:174Bo
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
		push	word ptr [bp-4]
		push	word ptr [bp-2]
		push	si
		push	cs
		call	near ptr sub_ADC7
		add	sp, 6
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_AEE1:				; DATA XREF: dseg:1727o dseg:1757o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	si
		call	LayerGroup_AdvanceAll_2DC2D
		add	sp, 2
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_AEF4	proc far		; CODE XREF: sub_BDE10+A2DP

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_AF0F
		push	17h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_AF29

loc_AF0F:				; CODE XREF: sub_AEF4+9j
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_AC84
		add	sp, 4
		mov	word ptr [si], 170Bh
		mov	word ptr [si+0Ah], 172Bh
		mov	ax, [bp+arg_4]
		mov	[si+15h], ax

loc_AF29:				; CODE XREF: sub_AEF4+19j
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_AEF4	endp

; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_AF31:				; CODE XREF: seg014:2995j
					; DATA XREF: dseg:1717o
		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	si, [bp+6]
		mov	ax, [si+15h]
		mov	[bp-2],	ax
		mov	bx, [si+11h]
		mov	ax, [bp-2]
		mov	[bx+14h], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		add	sp, 2
		mov	[bp-4],	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		add	sp, 2
		mov	[bp-6],	ax
		push	word ptr [bp-6]
		push	word ptr [bp-4]
		push	si
		push	cs
		call	near ptr sub_ADC7
		add	sp, 6
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_AF73:				; CODE XREF: seg014:297Dj
					; DATA XREF: dseg:171Bo
		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	si, [bp+6]
		mov	ax, [si+15h]
		mov	[bp-2],	ax
		mov	bx, [si+11h]
		mov	ax, [bp-2]
		mov	[bx+14h], ax
		mov	ax, [si+0Ch]
		add	ax, [bp+8]
		mov	[bp-4],	ax
		mov	ax, [si+0Eh]
		add	ax, [bp+0Ah]
		mov	[bp-6],	ax
		push	word ptr [bp-6]
		push	word ptr [bp-4]
		push	si
		push	cs
		call	near ptr sub_ADC7
		add	sp, 6
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		or	si, si
		jnz	short loc_AFCA
		push	1Eh
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_B024

loc_AFCA:				; CODE XREF: seg014:1C28j
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
		mov	word ptr [si], 16DBh
		mov	word ptr [si+0Ah], 16FBh
		mov	byte ptr [si+1Dh], 0

loc_B024:				; CODE XREF: seg014:1C38j
		mov	ax, si
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		or	si, si
		jnz	short loc_B047
		push	1Eh
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_B060

loc_B047:				; CODE XREF: seg014:1CA5j
		push	word ptr [bp+8]
		push	si
		call	Layer_ConstructAtOrigin_2DE95
		add	sp, 4
		mov	word ptr [si], 16DBh
		mov	word ptr [si+0Ah], 16FBh
		mov	byte ptr [si+1Dh], 0

loc_B060:				; CODE XREF: seg014:1CB5j
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
; far, LUE 2026-10-17. Animation à déclenchement : ImageLayer_Construct_2E02C (image de départ
; arg_8), vtable dseg 5851, drapeau de lecture +29 = 0. L'appelant pose +29 pour lancer
; l'animation.
; ==============================================================================================
TriggeredAnimLayer_Construct_B068	proc far		; CODE XREF: Gameflow_PlayShot_4AD86+3AAP
					; Midgame1_PlayPart2_671C0+3FD6P ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_B083
		push	1Eh
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_B0A5

loc_B083:				; CODE XREF: TriggeredAnimLayer_Construct_B068+9j
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	word ptr [si], 16DBh
		mov	word ptr [si+0Ah], 16FBh
		mov	byte ptr [si+1Dh], 0

loc_B0A5:				; CODE XREF: TriggeredAnimLayer_Construct_B068+19j
		mov	ax, si
		pop	si
		pop	bp
		retf
TriggeredAnimLayer_Construct_B068	endp

; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, LUE 2026-10-17. Méthode +28 : seulement si +29 est posé, incrémente l'image +27 jusqu'à
; Struct_GetElementCountMinusOne_33352 - 1 ; puis avance les enfants.
; ==============================================================================================
TriggeredAnimLayer_Advance_B0AD:				; DATA XREF: dseg:16F7o
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+6]
		cmp	byte ptr [si+1Dh], 0
		jz	short loc_B0EA
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		call	Struct_GetElementCountMinusOne_33352
		mov	[bp-2],	ax
		mov	ax, [bp-2]
		dec	ax
		cmp	[si+1Bh], ax
		jnb	short loc_B0EA
		inc	word ptr [si+1Bh]

loc_B0EA:				; CODE XREF: seg014:1D2Bj seg014:1D55j
		push	si
		call	Layer_Advance_2E2C3
		add	sp, 2
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_B0F6	proc far		; CODE XREF: Gameflow_PlayShot_4AD86+6B8P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		call	Struct_GetElementCountMinusOne_33352
		dec	ax
		cmp	ax, [si+1Bh]
		jnz	short loc_B126
		mov	ax, 1
		jmp	short loc_B128
; ���������������������������������������������������������������������������

loc_B126:				; CODE XREF: sub_B0F6+29j
		xor	ax, ax

loc_B128:				; CODE XREF: sub_B0F6+2Ej
		pop	si
		pop	bp
		retf
sub_B0F6	endp

; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-17. Image fixe (ImageLayer_Construct_2E02C) qui tremble : vtable dseg 5803,
; avance = JitterImageLayer_Advance_B16F.
; ==============================================================================================
JitterImageLayer_Construct_B12E	proc far		; CODE XREF: Midgame1_PlayPart1_5FCF0+4254P
					; Midgame1_PlayPart1_5FCF0+6315P ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_B149
		push	1Dh
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_B167

loc_B149:				; CODE XREF: JitterImageLayer_Construct_B12E+9j
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	word ptr [si], 16ABh
		mov	word ptr [si+0Ah], 16CBh

loc_B167:				; CODE XREF: JitterImageLayer_Construct_B12E+19j
		mov	ax, si
		pop	si
		pop	bp
		retf
JitterImageLayer_Construct_B12E	endp

; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, LUE 2026-10-17. À chaque image, pour y puis pour x : une fois sur deux (CRT_Rand bit
; 1), ajoute ou retire (une fois sur deux) 0 ou 1 pixel (CRT_Rand bit 1). La position n'est
; jamais ramenée : c'est une marche aléatoire d'un pixel au plus par image. Puis avance les
; enfants.
; ==============================================================================================
JitterImageLayer_Advance_B16F:				; DATA XREF: dseg:16C7o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		call	CRT_Rand
		test	ax, 1
		jz	short loc_B1A2
		call	CRT_Rand
		test	ax, 1
		jz	short loc_B197
		call	CRT_Rand
		and	ax, 1
		add	[si+0Eh], ax
		jmp	short loc_B1A2
; ���������������������������������������������������������������������������

loc_B197:				; CODE XREF: seg014:1DF8j
		call	CRT_Rand
		and	ax, 1
		sub	[si+0Eh], ax

loc_B1A2:				; CODE XREF: seg014:1DEEj seg014:1E05j
		call	CRT_Rand
		test	ax, 1
		jz	short loc_B1CE
		call	CRT_Rand
		test	ax, 1
		jz	short loc_B1C3
		call	CRT_Rand
		and	ax, 1
		add	[si+0Ch], ax
		jmp	short loc_B1CE
; ���������������������������������������������������������������������������

loc_B1C3:				; CODE XREF: seg014:1E24j
		call	CRT_Rand
		and	ax, 1
		sub	[si+0Ch], ax

loc_B1CE:				; CODE XREF: seg014:1E1Aj seg014:1E31j
		push	si
		call	Layer_Advance_2E2C3
		add	sp, 2
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		or	si, si
		jnz	short loc_B1F6
		push	853h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_B207

loc_B1F6:				; CODE XREF: seg014:1E53j
		push	si
		push	cs
		call	near ptr sub_9811
		add	sp, 2
		mov	word ptr [si], 1677h
		mov	word ptr [si+0Ah], 169Bh

loc_B207:				; CODE XREF: seg014:1E64j
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
; far, LUE 2026-10-17. Tête parlante (TalkingHead_Construct_98F4) dont le dessin ajoute deux
; images fixes : vtable dseg 5751, dessin TalkingHeadOverlay_DrawAt_B28E. mid1 : ressource
; chargée par sub_C38E sous le nom « air » (« pri » dans optest.asm : octets modifiés par
; Rémi, « air » à l'origine), position (160, 128), image de base 31 ou 27
; (TalkingHead_SetBaseFrame_9D32).
; ==============================================================================================
TalkingHeadOverlay_Construct_B20F	proc far		; CODE XREF: Midgame1_PlayPart2_671C0+1D5P
					; Midgame1_PlayPart2_671C0+2567P ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_B22B
		push	853h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_B245

loc_B22B:				; CODE XREF: TalkingHeadOverlay_Construct_B20F+9j
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr TalkingHead_Construct_98F4
		add	sp, 8
		mov	word ptr [si], 1677h
		mov	word ptr [si+0Ah], 169Bh

loc_B245:				; CODE XREF: TalkingHeadOverlay_Construct_B20F+1Aj
		mov	ax, si
		pop	si
		pop	bp
		retf
TalkingHeadOverlay_Construct_B20F	endp

; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		or	si, si
		jnz	short loc_B269
		push	853h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_B286

loc_B269:				; CODE XREF: seg014:1EC6j
		push	word ptr [bp+0Eh]
		push	word ptr [bp+0Ch]
		push	word ptr [bp+0Ah]
		push	word ptr [bp+8]
		push	si
		push	cs
		call	near ptr sub_9A8B
		add	sp, 0Ah
		mov	word ptr [si], 1677h
		mov	word ptr [si+0Ah], 169Bh

loc_B286:				; CODE XREF: seg014:1ED7j
		mov	ax, si
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, LUE 2026-10-17. Méthode +32 : TalkingHead_DrawAt_9D47, puis les images 35 et 38 de la
; ressource à la même position.
; ==============================================================================================
TalkingHeadOverlay_DrawAt_B28E:				; DATA XREF: dseg:1697o
		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		push	word ptr [bp+0Ah]
		push	di
		push	si
		push	cs
		call	near ptr TalkingHead_DrawAt_9D47
		add	sp, 6
		mov	[bp-2],	di
		mov	ax, [bp+0Ah]
		mov	[bp-4],	ax
		push	23h ; '#'
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [bp-4]
		push	word ptr [bp-2]
		push	word_46F44
		call	Shape_DrawSpans_32CD8
		add	sp, 0Ch
		mov	[bp-6],	di
		mov	ax, [bp+0Ah]
		mov	[bp-8],	ax
		push	26h ; '&'
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [bp-8]
		push	word ptr [bp-6]
		push	word_46F44
		call	Shape_DrawSpans_32CD8
		add	sp, 0Ch
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		or	si, si
		jnz	short loc_B333
		push	29h ; ')'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_B39C

loc_B333:				; CODE XREF: seg014:1F91j
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
		mov	word ptr [si], 1977h
		mov	word ptr [si+0Ah], 1997h
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+1Fh], 0
		mov	word ptr [si], 1647h
		mov	word ptr [si+0Ah], 1667h

loc_B39C:				; CODE XREF: seg014:1FA1j
		mov	ax, si
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+6]
		or	si, si
		jnz	short loc_B3C2
		push	29h ; ')'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_B3F0

loc_B3C2:				; CODE XREF: seg014:2020j
		mov	ax, [bp+8]
		mov	[bp-2],	ax
		push	word ptr [bp-2]
		push	si
		call	Layer_ConstructAtOrigin_2DE95
		add	sp, 4
		mov	word ptr [si], 1977h
		mov	word ptr [si+0Ah], 1997h
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+1Fh], 0
		mov	word ptr [si], 1647h
		mov	word ptr [si+0Ah], 1667h

loc_B3F0:				; CODE XREF: seg014:2030j
		mov	ax, si
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-17. Calque mobile (vitesse +29/+31 = 0) dessiné dans un rectangle de
; découpe (41 octets ; vtable dseg 5703). Le rectangle +33 gauche, +35 haut, +37 droite, +39
; bas est écrit par l'appelant après création (mid1 : 131, 9, 190, 67). Dessin :
; ClippedLayer_Draw_B563 ; avance : MovingLayer_Advance_2E2D1.
; ==============================================================================================
ClippedMovingLayer_Construct_B3F8	proc far		; CODE XREF: Midgame1_PlayPart1_5FCF0+3562P
					; Midgame1_PlayPart1_5FCF0+5549P

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_B416
		push	29h ; ')'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_B456

loc_B416:				; CODE XREF: ClippedMovingLayer_Construct_B3F8+Cj
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_6], ax
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		push	si
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [si], 1977h
		mov	word ptr [si+0Ah], 1997h
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+1Fh], 0
		mov	word ptr [si], 1647h
		mov	word ptr [si+0Ah], 1667h

loc_B456:				; CODE XREF: ClippedMovingLayer_Construct_B3F8+1Cj
		mov	ax, si
		pop	si
		leave
		retf
ClippedMovingLayer_Construct_B3F8	endp

; ���������������������������������������������������������������������������
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-17. Comme ClippedMovingLayer_Construct_B3F8, mais sur
; ImageLayer_Construct_2E02C (numéro d'image arg_8).
; ==============================================================================================
ClippedMovingImageLayer_Construct_B45E	proc far		; CODE XREF: Midgame1_PlayPart1_5FCF0+3685P
					; Midgame1_PlayPart1_5FCF0+36D4P ...

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_B47C
		push	29h ; ')'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_B4C5

loc_B47C:				; CODE XREF: ClippedMovingImageLayer_Construct_B45E+Cj
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_6], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_8], ax
		push	[bp+var_8]
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		push	si
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	word ptr [si], 1977h
		mov	word ptr [si+0Ah], 1997h
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+1Fh], 0
		mov	word ptr [si], 1647h
		mov	word ptr [si+0Ah], 1667h

loc_B4C5:				; CODE XREF: ClippedMovingImageLayer_Construct_B45E+1Cj
		mov	ax, si
		pop	si
		leave
		retf
ClippedMovingImageLayer_Construct_B45E	endp

; ���������������������������������������������������������������������������
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-17. Crée un contexte de dessin temporaire sur la surface word_46F44
; (sub_2E9A4) limité au rectangle +33/+35/+37/+39, y dessine l'image +27 de la ressource en
; (x, y) (sub_32CD8), puis libère le contexte (TextFormat_ReleaseStyleList_2EBFA). Les enfants
; ne sont pas dessinés.
; ==============================================================================================
ClippedLayer_DrawAt_B4CD	proc far		; CODE XREF: seg014:21E2p

var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		mov	si, [bp+arg_0]
		mov	ax, word_46F44
		mov	[bp+var_2], ax
		mov	[bp+var_18], 0
		mov	[bp+var_16], 0
		push	[bp+var_2]
		lea	ax, [bp+var_18]
		push	ax
		call	TextFormat_ApplyStyleAttribute_2E9A4
		add	sp, 4
		mov	ax, [si+21h]
		mov	[bp+var_4], ax
		mov	ax, [si+23h]
		mov	[bp+var_6], ax
		mov	ax, [si+25h]
		mov	[bp+var_8], ax
		mov	ax, [si+27h]
		mov	[bp+var_A], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_14], ax
		mov	ax, [bp+var_6]
		mov	[bp+var_12], ax
		mov	ax, [bp+var_8]
		mov	[bp+var_10], ax
		mov	ax, [bp+var_A]
		mov	[bp+var_E], ax
		push	word ptr [si+1Bh]
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+arg_4]
		push	[bp+arg_2]
		lea	ax, [bp+var_18]
		push	ax
		call	Shape_DrawSpans_32CD8
		add	sp, 0Ch
		lea	ax, [bp+var_18]
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		pop	si
		leave
		retf
ClippedLayer_DrawAt_B4CD	endp

; ���������������������������������������������������������������������������

; ==============================================================================================
; far, LUE 2026-10-17. Méthode +16 des calques découpés : ClippedLayer_DrawAt_B4CD à la
; position propre du calque (+12, +14).
; ==============================================================================================
ClippedLayer_Draw_B563:				; CODE XREF: seg014:2810j
					; DATA XREF: dseg:1657o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	word ptr [si+0Eh]
		push	word ptr [si+0Ch]
		push	si
		push	cs
		call	near ptr ClippedLayer_DrawAt_B4CD
		add	sp, 6
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-17. Transition à deux sens sur 14 étapes (30 octets, vtable dseg 5655) :
; Layer_Construct_2DF9B, sens +29 = arg_8 ; étape +27 = 0 si le sens est posé, 13 sinon.
; ==============================================================================================
ToggleLayer_Construct_B57B	proc far		; CODE XREF: Midgame1_PlayPart2_671C0+25C3P
					; sub_71680+4249P ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_B596
		push	1Eh
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_B5C9

loc_B596:				; CODE XREF: ToggleLayer_Construct_B57B+9j
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [si], 1617h
		mov	word ptr [si+0Ah], 1637h
		mov	al, [bp+arg_8]
		mov	[si+1Dh], al
		cmp	byte ptr [si+1Dh], 0
		jz	short loc_B5C4
		mov	word ptr [si+1Bh], 0
		jmp	short loc_B5C9
; ���������������������������������������������������������������������������

loc_B5C4:				; CODE XREF: ToggleLayer_Construct_B57B+40j
		mov	word ptr [si+1Bh], 0Dh

loc_B5C9:				; CODE XREF: ToggleLayer_Construct_B57B+19j ToggleLayer_Construct_B57B+47j
		mov	ax, si
		pop	si
		pop	bp
		retf
ToggleLayer_Construct_B57B	endp

; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-17. Dessin selon l'étape t (+27) : t < 4 : image 0 ; t > 8 : image 13 ;
; puis t = 12 : image 1, sinon image t. Les enfants ne sont pas dessinés.
; ==============================================================================================
ToggleLayer_DrawAt_B5D1	proc far		; CODE XREF: seg014:2378p seg014:23A5p

var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word ptr [si+1Bh], 4
		jnb	short loc_B61B
		mov	[bp+var_2], di
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		push	0
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	word_46F44
		call	Shape_DrawSpans_32CD8
		add	sp, 0Ch

loc_B61B:				; CODE XREF: ToggleLayer_DrawAt_B5D1+12j
		cmp	word ptr [si+1Bh], 8
		jbe	short loc_B657
		mov	[bp+var_6], di
		mov	ax, [bp+arg_4]
		mov	[bp+var_8], ax
		push	0Dh
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_8]
		push	[bp+var_6]
		push	word_46F44
		call	Shape_DrawSpans_32CD8
		add	sp, 0Ch

loc_B657:				; CODE XREF: ToggleLayer_DrawAt_B5D1+4Ej
		cmp	word ptr [si+1Bh], 0Ch
		jnz	short loc_B695
		mov	[bp+var_A], di
		mov	ax, [bp+arg_4]
		mov	[bp+var_C], ax
		push	1
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_C]
		push	[bp+var_A]
		push	word_46F44
		call	Shape_DrawSpans_32CD8
		add	sp, 0Ch
		jmp	short loc_B6DA
; ���������������������������������������������������������������������������

loc_B695:				; CODE XREF: ToggleLayer_DrawAt_B5D1+8Aj
		mov	[bp+var_E], di
		mov	ax, [bp+arg_4]
		mov	[bp+var_10], ax
		mov	ax, [si+1Bh]
		mov	[bp+var_12], ax
		cmp	[bp+var_12], 0FFFFh
		jz	short loc_B6DA
		push	[bp+var_12]
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_10]
		push	[bp+var_E]
		push	word_46F44
		call	Shape_DrawSpans_32CD8
		add	sp, 0Ch
		jmp	short $+2

loc_B6DA:				; CODE XREF: ToggleLayer_DrawAt_B5D1+C2j ToggleLayer_DrawAt_B5D1+D7j
		pop	di
		pop	si
		leave
		retf
ToggleLayer_DrawAt_B5D1	endp

; ���������������������������������������������������������������������������

; ==============================================================================================
; far, LUE 2026-10-17. Méthode +12 : ToggleLayer_DrawAt_B5D1 à la position absolue (méthodes
; +4, +8).
; ==============================================================================================
ToggleLayer_DrawAtOwnPos_B6DE:				; CODE XREF: seg014:27CFj
					; DATA XREF: dseg:1623o
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+6]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		add	sp, 2
		mov	[bp-2],	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		add	sp, 2
		mov	[bp-4],	ax
		push	word ptr [bp-4]
		push	word ptr [bp-2]
		push	si
		push	cs
		call	near ptr ToggleLayer_DrawAt_B5D1
		add	sp, 6
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, LUE 2026-10-17. Méthode +16 : ToggleLayer_DrawAt_B5D1 en (x du calque + x du parent, y
; + y du parent).
; ==============================================================================================
ToggleLayer_Draw_B711:				; CODE XREF: seg014:27B7j
					; DATA XREF: dseg:1627o
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
		push	word ptr [bp-4]
		push	word ptr [bp-2]
		push	si
		push	cs
		call	near ptr ToggleLayer_DrawAt_B5D1
		add	sp, 6
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, LUE 2026-10-17. Méthode +28 : sens posé, étape +27 incrémentée jusqu'à 13 ; sens nul,
; décrémentée jusqu'à 0. N'avance pas les enfants.
; ==============================================================================================
ToggleLayer_Advance_B73E:				; DATA XREF: dseg:1633o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		cmp	byte ptr [si+1Dh], 0
		jz	short loc_B756
		cmp	word ptr [si+1Bh], 0Dh
		jnb	short loc_B754
		inc	word ptr [si+1Bh]

loc_B754:				; CODE XREF: seg014:23BFj
		jmp	short loc_B75F
; ���������������������������������������������������������������������������

loc_B756:				; CODE XREF: seg014:23B9j
		cmp	word ptr [si+1Bh], 0
		jbe	short loc_B75F
		dec	word ptr [si+1Bh]

loc_B75F:				; CODE XREF: seg014:loc_B754j
					; seg014:23CAj
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		or	si, si
		jnz	short loc_B77D
		push	23h ; '#'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_B7E6

loc_B77D:				; CODE XREF: seg014:23DBj
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
		mov	word ptr [si], 1977h
		mov	word ptr [si+0Ah], 1997h
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+1Fh], 0
		mov	word ptr [si], 15E7h
		mov	word ptr [si+0Ah], 1607h

loc_B7E6:				; CODE XREF: seg014:23EBj
		mov	ax, si
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+6]
		or	si, si
		jnz	short loc_B80C
		push	23h ; '#'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_B83A

loc_B80C:				; CODE XREF: seg014:246Aj
		mov	ax, [bp+8]
		mov	[bp-2],	ax
		push	word ptr [bp-2]
		push	si
		call	Layer_ConstructAtOrigin_2DE95
		add	sp, 4
		mov	word ptr [si], 1977h
		mov	word ptr [si+0Ah], 1997h
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+1Fh], 0
		mov	word ptr [si], 15E7h
		mov	word ptr [si+0Ah], 1607h

loc_B83A:				; CODE XREF: seg014:247Aj
		mov	ax, si
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
		sub	sp, 6
		push	si
		mov	si, [bp+6]
		or	si, si
		jnz	short loc_B860
		push	23h ; '#'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_B8A0

loc_B860:				; CODE XREF: seg014:24BEj
		mov	ax, [bp+8]
		mov	[bp-2],	ax
		mov	ax, [bp+0Ah]
		mov	[bp-4],	ax
		mov	ax, [bp+0Ch]
		mov	[bp-6],	ax
		push	word ptr [bp-6]
		push	word ptr [bp-4]
		push	word ptr [bp-2]
		push	si
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [si], 1977h
		mov	word ptr [si+0Ah], 1997h
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+1Fh], 0
		mov	word ptr [si], 15E7h
		mov	word ptr [si+0Ah], 1607h

loc_B8A0:				; CODE XREF: seg014:24CEj
		mov	ax, si
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
		sub	sp, 8
		push	si
		mov	si, [bp+6]
		or	si, si
		jnz	short loc_B8C6
		push	23h ; '#'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_B90F

loc_B8C6:				; CODE XREF: seg014:2524j
		mov	ax, [bp+8]
		mov	[bp-2],	ax
		mov	ax, [bp+0Ah]
		mov	[bp-4],	ax
		mov	ax, [bp+0Ch]
		mov	[bp-6],	ax
		mov	ax, [bp+0Eh]
		mov	[bp-8],	ax
		push	word ptr [bp-8]
		push	word ptr [bp-6]
		push	word ptr [bp-4]
		push	word ptr [bp-2]
		push	si
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	word ptr [si], 1977h
		mov	word ptr [si+0Ah], 1997h
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+1Fh], 0
		mov	word ptr [si], 15E7h
		mov	word ptr [si+0Ah], 1607h

loc_B90F:				; CODE XREF: seg014:2534j
		mov	ax, si
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
		sub	sp, 0Ah
		push	si
		mov	si, [bp+6]
		or	si, si
		jnz	short loc_B935
		push	23h ; '#'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_B98D

loc_B935:				; CODE XREF: seg014:2593j
		mov	ax, [bp+8]
		mov	[bp-2],	ax
		mov	ax, [bp+0Ah]
		mov	[bp-4],	ax
		mov	ax, [bp+0Ch]
		mov	[bp-6],	ax
		mov	ax, [bp+0Eh]
		mov	[bp-8],	ax
		mov	ax, [bp+10h]
		mov	[bp-0Ah], ax
		push	word ptr [bp-6]
		push	word ptr [bp-4]
		push	word ptr [bp-2]
		push	si
		call	Layer_Construct_2DF9B
		add	sp, 8
		mov	word ptr [si], 1977h
		mov	word ptr [si+0Ah], 1997h
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+1Fh], 0
		mov	ax, [bp-8]
		mov	[si+1Dh], ax
		mov	ax, [bp-0Ah]
		mov	[si+1Fh], ax
		mov	word ptr [si], 15E7h
		mov	word ptr [si+0Ah], 1607h

loc_B98D:				; CODE XREF: seg014:25A3j
		mov	ax, si
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-21. Calque mobile « masque » (taille 23h, tables 15E7h / 1607h) : mêmes
; arguments que MovingOverlayLayer_Construct_A837 (ressource, x, y, vx, vy, image) ; +21h =
; pointeur de la table de 256 couleurs (MovingMaskLayer_SetTable_BA1C). Dessin
; MovingMaskLayer_Draw_BA2C. mid3 : mid3 12, table copiée de mid3 23.
; ==============================================================================================
MovingMaskLayer_Construct_B995	proc far		; CODE XREF: sub_71680+2E58P

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_B9B3
		push	23h ; '#'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_BA14

loc_B9B3:				; CODE XREF: MovingMaskLayer_Construct_B995+Cj
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_6], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_8], ax
		mov	ax, [bp+arg_A]
		mov	[bp+var_A], ax
		mov	ax, [bp+arg_C]
		mov	[bp+var_C], ax
		push	[bp+var_C]
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		push	si
		call	ImageLayer_Construct_2E02C
		add	sp, 0Ah
		mov	word ptr [si], 1977h
		mov	word ptr [si+0Ah], 1997h
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+1Fh], 0
		mov	ax, [bp+var_8]
		mov	[si+1Dh], ax
		mov	ax, [bp+var_A]
		mov	[si+1Fh], ax
		mov	word ptr [si], 15E7h
		mov	word ptr [si+0Ah], 1607h

loc_BA14:				; CODE XREF: MovingMaskLayer_Construct_B995+1Cj
		mov	ax, si
		pop	si
		leave
		retf
MovingMaskLayer_Construct_B995	endp

; ���������������������������������������������������������������������������
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-21. +21h = arg_2 (table de 256 couleurs du calque masque).
; ==============================================================================================
MovingMaskLayer_SetTable_BA1C	proc far		; CODE XREF: sub_71680+2E8BP

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+21h], ax
		pop	si
		pop	bp
		retf
MovingMaskLayer_SetTable_BA1C	endp

; ���������������������������������������������������������������������������

; ==============================================================================================
; far, LUE 2026-10-21. Méthode +10h de MovingMaskLayer : Render_DrawShapeAsRemapMask_33B9C
; avec la table +21h, pour l'image 0 puis pour l'image courante, à la position du calque.
; ==============================================================================================
MovingMaskLayer_Draw_BA2C:				; CODE XREF: seg014:275Dj
					; DATA XREF: dseg:15F7o
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+6]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		add	sp, 2
		mov	di, ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		add	sp, 2
		mov	[bp-2],	ax
		push	word ptr [si+21h]
		push	0
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [bp-2]
		push	di
		push	word_46F44
		call	Render_DrawShapeAsRemapMask_33B9C
		add	sp, 0Eh
		push	word ptr [si+21h]
		push	word ptr [si+1Bh]
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [bp-2]
		push	di
		push	word_46F44
		call	Render_DrawShapeAsRemapMask_33B9C
		add	sp, 0Eh
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_BAAF:				; DATA XREF: dseg:15E7o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_BADC
		push	0
		push	si
		call	sub_2E2FC
		add	sp, 4
		test	di, 1
		jz	short loc_BADA
		push	si
		call	sub_308
		add	sp, 2
		jmp	short $+2

loc_BADA:				; CODE XREF: seg014:273Dj
		jmp	short $+2

loc_BADC:				; CODE XREF: seg014:272Cj
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_BAE4:				; DATA XREF: dseg:1613o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	MovingMaskLayer_Draw_BA2C
; ���������������������������������������������������������������������������

loc_BAF0:				; DATA XREF: dseg:160Fo
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_2E29E
; ���������������������������������������������������������������������������

loc_BAFC:				; DATA XREF: dseg:1607o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_DrawAtOwnPos_2E202
; ���������������������������������������������������������������������������

loc_BB08:				; DATA XREF: dseg:1617o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_BB3A
		mov	word ptr [si], 1617h
		mov	word ptr [si+0Ah], 1637h
		push	0
		push	si
		call	sub_2E0C3
		add	sp, 4
		test	di, 1
		jz	short loc_BB3A
		push	si
		call	sub_308
		add	sp, 2

loc_BB3A:				; CODE XREF: seg014:2785j seg014:279Fj
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_BB3E:				; DATA XREF: dseg:1643o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	ToggleLayer_Draw_B711
; ���������������������������������������������������������������������������

loc_BB4A:				; DATA XREF: dseg:163Fo
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_2E29E
; ���������������������������������������������������������������������������

loc_BB56:				; DATA XREF: dseg:1637o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	ToggleLayer_DrawAtOwnPos_B6DE
; ���������������������������������������������������������������������������

loc_BB62:				; DATA XREF: dseg:1647o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_BB8F
		push	0
		push	si
		call	sub_2E2FC
		add	sp, 4
		test	di, 1
		jz	short loc_BB8D
		push	si
		call	sub_308
		add	sp, 2
		jmp	short $+2

loc_BB8D:				; CODE XREF: seg014:27F0j
		jmp	short $+2

loc_BB8F:				; CODE XREF: seg014:27DFj
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_BB97:				; DATA XREF: dseg:1673o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	ClippedLayer_Draw_B563
; ���������������������������������������������������������������������������

loc_BBA3:				; DATA XREF: dseg:166Fo
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_2E29E
; ���������������������������������������������������������������������������

loc_BBAF:				; DATA XREF: dseg:1667o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_DrawAtOwnPos_2E202
; ���������������������������������������������������������������������������

loc_BBBB:				; DATA XREF: dseg:1677o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_BBE8
		push	0
		push	si
		nop
		push	cs
		call	near ptr sub_A100
		add	sp, 4
		test	di, 1
		jz	short loc_BBE6
		push	si
		call	sub_308
		add	sp, 2
		jmp	short $+2

loc_BBE6:				; CODE XREF: seg014:2849j
		jmp	short $+2

loc_BBE8:				; CODE XREF: seg014:2838j
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_BBF0:				; DATA XREF: dseg:16A7o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	TalkingHead_Draw_9F2C
; ���������������������������������������������������������������������������

loc_BBFC:				; DATA XREF: dseg:16A3o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_2E29E
; ���������������������������������������������������������������������������

loc_BC08:				; DATA XREF: dseg:169Bo
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	TalkingHead_DrawAtOwnPos_9EF8
; ���������������������������������������������������������������������������

loc_BC14:				; DATA XREF: dseg:16ABo
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_BC46
		mov	word ptr [si], 16ABh
		mov	word ptr [si+0Ah], 16CBh
		push	0
		push	si
		call	sub_2E0C3
		add	sp, 4
		test	di, 1
		jz	short loc_BC46
		push	si
		call	sub_308
		add	sp, 2

loc_BC46:				; CODE XREF: seg014:2891j seg014:28ABj
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_BC4A:				; DATA XREF: dseg:16D7o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	far ptr	Layer_Draw_2E22F
; ���������������������������������������������������������������������������

loc_BC56:				; DATA XREF: dseg:16D3o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_2E29E
; ���������������������������������������������������������������������������

loc_BC62:				; DATA XREF: dseg:16CBo
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_DrawAtOwnPos_2E202
; ���������������������������������������������������������������������������

loc_BC6E:				; DATA XREF: dseg:16DBo
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_BC9B
		push	0
		push	si
		call	sub_2E0C3
		add	sp, 4
		test	di, 1
		jz	short loc_BC99
		push	si
		call	sub_308
		add	sp, 2
		jmp	short $+2

loc_BC99:				; CODE XREF: seg014:28FCj
		jmp	short $+2

loc_BC9B:				; CODE XREF: seg014:28EBj
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_BCA3:				; DATA XREF: dseg:1707o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	far ptr	Layer_Draw_2E22F
; ���������������������������������������������������������������������������

loc_BCAF:				; DATA XREF: dseg:1703o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_2E29E
; ���������������������������������������������������������������������������

loc_BCBB:				; DATA XREF: dseg:16FBo
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_DrawAtOwnPos_2E202
; ���������������������������������������������������������������������������

loc_BCC7:				; DATA XREF: dseg:170Bo
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_BCF4
		push	0
		push	si
		nop
		push	cs
		call	near ptr sub_AD6F
		add	sp, 4
		test	di, 1
		jz	short loc_BCF2
		push	si
		call	sub_308
		add	sp, 2
		jmp	short $+2

loc_BCF2:				; CODE XREF: seg014:2955j
		jmp	short $+2

loc_BCF4:				; CODE XREF: seg014:2944j
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_BCFC:				; CODE XREF: seg014:2989j seg014:29ADj
					; DATA XREF: ...
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_BD04:				; DATA XREF: dseg:1737o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	loc_AF73
; ���������������������������������������������������������������������������

loc_BD10:				; DATA XREF: dseg:1733o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	loc_BCFC
; ���������������������������������������������������������������������������

loc_BD1C:				; DATA XREF: dseg:172Bo
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	loc_AF31
; ���������������������������������������������������������������������������

loc_BD28:				; DATA XREF: dseg:1767o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	loc_AEB4
; ���������������������������������������������������������������������������

loc_BD34:				; DATA XREF: dseg:1763o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	loc_BCFC
; ���������������������������������������������������������������������������

loc_BD40:				; DATA XREF: dseg:175Bo
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	loc_AE81
; ���������������������������������������������������������������������������

loc_BD4C:				; DATA XREF: dseg:176Bo
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_BD7E
		mov	word ptr [si], 176Bh
		mov	word ptr [si+0Ah], 178Bh
		push	0
		push	si
		call	sub_2E0C3
		add	sp, 4
		test	di, 1
		jz	short loc_BD7E
		push	si
		call	sub_308
		add	sp, 2

loc_BD7E:				; CODE XREF: seg014:29C9j seg014:29E3j
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_BD82:				; DATA XREF: dseg:1797o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	ConvFigure_DrawExtra_ABEB
; ���������������������������������������������������������������������������

loc_BD8E:				; DATA XREF: dseg:1793o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_2E29E
; ���������������������������������������������������������������������������

loc_BD9A:				; DATA XREF: dseg:178Bo
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_DrawAtOwnPos_2E202
; ���������������������������������������������������������������������������

loc_BDA6:				; DATA XREF: dseg:179Bo
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_BDD3
		push	0
		push	si
		call	sub_2E0C3
		add	sp, 4
		test	di, 1
		jz	short loc_BDD1
		push	si
		call	sub_308
		add	sp, 2
		jmp	short $+2

loc_BDD1:				; CODE XREF: seg014:2A34j
		jmp	short $+2

loc_BDD3:				; CODE XREF: seg014:2A23j
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_BDDB:				; DATA XREF: dseg:17C7o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	OverlayLayer_Draw_AA17
; ���������������������������������������������������������������������������

loc_BDE7:				; DATA XREF: dseg:17C3o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_2E29E
; ���������������������������������������������������������������������������

loc_BDF3:				; DATA XREF: dseg:17BBo
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_DrawAtOwnPos_2E202
; ���������������������������������������������������������������������������

loc_BDFF:				; DATA XREF: dseg:17CBo
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_BE2C
		push	0
		push	si
		call	sub_2E2FC
		add	sp, 4
		test	di, 1
		jz	short loc_BE2A
		push	si
		call	sub_308
		add	sp, 2
		jmp	short $+2

loc_BE2A:				; CODE XREF: seg014:2A8Dj
		jmp	short $+2

loc_BE2C:				; CODE XREF: seg014:2A7Cj
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_BE34:				; DATA XREF: dseg:17F7o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	MovingOverlayLayer_Draw_A8BE
; ���������������������������������������������������������������������������

loc_BE40:				; DATA XREF: dseg:17F3o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_2E29E
; ���������������������������������������������������������������������������

loc_BE4C:				; DATA XREF: dseg:17EBo
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_DrawAtOwnPos_2E202
; ���������������������������������������������������������������������������

loc_BE58:				; DATA XREF: dseg:17FBo
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_BE8A
		mov	word ptr [si], 17FBh
		mov	word ptr [si+0Ah], 181Bh
		push	0
		push	si
		call	sub_2E0C3
		add	sp, 4
		test	di, 1
		jz	short loc_BE8A
		push	si
		call	sub_308
		add	sp, 2

loc_BE8A:				; CODE XREF: seg014:2AD5j seg014:2AEFj
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_BE8E:				; DATA XREF: dseg:1827o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	OverlayAnimLayer_Draw_A548
; ���������������������������������������������������������������������������

loc_BE9A:				; DATA XREF: dseg:1823o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_2E29E
; ���������������������������������������������������������������������������

loc_BEA6:				; DATA XREF: dseg:181Bo
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_DrawAtOwnPos_2E202
; ���������������������������������������������������������������������������

loc_BEB2:				; DATA XREF: dseg:182Bo
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_BEDF
		push	0
		push	si
		nop
		push	cs
		call	near ptr sub_A100
		add	sp, 4
		test	di, 1
		jz	short loc_BEDD
		push	si
		call	sub_308
		add	sp, 2
		jmp	short $+2

loc_BEDD:				; CODE XREF: seg014:2B40j
		jmp	short $+2

loc_BEDF:				; CODE XREF: seg014:2B2Fj
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_BEE7:				; DATA XREF: dseg:185Bo
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	loc_A3B4
; ���������������������������������������������������������������������������

loc_BEF3:				; DATA XREF: dseg:1857o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_2E29E
; ���������������������������������������������������������������������������

loc_BEFF:				; DATA XREF: dseg:184Fo
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	loc_A381
; ���������������������������������������������������������������������������

loc_BF0B:				; DATA XREF: dseg:18B3o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	TalkingHead_Draw_9F2C
; ���������������������������������������������������������������������������

loc_BF17:				; DATA XREF: dseg:18AFo
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_2E29E
; ���������������������������������������������������������������������������

loc_BF23:				; DATA XREF: dseg:18A7o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	TalkingHead_DrawAtOwnPos_9EF8
; ���������������������������������������������������������������������������

loc_BF2F:				; DATA XREF: dseg:18B7o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_BF5A
		mov	word ptr [si], 18B7h
		push	si
		call	sub_2FC0C
		add	sp, 2
		test	di, 1
		jz	short loc_BF5A
		push	si
		call	sub_308
		add	sp, 2

loc_BF5A:				; CODE XREF: seg014:2BACj seg014:2BBFj
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_BF5E:				; DATA XREF: dseg:190Bo
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	far ptr	Layer_Draw_2E22F
; ���������������������������������������������������������������������������

loc_BF6A:				; DATA XREF: dseg:1907o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_2E29E
; ���������������������������������������������������������������������������

loc_BF76:				; DATA XREF: dseg:18FFo
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_DrawAtOwnPos_2E202
; ���������������������������������������������������������������������������

loc_BF82:				; DATA XREF: dseg:190Fo
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_BFAF
		push	0
		push	si
		call	sub_2E2FC
		add	sp, 4
		test	di, 1
		jz	short loc_BFAD
		push	si
		call	sub_308
		add	sp, 2
		jmp	short $+2

loc_BFAD:				; CODE XREF: seg014:2C10j
		jmp	short $+2

loc_BFAF:				; CODE XREF: seg014:2BFFj
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_BFB7:				; DATA XREF: dseg:192Fo
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+0Ch]
		cmp	di, 0FFFFh
		jz	short loc_BFF9
		push	word ptr [si+23h]
		push	word ptr [si+21h]
		push	di
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [bp+0Ah]
		push	word ptr [bp+8]
		push	word_46F44
		call	Render_DrawRotatedScaledSprite_33586
		add	sp, 10h

loc_BFF9:				; CODE XREF: seg014:2C35j
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_BFFD:				; DATA XREF: dseg:193Fo
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	loc_978B
; ���������������������������������������������������������������������������

loc_C009:				; DATA XREF: dseg:193Bo
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_2E29E
; ���������������������������������������������������������������������������

loc_C015:				; DATA XREF: dseg:1933o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	loc_9758
; ���������������������������������������������������������������������������

loc_C021:				; DATA XREF: dseg:1943o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_C04E
		push	0
		push	si
		call	sub_2E2FC
		add	sp, 4
		test	di, 1
		jz	short loc_C04C
		push	si
		call	sub_308
		add	sp, 2
		jmp	short $+2

loc_C04C:				; CODE XREF: seg014:2CAFj
		jmp	short $+2

loc_C04E:				; CODE XREF: seg014:2C9Ej
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, LUE 2026-10-21. Méthode +20h de ScaledMovingLayer : si l'image ≠ −1,
; Render_DrawRotatedScaledSprite_33586(surface, x, y, forme, image, échelle +21h, échelle
; +23h).
; ==============================================================================================
ScaledMovingLayer_DrawImage_C056:				; DATA XREF: dseg:1963o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+0Ch]
		cmp	di, 0FFFFh
		jz	short loc_C098
		push	word ptr [si+23h]
		push	word ptr [si+21h]
		push	di
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [bp+0Ah]
		push	word ptr [bp+8]
		push	word_46F44
		call	Render_DrawRotatedScaledSprite_33586
		add	sp, 10h

loc_C098:				; CODE XREF: seg014:2CD4j
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_C09C:				; DATA XREF: dseg:1973o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	loc_9661
; ���������������������������������������������������������������������������

loc_C0A8:				; DATA XREF: dseg:196Fo
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_2E29E
; ���������������������������������������������������������������������������

loc_C0B4:				; DATA XREF: dseg:1967o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	loc_962E
; ���������������������������������������������������������������������������

loc_C0C0:				; DATA XREF: dseg:19A3o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	far ptr	Layer_Draw_2E22F
; ���������������������������������������������������������������������������

loc_C0CC:				; DATA XREF: dseg:199Fo
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_2E29E
; ���������������������������������������������������������������������������

loc_C0D8:				; DATA XREF: dseg:1997o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_DrawAtOwnPos_2E202
; ���������������������������������������������������������������������������

loc_C0E4:				; DATA XREF: dseg:19A7o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_C111
		push	0
		push	si
		call	sub_2E0C3
		add	sp, 4
		test	di, 1
		jz	short loc_C10F
		push	si
		call	sub_308
		add	sp, 2
		jmp	short $+2

loc_C10F:				; CODE XREF: seg014:2D72j
		jmp	short $+2

loc_C111:				; CODE XREF: seg014:2D61j
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_C119:				; DATA XREF: dseg:19D7o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	loc_94B7
; ���������������������������������������������������������������������������

loc_C125:				; DATA XREF: dseg:19D3o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_2E29E
; ���������������������������������������������������������������������������

loc_C131:				; DATA XREF: dseg:19CBo
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	loc_9484
seg014		ends

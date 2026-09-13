seg032		segment	byte public 'CODE' use16
		assume cs:seg032
		;org 0Bh
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,62L — alloue (sub_658=malloc court) un petit objet 'événement' (type 0xEC0) contenant 3
; valeurs (position/couleur?), l'insère dans une liste (sub_5F57F) : constructeur d'un élément
; graphique attaché à une liste (marqueur/icône UI).
; ==============================================================================================
UIList_CreateMarker	proc far		; CODE XREF: seg032:0544p

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 8

loc_1F4C1:
		push	si
		push	di

loc_1F4C3:
		mov	si, [bp+arg_0]

loc_1F4C6:
		mov	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_6], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_8], ax
		push	0Ah
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_1F509
		mov	word ptr [di], 8DAh
		mov	word ptr [di+2], 0
		mov	word ptr [di], 0EC0h
		mov	ax, [bp+var_4]
		mov	[di+4],	ax
		mov	ax, [bp+var_6]
		mov	[di+6],	ax
		mov	ax, [bp+var_8]
		mov	[di+8],	ax
		mov	ax, di
		jmp	short loc_1F50B
; ���������������������������������������������������������������������������

loc_1F509:				; CODE XREF: UIList_CreateMarker+29j
		mov	ax, di

loc_1F50B:				; CODE XREF: UIList_CreateMarker+4Cj
		mov	[bp+var_2], ax
		push	ax
		push	si
		call	LinkedListB_InsertAtTail_5F57F
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
UIList_CreateMarker	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,40L — itère une liste (sub_5F6A9) et blitte chaque élément (sub_61F52) à une position
; décalée (+arg_6) : rendu de tous les éléments d'une liste graphique (icônes/marqueurs UI).
; ==============================================================================================
UIList_DrawAllMarkers	proc far		; CODE XREF: seg032:071Dp

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_1F54D
; ���������������������������������������������������������������������������

loc_1F52D:				; CODE XREF: UIList_DrawAllMarkers+40j
		mov	bx, [bp+var_2]
		mov	ax, [bx+8]
		add	ax, [bp+arg_6]
		push	ax
		push	large [bp+arg_2]
		push	word ptr [bx+6]
		push	word ptr [bx+4]
		push	word_70E60
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch

loc_1F54D:				; CODE XREF: UIList_DrawAllMarkers+Fj
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedListB_Helper_5F6A9
		add	sp, 4
		or	ax, ax
		jnz	short loc_1F52D
		pop	si
		leave
		retf
UIList_DrawAllMarkers	endp

; ���������������������������������������������������������������������������

loc_1F561:				; DATA XREF: seg339:092Eo
		push	bp
		mov	bp, sp
		sub	sp, 10Ah
		push	si
		push	di
		mov	di, [bp+6]
		dec	word ptr [di+32h]
		jz	short loc_1F575
		jmp	loc_1FA10
; ���������������������������������������������������������������������������

loc_1F575:				; CODE XREF: seg032:00C0j
		mov	ax, [di+34h]
		mov	[di+32h], ax
		mov	bx, [di+2]
		cmp	byte ptr [bx+21Dh], 0
		jz	short loc_1F597
		mov	ax, [di+38h]
		mov	[bp-2],	ax
		mov	ax, [di+3Ah]
		mov	[bp-4],	ax
		mov	eax, [di+2Ah]
		jmp	short loc_1F5A7
; ���������������������������������������������������������������������������

loc_1F597:				; CODE XREF: seg032:00D3j
		mov	ax, [di+50h]
		mov	[bp-2],	ax
		mov	ax, [di+52h]
		mov	[bp-4],	ax

loc_1F5A3:
		mov	eax, [di+6Ch]

loc_1F5A7:				; CODE XREF: seg032:00E5j
		mov	[bp-8],	eax
		mov	ax, di

loc_1F5AD:
		add	ax, 5Eh	; '^'
		push	ax

loc_1F5B1:
		call	LinkedListB_Helper_5F66B
		pop	cx
		mov	bx, [di+2]
		push	word ptr [bx+1Eh]
		mov	bx, [bx+1Eh]
		mov	bx, [bx+50h]
		call	dword ptr [bx+1Ch]
		pop	cx
		mov	[bp-0Ah], ax
		mov	word ptr [bp-0Ch], 0

loc_1F5CF:
		jmp	loc_1F9FA
; ���������������������������������������������������������������������������

loc_1F5D2:				; CODE XREF: seg032:loc_1FA0Dj
		mov	ax, [bp-0Ch]
		mov	[bp-10h], ax

loc_1F5D8:
		push	ax
		mov	bx, [bp-10h]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	[bp-12h], dx
		mov	[bp-14h], ax
		cmp	dword ptr [bp-14h], 0
		jnz	short loc_1F5F1
		jmp	loc_1F9FA
; ���������������������������������������������������������������������������

loc_1F5F1:				; CODE XREF: seg032:013Cj
		mov	ax, [bp-10h]
		cmp	ax, [bp-0Ah]
		jnz	short loc_1F5FC
		jmp	loc_1F9FA
; ���������������������������������������������������������������������������

loc_1F5FC:				; CODE XREF: seg032:0147j
		push	word ptr [bp-10h]
		call	Debris_GetStateFlag
		pop	cx
		or	al, al
		jnz	short loc_1F60C
		jmp	loc_1F9FA
; ���������������������������������������������������������������������������

loc_1F60C:				; CODE XREF: seg032:0157j
		mov	si, [bp-10h]
		add	si, 12h
		mov	ax, [bp-0Ah]
		add	ax, 12h
		mov	[bp-16h], ax
		mov	eax, [si]
		mov	bx, [bp-16h]
		sub	eax, [bx]
		mov	[bp-92h], eax
		mov	eax, [si+4]
		sub	eax, [bx+4]

loc_1F631:
		mov	[bp-8Eh], eax

loc_1F636:
		mov	eax, [si+8]

loc_1F63A:
		sub	eax, [bx+8]

loc_1F63E:
		mov	[bp-8Ah], eax

loc_1F643:
		mov	eax, [bp-92h]
		mov	[bp-86h], eax
		mov	eax, [bp-8Eh]
		mov	[bp-82h], eax
		mov	eax, [bp-8Ah]
		mov	[bp-7Eh], eax
		push	eax
		push	large dword ptr	[bp-82h]
		push	large dword ptr	[bp-86h]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-1Ah], eax
		mov	[bp-1Eh], eax
		mov	eax, [di+2Eh]
		mov	[bp-22h], eax
		shl	eax, 8
		cmp	eax, [bp-1Eh]
		jle	short loc_1F697
		mov	ax, 1
		jmp	short loc_1F699
; ���������������������������������������������������������������������������

loc_1F697:				; CODE XREF: seg032:01E0j
		xor	ax, ax

loc_1F699:				; CODE XREF: seg032:01E5j
		or	al, al
		jnz	short loc_1F6A0
		jmp	loc_1F9FA
; ���������������������������������������������������������������������������

loc_1F6A0:				; CODE XREF: seg032:01EBj
		mov	eax, [bp-86h]
		neg	eax
		mov	[bp-0AAh], eax
		mov	eax, [bp-82h]
		neg	eax
		mov	[bp-0A6h], eax
		mov	eax, [bp-7Eh]
		neg	eax
		mov	[bp-0A2h], eax

loc_1F6C6:
		mov	eax, [bp-0AAh]

loc_1F6CB:
		mov	[bp-9Eh], eax

loc_1F6D0:
		mov	eax, [bp-0A6h]
		mov	[bp-9Ah], eax
		mov	eax, [bp-0A2h]
		mov	[bp-96h], eax
		lea	ax, [bp-9Eh]
		push	ax
		call	UI_ApplyVectorLength_55B04
		pop	cx
		push	large dword ptr	[bp-14h]
		les	bx, [bp-14h]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp-24h], al
		cmp	byte ptr [bp-24h], 13h
		jz	short loc_1F70E
		cmp	byte ptr [bp-24h], 15h
		jnz	short loc_1F713

loc_1F70E:				; CODE XREF: seg032:0256j
		mov	ax, 1
		jmp	short loc_1F715
; ���������������������������������������������������������������������������

loc_1F713:				; CODE XREF: seg032:025Cj
		xor	ax, ax

loc_1F715:				; CODE XREF: seg032:0261j
		mov	[bp-25h], al
		cmp	byte ptr [bp-25h], 0
		jnz	short loc_1F75F
		push	word ptr [bp-10h]
		mov	bx, [bp-10h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		push	ax
		lea	ax, [bp-9Eh]
		push	ax
		push	ss
		lea	ax, [bp-2Ah]

loc_1F737:
		push	ax
		call	Targeting_ComputeBearingElevation_55B1A

loc_1F73D:
		add	sp, 8
		cmp	dword ptr [bp-2Ah], 3C00h
		jge	short loc_1F74F
		mov	ax, 1
		jmp	short loc_1F751
; ���������������������������������������������������������������������������

loc_1F74F:				; CODE XREF: seg032:0298j
		xor	ax, ax

loc_1F751:				; CODE XREF: seg032:029Dj
		or	al, al
		jnz	short loc_1F75F
		cmp	byte_7235E, 0
		jnz	short loc_1F75F
		jmp	loc_1F9FA
; ���������������������������������������������������������������������������

loc_1F75F:				; CODE XREF: seg032:026Cj seg032:02A3j ...
		push	word ptr [bp-0Ah]
		mov	bx, [bp-0Ah]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	[bp-2Ch], ax
		push	ax
		lea	ax, [bp-0CEh]
		push	ax
		call	AI_ComputeGeometryHelper_56E29
		add	sp, 4
		mov	dword ptr [bp-30h], 0
		mov	eax, [bp-0C2h]
		mov	[bp-0DAh], eax
		mov	eax, [bp-0BEh]
		mov	[bp-0D6h], eax
		mov	eax, [bp-30h]
		mov	[bp-0D2h], eax
		mov	eax, [bp-0DAh]
		neg	eax
		mov	[bp-34h], eax
		mov	[bp-38h], eax

loc_1F7B1:
		mov	dword ptr [bp-3Ch], 0
		mov	eax, [bp-0D6h]

loc_1F7BE:
		mov	[bp-0E6h], eax

loc_1F7C3:
		mov	eax, [bp-38h]
		mov	[bp-0E2h], eax

loc_1F7CC:
		mov	eax, [bp-3Ch]

loc_1F7D0:
		mov	[bp-0DEh], eax
		lea	ax, [bp-0DAh]
		push	ax
		lea	ax, [bp-0E6h]
		push	ax
		lea	ax, [bp-10Ah]
		push	ax
		call	Map_ApplyRotationTransform_56DC5
		add	sp, 6
		lea	ax, [bp-10Ah]
		push	ax
		lea	ax, [bp-86h]
		push	ax
		call	Math_ApplyRotationHelperA_58768
		add	sp, 4
		mov	ax, [bp-2]
		sub	ax, [bp-4]
		movsx	ebx, ax
		mov	eax, [di+2Eh]
		cdq
		idiv	ebx
		mov	[bp-44h], eax
		shl	eax, 8
		mov	[bp-40h], eax
		mov	ax, [bp-8]
		mov	[bp-48h], ax
		mov	eax, [bp-86h]
		mov	edx, eax
		mov	ecx, [bp-40h]
		sar	edx, 18h

loc_1F833:
		shl	eax, 8
		idiv	ecx

loc_1F83A:
		mov	[bp-4Ch], eax
		mov	eax, [bp-4Ch]
		mov	[bp-50h], eax
		movsx	eax, word ptr [bp-48h]
		shl	eax, 8
		mov	edx, [bp-50h]
		add	edx, eax
		mov	[bp-54h], edx
		mov	eax, [bp-54h]
		mov	[bp-58h], eax
		mov	ax, [bp-57h]
		mov	[bp-46h], ax
		mov	ax, [bp-6]
		mov	[bp-5Ch], ax
		mov	eax, [bp-82h]
		mov	edx, eax
		mov	ecx, [bp-40h]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp-60h], eax
		mov	eax, [bp-60h]
		mov	[bp-64h], eax
		movsx	eax, word ptr [bp-5Ch]
		shl	eax, 8
		sub	eax, [bp-64h]
		mov	[bp-68h], eax

loc_1F8A2:
		mov	[bp-6Ch], eax
		mov	ax, [bp-6Bh]
		mov	[bp-5Ah], ax
		mov	ax, [bp-46h]
		cmp	ax, [bp-8]
		jl	short loc_1F8BC
		mov	ax, [bp-4]
		add	[bp-46h], ax
		jmp	short loc_1F8C2
; ���������������������������������������������������������������������������

loc_1F8BC:				; CODE XREF: seg032:0402j
		mov	ax, [bp-4]
		sub	[bp-46h], ax

loc_1F8C2:				; CODE XREF: seg032:040Aj
		mov	ax, [bp-5Ah]
		cmp	ax, [bp-6]
		jg	short loc_1F8D2
		mov	ax, [bp-4]
		sub	[bp-5Ah], ax
		jmp	short loc_1F8D8
; ���������������������������������������������������������������������������

loc_1F8D2:				; CODE XREF: seg032:0418j
		mov	ax, [bp-4]
		add	[bp-5Ah], ax

loc_1F8D8:				; CODE XREF: seg032:0420j
		mov	si, 0FFFFh
		mov	word ptr [bp-6Eh], 0
		mov	al, [bp-24h]
		mov	ah, 0
		mov	[bp-0Eh], ax
		mov	cx, 5		; switch 5 cases
		mov	bx, offset word_1FA14

loc_1F8EE:				; CODE XREF: seg032:0449j
		mov	ax, cs:[bx]
		cmp	ax, [bp-0Eh]
		jz	short loc_1F8FE
		add	bx, 2
		loop	loc_1F8EE
		jmp	loc_1F9D8	; default
; ���������������������������������������������������������������������������

loc_1F8FE:				; CODE XREF: seg032:0444j
		jmp	word ptr cs:[bx+0Ah] ; switch jump

loc_1F902:				; DATA XREF: seg032:056Eo
		xor	si, si		; case 0x8

loc_1F904:				; CODE XREF: seg032:0501j seg032:0507j ...
		mov	bx, [bp-10h]
		mov	ax, [bx+55h]

loc_1F90A:				; CODE XREF: seg032:04D2j
		mov	[bp-6Eh], ax
		jmp	loc_1F9D8	; default
; ���������������������������������������������������������������������������

loc_1F910:				; CODE XREF: seg032:loc_1F8FEj
					; DATA XREF: seg032:056Eo
		mov	bx, [bp-10h]	; case 0x6
		push	word ptr [bx+51h]
		mov	bx, [bx+51h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	bx, ax
		mov	al, [bx+75h]
		shr	ax, 5
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jz	short loc_1F933
		jmp	loc_1F9D8	; default
; ���������������������������������������������������������������������������

loc_1F933:				; CODE XREF: seg032:047Ej
		mov	eax, [bp-14h]

loc_1F937:
		mov	[bp-72h], eax
		les	bx, [bp-72h]
		mov	al, es:[bx+52h]
		mov	[bp-74h], al
		cmp	byte ptr [bp-74h], 8
		jnb	short loc_1F950
		mov	si, 0Ah
		jmp	short loc_1F969
; ���������������������������������������������������������������������������

loc_1F950:				; CODE XREF: seg032:0499j
		cmp	byte ptr [bp-74h], 0Ah
		jnb	short loc_1F95B
		mov	si, 0Ch
		jmp	short loc_1F969
; ���������������������������������������������������������������������������

loc_1F95B:				; CODE XREF: seg032:04A4j
		cmp	byte ptr [bp-74h], 0Bh
		jnb	short loc_1F966
		mov	si, 0Eh
		jmp	short loc_1F969
; ���������������������������������������������������������������������������

loc_1F966:				; CODE XREF: seg032:04AFj
		mov	si, 10h

loc_1F969:				; CODE XREF: seg032:049Ej seg032:04A9j ...
		mov	ax, [bp-10h]
		mov	[bp-76h], ax
		mov	bx, [bp-76h]
		mov	eax, [bx+55h]
		mov	[bp-7Ah], eax
		les	bx, [bp-7Ah]
		mov	ax, es:[bx+287h]
		jmp	short loc_1F90A
; ���������������������������������������������������������������������������

loc_1F984:				; CODE XREF: seg032:loc_1F8FEj
					; DATA XREF: seg032:056Eo
		mov	eax, [bp-14h]	; case 0x13
		mov	[bp-72h], eax
		les	bx, [bp-72h]
		les	bx, es:[bx+49h]
		mov	eax, es:[bx]
		mov	[bp-76h], eax
		les	bx, [bp-76h]
		mov	ax, es:[bx+4Bh]

loc_1F9A2:
		cmp	ax, 200h
		jz	short loc_1F9B4
		cmp	ax, 400h
		jz	short loc_1F9BA
		cmp	ax, 800h
		jz	short loc_1F9C0
		jmp	loc_1F904
; ���������������������������������������������������������������������������

loc_1F9B4:				; CODE XREF: seg032:04F5j
		mov	si, 4
		jmp	loc_1F904
; ���������������������������������������������������������������������������

loc_1F9BA:				; CODE XREF: seg032:04FAj
		mov	si, 6
		jmp	loc_1F904
; ���������������������������������������������������������������������������

loc_1F9C0:				; CODE XREF: seg032:04FFj
		mov	si, 2
		jmp	loc_1F904
; ���������������������������������������������������������������������������
		jmp	loc_1F904
; ���������������������������������������������������������������������������

loc_1F9C9:				; CODE XREF: seg032:loc_1F8FEj
					; DATA XREF: seg032:056Eo
		jmp	short loc_1F9D5	; case 0x15
; ���������������������������������������������������������������������������

loc_1F9CB:				; CODE XREF: seg032:loc_1F8FEj
					; DATA XREF: seg032:056Eo
		les	bx, [bp-14h]	; case 0x1
		cmp	byte ptr es:[bx+14h], 0
		jz	short loc_1F9D8	; default

loc_1F9D5:				; CODE XREF: seg032:loc_1F9C9j
		mov	si, 8

loc_1F9D8:				; CODE XREF: seg032:044Bj seg032:045Dj ...
		cmp	si, 0FFFFh	; default
		jz	short loc_1F9FA
		mov	ax, [bp-6Eh]
		cmp	ax, [bp-0Ah]
		jnz	short loc_1F9E6
		inc	si

loc_1F9E6:				; CODE XREF: seg032:0533j
		push	si
		push	word ptr [bp-5Ah]
		push	word ptr [bp-46h]
		mov	ax, di
		add	ax, 5Eh	; '^'
		push	ax
		push	cs
		call	near ptr UIList_CreateMarker
		add	sp, 8

loc_1F9FA:				; CODE XREF: seg032:loc_1F5CFj
					; seg032:013Ej	...
		lea	ax, [bp-0Ch]
		push	ax
		push	59C3h

loc_1FA01:
		call	World_IterateObjects

loc_1FA06:
		add	sp, 4
		or	ax, ax

loc_1FA0B:
		jz	short loc_1FA10

loc_1FA0D:
		jmp	loc_1F5D2
; ���������������������������������������������������������������������������

loc_1FA10:				; CODE XREF: seg032:00C2j
					; seg032:loc_1FA0Bj
		pop	di
		pop	si

locret_1FA12:
		leave
		retf
; ���������������������������������������������������������������������������
word_1FA14	dw	1,     6,     8,   13h ; DATA XREF: seg032:043Bo
		dw    15h		; value	table for switch statement
		dw offset loc_1F9CB	; jump table for switch	statement
		dw offset loc_1F910
		dw offset loc_1F902
		dw offset loc_1F984
		dw offset loc_1F9C9
; ���������������������������������������������������������������������������

loc_1FA28:				; DATA XREF: seg339:off_6D9E2o
		push	bp
		mov	bp, sp
		sub	sp, 3Ch
		push	si
		push	di
		mov	si, [bp+6]

loc_1FA33:
		mov	dword ptr [bp-0Ah], 0
		mov	byte ptr [bp-6], 2

loc_1FA3F:
		mov	byte ptr [bp-5], 0

loc_1FA43:
		mov	dword ptr [bp-4], 0
		mov	word ptr [bp-0Ch], 0
		mov	bx, [si+2]
		cmp	byte ptr [bx+21Dh], 0
		jnz	short loc_1FA5D
		jmp	loc_1FAF1
; ���������������������������������������������������������������������������

loc_1FA5D:				; CODE XREF: seg032:05A8j
		mov	di, si
		add	di, 46h	; 'F'
		mov	eax, [di]
		mov	[bp-10h], eax
		mov	al, [di+4]
		mov	[bp-11h], al
		mov	eax, [bp-10h]
		mov	[bp-0Ah], eax
		mov	al, [bp-11h]
		mov	[bp-6],	al
		mov	byte ptr [bp-5], 0
		mov	dword ptr [bp-4], 0
		mov	eax, [di+6]
		mov	[bp-4],	eax
		mov	ax, [si+22h]
		mov	[bp-14h], ax
		mov	ax, [si+24h]
		mov	[bp-16h], ax
		mov	ax, [si+26h]
		mov	[bp-18h], ax
		mov	ax, [si+28h]
		mov	[bp-1Ah], ax
		mov	ax, [bp-14h]
		mov	[si+8],	ax
		mov	ax, [bp-16h]
		mov	[si+0Ah], ax
		mov	ax, [bp-18h]
		mov	[si+0Ch], ax
		mov	ax, [bp-1Ah]
		mov	[si+0Eh], ax

loc_1FAC1:
		mov	ax, [si+22h]
		mov	[bp-1Ch], ax

loc_1FAC7:
		mov	ax, [si+24h]
		mov	[bp-1Eh], ax

loc_1FACD:
		mov	ax, [si+26h]
		mov	[bp-20h], ax

loc_1FAD3:
		mov	ax, [si+28h]
		mov	[bp-22h], ax
		mov	ax, [bp-1Ch]
		mov	[si+16h], ax
		mov	ax, [bp-1Eh]
		mov	[si+18h], ax
		mov	ax, [bp-20h]
		mov	[si+1Ah], ax
		mov	ax, [bp-22h]
		jmp	loc_1FB87
; ���������������������������������������������������������������������������

loc_1FAF1:				; CODE XREF: seg032:05AAj
		mov	di, si
		add	di, 54h	; 'T'
		mov	eax, [di]
		mov	[bp-26h], eax
		mov	al, [di+4]
		mov	[bp-27h], al
		mov	eax, [bp-26h]

loc_1FB07:
		mov	[bp-0Ah], eax
		mov	al, [bp-27h]

loc_1FB0E:
		mov	[bp-6],	al
		mov	byte ptr [bp-5], 0
		mov	dword ptr [bp-4], 0
		mov	eax, [di+6]
		mov	[bp-4],	eax
		mov	word ptr [bp-0Ch], 12h
		mov	ax, [si+64h]
		mov	[bp-2Ah], ax

loc_1FB30:
		mov	ax, [si+66h]
		mov	[bp-2Ch], ax

loc_1FB36:
		mov	ax, [si+68h]
		mov	[bp-2Eh], ax
		mov	ax, [si+6Ah]
		mov	[bp-30h], ax
		mov	ax, [bp-2Ah]
		mov	[si+8],	ax
		mov	ax, [bp-2Ch]
		mov	[si+0Ah], ax
		mov	ax, [bp-2Eh]
		mov	[si+0Ch], ax
		mov	ax, [bp-30h]
		mov	[si+0Eh], ax
		mov	ax, [si+64h]
		mov	[bp-32h], ax
		mov	ax, [si+66h]
		mov	[bp-34h], ax
		mov	ax, [si+68h]
		mov	[bp-36h], ax
		mov	ax, [si+6Ah]
		mov	[bp-38h], ax
		mov	ax, [bp-32h]
		mov	[si+16h], ax
		mov	ax, [bp-34h]
		mov	[si+18h], ax
		mov	ax, [bp-36h]
		mov	[si+1Ah], ax
		mov	ax, [bp-38h]

loc_1FB87:				; CODE XREF: seg032:063Ej
		mov	[si+1Ch], ax
		mov	ax, si
		add	ax, 12h
		push	ax
		lea	ax, [bp-3Ch]
		push	ax
		call	SmallObject_RegisterInList_5D999
		add	sp, 4
		push	0
		mov	ax, si
		add	ax, 12h
		push	ax
		call	TextFormat_ReleaseAttribute_5E5AC
		add	sp, 4
		push	word ptr [bp-0Ch]
		push	0
		mov	al, [si+40h]
		push	ax
		push	large dword ptr	[si+3Ch]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832

loc_1FBC1:
		add	sp, 0Ah
		push	dx
		push	ax
		mov	ax, si
		add	ax, 5Eh	; '^'
		push	ax
		push	cs
		call	near ptr UIList_DrawAllMarkers
		add	sp, 8
		push	1
		mov	al, [si+36h]
		mov	ah, 0
		push	ax
		mov	al, [si+37h]
		mov	ah, 0
		mov	di, ax
		or	di, di
		jge	short loc_1FBEC
		xor	dx, dx
		xor	ax, ax
		jmp	short loc_1FC09
; ���������������������������������������������������������������������������

loc_1FBEC:				; CODE XREF: seg032:0734j
		push	0
		mov	al, byte_7252C
		push	ax
		push	large [dword_72528]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah

loc_1FC02:
		mov	bx, di
		shl	bx, 8
		add	ax, bx

loc_1FC09:				; CODE XREF: seg032:073Aj
		push	dx
		push	ax

loc_1FC0B:
		push	large 1000100h
		push	large 0
		mov	al, [bp-6]
		push	ax
		push	large dword ptr	[bp-0Ah]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [si+18h]
		push	word ptr [si+16h]

loc_1FC2F:
		push	word_70E60
		call	Render_DrawScaledSprite_621A2
		add	sp, 18h
		push	2
		lea	ax, [bp-3Ch]
		push	ax
		call	SmallObject_UnregisterFromList_5D9D3
		add	sp, 4
		cmp	byte ptr [bp-5], 0
		jz	short loc_1FC6D
		cmp	dword ptr [bp-0Ah], 0
		jz	short loc_1FC6D
		push	0
		mov	al, [bp-6]
		push	ax
		lea	ax, [bp-0Ah]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_1FC6D:				; CODE XREF: seg032:079Dj seg032:07A4j
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_1FC71:				; DATA XREF: seg339:0EC0o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	dx, [bp+8]
		or	ax, ax
		jz	short loc_1FC8D

loc_1FC7E:
		test	dx, 1
		jz	short loc_1FC8D
		push	ax
		call	CRT_FreeNear_Wrap
		pop	cx
		jmp	short $+2

loc_1FC8D:				; CODE XREF: seg032:07CCj seg032:07D2j
		pop	bp
		retf
seg032		ends

seg016		segment	byte public 'CODE' use16
		assume cs:seg016
		;org 0Eh
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-17. Crée une scène (33 octets, allouée si nulle) :
; LayerGroup_Construct_2DC66(scène, images par seconde, palette 255 = aucune, surface), table
; de méthodes de scène (vtable dseg 6794 : +28 = Scene_AdvanceFrame_2DE14), drapeaux +31
; (scène terminée) et +32 = 0 ; vide le clavier (Keyboard_DrainBufferBIOS_3FA5E,
; Input_Flush_CDDC).
; ==============================================================================================
Scene_Create_C55E	proc far		; CODE XREF: seg018:009DP
					; sub_4AD86+1C9P ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_C579
		push	21h ; '!'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_C5A7

loc_C579:				; CODE XREF: Scene_Create_C55E+9j
		push	[bp+arg_6]
		mov	al, [bp+arg_4]
		push	ax
		push	[bp+arg_2]
		push	si
		call	LayerGroup_Construct_2DC66
		add	sp, 8
		mov	word ptr [si], 1A8Ah
		mov	word ptr [si+0Ah], 1AAAh
		mov	byte ptr [si+1Fh], 0
		mov	byte ptr [si+20h], 0
		call	Keyboard_DrainBufferBIOS_3FA5E
		call	Input_Flush_CDDC

loc_C5A7:				; CODE XREF: Scene_Create_C55E+19j
		mov	ax, si
		pop	si
		pop	bp
		retf
Scene_Create_C55E	endp

; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; near (appel cs), LUE 2026-10-17. Lit une touche (Keyboard_QueryAndDispatch_3E5C7). Échap
; (code 1) : byte_495FC = 1 et scène terminée (+31). Si byte_443B2 est posé (mode non établi,
; sans doute de mise au point) : A (code 30) termine la scène, S (code 31) la termine et pose
; +32, toute autre touche attend une nouvelle touche. Espace (code 57) : renvoie 1. Appelle
; d'abord sub_D157 (pas lue).
; ==============================================================================================
Scene_PollKeys_C5AF	proc far		; CODE XREF: Scene_Tick_C652+AFp

var_6		= word ptr -6
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	si, [bp+arg_0]
		call	sub_D157
		mov	[bp+var_1], 0
		push	2
		lea	ax, [bp+var_6]
		push	ax
		call	Keyboard_QueryAndDispatch_3E5C7
		add	sp, 4
		cmp	byte ptr [bp+var_6], 0
		jnz	short loc_C5DC
		cmp	[bp+arg_2], 0
		jz	short loc_C649

loc_C5DC:				; CODE XREF: Scene_PollKeys_C5AF+25j
		cmp	byte ptr [bp+var_6+1], 1
		jnz	short loc_C5F0
		mov	byte_495FC, 1
		mov	byte ptr [si+1Fh], 1
		mov	al, 0
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_C5F0:				; CODE XREF: Scene_PollKeys_C5AF+31j
		cmp	byte_443B2, 0
		jz	short loc_C63A
		cmp	byte ptr [bp+var_6+1], 1Eh
		jnz	short loc_C60B
		call	Keyboard_DrainBufferBIOS_3FA5E
		mov	byte ptr [si+1Fh], 1
		mov	al, 0
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_C60B:				; CODE XREF: Scene_PollKeys_C5AF+4Cj
		cmp	byte ptr [bp+var_6+1], 1Fh
		jnz	short loc_C623
		call	Keyboard_DrainBufferBIOS_3FA5E
		mov	byte ptr [si+1Fh], 1
		mov	byte ptr [si+20h], 1
		mov	al, 0
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_C623:				; CODE XREF: Scene_PollKeys_C5AF+60j Scene_PollKeys_C5AF+89j
		push	2
		lea	ax, [bp+var_6]
		push	ax
		call	Keyboard_QueryAndDispatch_3E5C7
		add	sp, 4
		mov	al, byte ptr [bp+var_6]
		mov	ah, 0
		or	ax, ax
		jz	short loc_C623

loc_C63A:				; CODE XREF: Scene_PollKeys_C5AF+46j
		cmp	byte ptr [bp+var_6+1], 39h ; '9'
		jnz	short loc_C644
		mov	[bp+var_1], 1

loc_C644:				; CODE XREF: Scene_PollKeys_C5AF+8Fj
		call	Keyboard_DrainBufferBIOS_3FA5E

loc_C649:				; CODE XREF: Scene_PollKeys_C5AF+2Bj
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
Scene_PollKeys_C5AF	endp

; ���������������������������������������������������������������������������
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-17. Joue une image de scène. Si byte_495FC est posé, marque la scène
; terminée (+31). Sinon : début = dword_47ABB, durée = +16 ; applique la palette +18 si
; différente de 255 ; dessine chaque calque de la liste +4 dans l'ordre d'ajout (méthode
; virtuelle +16 avec la position de la scène +12/+14) ; copie l'image vers l'écran (sub_2EC65)
; ; avance d'une image (méthode +28 = Scene_AdvanceFrame_2DE14) ; lit le clavier
; (Scene_PollKeys_C5AF) ; attend la fin de la durée (Stopwatch_WaitElapsed_3F023).
; ==============================================================================================
Scene_Tick_C652	proc far		; CODE XREF: seg018:0208P
					; sub_4AD86+674P ...

var_8		= dword	ptr -8
var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		mov	[bp+var_3], 0
		cmp	byte_495FC, 0
		jz	short loc_C670
		mov	byte ptr [si+1Fh], 1

loc_C670:				; CODE XREF: Scene_Tick_C652+18j
		cmp	byte ptr [si+1Fh], 0
		jz	short loc_C682
		push	si
		mov	bx, [si]
		call	dword ptr [bx+1Ch]
		add	sp, 2
		jmp	loc_C718
; ���������������������������������������������������������������������������

loc_C682:				; CODE XREF: Scene_Tick_C652+22j
		movzx	eax, word ptr [si+10h]
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	[si+19h], eax
		mov	eax, dword_47ABB
		mov	[si+15h], eax
		cmp	byte ptr [si+12h], 0FFh
		jz	short loc_C6B1
		mov	al, [si+12h]
		push	ax
		push	word_46F44
		call	TextFormat_ReleaseAttribute_2EC80
		add	sp, 4

loc_C6B1:				; CODE XREF: Scene_Tick_C652+4Dj
		jmp	short loc_C6CD
; ���������������������������������������������������������������������������

loc_C6B3:				; CODE XREF: Scene_Tick_C652+8Fj
		push	word ptr [si+0Eh]
		push	word ptr [si+0Ch]
		mov	bx, [bp+var_2]
		push	word ptr [bx+6]
		mov	bx, [bp+var_2]
		mov	bx, [bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6

loc_C6CD:				; CODE XREF: Scene_Tick_C652:loc_C6B1j
		lea	ax, [bp+var_2]
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_2FC4A
		add	sp, 4
		or	ax, ax
		jnz	short loc_C6B3
		push	word_46F44
		push	word ptr [si+13h]
		call	UI_ApplyEncodingHelper_2EC65
		add	sp, 4
		push	si
		mov	bx, [si]
		call	dword ptr [bx+1Ch]
		add	sp, 2
		mov	al, [bp+var_3]
		push	ax
		push	si
		push	cs
		call	near ptr Scene_PollKeys_C5AF
		add	sp, 4
		mov	[bp+var_3], al
		mov	ax, si
		add	ax, 15h
		push	ax
		call	Stopwatch_WaitElapsed_3F023
		add	sp, 2

loc_C718:				; CODE XREF: Scene_Tick_C652+2Dj
		pop	si
		leave
		retf
Scene_Tick_C652	endp

; ���������������������������������������������������������������������������

loc_C71B:				; DATA XREF: dseg:1A8Ao
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_C74D
		mov	word ptr [si], 1A8Ah
		mov	word ptr [si+0Ah], 1AAAh
		push	0
		push	si
		call	Scene_Destruct_2DCFC
		add	sp, 4
		test	di, 1
		jz	short loc_C74D
		push	si
		call	sub_308
		add	sp, 2

loc_C74D:				; CODE XREF: seg016:01D8j seg016:01F2j
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_C751:				; DATA XREF: dseg:1AB6o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	far ptr	loc_2DD3F
; ���������������������������������������������������������������������������

loc_C75D:				; DATA XREF: dseg:1AB2o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	far ptr	loc_2DD61
; ���������������������������������������������������������������������������

loc_C769:				; DATA XREF: dseg:1AAAo
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	far ptr	loc_2DD37
seg016		ends

seg027		segment	para public 'CODE' use16
		assume cs:seg027
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 83h, 0C4h, 8, 5Fh, 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Scene_Create_C55E (sub_C55E de OPTEST.EXE). Résumé
; repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-17. Crée
; une scène (33 octets, allouée si nulle) : LayerGroup_Construct_2DC66(scène, images par
; seconde, palette 255 = aucune, surface), table de méthodes de scène (vtable dseg 6794 : +28
; = Scene_AdvanceFrame_2DE14), drapeaux +31 (scène terminée) et +32 = 0 ; vide le clavier
; (Keyboard_DrainBufferBIOS_3FA5E, Input_Flush_CDDC).
; ==============================================================================================
Scene_Create_10E57		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_10E72
		push	21h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_10EA0

loc_10E72:
		push	[bp+arg_6]
		mov	al, [bp+arg_4]
		push	ax
		push	[bp+arg_2]
		push	si
		call	LayerGroup_Construct_33CB2
		add	sp, 8
		mov	word ptr [si], 21ECh
		mov	word ptr [si+0Ah], 220Ch
		mov	byte ptr [si+1Fh], 0
		mov	byte ptr [si+20h], 0
		call	Keyboard_DrainBufferBIOS_45C38
		call	Input_Flush_116D1

loc_10EA0:
		mov	ax, si
		pop	si
		pop	bp
		retf
Scene_Create_10E57		endp

; START OF FUNCTION CHUNK FOR Scene_Create_10E57
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR Scene_Create_10E57

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à Scene_PollKeys_C5AF
; (sub_C5AF de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — near (appel cs), LUE 2026-10-17. Lit une touche (Keyboard_QueryAndDispatch_3E5C7).
; Échap (code 1) : byte_495FC = 1 et scène terminée (+31). Si byte_443B2 est posé (mode non
; établi, sans doute de mise au point) : A (code 30) termine la scène, S (code 31) la termine
; et pose +32, toute autre touche attend une nouvelle touche. Espace (code 57) : renvoie 1.
; Appelle d'abord sub_D157 (pas lue).
; ==============================================================================================
Scene_PollKeys_10EA8		proc far

var_6		= word ptr -6
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	si, [bp+arg_0]
		call	sub_11A88
		mov	[bp+var_1], 0
		push	2
		lea	ax, [bp+var_6]
		push	ax
		call	Keyboard_QueryAndDispatch_443C0
		add	sp, 4
		cmp	byte ptr [bp+var_6], 0
		jnz	short loc_10ED5
		cmp	[bp+arg_2], 0
		jz	short loc_10F42

loc_10ED5:
		cmp	byte ptr [bp+var_6+1], 1
		jnz	short loc_10EE9
		mov	byte_4F55C, 1
		mov	byte ptr [si+1Fh], 1
		mov	al, 0
		pop	si
		leave
		retf

loc_10EE9:
		cmp	byte_49DF1, 0
		jz	short loc_10F33
		cmp	byte ptr [bp+var_6+1], 1Eh
		jnz	short loc_10F04
		call	Keyboard_DrainBufferBIOS_45C38
		mov	byte ptr [si+1Fh], 1
		mov	al, 0
		pop	si
		leave
		retf

loc_10F04:
		cmp	byte ptr [bp+var_6+1], 1Fh
		jnz	short loc_10F1C
		call	Keyboard_DrainBufferBIOS_45C38
		mov	byte ptr [si+1Fh], 1
		mov	byte ptr [si+20h], 1
		mov	al, 0
		pop	si
		leave
		retf

loc_10F1C:
		push	2
		lea	ax, [bp+var_6]
		push	ax
		call	Keyboard_QueryAndDispatch_443C0
		add	sp, 4
		mov	al, byte ptr [bp+var_6]
		mov	ah, 0
		or	ax, ax
		jz	short loc_10F1C

loc_10F33:
		cmp	byte ptr [bp+var_6+1], 39h
		jnz	short loc_10F3D
		mov	[bp+var_1], 1

loc_10F3D:
		call	Keyboard_DrainBufferBIOS_45C38

loc_10F42:
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
Scene_PollKeys_10EA8		endp

; START OF FUNCTION CHUNK FOR Scene_PollKeys_10EA8
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR Scene_PollKeys_10EA8

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE par position d'appel dans les cinématiques : position d'appel (392 sur
; 392), à Scene_Tick_C652 (sub_C652 de OPTEST.EXE). Code non comparé instruction par
; instruction. — far, LUE 2026-10-17. Joue une image de scène. Si byte_495FC est posé, marque
; la scène terminée (+31). Sinon : début = dword_47ABB, durée = +16 ; applique la palette +18
; si différente de 255 ; dessine chaque calque de la liste +4 dans l'ordre d'ajout (méthode
; virtuelle +16 avec la position de la scène +12/+14) ; copie l'image vers l'écran (sub_2EC65)
; ; avance d'une image (méthode +28 = Scene_AdvanceFrame_2DE14) ; lit le clavier
; (Scene_PollKeys_C5AF) ; attend la fin de la durée (Stopwatch_WaitElapsed_3F023).
; ==============================================================================================
Scene_Tick_10F4B		proc far

var_8		= dword ptr -8
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
		cmp	byte_4F55C, 0
		jz	short loc_10F69
		mov	byte ptr [si+1Fh], 1

loc_10F69:
		cmp	byte ptr [si+1Fh], 0
		jz	short loc_10F7B
		push	si
		mov	bx, [si]
		call	dword ptr [bx+1Ch]
		add	sp, 2
		jmp	loc_11011

loc_10F7B:
		movzx	eax, word ptr [si+10h]
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	[si+19h], eax
		mov	eax, dword_4DE15
		mov	[si+15h], eax
		cmp	byte ptr [si+12h], 0FFh
		jz	short loc_10FAA
		mov	al, [si+12h]
		push	ax
		push	word_4D36C
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4

loc_10FAA:
		jmp	short loc_10FC6

loc_10FAC:
		push	word ptr [si+0Eh]
		push	word ptr [si+0Ch]
		mov	bx, [bp+var_2]
		push	word ptr [bx+6]
		mov	bx, [bp+var_2]
		mov	bx, [bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6

loc_10FC6:
		lea	ax, [bp+var_2]
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		call	LinkedList_Helper_3656B
		add	sp, 4
		or	ax, ax
		jnz	short loc_10FAC
		push	word_4D36C
		push	word ptr [si+13h]
		call	UI_ApplyEncodingHelper_35A92
		add	sp, 4
		push	si
		mov	bx, [si]
		call	dword ptr [bx+1Ch]
		add	sp, 2
		mov	al, [bp+var_3]
		push	ax
		push	si
		push	cs
		call	near ptr Scene_PollKeys_10EA8
		add	sp, 4
		mov	[bp+var_3], al
		mov	ax, si
		add	ax, 15h
		push	ax
		call	Stopwatch_WaitElapsed_44E21
		add	sp, 2

loc_11011:
		pop	si
		leave
		retf
Scene_Tick_10F4B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_11014		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_11046
		mov	word ptr [si], 21ECh
		mov	word ptr [si+0Ah], 220Ch
		push	0
		push	si
		call	Scene_Destruct_33D48
		add	sp, 4
		test	di, 1
		jz	short loc_11046
		push	si
		call	sub_39C
		add	sp, 2

loc_11046:
		pop	di
		pop	si
		pop	bp
		retf
sub_11014		endp

; ----------------------------------------------------------------------

sub_1104A		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	sub_33D8B
sub_1104A		endp

; ----------------------------------------------------------------------

sub_11056		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
sub_11056		endp

; START OF FUNCTION CHUNK FOR sub_11056
		db 0EAh, 9Dh, 3
; END OF FUNCTION CHUNK FOR sub_11056
seg027		ends

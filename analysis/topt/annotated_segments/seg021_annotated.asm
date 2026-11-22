seg021		segment	para public 'CODE' use16
		assume cs:seg021
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Music_ChannelStopSequence_783A (sub_783A de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à Music_ChannelStopSequence_59F1D
; (sub_59F1D de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — Ex-'Sequencer_AdvanceActiveSlot_59F1D'. far, 65L, LUE 2026-10-06. Arrete et libere la
; sequence d'un canal musical (struct canal : +0 pilote (+4 = handle AIL), +2 handle de
; sequence, -1 si aucune, +4 table d'etat) : si AIL_sequence_status_603DE == 1 (en cours) ->
; AIL_stop_sequence_603D2 ; puis AIL_release_sequence_handle_6039C et handle = -1. Canaux du
; jeu : 5BE3h (principal) et 5BF5h (transition).
; ==============================================================================================
Music_ChannelStopSequence_B6F1		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0
		jz	short loc_B758
		cmp	word ptr [si], 0
		jz	short loc_B720
		push	word ptr [si+2]
		mov	bx, [si]
		push	word ptr [bx+4]
		call	sub_50E3
		add	sp, 4
		cmp	ax, 1
		jnz	short loc_B71C
		mov	ax, 1
		jmp	short loc_B71E

loc_B71C:
		xor	ax, ax

loc_B71E:
		jmp	short loc_B722

loc_B720:
		mov	al, 0

loc_B722:
		or	al, al
		jz	short loc_B73D
		cmp	word ptr [si], 0
		jz	short loc_B73D
		push	word ptr [si+2]
		mov	bx, [si]
		push	word ptr [bx+4]
		call	AIL_stop_sequence_50D7
		add	sp, 4
		jmp	short loc_B73D

loc_B73D:
		cmp	word ptr [si+2], 0FFFFh
		jz	short loc_B758
		push	word ptr [si+2]
		mov	bx, [si]
		push	word ptr [bx+4]
		call	sub_50A1
		add	sp, 4
		mov	word ptr [si+2], 0FFFFh

loc_B758:
		pop	si
		pop	bp
		retf
Music_ChannelStopSequence_B6F1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE par position d'appel dans les cinématiques : position d'appel (49 sur
; 49), à MusicChannel_Init_78A4 (sub_78A4 de OPTEST.EXE). Code non comparé instruction par
; instruction. — far, LUE 2026-10-17. Initialise un canal musical : +0 pilote (arg_2), +2
; séquence = -1, table d'état allouée selon la taille demandée au pilote (sub_30C06),
; descripteur en +4. Même rôle que Music_ChannelInit_59F87 de STRIKE.EXE (code différent).
; ==============================================================================================
MusicChannel_Init_B75B		proc far

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
		or	di, di
		jz	short loc_B79E
		mov	[si], di
		mov	word ptr [si+2], 0FFFFh
		mov	bx, [si]
		push	word ptr [bx+4]
		call	sub_5095
		add	sp, 2
		mov	[bp+var_2], ax
		push	1C41h
		push	1
		movzx	eax, [bp+var_2]
		push	eax
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_5C55
		add	sp, 0Ah

loc_B79E:
		pop	di
		pop	si
		leave
		retf
MusicChannel_Init_B75B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE par position d'appel dans les cinématiques : position d'appel (58 sur
; 58), à MusicChannel_RegisterSequence_7918 (sub_7918 de OPTEST.EXE). Code non comparé
; instruction par instruction. — far, LUE 2026-10-17. Si le canal a un pilote et aucune
; séquence : enregistre la séquence XMIDI du bloc donné (sub_30C0C ; bloc de type 3 verrouillé
; par sub_2AE6E, sinon pointeur direct ; échec : byte_4457C = 6), puis installe chaque timbre
; demandé par le pilote (sub_30C24 renvoie banque × 256 + patch, installé par sub_75AF)
; jusqu'à -1. Même rôle que Music_ChannelRegisterSequence_59FF5 de STRIKE.EXE (code
; différent).
; ==============================================================================================
MusicChannel_RegisterSequence_B7A2		proc far

var_1		= byte ptr -1
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
		cmp	byte_4A620, 0
		jnz	short loc_B7E1
		inc	byte_4A620
		mov	word_4EF28, 1B4h
		mov	ax, word_4D392
		mov	word_4EF2A, ax
		mov	word_4D392, 6548h
		mov	word_4EF28, 1BCh
		mov	dword_4EF2C, 0
		mov	byte_4EF30, 0

loc_B7E1:
		cmp	byte_4CA58, 5
		jnz	short loc_B84A
		les	bx, word_4CF9E
		mov	al, es:[bx]
		mov	[bp+var_1], al
		cmp	[bp+var_1], 0
		jz	short loc_B7FD
		call	PagedMemory_DetectDriverSignatureA_30BB4

loc_B7FD:
		push	large [di+6]
		push	0
		mov	al, [di+4]
		push	ax
		push	word ptr [di+2]
		push	word ptr [di]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	653Ch
		call	sub_5D59
		add	sp, 2
		push	dx
		push	ax
		call	sub_31785
		add	sp, 0Ch
		push	[bp+arg_4]
		push	653Ch
		push	si
		nop
		push	cs
		call	near ptr sub_B869
		add	sp, 6
		cmp	[bp+var_1], 0
		jz	short loc_B848
		call	PagedMemory_DetectDriverSignatureB_30BC5

loc_B848:
		jmp	short loc_B865

loc_B84A:
		push	di
		push	6548h
		call	sub_5CC9
		add	sp, 4
		push	[bp+arg_4]
		push	6548h
		push	si
		nop
		push	cs
		call	near ptr sub_B869
		add	sp, 6

loc_B865:
		pop	di
		pop	si
		leave
		retf
MusicChannel_RegisterSequence_B7A2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B869		proc far

var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word ptr [si], 0
		jnz	short loc_B87F
		jmp	loc_B95B

loc_B87F:
		cmp	word ptr [si+2], 0FFFFh
		jz	short loc_B888
		jmp	loc_B95B

loc_B888:
		cmp	byte ptr [di+8], 4
		jz	short loc_B894
		cmp	byte ptr [di+8], 3
		jnz	short loc_B899

loc_B894:
		mov	ax, 1
		jmp	short loc_B89B

loc_B899:
		xor	ax, ax

loc_B89B:
		mov	[bp+var_3], al
		cmp	[bp+var_3], 0
		jz	short loc_B8C3
		push	di
		call	sub_5E18
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		shld	edx, eax, 10h
		mov	[bp+var_6], dx
		mov	[bp+var_8], ax
		jmp	short loc_B8D2

loc_B8C3:
		push	di
		call	sub_5D59
		add	sp, 2
		mov	[bp+var_6], dx
		mov	[bp+var_8], ax

loc_B8D2:
		mov	al, [bp+var_3]
		mov	ah, 0
		push	ax
		push	0
		push	0
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_5D59
		add	sp, 2
		push	dx
		push	ax
		push	[bp+arg_4]
		push	[bp+var_6]
		push	[bp+var_8]
		mov	bx, [si]
		push	word ptr [bx+4]
		call	sub_509B
		add	sp, 12h
		mov	[si+2], ax
		cmp	word ptr [si+2], 0FFFFh
		jnz	short loc_B90D
		jmp	short loc_B95B

loc_B90D:
		cmp	word ptr [si+2], 0FFFEh
		jnz	short loc_B915
		jmp	short loc_B95B

loc_B915:
		push	di
		call	sub_5D59
		add	sp, 2
		push	word ptr [si+2]
		mov	bx, [si]
		push	word ptr [bx+4]
		call	sub_50B3
		add	sp, 4
		mov	[bp+var_A], ax
		cmp	[bp+var_A], 0FFFFh
		jz	short loc_B957
		mov	ax, [bp+var_A]
		shr	ax, 8
		mov	byte ptr [bp+var_2+1], al
		mov	al, byte ptr [bp+var_A]
		and	al, 0FFh
		mov	byte ptr [bp+var_2], al
		push	[bp+var_2]
		push	word ptr [si]
		call	sub_B3E7
		add	sp, 4
		jmp	short loc_B959

loc_B957:
		jmp	short loc_B95B

loc_B959:
		jmp	short loc_B915

loc_B95B:
		pop	di
		pop	si
		leave
		retf
sub_B869		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B95F		proc far
		push	bp
		mov	bp, sp
		cmp	byte_4A620, 0
		jz	short loc_B976
		push	2
		push	6548h
sub_B95F		endp

; START OF FUNCTION CHUNK FOR sub_B95F
		db 9Ah
		in	al, dx
; END OF FUNCTION CHUNK FOR sub_B95F
seg021		ends

seg135		segment	para public 'CODE' use16
		assume cs:seg135
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 8Bh, 46h, 6, 5Dh, 0CBh

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
Music_ChannelStopSequence_5C915		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0
		jz	short loc_5C97C
		cmp	word ptr [si], 0
		jz	short loc_5C944
		push	word ptr [si+2]
		mov	bx, [si]
		push	word ptr [bx+4]
		call	sub_1DC07
		add	sp, 4
		cmp	ax, 1
		jnz	short loc_5C940
		mov	ax, 1
		jmp	short loc_5C942

loc_5C940:
		xor	ax, ax

loc_5C942:
		jmp	short loc_5C946

loc_5C944:
		mov	al, 0

loc_5C946:
		or	al, al
		jz	short loc_5C961
		cmp	word ptr [si], 0
		jz	short loc_5C961
		push	word ptr [si+2]
		mov	bx, [si]
		push	word ptr [bx+4]
		call	sub_1DBFB
		add	sp, 4
		jmp	short loc_5C961

loc_5C961:
		cmp	word ptr [si+2], 0FFFFh
		jz	short loc_5C97C
		push	word ptr [si+2]
		mov	bx, [si]
		push	word ptr [bx+4]
		call	sub_1DBC5
		add	sp, 4
		mov	word ptr [si+2], 0FFFFh

loc_5C97C:
		pop	si
		pop	bp
		retf
Music_ChannelStopSequence_5C915		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5C97F		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		or	dx, dx
		jz	short loc_5C9BE
		mov	[si], dx
		mov	word ptr [si+2], 0FFFFh
		mov	bx, [si]
		push	word ptr [bx+4]
		call	sub_1DBB9
		pop	cx
		mov	[bp+var_2], ax
		push	0
		push	1
		movzx	eax, [bp+var_2]
		push	eax
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_1CD38
		add	sp, 0Ah

loc_5C9BE:
		pop	si
		leave
		retf
sub_5C97F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5C9C1		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte_79DB2, 0
		jnz	short loc_5C9F9
		inc	byte_79DB2
		mov	word_7D098, 0D7Ch
		mov	ax, word_7AFA2
		mov	word_7D09A, ax
		mov	word_7AFA2, 6968h
		mov	word_7D098, 0D84h
		mov	dword_7D09C, 0
		mov	byte_7D0A0, 0

loc_5C9F9:
		push	[bp+arg_2]
		push	6968h
		call	sub_1CDA5
		add	sp, 4
		push	[bp+arg_4]
		push	6968h
		push	si
		nop
		push	cs
		call	near ptr sub_5CA72
		add	sp, 6
		pop	si
		pop	bp
		retf
sub_5C9C1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5CA19		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte_79DB3, 0
		jnz	short loc_5CA51
		inc	byte_79DB3
		mov	word_7D0A2, 0D7Ch
		mov	ax, word_7AFA2
		mov	word_7D0A4, ax
		mov	word_7AFA2, 6972h
		mov	word_7D0A2, 0D84h
		mov	dword_7D0A6, 0
		mov	byte_7D0AA, 0

loc_5CA51:
		push	large [bp+arg_2]
		push	6972h
		call	sub_1CDEB
		add	sp, 6
		push	[bp+arg_6]
		push	6972h
		push	si
		nop
		push	cs
		call	near ptr sub_5CA72
		add	sp, 6
		pop	si
		pop	bp
		retf
sub_5CA19		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5CA72		proc far

var_8		= dword ptr -8
var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word ptr [si], 0
		jnz	short loc_5CA88
		jmp	loc_5CB4A

loc_5CA88:
		cmp	word ptr [si+2], 0FFFFh
		jz	short loc_5CA91
		jmp	loc_5CB4A

loc_5CA91:
		cmp	byte ptr [di+8], 4
		jz	short loc_5CA9D
		cmp	byte ptr [di+8], 3
		jnz	short loc_5CAA2

loc_5CA9D:
		mov	ax, 1
		jmp	short loc_5CAA4

loc_5CAA2:
		xor	ax, ax

loc_5CAA4:
		mov	[bp+var_3], al
		cmp	[bp+var_3], 0
		jz	short loc_5CABF
		push	di
		call	sub_1CF1C
		push	dx
		push	ax
		pop	eax
		pop	cx
		shld	edx, eax, 10h
		jmp	short loc_5CAC6

loc_5CABF:
		push	di
		call	sub_1CE74
		pop	cx

loc_5CAC6:
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		mov	al, [bp+var_3]
		mov	ah, 0
		push	ax
		push	large 0
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_1CE74
		pop	cx
		push	dx
		push	ax
		push	[bp+arg_4]
		push	large [bp+var_8]
		mov	bx, [si]
		push	word ptr [bx+4]
		call	sub_1DBBF
		add	sp, 12h
		mov	[si+2], ax
		cmp	word ptr [si+2], 0FFFFh
		jnz	short loc_5CB07
		mov	byte_79D64, 3
		jmp	short loc_5CB4A

loc_5CB07:
		cmp	word ptr [si+2], 0FFFEh
		jnz	short loc_5CB14
		mov	byte_79D64, 5
		jmp	short loc_5CB4A

loc_5CB14:
		push	di
		call	sub_1CE74
		pop	cx
		push	word ptr [si+2]
		mov	bx, [si]
		push	word ptr [bx+4]
		call	sub_1DBD7
		add	sp, 4
		mov	dx, ax
		cmp	dx, 0FFFFh
		jz	short loc_5CB4A
		shr	ax, 8
		mov	byte ptr [bp+var_2+1], al
		mov	byte ptr [bp+var_2], dl
		push	[bp+var_2]
		push	word ptr [si]
		call	sub_5D11C
		add	sp, 4
		jmp	short loc_5CB14

loc_5CB4A:
		pop	di
		pop	si
		leave
		retf
sub_5CA72		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5CB4E		proc far
		push	bp
		mov	bp, sp
		cmp	byte_79DB3, 0
		jz	short loc_5CB65
		push	2
		push	6972h
		call	sub_1CD03
		add	sp, 4

loc_5CB65:
		cmp	byte_79DB2, 0
		jz	short loc_5CB79
		push	2
sub_5CB4E		endp

; START OF FUNCTION CHUNK FOR sub_5CB4E
		db 68h, 68h
; END OF FUNCTION CHUNK FOR sub_5CB4E
seg135		ends

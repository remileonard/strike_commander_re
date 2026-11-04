seg075		segment	para public 'CODE' use16
		assume cs:seg075
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 8Bh, 46h, 6, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2D765		proc far
		push	bp
		mov	bp, sp
		cmp	word_4CA61, 0
		jz	short loc_2D77B
		push	word_4CA61
		call	sub_47C8E
		add	sp, 2

loc_2D77B:
		cmp	word_4CA5F, 0
		jz	short loc_2D78E
		push	word_4CA5F
		call	sub_47C3A
		add	sp, 2

loc_2D78E:
		cmp	word_4CA63, 0
		jz	short loc_2D7A1
		push	word_4CA63
		call	sub_488FF
		add	sp, 2

loc_2D7A1:
		pop	bp
		retf
sub_2D765		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2D7A3		proc far

var_1		= byte ptr -1
arg_0		= byte ptr  6
arg_2		= dword ptr  8
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_6]
		mov	[bp+var_1], 0
		cmp	byte_4F557, 0
		jz	short loc_2D7F5
		cmp	word_4CA65, 0
		jz	short loc_2D7F5
		cmp	word_4CA5F, 0
		jz	short loc_2D7DD
		push	si
		mov	al, [bp+arg_0]
		push	ax
		push	word_4CA5F
		call	sub_D25D
		add	sp, 6
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2D7F5

loc_2D7DD:
		push	si
		push	large [bp+arg_2]
		mov	al, [bp+arg_0]
		push	ax
		push	word_4CA65
		call	sub_487D9
		add	sp, 0Ah
		mov	[bp+var_1], al

loc_2D7F5:
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2D839
		cmp	byte_4F555, 0
		jz	short loc_2D839
		cmp	word_4CA5F, 0
		jz	short loc_2D839
		push	si
		push	large [bp+arg_2]
		mov	al, [bp+arg_0]
		push	ax
		push	word_4CA5F
		call	sub_D044
		add	sp, 0Ah
		cmp	word_4CA65, 0
		jz	short loc_2D839
		push	si
		mov	al, [bp+arg_0]
		push	ax
		push	word_4CA65
		call	sub_487E8
		add	sp, 6

loc_2D839:
		pop	si
		leave
		retf
sub_2D7A3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2D83C		proc far

var_1		= byte ptr -1
arg_0		= byte ptr  6
arg_2		= dword ptr  8
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_6]
		mov	[bp+var_1], 0
		cmp	byte_4F557, 0
		jz	short loc_2D8B7
		cmp	word_4CA65, 0
		jz	short loc_2D8B7
		cmp	byte_4F555, 0
		jz	short loc_2D881
		cmp	word_4CA5F, 0
		jz	short loc_2D881
		push	si
		mov	al, [bp+arg_0]
		push	ax
		push	word_4CA5F
		call	sub_D25D
		add	sp, 6
		or	al, al
		jz	short loc_2D881
		mov	[bp+var_1], 0
		jmp	short loc_2D8B7

loc_2D881:
		push	si
		push	large [bp+arg_2]
		mov	al, [bp+arg_0]
		push	ax
		push	word_4CA65
		call	sub_487D9
		add	sp, 0Ah
		mov	[bp+var_1], al
		cmp	[bp+var_1], 0
		jz	short loc_2D8B7
		cmp	word_4CA5F, 0
		jz	short loc_2D8B7
		push	si
		mov	al, [bp+arg_0]
		push	ax
		push	word_4CA5F
		call	sub_D208
		add	sp, 6

loc_2D8B7:
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2D929
		cmp	byte_4F555, 0
		jz	short loc_2D929
		cmp	word_4CA5F, 0
		jz	short loc_2D929
		push	si
		mov	al, [bp+arg_0]
		push	ax
		push	word_4CA5F
		call	sub_D25D
		add	sp, 6
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2D8FC
		push	si
		push	large [bp+arg_2]
		mov	al, [bp+arg_0]
		push	ax
		push	word_4CA5F
		call	sub_D044
		add	sp, 0Ah
		jmp	short loc_2D911

loc_2D8FC:
		push	si
		push	large [bp+arg_2]
		mov	al, [bp+arg_0]
		push	ax
		push	word_4CA5F
		call	sub_D140
		add	sp, 0Ah

loc_2D911:
		cmp	word_4CA65, 0
		jz	short loc_2D929
		push	si
		mov	al, [bp+arg_0]
		push	ax
		push	word_4CA65
		call	sub_487E8
		add	sp, 6

loc_2D929:
		pop	si
		leave
		retf
sub_2D83C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2D92C		proc far

arg_0		= byte ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_2]
		cmp	byte_4F557, 0
		jz	short loc_2D952
		cmp	word_4CA65, 0
		jz	short loc_2D952
		push	si
		mov	al, [bp+arg_0]
		push	ax
		push	word_4CA65
		call	sub_487E8
		add	sp, 6

loc_2D952:
		cmp	byte_4F555, 0
		jz	short loc_2D971
		cmp	word_4CA5F, 0
		jz	short loc_2D971
		push	si
		mov	al, [bp+arg_0]
		push	ax
		push	word_4CA5F
		call	sub_D208
		add	sp, 6

loc_2D971:
		pop	si
		pop	bp
		retf
sub_2D92C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2D974		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		cmp	byte_4F554, 0
		jz	short loc_2D990
		cmp	word_4CA61, 0
		jz	short loc_2D990
		push	[bp+arg_0]
		call	sub_D32A
		add	sp, 2

loc_2D990:
		pop	bp
		retf
sub_2D974		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2D992		proc far
		push	bp
		mov	bp, sp
		cmp	word_4CA61, 0
		jz	short loc_2D9A8
		push	word_4CA61
		call	sub_47CA2
		add	sp, 2

loc_2D9A8:
		pop	bp
		retf
sub_2D992		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2D9AA		proc far
		push	bp
		mov	bp, sp
		cmp	word_4CA61, 0
		jz	short loc_2D9C0
		push	word_4CA61
		call	sub_47CA7
		add	sp, 2

loc_2D9C0:
		pop	bp
		retf
sub_2D9AA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à Music_Stop_28CDB
; (sub_28CDB de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à Music_Stop_5A9E6
; (sub_5A9E6 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — Ex-'Widget_Helper_5A9E6'. far. LUE 2026-10-06. Facade (appelee par
; STRIKE_EXE_MAIN_LOOP) : Music_StopWithFade_AB1EF(fondu = argument).
; ==============================================================================================
Music_Stop_2D9C2		proc far

arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		cmp	word_4CA61, 0
		jz	short loc_2D9DC
		mov	al, [bp+arg_0]
		push	ax
		push	word_4CA61
		call	sub_47CAC
		add	sp, 4

loc_2D9DC:
		pop	bp
		retf
Music_Stop_2D9C2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2D9DE		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_2D9DE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Music_PlayGameflowTune_28CFC (sub_28CFC de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far,
; LUE 2026-10-22. Si la musique est active : joue le morceau arg de SOUND\gameflow.dat
; (sub_42363 → sub_5EEE6). Commande 26h.
; ==============================================================================================
Music_PlayGameflowTune_2D9E3		proc far

arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		cmp	byte_4F554, 0
		jz	short loc_2DA09
		cmp	word_4CA61, 0
		jz	short loc_2DA09
		mov	al, [bp+arg_0]
		mov	ah, 0
		push	ax
		push	4088h
		push	word_4CA61
		call	sub_47C93
		add	sp, 6

loc_2DA09:
		pop	bp
		retf
Music_PlayGameflowTune_2D9E3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à Speech_LoadBank_28D24
; (sub_28D24 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; Speech_LoadBank_5AAB2 (sub_5AAB2 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — Ex-'Widget_Helper_5AAB2'. far. LUE 2026-10-06. Facade voix
; (byte_7236D, objet word_7099F) appelee par PilotProfile_LoadRADI_8DF49 :
; AudioQueue_LoadFromMultipleReaders_AB9D7.
; ==============================================================================================
Speech_LoadBank_2DA0B		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		cmp	byte_4F554, 0
		jz	short loc_2DA2E
		cmp	word_4CA61, 0
		jz	short loc_2DA2E
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	word_4CA61
		call	sub_D70E
		add	sp, 6

loc_2DA2E:
		pop	bp
		retf
Speech_LoadBank_2DA0B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2DA30		proc far
		push	bp
		mov	bp, sp
		cmp	byte_4F554, 0
		jz	short loc_2DA4D
		cmp	word_4CA61, 0
		jz	short loc_2DA4D
		push	word_4CA61
		call	sub_D989
		add	sp, 2

loc_2DA4D:
		pop	bp
		retf
sub_2DA30		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2DA4F		proc far

var_1		= byte ptr -1

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	[bp+var_1], 0
		cmp	byte_4F554, 0
		jz	short loc_2DA76
		cmp	word_4CA61, 0
		jz	short loc_2DA76
		push	word_4CA61
		call	sub_DA7B
		add	sp, 2
		mov	[bp+var_1], al

loc_2DA76:
		mov	al, [bp+var_1]
		leave
		retf
sub_2DA4F		endp

; START OF FUNCTION CHUNK FOR sub_2DA4F
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_2DA4F

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2DA7D		proc far
		push	bp
		mov	bp, sp
		cmp	byte_4F555, 0
		jz	short loc_2DA9F
		cmp	word_4CA5F, 0
		jz	short loc_2DA9F
		mov	byte_4F555, 0
		push	word_4CA5F
		call	sub_47C49
		add	sp, 2

loc_2DA9F:
		pop	bp
		retf
sub_2DA7D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2DAA1		proc far
		push	bp
		mov	bp, sp
		cmp	byte_4F555, 0
		jz	short loc_2DABE
		cmp	word_4CA5F, 0
		jz	short loc_2DABE
		push	word_4CA5F
		call	sub_47C49
		add	sp, 2

loc_2DABE:
		cmp	byte_4F557, 0
		jz	short loc_2DAD8
		cmp	word_4CA65, 0
		jz	short loc_2DAD8
		push	word_4CA65
		call	sub_487F2
		add	sp, 2

loc_2DAD8:
		pop	bp
		retf
sub_2DAA1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2DADA		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		cmp	word_4CA63, 0
		jz	short loc_2DAF6
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	word_4CA63
		call	sub_48904
		add	sp, 6

loc_2DAF6:
		pop	bp
		retf
sub_2DADA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2DAF8		proc far

var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= byte ptr  0Ch
arg_8		= byte ptr  0Eh
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	[bp+var_1], 0
		cmp	byte_4F556, 0
		jz	short loc_2DB33
		cmp	word_4CA63, 0
		jz	short loc_2DB33
		push	[bp+arg_A]
		mov	al, [bp+arg_8]
		push	ax
		mov	al, [bp+arg_6]
		push	ax
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	word_4CA63
		call	sub_2E842
		add	sp, 0Eh
		mov	[bp+var_1], al

loc_2DB33:
		mov	al, [bp+var_1]
		leave
		retf
sub_2DAF8		endp

; START OF FUNCTION CHUNK FOR sub_2DAF8
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_2DAF8

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2DB3A		proc far

var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= byte ptr  0Ch
arg_8		= byte ptr  0Eh
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	[bp+var_1], 0
		cmp	byte_4F557, 0
		jz	short loc_2DB75
		cmp	word_4CA63, 0
		jz	short loc_2DB75
		push	[bp+arg_A]
		mov	al, [bp+arg_8]
		push	ax
		mov	al, [bp+arg_6]
		push	ax
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	word_4CA63
		call	sub_2E842
		add	sp, 0Eh
		mov	[bp+var_1], al

loc_2DB75:
		mov	al, [bp+var_1]
		leave
		retf
sub_2DB3A		endp

; START OF FUNCTION CHUNK FOR sub_2DB3A
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_2DB3A

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2DB7C		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		cmp	word_4CA63, 0
		jz	short loc_2DB99
		mov	ax, [bp+arg_0]
		mov	[bp+var_2], ax
		mov	bx, word_4CA63
		mov	ax, [bp+var_2]
		mov	[bx+52h], ax

loc_2DB99:
		leave
		retf
sub_2DB7C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2DB9B		proc far

var_1		= byte ptr -1
arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	[bp+var_1], 0
		cmp	word_4CA63, 0
		jz	short loc_2DBBF
		mov	al, [bp+arg_0]
		push	ax
		push	word_4CA63
		call	sub_2ED05
		add	sp, 4
		mov	[bp+var_1], al

loc_2DBBF:
		mov	al, [bp+var_1]
		leave
		retf
sub_2DB9B		endp

; START OF FUNCTION CHUNK FOR sub_2DB9B
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_2DB9B

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2DBC6		proc far
		push	bp
		mov	bp, sp
		cmp	word_4CA63, 0
		jz	short loc_2DBEE
		mov	bx, word_4CA63
		cmp	word ptr [bx+35h], 0
		jz	short loc_2DBEE
		mov	bx, word_4CA63
		mov	bx, [bx+35h]
		push	word ptr [bx+4]
		call	sub_506B
		add	sp, 2
		jmp	short loc_2DBEE

loc_2DBEE:
		pop	bp
		retf
sub_2DBC6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2DBF0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte_4F555, 0
		jz	short loc_2DC11
		cmp	word_4CA5F, 0
		jz	short loc_2DC11
		push	word_4CA5F
		call	sub_D2A2
		add	sp, 2

loc_2DC11:
		pop	si
		pop	bp
		retf
sub_2DBF0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2DC14		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, word_4CA5D
		cmp	ax, word_4CA59
		jz	short loc_2DC3E
		cmp	word_4CA5D, 0
		jz	short loc_2DC3E
		push	3
		push	word_4CA5D
		mov	bx, word_4CA5D
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_2DC3E

loc_2DC3E:
		cmp	word_4CA5F, 0
		jz	short loc_2DC58
		push	3
		push	word_4CA5F
		mov	bx, word_4CA5F
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_2DC58

loc_2DC58:
		mov	word_4CA5F, 0
		cmp	word_4CA61, 0
		jz	short loc_2DC78
		push	3
		push	word_4CA61
		mov	bx, word_4CA61
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_2DC78

loc_2DC78:
		mov	word_4CA61, 0
		cmp	word_4CA59, 0
		jz	short loc_2DC98
		push	3
		push	word_4CA59
		mov	bx, word_4CA59
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_2DC98

loc_2DC98:
		cmp	word_4CA5B, 0
		jz	short loc_2DCB2
		push	3
		push	word_4CA5B
		mov	bx, word_4CA5B
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_2DCB2

loc_2DCB2:
		push	3
		push	word_4CA65
		call	sub_487CF
		add	sp, 4
		mov	word_4CA65, 0
		xor	ax, ax
		mov	word_4CA5D, ax
		mov	word_4CA5B, ax
		mov	word_4CA59, ax
		pop	si
		pop	bp
		retf
sub_2DC14		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2DCD4		proc far
		push	bp
		mov	bp, sp
		mov	word_4CA59, 0
		mov	word_4CA5B, 0
		mov	byte_4CA58, 0
		pop	bp
		retf
sub_2DCD4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2DCEA		proc far
		push	bp
		mov	bp, sp
		push	6AF4h
sub_2DCEA		endp
seg075		ends

ovr318		segment	para public 'OVERLAY' use16
		assume cs:ovr318
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B0D40		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	[bp+arg_4]
		push	large [bp+arg_0]
		call	sub_7437A
		add	sp, 6
		pop	bp
		retf
sub_B0D40		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 9 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PlayerComponentVariantR_ConstructAndInit_A0DBA
; (sub_A0DBA de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, alloue (sub_658), initialise deux classes de base (sub_3C9BC, sub_3DC27),
; appelle sub_45A57, enregistre dans un conteneur (sub_6C00E), dispatch vtable [bx+8],
; sub_3D566.
; ==============================================================================================
PlayerComponentVariantR_ConstructAndInit_B0D54		proc far

var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	6Ah
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_B0DA2
		push	ax
		call	sub_3B1B6
		pop	cx
		mov	word ptr [si+52h], 0
		mov	word ptr [si], 2058h
		push	si
		call	sub_3C494
		pop	cx
		mov	word ptr [si], 2658h
		mov	word ptr [si+5Ch], 0
		push	large [bp+var_4]
		push	si
		call	sub_4353C
		add	sp, 6
		mov	ax, si
		jmp	short loc_B0DA4

loc_B0DA2:
		mov	ax, si

loc_B0DA4:
		mov	si, ax
		push	ax
		push	large [bp+arg_0]
		call	sub_741DE
		add	sp, 6
		push	si
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+49h]
		mov	bx, es:[bx+49h]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_6], ax
		mov	[si+52h], ax
		push	si
		call	SmokeTrail_EnableIfModelHasSmok_3BD75
		pop	cx
		mov	ax, si
		pop	si
		leave
		retf
PlayerComponentVariantR_ConstructAndInit_B0D54		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B0DD9		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_B0DD9		endp
ovr318		ends

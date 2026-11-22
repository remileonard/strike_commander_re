seg121		segment	para public 'CODE' use16
		assume cs:seg121
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 3, 0E9h, 59h, 0FFh, 0B0h, 0

loc_50696:
		pop	si
		leave
		retf

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Timer_SetAbsolute_4F9A2
; (sub_4F9A2 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, écrit une valeur dword (copiée depuis un pointeur far arg) dans un objet
; minuteur générique et pose son mode à 0 (absolu).
; ==============================================================================================
Timer_SetAbsolute_50699		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	eax, [di]
		mov	[si], eax
		mov	byte ptr [si+4], 0
		pop	di
		pop	si
		pop	bp
		retf
Timer_SetAbsolute_50699		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Timer_SetRelativeFrames_4F9BB (sub_4F9BB de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, convertit un nombre de frames (word) en
; valeur fixe 8.8 (<<8), l'écrit dans l'objet minuteur, pose le mode à 1 (relatif/frames).
; ==============================================================================================
Timer_SetRelativeFrames_506B2		proc far

var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		movsx	eax, [bp+var_2]
		shl	eax, 8
		mov	[bp+var_6], eax
		mov	eax, [bp+var_6]
		mov	[si], eax
		mov	byte ptr [si+4], 1
		pop	si
		leave
		retf
Timer_SetRelativeFrames_506B2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Timer_Tick_4F9E6
; (sub_4F9E6 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, décrémente le minuteur selon son mode (dword_70458 = temps global si mode0,
; 0x100 = 1 frame fixe si mode1, sinon force à 0), retourne si le minuteur est encore actif
; (valeur>0). Utilisé par EjectSeat_TickReleaseObject_4F351 (même sémantique de champ +0x55).
; ==============================================================================================
Timer_Tick_506DD		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	al, [si+4]
		mov	ah, 0
		or	ax, ax
		jz	short loc_506F7
		cmp	ax, 1
		jz	short loc_50700
		jmp	short loc_50709

loc_506F7:
		mov	eax, dword_7976E
		sub	[si], eax
		jmp	short loc_50718

loc_50700:
		sub	dword ptr [si], 100h
		jmp	short loc_50718

loc_50709:
		mov	[bp+var_4], 0
		mov	eax, [bp+var_4]
		mov	[si], eax

loc_50718:
		cmp	dword ptr [si], 0
		jle	short loc_50723
		mov	ax, 1
		jmp	short loc_50725

loc_50723:
		xor	ax, ax

loc_50725:
		pop	si
		leave
		retf
Timer_Tick_506DD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Timer_SetAbsoluteFarPtr_4FA31 (sub_4FA31 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, variante de Timer_SetAbsolute écrivant via un
; pointeur far (es:bx) au lieu de si direct.
; ==============================================================================================
Timer_SetAbsoluteFarPtr_50728		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		mov	eax, [si]
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		les	bx, [bp+arg_0]
		mov	es:[bx], eax
		mov	byte ptr es:[bx+4], 0
		pop	si
		leave
		retf
Timer_SetAbsoluteFarPtr_50728		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5074C		proc far

var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 6
		mov	ax, [bp+arg_4]
		mov	[bp+var_2], ax
		movsx	eax, [bp+var_2]
		shl	eax, 8
		mov	[bp+var_6], eax
		mov	eax, [bp+var_6]
		les	bx, [bp+arg_0]
		mov	es:[bx], eax
		mov	byte ptr es:[bx+4], 1
		leave
		retf
sub_5074C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Timer_TickFarPtr_4FA80 (sub_4FA80 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, variante far-
; pointeur (es:bx) de Timer_Tick.
; ==============================================================================================
Timer_TickFarPtr_50777		proc far

var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 14h
		mov	eax, [bp+arg_0]
		mov	[bp+var_8], eax
		les	bx, word ptr [bp+var_8]
		mov	eax, es:[bx]
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_4], eax
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+4]
		mov	ah, 0
		or	ax, ax
		jz	short loc_507AC
		cmp	ax, 1
		jz	short loc_507B6
		jmp	short loc_507C0

loc_507AC:
		mov	eax, dword_7976E
		sub	[bp+var_4], eax
		jmp	short loc_507D0

loc_507B6:
		sub	[bp+var_4], 100h
		jmp	short loc_507D0

loc_507C0:
		mov	[bp+var_10], 0
		mov	eax, [bp+var_10]
		mov	[bp+var_4], eax

loc_507D0:
		mov	eax, [bp+var_4]
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx], eax
		cmp	[bp+var_4], 0
		jle	short loc_507EF
		mov	ax, 1
		jmp	short loc_507F1

loc_507EF:
		xor	ax, ax

loc_507F1:
		leave
		retf
Timer_TickFarPtr_50777		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Timer_SetAbsoluteAndResetPulses_4FAFC (sub_4FAFC de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, appelle Timer_SetAbsolute puis remet à zéro
; 4 octets de compteurs/flags de pulsation (+5..+8) de l'objet.
; ==============================================================================================
Timer_SetAbsoluteAndResetPulses_507F3		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr Timer_SetAbsolute_50699
		add	sp, 4
		mov	byte ptr [si+5], 0
		mov	byte ptr [si+6], 0
		mov	byte ptr [si+7], 0
		mov	byte ptr [si+8], 0
		pop	si
		pop	bp
		retf
Timer_SetAbsoluteAndResetPulses_507F3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_50818		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr Timer_SetRelativeFrames_506B2
		add	sp, 4
		mov	byte ptr [si+5], 0
		mov	byte ptr [si+6], 0
		mov	byte ptr [si+7], 0
		mov	byte ptr [si+8], 0
		pop	si
		pop	bp
		retf
sub_50818		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5083D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		inc	byte ptr [si+5]
		inc	byte ptr [si+6]
		cmp	byte ptr [si+5], 5
		jnz	short loc_5085A
		mov	byte ptr [si+7], 1
		mov	byte ptr [si+5], 0
		jmp	short loc_5085E

loc_5085A:
		mov	byte ptr [si+7], 0

loc_5085E:
		cmp	byte ptr [si+6], 0Ah
		jnz	short loc_5086E
		mov	byte ptr [si+8], 1
		mov	byte ptr [si+6], 0
		jmp	short loc_50872
sub_5083D		endp

; START OF FUNCTION CHUNK FOR sub_5083D

loc_5086E:
		db 0C6h
		inc	sp
; END OF FUNCTION CHUNK FOR sub_5083D
seg121		ends

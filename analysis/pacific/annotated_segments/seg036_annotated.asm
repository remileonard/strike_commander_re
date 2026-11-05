seg036		segment	para public 'CODE' use16
		assume cs:seg036
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1A8A1		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	byte_7730E, 1
		pop	bp
		retf
sub_1A8A1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 9 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Gauge_DrawNeedle (sub_17242 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,84L — calcule sin/cos
; d'un angle (+0x38, via sub_54876/sub_5483F) et projette un point à distance (di) du centre
; (+0x2A/+0x2C) : dessin d'une aiguille/marqueur sur un cadran circulaire (instrument
; analogique du cockpit).
; ==============================================================================================
Gauge_DrawNeedle		proc far

var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 26h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [si+5Eh]
		mov	[bp+var_6], ax
		movsx	eax, [bp+var_6]
		shl	eax, 8
		mov	[bp+var_4], eax
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_A]
		push	ax
		call	sub_566A3
		add	sp, 6
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_E]
		push	ax
		call	Math_CosDeg_5666C
		add	sp, 6
		mov	[bp+var_12], di
		movsx	eax, [bp+var_12]
		mov	edx, [bp+var_A]
		imul	edx, eax
		mov	[bp+var_16], edx
		mov	eax, [bp+var_16]
		mov	[bp+var_1A], eax
		mov	ax, word ptr [bp+var_1A+1]
		mov	[bp+var_10], ax
		mov	[bp+var_1E], di
		movsx	eax, [bp+var_1E]
		mov	edx, [bp+var_E]
		imul	edx, eax
		mov	[bp+var_22], edx
		mov	eax, [bp+var_22]
		mov	[bp+var_26], eax
		mov	ax, word ptr [bp+var_26+1]
		mov	[bp+var_1C], ax
		mov	al, [bp+arg_4]
		push	ax
		mov	ax, [si+3Eh]
		add	ax, [bp+var_1C]
		push	ax
		mov	ax, [si+3Ch]
		add	ax, [bp+var_10]
		push	ax
		push	word ptr [si+3Eh]
		push	word ptr [si+3Ch]
		mov	ax, si
		add	ax, 12h
		push	ax
		call	sub_69F22
		add	sp, 0Ch
		pop	di
		pop	si
		leave
		retf
Gauge_DrawNeedle		endp

; ----------------------------------------------------------------------

sub_1A95F		proc far
		push	bp
sub_1A95F		endp
seg036		ends

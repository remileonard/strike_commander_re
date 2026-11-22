ovr251		segment	para public 'OVERLAY' use16
		assume cs:ovr251
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_93970		proc far

var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 16h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [si+0E6h]
		cmp	ax, [bp+arg_2]
		jnz	short loc_93990
		mov	al, byte_7709E
		mov	ah, 0
		or	ax, ax
		jz	short loc_93990
		jmp	loc_93AAE

loc_93990:
		push	[bp+arg_2]
		push	si
		call	sub_735AF
		add	sp, 4
		push	[bp+arg_2]
		push	si
		call	sub_735B4
		add	sp, 4
		mov	ax, si
		add	ax, 104h
		push	ax
		call	Matrix_BuildFromAngle_58B3B
		pop	cx
		mov	ax, [bp+arg_2]
		imul	ax, ax, 1Dh
		mov	di, [si+0F4h]
		add	di, ax
		mov	ax, [di+0Fh]
		mov	[bp+var_2], ax
		movsx	eax, [bp+var_2]
		shl	eax, 8
		mov	[bp+var_6], eax
		lea	ax, word ptr [bp+var_6]
		push	ax
		mov	ax, [di+0Dh]
		mov	[bp+var_8], ax
		movsx	eax, [bp+var_8]
		shl	eax, 8
		mov	[bp+var_C], eax
		lea	ax, word ptr [bp+var_C]
		push	ax
		mov	ax, [di+0Bh]
		mov	[bp+var_E], ax
		movsx	eax, [bp+var_E]
		shl	eax, 8
		mov	[bp+var_12], eax
		lea	ax, word ptr [bp+var_12]
		push	ax
		mov	ax, si
		add	ax, 104h
		push	ax
		call	Matrix_BuildFullOrientation_5937B
		add	sp, 8
		mov	eax, [di+11h]
		mov	[si+128h], eax
		mov	eax, [di+15h]
		mov	[si+12Ch], eax
		mov	eax, [di+19h]
		mov	[si+130h], eax
		sub	sp, 4
		mov	ax, di
		add	ax, 3
		mov	[bp+var_14], ax
		mov	bx, [bp+var_14]
		mov	eax, [bx]
		mov	[bp+var_1E], eax
		sub	sp, 4
		mov	ax, [di+1]
		mov	[bp+var_16], ax
		movsx	eax, [bp+var_16]
		shl	eax, 8
		mov	[bp+var_22], eax
		push	word ptr [si+1Eh]
		call	sub_73DD8
		add	sp, 0Ah
		mov	ax, [di+7]
		mov	bx, [si+1Eh]
		mov	[bx+8], ax
		mov	ax, [di+9]
		mov	[bx+0Ah], ax
		mov	ax, [bp+arg_2]
		mov	[si+0E6h], ax
		mov	[si+1E1h], ax
		mov	byte ptr [si+1E0h], 1
		mov	al, [si+1E1h]
		push	ax
		mov	ax, si
		add	ax, 22h
		push	ax
		call	sub_17BA6
		add	sp, 4
		mov	al, byte_76D13
		mov	ah, 0
		or	ax, ax
		jnz	short loc_93AAE
		call	Mouse_InitAndRead
		xor	ax, ax
		mov	[si+150h], ax
		mov	[si+152h], ax

loc_93AAE:
		pop	di
		pop	si
		leave
		retf
sub_93970		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_93AB2		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, [si+100h]
		mov	ah, 0
		cmp	ax, 0FFFFh
		jz	short loc_93AF5
		cmp	byte ptr [si+1DFh], 0
		jz	short loc_93AED
		inc	word ptr [si+1E1h]
		cmp	word ptr [si+1E1h], 2
		jle	short loc_93ADC
		mov	word ptr [si+1E1h], 0

loc_93ADC:
		cmp	word ptr [si+0E4h], 1
		jle	short loc_93AFB
		mov	al, [si+1E1h]
		mov	[si+100h], al
		jmp	short loc_93AFB

loc_93AED:
		mov	word ptr [si+1E1h], 0
		jmp	short loc_93AFB

loc_93AF5:
		mov	word ptr [si+1E1h], 0

loc_93AFB:
		push	si
		nop
		push	cs
		call	near ptr sub_93B69
		pop	cx
		pop	si
		pop	bp
		retf
sub_93AB2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 10 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à HUDSymbol_Helper12_85014 (sub_85014 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, aucun appel
; externe visible (41 lignes).
; ==============================================================================================
HUDSymbol_Helper12_93B05		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	bx, [si+1Eh]
		mov	eax, [bx+8]
		mov	[si+176h], eax
		mov	eax, [bx+0Ch]
		mov	[si+15Eh], eax
		mov	eax, [bx+10h]
		mov	[si+162h], eax
		mov	eax, [bx]
		mov	[si+15Ah], eax
		mov	ax, [bx+61h]
		mov	[si+154h], ax
		mov	eax, [bx+64h]
		mov	[si+156h], eax
		mov	eax, [bx+68h]
		mov	[si+166h], eax
		mov	eax, [bx+6Ch]
		mov	[si+16Ah], eax
		mov	eax, [bx+70h]
		mov	[si+16Eh], eax
		mov	eax, [bx+74h]
		mov	[si+172h], eax
		pop	si
		pop	bp
		retf
HUDSymbol_Helper12_93B05		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_93B69		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+1DFh], 1
		cmp	byte ptr [si+100h], 0FFh
		jz	short loc_93B8D
		mov	al, [si+100h]
		mov	ah, 0
		push	ax
		push	si
		push	cs
		call	near ptr sub_93970
		add	sp, 4
		jmp	short loc_93B97

loc_93B8D:
		push	0
		push	si
		push	cs
		call	near ptr sub_93970
		add	sp, 4

loc_93B97:
		push	si
		push	cs
		call	near ptr HUDSymbol_Helper12_93B05
		pop	cx
		pop	si
		pop	bp
		retf
sub_93B69		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 12 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Cockpit_PanElevationFrame_85103 (sub_85103 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine Cockpit_PanElevationUpdate et Camera_PanTransitionExtended — mise à jour du
; panoramique caméra en élévation.
; ==============================================================================================
Cockpit_PanElevationFrame_93BA0		proc far

var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 20h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	eax, [si+196h]
		cmp	eax, [si+19Ah]
		jl	short loc_93BBC
		mov	ax, 1
		jmp	short loc_93BBE

loc_93BBC:
		xor	ax, ax

loc_93BBE:
		or	al, al
		jz	short loc_93C1D
		mov	di, si
		add	di, 196h
		mov	eax, [si+192h]
		sub	eax, [di]
		mov	[bp+var_8], eax
		mov	[bp+var_C], eax
		mov	[bp+var_4], eax
		mov	di, si
		add	di, 19Ah
		mov	eax, [si+192h]
		sub	eax, [di]
		mov	[bp+var_10], eax
		mov	[bp+var_14], eax
		mov	eax, [bp+var_4]
		mov	edx, eax
		mov	ecx, [bp+var_14]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_4], eax
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	64DEh
		call	Cockpit_PanAzimuthUpdate_2E495
		add	sp, 4
		jmp	short loc_93C6E

loc_93C1D:
		mov	[bp+var_18], 100h
		mov	eax, [bp+var_18]
		mov	[bp+var_4], eax
		mov	di, si
		add	di, 19Ah
		mov	eax, [si+196h]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_20], eax
		sub	[bp+var_4], eax
		push	0
		push	0
		push	0
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	64DEh
		call	Camera_PanTransitionExtended
		add	sp, 0Ah

loc_93C6E:
		pop	di
		pop	si
		leave
		retf
Cockpit_PanElevationFrame_93BA0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 6 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Camera_PanTransitionWrapper_851D5 (sub_851D5 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle Camera_PanTransitionExtended.
; ==============================================================================================
Camera_PanTransitionWrapper_93C72		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, si
		add	di, 196h
		mov	eax, [si+192h]
		sub	eax, [di]
		mov	[bp+var_8], eax
		mov	[bp+var_C], eax
		mov	[bp+var_4], eax
		mov	di, si
		add	di, 192h
		mov	eax, [bp+var_4]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_4], eax
		add	si, 1A0h
		mov	al, [si+2]
		push	ax
		mov	al, [si+1]
		push	ax
		mov	al, [si]
		push	ax
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	64DEh
		call	Camera_PanTransitionExtended
		add	sp, 0Ah
		pop	di
		pop	si
		leave
		retf
Camera_PanTransitionWrapper_93C72		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 6 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à HUDSymbol_Helper13_8523B (sub_8523B de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, aucun appel
; externe visible (48 lignes).
; ==============================================================================================
HUDSymbol_Helper13_93CD8		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si+18Eh]
		mov	edx, dword_7976E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		add	[si+196h], eax
		mov	eax, [si+196h]
		cmp	eax, [si+192h]
		jle	short loc_93D16
		mov	ax, 1
		jmp	short loc_93D18

loc_93D16:
		xor	ax, ax

loc_93D18:
		or	al, al
		jz	short loc_93D26
		mov	eax, [si+192h]
		mov	[si+196h], eax

loc_93D26:
		pop	si
		leave
		retf
HUDSymbol_Helper13_93CD8		endp
ovr251		ends

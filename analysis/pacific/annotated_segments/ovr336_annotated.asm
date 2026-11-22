ovr336		segment	para public 'OVERLAY' use16
		assume cs:ovr336
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 18 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PlayerComponent_ResetVisualStateDefaults_A5620
; (sub_A5620 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — ⚠️ far, 90 lignes, NON DÉTAILLÉE — réinitialise un large champ de flags (+0x75,
; plusieurs bits) et initialise 8 champs à des valeurs par défaut en virgule fixe 8.8 (0x100 =
; 1.0) — probable état visuel/matériau par défaut d'un composant.
; ==============================================================================================
PlayerComponent_ResetVisualStateDefaults_B8630		proc far

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
		mov	si, [bp+arg_0]
		mov	bx, [si]
		mov	word ptr [bx+1Eh], 0
		and	byte ptr [si+92h], 0FEh
		and	byte ptr [si+92h], 0FDh
		and	byte ptr [si+92h], 0FBh
		and	byte ptr [si+92h], 0F7h
		or	byte ptr [si+92h], 10h
		and	byte ptr [si+92h], 0DFh
		mov	byte ptr [bx+20h], 0
		and	byte ptr [si+92h], 0BFh
		and	word ptr [si+92h], 0FE7Fh
		or	word ptr [si+92h], 80h
		mov	[bp+var_4], 100h
		mov	eax, [bp+var_4]
		mov	dword_7CE1E, eax
		mov	[bp+var_8], 100h
		mov	eax, [bp+var_8]
		mov	dword_7CE22, eax
		mov	[bp+var_C], 100h
		mov	eax, [bp+var_C]
		mov	dword_7CE26, eax
		mov	[bp+var_10], 100h
		mov	eax, [bp+var_10]
		mov	dword_7CE2A, eax
		mov	[bp+var_14], 100h
		mov	eax, [bp+var_14]
		mov	dword_7CE2E, eax
		mov	[bp+var_18], 100h
		mov	eax, [bp+var_18]
		mov	dword_7CE32, eax
		mov	[bp+var_1C], 100h
		mov	eax, [bp+var_1C]
		mov	dword_7CE36, eax
		mov	byte ptr [si+85h], 0FFh
		mov	[bp+var_20], 0
		mov	eax, [bp+var_20]
		mov	[si+99h], eax
		mov	word ptr [si+9Dh], 96h
		mov	word ptr [si+9Fh], 19h
		mov	word ptr [si+0A1h], 4Bh
		mov	dword ptr [si+0A3h], 1B58h
		mov	byte ptr [si+0A7h], 3
		mov	byte ptr [si+0A8h], 2
		pop	si
		leave
		retf
PlayerComponent_ResetVisualStateDefaults_B8630		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B8722		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	ax, word_793EC
		mov	[bp+var_2], ax
		push	word ptr [si]
		call	sub_74EBA
		pop	cx
		push	si
		call	sub_74EFA
		pop	cx
		mov	bx, [si+10h]
		xor	eax, eax
		mov	[bx+0Ch], eax
		mov	[bx+8], eax
		mov	[bx+4], eax
		mov	ax, [si+10h]
		add	ax, 4
		mov	dword ptr [bx+14h], 100h
		push	si
		call	sub_74F63
		pop	cx
		push	si
		push	cs
		call	near ptr PlayerComponent_ResetVisualStateDefaults_B8630
		pop	cx
		mov	bx, [si]
		mov	ax, [bp+arg_2]
		mov	[bx+1Eh], ax
		mov	ax, [bp+var_2]
		mov	word_793EC, ax
		mov	[bx+22h], ax
		inc	word_793EC
		pop	si
		leave
		retf
sub_B8722		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B8786		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+arg_0]
		push	0E9h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_B879F
		jmp	loc_B8908

loc_B879F:
		add	ax, 0ABh
		mov	[si], ax
		mov	ax, si
		add	ax, 0D1h
		mov	[si+10h], ax
		mov	ax, si
		add	ax, 0ABh
		mov	[si+0D1h], ax
		mov	ax, si
		add	ax, 0ABh
		mov	[si+1Eh], ax
		mov	ax, si
		add	ax, 0D1h
		mov	[si+22h], ax
		mov	ax, si
		add	ax, 0ABh
		mov	[si+24h], ax
		mov	word ptr [si+0A9h], 0
		mov	word ptr [si+0CFh], 0
		mov	word ptr [si+0ABh], 1BAEh
		mov	ax, si
		add	ax, 0ABh
		push	ax
		call	sub_74EBA
		pop	cx
		mov	bx, [si]
		sub	word ptr [bx-2], 0FFC0h
		mov	word ptr [si+0D3h], 1B42h
		mov	bx, [si+0D1h]
		mov	word ptr [bx], 1B5Eh
		xor	eax, eax
		mov	[si+0DDh], eax
		mov	[si+0D9h], eax
		mov	[si+0D5h], eax
		mov	ax, si
		add	ax, 0D5h
		mov	dword ptr [si+0E5h], 100h
		mov	bx, [si]
		add	word ptr [bx-2], 0FFC0h
		sub	word ptr [bx-2], 8Bh
		mov	bx, [si+10h]
		sub	word ptr [bx-2], 8Bh
		mov	bx, [si]
		sub	word ptr [bx-2], 0Eh
		mov	word ptr [si+2], 1A22h
		mov	word ptr [bx], 1A52h
		push	si
		call	sub_74EFA
		pop	cx
		mov	bx, [si]
		add	word ptr [bx-2], 0Eh
		mov	word ptr [si+2], 1AA2h
		mov	word ptr [bx], 1AD6h
		mov	bx, [si+10h]
		mov	word ptr [bx+2], 1B26h
		push	si
		call	sub_74F63
		pop	cx
		mov	bx, [si+10h]
		mov	dword ptr [bx+14h], 100h
		mov	bx, [si]
		add	word ptr [bx-2], 8Bh
		mov	bx, [si+10h]
		add	word ptr [bx-2], 8Bh
		mov	bx, [si]
		sub	word ptr [bx-2], 87h
		mov	word ptr [si+20h], 19B6h
		mov	bx, [si+1Eh]
		mov	word ptr [bx], 19D2h
		mov	bx, [si]
		add	word ptr [bx-2], 87h
		sub	word ptr [bx-2], 65h
		mov	bx, [si+10h]
		sub	word ptr [bx-2], 65h
		mov	word ptr [si+26h], 192Ah
		mov	bx, [si+24h]
		mov	word ptr [bx], 194Ah
		mov	bx, [si+22h]
		mov	word ptr [bx+2], 199Ah
		mov	dword ptr [bx+14h], 100h
		mov	byte ptr [si+37h], 0FFh
		mov	bx, [si]
		add	word ptr [bx-2], 65h
		mov	bx, [si+10h]
		add	word ptr [bx-2], 65h
		mov	word ptr [si+2], 1BFEh
		mov	word ptr [si+20h], 1C4Ah
		mov	word ptr [si+26h], 1C66h
		mov	bx, [si]
		mov	word ptr [bx], 1C86h
		mov	bx, [si+10h]
		mov	word ptr [bx+2], 1CD6h
		push	si
		push	cs
		call	near ptr PlayerComponent_ResetVisualStateDefaults_B8630
		pop	cx
		mov	bx, [si+10h]
		mov	dword ptr [bx+14h], 100h
		mov	byte ptr [si+37h], 0FFh
		mov	ax, si
		jmp	short loc_B890A

loc_B8908:
		mov	ax, si

loc_B890A:
		mov	si, ax
		or	si, si
		jz	short loc_B8914
		mov	ax, [si]
		jmp	short loc_B8916

loc_B8914:
		mov	ax, si

loc_B8916:
		pop	si
		pop	bp
		retf
sub_B8786		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B8919		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	ax, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		push	0E9h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_B893B
		jmp	loc_B8AA9

loc_B893B:
		add	ax, 0ABh
		mov	[si], ax
		mov	ax, si
		add	ax, 0D1h
		mov	[si+10h], ax
		mov	ax, si
		add	ax, 0ABh
		mov	[si+0D1h], ax
		mov	ax, si
		add	ax, 0ABh
		mov	[si+1Eh], ax
		mov	ax, si
		add	ax, 0D1h
		mov	[si+22h], ax
		mov	ax, si
		add	ax, 0ABh
		mov	[si+24h], ax
		mov	word ptr [si+0A9h], 0
		mov	word ptr [si+0CFh], 0
		mov	word ptr [si+0ABh], 1BAEh
		mov	ax, si
		add	ax, 0ABh
		push	ax
		call	sub_74EBA
		pop	cx
		mov	bx, [si]
		sub	word ptr [bx-2], 0FFC0h
		mov	word ptr [si+0D3h], 1B42h
		mov	bx, [si+0D1h]
		mov	word ptr [bx], 1B5Eh
		xor	eax, eax
		mov	[si+0DDh], eax
		mov	[si+0D9h], eax
		mov	[si+0D5h], eax
		mov	ax, si
		add	ax, 0D5h
		mov	dword ptr [si+0E5h], 100h
		mov	bx, [si]
		add	word ptr [bx-2], 0FFC0h
		sub	word ptr [bx-2], 8Bh
		mov	bx, [si+10h]
		sub	word ptr [bx-2], 8Bh
		mov	bx, [si]
		sub	word ptr [bx-2], 0Eh
		mov	word ptr [si+2], 1A22h
		mov	word ptr [bx], 1A52h
		push	si
		call	sub_74EFA
		pop	cx
		mov	bx, [si]
		add	word ptr [bx-2], 0Eh
		mov	word ptr [si+2], 1AA2h
		mov	word ptr [bx], 1AD6h
		mov	bx, [si+10h]
		mov	word ptr [bx+2], 1B26h
		push	si
		call	sub_74F63
		pop	cx
		mov	bx, [si+10h]
		mov	dword ptr [bx+14h], 100h
		mov	bx, [si]
		add	word ptr [bx-2], 8Bh
		mov	bx, [si+10h]
		add	word ptr [bx-2], 8Bh
		mov	bx, [si]
		sub	word ptr [bx-2], 87h
		mov	word ptr [si+20h], 19B6h
		mov	bx, [si+1Eh]
		mov	word ptr [bx], 19D2h
		mov	bx, [si]
		add	word ptr [bx-2], 87h
		sub	word ptr [bx-2], 65h
		mov	bx, [si+10h]
		sub	word ptr [bx-2], 65h
		mov	word ptr [si+26h], 192Ah
		mov	bx, [si+24h]
		mov	word ptr [bx], 194Ah
		mov	bx, [si+22h]
		mov	word ptr [bx+2], 199Ah
		mov	dword ptr [bx+14h], 100h
		mov	byte ptr [si+37h], 0FFh
		mov	bx, [si]
		add	word ptr [bx-2], 65h
		mov	bx, [si+10h]
		add	word ptr [bx-2], 65h
		mov	word ptr [si+2], 1BFEh
		mov	word ptr [si+20h], 1C4Ah
		mov	word ptr [si+26h], 1C66h
		mov	bx, [si]
		mov	word ptr [bx], 1C86h
		mov	bx, [si+10h]
		mov	word ptr [bx+2], 1CD6h
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr sub_B8722
		add	sp, 4
		mov	bx, [si+10h]
		mov	dword ptr [bx+14h], 100h
		mov	byte ptr [si+37h], 0FFh
		mov	ax, si
		jmp	short loc_B8AAB

loc_B8AA9:
		mov	ax, si

loc_B8AAB:
		mov	si, ax
		or	si, si
		jz	short loc_B8AB5
		mov	ax, [si]
		jmp	short loc_B8AB7

loc_B8AB5:
		mov	ax, si

loc_B8AB7:
		pop	si
		leave
		retf
sub_B8919		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B8ABA		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		push	0E9h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_B8ADD
		jmp	loc_B8C4B

loc_B8ADD:
		add	ax, 0ABh
		mov	[di], ax
		mov	ax, di
		add	ax, 0D1h
		mov	[di+10h], ax
		mov	ax, di
		add	ax, 0ABh
		mov	[di+0D1h], ax
		mov	ax, di
		add	ax, 0ABh
		mov	[di+1Eh], ax
		mov	ax, di
		add	ax, 0D1h
		mov	[di+22h], ax
		mov	ax, di
		add	ax, 0ABh
		mov	[di+24h], ax
		mov	word ptr [di+0A9h], 0
		mov	word ptr [di+0CFh], 0
		mov	word ptr [di+0ABh], 1BAEh
		mov	ax, di
		add	ax, 0ABh
		push	ax
		call	sub_74EBA
		pop	cx
		mov	bx, [di]
		sub	word ptr [bx-2], 0FFC0h
		mov	word ptr [di+0D3h], 1B42h
		mov	bx, [di+0D1h]
		mov	word ptr [bx], 1B5Eh
		xor	eax, eax
		mov	[di+0DDh], eax
		mov	[di+0D9h], eax
		mov	[di+0D5h], eax
		mov	ax, di
		add	ax, 0D5h
		mov	dword ptr [di+0E5h], 100h
		mov	bx, [di]
		add	word ptr [bx-2], 0FFC0h
		sub	word ptr [bx-2], 8Bh
		mov	bx, [di+10h]
		sub	word ptr [bx-2], 8Bh
		mov	bx, [di]
		sub	word ptr [bx-2], 0Eh
		mov	word ptr [di+2], 1A22h
		mov	word ptr [bx], 1A52h
		push	di
		call	sub_74EFA
		pop	cx
		mov	bx, [di]
		add	word ptr [bx-2], 0Eh
		mov	word ptr [di+2], 1AA2h
		mov	word ptr [bx], 1AD6h
		mov	bx, [di+10h]
		mov	word ptr [bx+2], 1B26h
		push	di
		call	sub_74F63
		pop	cx
		mov	bx, [di+10h]
		mov	dword ptr [bx+14h], 100h
		mov	bx, [di]
		add	word ptr [bx-2], 8Bh
		mov	bx, [di+10h]
		add	word ptr [bx-2], 8Bh
		mov	bx, [di]
		sub	word ptr [bx-2], 87h
		mov	word ptr [di+20h], 19B6h
		mov	bx, [di+1Eh]
		mov	word ptr [bx], 19D2h
		mov	bx, [di]
		add	word ptr [bx-2], 87h
		sub	word ptr [bx-2], 65h
		mov	bx, [di+10h]
		sub	word ptr [bx-2], 65h
		mov	word ptr [di+26h], 192Ah
		mov	bx, [di+24h]
		mov	word ptr [bx], 194Ah
		mov	bx, [di+22h]
		mov	word ptr [bx+2], 199Ah
		mov	dword ptr [bx+14h], 100h
		mov	byte ptr [di+37h], 0FFh
		mov	bx, [di]
		add	word ptr [bx-2], 65h
		mov	bx, [di+10h]
		add	word ptr [bx-2], 65h
		mov	word ptr [di+2], 1BFEh
		mov	word ptr [di+20h], 1C4Ah
		mov	word ptr [di+26h], 1C66h
		mov	bx, [di]
		mov	word ptr [bx], 1C86h
		mov	bx, [di+10h]
		mov	word ptr [bx+2], 1CD6h
		push	[bp+var_2]
		push	di
		push	cs
		call	near ptr sub_B8722
		add	sp, 4
		mov	bx, [di+10h]
		mov	dword ptr [bx+14h], 100h
		mov	byte ptr [di+37h], 0FFh
		mov	ax, di
		jmp	short loc_B8C4D

loc_B8C4B:
		mov	ax, di

loc_B8C4D:
		mov	di, ax
		push	si
		push	ax
		nop
		push	cs
		call	near ptr PlayerComponent_LoadFieldsWithRetryL_B8D54
		add	sp, 4
		or	di, di
		jz	short loc_B8C61
		mov	ax, [di]
		jmp	short loc_B8C63

loc_B8C61:
		mov	ax, di

loc_B8C63:
		pop	di
		pop	si
		leave
		retf
sub_B8ABA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 58 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PlayerComponent_Helper_A5B8F (sub_A5B8F de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; 102L. Copie champ a champ d'une structure JDYN (di) vers une autre (si), dont +0x80..+0x8B.
; Seul lecteur de JDYN+0x8A dans tout le binaire (avec l'init par defaut a 3 en seg449 et la
; lecture du chunk) : JDYN+0x8A n'est jamais consomme.
; ==============================================================================================
PlayerComponent_Helper_B8C67		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	eax, [di+8Ah]
		mov	[si+8Ah], eax
		mov	eax, [di+44h]
		mov	[si+44h], eax
		mov	eax, [di+48h]
		mov	[si+48h], eax
		mov	eax, [di+4Ch]
		mov	[si+4Ch], eax
		mov	eax, [di+50h]
		mov	[si+50h], eax
		mov	eax, [di+54h]
		mov	[si+54h], eax
		mov	eax, [di+58h]
		mov	[si+58h], eax
		mov	eax, [di+8Eh]
		mov	[si+8Eh], eax
		mov	al, [di+5Ch]
		mov	[si+5Ch], al
		mov	al, [di+5Dh]
		mov	[si+5Dh], al
		mov	al, [di+5Eh]
		mov	[si+5Eh], al
		mov	eax, [di+5Fh]
		mov	[si+5Fh], eax
		mov	eax, [di+63h]
		mov	[si+63h], eax
		mov	al, [di+67h]
		mov	[si+67h], al
		mov	al, [di+68h]
		mov	[si+68h], al
		mov	al, [di+69h]
		mov	[si+69h], al
		mov	eax, [di+6Ah]
		mov	[si+6Ah], eax
		mov	eax, [di+6Eh]
		mov	[si+6Eh], eax
		mov	eax, [di+72h]
		mov	[si+72h], eax
		mov	al, [di+76h]
		mov	[si+76h], al
		mov	al, [di+77h]
		mov	[si+77h], al
		mov	al, [di+78h]
		mov	[si+78h], al
		mov	eax, [di+86h]
		mov	[si+86h], eax
		mov	ax, [di+9Dh]
		mov	[si+9Dh], ax
		mov	ax, [di+9Fh]
		mov	[si+9Fh], ax
		mov	ax, [di+0A1h]
		mov	[si+0A1h], ax
		mov	eax, [di+0A3h]
		mov	[si+0A3h], eax
		mov	al, [di+0A7h]
		mov	[si+0A7h], al
		mov	al, [di+0A8h]
		mov	[si+0A8h], al
		pop	di
		pop	si
		pop	bp
		retf
PlayerComponent_Helper_B8C67		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PlayerComponent_LoadFieldsWithRetryL_A5C76 (sub_A5C76 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far, 84 lignes, NON DÉTAILLÉE —
; initialise 4 sous-objets composites supplémentaires (sub_6CAC5/6CB05/6CB1E/6CB69/6CB46) et
; appelle PlayerComponent_Helper_A5B8F.
; ==============================================================================================
PlayerComponent_LoadFieldsWithRetryL_B8D54		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	di, di
		jz	short loc_B8D67
		mov	ax, [di]
		jmp	short loc_B8D69

loc_B8D67:
		mov	ax, di

loc_B8D69:
		push	ax
		push	word ptr [si]
		call	sub_74EB5
		add	sp, 4
		push	di
		push	si
		call	sub_74EF5
		add	sp, 4
		or	di, di
		jz	short loc_B8D87
		mov	ax, [di+10h]
		jmp	short loc_B8D89

loc_B8D87:
		mov	ax, di

loc_B8D89:
		push	ax
		push	word ptr [si+10h]
		call	sub_74F0E
		add	sp, 4
		push	di
		push	si
		call	sub_74F59
		add	sp, 4
		or	di, di
		jz	short loc_B8DAA
		mov	ax, di
		add	ax, 22h
		jmp	short loc_B8DAC

loc_B8DAA:
		mov	ax, di

loc_B8DAC:
		push	ax
		mov	ax, si
		add	ax, 22h
		push	ax
		call	sub_74F36
		add	sp, 4
		push	di
		push	si
		push	cs
		call	near ptr PlayerComponent_Helper_B8C67
		add	sp, 4
		pop	di
		pop	si
		pop	bp
		retf
PlayerComponent_LoadFieldsWithRetryL_B8D54		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B8DC8		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr sub_B8F86
		add	sp, 4
		mov	eax, [si+86h]
		mov	[si+8Ah], eax
		pop	si
		pop	bp
		retf
sub_B8DC8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 29 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à JDYN_ReadChunkFields_A5D18 (sub_A5D18 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,239L — LECTEUR
; DU CHUNK 'JDYN' (enveloppe de reglage de la cellule). seek_chunk('JDYN') puis 28 champs LE,
; payload disque = 73 octets (0x49). Champ 1 (disque 0x00 -> struct +0x69, copie en +0x6D) =
; CAPACITE CARBURANT en 24.8 (fait verifie cote donnees) ; +0x6D = carburant courant,
; decremente par sub_49242 (burn = 0xA00*throttle*[+0x33]>>16), clamp>=0, flameout
; ([jdyn+0x28]=0) si <=0. Champ 2 (+0x33) = coeff de consommation carburant. +0x37/+0x3B =
; trainee aerofrein/train (flags_75 bit0/bit2). +0x3F/+0x43 = coeffs de moment AU SOL (gates
; par flag [A+0x20]). +0x47 = limite +/- rate-limitee. +0x4B = seuil de sur-controle.
; +0x4C/+0x4D = trim / trim volets. +0x4E/+0x52/+0x56/+0x57/+0x58 = enveloppe de detection 'au
; sol'. +0x59 = altitude plafond effet de sol. +0x61 = taux de rotation de reference (/4).
; +0x65/+0x66 = coeffs x gains globaux dword_72A1C/72A18. +0x67 -> [jdyn+0x78]. +0x71 = taux
; de rotation/cap max (integre par dt). +0x80..+0x8B (defauts 500/100/231/11005/3/2) =
; PARAMETRES DE COMPORTEMENT DE L'IA DE VOL (lus via [pilotCtx+0x0B] depuis
; seg002/seg003/ovr231, jamais par la physique du joueur) : +0x80 (u16 500)=vitesse IA MAX de
; poursuite, +0x82 (u16 100)=vitesse IA MIN, +0x84 (i16 231)=vitesse de croisiere/manoeuvre IA
; + seuil de distance, +0x86 (u32 11005)=seuil de portee IA, +0x8A (u8 3)=param decision IA
; non localise, +0x8B (u8 2)=poids d'un score de decision IA. Detail : DATA_MODEL.md §6.2.
; +0x33 = conso carburant. +0x5D = coeff de reponse angulaire / maniabilite
; (Aero_ComputeMomentsWithFeedback sub_48400 L633/L678 : module l'accel angulaire =
; jdyn[+0x5D]*controlMoments^2). NB : le coeur aero (portance/trainee/moments) est dans seg102
; via FlightControl_ResolveNamedParam (table nommee par gouverne), PAS dans JDYN. Detail
; complet + citations : analysis/DATA_MODEL.md §6.2.
; ==============================================================================================
JDYN_ReadChunkFields_B8DE8		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	si
		push	cs
		call	near ptr PlayerComponent_ResetVisualStateDefaults_B8630
		pop	cx
		push	0
		push	large 4E59444Ah
		push	di
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_B8E11
		jmp	loc_B8F79

loc_B8E11:
		push	di
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+86h], eax
		push	di
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+44h], eax
		push	di
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+48h], eax
		push	di
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+4Ch], eax
		push	di
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+50h], eax
		push	di
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+54h], eax
		push	di
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+58h], eax
		push	di
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+8Eh], eax
		push	di
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	[si+5Ch], al
		push	di
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	[si+5Dh], al
		push	di
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	[si+5Eh], al
		push	di
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+5Fh], eax
		push	di
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+63h], eax
		push	di
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	[si+67h], al
		push	di
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	[si+68h], al
		push	di
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	[si+69h], al
		push	di
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+6Ah], eax
		push	di
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+6Eh], eax
		push	di
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+72h], eax
		push	di
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	[si+76h], al
		push	di
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	[si+77h], al
		push	di
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	[si+78h], al
		push	di
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[si+9Dh], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[si+9Fh], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[si+0A1h], ax
		push	di
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+0A3h], eax
		push	di
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	[si+0A7h], al
		push	di
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	[si+0A8h], al
		jmp	short loc_B8F82

loc_B8F79:
		push	0A005h
		call	sub_1DDFE
		pop	cx

loc_B8F82:
		pop	di
		pop	si
		pop	bp
		retf
JDYN_ReadChunkFields_B8DE8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B8F86		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		push	word ptr [si]
		call	sub_74EB0
		add	sp, 4
		push	di
		push	si
		call	sub_74EF0
		add	sp, 4
		push	di
		push	word ptr [si+10h]
		call	sub_74F09
		add	sp, 4
		push	di
		push	si
		call	sub_74F54
		add	sp, 4
		push	di
		mov	ax, si
		add	ax, 22h
		push	ax
		call	sub_74F31
		add	sp, 4
		push	di
		push	si
		push	cs
		call	near ptr JDYN_ReadChunkFields_B8DE8
		add	sp, 4
		pop	di
		pop	si
		pop	bp
		retf
sub_B8F86		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B8FD8		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_B8FD8		endp
ovr336		ends

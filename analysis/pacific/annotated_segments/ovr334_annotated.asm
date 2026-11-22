ovr334		segment	para public 'OVERLAY' use16
		assume cs:ovr334
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05 (corrige une reprise automatique erronée qui l'appelait ReadStblChunk :
; même suite d'instructions que le lecteur de STBL, mais elle cherche 'DYNM', push large
; 4D4E5944h). Lecteur du chunk DYNM (masse) : un u32 -> [si+1Ah] (STRIKE : [si+4],
; AircraftDynamics_ReadMassChunk_A4A20) ; erreur 0A001h si absent. Format de fichier inchangé.
; ==============================================================================================
AircraftDynamics_ReadMassChunk_B78C0		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr sub_B7924
		pop	cx
		push	0
		push	large 4D4E5944h
		push	di
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_B78F8
		push	di
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+1Ah], eax
		jmp	short loc_B7901

loc_B78F8:
		push	0A001h
		call	sub_1DDFE
		pop	cx

loc_B7901:
		pop	di
		pop	si
		pop	bp
		retf
AircraftDynamics_ReadMassChunk_B78C0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B7905		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr AircraftDynamics_ReadMassChunk_B78C0
		add	sp, 4
		mov	ax, word_793EC
		mov	[si+22h], ax
		inc	word_793EC
		pop	si
		pop	bp
		retf
sub_B7905		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B7924		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		xor	eax, eax
		mov	[si+0Ah], eax
		mov	[si+6], eax
		mov	[si+2], eax
		mov	word ptr [si+1Eh], 0
		mov	ax, word_793EC
		mov	[si+22h], ax
		inc	word_793EC
		pop	si
		pop	bp
		retf
sub_B7924		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B794C		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr sub_B7924
		pop	cx
		mov	ax, [bp+arg_2]
		mov	[si+1Eh], ax
		pop	si
		pop	bp
		retf
sub_B794C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 6 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PlayerComponent_Helper_A4ABC (sub_A4ABC de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; aucun appel externe visible (rôle exact non détaillé).
; ==============================================================================================
PlayerComponent_Helper_B7962		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	eax, [di+1Ah]
		mov	[si+1Ah], eax
		add	di, 2
		mov	eax, [di]
		mov	[si+2], eax
		mov	eax, [di+4]
		mov	[si+6], eax
		mov	eax, [di+8]
		mov	[si+0Ah], eax
		pop	di
		pop	si
		pop	bp
		retf
PlayerComponent_Helper_B7962		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B7993		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		or	si, si
		jz	short loc_B79B1
		mov	word ptr [si], 1BAEh
		test	ax, 1
		jz	short loc_B79B1
		push	si
		call	sub_3B2
		pop	cx

loc_B79B1:
		pop	si
		pop	bp
		retf
sub_B7993		endp
ovr334		ends

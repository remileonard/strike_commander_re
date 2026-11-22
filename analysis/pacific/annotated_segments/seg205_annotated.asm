seg205		segment	para public 'CODE' use16
		assume cs:seg205
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 8, 8Bh, 46h, 6, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6D586		proc far

var_80		= word ptr -80h
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 80h
		push	si
		mov	si, [bp+arg_0]
		xor	dx, dx
		cmp	word ptr [si+7Ch], 0
		jz	short loc_6D59F
		mov	dx, [si+7Ch]
		add	dx, 6

loc_6D59F:
		mov	ax, si
		add	ax, 6Dh
		push	ax
		push	dx
		mov	ax, si
		add	ax, 0Ah
		push	ax
		push	4AA6h
		lea	ax, [bp+var_80]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 0Ah
		lea	ax, [bp+var_80]
		push	ax
		mov	ax, si
		add	ax, 6
		push	ax
		call	sub_765AF
		add	sp, 4
		push	si
		call	StreamReader_Destruct_6BE00
		pop	cx
		pop	si
		leave
		retf
sub_6D586		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6D5D7		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		xor	ax, ax
		mov	[si+7Ah], ax
		movsx	eax, ax
		mov	[si+65h], eax
		xor	eax, eax
		mov	[si+76h], eax
		mov	[si+72h], eax
		mov	[si+69h], eax
		mov	al, 0
		mov	[si+71h], al
		mov	[si+6Dh], al
		mov	word ptr [si+7Ch], 0
		mov	dword ptr [si+8Ch], 0FFFFFFFFh
		mov	dword ptr [si+90h], 0
		mov	al, 1
		pop	si
		pop	bp
		retf
sub_6D5D7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; ResourceRecord_Helper_3BE15 (sub_3BE15 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à ResourceRecord_Helper_645A5 (sub_645A5 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, dispatch vtable [bx+0x14] et
; sub_64C21. Appelée par sub_645CD.
; ==============================================================================================
ResourceRecord_Helper_6D61E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		jmp	short loc_6D62E

loc_6D627:
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx

loc_6D62E:
		cmp	word ptr [si+7Ah], 0
		jg	short loc_6D627
		mov	dword ptr [si+65h], 0
		push	si
		call	sub_6C2A4
		pop	cx
		pop	si
		pop	bp
		retf
ResourceRecord_Helper_6D61E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; ResourceRecord_InitAndValidate_3BE3D (sub_3BE3D de OPTEST.EXE). Résumé repris de OPTEST.EXE
; ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique
; instruction par instruction à ResourceRecord_InitAndValidate_645CD (sub_645CD de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine sub_64C21 et ResourceRecord_Helper_645A5.
; ==============================================================================================
ResourceRecord_InitAndValidate_6D646		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	1
		push	[bp+arg_2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+14h]
		add	sp, 6
		or	al, al
		jz	short loc_6D67B
		mov	eax, [si+6Dh]
		cmp	eax, [bp+arg_4]
		jnz	short loc_6D675
		push	si
		nop
		push	cs
		call	near ptr sub_6DC9A
		pop	cx
		mov	ax, 1
		jmp	short loc_6D67D

loc_6D675:
		push	si
		push	cs
		call	near ptr ResourceRecord_Helper_6D61E
		pop	cx

loc_6D67B:
		xor	ax, ax

loc_6D67D:
		pop	si
		pop	bp
		retf
ResourceRecord_InitAndValidate_6D646		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6D680		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+59h]
		mov	bx, [si+59h]
		mov	bx, [bx]
		call	dword ptr [bx+1Ch]
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+65h], eax
		pop	si
		pop	bp
		retf
sub_6D680		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6D69E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		jmp	short loc_6D6AE

loc_6D6A7:
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx

loc_6D6AE:
		cmp	word ptr [si+7Ah], 0
		jle	short loc_6D6DB
		cmp	word ptr [si+7Ch], 0
		jnz	short loc_6D6C3
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_ReadPayload_6DE2C
		pop	cx
		jmp	short loc_6D6D7

loc_6D6C3:
		mov	eax, [si+65h]
		mov	bx, [si+7Ch]
		cmp	eax, [bx+0Fh]
		jl	short loc_6D6D5
		mov	ax, 1
		jmp	short loc_6D6D7

loc_6D6D5:
		xor	ax, ax

loc_6D6D7:
		or	ax, ax
		jnz	short loc_6D6A7

loc_6D6DB:
		pop	si
		pop	bp
		retf
sub_6D69E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6D6DE		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+7Ch], 0
		jz	short loc_6D706
		jmp	short loc_6D6F4

loc_6D6ED:
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx

loc_6D6F4:
		mov	bx, [si+7Ch]
		cmp	word ptr [bx], 0
		jnz	short loc_6D6ED
		mov	dword ptr [si+65h], 0Ch
		jmp	short loc_6D70E

loc_6D706:
		mov	dword ptr [si+65h], 0

loc_6D70E:
		pop	si
		pop	bp
		retf
sub_6D6DE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ResourceRecord_ReadHeaderFields_3BF08 (sub_3BF08 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à
; ResourceRecord_ReadHeaderFields_64698 (sub_64698 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, lit des champs d'en-tête via
; StreamReader_ReadTyped_63FA1. Appelée par sub_64BC1.
; ==============================================================================================
ResourceRecord_ReadHeaderFields_6D711		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	ax, si
		add	ax, 72h
		mov	[bp+var_2], ax
		push	large [si+65h]
		push	large 4
		push	ds
		push	ax
		push	si
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		add	dword ptr [si+65h], 4
		mov	bx, [bp+var_2]
		mov	ax, [bx]
		xchg	al, ah
		xchg	[bx+2], ax
		xchg	al, ah
		mov	[bx], ax
		mov	eax, [si+72h]
		shld	edx, eax, 10h
		pop	si
		leave
		retf
ResourceRecord_ReadHeaderFields_6D711		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; ResourceRecord_ComputeRecordBounds_3BF4B (sub_3BF4B de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à ResourceRecord_ComputeRecordBounds_646DB (sub_646DB
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine sub_64BC1 et sub_64B9B — calcule les bornes d'un enregistrement (début/fin). Appelée
; par loc_649F0 et sub_647B2.
; ==============================================================================================
ResourceRecord_ComputeRecordBounds_6D754		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_ComputeAlignedBounds_6DC3A
		pop	cx
		cmp	dword ptr [si+6Dh], 4D524F46h
		jnz	short loc_6D771
		mov	ax, 1
		jmp	short loc_6D773

loc_6D771:
		xor	ax, ax

loc_6D773:
		or	ax, ax
		jz	short loc_6D783
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_ReadDwordAdvance_6DC14
		pop	cx
		mov	ax, 1
		jmp	short loc_6D785

loc_6D783:
		xor	ax, ax

loc_6D785:
		pop	si
		pop	bp
		retf
ResourceRecord_ComputeRecordBounds_6D754		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; ResourceRecord_ComputeRecordBoundsB_3BF7F (sub_3BF7F de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à ResourceRecord_ComputeRecordBoundsB_6470F (sub_6470F
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; variante de ResourceRecord_ComputeRecordBounds_646DB (mêmes appels sub_64BC1/sub_64B9B).
; Appelée par sub_6482B.
; ==============================================================================================
ResourceRecord_ComputeRecordBoundsB_6D788		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_ComputeAlignedBounds_6DC3A
		pop	cx
		cmp	dword ptr [si+6Dh], 20544143h
		jnz	short loc_6D7A5
		mov	ax, 1
		jmp	short loc_6D7A7

loc_6D7A5:
		xor	ax, ax

loc_6D7A7:
		or	ax, ax
		jz	short loc_6D7B7
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_ReadDwordAdvance_6DC14
		pop	cx
		mov	ax, 1
		jmp	short loc_6D7B9

loc_6D7B7:
		xor	ax, ax

loc_6D7B9:
		pop	si
		pop	bp
		retf
ResourceRecord_ComputeRecordBoundsB_6D788		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; ResourceRecord_SeekAndRead_3BFB3 (sub_3BFB3 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à ResourceRecord_SeekAndRead_64743 (sub_64743 de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-12. CHERCHE UN
; CHUNK par son tag dans le niveau courant (FORM courant) : arg_6 == 0 →
; ResourceRecord_SeekToStart_64BF8 (repart du DÉBUT du FORM courant, +0x0C après son en-tête)
; ; sinon continue depuis la position courante. Parcourt les chunks
; (ResourceRecord_ComputeAlignedBounds_64BC1) jusqu'à trouver [rr+0x6D] == tag ou la fin du
; FORM. Renvoie 1 si trouvé (positionné au début des données). Tous les lecteurs de chunks
; passent 0 : l'ordre des chunks dans un FORM est donc LIBRE, et un tag présent deux fois
; n'est lu qu'une fois (la première occurrence).
; ==============================================================================================
ResourceRecord_SeekAndRead_6D7BC		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	[bp+arg_6], 0
		jnz	short loc_6D7D1
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_SeekToStart_6DC71
		pop	cx

loc_6D7D1:
		xor	di, di
		jmp	short loc_6D7FE

loc_6D7D5:
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_ComputeAlignedBounds_6DC3A
		pop	cx
		mov	eax, [si+6Dh]
		cmp	eax, [bp+arg_2]
		jnz	short loc_6D7EB
		mov	ax, 1
		jmp	short loc_6D7ED

loc_6D7EB:
		xor	ax, ax

loc_6D7ED:
		or	ax, ax
		jz	short loc_6D7F6
		mov	di, 1
		jmp	short loc_6D825

loc_6D7F6:
		mov	eax, [si+76h]
		mov	[si+65h], eax

loc_6D7FE:
		cmp	word ptr [si+7Ch], 0
		jnz	short loc_6D80D
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_ReadPayload_6DE2C
		pop	cx
		jmp	short loc_6D821

loc_6D80D:
		mov	eax, [si+65h]
		mov	bx, [si+7Ch]
		cmp	eax, [bx+0Fh]
		jl	short loc_6D81F
		mov	ax, 1
		jmp	short loc_6D821

loc_6D81F:
		xor	ax, ax

loc_6D821:
		or	ax, ax
		jz	short loc_6D7D5

loc_6D825:
		mov	ax, di
		pop	di
		pop	si
		pop	bp
		retf
ResourceRecord_SeekAndRead_6D7BC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; ResourceRecord_SeekAndReadB_3C022 (sub_3C022 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à ResourceRecord_SeekAndReadB_647B2 (sub_647B2 de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-12. ENTRE DANS UN
; FORM de type donné : comme ResourceRecord_SeekAndRead_64743 (arg_6 == 0 → recherche depuis
; le début du FORM courant), mais ne retient que les chunks 'FORM'
; (ResourceRecord_ComputeRecordBounds_646DB teste 4D524F46h) dont le type vaut le tag ; trouvé
; → ResourceRecord_AllocateAndDecode_64C21 empile le niveau (on lit ensuite à l'intérieur ;
; sortie par ResourceRecord_ReleaseAndClear_64D25). Renvoie 1 si trouvé.
; ==============================================================================================
ResourceRecord_SeekAndReadB_6D82B		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	[bp+arg_6], 0
		jnz	short loc_6D840
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_SeekToStart_6DC71
		pop	cx

loc_6D840:
		xor	di, di
		jmp	short loc_6D877

loc_6D844:
		push	si
		push	cs
		call	near ptr ResourceRecord_ComputeRecordBounds_6D754
		pop	cx
		or	ax, ax
		jz	short loc_6D86F
		mov	eax, [si+6Dh]
		cmp	eax, [bp+arg_2]
		jnz	short loc_6D85D
		mov	ax, 1
		jmp	short loc_6D85F

loc_6D85D:
		xor	ax, ax

loc_6D85F:
		or	ax, ax
		jz	short loc_6D86F
		mov	di, 1
		push	si
		nop
		push	cs
		call	near ptr sub_6DC9A
		pop	cx
		jmp	short loc_6D89E

loc_6D86F:
		mov	eax, [si+76h]
		mov	[si+65h], eax

loc_6D877:
		cmp	word ptr [si+7Ch], 0
		jnz	short loc_6D886
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_ReadPayload_6DE2C
		pop	cx
		jmp	short loc_6D89A

loc_6D886:
		mov	eax, [si+65h]
		mov	bx, [si+7Ch]
		cmp	eax, [bx+0Fh]
		jl	short loc_6D898
		mov	ax, 1
		jmp	short loc_6D89A

loc_6D898:
		xor	ax, ax

loc_6D89A:
		or	ax, ax
		jz	short loc_6D844

loc_6D89E:
		mov	ax, di
		pop	di
		pop	si
		pop	bp
		retf
ResourceRecord_SeekAndReadB_6D82B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; ResourceRecord_SeekAndReadC_3C09B (sub_3C09B de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à ResourceRecord_SeekAndReadC_6482B (sub_6482B de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far, 92 lignes, NON DÉTAILLÉE —
; combine sub_64BF8, ResourceRecord_ComputeRecordBoundsB_6470F, sub_64CA3, sub_64DB3.
; ==============================================================================================
ResourceRecord_SeekAndReadC_6D8A4		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_SeekToStart_6DC71
		pop	cx
		xor	di, di
		jmp	short loc_6D8EA

loc_6D8B7:
		push	si
		push	cs
		call	near ptr ResourceRecord_ComputeRecordBoundsB_6D788
		pop	cx
		or	ax, ax
		jz	short loc_6D8E2
		mov	eax, [si+6Dh]
		cmp	eax, [bp+arg_2]
		jnz	short loc_6D8D0
		mov	ax, 1
		jmp	short loc_6D8D2

loc_6D8D0:
		xor	ax, ax

loc_6D8D2:
		or	ax, ax
		jz	short loc_6D8E2
		mov	di, 1
		push	si
		nop
		push	cs
		call	near ptr sub_6DD1C
		pop	cx
		jmp	short loc_6D911

loc_6D8E2:
		mov	eax, [si+76h]
		mov	[si+65h], eax

loc_6D8EA:
		cmp	word ptr [si+7Ch], 0
		jnz	short loc_6D8F9
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_ReadPayload_6DE2C
		pop	cx
		jmp	short loc_6D90D

loc_6D8F9:
		mov	eax, [si+65h]
		mov	bx, [si+7Ch]
		cmp	eax, [bx+0Fh]
		jl	short loc_6D90B
		mov	ax, 1
		jmp	short loc_6D90D

loc_6D90B:
		xor	ax, ax

loc_6D90D:
		or	ax, ax
		jz	short loc_6D8B7

loc_6D911:
		mov	ax, di
		pop	di
		pop	si
		pop	bp
		retf
ResourceRecord_SeekAndReadC_6D8A4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; ResourceRecord_Helper_3C10E (sub_3C10E de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à ResourceRecord_Helper_6489E (sub_6489E de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, rôle exact non détaillé (voisin
; du cluster de lecture d'enregistrement).
; ==============================================================================================
ResourceRecord_Helper_6D917		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si+65h]
		mov	[si+8Ch], eax
		mov	eax, [si+72h]
		mov	ebx, 4
		cdq
		idiv	ebx
		mov	[si+90h], eax
		pop	si
		pop	bp
		retf
ResourceRecord_Helper_6D917		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6D93E		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+94h], ax
		mov	ax, [bp+arg_4]
		mov	[si+96h], ax
		push	si
		push	cs
		call	near ptr ResourceRecord_Helper_6D917
		pop	cx
		pop	si
		pop	bp
		retf
sub_6D93E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; ResourceRecord_ReadStructured_3C153 (sub_3C153 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à ResourceRecord_ReadStructured_648E3 (sub_648E3 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far, 89 lignes, NON
; DÉTAILLÉE — probable lecture d'une structure complète depuis le flux.
; ==============================================================================================
ResourceRecord_ReadStructured_6D95C		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		mov	dword ptr [si+0A0h], 0
		mov	eax, [si+65h]
		mov	[bp+var_4], eax
		mov	[bp+var_8], 0FFFFFFFFh
		mov	eax, [si+90h]
		cmp	eax, [bp+arg_2]
		jle	short loc_6D9AD
		mov	eax, [bp+arg_2]
		shl	eax, 2
		mov	edx, [si+8Ch]
		add	edx, eax
		mov	[si+65h], edx
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_8], eax

loc_6D9AD:
		cmp	[bp+var_8], 0FFFFFFFFh
		jz	short loc_6D9E9
		mov	eax, [bp+var_8]
		mov	[si+65h], eax
		mov	eax, [si+65h]
		mov	[si+9Ch], eax
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+0A0h], eax
		mov	eax, [si+9Ch]
		add	eax, [si+0A0h]
		mov	[si+0A4h], eax
		mov	ax, 1
		jmp	short loc_6D9F3

loc_6D9E9:
		mov	eax, [bp+var_4]
		mov	[si+65h], eax
		xor	ax, ax

loc_6D9F3:
		pop	si
		leave
		retf
ResourceRecord_ReadStructured_6D95C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6D9F6		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	cx, [bp+arg_2]
		mov	dx, [bp+arg_4]
		mov	dword ptr [si+0A0h], 0
		cmp	[si+94h], cx
		jl	short loc_6DA18
		cmp	[si+96h], dx
		jge	short loc_6DA1C

loc_6DA18:
		xor	ax, ax
		jmp	short loc_6DA37

loc_6DA1C:
		mov	ax, dx
		imul	word ptr [si+94h]
		movsx	eax, ax
		movsx	edx, cx
		add	eax, edx
		push	eax
		push	si
		push	cs
		call	near ptr ResourceRecord_ReadStructured_6D95C
		add	sp, 6

loc_6DA37:
		pop	si
		pop	bp
		retf
sub_6D9F6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; ResourceRecord_AdvanceByArrayCount_3C231 (sub_3C231 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à ResourceRecord_AdvanceByArrayCount_649C1 (sub_649C1
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; calcule une nouvelle position en avançant de (compte × 4 octets) — saut par-dessus un
; tableau de références.
; ==============================================================================================
ResourceRecord_AdvanceByArrayCount_6DA3A		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si+65h]
		mov	[si+8Ch], eax
		mov	[si+98h], eax
		movsx	eax, [bp+arg_2]
		mov	[si+90h], eax
		mov	eax, [si+90h]
		shl	eax, 2
		add	[si+65h], eax
		pop	si
		pop	bp
		retf
ResourceRecord_AdvanceByArrayCount_6DA3A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6DA69		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+4Ch], 0
		jz	short loc_6DA8F
		mov	word ptr [si+86h], 1
		push	si
		push	cs
		call	near ptr ResourceRecord_ComputeRecordBounds_6D754
		pop	cx
		or	ax, ax
		jz	short loc_6DA8F
		mov	eax, [si+76h]
		mov	[si+88h], eax

loc_6DA8F:
		pop	si
		pop	bp
		retf
sub_6DA69		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ResourceRecord_ReadFieldGroupA_3C289 (sub_3C289 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à
; ResourceRecord_ReadFieldGroupA_64A19 (sub_64A19 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, lit un groupe de champs via
; StreamReader_ReadTyped_63FA1 (×3).
; ==============================================================================================
ResourceRecord_ReadFieldGroupA_6DA92		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= dword ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	large [si+65h]
		push	large [bp+arg_6]
		push	large [bp+arg_2]
		push	si
		call	StreamReader_ReadTyped_6C4F3
		push	dx
		push	ax
		pop	eax
		add	sp, 0Eh
		mov	[bp+var_4], eax
		mov	eax, [bp+arg_6]
		add	[si+65h], eax
		mov	eax, [bp+var_4]
		shld	edx, eax, 10h
		pop	si
		leave
		retf
ResourceRecord_ReadFieldGroupA_6DA92		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ResourceRecord_ReadFieldGroupB_3C2C4 (sub_3C2C4 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à
; ResourceRecord_ReadFieldGroupB_64A54 (sub_64A54 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, lit un groupe de champs via
; StreamReader_ReadTyped_63FA1. | PRÉCISÉ 2026-10-12 : lit 2 octets
; (StreamReader_ReadTyped_63FA1 taille 2) à la position courante et avance de 2 =
; uint16/int16.
; ==============================================================================================
ResourceRecord_ReadFieldGroupB_6DACD		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		push	large [si+65h]
		push	large 2
		push	ss
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		add	dword ptr [si+65h], 2
		mov	ax, [bp+var_2]
		pop	si
		leave
		retf
ResourceRecord_ReadFieldGroupB_6DACD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ResourceRecord_ReadFieldGroupC_3C2EE (sub_3C2EE de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à
; ResourceRecord_ReadFieldGroupC_64A7E (sub_64A7E de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, lit un groupe de champs via
; StreamReader_ReadTyped_63FA1. Référencée par sub_8DF49. | PRÉCISÉ 2026-10-12 : lit 4 octets
; (taille 4) et avance de 4 = uint32/int32 (24.8 selon l'usage).
; ==============================================================================================
ResourceRecord_ReadFieldGroupC_6DAF7		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	large [si+65h]
		push	large 4
		push	ss
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	si
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		add	dword ptr [si+65h], 4
		mov	eax, [bp+var_4]
		shld	edx, eax, 10h
		pop	si
		leave
		retf
ResourceRecord_ReadFieldGroupC_6DAF7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ResourceRecord_ReadDwordField_64AAE (sub_64AAE de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; lit un champ 32 bits via StreamReader_ReadTyped_63FA1. Référencée par sub_7E1B4 (chargeur de
; modèle 3D probable).
; ==============================================================================================
ResourceRecord_ReadDwordField_6DB27		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	large [si+65h]
		push	large 4
		push	ss
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	si
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		mov	eax, [bp+var_4]
		shld	edx, eax, 10h
		pop	si
		leave
		retf
ResourceRecord_ReadDwordField_6DB27		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; ResourceRecord_ReadViaHelper_3C349 (sub_3C349 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à ResourceRecord_ReadViaHelper_64AD9 (sub_64AD9 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, appelle
; ResourceRecord_ReadFinalField_64B51. Référencée par sub_8DF49.
; ==============================================================================================
ResourceRecord_ReadViaHelper_6DB52		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di

loc_6DB5C:
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	dx, di
		inc	di
		les	bx, [bp+arg_2]
		add	bx, dx
		mov	es:[bx], al
		or	al, al
		jnz	short loc_6DB5C
		mov	ax, di
		pop	di
		pop	si
		pop	bp
		retf
ResourceRecord_ReadViaHelper_6DB52		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ResourceRecord_ReadDwordFieldB_3C36F (sub_3C36F de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à
; ResourceRecord_ReadDwordFieldB_64AFF (sub_64AFF de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, lit un champ 32 bits via
; StreamReader_ReadTyped_63FA1. Référencée par sub_7E1B4.
; ==============================================================================================
ResourceRecord_ReadDwordFieldB_6DB78		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+72h]
		and	ax, 1
		movsx	eax, ax
		mov	edx, [si+76h]
		sub	edx, eax
		sub	edx, [si+65h]
		mov	[bp+var_4], edx
		push	large [si+65h]
		push	edx
		push	large [bp+arg_2]
		push	si
		call	StreamReader_ReadTyped_6C4F3
		push	dx
		push	ax
		pop	eax
		add	sp, 0Eh
		mov	[bp+var_8], eax
		mov	eax, [si+76h]
		mov	[si+65h], eax
		mov	eax, [bp+var_8]
		shld	edx, eax, 10h
		pop	si
		leave
		retf
ResourceRecord_ReadDwordFieldB_6DB78		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ResourceRecord_ReadFinalField_3C3C1 (sub_3C3C1 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à
; ResourceRecord_ReadFinalField_64B51 (sub_64B51 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, lit un champ final via
; StreamReader_ReadTyped_63FA1. Référencée par sub_3C942. | PRÉCISÉ 2026-10-12 : lit 1 octet
; (taille 1) et avance de 1 = uint8.
; ==============================================================================================
ResourceRecord_ReadFinalField_6DBCA		proc far

var_1		= word ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si+65h]
		inc	dword ptr [si+65h]
		push	eax
		push	large 1
		push	ss
		lea	ax, [bp+var_1]
		push	ax
		push	si
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		mov	al, byte ptr [bp+var_1]
		mov	ah, 0
		pop	si
		leave
		retf
ResourceRecord_ReadFinalField_6DBCA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6DBF7		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= dword ptr  0Ch
arg_A		= dword ptr  10h

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	large [bp+arg_6]
		push	large [bp+arg_A]
		push	large [bp+arg_2]
		push	ax
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		pop	bp
		retf
sub_6DBF7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ResourceRecord_ReadDwordAdvance_3C40B (sub_3C40B de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à
; ResourceRecord_ReadDwordAdvance_64B9B (sub_64B9B de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, lit un champ 32 bits depuis la position
; courante (+0x65) via StreamReader_ReadTyped_63FA1 et avance la position de 4 octets.
; Fonction fondamentale du cluster (lecture séquentielle typée).
; ==============================================================================================
ResourceRecord_ReadDwordAdvance_6DC14		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	large [si+65h]
		push	large 4
		push	ds
		mov	ax, si
		add	ax, 6Dh
		push	ax
		push	si
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		add	dword ptr [si+65h], 4
		pop	si
		pop	bp
		retf
ResourceRecord_ReadDwordAdvance_6DC14		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; ResourceRecord_ComputeAlignedBounds_3C431 (sub_3C431 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à ResourceRecord_ComputeAlignedBounds_64BC1 (sub_64BC1
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; sauvegarde la position (+0x69), lit un champ (ResourceRecord_ReadDwordAdvance_64B9B), lit
; l'en-tête (ResourceRecord_ReadHeaderFields_64698), calcule une fin alignée (+0x76) avec
; correction de parité (+0x72).
; ==============================================================================================
ResourceRecord_ComputeAlignedBounds_6DC3A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si+65h]
		mov	[si+69h], eax
		push	si
		push	cs
		call	near ptr ResourceRecord_ReadDwordAdvance_6DC14
		pop	cx
		push	si
		push	cs
		call	near ptr ResourceRecord_ReadHeaderFields_6D711
		pop	cx
		mov	ax, [si+72h]
		and	ax, 1
		movsx	eax, ax
		mov	edx, [si+65h]
		add	edx, [si+72h]
		add	edx, eax
		mov	[si+76h], edx
		pop	si
		pop	bp
		retf
ResourceRecord_ComputeAlignedBounds_6DC3A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; ResourceRecord_SeekToStart_3C468 (sub_3C468 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à ResourceRecord_SeekToStart_64BF8 (sub_64BF8 de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, positionne (+0x65) au début
; de l'enregistrement courant (+0x7C) avec un décalage fixe (+0xC), ou à 0 si aucun
; enregistrement courant.
; ==============================================================================================
ResourceRecord_SeekToStart_6DC71		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+7Ch], 0
		jnz	short loc_6DC88
		mov	dword ptr [si+65h], 0
		jmp	short loc_6DC97

loc_6DC88:
		mov	bx, [si+7Ch]
		mov	eax, [bx+2]
		add	eax, 0Ch
		mov	[si+65h], eax

loc_6DC97:
		pop	si
		pop	bp
		retf
ResourceRecord_SeekToStart_6DC71		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6DC9A		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [si+7Ch]
		mov	[bp+var_2], ax
		mov	ax, si
		add	ax, 69h
		mov	[bp+var_4], ax
		push	13h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_6DCFE
		mov	ax, [bp+var_2]
		mov	[di], ax
		mov	bx, [bp+var_4]
		mov	eax, [bx]
		mov	[di+2], eax
		mov	eax, [bx+9]
		mov	[di+0Bh], eax
		push	4
		mov	ax, [bp+var_4]
		add	ax, 4
		push	ax
		mov	ax, di
		add	ax, 6
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	bx, [bp+var_4]
		mov	eax, [bx+0Dh]
		mov	[di+0Fh], eax
		mov	ax, di
		jmp	short loc_6DD00

loc_6DCFE:
		mov	ax, di

loc_6DD00:
		mov	[si+7Ch], ax
		cmp	word ptr [si+7Ch], 0
		jnz	short loc_6DD15
		push	0B0E0h
		push	si
		call	sub_76675
		add	sp, 4

loc_6DD15:
		inc	word ptr [si+7Ah]
		pop	di
		pop	si
		leave
		retf
sub_6DC9A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6DD1C		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [si+7Ch]
		mov	[bp+var_2], ax
		mov	ax, si
		add	ax, 69h
		mov	[bp+var_4], ax
		push	13h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_6DD80
		mov	ax, [bp+var_2]
		mov	[di], ax
		mov	bx, [bp+var_4]
		mov	eax, [bx]
		mov	[di+2], eax
		mov	eax, [bx+9]
		mov	[di+0Bh], eax
		push	4
		mov	ax, [bp+var_4]
		add	ax, 4
		push	ax
		mov	ax, di
		add	ax, 6
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	bx, [bp+var_4]
		mov	eax, [bx+0Dh]
		mov	[di+0Fh], eax
		mov	ax, di
		jmp	short loc_6DD82

loc_6DD80:
		mov	ax, di

loc_6DD82:
		mov	[si+7Ch], ax
		cmp	word ptr [si+7Ch], 0
		jnz	short loc_6DD97
		push	0B0E0h
		push	si
		call	sub_76675
		add	sp, 4

loc_6DD97:
		inc	word ptr [si+7Ah]
		pop	di
		pop	si
		leave
		retf
sub_6DD1C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ResourceRecord_ReleaseAndClear_3C595 (sub_3C595 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à
; ResourceRecord_ReleaseAndClear_64D25 (sub_64D25 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, libère (sub_338) et réinitialise l'état de
; l'enregistrement courant.
; ==============================================================================================
ResourceRecord_ReleaseAndClear_6DD9E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+7Ch], 0
		jz	short loc_6DDCE
		mov	dx, [si+7Ch]
		mov	bx, [si+7Ch]
		mov	eax, [bx+0Fh]
		mov	[si+65h], eax
		mov	ax, [bx]
		mov	[si+7Ch], ax
		or	dx, dx
		jz	short loc_6DDCB
		push	dx
		call	sub_3B2
		pop	cx
		jmp	short loc_6DDCB

loc_6DDCB:
		dec	word ptr [si+7Ah]

loc_6DDCE:
		pop	si
		pop	bp
		retf
ResourceRecord_ReleaseAndClear_6DD9E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; ResourceRecord_ResetIfSet_3C5C8 (sub_3C5C8 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à ResourceRecord_ResetIfSet_64D58 (sub_64D58 de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, appelle
; ResourceRecord_ReleaseAndClear_64D25 conditionnellement.
; ==============================================================================================
ResourceRecord_ResetIfSet_6DDD1		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		push	cs
		call	near ptr ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx
		pop	bp
		retf
ResourceRecord_ResetIfSet_6DDD1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; ResourceRecord_RecordCount_3C5D6 (sub_3C5D6 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — far, LUE 2026-11-04. Nombre d'enregistrements du
; chunk courant : taille du chunk ([si+72h]) / taille d'un enregistrement (argument dword),
; rangée en [si+7Eh] et renvoyée.
; ==============================================================================================
ResourceRecord_RecordCount_6DDDF		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [bp+arg_2]
		mov	[si+82h], eax
		mov	eax, [si+72h]
		cdq
		idiv	[bp+arg_2]
		mov	[si+7Eh], eax
		shld	edx, eax, 10h
		pop	si
		pop	bp
		retf
ResourceRecord_RecordCount_6DDDF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6DE05		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	large [si+65h]
		mov	eax, [si+7Eh]
		imul	eax, [si+82h]
		push	eax
		push	ds
		push	[bp+arg_2]
		push	si
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		pop	si
		pop	bp
		retf
sub_6DE05		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; ResourceRecord_ReadPayload_3C623 (sub_3C623 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à ResourceRecord_ReadPayload_64DB3 (sub_64DB3 de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, lit la charge utile d'un
; enregistrement (appelle StreamReader_GetCapacity_64062) — fonction de lecture de contenu,
; cœur du décodage d'enregistrement. Référencée massivement dans ce cluster. CONFIRMÉ
; IFF/FORM-CHUNK (voir seg339).
; ==============================================================================================
ResourceRecord_ReadPayload_6DE2C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	StreamReader_GetCapacity_6C5B4
		push	dx
		push	ax
		pop	eax
		pop	cx
		cmp	eax, [si+65h]
		jg	short loc_6DE49
		mov	ax, 1
		jmp	short loc_6DE4B

loc_6DE49:
		xor	ax, ax

loc_6DE4B:
		pop	si
		pop	bp
		retf
ResourceRecord_ReadPayload_6DE2C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6DE4E		proc far

var_1		= word ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	dx, [bp+arg_0]
		push	large 0FFFFFFFFh
		push	large 1
		push	ss
		lea	ax, [bp+var_1]
		push	ax
		push	dx
		call	StreamReader_ReadTyped_6C4F3
		push	dx
		push	ax
		pop	eax
		add	sp, 0Eh
		cmp	eax, 1
		jz	short loc_6DE7A
		mov	ax, 1
		jmp	short loc_6DE7C

loc_6DE7A:
		xor	ax, ax

loc_6DE7C:
		leave
		retf
sub_6DE4E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6DE7E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	large 80h
		push	0
sub_6DE7E		endp

; START OF FUNCTION CHUNK FOR sub_6DE7E
		db 9Ah
		or	ax, 5600h
; END OF FUNCTION CHUNK FOR sub_6DE7E
seg205		ends

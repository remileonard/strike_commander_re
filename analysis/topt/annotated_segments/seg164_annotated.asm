seg164		segment	para public 'CODE' use16
		assume cs:seg164
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_42520		proc far

var_80		= word ptr -80h
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 80h
		push	si
		mov	si, [bp+arg_0]
		xor	dx, dx
		cmp	word ptr [si+7Ch], 0
		jz	short loc_42539
		mov	dx, [si+7Ch]
		add	dx, 6

loc_42539:
		mov	ax, si
		add	ax, 6Dh
		push	ax
		push	dx
		mov	ax, si
		add	ax, 0Ah
		push	ax
		push	530Eh
		lea	ax, [bp+var_80]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 0Ah
		lea	ax, [bp+var_80]
		push	ax
		mov	ax, si
		add	ax, 6
		push	ax
		call	CachedObject_DestructSubobjects_2F6ED
		add	sp, 4
		push	si
		call	StreamReader_Destruct_40D9A
		pop	cx
		pop	si
		leave
		retf
sub_42520		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_42571		proc far

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
sub_42571		endp

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
ResourceRecord_Helper_425B8		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		jmp	short loc_425C8

loc_425C1:
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_ReleaseAndClear_42D38
		pop	cx

loc_425C8:
		cmp	word ptr [si+7Ah], 0
		jg	short loc_425C1
		mov	dword ptr [si+65h], 0
		push	si
		call	sub_4123E
		pop	cx
		pop	si
		pop	bp
		retf
ResourceRecord_Helper_425B8		endp

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
ResourceRecord_InitAndValidate_425E0		proc far

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
		jz	short loc_42615
		mov	eax, [si+6Dh]
		cmp	eax, [bp+arg_4]
		jnz	short loc_4260F
		push	si
		nop
		push	cs
		call	near ptr sub_42C34
		pop	cx
		mov	ax, 1
		jmp	short loc_42617

loc_4260F:
		push	si
		push	cs
		call	near ptr ResourceRecord_Helper_425B8
		pop	cx

loc_42615:
		xor	ax, ax

loc_42617:
		pop	si
		pop	bp
		retf
ResourceRecord_InitAndValidate_425E0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4261A		proc far

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
sub_4261A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_42638		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		jmp	short loc_42648

loc_42641:
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_ReleaseAndClear_42D38
		pop	cx

loc_42648:
		cmp	word ptr [si+7Ah], 0
		jle	short loc_42675
		cmp	word ptr [si+7Ch], 0
		jnz	short loc_4265D
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_ReadPayload_42DC6
		pop	cx
		jmp	short loc_42671

loc_4265D:
		mov	eax, [si+65h]
		mov	bx, [si+7Ch]
		cmp	eax, [bx+0Fh]
		jl	short loc_4266F
		mov	ax, 1
		jmp	short loc_42671

loc_4266F:
		xor	ax, ax

loc_42671:
		or	ax, ax
		jnz	short loc_42641

loc_42675:
		pop	si
		pop	bp
		retf
sub_42638		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_42678		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+7Ch], 0
		jz	short loc_426A0
		jmp	short loc_4268E

loc_42687:
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_ReleaseAndClear_42D38
		pop	cx

loc_4268E:
		mov	bx, [si+7Ch]
		cmp	word ptr [bx], 0
		jnz	short loc_42687
		mov	dword ptr [si+65h], 0Ch
		jmp	short loc_426A8

loc_426A0:
		mov	dword ptr [si+65h], 0

loc_426A8:
		pop	si
		pop	bp
		retf
sub_42678		endp

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
ResourceRecord_ReadHeaderFields_426AB		proc far

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
		call	StreamReader_ReadTyped_4148D
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
ResourceRecord_ReadHeaderFields_426AB		endp

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
ResourceRecord_ComputeRecordBounds_426EE		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_ComputeAlignedBounds_42BD4
		pop	cx
		cmp	dword ptr [si+6Dh], 4D524F46h
		jnz	short loc_4270B
		mov	ax, 1
		jmp	short loc_4270D

loc_4270B:
		xor	ax, ax

loc_4270D:
		or	ax, ax
		jz	short loc_4271D
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_ReadDwordAdvance_42BAE
		pop	cx
		mov	ax, 1
		jmp	short loc_4271F

loc_4271D:
		xor	ax, ax

loc_4271F:
		pop	si
		pop	bp
		retf
ResourceRecord_ComputeRecordBounds_426EE		endp

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
ResourceRecord_ComputeRecordBoundsB_42722		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_ComputeAlignedBounds_42BD4
		pop	cx
		cmp	dword ptr [si+6Dh], 20544143h
		jnz	short loc_4273F
		mov	ax, 1
		jmp	short loc_42741

loc_4273F:
		xor	ax, ax

loc_42741:
		or	ax, ax
		jz	short loc_42751
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_ReadDwordAdvance_42BAE
		pop	cx
		mov	ax, 1
		jmp	short loc_42753

loc_42751:
		xor	ax, ax

loc_42753:
		pop	si
		pop	bp
		retf
ResourceRecord_ComputeRecordBoundsB_42722		endp

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
ResourceRecord_SeekAndRead_42756		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	[bp+arg_6], 0
		jnz	short loc_4276B
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_SeekToStart_42C0B
		pop	cx

loc_4276B:
		xor	di, di
		jmp	short loc_42798

loc_4276F:
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_ComputeAlignedBounds_42BD4
		pop	cx
		mov	eax, [si+6Dh]
		cmp	eax, [bp+arg_2]
		jnz	short loc_42785
		mov	ax, 1
		jmp	short loc_42787

loc_42785:
		xor	ax, ax

loc_42787:
		or	ax, ax
		jz	short loc_42790
		mov	di, 1
		jmp	short loc_427BF

loc_42790:
		mov	eax, [si+76h]
		mov	[si+65h], eax

loc_42798:
		cmp	word ptr [si+7Ch], 0
		jnz	short loc_427A7
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_ReadPayload_42DC6
		pop	cx
		jmp	short loc_427BB

loc_427A7:
		mov	eax, [si+65h]
		mov	bx, [si+7Ch]
		cmp	eax, [bx+0Fh]
		jl	short loc_427B9
		mov	ax, 1
		jmp	short loc_427BB

loc_427B9:
		xor	ax, ax

loc_427BB:
		or	ax, ax
		jz	short loc_4276F

loc_427BF:
		mov	ax, di
		pop	di
		pop	si
		pop	bp
		retf
ResourceRecord_SeekAndRead_42756		endp

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
ResourceRecord_SeekAndReadB_427C5		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	[bp+arg_6], 0
		jnz	short loc_427DA
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_SeekToStart_42C0B
		pop	cx

loc_427DA:
		xor	di, di
		jmp	short loc_42811

loc_427DE:
		push	si
		push	cs
		call	near ptr ResourceRecord_ComputeRecordBounds_426EE
		pop	cx
		or	ax, ax
		jz	short loc_42809
		mov	eax, [si+6Dh]
		cmp	eax, [bp+arg_2]
		jnz	short loc_427F7
		mov	ax, 1
		jmp	short loc_427F9

loc_427F7:
		xor	ax, ax

loc_427F9:
		or	ax, ax
		jz	short loc_42809
		mov	di, 1
		push	si
		nop
		push	cs
		call	near ptr sub_42C34
		pop	cx
		jmp	short loc_42838

loc_42809:
		mov	eax, [si+76h]
		mov	[si+65h], eax

loc_42811:
		cmp	word ptr [si+7Ch], 0
		jnz	short loc_42820
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_ReadPayload_42DC6
		pop	cx
		jmp	short loc_42834

loc_42820:
		mov	eax, [si+65h]
		mov	bx, [si+7Ch]
		cmp	eax, [bx+0Fh]
		jl	short loc_42832
		mov	ax, 1
		jmp	short loc_42834

loc_42832:
		xor	ax, ax

loc_42834:
		or	ax, ax
		jz	short loc_427DE

loc_42838:
		mov	ax, di
		pop	di
		pop	si
		pop	bp
		retf
ResourceRecord_SeekAndReadB_427C5		endp

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
ResourceRecord_SeekAndReadC_4283E		proc far

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
		call	near ptr ResourceRecord_SeekToStart_42C0B
		pop	cx
		xor	di, di
		jmp	short loc_42884

loc_42851:
		push	si
		push	cs
		call	near ptr ResourceRecord_ComputeRecordBoundsB_42722
		pop	cx
		or	ax, ax
		jz	short loc_4287C
		mov	eax, [si+6Dh]
		cmp	eax, [bp+arg_2]
		jnz	short loc_4286A
		mov	ax, 1
		jmp	short loc_4286C

loc_4286A:
		xor	ax, ax

loc_4286C:
		or	ax, ax
		jz	short loc_4287C
		mov	di, 1
		push	si
		nop
		push	cs
		call	near ptr sub_42CB6
		pop	cx
		jmp	short loc_428AB

loc_4287C:
		mov	eax, [si+76h]
		mov	[si+65h], eax

loc_42884:
		cmp	word ptr [si+7Ch], 0
		jnz	short loc_42893
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_ReadPayload_42DC6
		pop	cx
		jmp	short loc_428A7

loc_42893:
		mov	eax, [si+65h]
		mov	bx, [si+7Ch]
		cmp	eax, [bx+0Fh]
		jl	short loc_428A5
		mov	ax, 1
		jmp	short loc_428A7

loc_428A5:
		xor	ax, ax

loc_428A7:
		or	ax, ax
		jz	short loc_42851

loc_428AB:
		mov	ax, di
		pop	di
		pop	si
		pop	bp
		retf
ResourceRecord_SeekAndReadC_4283E		endp

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
ResourceRecord_Helper_428B1		proc far

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
ResourceRecord_Helper_428B1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_428D8		proc far

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
		call	near ptr ResourceRecord_Helper_428B1
		pop	cx
		pop	si
		pop	bp
		retf
sub_428D8		endp

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
ResourceRecord_ReadStructured_428F6		proc far

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
		jle	short loc_42947
		mov	eax, [bp+arg_2]
		shl	eax, 2
		mov	edx, [si+8Ch]
		add	edx, eax
		mov	[si+65h], edx
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_ReadFieldGroupC_42A91
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_8], eax

loc_42947:
		cmp	[bp+var_8], 0FFFFFFFFh
		jz	short loc_42983
		mov	eax, [bp+var_8]
		mov	[si+65h], eax
		mov	eax, [si+65h]
		mov	[si+9Ch], eax
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_ReadFieldGroupC_42A91
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+0A0h], eax
		mov	eax, [si+9Ch]
		add	eax, [si+0A0h]
		mov	[si+0A4h], eax
		mov	ax, 1
		jmp	short loc_4298D

loc_42983:
		mov	eax, [bp+var_4]
		mov	[si+65h], eax
		xor	ax, ax

loc_4298D:
		pop	si
		leave
		retf
ResourceRecord_ReadStructured_428F6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_42990		proc far

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
		jl	short loc_429B2
		cmp	[si+96h], dx
		jge	short loc_429B6

loc_429B2:
		xor	ax, ax
		jmp	short loc_429D1

loc_429B6:
		mov	ax, dx
		imul	word ptr [si+94h]
		movsx	eax, ax
		movsx	edx, cx
		add	eax, edx
		push	eax
		push	si
		push	cs
		call	near ptr ResourceRecord_ReadStructured_428F6
		add	sp, 6

loc_429D1:
		pop	si
		pop	bp
		retf
sub_42990		endp

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
ResourceRecord_AdvanceByArrayCount_429D4		proc far

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
ResourceRecord_AdvanceByArrayCount_429D4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_42A03		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+4Ch], 0
		jz	short loc_42A29
		mov	word ptr [si+86h], 1
		push	si
		push	cs
		call	near ptr ResourceRecord_ComputeRecordBounds_426EE
		pop	cx
		or	ax, ax
		jz	short loc_42A29
		mov	eax, [si+76h]
		mov	[si+88h], eax

loc_42A29:
		pop	si
		pop	bp
		retf
sub_42A03		endp

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
ResourceRecord_ReadFieldGroupA_42A2C		proc far

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
		call	StreamReader_ReadTyped_4148D
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
ResourceRecord_ReadFieldGroupA_42A2C		endp

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
ResourceRecord_ReadFieldGroupB_42A67		proc far

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
		call	StreamReader_ReadTyped_4148D
		add	sp, 0Eh
		add	dword ptr [si+65h], 2
		mov	ax, [bp+var_2]
		pop	si
		leave
		retf
ResourceRecord_ReadFieldGroupB_42A67		endp

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
ResourceRecord_ReadFieldGroupC_42A91		proc far

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
		call	StreamReader_ReadTyped_4148D
		add	sp, 0Eh
		add	dword ptr [si+65h], 4
		mov	eax, [bp+var_4]
		shld	edx, eax, 10h
		pop	si
		leave
		retf
ResourceRecord_ReadFieldGroupC_42A91		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ResourceRecord_ReadDwordField_64AAE (sub_64AAE de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; lit un champ 32 bits via StreamReader_ReadTyped_63FA1. Référencée par sub_7E1B4 (chargeur de
; modèle 3D probable).
; ==============================================================================================
ResourceRecord_ReadDwordField_42AC1		proc far

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
		call	StreamReader_ReadTyped_4148D
		add	sp, 0Eh
		mov	eax, [bp+var_4]
		shld	edx, eax, 10h
		pop	si
		leave
		retf
ResourceRecord_ReadDwordField_42AC1		endp

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
ResourceRecord_ReadViaHelper_42AEC		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di

loc_42AF6:
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_ReadFinalField_42B64
		pop	cx
		mov	dx, di
		inc	di
		les	bx, [bp+arg_2]
		add	bx, dx
		mov	es:[bx], al
		or	al, al
		jnz	short loc_42AF6
		mov	ax, di
		pop	di
		pop	si
		pop	bp
		retf
ResourceRecord_ReadViaHelper_42AEC		endp

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
ResourceRecord_ReadDwordFieldB_42B12		proc far

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
		call	StreamReader_ReadTyped_4148D
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
ResourceRecord_ReadDwordFieldB_42B12		endp

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
ResourceRecord_ReadFinalField_42B64		proc far

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
		call	StreamReader_ReadTyped_4148D
		add	sp, 0Eh
		mov	al, byte ptr [bp+var_1]
		mov	ah, 0
		pop	si
		leave
		retf
ResourceRecord_ReadFinalField_42B64		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_42B91		proc far

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
		call	StreamReader_ReadTyped_4148D
		add	sp, 0Eh
		pop	bp
		retf
sub_42B91		endp

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
ResourceRecord_ReadDwordAdvance_42BAE		proc far

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
		call	StreamReader_ReadTyped_4148D
		add	sp, 0Eh
		add	dword ptr [si+65h], 4
		pop	si
		pop	bp
		retf
ResourceRecord_ReadDwordAdvance_42BAE		endp

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
ResourceRecord_ComputeAlignedBounds_42BD4		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si+65h]
		mov	[si+69h], eax
		push	si
		push	cs
		call	near ptr ResourceRecord_ReadDwordAdvance_42BAE
		pop	cx
		push	si
		push	cs
		call	near ptr ResourceRecord_ReadHeaderFields_426AB
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
ResourceRecord_ComputeAlignedBounds_42BD4		endp

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
ResourceRecord_SeekToStart_42C0B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+7Ch], 0
		jnz	short loc_42C22
		mov	dword ptr [si+65h], 0
		jmp	short loc_42C31

loc_42C22:
		mov	bx, [si+7Ch]
		mov	eax, [bx+2]
		add	eax, 0Ch
		mov	[si+65h], eax

loc_42C31:
		pop	si
		pop	bp
		retf
ResourceRecord_SeekToStart_42C0B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_42C34		proc far

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
		jz	short loc_42C98
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
		jmp	short loc_42C9A

loc_42C98:
		mov	ax, di

loc_42C9A:
		mov	[si+7Ch], ax
		cmp	word ptr [si+7Ch], 0
		jnz	short loc_42CAF
		push	0B0E0h
		push	si
		call	DisplayContext_CommitFrameWithTag_300C1
		add	sp, 4

loc_42CAF:
		inc	word ptr [si+7Ah]
		pop	di
		pop	si
		leave
		retf
sub_42C34		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_42CB6		proc far

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
		jz	short loc_42D1A
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
		jmp	short loc_42D1C

loc_42D1A:
		mov	ax, di

loc_42D1C:
		mov	[si+7Ch], ax
		cmp	word ptr [si+7Ch], 0
		jnz	short loc_42D31
		push	0B0E0h
		push	si
		call	DisplayContext_CommitFrameWithTag_300C1
		add	sp, 4

loc_42D31:
		inc	word ptr [si+7Ah]
		pop	di
		pop	si
		leave
		retf
sub_42CB6		endp

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
ResourceRecord_ReleaseAndClear_42D38		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+7Ch], 0
		jz	short loc_42D68
		mov	dx, [si+7Ch]
		mov	bx, [si+7Ch]
		mov	eax, [bx+0Fh]
		mov	[si+65h], eax
		mov	ax, [bx]
		mov	[si+7Ch], ax
		or	dx, dx
		jz	short loc_42D65
		push	dx
		call	sub_39C
		pop	cx
		jmp	short loc_42D65

loc_42D65:
		dec	word ptr [si+7Ah]

loc_42D68:
		pop	si
		pop	bp
		retf
ResourceRecord_ReleaseAndClear_42D38		endp

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
ResourceRecord_ResetIfSet_42D6B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		push	cs
		call	near ptr ResourceRecord_ReleaseAndClear_42D38
		pop	cx
		pop	bp
		retf
ResourceRecord_ResetIfSet_42D6B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_42D79		proc far

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
sub_42D79		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_42D9F		proc far

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
		call	StreamReader_ReadTyped_4148D
		add	sp, 0Eh
		pop	si
		pop	bp
		retf
sub_42D9F		endp

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
ResourceRecord_ReadPayload_42DC6		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	StreamReader_GetCapacity_4154E
		push	dx
		push	ax
		pop	eax
		pop	cx
		cmp	eax, [si+65h]
		jg	short loc_42DE3
		mov	ax, 1
		jmp	short loc_42DE5

loc_42DE3:
		xor	ax, ax

loc_42DE5:
		pop	si
		pop	bp
		retf
ResourceRecord_ReadPayload_42DC6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_42DE8		proc far

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
		call	StreamReader_ReadTyped_4148D
		push	dx
		push	ax
		pop	eax
		add	sp, 0Eh
		cmp	eax, 1
		jz	short loc_42E14
		mov	ax, 1
		jmp	short loc_42E16

loc_42E14:
		xor	ax, ax

loc_42E16:
		leave
		retf
sub_42DE8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_42E18		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	large 80h
		push	0
		call	FileStream_Construct_40507
		add	sp, 6
		pop	bp
		retf
sub_42E18		endp
seg164		ends

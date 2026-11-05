seg171		segment	para public 'CODE' use16
		assume cs:seg171
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_68730		proc far
		push	bp
		mov	bp, sp
		push	6B20h
		push	cs
		call	loc_78415
		pop	cx
		pop	bp
		retf
sub_68730		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; LinkedList_InsertAtHead_2FA11 (sub_2FA11 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à LinkedList_InsertAtHead_5F19C (sub_5F19C de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, insère un nœud (di) en tête
; d'une liste doublement chaînée (si, head/tail à +2/+4), met à jour les liens next/prev du
; nœud voisin. Référencée par sub_5F1F8 et sub_664D5.
; ==============================================================================================
LinkedList_InsertAtHead_6873D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	word ptr [di+4], 0
		mov	ax, [si+2]
		mov	[di+2], ax
		cmp	word ptr [si+2], 0
		jz	short loc_68761
		mov	bx, [si+2]
		mov	[bx+4], di
		jmp	short loc_68764

loc_68761:
		mov	[si+4], di

loc_68764:
		mov	[si+2], di
		pop	di
		pop	si
		pop	bp
		retf
LinkedList_InsertAtHead_6873D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; LinkedList_InsertAtTail_2FA3F (sub_2FA3F de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à LinkedList_InsertAtTail_5F1CA (sub_5F1CA de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, symétrique de
; LinkedList_InsertAtHead_5F19C, insère en queue de liste. Référencée par sub_5F245.
; ==============================================================================================
LinkedList_InsertAtTail_6876B		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [si+4]
		mov	[di+4], ax
		mov	word ptr [di+2], 0
		cmp	word ptr [si+4], 0
		jz	short loc_6878F
		mov	bx, [si+4]
		mov	[bx+2], di
		jmp	short loc_68792

loc_6878F:
		mov	[si+2], di

loc_68792:
		mov	[si+4], di
		pop	di
		pop	si
		pop	bp
		retf
LinkedList_InsertAtTail_6876B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; LinkedList_InsertAfter_2FA6D (sub_2FA6D de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à LinkedList_InsertAfter_5F1F8 (sub_5F1F8 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, insère un nœud après un nœud de
; référence donné (ou en tête via LinkedList_InsertAtHead_5F19C si aucune référence).
; ==============================================================================================
LinkedList_InsertAfter_68799		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	di, [bp+arg_4]
		or	di, di
		jz	short loc_687E2
		or	dx, dx
		jnz	short loc_687BA
		push	di
		push	si
		push	cs
		call	near ptr LinkedList_InsertAtHead_6873D
		add	sp, 4
		jmp	short loc_687E2

loc_687BA:
		cmp	[si+4], dx
		jz	short loc_687D2
		mov	bx, dx
		mov	ax, [bx+2]
		mov	[di+2], ax
		mov	[di+4], dx
		mov	bx, [bx+2]
		mov	[bx+4], di
		jmp	short loc_687DD

loc_687D2:
		mov	[si+4], di
		mov	word ptr [di+2], 0
		mov	[di+4], dx

loc_687DD:
		mov	bx, dx
		mov	[bx+2], di

loc_687E2:
		pop	di
		pop	si
		pop	bp
		retf
LinkedList_InsertAfter_68799		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; LinkedList_InsertBefore_2FABA (sub_2FABA de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à LinkedList_InsertBefore_5F245 (sub_5F245 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, insère un nœud avant un nœud de
; référence donné (ou en queue via LinkedList_InsertAtTail_5F1CA si aucune référence).
; ==============================================================================================
LinkedList_InsertBefore_687E6		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	di, [bp+arg_4]
		or	di, di
		jz	short loc_6882F
		or	dx, dx
		jnz	short loc_68807
		push	di
		push	si
		push	cs
		call	near ptr LinkedList_InsertAtTail_6876B
		add	sp, 4
		jmp	short loc_6882F

loc_68807:
		cmp	[si+2], dx
		jz	short loc_6881F
		mov	[di+2], dx
		mov	bx, dx
		mov	ax, [bx+4]
		mov	[di+4], ax
		mov	bx, [bx+4]
		mov	[bx+2], di
		jmp	short loc_6882A

loc_6881F:
		mov	[si+2], di
		mov	word ptr [di+4], 0
		mov	[di+2], dx

loc_6882A:
		mov	bx, dx
		mov	[bx+4], di

loc_6882F:
		pop	di
		pop	si
		pop	bp
		retf
LinkedList_InsertBefore_687E6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_68833		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		push	di
		push	si
		nop
		push	cs
		call	near ptr LinkedList_Remove_688C5
		add	sp, 4
		push	di
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr LinkedList_InsertAfter_68799
		add	sp, 6
		pop	di
		pop	si
		pop	bp
		retf
sub_68833		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_68858		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		push	di
		push	si
		nop
		push	cs
		call	near ptr LinkedList_Remove_688C5
		add	sp, 4
		push	di
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr LinkedList_InsertBefore_687E6
		add	sp, 6
		pop	di
		pop	si
		pop	bp
		retf
sub_68858		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6887D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		push	si
		nop
		push	cs
		call	near ptr LinkedList_Remove_688C5
		add	sp, 4
		push	di
		push	0
		push	si
		push	cs
		call	near ptr LinkedList_InsertAfter_68799
		add	sp, 6
		pop	di
		pop	si
		pop	bp
		retf
sub_6887D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_688A1		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		push	si
		nop
		push	cs
		call	near ptr LinkedList_Remove_688C5
		add	sp, 4
		push	di
		push	0
		push	si
		push	cs
		call	near ptr LinkedList_InsertBefore_687E6
		add	sp, 6
		pop	di
		pop	si
		pop	bp
		retf
sub_688A1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à LinkedList_Remove_2FB99
; (sub_2FB99 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; LinkedList_Remove_5F324 (sub_5F324 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, retire un nœud (di) d'une liste doublement chaînée
; (si), reliant ses voisins entre eux.
; ==============================================================================================
LinkedList_Remove_688C5		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	di, di
		jz	short loc_6890E
		mov	dx, [di+4]
		or	dx, dx
		jz	short loc_688E5
		mov	ax, [di+2]
		mov	bx, dx
		mov	[bx+2], ax
		jmp	short loc_688EB

loc_688E5:
		mov	ax, [di+2]
		mov	[si+2], ax

loc_688EB:
		cmp	word ptr [di+2], 0
		jz	short loc_688F9
		mov	bx, [di+2]
		mov	[bx+4], dx
		jmp	short loc_6890E

loc_688F9:
		or	dx, dx
		jz	short loc_68906
		mov	bx, dx
		mov	word ptr [bx+2], 0
		jmp	short loc_6890B

loc_68906:
		mov	word ptr [si+2], 0

loc_6890B:
		mov	[si+4], dx

loc_6890E:
		pop	di
		pop	si
		pop	bp
		retf
LinkedList_Remove_688C5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_68912		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+arg_0]
		mov	si, [bp+arg_2]
		push	si
		push	ax
		push	cs
		call	near ptr LinkedList_Remove_688C5
		add	sp, 4
		or	si, si
		jz	short loc_68935
		push	3
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_68935

loc_68935:
		pop	si
		pop	bp
		retf
sub_68912		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_68938		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		jmp	short loc_68965

loc_68944:
		mov	bx, [si+2]
		mov	ax, [bx+2]
		mov	[bp+var_2], ax
		cmp	word ptr [si+2], 0
		jz	short loc_6895F
		push	3
		push	bx
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_6895F

loc_6895F:
		mov	ax, [bp+var_2]
		mov	[si+2], ax

loc_68965:
		cmp	word ptr [si+2], 0
		jnz	short loc_68944
		xor	ax, ax
		mov	[si+4], ax
		mov	[si+2], ax
		pop	si
		leave
		retf
sub_68938		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à LinkedList_Helper_2FC76 (sub_2FC76 de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : code identique instruction par instruction à LinkedList_Helper_5F401 (sub_5F401
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; aucun appel externe visible (rôle exact non détaillé, voisin du cluster liste chaînée).
; ==============================================================================================
LinkedList_Helper_68976		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word ptr [di], 0
		jnz	short loc_6898B
		mov	ax, [si+2]
		jmp	short loc_68990

loc_6898B:
		mov	bx, [di]
		mov	ax, [bx+2]

loc_68990:
		mov	[di], ax
		cmp	word ptr [di], 0
		jz	short loc_6899C
		mov	ax, 1
		jmp	short loc_6899E

loc_6899C:
		xor	ax, ax

loc_6899E:
		pop	di
		pop	si
		pop	bp
		retf
LinkedList_Helper_68976		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à LinkedList_Helper_2FC76
; (sub_2FC76 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; LinkedList_Helper_5F401 (sub_5F401 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, aucun appel externe visible (rôle exact non détaillé,
; voisin du cluster liste chaînée).
; ==============================================================================================
LinkedList_Helper_689A2		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word ptr [di], 0
		jnz	short loc_689B7
		mov	ax, [si+4]
		jmp	short loc_689BC

loc_689B7:
		mov	bx, [di]
		mov	ax, [bx+4]

loc_689BC:
		mov	[di], ax
		cmp	word ptr [di], 0
		jz	short loc_689C8
		mov	ax, 1
		jmp	short loc_689CA

loc_689C8:
		xor	ax, ax

loc_689CA:
		pop	di
		pop	si
		pop	bp
		retf
LinkedList_Helper_689A2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_689CE		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_4], 0
		jmp	short loc_689E6

loc_689E2:
		inc	[bp+var_4]

loc_689E6:
		mov	si, [si+2]
		or	si, si
		jnz	short loc_689E2
sub_689CE		endp

; START OF FUNCTION CHUNK FOR sub_689CE
		db 66h, 8Bh
		inc	si
; END OF FUNCTION CHUNK FOR sub_689CE
seg171		ends

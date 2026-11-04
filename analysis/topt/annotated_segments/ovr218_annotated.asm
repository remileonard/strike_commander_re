ovr218		segment	para public 'OVERLAY' use16
		assume cs:ovr218
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B7380		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_B73A2
		push	1Ah
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_B7406

loc_B73A2:
		mov	word ptr [si], 4F8h
		mov	word ptr [si+2], 0
		mov	word ptr [si], 35C0h
		mov	ax, si
		add	ax, 5
		push	ax
		call	sub_1109C
		add	sp, 2
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+14h], 2
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		mov	[si+0Eh], di
		push	di
		mov	bx, [di+50h]
		call	dword ptr [bx+14h]
		add	sp, 2
		mov	[si+4], al
		mov	ax, di
		add	ax, 53h
		mov	[bp+var_2], ax
		mov	bx, [bp+var_2]
		mov	eax, [bx]
		mov	[si+5], eax
		mov	bx, [bp+var_2]
		mov	eax, [bx+4]
		mov	[si+9], eax
		mov	byte ptr [si+0Dh], 0

loc_B7406:
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
sub_B7380		endp

; START OF FUNCTION CHUNK FOR sub_B7380
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_B7380

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B7410		proc far

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		or	si, si
		jnz	short loc_B7435
		push	1Ah
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jnz	short loc_B7435
		jmp	loc_B7514

loc_B7435:
		mov	word ptr [si], 4F8h
		mov	word ptr [si+2], 0
		mov	word ptr [si], 35C0h
		mov	ax, si
		add	ax, 5
		push	ax
		call	sub_1109C
		add	sp, 2
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+14h], 2
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		mov	word ptr [si+0Eh], 0
		mov	al, [bp+arg_2]
		mov	[si+4], al
		mov	eax, [di+72h]
		mov	[bp+var_4], eax
		push	1
		push	0
		push	2
		push	large [bp+var_4]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		mov	eax, [bp+var_8]
		mov	[si+10h], eax
		mov	byte ptr [si+14h], 2
		mov	byte ptr [si+15h], 1
		mov	dword ptr [si+16h], 0
		mov	eax, [bp+var_4]
		mov	[si+16h], eax
		push	large [di+72h]
		push	0
		mov	al, [si+14h]
		push	ax
		push	word ptr [si+12h]
		push	word ptr [si+10h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		call	ResourceRecord_ReadFieldGroupA_42A2C
		add	sp, 0Ah
		push	0
		mov	al, [si+14h]
		push	ax
		push	word ptr [si+12h]
		push	word ptr [si+10h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		mov	[bp+var_A], dx
		mov	[bp+var_C], ax
		push	8
		push	[bp+var_A]
		push	[bp+var_C]
		push	ds
		mov	ax, si
		add	ax, 5
		push	ax
		call	sub_36A8
		add	sp, 0Ah
		mov	byte ptr [si+0Dh], 0

loc_B7514:
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
sub_B7410		endp

; START OF FUNCTION CHUNK FOR sub_B7410
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_B7410

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B751E		proc far

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+0Eh], 0
		jnz	short loc_B75AD
		mov	[bp+var_2], 0
		mov	al, [si+4]
		mov	ah, 0
		or	ax, ax
		jz	short loc_B753F
		jmp	short loc_B75A7

loc_B753F:
		push	0
		mov	al, [si+14h]
		push	ax
		push	word ptr [si+12h]
		push	word ptr [si+10h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		mov	[bp+var_4], dx
		mov	[bp+var_6], ax
		push	7Eh
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jz	short loc_B75A0
		mov	ax, di
		add	ax, 20h
		push	ax
		call	sub_2A4FF
		add	sp, 2
		mov	word ptr [di+50h], 359Ch
		mov	ax, di
		add	ax, 53h
		push	ax
		call	sub_1109C
		add	sp, 2
		push	[bp+var_4]
		push	[bp+var_6]
		push	di
		call	sub_481C0
		add	sp, 6
		mov	ax, di
		jmp	short loc_B75A2

loc_B75A0:
		mov	ax, di

loc_B75A2:
		mov	[bp+var_2], ax
		jmp	short loc_B75A7

loc_B75A7:
		mov	ax, [bp+var_2]
		mov	[si+0Eh], ax

loc_B75AD:
		pop	di
		pop	si
		leave
		retf
sub_B751E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B75B1		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+0Eh], 0
		jz	short loc_B760A
		mov	bx, [si+0Eh]
		mov	al, [bx+52h]
		and	ax, 1
		or	al, al
		jz	short loc_B75DA
		push	word ptr [si+0Eh]
		mov	bx, [si+0Eh]
		mov	bx, [bx+50h]
		call	dword ptr [bx+4]
		add	sp, 2

loc_B75DA:
		cmp	dword ptr [si+10h], 0
		jz	short loc_B75E6
		mov	ax, 1
		jmp	short loc_B75E8

loc_B75E6:
		xor	ax, ax

loc_B75E8:
		or	ax, ax
		jz	short loc_B760A
		cmp	word ptr [si+0Eh], 0
		jz	short loc_B7605
		push	3
		push	word ptr [si+0Eh]
		mov	bx, [si+0Eh]
		mov	bx, [bx+50h]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		jmp	short loc_B7605

loc_B7605:
		mov	word ptr [si+0Eh], 0

loc_B760A:
		pop	si
		pop	bp
		retf
sub_B75B1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B760D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+0Eh], 0
		jz	short loc_B7654
		mov	bx, [si+0Eh]
		mov	al, [bx+52h]
		and	ax, 1
		or	al, al
		jz	short loc_B7636
		push	word ptr [si+0Eh]
		mov	bx, [si+0Eh]
		mov	bx, [bx+50h]
		call	dword ptr [bx+4]
		add	sp, 2

loc_B7636:
		cmp	word ptr [si+0Eh], 0
		jz	short loc_B764F
		push	3
		push	word ptr [si+0Eh]
		mov	bx, [si+0Eh]
		mov	bx, [bx+50h]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		jmp	short loc_B764F

loc_B764F:
		mov	word ptr [si+0Eh], 0

loc_B7654:
		cmp	byte ptr [si+15h], 0
		jz	short loc_B767A
		cmp	dword ptr [si+10h], 0
		jz	short loc_B767A
		push	0
		mov	al, [si+14h]
		push	ax
		mov	ax, si
		add	ax, 10h
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B767A

loc_B767A:
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		pop	si
		pop	bp
		retf
sub_B760D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; EntityTracker_AddEntryObj (sub_BFD41 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants
; et contexte à revérifier ici. — Reprise de STRIKE.EXE : même suite d'instructions, 1
; opérande(s) différent(s) (adresses de données ou constantes) — à vérifier à
; EntityTracker_AddEntryObj (sub_2387E de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, LUE INTEGRALEMENT. RENOMMEE (ancien
; 'Kneeboard_AddEntryObj', ancien nom d'appelant 'Cinematic_LoadCameraDef' egalement a
; reconsiderer). Construit une entree via EntityTracker_EntryConstructObj puis l'insere en
; queue de liste (LinkedListB_InsertAtTail_5F57F).
; ==============================================================================================
EntityTracker_AddEntryObj		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		push	0
		push	cs
		call	near ptr sub_B7380
		add	sp, 4
		mov	[bp+var_2], ax
		push	[bp+var_2]
		push	si
		call	LinkedListB_InsertAtTail_36616
		add	sp, 4
		pop	si
		leave
		retf
EntityTracker_AddEntryObj		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; EntityTracker_AddEntryText (sub_BFD69 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : même suite d'instructions,
; 1 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier à
; EntityTracker_AddEntryText (sub_238A4 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, LUE INTEGRALEMENT. RENOMMEE (ancien
; 'Kneeboard_AddEntryText'). Construit une entree texte via EntityTracker_EntryConstructText
; puis l'insere en queue de liste.
; ==============================================================================================
EntityTracker_AddEntryText		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_4]
		mov	al, [bp+arg_2]
		push	ax
		push	0
		push	cs
		call	near ptr sub_B7410
		add	sp, 6
		mov	[bp+var_2], ax
		push	[bp+var_2]
		push	si
		call	LinkedListB_InsertAtTail_36616
		add	sp, 4
		pop	si
		leave
		retf
EntityTracker_AddEntryText		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B76E5		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_B7728

loc_B76F6:
		mov	bx, [bp+var_2]
		mov	eax, [bx+5]
		les	bx, [bp+arg_2]
		cmp	eax, es:[bx]
		jnz	short loc_B771C
		mov	bx, [bp+var_2]
		mov	eax, [bx+9]
		les	bx, [bp+arg_2]
		cmp	eax, es:[bx+4]
		jnz	short loc_B771C
		mov	ax, 1
		jmp	short loc_B771E

loc_B771C:
		xor	ax, ax

loc_B771E:
		or	al, al
		jz	short loc_B7728
		mov	ax, [bp+var_2]
		pop	si
		leave
		retf

loc_B7728:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_36740
		add	sp, 4
		or	ax, ax
		jnz	short loc_B76F6
		xor	ax, ax
		pop	si
		leave
		retf
sub_B76E5		endp

; START OF FUNCTION CHUNK FOR sub_B76E5
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_B76E5

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B7741		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_B7766

loc_B7752:
		mov	bx, [bp+var_2]
		mov	al, [bx+4]
		cmp	al, [bp+arg_2]
		jnz	short loc_B7766
		mov	bx, [bp+var_2]
		mov	ax, [bx+0Eh]
		pop	si
		leave
		retf

loc_B7766:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_36740
		add	sp, 4
		or	ax, ax
		jnz	short loc_B7752
		xor	ax, ax
		pop	si
		leave
		retf
sub_B7741		endp

; START OF FUNCTION CHUNK FOR sub_B7741
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_B7741

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B777F		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_2], 0
		jmp	short loc_B77A3

loc_B7794:
		mov	bx, [bp+var_2]
		cmp	[bx+0Eh], di
		jnz	short loc_B77A3
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf

loc_B77A3:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_36740
		add	sp, 4
		or	ax, ax
		jnz	short loc_B7794
		xor	ax, ax
		pop	di
		pop	si
		leave
		retf
sub_B777F		endp

; START OF FUNCTION CHUNK FOR sub_B777F
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_B777F

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B77BE		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_B7817

loc_B77CF:
		mov	bx, [bp+var_2]
		mov	eax, [bx+5]
		les	bx, [bp+arg_2]
		cmp	eax, es:[bx]
		jnz	short loc_B77F5
		mov	bx, [bp+var_2]
		mov	eax, [bx+9]
		les	bx, [bp+arg_2]
		cmp	eax, es:[bx+4]
		jnz	short loc_B77F5
		mov	ax, 1
		jmp	short loc_B77F7

loc_B77F5:
		xor	ax, ax

loc_B77F7:
		or	al, al
		jz	short loc_B7817
		mov	bx, [bp+var_2]
		cmp	word ptr [bx+0Eh], 0
		jnz	short loc_B780E
		push	[bp+var_2]
		push	cs
		call	near ptr sub_B751E
		add	sp, 2

loc_B780E:
		mov	bx, [bp+var_2]
		mov	ax, [bx+0Eh]
		pop	si
		leave
		retf

loc_B7817:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_36740
		add	sp, 4
		or	ax, ax
		jnz	short loc_B77CF
		xor	ax, ax
		pop	si
		leave
		retf
sub_B77BE		endp

; START OF FUNCTION CHUNK FOR sub_B77BE
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_B77BE

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B7830		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_B7868

loc_B7841:
		mov	bx, [bp+var_2]
		mov	al, [bx+4]
		cmp	al, [bp+arg_2]
		jnz	short loc_B7868
		mov	bx, [bp+var_2]
		cmp	word ptr [bx+0Eh], 0
		jnz	short loc_B785F
		push	[bp+var_2]
		push	cs
		call	near ptr sub_B751E
		add	sp, 2

loc_B785F:
		mov	bx, [bp+var_2]
		mov	ax, [bx+0Eh]
		pop	si
		leave
		retf

loc_B7868:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_36740
		add	sp, 4
		or	ax, ax
		jnz	short loc_B7841
		xor	ax, ax
		pop	si
		leave
		retf
sub_B7830		endp

; START OF FUNCTION CHUNK FOR sub_B7830
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_B7830

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B7881		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_2], 0
		jmp	short loc_B78A0

loc_B7896:
		mov	bx, [bp+var_2]
		cmp	[bx+0Eh], di
		jnz	short loc_B78A0
		jmp	short loc_B78B1

loc_B78A0:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_36740
		add	sp, 4
		or	ax, ax
		jnz	short loc_B7896

loc_B78B1:
		mov	ax, [bp+var_2]
		mov	[bp+var_4], ax
		jmp	short loc_B78E1

loc_B78B9:
		mov	bx, [bp+var_2]
		mov	al, [bx+4]
		cmp	al, [bp+arg_4]
		jnz	short loc_B78E1
		mov	bx, [bp+var_2]
		cmp	word ptr [bx+0Eh], 0
		jnz	short loc_B78D7
		push	[bp+var_2]
		push	cs
		call	near ptr sub_B751E
		add	sp, 2

loc_B78D7:
		mov	bx, [bp+var_2]
		mov	ax, [bx+0Eh]
		pop	di
		pop	si
		leave
		retf

loc_B78E1:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_36740
		add	sp, 4
		or	ax, ax
		jnz	short loc_B78B9
		mov	[bp+var_2], 0
		jmp	short loc_B7921

loc_B78F9:
		mov	bx, [bp+var_2]
		mov	al, [bx+4]
		cmp	al, [bp+arg_4]
		jnz	short loc_B7921
		mov	bx, [bp+var_2]
		cmp	word ptr [bx+0Eh], 0
		jnz	short loc_B7917
		push	[bp+var_2]
		push	cs
		call	near ptr sub_B751E
		add	sp, 2

loc_B7917:
		mov	bx, [bp+var_2]
		mov	ax, [bx+0Eh]
		pop	di
		pop	si
		leave
		retf

loc_B7921:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_36740
		add	sp, 4
		or	ax, ax
		jz	short loc_B793A
		mov	ax, [bp+var_2]
		cmp	ax, [bp+var_4]
		jnz	short loc_B78F9

loc_B793A:
		xor	ax, ax
		pop	di
		pop	si
		leave
		retf
sub_B7881		endp

; START OF FUNCTION CHUNK FOR sub_B7881
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_B7881

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B7944		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		nop
		push	cs
		call	near ptr sub_B798D
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_B7944		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B7957		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+11h], 14h
		mov	[bp+var_2], 0
		mov	word ptr [si+0Fh], 0
		mov	word ptr [si+12h], 0
		push	ds
		mov	ax, si
		add	ax, 6
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_B7ACF
		add	sp, 6
		mov	ax, [si+12h]
		pop	si
		leave
		retf
sub_B7957		endp

; START OF FUNCTION CHUNK FOR sub_B7957
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_B7957

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B798D		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_B79A8

loc_B799E:
		push	[bp+var_2]
		push	cs
		call	near ptr sub_B75B1
		add	sp, 2

loc_B79A8:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_36740
		add	sp, 4
		or	ax, ax
		jnz	short loc_B799E
		mov	word ptr [si+12h], 0
		pop	si
		leave
		retf
sub_B798D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B79C1		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_B7A0F

loc_B79D3:
		mov	bx, [bp+var_2]
		mov	di, [bx+0Eh]
		cmp	di, [bp+arg_2]
		jnz	short loc_B7A0F
		push	[bp+var_2]
		push	cs
		call	near ptr sub_B760D
		add	sp, 2
		push	0
		push	[bp+var_2]
		push	si
		call	LinkedListB_FindAndDispatch_3663B
		add	sp, 6
		cmp	[si+12h], di
		jnz	short loc_B7A00
		mov	word ptr [si+12h], 0

loc_B7A00:
		mov	ax, [si+0Fh]
		cmp	ax, [bp+var_2]
		jnz	short loc_B7A0D
		mov	word ptr [si+0Fh], 0

loc_B7A0D:
		jmp	short loc_B7A20

loc_B7A0F:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_36740
		add	sp, 4
		or	ax, ax
		jnz	short loc_B79D3

loc_B7A20:
		pop	di
		pop	si
		leave
		retf
sub_B79C1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B7A24		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_B7A51

loc_B7A36:
		mov	bx, [bp+var_2]
		mov	di, [bx+0Eh]
		cmp	di, [bp+arg_2]
		jnz	short loc_B7A51
		push	[bp+var_2]
		push	cs
		call	near ptr sub_B75B1
		add	sp, 2
		mov	ax, [bp+var_2]
		mov	[si+0Fh], ax

loc_B7A51:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_36740
		add	sp, 4
		or	ax, ax
		jnz	short loc_B7A36
		pop	di
		pop	si
		leave
		retf
sub_B7A24		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B7A66		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_B7A94

loc_B7A77:
		push	[bp+var_2]
		push	cs
		call	near ptr sub_B760D
		add	sp, 2
		push	0
		push	[bp+var_2]
		push	si
		call	LinkedListB_FindAndDispatch_3663B
		add	sp, 6
		mov	[bp+var_2], 0

loc_B7A94:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_36740
		add	sp, 4
		or	ax, ax
		jnz	short loc_B7A77
		mov	word ptr [si+12h], 0
		mov	word ptr [si+0Fh], 0
		pop	si
		leave
		retf
sub_B7A66		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B7AB2		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr sub_B7A66
		add	sp, 2
		push	67C8h
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_B7AB2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B7ACF		proc far

var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_B77BE
		add	sp, 6
		mov	di, ax
		or	di, di
		jz	short loc_B7AFF
		push	di
		push	si
		nop
		push	cs
		call	near ptr sub_B7B4B
		add	sp, 4
		mov	[bp+var_1], al

loc_B7AFF:
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
sub_B7ACF		endp

; START OF FUNCTION CHUNK FOR sub_B7ACF
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_B7ACF

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B7B0A		proc far

var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0
		mov	al, [si+11h]
		cmp	al, [bp+arg_2]
		jz	short loc_B7B40
		mov	al, [bp+arg_2]
		push	ax
		push	si
		push	cs
		call	near ptr sub_B7830
		add	sp, 4
		mov	di, ax
		or	di, di
		jz	short loc_B7B40
		push	di
		push	si
		nop
		push	cs
		call	near ptr sub_B7B4B
		add	sp, 4
		mov	[bp+var_1], al

loc_B7B40:
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
sub_B7B0A		endp

; START OF FUNCTION CHUNK FOR sub_B7B0A
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_B7B0A

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B7B4B		proc far

var_8		= word ptr -8
var_6		= dword ptr -6
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_1], 0
		cmp	[si+12h], di
		jnz	short loc_B7B65
		jmp	loc_B7C15

loc_B7B65:
		mov	byte_4C34C, 0
		or	di, di
		jnz	short loc_B7B71
		jmp	loc_B7C15

loc_B7B71:
		mov	[bp+var_6], 100h
		lea	ax, word ptr [bp+var_6]
		push	ax
		push	68AEh
		call	Cockpit_PanAzimuthUpdate_2415A
		add	sp, 4
		cmp	word ptr [si+12h], 0
		jz	short loc_B7B9D
		push	word ptr [si+12h]
		mov	bx, [si+12h]
		mov	bx, [bx+50h]
		call	dword ptr [bx+4]
		add	sp, 2

loc_B7B9D:
		push	di
		mov	bx, [di+50h]
		call	dword ptr [bx]
		add	sp, 2
		or	al, al
		jz	short loc_B7BD5
		push	word ptr [si+12h]
		push	si
		push	cs
		call	near ptr sub_B7A24
		add	sp, 4
		mov	[si+12h], di
		push	di
		mov	bx, [di+50h]
		call	dword ptr [bx+14h]
		add	sp, 2
		mov	[si+11h], al
		push	di
		mov	bx, [di+50h]
		call	dword ptr [bx+10h]
		add	sp, 2
		mov	[bp+var_1], 1
		jmp	short loc_B7C15

loc_B7BD5:
		cmp	word ptr [si+12h], 0
		jz	short loc_B7C15
		mov	ax, [si+0Fh]
		mov	[bp+var_8], ax
		push	di
		push	si
		push	cs
		call	near ptr sub_B7A24
		add	sp, 4
		mov	ax, [bp+var_8]
		mov	[si+0Fh], ax
		push	word ptr [si+12h]
		mov	bx, [si+12h]
		mov	bx, [bx+50h]
		call	dword ptr [bx]
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jnz	short loc_B7C06
		jmp	short loc_B7C15

loc_B7C06:
		push	word ptr [si+12h]
		mov	bx, [si+12h]
		mov	bx, [bx+50h]
		call	dword ptr [bx+10h]
		add	sp, 2

loc_B7C15:
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
sub_B7B4B		endp

; START OF FUNCTION CHUNK FOR sub_B7B4B
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_B7B4B

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B7C20		proc far

var_8		= dword ptr -8
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+12h], 0
		jz	short loc_B7C92
		mov	bx, [si+12h]
		cmp	word ptr [bx+5Ch], 0
		jz	short loc_B7C60
		mov	bx, [si+12h]
		push	word ptr [bx+5Ch]
		mov	bx, [si+12h]
		mov	bx, [bx+5Ch]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 2
		mov	bx, [si+12h]
		push	word ptr [bx+5Ch]
		mov	bx, [si+12h]
		mov	bx, [bx+5Ch]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 2
		jmp	short loc_B7C60

loc_B7C60:
		push	word ptr [si+12h]
		mov	bx, [si+12h]
		mov	bx, [bx+50h]
		call	dword ptr [bx+14h]
		add	sp, 2
		cmp	al, 4
		jz	short loc_B7C92
		sub	sp, 4
		mov	ax, [si+12h]
		add	ax, 5Eh
		mov	di, ax
		mov	eax, [di]
		mov	[bp+var_8], eax
		push	word ptr [si+12h]
		call	sub_481A2
		add	sp, 6
		jmp	short loc_B7C92

loc_B7C92:
		pop	di
		pop	si
		pop	bp
		retf
sub_B7C20		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B7C96		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_B7CB1
		push	14h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_B7CDD

loc_B7CB1:
		mov	word ptr [si], 1E4h
		xor	ax, ax
		mov	[si+4], ax
		mov	[si+2], ax
		mov	word ptr [si], 3598h
		mov	ax, si
		add	ax, 6
		push	ax
		call	sub_1109C
		add	sp, 2
		mov	byte ptr [si+11h], 14h
		mov	word ptr [si+0Fh], 0
		mov	word ptr [si+12h], 0

loc_B7CDD:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_B7C96		endp

; START OF FUNCTION CHUNK FOR sub_B7C96
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_B7C96

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B7CE5		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_B7D1C
		mov	word ptr [si], 3598h
		push	si
		push	cs
		call	near ptr sub_B7AB2
		add	sp, 2
		mov	word ptr [si], 1E4h
		push	si
		call	sub_36702
		add	sp, 2
		test	di, 1
		jz	short loc_B7D1C
		push	si
		call	sub_39C
		add	sp, 2

loc_B7D1C:
		pop	di
		pop	si
		pop	bp
		retf
sub_B7CE5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B7D20		proc far

var_4		= byte ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_2], 0
		mov	word_4F1AC, 0
		mov	word_4F1AE, 0
		mov	word_4F1B0, 13Fh
		mov	word_4F1B2, 0C7h
		push	0
		push	67C8h
		call	TextRenderer_ApplyFormatChange_3584E
		add	sp, 4
		mov	word_4BF76, 0
		push	0
		push	large 524D4143h
		push	di
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		or	ax, ax
		jnz	short loc_B7D76
		jmp	loc_B7E2A

loc_B7D76:
		jmp	short loc_B7DF5

loc_B7D78:
		push	di
		call	ResourceRecord_ComputeAlignedBounds_42BD4
		add	sp, 2
		mov	[bp+var_4], 14h
		cmp	dword ptr [di+6Dh], 524D4143h
		jnz	short loc_B7D94
		mov	ax, 1
		jmp	short loc_B7D96

loc_B7D94:
		xor	ax, ax

loc_B7D96:
		or	ax, ax
		jz	short loc_B7D9E
		mov	[bp+var_4], 0

loc_B7D9E:
		cmp	dword ptr [di+6Dh], 54525453h
		jnz	short loc_B7DAD
		mov	ax, 1
		jmp	short loc_B7DAF

loc_B7DAD:
		xor	ax, ax

loc_B7DAF:
		or	ax, ax
		jz	short loc_B7DC2
		push	di
		mov	ax, si
		add	ax, 6
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4

loc_B7DC2:
		cmp	[bp+var_2], 0
		jz	short loc_B7DDA
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr EntityTracker_AddEntryObj
		add	sp, 4
		mov	[bp+var_2], 0
		jmp	short loc_B7DED

loc_B7DDA:
		cmp	[bp+var_4], 14h
		jz	short loc_B7DED
		push	di
		mov	al, [bp+var_4]
		push	ax
		push	si
		push	cs
		call	near ptr EntityTracker_AddEntryText
		add	sp, 6

loc_B7DED:
		mov	eax, [di+76h]
		mov	[di+65h], eax

loc_B7DF5:
		cmp	word ptr [di+7Ch], 0
		jnz	short loc_B7E06
		push	di
		call	ResourceRecord_ReadPayload_42DC6
		add	sp, 2
		jmp	short loc_B7E1A

loc_B7E06:
		mov	eax, [di+65h]
		mov	bx, [di+7Ch]
		cmp	eax, [bx+0Fh]
		jl	short loc_B7E18
		mov	ax, 1
		jmp	short loc_B7E1A

loc_B7E18:
		xor	ax, ax

loc_B7E1A:
		or	ax, ax
		jnz	short loc_B7E21
		jmp	loc_B7D78

loc_B7E21:
		push	di
		call	ResourceRecord_ReleaseAndClear_42D38
		add	sp, 2

loc_B7E2A:
		pop	di
		pop	si
		leave
		retf
sub_B7D20		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B7E2E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		xor	ax, ax
		pop	bp
		retf
sub_B7E2E		endp

; START OF FUNCTION CHUNK FOR sub_B7E2E
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_B7E2E

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B7E3A		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_B7E96
		cmp	byte ptr [si+15h], 0
		jz	short loc_B7E6F
		cmp	dword ptr [si+10h], 0
		jz	short loc_B7E6F
		push	0
		mov	al, [si+14h]
		push	ax
		mov	ax, si
		add	ax, 10h
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_B7E6F

loc_B7E6F:
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		test	di, 1
		jz	short loc_B7E94
		push	si
		call	sub_39C
		add	sp, 2
		jmp	short loc_B7E94

loc_B7E94:
		jmp	short loc_B7E96

loc_B7E96:
		pop	di
		pop	si
		pop	bp
		retf
sub_B7E3A		endp

; START OF FUNCTION CHUNK FOR sub_B7E3A
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_B7E3A
ovr218		ends

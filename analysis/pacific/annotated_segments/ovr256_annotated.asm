ovr256		segment	para public 'OVERLAY' use16
		assume cs:ovr256
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 9 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à UIWidget_ReleaseWrapper_8DEC0 (sub_8DEC0 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle Memory_TypedFreeWrapper_5C6F3 (41 lignes).
; ==============================================================================================
UIWidget_ReleaseWrapper_97390		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		cmp	[bp+arg_0], 0
		jnz	short loc_973BB
		push	1
		push	0
		push	2
		push	large 98h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jz	short loc_97411

loc_973BB:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 5BEh
		mov	dword ptr es:[bx+2], 0
		mov	byte ptr es:[bx+6], 2
		mov	byte ptr es:[bx+7], 0
		mov	dword ptr es:[bx+8], 0
		mov	byte ptr es:[bx+0Ch], 0
		mov	word ptr es:[bx+0Dh], 0
		mov	byte ptr es:[bx+53h], 0
		mov	word ptr es:[bx+88h], 0
		mov	dword ptr es:[bx+84h], 0
		mov	word ptr es:[bx+92h], 0
		mov	dword ptr es:[bx+94h], 0

loc_97411:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	bp
		retf
UIWidget_ReleaseWrapper_97390		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_97419		proc far

var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_21		= byte ptr -21h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_13		= byte ptr -13h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_1		= byte ptr -1
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2Ah
		push	si
		push	di
		mov	di, [bp+arg_4]
		push	0
		push	large 49444152h
		push	di
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_9743C
		jmp	loc_97742

loc_9743C:
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+0Ch], 1
		mov	[bp+var_1], 0
		push	0
		push	large 534B5341h
		push	di
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_97460
		jmp	loc_9750A

loc_97460:
		cmp	byte_7C9A1, 0
		jz	short loc_9748E
		cmp	dword_7C99C, 0
		jz	short loc_9748E
		push	0
		mov	al, byte_7C9A0
		push	ax
		mov	eax, dword_7C99C
		mov	[bp+var_6], eax
		lea	ax, word ptr [bp+var_6]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_9748E

loc_9748E:
		mov	dword_7C99C, 0
		mov	byte_7C9A1, 0
		mov	dword_7C9A2, 0
		mov	eax, [di+72h]
		mov	[bp+var_A], eax
		push	1
		push	0
		push	2
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_E+2], dx
		mov	word ptr [bp+var_E], ax
		mov	eax, [bp+var_E]
		mov	dword_7C99C, eax
		mov	byte_7C9A0, 2
		mov	byte_7C9A1, 1
		mov	dword_7C9A2, 0
		mov	eax, [bp+var_A]
		mov	dword_7C9A2, eax
		push	0
		mov	al, byte_7C9A0
		push	ax
		push	large dword_7C99C
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		call	ResourceRecord_ReadDwordFieldB_6DB78
		add	sp, 6

loc_9750A:
		push	0
		push	large 48435053h
		push	di
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_9752D
		push	di
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+53h], al

loc_9752D:
		push	0
		push	large 4F464E49h
		push	di
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_97579
		push	di
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	[bp+var_1], al
		push	di
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	ax, word ptr [bp+arg_0]
		add	ax, 54h
		push	word ptr [bp+arg_0+2]
		push	ax
		push	di
		call	ResourceRecord_ReadViaHelper_6DB52
		add	sp, 6
		mov	ax, word ptr [bp+arg_0]
		add	ax, 74h
		push	word ptr [bp+arg_0+2]
		push	ax
		push	di
		call	ResourceRecord_ReadViaHelper_6DB52
		add	sp, 6

loc_97579:
		push	0
		push	large 5354504Fh
		push	di
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_975C8
		les	bx, word ptr [bp+arg_0]
		mov	ax, [di+72h]
		mov	es:[bx+88h], ax
		cmp	word ptr es:[bx+88h], 8
		jle	short loc_975A8
		mov	word ptr es:[bx+88h], 8

loc_975A8:
		xor	si, si
		jmp	short loc_975BE

loc_975AC:
		push	di
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		les	bx, word ptr [bp+arg_0]
		add	bx, si
		mov	es:[bx+8Ah], al
		inc	si

loc_975BE:
		les	bx, word ptr [bp+arg_0]
		cmp	es:[bx+88h], si
		jg	short loc_975AC

loc_975C8:
		push	0
		push	large 5347534Dh
		push	di
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_975E0
		jmp	loc_9773B

loc_975E0:
		cmp	[bp+var_1], 0
		jnz	short loc_975E9
		jmp	loc_976BA

loc_975E9:
		cmp	dword_7C9A6, 0
		jz	short loc_975F6
		mov	ax, 1
		jmp	short loc_975F8

loc_975F6:
		xor	ax, ax

loc_975F8:
		or	ax, ax
		jz	short loc_97637
		mov	eax, dword_7C9A6
		mov	[bp+var_12], eax
		mov	al, byte_7C9AA
		mov	[bp+var_13], al
		les	bx, word ptr [bp+arg_0]
		mov	eax, [bp+var_12]
		mov	es:[bx+2], eax
		mov	al, [bp+var_13]
		mov	es:[bx+6], al
		mov	byte ptr es:[bx+7], 0
		mov	dword ptr es:[bx+8], 0
		mov	eax, dword_7C9AC
		mov	es:[bx+8], eax
		jmp	loc_9772F

loc_97637:
		cmp	dword ptr [di+72h], 0
		jg	short loc_97641
		jmp	loc_9772F

loc_97641:
		mov	eax, [di+72h]
		mov	[bp+var_18], eax
		push	1
		push	0
		push	3
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_1C+2], dx
		mov	word ptr [bp+var_1C], ax
		mov	eax, [bp+var_1C]
		mov	dword_7C9A6, eax
		mov	byte_7C9AA, 3
		mov	byte_7C9AB, 1
		mov	dword_7C9AC, 0
		mov	eax, [bp+var_18]
		mov	dword_7C9AC, eax
		mov	eax, dword_7C9A6
		mov	[bp+var_20], eax
		mov	al, byte_7C9AA
		mov	[bp+var_21], al
		les	bx, word ptr [bp+arg_0]
		mov	eax, [bp+var_20]
		mov	es:[bx+2], eax
		mov	al, [bp+var_21]
		mov	es:[bx+6], al
		mov	byte ptr es:[bx+7], 0
		mov	dword ptr es:[bx+8], 0
		mov	eax, dword_7C9AC
		jmp	short loc_97705

loc_976BA:
		cmp	dword ptr [di+72h], 0
		jle	short loc_9772F
		mov	eax, [di+72h]
		mov	[bp+var_26], eax
		push	1
		push	0
		push	3
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_2A+2], dx
		mov	word ptr [bp+var_2A], ax
		les	bx, word ptr [bp+arg_0]
		mov	eax, [bp+var_2A]
		mov	es:[bx+2], eax
		mov	byte ptr es:[bx+6], 3
		mov	byte ptr es:[bx+7], 1
		mov	dword ptr es:[bx+8], 0
		mov	eax, [bp+var_26]

loc_97705:
		mov	es:[bx+8], eax
		push	0
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+6]
		push	ax
		push	large es:[bx+2]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		call	ResourceRecord_ReadDwordFieldB_6DB78
		add	sp, 6

loc_9772F:
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_97746
		add	sp, 4

loc_9773B:
		push	di
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx

loc_97742:
		pop	di
		pop	si
		leave
		retf
sub_97419		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_97746		proc far

var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+6]
		push	ax
		push	large es:[bx+2]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+8]
		mov	[bp+var_8], eax
		xor	dx, dx
		jmp	short loc_9778D

loc_9777D:
		mov	ax, dx
		shl	ax, 1
		les	bx, [bp+arg_0]
		add	bx, ax
		mov	word ptr es:[bx+0Fh], 0
		inc	dx

loc_9778D:
		cmp	dx, 22h
		jb	short loc_9777D
		xor	si, si
		jmp	short loc_977DB

loc_97796:
		les	bx, [bp+var_4]
		add	bx, si
		mov	al, es:[bx]
		mov	ah, 0
		mov	dx, ax
		inc	si
		cmp	dx, 22h
		jnb	short loc_977B5
		shl	ax, 1
		les	bx, [bp+arg_0]
		add	bx, ax
		mov	es:[bx+0Fh], si
		jmp	short loc_977CD

loc_977B5:
		push	7013h
		jmp	short loc_977C7

loc_977BA:
		movsx	eax, si
		cmp	eax, [bp+var_8]
		jl	short loc_977CD
		push	7014h

loc_977C7:
		call	sub_1DDFE
		pop	cx

loc_977CD:
		mov	ax, si
		inc	si
		les	bx, [bp+var_4]
		add	bx, ax
		cmp	byte ptr es:[bx], 0
		jnz	short loc_977BA

loc_977DB:
		movsx	eax, si
		cmp	eax, [bp+var_8]
		jl	short loc_97796
		pop	si
		leave
		retf
sub_97746		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 7 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PilotProfile_LoadFromPROF_VersionGate_8E351 (sub_8E351
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; 104 lignes - point d'entree de chargement PROF avec verification de version : construit un
; StreamReader, valide le chunk PROF (tag 0x464F5250), recherche le sous-chunk VERS (tag
; 0x53524556) et exige la valeur exacte 0x200 (version 2.0) - erreur 0x7015 si
; absent/different, erreur 0x7016 si PROF absent. Si la version est correcte, dispatche vers
; un chargeur polymorphe via un appel de vtable (call dword ptr [bx]) plutot que de parser
; directement _AI_/RADI/ATRB lui-meme - probable point d'entree generique reutilise par
; plusieurs types d'objets ayant chacun leur propre implementation de suite du chargement.
; Anciennement nommee AITargeting_OpenConfigFile.
; ==============================================================================================
PilotProfile_LoadFromPROF_VersionGate_977E8		proc far

var_F8		= word ptr -0F8h
var_9B		= dword ptr -9Bh
var_97		= dword ptr -97h
var_93		= dword ptr -93h
var_7E		= word ptr -7Eh
var_7C		= word ptr -7Ch
var_50		= word ptr -50h
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0F8h
		push	si
		mov	dx, [bp+arg_4]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0Dh], dx
		push	seg seg225
		push	0
		mov	bx, dx
		push	large [bx+6]
		push	ds
		push	offset aINTEL
		lea	ax, [bp+var_50]
		push	ax
		call	sub_29540
		add	sp, 0Eh
		lea	ax, [bp+var_F8]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_F8], 508h
		mov	[bp+var_97], 100h
		mov	[bp+var_9B], 0
		mov	[bp+var_F8], 520h
		mov	[bp+var_7C], 0
		xor	ax, ax
		mov	[bp+var_7E], ax
		movsx	eax, ax
		mov	[bp+var_93], eax
		push	large 464F5250h
		lea	ax, [bp+var_50]
		push	ax
		lea	ax, [bp+var_F8]
		push	ax
		call	ResourceRecord_InitAndValidate_6D646
		add	sp, 8
		or	ax, ax
		jz	short loc_978BA
		xor	si, si
		push	0
		push	large 53524556h
		lea	ax, [bp+var_F8]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_97895
		lea	ax, [bp+var_F8]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	si, ax

loc_97895:
		cmp	si, 200h
		jz	short loc_978A4
		push	7015h
		call	sub_1DDFE
		pop	cx

loc_978A4:
		lea	ax, [bp+var_F8]
		push	ax
		push	large [bp+arg_0]
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx]
		call	dword ptr [bx]
		add	sp, 6
		jmp	short loc_978C3

loc_978BA:
		push	7016h
		call	sub_1DDFE
		pop	cx

loc_978C3:
		mov	[bp+var_F8], 520h
		lea	ax, [bp+var_F8]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		push	0
		lea	ax, [bp+var_F8]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		pop	si
		leave
		retf
PilotProfile_LoadFromPROF_VersionGate_977E8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_978E6		proc far

var_DA		= word ptr -0DAh
var_B3		= word ptr -0B3h
var_A4		= word ptr -0A4h
var_8A		= byte ptr -8Ah
var_66		= word ptr -66h
var_16		= byte ptr -16h
var_14		= word ptr -14h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0DAh
		push	si
		push	di
		mov	[bp+var_2], 0FFFFh
		push	large 0C7013Fh
		push	large 0
		lea	ax, [bp+var_DA]
		push	ax
		call	sub_74C99
		add	sp, 0Ah
		cmp	[bp+var_A4], 0
		jnz	short loc_97918
		mov	[bp+var_8A], 0
		jmp	short loc_97918

loc_97918:
		push	large 2Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_9796F
		push	large 0B00C8h
		push	large 0
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [si+0Eh], 0C9Ah
		mov	dword ptr [si+24h], 0
		push	ds
		push	offset aSelectResponse
		push	si
		call	sub_74B18
		add	sp, 6
		mov	word ptr [si+1Eh], 0
		mov	word ptr [si+20h], 0
		mov	ax, word_7921A
		mov	[si+2Ah], ax
		mov	[si+28h], ax
		mov	word ptr [si+22h], 0FFFFh
		mov	ax, si
		jmp	short loc_97971

loc_9796F:
		mov	ax, si

loc_97971:
		push	ax
		lea	ax, [bp+var_DA]
		push	ax
		call	sub_74C8A
		add	sp, 6
		xor	di, di
		jmp	loc_97AE0

loc_97984:
		push	di
		push	large [bp+arg_4]
		call	Text_ComputeMessageWidth
		add	sp, 6
		push	dx
		push	ax
		mov	ax, di
		inc	ax
		push	ax
		push	0C5Ch
		lea	ax, [bp+var_66]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 0Ah
		cmp	di, 11h
		jl	short loc_979AE
		jmp	loc_97A37

loc_979AE:
		push	0
		mov	ax, di
		imul	ax, ax, 0Bh
		add	ax, 0Bh
		mov	[bp+var_4], ax
		mov	[bp+var_6], di
		push	30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_979CF
		jmp	loc_97AB8

loc_979CF:
		lea	ax, [bp+var_66]
		mov	word ptr [bp+var_A+2], ds
		mov	word ptr [bp+var_A], ax
		push	large 0B0064h
		push	[bp+var_4]
		push	0
		push	si
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [si+0Eh], 0C9Ah
		mov	dword ptr [si+24h], 0
		push	large [bp+var_A]
		push	si
		call	sub_74B18
		add	sp, 6
		mov	word ptr [si+1Eh], 0
		mov	word ptr [si+20h], 0
		mov	ax, word_7921A
		mov	[si+2Ah], ax
		mov	[si+28h], ax
		mov	word ptr [si+22h], 0FFFFh
		mov	word ptr [si+0Eh], 0C66h
		lea	ax, [bp+var_2]
		mov	[si+2Ch], ax
		mov	ax, [bp+var_6]

loc_97A2C:
		mov	[si+2Eh], ax
		mov	ax, si
		jmp	loc_97ABA
		jmp	loc_97AB8

loc_97A37:
		push	0
		mov	ax, di
		add	ax, 0FFEFh
		imul	ax, ax, 0Bh
		add	ax, 0Bh
		mov	[bp+var_C], ax
		mov	[bp+var_E], di
		push	30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_97AB8
		lea	ax, [bp+var_66]
		mov	word ptr [bp+var_12+2], ds
		mov	word ptr [bp+var_12], ax
		push	large 0B0064h
		push	[bp+var_C]
		push	6Eh
		push	si
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [si+0Eh], 0C9Ah
		mov	dword ptr [si+24h], 0
		push	large [bp+var_12]
		push	si
		call	sub_74B18
		add	sp, 6
		mov	word ptr [si+1Eh], 0
		mov	word ptr [si+20h], 0
		mov	ax, word_7921A
		mov	[si+2Ah], ax
		mov	[si+28h], ax
		mov	word ptr [si+22h], 0FFFFh
		mov	word ptr [si+0Eh], 0C66h
		lea	ax, [bp+var_2]
		mov	[si+2Ch], ax
		mov	ax, [bp+var_E]
		jmp	loc_97A2C

loc_97AB8:
		mov	ax, si

loc_97ABA:
		push	ax
		lea	ax, [bp+var_DA]
		push	ax
		call	sub_74C8A
		add	sp, 6
		push	[bp+var_B3]
		mov	ax, di
		add	ax, 2
		push	ax
		lea	ax, [bp+var_DA]
		push	ax
		call	sub_74C76
		add	sp, 6
		inc	di

loc_97AE0:
		cmp	di, 22h
		jge	short loc_97AE8
		jmp	loc_97984

loc_97AE8:
		lea	ax, [bp+var_DA]
		push	ax
		call	sub_74AD7
		pop	cx
		call	sub_7372A
		lea	ax, [bp+var_DA]
		push	ax
		call	sub_74ADC
		pop	cx
		lea	ax, [bp+var_DA]
		push	ax
		call	sub_74CC6
		pop	cx
		jmp	short loc_97B1F

loc_97B10:
		push	0
		lea	ax, [bp+var_DA]
		push	ax
		call	sub_74CE4
		add	sp, 4

loc_97B1F:
		cmp	[bp+var_2], 0FFFFh
		jz	short loc_97B10
		mov	ax, word_7CADA
		mov	[bp+var_14], ax
		mov	al, byte ptr [bp+var_2]
		mov	[bp+var_16], al
		les	bx, word ptr [bp+arg_4]
		cmp	byte ptr es:[bx+0Ch], 0
		jz	short loc_97B4D
		push	ax
		push	[bp+var_14]
		push	word ptr [bp+arg_4+2]
		push	bx
		call	RadioQueue_AllocateSlot
		add	sp, 8
		jmp	short loc_97B4D

loc_97B4D:
		lea	ax, [bp+var_DA]
		push	ax
		call	sub_74CEE
		pop	cx
		lea	ax, [bp+var_DA]
		push	ax
		call	sub_74AD7
		pop	cx
		call	sub_73725
		lea	ax, [bp+var_DA]
		push	ax
		call	sub_74ADC
		pop	cx
		push	2
		lea	ax, [bp+var_DA]
		push	ax
		call	sub_74CA8
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_978E6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_97B86		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_97BC4
		mov	word ptr [si+0Eh], 0C9Ah
		push	large [si+24h]
		call	sub_3C0
		add	sp, 4
		mov	dword ptr [si+24h], 0
		push	si
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		test	di, 1
		jz	short loc_97BC4
		push	si
		call	sub_3B2
		pop	cx
		jmp	short loc_97BC4

loc_97BC4:
		pop	di
		pop	si
		pop	bp
		retf
sub_97B86		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_97BC8		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_97C04
		mov	word ptr [si+0Eh], 0C9Ah
		push	large [si+24h]
		call	sub_3C0
		add	sp, 4
		mov	dword ptr [si+24h], 0
		push	si
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		test	di, 1
		jz	short loc_97C04
		push	si
		call	sub_3B2
		pop	cx

loc_97C04:
		pop	di
		pop	si
		pop	bp
		retf
sub_97BC8		endp
ovr256		ends

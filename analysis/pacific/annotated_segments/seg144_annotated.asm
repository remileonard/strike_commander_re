seg144		segment	para public 'CODE' use16
		assume cs:seg144
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 3, 0, 0, 59h

loc_619C4:
		db 5Fh, 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_619C8		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+1Dh]
		call	sub_65A86
		pop	cx
		mov	word ptr [si+1Dh], 0
		push	[bp+arg_2]
		call	CRT_Strdup
		pop	cx
		mov	[si+1Dh], ax
		push	word ptr [si+1Dh]
		call	CRT_Strupr_2EE0
		pop	cx
		mov	ax, [si+1Dh]
		mov	[si+1Fh], ax
		pop	si
		pop	bp
		retf
sub_619C8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_619FB		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_61A18
		push	855h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_61A18
		jmp	loc_61AA9

loc_61A18:
		mov	word ptr [si], 4035h
		mov	word ptr [si+4], 402Dh
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], 4031h
		mov	word ptr [si+2], 0
		mov	word ptr [si+0Ah], 168h
		mov	word ptr [si+0Ah], 174h
		mov	word ptr [si+0Ah], 184h
		mov	word ptr [si], 4055h
		mov	word ptr [si+0Ah], 4075h
		mov	dword ptr [si+11h], 0
		mov	byte ptr [si+15h], 2
		mov	byte ptr [si+16h], 0
		mov	dword ptr [si+17h], 0
		mov	word ptr [si], 3FF9h
		mov	word ptr [si+0Ah], 401Dh
		mov	word ptr [si+21h], 3FD5h
		mov	dword ptr [si+31h], 0
		mov	byte ptr [si+35h], 2
		mov	byte ptr [si+36h], 0
		mov	dword ptr [si+37h], 0
		mov	word ptr [si+23h], 0
		mov	word ptr [si+21h], 3FE5h
		xor	eax, eax
		mov	[si+83Eh], eax
		mov	[si+842h], eax
		push	si
		nop
		push	cs
		call	near ptr sub_61C5B
		pop	cx

loc_61AA9:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_619FB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_61AAE		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_61AC8
		push	855h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_61B1E

loc_61AC8:
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		call	Layer_Construct_66985
		add	sp, 8
		mov	word ptr [si], 3FF9h
		mov	word ptr [si+0Ah], 401Dh
		mov	word ptr [si+21h], 3FD5h
		mov	dword ptr [si+31h], 0
		mov	byte ptr [si+35h], 2
		mov	byte ptr [si+36h], 0
		mov	dword ptr [si+37h], 0
		mov	word ptr [si+23h], 0
		mov	word ptr [si+21h], 3FE5h
		xor	eax, eax
		mov	[si+83Eh], eax
		mov	[si+842h], eax
		push	si
		nop
		push	cs
		call	near ptr sub_61C5B
		pop	cx

loc_61B1E:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_61AAE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_61B23		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_61B40
		push	855h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_61B40
		jmp	loc_61BDD

loc_61B40:
		mov	word ptr [si], 4035h
		mov	word ptr [si+4], 402Dh
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], 4031h
		mov	word ptr [si+2], 0
		mov	word ptr [si+0Ah], 168h
		mov	word ptr [si+0Ah], 174h
		mov	word ptr [si+0Ah], 184h
		mov	word ptr [si], 4055h
		mov	word ptr [si+0Ah], 4075h
		mov	dword ptr [si+11h], 0
		mov	byte ptr [si+15h], 2
		mov	byte ptr [si+16h], 0
		mov	dword ptr [si+17h], 0
		mov	word ptr [si], 3FF9h
		mov	word ptr [si+0Ah], 401Dh
		mov	word ptr [si+21h], 3FD5h
		mov	dword ptr [si+31h], 0
		mov	byte ptr [si+35h], 2
		mov	byte ptr [si+36h], 0
		mov	dword ptr [si+37h], 0
		mov	word ptr [si+23h], 0
		mov	word ptr [si+21h], 3FE5h
		xor	eax, eax
		mov	[si+83Eh], eax
		mov	[si+842h], eax
		push	si
		nop
		push	cs
		call	near ptr sub_61C5B
		pop	cx
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr sub_61C9D
		add	sp, 4

loc_61BDD:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_61B23		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_61BE2		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_61BFC
		push	855h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_61C56

loc_61BFC:
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_2]
		push	si
		call	Layer_Construct_66985
		add	sp, 8
		mov	word ptr [si], 3FF9h
		mov	word ptr [si+0Ah], 401Dh
		mov	word ptr [si+21h], 3FD5h
		mov	dword ptr [si+31h], 0
		mov	byte ptr [si+35h], 2
		mov	byte ptr [si+36h], 0
		mov	dword ptr [si+37h], 0
		mov	word ptr [si+23h], 0
		mov	word ptr [si+21h], 3FE5h
		xor	eax, eax
		mov	[si+83Eh], eax
		mov	[si+842h], eax
		push	[bp+arg_4]
		push	si
		push	cs
		call	near ptr sub_619C8
		add	sp, 4

loc_61C56:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_61BE2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_61C5B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		xor	ax, ax
		mov	[si+1Dh], ax
		mov	[si+1Fh], ax
		mov	ax, 0FFFFh
		mov	[si+846h], ax
		mov	[si+84Ch], ax
		mov	[si+84Ah], ax
		mov	word ptr [si+84Eh], 0
		mov	word ptr [si+848h], 22h
		mov	byte ptr [si+852h], 0
		mov	byte ptr [si+853h], 0
		mov	byte ptr [si+854h], 1
		mov	word ptr [si+850h], 0
		pop	si
		pop	bp
		retf
sub_61C5B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_61C9D		proc far

var_BA		= word ptr -0BAh
var_5D		= dword ptr -5Dh
var_59		= dword ptr -59h
var_55		= dword ptr -55h
var_4D		= dword ptr -4Dh
var_48		= dword ptr -48h
var_44		= dword ptr -44h
var_12		= word ptr -12h
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0BAh
		push	si
		mov	si, [bp+arg_0]
		lea	ax, [bp+var_BA]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_BA], 508h
		mov	[bp+var_59], 100h
		mov	[bp+var_5D], 0
		mov	[bp+var_BA], 520h
		push	1
		push	3E6Ch
		lea	ax, [bp+var_BA]
		push	ax
		mov	bx, [bp+var_BA]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_BA]
		push	ax
		call	sub_6DC9A
		pop	cx
		push	0
		push	large 45434146h
		lea	ax, [bp+var_BA]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		jmp	short loc_61D3C

loc_61D05:
		lea	ax, [bp+var_BA]
		push	ax
		lea	ax, [bp+var_12]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		push	[bp+arg_2]
		lea	ax, [bp+var_12]
		push	ax
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jz	short loc_61D46
		mov	eax, [bp+var_44]
		mov	[bp+var_55], eax
		lea	ax, [bp+var_BA]
		push	ax
		call	ResourceRecord_ComputeAlignedBounds_6DC3A
		pop	cx

loc_61D3C:
		cmp	[bp+var_4D], 50414853h
		jz	short loc_61D05

loc_61D46:
		mov	eax, [bp+var_48]
		mov	[bp+var_4], eax
		push	1
		push	0
		push	2
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		mov	eax, [bp+var_8]
		mov	[si+11h], eax
		mov	byte ptr [si+15h], 2
		mov	byte ptr [si+16h], 1
		mov	dword ptr [si+17h], 0
		mov	eax, [bp+var_4]
		mov	[si+17h], eax
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_BA]
		push	ax
		call	ResourceRecord_ReadDwordFieldB_6DB78
		add	sp, 6
		mov	[bp+var_BA], 520h
		lea	ax, [bp+var_BA]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		push	0
		lea	ax, [bp+var_BA]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		pop	si
		leave
		retf
sub_61C9D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_61DCE		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, [bp+arg_2]
		mov	[si+854h], al
		pop	si
		pop	bp
		retf
sub_61DCE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_61DDF		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		cmp	dx, 22h
		jl	short loc_61DF7
		cmp	dx, 24h
		jg	short loc_61DF7
		mov	[si+848h], dx

loc_61DF7:
		pop	si
		pop	bp
		retf
sub_61DDF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_61DFA		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+84Ch], ax
		pop	si
		pop	bp
		retf
sub_61DFA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_61E0B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+1Dh]
		pop	si
		pop	bp
		retf
sub_61E0B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PlayerComponent_LoadFieldsWithRetryEWrapper_A4A75 (sub_A4A75 de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, appelle
; AircraftDynamics_ReadMassChunk_A4A20 (lecteur du chunk DYNM/masse).
; ==============================================================================================
PlayerComponent_LoadFieldsWithRetryEWrapper_61E18		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	[bp+arg_2]
		push	ax
		push	cs
		call	near ptr sub_619C8
		add	sp, 4
		pop	bp
		retf
PlayerComponent_LoadFieldsWithRetryEWrapper_61E18		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_61E2B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+84Eh], 0
		jnz	short loc_61E70
		cmp	byte ptr [si+852h], 0
		jz	short loc_61E70
		mov	al, [si+853h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_61E70
		mov	ax, si
		add	ax, 21h
		push	ax
		call	sub_5E0F0
		pop	cx
		mov	[si+84Ah], ax
		push	0FFFFh
		mov	ax, si
		add	ax, 21h
		push	ax
		mov	bx, [si+21h]
		call	dword ptr [bx+10h]
		add	sp, 4
		mov	byte ptr [si+853h], 1

loc_61E70:
		inc	word ptr [si+84Eh]
		cmp	byte ptr [si+853h], 0
		jz	short loc_61E7F
		mov	al, 1
		jmp	short loc_61E81

loc_61E7F:
		mov	al, 0

loc_61E81:
		pop	si
		pop	bp
		retf
sub_61E2B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_61E84		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word_79E69
		mov	ax, si
		add	ax, 21h
		push	ax
		call	VoicePlayer_SetDriver_5D3C8
		add	sp, 4
		push	[bp+arg_2]
		mov	ax, si
		add	ax, 21h
		push	ax
		call	sub_5DC2D
		add	sp, 4
		mov	byte ptr [si+852h], 1
		pop	si
		pop	bp
		retf
sub_61E84		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TalkingHead_AttachVoice_9CF7 (sub_9CF7 de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-21.
; Met la tête parlante en mode voix : pilote du lecteur intégré (+21h,
; VoicePlayer_SetDriver_7A3D), charge la réplique arg_2 avec sa table de bouches pour la
; cadence arg_4 (VoicePlayer_LoadWithLipSync_7D52), +850h = 1 (réplique prête), compteur +84Eh
; = 0.
; ==============================================================================================
TalkingHead_AttachVoice_61EB6		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word_79E69
		mov	ax, si
		add	ax, 21h
		push	ax
		call	VoicePlayer_SetDriver_5D3C8
		add	sp, 4
		push	[bp+arg_4]
		push	[bp+arg_2]
		mov	ax, si
		add	ax, 21h
		push	ax
		call	sub_5D743
		add	sp, 6
		mov	byte ptr [si+852h], 1
		mov	word ptr [si+84Eh], 0
		pop	si
		pop	bp
		retf
TalkingHead_AttachVoice_61EB6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; TalkingHead_SetBaseFrame_9D32 (sub_9D32 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — far, LUE 2026-10-17. Image de base +2118 et image
; affichée +2124 = arg_2.
; ==============================================================================================
TalkingHead_SetBaseFrame_61EF1		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+846h], ax
		mov	[si+84Ch], ax
		pop	si
		pop	bp
		retf
TalkingHead_SetBaseFrame_61EF1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_61F06		proc far

var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_2], di
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		push	large 0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	word_7AF7C
		call	sub_6A514
		add	sp, 0Ch
		cmp	word ptr [si+84Ch], 0FFFFh
		jz	short loc_61F8C
		mov	[bp+var_6], di
		mov	ax, [bp+arg_4]
		mov	[bp+var_8], ax
		mov	dx, [si+84Ch]
		cmp	dx, 0FFFFh
		jz	short loc_61F8C
		push	dx
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_8]
		push	[bp+var_6]
		push	word_7AF7C
		call	sub_6A514
		add	sp, 0Ch
		jmp	short loc_61F8C

loc_61F8C:
		cmp	word ptr [si+84Ah], 0FFFFh
		jz	short loc_61FD1
		mov	[bp+var_A], di
		mov	ax, [bp+arg_4]
		mov	[bp+var_C], ax
		mov	dx, [si+84Ah]
		cmp	dx, 0FFFFh
		jz	short loc_61FD1
		push	dx
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_C]
		push	[bp+var_A]
		push	word_7AF7C
		call	sub_6A514
		add	sp, 0Ch
		jmp	short loc_61FD1

loc_61FD1:
		mov	[bp+var_E], 0
		jmp	short loc_61FED

loc_61FD8:
		push	[bp+arg_4]
		push	di
		mov	bx, [bp+var_E]
		push	word ptr [bx+6]
		mov	bx, [bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6

loc_61FED:
		lea	ax, [bp+var_E]
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		call	LinkedList_Helper_68976
		add	sp, 4
		or	ax, ax
		jnz	short loc_61FD8
		pop	di
		pop	si
		leave
		retf
sub_61F06		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_62007		proc far

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	[bp+arg_4]
		push	di
		push	si
		push	cs
		call	near ptr sub_61F06
		add	sp, 6
		mov	[bp+var_2], di
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		push	large 10000h
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	word_7AF7C
		call	sub_6A514
		add	sp, 0Ch
		mov	[bp+var_6], di
		mov	ax, [bp+arg_4]
		mov	[bp+var_8], ax
		mov	dx, [si+848h]
		cmp	dx, 0FFFFh
		jz	short loc_62095
		push	dx
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_8]
		push	[bp+var_6]
		push	word_7AF7C
		call	sub_6A514
		add	sp, 0Ch
		jmp	short loc_62095

loc_62095:
		cmp	word ptr [si+850h], 0
		jz	short loc_620DA
		mov	[bp+var_A], di
		mov	ax, [bp+arg_4]
		mov	[bp+var_C], ax
		mov	dx, [si+850h]
		cmp	dx, 0FFFFh
		jz	short loc_620DA
		push	dx
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_C]
		push	[bp+var_A]
		push	word_7AF7C
		call	sub_6A514
		add	sp, 0Ch
		jmp	short loc_620DA

loc_620DA:
		pop	di
		pop	si
		leave
		retf
sub_62007		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_620DE		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		pop	cx
		mov	[bp+var_2], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		pop	cx
		mov	[bp+var_4], ax
		push	ax
		push	[bp+var_2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+20h]
		add	sp, 6
		pop	si
		leave
		retf
sub_620DE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6210C		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+0Ch]
		add	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [si+0Eh]
		add	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		push	ax
		push	[bp+var_2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+20h]
		add	sp, 6
		pop	si
		leave
		retf
sub_6210C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_62138		proc far

var_6		= word ptr -6
var_4		= word ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	di, [bp+arg_0]
		lea	ax, [bp+var_4]
		push	ss
		push	ax
		push	ds
		push	large offset unk_7A596
		mov	cx, 3
		call	CRT_Fmemcpy
		mov	word ptr [di+84Ah], 0FFFFh
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 1Eh
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_62185
		cmp	byte ptr [di+854h], 0
		jz	short loc_62185
		mov	word ptr [di+84Ch], 0Ch
		jmp	short loc_6218D

loc_62185:
		mov	ax, [di+846h]
		mov	[di+84Ch], ax

loc_6218D:
		cmp	word ptr [di+846h], 14h
		jle	short loc_6219C
		mov	ax, [di+846h]
		mov	[di+84Ch], ax

loc_6219C:
		cmp	byte ptr [di+853h], 0
		jz	short loc_621E9
		mov	ax, di
		add	ax, 21h
		push	ax
		mov	bx, [di+21h]
		call	dword ptr [bx+4]
		pop	cx
		or	al, al
		jz	short loc_621C6
		mov	ax, di
		add	ax, 21h
		push	ax
		call	sub_5E0F0
		pop	cx
		mov	[di+84Ah], ax
		jmp	short loc_621D1

loc_621C6:
		mov	word ptr [di+84Ah], 0FFFFh
		mov	byte ptr [di+853h], 0

loc_621D1:
		cmp	word ptr [di+84Ah], 0FFFEh
		jz	short loc_621DB
		jmp	loc_62295

loc_621DB:
		mov	byte ptr [di+853h], 0
		mov	word ptr [di+84Ah], 0FFFFh
		jmp	loc_62295

loc_621E9:
		cmp	word ptr [di+1Dh], 0
		jnz	short loc_621F2
		jmp	loc_62295

loc_621F2:
		mov	bx, [di+1Fh]
		mov	al, [bx]
		mov	byte ptr [bp+var_4], al
		or	al, al
		jnz	short loc_62201
		jmp	loc_62295

loc_62201:
		inc	word ptr [di+1Fh]
		cbw
		mov	[bp+var_6], ax
		mov	cx, 4
		mov	bx, offset word_622A0

loc_6220E:
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_6]
		jz	short loc_6221D
		add	bx, 2
		loop	short loc_6220E
		jmp	short loc_62268

loc_6221D:
		jmp	word ptr cs:[bx+8] ; switch jump

loc_62221:
		mov	bx, [di+1Fh]
		cmp	byte ptr [bx], 7Ah
		jg	short loc_6222E
		cmp	byte ptr [bx], 61h
		jge	short loc_6223B

loc_6222E:
		mov	bx, [di+1Fh]
		inc	word ptr [di+1Fh]
		mov	al, [bx]
		mov	byte ptr [bp+var_4], al
		jmp	short loc_62268

loc_6223B:
		mov	bx, [di+1Fh]
		cmp	byte ptr [bx], 72h
		jnz	short loc_62268
		jmp	short loc_6225F

loc_62245:
		jmp	short loc_62265

loc_62247:
		mov	bx, [di+1Fh]
		cmp	byte ptr [bx], 68h
		jnz	short loc_62268
		mov	word ptr [di+84Ah], 9
		jmp	short loc_62265

loc_62257:
		mov	bx, [di+1Fh]
		cmp	byte ptr [bx], 68h
		jnz	short loc_62268

loc_6225F:
		mov	word ptr [di+84Ah], 6

loc_62265:
		inc	word ptr [di+1Fh]

loc_62268:
		cmp	word ptr [di+84Ah], 0FFFFh
		jnz	short loc_62295
		cmp	byte ptr [bp+var_4], 61h
		jl	short loc_62295
		cmp	byte ptr [bp+var_4], 7Ah
		jg	short loc_62295
		mov	al, byte ptr [bp+var_4]
		cbw
		add	ax, word_7A332
		mov	bx, ax
		mov	al, [bx-61h]
		cbw
		add	ax, 0FFD0h
		mov	[di+84Ah], ax
		add	word ptr [di+84Ah], 2

loc_62295:
		push	di
		call	sub_66617
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_62138		endp

; START OF FUNCTION CHUNK FOR sub_62138
word_622A0	dw 63h
		dw 65h
		dw 68h
		dw 74h
off_622A8	dw offset loc_62257
		dw offset loc_62221
		dw offset loc_62245
		dw offset loc_62247
; END OF FUNCTION CHUNK FOR sub_62138

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_622B0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+1Dh], 0
		jz	short loc_622C9
		mov	bx, [si+1Fh]
		cmp	byte ptr [bx], 0
		jz	short loc_622C9
		mov	al, 0
		jmp	short loc_622CB

loc_622C9:
		mov	al, 1

loc_622CB:
		pop	si
		pop	bp
		retf
sub_622B0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_622CE		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_62357
		mov	word ptr [si], 3FF9h
		mov	word ptr [si+0Ah], 401Dh
		push	word ptr [si+1Dh]
		call	sub_65A86
		pop	cx
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+21h], 3FD5h
		mov	ax, si
		add	ax, 21h
		push	ax
		call	sub_5D510
		pop	cx
		cmp	byte ptr [si+36h], 0
		jz	short loc_6232B
		cmp	dword ptr [si+31h], 0
		jz	short loc_6232B
		push	0
		mov	al, [si+35h]
		push	ax
		mov	ax, si
		add	ax, 31h
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_6232B

loc_6232B:
		mov	dword ptr [si+31h], 0
		mov	byte ptr [si+36h], 0
		mov	dword ptr [si+37h], 0
		push	0
		push	si
		call	sub_66AAD
		add	sp, 4
		test	di, 1
		jz	short loc_62357
		push	si
		call	sub_3B2
		pop	cx

loc_62357:
		pop	di
		pop	si
		pop	bp
		retf
sub_622CE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6235B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_62375
		push	857h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_62384

loc_62375:
		push	si
		push	cs
		call	near ptr sub_619FB
		pop	cx
		mov	word ptr [si], 3FA1h
		mov	word ptr [si+0Ah], 3FC5h

loc_62384:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_6235B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_62389		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_623A3
		push	857h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_623BA

loc_623A3:
		push	large 0
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_61AAE
		add	sp, 8
		mov	word ptr [si], 3FA1h
		mov	word ptr [si+0Ah], 3FC5h

loc_623BA:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_62389		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à AnimLayer_Construct_2E5CF (sub_2E5CF de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-17.
; Calque animé : Layer_Construct_2DF9B puis table de méthodes dseg 16248, dont +28 =
; AnimLayer_Advance_2E607. L'image affichée +27 commence à 0.
; ==============================================================================================
AnimLayer_Construct_623BF		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_623D9
		push	857h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_623F3

loc_623D9:
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_61AAE
		add	sp, 8
		mov	word ptr [si], 3FA1h
		mov	word ptr [si+0Ah], 3FC5h

loc_623F3:
		mov	ax, si
		pop	si
		pop	bp
		retf
AnimLayer_Construct_623BF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_623F8		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_62412
		push	857h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_62432

loc_62412:
		push	si
		push	cs
		call	near ptr sub_619FB
		pop	cx
		mov	word ptr [si], 3FA1h
		mov	word ptr [si+0Ah], 3FC5h
		push	si
		push	cs
		call	near ptr sub_61C5B
		pop	cx
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_61C9D
		add	sp, 4

loc_62432:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_623F8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_62437		proc far

var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_2], di
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		push	large 0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	word_7AF7C
		call	sub_6A514
		add	sp, 0Ch
		cmp	word ptr [si+84Ah], 0FFFFh
		jz	short loc_624BD
		mov	[bp+var_6], di
		mov	ax, [bp+arg_4]
		mov	[bp+var_8], ax
		mov	dx, [si+84Ah]
		cmp	dx, 0FFFFh
		jz	short loc_624BD
		push	dx
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_8]
		push	[bp+var_6]
		push	word_7AF7C
		call	sub_6A514
		add	sp, 0Ch
		jmp	short loc_624BD

loc_624BD:
		mov	[bp+var_A], 0
		jmp	short loc_624D9

loc_624C4:
		push	[bp+arg_4]
		push	di
		mov	bx, [bp+var_A]
		push	word ptr [bx+6]
		mov	bx, [bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6

loc_624D9:
		lea	ax, [bp+var_A]
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		call	LinkedList_Helper_68976
		add	sp, 4
		or	ax, ax
		jnz	short loc_624C4
		pop	di
		pop	si
		leave
		retf
sub_62437		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Layer_DrawAtOwnPos_2E202 (sub_2E202 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants
; et contexte à revérifier ici. — far, LUE 2026-10-17. Dessine le calque à sa position absolue
; (méthodes +4 et +8 = x et y absolus, Layer_GetX_2E139 / Layer_GetY_2E15D) par
; Layer_DrawAt_2E181.
; ==============================================================================================
Layer_DrawAtOwnPos_624F3		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		pop	cx
		mov	[bp+var_2], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		pop	cx
		mov	[bp+var_4], ax
		push	ax
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr sub_62437
		add	sp, 6
		pop	si
		leave
		retf
Layer_DrawAtOwnPos_624F3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_62520		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+0Ch]
		add	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [si+0Eh]
		add	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		push	ax
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr sub_62437
		add	sp, 6
		pop	si
		leave
		retf
sub_62520		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6254B		proc far

var_4		= word ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		lea	ax, [bp+var_4]
		push	ss
		push	ax
		push	ds
		push	offset unk_7A599
		mov	cx, 3
		call	CRT_Fmemcpy
		mov	word ptr [si+84Ah], 0FFFFh
		cmp	word ptr [si+1Dh], 0
		jz	short loc_625AA
		mov	bx, [si+1Fh]
		mov	al, [bx]
		mov	byte ptr [bp+var_4], al
		or	al, al
		jz	short loc_625AA
		inc	word ptr [si+1Fh]
		cmp	word ptr [si+84Ah], 0FFFFh
		jnz	short loc_625AA
		cmp	byte ptr [bp+var_4], 61h
		jl	short loc_625AA
		cmp	byte ptr [bp+var_4], 7Ah
		jg	short loc_625AA
		cbw
		add	ax, word_7A334
		mov	bx, ax
		mov	al, [bx-61h]
		cbw
		add	ax, 0FFD0h
		mov	[si+84Ah], ax
		inc	word ptr [si+84Ah]

loc_625AA:
		push	si
		call	sub_66617
		pop	cx
		pop	si
		leave
		retf
sub_6254B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_625B4		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_625CD
		push	1Dh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_62623

loc_625CD:
		mov	word ptr [si], 4035h
		mov	word ptr [si+4], 402Dh
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], 4031h
		mov	word ptr [si+2], 0
		mov	word ptr [si+0Ah], 168h
		mov	word ptr [si+0Ah], 174h
		mov	word ptr [si+0Ah], 184h
		mov	word ptr [si], 4055h
		mov	word ptr [si+0Ah], 4075h
		mov	dword ptr [si+11h], 0
		mov	byte ptr [si+15h], 2
		mov	byte ptr [si+16h], 0
		mov	dword ptr [si+17h], 0
		mov	word ptr [si], 3F71h
		mov	word ptr [si+0Ah], 3F91h

loc_62623:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_625B4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_62628		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_62641
		push	1Dh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_62656

loc_62641:
		push	[bp+arg_2]
		push	si
		call	Layer_ConstructAtOrigin_6687F
		add	sp, 4
		mov	word ptr [si], 3F71h
		mov	word ptr [si+0Ah], 3F91h

loc_62656:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_62628		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6265B		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_62674
		push	1Dh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_62692

loc_62674:
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		call	ImageLayer_Construct_66A16
		add	sp, 0Ah
		mov	word ptr [si], 3F71h
		mov	word ptr [si+0Ah], 3F91h

loc_62692:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_6265B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_62697		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		pop	cx
		mov	[bp+var_2], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		pop	cx
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		mov	[bp+var_6], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_8], ax
		push	large 0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_8]
		push	[bp+var_6]
		push	word_7AF7C
		call	sub_6A514
		add	sp, 0Ch
		push	si
		call	Layer_DrawAtOwnPos_66BEC
		pop	cx
		pop	si
		leave
		retf
sub_62697		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_626F5		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		call	sub_6AB8C
		cmp	ax, [si+1Bh]
		jnz	short loc_62722
		mov	ax, 1
		jmp	short loc_62724

loc_62722:
		xor	ax, ax

loc_62724:
		pop	si
		pop	bp
		retf
sub_626F5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_62727		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_62740
		push	21h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_62796

loc_62740:
		mov	word ptr [si], 4035h
		mov	word ptr [si+4], 402Dh
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], 4031h
		mov	word ptr [si+2], 0
		mov	word ptr [si+0Ah], 168h
		mov	word ptr [si+0Ah], 174h
		mov	word ptr [si+0Ah], 184h
		mov	word ptr [si], 4055h
		mov	word ptr [si+0Ah], 4075h
		mov	dword ptr [si+11h], 0
		mov	byte ptr [si+15h], 2
		mov	byte ptr [si+16h], 0
		mov	dword ptr [si+17h], 0
		mov	word ptr [si], 3F41h
		mov	word ptr [si+0Ah], 3F61h

loc_62796:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_62727		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6279B		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_627B4
		push	21h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_627D0

loc_627B4:
		push	[bp+arg_2]
		push	si
		call	Layer_ConstructAtOrigin_6687F
		add	sp, 4
		mov	word ptr [si], 3F41h
		mov	word ptr [si+0Ah], 3F61h
		push	si
		nop
		push	cs
		call	near ptr sub_628B2
		pop	cx

loc_627D0:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_6279B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_627D5		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_627EE
		push	21h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_62816

loc_627EE:
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		call	Layer_Construct_66985
		add	sp, 8
		mov	word ptr [si], 3F41h
		mov	word ptr [si+0Ah], 3F61h
		mov	al, [bp+arg_8]
		mov	[si+1Eh], al
		push	si
		nop
		push	cs
		call	near ptr sub_628B2
		pop	cx

loc_62816:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_627D5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6281B		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		pop	cx
		mov	[bp+var_2], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		pop	cx
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		mov	[bp+var_6], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_8], ax
		push	large 0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_8]
		push	[bp+var_6]
		push	word_7AF7C
		call	sub_6A514
		add	sp, 0Ch
		cmp	byte ptr [si+1Dh], 0
		jz	short loc_6287C
		push	si
		call	Layer_DrawAtOwnPos_66BEC
		pop	cx

loc_6287C:
		pop	si
		leave
		retf
sub_6281B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6287F		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+1Dh], 0
		jz	short loc_628A8
		mov	ax, [si+1Fh]
		dec	ax
		cmp	ax, [si+1Bh]
		jbe	short loc_6289A
		inc	word ptr [si+1Bh]
		jmp	short loc_628A8

loc_6289A:
		mov	al, [si+1Eh]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_628A8
		mov	word ptr [si+1Bh], 1

loc_628A8:
		push	si
		call	sub_66617
		pop	cx
		pop	si
		pop	bp
		retf
sub_6287F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_628B2		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		call	sub_6AB8C
		mov	[si+1Fh], ax
		cmp	word ptr [si+1Fh], 1
		jle	short loc_628E9
		mov	byte ptr [si+1Dh], 1
		mov	word ptr [si+1Bh], 1
		jmp	short loc_628ED

loc_628E9:
		mov	byte ptr [si+1Dh], 0

loc_628ED:
		pop	si
		pop	bp
		retf
sub_628B2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_628F0		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_62909
		push	15h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_62953

loc_62909:
		mov	word ptr [si], 4035h
		mov	word ptr [si+4], 402Dh
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], 4031h
		mov	word ptr [si+2], 0
		mov	word ptr [si+0Ah], 168h
		mov	word ptr [si+0Ah], 174h
		mov	word ptr [si+0Ah], 184h
		mov	word ptr [si], 3F11h
		mov	word ptr [si+0Ah], 3F31h
		mov	ax, [bp+arg_2]
		mov	[si+11h], ax
		mov	word ptr [si+0Ch], 0
		mov	word ptr [si+0Eh], 0
		mov	word ptr [si+13h], 0

loc_62953:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_628F0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_62958		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_62974
		push	15h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_629CC

loc_62974:
		mov	word ptr [si], 4035h
		mov	word ptr [si+4], 402Dh
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], 4031h
		mov	word ptr [si+2], 0
		mov	word ptr [si+0Ah], 168h
		mov	word ptr [si+0Ah], 174h
		mov	word ptr [si+0Ah], 184h
		mov	word ptr [si], 3F11h
		mov	word ptr [si+0Ah], 3F31h
		mov	ax, [bp+arg_2]
		mov	[si+11h], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		mov	[si+0Ch], ax
		mov	ax, [bp+var_4]
		mov	[si+0Eh], ax
		mov	word ptr [si+13h], 0

loc_629CC:
		mov	ax, si
		pop	si
		leave
		retf
sub_62958		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_629D1		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_62A0B
		mov	word ptr [si], 3F11h
		mov	word ptr [si+0Ah], 3F31h
		push	si
		push	si
		call	sub_665AB
		add	sp, 4
		push	0
		push	si
		call	sub_6653B
		add	sp, 4
		test	di, 1
		jz	short loc_62A0B
		push	si
		call	sub_3B2
		pop	cx

loc_62A0B:
		pop	di
		pop	si
		pop	bp
		retf
sub_629D1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_62A0F		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_62A0F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à TextLayer_SetText_ADB7
; (sub_ADB7 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — far, LUE 2026-10-21. Pose la chaîne d'un TextLayer : [arg_0 + 13h] = arg_2 (pointeur
; proche).
; ==============================================================================================
TextLayer_SetText_62A17		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+13h], ax
		pop	si
		pop	bp
		retf
TextLayer_SetText_62A17		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_62A27		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word ptr [si+13h], 0
		jz	short loc_62A50
		push	word ptr [si+13h]
		push	[bp+arg_4]
		push	di
		push	3E76h
		push	word ptr [si+11h]
		call	sub_75D4A
		add	sp, 0Ah

loc_62A50:
		mov	[bp+var_2], 0
		jmp	short loc_62A6C

loc_62A57:
		push	[bp+arg_4]
		push	di
		mov	bx, [bp+var_2]
		push	word ptr [bx+6]
		mov	bx, [bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6

loc_62A6C:
		lea	ax, [bp+var_2]
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		call	LinkedList_Helper_68976
		add	sp, 4
		or	ax, ax
		jnz	short loc_62A57
		pop	di
		pop	si
		leave
		retf
sub_62A27		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_62A86		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jz	short loc_62AA4
		push	word ptr [si+2]
		mov	bx, [si+2]
		mov	bx, [bx]
		call	dword ptr [bx+4]
		pop	cx
		add	ax, [si+0Ch]
		jmp	short loc_62AA7

loc_62AA4:
		mov	ax, [si+0Ch]

loc_62AA7:
		pop	si
		pop	bp
		retf
sub_62A86		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_62AAA		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jz	short loc_62AC8
		push	word ptr [si+2]
		mov	bx, [si+2]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		pop	cx
		add	ax, [si+0Eh]
		jmp	short loc_62ACB

loc_62AC8:
		mov	ax, [si+0Eh]

loc_62ACB:
		pop	si
		pop	bp
		retf
sub_62AAA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Layer_DrawAtOwnPos_2E202 (sub_2E202 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants
; et contexte à revérifier ici. — far, LUE 2026-10-17. Dessine le calque à sa position absolue
; (méthodes +4 et +8 = x et y absolus, Layer_GetX_2E139 / Layer_GetY_2E15D) par
; Layer_DrawAt_2E181.
; ==============================================================================================
Layer_DrawAtOwnPos_62ACE		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		pop	cx
		mov	[bp+var_2], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		pop	cx
		mov	[bp+var_4], ax
		push	ax
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr sub_62A27
		add	sp, 6
		pop	si
		leave
		retf
Layer_DrawAtOwnPos_62ACE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_62AFB		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+0Ch]
		add	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [si+0Eh]
		add	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		push	ax
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr sub_62A27
		add	sp, 6
		pop	si
		leave
		retf
sub_62AFB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; StreamReader_DestructWrapper_3D231 (sub_3D231 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à StreamReader_DestructWrapper_659C1 (sub_659C1 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, référencée via vtable
; (DATA XREF seg339) — enveloppe appelant StreamReader_Destruct_638FF. Référencée directement
; par TextRenderer_Main (sub_27477, seg048).
; ==============================================================================================
StreamReader_DestructWrapper_62B26		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		call	sub_66617
		pop	cx
		pop	bp
		retf
StreamReader_DestructWrapper_62B26		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_62B35		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_62B35		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_62B3D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+0Ch], ax
		mov	ax, [bp+arg_4]
		mov	[si+0Eh], ax
		pop	si
		pop	bp
		retf
sub_62B3D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_62B53		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_62B6C
		push	17h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_62B86

loc_62B6C:
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_628F0
		add	sp, 4
		mov	word ptr [si], 3EE1h
		mov	word ptr [si+0Ah], 3F01h
		mov	ax, [bp+arg_4]
		mov	[si+15h], ax

loc_62B86:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_62B53		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_62B8B		proc far

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+15h]
		mov	[bp+var_2], ax
		mov	bx, [si+11h]
		mov	[bx+14h], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		pop	cx
		mov	[bp+var_4], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		pop	cx
		mov	[bp+var_6], ax
		push	ax
		push	[bp+var_4]
		push	si
		push	cs
		call	near ptr sub_62A27
		add	sp, 6
		pop	si
		leave
		retf
sub_62B8B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_62BC4		proc far

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+15h]
		mov	[bp+var_2], ax
		mov	bx, [si+11h]
		mov	[bx+14h], ax
		mov	ax, [si+0Ch]
		add	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		mov	ax, [si+0Eh]
		add	ax, [bp+arg_4]
		mov	[bp+var_6], ax
		push	ax
		push	[bp+var_4]
		push	si
		push	cs
		call	near ptr sub_62A27
		add	sp, 6
		pop	si
		leave
		retf
sub_62BC4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_62BFB		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_62C14
		push	1Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_62C6E

loc_62C14:
		mov	word ptr [si], 4035h
		mov	word ptr [si+4], 402Dh
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], 4031h
		mov	word ptr [si+2], 0
		mov	word ptr [si+0Ah], 168h
		mov	word ptr [si+0Ah], 174h
		mov	word ptr [si+0Ah], 184h
		mov	word ptr [si], 4055h
		mov	word ptr [si+0Ah], 4075h
		mov	dword ptr [si+11h], 0
		mov	byte ptr [si+15h], 2
		mov	byte ptr [si+16h], 0
		mov	dword ptr [si+17h], 0
		mov	word ptr [si], 3EB1h
		mov	word ptr [si+0Ah], 3ED1h
		mov	byte ptr [si+1Dh], 0

loc_62C6E:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_62BFB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_62C73		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_62C8C
		push	1Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_62CA5

loc_62C8C:
		push	[bp+arg_2]
		push	si
		call	Layer_ConstructAtOrigin_6687F
		add	sp, 4
		mov	word ptr [si], 3EB1h
		mov	word ptr [si+0Ah], 3ED1h
		mov	byte ptr [si+1Dh], 0

loc_62CA5:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_62C73		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_62CAA		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_62CC3
		push	1Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_62CE5

loc_62CC3:
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		call	ImageLayer_Construct_66A16
		add	sp, 0Ah
		mov	word ptr [si], 3EB1h
		mov	word ptr [si+0Ah], 3ED1h
		mov	byte ptr [si+1Dh], 0

loc_62CE5:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_62CAA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_62CEA		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+1Dh], 1
		pop	si
		pop	bp
		retf
sub_62CEA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_62CF8		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+1Dh], 0
		jz	short loc_62D30
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		call	sub_6AB8C
		mov	[bp+var_2], ax
		dec	ax
		cmp	[si+1Bh], ax
		jnb	short loc_62D30
		inc	word ptr [si+1Bh]

loc_62D30:
		push	si
		call	sub_66CAD
		pop	cx
		pop	si
		leave
		retf
sub_62CF8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_62D3A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		call	sub_6AB8C
		dec	ax
		cmp	ax, [si+1Bh]
		jnz	short loc_62D68
		mov	ax, 1
		jmp	short loc_62D6A

loc_62D68:
		xor	ax, ax

loc_62D6A:
		pop	si
		pop	bp
		retf
sub_62D3A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_62D6D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_62D86
		push	79h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_62DDC

loc_62D86:
		mov	word ptr [si], 4035h
		mov	word ptr [si+4], 402Dh
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], 4031h
		mov	word ptr [si+2], 0
		mov	word ptr [si+0Ah], 168h
		mov	word ptr [si+0Ah], 174h
		mov	word ptr [si+0Ah], 184h
		mov	word ptr [si], 4055h
		mov	word ptr [si+0Ah], 4075h
		mov	dword ptr [si+11h], 0
		mov	byte ptr [si+15h], 2
		mov	byte ptr [si+16h], 0
		mov	dword ptr [si+17h], 0
		mov	word ptr [si], 3E81h
		mov	word ptr [si+0Ah], 3EA1h

loc_62DDC:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_62D6D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_62DE1		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_62DFA
		push	79h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_62E16

loc_62DFA:
		push	[bp+arg_2]
		push	si
		call	Layer_ConstructAtOrigin_6687F
		add	sp, 4
		mov	word ptr [si], 3E81h
		mov	word ptr [si+0Ah], 3EA1h
		push	si
		nop
		push	cs
		call	near ptr PointerLayer_LoadHandPoints_62F7E
		pop	cx

loc_62E16:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_62DE1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05. Calque du commandant à la carte (commande 17 des conversations) :
; Layer_Construct, tables de méthodes 3E81h / 3EA1h, cible x → +111, y → +113, groupe de
; calques → +119 ; PointerLayer_LoadHandPoints_62F7E.
; ==============================================================================================
PointerLayer_Construct_62E1B		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_62E34
		push	79h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_62E65

loc_62E34:
		push	large 0
		push	[bp+arg_2]
		push	si
		call	Layer_Construct_66985
		add	sp, 8
		mov	word ptr [si], 3E81h
		mov	word ptr [si+0Ah], 3EA1h
		mov	ax, [bp+arg_4]
		mov	[si+6Fh], ax
		mov	ax, [bp+arg_6]
		mov	[si+71h], ax
		mov	ax, [bp+arg_8]
		mov	[si+77h], ax
		push	si
		nop
		push	cs
		call	near ptr PointerLayer_LoadHandPoints_62F7E
		pop	cx

loc_62E65:
		mov	ax, si
		pop	si
		pop	bp
		retf
PointerLayer_Construct_62E1B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_62E6A		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_62EAA
		mov	word ptr [si], 3E81h
		mov	word ptr [si+0Ah], 3EA1h
		push	si
		mov	bx, [si]
		call	dword ptr [bx+14h]
		pop	cx
		push	word ptr [si+1Dh]
		call	sub_3B2
		pop	cx
		push	0
		push	si
		call	sub_66AAD
		add	sp, 4
		test	di, 1
		jz	short loc_62EAA
		push	si
		call	sub_3B2
		pop	cx

loc_62EAA:
		pop	di
		pop	si
		pop	bp
		retf
sub_62E6A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_62EAE		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+16h], 0
		jz	short loc_62EDB
		cmp	dword ptr [si+11h], 0
		jz	short loc_62EDB
		push	0
		mov	al, [si+15h]
		push	ax
		mov	ax, si
		add	ax, 11h
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_62EDB

loc_62EDB:
		mov	dword ptr [si+11h], 0
		mov	byte ptr [si+16h], 0
		mov	dword ptr [si+17h], 0
		pop	si
		pop	bp
		retf
sub_62EAE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05. Méthode de dessin : PointerLayer_DrawStick_630DA (baguette), puis
; sub_6A514 avec l'image 0 (mot 0 laissé sur la pile par push large 0 / add sp, 0Ah), puis
; Layer_DrawAtOwnPos_66BEC (image courante [calque+27]).
; ==============================================================================================
PointerLayer_Draw_62EF2		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		pop	cx
		mov	[bp+var_2], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		pop	cx
		mov	[bp+var_4], ax
		push	si
		nop
		push	cs
		call	near ptr PointerLayer_DrawStick_630DA
		pop	cx
		mov	ax, [bp+var_2]
		mov	[bp+var_6], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_8], ax
		push	large 0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_8]
		push	[bp+var_6]
		push	word_7AF7C
		call	sub_6A514
		add	sp, 0Ch
		push	si
		call	Layer_DrawAtOwnPos_66BEC
		pop	cx
		pop	si
		leave
		retf
PointerLayer_Draw_62EF2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05. Étape suivante ([calque+31] + 1 tant qu'elle est inférieure au nombre −
; 1), image courante [calque+27] = liste[étape].
; ==============================================================================================
PointerLayer_Advance_62F57		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	ax, [di+21h]
		dec	ax
		cmp	[di+1Fh], ax
		jge	short loc_62F6B
		inc	word ptr [di+1Fh]

loc_62F6B:
		mov	ax, [di+1Fh]
		shl	ax, 1
		mov	bx, [di+1Dh]
		add	bx, ax
		mov	ax, [bx]
		mov	[di+1Bh], ax
		pop	di
		pop	si
		pop	bp
		retf
PointerLayer_Advance_62F57		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05. Lit GAMEFLOW\\PTR.IFF (nom « ptr », chunk DATA) : x, y (mots) du point
; de la main de chaque image, rangés en [calque+35+4×image].
; ==============================================================================================
PointerLayer_LoadHandPoints_62F7E		proc far

var_F8		= word ptr -0F8h
var_A8		= word ptr -0A8h
var_4B		= dword ptr -4Bh
var_47		= dword ptr -47h
var_43		= dword ptr -43h
var_2E		= word ptr -2Eh
var_2C		= word ptr -2Ch
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0F8h
		push	si
		push	di
		mov	si, [bp+arg_0]
		lea	ax, [bp+var_A8]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_A8], 508h
		mov	[bp+var_47], 100h
		mov	[bp+var_4B], 0
		mov	[bp+var_A8], 520h
		mov	[bp+var_2C], 0
		xor	ax, ax
		mov	[bp+var_2E], ax
		movsx	eax, ax
		mov	[bp+var_43], eax
		push	51h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	offset aPtr
		push	1
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_F8]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_F8]
		push	ax
		lea	ax, [bp+var_A8]
		push	ax
		mov	bx, [bp+var_A8]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_A8]
		push	ax
		call	sub_6DC9A
		pop	cx
		push	0
		push	large 41544144h
		lea	ax, [bp+var_A8]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		xor	di, di
		jmp	short loc_63053

loc_6302C:
		lea	ax, [bp+var_A8]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	bx, di
		shl	bx, 2
		mov	[bx+si+23h], ax
		lea	ax, [bp+var_A8]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	bx, di
		shl	bx, 2
		mov	[bx+si+25h], ax
		inc	di

loc_63053:
		cmp	di, 13h
		jl	short loc_6302C
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+21h], 0
		mov	word ptr [si+1Fh], 0
		mov	[bp+var_A8], 520h
		lea	ax, [bp+var_A8]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		push	0
		lea	ax, [bp+var_A8]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
PointerLayer_LoadHandPoints_62F7E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05. Écart |point de la main de la dernière image de la liste − cible| en x
; → [calque+115] et en y → [calque+117].
; ==============================================================================================
PointerLayer_StickOffset_6308B		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+21h]
		dec	ax
		shl	ax, 1
		mov	bx, [si+1Dh]
		add	bx, ax
		mov	bx, [bx]
		shl	bx, 2
		mov	ax, [bx+si+23h]
		sub	ax, [si+6Fh]
		mov	[bp+var_2], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		mov	[si+73h], ax
		mov	ax, [si+21h]
		dec	ax
		shl	ax, 1
		mov	bx, [si+1Dh]
		add	bx, ax
		mov	bx, [bx]
		shl	bx, 2
		mov	ax, [bx+si+25h]
		sub	ax, [si+71h]
		mov	[bp+var_4], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		mov	[si+75h], ax
		pop	si
		leave
		retf
PointerLayer_StickOffset_6308B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05. Baguette : trait de couleur 15 (sub_69F22) depuis le point de la main
; de l'image courante ; à la dernière étape ([calque+31] = [calque+33] − 1) jusqu'à (x, y −
; [groupe+6]), sinon jusqu'au point de la main moins ([calque+115], [calque+117]).
; ==============================================================================================
PointerLayer_DrawStick_630DA		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	ax, [di+1Bh]
		shl	ax, 2
		mov	bx, di
		add	bx, ax
		mov	dx, [bx+23h]
		mov	ax, [di+1Bh]
		shl	ax, 2
		mov	bx, di
		add	bx, ax
		mov	cx, [bx+25h]
		mov	ax, [di+21h]
		dec	ax
		cmp	[di+1Fh], ax
		jge	short loc_63113
		mov	ax, dx
		sub	ax, [di+73h]
		mov	si, ax
		mov	ax, cx
		sub	ax, [di+75h]
		jmp	short loc_6311F

loc_63113:
		mov	si, [di+6Fh]
		mov	ax, [di+71h]
		mov	bx, [di+77h]
		sub	ax, [bx+6]

loc_6311F:
		mov	bx, ax
		push	0Fh
		push	bx
		push	si
		push	cx
		push	dx
		push	word_7AF7C
		call	sub_69F22
		add	sp, 0Ch
		pop	di
		pop	si
		pop	bp
		retf
PointerLayer_DrawStick_630DA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05. Alloue la liste de n images ([calque+29]) et range n en [calque+33].
; ==============================================================================================
PointerLayer_AllocImageList_63137		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, di
		shl	ax, 1
		push	ax
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[si+1Dh], ax
		mov	[si+21h], di
		pop	di
		pop	si
		pop	bp
		retf
PointerLayer_AllocImageList_63137		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_63157		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+20h], 0
		jz	short loc_6318F
		push	si
		call	LoopAnimLayer_Advance_670C0
		pop	cx
		cmp	byte ptr [si+1Dh], 0
		jnz	short loc_63182
		push	si
		call	sub_6718A
		pop	cx
		or	al, al
		jz	short loc_631E0

loc_6317C:
		mov	byte ptr [si+20h], 0
		jmp	short loc_631E0

loc_63182:
		push	si
		call	sub_67173
		pop	cx
		or	al, al
		jz	short loc_631E0
		jmp	short loc_6317C

loc_6318F:
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 3E8h
		mov	ebx, 8000h
		cdq
		idiv	ebx
		cmp	ax, [si+1Eh]
		jnb	short loc_631E0
		push	117Dh
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_631D5
		push	117Dh
		call	GameVar_ClearFlag_56520
		pop	cx
		push	1B45h
		call	GameVar_SetFlag_5646D
		pop	cx
		mov	word ptr [si+1Eh], 0
		jmp	short loc_631E0

loc_631D5:
		mov	byte ptr [si+20h], 1
		push	si
		call	LoopAnimLayer_Advance_670C0
		pop	cx

loc_631E0:
		pop	si
		pop	bp
		retf
sub_63157		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_631E3		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_63213
		mov	word ptr [si], 3780h
		mov	word ptr [si+0Ah], 37A0h
		push	0
		push	si
		call	Scene_Destruct_67140
		add	sp, 4
		test	di, 1
		jz	short loc_63213
		push	si
		call	sub_3B2
		pop	cx

loc_63213:
		pop	di
		pop	si
		pop	bp
		retf
sub_631E3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_63217		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+20h], 0
		jz	short loc_63233
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		call	sub_66C19
		add	sp, 6

loc_63233:
		pop	si
		pop	bp
		retf
sub_63217		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_63236		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+20h], 0
		jz	short loc_6324A
		push	si
		call	Layer_DrawAtOwnPos_66BEC
		pop	cx

loc_6324A:
		pop	si
		pop	bp
		retf
sub_63236		endp

; ----------------------------------------------------------------------

sub_6324D		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	PointerLayer_Draw_62EF2
sub_6324D		endp

; ----------------------------------------------------------------------

sub_63259		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_66C88
sub_63259		endp

; ----------------------------------------------------------------------

sub_63265		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_DrawAtOwnPos_66BEC
sub_63265		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_63271		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_6329A
		push	0
		push	si
		call	sub_66AAD
		add	sp, 4
		test	di, 1
		jz	short loc_6329A
		push	si
		call	sub_3B2
		pop	cx
		jmp	short loc_6329A

loc_6329A:
		pop	di
		pop	si
		pop	bp
		retf
sub_63271		endp

; ----------------------------------------------------------------------

sub_6329E		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	sub_66C19
sub_6329E		endp

; ----------------------------------------------------------------------

sub_632AA		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_66C88
sub_632AA		endp

; ----------------------------------------------------------------------

sub_632B6		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_DrawAtOwnPos_66BEC
sub_632B6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_632C2		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_632EB
		push	0
		push	si
		nop
		push	cs
		call	near ptr sub_629D1
		add	sp, 4
		test	di, 1
		jz	short loc_632EB
		push	si
		call	sub_3B2
		pop	cx
		jmp	short loc_632EB

loc_632EB:
		pop	di
		pop	si
		pop	bp
		retf
sub_632C2		endp

; ----------------------------------------------------------------------

sub_632EF		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_62BC4
sub_632EF		endp

; ----------------------------------------------------------------------

sub_632FB		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_62B35
sub_632FB		endp

; ----------------------------------------------------------------------

sub_63307		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_62B8B
sub_63307		endp

; ----------------------------------------------------------------------

sub_63313		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_62AFB
sub_63313		endp

; ----------------------------------------------------------------------

sub_6331F		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_62B35
sub_6331F		endp

; ----------------------------------------------------------------------

sub_6332B		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	Layer_DrawAtOwnPos_62ACE
sub_6332B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_63337		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_63367
		mov	word ptr [si], 3F41h
		mov	word ptr [si+0Ah], 3F61h
		push	0
		push	si
		call	sub_66AAD
		add	sp, 4
		test	di, 1
		jz	short loc_63367
		push	si
		call	sub_3B2
		pop	cx

loc_63367:
		pop	di
		pop	si
		pop	bp
		retf
sub_63337		endp

; ----------------------------------------------------------------------

sub_6336B		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_6281B
sub_6336B		endp

; ----------------------------------------------------------------------

sub_63377		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_66C88
sub_63377		endp

; ----------------------------------------------------------------------

sub_63383		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_DrawAtOwnPos_66BEC
sub_63383		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6338F		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_633B8
		push	0
		push	si
		call	sub_66AAD
		add	sp, 4
		test	di, 1
		jz	short loc_633B8
		push	si
		call	sub_3B2
		pop	cx
		jmp	short loc_633B8

loc_633B8:
		pop	di
		pop	si
		pop	bp
		retf
sub_6338F		endp

; ----------------------------------------------------------------------

sub_633BC		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_62697
sub_633BC		endp

; ----------------------------------------------------------------------

sub_633C8		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_66C88
sub_633C8		endp

; ----------------------------------------------------------------------

sub_633D4		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_DrawAtOwnPos_66BEC
sub_633D4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_633E0		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_63409
		push	0
		push	si
		nop
		push	cs
		call	near ptr sub_622CE
		add	sp, 4
		test	di, 1
		jz	short loc_63409
		push	si
		call	sub_3B2
		pop	cx
		jmp	short loc_63409

loc_63409:
		pop	di
		pop	si
		pop	bp
		retf
sub_633E0		endp

; ----------------------------------------------------------------------

sub_6340D		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_62520
sub_6340D		endp

; ----------------------------------------------------------------------

sub_63419		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_66C88
sub_63419		endp

; ----------------------------------------------------------------------

sub_63425		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	Layer_DrawAtOwnPos_624F3
sub_63425		endp

; ----------------------------------------------------------------------

sub_63431		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_6210C
sub_63431		endp

; ----------------------------------------------------------------------

sub_6343D		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_66C88
sub_6343D		endp

; ----------------------------------------------------------------------

sub_63449		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_620DE
sub_63449		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à HUDSymbol_ReleaseListEntry_85DCA (sub_85DCA de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle LinkedListB_Helper_5F66B (seg159).
; ==============================================================================================
HUDSymbol_ReleaseListEntry_63455		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_6347C
		mov	word ptr [si], 402Dh
		push	si
		call	sub_68938
		pop	cx
		test	di, 1
		jz	short loc_6347C
		push	si
		call	sub_3B2
		pop	cx

loc_6347C:
		pop	di
		pop	si
		pop	bp
		retf
HUDSymbol_ReleaseListEntry_63455		endp

; ----------------------------------------------------------------------

sub_63480		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	sub_66C19
sub_63480		endp

; ----------------------------------------------------------------------

sub_6348C		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_66C88
sub_6348C		endp

; ----------------------------------------------------------------------

sub_63498		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
sub_63498		endp

; START OF FUNCTION CHUNK FOR sub_63498
		db 0EAh
; END OF FUNCTION CHUNK FOR sub_63498
seg144		ends

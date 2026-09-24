ovr232		segment	para public 'OVERLAY' use16
		assume cs:ovr232
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue via Memory_TypedAllocDispatchB_5C832 (53 lignes).
; ==============================================================================================
AIManeuver_AllocateField_77DD0	proc far		; CODE XREF: VROOMM_StubThunk_6AC43J AIManeuver_Helper3_7818E+19p

var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+0FEh], 0FFh
		mov	byte ptr [si+0FFh], 0
		mov	byte ptr [si+100h], 0
		mov	byte ptr [si+101h], 0
		xor	eax, eax
		mov	[si+9Ch], eax
		mov	[si+98h], eax
		mov	[si+94h], eax
		xor	eax, eax
		mov	[si+0C8h], eax
		mov	[si+0C4h], eax
		mov	[si+0C0h], eax
		xor	eax, eax
		mov	[si+0D4h], eax
		mov	[si+0D0h], eax

loc_77E1F:
		mov	[si+0CCh], eax
		xor	eax, eax

loc_77E27:
		mov	[si+0E0h], eax
		mov	[si+0DCh], eax
		mov	[si+0D8h], eax
		mov	[bp+var_4], 0
		mov	eax, [bp+var_4]
		mov	[si+0F2h], eax
		mov	[si+0A4h], eax
		mov	[si+0A0h], eax
		mov	[si+8Eh], eax
		push	0
		mov	al, [si+84h]
		push	ax
		push	large dword ptr	[si+80h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	[si+8Ch], dx
		mov	[si+8Ah], ax
		pop	si
		leave
		retf
AIManeuver_AllocateField_77DD0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 152 lignes, NON DÉTAILLÉE — combine Formation_ComputeGeometryHelper_56D43,
; String_ConstructEmpty, ReadFieldGroupA_64A19 — chargement de données de formation pour la
; manœuvre IA.
; ==============================================================================================
AIManeuver_LoadFormationData_77E78	proc far		; CODE XREF: VROOMM_StubThunk_6AC34J

var_28		= word ptr -28h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 28h
		push	si
		push	di
		mov	si, [bp+arg_0]

loc_77E83:
		mov	di, [bp+arg_2]
		or	si, si

loc_77E88:
		jnz	short loc_77E9C

loc_77E8A:
		push	102h
		call	CRT_Malloc16_Retry

loc_77E92:
		pop	cx
		mov	si, ax

loc_77E95:
		or	ax, ax

loc_77E97:
		jnz	short loc_77E9C
		jmp	loc_77FC4
; ���������������������������������������������������������������������������

loc_77E9C:				; CODE XREF: AIManeuver_LoadFormationData_77E78:loc_77E88j
					; AIManeuver_LoadFormationData_77E78:loc_77E97j
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	Formation_ComputeGeometryHelper_56D43
		pop	cx
		mov	word ptr [si+50h], 484h
		mov	ax, si
		add	ax, 53h	; 'S'
		push	ax
		call	String_ConstructEmpty
		pop	cx
		push	si
		call	VROOMM_StubThunk_6BC0D
		pop	cx
		mov	word ptr [si+50h], 460h
		mov	dword ptr [si+80h], 0
		mov	byte ptr [si+84h], 2
		mov	byte ptr [si+85h], 0
		mov	dword ptr [si+86h], 0
		mov	ax, si
		add	ax, 8Eh	; '�'
		mov	word ptr [si+92h], 0
		mov	ax, si
		add	ax, 94h	; '�'
		mov	ax, si
		add	ax, 0A0h ; '�'
		mov	ax, si
		add	ax, 0A4h ; '�'
		mov	ax, si
		add	ax, 0A8h ; '�'
		mov	ax, si
		add	ax, 0ACh ; '�'
		mov	ax, si
		add	ax, 0B0h ; '�'
		mov	ax, si
		add	ax, 0BCh ; '�'
		mov	ax, si
		add	ax, 0C0h ; '�'
		mov	ax, si
		add	ax, 0CCh ; '�'
		mov	ax, si
		add	ax, 0D8h ; '�'
		mov	ax, si

loc_77F20:
		add	ax, 0E4h ; '�'
		mov	ax, si
		add	ax, 0F2h ; '�'
		mov	ax, si
		add	ax, 0F6h ; '�'
		mov	ax, si
		add	ax, 0FAh ; '�'
		push	large 1Ch
		push	ss
		lea	ax, [bp+var_28]
		push	ax
		push	di
		call	ResourceRecord_ReadFieldGroupA_64A19
		add	sp, 0Ah
		lea	ax, [bp+var_28]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr AIManeuver_Helper_780A5
		add	sp, 4
		mov	eax, [di+72h]
		add	eax, 0FFFFFFE4h
		mov	[bp+var_4], eax
		mov	[bp+var_8], eax
		push	1
		push	0
		push	2
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		mov	eax, [bp+var_C]

loc_77F7D:
		mov	[si+80h], eax
		mov	byte ptr [si+84h], 2

loc_77F87:
		mov	byte ptr [si+85h], 1
		mov	dword ptr [si+86h], 0
		mov	eax, [bp+var_8]
		mov	[si+86h], eax
		push	large [bp+var_4]
		push	0
		mov	al, [si+84h]
		push	ax
		push	large dword ptr	[si+80h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		call	ResourceRecord_ReadFieldGroupA_64A19
		add	sp, 0Ah

loc_77FC4:				; CODE XREF: AIManeuver_LoadFormationData_77E78+21j
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
AIManeuver_LoadFormationData_77E78	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, variante de AIManeuver_LoadFormationData_77E78 (101 lignes). || CONSTRUCTEUR objet
; caméra/manoeuvre COMP (2026-08-30) : cible du stub 6AC3E, appelé depuis
; Kneeboard_RenderEntry case 0x13. Alloc 0x102 o ; [obj+0x50] = vtable 0x460 (off_6D510) ;
; Formation_ComputeGeometryHelper(obj+0x20) ; String_ConstructEmpty(obj+0x53) ; [obj+0x80]=0
; (curseur script), [obj+0x84]=2, [obj+0x86]=0 (longueur) ; copie les 0x1C octets d'en-tête
; (CRT_MemFamily_Extra1) -> AIManeuver_Helper_780A5(obj, &header). Champs vecteurs init à
; obj+0x8E..0xFA. Kneeboard_RenderEntry pose ensuite [obj+0x80]=payload+0x1C,
; [obj+0x86]=len-0x1C. Voir DATA_MODEL.md §6.6b b-bis.
; ==============================================================================================
AIManeuver_LoadFormationDataB_77FCA	proc far		; CODE XREF: VROOMM_StubThunk_6AC3EJ

var_1C		= word ptr -1Ch
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_77FEA
		push	102h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_77FEA
		jmp	loc_780A0
; ���������������������������������������������������������������������������

loc_77FEA:				; CODE XREF: AIManeuver_LoadFormationDataB_77FCA+Cj
					; AIManeuver_LoadFormationDataB_77FCA+1Bj
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	Formation_ComputeGeometryHelper_56D43
		pop	cx
		mov	word ptr [si+50h], 484h
		mov	ax, si
		add	ax, 53h	; 'S'
		push	ax
		call	String_ConstructEmpty
		pop	cx
		push	si
		call	VROOMM_StubThunk_6BC0D
		pop	cx
		mov	word ptr [si+50h], 460h
		mov	dword ptr [si+80h], 0
		mov	byte ptr [si+84h], 2

loc_78021:
		mov	byte ptr [si+85h], 0
		mov	dword ptr [si+86h], 0
		mov	ax, si
		add	ax, 8Eh	; '�'

loc_78034:
		mov	word ptr [si+92h], 0
		mov	ax, si
		add	ax, 94h	; '�'
		mov	ax, si
		add	ax, 0A0h ; '�'
		mov	ax, si
		add	ax, 0A4h ; '�'
		mov	ax, si
		add	ax, 0A8h ; '�'
		mov	ax, si
		add	ax, 0ACh ; '�'
		mov	ax, si
		add	ax, 0B0h ; '�'
		mov	ax, si
		add	ax, 0BCh ; '�'
		mov	ax, si
		add	ax, 0C0h ; '�'
		mov	ax, si
		add	ax, 0CCh ; '�'
		mov	ax, si
		add	ax, 0D8h ; '�'
		mov	ax, si
		add	ax, 0E4h ; '�'
		mov	ax, si
		add	ax, 0F2h ; '�'
		mov	ax, si
		add	ax, 0F6h ; '�'
		mov	ax, si
		add	ax, 0FAh ; '�'

loc_78080:
		push	1Ch
		push	large [bp+arg_2]
		push	ss
		lea	ax, [bp+var_1C]
		push	ax
		call	CRT_MemFamily_Extra1
		add	sp, 0Ah
		lea	ax, [bp+var_1C]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr AIManeuver_Helper_780A5
		add	sp, 4

loc_780A0:				; CODE XREF: AIManeuver_LoadFormationDataB_77FCA+1Dj
		mov	ax, si
		pop	si
		leave
		retf
AIManeuver_LoadFormationDataB_77FCA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine allocation et copie de chaîne (CRT_Strncpy_Pad), 105 lignes. || PARSE EN-TÊTE
; COMP 0x1C (2026-08-30) : AIManeuver_Helper_780A5(obj, &header28). En-tête COMP = 28 o :
; +0x00 char[8] nom -> obj[+0x53] (CRT_Strncpy_Pad 8) ; +0x08 u16 flags (bit0 -> obj[+0x52]
; bit1) ; +0x0A u32 farClip=50000 ; +0x0E u16 signé -> movsx<<8 (entier converti en 24.8) ;
; +0x10 i32 (var_16) ; +0x14..0x17 u16,u16 (0,0) ; +0x18..0x1B u16 viewW=319, u16 viewH=199 ->
; sous-objet viewport obj[+0x5C] type 0x44C via stub 6BBE0. farClip + (u16<<8) + i32 passés à
; stub 6BC12. Script = payload +0x1C..fin. Voir DATA_MODEL.md §6.6b b-bis.
; ==============================================================================================
AIManeuver_Helper_780A5	proc far		; CODE XREF: VROOMM_StubThunk_6AC39J AIManeuver_LoadFormationData_77E78+D2p	...

var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_D		= byte ptr -0Dh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	bx, [bp+arg_2]
		mov	ax, [bx+14h]
		mov	[bp+var_2], ax
		mov	ax, [bx+16h]
		mov	[bp+var_4], ax
		mov	ax, [bx+18h]
		mov	[bp+var_6], ax
		mov	ax, [bx+1Ah]
		mov	[bp+var_8], ax
		push	1Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_78112
		mov	word ptr [di], 44Ch
		mov	word ptr [di+2], 0
		mov	word ptr [di+4], 0
		mov	byte ptr [di+0Fh], 0
		mov	word ptr [di+10h], 0
		mov	word ptr [di+12h], 0
		mov	byte ptr [di+1Dh], 0
		push	[bp+var_8]
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		push	ax
		call	VROOMM_StubThunk_6BBE0
		add	sp, 0Ah
		mov	ax, di
		jmp	short loc_78114
; ���������������������������������������������������������������������������

loc_78112:				; CODE XREF: AIManeuver_Helper_780A5+32j
		mov	ax, di

loc_78114:				; CODE XREF: AIManeuver_Helper_780A5+6Bj
		mov	[si+5Ch], ax
		sub	sp, 4
		mov	di, [bp+arg_2]
		add	di, 10h
		mov	eax, [di]

loc_78123:
		mov	[bp+var_16], eax

loc_78127:
		sub	sp, 4
		mov	bx, [bp+arg_2]

loc_7812D:
		mov	ax, [bx+0Eh]
		mov	[bp+var_A], ax
		movsx	eax, [bp+var_A]
		shl	eax, 8
		mov	[bp+var_1A], eax
		push	large dword ptr	[bx+0Ah]
		push	word ptr [si+5Ch]
		push	si
		call	VROOMM_StubThunk_6BC12
		add	sp, 10h
		mov	ax, [bp+arg_2]
		mov	[bp+var_C], ax
		push	8
		push	ax
		mov	ax, si
		add	ax, 53h	; 'S'
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	byte ptr [si+5Bh], 0
		mov	bx, [bp+arg_2]
		mov	al, [bx+8]
		mov	[bp+var_D], al
		and	ax, 1
		and	byte ptr [si+52h], 0FDh
		shl	al, 1
		or	[si+52h], al
		pop	di
		pop	si
		leave

locret_78183:
		retf
AIManeuver_Helper_780A5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (11 lignes).
; ==============================================================================================
AIManeuver_Helper2_78184	proc far		; CODE XREF: VROOMM_StubThunk_6AC57J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 13h
		pop	bp
		retf
AIManeuver_Helper2_78184	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, thunk voisin uniquement (36 lignes). || (2026-08-30) = tick vtable[0x00] de l'objet
; manoeuvre/caméra COMP (off_6D510) ; appelé chaque frame. Combine stub 6BC26 +
; AIManeuver_AllocateField_77DD0. Voir AI_ManeuverSolutionMain_781D0 et DATA_MODEL.md §6.6b.
; ==============================================================================================
AIManeuver_Helper3_7818E	proc far		; CODE XREF: VROOMM_StubThunk_6AC48J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si

loc_78192:
		mov	si, [bp+arg_0]
		push	si
		call	VROOMM_StubThunk_6BC26
		pop	cx
		or	al, al
		jz	short loc_781B7
		mov	byte_70471, 1
		push	si
		push	cs
		call	near ptr AIManeuver_AllocateField_77DD0
		pop	cx
		push	si
		mov	bx, [si+50h]
		call	dword ptr [bx+10h]
		pop	cx
		mov	al, 1
		jmp	short loc_781B9
; ���������������������������������������������������������������������������

loc_781B7:				; CODE XREF: AIManeuver_Helper3_7818E+10j
		mov	al, 0

loc_781B9:				; CODE XREF: AIManeuver_Helper3_7818E+27j
		pop	si
		pop	bp
		retf
AIManeuver_Helper3_7818E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, thunk voisin uniquement (14 lignes).
; ==============================================================================================
AIManeuver_Helper4_781BC	proc far		; CODE XREF: VROOMM_StubThunk_6AC4DJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		call	VROOMM_StubThunk_6BC2B
		pop	cx
		mov	byte_70471, 0
		pop	bp
		retf
AIManeuver_Helper4_781BC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 2373 lignes - Interpreteur du bytecode de script camera 'COMP'
; (STARTCAM/TAKEOFF/LANDING/AUTOPILT), slot [vtable+0x10] de l'objet camera. CORRECTION
; IMPORTANTE (verification directe demandee par Remi, suite a une reaffirmation non verifiee
; de ma part) : le nom precedent ('AIManeuverShared') et l'affirmation 'meme solveur que les
; manoeuvres de combat de l'IA' reposaient sur une analyse externe non revalidee en interne.
; LECTURE DIRECTE DU DEBUT DE LA FONCTION : le parametre 'si' (arg_0) est verifie contre
; byte_722D1 (LA MEME touche d'annulation/abort deja confirmee comme specifique au contexte
; camera dans MissionInit_LoadEntitiesAndPlayIntroCamera_7B035), et manipule des offsets
; (+0xFE, +0x101, +0x8E, +0xA0, +0x20, +0xE4) qui NE CORRESPONDENT A AUCUN CHAMP CONNU DE LA
; STRUCTURE D'ENTITE IA (goal_state=+0x11D, tableau MVRS, ATRB, etc., tous mappes ailleurs
; dans cette investigation). AUCUNE PREUVE, ni via l'appelant (reference unique via vtable
; off_6D520, sans CODE XREF tracable), ni via le contenu interne de la fonction, ne relie
; cette fonction a une entite IA. CONCLUSION REVISEE : cette fonction opere tres probablement
; UNIQUEMENT sur des objets camera, sans lien confirme avec le systeme de manoeuvre de combat
; IA. La ressemblance de vtable relevee dans l'analyse externe reste a interpreter avec
; prudence - une proximite d'adresse ou de motif de vtable n'implique pas necessairement un
; partage de classe reel. Table d'opcodes complete et exemple STARTCAM decode ligne a ligne
; dans DATA_MODEL.md, mais dans un contexte confirme PUREMENT CAMERA.
; ==============================================================================================
CameraScript_ExecuteCOMP_781D0	proc far		; CODE XREF: VROOMM_StubThunk_6AC52J

var_170		= dword	ptr -170h
var_16C		= dword	ptr -16Ch
var_168		= dword	ptr -168h
var_164		= dword	ptr -164h
var_160		= dword	ptr -160h
var_15C		= dword	ptr -15Ch
var_158		= dword	ptr -158h
var_154		= dword	ptr -154h
var_150		= dword	ptr -150h
var_14C		= dword	ptr -14Ch
var_148		= dword	ptr -148h
var_144		= dword	ptr -144h
var_140		= dword	ptr -140h
var_13C		= dword	ptr -13Ch
var_138		= dword	ptr -138h
var_134		= dword	ptr -134h
var_130		= dword	ptr -130h
var_12C		= dword	ptr -12Ch
var_128		= dword	ptr -128h
var_124		= dword	ptr -124h
var_120		= dword	ptr -120h
var_11C		= dword	ptr -11Ch
var_118		= dword	ptr -118h
var_114		= dword	ptr -114h
var_110		= dword	ptr -110h
var_10C		= dword	ptr -10Ch
var_108		= dword	ptr -108h
var_104		= dword	ptr -104h
var_100		= dword	ptr -100h
var_FC		= dword	ptr -0FCh
var_F8		= dword	ptr -0F8h
var_F4		= dword	ptr -0F4h
var_F0		= dword	ptr -0F0h
var_EC		= dword	ptr -0ECh
var_E8		= dword	ptr -0E8h
var_E4		= dword	ptr -0E4h
var_E0		= dword	ptr -0E0h
var_DC		= dword	ptr -0DCh
var_D8		= dword	ptr -0D8h
var_D4		= dword	ptr -0D4h
var_D0		= dword	ptr -0D0h
var_CC		= dword	ptr -0CCh
var_C8		= dword	ptr -0C8h
var_C4		= dword	ptr -0C4h
var_C0		= dword	ptr -0C0h
var_BC		= dword	ptr -0BCh
var_B8		= dword	ptr -0B8h
var_B2		= dword	ptr -0B2h
var_AE		= dword	ptr -0AEh
var_AA		= dword	ptr -0AAh
var_A6		= dword	ptr -0A6h
var_A2		= dword	ptr -0A2h
var_9E		= dword	ptr -9Eh
var_9A		= word ptr -9Ah
var_98		= word ptr -98h
var_96		= dword	ptr -96h
var_92		= dword	ptr -92h
var_8E		= dword	ptr -8Eh
var_8A		= dword	ptr -8Ah
var_86		= dword	ptr -86h
var_82		= dword	ptr -82h
var_7E		= word ptr -7Eh
var_7C		= word ptr -7Ch
var_7A		= dword	ptr -7Ah
var_76		= dword	ptr -76h
var_72		= dword	ptr -72h
var_6E		= dword	ptr -6Eh
var_6A		= dword	ptr -6Ah
var_66		= dword	ptr -66h
var_62		= dword	ptr -62h
var_5E		= dword	ptr -5Eh
var_5A		= dword	ptr -5Ah
var_56		= dword	ptr -56h
var_52		= dword	ptr -52h
var_4E		= dword	ptr -4Eh
var_4A		= dword	ptr -4Ah
var_46		= dword	ptr -46h
var_42		= dword	ptr -42h
var_3E		= dword	ptr -3Eh
var_3A		= dword	ptr -3Ah
var_36		= dword	ptr -36h
var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_2A		= word ptr -2Ah
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 170h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	al, byte_722D1
		mov	ah, 0
		cmp	ax, 1
		jnz	short loc_781F2
		cmp	byte ptr [si+101h], 0
		jz	short loc_781F2
		mov	byte ptr [si+0FEh], 0FFh

loc_781F2:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+14j
					; CameraScript_ExecuteCOMP_781D0+1Bj
		mov	al, [si+0FEh]
		mov	ah, 0
		mov	[bp+var_98], ax
		mov	cx, 4		; switch 4 cases
		mov	bx, offset word_79CE7

loc_78202:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+3Ej
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_98]
		jz	short loc_78213
		add	bx, 2
		loop	loc_78202
		jmp	loc_796AA	; default
; ���������������������������������������������������������������������������

loc_78213:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+39j
		jmp	word ptr cs:[bx+8] ; switch jump

loc_78217:				; DATA XREF: ovr232:1F1Fo
		mov	eax, [si+8Eh]	; case 0x1
		cmp	eax, [si+0A0h]
		jl	short loc_78228
		mov	ax, 1
		jmp	short loc_7822A
; ���������������������������������������������������������������������������

loc_78228:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+51j
		xor	ax, ax

loc_7822A:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+56j
		or	al, al
		jnz	short loc_78231
		jmp	loc_796AA	; default
; ���������������������������������������������������������������������������

loc_78231:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+5Cj
		mov	byte ptr [si+0FEh], 0FFh
		jmp	loc_796AA	; default
; ���������������������������������������������������������������������������

loc_78239:				; CODE XREF: CameraScript_ExecuteCOMP_781D0:loc_78213j
					; DATA XREF: ovr232:1F1Fo
		cmp	dword ptr [si+0A0h], 0 ; case 0x4
		jg	short loc_78246
		mov	ax, 1
		jmp	short loc_78248
; ���������������������������������������������������������������������������

loc_78246:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+6Fj
		xor	ax, ax

loc_78248:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+74j
		or	al, al
		jz	short loc_78274
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	Matrix_BuildFromAngle_56D72
		pop	cx
		mov	ax, si
		add	ax, 0E4h ; '�'
		push	ax
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	WorldObject_BuildOrientationMatrix_56E8A
		add	sp, 4
		mov	byte ptr [si+0FEh], 0FFh
		jmp	loc_796AA	; default
; ���������������������������������������������������������������������������

loc_78274:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+7Aj
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		push	ss
		lea	ax, [bp+var_4]
		push	ax

loc_7827F:
		call	AI_ApplyAngleBetweenVectors_57C3A
		add	sp, 6

loc_78287:
		mov	eax, [si+0E4h]

loc_7828C:
		sub	eax, [bp+var_4]
		mov	[bp+var_8], eax
		mov	[bp+var_C], eax
		mov	[bp+var_D4], eax
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		push	ss
		lea	ax, [bp+var_10]
		push	ax
		call	AI_ComputeGeometrySolution_57C67
		add	sp, 6
		mov	eax, [si+0E8h]
		sub	eax, [bp+var_10]
		mov	[bp+var_14], eax
		mov	[bp+var_18], eax
		mov	[bp+var_D0], eax
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		push	ss
		lea	ax, [bp+var_1C]
		push	ax
		call	AI_ApplyApproachAngles_57D81
		add	sp, 6
		mov	eax, [si+0ECh]
		sub	eax, [bp+var_1C]
		mov	[bp+var_20], eax
		mov	[bp+var_24], eax
		mov	[bp+var_CC], eax
		lea	ax, [bp+var_D4]
		push	ax
		push	ss
		lea	ax, [bp+var_28]
		push	ax
		call	Math_VectorLength3D_Scaled_54F57
		add	sp, 6
		cmp	[bp+var_28], 200h
		jge	short loc_78310
		mov	ax, 1
		jmp	short loc_78312
; ���������������������������������������������������������������������������

loc_78310:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+139j
		xor	ax, ax

loc_78312:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+13Ej
		or	al, al
		jz	short loc_7833E
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	Matrix_BuildFromAngle_56D72
		pop	cx
		mov	ax, si
		add	ax, 0E4h ; '�'
		push	ax
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	WorldObject_BuildOrientationMatrix_56E8A
		add	sp, 4
		mov	byte ptr [si+0FEh], 0FFh
		jmp	loc_796AA	; default
; ���������������������������������������������������������������������������

loc_7833E:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+144j
		mov	di, si
		add	di, 0A0h ; '�'
		mov	eax, [bp+var_D4]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_D4], eax
		mov	eax, [bp+var_D0]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_D0], eax
		mov	eax, [bp+var_CC]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_CC], eax
		mov	eax, [bp+var_D4]
		mov	edx, dword_70458
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_D4], eax
		mov	eax, [bp+var_D0]
		mov	edx, dword_70458
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_D0], eax
		mov	eax, [bp+var_CC]
		mov	edx, dword_70458
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_CC], eax
		lea	ax, [bp+var_D4]
		push	ax
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	WorldObject_BuildOrientationMatrix_56E8A
		add	sp, 4
		jmp	loc_796AA	; default
; ���������������������������������������������������������������������������

loc_783F0:				; CODE XREF: CameraScript_ExecuteCOMP_781D0:loc_78213j
					; DATA XREF: ovr232:1F1Fo
		cmp	word ptr [si+92h], 0 ; case 0x1D
		jnz	short loc_783FA
		jmp	loc_785E9
; ���������������������������������������������������������������������������

loc_783FA:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+225j
		cmp	dword ptr [si+0A0h], 0
		jle	short loc_78407
		mov	ax, 1
		jmp	short loc_78409
; ���������������������������������������������������������������������������

loc_78407:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+230j
		xor	ax, ax

loc_78409:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+235j
		or	al, al
		jnz	short loc_78410
		jmp	loc_785E9
; ���������������������������������������������������������������������������

loc_78410:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+23Bj
		mov	di, si
		add	di, 0E4h ; '�'
		mov	eax, [di]
		mov	[bp+var_14C], eax

loc_7841E:
		mov	eax, [di+4]

loc_78422:
		mov	[bp+var_148], eax
		mov	eax, [di+8]
		mov	[bp+var_144], eax
		push	word ptr [si+92h]
		mov	bx, [si+92h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		lea	ax, [bp+var_14C]
		push	ax
		call	Matrix_LocalToWorld_58828
		add	sp, 4
		mov	di, si
		add	di, 0B0h ; '�'
		mov	eax, [bp+var_14C]
		sub	eax, [di]
		mov	[bp+var_164], eax
		mov	eax, [bp+var_148]
		sub	eax, [di+4]
		mov	[bp+var_160], eax
		mov	eax, [bp+var_144]
		sub	eax, [di+8]
		mov	[bp+var_15C], eax
		mov	eax, [bp+var_164]
		mov	[bp+var_158], eax
		mov	eax, [bp+var_160]
		mov	[bp+var_154], eax
		mov	eax, [bp+var_15C]
		mov	[bp+var_150], eax
		mov	di, si
		add	di, 0A0h ; '�'
		mov	eax, [bp+var_158]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_158], eax
		mov	eax, [bp+var_154]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_154], eax
		mov	eax, [bp+var_150]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_150], eax
		mov	di, si
		add	di, 0B0h ; '�'
		mov	eax, [di]
		mov	[si+14h], eax
		mov	eax, [di+4]
		mov	[si+18h], eax
		mov	eax, [di+8]
		mov	[si+1Ch], eax
		mov	eax, [bp+var_158]
		mov	edx, dword_70458
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_9E], eax
		mov	eax, [bp+var_9E]
		mov	[bp+var_A2], eax

loc_7852E:
		mov	eax, [bp+var_154]

loc_78533:
		mov	edx, dword_70458

loc_78538:
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_A6], eax
		mov	eax, [bp+var_A6]
		mov	[bp+var_AA], eax
		mov	eax, [bp+var_150]
		mov	edx, dword_70458
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_AE], eax
		mov	eax, [bp+var_AE]
		mov	[bp+var_B2], eax
		mov	eax, [bp+var_A2]
		mov	[bp+var_170], eax
		mov	eax, [bp+var_AA]

loc_7857F:
		mov	[bp+var_16C], eax

loc_78584:
		mov	eax, [bp+var_B2]
		mov	[bp+var_168], eax
		mov	eax, [bp+var_170]
		add	[si+14h], eax
		mov	eax, [bp+var_16C]
		add	[si+18h], eax
		mov	eax, [bp+var_168]
		add	[si+1Ch], eax
		mov	di, si
		add	di, 14h
		mov	eax, [di]
		mov	[si+0B0h], eax
		mov	eax, [di+4]
		mov	[si+0B4h], eax
		mov	eax, [di+8]
		mov	[si+0B8h], eax
		mov	di, [si+92h]
		add	di, 12h
		mov	eax, [di]
		add	[si+14h], eax
		mov	eax, [di+4]
		add	[si+18h], eax
		mov	eax, [di+8]
		add	[si+1Ch], eax
		jmp	loc_796AA	; default
; ���������������������������������������������������������������������������

loc_785E9:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+227j
					; CameraScript_ExecuteCOMP_781D0+23Dj
		mov	di, [si+92h]
		add	di, 12h
		mov	ax, si
		add	ax, 0B0h ; '�'
		mov	[bp+var_2A], ax
		mov	eax, [di]
		mov	bx, [bp+var_2A]
		add	eax, [bx]
		mov	[bp+var_E0], eax
		mov	eax, [di+4]
		add	eax, [bx+4]
		mov	[bp+var_DC], eax
		mov	eax, [di+8]
		add	eax, [bx+8]
		mov	[bp+var_D8], eax
		mov	eax, [bp+var_E0]

loc_78625:
		mov	[bp+var_EC], eax

loc_7862A:
		mov	eax, [bp+var_DC]

loc_7862F:
		mov	[bp+var_E8], eax
		mov	eax, [bp+var_D8]
		mov	[bp+var_E4], eax
		mov	eax, [bp+var_EC]
		mov	[si+14h], eax
		mov	eax, [bp+var_E8]
		mov	[si+18h], eax
		mov	eax, [bp+var_E4]
		mov	[si+1Ch], eax
		mov	byte ptr [si+0FEh], 0FFh
		jmp	loc_796AA	; default
; ���������������������������������������������������������������������������

loc_78661:				; CODE XREF: CameraScript_ExecuteCOMP_781D0:loc_78213j
					; DATA XREF: ovr232:1F1Fo
		cmp	dword ptr [si+0A0h], 0 ; case 0xB
		jl	short loc_7866E
		mov	ax, 1
		jmp	short loc_78670
; ���������������������������������������������������������������������������

loc_7866E:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+497j
		xor	ax, ax

loc_78670:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+49Cj
		or	al, al
		jnz	short loc_78677
		jmp	loc_78819
; ���������������������������������������������������������������������������

loc_78677:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+4A2j
		mov	di, si
		add	di, 0B0h ; '�'
		mov	ax, si
		add	ax, 14h
		mov	word ptr [bp+var_9E+2],	ax
		mov	eax, [di]
		mov	bx, word ptr [bp+var_9E+2]

loc_7868D:
		sub	eax, [bx]

loc_78690:
		mov	[bp+var_158], eax

loc_78695:
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp+var_154], eax
		mov	eax, [di+8]
		sub	eax, [bx+8]
		mov	[bp+var_150], eax
		mov	eax, [bp+var_158]
		mov	[bp+var_14C], eax
		mov	eax, [bp+var_154]
		mov	[bp+var_148], eax
		mov	eax, [bp+var_150]
		mov	[bp+var_144], eax
		mov	di, si
		add	di, 2Ch	; ','
		push	eax
		push	large [bp+var_148]
		push	large [bp+var_14C]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_A2+2], eax
		mov	[bp+var_A6+2], eax
		mov	eax, [di]
		mov	edx, [bp+var_A6+2]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_AA+2], eax
		mov	eax, [bp+var_AA+2]
		mov	[bp+var_AE+2], eax
		mov	eax, [di+4]
		mov	edx, [bp+var_A6+2]
		imul	edx

loc_7871F:
		shrd	eax, edx, 8
		mov	[bp+var_B2+2], eax

loc_78729:
		mov	eax, [bp+var_B2+2]

loc_7872E:
		mov	[bp-0B4h], eax

loc_78733:
		mov	eax, [di+8]
		mov	edx, [bp+var_A6+2]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_B8], eax
		mov	eax, [bp+var_B8]
		mov	[bp+var_BC], eax
		mov	eax, [bp+var_AE+2]
		mov	[bp+var_164], eax
		mov	eax, [bp-0B4h]
		mov	[bp+var_160], eax
		mov	eax, [bp+var_BC]
		mov	[bp+var_15C], eax
		mov	eax, [bp+var_164]
		mov	[si+2Ch], eax
		mov	eax, [bp+var_160]
		mov	[si+30h], eax
		mov	eax, [bp+var_15C]

loc_78788:
		mov	[si+34h], eax

loc_7878C:
		mov	di, si
		add	di, 0A0h ; '�'

loc_78792:
		mov	eax, [bp+var_14C]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_14C], eax
		mov	eax, [bp+var_148]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_148], eax
		mov	eax, [bp+var_144]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_144], eax
		mov	eax, [bp+var_14C]
		add	[si+2Ch], eax
		mov	eax, [bp+var_148]
		add	[si+30h], eax
		mov	eax, [bp+var_144]
		add	[si+34h], eax
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	Vector_NormalizeInPlace_5593A
		pop	cx
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	Matrix_OrthonormalizeKeepRow1_57660
		pop	cx
		jmp	loc_796AA	; default
; ���������������������������������������������������������������������������

loc_78819:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+4A4j
		mov	di, si
		add	di, 0B0h ; '�'
		mov	ax, si
		add	ax, 14h
		mov	word ptr [bp+var_9E+2],	ax
		mov	eax, [di]
		mov	bx, word ptr [bp+var_9E+2]
		sub	eax, [bx]

loc_78832:
		mov	[bp+var_158], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp+var_154], eax
		mov	eax, [di+8]
		sub	eax, [bx+8]
		mov	[bp+var_150], eax
		mov	eax, [bp+var_158]
		mov	[bp+var_164], eax
		mov	eax, [bp+var_154]
		mov	[bp+var_160], eax
		mov	eax, [bp+var_150]
		mov	[bp+var_15C], eax
		mov	eax, [bp+var_164]
		mov	[bp+var_14C], eax
		mov	eax, [bp+var_160]

loc_7887E:
		mov	[bp+var_148], eax

loc_78883:
		mov	eax, [bp+var_15C]
		mov	[bp+var_144], eax

loc_7888D:
		lea	ax, [bp+var_14C]
		push	ax

loc_78892:
		call	Vector_NormalizeInPlace_5593A
		pop	cx
		mov	eax, [bp+var_14C]
		mov	[si+2Ch], eax
		mov	eax, [bp+var_148]
		mov	[si+30h], eax
		mov	eax, [bp+var_144]
		mov	[si+34h], eax
		mov	di, si
		add	di, 2Ch	; ','
		mov	eax, [di]
		mov	[si+38h], eax
		mov	eax, [di+4]
		mov	[si+3Ch], eax
		mov	eax, [di+8]
		mov	[si+40h], eax
		mov	[bp+var_A2+2], 5A00h
		lea	ax, [bp+var_A2+2]
		push	ax
		mov	ax, si
		add	ax, 38h	; '8'
		push	ax
		call	Missile_ComputeDirectionVector2D_5554E
		add	sp, 4
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	Matrix_OrthonormalizeKeepRow1_57660
		pop	cx
		mov	byte ptr [si+0FEh], 0FFh
		jmp	loc_796AA	; default
; ���������������������������������������������������������������������������

loc_788FF:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+14E1j
		les	bx, [si+8Ah]
		mov	al, es:[bx]
		mov	ah, 0
		mov	[bp+var_9A], ax
		mov	cx, 1Eh		; switch 30 cases
		mov	bx, offset word_79C6F

loc_78912:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+74Ej
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_9A]
		jz	short loc_78923
		add	bx, 2
		loop	loc_78912
		jmp	loc_79694	; default
; ���������������������������������������������������������������������������

loc_78923:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+749j
		jmp	word ptr cs:[bx+3Ch] ; switch jump

loc_78927:				; DATA XREF: ovr232:off_79CABo
		mov	ax, [si+8Ch]	; case 0x1
		mov	dx, [si+8Ah]
		inc	dx
		mov	word ptr [bp+var_9E+2],	ax
		mov	word ptr [bp+var_9E], dx
		les	bx, [bp+var_9E]
		mov	eax, es:[bx]
		mov	[si+0A0h], eax
		add	word ptr [bp+var_9E], 4
		mov	eax, [bp+var_9E]
		mov	[si+8Ah], eax
		mov	byte ptr [si+0FEh], 1
		jmp	loc_79694	; default
; ���������������������������������������������������������������������������

loc_7895C:				; CODE XREF: CameraScript_ExecuteCOMP_781D0:loc_78923j
					; DATA XREF: ovr232:off_79CABo
		mov	ax, [si+8Ch]	; case 0x2
		mov	dx, [si+8Ah]
		inc	dx
		mov	word ptr [bp+var_9E+2],	ax
		mov	word ptr [bp+var_9E], dx
		les	bx, [bp+var_9E]
		mov	eax, es:[bx]
		mov	[bp+var_A2], eax
		add	word ptr [bp+var_9E], 4
		shl	eax, 8
		mov	[bp+var_A6], eax
		mov	eax, [bp+var_A6]
		mov	[si+14h], eax

loc_78991:
		les	bx, [bp+var_9E]
		mov	eax, es:[bx]
		mov	[bp+var_AA], eax
		add	word ptr [bp+var_9E], 4
		shl	eax, 8
		mov	[bp+var_AE], eax
		mov	eax, [bp+var_AE]
		mov	[si+18h], eax
		les	bx, [bp+var_9E]
		mov	eax, es:[bx]
		mov	[bp+var_B2], eax
		add	word ptr [bp+var_9E], 4
		shl	eax, 8
		mov	[bp+var_B8+2], eax
		mov	eax, [bp+var_B8+2]
		mov	[si+1Ch], eax
		mov	byte ptr [si+0FFh], 0
		mov	byte ptr [si+100h], 0
		mov	eax, [bp+var_9E]
		mov	[si+8Ah], eax
		jmp	loc_79694	; default
; ���������������������������������������������������������������������������

loc_789F0:				; CODE XREF: CameraScript_ExecuteCOMP_781D0:loc_78923j
					; DATA XREF: ovr232:off_79CABo
		mov	ax, [si+8Ch]	; case 0x4
		mov	dx, [si+8Ah]
		inc	dx
		mov	word ptr [bp+var_9E+2],	ax
		mov	word ptr [bp+var_9E], dx
		les	bx, [bp+var_9E]
		mov	eax, es:[bx]
		mov	[si+0A0h], eax
		add	word ptr [bp+var_9E], 4
		mov	eax, [bp+var_9E]
		mov	[bp+var_A2], eax
		les	bx, [bp+var_A2]

loc_78A21:
		mov	ax, es:[bx]

loc_78A24:
		mov	word ptr [bp+var_A6+2],	ax

loc_78A28:
		add	word ptr [bp+var_A2], 2

loc_78A2D:
		movsx	eax, word ptr [bp+var_A6+2]

loc_78A33:
		shl	eax, 8
		mov	[bp+var_AA+2], eax
		mov	eax, [bp+var_AA+2]
		mov	[si+0E4h], eax
		les	bx, [bp+var_A2]
		mov	ax, es:[bx]
		mov	word ptr [bp+var_AA], ax
		add	word ptr [bp+var_A2], 2
		movsx	eax, word ptr [bp+var_AA]
		shl	eax, 8
		mov	[bp+var_AE], eax
		mov	eax, [bp+var_AE]
		mov	[si+0E8h], eax
		les	bx, [bp+var_A2]
		mov	ax, es:[bx]
		mov	word ptr [bp+var_B2+2],	ax
		add	word ptr [bp+var_A2], 2
		movsx	eax, word ptr [bp+var_B2+2]
		shl	eax, 8
		mov	[bp-0B4h], eax
		mov	eax, [bp-0B4h]
		mov	[si+0ECh], eax
		mov	eax, [bp+var_A2]
		mov	[si+8Ah], eax
		mov	byte ptr [si+0FEh], 4
		jmp	loc_79694	; default
; ���������������������������������������������������������������������������

loc_78AAA:				; CODE XREF: CameraScript_ExecuteCOMP_781D0:loc_78923j
					; DATA XREF: ovr232:off_79CABo
		mov	ax, [si+8Ch]	; case 0x5
		mov	dx, [si+8Ah]
		inc	dx
		mov	word ptr [bp+var_9E+2],	ax
		mov	word ptr [bp+var_9E], dx
		les	bx, [bp+var_9E]
		mov	ax, es:[bx]
		mov	word ptr [bp+var_A2+2],	ax
		add	word ptr [bp+var_9E], 2
		movsx	eax, word ptr [bp+var_A2+2]
		shl	eax, 8
		mov	[bp+var_A6+2], eax
		mov	eax, [bp+var_A6+2]
		mov	[si+0D8h], eax
		les	bx, [bp+var_9E]
		mov	ax, es:[bx]
		mov	word ptr [bp+var_A6], ax
		add	word ptr [bp+var_9E], 2
		movsx	eax, word ptr [bp+var_A6]
		shl	eax, 8
		mov	[bp+var_AA], eax
		mov	eax, [bp+var_AA]
		mov	[si+0DCh], eax
		les	bx, [bp+var_9E]
		mov	ax, es:[bx]
		mov	word ptr [bp+var_AE+2],	ax
		add	word ptr [bp+var_9E], 2

loc_78B1D:
		movsx	eax, word ptr [bp+var_AE+2]
		shl	eax, 8
		mov	[bp+var_B2+2], eax
		mov	eax, [bp+var_B2+2]
		mov	[si+0E0h], eax
		mov	eax, [bp+var_9E]
		mov	[si+8Ah], eax
		jmp	loc_79694	; default
; ���������������������������������������������������������������������������

loc_78B43:				; CODE XREF: CameraScript_ExecuteCOMP_781D0:loc_78923j
					; DATA XREF: ovr232:off_79CABo
		mov	ax, [si+8Ch]	; case 0x6
		mov	dx, [si+8Ah]
		inc	dx
		mov	word ptr [bp+var_9E+2],	ax
		mov	word ptr [bp+var_9E], dx
		les	bx, [bp+var_9E]
		mov	eax, es:[bx]
		mov	[si+0C0h], eax
		add	word ptr [bp+var_9E], 4
		les	bx, [bp+var_9E]
		mov	eax, es:[bx]
		mov	[si+0C4h], eax
		add	word ptr [bp+var_9E], 4
		les	bx, [bp+var_9E]
		mov	eax, es:[bx]

loc_78B80:
		mov	[si+0C8h], eax

loc_78B85:
		add	word ptr [bp+var_9E], 4
		mov	byte ptr [si+0FFh], 0

loc_78B8F:
		mov	byte ptr [si+100h], 0

loc_78B94:
		mov	eax, [bp+var_9E]
		mov	[si+8Ah], eax
		jmp	loc_79694	; default
; ���������������������������������������������������������������������������

loc_78BA1:				; CODE XREF: CameraScript_ExecuteCOMP_781D0:loc_78923j
					; DATA XREF: ovr232:off_79CABo
		mov	ax, [si+8Ch]	; case 0x7
		mov	dx, [si+8Ah]
		inc	dx
		mov	word ptr [bp+var_A6+2],	ax
		mov	word ptr [bp+var_A6], dx
		push	8
		push	ax
		push	dx
		push	ss
		lea	ax, [bp+var_A2]
		push	ax
		call	CRT_MemFamily_Extra8
		add	sp, 0Ah
		push	ss
		lea	ax, [bp+var_A2]
		push	ax
		push	59C3h
		call	Container_Op_2241B
		add	sp, 6
		mov	word ptr [bp+var_AA+2],	ax
		push	ax
		mov	ax, si
		add	ax, 92h	; '�'
		push	ax
		call	SetReference16
		add	sp, 4
		add	word ptr [si+8Ah], 9
		jmp	loc_79694	; default
; ���������������������������������������������������������������������������

loc_78BF0:				; CODE XREF: CameraScript_ExecuteCOMP_781D0:loc_78923j
					; DATA XREF: ovr232:off_79CABo
		inc	word ptr [si+8Ah] ; case 0x13
		mov	byte ptr [si+0FFh], 1
		mov	byte ptr [si+100h], 0
		jmp	loc_79694	; default
; ���������������������������������������������������������������������������

loc_78C01:				; CODE XREF: CameraScript_ExecuteCOMP_781D0:loc_78923j
					; DATA XREF: ovr232:off_79CABo
		les	bx, [si+8Ah]	; case 0x8
		mov	eax, es:[bx+1]
		mov	[si+0A0h], eax
		add	word ptr [si+8Ah], 5
		mov	byte ptr [si+0FFh], 0
		mov	byte ptr [si+100h], 0

loc_78C1E:
		mov	byte ptr [si+0FEh], 8
		jmp	loc_79694	; default
; ���������������������������������������������������������������������������

loc_78C26:				; CODE XREF: CameraScript_ExecuteCOMP_781D0:loc_78923j
					; DATA XREF: ovr232:off_79CABo
		les	bx, [si+8Ah]	; case 0x9
		mov	eax, es:[bx+1]

loc_78C2F:
		mov	[si+0BCh], eax

loc_78C34:
		add	word ptr [si+8Ah], 5
		cmp	word ptr [si+92h], 0
		jnz	short loc_78C43
		jmp	loc_79694	; default
; ���������������������������������������������������������������������������

loc_78C43:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+A6Ej
		mov	byte ptr [si+0FFh], 1
		mov	byte ptr [si+100h], 1
		jmp	loc_79694	; default
; ���������������������������������������������������������������������������

loc_78C50:				; CODE XREF: CameraScript_ExecuteCOMP_781D0:loc_78923j
					; DATA XREF: ovr232:off_79CABo
		mov	ax, [si+8Ch]	; case 0xA
		mov	dx, [si+8Ah]
		inc	dx
		mov	word ptr [bp+var_9E+2],	ax
		mov	word ptr [bp+var_9E], dx
		les	bx, [bp+var_9E]
		mov	eax, es:[bx]
		mov	[bp+var_A2], eax
		add	word ptr [bp+var_9E], 4
		shl	eax, 8
		mov	[bp+var_A6], eax
		mov	eax, [bp+var_A6]

loc_78C81:
		mov	[si+0B0h], eax
		les	bx, [bp+var_9E]
		mov	eax, es:[bx]
		mov	[bp+var_AA], eax
		add	word ptr [bp+var_9E], 4
		shl	eax, 8
		mov	[bp+var_AE], eax
		mov	eax, [bp+var_AE]
		mov	[si+0B4h], eax
		les	bx, [bp+var_9E]
		mov	eax, es:[bx]
		mov	[bp+var_B2], eax
		add	word ptr [bp+var_9E], 4
		shl	eax, 8
		mov	[bp+var_B8+2], eax
		mov	eax, [bp+var_B8+2]
		mov	[si+0B8h], eax
		mov	eax, [bp+var_9E]
		mov	[si+8Ah], eax
		jmp	loc_79694	; default
; ���������������������������������������������������������������������������

loc_78CDD:				; CODE XREF: CameraScript_ExecuteCOMP_781D0:loc_78923j
					; DATA XREF: ovr232:off_79CABo
		les	bx, [si+8Ah]	; case 0xB
		mov	eax, es:[bx+1]
		mov	[si+0A0h], eax
		add	word ptr [si+8Ah], 5
		mov	byte ptr [si+0FFh], 0
		mov	byte ptr [si+100h], 0
		mov	byte ptr [si+0FEh], 0Bh
		jmp	loc_79694	; default
; ���������������������������������������������������������������������������

loc_78D02:				; CODE XREF: CameraScript_ExecuteCOMP_781D0:loc_78923j
					; DATA XREF: ovr232:off_79CABo
		mov	ax, [si+8Ch]	; case 0xC
		mov	dx, [si+8Ah]
		inc	dx
		mov	word ptr [bp+var_9E+2],	ax
		mov	word ptr [bp+var_9E], dx
		les	bx, [bp+var_9E]
		mov	eax, es:[bx]
		mov	[si+0BCh], eax

loc_78D20:
		add	word ptr [bp+var_9E], 4

loc_78D25:
		mov	byte ptr [si+0FFh], 0

loc_78D2A:
		mov	byte ptr [si+100h], 1

loc_78D2F:
		mov	eax, [bp+var_9E]
		mov	[si+8Ah], eax
		jmp	loc_79694	; default
; ���������������������������������������������������������������������������

loc_78D3C:				; CODE XREF: CameraScript_ExecuteCOMP_781D0:loc_78923j
					; DATA XREF: ovr232:off_79CABo
		mov	ax, [si+8Ch]	; case 0xD
		mov	dx, [si+8Ah]
		inc	dx
		mov	word ptr [bp+var_9E+2],	ax
		mov	word ptr [bp+var_9E], dx
		les	bx, [bp+var_9E]
		mov	eax, es:[bx]
		mov	[si+0A4h], eax
		add	word ptr [bp+var_9E], 4
		les	bx, [bp+var_9E]
		mov	eax, es:[bx]
		mov	[si+0A0h], eax
		add	word ptr [bp+var_9E], 4
		les	bx, [bp+var_9E]
		mov	eax, es:[bx]
		mov	[si+0A8h], eax

loc_78D7E:
		add	word ptr [bp+var_9E], 4
		mov	eax, [bp+var_9E]
		mov	[bp+var_A2], eax
		les	bx, [bp+var_A2]

loc_78D91:
		inc	word ptr [bp+var_A2]
		mov	al, es:[bx]
		mov	byte ptr [bp+var_A6+3],	al
		mov	ah, 0
		or	ax, ax
		jnz	short loc_78DE8
		mov	di, si
		add	di, 0A0h ; '�'
		mov	eax, [si+0A4h]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_AA+2], eax
		mov	eax, [bp+var_AA+2]
		mov	[bp+var_AE+2], eax
		mov	[si+0A8h], eax
		mov	[bp+var_B2+2], 0
		mov	eax, [bp+var_B2+2]
		mov	[si+0ACh], eax
		jmp	loc_78E75
; ���������������������������������������������������������������������������

loc_78DE8:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+BD0j
		mov	di, si
		add	di, 0A0h ; '�'
		mov	eax, [si+0A8h]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-0B4h], eax
		mov	eax, [bp-0B4h]
		mov	[bp+var_B8], eax
		mov	eax, [si+0A4h]
		sub	eax, [bp+var_B8]
		mov	[bp+var_BC], eax
		mov	[bp+var_C0], eax
		mov	[si+0ACh], eax
		mov	eax, [si+0ACh]
		shl	eax, 1
		mov	[si+0ACh], eax
		mov	di, si
		add	di, 0A0h ; '�'
		mov	eax, [si+0A0h]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_C4], eax
		mov	eax, [bp+var_C4]
		mov	[bp+var_C8], eax
		mov	eax, [si+0ACh]
		mov	edx, eax
		mov	ecx, [bp+var_C8]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[si+0ACh], eax

loc_78E75:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+C15j
		mov	eax, [bp+var_A2]
		mov	[si+8Ah], eax
		jmp	loc_79694	; default
; ���������������������������������������������������������������������������

loc_78E82:				; CODE XREF: CameraScript_ExecuteCOMP_781D0:loc_78923j
					; DATA XREF: ovr232:off_79CABo
		mov	ax, [si+8Ch]	; case 0xE

loc_78E86:
		mov	dx, [si+8Ah]
		inc	dx

loc_78E8B:
		mov	word ptr [bp+var_9E+2],	ax
		mov	word ptr [bp+var_9E], dx

loc_78E93:
		les	bx, [bp+var_9E]
		mov	eax, es:[bx]
		mov	[bp+var_A2], eax
		add	word ptr [bp+var_9E], 4
		shl	eax, 8
		mov	[bp+var_A6], eax
		mov	eax, [bp+var_A6]
		mov	[bp+var_14C], eax
		les	bx, [bp+var_9E]
		mov	eax, es:[bx]
		mov	[bp+var_AA], eax
		add	word ptr [bp+var_9E], 4
		shl	eax, 8
		mov	[bp+var_AE], eax
		mov	eax, [bp+var_AE]
		mov	[bp+var_148], eax
		les	bx, [bp+var_9E]
		mov	eax, es:[bx]
		mov	[bp+var_B2], eax
		add	word ptr [bp+var_9E], 4
		shl	eax, 8
		mov	[bp+var_B8+2], eax
		mov	eax, [bp+var_B8+2]
		mov	[bp+var_144], eax
		cmp	word ptr [si+92h], 0
		jnz	short loc_78F0C
		jmp	loc_78F9B
; ���������������������������������������������������������������������������

loc_78F0C:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+D37j
		push	word ptr [si+92h]
		mov	bx, [si+92h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		lea	ax, [bp+var_14C]
		push	ax
		call	Matrix_LocalToWorld_58828
		add	sp, 4
		mov	di, [si+92h]
		add	di, 12h
		mov	eax, [di]

loc_78F32:
		add	eax, [bp+var_14C]
		mov	[bp+var_158], eax
		mov	eax, [di+4]
		add	eax, [bp+var_148]
		mov	[bp+var_154], eax
		mov	eax, [di+8]
		add	eax, [bp+var_144]
		mov	[bp+var_150], eax
		mov	eax, [bp+var_158]
		mov	[bp+var_164], eax
		mov	eax, [bp+var_154]
		mov	[bp+var_160], eax
		mov	eax, [bp+var_150]
		mov	[bp+var_15C], eax
		mov	eax, [bp+var_164]
		mov	[si+14h], eax
		mov	eax, [bp+var_160]
		mov	[si+18h], eax
		mov	eax, [bp+var_15C]
		mov	[si+1Ch], eax
		mov	byte ptr [si+0FFh], 0
		mov	byte ptr [si+100h], 0

loc_78F9B:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+D39j
		mov	eax, [bp+var_9E]
		mov	[si+8Ah], eax
		jmp	loc_79694	; default
; ���������������������������������������������������������������������������

loc_78FA8:				; CODE XREF: CameraScript_ExecuteCOMP_781D0:loc_78923j
					; DATA XREF: ovr232:off_79CABo
		mov	ax, [si+8Ch]	; case 0xF
		mov	dx, [si+8Ah]
		inc	dx
		mov	word ptr [bp+var_9E+2],	ax
		mov	word ptr [bp+var_9E], dx
		les	bx, [bp+var_9E]
		mov	ax, es:[bx]
		mov	[si+0F0h], ax
		add	word ptr [bp+var_9E], 2
		les	bx, [bp+var_9E]
		mov	ax, es:[bx]
		mov	word ptr [bp+var_A2+2],	ax
		add	word ptr [bp+var_9E], 2
		movsx	eax, word ptr [bp+var_A2+2]
		shl	eax, 8
		mov	[bp+var_A6+2], eax
		mov	eax, [bp+var_A6+2]
		mov	[si+0F2h], eax
		mov	eax, [bp+var_9E]
		mov	[si+8Ah], eax
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		push	ss
		lea	ax, [bp+var_AA+2]
		push	ax
		call	AI_ApplyApproachAngles_57D81
		add	sp, 6
		mov	eax, [bp+var_AA+2]
		mov	[si+0F6h], eax
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		push	ss
		lea	ax, [bp+var_AE+2]

loc_79025:
		push	ax
		call	AI_ApplyAngleBetweenVectors_57C3A
		add	sp, 6
		mov	eax, [bp+var_AE+2]
		mov	[si+0FAh], eax
		jmp	loc_79694	; default
; ���������������������������������������������������������������������������

loc_7903B:				; CODE XREF: CameraScript_ExecuteCOMP_781D0:loc_78923j
					; DATA XREF: ovr232:off_79CABo
		cmp	word ptr [si+92h], 0 ; case 0x10
		jz	short loc_7905F
		push	word ptr [si+92h]
		mov	bx, [si+92h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	AI_ComputeGeometryHelper_56E29
		add	sp, 4

loc_7905F:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+E70j
		inc	word ptr [si+8Ah]
		jmp	loc_79694	; default
; ���������������������������������������������������������������������������

loc_79066:				; CODE XREF: CameraScript_ExecuteCOMP_781D0:loc_78923j
					; DATA XREF: ovr232:off_79CABo
		mov	ax, si		; case 0x3
		add	ax, 20h	; ' '
		push	ax
		call	Matrix_BuildFromAngle_56D72
		pop	cx

loc_79072:				; CODE XREF: CameraScript_ExecuteCOMP_781D0:loc_78923j
					; DATA XREF: ovr232:off_79CABo
		mov	ax, [si+8Ch]	; case 0x11
		mov	dx, [si+8Ah]
		inc	dx
		mov	word ptr [bp+var_9E+2],	ax
		mov	word ptr [bp+var_9E], dx
		les	bx, [bp+var_9E]
		add	word ptr [bp+var_9E], 2
		mov	ax, es:[bx]
		mov	word ptr [bp+var_A2+2],	ax

loc_79093:
		les	bx, [bp+var_9E]
		add	word ptr [bp+var_9E], 2
		mov	ax, es:[bx]
		mov	word ptr [bp+var_A2], ax
		les	bx, [bp+var_9E]
		add	word ptr [bp+var_9E], 2
		mov	ax, es:[bx]
		mov	word ptr [bp+var_A6+2],	ax
		mov	word ptr [bp+var_A6], ax
		movsx	eax, word ptr [bp+var_A6]
		shl	eax, 8
		mov	[bp+var_AA], eax
		lea	ax, [bp+var_AA]
		push	ax
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	Matrix_BuildAxisZ_572BC
		add	sp, 4
		mov	ax, word ptr [bp+var_A2+2]
		mov	word ptr [bp+var_AE+2],	ax
		movsx	eax, word ptr [bp+var_AE+2]
		shl	eax, 8
		mov	[bp+var_B2+2], eax
		lea	ax, [bp+var_B2+2]
		push	ax
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	Matrix_BuildAxisX_56EC3
		add	sp, 4
		mov	ax, word ptr [bp+var_A2]
		mov	word ptr [bp+var_B2], ax
		movsx	eax, word ptr [bp+var_B2]
		shl	eax, 8
		mov	[bp+var_B8+2], eax
		lea	ax, [bp+var_B8+2]
		push	ax
		mov	ax, si
		add	ax, 20h	; ' '

loc_79124:
		push	ax
		call	Matrix_BuildAxisY_570C5
		add	sp, 4
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	Matrix_OrthonormalizeKeepRow1_57660
		pop	cx
		mov	eax, [bp+var_9E]
		mov	[si+8Ah], eax
		jmp	loc_79694	; default
; ���������������������������������������������������������������������������

loc_79146:				; CODE XREF: CameraScript_ExecuteCOMP_781D0:loc_78923j
					; DATA XREF: ovr232:off_79CABo
		mov	ax, [si+8Ch]	; case 0x12
		mov	dx, [si+8Ah]
		inc	dx
		mov	word ptr [bp+var_9E+2],	ax
		mov	word ptr [bp+var_9E], dx
		les	bx, [bp+var_9E]
		mov	eax, es:[bx]
		mov	[si+94h], eax
		add	word ptr [bp+var_9E], 4
		les	bx, [bp+var_9E]
		mov	eax, es:[bx]
		mov	[si+98h], eax
		add	word ptr [bp+var_9E], 4
		les	bx, [bp+var_9E]
		mov	eax, es:[bx]

loc_79183:
		mov	[si+9Ch], eax
		add	word ptr [bp+var_9E], 4
		mov	eax, [bp+var_9E]
		mov	[si+8Ah], eax
		jmp	loc_79694	; default
; ���������������������������������������������������������������������������

loc_7919A:				; CODE XREF: CameraScript_ExecuteCOMP_781D0:loc_78923j
					; DATA XREF: ovr232:off_79CABo
		mov	ax, [si+8Ch]	; case 0x14
		mov	dx, [si+8Ah]
		inc	dx
		mov	word ptr [bp+var_9E+2],	ax
		mov	word ptr [bp+var_9E], dx
		les	bx, [bp+var_9E]
		mov	eax, es:[bx]
		mov	[bp+var_A2], eax
		add	word ptr [bp+var_9E], 4
		mov	eax, [bp+var_9E]
		mov	[si+8Ah], eax
		mov	di, si
		add	di, 2Ch	; ','
		mov	eax, [di]
		mov	edx, [bp+var_A2]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_A6], eax
		mov	eax, [bp+var_A6]
		mov	[bp+var_AA], eax
		mov	eax, [di+4]
		mov	edx, [bp+var_A2]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_AE], eax
		mov	eax, [bp+var_AE]
		mov	[bp+var_B2], eax
		mov	eax, [di+8]
		mov	edx, [bp+var_A2]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_B8+2], eax
		mov	eax, [bp+var_B8+2]
		mov	[bp+var_BC+2], eax
		mov	eax, [bp+var_AA]
		mov	[bp+var_14C], eax
		mov	eax, [bp+var_B2]
		mov	[bp+var_148], eax
		mov	eax, [bp+var_BC+2]
		mov	[bp+var_144], eax
		mov	eax, [bp+var_14C]
		mov	[si+0C0h], eax
		mov	eax, [bp+var_148]
		mov	[si+0C4h], eax
		mov	eax, [bp+var_144]
		mov	[si+0C8h], eax
		jmp	loc_79694	; default
; ���������������������������������������������������������������������������

loc_7926A:				; CODE XREF: CameraScript_ExecuteCOMP_781D0:loc_78923j
					; DATA XREF: ovr232:off_79CABo
		mov	ax, [si+8Ch]	; case 0x15
		mov	dx, [si+8Ah]
		inc	dx
		mov	word ptr [bp+var_9E+2],	ax
		mov	word ptr [bp+var_9E], dx
		les	bx, [bp+var_9E]
		mov	eax, es:[bx]

loc_79283:
		mov	[si+0CCh], eax
		add	word ptr [bp+var_9E], 4
		les	bx, [bp+var_9E]
		mov	eax, es:[bx]
		mov	[si+0D0h], eax
		add	word ptr [bp+var_9E], 4
		les	bx, [bp+var_9E]
		mov	eax, es:[bx]
		mov	[si+0D4h], eax
		add	word ptr [bp+var_9E], 4
		mov	eax, [bp+var_9E]
		mov	[si+8Ah], eax
		jmp	loc_79694	; default
; ���������������������������������������������������������������������������

loc_792BE:				; CODE XREF: CameraScript_ExecuteCOMP_781D0:loc_78923j
					; DATA XREF: ovr232:off_79CABo
		mov	ax, [si+8Ch]	; case 0x16
		mov	dx, [si+8Ah]
		inc	dx
		mov	word ptr [bp+var_9E+2],	ax
		mov	word ptr [bp+var_9E], dx
		les	bx, [bp+var_9E]
		mov	eax, es:[bx]
		mov	[bp+var_A2], eax
		add	word ptr [bp+var_9E], 4
		mov	eax, [bp+var_9E]
		mov	[si+8Ah], eax
		mov	di, si
		add	di, 2Ch	; ','
		mov	eax, [di]
		mov	edx, [bp+var_A2]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_A6], eax
		mov	eax, [bp+var_A6]
		mov	[bp+var_AA], eax
		mov	eax, [di+4]
		mov	edx, [bp+var_A2]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_AE], eax
		mov	eax, [bp+var_AE]
		mov	[bp+var_B2], eax
		mov	eax, [di+8]
		mov	edx, [bp+var_A2]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_B8+2], eax
		mov	eax, [bp+var_B8+2]
		mov	[bp+var_BC+2], eax
		mov	eax, [bp+var_AA]
		mov	[bp+var_14C], eax
		mov	eax, [bp+var_B2]
		mov	[bp+var_148], eax
		mov	eax, [bp+var_BC+2]
		mov	[bp+var_144], eax
		mov	eax, [bp+var_14C]
		mov	[si+0CCh], eax
		mov	eax, [bp+var_148]
		mov	[si+0D0h], eax
		mov	eax, [bp+var_144]
		mov	[si+0D4h], eax
		jmp	loc_79694	; default
; ���������������������������������������������������������������������������

loc_7938E:				; CODE XREF: CameraScript_ExecuteCOMP_781D0:loc_78923j
					; DATA XREF: ovr232:off_79CABo
		mov	ax, [si+8Ch]	; case 0x17
		mov	dx, [si+8Ah]
		inc	dx
		mov	word ptr [bp+var_9E+2],	ax
		mov	word ptr [bp+var_9E], dx
		les	bx, [bp+var_9E]
		mov	eax, es:[bx]
		mov	[bp+var_A2], eax
		add	word ptr [bp+var_9E], 4
		mov	eax, [bp+var_9E]
		mov	[si+8Ah], eax
		mov	eax, [si+0C0h]
		mov	edx, eax
		mov	ecx, [bp+var_A2]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[si+0C0h], eax
		mov	ax, si
		add	ax, 0C0h ; '�'
		mov	eax, [si+0C4h]
		mov	edx, eax
		mov	ecx, [bp+var_A2]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[si+0C4h], eax
		mov	ax, si
		add	ax, 0C4h ; '�'
		mov	eax, [si+0C8h]
		mov	edx, eax
		mov	ecx, [bp+var_A2]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[si+0C8h], eax
		mov	ax, si
		add	ax, 0C8h ; '�'
		jmp	loc_79694	; default
; ���������������������������������������������������������������������������

loc_79424:				; CODE XREF: CameraScript_ExecuteCOMP_781D0:loc_78923j
					; DATA XREF: ovr232:off_79CABo
		cmp	word ptr [si+92h], 0 ; case 0x18
		jz	short loc_7945F
		push	word ptr [si+92h]
		push	ss
		lea	ax, [bp+var_F8]
		push	ax
		mov	bx, [si+92h]
		mov	bx, [bx]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		mov	eax, [bp+var_F8]
		mov	[si+0C0h], eax
		mov	eax, [bp+var_F4]
		mov	[si+0C4h], eax
		mov	eax, [bp+var_F0]
		mov	[si+0C8h], eax

loc_7945F:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+1259j
		inc	word ptr [si+8Ah]
		jmp	loc_79694	; default
; ���������������������������������������������������������������������������

loc_79466:				; CODE XREF: CameraScript_ExecuteCOMP_781D0:loc_78923j
					; DATA XREF: ovr232:off_79CABo
		cmp	word ptr [si+92h], 0 ; case 0x19
		jz	short loc_7948A
		push	word ptr [si+92h]
		mov	bx, [si+92h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		mov	ax, si
		add	ax, 0C0h ; '�'
		push	ax
		call	Matrix_LocalToWorld_58828
		add	sp, 4

loc_7948A:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+129Bj
		inc	word ptr [si+8Ah]
		jmp	loc_79694	; default
; ���������������������������������������������������������������������������

loc_79491:				; CODE XREF: CameraScript_ExecuteCOMP_781D0:loc_78923j
					; DATA XREF: ovr232:off_79CABo
		cmp	word ptr [si+92h], 0 ; case 0x1A
		jz	short loc_794B5
		push	word ptr [si+92h]
		mov	bx, [si+92h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		mov	ax, si
		add	ax, 0CCh ; '�'
		push	ax
		call	Matrix_LocalToWorld_58828
		add	sp, 4

loc_794B5:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+12C6j
		inc	word ptr [si+8Ah]
		jmp	loc_79694	; default
; ���������������������������������������������������������������������������

loc_794BC:				; CODE XREF: CameraScript_ExecuteCOMP_781D0:loc_78923j
					; DATA XREF: ovr232:off_79CABo
		mov	byte_70471, 0	; case 0x1B
		mov	byte ptr [si+101h], 1
		inc	word ptr [si+8Ah]
		jmp	loc_79694	; default
; ���������������������������������������������������������������������������

loc_794CD:				; CODE XREF: CameraScript_ExecuteCOMP_781D0:loc_78923j
					; DATA XREF: ovr232:off_79CABo
		cmp	word ptr [si+92h], 0 ; case 0x1C
		jz	short loc_79552
		mov	di, [si+92h]
		add	di, 12h
		mov	ax, si
		add	ax, 14h
		mov	word ptr [bp+var_9E+2],	ax
		mov	eax, [di]
		mov	bx, word ptr [bp+var_9E+2]
		sub	eax, [bx]
		mov	[bp+var_158], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp+var_154], eax
		mov	eax, [di+8]
		sub	eax, [bx+8]
		mov	[bp+var_150], eax
		mov	eax, [bp+var_158]
		mov	[bp+var_14C], eax
		mov	eax, [bp+var_154]
		mov	[bp+var_148], eax
		mov	eax, [bp+var_150]
		mov	[bp+var_144], eax
		lea	ax, [bp+var_14C]
		push	ax
		push	ss
		lea	ax, [bp+var_A2+2]
		push	ax
		call	Math_VectorLength3D_Scaled_54F57
		add	sp, 6
		mov	eax, [bp+var_A2+2]
		mov	[si+0BCh], eax
		mov	byte ptr [si+100h], 1
		mov	byte ptr [si+0FFh], 1

loc_79552:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+1302j
		inc	word ptr [si+8Ah]
		jmp	loc_79694	; default
; ���������������������������������������������������������������������������

loc_79559:				; CODE XREF: CameraScript_ExecuteCOMP_781D0:loc_78923j
					; DATA XREF: ovr232:off_79CABo
		mov	ax, [si+8Ch]	; case 0x1D
		mov	dx, [si+8Ah]
		inc	dx
		mov	word ptr [bp+var_9E+2],	ax
		mov	word ptr [bp+var_9E], dx
		les	bx, [bp+var_9E]
		mov	eax, es:[bx]
		mov	[si+0A0h], eax
		add	word ptr [bp+var_9E], 4
		les	bx, [bp+var_9E]
		mov	eax, es:[bx]
		mov	[si+0E4h], eax
		add	word ptr [bp+var_9E], 4
		les	bx, [bp+var_9E]
		mov	eax, es:[bx]
		mov	[si+0E8h], eax
		add	word ptr [bp+var_9E], 4
		les	bx, [bp+var_9E]
		mov	eax, es:[bx]
		mov	[si+0ECh], eax
		add	word ptr [bp+var_9E], 4
		mov	eax, [bp+var_9E]
		mov	[si+8Ah], eax
		cmp	word ptr [si+92h], 0
		jnz	short loc_795C6
		jmp	loc_79694	; default
; ���������������������������������������������������������������������������

loc_795C6:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+13F1j
		mov	di, si
		add	di, 14h
		mov	ax, [si+92h]
		add	ax, 12h
		mov	word ptr [bp+var_A2+2],	ax
		mov	eax, [di]
		mov	bx, word ptr [bp+var_A2+2]
		sub	eax, [bx]
		mov	[bp+var_14C], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp+var_148], eax
		mov	eax, [di+8]
		sub	eax, [bx+8]
		mov	[bp+var_144], eax
		mov	eax, [bp+var_14C]
		mov	[bp+var_158], eax
		mov	eax, [bp+var_148]
		mov	[bp+var_154], eax
		mov	eax, [bp+var_144]
		mov	[bp+var_150], eax
		mov	eax, [bp+var_158]
		mov	[si+0B0h], eax
		mov	eax, [bp+var_154]
		mov	[si+0B4h], eax
		mov	eax, [bp+var_150]
		mov	[si+0B8h], eax
		mov	byte ptr [si+0FFh], 1
		mov	byte ptr [si+100h], 0
		mov	byte ptr [si+0FEh], 1Dh
		jmp	short loc_79694	; default
; ���������������������������������������������������������������������������

loc_7964C:				; CODE XREF: CameraScript_ExecuteCOMP_781D0:loc_78923j
					; DATA XREF: ovr232:off_79CABo
		mov	ax, [si+8Ch]	; case 0xFE
		mov	dx, [si+8Ah]
		inc	dx
		mov	word ptr [bp+var_A6+2],	ax
		mov	word ptr [bp+var_A6], dx
		push	8
		push	ax
		push	dx
		push	ss
		lea	ax, [bp+var_A2]
		push	ax
		call	CRT_MemFamily_Extra8
		add	sp, 0Ah
		add	word ptr [si+8Ah], 9
		push	ss
		lea	ax, [bp+var_A2]
		push	ax
		push	59CDh
		call	EntityTracker_FindByID
		add	sp, 6
		mov	bx, ax
		or	bx, bx
		jz	short loc_7968F
		mov	word_72A8C, bx

loc_7968F:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+14B9j
		mov	al, 0
		jmp	loc_79C6B
; ���������������������������������������������������������������������������

loc_79694:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+750j
					; CameraScript_ExecuteCOMP_781D0+789j ...
		mov	al, byte_722D1	; default
		mov	ah, 0
		cmp	ax, 1
		jnz	short loc_796AA	; default
		cmp	byte ptr [si+101h], 0
		jz	short loc_796AA	; default
		mov	byte ptr [si+0FEh], 0FFh

loc_796AA:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+40j
					; CameraScript_ExecuteCOMP_781D0+5Ej ...
		cmp	byte ptr [si+0FEh], 0FFh ; default
		jnz	short loc_796B4
		jmp	loc_788FF
; ���������������������������������������������������������������������������

loc_796B4:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+14DFj
		mov	eax, [si+0C0h]
		or	eax, [si+0C4h]
		or	eax, [si+0C8h]
		jnz	short loc_796CA
		mov	ax, 1
		jmp	short loc_796CC
; ���������������������������������������������������������������������������

loc_796CA:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+14F3j
		xor	ax, ax

loc_796CC:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+14F8j
		mov	ah, 0
		or	ax, ax
		jz	short loc_796D5
		jmp	loc_79767
; ���������������������������������������������������������������������������

loc_796D5:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+1500j
		mov	di, si
		add	di, 0C0h ; '�'
		mov	eax, [di]
		mov	edx, dword_7045E

loc_796E3:
		imul	edx

loc_796E6:
		shrd	eax, edx, 8

loc_796EB:
		mov	[bp+var_2E], eax

loc_796EF:
		mov	eax, [bp+var_2E]

loc_796F3:
		mov	[bp+var_32], eax

loc_796F7:
		mov	eax, [di+4]
		mov	edx, dword_7045E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_36], eax
		mov	eax, [bp+var_36]
		mov	[bp+var_3A], eax
		mov	eax, [di+8]
		mov	edx, dword_7045E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_3E], eax
		mov	eax, [bp+var_3E]
		mov	[bp+var_42], eax
		mov	eax, [bp+var_32]
		mov	[bp+var_104], eax
		mov	eax, [bp+var_3A]
		mov	[bp+var_100], eax
		mov	eax, [bp+var_42]
		mov	[bp+var_FC], eax
		mov	eax, [bp+var_104]
		add	[si+14h], eax
		mov	eax, [bp+var_100]
		add	[si+18h], eax
		mov	eax, [bp+var_FC]
		add	[si+1Ch], eax

loc_79767:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+1502j
		mov	eax, [si+0CCh]
		or	eax, [si+0D0h]
		or	eax, [si+0D4h]
		jnz	short loc_7977D
		mov	ax, 1
		jmp	short loc_7977F
; ���������������������������������������������������������������������������

loc_7977D:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+15A6j
		xor	ax, ax

loc_7977F:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+15ABj
		mov	ah, 0
		or	ax, ax
		jz	short loc_79788
		jmp	loc_7981D
; ���������������������������������������������������������������������������

loc_79788:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+15B3j
		mov	di, si
		add	di, 0CCh ; '�'
		mov	eax, [di]
		mov	edx, dword_70458
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_46], eax
		mov	eax, [bp+var_46]
		mov	[bp+var_4A], eax
		mov	eax, [di+4]
		mov	edx, dword_70458
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4E], eax
		mov	eax, [bp+var_4E]
		mov	[bp+var_52], eax
		mov	eax, [di+8]
		mov	edx, dword_70458
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_56], eax
		mov	eax, [bp+var_56]
		mov	[bp+var_5A], eax

loc_797E4:
		mov	eax, [bp+var_4A]
		mov	[bp+var_110], eax

loc_797ED:
		mov	eax, [bp+var_52]
		mov	[bp+var_10C], eax
		mov	eax, [bp+var_5A]
		mov	[bp+var_108], eax
		mov	eax, [bp+var_110]
		add	[si+0C0h], eax
		mov	eax, [bp+var_10C]
		add	[si+0C4h], eax
		mov	eax, [bp+var_108]
		add	[si+0C8h], eax

loc_7981D:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+15B5j
		mov	eax, [si+0D8h]
		or	eax, [si+0DCh]
		or	eax, [si+0E0h]
		jnz	short loc_79833
		mov	ax, 1
		jmp	short loc_79835
; ���������������������������������������������������������������������������

loc_79833:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+165Cj
		xor	ax, ax

loc_79835:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+1661j
		mov	ah, 0
		or	ax, ax
		jz	short loc_7983E
		jmp	loc_798C8
; ���������������������������������������������������������������������������

loc_7983E:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+1669j
		mov	di, si
		add	di, 0D8h ; '�'
		mov	eax, [di]
		mov	edx, dword_70458
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_5E], eax
		mov	eax, [bp+var_5E]
		mov	[bp+var_62], eax
		mov	eax, [di+4]
		mov	edx, dword_70458
		imul	edx
		shrd	eax, edx, 8

loc_79871:
		mov	[bp+var_66], eax

loc_79875:
		mov	eax, [bp+var_66]

loc_79879:
		mov	[bp+var_6A], eax

loc_7987D:
		mov	eax, [di+8]

loc_79881:
		mov	edx, dword_70458

loc_79886:
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_6E], eax
		mov	eax, [bp+var_6E]
		mov	[bp+var_72], eax
		mov	eax, [bp+var_62]
		mov	[bp+var_11C], eax
		mov	eax, [bp+var_6A]
		mov	[bp+var_118], eax
		mov	eax, [bp+var_72]
		mov	[bp+var_114], eax
		lea	ax, [bp+var_11C]
		push	ax
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	WorldObject_BuildOrientationMatrix_56E8A
		add	sp, 4

loc_798C8:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+166Bj
		cmp	byte ptr [si+100h], 0
		jnz	short loc_798D2
		jmp	loc_79BBE
; ���������������������������������������������������������������������������

loc_798D2:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+16FDj
		cmp	byte ptr [si+0FFh], 0
		jnz	short loc_798DC
		jmp	loc_7998E
; ���������������������������������������������������������������������������

loc_798DC:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+1707j
		cmp	word ptr [si+92h], 0
		jnz	short loc_798E6

loc_798E3:
		jmp	loc_7998E
; ���������������������������������������������������������������������������

loc_798E6:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+1711j
		mov	di, si
		add	di, 94h	; '�'

loc_798EC:
		mov	eax, [di]
		mov	[bp+var_14C], eax
		mov	eax, [di+4]
		mov	[bp+var_148], eax
		mov	eax, [di+8]
		mov	[bp+var_144], eax
		push	word ptr [si+92h]
		mov	bx, [si+92h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		lea	ax, [bp+var_14C]
		push	ax
		call	Matrix_LocalToWorld_58828
		add	sp, 4
		mov	di, [si+92h]
		add	di, 12h
		mov	eax, [di]
		add	eax, [bp+var_14C]
		mov	[bp+var_158], eax
		mov	eax, [di+4]
		add	eax, [bp+var_148]
		mov	[bp+var_154], eax
		mov	eax, [di+8]
		add	eax, [bp+var_144]
		mov	[bp+var_150], eax
		mov	eax, [bp+var_158]
		mov	[bp+var_164], eax
		mov	eax, [bp+var_154]
		mov	[bp+var_160], eax
		mov	eax, [bp+var_150]
		mov	[bp+var_15C], eax
		mov	eax, [bp+var_164]

loc_79975:
		mov	[si+0B0h], eax
		mov	eax, [bp+var_160]

loc_7997F:
		mov	[si+0B4h], eax
		mov	eax, [bp+var_15C]
		mov	[si+0B8h], eax

loc_7998E:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+1709j
					; CameraScript_ExecuteCOMP_781D0:loc_798E3j
		cmp	dword ptr [si+0A4h], 0
		jle	short loc_7999B
		mov	ax, 1
		jmp	short loc_7999D
; ���������������������������������������������������������������������������

loc_7999B:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+17C4j
		xor	ax, ax

loc_7999D:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+17C9j
		or	al, al
		jz	short loc_79A02
		cmp	dword ptr [si+0A0h], 0
		jle	short loc_799AE
		mov	ax, 1
		jmp	short loc_799B0
; ���������������������������������������������������������������������������

loc_799AE:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+17D7j
		xor	ax, ax

loc_799B0:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+17DCj
		or	al, al
		jz	short loc_79A02
		mov	eax, [si+0ACh]
		mov	edx, dword_70458
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_76], eax
		mov	eax, [bp+var_76]
		mov	[bp+var_7A], eax
		add	[si+0A8h], eax
		mov	eax, [si+0A8h]
		mov	edx, dword_7045E
		imul	edx
		shrd	eax, edx, 8

loc_799E9:
		mov	[bp+var_A2], eax
		mov	eax, [bp+var_A2]
		mov	[bp+var_9E], eax
		sub	[si+0A4h], eax
		sub	[si+0BCh], eax

loc_79A02:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+17CFj
					; CameraScript_ExecuteCOMP_781D0+17E2j
		cmp	dword ptr [si+0F2h], 0
		jle	short loc_79A0F
		mov	ax, 1
		jmp	short loc_79A11
; ���������������������������������������������������������������������������

loc_79A0F:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+1838j
		xor	ax, ax

loc_79A11:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+183Dj
		or	al, al
		jnz	short loc_79A18
		jmp	loc_79ABB
; ���������������������������������������������������������������������������

loc_79A18:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+1843j
		mov	ax, [si+0F0h]
		mov	word ptr [bp+var_A2+2],	ax
		movsx	eax, word ptr [bp+var_A2+2]
		shl	eax, 8
		mov	[bp+var_A6+2], eax
		mov	eax, [bp+var_A6+2]
		mov	edx, dword_70458
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_AA+2], eax
		mov	eax, [bp+var_AA+2]
		mov	[bp+var_9E], eax
		mov	eax, [bp+var_9E]
		or	eax, eax
		jge	short loc_79A5D
		neg	eax

loc_79A5D:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+1888j
		mov	[bp+var_AE+2], eax
		mov	eax, [bp+var_AE+2]
		mov	[bp+var_B2+2], eax
		sub	[si+0F2h], eax

loc_79A71:
		mov	eax, [bp+var_9E]
		add	[si+0F6h], eax

loc_79A7B:
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	Matrix_BuildFromAngle_56D72
		pop	cx
		mov	ax, si
		add	ax, 0F6h ; '�'
		push	ax
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	Matrix_BuildAxisZ_572BC
		add	sp, 4
		mov	ax, si
		add	ax, 0FAh ; '�'
		push	ax
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	Matrix_BuildAxisX_56EC3
		add	sp, 4
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	Matrix_OrthonormalizeKeepRow1_57660
		pop	cx

loc_79ABB:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+1845j
		mov	di, si
		add	di, 0B0h ; '�'
		mov	ax, si
		add	ax, 0BCh ; '�'
		mov	[bp+var_7C], ax
		mov	ax, si
		add	ax, 2Ch	; ','
		mov	[bp+var_7E], ax
		mov	bx, [bp+var_7E]
		mov	eax, [bx]
		mov	bx, [bp+var_7C]
		mov	edx, [bx]
		imul	edx

loc_79AE0:
		shrd	eax, edx, 8

loc_79AE5:
		mov	[bp+var_82], eax

loc_79AEA:
		mov	eax, [bp+var_82]

loc_79AEF:
		mov	[bp+var_86], eax

loc_79AF4:
		mov	bx, [bp+var_7E]

loc_79AF7:
		mov	eax, [bx+4]
		mov	bx, [bp+var_7C]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_8A], eax
		mov	eax, [bp+var_8A]
		mov	[bp+var_8E], eax
		mov	bx, [bp+var_7E]
		mov	eax, [bx+8]
		mov	bx, [bp+var_7C]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_92], eax
		mov	eax, [bp+var_92]
		mov	[bp+var_96], eax
		mov	eax, [bp+var_86]
		mov	[bp+var_128], eax
		mov	eax, [bp+var_8E]
		mov	[bp+var_124], eax
		mov	eax, [bp+var_96]
		mov	[bp+var_120], eax
		mov	eax, [di]
		sub	eax, [bp+var_128]
		mov	[bp+var_134], eax
		mov	eax, [di+4]
		sub	eax, [bp+var_124]
		mov	[bp+var_130], eax
		mov	eax, [di+8]

loc_79B79:
		sub	eax, [bp+var_120]
		mov	[bp+var_12C], eax
		mov	eax, [bp+var_134]
		mov	[bp+var_140], eax
		mov	eax, [bp+var_130]
		mov	[bp+var_13C], eax
		mov	eax, [bp+var_12C]
		mov	[bp+var_138], eax
		mov	eax, [bp+var_140]
		mov	[si+14h], eax
		mov	eax, [bp+var_13C]
		mov	[si+18h], eax
		mov	eax, [bp+var_138]
		mov	[si+1Ch], eax
		jmp	short loc_79C36
; ���������������������������������������������������������������������������

loc_79BBE:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+16FFj
		cmp	byte ptr [si+0FFh], 0
		jz	short loc_79C36
		cmp	word ptr [si+92h], 0
		jz	short loc_79C36
		mov	di, [si+92h]
		add	di, 12h
		mov	ax, si
		add	ax, 14h
		mov	word ptr [bp+var_9E+2],	ax
		mov	eax, [di]

loc_79BDF:
		mov	bx, word ptr [bp+var_9E+2]
		sub	eax, [bx]

loc_79BE6:
		mov	[bp+var_158], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp+var_154], eax
		mov	eax, [di+8]
		sub	eax, [bx+8]
		mov	[bp+var_150], eax
		mov	eax, [bp+var_158]
		mov	[bp+var_14C], eax
		mov	eax, [bp+var_154]
		mov	[bp+var_148], eax
		mov	eax, [bp+var_150]
		mov	[bp+var_144], eax
		lea	ax, [bp+var_14C]
		push	ax
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	UI_ApplyLineOfSightAndTransform_57DAE
		add	sp, 4

loc_79C36:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+19ECj
					; CameraScript_ExecuteCOMP_781D0+19F3j ...
		cmp	dword ptr [si+0A0h], 0
		jle	short loc_79C43
		mov	ax, 1
		jmp	short loc_79C45
; ���������������������������������������������������������������������������

loc_79C43:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+1A6Cj
		xor	ax, ax

loc_79C45:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+1A71j
		or	al, al
		jz	short loc_79C59
		cmp	byte ptr [si+0FEh], 1
		jz	short loc_79C59
		mov	eax, dword_70458
		sub	[si+0A0h], eax

loc_79C59:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+1A77j
					; CameraScript_ExecuteCOMP_781D0+1A7Ej
		mov	eax, dword_70458
		add	[si+8Eh], eax
		push	si
		call	Camera_ComputeViewMatrix
		pop	cx
		mov	al, 1

loc_79C6B:				; CODE XREF: CameraScript_ExecuteCOMP_781D0+14C1j
		pop	di
		pop	si
		leave
		retf
CameraScript_ExecuteCOMP_781D0	endp

; ���������������������������������������������������������������������������
word_79C6F	dw	1,     2,     3,     4 ; DATA XREF: CameraScript_ExecuteCOMP_781D0+73Fo
		dw	5,     6,     7,     8 ; value table for switch	statement
		dw	9,   0Ah,   0Bh,   0Ch
		dw    0Dh,   0Eh,   0Fh,   10h
		dw    11h,   12h,   13h,   14h
		dw    15h,   16h,   17h,   18h
		dw    19h,   1Ah,   1Bh,   1Ch
		dw    1Dh,  0FEh
off_79CAB	dw offset loc_78927	; jump table for switch	statement
		dw offset loc_7895C
		dw offset loc_79066
		dw offset loc_789F0
		dw offset loc_78AAA
		dw offset loc_78B43
		dw offset loc_78BA1
		dw offset loc_78C01
		dw offset loc_78C26
		dw offset loc_78C50
		dw offset loc_78CDD
		dw offset loc_78D02
		dw offset loc_78D3C
		dw offset loc_78E82
		dw offset loc_78FA8
		dw offset loc_7903B
		dw offset loc_79072
		dw offset loc_79146
		dw offset loc_78BF0
		dw offset loc_7919A
		dw offset loc_7926A
		dw offset loc_792BE
		dw offset loc_7938E
		dw offset loc_79424
		dw offset loc_79466
		dw offset loc_79491
		dw offset loc_794BC
		dw offset loc_794CD
		dw offset loc_79559
		dw offset loc_7964C
word_79CE7	dw	1,     4,   0Bh,   1Dh ; DATA XREF: CameraScript_ExecuteCOMP_781D0+2Fo
					; value	table for switch statement
		dw offset loc_78217	; jump table for switch	statement
		dw offset loc_78239
		dw offset loc_78661
		dw offset loc_783F0

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (10 lignes).
; ==============================================================================================
AI_ManeuverHelper_79CF7	proc far		; CODE XREF: VROOMM_StubThunk_6AC2FJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
AI_ManeuverHelper_79CF7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine WeakRef_InvalidateIfSet, Memory_TypedFree_5C7B6 — nettoyage de référence faible
; en fin de manœuvre. || (2026-08-30) = AI_ManeuverCleanup : vtable[0x0C] de l'objet
; manoeuvre/caméra (off_6D510). WeakRef_InvalidateIfSet(obj+0x92) (libère l'entité liée) ; si
; obj+0x85 && obj+0x80 -> Memory_TypedFree(obj+0x80) (buffer script) ; reset obj+0x80/85/86=0
; ; stub 6BC35 ; si arg&1 -> CRT_FreeNear(obj). Voir DATA_MODEL.md §6.6b.
; ==============================================================================================
AI_ManeuverCleanup_79CFF	proc far		; CODE XREF: VROOMM_StubThunk_6AC2AJ

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_79D76
		mov	ax, si
		add	ax, 92h	; '�'
		push	ax
		call	WeakRef_InvalidateIfSet
		pop	cx
		cmp	byte ptr [si+85h], 0
		jz	short loc_79D43
		cmp	dword ptr [si+80h], 0
		jz	short loc_79D43
		push	0
		mov	al, [si+84h]
		push	ax
		mov	ax, si
		add	ax, 80h	; '�'
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_79D43:				; CODE XREF: AI_ManeuverCleanup_79CFF+20j
					; AI_ManeuverCleanup_79CFF+28j
		mov	dword ptr [si+80h], 0
		mov	byte ptr [si+85h], 0
		mov	dword ptr [si+86h], 0
		push	0
		push	si
		call	VROOMM_StubThunk_6BC35
		add	sp, 4
		test	di, 1
		jz	short loc_79D74
		push	si
		call	CRT_FreeNear_Wrap

loc_79D71:
		pop	cx
		jmp	short loc_79D76
; ���������������������������������������������������������������������������

loc_79D74:				; CODE XREF: AI_ManeuverCleanup_79CFF+6Aj
		jmp	short $+2

loc_79D76:				; CODE XREF: AI_ManeuverCleanup_79CFF+Dj
					; AI_ManeuverCleanup_79CFF+73j
		pop	di

loc_79D77:
		pop	si
		pop	bp
		retf
AI_ManeuverCleanup_79CFF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (13 lignes).
; ==============================================================================================
AI_ManeuverHelper2_79D7A	proc far		; CODE XREF: VROOMM_StubThunk_6AC25J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+92h]
		pop	si
		pop	bp
		retf
AI_ManeuverHelper2_79D7A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (11 lignes).
; ==============================================================================================
AI_ManeuverHelper3_79D88	proc far		; CODE XREF: VROOMM_StubThunk_6AC20J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		xor	ax, ax
		pop	bp
		retf
AI_ManeuverHelper3_79D88	endp

ovr232		ends

ovr239		segment	para public 'OVERLAY' use16
		assume cs:ovr239
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à AIManeuver_AllocateField_77DD0 (sub_77DD0 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; alloue via Memory_TypedAllocDispatchB_5C832 (53 lignes).
; ==============================================================================================
AIManeuver_AllocateField_87A70		proc far

var_4		= dword ptr -4
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
		mov	[si+0CCh], eax
		xor	eax, eax
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
		push	large [si+80h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	[si+8Ch], dx
		mov	[si+8Ah], ax
		pop	si
		leave
		retf
AIManeuver_AllocateField_87A70		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à AIManeuver_LoadFormationData_77E78 (sub_77E78 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 152 lignes, NON DÉTAILLÉE — combine Formation_ComputeGeometryHelper_56D43,
; String_ConstructEmpty, ReadFieldGroupA_64A19 — chargement de données de formation pour la
; manœuvre IA.
; ==============================================================================================
AIManeuver_LoadFormationData_87B18		proc far

var_28		= word ptr -28h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 28h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_87B3C
		push	102h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_87B3C
		jmp	loc_87C64

loc_87B3C:
		mov	ax, si
		add	ax, 20h
		push	ax
		call	Formation_ComputeGeometryHelper_58B0C
		pop	cx
		mov	word ptr [si+50h], 6D0h
		mov	ax, si
		add	ax, 53h
		push	ax
		call	String_ConstructEmpty
		pop	cx
		push	si
		call	sub_73DDD
		pop	cx
		mov	word ptr [si+50h], 6ACh
		mov	dword ptr [si+80h], 0
		mov	byte ptr [si+84h], 2
		mov	byte ptr [si+85h], 0
		mov	dword ptr [si+86h], 0
		mov	ax, si
		add	ax, 8Eh
		mov	word ptr [si+92h], 0
		mov	ax, si
		add	ax, 94h
		mov	ax, si
		add	ax, 0A0h
		mov	ax, si
		add	ax, 0A4h
		mov	ax, si
		add	ax, 0A8h
		mov	ax, si
		add	ax, 0ACh
		mov	ax, si
		add	ax, 0B0h
		mov	ax, si
		add	ax, 0BCh
		mov	ax, si
		add	ax, 0C0h
		mov	ax, si
		add	ax, 0CCh
		mov	ax, si
		add	ax, 0D8h
		mov	ax, si
		add	ax, 0E4h
		mov	ax, si
		add	ax, 0F2h
		mov	ax, si
		add	ax, 0F6h
		mov	ax, si
		add	ax, 0FAh
		push	large 1Ch
		push	ss
		lea	ax, [bp+var_28]
		push	ax
		push	di
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		lea	ax, [bp+var_28]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr AIManeuver_Helper_87D45
		add	sp, 4
		mov	eax, [di+72h]
		add	eax, 0FFFFFFE4h
		mov	[bp+var_4], eax
		mov	[bp+var_8], eax
		push	1
		push	0
		push	2
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		mov	eax, [bp+var_C]
		mov	[si+80h], eax
		mov	byte ptr [si+84h], 2
		mov	byte ptr [si+85h], 1
		mov	dword ptr [si+86h], 0
		mov	eax, [bp+var_8]
		mov	[si+86h], eax
		push	large [bp+var_4]
		push	0
		mov	al, [si+84h]
		push	ax
		push	large [si+80h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah

loc_87C64:
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
AIManeuver_LoadFormationData_87B18		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à AIManeuver_LoadFormationDataB_77FCA (sub_77FCA de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; variante de AIManeuver_LoadFormationData_77E78 (101 lignes). || CONSTRUCTEUR objet
; caméra/manoeuvre COMP (2026-08-30) : cible du stub 6AC3E, appelé depuis
; Kneeboard_RenderEntry case 0x13. Alloc 0x102 o ; [obj+0x50] = vtable 0x460 (off_6D510) ;
; Formation_ComputeGeometryHelper(obj+0x20) ; String_ConstructEmpty(obj+0x53) ; [obj+0x80]=0
; (curseur script), [obj+0x84]=2, [obj+0x86]=0 (longueur) ; copie les 0x1C octets d'en-tête
; (CRT_MemFamily_Extra1) -> AIManeuver_Helper_780A5(obj, &header). Champs vecteurs init à
; obj+0x8E..0xFA. Kneeboard_RenderEntry pose ensuite [obj+0x80]=payload+0x1C,
; [obj+0x86]=len-0x1C. Voir DATA_MODEL.md §6.6b b-bis.
; ==============================================================================================
AIManeuver_LoadFormationDataB_87C6A		proc far

var_1C		= word ptr -1Ch
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_87C8A
		push	102h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_87C8A
		jmp	loc_87D40

loc_87C8A:
		mov	ax, si
		add	ax, 20h
		push	ax
		call	Formation_ComputeGeometryHelper_58B0C
		pop	cx
		mov	word ptr [si+50h], 6D0h
		mov	ax, si
		add	ax, 53h
		push	ax
		call	String_ConstructEmpty
		pop	cx
		push	si
		call	sub_73DDD
		pop	cx
		mov	word ptr [si+50h], 6ACh
		mov	dword ptr [si+80h], 0
		mov	byte ptr [si+84h], 2
		mov	byte ptr [si+85h], 0
		mov	dword ptr [si+86h], 0
		mov	ax, si
		add	ax, 8Eh
		mov	word ptr [si+92h], 0
		mov	ax, si
		add	ax, 94h
		mov	ax, si
		add	ax, 0A0h
		mov	ax, si
		add	ax, 0A4h
		mov	ax, si
		add	ax, 0A8h
		mov	ax, si
		add	ax, 0ACh
		mov	ax, si
		add	ax, 0B0h
		mov	ax, si
		add	ax, 0BCh
		mov	ax, si
		add	ax, 0C0h
		mov	ax, si
		add	ax, 0CCh
		mov	ax, si
		add	ax, 0D8h
		mov	ax, si
		add	ax, 0E4h
		mov	ax, si
		add	ax, 0F2h
		mov	ax, si
		add	ax, 0F6h
		mov	ax, si
		add	ax, 0FAh
		push	1Ch
		push	large [bp+arg_2]
		push	ss
		lea	ax, [bp+var_1C]
		push	ax
		call	sub_37C3
		add	sp, 0Ah
		lea	ax, [bp+var_1C]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr AIManeuver_Helper_87D45
		add	sp, 4

loc_87D40:
		mov	ax, si
		pop	si
		leave
		retf
AIManeuver_LoadFormationDataB_87C6A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à AIManeuver_Helper_780A5 (sub_780A5 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine
; allocation et copie de chaîne (CRT_Strncpy_Pad), 105 lignes. || PARSE EN-TÊTE COMP 0x1C
; (2026-08-30) : AIManeuver_Helper_780A5(obj, &header28). En-tête COMP = 28 o : +0x00 char[8]
; nom -> obj[+0x53] (CRT_Strncpy_Pad 8) ; +0x08 u16 flags (bit0 -> obj[+0x52] bit1) ; +0x0A
; u32 farClip=50000 ; +0x0E u16 signé -> movsx<<8 (entier converti en 24.8) ; +0x10 i32
; (var_16) ; +0x14..0x17 u16,u16 (0,0) ; +0x18..0x1B u16 viewW=319, u16 viewH=199 -> sous-
; objet viewport obj[+0x5C] type 0x44C via stub 6BBE0. farClip + (u16<<8) + i32 passés à stub
; 6BC12. Script = payload +0x1C..fin. Voir DATA_MODEL.md §6.6b b-bis.
; ==============================================================================================
AIManeuver_Helper_87D45		proc far

var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
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
		jz	short loc_87DB2
		mov	word ptr [di], 698h
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
		call	sub_73DB0
		add	sp, 0Ah
		mov	ax, di
		jmp	short loc_87DB4

loc_87DB2:
		mov	ax, di

loc_87DB4:
		mov	[si+5Ch], ax
		sub	sp, 4
		mov	di, [bp+arg_2]
		add	di, 10h
		mov	eax, [di]
		mov	[bp+var_16], eax
		sub	sp, 4
		mov	bx, [bp+arg_2]
		mov	ax, [bx+0Eh]
		mov	[bp+var_A], ax
		movsx	eax, [bp+var_A]
		shl	eax, 8
		mov	[bp+var_1A], eax
		push	large [bx+0Ah]
		push	word ptr [si+5Ch]
		push	si
		call	sub_73DE2
		add	sp, 10h
		mov	ax, [bp+arg_2]
		mov	[bp+var_C], ax
		push	8
		push	ax
		mov	ax, si
		add	ax, 53h
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
		retf
AIManeuver_Helper_87D45		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_87E24		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 14h
		pop	bp
		retf
sub_87E24		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; AIManeuver_Helper3_7818E (sub_7818E de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, thunk voisin uniquement (36 lignes). || (2026-08-30) =
; tick vtable[0x00] de l'objet manoeuvre/caméra COMP (off_6D510) ; appelé chaque frame.
; Combine stub 6BC26 + AIManeuver_AllocateField_77DD0. Voir AI_ManeuverSolutionMain_781D0 et
; DATA_MODEL.md §6.6b.
; ==============================================================================================
AIManeuver_Helper3_87E2E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	sub_73DF6
		pop	cx
		or	al, al
		jz	short loc_87E57
		mov	byte_79787, 1
		push	si
		push	cs
		call	near ptr AIManeuver_AllocateField_87A70
		pop	cx
		push	si
		mov	bx, [si+50h]
		call	dword ptr [bx+10h]
		pop	cx
		mov	al, 1
		jmp	short loc_87E59

loc_87E57:
		mov	al, 0

loc_87E59:
		pop	si
		pop	bp
		retf
AIManeuver_Helper3_87E2E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; AIManeuver_Helper4_781BC (sub_781BC de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, thunk voisin uniquement (14 lignes).
; ==============================================================================================
AIManeuver_Helper4_87E5C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		call	sub_73DFB
		pop	cx
		mov	byte_79787, 0
		pop	bp
		retf
AIManeuver_Helper4_87E5C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_87E70		proc far

var_170		= dword ptr -170h
var_16C		= dword ptr -16Ch
var_168		= dword ptr -168h
var_164		= dword ptr -164h
var_160		= dword ptr -160h
var_15C		= dword ptr -15Ch
var_158		= dword ptr -158h
var_154		= dword ptr -154h
var_150		= dword ptr -150h
var_14C		= dword ptr -14Ch
var_148		= dword ptr -148h
var_144		= dword ptr -144h
var_140		= dword ptr -140h
var_13C		= dword ptr -13Ch
var_138		= dword ptr -138h
var_134		= dword ptr -134h
var_130		= dword ptr -130h
var_12C		= dword ptr -12Ch
var_128		= dword ptr -128h
var_124		= dword ptr -124h
var_120		= dword ptr -120h
var_11C		= dword ptr -11Ch
var_118		= dword ptr -118h
var_114		= dword ptr -114h
var_110		= dword ptr -110h
var_10C		= dword ptr -10Ch
var_108		= dword ptr -108h
var_104		= dword ptr -104h
var_100		= dword ptr -100h
var_FC		= dword ptr -0FCh
var_F8		= dword ptr -0F8h
var_F4		= dword ptr -0F4h
var_F0		= dword ptr -0F0h
var_EC		= dword ptr -0ECh
var_E8		= dword ptr -0E8h
var_E4		= dword ptr -0E4h
var_E0		= dword ptr -0E0h
var_DC		= dword ptr -0DCh
var_D8		= dword ptr -0D8h
var_D4		= dword ptr -0D4h
var_D0		= dword ptr -0D0h
var_CC		= dword ptr -0CCh
var_C8		= dword ptr -0C8h
var_C4		= dword ptr -0C4h
var_C0		= dword ptr -0C0h
var_BC		= dword ptr -0BCh
var_BA		= dword ptr -0BAh
var_B8		= dword ptr -0B8h
var_B6		= dword ptr -0B6h
var_B4		= dword ptr -0B4h
var_B2		= dword ptr -0B2h
var_B0		= dword ptr -0B0h
var_AE		= dword ptr -0AEh
var_AC		= dword ptr -0ACh
var_AA		= dword ptr -0AAh
var_A8		= dword ptr -0A8h
var_A6		= dword ptr -0A6h
var_A4		= dword ptr -0A4h
var_A2		= dword ptr -0A2h
var_A0		= dword ptr -0A0h
var_9E		= dword ptr -9Eh
var_9A		= word ptr -9Ah
var_98		= word ptr -98h
var_96		= dword ptr -96h
var_92		= dword ptr -92h
var_8E		= dword ptr -8Eh
var_8A		= dword ptr -8Ah
var_86		= dword ptr -86h
var_82		= dword ptr -82h
var_7E		= word ptr -7Eh
var_7C		= word ptr -7Ch
var_7A		= dword ptr -7Ah
var_76		= dword ptr -76h
var_72		= dword ptr -72h
var_6E		= dword ptr -6Eh
var_6A		= dword ptr -6Ah
var_66		= dword ptr -66h
var_62		= dword ptr -62h
var_5E		= dword ptr -5Eh
var_5A		= dword ptr -5Ah
var_56		= dword ptr -56h
var_52		= dword ptr -52h
var_4E		= dword ptr -4Eh
var_4A		= dword ptr -4Ah
var_46		= dword ptr -46h
var_42		= dword ptr -42h
var_3E		= dword ptr -3Eh
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= word ptr -2Ah
var_28		= dword ptr -28h
var_24		= dword ptr -24h
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
		sub	sp, 170h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	al, byte_7CAC3
		mov	ah, 0
		cmp	ax, 1
		jnz	short loc_87E92
		cmp	byte ptr [si+101h], 0
		jz	short loc_87E92
		mov	byte ptr [si+0FEh], 0FFh

loc_87E92:
		mov	al, [si+0FEh]
		mov	ah, 0
		mov	[bp+var_98], ax
		mov	cx, 4
		mov	bx, offset word_89980

loc_87EA2:
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_98]
		jz	short loc_87EB3
		add	bx, 2
		loop	short loc_87EA2
		jmp	loc_8934A

loc_87EB3:
		jmp	word ptr cs:[bx+8] ; switch jump

loc_87EB7:
		mov	eax, [si+8Eh]
		cmp	eax, [si+0A0h]
		jl	short loc_87EC8
		mov	ax, 1
		jmp	short loc_87ECA

loc_87EC8:
		xor	ax, ax

loc_87ECA:
		or	al, al
		jnz	short loc_87ED1
		jmp	loc_8934A

loc_87ED1:
		mov	byte ptr [si+0FEh], 0FFh
		jmp	loc_8934A

loc_87ED9:
		cmp	dword ptr [si+0A0h], 0
		jg	short loc_87EE6
		mov	ax, 1
		jmp	short loc_87EE8

loc_87EE6:
		xor	ax, ax

loc_87EE8:
		or	al, al
		jz	short loc_87F14
		mov	ax, si
		add	ax, 20h
		push	ax
		call	Matrix_BuildFromAngle_58B3B
		pop	cx
		mov	ax, si
		add	ax, 0E4h
		push	ax
		mov	ax, si
		add	ax, 20h
		push	ax
		call	WorldObject_BuildOrientationMatrix_58C53
		add	sp, 4
		mov	byte ptr [si+0FEh], 0FFh
		jmp	loc_8934A

loc_87F14:
		mov	ax, si
		add	ax, 20h
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_4]
		push	ax
		call	sub_59A03
		add	sp, 6
		mov	eax, [si+0E4h]
		sub	eax, [bp+var_4]
		mov	[bp+var_8], eax
		mov	[bp+var_C], eax
		mov	[bp+var_D4], eax
		mov	ax, si
		add	ax, 20h
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_10]
		push	ax
		call	Matrix_RollAngle_59A30
		add	sp, 6
		mov	eax, [si+0E8h]
		sub	eax, [bp+var_10]
		mov	[bp+var_14], eax
		mov	[bp+var_18], eax
		mov	[bp+var_D0], eax
		mov	ax, si
		add	ax, 20h
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_1C]
		push	ax
		call	sub_59B4A
		add	sp, 6
		mov	eax, [si+0ECh]
		sub	eax, [bp+var_1C]
		mov	[bp+var_20], eax
		mov	[bp+var_24], eax
		mov	[bp+var_CC], eax
		lea	ax, word ptr [bp+var_D4]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_28]
		push	ax
		call	Math_VectorLength3D_Scaled_56D92
		add	sp, 6
		cmp	[bp+var_28], 200h
		jge	short loc_87FB0
		mov	ax, 1
		jmp	short loc_87FB2

loc_87FB0:
		xor	ax, ax

loc_87FB2:
		or	al, al
		jz	short loc_87FDE
		mov	ax, si
		add	ax, 20h
		push	ax
		call	Matrix_BuildFromAngle_58B3B
		pop	cx
		mov	ax, si
		add	ax, 0E4h
		push	ax
		mov	ax, si
		add	ax, 20h
		push	ax
		call	WorldObject_BuildOrientationMatrix_58C53
		add	sp, 4
		mov	byte ptr [si+0FEh], 0FFh
		jmp	loc_8934A

loc_87FDE:
		mov	di, si
		add	di, 0A0h
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
		mov	edx, dword_7976E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_D4], eax
		mov	eax, [bp+var_D0]
		mov	edx, dword_7976E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_D0], eax
		mov	eax, [bp+var_CC]
		mov	edx, dword_7976E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_CC], eax
		lea	ax, word ptr [bp+var_D4]
		push	ax
		mov	ax, si
		add	ax, 20h
		push	ax
		call	WorldObject_BuildOrientationMatrix_58C53
		add	sp, 4
		jmp	loc_8934A

loc_88090:
		cmp	word ptr [si+92h], 0
		jnz	short loc_8809A
		jmp	loc_88289

loc_8809A:
		cmp	dword ptr [si+0A0h], 0
		jle	short loc_880A7
		mov	ax, 1
		jmp	short loc_880A9

loc_880A7:
		xor	ax, ax

loc_880A9:
		or	al, al
		jnz	short loc_880B0
		jmp	loc_88289

loc_880B0:
		mov	di, si
		add	di, 0E4h
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
		lea	ax, word ptr [bp+var_14C]
		push	ax
		call	sub_5A629
		add	sp, 4
		mov	di, si
		add	di, 0B0h
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
		add	di, 0A0h
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
		add	di, 0B0h
		mov	eax, [di]
		mov	[si+14h], eax
		mov	eax, [di+4]
		mov	[si+18h], eax
		mov	eax, [di+8]
		mov	[si+1Ch], eax
		mov	eax, [bp+var_158]
		mov	edx, dword_7976E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_9E], eax
		mov	eax, [bp+var_9E]
		mov	[bp+var_A2], eax
		mov	eax, [bp+var_154]
		mov	edx, dword_7976E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_A6], eax
		mov	eax, [bp+var_A6]
		mov	[bp+var_AA], eax
		mov	eax, [bp+var_150]
		mov	edx, dword_7976E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_AE], eax
		mov	eax, [bp+var_AE]
		mov	[bp+var_B2], eax
		mov	eax, [bp+var_A2]
		mov	[bp+var_170], eax
		mov	eax, [bp+var_AA]
		mov	[bp+var_16C], eax
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
		jmp	loc_8934A

loc_88289:
		mov	di, [si+92h]
		add	di, 12h
		mov	ax, si
		add	ax, 0B0h
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
		mov	[bp+var_EC], eax
		mov	eax, [bp+var_DC]
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
		jmp	loc_8934A

loc_88301:
		cmp	dword ptr [si+0A0h], 0
		jl	short loc_8830E
		mov	ax, 1
		jmp	short loc_88310

loc_8830E:
		xor	ax, ax

loc_88310:
		or	al, al
		jnz	short loc_88317
		jmp	loc_884B9

loc_88317:
		mov	di, si
		add	di, 0B0h
		mov	ax, si
		add	ax, 14h
		mov	word ptr [bp+var_9E+2], ax
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
		mov	di, si
		add	di, 2Ch
		push	eax
		push	large [bp+var_148]
		push	large [bp+var_14C]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_A0], eax
		mov	[bp+var_A4], eax
		mov	eax, [di]
		mov	edx, [bp+var_A4]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_A8], eax
		mov	eax, [bp+var_A8]
		mov	[bp+var_AC], eax
		mov	eax, [di+4]
		mov	edx, [bp+var_A4]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_B0], eax
		mov	eax, [bp+var_B0]
		mov	[bp+var_B4], eax
		mov	eax, [di+8]
		mov	edx, [bp+var_A4]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_B8], eax
		mov	eax, [bp+var_B8]
		mov	[bp+var_BC], eax
		mov	eax, [bp+var_AC]
		mov	[bp+var_164], eax
		mov	eax, [bp+var_B4]
		mov	[bp+var_160], eax
		mov	eax, [bp+var_BC]
		mov	[bp+var_15C], eax
		mov	eax, [bp+var_164]
		mov	[si+2Ch], eax
		mov	eax, [bp+var_160]
		mov	[si+30h], eax
		mov	eax, [bp+var_15C]
		mov	[si+34h], eax
		mov	di, si
		add	di, 0A0h
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
		add	ax, 2Ch
		push	ax
		call	Vector_NormalizeInPlace_57715
		pop	cx
		mov	ax, si
		add	ax, 20h
		push	ax
		call	Matrix_OrthonormalizeKeepRow1_59429
		pop	cx
		jmp	loc_8934A

loc_884B9:
		mov	di, si
		add	di, 0B0h
		mov	ax, si
		add	ax, 14h
		mov	word ptr [bp+var_9E+2], ax
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
		mov	[bp+var_164], eax
		mov	eax, [bp+var_154]
		mov	[bp+var_160], eax
		mov	eax, [bp+var_150]
		mov	[bp+var_15C], eax
		mov	eax, [bp+var_164]
		mov	[bp+var_14C], eax
		mov	eax, [bp+var_160]
		mov	[bp+var_148], eax
		mov	eax, [bp+var_15C]
		mov	[bp+var_144], eax
		lea	ax, word ptr [bp+var_14C]
		push	ax
		call	Vector_NormalizeInPlace_57715
		pop	cx
		mov	eax, [bp+var_14C]
		mov	[si+2Ch], eax
		mov	eax, [bp+var_148]
		mov	[si+30h], eax
		mov	eax, [bp+var_144]
		mov	[si+34h], eax
		mov	di, si
		add	di, 2Ch
		mov	eax, [di]
		mov	[si+38h], eax
		mov	eax, [di+4]
		mov	[si+3Ch], eax
		mov	eax, [di+8]
		mov	[si+40h], eax
		mov	[bp+var_A0], 5A00h
		lea	ax, word ptr [bp+var_A0]
		push	ax
		mov	ax, si
		add	ax, 38h
		push	ax
		call	Missile_ComputeDirectionVector2D_5738D
		add	sp, 4
		mov	ax, si
		add	ax, 20h
		push	ax
		call	Matrix_OrthonormalizeKeepRow1_59429
		pop	cx
		mov	byte ptr [si+0FEh], 0FFh
		jmp	loc_8934A

loc_8859F:
		les	bx, [si+8Ah]
		mov	al, es:[bx]
		mov	ah, 0
		mov	[bp+var_9A], ax
		mov	cx, 1Eh
		mov	bx, offset word_89908

loc_885B2:
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_9A]
		jz	short loc_885C3
		add	bx, 2
		loop	short loc_885B2
		jmp	loc_89334

loc_885C3:
		jmp	word ptr cs:[bx+3Ch] ; switch jump

loc_885C7:
		mov	ax, [si+8Ch]
		mov	dx, [si+8Ah]
		inc	dx
		mov	word ptr [bp+var_9E+2], ax
		mov	word ptr [bp+var_9E], dx
		les	bx, word ptr [bp+var_9E]
		mov	eax, es:[bx]
		mov	[si+0A0h], eax
		add	word ptr [bp+var_9E], 4
		mov	eax, [bp+var_9E]
		mov	[si+8Ah], eax
		mov	byte ptr [si+0FEh], 1
		jmp	loc_89334

loc_885FC:
		mov	ax, [si+8Ch]
		mov	dx, [si+8Ah]
		inc	dx
		mov	word ptr [bp+var_9E+2], ax
		mov	word ptr [bp+var_9E], dx
		les	bx, word ptr [bp+var_9E]
		mov	eax, es:[bx]
		mov	[bp+var_A2], eax
		add	word ptr [bp+var_9E], 4
		shl	eax, 8
		mov	[bp+var_A6], eax
		mov	eax, [bp+var_A6]
		mov	[si+14h], eax
		les	bx, word ptr [bp+var_9E]
		mov	eax, es:[bx]
		mov	[bp+var_AA], eax
		add	word ptr [bp+var_9E], 4
		shl	eax, 8
		mov	[bp+var_AE], eax
		mov	eax, [bp+var_AE]
		mov	[si+18h], eax
		les	bx, word ptr [bp+var_9E]
		mov	eax, es:[bx]
		mov	[bp+var_B2], eax
		add	word ptr [bp+var_9E], 4
		shl	eax, 8
		mov	[bp+var_B6], eax
		mov	eax, [bp+var_B6]
		mov	[si+1Ch], eax
		mov	byte ptr [si+0FFh], 0
		mov	byte ptr [si+100h], 0
		mov	eax, [bp+var_9E]
		mov	[si+8Ah], eax
		jmp	loc_89334

loc_88690:
		mov	ax, [si+8Ch]
		mov	dx, [si+8Ah]
		inc	dx
		mov	word ptr [bp+var_9E+2], ax
		mov	word ptr [bp+var_9E], dx
		les	bx, word ptr [bp+var_9E]
		mov	eax, es:[bx]
		mov	[si+0A0h], eax
		add	word ptr [bp+var_9E], 4
		mov	eax, [bp+var_9E]
		mov	[bp+var_A2], eax
		les	bx, word ptr [bp+var_A2]
		mov	ax, es:[bx]
		mov	word ptr [bp+var_A4], ax
		add	word ptr [bp+var_A2], 2
		movsx	eax, word ptr [bp+var_A4]
		shl	eax, 8
		mov	[bp+var_A8], eax
		mov	eax, [bp+var_A8]
		mov	[si+0E4h], eax
		les	bx, word ptr [bp+var_A2]
		mov	ax, es:[bx]
		mov	word ptr [bp+var_AA], ax
		add	word ptr [bp+var_A2], 2
		movsx	eax, word ptr [bp+var_AA]
		shl	eax, 8
		mov	[bp+var_AE], eax
		mov	eax, [bp+var_AE]
		mov	[si+0E8h], eax
		les	bx, word ptr [bp+var_A2]
		mov	ax, es:[bx]
		mov	word ptr [bp+var_B0], ax
		add	word ptr [bp+var_A2], 2
		movsx	eax, word ptr [bp+var_B0]
		shl	eax, 8
		mov	[bp+var_B4], eax
		mov	eax, [bp+var_B4]
		mov	[si+0ECh], eax
		mov	eax, [bp+var_A2]
		mov	[si+8Ah], eax
		mov	byte ptr [si+0FEh], 4
		jmp	loc_89334

loc_8874A:
		mov	ax, [si+8Ch]
		mov	dx, [si+8Ah]
		inc	dx
		mov	word ptr [bp+var_9E+2], ax
		mov	word ptr [bp+var_9E], dx
		les	bx, word ptr [bp+var_9E]
		mov	ax, es:[bx]
		mov	word ptr [bp+var_A0], ax
		add	word ptr [bp+var_9E], 2
		movsx	eax, word ptr [bp+var_A0]
		shl	eax, 8
		mov	[bp+var_A4], eax
		mov	eax, [bp+var_A4]
		mov	[si+0D8h], eax
		les	bx, word ptr [bp+var_9E]
		mov	ax, es:[bx]
		mov	word ptr [bp+var_A6], ax
		add	word ptr [bp+var_9E], 2
		movsx	eax, word ptr [bp+var_A6]
		shl	eax, 8
		mov	[bp+var_AA], eax
		mov	eax, [bp+var_AA]
		mov	[si+0DCh], eax
		les	bx, word ptr [bp+var_9E]
		mov	ax, es:[bx]
		mov	word ptr [bp+var_AC], ax
		add	word ptr [bp+var_9E], 2
		movsx	eax, word ptr [bp+var_AC]
		shl	eax, 8
		mov	[bp+var_B0], eax
		mov	eax, [bp+var_B0]
		mov	[si+0E0h], eax
		mov	eax, [bp+var_9E]
		mov	[si+8Ah], eax
		jmp	loc_89334

loc_887E3:
		mov	ax, [si+8Ch]
		mov	dx, [si+8Ah]
		inc	dx
		mov	word ptr [bp+var_9E+2], ax
		mov	word ptr [bp+var_9E], dx
		les	bx, word ptr [bp+var_9E]
		mov	eax, es:[bx]
		mov	[si+0C0h], eax
		add	word ptr [bp+var_9E], 4
		les	bx, word ptr [bp+var_9E]
		mov	eax, es:[bx]
		mov	[si+0C4h], eax
		add	word ptr [bp+var_9E], 4
		les	bx, word ptr [bp+var_9E]
		mov	eax, es:[bx]
		mov	[si+0C8h], eax
		add	word ptr [bp+var_9E], 4
		mov	byte ptr [si+0FFh], 0
		mov	byte ptr [si+100h], 0
		mov	eax, [bp+var_9E]
		mov	[si+8Ah], eax
		jmp	loc_89334

loc_88841:
		mov	ax, [si+8Ch]
		mov	dx, [si+8Ah]
		inc	dx
		mov	word ptr [bp+var_A4], ax
		mov	word ptr [bp+var_A6], dx
		push	8
		push	ax
		push	dx
		push	ss
		lea	ax, word ptr [bp+var_A2]
		push	ax
		call	sub_39E1
		add	sp, 0Ah
		push	ss
		lea	ax, word ptr [bp+var_A2]
		push	ax
		push	67ADh
		call	Container_Op_1E66D
		add	sp, 6
		mov	word ptr [bp+var_A8], ax
		push	ax
		mov	ax, si
		add	ax, 92h
		push	ax
		call	SetReference16
		add	sp, 4
		add	word ptr [si+8Ah], 9
		jmp	loc_89334

loc_88890:
		inc	word ptr [si+8Ah]
		mov	byte ptr [si+0FFh], 1
		mov	byte ptr [si+100h], 0
		jmp	loc_89334

loc_888A1:
		les	bx, [si+8Ah]
		mov	eax, es:[bx+1]
		mov	[si+0A0h], eax
		add	word ptr [si+8Ah], 5
		mov	byte ptr [si+0FFh], 0
		mov	byte ptr [si+100h], 0
		mov	byte ptr [si+0FEh], 8
		jmp	loc_89334

loc_888C6:
		les	bx, [si+8Ah]
		mov	eax, es:[bx+1]
		mov	[si+0BCh], eax
		add	word ptr [si+8Ah], 5
		cmp	word ptr [si+92h], 0
		jnz	short loc_888E3
		jmp	loc_89334

loc_888E3:
		mov	byte ptr [si+0FFh], 1
		mov	byte ptr [si+100h], 1
		jmp	loc_89334

loc_888F0:
		mov	ax, [si+8Ch]
		mov	dx, [si+8Ah]
		inc	dx
		mov	word ptr [bp+var_9E+2], ax
		mov	word ptr [bp+var_9E], dx
		les	bx, word ptr [bp+var_9E]
		mov	eax, es:[bx]
		mov	[bp+var_A2], eax
		add	word ptr [bp+var_9E], 4
		shl	eax, 8
		mov	[bp+var_A6], eax
		mov	eax, [bp+var_A6]
		mov	[si+0B0h], eax
		les	bx, word ptr [bp+var_9E]
		mov	eax, es:[bx]
		mov	[bp+var_AA], eax
		add	word ptr [bp+var_9E], 4
		shl	eax, 8
		mov	[bp+var_AE], eax
		mov	eax, [bp+var_AE]
		mov	[si+0B4h], eax
		les	bx, word ptr [bp+var_9E]
		mov	eax, es:[bx]
		mov	[bp+var_B2], eax
		add	word ptr [bp+var_9E], 4
		shl	eax, 8
		mov	[bp+var_B6], eax
		mov	eax, [bp+var_B6]
		mov	[si+0B8h], eax
		mov	eax, [bp+var_9E]
		mov	[si+8Ah], eax
		jmp	loc_89334

loc_8897D:
		les	bx, [si+8Ah]
		mov	eax, es:[bx+1]
		mov	[si+0A0h], eax
		add	word ptr [si+8Ah], 5
		mov	byte ptr [si+0FFh], 0
		mov	byte ptr [si+100h], 0
		mov	byte ptr [si+0FEh], 0Bh
		jmp	loc_89334

loc_889A2:
		mov	ax, [si+8Ch]
		mov	dx, [si+8Ah]
		inc	dx
		mov	word ptr [bp+var_9E+2], ax
		mov	word ptr [bp+var_9E], dx
		les	bx, word ptr [bp+var_9E]
		mov	eax, es:[bx]
		mov	[si+0BCh], eax
		add	word ptr [bp+var_9E], 4
		mov	byte ptr [si+0FFh], 0
		mov	byte ptr [si+100h], 1
		mov	eax, [bp+var_9E]
		mov	[si+8Ah], eax
		jmp	loc_89334

loc_889DC:
		mov	ax, [si+8Ch]
		mov	dx, [si+8Ah]
		inc	dx
		mov	word ptr [bp+var_9E+2], ax
		mov	word ptr [bp+var_9E], dx
		les	bx, word ptr [bp+var_9E]
		mov	eax, es:[bx]
		mov	[si+0A4h], eax
		add	word ptr [bp+var_9E], 4
		les	bx, word ptr [bp+var_9E]
		mov	eax, es:[bx]
		mov	[si+0A0h], eax
		add	word ptr [bp+var_9E], 4
		les	bx, word ptr [bp+var_9E]
		mov	eax, es:[bx]
		mov	[si+0A8h], eax
		add	word ptr [bp+var_9E], 4
		mov	eax, [bp+var_9E]
		mov	[bp+var_A2], eax
		les	bx, word ptr [bp+var_A2]
		inc	word ptr [bp+var_A2]
		mov	al, es:[bx]
		mov	byte ptr [bp+var_A4+1], al
		mov	ah, 0
		or	ax, ax
		jnz	short loc_88A88
		mov	di, si
		add	di, 0A0h
		mov	eax, [si+0A4h]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_A8], eax
		mov	eax, [bp+var_A8]
		mov	[bp+var_AC], eax
		mov	[si+0A8h], eax
		mov	[bp+var_B0], 0
		mov	eax, [bp+var_B0]
		mov	[si+0ACh], eax
		jmp	loc_88B15

loc_88A88:
		mov	di, si
		add	di, 0A0h
		mov	eax, [si+0A8h]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_B4], eax
		mov	eax, [bp+var_B4]
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
		add	di, 0A0h
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

loc_88B15:
		mov	eax, [bp+var_A2]
		mov	[si+8Ah], eax
		jmp	loc_89334

loc_88B22:
		mov	ax, [si+8Ch]
		mov	dx, [si+8Ah]
		inc	dx
		mov	word ptr [bp+var_9E+2], ax
		mov	word ptr [bp+var_9E], dx
		les	bx, word ptr [bp+var_9E]
		mov	eax, es:[bx]
		mov	[bp+var_A2], eax
		add	word ptr [bp+var_9E], 4
		shl	eax, 8
		mov	[bp+var_A6], eax
		mov	eax, [bp+var_A6]
		mov	[bp+var_14C], eax
		les	bx, word ptr [bp+var_9E]
		mov	eax, es:[bx]
		mov	[bp+var_AA], eax
		add	word ptr [bp+var_9E], 4
		shl	eax, 8
		mov	[bp+var_AE], eax
		mov	eax, [bp+var_AE]
		mov	[bp+var_148], eax
		les	bx, word ptr [bp+var_9E]
		mov	eax, es:[bx]
		mov	[bp+var_B2], eax
		add	word ptr [bp+var_9E], 4
		shl	eax, 8
		mov	[bp+var_B6], eax
		mov	eax, [bp+var_B6]
		mov	[bp+var_144], eax
		cmp	word ptr [si+92h], 0
		jnz	short loc_88BAC
		jmp	loc_88C3B

loc_88BAC:
		push	word ptr [si+92h]
		mov	bx, [si+92h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		lea	ax, word ptr [bp+var_14C]
		push	ax
		call	sub_5A629
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
		mov	[si+14h], eax
		mov	eax, [bp+var_160]
		mov	[si+18h], eax
		mov	eax, [bp+var_15C]
		mov	[si+1Ch], eax
		mov	byte ptr [si+0FFh], 0
		mov	byte ptr [si+100h], 0

loc_88C3B:
		mov	eax, [bp+var_9E]
		mov	[si+8Ah], eax
		jmp	loc_89334

loc_88C48:
		mov	ax, [si+8Ch]
		mov	dx, [si+8Ah]
		inc	dx
		mov	word ptr [bp+var_9E+2], ax
		mov	word ptr [bp+var_9E], dx
		les	bx, word ptr [bp+var_9E]
		mov	ax, es:[bx]
		mov	[si+0F0h], ax
		add	word ptr [bp+var_9E], 2
		les	bx, word ptr [bp+var_9E]
		mov	ax, es:[bx]
		mov	word ptr [bp+var_A0], ax
		add	word ptr [bp+var_9E], 2
		movsx	eax, word ptr [bp+var_A0]
		shl	eax, 8
		mov	[bp+var_A4], eax
		mov	eax, [bp+var_A4]
		mov	[si+0F2h], eax
		mov	eax, [bp+var_9E]
		mov	[si+8Ah], eax
		mov	ax, si
		add	ax, 20h
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_A8]
		push	ax
		call	sub_59B4A
		add	sp, 6
		mov	eax, [bp+var_A8]
		mov	[si+0F6h], eax
		mov	ax, si
		add	ax, 20h
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_AC]
		push	ax
		call	sub_59A03
		add	sp, 6
		mov	eax, [bp+var_AC]
		mov	[si+0FAh], eax
		jmp	loc_89334

loc_88CDB:
		cmp	word ptr [si+92h], 0
		jz	short loc_88CFF
		push	word ptr [si+92h]
		mov	bx, [si+92h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		mov	ax, si
		add	ax, 20h
		push	ax
		call	AI_ComputeGeometryHelper_58BF2
		add	sp, 4

loc_88CFF:
		inc	word ptr [si+8Ah]
		jmp	loc_89334

loc_88D06:
		mov	ax, si
		add	ax, 20h
		push	ax
		call	Matrix_BuildFromAngle_58B3B
		pop	cx

loc_88D12:
		mov	ax, [si+8Ch]
		mov	dx, [si+8Ah]
		inc	dx
		mov	word ptr [bp+var_9E+2], ax
		mov	word ptr [bp+var_9E], dx
		les	bx, word ptr [bp+var_9E]
		add	word ptr [bp+var_9E], 2
		mov	ax, es:[bx]
		mov	word ptr [bp+var_A0], ax
		les	bx, word ptr [bp+var_9E]
		add	word ptr [bp+var_9E], 2
		mov	ax, es:[bx]
		mov	word ptr [bp+var_A2], ax
		les	bx, word ptr [bp+var_9E]
		add	word ptr [bp+var_9E], 2
		mov	ax, es:[bx]
		mov	word ptr [bp+var_A4], ax
		mov	word ptr [bp+var_A6], ax
		movsx	eax, word ptr [bp+var_A6]
		shl	eax, 8
		mov	[bp+var_AA], eax
		lea	ax, word ptr [bp+var_AA]
		push	ax
		mov	ax, si
		add	ax, 20h
		push	ax
		call	Matrix_BuildAxisZ_59085
		add	sp, 4
		mov	ax, word ptr [bp+var_A0]
		mov	word ptr [bp+var_AC], ax
		movsx	eax, word ptr [bp+var_AC]
		shl	eax, 8
		mov	[bp+var_B0], eax
		lea	ax, word ptr [bp+var_B0]
		push	ax
		mov	ax, si
		add	ax, 20h
		push	ax
		call	Matrix_BuildAxisX_58C8C
		add	sp, 4
		mov	ax, word ptr [bp+var_A2]
		mov	word ptr [bp+var_B2], ax
		movsx	eax, word ptr [bp+var_B2]
		shl	eax, 8
		mov	[bp+var_B6], eax
		lea	ax, word ptr [bp+var_B6]
		push	ax
		mov	ax, si
		add	ax, 20h
		push	ax
		call	Matrix_BuildAxisY_58E8E
		add	sp, 4
		mov	ax, si
		add	ax, 20h
		push	ax
		call	Matrix_OrthonormalizeKeepRow1_59429
		pop	cx
		mov	eax, [bp+var_9E]
		mov	[si+8Ah], eax
		jmp	loc_89334

loc_88DE6:
		mov	ax, [si+8Ch]
		mov	dx, [si+8Ah]
		inc	dx
		mov	word ptr [bp+var_9E+2], ax
		mov	word ptr [bp+var_9E], dx
		les	bx, word ptr [bp+var_9E]
		mov	eax, es:[bx]
		mov	[si+94h], eax
		add	word ptr [bp+var_9E], 4
		les	bx, word ptr [bp+var_9E]
		mov	eax, es:[bx]
		mov	[si+98h], eax
		add	word ptr [bp+var_9E], 4
		les	bx, word ptr [bp+var_9E]
		mov	eax, es:[bx]
		mov	[si+9Ch], eax
		add	word ptr [bp+var_9E], 4
		mov	eax, [bp+var_9E]
		mov	[si+8Ah], eax
		jmp	loc_89334

loc_88E3A:
		mov	ax, [si+8Ch]
		mov	dx, [si+8Ah]
		inc	dx
		mov	word ptr [bp+var_9E+2], ax
		mov	word ptr [bp+var_9E], dx
		les	bx, word ptr [bp+var_9E]
		mov	eax, es:[bx]
		mov	[bp+var_A2], eax
		add	word ptr [bp+var_9E], 4
		mov	eax, [bp+var_9E]
		mov	[si+8Ah], eax
		mov	di, si
		add	di, 2Ch
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
		mov	[bp+var_B6], eax
		mov	eax, [bp+var_B6]
		mov	[bp+var_BA], eax
		mov	eax, [bp+var_AA]
		mov	[bp+var_14C], eax
		mov	eax, [bp+var_B2]
		mov	[bp+var_148], eax
		mov	eax, [bp+var_BA]
		mov	[bp+var_144], eax
		mov	eax, [bp+var_14C]
		mov	[si+0C0h], eax
		mov	eax, [bp+var_148]
		mov	[si+0C4h], eax
		mov	eax, [bp+var_144]
		mov	[si+0C8h], eax
		jmp	loc_89334

loc_88F0A:
		mov	ax, [si+8Ch]
		mov	dx, [si+8Ah]
		inc	dx
		mov	word ptr [bp+var_9E+2], ax
		mov	word ptr [bp+var_9E], dx
		les	bx, word ptr [bp+var_9E]
		mov	eax, es:[bx]
		mov	[si+0CCh], eax
		add	word ptr [bp+var_9E], 4
		les	bx, word ptr [bp+var_9E]
		mov	eax, es:[bx]
		mov	[si+0D0h], eax
		add	word ptr [bp+var_9E], 4
		les	bx, word ptr [bp+var_9E]
		mov	eax, es:[bx]
		mov	[si+0D4h], eax
		add	word ptr [bp+var_9E], 4
		mov	eax, [bp+var_9E]
		mov	[si+8Ah], eax
		jmp	loc_89334

loc_88F5E:
		mov	ax, [si+8Ch]
		mov	dx, [si+8Ah]
		inc	dx
		mov	word ptr [bp+var_9E+2], ax
		mov	word ptr [bp+var_9E], dx
		les	bx, word ptr [bp+var_9E]
		mov	eax, es:[bx]
		mov	[bp+var_A2], eax
		add	word ptr [bp+var_9E], 4
		mov	eax, [bp+var_9E]
		mov	[si+8Ah], eax
		mov	di, si
		add	di, 2Ch
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
		mov	[bp+var_B6], eax
		mov	eax, [bp+var_B6]
		mov	[bp+var_BA], eax
		mov	eax, [bp+var_AA]
		mov	[bp+var_14C], eax
		mov	eax, [bp+var_B2]
		mov	[bp+var_148], eax
		mov	eax, [bp+var_BA]
		mov	[bp+var_144], eax
		mov	eax, [bp+var_14C]
		mov	[si+0CCh], eax
		mov	eax, [bp+var_148]
		mov	[si+0D0h], eax
		mov	eax, [bp+var_144]
		mov	[si+0D4h], eax
		jmp	loc_89334

loc_8902E:
		mov	ax, [si+8Ch]
		mov	dx, [si+8Ah]
		inc	dx
		mov	word ptr [bp+var_9E+2], ax
		mov	word ptr [bp+var_9E], dx
		les	bx, word ptr [bp+var_9E]
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
		add	ax, 0C0h
		mov	eax, [si+0C4h]
		mov	edx, eax
		mov	ecx, [bp+var_A2]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[si+0C4h], eax
		mov	ax, si
		add	ax, 0C4h
		mov	eax, [si+0C8h]
		mov	edx, eax
		mov	ecx, [bp+var_A2]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[si+0C8h], eax
		mov	ax, si
		add	ax, 0C8h
		jmp	loc_89334

loc_890C4:
		cmp	word ptr [si+92h], 0
		jz	short loc_890FF
		push	word ptr [si+92h]
		push	ss
		lea	ax, word ptr [bp+var_F8]
		push	ax
		mov	bx, [si+92h]
		mov	bx, [bx]
		call	dword ptr [bx+50h]
		add	sp, 6
		mov	eax, [bp+var_F8]
		mov	[si+0C0h], eax
		mov	eax, [bp+var_F4]
		mov	[si+0C4h], eax
		mov	eax, [bp+var_F0]
		mov	[si+0C8h], eax

loc_890FF:
		inc	word ptr [si+8Ah]
		jmp	loc_89334

loc_89106:
		cmp	word ptr [si+92h], 0
		jz	short loc_8912A
		push	word ptr [si+92h]
		mov	bx, [si+92h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		mov	ax, si
		add	ax, 0C0h
		push	ax
		call	sub_5A629
		add	sp, 4

loc_8912A:
		inc	word ptr [si+8Ah]
		jmp	loc_89334

loc_89131:
		cmp	word ptr [si+92h], 0
		jz	short loc_89155
		push	word ptr [si+92h]
		mov	bx, [si+92h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		mov	ax, si
		add	ax, 0CCh
		push	ax
		call	sub_5A629
		add	sp, 4

loc_89155:
		inc	word ptr [si+8Ah]
		jmp	loc_89334

loc_8915C:
		mov	byte_79787, 0
		mov	byte ptr [si+101h], 1
		inc	word ptr [si+8Ah]
		jmp	loc_89334

loc_8916D:
		cmp	word ptr [si+92h], 0
		jz	short loc_891F2
		mov	di, [si+92h]
		add	di, 12h
		mov	ax, si
		add	ax, 14h
		mov	word ptr [bp+var_9E+2], ax
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
		lea	ax, word ptr [bp+var_14C]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_A0]
		push	ax
		call	Math_VectorLength3D_Scaled_56D92
		add	sp, 6
		mov	eax, [bp+var_A0]
		mov	[si+0BCh], eax
		mov	byte ptr [si+100h], 1
		mov	byte ptr [si+0FFh], 1

loc_891F2:
		inc	word ptr [si+8Ah]
		jmp	loc_89334

loc_891F9:
		mov	ax, [si+8Ch]
		mov	dx, [si+8Ah]
		inc	dx
		mov	word ptr [bp+var_9E+2], ax
		mov	word ptr [bp+var_9E], dx
		les	bx, word ptr [bp+var_9E]
		mov	eax, es:[bx]
		mov	[si+0A0h], eax
		add	word ptr [bp+var_9E], 4
		les	bx, word ptr [bp+var_9E]
		mov	eax, es:[bx]
		mov	[si+0E4h], eax
		add	word ptr [bp+var_9E], 4
		les	bx, word ptr [bp+var_9E]
		mov	eax, es:[bx]
		mov	[si+0E8h], eax
		add	word ptr [bp+var_9E], 4
		les	bx, word ptr [bp+var_9E]
		mov	eax, es:[bx]
		mov	[si+0ECh], eax
		add	word ptr [bp+var_9E], 4
		mov	eax, [bp+var_9E]
		mov	[si+8Ah], eax
		cmp	word ptr [si+92h], 0
		jnz	short loc_89266
		jmp	loc_89334

loc_89266:
		mov	di, si
		add	di, 14h
		mov	ax, [si+92h]
		add	ax, 12h
		mov	word ptr [bp+var_A0], ax
		mov	eax, [di]
		mov	bx, word ptr [bp+var_A0]
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
		jmp	short loc_89334

loc_892EC:
		mov	ax, [si+8Ch]
		mov	dx, [si+8Ah]
		inc	dx
		mov	word ptr [bp+var_A4], ax
		mov	word ptr [bp+var_A6], dx
		push	8
		push	ax
		push	dx
		push	ss
		lea	ax, word ptr [bp+var_A2]
		push	ax
		call	sub_39E1
		add	sp, 0Ah
		add	word ptr [si+8Ah], 9
		push	ss
		lea	ax, word ptr [bp+var_A2]
		push	ax
		push	67B7h
		call	sub_73791
		add	sp, 6
		mov	bx, ax
		or	bx, bx
		jz	short loc_8932F
		mov	word_7CEF6, bx

loc_8932F:
		mov	al, 0
		jmp	loc_89904

loc_89334:
		mov	al, byte_7CAC3
		mov	ah, 0
		cmp	ax, 1
		jnz	short loc_8934A
		cmp	byte ptr [si+101h], 0
		jz	short loc_8934A
		mov	byte ptr [si+0FEh], 0FFh

loc_8934A:
		cmp	byte ptr [si+0FEh], 0FFh
		jnz	short loc_89354
		jmp	loc_8859F

loc_89354:
		mov	eax, [si+0C0h]
		or	eax, [si+0C4h]
		or	eax, [si+0C8h]
		jnz	short loc_8936A
		mov	ax, 1
		jmp	short loc_8936C

loc_8936A:
		xor	ax, ax

loc_8936C:
		mov	ah, 0
		or	ax, ax
		jz	short loc_89375
		jmp	loc_89407

loc_89375:
		mov	di, si
		add	di, 0C0h
		mov	eax, [di]
		mov	edx, dword_79774
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_2E], eax
		mov	eax, [bp+var_2E]
		mov	[bp+var_32], eax
		mov	eax, [di+4]
		mov	edx, dword_79774
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_36], eax
		mov	eax, [bp+var_36]
		mov	[bp+var_3A], eax
		mov	eax, [di+8]
		mov	edx, dword_79774
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

loc_89407:
		mov	eax, [si+0CCh]
		or	eax, [si+0D0h]
		or	eax, [si+0D4h]
		jnz	short loc_8941D
		mov	ax, 1
		jmp	short loc_8941F

loc_8941D:
		xor	ax, ax

loc_8941F:
		mov	ah, 0
		or	ax, ax
		jz	short loc_89428
		jmp	loc_894BD

loc_89428:
		mov	di, si
		add	di, 0CCh
		mov	eax, [di]
		mov	edx, dword_7976E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_46], eax
		mov	eax, [bp+var_46]
		mov	[bp+var_4A], eax
		mov	eax, [di+4]
		mov	edx, dword_7976E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4E], eax
		mov	eax, [bp+var_4E]
		mov	[bp+var_52], eax
		mov	eax, [di+8]
		mov	edx, dword_7976E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_56], eax
		mov	eax, [bp+var_56]
		mov	[bp+var_5A], eax
		mov	eax, [bp+var_4A]
		mov	[bp+var_110], eax
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

loc_894BD:
		mov	eax, [si+0D8h]
		or	eax, [si+0DCh]
		or	eax, [si+0E0h]
		jnz	short loc_894D3
		mov	ax, 1
		jmp	short loc_894D5

loc_894D3:
		xor	ax, ax

loc_894D5:
		mov	ah, 0
		or	ax, ax
		jz	short loc_894DE
		jmp	loc_89568

loc_894DE:
		mov	di, si
		add	di, 0D8h
		mov	eax, [di]
		mov	edx, dword_7976E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_5E], eax
		mov	eax, [bp+var_5E]
		mov	[bp+var_62], eax
		mov	eax, [di+4]
		mov	edx, dword_7976E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_66], eax
		mov	eax, [bp+var_66]
		mov	[bp+var_6A], eax
		mov	eax, [di+8]
		mov	edx, dword_7976E
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
		lea	ax, word ptr [bp+var_11C]
		push	ax
		mov	ax, si
		add	ax, 20h
		push	ax
		call	WorldObject_BuildOrientationMatrix_58C53
		add	sp, 4

loc_89568:
		cmp	byte ptr [si+100h], 0
		jnz	short loc_89572
		jmp	loc_8985E

loc_89572:
		cmp	byte ptr [si+0FFh], 0
		jnz	short loc_8957C
		jmp	loc_8962E

loc_8957C:
		cmp	word ptr [si+92h], 0
		jnz	short loc_89586
		jmp	loc_8962E

loc_89586:
		mov	di, si
		add	di, 94h
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
		lea	ax, word ptr [bp+var_14C]
		push	ax
		call	sub_5A629
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
		mov	[si+0B0h], eax
		mov	eax, [bp+var_160]
		mov	[si+0B4h], eax
		mov	eax, [bp+var_15C]
		mov	[si+0B8h], eax

loc_8962E:
		cmp	dword ptr [si+0A4h], 0
		jle	short loc_8963B
		mov	ax, 1
		jmp	short loc_8963D

loc_8963B:
		xor	ax, ax

loc_8963D:
		or	al, al
		jz	short loc_896A2
		cmp	dword ptr [si+0A0h], 0
		jle	short loc_8964E
		mov	ax, 1
		jmp	short loc_89650

loc_8964E:
		xor	ax, ax

loc_89650:
		or	al, al
		jz	short loc_896A2
		mov	eax, [si+0ACh]
		mov	edx, dword_7976E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_76], eax
		mov	eax, [bp+var_76]
		mov	[bp+var_7A], eax
		add	[si+0A8h], eax
		mov	eax, [si+0A8h]
		mov	edx, dword_79774
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_A2], eax
		mov	eax, [bp+var_A2]
		mov	[bp+var_9E], eax
		sub	[si+0A4h], eax
		sub	[si+0BCh], eax

loc_896A2:
		cmp	dword ptr [si+0F2h], 0
		jle	short loc_896AF
		mov	ax, 1
		jmp	short loc_896B1

loc_896AF:
		xor	ax, ax

loc_896B1:
		or	al, al
		jnz	short loc_896B8
		jmp	loc_8975B

loc_896B8:
		mov	ax, [si+0F0h]
		mov	word ptr [bp+var_A0], ax
		movsx	eax, word ptr [bp+var_A0]
		shl	eax, 8
		mov	[bp+var_A4], eax
		mov	eax, [bp+var_A4]
		mov	edx, dword_7976E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_A8], eax
		mov	eax, [bp+var_A8]
		mov	[bp+var_9E], eax
		mov	eax, [bp+var_9E]
		or	eax, eax
		jge	short loc_896FD
		neg	eax

loc_896FD:
		mov	[bp+var_AC], eax
		mov	eax, [bp+var_AC]
		mov	[bp+var_B0], eax
		sub	[si+0F2h], eax
		mov	eax, [bp+var_9E]
		add	[si+0F6h], eax
		mov	ax, si
		add	ax, 20h
		push	ax
		call	Matrix_BuildFromAngle_58B3B
		pop	cx
		mov	ax, si
		add	ax, 0F6h
		push	ax
		mov	ax, si
		add	ax, 20h
		push	ax
		call	Matrix_BuildAxisZ_59085
		add	sp, 4
		mov	ax, si
		add	ax, 0FAh
		push	ax
		mov	ax, si
		add	ax, 20h
		push	ax
		call	Matrix_BuildAxisX_58C8C
		add	sp, 4
		mov	ax, si
		add	ax, 20h
		push	ax
		call	Matrix_OrthonormalizeKeepRow1_59429
		pop	cx

loc_8975B:
		mov	di, si
		add	di, 0B0h
		mov	ax, si
		add	ax, 0BCh
		mov	[bp+var_7C], ax
		mov	ax, si
		add	ax, 2Ch
		mov	[bp+var_7E], ax
		mov	bx, [bp+var_7E]
		mov	eax, [bx]
		mov	bx, [bp+var_7C]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_82], eax
		mov	eax, [bp+var_82]
		mov	[bp+var_86], eax
		mov	bx, [bp+var_7E]
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
		jmp	short loc_898D6

loc_8985E:
		cmp	byte ptr [si+0FFh], 0
		jz	short loc_898D6
		cmp	word ptr [si+92h], 0
		jz	short loc_898D6
		mov	di, [si+92h]
		add	di, 12h
		mov	ax, si
		add	ax, 14h
		mov	word ptr [bp+var_9E+2], ax
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
		lea	ax, word ptr [bp+var_14C]
		push	ax
		mov	ax, si
		add	ax, 20h
		push	ax
		call	sub_59B77
		add	sp, 4

loc_898D6:
		cmp	dword ptr [si+0A0h], 0
		jle	short loc_898E3
		mov	ax, 1
		jmp	short loc_898E5

loc_898E3:
		xor	ax, ax

loc_898E5:
		or	al, al
		jz	short loc_898F9
		cmp	byte ptr [si+0FEh], 1
		jz	short loc_898F9
		mov	eax, dword_7976E
		sub	[si+0A0h], eax

loc_898F9:
		mov	eax, dword_7976E
		add	[si+8Eh], eax
		mov	al, 1

loc_89904:
		pop	di
		pop	si
		leave
		retf
sub_87E70		endp

; START OF FUNCTION CHUNK FOR sub_87E70
word_89908	dw 1
		dw 2
		dw 3
		dw 4
		dw 5
		dw 6
		dw 7
		dw 8
		dw 9
		dw 0Ah
		dw 0Bh
		dw 0Ch
		dw 0Dh
		dw 0Eh
		dw 0Fh
		dw 10h
		dw 11h
		dw 12h
		dw 13h
		dw 14h
		dw 15h
		dw 16h
		dw 17h
		dw 18h
		dw 19h
		dw 1Ah
		dw 1Bh
		dw 1Ch
		dw 1Dh
		dw 0FEh
off_89944	dw offset loc_885C7
		dw offset loc_885FC
		dw offset loc_88D06
		dw offset loc_88690
		dw offset loc_8874A
		dw offset loc_887E3
		dw offset loc_88841
		dw offset loc_888A1
		dw offset loc_888C6
		dw offset loc_888F0
		dw offset loc_8897D
		dw offset loc_889A2
		dw offset loc_889DC
		dw offset loc_88B22
		dw offset loc_88C48
		dw offset loc_88CDB
		dw offset loc_88D12
		dw offset loc_88DE6
		dw offset loc_88890
		dw offset loc_88E3A
		dw offset loc_88F0A
		dw offset loc_88F5E
		dw offset loc_8902E
		dw offset loc_890C4
		dw offset loc_89106
		dw offset loc_89131
		dw offset loc_8915C
		dw offset loc_8916D
		dw offset loc_891F9
		dw offset loc_892EC
word_89980	dw 1
		dw 4
		dw 0Bh
		dw 1Dh
off_89988	dw offset loc_87EB7
		dw offset loc_87ED9
		dw offset loc_88301
		dw offset loc_88090
; END OF FUNCTION CHUNK FOR sub_87E70

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_89990		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_89990		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à AI_ManeuverCleanup_79CFF (sub_79CFF de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine
; WeakRef_InvalidateIfSet, Memory_TypedFree_5C7B6 — nettoyage de référence faible en fin de
; manœuvre. || (2026-08-30) = AI_ManeuverCleanup : vtable[0x0C] de l'objet manoeuvre/caméra
; (off_6D510). WeakRef_InvalidateIfSet(obj+0x92) (libère l'entité liée) ; si obj+0x85 &&
; obj+0x80 -> Memory_TypedFree(obj+0x80) (buffer script) ; reset obj+0x80/85/86=0 ; stub 6BC35
; ; si arg&1 -> CRT_FreeNear(obj). Voir DATA_MODEL.md §6.6b.
; ==============================================================================================
AI_ManeuverCleanup_89998		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_89A0F
		mov	ax, si
		add	ax, 92h
		push	ax
		call	WeakRef_InvalidateIfSet
		pop	cx
		cmp	byte ptr [si+85h], 0
		jz	short loc_899DC
		cmp	dword ptr [si+80h], 0
		jz	short loc_899DC
		push	0
		mov	al, [si+84h]
		push	ax
		mov	ax, si
		add	ax, 80h
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_899DC

loc_899DC:
		mov	dword ptr [si+80h], 0
		mov	byte ptr [si+85h], 0
		mov	dword ptr [si+86h], 0
		push	0
		push	si
		call	sub_73E05
		add	sp, 4
		test	di, 1
		jz	short loc_89A0D
		push	si
		call	sub_3B2
		pop	cx
		jmp	short loc_89A0F

loc_89A0D:
		jmp	short loc_89A0F

loc_89A0F:
		pop	di
		pop	si
		pop	bp
		retf
AI_ManeuverCleanup_89998		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; AI_ManeuverHelper2_79D7A (sub_79D7A de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, aucun appel externe visible (13 lignes).
; ==============================================================================================
AI_ManeuverHelper2_89A13		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+92h]
		pop	si
		pop	bp
		retf
AI_ManeuverHelper2_89A13		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_89A21		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		xor	ax, ax
		pop	bp
		retf
sub_89A21		endp
ovr239		ends

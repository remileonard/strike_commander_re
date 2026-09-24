seg065		segment	byte public 'CODE' use16
		assume cs:seg065
		;org 0Bh
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

loc_2DE0B:				; DATA XREF: seg339:0450o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		cmp	word_722E6, 0
		jz	short loc_2DE4E
		cmp	byte_6E4B8, 0
		jnz	short loc_2DE4E

loc_2DE21:
		cmp	byte_6E4B4, 0

loc_2DE26:
		jnz	short loc_2DE4E
		mov	di, word_6E4B2
		cmp	word ptr [di+10h], 0
		jz	short loc_2DE4E
		mov	ax, di
		add	ax, 0F5h ; '�'
		push	ax
		mov	bx, [di+0F5h]
		call	dword ptr [bx+8]
		pop	cx
		mov	ax, di
		add	ax, 0F5h ; '�'
		push	ax
		mov	bx, [di+0F5h]
		call	dword ptr [bx+0Ch]
		pop	cx

loc_2DE4E:				; CODE XREF: seg065:0018j seg065:001Fj ...
		mov	ax, si
		add	ax, 2
		push	ax
		push	ds
		push	offset word_72A94
		call	Text_TypewriterFrame

loc_2DE5D:
		add	sp, 6
		push	5130h

loc_2DE63:
		call	Resource_AccessUnified

loc_2DE68:
		pop	cx
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,74L — copie intégralement une structure caméra/objet 3D (position 20 octets, orientation
; normalisée 12+12 octets via sub_56E29, 8 octets additionnels via memcpy sub_3FD) : copie
; complète d'un état de caméra (position+orientation).
; ==============================================================================================
Camera_CopyState	proc far		; CODE XREF: seg065:loc_2DF32p
					; Camera_UpdateAndNotify_7AFCA+14P ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]

loc_2DE78:
		mov	eax, [di]

loc_2DE7B:
		mov	[si], eax
		mov	eax, [di+4]

loc_2DE82:
		mov	[si+4],	eax
		mov	eax, [di+8]
		mov	[si+8],	eax
		mov	eax, [di+0Ch]
		mov	[si+0Ch], eax
		mov	eax, [di+10h]
		mov	[si+10h], eax
		mov	dx, di
		add	dx, 14h
		mov	bx, dx
		mov	eax, [bx]
		mov	[si+14h], eax
		mov	eax, [bx+4]
		mov	[si+18h], eax
		mov	eax, [bx+8]
		mov	[si+1Ch], eax
		mov	ax, di
		add	ax, 20h	; ' '
		push	ax
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	AI_ComputeGeometryHelper_56E29

loc_2DECD:
		add	sp, 4

loc_2DED0:
		mov	eax, [di+44h]

loc_2DED4:
		mov	[si+44h], eax

loc_2DED8:
		mov	ax, si
		add	ax, 48h	; 'H'
		push	ds
		push	ax

loc_2DEDF:
		mov	ax, di
		add	ax, 48h	; 'H'

loc_2DEE4:
		push	ds
		push	ax
		mov	cx, 8
		call	CRT_Fmemcpy
		pop	di
		pop	si
		pop	bp
		retf
Camera_CopyState	endp

; ���������������������������������������������������������������������������

loc_2DEF2:				; DATA XREF: seg339:0494o seg339:04E9o ...
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		push	ax
		nop
		push	cs
		call	near ptr Camera_ComputeViewMatrix
		pop	cx
		mov	al, 1
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2DF03:				; DATA XREF: seg339:0498o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	al, 0
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, méthode virtuelle : slot +0x18 des sous-vtables posés à +0x50 (0x460 et 0x484 de
; seg339), appelée par TrackedObjects_CallSlot18OnActive_22F10 pour chaque objet actif de la
; liste 0x59CD. Séquence lue : PIT_ReadHighPrecision (jalons de profilage
; dword_72B7A/7E/82/86/8A/8E), Camera_CopyState(objet,0x5146), Camera_UpdateViewportClip,
; WorldObjects_CallSlot4OnAllThenRecompute_2214F(0x59C3, objet),
; Widget_RefreshTextConditional(0x53FA), Collection_NotifyAllDestroy(0x53FA), slot +0x20 puis
; slot +0x14 du sous-vtable à +0x50, puis slot +4 de l'objet à +0x5C. Anciennement
; View_RenderFrame ('rendre cette vue' : non prouvé, nom neutralisé).
; ==============================================================================================
TrackedObject_FrameStep_2DF0D:				; DATA XREF: seg339:0478o seg339:049Co ...
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+6]
		call	PIT_ReadHighPrecision
		push	dx
		push	ax
		pop	eax
		mov	dword_72B7A, eax
		cmp	word ptr [si+5Ch], 0
		jnz	short loc_2DF2D
		jmp	loc_2DFE1
; ���������������������������������������������������������������������������

loc_2DF2D:				; CODE XREF: seg065:0128j
		push	si

loc_2DF2E:
		push	5146h
		push	cs

loc_2DF32:
		call	near ptr Camera_CopyState
		add	sp, 4

loc_2DF38:
		mov	ax, [si+5Ch]
		add	ax, 2
		push	ax
		lea	ax, [bp-4]
		push	ax
		call	SmallObject_RegisterInList_5D999
		add	sp, 4
		push	si
		nop
		push	cs
		call	near ptr Camera_UpdateViewportClip
		pop	cx
		call	PIT_ReadHighPrecision
		push	dx
		push	ax

loc_2DF59:
		pop	eax

loc_2DF5B:
		mov	dword_72B7E, eax

loc_2DF5F:
		mov	word_724AC, 0
		push	si
		push	59C3h
		call	WorldObjects_CallSlot4OnAllThenRecompute_2214F
		add	sp, 4

loc_2DF71:
		call	PIT_ReadHighPrecision
		push	dx
		push	ax
		pop	eax

loc_2DF7A:
		mov	dword_72B82, eax

loc_2DF7E:
		push	53FAh

loc_2DF81:
		call	Widget_RefreshTextConditional
		pop	cx
		call	PIT_ReadHighPrecision
		push	dx
		push	ax
		pop	eax
		mov	dword_72B86, eax
		push	53FAh
		call	Collection_NotifyAllDestroy
		pop	cx
		call	PIT_ReadHighPrecision
		push	dx
		push	ax
		pop	eax
		mov	dword_72B8A, eax
		push	si
		mov	bx, [si+50h]
		call	dword ptr [bx+20h]
		pop	cx
		push	si
		mov	bx, [si+50h]
		call	dword ptr [bx+14h]
		pop	cx
		push	word ptr [si+5Ch]
		mov	bx, [si+5Ch]
		mov	bx, [bx]
		call	dword ptr [bx+4]
		pop	cx

loc_2DFC6:
		call	PIT_ReadHighPrecision
		push	dx

loc_2DFCC:
		push	ax
		pop	eax

loc_2DFCF:
		mov	dword_72B8E, eax
		push	2
		lea	ax, [bp-4]
		push	ax
		call	SmallObject_UnregisterFromList_5D9D3
		add	sp, 4

loc_2DFE1:				; CODE XREF: seg065:012Aj
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, méthode virtuelle : slot +0x20 des sous-vtables posés à +0x50 (0x460 et 0x484 de
; seg339), appelée par TrackedObject_FrameStep_2DF0D. Appelle
; UIScreen_RenderGraphVGA_Wrapper_50E44(objet), qui appelle UIScreen_RenderGraphVGA_509EE puis
; WorldObjects_CallSlot1COnActive_2217D(0x59C3, objet). Pas de nom résolu auparavant (label
; loc_2DFE4).
; ==============================================================================================
TrackedObject_NotifyWorldObjects_2DFE4:				; DATA XREF: seg339:off_6D530o
					; seg339:04A4o	...
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		push	ax
		call	UIScreen_RenderGraphVGA_Wrapper_50E44
		pop	cx
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,84L — si une caméra parente est référencée (+0x5E), transforme un point via sub_33080
; (transformation dans l'espace caméra) ; sinon fallback direct (+0x1C) : transformation d'un
; point dans l'espace de la caméra active (avec ou sans parent).
; ==============================================================================================
Camera_TransformPoint	proc far		; CODE XREF: Radar_Project3DToScreen:loc_16B4AP
					; Camera_FrustumClipTest:loc_2E0F0p	...

var_2E		= dword	ptr -2Eh
var_2A		= dword	ptr -2Ah
var_26		= dword	ptr -26h
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
		sub	sp, 1Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+5Eh], 0
		jz	short loc_2E07A
		mov	di, si
		add	di, 14h
		mov	[bp+var_4], 0
		mov	eax, [bp+var_4]
		mov	[bp+var_1C], eax
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		mov	[bp+var_18], eax

loc_2E029:
		mov	[bp+var_C], 100h

loc_2E031:
		mov	eax, [bp+var_C]
		mov	[bp+var_14], eax
		lea	ax, [bp+var_1C]
		push	ax
		sub	sp, 0Ch
		mov	eax, [di]
		mov	[bp+var_2E], eax
		mov	eax, [di+4]
		mov	[bp+var_2A], eax

loc_2E04F:
		mov	eax, [di+8]

loc_2E053:
		mov	[bp+var_26], eax
		mov	ax, [si+5Eh]
		add	ax, 0Ah

loc_2E05D:
		push	ax
		push	ss

loc_2E05F:
		lea	ax, [bp+var_10]
		push	ax

loc_2E063:
		call	Camera_TransformIfVisible
		add	sp, 14h
		mov	eax, [bp+var_10]
		sar	eax, 8
		shld	edx, eax, 10h
		jmp	short loc_2E087
; ���������������������������������������������������������������������������

loc_2E07A:				; CODE XREF: Camera_TransformPoint+Fj
		mov	eax, [si+1Ch]
		sar	eax, 8

loc_2E082:
		shld	edx, eax, 10h

loc_2E087:				; CODE XREF: Camera_TransformPoint+85j
		pop	di
		pop	si
		leave
		retf
Camera_TransformPoint	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,27L — extrait un vecteur (+0x1A d'un objet référencé) puis appelle sub_2E0B1 : wrapper
; de test de clipping caméra sur un point d'objet.
; ==============================================================================================
Camera_ClipTestWrapper	proc far		; CODE XREF: seg014:0191P
					; MissionRecord_LoadEntityDatabase_7B035+BE6P ...

var_8		= dword	ptr -8
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	dx, [bp+arg_0]
		push	[bp+arg_4]
		sub	sp, 4
		mov	si, [bp+arg_2]
		add	si, 1Ah
		mov	eax, [si]
		mov	[bp+var_8], eax
		push	dx
		nop
		push	cs
		call	near ptr Camera_FrustumClipTest
		add	sp, 8
		pop	si
		pop	bp
		retf
Camera_ClipTestWrapper	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,255L — test de clipping du frustum de la caméra : transforme le point (sub_2DFF3),
; compare aux limites near/far (constantes 0xFFFFEC00/0x300) et aux bords de l'écran (via
; ratio de projection perspective) : détermine si un point est visible dans le champ de la
; caméra.
; ==============================================================================================
Camera_FrustumClipTest	proc far		; CODE XREF: Camera_ClipTestWrapper+1Dp
					; MissionRecord_LoadEntityDatabase_7B035+209FP ...

var_36		= dword	ptr -36h
var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_2A		= dword	ptr -2Ah
var_26		= dword	ptr -26h
var_22		= dword	ptr -22h
var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 36h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_6]
		mov	ax, di

loc_2E0C1:
		add	ax, 8
		mov	[bp+var_6], ax
		mov	bx, [bp+var_6]
		mov	eax, [bx]

loc_2E0CD:
		mov	[bp+var_4], eax

loc_2E0D1:
		push	di
		push	ss

loc_2E0D3:
		lea	ax, [bp+var_E]
		push	ax
		call	Math_ElevationAngle_552E1
		add	sp, 6
		mov	eax, [bp+var_E]

loc_2E0E3:
		neg	eax
		mov	[bp+var_12], eax
		mov	[bp+var_A], eax
		push	si
		push	cs

loc_2E0F0:
		call	near ptr Camera_TransformPoint

loc_2E0F3:
		push	dx
		push	ax
		pop	eax

loc_2E0F7:
		pop	cx

loc_2E0F8:
		mov	[bp+var_1A], eax

loc_2E0FC:
		shl	eax, 8
		mov	[bp+var_16], eax

loc_2E104:
		mov	eax, [si]
		shl	eax, 1
		mov	[bp+var_1E], eax
		mov	[bp+var_22], eax
		add	[bp+var_16], eax
		mov	eax, [bp+arg_2]
		sub	[bp+var_16], eax
		mov	eax, [bp+var_16]

loc_2E122:
		cmp	eax, [bp+var_4]
		jle	short loc_2E12D
		mov	ax, 1
		jmp	short loc_2E12F
; ���������������������������������������������������������������������������

loc_2E12D:				; CODE XREF: Camera_FrustumClipTest+75j
		xor	ax, ax

loc_2E12F:				; CODE XREF: Camera_FrustumClipTest+7Aj
		or	al, al
		jnz	short loc_2E136

loc_2E133:
		jmp	loc_2E28B
; ���������������������������������������������������������������������������

loc_2E136:				; CODE XREF: Camera_FrustumClipTest+80j
		cmp	[bp+var_A], 0FFFFEC00h
		jle	short loc_2E145
		mov	ax, 1
		jmp	short loc_2E147
; ���������������������������������������������������������������������������

loc_2E145:				; CODE XREF: Camera_FrustumClipTest+8Dj
		xor	ax, ax

loc_2E147:				; CODE XREF: Camera_FrustumClipTest+92j
		or	al, al
		jnz	short loc_2E185
		cmp	[bp+var_4], 0
		jz	short loc_2E185
		mov	eax, [bp+var_16]
		mov	edx, eax
		mov	ecx, [bp+var_4]
		sar	edx, 18h

loc_2E161:
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_2A], eax
		mov	eax, [bp+var_2A]
		mov	[bp+var_2E], eax
		mov	[bp+var_26], eax
		cmp	[bp+var_26], 300h
		jg	short loc_2E185
		jmp	loc_2E247
; ���������������������������������������������������������������������������

loc_2E185:				; CODE XREF: Camera_FrustumClipTest+98j
					; Camera_FrustumClipTest+9Fj ...
		push	large dword ptr	[di+8]
		push	large dword ptr	[di+4]
		push	large dword ptr	[di]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_36], eax
		mov	[bp+var_32], eax
		mov	eax, [bp+var_32]
		mov	edx, dword_6E9AE
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_32], eax
		mov	eax, [bp+var_16]
		cmp	eax, [bp+var_32]
		jle	short loc_2E1C8
		mov	ax, 1
		jmp	short loc_2E1CA
; ���������������������������������������������������������������������������

loc_2E1C8:				; CODE XREF: Camera_FrustumClipTest+110j
		xor	ax, ax

loc_2E1CA:				; CODE XREF: Camera_FrustumClipTest+115j
		or	al, al
		jz	short loc_2E23D
		cmp	[bp+var_32], 0

loc_2E1D3:
		jz	short loc_2E23D

loc_2E1D5:
		mov	eax, [bp+var_32]
		mov	[di+8],	eax

loc_2E1DD:
		mov	eax, [bp+var_16]

loc_2E1E1:
		mov	edx, eax
		mov	ecx, [bp+var_32]
		sar	edx, 18h
		shl	eax, 8

loc_2E1F0:
		idiv	ecx
		mov	[bp+var_16], eax
		mov	eax, [di]
		mov	edx, [bp+var_16]
		imul	edx
		shrd	eax, edx, 8
		mov	[di], eax
		mov	eax, [di+4]
		mov	edx, [bp+var_16]
		imul	edx
		shrd	eax, edx, 8
		mov	[di+4],	eax
		mov	ax, di
		add	ax, 4
		mov	eax, [di+8]
		mov	edx, [bp+var_16]
		imul	edx
		shrd	eax, edx, 8

loc_2E232:
		mov	[di+8],	eax
		mov	ax, di
		add	ax, 8
		jmp	short loc_2E28B
; ���������������������������������������������������������������������������

loc_2E23D:				; CODE XREF: Camera_FrustumClipTest+11Bj
					; Camera_FrustumClipTest:loc_2E1D3j
		mov	eax, [bp+var_16]
		mov	[di+8],	eax
		jmp	short loc_2E28B
; ���������������������������������������������������������������������������

loc_2E247:				; CODE XREF: Camera_FrustumClipTest+D1j
		mov	eax, [di]
		mov	edx, [bp+var_26]
		imul	edx
		shrd	eax, edx, 8
		mov	[di], eax
		mov	eax, [di+4]
		mov	edx, [bp+var_26]
		imul	edx
		shrd	eax, edx, 8
		mov	[di+4],	eax
		mov	ax, di

loc_2E26F:
		add	ax, 4

loc_2E272:
		mov	eax, [di+8]

loc_2E276:
		mov	edx, [bp+var_26]
		imul	edx

loc_2E27D:
		shrd	eax, edx, 8

loc_2E282:
		mov	[di+8],	eax
		mov	ax, di
		add	ax, 8

loc_2E28B:				; CODE XREF: Camera_FrustumClipTest:loc_2E133j
					; Camera_FrustumClipTest+18Aj ...
		pop	di
		pop	si
		leave
		retf
Camera_FrustumClipTest	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,20L — détache la référence de caméra parente (+0x5E), invalide le lien retour :
; détachement d'une caméra de son parent.
; ==============================================================================================
Camera_DetachParent	proc far		; CODE XREF: UIScript_ParseAndEvaluate_7A054:loc_7A483P
					; HUDSymbol_ConstructWithFullMatrix_83DD7+1E3P ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+5Eh], 0
		jz	short loc_2E2A9
		mov	bx, [si+5Eh]
		mov	word ptr [bx+4], 0
		mov	word ptr [si+5Eh], 0

loc_2E2A9:				; CODE XREF: Camera_DetachParent+Bj
		pop	si
		pop	bp
		retf
Camera_DetachParent	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,469L — grosse fonction du même cluster caméra/viewport (buffer local conséquent) :
; candidat pour le calcul complet de la matrice de transformation caméra (view/projection), à
; approfondir.
; ==============================================================================================
Camera_ComputeViewMatrix	proc far		; CODE XREF: seg014:0062P seg014:0655P ...

var_96		= dword	ptr -96h
var_8C		= dword	ptr -8Ch
var_88		= dword	ptr -88h
var_84		= dword	ptr -84h
var_80		= dword	ptr -80h
var_7C		= dword	ptr -7Ch
var_78		= dword	ptr -78h
var_74		= dword	ptr -74h
var_70		= dword	ptr -70h
var_6C		= dword	ptr -6Ch
var_68		= dword	ptr -68h
var_64		= word ptr -64h
var_62		= dword	ptr -62h
var_5E		= dword	ptr -5Eh
var_5A		= dword	ptr -5Ah
var_56		= dword	ptr -56h
var_52		= word ptr -52h
var_50		= dword	ptr -50h
var_4C		= dword	ptr -4Ch
var_48		= dword	ptr -48h
var_44		= dword	ptr -44h
var_40		= word ptr -40h
var_3E		= dword	ptr -3Eh
var_3A		= dword	ptr -3Ah
var_36		= dword	ptr -36h
var_32		= dword	ptr -32h
var_2E		= word ptr -2Eh
var_2C		= dword	ptr -2Ch
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
		sub	sp, 8Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	eax, [si+2Ch]
		mov	[bp+var_80], eax
		mov	eax, [si+30h]
		mov	[bp+var_7C], eax
		mov	[bp+var_14], 0
		mov	eax, [bp+var_14]
		mov	[bp+var_78], eax
		lea	ax, [bp+var_80]
		push	ax
		call	Vector_NormalizeInPlace_5593A
		pop	cx
		mov	eax, [bp+var_7C]
		mov	[bp+var_8C], eax
		mov	eax, [bp+var_80]

loc_2E2EF:
		neg	eax
		mov	[bp+var_18], eax
		mov	[bp+var_1C], eax
		mov	[bp+var_88], eax
		mov	eax, [bp+var_78]

loc_2E303:
		mov	[bp+var_84], eax
		mov	eax, [bp+var_80]
		mov	edx, dword_704DD
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_80], eax
		mov	eax, [bp+var_7C]
		mov	edx, dword_704DD
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_7C], eax
		mov	eax, [bp+var_78]
		mov	edx, dword_704DD
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_78], eax
		mov	eax, dword_704DD
		sar	eax, 1

loc_2E34E:
		mov	[bp+var_20], eax

loc_2E352:
		mov	[bp+var_24], eax

loc_2E356:
		mov	eax, [bp+var_8C]
		mov	edx, [bp+var_24]

loc_2E35F:
		imul	edx

loc_2E362:
		shrd	eax, edx, 8
		mov	[bp+var_8C], eax
		mov	eax, [bp+var_88]

loc_2E371:
		mov	edx, [bp+var_24]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_88], eax
		mov	eax, [bp+var_84]
		mov	edx, [bp+var_24]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_84], eax
		mov	eax, [bp+var_8C]
		sub	[bp+var_80], eax
		mov	eax, [bp+var_88]
		sub	[bp+var_7C], eax
		mov	eax, [bp+var_84]
		sub	[bp+var_78], eax
		mov	eax, [bp+var_80]
		add	[bp+var_8C], eax
		mov	eax, [bp+var_7C]

loc_2E3C0:
		add	[bp+var_88], eax

loc_2E3C5:
		mov	eax, [bp+var_78]

loc_2E3C9:
		add	[bp+var_84], eax

loc_2E3CE:
		mov	eax, dword_704E1

loc_2E3D2:
		mov	[bp+var_78], eax
		mov	[bp+var_84], eax
		mov	di, si
		add	di, 1Ch
		mov	eax, [di]

loc_2E3E3:
		sub	[bp+var_78], eax
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		lea	ax, [bp+var_80]
		push	ax

loc_2E3F1:
		call	Matrix_WorldToLocal_58768

loc_2E3F6:
		add	sp, 4
		mov	di, si
		add	di, 1Ch

loc_2E3FE:
		mov	eax, [di]

loc_2E401:
		sub	[bp+var_84], eax
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		lea	ax, [bp+var_8C]
		push	ax
		call	Matrix_WorldToLocal_58768
		add	sp, 4
		mov	[bp+var_28], 0E6h ; '�'

loc_2E421:
		mov	eax, [si+34h]

loc_2E425:
		cmp	eax, [bp+var_28]

loc_2E429:
		jle	short loc_2E430
		mov	ax, 1

loc_2E42E:
		jmp	short loc_2E432
; ���������������������������������������������������������������������������

loc_2E430:				; CODE XREF: Camera_ComputeViewMatrix:loc_2E429j
		xor	ax, ax

loc_2E432:				; CODE XREF: Camera_ComputeViewMatrix:loc_2E42Ej
		or	al, al

loc_2E434:
		jnz	short loc_2E453
		mov	[bp+var_2C], 0FFFFFF1Ah
		mov	eax, [si+34h]
		cmp	eax, [bp+var_2C]
		jge	short loc_2E44D
		mov	ax, 1
		jmp	short loc_2E44F
; ���������������������������������������������������������������������������

loc_2E44D:				; CODE XREF: Camera_ComputeViewMatrix+19Aj
		xor	ax, ax

loc_2E44F:				; CODE XREF: Camera_ComputeViewMatrix+19Fj
		or	al, al

loc_2E451:
		jz	short loc_2E4AB

loc_2E453:				; CODE XREF: Camera_ComputeViewMatrix:loc_2E434j
		cmp	dword ptr [si+34h], 0
		jle	short loc_2E45F
		mov	ax, 1
		jmp	short loc_2E461
; ���������������������������������������������������������������������������

loc_2E45F:				; CODE XREF: Camera_ComputeViewMatrix+1ACj
		xor	ax, ax

loc_2E461:				; CODE XREF: Camera_ComputeViewMatrix+1B1j
		or	al, al
		jz	short loc_2E488
		mov	[bp+var_4], 0FFFFFF9Ch

loc_2E46D:
		mov	[bp+var_8], 12Ch
		mov	[bp+var_C], 190h

loc_2E47D:
		mov	[bp+var_10], 12Ch
		jmp	loc_2E5D9
; ���������������������������������������������������������������������������

loc_2E488:				; CODE XREF: Camera_ComputeViewMatrix+1B7j
		mov	[bp+var_4], 0FFFFFF9Ch
		mov	[bp+var_8], 0FFFFFF9Ch
		mov	[bp+var_C], 190h
		mov	[bp+var_10], 0FFFFFF9Ch
		jmp	loc_2E5D9
; ���������������������������������������������������������������������������

loc_2E4AB:				; CODE XREF: Camera_ComputeViewMatrix:loc_2E451j
		mov	ax, [si+8]
		mov	[bp+var_2E], ax
		mov	di, si
		add	di, 0Ch
		push	large [bp+var_7C]
		push	large dword ptr	[di]
		push	large [bp+var_80]

loc_2E4C1:
		call	Math_FixedMulDiv_5804C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_32], eax
		mov	[bp+var_36], eax

loc_2E4D5:
		movsx	eax, [bp+var_2E]
		shl	eax, 8
		mov	edx, [bp+var_36]
		add	edx, eax
		mov	[bp+var_3A], edx
		mov	eax, [bp+var_3A]
		mov	[bp+var_3E], eax
		sar	eax, 8
		mov	[bp+var_4], eax
		mov	ax, [si+0Ah]
		mov	[bp+var_40], ax
		mov	di, si
		add	di, 10h
		push	large [bp+var_7C]
		push	large dword ptr	[di]
		push	large [bp+var_78]
		call	Math_FixedMulDiv_5804C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_44], eax

loc_2E51F:
		mov	[bp+var_48], eax
		movsx	eax, [bp+var_40]
		shl	eax, 8
		sub	eax, [bp+var_48]
		mov	[bp+var_4C], eax
		mov	[bp+var_50], eax
		sar	eax, 8
		mov	[bp+var_8], eax
		mov	ax, [si+8]
		mov	[bp+var_52], ax
		mov	di, si
		add	di, 0Ch
		push	large [bp+var_88]

loc_2E550:
		push	large dword ptr	[di]
		push	large [bp+var_8C]
		call	Math_FixedMulDiv_5804C
		push	dx
		push	ax
		pop	eax

loc_2E561:
		add	sp, 0Ch

loc_2E564:
		mov	[bp+var_56], eax
		mov	[bp+var_5A], eax
		movsx	eax, [bp+var_52]

loc_2E571:
		shl	eax, 8

loc_2E575:
		mov	edx, [bp+var_5A]
		add	edx, eax

loc_2E57C:
		mov	[bp+var_5E], edx

loc_2E580:
		mov	eax, [bp+var_5E]
		mov	[bp+var_62], eax
		sar	eax, 8
		mov	[bp+var_C], eax
		mov	ax, [si+0Ah]
		mov	[bp+var_64], ax
		mov	di, si
		add	di, 10h
		push	large [bp+var_88]
		push	large dword ptr	[di]
		push	large [bp+var_84]
		call	Math_FixedMulDiv_5804C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_68], eax
		mov	[bp+var_6C], eax
		movsx	eax, [bp+var_64]

loc_2E5C1:
		shl	eax, 8
		sub	eax, [bp+var_6C]
		mov	[bp+var_70], eax
		mov	[bp+var_74], eax

loc_2E5D1:
		sar	eax, 8
		mov	[bp+var_10], eax

loc_2E5D9:				; CODE XREF: Camera_ComputeViewMatrix+1D9j
					; Camera_ComputeViewMatrix+1FCj
		cmp	[bp+var_4], 1FFFh
		jle	short loc_2E5ED
		mov	[bp+var_4], 1FFFh
		jmp	short loc_2E5FF
; ���������������������������������������������������������������������������

loc_2E5ED:				; CODE XREF: Camera_ComputeViewMatrix+335j
		cmp	[bp+var_4], 0FFFFE001h
		jge	short loc_2E5FF
		mov	[bp+var_4], 0FFFFE001h

loc_2E5FF:				; CODE XREF: Camera_ComputeViewMatrix+33Fj
					; Camera_ComputeViewMatrix+349j
		cmp	[bp+var_8], 1FFFh
		jle	short loc_2E613
		mov	[bp+var_8], 1FFFh
		jmp	short loc_2E625
; ���������������������������������������������������������������������������

loc_2E613:				; CODE XREF: Camera_ComputeViewMatrix+35Bj
		cmp	[bp+var_8], 0FFFFE001h
		jge	short loc_2E625

loc_2E61D:
		mov	[bp+var_8], 0FFFFE001h

loc_2E625:				; CODE XREF: Camera_ComputeViewMatrix+365j
					; Camera_ComputeViewMatrix+36Fj
		cmp	[bp+var_C], 1FFFh
		jle	short loc_2E639

loc_2E62F:
		mov	[bp+var_C], 1FFFh
		jmp	short loc_2E64B
; ���������������������������������������������������������������������������

loc_2E639:				; CODE XREF: Camera_ComputeViewMatrix+381j
		cmp	[bp+var_C], 0FFFFE001h
		jge	short loc_2E64B
		mov	[bp+var_C], 0FFFFE001h

loc_2E64B:				; CODE XREF: Camera_ComputeViewMatrix+38Bj
					; Camera_ComputeViewMatrix+395j
		cmp	[bp+var_10], 1FFFh

loc_2E653:
		jle	short loc_2E65F

loc_2E655:
		mov	[bp+var_10], 1FFFh

loc_2E65D:
		jmp	short loc_2E671
; ���������������������������������������������������������������������������

loc_2E65F:				; CODE XREF: Camera_ComputeViewMatrix:loc_2E653j
		cmp	[bp+var_10], 0FFFFE001h
		jge	short loc_2E671
		mov	[bp+var_10], 0FFFFE001h

loc_2E671:				; CODE XREF: Camera_ComputeViewMatrix:loc_2E65Dj
					; Camera_ComputeViewMatrix+3BBj
		mov	ax, word ptr [bp+var_4]
		mov	[si+78h], ax
		mov	ax, word ptr [bp+var_8]
		mov	[si+7Ah], ax
		mov	ax, word ptr [bp+var_C]
		mov	[si+7Ch], ax
		mov	ax, word ptr [bp+var_10]
		mov	[si+7Eh], ax
		mov	al, byte_72505
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2E6C7
		mov	al, byte_6E1C0
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2E6C7
		push	si
		mov	bx, [si+50h]
		call	dword ptr [bx+14h]
		pop	cx
		cmp	al, 0Eh
		jz	short loc_2E6C7
		push	0
		sub	sp, 4
		add	si, 1Ch
		mov	eax, [si]
		mov	[bp+var_96], eax
		push	541Ah
		call	Interp_FractionalCompute
		add	sp, 8

loc_2E6C2:
		mov	byte_6E1C0, 1

loc_2E6C7:				; CODE XREF: Camera_ComputeViewMatrix+3E4j
					; Camera_ComputeViewMatrix+3EDj ...
		pop	di

loc_2E6C8:
		pop	si
		leave
		retf
Camera_ComputeViewMatrix	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,36L — compare le rectangle de viewport courant (+0x78-0x7E) au précédent, met à jour la
; zone de clipping si changé (sub_58B97) : mise à jour du rectangle de clipping du viewport
; caméra (cache si inchangé).
; ==============================================================================================
Camera_UpdateViewportClip	proc far		; CODE XREF: seg065:014Ep
					; Camera_UpdateAndNotify_7AFCA+30P ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp

loc_2E6CE:
		push	si
		mov	si, [bp+arg_0]

loc_2E6D2:
		mov	ax, [si+78h]
		cmp	ax, [si+7Ch]
		jnz	short loc_2E6E2
		mov	ax, [si+7Ah]
		cmp	ax, [si+7Eh]
		jz	short loc_2E6FA

loc_2E6E2:				; CODE XREF: Camera_UpdateViewportClip+Dj
		push	word ptr [si+7Eh]
		push	word ptr [si+7Ch]
		push	word ptr [si+7Ah]
		push	word ptr [si+78h]
		push	word_70E60

loc_2E6F2:
		call	Render_DitheredLineMain_58B97
		add	sp, 0Ah

loc_2E6FA:				; CODE XREF: Camera_UpdateViewportClip+15j
		pop	si
		pop	bp
		retf
Camera_UpdateViewportClip	endp

; ���������������������������������������������������������������������������

loc_2E6FD:				; DATA XREF: seg339:off_71E96o
		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		mov	dword ptr [bp-4], 100h
		mov	eax, [bp-4]
		mov	dword_6E9A6, eax
		mov	dword_724B6, 0
		mov	byte_724BA, 2

loc_2E721:
		mov	byte_724BB, 0

loc_2E726:
		mov	dword_724BC, 0

loc_2E72F:
		mov	dword_724C0, 0
		mov	byte_724C4, 2
		mov	byte_724C5, 0
		mov	dword_724C6, 0
		mov	word_724AA, 0
		mov	dword ptr [bp-8], 0D5h ; '�'
		mov	eax, [bp-8]
		mov	dword_6E9AA, eax
		mov	dword ptr [bp-0Ch], 1400h
		lea	ax, [bp-0Ch]
		push	ax
		push	ds
		push	offset dword_6E9AE
		call	Math_SinDeg_54876
		add	sp, 6
		leave
		retf
; ���������������������������������������������������������������������������

loc_2E77B:				; DATA XREF: seg339:4EF4o
		push	bp
		mov	bp, sp
		push	53FAh

loc_2E781:
		call	Widget_DestructTwoLabels
		pop	cx
		cmp	byte_724C5, 0
		jz	short loc_2E7AC
		cmp	dword_724C0, 0
		jz	short loc_2E7AC
		push	0
		mov	al, byte_724C4
		push	ax
		push	5410h
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_2E7AC:				; CODE XREF: seg065:098Cj seg065:0994j
		mov	dword_724C0, 0
		mov	byte_724C5, 0
		mov	dword_724C6, 0
		cmp	byte_724BB, 0
		jz	short loc_2E7E8
		cmp	dword_724B6, 0
		jz	short loc_2E7E8
		push	0
		mov	al, byte_724BA
		push	ax
		push	5406h
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_2E7E8:				; CODE XREF: seg065:09C8j seg065:09D0j
		mov	dword_724B6, 0

loc_2E7F1:
		mov	byte_724BB, 0
		mov	dword_724BC, 0
		pop	bp

locret_2E800:
		retf
seg065		ends

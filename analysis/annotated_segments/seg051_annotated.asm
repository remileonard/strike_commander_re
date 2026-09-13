seg051		segment	byte public 'CODE' use16
		assume cs:seg051
		;org 1
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,32L — réinitialise le banc complet de flags de chatter radio (byte_6E4B4-6E4D0), invoque
; sub_28F08 deux fois (double décalage de banc) : initialisation/reset du pipeline de flags
; radio en début de mission.
; ==============================================================================================
RadioFlags_ResetBank	proc far		; CODE XREF: MissionLoader_AssignUnitRosterB_A7E3B+59P
		push	bp
		mov	bp, sp
		mov	byte_6E4B4, 0

loc_28EB9:				; DATA XREF: seg216:0256o
		mov	byte_6E4B5, 0
		mov	byte_6E4B6, 0
		mov	byte_6E4B7, 2
		mov	byte_6E4B8, 0
		mov	byte_6E4B9, 0
		mov	byte_6E4BA, 0
		mov	byte_6E4BB, 0
		mov	byte_6E4D7, 0
		mov	byte_6E4CF, 0
		mov	byte_6E4D0, 1
		cmp	word_6E4B2, 0
		jz	short loc_28EFC
		push	word_6E4B2
		call	VROOMM_StubThunk_6B222
		pop	cx

loc_28EFC:				; CODE XREF: RadioFlags_ResetBank+3Fj
		nop
		push	cs
		call	near ptr RadioFlags_ShiftHistory
		nop
		push	cs
		call	near ptr RadioFlags_ShiftHistory
		pop	bp
		retf
RadioFlags_ResetBank	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 96 lignes - LUE INTEGRALEMENT (remontee de la chaine de declenchement du bavardage de
; combat, a la demande de Remi). Simple decalage d'historique : copie les drapeaux 'de cette
; frame' (byte_6E4BC a byte_6E4C7) vers des emplacements 'historique' (byte_6E4C8 a
; byte_6E4D8), PUIS remet les drapeaux source a zero. Ne decide rien elle-meme - juste un
; registre a decalage. Mapping confirme : byte_6E4BF (source) -> byte_6E4CB (consomme par
; Radio_CombatChatterDispatch pour le message de destruction 0x0D).
; ==============================================================================================
RadioFlags_ShiftHistory	proc far		; CODE XREF: RadioFlags_ResetBank+4Dp
					; RadioFlags_ResetBank+52p ...

var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	al, byte_6E4BC
		mov	byte_6E4C8, al
		mov	al, byte_6E4BD
		mov	byte_6E4C9, al
		mov	al, byte_6E4BE
		mov	byte_6E4CA, al
		mov	al, byte_6E4BF
		mov	byte_6E4CB, al
		mov	al, byte_6E4C0
		mov	byte_6E4CC, al
		mov	al, byte_6E4C1
		mov	byte_6E4CD, al
		mov	al, byte_6E4C2
		mov	byte_6E4CE, al
		mov	al, byte_6E4C3
		mov	byte_6E4D1, al
		mov	al, byte_6E4C4
		mov	byte_6E4D2, al
		mov	al, byte_6E4C5

loc_28F47:
		mov	byte_6E4D3, al

loc_28F4A:
		mov	al, byte_6E4C7
		mov	byte_6E4D8, al

loc_28F50:
		mov	al, byte_6E4C6
		mov	byte_6E4D7, al
		mov	al, 0
		mov	byte_6E4C5, al
		mov	byte_6E4C6, al
		mov	byte_6E4C4, al
		mov	byte_6E4C3, al
		mov	byte_6E4C2, al
		mov	byte_6E4C1, al
		mov	byte_6E4C0, al
		mov	byte_6E4BF, al
		mov	byte_6E4BE, al
		mov	byte_6E4BD, al
		mov	byte_6E4BC, al
		mov	byte_6E4C7, al
		mov	al, byte_6E4B4
		mov	ah, 0
		or	ax, ax
		jnz	short locret_28FDF
		cmp	word_722EC, 0
		jnz	short loc_28F93
		cmp	word_722E8, 0
		jz	short loc_28FB2

loc_28F93:				; CODE XREF: RadioFlags_ShiftHistory+82j
		mov	ax, word_722E8
		mov	[bp+var_2], ax
		push	ax
		push	523Ch
		call	SetReference16
		add	sp, 4
		push	0
		push	5238h
		call	SetReference16
		add	sp, 4

loc_28FB2:				; CODE XREF: RadioFlags_ShiftHistory+89j
		cmp	word_722EE, 0
		jnz	short loc_28FC0
		cmp	word_722EA, 0
		jz	short locret_28FDF

loc_28FC0:				; CODE XREF: RadioFlags_ShiftHistory+AFj
		mov	ax, word_722EA
		mov	[bp+var_4], ax
		push	ax
		push	523Eh
		call	SetReference16
		add	sp, 4
		push	0
		push	523Ah
		call	SetReference16
		add	sp, 4

locret_28FDF:				; CODE XREF: RadioFlags_ShiftHistory+7Bj
					; RadioFlags_ShiftHistory+B6j
		leave
		retf
RadioFlags_ShiftHistory	endp

; ���������������������������������������������������������������������������

loc_28FE1:				; DATA XREF: seg339:4DCEo
		push	bp
		mov	bp, sp
		mov	word_722E6, 0
		mov	word_722E8, 0
		mov	word_722EA, 0
		mov	word_722EC, 0
		mov	word_722EE, 0
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_29004:				; DATA XREF: seg339:4EE8o
		push	bp
		mov	bp, sp
		push	523Eh
		call	WeakRef_InvalidateIfSet
		pop	cx
		push	523Ch
		call	WeakRef_InvalidateIfSet
		pop	cx
		push	523Ah
		call	WeakRef_InvalidateIfSet
		pop	cx

loc_29022:
		push	5238h

loc_29025:
		call	WeakRef_InvalidateIfSet
		pop	cx

loc_2902B:
		push	5236h

loc_2902E:
		call	WeakRef_InvalidateIfSet
		pop	cx

loc_29034:
		pop	bp
		retf
seg051		ends

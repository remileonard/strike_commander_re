seg231		segment	para public 'DATA' use16
		assume cs:seg231
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
byte_72010	db 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 0Ah, 0Bh, 0Ch, 0Dh, 0Eh, 0Fh
		db 10h, 11h, 12h, 13h, 14h, 15h, 16h, 17h, 18h, 19h, 1Ah, 1Bh, 1Ch, 55h, 1Eh, 1Fh
		db 20h, 21h, 22h, 23h, 24h, 25h, 26h, 27h, 28h, 29h, 2Ah, 2Bh, 2Ch, 2Dh, 2Eh, 2Fh
		db 30h, 31h, 32h, 33h, 34h, 56h, 36h, 58h, 59h, 39h, 3Ah, 3Bh, 3Ch, 3Dh, 3Eh, 3Fh
byte_72050	db 40h, 41h, 42h, 43h, 44h, 45h, 46h, 47h, 48h, 49h, 4Ah, 4Bh, 4Ch, 4Dh, 4Eh, 4Fh
		db 50h, 51h, 52h, 53h, 54h, 55h, 56h, 57h, 58h, 59h, 5Ah, 5Bh, 5Ch, 5Dh, 5Eh, 5Fh
		db 60h, 61h, 62h, 63h, 64h, 65h, 66h, 67h, 68h, 69h, 6Ah, 6Bh, 6Ch, 6Dh, 6Eh, 6Fh
		db 70h, 71h, 72h, 73h, 74h, 75h, 76h, 77h, 78h, 79h, 7Ah, 7Bh, 7Ch, 7Dh, 7Eh, 7Fh
seg231		ends

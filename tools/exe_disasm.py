"""Désassemble une plage d'un exécutable DOS Borland sans fichier IDA (ex. OPTTEST.EXE du CD-ROM).

Les adresses sont des décalages dans l'image chargée (après l'en-tête MZ), comme les sub_XXXXX
d'IDA. Le segment de données (DGROUP) est lu dans la première instruction du point d'entrée
(`mov dx, DGROUP` du démarrage Borland) ; les opérandes immédiats qui pointent sur une chaîne du
DGROUP sont annotés, ainsi que la cible des appels lointains (segment × 16 + décalage).

Dépendance : capstone (`pip install capstone`), absente de la bibliothèque standard.
L'exécutable n'est jamais dans le dépôt.

Usage : python3 tools/exe_disasm.py <EXE> <début hex> <fin hex>
        python3 tools/exe_disasm.py <EXE> --refs <chaîne> ...   (où le code pousse cette chaîne)
"""
import re
import struct
import sys

import capstone


class Exe:
    def __init__(self, path):
        data = open(path, 'rb').read()
        header = struct.unpack_from('<H', data, 8)[0] * 16
        self.image = data[header:]
        entry_cs = struct.unpack_from('<H', data, 0x16)[0]
        entry_ip = struct.unpack_from('<H', data, 0x14)[0]
        entry = entry_cs * 16 + entry_ip
        if self.image[entry] != 0xBA:
            raise SystemExit('point d\'entrée inattendu : pas de « mov dx, DGROUP »')
        self.dgroup = struct.unpack_from('<H', self.image, entry + 1)[0] * 16

    def string(self, offset):
        start = self.dgroup + offset
        if start < 0 or start >= len(self.image):
            return None
        end = self.image.find(b'\0', start)
        text = self.image[start:end]
        if 2 <= len(text) < 80 and all(32 <= c < 127 for c in text):
            return text.decode()
        return None

    def disasm(self, start, end):
        md = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_16)
        md.skipdata = True
        for ins in md.disasm(self.image[start:end], start):
            note = ''
            m = re.search(r'0x([0-9a-f]+)$', ins.op_str)
            if ins.mnemonic in ('push', 'mov') and m and '[' not in ins.op_str:
                value = int(m.group(1), 16)
                text = self.string(value)
                if text and value > 0x100:
                    note = f'  ; "{text}"'
            if ins.mnemonic == 'lcall' and ins.bytes[0] == 0x9A:
                off, seg = struct.unpack_from('<HH', ins.bytes, 1)
                note = f'  ; -> {seg * 16 + off:05X}'
            print(f'{ins.address:05X}  {ins.mnemonic} {ins.op_str}{note}')

    def refs(self, text):
        raw = text.encode() + b'\0'
        at = self.image.find(raw, self.dgroup)
        while at >= 0:
            offset = at - self.dgroup
            pattern = b'\x68' + struct.pack('<H', offset)
            hits = [m.start() for m in re.finditer(re.escape(pattern), self.image)]
            print(f'{text!r} DGROUP:{offset:04X} poussé en ' + ', '.join(f'{h:05X}' for h in hits))
            at = self.image.find(raw, at + 1)


def main():
    if len(sys.argv) < 3:
        raise SystemExit(__doc__)
    exe = Exe(sys.argv[1])
    if sys.argv[2] == '--refs':
        for text in sys.argv[3:]:
            exe.refs(text)
    else:
        exe.disasm(int(sys.argv[2], 16), int(sys.argv[3], 16))


if __name__ == '__main__':
    main()

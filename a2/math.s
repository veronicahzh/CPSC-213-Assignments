.pos 0x100
                ld $d, r0                # load address of d into r0
                ld (r0), r1              # load value of d into r1
                ld $0x5, r2              # load address of 5 into r2
                mov r1, r3               # load value of d into r3 (another spot)
                add r2, r3               # r3 = d + 5
                shl $4, r3               # r3 = (d + 5) << 4
                and r1, r3               # r3 = ((d + 5) << 4) & d
                shr $4, r3               # r3 = r3 / 16
                ld $p, r4                # load address of p into r4
                st r3, (r4)              # store r3 into value of p
                halt                     # halt
.pos 0x1000
p:              .long 0xffffffff         # p
.pos 0x2000
d:              .long 0xffffffff         # d

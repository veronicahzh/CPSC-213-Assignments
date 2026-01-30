.pos 0x100
                ld $h, r0                # load base address of h into r0
                ld $n, r1                # load address of n into r1
                ld (r1), r1              # load value of n into r1
                ld (r0, r1, 4), r3       # load value of h[n] into r3
                ld $2, r4                # load value of 2 into r4
                add r1, r4               # r4 = n + 2
                ld (r0, r4, 4), r5       # load h[n + 2] into r5
                add r3, r5               # r5 = h[n] + h[n + 2]
                ld $s, r6                # load address of s into r6
                st r5, (r6)              # s = h[n] + h[n + 2]
                ld (r6), r6              # load value of s into r6
                ld $0xff00, r3           # load value 0xff00 into r3
                and r6, r3               # r3 = s & 0xff00
                ld $q, r4                # load address of q into r4
                st r3, (r4)              # q = s & 0xff00
                halt                     # halt
.pos 0x1000
n:              .long 0xffffffff         # n
.pos 0x1200
q:              .long 0xffffffff         # q
.pos 0x1400
s:              .long 0xffffffff         # s
.pos 0x2000
h:              .long 0xffffffff         # h[0]
                .long 0xffffffff         # h[1]
                .long 0xffffffff         # h[2]
                .long 0xffffffff         # h[3]
                .long 0xbbbbbbbb         # h[4]
                .long 0xeeeeeeee         # h[5]

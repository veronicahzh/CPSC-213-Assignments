.pos 0x100
                ld $i, r0         # r0 = &i
                ld (r0), r0       # r0 = i
                ld $n, r1         # r1 = &n
                ld (r1), r1       # r1 = n
                ld $c, r2         # r2 = &c
                ld (r2), r3       # r3 = c
                ld $a, r5         # r5 = &a[0]
                ld $b, r6         # r6 = &b[0]
                ld $0, r4         # r4 = 0
                st r4, (r3)       # c = 0
                st r4, (r0)       # i = 0
                not r1            # r1 = -n
                add r0, r1        # r1 = i - n
                loop:
                beq r1, end       # goto end if (i - n == 0)
                bgt r1, end       # goto end if (i - n > 0)
                ld (r5, r0, 4), r2       # r2 = a[i]
                ld (r6, r0, 4), r7       # r7 = b[i]
                not r7            # r7 = -b[i]
                add r2, r7        # r7 = a[i] - b[i]
                bgt r7, addC      # goto addC if (a[i] - b[i] > 0)
                br loop
                addC:
                inc r3            # r3 = c++
                br loop
                end:
                st r3, (r3)
                halt

.pos 0x1000
i:              .long 0x00        # i
n:              .long 0x00        # n
c:              .long 0x00        # c

.pos 0x2000
a:              .long 0x02        # a[0]
                .long 0x04        # a[1]
                .long 0x06        # a[2]
                .long 0x08        # a[3]
                .long 0x0a        # a[4]
                
.pos 0x3000
b:              .long 0xf2        # b[0]
                .long 0xf4        # b[1]
                .long 0xf6        # b[2]
                .long 0xf8        # b[3]
                .long 0xfa        # b[4]

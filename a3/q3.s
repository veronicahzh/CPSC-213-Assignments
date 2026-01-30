.pos 0x100
                    ld $a, r0                    # r0 = &a
                    ld $3, r7                    # r7 = 3
                    st r7, (r0)                  # a = 3
                    ld $p, r2                    # r2 = &p
                    st r0, (r2)                  # p = &a
                    ld (r2), r1                  # r1 = p
                    ld (r1), r4                  # r4 = *p = a
                    dec r4                       # r4 = r4 - 1
                    st r4, (r1)                  # *p = *p - 1
                    
                    ld $b, r5                    # r5 = &b[0]
                    st r5, (r2)                  # p = &b[0]
                    ld (r2), r3                  # r3 = p
                    inca r3                      # r3 = p + 4
                    st r3, (r2)                  # p++
                    ld (r0), r0                  # r0 = a
                    ld (r5, r0, 4), r6           # r6 = b[a]
                    st r6, (r3, r0, 4)           # p[a] = b[a]
                    
                    ld (r5), r6                  # r6 = b[0]
                    st r6, (r3, r7, 4)           # *(p + 3) = b[0] = b[4]
         
.pos 0x1000
a:                  .long 0xffffffff             # a
.pos 0x2000
p:                  .long 0xffffffff             # *p
.pos 0x3000
b:                  .long 0x00000000             # b[0]
                    .long 0x11111111             # b[1]
                    .long 0x22222222             # b[2]
                    .long 0x33333333             # b[3]
                    .long 0x44444444             # b[4]

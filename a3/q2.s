.pos 0x100
                  ld $tmp, r0               # r0 = &tmp
                  ld $tos, r1               # r1 = &tos
                  ld $0, r5                 # r5 = 0
                  st r5, (r0)               # tmp = 0
                  st r5, (r1)               # tos = 0
                  
                  ld (r1), r2               # r2 = tos
                  ld $s, r3                 # r3 = &s[0]
                  ld $a, r4                 # r4 = &a[0]
                  
                  ld (r4), r6               # r6 = a[0]
                  st r6, (r3, r2, 4)        # s[tos] = a[0]
                  inc r2                    # tos++
                  
                  ld $1, r5                 # r5 = 1
                  ld (r4, r5, 4), r6        # r6 = a[1]
                  st r6, (r3, r2, 4)        # s[tos] = a[1]
                  inc r2                    # tos++
                  
                  ld $2, r5                 # r5 = 2
                  ld (r4, r5, 4), r6        # r6 = a[2]
                  st r6, (r3, r2, 4)        # s[tos] = a[2]
                  inc r2                    # tos++
                  
                  dec r2                    # tos--
                  ld (r3, r2, 4), r6        # r6 = s[tos]
                  st r6, (r0)               # tmp = s[tos]
                  
                  dec r2                    # tos--
                  ld (r3, r2, 4), r6        # r6 = s[tos]
                  ld (r0), r7               # r7 = tmp
                  add r7, r6                # r6 = tmp + s[tos]
                  st r6, (r0)               # tmp = tmp + s[tos]
                  
                  dec r2                    # tos--
                  ld (r3, r2, 4), r6        # r6 = s[tos]
                  ld (r0), r7               # r7 = tmp
                  add r7, r6                # r6 = tmp + s[tos]
                  st r6, (r0)               # tmp = tmp + s[tos]
                  st r2, (r1)               # r1 = tos
                  halt                      # halt

.pos 0x1000
a:               .long 0xffffffff           # a[0]
                 .long 0xffffffff           # a[1]
                 .long 0xffffffff           # a[2]
.pos 0x2000
s:               .long 0xffffffff           # s[0]
                 .long 0xffffffff           # s[1]
                 .long 0xffffffff           # s[2]
                 .long 0xffffffff           # s[3]
                 .long 0xffffffff           # s[4]
.pos 0x3000
tos:             .long 0xffffffff           # tos
.pos 0x4000
tmp:             .long 0xffffffff           # tmp

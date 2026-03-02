.pos 0x100
                ld $0, r0       # r0 = 0 aka i
                ld $n, r1       # r1 = &n
                ld (r1), r1     # r1 = n
                not r1          # r1 = ~n
                inc r1          # r1 = -n (2s complement)
                ld $a, r2       # r2 = &a[0]
                ld $b, r3       # r3 = &b[0]
                ld $c, r4       # r4 = &c
                
                for:
                    mov r1, r5  # r5 = -n
                    add r0, r5  # r5 = i-n
                    beq r5, end # goto end if (i-n=0)
                    bgt r5, end # goto end if (i-n>0)
                    ld (r2, r0, 4), r6 # r6 = a[i]
                    ld (r3, r0, 4), r7 # r7 = b[i]
                    not r7             # r7 = ~b[i]
                    inc r7             # r7 = -b[i]
                    add r6, r7         # r7 = a[i] - b[i]
                    bgt r7, if_true    # goto if_true if (a[i]-b[i]>0)
                    inc r0             # i++
                    br for             # else goto for
                
                if_true:
                    ld (r4), r5 # r5 = c
                    inc r5      # r5 = c++
                    st r5, (r4) # c = r5 = c++
                    inc r0      # i++
                    br for      # goto for
                    
                end:
                    ld $i, r5   # r5 = &i
                    st r0, (r5) # store i
                    halt
                    

.pos 0x1000
i:              .long -1        # i
n:              .long 5        # n
c:              .long 0x00        # c

.pos 0x2000
a:              .long 10        # a[0]
                .long 20        # a[1]
                .long 30        # a[2]
                .long 40        # a[3]
                .long 50        # a[4]
                
.pos 0x3000
b:              .long 11        # b[0]
                .long 20        # b[1]
                .long 28        # b[2]
                .long 44        # b[3]
                .long 48        # b[4]

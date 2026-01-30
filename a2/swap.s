.pos 0x100
                ld $s, r0                # load address of s into r0
                ld $array, r1            # load base address of array into r1
                ld $0x5, r2              # load address of 0x5 into r2
                ld (r1, r2, 4), r3       # load value of array[5] into r3
                st r3, (r0)              # store value of r3 into s
                ld $0x4, r4              # load address of 0x4 into r4
                ld (r1, r4, 4), r5       # load value array[4] into r5
                st r5, (r1, r2, 4)       # store value of r5 into into array[5]
                st r3, (r1, r4, 4)       # store value of r3 into array[4]
                halt                     # halt
.pos 0x1000
s:              .long 0xffffffff         # s
.pos 0x2000
array:          .long 0xffffffff         # array[0]
                .long 0xffffffff         # array[1]
                .long 0xffffffff         # array[2]
                .long 0xffffffff         # array[3]
                .long 0xbbbbbbbb         # array[4]
                .long 0xeeeeeeee         # array[5]
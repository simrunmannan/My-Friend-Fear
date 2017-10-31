	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.arm
	.syntax divided
	.file	"sound.c"
	.text
	.align	2
	.global	setupSounds
	.type	setupSounds, %function
setupSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	mov	r0, #128
	mov	r1, #0
	ldr	r2, .L2
	strh	r0, [r3, #132]	@ movhi
	strh	r1, [r3, #128]	@ movhi
	strh	r2, [r3, #130]	@ movhi
	bx	lr
.L3:
	.align	2
.L2:
	.word	-1266
	.size	setupSounds, .-setupSounds
	.global	__aeabi_idiv
	.global	__aeabi_i2d
	.global	__aeabi_dmul
	.global	__aeabi_ddiv
	.global	__aeabi_d2iz
	.align	2
	.global	playSoundOne
	.type	playSoundOne, %function
playSoundOne:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r5, #0
	mov	r6, r2
	ldr	r2, .L6+8
	ldr	r2, [r2]
	ldr	r10, .L6+12
	mov	r8, r1
	mov	r7, r0
	mov	r9, r3
	str	r5, [r2, #20]
	mov	r1, r0
	ldr	r2, .L6+16
	mov	r3, #910163968
	mov	r0, #1
	ldr	r4, .L6+20
	mov	lr, pc
	bx	r4
	strh	r5, [r10, #2]	@ movhi
	mov	r1, r6
	ldr	r3, .L6+24
	mov	r0, #16777216
	mov	lr, pc
	bx	r3
	mov	r2, #128
	mov	r3, #1
	rsb	r0, r0, #0
	ldr	r4, .L6+28
	mov	r0, r0, asl #16
	mov	r0, r0, lsr #16
	strh	r0, [r10]	@ movhi
	strh	r2, [r10, #2]	@ movhi
	mov	r0, r8
	ldr	r10, .L6+32
	str	r9, [r4, #16]
	str	r8, [r4, #4]
	str	r6, [r4, #8]
	str	r3, [r4, #12]
	mov	lr, pc
	bx	r10
	ldr	r8, .L6+36
	adr	r3, .L6
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r8
	mov	r8, r0
	mov	r0, r6
	mov	r9, r1
	mov	lr, pc
	bx	r10
	ldr	r6, .L6+40
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	mov	lr, pc
	bx	r6
	ldr	r3, .L6+44
	mov	lr, pc
	bx	r3
	str	r7, [r4]
	str	r0, [r4, #20]
	str	r5, [r4, #28]
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L7:
	.align	3
.L6:
	.word	1443109011
	.word	1078844686
	.word	dma
	.word	67109120
	.word	67109024
	.word	DMANow
	.word	__aeabi_idiv
	.word	soundOne
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	__aeabi_d2iz
	.size	playSoundOne, .-playSoundOne
	.align	2
	.global	playSoundTwo
	.type	playSoundTwo, %function
playSoundTwo:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L16+8
	ldr	ip, [r4, #12]
	cmp	ip, #0
	beq	.L9
	ldr	ip, [r4, #24]
	ldr	lr, [sp, #40]
	cmp	ip, lr
	bgt	.L8
.L9:
	mov	r10, #0
	mov	r5, r2
	mov	r8, r3
	ldr	r3, .L16+12
	ldr	r3, [r3]
	ldr	r9, .L16+16
	mov	r7, r1
	ldr	r2, .L16+20
	mov	r1, r0
	mov	r6, r0
	str	r10, [r3, #32]
	mov	r0, #2
	mov	r3, #910163968
	ldr	fp, .L16+24
	mov	lr, pc
	bx	fp
	mov	r1, r5
	strh	r10, [r9, #6]	@ movhi
	ldr	r3, .L16+28
	mov	r0, #16777216
	mov	lr, pc
	bx	r3
	mov	r2, #128
	mov	r3, #1
	rsb	r0, r0, #0
	mov	r0, r0, asl #16
	mov	r0, r0, lsr #16
	strh	r0, [r9, #4]	@ movhi
	ldr	fp, .L16+32
	strh	r2, [r9, #6]	@ movhi
	mov	r0, r7
	str	r7, [r4, #4]
	str	r5, [r4, #8]
	str	r8, [r4, #16]
	str	r3, [r4, #12]
	mov	lr, pc
	bx	fp
	ldr	r7, .L16+36
	adr	r3, .L16
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r7
	mov	r8, r0
	mov	r0, r5
	mov	r9, r1
	mov	lr, pc
	bx	fp
	ldr	r5, .L16+40
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	mov	lr, pc
	bx	r5
	ldr	r3, .L16+44
	mov	lr, pc
	bx	r3
	ldr	r3, [sp, #40]
	str	r10, [r4, #28]
	str	r0, [r4, #20]
	str	r6, [r4]
	str	r3, [r4, #24]
.L8:
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L17:
	.align	3
.L16:
	.word	1443109011
	.word	1078844686
	.word	soundTwo
	.word	dma
	.word	67109120
	.word	67109028
	.word	DMANow
	.word	__aeabi_idiv
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	__aeabi_d2iz
	.size	playSoundTwo, .-playSoundTwo
	.align	2
	.global	interruptHandler
	.type	interruptHandler, %function
interruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	ldr	r3, .L35
	ldrh	r1, [r3, #2]
	tst	r1, #1
	strh	r2, [r3, #8]	@ movhi
	beq	.L32
	str	lr, [sp, #-4]!
	ldr	r0, .L35+4
	ldr	r3, [r0, #12]
	cmp	r3, r2
	sub	sp, sp, #12
	beq	.L21
	ldr	r3, [r0, #28]
	ldr	r2, [r0, #20]
	add	r3, r3, #1
	cmp	r3, r2
	str	r3, [r0, #28]
	ble	.L21
	ldr	r3, [r0, #16]
	cmp	r3, #0
	bne	.L33
	ldr	r1, .L35+8
	ldr	r2, .L35+12
	ldr	r1, [r1]
	str	r3, [r0, #12]
	str	r3, [r1, #20]
	strh	r3, [r2, #2]	@ movhi
.L21:
	ldr	ip, .L35+16
	ldr	r3, [ip, #12]
	cmp	r3, #0
	beq	.L25
	ldr	r3, [ip, #28]
	ldr	r2, [ip, #20]
	add	r3, r3, #1
	cmp	r3, r2
	str	r3, [ip, #28]
	ble	.L25
	ldr	r3, [ip, #16]
	cmp	r3, #0
	bne	.L34
	ldr	r1, .L35+8
	ldr	r2, .L35+12
	ldr	r1, [r1]
	str	r3, [ip, #12]
	str	r3, [r1, #32]
	strh	r3, [r2, #6]	@ movhi
.L25:
	mov	r2, #1
	ldr	r3, .L35
	strh	r2, [r3, #2]	@ movhi
	mov	r2, #1
	ldr	r3, .L35
	strh	r2, [r3, #8]	@ movhi
	add	sp, sp, #12
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
.L32:
	mov	r2, #1
	ldr	r3, .L35
	strh	r2, [r3, #8]	@ movhi
	bx	lr
.L33:
	ldmia	r0, {r0, r1, r2}
	bl	playSoundOne
	b	.L21
.L34:
	ldmia	ip, {r0, r1, r2}
	ldr	ip, [ip, #24]
	str	ip, [sp]
	bl	playSoundTwo
	b	.L25
.L36:
	.align	2
.L35:
	.word	67109376
	.word	soundOne
	.word	dma
	.word	67109120
	.word	soundTwo
	.size	interruptHandler, .-interruptHandler
	.align	2
	.global	pauseSound
	.type	pauseSound, %function
pauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r2, .L38
	ldr	r0, .L38+4
	ldr	r1, .L38+8
	str	r3, [r0, #12]
	str	r3, [r1, #12]
	strh	r3, [r2, #2]	@ movhi
	strh	r3, [r2, #6]	@ movhi
	bx	lr
.L39:
	.align	2
.L38:
	.word	67109120
	.word	soundOne
	.word	soundTwo
	.size	pauseSound, .-pauseSound
	.align	2
	.global	unpauseSound
	.type	unpauseSound, %function
unpauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #128
	mov	r3, #1
	ldr	r2, .L41
	ldr	ip, .L41+4
	ldr	r0, .L41+8
	strh	r1, [r2, #2]	@ movhi
	str	r3, [ip, #12]
	strh	r1, [r2, #6]	@ movhi
	str	r3, [r0, #12]
	bx	lr
.L42:
	.align	2
.L41:
	.word	67109120
	.word	soundOne
	.word	soundTwo
	.size	unpauseSound, .-unpauseSound
	.align	2
	.global	stopSound
	.type	stopSound, %function
stopSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r2, .L44
	ldr	ip, .L44+4
	ldr	r1, [r2]
	ldr	r0, .L44+8
	ldr	r2, .L44+12
	str	r3, [r1, #20]
	str	r3, [ip, #12]
	str	r3, [r1, #32]
	str	r3, [r0, #12]
	strh	r3, [r2, #2]	@ movhi
	strh	r3, [r2, #6]	@ movhi
	bx	lr
.L45:
	.align	2
.L44:
	.word	dma
	.word	soundOne
	.word	soundTwo
	.word	67109120
	.size	stopSound, .-stopSound
	.align	2
	.global	setupInterrupts
	.type	setupInterrupts, %function
setupInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #67108864
	stmfd	sp!, {r4, lr}
	mov	r4, #1
	ldr	r3, .L48
	ldrh	r1, [r0, #4]
	ldrh	r2, [r3]
	ldr	lr, .L48+4
	ldr	ip, .L48+8
	orr	r2, r2, r4
	orr	r1, r1, #8
	strh	r1, [r0, #4]	@ movhi
	strh	r4, [r3, #8]	@ movhi
	strh	r2, [r3]	@ movhi
	str	lr, [ip, #4092]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L49:
	.align	2
.L48:
	.word	67109376
	.word	interruptHandler
	.word	50360320
	.size	setupInterrupts, .-setupInterrupts
	.comm	soundTwo,32,4
	.comm	soundOne,32,4
	.ident	"GCC: (devkitARM release 45) 5.3.0"

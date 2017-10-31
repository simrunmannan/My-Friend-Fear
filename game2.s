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
	.file	"game2.c"
	.text
	.align	2
	.global	init2
	.type	init2, %function
init2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r0, #32
	mov	lr, #0
	mov	r5, #1
	mov	fp, #4
	mov	r10, #64
	mov	r9, #36
	mov	r8, #50
	mov	r7, #80
	mov	r6, #110
	ldr	ip, .L6
	str	r0, [ip, #12]
	str	lr, [ip, #4]
	str	fp, [ip]
	str	lr, [ip, #24]
	str	r10, [ip, #8]
	str	lr, [ip, #20]
	str	lr, [ip, #32]
	str	r5, [ip, #28]
	str	r5, [ip, #36]
	ldr	ip, .L6+4
	str	r0, [ip]
	stmib	ip, {r0, r9}
	str	r8, [ip, #12]
	str	lr, [ip, #24]
	ldr	ip, .L6+8
	ldr	lr, .L6+12
	str	r0, [ip, #4]
	str	r0, [ip]
	str	r7, [ip, #16]
	str	r6, [ip, #12]
	ldr	ip, .L6+16
	mov	r4, #100
	ldr	r2, .L6+20
	mov	r1, r0
	str	r0, [ip, #4]
	str	r0, [ip]
	str	r0, [lr, #4]
	str	r0, [lr]
	mov	r0, #120
	mov	r3, r2
	str	r4, [lr, #12]
	str	r4, [ip, #16]
	str	r4, [ip, #12]
	str	r0, [lr, #16]
	add	r0, r2, #240
.L2:
	str	r1, [r3]
	str	r1, [r3, #4]
	add	r3, r3, #20
	cmp	r3, r0
	bne	.L2
	mov	r3, #116
	mov	r1, #80
	mov	lr, #105
	mov	ip, #106
	mov	r0, #88
	mov	r5, #89
	mov	r4, #90
	mov	r6, #1
	str	r1, [r2, #8]
	str	r1, [r2, #28]
	str	r1, [r2, #48]
	str	r1, [r2, #68]
	str	r3, [r2, #12]
	str	r3, [r2, #32]
	str	r3, [r2, #52]
	str	r3, [r2, #72]
	str	r3, [r2, #92]
	str	r3, [r2, #112]
	str	r3, [r2, #132]
	str	lr, [r2, #88]
	str	lr, [r2, #108]
	str	lr, [r2, #128]
	str	ip, [r2, #148]
	str	ip, [r2, #168]
	str	ip, [r2, #188]
	str	r0, [r2, #152]
	str	r0, [r2, #172]
	str	r0, [r2, #192]
	str	r5, [r2, #208]
	str	r5, [r2, #228]
	str	r4, [r2, #212]
	str	r4, [r2, #232]
	str	r6, [r2, #16]
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L7:
	.align	2
.L6:
	.word	player1
	.word	detonator
	.word	crack1
	.word	crack3
	.word	crack2
	.word	hands
	.size	init2, .-init2
	.align	2
	.global	draw2
	.type	draw2, %function
draw2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L50
	ldr	r2, [r3, #36]
	cmp	r2, #0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	beq	.L9
	ldr	r2, [r3, #20]
	cmp	r2, #0
	ldr	r2, [r3, #4]
	mvn	r2, r2, asl #18
	bne	.L10
	mov	r1, #512
	mov	r0, #128
	mvn	r2, r2, lsr #18
	ldr	lr, .L50+4
	ldr	r3, [r3]
	strh	r2, [lr, #10]	@ movhi
	strh	r3, [lr, #8]	@ movhi
	strh	r0, [lr, #12]	@ movhi
	strh	r1, [lr, #16]	@ movhi
	strh	r1, [lr, #24]	@ movhi
	strh	r1, [lr, #32]	@ movhi
	b	.L11
.L9:
	ldr	r2, [r3, #32]
	cmp	r2, #0
	bne	.L48
	ldr	lr, .L50+4
.L11:
	ldr	r2, .L50+8
	ldr	r3, [r2, #12]
	mvn	r3, r3, asl #17
	ldr	r1, [r2, #20]
	mvn	r3, r3, lsr #17
	ldr	r2, [r2, #8]
	cmp	r1, #0
	strh	r2, [lr, #40]	@ movhi
	mov	r5, #0
	movne	r2, #532
	moveq	r2, #528
	strh	r3, [lr, #42]	@ movhi
	ldr	r3, .L50+4
	mov	r8, r5
	strh	r2, [r3, #44]	@ movhi
	mov	r6, r5
	mov	r3, #640
	mov	r1, r5
	ldrh	r7, [lr, #48]
	ldrh	r0, [lr, #50]
	ldrh	ip, [lr, #52]
	ldr	r2, .L50+12
.L16:
	ldr	r4, [r2, #16]
	cmp	r4, #0
	beq	.L15
	mov	r5, #1
	cmp	r1, #6
	add	ip, r3, #100
	mov	ip, ip, asl #16
	mov	r8, r5
	movle	ip, r3
	mov	r6, r5
	ldr	r0, [r2, #12]
	mov	r0, r0, asl #16
	orr	r0, r0, #-2147483648
	ldrh	r7, [r2, #8]
	mov	r0, r0, lsr #16
	movgt	ip, ip, lsr #16
.L15:
	add	r3, r3, #4
	add	r1, r1, #1
	mov	r3, r3, asl #16
	cmp	r1, #12
	mov	r3, r3, lsr #16
	add	r2, r2, #20
	bne	.L16
	ldr	r2, .L50+16
	cmp	r6, #0
	strneh	ip, [lr, #52]	@ movhi
	ldr	r3, [r2, #8]
	cmp	r8, #0
	strneh	r7, [lr, #48]	@ movhi
	cmp	r5, #0
	strneh	r0, [lr, #50]	@ movhi
	cmp	r3, #0
	beq	.L20
	ldr	r3, [r2, #12]
	mvn	r3, r3, asl #17
	mov	r1, #400
	mvn	r3, r3, lsr #17
	ldr	r2, [r2, #16]
	strh	r3, [lr, #58]	@ movhi
	strh	r2, [lr, #56]	@ movhi
	strh	r1, [lr, #60]	@ movhi
.L20:
	ldr	r2, .L50+20
	ldr	r3, [r2, #8]
	cmp	r3, #0
	beq	.L21
	ldr	r3, [r2, #12]
	mvn	r3, r3, asl #17
	mov	r1, #404
	mvn	r3, r3, lsr #17
	ldr	r2, [r2, #16]
	strh	r3, [lr, #66]	@ movhi
	strh	r2, [lr, #64]	@ movhi
	strh	r1, [lr, #68]	@ movhi
.L21:
	ldr	r2, .L50+24
	ldr	r3, [r2, #8]
	cmp	r3, #0
	beq	.L22
	ldr	r3, [r2, #12]
	mvn	r3, r3, asl #17
	mov	r1, #408
	mvn	r3, r3, lsr #17
	ldr	r2, [r2, #16]
	strh	r3, [lr, #74]	@ movhi
	strh	r2, [lr, #72]	@ movhi
	strh	r1, [lr, #76]	@ movhi
.L22:
	ldr	r4, .L50+28
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L50+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L48:
	ldr	r2, [r3, #24]
	cmp	r2, #0
	ldr	r2, [r3, #4]
	mvn	r2, r2, asl #18
	bne	.L12
	mov	r1, #512
	mov	r0, #144
	mvn	r2, r2, lsr #18
	ldr	lr, .L50+4
	ldr	r3, [r3]
	strh	r2, [lr, #26]	@ movhi
	strh	r3, [lr, #24]	@ movhi
	strh	r0, [lr, #28]	@ movhi
	strh	r1, [lr, #8]	@ movhi
	strh	r1, [lr, #16]	@ movhi
	strh	r1, [lr, #32]	@ movhi
	b	.L11
.L10:
	mov	r1, #512
	mov	r0, #136
	mvn	r2, r2, lsr #18
	ldr	lr, .L50+4
	ldr	r3, [r3]
	strh	r2, [lr, #18]	@ movhi
	strh	r3, [lr, #16]	@ movhi
	strh	r0, [lr, #20]	@ movhi
	strh	r1, [lr, #8]	@ movhi
	strh	r1, [lr, #24]	@ movhi
	strh	r1, [lr, #32]	@ movhi
	b	.L11
.L12:
	mov	r1, #512
	mov	r0, #152
	mvn	r2, r2, lsr #18
	ldr	lr, .L50+4
	ldr	r3, [r3]
	strh	r2, [lr, #34]	@ movhi
	strh	r3, [lr, #32]	@ movhi
	strh	r0, [lr, #36]	@ movhi
	strh	r1, [lr, #8]	@ movhi
	strh	r1, [lr, #16]	@ movhi
	strh	r1, [lr, #24]	@ movhi
	b	.L11
.L51:
	.align	2
.L50:
	.word	player1
	.word	shadowOAM
	.word	detonator
	.word	hands
	.word	crack1
	.word	crack2
	.word	crack3
	.word	DMANow
	.size	draw2, .-draw2
	.align	2
	.global	checkDetonatorCollision
	.type	checkDetonatorCollision, %function
checkDetonatorCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r1, #20]
	cmp	r3, #0
	beq	.L53
	ldr	r3, [r0, #12]
	ldr	r2, [r1, #4]
	sub	ip, r3, #32
	cmp	r2, ip
	bge	.L63
.L53:
	ldr	r3, [r1, #24]
	cmp	r3, #0
	beq	.L54
	ldr	r2, [r1, #4]
	ldr	r3, [r0, #12]
	cmp	r2, r3
	blt	.L56
	add	r3, r3, #10
	cmp	r2, r3
	bgt	.L56
	mov	r1, #1
	mov	r3, #2
	ldr	r2, .L64
	str	r1, [r2, #20]
.L54:
	mov	r0, r3
	bx	lr
.L63:
	sub	r3, r3, #19
	cmp	r2, r3
	bge	.L53
	mov	r2, #1
	ldr	r1, .L64
	mov	r3, r2
	str	r2, [r1, #20]
	b	.L54
.L56:
	mov	r3, #0
	mov	r0, r3
	bx	lr
.L65:
	.align	2
.L64:
	.word	detonator
	.size	checkDetonatorCollision, .-checkDetonatorCollision
	.global	__aeabi_idivmod
	.align	2
	.global	update2
	.type	update2, %function
update2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r3, [r3, #304]
	tst	r3, #32
	sub	sp, sp, #8
	ldr	r5, .L114
	beq	.L101
	ldr	r4, .L114+4
	ldr	r6, .L114+8
.L67:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #16
	bne	.L69
	ldr	r3, [r5, #4]
	cmp	r3, #260
	ble	.L106
.L69:
	ldr	r3, .L114+12
	ldr	r3, [r3]
	tst	r3, #64
	beq	.L71
	ldr	r3, .L114+16
	ldr	r3, [r3]
	ands	r7, r3, #64
	beq	.L107
.L71:
	mov	r3, #40
	str	r3, [r5, #12]
.L73:
	ldr	r5, .L114+4
	ldr	r1, .L114
	mov	r0, r5
	bl	checkDetonatorCollision
	ldr	r3, [r6]
	cmp	r3, #3
	ldr	r2, .L114+8
	beq	.L108
.L74:
	ldr	r0, .L114+20
	ldr	r1, [r0]
	ldr	r3, .L114+24
	add	r1, r1, #1
	smull	r2, r3, r1, r3
	mov	r2, r1, asr #31
	rsb	r3, r2, r3, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	subs	r3, r1, r3, asl #2
	str	r1, [r0]
	beq	.L109
	ldr	r3, [r4, #24]
	cmp	r3, #4
	beq	.L110
.L66:
	add	sp, sp, #8
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L101:
	ldr	r3, [r5, #4]
	cmp	r3, #0
	ldr	r4, .L114+4
	ldrle	r6, .L114+8
	ble	.L67
	ldr	r2, [r4, #20]
	cmp	r2, #0
	movne	r1, #0
	ldrne	r6, .L114+8
	ldrne	r2, [r6]
	addne	r2, r2, #1
	strne	r2, [r6]
	strne	r1, [r4, #20]
	mov	r2, #0
	mov	r1, #1
	sub	r3, r3, #1
	ldreq	r6, .L114+8
	str	r3, [r5, #4]
	str	r1, [r5, #32]
	str	r2, [r5, #36]
	str	r2, [r5, #20]
	str	r2, [r5, #24]
	b	.L67
.L106:
	ldr	r2, [r4, #20]
	cmp	r2, #0
	movne	r0, #0
	ldrne	r2, [r6]
	ldr	r1, .L114+4
	addne	r2, r2, #1
	strne	r0, [r1, #20]
	mov	r1, #1
	strne	r2, [r6]
	mov	r2, #0
	add	r3, r3, r1
	str	r3, [r5, #4]
	str	r1, [r5, #36]
	str	r2, [r5, #32]
	str	r2, [r5, #24]
	str	r2, [r5, #20]
	b	.L69
.L109:
	mov	r2, #1
	ldr	r5, .L114+28
	str	r2, [sp]
	mov	r1, #1200
	ldr	r2, .L114+32
	ldr	r0, .L114+36
	ldr	r6, .L114+40
	mov	lr, pc
	bx	r6
	ldr	r3, [r5]
	cmp	r3, #11
	bgt	.L111
.L79:
	cmp	r3, #11
	beq	.L112
	mov	ip, #1
	mov	r0, #0
	add	r2, r3, ip
	ldr	r1, .L114+44
	add	r2, r2, r2, lsl #2
	add	r3, r3, r3, lsl #2
	add	r2, r1, r2, lsl #2
	add	r3, r1, r3, lsl #2
	str	ip, [r2, #16]
	str	r0, [r3, #16]
.L82:
	ldr	r3, [r5]
	add	r3, r3, #1
	str	r3, [r5]
	ldr	r3, [r4, #24]
	cmp	r3, #4
	bne	.L66
.L110:
	ldr	r3, .L114+48
	mov	lr, pc
	bx	r3
	add	sp, sp, #8
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L108:
	mov	r3, #0
	ldr	ip, [r5, #24]
	add	ip, ip, #1
	cmp	ip, #1
	str	r3, [r2]
	str	ip, [r5, #24]
	mov	r2, #99
	beq	.L113
	mov	lr, #1
	cmp	ip, #2
	ldreq	ip, .L114+52
	ldrne	ip, .L114+56
	str	r2, [sp]
	ldr	r1, .L114+60
	ldr	r2, .L114+32
	ldr	r0, .L114+64
	ldr	r5, .L114+40
	str	lr, [ip, #8]
	mov	lr, pc
	bx	r5
.L76:
	ldr	r3, .L114+68
	mov	lr, pc
	bx	r3
	ldr	r1, [r4, #4]
	ldr	r3, .L114+72
	rsb	r1, r1, #240
	mov	lr, pc
	bx	r3
	str	r1, [r4, #12]
	b	.L74
.L107:
	mov	ip, #34
	str	r7, [sp]
	mov	r3, r7
	ldr	r2, .L114+32
	ldr	r1, .L114+76
	ldr	r0, .L114+80
	ldr	r8, .L114+40
	str	ip, [r5, #12]
	mov	lr, pc
	bx	r8
	ldr	r2, [r5, #36]
	cmp	r2, #0
	ldr	r3, .L114
	beq	.L72
	mov	r2, #1
	str	r7, [r3, #24]
	str	r2, [r3, #20]
	b	.L73
.L112:
	mov	r1, #1
	mov	r2, #0
	ldr	r3, .L114+44
	str	r1, [r3, #16]
	str	r2, [r3, #236]
	b	.L82
.L111:
	ldr	r6, .L114+84
	mov	lr, pc
	bx	r6
	ldr	r3, [r5]
	cmp	r3, #11
	ble	.L79
	mov	lr, pc
	bx	r6
	ldr	r3, .L114+88
	mov	lr, pc
	bx	r3
	b	.L82
.L72:
	ldr	r1, [r3, #32]
	cmp	r1, #0
	movne	r1, #1
	strne	r2, [r3, #20]
	strne	r1, [r3, #24]
	b	.L73
.L113:
	ldr	lr, .L114+92
	str	r2, [sp]
	ldr	r1, .L114+60
	ldr	r2, .L114+32
	ldr	r0, .L114+64
	ldr	r5, .L114+40
	str	ip, [lr, #8]
	mov	lr, pc
	bx	r5
	b	.L76
.L115:
	.align	2
.L114:
	.word	player1
	.word	detonator
	.word	.LANCHOR0
	.word	oldButtons
	.word	buttons
	.word	timer1
	.word	1374389535
	.word	handActive
	.word	11025
	.word	ticking
	.word	playSoundTwo
	.word	hands
	.word	goToWin
	.word	crack2
	.word	crack3
	.word	14609
	.word	crack
	.word	rand
	.word	__aeabi_idivmod
	.word	4200
	.word	Umbrella
	.word	stopSound
	.word	goToLose
	.word	crack1
	.size	update2, .-update2
	.comm	shadowOAM,1024,4
	.comm	crack3,20,4
	.comm	crack2,20,4
	.comm	crack1,20,4
	.comm	handActive,4,4
	.comm	timer1,4,4
	.comm	hands,240,4
	.comm	randomNum2,4,4
	.global	hitNum
	.comm	detonator,28,4
	.comm	player1,40,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	hitNum, %object
	.size	hitNum, 4
hitNum:
	.space	4
	.ident	"GCC: (devkitARM release 45) 5.3.0"

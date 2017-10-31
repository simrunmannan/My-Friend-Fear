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
	.file	"game.c"
	.text
	.align	2
	.global	hideSprites
	.type	hideSprites, %function
hideSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	mov	r1, #512
	ldr	r2, .L5
.L2:
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L2
	bx	lr
.L6:
	.align	2
.L5:
	.word	shadowOAM
	.size	hideSprites, .-hideSprites
	.align	2
	.global	init
	.type	init, %function
init:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, lr}
	mov	ip, r0
	mov	r4, #32
	mov	lr, r0
	mov	r5, #1
	ldr	r3, .L13
.L10:
	cmp	r0, #5
	cmpne	r0, #2
	add	r1, ip, ip, lsl #4
	mov	r2, lr, asl #5
	mov	r1, r1, asl #2
	add	r0, r0, #1
	add	r1, r1, #36
	add	r2, r2, #73
	addeq	lr, lr, #1
	moveq	ip, #0
	addne	ip, ip, #1
	cmp	r0, #9
	str	r4, [r3, #-8]
	str	r4, [r3, #-4]
	str	r5, [r3, #12]
	str	r1, [r3, #4]
	str	r2, [r3]
	add	r3, r3, #28
	bne	.L10
	mov	r2, #8
	mov	lr, #64
	mov	r5, #67108864
	mov	r8, #200
	mov	r1, #0
	mov	r9, #7
	mov	r0, #1
	mov	r7, #20
	mov	ip, #32
	mvn	r6, #0
	ldr	r3, .L13+4
	ldr	r4, .L13+8
	str	r2, [r3]
	ldr	r2, .L13+12
	str	lr, [r3, #8]
	str	lr, [r2]
	ldrh	lr, [r4]
	strh	lr, [r5, #16]	@ movhi
	ldr	lr, .L13+16
	str	r8, [r2, #12]
	ldrh	r8, [lr]
	str	r9, [r2, #8]
	str	r1, [r3, #4]
	strh	r8, [r5, #18]	@ movhi
	str	r1, [r4]
	str	r1, [r3, #20]
	str	r1, [r3, #32]
	str	r1, [r3, #24]
	str	r1, [r2, #24]
	str	r1, [r2, #32]
	ldr	r1, .L13+20
	str	r7, [lr]
	str	r6, [r1]
	str	r0, [r3, #28]
	str	r0, [r3, #36]
	str	r0, [r2, #20]
	str	r0, [r2, #28]
	str	ip, [r3, #12]
	str	ip, [r2, #4]
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L14:
	.align	2
.L13:
	.word	eyes+8
	.word	player
	.word	hOff
	.word	enemy
	.word	vOff
	.word	eyeClose
	.size	init, .-init
	.align	2
	.global	draw
	.type	draw, %function
draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L44
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r1, r2
	mov	r5, #20
	ldr	r3, .L44+4
	add	r0, r2, #2
	add	r4, r2, #72
.L18:
	ldr	ip, [r3, #20]
	cmp	ip, #0
	ldr	ip, [r3, #12]
	mvn	ip, ip, asl #17
	mvn	ip, ip, lsr #17
	ldrne	lr, [r3, #24]
	ldrne	r6, [r3, #8]
	ldreq	lr, [r3, #8]
	movne	lr, lr, asl #2
	strneh	r6, [r0, #-2]	@ movhi
	streqh	lr, [r0, #-2]	@ movhi
	strneh	ip, [r1, #2]	@ movhi
	strneh	lr, [r1, #4]	@ movhi
	streqh	ip, [r1, #2]	@ movhi
	streqh	r5, [r1, #4]	@ movhi
	add	r1, r1, #8
	cmp	r1, r4
	add	r3, r3, #28
	add	r0, r0, #8
	bne	.L18
	ldr	r3, .L44+8
	ldr	r1, [r3, #36]
	cmp	r1, #0
	beq	.L19
	ldr	r1, [r3, #20]
	cmp	r1, #0
	ldr	r1, [r3, #4]
	mvn	r1, r1, asl #18
	mov	r0, #512
	mvn	r1, r1, lsr #18
	bne	.L20
	mov	ip, #128
	ldr	r3, [r3]
	strh	r1, [r2, #74]	@ movhi
	strh	r3, [r2, #72]	@ movhi
	strh	r0, [r2, #80]	@ movhi
	strh	r0, [r2, #88]	@ movhi
	strh	r0, [r2, #96]	@ movhi
	strh	ip, [r2, #76]	@ movhi
.L21:
	ldr	r3, .L44+12
	ldr	r1, [r3, #28]
	cmp	r1, #0
	beq	.L23
	ldr	r1, [r3, #12]
	mov	r1, r1, asl #23
	mvn	r1, r1, lsr #5
	mov	lr, #512
	mvn	r1, r1, lsr #18
	mov	ip, #384
	ldrb	r0, [r3, #8]	@ zero_extendqisi2
	strh	r1, [r2, #106]	@ movhi
	strh	lr, [r2, #112]	@ movhi
	strh	ip, [r2, #108]	@ movhi
	strh	r0, [r2, #104]	@ movhi
.L23:
	ldr	r1, [r3, #24]
	cmp	r1, #0
	ldr	r0, .L44+12
	beq	.L24
	ldr	r1, [r0, #12]
	mov	r1, r1, asl #23
	mvn	r1, r1, lsr #5
	mov	lr, #512
	mvn	r1, r1, lsr #18
	mov	ip, #392
	ldrb	r0, [r0, #8]	@ zero_extendqisi2
	strh	r1, [r2, #114]	@ movhi
	strh	r0, [r2, #112]	@ movhi
	strh	lr, [r2, #104]	@ movhi
	strh	ip, [r2, #116]	@ movhi
.L24:
	ldr	r3, [r3, #20]
	cmp	r3, #0
	moveq	r3, #512
	streqh	r3, [r2, #104]	@ movhi
	streqh	r3, [r2, #112]	@ movhi
	ldr	r3, .L44+16
	ldr	r3, [r3]
	cmp	r3, #0
	movne	r3, #0
	movne	r1, #512
	beq	.L43
.L27:
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L27
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L44
	mov	r0, #3
	ldr	r4, .L44+20
	mov	lr, pc
	bx	r4
.L26:
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L44
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L19:
	ldr	r1, [r3, #32]
	cmp	r1, #0
	beq	.L21
	ldr	r1, [r3, #24]
	cmp	r1, #0
	ldr	r1, [r3, #4]
	mvn	r1, r1, asl #18
	mov	r0, #512
	mvn	r1, r1, lsr #18
	bne	.L22
	mov	ip, #144
	ldr	r3, [r3]
	strh	r1, [r2, #90]	@ movhi
	strh	r3, [r2, #88]	@ movhi
	strh	r0, [r2, #72]	@ movhi
	strh	r0, [r2, #80]	@ movhi
	strh	r0, [r2, #96]	@ movhi
	strh	ip, [r2, #92]	@ movhi
	b	.L21
.L20:
	mov	ip, #136
	ldr	r3, [r3]
	strh	r1, [r2, #82]	@ movhi
	strh	r3, [r2, #80]	@ movhi
	strh	r0, [r2, #72]	@ movhi
	strh	r0, [r2, #88]	@ movhi
	strh	r0, [r2, #96]	@ movhi
	strh	ip, [r2, #84]	@ movhi
	b	.L21
.L22:
	mov	ip, #152
	ldr	r3, [r3]
	strh	r1, [r2, #98]	@ movhi
	strh	r3, [r2, #96]	@ movhi
	strh	r0, [r2, #72]	@ movhi
	strh	r0, [r2, #80]	@ movhi
	strh	r0, [r2, #88]	@ movhi
	strh	ip, [r2, #100]	@ movhi
	b	.L21
.L43:
	ldr	r4, .L44+20
	b	.L26
.L45:
	.align	2
.L44:
	.word	shadowOAM
	.word	eyes
	.word	player
	.word	enemy
	.word	game2
	.word	DMANow
	.size	draw, .-draw
	.align	2
	.global	initRain
	.type	initRain, %function
initRain:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #0
	mov	r2, #100
	mov	r3, #67108864
	ldr	ip, .L47
	ldr	r0, .L47+4
	str	r1, [ip]
	str	r2, [r0]
	strh	r1, [r3, #16]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	bx	lr
.L48:
	.align	2
.L47:
	.word	hOff
	.word	vOff
	.size	initRain, .-initRain
	.align	2
	.global	updateRain
	.type	updateRain, %function
updateRain:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #67108864
	ldr	r0, .L50
	ldr	r3, [r0]
	mov	r2, r3, asl #16
	add	r3, r3, #1
	str	r3, [r0]
	ldr	r0, .L50+4
	ldr	r3, [r0]
	mov	r2, r2, lsr #16
	strh	r2, [r1, #16]	@ movhi
	mov	r2, r3, asl #16
	mov	r2, r2, lsr #16
	add	r3, r3, #1
	str	r3, [r0]
	strh	r2, [r1, #18]	@ movhi
	bx	lr
.L51:
	.align	2
.L50:
	.word	hOff
	.word	vOff
	.size	updateRain, .-updateRain
	.align	2
	.global	collisionplayerenemy
	.type	collisionplayerenemy, %function
collisionplayerenemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #20]
	cmp	r3, #0
	beq	.L53
	ldr	ip, [r1, #4]
	ldr	r3, [r1, #12]
	ldr	r2, [r0, #12]
	add	r3, ip, r3
	sub	r3, r3, #9
	cmp	r3, r2
	ble	.L57
	ldr	r3, [r0, #4]
	add	r2, r2, r3
	cmp	ip, r2
	bgt	.L57
	ldr	r3, [r1, #20]
	cmp	r3, #0
	beq	.L54
	ldr	r3, [r0, #28]
	cmp	r3, #0
	movne	r3, #1
	bne	.L53
.L54:
	ldr	r3, [r1, #24]
	cmp	r3, #0
	beq	.L55
	ldr	r3, [r0, #24]
	cmp	r3, #0
	movne	r3, #2
	beq	.L55
.L53:
	mov	r0, r3
	bx	lr
.L57:
	mov	r3, #0
	mov	r0, r3
	bx	lr
.L55:
	ldr	r3, [r1, #32]
	cmp	r3, #0
	movne	r3, #3
	bne	.L53
	ldr	r3, [r1, #36]
	cmp	r3, #0
	movne	r3, #3
	b	.L53
	.size	collisionplayerenemy, .-collisionplayerenemy
	.align	2
	.global	update
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L143
	ldr	r5, .L143+4
	ldr	r2, [r4, #4]
	sub	sp, sp, #12
	mov	r3, r5
	mov	fp, #3
	mov	r10, #2
	mov	r9, #1
	mov	r7, #0
	add	r1, r5, #252
	sub	ip, r2, #49
	sub	lr, r2, #97
	sub	r8, r2, #193
	sub	r6, r2, #145
	b	.L78
.L137:
	ldr	r0, [r3, #20]
	cmp	r0, #0
	strne	r10, [r3, #24]
	bne	.L74
.L77:
	cmp	r8, #47
	bhi	.L74
	ldr	r0, [r3, #20]
	cmp	r0, #0
	movne	r0, #4
	strne	r0, [r3, #24]
.L74:
	add	r3, r3, #28
	cmp	r1, r3
	beq	.L136
.L78:
	cmp	r2, #48
	bgt	.L73
	ldr	r0, [r3, #20]
	cmp	r0, #0
	strne	r7, [r3, #24]
	bne	.L74
.L73:
	cmp	ip, #47
	bhi	.L75
	ldr	r0, [r3, #20]
	cmp	r0, #0
	strne	r9, [r3, #24]
	bne	.L74
.L75:
	cmp	lr, #47
	bls	.L137
	cmp	r6, #47
	bhi	.L77
	ldr	r0, [r3, #20]
	cmp	r0, #0
	strne	fp, [r3, #24]
	add	r3, r3, #28
	cmp	r1, r3
	bne	.L78
.L136:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #32
	bne	.L79
	cmp	r2, #0
	ble	.L79
	mov	r3, #0
	mov	r1, #1
	sub	r2, r2, #1
	str	r2, [r4, #4]
	str	r1, [r4, #32]
	str	r3, [r4, #36]
	str	r3, [r4, #20]
	str	r3, [r4, #24]
.L79:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #16
	bne	.L80
	ldr	r2, [r4, #4]
	cmp	r2, #260
	ldr	r3, .L143
	ble	.L138
.L80:
	ldr	r7, .L143+8
	ldr	r3, [r7]
	tst	r3, #64
	beq	.L81
	ldr	r2, .L143+12
	ldr	r2, [r2]
	ands	r6, r2, #64
	beq	.L139
.L81:
	mov	r2, #40
	str	r2, [r4, #12]
.L83:
	tst	r3, #1
	beq	.L134
	ldr	r3, .L143+12
	ldr	r3, [r3]
	tst	r3, #1
	beq	.L86
.L134:
	ldr	r7, .L143+16
.L85:
	ldr	r6, .L143+16
	ldr	r1, .L143
	mov	r0, r6
	bl	collisionplayerenemy
	ldr	r9, [r7, #28]
	cmp	r9, #0
	mov	r8, r0
	beq	.L87
	ldr	r3, [r6, #12]
	cmn	r3, #19
	blt	.L88
	ldr	r2, [r6, #32]
	cmp	r2, #0
	subne	r3, r3, #1
	subeq	r3, r3, #2
	str	r3, [r6, #12]
.L90:
	cmp	r8, #1
	beq	.L140
.L100:
	cmp	r8, #3
	beq	.L141
.L135:
	ldr	r3, .L143+20
	ldr	r3, [r3]
.L93:
	cmp	r3, #9
	beq	.L142
.L72:
	add	sp, sp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L87:
	ldr	r3, [r6, #24]
	cmp	r3, #0
	beq	.L135
	ldr	r3, [r6, #12]
	cmp	r3, #239
	bgt	.L96
	ldr	r2, [r6, #32]
	cmp	r2, #0
	addne	r3, r3, #1
	addeq	r3, r3, #2
	str	r3, [r6, #12]
.L98:
	cmp	r8, #2
	bne	.L100
	mov	r6, #0
	ldr	r8, .L143+20
	ldr	ip, [r8]
	add	ip, ip, #1
	str	r6, [sp]
	mov	r3, r6
	ldr	r2, .L143+24
	ldr	r1, .L143+28
	ldr	r0, .L143+32
	ldr	r9, .L143+36
	str	ip, [r8]
	str	r6, [r7, #32]
	mov	lr, pc
	bx	r9
	mov	r0, #1
	ldr	r3, [r8]
	ldr	r2, [r7, #12]
	rsb	r1, r3, r3, lsl #3
	add	r5, r5, r1, lsl #2
	sub	r2, r2, #15
	str	r6, [r7, #24]
	str	r6, [r5, #20]
	str	r2, [r7, #12]
	str	r0, [r7, #28]
	b	.L93
.L86:
	mov	r3, #1
	ldr	r7, .L143+16
	str	r3, [r7, #32]
	b	.L85
.L138:
	mov	r0, #1
	mov	r1, #0
	add	r2, r2, r0
	str	r2, [r3, #4]
	str	r0, [r3, #36]
	str	r1, [r3, #32]
	str	r1, [r3, #24]
	str	r1, [r3, #20]
	b	.L80
.L88:
	ldr	r3, .L143+40
	mov	lr, pc
	bx	r3
	ands	r0, r0, #1
	bne	.L91
	mov	r2, #245
	mov	r3, #1
	str	r0, [r6, #24]
	str	r2, [r6, #12]
	str	r3, [r6, #28]
	b	.L90
.L139:
	mov	ip, #34
	mov	r3, r6
	ldr	r2, .L143+24
	str	r6, [sp]
	ldr	r1, .L143+44
	ldr	r0, .L143+48
	ldr	r8, .L143+36
	str	ip, [r4, #12]
	mov	lr, pc
	bx	r8
	ldr	r3, [r4, #36]
	cmp	r3, #0
	ldr	r2, .L143
	beq	.L82
	mov	r1, #1
	str	r6, [r2, #24]
	ldr	r3, [r7]
	str	r1, [r2, #20]
	b	.L83
.L141:
	ldr	r3, .L143+52
	mov	lr, pc
	bx	r3
	ldr	r3, .L143+56
	mov	lr, pc
	bx	r3
	b	.L135
.L96:
	ldr	r3, .L143+40
	mov	lr, pc
	bx	r3
	ands	r0, r0, #1
	moveq	r2, #245
	moveq	r3, #1
	mvnne	r2, #19
	movne	r3, #1
	streq	r0, [r6, #24]
	streq	r2, [r6, #12]
	streq	r3, [r6, #28]
	strne	r9, [r6, #28]
	strne	r2, [r6, #12]
	strne	r3, [r6, #24]
	b	.L98
.L142:
	ldr	r3, .L143+52
	mov	lr, pc
	bx	r3
	mov	r3, #0
	ldr	r2, [r4, #4]
	cmp	r2, #239
	str	r3, [r7, #20]
	ble	.L72
	mov	r1, #1
	ldr	r2, .L143+60
	ldr	r3, .L143+64
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	b	.L72
.L91:
	mvn	r1, #19
	mov	r2, #0
	mov	r3, #1
	str	r1, [r6, #12]
	str	r2, [r6, #28]
	str	r3, [r6, #24]
	b	.L90
.L82:
	ldr	r1, [r2, #32]
	cmp	r1, #0
	movne	r1, #1
	strne	r3, [r2, #20]
	ldreq	r3, [r7]
	ldrne	r3, [r7]
	strne	r1, [r2, #24]
	b	.L83
.L140:
	mov	r6, #0
	ldr	r9, .L143+20
	ldr	ip, [r9]
	add	ip, ip, #1
	str	r6, [sp]
	mov	r3, r6
	ldr	r2, .L143+24
	ldr	r1, .L143+28
	ldr	r0, .L143+32
	ldr	r10, .L143+36
	str	ip, [r9]
	str	r6, [r7, #32]
	mov	lr, pc
	bx	r10
	ldr	r3, [r9]
	ldr	r2, [r7, #12]
	rsb	r1, r3, r3, lsl #3
	add	r5, r5, r1, lsl #2
	add	r2, r2, #15
	str	r6, [r7, #28]
	str	r8, [r7, #24]
	str	r6, [r5, #20]
	str	r2, [r7, #12]
	b	.L93
.L144:
	.align	2
.L143:
	.word	player
	.word	eyes
	.word	oldButtons
	.word	buttons
	.word	enemy
	.word	eyeClose
	.word	11025
	.word	30466
	.word	Blink
	.word	playSoundTwo
	.word	rand
	.word	4200
	.word	Umbrella
	.word	stopSound
	.word	goToLose
	.word	game2
	.word	goToInstruct
	.size	update, .-update
	.align	2
	.global	respawnLeft
	.type	respawnLeft, %function
respawnLeft:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mvn	r1, #19
	mov	r2, #0
	mov	r3, #1
	str	r1, [r0, #12]
	str	r2, [r0, #28]
	str	r3, [r0, #24]
	bx	lr
	.size	respawnLeft, .-respawnLeft
	.align	2
	.global	respawnRight
	.type	respawnRight, %function
respawnRight:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #245
	mov	r2, #1
	mov	r3, #0
	str	r1, [r0, #12]
	str	r2, [r0, #28]
	str	r3, [r0, #24]
	bx	lr
	.size	respawnRight, .-respawnRight
	.comm	hOff,4,4
	.comm	vOff,4,4
	.comm	eyeClose,4,4
	.comm	timer1,4,4
	.comm	game2,4,4
	.comm	enemy,36,4
	.comm	eyes,252,4
	.comm	player,40,4
	.comm	shadowOAM,1024,4
	.ident	"GCC: (devkitARM release 45) 5.3.0"

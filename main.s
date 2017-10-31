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
	.file	"main.c"
	.text
	.align	2
	.global	goToStart
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r0, .L3
	ldr	r3, .L3+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L3+8
	mov	r3, #1024
	ldr	r2, .L3+12
	ldr	r1, .L3+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #624
	ldr	r2, .L3+20
	ldr	r1, .L3+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L3+28
	ldr	r2, .L3+32
	ldmfd	sp!, {r4, lr}
	str	r2, [r3]
	bx	lr
.L4:
	.align	2
.L3:
	.word	startscreenPal
	.word	loadPalette
	.word	DMANow
	.word	100722688
	.word	startscreenMap
	.word	100679680
	.word	startscreenTiles
	.word	state
	.word	updateStart
	.size	goToStart, .-goToStart
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #7936
	mov	r2, #4864
	mov	r5, #67108864
	ldr	r3, .L9
	stmfd	sp!, {r7, lr}
	strh	r1, [r5, #8]	@ movhi
	strh	r2, [r5]	@ movhi
	strh	r3, [r5, #10]	@ movhi
	ldr	r3, .L9+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L9+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L9+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L9+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L9+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L9+24
	mov	lr, pc
	bx	r3
	ldr	r7, .L9+28
	ldr	r4, .L9+32
	ldr	r6, .L9+36
.L6:
	ldr	r3, [r4]
	str	r3, [r7]
	ldr	r3, [r5, #304]
	str	r3, [r4]
	ldr	ip, [r6]
	mov	lr, pc
	bx	ip
	b	.L6
.L10:
	.align	2
.L9:
	.word	7428
	.word	setupSounds
	.word	setupInterrupts
	.word	hideSprites
	.word	init
	.word	stopSound
	.word	goToStart
	.word	oldButtons
	.word	buttons
	.word	state
	.size	main, .-main
	.text
	.align	2
	.global	updateLose
	.type	updateLose, %function
updateLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L19
	ldr	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L19+4
	ldr	r3, [r3]
	stmfd	sp!, {r4, lr}
	ands	r4, r3, #8
	beq	.L18
	ldmfd	sp!, {r4, lr}
	bx	lr
.L18:
	bl	goToStart
	ldr	r3, .L19+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L19+12
	str	r4, [r3]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L20:
	.align	2
.L19:
	.word	oldButtons
	.word	buttons
	.word	init
	.word	game2
	.size	updateLose, .-updateLose
	.align	2
	.global	updateWin
	.type	updateWin, %function
updateWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	updateLose
	.size	updateWin, .-updateWin
	.align	2
	.global	goToPause
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #512
	mov	r3, #67108864
	stmfd	sp!, {r4, lr}
	ldr	r0, .L24
	strh	r2, [r3]	@ movhi
	ldr	r3, .L24+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L24+8
	mov	r3, #1024
	ldr	r2, .L24+12
	ldr	r1, .L24+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #880
	ldr	r2, .L24+20
	ldr	r1, .L24+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L24+28
	ldr	r2, .L24+32
	ldmfd	sp!, {r4, lr}
	str	r2, [r3]
	bx	lr
.L25:
	.align	2
.L24:
	.word	pausescreenPal
	.word	loadPalette
	.word	DMANow
	.word	100722688
	.word	pausescreenMap
	.word	100679680
	.word	pausescreenTiles
	.word	state
	.word	updatePause
	.size	goToPause, .-goToPause
	.align	2
	.global	updateGame
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L33
	ldr	r3, [r3]
	tst	r3, #4
	stmfd	sp!, {r4, lr}
	beq	.L27
	ldr	r3, .L33+4
	ldr	r3, [r3]
	tst	r3, #4
	beq	.L32
.L27:
	ldr	r3, .L33+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L33+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L33+16
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, lr}
	bx	lr
.L32:
	bl	goToPause
	b	.L27
.L34:
	.align	2
.L33:
	.word	oldButtons
	.word	buttons
	.word	update
	.word	waitForVblank
	.word	draw
	.size	updateGame, .-updateGame
	.align	2
	.global	updateGame2
	.type	updateGame2, %function
updateGame2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L42
	ldr	r3, [r3]
	tst	r3, #4
	stmfd	sp!, {r4, lr}
	beq	.L36
	ldr	r3, .L42+4
	ldr	r3, [r3]
	tst	r3, #4
	beq	.L41
.L36:
	ldr	r3, .L42+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L42+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L42+16
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, lr}
	bx	lr
.L41:
	bl	goToPause
	b	.L36
.L43:
	.align	2
.L42:
	.word	oldButtons
	.word	buttons
	.word	update2
	.word	waitForVblank
	.word	draw2
	.size	updateGame2, .-updateGame2
	.align	2
	.global	goToGame
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #4608
	mov	r3, #67108864
	stmfd	sp!, {r4, lr}
	ldr	r0, .L46
	strh	r2, [r3]	@ movhi
	ldr	r3, .L46+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L46+8
	mov	r3, #1024
	ldr	r2, .L46+12
	ldr	r1, .L46+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #64
	ldr	r2, .L46+20
	ldr	r1, .L46+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #256
	ldr	r2, .L46+28
	ldr	r1, .L46+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	ldr	r2, .L46+36
	ldr	r1, .L46+40
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L46+44
	ldr	r2, .L46+48
	ldmfd	sp!, {r4, lr}
	str	r2, [r3]
	bx	lr
.L47:
	.align	2
.L46:
	.word	gamestatePal
	.word	loadPalette
	.word	DMANow
	.word	100722688
	.word	gamestateMap
	.word	100679680
	.word	gamestateTiles
	.word	83886592
	.word	spritesheetPal
	.word	100728832
	.word	spritesheetTiles
	.word	state
	.word	updateGame
	.size	goToGame, .-goToGame
	.align	2
	.global	updatePause
	.type	updatePause, %function
updatePause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L53
	ldr	r3, [r3]
	tst	r3, #4
	bxeq	lr
	ldr	r3, .L53+4
	ldr	r3, [r3]
	tst	r3, #4
	bxne	lr
	b	goToGame
.L54:
	.align	2
.L53:
	.word	oldButtons
	.word	buttons
	.size	updatePause, .-updatePause
	.align	2
	.global	goToWin
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #512
	mov	r3, #67108864
	stmfd	sp!, {r4, lr}
	ldr	r0, .L57
	strh	r2, [r3]	@ movhi
	ldr	r3, .L57+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L57+8
	mov	r3, #1024
	ldr	r2, .L57+12
	ldr	r1, .L57+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #896
	ldr	r2, .L57+20
	ldr	r1, .L57+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L57+28
	ldr	r2, .L57+32
	ldmfd	sp!, {r4, lr}
	str	r2, [r3]
	bx	lr
.L58:
	.align	2
.L57:
	.word	winstatePal
	.word	loadPalette
	.word	DMANow
	.word	100722688
	.word	winstateMap
	.word	100679680
	.word	winstateTiles
	.word	state
	.word	updateWin
	.size	goToWin, .-goToWin
	.align	2
	.global	goToLose
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #512
	mov	r3, #67108864
	stmfd	sp!, {r4, lr}
	ldr	r0, .L61
	strh	r2, [r3]	@ movhi
	ldr	r3, .L61+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L61+8
	mov	r3, #1024
	ldr	r2, .L61+12
	ldr	r1, .L61+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #432
	ldr	r2, .L61+20
	ldr	r1, .L61+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L61+28
	ldr	r2, .L61+32
	ldmfd	sp!, {r4, lr}
	str	r2, [r3]
	bx	lr
.L62:
	.align	2
.L61:
	.word	losestatePal
	.word	loadPalette
	.word	DMANow
	.word	100722688
	.word	losestateMap
	.word	100679680
	.word	losestateTiles
	.word	state
	.word	updateLose
	.size	goToLose, .-goToLose
	.align	2
	.global	goToInstruct
	.type	goToInstruct, %function
goToInstruct:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r2, #768
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r0, .L68
	strh	r2, [r3]	@ movhi
	ldr	r5, .L68+4
	mov	lr, pc
	bx	r5
	ldr	r4, .L68+8
	mov	r3, #1024
	mov	r2, #100663296
	ldr	r1, .L68+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L68+16
	ldr	r1, .L68+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L68+24
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L67
	ldr	r3, .L68+28
	ldr	r2, .L68+32
	ldr	r1, .L68+36
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L68+40
	ldr	r1, .L68+44
	mov	r0, #3
	mov	lr, pc
	bx	r4
.L65:
	ldr	r3, .L68+48
	mov	lr, pc
	bx	r3
	ldr	r4, .L68+52
	mov	r3, #1
	ldr	r2, .L68+56
	ldr	r1, .L68+60
	ldr	r0, .L68+64
	mov	lr, pc
	bx	r4
	ldr	r3, .L68+68
	ldr	r2, .L68+72
	ldmfd	sp!, {r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L67:
	ldr	r0, .L68+76
	mov	lr, pc
	bx	r5
	ldr	r3, .L68+80
	ldr	r2, .L68+32
	ldr	r1, .L68+84
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L68+40
	ldr	r1, .L68+88
	mov	r0, #3
	mov	lr, pc
	bx	r4
	b	.L65
.L69:
	.align	2
.L68:
	.word	rainPal
	.word	loadPalette
	.word	DMANow
	.word	rainTiles
	.word	100726784
	.word	rainMap
	.word	game2
	.word	9584
	.word	100679680
	.word	cityTiles
	.word	100722688
	.word	cityMap
	.word	initRain
	.word	playSoundOne
	.word	11025
	.word	250000
	.word	Rain
	.word	state
	.word	updateInstruct
	.word	city2Pal
	.word	9248
	.word	city2Tiles
	.word	city2Map
	.size	goToInstruct, .-goToInstruct
	.align	2
	.global	updateStart
	.type	updateStart, %function
updateStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L76
	ldr	r2, .L76+4
	ldr	r0, [r3]
	ldr	r2, [r2]
	add	r0, r0, #1
	tst	r2, #8
	str	r0, [r3]
	bxeq	lr
	ldr	r3, .L76+8
	ldr	r3, [r3]
	tst	r3, #8
	bxne	lr
	stmfd	sp!, {r4, lr}
	ldr	r3, .L76+12
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, lr}
	b	goToInstruct
.L77:
	.align	2
.L76:
	.word	randomNum
	.word	oldButtons
	.word	buttons
	.word	srand
	.size	updateStart, .-updateStart
	.align	2
	.global	goToGame2
	.type	goToGame2, %function
goToGame2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, .L80
	mov	lr, pc
	bx	r3
	mov	r2, #4608
	mov	r3, #67108864
	ldr	r0, .L80+4
	strh	r2, [r3]	@ movhi
	ldr	r3, .L80+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L80+12
	mov	r3, #1024
	ldr	r2, .L80+16
	ldr	r1, .L80+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #960
	ldr	r2, .L80+24
	ldr	r1, .L80+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #256
	ldr	r2, .L80+32
	ldr	r1, .L80+36
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	ldr	r2, .L80+40
	ldr	r1, .L80+44
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L80+48
	ldr	r2, .L80+52
	ldmfd	sp!, {r4, lr}
	str	r2, [r3]
	bx	lr
.L81:
	.align	2
.L80:
	.word	init2
	.word	gamestate2Pal
	.word	loadPalette
	.word	DMANow
	.word	100722688
	.word	gamestate2Map
	.word	100679680
	.word	gamestate2Tiles
	.word	83886592
	.word	spritesheetPal
	.word	100728832
	.word	spritesheetTiles
	.word	state
	.word	updateGame2
	.size	goToGame2, .-goToGame2
	.align	2
	.global	updateInstruct
	.type	updateInstruct, %function
updateInstruct:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L91
	stmfd	sp!, {r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L91+4
	ldr	r3, [r3]
	tst	r3, #8
	beq	.L82
	ldr	r3, .L91+8
	ldr	r3, [r3]
	tst	r3, #8
	beq	.L89
.L82:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L89:
	ldr	r3, .L91+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L91+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L91+20
	ldr	r3, [r3]
	cmp	r3, #0
	ldmeqfd	sp!, {r4, lr}
	beq	goToGame
.L90:
	ldmfd	sp!, {r4, lr}
	b	goToGame2
.L92:
	.align	2
.L91:
	.word	updateRain
	.word	oldButtons
	.word	buttons
	.word	stopSound
	.word	hideSprites
	.word	game2
	.size	updateInstruct, .-updateInstruct
	.comm	state,4,4
	.comm	randomNum,4,4
	.comm	oldButtons,4,4
	.comm	buttons,4,4
	.ident	"GCC: (devkitARM release 45) 5.3.0"

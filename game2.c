#include <stdLib.h>
#include "main.h"
#include "myLib.h"
#include "sound.h"
#include "Blink.h"
#include "Umbrella.h"
#include "rainSound.h"
#include "ticking.h"
#include "crack.h"

PLAYER player1;
DETONATOR detonator;
int hitNum = 0;
int randomNum2;
HAND hands[HANDNUM];
int timer1;
int handActive;
CRACKS crack1;
CRACKS crack2;
CRACKS crack3;

OBJ_ATTR shadowOAM[128];

void init2() {
    player1.active = 1;
    player1.row = 4;
    player1.col = 0;
    player1.height = 64;
    player1.width = 32;
    player1.right = 1;
    player1.rAttack = 0;
    player1.left = 0;
    player1.lAttack = 0;
    detonator.height = 32;
    detonator.width = 32;
    detonator.row = 36;
    detonator.col = 50;
    detonator.nextPosition = 0;
    crack1.width = 32;
    crack1.height = 32;
    crack2.width = 32;
    crack2.height = 32;
    crack3.width = 32;
    crack3.height = 32;
    crack1.row = 80;
    crack1.col = 110;
    crack2.row = 100;
    crack2.col = 100;
    crack3.row = 120;
    crack3.col = 100;

    for(int i = 0; i < HANDNUM; i++) {
        hands[i].height = 32;
        hands[i].width = 32;
    }
    for(int i = 0; i < HANDNUM - 8; i++) {
        hands[i].row = 80;
        hands[i].col = 116;
    }
    for(int i = HANDNUM - 8; i < HANDNUM - 5; i++) {
        hands[i].row = 105;
        hands[i].col = 116;
    }
    for(int i = HANDNUM - 5; i < HANDNUM - 2; i++) {
        hands[i].row = 106;
        hands[i].col = 88;
    }
    for(int i = HANDNUM - 2; i < HANDNUM; i++) {
        hands[i].row = 89;
        hands[i].col = 90;
    }
    hands[0].active = 1;
}

void update2() {
    if (BUTTON_HELD(BUTTON_LEFT) && player1.col > 0) {
        if (detonator.down) {
            hitNum++;
            detonator.down = 0;
        }
        player1.left = 1;
        player1.right = 0;
        player1.rAttack = 0;
        player1.lAttack = 0;
        player1.col = player1.col - 1;
    }
    if (BUTTON_HELD(BUTTON_RIGHT) && player1.col <= 260) {
        if (detonator.down) {
            hitNum++;
            detonator.down = 0;
        }
        player1.right = 1;
        player1.left = 0;
        player1.lAttack = 0;
        player1.rAttack = 0;
        player1.col = player1.col + 1;
    }
    if (BUTTON_PRESSED(BUTTON_UP)) {
        player1.width = 34;
        playSoundTwo(Umbrella, UMBRELLALEN, UMBRELLAFREQ, 0, 0);
        if (player1.right) {
            player1.rAttack = 1;
            player1.lAttack = 0;
        } else if (player1.left) {
            player1.lAttack = 1;
            player1.rAttack = 0;
        }   
    } else {
        player1.width = 40;
    }
    
    checkDetonatorCollision(&detonator, &player1);
    if (hitNum == 3) {
        hitNum = 0;
        detonator.nextPosition++;
        if (detonator.nextPosition == 1) {
            crack1.active = 1;
            playSoundTwo(crack, CRACKLEN, CRACKFREQ, 0, 99);
        } else if (detonator.nextPosition == 2) {
            crack2.active = 1;
            playSoundTwo(crack, CRACKLEN, CRACKFREQ, 0, 99);
        } else  {
            crack3.active = 1;
            playSoundTwo(crack, CRACKLEN, CRACKFREQ, 0, 99);
        }
        detonator.col = rand() % (240 - detonator.width);
    }
    timer1++;
    if (!(timer1 % 100)) {
        playSoundTwo(ticking, TICKINGLEN, TICKINGFREQ, 0, 1);
        if(handActive >= HANDNUM) {
            stopSound();
        }
        if (handActive < HANDNUM) {
            if (handActive == HANDNUM - 1) {
                hands[0].active = 1;
                hands[HANDNUM - 1].active = 0;
            } else  {
                hands[handActive + 1].active = 1;
                hands[handActive].active = 0;
            }
        }  else {
            stopSound();
            goToLose();
        }
        handActive++;
    }
    if(detonator.nextPosition == 4) {
        goToWin();
    }
}

void draw2() {
    if (player1.right && !player1.rAttack) {
            shadowOAM[2].attr0 = ATTR0_HIDE;
            shadowOAM[3].attr0 = ATTR0_HIDE;
            shadowOAM[4].attr0 = ATTR0_HIDE;
            shadowOAM[1].attr0 = player1.row;
            shadowOAM[1].attr1 = player1.col | ATTR1_SIZE64;
            shadowOAM[1].attr2 = SPRITEOFFSET16(4, 0);
        } else if (player1.right && player1.rAttack) {
            shadowOAM[1].attr0 = ATTR0_HIDE;
            shadowOAM[3].attr0 = ATTR0_HIDE;
            shadowOAM[4].attr0 = ATTR0_HIDE;
            shadowOAM[2].attr0 = player1.row;
            shadowOAM[2].attr1 = player1.col | ATTR1_SIZE64;
            shadowOAM[2].attr2 = SPRITEOFFSET16(4, 8);
        } else if (player1.left && !player1.lAttack) {
            shadowOAM[1].attr0 = ATTR0_HIDE;
            shadowOAM[2].attr0 = ATTR0_HIDE;
            shadowOAM[4].attr0 = ATTR0_HIDE;
            shadowOAM[3].attr0 = player1.row;
            shadowOAM[3].attr1 = player1.col | ATTR1_SIZE64;
            shadowOAM[3].attr2 = SPRITEOFFSET16(4, 16);
        } else if (player1.left && player1.lAttack) {
            shadowOAM[1].attr0 = ATTR0_HIDE;
            shadowOAM[2].attr0 = ATTR0_HIDE;
            shadowOAM[3].attr0 = ATTR0_HIDE;
            shadowOAM[4].attr0 = player1.row;
            shadowOAM[4].attr1 = player1.col | ATTR1_SIZE64;
            shadowOAM[4].attr2 = SPRITEOFFSET16(4, 24); 
        }
        shadowOAM[5].attr0 = detonator.row;
        shadowOAM[5].attr1 = detonator.col | ATTR1_SIZE32;
        if (detonator.down) {
            shadowOAM[5].attr2 = SPRITEOFFSET16(16, 20);
        } else {
            shadowOAM[5].attr2 = SPRITEOFFSET16(16, 16);
        }


        for (int i = 0; i < HANDNUM; i++) {
            if (hands[i].active) {
                shadowOAM[6].attr0 = hands[i].row;
                shadowOAM[6].attr1 = hands[i].col | ATTR1_SIZE32;
                if(i < 7) {
                    shadowOAM[6].attr2 = SPRITEOFFSET16(20, i*4);   
                } else {
                    shadowOAM[6].attr2 = SPRITEOFFSET16(24, (i - 7)*4);
                }
            }
        }
        if (crack1.active) {
            shadowOAM[7].attr0 = crack1.row;
            shadowOAM[7].attr1 = crack1.col | ATTR1_SIZE32;
            shadowOAM[7].attr2 = SPRITEOFFSET16(12, 16);
         }
        if (crack2.active) { 
            shadowOAM[8].attr0 = crack2.row;
            shadowOAM[8].attr1 = crack2.col | ATTR1_SIZE32;
            shadowOAM[8].attr2 = SPRITEOFFSET16(12, 20);
        }
        if (crack3.active) {
            shadowOAM[9].attr0 = crack3.row;
            shadowOAM[9].attr1 = crack3.col | ATTR1_SIZE32;
            shadowOAM[9].attr2 = SPRITEOFFSET16(12, 24);
        }
    DMANow(3, shadowOAM, OAM, 128*4); 
}

int checkDetonatorCollision(DETONATOR*d, PLAYER*p) {
    if (p->rAttack) {
        if ( p->col >= d->col - 32 && p->col <= d->col - 20) {
            detonator.down = 1;
            return 1;
        }
    }
     if (p->lAttack) {
        if ( p->col >= d->col && p->col <= d->col + 10) {
            detonator.down = 1;
            return 2;
        }
    }

    return 0;
}
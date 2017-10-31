#include <stdLib.h>
#include "main.h"
#include "myLib.h"
#include "sound.h"
#include "Blink.h"
#include "Umbrella.h"
#include "rainSound.h"
#include "ticking.h"


OBJ_ATTR shadowOAM[128];

PLAYER player;
EYES eyes[EYENUM];
ENEMY enemy;
int game2;

enum {eye1, eye2, eye3, eye4, eye5, eye6, playerRight, playerRightAttack, playerLeft, playerLeftAttack, enemy1, enemy2};

int timer1;
int eyeClose;
int vOff;
int hOff;


void hideSprites() {
    for (int i = 0; i < 128; i++) {
        shadowOAM[i].attr0 = ATTR0_HIDE;
    }
}

void init() {
    int counterRow = 0;
    int counterCol = 0;
    for (int i = 0; i < EYENUM; i++) {
        eyes[i].row = 73 + (counterRow * 32);
        eyes[i].col = 36 + (68 * counterCol);
        eyes[i].height = 32;
        eyes[i].width = 32;
        eyes[i].active = 1;
        if (i == 2 || i == 5) {
            counterRow ++;
            counterCol = 0;
        } else {
            counterCol++;
        }
    }
    player.active = 1;
    player.row = 8;
    player.col = 0;
    player.height = 64;
    player.width = 32;
    player.right = 1;
    player.rAttack = 0;
    player.left = 0;
    player.lAttack = 0;
    enemy.height = 64;
    enemy.width = 32;
    enemy.row = 7;
    enemy.col = 200;
    enemy.active = 1;
    enemy.right = 0;
    enemy.left = 1;
    enemy.slowDown = 0;
    REG_BG0HOFS = hOff;
    REG_BG0VOFS = vOff;
    hOff = 0;
    vOff = 20;
    eyeClose = -1;

}

void draw() {
    for (int i= 0; i < EYENUM; i++) {
        if (eyes[i].active) {
            shadowOAM[i].attr0 = eyes[i].row;
            shadowOAM[i].attr1 = eyes[i].col | ATTR1_SIZE32;
            shadowOAM[i].attr2 = SPRITEOFFSET16(0, (eyes[i].type)*4);
        } else {
            shadowOAM[i].attr0 = eyes[i].row;
            shadowOAM[i].attr1 = eyes[i].col | ATTR1_SIZE32;
            shadowOAM[i].attr2 = SPRITEOFFSET16(0, 20);
        }
    }
        if (player.right && !player.rAttack) {
            shadowOAM[10].attr0 = ATTR0_HIDE;
            shadowOAM[11].attr0 = ATTR0_HIDE;
            shadowOAM[12].attr0 = ATTR0_HIDE;
            shadowOAM[9].attr0 = player.row;
            shadowOAM[9].attr1 = player.col | ATTR1_SIZE64;
            shadowOAM[9].attr2 = SPRITEOFFSET16(4, 0);
        } else if (player.right && player.rAttack) {
            shadowOAM[9].attr0 = ATTR0_HIDE;
            shadowOAM[11].attr0 = ATTR0_HIDE;
            shadowOAM[12].attr0 = ATTR0_HIDE;
            shadowOAM[10].attr0 = player.row;
            shadowOAM[10].attr1 = player.col | ATTR1_SIZE64;
            shadowOAM[10].attr2 = SPRITEOFFSET16(4, 8);
        } else if (player.left && !player.lAttack) {
            shadowOAM[9].attr0 = ATTR0_HIDE;
            shadowOAM[10].attr0 = ATTR0_HIDE;
            shadowOAM[12].attr0 = ATTR0_HIDE;
            shadowOAM[11].attr0 = player.row;
            shadowOAM[11].attr1 = player.col | ATTR1_SIZE64;
            shadowOAM[11].attr2 = SPRITEOFFSET16(4, 16);
        } else if (player.left && player.lAttack) {
            shadowOAM[9].attr0 = ATTR0_HIDE;
            shadowOAM[10].attr0 = ATTR0_HIDE;
            shadowOAM[11].attr0 = ATTR0_HIDE;
            shadowOAM[12].attr0 = player.row;
            shadowOAM[12].attr1 = player.col | ATTR1_SIZE64;
            shadowOAM[12].attr2 = SPRITEOFFSET16(4, 24); 
        }
        if (enemy.left) {
            shadowOAM[14].attr0 = ATTR0_HIDE;
            shadowOAM[13].attr0 = (ROWMASK & enemy.row);
            shadowOAM[13].attr1 = (COLMASK & enemy.col) | ATTR1_SIZE64;
            shadowOAM[13].attr2 = SPRITEOFFSET16(12, 0);
            }
        if (enemy.right) {
            shadowOAM[13].attr0 = ATTR0_HIDE;
            shadowOAM[14].attr0 = (ROWMASK & enemy.row);
            shadowOAM[14].attr1 = (COLMASK & enemy.col) | ATTR1_SIZE64;
            shadowOAM[14].attr2 = SPRITEOFFSET16(12, 8);
        }
        if (enemy.active == 0) {
            shadowOAM[13].attr0 = ATTR0_HIDE;
            shadowOAM[14].attr0 = ATTR0_HIDE;
        }
    if (game2) {
        hideSprites();
        DMANow(3, shadowOAM, OAM, 128*4); 
    }
    DMANow(3, shadowOAM, OAM, 128*4); 
}

void update() {
    for (int i = 0; i < EYENUM; i++) {
        if (player.col <= 48 && eyes[i].active) {
            eyes[i].type = eye1;
        } else if (player.col > 48 && player.col <= 96 && eyes[i].active) {
             eyes[i].type = eye2;
        } else if (player.col > 96 && player.col <= 144 && eyes[i].active) {
             eyes[i].type = eye3;
        } else if (player.col > 144 && player.col <= 192 && eyes[i].active) {
             eyes[i].type = eye4;
        } else if (player.col > 192 && player.col <= 240 && eyes[i].active) {
             eyes[i].type = eye5;;
        }
    }
    if (BUTTON_HELD(BUTTON_LEFT) && player.col > 0) {
        player.left = 1;
        player.right = 0;
        player.rAttack = 0;
        player.lAttack = 0;
        player.col = player.col - 1;
    }
    if (BUTTON_HELD(BUTTON_RIGHT) && player.col <= 260) {
        player.right = 1;
        player.left = 0;
        player.lAttack = 0;
        player.rAttack = 0;
        player.col = player.col + 1;
    }
    if (BUTTON_PRESSED(BUTTON_UP)) {
        player.width = 34;
        playSoundTwo(Umbrella, UMBRELLALEN, UMBRELLAFREQ, 0, 0);
        if (player.right) {
            player.rAttack = 1;
            player.lAttack = 0;
        } else if (player.left) {
            player.lAttack = 1;
            player.rAttack = 0;
        }   
    } else {
        player.width = 40;
    }
     if(BUTTON_PRESSED(BUTTON_A)) {
        enemy.slowDown = 1;
    }
    int collide = collisionplayerenemy(&enemy, &player);

    if (enemy.left) {
        if (enemy.col > -20) {
            if (enemy.slowDown) {
                enemy.col -= 1;
            } else {
                enemy.col-= 2;
            }
        } else {
            if (rand()%2==0) {
                respawnRight(&enemy);
            } else {
                respawnLeft(&enemy);
            }
        }
        if (collide == 1) {
            enemy.slowDown = 0;
            eyeClose++;
            playSoundTwo(Blink,BLINKLEN, BLINKFREQ, 0, 0);
            eyes[eyeClose].active = 0;
            enemy.right = 1;
            enemy.left = 0;
            enemy.col += 15;

        }
        if (collide == 3) {
            stopSound();
            goToLose();
        }
     }
     else if (enemy.right) {
        if (enemy.col < 240) {
               if (enemy.slowDown) {
                enemy.col += 1;
            } else {
                enemy.col+= 2;
            } 
        } else {
            if (rand()%2==0) {
                respawnRight(&enemy);
            } else {
                respawnLeft(&enemy);
            }
        }
         if (collide == 2) {
            enemy.slowDown = 0;
            eyeClose++;
            playSoundTwo(Blink,BLINKLEN, BLINKFREQ, 0, 0);
            eyes[eyeClose].active = 0;
            enemy.left = 1;
            enemy.right = 0;
            enemy.col -= 15;
            
        }
         if (collide == 3) {
            stopSound();
            goToLose();
        }
    }
        
        if (eyeClose == 9) {
            stopSound();
            enemy.active = 0;
            if (player.col >= 240) {
                game2 = 1;
                goToInstruct();
            }
        }
}
// //functions soley for Instructions Screen to create moving rain
void initRain() {
    hOff = 0;
    vOff = 100;
    REG_BG0HOFS = hOff;
    REG_BG0VOFS = vOff;
}

void updateRain() {
    REG_BG0HOFS = hOff++;
    REG_BG0VOFS = vOff++;
}

int collisionplayerenemy(ENEMY*e, PLAYER*p) {
    if (e->active) {
        if (e->col <= p->col + p->width - 10 && e->col + e->width >= p->col) {
            if (p->rAttack && e->left) {
                return 1;
            }
            if (p->lAttack && e->right) {
                return 2;
            }
            if (p->left || p->right) {
                return 3;
            }
        }
    }
    return 0;
}

void respawnLeft(ENEMY*e) {
    e->col = -20;
    e->left = 0;
    e->right = 1;
}

void respawnRight(ENEMY*e) {
    e->col = 245;
    e->left = 1;
    e->right = 0;
}
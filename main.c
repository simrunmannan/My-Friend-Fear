    /*****************************************
    CHEAT: IF YOU CLICK A THE ENEMY SLOWS DOWN, MAKING
    IT EASIER TO DIVERT HIM IN THE OTHER DIRECTION.
    ******************************************/
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include "main.h"
#include "myLib.h"
#include "sound.h"
#include "startscreen.h"
#include "pausescreen.h"
#include "winstate.h"
#include "losestate.h"
#include "gamestate.h"
#include "spritesheet.h"
#include "Blink.h" 
#include "Umbrella.h"
#include "rainSound.h"
#include "rain.h"
#include "city.h"
#include "city2.h"
#include "gamestate2.h"
#include "ticking.h"
#include "crack.h"

unsigned int buttons;
unsigned int oldButtons;
int randomNum;


void (*state)();

int main() {
    REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;
    REG_BG0CNT = BG_SIZE0 | CBB(0) | SBB(31);
    REG_BG1CNT = BG_SIZE0 | CBB(1) | SBB(29);
    setupSounds();
    setupInterrupts();
    hideSprites();
    init();
    stopSound();
    goToStart();

    while(1) {
        oldButtons = buttons;
        buttons = BUTTONS;
        state();
    }
}

void goToStart() {
    loadPalette(startscreenPal);
    DMANow(3, startscreenMap, &SCREENBLOCKBASE[29], startscreenMapLen/ 2);
    DMANow(3, startscreenTiles, &CHARBLOCKBASE[1], startscreenTilesLen/ 2);
    state = updateStart;  
}

void updateStart() {
    randomNum++;
    if(BUTTON_PRESSED(BUTTON_START)) {
        srand(randomNum);
        goToInstruct();
    }
}

void goToPause() {
    REG_DISPCTL = MODE0 | BG1_ENABLE;
    loadPalette(pausescreenPal);
    DMANow(3, pausescreenMap, &SCREENBLOCKBASE[29], pausescreenMapLen/ 2);
    DMANow(3, pausescreenTiles, &CHARBLOCKBASE[1], pausescreenTilesLen/ 2);
    state = updatePause;
}

void updatePause() {
    if(BUTTON_PRESSED(BUTTON_SELECT)) {
        goToGame();
    }
}

void goToGame() {
     REG_DISPCTL = MODE0 | BG1_ENABLE| SPRITE_ENABLE;
     loadPalette(gamestatePal);
     DMANow(3, gamestateMap, &SCREENBLOCKBASE[29], gamestateMapLen/ 2);
     DMANow(3, gamestateTiles, &CHARBLOCKBASE[1], gamestateTilesLen/ 2);
     DMANow(3, spritesheetPal, SPRITE_PALETTE, 256);
     DMANow(3, spritesheetTiles, &CHARBLOCKBASE[4], spritesheetTilesLen/2);
    state = updateGame;
}

void updateGame() {
    if(BUTTON_PRESSED(BUTTON_SELECT)) {
        goToPause();
    }
    update();
    waitForVblank();
    draw();
}

void goToWin() {
    REG_DISPCTL = MODE0 | BG1_ENABLE;
    loadPalette(winstatePal);
    DMANow(3, winstateMap, &SCREENBLOCKBASE[29], winstateMapLen/ 2);
    DMANow(3, winstateTiles, &CHARBLOCKBASE[1], winstateTilesLen/ 2);
    state = updateWin;
}

void updateWin() {
   if(BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
        init();
        game2 = 0;
    } 
}

void goToLose() {
    REG_DISPCTL = MODE0 | BG1_ENABLE;
    loadPalette(losestatePal);
    DMANow(3, losestateMap, &SCREENBLOCKBASE[29], losestateMapLen/ 2);
    DMANow(3, losestateTiles, &CHARBLOCKBASE[1], losestateTilesLen/ 2);
    state = updateLose;
}

void updateLose() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
        init();
        game2 = 0;
    }
}

void goToInstruct() {
    REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE;
    loadPalette(rainPal);
    DMANow(3, rainTiles, &CHARBLOCKBASE[0], rainTilesLen/2);
    DMANow(3, rainMap, &SCREENBLOCKBASE[31], rainMapLen/ 2);
    if(game2) {
        loadPalette(city2Pal);
        DMANow(3, city2Tiles, &CHARBLOCKBASE[1], city2TilesLen/ 2);
        DMANow(3, city2Map, &SCREENBLOCKBASE[29], city2MapLen/ 2);
    } else {
        DMANow(3, cityTiles, &CHARBLOCKBASE[1], cityTilesLen/ 2);
        DMANow(3, cityMap, &SCREENBLOCKBASE[29], cityMapLen/ 2);
    }
    initRain();
    playSoundOne(Rain, RAINLEN, RAINFREQ, 1);
    state = updateInstruct; 
}
void updateInstruct() {
    updateRain();
    if (BUTTON_PRESSED(BUTTON_START)) {
        stopSound();
        hideSprites();
        if (game2) {
            goToGame2();
        } else {
            goToGame();
        }
    }
} 

void goToGame2() {
    init2();
    REG_DISPCTL = MODE0 | BG1_ENABLE| SPRITE_ENABLE;
     loadPalette(gamestate2Pal);
     DMANow(3, gamestate2Map, &SCREENBLOCKBASE[29], gamestate2MapLen/ 2);
     DMANow(3, gamestate2Tiles, &CHARBLOCKBASE[1], gamestate2TilesLen/ 2);
     DMANow(3, spritesheetPal, SPRITE_PALETTE, 256);
     DMANow(3, spritesheetTiles, &CHARBLOCKBASE[4], spritesheetTilesLen/2);
     state = updateGame2;
}

void updateGame2() {
    if(BUTTON_PRESSED(BUTTON_SELECT)) {
        goToPause();
    }
    update2();
    waitForVblank();
    draw2();
}

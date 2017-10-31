#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include "myLib.h"
#include "main.h"
#include "sound.h"
#include "Blink.h"
#include "Umbrella.h"
#include "rainSound.h"

typedef struct{
    const unsigned char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
    int vbCount;
}SOUND;

SOUND soundOne;
SOUND soundTwo;

void setupSounds()
{
    REG_SOUNDCNT_X = SND_ENABLED;

    REG_SOUNDCNT_H = SND_OUTPUT_RATIO_100 | 
                     DSA_OUTPUT_RATIO_100 | 
                     DSA_OUTPUT_TO_BOTH | 
                     DSA_TIMER0 | 
                     DSA_FIFO_RESET |
                     DSB_OUTPUT_RATIO_100 | 
                     DSB_OUTPUT_TO_BOTH | 
                     DSB_TIMER1 | 
                     DSB_FIFO_RESET;

    REG_SOUNDCNT_L = 0;
}

void playSoundOne( const unsigned char* sound, int length, int frequency, int loops) {
        dma[1].cnt = 0;
        int ticks = PROCESSOR_CYCLES_PER_SECOND/frequency;
        DMANow(1, sound, REG_FIFO_A, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);
        REG_TM0CNT = 0;
        REG_TM0D = -ticks;
        REG_TM0CNT = TIMER_ON;

        soundOne.length = length;
        soundOne.frequency = frequency;
        soundOne.isPlaying = 1;
        soundOne.loops = loops;
        soundOne.duration =  ((VBLANK_FREQ*length)/frequency);
        soundOne.data = sound;
        soundOne.vbCount = 0;      
}

void playSoundTwo( const unsigned char* sound, int length, int frequency, int loops, int priority) {
    if (soundTwo.isPlaying && soundTwo.priority > priority) {
        return;
    }
        dma[2].cnt = 0;
        int ticks = PROCESSOR_CYCLES_PER_SECOND/frequency;
        DMANow(2, sound, REG_FIFO_B, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);
        REG_TM1CNT = 0;
        REG_TM1D = -ticks;
        REG_TM1CNT = TIMER_ON;

        soundTwo.length = length;
        soundTwo.frequency = frequency;
        soundTwo.isPlaying = 1;
        soundTwo.loops = loops;
        soundTwo.duration =  ((VBLANK_FREQ*length)/frequency);
        soundTwo.data = sound;
        soundTwo.vbCount = 0; 
        soundTwo.priority = priority;     
}

void pauseSound()
{
    soundOne.isPlaying = 0;
    soundTwo.isPlaying = 0;
    REG_TM0CNT = 0;
    REG_TM1CNT = 0;
    
}

void unpauseSound()
{
    soundOne.isPlaying = 1;
    soundTwo.isPlaying = 1;
    REG_TM0CNT = TIMER_ON;
    REG_TM1CNT = TIMER_ON;
}

void stopSound()
{
    dma[1].cnt = 0;
    dma[2].cnt = 0;
    REG_TM0CNT = 0;
    REG_TM1CNT = 0;
    soundOne.isPlaying = 0;
    soundTwo.isPlaying = 0;
}

void setupInterrupts()
{
    REG_IME = 0;
    REG_INTERRUPT = (unsigned int)interruptHandler;
    REG_IE |= INT_VBLANK;
    REG_DISPSTAT |= INT_VBLANK_ENABLE;
    REG_IME = 1;
}

void interruptHandler()
{
    REG_IME = 0;
    if(REG_IF & INT_VBLANK)
    {
        if (soundOne.isPlaying) { 
            soundOne.vbCount++;
            if (soundOne.vbCount> soundOne.duration) {
                if (soundOne.loops) {
                    playSoundOne(soundOne.data, soundOne.length, soundOne.frequency, soundOne.loops);
                } else {
                    dma[1].cnt = 0;
                    REG_TM0CNT = 0;
                    soundOne.isPlaying = 0;
                }
            }
        }
        if (soundTwo.isPlaying) { 
            soundTwo.vbCount++;
            if (soundTwo.vbCount > soundTwo.duration) {
                if (soundTwo.loops) {
                    playSoundTwo(soundTwo.data, soundTwo.length, soundTwo.frequency, soundTwo.loops, soundTwo.priority);
                } else {
                    dma[2].cnt = 0;
                    REG_TM1CNT = 0;
                    soundTwo.isPlaying = 0;
                }
            }
        }
        
        REG_IF = INT_VBLANK; 
    }

    REG_IME = 1;
}


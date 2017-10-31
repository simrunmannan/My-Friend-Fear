
//{{BLOCK(clock)

//======================================================================
//
//	clock, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 60 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 1920 + 2048 = 4480
//
//	Time-stamp: 2017-04-24, 17:09:43
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_CLOCK_H
#define GRIT_CLOCK_H

#define clockTilesLen 1920
extern const unsigned short clockTiles[960];

#define clockMapLen 2048
extern const unsigned short clockMap[1024];

#define clockPalLen 512
extern const unsigned short clockPal[256];

#endif // GRIT_CLOCK_H

//}}BLOCK(clock)

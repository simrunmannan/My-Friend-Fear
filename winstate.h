
//{{BLOCK(winstate)

//======================================================================
//
//	winstate, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 56 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 1792 + 2048 = 4352
//
//	Time-stamp: 2017-04-11, 22:16:17
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_WINSTATE_H
#define GRIT_WINSTATE_H

#define winstateTilesLen 1792
extern const unsigned short winstateTiles[896];

#define winstateMapLen 2048
extern const unsigned short winstateMap[1024];

#define winstatePalLen 512
extern const unsigned short winstatePal[256];

#endif // GRIT_WINSTATE_H

//}}BLOCK(winstate)

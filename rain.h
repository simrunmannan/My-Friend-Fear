
//{{BLOCK(rain)

//======================================================================
//
//	rain, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 64 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 2048 + 2048 = 4608
//
//	Time-stamp: 2017-04-04, 20:05:12
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_RAIN_H
#define GRIT_RAIN_H

#define rainTilesLen 2048
extern const unsigned short rainTiles[1024];

#define rainMapLen 2048
extern const unsigned short rainMap[1024];

#define rainPalLen 512
extern const unsigned short rainPal[256];

#endif // GRIT_RAIN_H

//}}BLOCK(rain)

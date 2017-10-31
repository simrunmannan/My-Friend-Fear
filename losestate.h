
//{{BLOCK(losestate)

//======================================================================
//
//	losestate, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 27 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 864 + 2048 = 3424
//
//	Time-stamp: 2017-04-11, 22:19:47
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_LOSESTATE_H
#define GRIT_LOSESTATE_H

#define losestateTilesLen 864
extern const unsigned short losestateTiles[432];

#define losestateMapLen 2048
extern const unsigned short losestateMap[1024];

#define losestatePalLen 512
extern const unsigned short losestatePal[256];

#endif // GRIT_LOSESTATE_H

//}}BLOCK(losestate)

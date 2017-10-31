
//{{BLOCK(gamestate)

//======================================================================
//
//	gamestate, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 4 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 128 + 2048 = 2688
//
//	Time-stamp: 2017-03-28, 22:57:23
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAMESTATE_H
#define GRIT_GAMESTATE_H

#define gamestateTilesLen 128
extern const unsigned short gamestateTiles[64];

#define gamestateMapLen 2048
extern const unsigned short gamestateMap[1024];

#define gamestatePalLen 512
extern const unsigned short gamestatePal[256];

#endif // GRIT_GAMESTATE_H

//}}BLOCK(gamestate)


//{{BLOCK(gamestate2)

//======================================================================
//
//	gamestate2, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 60 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 1920 + 2048 = 4480
//
//	Time-stamp: 2017-04-24, 17:11:15
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAMESTATE2_H
#define GRIT_GAMESTATE2_H

#define gamestate2TilesLen 1920
extern const unsigned short gamestate2Tiles[960];

#define gamestate2MapLen 2048
extern const unsigned short gamestate2Map[1024];

#define gamestate2PalLen 512
extern const unsigned short gamestate2Pal[256];

#endif // GRIT_GAMESTATE2_H

//}}BLOCK(gamestate2)

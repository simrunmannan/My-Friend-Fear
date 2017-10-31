
//{{BLOCK(city)

//======================================================================
//
//	city, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 599 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 19168 + 2048 = 21728
//
//	Time-stamp: 2017-04-24, 23:01:32
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_CITY_H
#define GRIT_CITY_H

#define cityTilesLen 19168
extern const unsigned short cityTiles[9584];

#define cityMapLen 2048
extern const unsigned short cityMap[1024];

#define cityPalLen 512
extern const unsigned short cityPal[256];

#endif // GRIT_CITY_H

//}}BLOCK(city)

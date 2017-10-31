#define EYENUM 9
#define PLAYERNUM 4
#define HANDNUM 12
#define CRACKNUM 3

extern int game2;

typedef struct 
{
    int row;
    int col;
    int height;
    int width;
    int lifeNum;
    int rAttack;
    int lAttack;
    int active;
    int left;
    int right;
} PLAYER;

typedef struct 
{
    int height;
    int width;
    int row; 
    int col;
    int lifeNum;
    int active;
    int type;
} EYES;

typedef struct 
{
    int height;
    int width;
    int row;
    int col;
    int lifeNum;
    int active;
    int right;
    int left;
    int slowDown;
}ENEMY;

typedef struct {
    int height;
    int width;
    int row;
    int col;
    int active;
    int down;
    int nextPosition;
} DETONATOR;

typedef struct 
{
    int height;
    int width;
    int row;
    int col;
    int active;
} HAND;

typedef struct
{
    int height;
    int width;
    int active;
    int col;
    int row;
} CRACKS;

void init();
void draw();
void update();
void hideSprites();
void goToStart();
void updateStart();
void goToGame();
void updateGame();
void goToPause();
void updatePause();
void goToWin();
void updateWin();
void goToLose();
void updateLose();
void goToInstruct();
void updateInstruct();
void goToGame2();
void updateGame2();
void init2();
void update2();
void draw2();
int checkDetonatorCollision();
void playSoundTwo();
void playSoundOne();

//static volatile unsigned int * DRAW_PTR = (unsigned int *) 0x08000000;
//#define IDX DRAW_PTR[0]
//#define X_START DRAW_PTR[1]
//#define Y_START DRAW_PTR[2]
//#define X_STOP DRAW_PTR[3]
//#define Y_STOP DRAW_PTR[4]
//#define FRAME_DONE DRAW_PTR[5]
//#define DRAW_START DRAW_PTR[6]
//#define DRAW_DONE DRAW_PTR[7]


#include <system.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <alt_types.h>

//void init_background(){
//	IDX = 0;
//	X_START = 0;
//	Y_START = 0;
//	X_STOP = 640;
//	Y_STOP = 480;
//	DRAW_START = 1;
//	while(!DRAW_DONE);
//	printf("Draw Done: %d",DRAW_DONE);
//	DRAW_START = 0;
//	//FRAME_DONE = 1;
//}

int main(){
	while(1){
		printf("Test! \n");
		usleep(10000);
		//init_background();
	}
}

#include "types.h"
#include "stat.h"
#include "user.h"

int
main(void){
	printf(1, "Number of active processes in the system is/are %d\n", getNumProc());
	exit();
}

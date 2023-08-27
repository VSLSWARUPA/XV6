#include "types.h"
#include "stat.h"
#include "user.h"

int
main(void){
	printf(1,"Dummy process to test set_burst_time and get_burst_time system calls.\n");
	set_burst_time(5);
	printf(1, "Burst time is: %d\n", get_burst_time());
	exit();
}

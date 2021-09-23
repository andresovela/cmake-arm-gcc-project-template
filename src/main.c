#include "add_one.h"
#include "add_two.h"

int main(void) {
    uint32_t i = 0;
    i = add_one(i);
    i = add_two(i);
    
    while (1);
    return 0;
}
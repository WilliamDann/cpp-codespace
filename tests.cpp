#define DOCTEST_CONFIG_IMPLEMENT_WITH_MAIN
#include "doctest.h"

// example — normally you'd #include your own header and test real functions
int add(int a, int b) { return a + b; }

TEST_CASE("add works") {
    CHECK(add(2, 3) == 5);
    CHECK(add(-1, 1) == 0);
}

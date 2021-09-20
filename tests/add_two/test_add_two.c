#include "unity_fixture.h"
#include "stdio.h"
#include "add_two.h"

// ----------------------------------------------
// Unity setup
// ----------------------------------------------

#define TEST_GROUP_NAME add_two

TEST_GROUP(TEST_GROUP_NAME);

TEST_SETUP(TEST_GROUP_NAME) {
}

TEST_TEAR_DOWN(TEST_GROUP_NAME) {
}

// ----------------------------------------------
// Tests
// ----------------------------------------------

TEST(TEST_GROUP_NAME, test_add_two_to_one) {
    TEST_ASSERT_EQUAL(3, add_two(1));
}

TEST(TEST_GROUP_NAME, test_add_two_to_two) {
    TEST_ASSERT_EQUAL(4, add_two(2));
}

// ----------------------------------------------
// Unity test runner
// ----------------------------------------------

TEST_GROUP_RUNNER(TEST_GROUP_NAME) {
    RUN_TEST_CASE(TEST_GROUP_NAME, test_add_two_to_one);
    RUN_TEST_CASE(TEST_GROUP_NAME, test_add_two_to_two);
}

// ----------------------------------------------
// Unity main
// ----------------------------------------------

void run_all_tests(void) {
    RUN_TEST_GROUP(TEST_GROUP_NAME)
}

int main(int argc, const char *argv[]) {
    return UnityMain(argc, argv, run_all_tests);
}
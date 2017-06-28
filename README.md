# t.test_loop

I have more than a dozen morphological traits measured of each individual, and I want to determine if males and females
differ using a t-test. However, I must first determine if the variance of each trait for the sexes is equal, so I must
first perform an F-test.

This could be cumbersome to perform individual F-tests and then t-tests for each trait. So, this loop automates the process
and prints the results of the appropriate t-test based on the results of the F-test.

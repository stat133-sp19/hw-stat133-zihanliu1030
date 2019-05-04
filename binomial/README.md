This package contains 10 main functions to help calculate different parameters associated with a specified binomial distribution.

The four main functions are:
bin_choose()
bin_probability()
bin_distribution()
bin_cumulative()
bin_variable()
bin_mean()
bin_variance()
bin_mode()
bin_skewness()
bin_kurtosis()

bin_choose() has a similar function to the algorithm "n choose k," which calculates the number of combinations in which k successes can occur in n trials. It takes in 2 variables: "n"-number of trials (non-negative integer), and "k"-number of successful trials (non-negative integer). It returns the number of combinations in which k successes can occur in n trials

bin_probability() calculates the probability of exactly k successes on n repeated trials. It takes in 3 variables: "trials"-number of trials (non-negative integer), "success"-number of successful trials (non-negative integer), and "prob"-the probability in which a trial is successful (numeric). It returns the probability of exactly k successes on n repeated trials

bin_distribution() output a data.frame with two classes: c("bindis", "data.frame"), which describes the probability of k success happening in n trials of a binomial distribution. It takes in 2 variables: "trials"-number of trials (non-negative integer), and "prob"-the probability in which a trial is successful (numeric). It returns a data.frame with two classes: c("bindis", "data.frame") outlining probabilities of a binomial distribution.

bin_cumulative() output a data.frame with two classes: c("bincum", "data.frame"), which describes the cumulative probability of k success happening in n trials of a binomial distribution. It takes in 2 variables: "trials"-number of trials (non-negative integer), and "prob"-the probability in which a trial is successful (numeric). It returns a data.frame with two classes: c("bindis", "data.frame") outlining the cumulative probabilities of a binomial distribution.

bin_variable() output a data.frame with two classes: c("bindis", "data.frame"), which describes the parameters used in the binomial distribution. It takes in 2 variables: "trials"-number of trials (non-negative integer), and "prob"-the probability in which a trial is successful (numeric). It returns a data.frame with two classes: c("bindis", "data.frame") outlining parameters used in the binomial distribution.

bin_mean() takes in 2 variables: "trials"-number of trials (non-negative integer), and "prob"-the probability in which a trial is successful (numeric). It calculates the mean of a binomial distribution.

bin_variance() takes in 2 variables: "trials"-number of trials (non-negative integer), and "prob"-the probability in which a trial is successful (numeric). It calculates the variance of a binomial distribution.

bin_mode() takes in 2 variables: "trials"-number of trials (non-negative integer), and "prob"-the probability in which a trial is successful (numeric). It calculates the mode of a binomial distribution.

bin_skewness() takes in 2 variables: "trials"-number of trials (non-negative integer), and "prob"-the probability in which a trial is successful (numeric). It calculates the skewness of a binomial distribution.

bin_kurtosis() takes in 2 variables: "trials"-number of trials (non-negative integer), and "prob"-the probability in which a trial is successful (numeric). It calculates the kurtosis of a binomial distribution.

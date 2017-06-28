# Reading in the dataset and creating male and female subsets
mongoose = read.csv("all mongoose data.csv")
male = subset(mongoose, sex =="M")
female = subset(mongoose, sex =="F")

# Creates a list of traits to compare
trait_list = c('mass', 'head', 'skull width', 'body', 'tail', 'neck', 'chest', 'foot l', 'foot r', 'lt tooth', 'lb tooth', 'rt tooth', 'rb tooth', 'ap')

# Performs an F-test to compare two variances (var.test), then, depending on the results,
# performs the appropriate t-test version (either with equal or unequal variances of the two groups)

result_list = lapply(trait_list, FUN = function(trait) {
  if (var.test(male[[trait]], female[[trait]])$p.value < 0.05) {
   t.test(male[[trait]], female[[trait]], var = F)
  } else{
   t.test(male[[trait]], female[[trait]], var = T)
  }
})

print(result_list)

# A drawback of this loop is that it does not include the names of the traits in the printed list of t-test results

# This loop includes the trait names into the printed list of t-test results
result_list <- lapply(trait_list, FUN = function(trait) {
  if (var.test(male[[trait]], female[[trait]])$p.value < 0.05) {
    x = t.test(male[[trait]], female[[trait]], var = F)
    names(x$estimate) = c(paste0('male_', trait), paste0('female_', trait))
    x$data.name <- paste0('male_', trait, " and ", paste0('female_', trait))

  } else {
    x = t.test(male[[trait]], female[[trait]], var = T)
    names(x$estimate) = c(paste0('male_', trait), paste0('female_', trait))
    x$data.name <- paste0('male_', trait, " and ", paste0('female_', trait))
  }
  x
})

print(result_list)
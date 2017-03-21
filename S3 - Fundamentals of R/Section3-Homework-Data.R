#Data
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)

#Solution
#Profit for each month
profit <- revenue - expenses
profit

#Profit after tax for each month
profit_afttax <- round(profit * 0.7,2)
profit_afttax

#Profit margin for each month
profit_margin <- round(profit_afttax / revenue * 100,0)
profit_margin

#good months
avg_profit_afttax <- mean(profit_afttax)
avg_profit_afttax

good_months <- profit_afttax > avg_profit_afttax
good_months

#bad months
bad_months <- !good_months
bad_months

#best month
max_pat <- max(profit_afttax)
max_pat

best_month <- profit_afttax == max_pat
best_month

#worst month
min_pat <- min(profit_afttax)
min_pat

worst_month <- profit_afttax == min_pat
worst_month

#units of thousands
revenue.1000 <- round(revenue / 1000)
expenses.1000 <- round(expenses / 1000)
profit.1000 <- round(expenses / 1000)
profit_afttax.1000 <- round(expenses / 1000)

#output
revenue.1000
expenses.1000
profit.1000
profit_afttax.1000
profit_margin
good_months
bad_months
best_month
worst_month

#matrices
m <- rbind(
  revenue.1000,
  expenses.1000,
  profit.1000,
  profit_afttax.1000,
  profit_margin,
  good_months,
  bad_months,
  best_month,
  worst_month
  )

m

library(rlang)
library(lobstr)

expr(mean(x, na.rm = TRUE))
#
expr(10 + 100 + 1000)
#
capture_it <- function(x) { # Fails
    expr(x)
}
capture_it(a + b + c)
#
capture_it <- function(x) {
    enexpr(x)
}
capture_it(a + b + c) # works!
#
#
f <- expr(f(x = 1, y = 2))

# Add a new argument
f$z <- 3
f
#
# Or remove an argument:
f[[2]] <- NULL
f
#
#
lobstr::ast(f(a, "b"))
#
lobstr::ast(f1(f2(a, b), f3(1, f4(2))))
#
lobstr::ast(1 + 2 * 3)
#
call2("f", 1, 2, 3)
#
call2("+", 1, call2("*", 2, 3))
#
xx <- expr(x + x)
yy <- expr(y + y)

expr(!!xx / !!yy)
#
cv <- function(var) {
    var <- enexpr(var)
    expr(sd(!!var) / mean(!!var))
}

cv(x)
cv(x + y)
#
eval(expr(x + y), env(x = 1, y = 10))

eval(expr(x + y), env(x = 2, y = 100))

x <- 10
y <- 100
eval(expr(x + y))
#
df <- data.frame(x = 1:5, y = sample(5))
eval_tidy(expr(x + y), df)
#
with2 <- function(df, expr) {
    eval_tidy(enexpr(expr), df)
}

with2(df, x + y)
with2(df, x * y)
with2(df, x / y)
#
with2 <- function(df, expr) {
    a <- 1000
    eval_tidy(enexpr(expr), df)
}
#
df <- data.frame(x = 1:3)
a <- 10
with2(df, x + a) # A ought to be 10, but is actually 1000 inside the function
#
with2 <- function(df, expr) {
    a <- 1000
    eval_tidy(enquo(expr), df)
}
a <- 10
with2(df, x + a)
#
#
#
#
#
#
#

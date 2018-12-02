#!/usr/bin/env ruby

=begin
Name: Amir Sotoodeh
Title: Ruby Programming Assignment
Class: CS4080
=end

#1. factor(x,y) : boolean - returns true if x is a factor of y.
def factor(x,y)
  if y % x == 0
    return true
  else
    return false
  end
end

puts "Two is a factor of 4: #{factor(2, 4)}"

#2. prime(x) : boolean - returns true if x is prime.
def prime(x)
  isPrime = true
  for i in 2..x/2
    if x % i == 0
      isPrime = false
    end
  end
  return isPrime
end

puts "7 is prime: #{prime(7)}"

#3. gcd(x,y) : int - computes the greatest common divisor for x and y.
def gcd(x, y)
  y == 0 ? x : gcd(y, x.modulo(y))
end

puts "GCD of 15 and 10: #{gcd(15, 10)}"

#4. perfect(x) : boolean - returns true if x is a perfect number.
def perfect(x)
  i=1
  sum=0
  while i < x do
    sum = (sum + i) if x % i == 0
    i = i + 1
  end
  if sum == x
    return true
  else
    return false
  end
end

puts "6 is a perfect number: #{perfect(6)}"

#5. amicable(x,y) : boolean - returns true if x and y are amicable numbers.
def divisors(num)
  (1..num/2).select { |n|num % n == 0 }
end

def amicable(x, y)
  sumX = divisors(x).inject(0) {|sum, i|  sum + i }
  sumY = divisors(y).inject(0) {|sum, i|  sum + i }
  if ((sumX == y) and (x == sumY))
    return true
  else
    return false
  end
end

puts "Is 220 and 284 an amicable pair: #{amicable(220, 284)}"

#6. occr(nums,x) : int - returns the number of times that x occurs in nums (which is an array (Ruby) or a list (SML)).
def occr(nums, x)
  return nums.count(x)
end


LIST = [1, 2, 2, 3, 4, 5]

print "LIST="
print LIST
print "\n"
puts "Ocurrence of 2 in LIST: #{occr(LIST, 2)}"


#7. primes(nums) : list or array of int - returns a list (or array) with prime numbers contained in nums.
def primes(nums)
  listPrimes = []
  nums.each { |nums| if prime(nums); listPrimes.insert(-1, nums) end }
  return listPrimes
end

NUMBERS = [1,3,4,5,6,7,15,6,7, 8, 9, 11]
print "LIST="
print NUMBERS
print "\n"
puts "Primes in LIST: #{primes(NUMBERS)}"

#8. primeFactors(x) : list or array of int - returns a list (or array) containing the prime factors of x.
def primeFactors(x)
  listPrimeFactors = []
  factorsArray = divisors(x)
  factorsArray.each { |x| if prime(x); listPrimeFactors.insert(-1, x) end }
  return listPrimeFactors
end

puts "Prime factors of 10: #{primeFactors(10)}"

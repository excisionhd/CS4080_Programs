(* SML Programming Assignment *)

(* #1 factor(x,y) : boolean - returns true if x is a factor of y. *)
fun factor (x,y) = if y mod x = 0 then true else false;

(* #2 prime(x) : boolean - returns true if x is prime. *)
fun isPrime(n: int): bool =
  let fun getDivisors(m: int) =
    if n mod m = 0 then false
	else if m*m >= n then true
	else getDivisors(m+1)
  in
    getDivisors(2)
  end;


(* #3 gcd(x,y) : int - computes the greatest common divisor for x and y. *)
fun gcd(a : int, b : int): int =
  if b = 0
  then a
  else gcd(b, a mod b);

(* #4 perfect(x) : boolean - returns true if x is a perfect number. *)
fun isperfect n =
  let fun sumFactors(1) = 1
  | sumFactors(m) =
  if n mod m = 0
  then m + sumFactors(m-1) else sumFactors(m-1)
  in (n < 2) orelse (sumFactors(n div 2) = n)
  end;


(* #5 amicable(x,y) : boolean - returns true if x and y are amicable numbers. *)
fun divisors n =
  let
    fun computeDivisors 1 = [1]
      | computeDivisors x =
        if n mod x = 0 then x::computeDivisors(x-1)
        else computeDivisors(x-1);
  in
    computeDivisors(n div 2)
  end;

fun sum [] = 0
  | sum (x::l) =
    x + sum l;

fun amicable x y =
    if sum(divisors x) = y andalso sum(divisors y) = x then true else false;

(* #6 occr(nums,x) : int - returns the number of times that x occurs in nums (which is an array (Ruby) or a list (SML)). *)
fun occr(x,l::ls) =
    if x=l then  (1 + occr(x,ls)) else occr(x,ls) | occr(x,[]) = 0;

(* #7 primes(nums) : list or array of int - returns a list (or array) with prime numbers contained in nums. *)
fun prime(L) = if (L=[]) then []
  else (if not (isPrime(hd(L))) then prime(tl(L))
  else hd(L)::prime(tl(L)));

(* #8 primeFactors(x) : list or array of int - returns a list (or array) containing the prime factors of x. *)
fun getPrimeFactors n =
    prime(divisors n);

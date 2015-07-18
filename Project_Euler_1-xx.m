%Project Euler 1
%Sum of multiples of 3 or 5 <1000
sum( union([3:+3:999],[5:+5:999]) )

clear

%Project Euler 2
%sum of even fibonacci number <4 000 000
%transform parenthesis and curly brace into functions (matlab use
%parenthesis for both input and indexing :/
paren = @(x, varargin) x(varargin{:});
curly = @(x, varargin) x{varargin{:}};

%cr?er une fonction filter/select
iseven = @(x) ~logical(bitget(x,1)); %returns TRUE if number is even
%keep only even number in matrix A: A(iseven(A))

%Y = FILTER(B,A,X) filters the data in vector X with the
%    filter described by vectors A and B to create the filtered
%    data Y.  The filter is a "Direct Form II Transposed"
%    implementation of the standard difference equation:
% 
%    a(1)*y(n) = b(1)*x(n) + b(2)*x(n-1) + ... + b(nb+1)*x(n-nb)
%                          - a(2)*y(n-1) - ... - a(na+1)*y(n-na)
fib = @(n)filter(1,[1,-1,-1],[1,zeros(1,n-1)]);
n=1;
while paren(fib(n),n)<4e6
    n=n+1;
end;
A=fib(n-1); sum(A(iseven(A)))

%Project Euler 3
% Largest prime factor of 600851475143
max(factor(600851475143))

clear;

%Project Euler 4
%Largest palindrome product of 3-digit numbers : ie:   x*y = IJKKJI
tenpow = @(n) 10.^( floor( log10(n) ):-1:0 );   %powers of ten in descending order
decomp = @(i) floor(mod(i./tenpow(i),10));  %separate digits
isPalindrome = @(j) logical( isequal(j, fliplr(j) ) );
compoPaldec = @(k) isPalindrome(decomp(k)); %composition of function

A=[100:1:999].'*[100:1:999];   %.' fancy way to transpose ( A into A')
max(A(arrayfun(compoPaldec,A)))

clear;

%Project Euler 5



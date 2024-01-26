function eulerien=isEulerien(A)
n = size(A,2);
eulerien = 0;
C = graphPower(A,n-1);

if C == ones(n,n)
    eulerien = 1;
end

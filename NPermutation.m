function perm = NPermutation(n)
    if n == 1
        perm = 1;
    else
        k = factorial(n - 1);
        temp = ones(k,1) * n;
        perm = repmat([NPermutation(n-1), temp], n, 1);
        for i = 1 : n - 1
            j = i * k;
            perm(j+1 : j+k, n) = perm(j+1 : j+k, i+1);
            perm(j+1 : j+k, i+1) = temp;
        end
    end
end
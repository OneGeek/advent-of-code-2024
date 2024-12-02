{
    a[NR] = $1
    b[NR] = $2
}
END {
    n = asort(a, sortedA)
    asort(b, sortedB)
    sum=0
    for (i=1; i<=n; i++) {
        dist = sortedA[i] - sortedB[i]
        sum += dist < 0 ? -dist : dist
    }
    print sum
}

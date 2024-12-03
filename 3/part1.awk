BEGIN {
    FPAT = "mul\\([0-9]{1,3},[0-9]{1,3}\\)" 
}
{
    for (i=1; i<=NF; i++) {
        match($i, /\(([0-9]{1,3}),([0-9]{1,3})\)/, op)
        sum += op[1] * op[2]
    }
}
END { 
    print sum
}

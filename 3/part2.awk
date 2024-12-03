BEGIN {
    DO   = "do\\(\\)"
    DONT = "don't\\(\\)"
    MUL  = "mul\\(([0-9]{1,3}),([0-9]{1,3})\\)"
    FPAT = "(" DO ")|(" DONT ")|(" MUL ")"
}
{
    for (i=1; i<=NF; i++) 
             if ($i ~ DO  ) disabled=0
        else if ($i ~ DONT) disabled=1
        else if (!disabled) {
            match($i, MUL, op)
            sum += op[1] * op[2]
        }
}
END { print sum }

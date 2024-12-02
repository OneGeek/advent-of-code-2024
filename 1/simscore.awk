{
    appears[$1] = 1
    count[$2]++
}
END {
    n = length(count)
    sum = 0
    for (element in appears) {
        sum += element * count[element]
    }
    print sum
}

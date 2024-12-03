BEGIN {
    safe = 0
}
#areLevelsSafe($0) { print $0, "safe" }
#!areLevelsSafe($0) { print $0, "unsafe" }
#{ areLevelsSafe($0) }
areLevelsSafe($0) { safe++ }
END {
    print safe
}
function areLevelsSafe(line) {
    split(line, levels, " ")
    direction = (levels[1] - levels[2]) < 0 ? -1 : 1
    damped = 0
    print "\n", NR

    for (i=1; i<NF; i++) {
        d = delta(levels, i, i+1) * direction
        printf "%d+%d    ", levels[i], d
        if (!damped && !safeDelta(d)) {
            printf "damped"
            damped = 1
            d = delta(levels, i+1, i+2) * direction # compare with skip
            i++ # skip for next
            if (i == 1) {
                direction = (levels[1] - levels[3]) < 0 ? -1 : 1
            }
        }

        if (damped && !safeDelta(d) ) {
            printf "unsafe\n"
            return 0
        }
    }
    print

    return 1
}
function safeDelta(d) {
    return d >= 1 && d <= 3
}
function delta(levels, a, b) {
    return (levels[a] - levels[b])
}

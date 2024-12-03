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
    safeLevels = 1

    for (i=1; i<NF; i++) {
        delta = (levels[i] - levels[i+1]) * direction
        if (delta < 1 || delta > 3) {
            if (!damped) {
                damped = 1
                i++
            }else {
                safeLevels = 0
            }
        }
    }
    return safeLevels
}

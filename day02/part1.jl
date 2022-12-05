using Pipe: @pipe

input = readlines("input.txt")

function score_match(line)
    score = 0

    L, R = split(line, " ")
    
    # dirty cast to char
    L = L[1] - 'A'
    R = R[1] - 'X'

    # win/loss/draw
    if L == R
        # draw
        score += 3
    elseif (L + 1) % 3 == R
        # win
        score += 6
    else
        # loss
        score += 0
    end

    # add per-play score
    score += R + 1

    return score
end

println(@pipe input |> map(score_match, _) |> sum)


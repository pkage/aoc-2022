using Pipe: @pipe
using Printf: @printf

input = readlines("input.txt")

function score_match(line)
    score = 0

    L, R = split(line, " ")
    
    # dirty cast to char
    L = L[1] - 'A'
    R = R[1] - 'X'

    # loss/draw/win
    if R == 0
        # loss
        score += 0
        score += mod((L - 1), 3) + 1
    elseif R == 1
        # draw
        score += L + 1
        score += 3
    else
        # win
        score += 6
        score += mod((L + 1), 3) + 1
    end

    # add per-play score
    # score += R + 1
    #
    @printf "%d %d %d\n" L R score


    return score
end

println(@pipe input |> map(score_match, _) |> sum)


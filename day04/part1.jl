using Pipe: @pipe

input = readlines("input.txt")

function process_line(line)
    r1, r2 = split(line, ",")
    
    r1s, r1e = split(r1, "-")
    r2s, r2e = split(r2, "-")

    r1s, r1e, r2s, r2e = parse.(Int64, [r1s, r1e, r2s, r2e])

    r1 = Set(r1s:r1e)
    r2 = Set(r2s:r2e)

    subsumes = max(length(r1), length(r2)) == length(union(r1, r2)) ? 1 : 0

    println(line, ' ', subsumes)

    return subsumes
end

println(@pipe input |> map(process_line, _) |> sum)

using Printf: @printf
using Pipe: @pipe

input = readlines("input.txt")

function item_to_priority(item)
    if 'a' <= item && item <= 'z'
        return 01 + (item - 'a')
    end

    if 'A' <= item && item <= 'Z'
        return 27 + (item - 'A')
    end

    @printf "Invalid item %s\n" item
end

function process_line(line)
    len = div(length(line), 2)

    left = Set(line[1:len]) 
    right = Set(line[len+1:end])

    intr = intersect(left, right)

    intr = [s for s in intr]

    values = @pipe intr |>
        map(item_to_priority, _) |>
        sum

    println(intr, values)

    return values
end

println(@pipe input |> map(process_line, _) |> sum)

# @debug item_to_priority('a')
# @debug item_to_priority('z')
# @debug item_to_priority('A')
# @debug item_to_priority('Z')



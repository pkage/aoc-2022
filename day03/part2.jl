using Printf: @printf
using Pipe: @pipe

input = readlines("input.txt")

groups = [ [input[i], input[i+1], input[i+2]] for i in 1:3:length(input) ]

println(groups)

function item_to_priority(item)
    if 'a' <= item && item <= 'z'
        return 01 + (item - 'a')
    end

    if 'A' <= item && item <= 'Z'
        return 27 + (item - 'A')
    end

    @printf "Invalid item %s\n" item
end


function process_group(group)

    intr = intersect(
        Set(group[1]),
        Set(group[2]),
        Set(group[3])
    )
    

    # println(Set(group[1]))

    intr = [s for s in intr]


    values = @pipe intr |>
        map(item_to_priority, _) |>
        sum

    println(intr, values)

    return values
end

println(@pipe groups |> map(process_group, _) |> sum)

# @debug item_to_priority('a')
# @debug item_to_priority('z')
# @debug item_to_priority('A')
# @debug item_to_priority('Z')



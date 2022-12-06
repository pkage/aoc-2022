using Pipe: @pipe
using Printf: @printf
using PrettyPrint
using DataStructures

input = read("input.txt", String)

boxes, moves = split(input, "\n\n")
moves = split(moves, "\n")

function load_boxes(boxes)
    # we want to turn this into a matrix of chars
    #
    # split into Vector{Vector{Char}} first
    boxes = [ [ c for c in l] for l in split(boxes, "\n") ]
    
    # and then into a Matrix{Char}
    boxes = mapreduce(permutedims, vcat, boxes)

    # take the transpose
    boxes = permutedims(boxes, (2,1))


    # take every fourth row to get a list of the actual boxes
    boxes = boxes[2:4:end,:]
    println(boxes)
    println(size(boxes))

    stacks = Dict{Int64, Vector{Char}}()

    for i in 1:size(boxes)[1]
        row = reverse(boxes[i,:])
        println(row)

        key = parse(Int64, row[1])
        stacks[key] = @pipe row[2:end] |> filter(x -> x != ' ', _)
    end

    pprintln(stacks)

    return stacks
end

function apply_move(move, stacks)
    quantity, from, to = parse.(Int64, split(move, " ")[2:2:end])
    @printf "    %d (%d -> %d)\n" quantity from to

    println(move)
    
    crate_cache = []

    for i in 1:quantity
        crate = pop!(stacks[from])
        push!(crate_cache, crate)
    end

    for i in 1:quantity
        crate = pop!(crate_cache)
        push!(stacks[to], crate)
    end


    return stacks
end

function read_tops(stacks)
    tops = [stacks[i][end] for i in 1:length(stacks)]
    return join(tops)
end

# boxes = permutedims(hcat(boxes))
stacks = load_boxes(boxes)
pprintln(stacks)

# moves
for move in moves
    if length(move) == 0
        continue
    end

    @printf "{%s}\n" move
    global stacks = apply_move(move, stacks)
    pprintln(stacks)
end

tops = read_tops(stacks)

@printf "tops: %s\n" tops


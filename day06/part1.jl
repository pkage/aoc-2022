using Printf

input = read("input.txt", String)

@printf "input length %d\n" length(input)

for i in 4:length(input)
    # @printf "\t%d\n" i
    chars = Set([
        input[i-3],
        input[i-2],
        input[i-1],
        input[i]
    ])

    if length(chars) == 4
        @printf "\t found at %d\n" i
        break
    end
end

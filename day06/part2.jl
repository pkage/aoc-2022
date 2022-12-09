using Printf

input = read("input.txt", String)
MSGLEN = 14

@printf "input length %d\n" length(input)
@printf "target length %d\n" MSGLEN

for i in MSGLEN:length(input)
    # @printf "\t%d\n" i

    chars::Set{Char} = Set([])
    
    for j in 0:(MSGLEN-1)
        push!(chars, input[i-j])
    end

    if length(chars) == MSGLEN
        @printf "\t found at %d\n" i
        break
    end
end

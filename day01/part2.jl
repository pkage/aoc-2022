using Pipe: @pipe

# read all lines into a vector
# all_readings = readlines("input.txt")
all_calories = read("input.txt", String)

# split by calorie
all_calories = split(all_calories, "\n\n")

# join together

function blocksum(cal)
    return @pipe cal |> split(_, "\n") |> filter(s -> length(s) != 0, _) |> map(s -> parse(Int64, s), _) |> sum(_)
end

elves = @pipe all_calories |> map(blocksum, _) |> sort!(_) |> reverse!(_)

println(sum(elves[1:3]))




# zip with itself, offset by one
# creates a list of tuples of (reading, previous_reading)
# pairs = zip(all_readings[2:end], all_readings)

# get the increases
# increases = filter(p -> p[1] > p[2], collect(pairs))

# print the length of the increases
# println(length(increases))

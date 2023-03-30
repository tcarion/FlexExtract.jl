function outer_vals(v::Vector{<:Real}, bounds)
    length(bounds) == 2 || error("bounds must contain 2 values")
    (bounds[1] < v[1] || bounds[2] > v[end]) && error("$bounds is outside of vector range")
    lower = v[findfirst(x -> x > bounds[1], v)-1]
    upper = v[findfirst(x -> x >= bounds[2], v)]
    lower, upper
end

function writelines(io::IO, lines::Vector{<:String})
    for line in lines Base.write(io, line*"\n") end
end

function writelines(path::String, lines::Vector{<:String})
    (tmppath, tmpio) = mktemp()

    writelines(tmpio, lines)

    close(tmpio)
    dest = path

    mv(tmppath, dest, force=true)
end
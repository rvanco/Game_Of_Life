matrix_base = zeros(10, 10)
ij_randoms = Array{Int}(undef, 0, 2)
i = 0
while i < 20
    ij_random = rand(1:10, (1,2))
    ij_randoms = vcat(ij_randoms, ij_random)
    i += 1
end

ij_randoms

length(ij_randoms[:,1])

for i in 1:length(ij_randoms[:,1])
    matrix_base[ij_randoms[i,1], ij_randoms[i,2]] = 1
end


matrix_base









[rand(1:2,(2,1))]


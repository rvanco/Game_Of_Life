using Plots

lines = 10
columns = 10
cubed = zeros(lines,columns)

coord_carns = Array{Int}(undef, 0, 2)
coord_herbs = Array{Int}(undef, 0, 2)
coord_vegs = Array{Int}(undef, 0, 2)

i = 0
while i < 3
    coord_carn = rand(1:lines, (1,2))
    coord_carns = vcat(coord_carns, coord_carn)

    coord_herb = rand(1:lines, (1,2))
    coord_herbs = vcat(coord_herbs, coord_herb)

    coord_veg = rand(1:lines, (1,2))
    coord_vegs = vcat(coord_vegs, coord_veg)
    i +=1
end

for i in 1:length(coord_carns[:,1])
    cubed[coord_vegs[i,1], coord_vegs[i,2]] = 2
    cubed[coord_herbs[i,1], coord_herbs[i,2]] = 3
    cubed[coord_carns[i,1], coord_carns[i,2]] = 4
end

heatmap(cubed)

# VEGETAUX :
new_coord_vegs = Array{Int}(undef, 0, 2)
for i in 1:length(coord_vegs)
    if coord_vegs[i,1] == coord_herbs[i,1] && coord_vegs[i,2] == coord_herbs[i,2]
        coord_veg = [[coord_vegs[i,1]],[coord_vegs[i,2]]]
        new_coord_vegs = vcat(new_coord_vegs, coord_veg)
    end
end
coord_vegs = copy(new_coord_vegs)

# HERBIVORES :
new_coord_herbs = Array{Int}(undef, 0, 2)
for i in 1:length(coord_herbs)
    if coord_herbs[i,1] == coord_herbs[i,1] && coord_herbs[i,2] == coord_herbs[i,2]
        coord_veg = [[coord_vegs[i,1]],[coord_vegs[i,2]]]
        new_coord_herbs = vcat(new_coord_herbs, coord_carn)
    end
end
coord_vegs = copy(new_coord_vegs)

# CARNIVORE :
new_coord_vegs = Array{Int}(undef, 0, 2)
for i in 1:length(coord_vegs)
    if coord_vegs[i,1] == coord_herbs[i,1] && coord_vegs[i,2] == coord_herbs[i,2]
        coord_veg = [[coord_vegs[i,1]],[coord_vegs[i,2]]]
        new_coord_vegs = vcat(new_coord_vegs, coord_carn)
    end
end
coord_vegs = copy(new_coord_vegs)
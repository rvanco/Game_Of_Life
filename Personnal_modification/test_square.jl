using Images, Colors, ColorSchemes, Plots

lines = 10
columns = 10
map = zeros(lines,columns)

############ INDEX :
# Land = 0 = Black = RGB{Float64}(0, 0, 0)
# Ocean = 1 = White = RGB{Float64}(1, 1, 1)
# grass = 2 = Green = RGB{Float64}(0, 1, 0)
# trees = 3 = Marron = RGB{Float64}(0.8, 0.5, 0)
# small herbivore = 4 = Light Blue = RGB{Float64}(0, 0.8, 1)
# big herbivore = 5 = Blue = RGB{Float64}(0, 0, 1)
# small carnivore = 6 = Yellow = RGB{Float64}(1, 1, 0)
# big carnivore = 7 = Red = RGB{Float64}(1, 0, 0)
############



            # Setting Starting coord :

coord_grass, coord_trees, coord_s_herbs, coord_b_herbs, coord_s_carns, coord_b_carns = Array{Int}(undef, 0, 2), Array{Int}(undef, 0, 2), Array{Int}(undef, 0, 2), Array{Int}(undef, 0, 2), Array{Int}(undef, 0, 2), Array{Int}(undef, 0, 2)

i = 0
while i < 2
    coord_gras = rand(1:lines, (1,2))
    coord_grass = vcat(coord_grass, coord_gras)

    coord_tree = rand(1:lines, (1,2))
    coord_trees = vcat(coord_trees, coord_tree)

    coord_s_herb = rand(1:lines, (1,2))
    coord_s_herbs = vcat(coord_s_herbs, coord_s_herb)

    coord_b_herb = rand(1:lines, (1,2))
    coord_b_herbs = vcat(coord_b_herbs, coord_b_herb)

    coord_s_carn = rand(1:lines, (1,2))
    coord_s_carns = vcat(coord_s_carns, coord_s_carn)

    coord_b_carn = rand(1:lines, (1,2))
    coord_b_carns = vcat(coord_b_carns, coord_b_carn)

    i += 1
end


            # Placing them on the map :

for i in 1:length(coord_grass[:,1])
    map[coord_grass[i,1], coord_grass[i,2]] = 2
    map[coord_trees[i,1], coord_trees[i,2]] = 3
    map[coord_s_herbs[i,1], coord_s_herbs[i,2]] = 4
    map[coord_b_herbs[i,1], coord_b_herbs[i,2]] = 5
    map[coord_s_carns[i,1], coord_s_carns[i,2]] = 6
    map[coord_b_carns[i,1], coord_b_carns[i,2]] = 7
end



            # Adding a border :
left_border, top_border, right_border, bottom_border = ones(lines, 1), ones(1, columns+1), ones(lines+1, 1), ones(1, columns+2)
map = vcat(hcat(vcat(top_border, hcat(left_border, map)), right_border), bottom_border)



# Creation of a personalized colomap :
mycmap = ColorScheme([RGB{Float64}(0, 0, 0), RGB{Float64}(1, 1, 1), RGB{Float64}(0, 1, 0), RGB{Float64}(0.8, 0.5, 0), RGB{Float64}(0, 0.8, 1), RGB{Float64}(0, 0, 1), RGB{Float64}(1, 1, 0), RGB{Float64}(1, 0, 0)])



            # First Diplay :
img_square = heatmap(map, c = cgrad(mycmap, 8, categorical=true))

































































for i in 1:
    for j in 1:
        # Grass :
        if map[i,j] == 2
        end
        # Trees :
        if map[i,j] == 3
        end
        # Small herbivore
        if map[i,j] == 4
        end
        # Big herbivore
        if map[i,j] == 5
        end
        # Small carnivore
        if map[i,j] == 6
        end
        # Big herbivore
        if map[i,j] == 7
        end
    end
end

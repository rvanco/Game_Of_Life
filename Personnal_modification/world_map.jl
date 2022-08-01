using Images, Colors

map_black_white = "/Users/renaudvanco/Desktop/Julia/Map_black_white.png"
img_continent = load(map_black_white)
img = Gray.(img_continent)
mat = convert(Array{Float64}, img)

for i in 1:785
    for j in 1:1303
        mat[i,j] = round(Int, mat[i, j])
    end
end

mask_continent = colorview(Gray, mat)

save("gray.png", mask_continent)


# Create the grid :
lines = 10
columns = 10
matrix_base = zeros(lines, columns)
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

# Plot the grid :
using PlotlyJS

data = matrix_base
plot(
    heatmap(
        z=data,
        colorscale="Greys",
    ),
    Layout(xaxis_showgrid=true, yaxis_showgrid=true)
)

left_border = zeros(lines, 1)
top_border = zeros(1, columns+1)
right_border = zeros(lines+1, 1)
bottom_border = zeros(1, columns+2)

matrix_base = hcat(left_border, matrix_base)
matrix_base = vcat(top_border, matrix_base)
matrix_base = hcat(matrix_base, right_border)
matrix_base = vcat(matrix_base, bottom_border)

data2 = matrix_base
plot(
    heatmap(
        z=data2,
        colorscale="Greys",
    ),
    Layout(xaxis_showgrid=true, yaxis_showgrid=true)
)

matrix_base[4,:]

# FOR LOOP
new_matrix = zeros(lines+2, columns+2)
for i in 2:lines
    for j in 2:columns
        neighbors = matrix_base[i-1, j-1] + matrix_base[i-1, j] + matrix_base[i-1, j+1] + matrix_base[i, j-1] + matrix_base[i, j+1] + matrix_base[i+1, j-1] + matrix_base[i+1, j] + matrix_base[i+1, j+1]

        # applying the rules :

        # If a cell is ON :
        if matrix_base[i, j] == 1
            # and has fewer than two neighbors that are ON, it turns OFF
            if neighbors < 2
                new_matrix[i, j] = 0
            # and has more than three neighbors that are ON, it turns OFF
            elseif neighbors > 3
                new_matrix[i, j] = 0
            # and has either two or three neighbors that are ON, it remains ON
            else
                new_matrix[i, j] = 1
            end
        end

        # If a cell is OFF and has exactly three neighbors that are ON, it turns ON.
        if matrix_base[i, j] == 0 && neighbors == 3
            new_matrix[i, j] = 1
        end
    end
end

data3 = new_matrix
plot(
    heatmap(
        z=data3,
        colorscale="Greys",
    ),
    Layout(xaxis_showgrid=true, yaxis_showgrid=true)
)



# make the grid evolve with time :



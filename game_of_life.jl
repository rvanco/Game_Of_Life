using PlotlyJS


# Create the grid :
lines = 100
columns = 100
matrix_base = zeros(lines, columns)
ij_randoms = Array{Int}(undef, 0, 2)
i = 0
while i < (lines*columns) *  10/100
    ij_random = rand(1:lines, (1,2))   # MUST BE A SQUARE => lines=columns
    ij_randoms = vcat(ij_randoms, ij_random)
    i += 1
end


for i in 1:length(ij_randoms[:,1])
    matrix_base[ij_randoms[i,1], ij_randoms[i,2]] = 1
end


# Add some border to be able to check every where :
left_border = zeros(lines, 1)
top_border = zeros(1, columns+1)
right_border = zeros(lines+1, 1)
bottom_border = zeros(1, columns+2)

matrix_base = hcat(left_border, matrix_base)
matrix_base = vcat(top_border, matrix_base)
matrix_base = hcat(matrix_base, right_border)
matrix_base = vcat(matrix_base, bottom_border)

# Plot the grid :
show_matrix = plot(
    heatmap(
        z=matrix_base,
        colorscale="Greys",
    ),
    Layout(xaxis_showgrid=true, yaxis_showgrid=true)
)

path = ""
savefig(show_matrix, path)


steps = 0
while steps < 100
    using PlotlyJS

    # Update the grid with all the rules :
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

    steps +=1

    matrix_base = copy(new_matrix)

    show_matrix = plot(
        heatmap(
            z=matrix_base,
            colorscale="Greys",
        ),
        Layout(xaxis_showgrid=true, yaxis_showgrid=true)
    )

    num = string(steps)
    path = "" * num * ".pdf"
    savefig(show_matrix, path)
 
end



# make the grid evolve with time :



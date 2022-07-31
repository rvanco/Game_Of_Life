using Plots

# Create the grid :
lines = 2070
columns = 3300
matrix_base = zeros(lines, columns)




for i in 1649:1670
    for j in 750:980
        matrix_base[i, j] = 1
    end
end

for i in 1627:1649
    for j in 710:890
        matrix_base[i, j] = 1
    end
    for j in 970:1020
        matrix_base[i, j] = 1
    end
    for j in 1720:1810
        matrix_base[i, j] = 1
    end
end

for i in 1606:1627
    for j in 760:850
        matrix_base[i, j] = 1
    end
    for j in 1000:1280
        matrix_base[i, j] = 1
    end
    for j in 1720:1765
        matrix_base[i, j] = 1
    end
    for j in 2530:2560
        matrix_base[i, j] = 1
    end
end

for i in 1584:1606
    for j in 510:530
        matrix_base[i, j] = 1
    end
    for j in 740:820
        matrix_base[i, j] = 1
    end
    for j in 980:1300
        matrix_base[i, j] = 1
    end
    for j in 2100:2150
        matrix_base[i, j] = 1
    end
    for j in 2340:2620
        matrix_base[i, j] = 1
    end
end

for i in 1563:1584
    for j in 420:510
        matrix_base[i, j] = 1
    end
    for j in 590:610
        matrix_base[i, j] = 1
    end
    for j in 770:870
        matrix_base[i, j] = 1
    end
    for j in 980:1330
        matrix_base[i, j] = 1
    end
    for j in 2080:2120
        matrix_base[i, j] = 1
    end
    for j in 2340:2640
        matrix_base[i, j] = 1
    end
end


show_matrix = heatmap(matrix_base)


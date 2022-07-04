# Conway_Game_Of_Life (Julia implementation)

little project to start with julia

### Conways’s Game Of Life is a Cellular Automation Method created by John Conway. This game was created with Biology in mind but has been applied in various fields such as Graphics, terrain generation,etc..

The “game” is a zero-player game, meaning that its evolution is determined by its initial state, requiring no further input. One interacts with the Game of Life by creating an initial configuration and observing how it evolves, or, for advanced “players”, by creating patterns with particular properties.

## Game's rules :

Because the Game of Life is built on a grid of nine squares, every cell has eight neighboring cells, as shown in the given figure. A given cell (i, j) in the simulation is accessed on a grid [i][j], where i and j are the row and column indices, respectively. The value of a given cell at a given instant of time depends on the state of its neighbors at the previous time step. Conway’s Game of Life has four rules. 

1- If a cell is ON and has fewer than two neighbors that are ON, it turns OFF
2- If a cell is ON and has either two or three neighbors that are ON, it remains ON.
3- If a cell is ON and has more than three neighbors that are ON, it turns OFF.
4- If a cell is OFF and has exactly three neighbors that are ON, it turns ON.

![GameOfLifeDiagram](https://user-images.githubusercontent.com/98898021/177128562-96358535-f088-47ab-9cd7-d42123042178.png)

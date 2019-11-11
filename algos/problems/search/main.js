//If you know a solution is not far from the root of the tree:
// BFS

//If the tree is very deep and solutions are rare: 
// BFS(DFS will take long)

//If the tree is very wide:
// DFS(BFS will need too much memory)

//If solutions are frequent but located deep in the tree:
// DFS

//Determining whether a path exists between two nodes:
// DFS

//Finding the shortest path:
// BFS

//      9
//  4       20
//1   6  15    170

// BFS[9, 4, 20, 1, 6, 15, 170]
// DFS[9, 4, 1, 6, 20, 15, 170]
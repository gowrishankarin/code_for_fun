
class Neighbor {
    constructor(vnum, neighbor) {
        this.vertexNum = vnum;
        this.next = neighbor;
    }
    
}

class Vertex {
    constructor(name, neighbors) {
        this.name = name;
        this.neighbors = neighbors;
    }
}

class Graph {
    constructor(isUndirected) {
        this.numberOfNodes = 0;
        this.adjacentList = {};
        this.isUndirected = isUndirected;
    }

    addVertex(node) {
        this.adjacentList[node] = [];
        this.numberOfNodes++;
    }

    addEdge(node1, node2) {
        this.adjacentList[node1].push(node2);
        this.adjacentList[node2].push(node1);
    }

    showConnections() {

        function getEdges(edges) {
            let output = '';
            for(let i= 0; i < edges.length; i++) {
                output = output + ' ' + edges[i];
            }
            return output;
        }

        let that = this;
        Object.keys(this.adjacentList).forEach(function(key) {
            console.log(key + ' --> ' + getEdges(that.adjacentList[key]));
        });

        return this.adjacentList;
    }

    indexForName(name) {
        //for(let i=0; i < this.adjacentList.length; i++) {
            if(this.adjacentList[name] !== null) {
                return true;
            }
        //}
    }

    dfs(v, isVisited) {
        visited[v] = true;
        

    }

    dfs_main() {
        let visited = [];
        for(let i=0; i < Object.keys(this.adjacentList).length; i++) {
            if(!visited[i]) {
                this.dfs(i, visited);
            }
        }
    }

    print() {

    }

}

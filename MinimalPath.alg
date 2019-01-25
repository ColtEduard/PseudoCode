// u - undiscovered                        -set (multime)-
// v - discovered but not analyzed         -stack (stiva)-
// w - discovered and completely analyzed  -stack (stiva)-
// N - all nodes                           -set (multime)-
// A - all arcs                            -set (multime)-

// p[x] - predecessor of x                       -array-
// d[x] - distance from s to x                   -array-
// s - starting node

// V(x)  neighbors of x

// *** Directed graph specific ***
// V+(x) succesors of x
// V-(x) predecessors of x

// *** Floyd-Warshall specific ***
// d[x, y] - distance from x to y               -matrix-
// d[x, y] - predecessor is x                   -matrix-

// Dijkstra specific: line 28
// Bellman-Ford specific: line 70
// Check if there are cycles of negative value: 114
// Floyd-Warshall specific: line 163
// Path: line 206


------ DIJKSTRA ALGORITHM ------
// we don't use Dijkstra for graphs that have arcs with negative values

dijkstraAlg
{
    // initialization
    w <- N;
    d[s] <- 0;
    p[s] <- 0;
    
    for(x in N\{s} )
    {
        d[x] <- MAX_VALUE;
        p[x] <- 0;
    }
    
    while ( !v.isEmpty() )
    {
        [ select x in w | d[x] = min{d[y] | y in w} ]
        
        w.remove(x);
        
        // y in V+(x) = y a succesor of x
        for(y in V+(x) & in w) // y - successors of x in w
        {
            if(d[y] > d[x] + v[x, y] )
            {
                d[y] <- d[x] + v[x, y];
                p[y] <- x;
            }
        }
        
    }
    
}

// at the end
// d[x] - distance from s to x
// with p we can get the path used

------------------------------------------------------------------------------

------ BELLMAN-FORD ALGORITHM ------
// we can use Bellman-Ford to check if there are cycles with negative values

bellmanFordAlg
{
    // initialization
    d[s] <- 0;
    p[s] <- 0;
    
    for( x in N\{s} )
    {
        d[x] <- MAX_VALUE;
        p[x] <- 0;
    }
    
    do
    {
        for(x in N)
        {
            d'[x] <- d[x];
        }
        
        for(y in N)
        {
            if(V-(y) ≠ 0)
            {
                // x' in V-(y) = x' a predecessor of y
                d[x] + v[x, y] <- min{d[x'] + v[x', y] | x' in V-(y) of y}
                
                if(d[y] > d[x] + v[x, y])
                {
                    d[y] <- d[x] + v[x, y];
                    p[y] <- x;
                }
            }
        }
       
        
    }until(d[x] == d'[x] for any x in N)

}

------------------------------------------------------------------------------

------ CHECK IF THERE ARE CYCLES OF NEGATIVE VALUE ------

bellmanFordAlg
{
    // initialization
    d[s] <- 0;
    p[s] <- 0;
    
    for( x in N\{s} )
    {
        d[x] <- MAX_VALUE;
        p[x] <- 0;
    }
    
    for(i = 1, n)
    {
        for(x in N)
        {
            d'[x] <- d[x];
        }
        
        for(y in N)
        {
            if(V-(y) ≠ 0)
            {
                // x' in V-(y) = x' a predecessor of y
                d[x] + v[x, y] <- min{d[x'] + v[x', y] | x' in V-(y) of y}
                
                if(d[y] > d[x] + v[x, y])
                {
                    d[y] <- d[x] + v[x, y];
                    p[y] <- x;
                }
            }
        }
       
        
    }
    if(d ≠ d')
    {
        write "there are cycles of negative value";
        break;
    }
    // else
    write "there are no cycles of negative value";   
}

------------------------------------------------------------------------------

------ FLOYD-WARSHALL ALGORITHM ------

floydWarshallAlgorithm
{
    // initialization
    for(i = 1, n)
    {
        for(i = 1, n)
        {
            // distance from i to j is the value of the arc [i, j]
            d[i, j] <- v[i, j];
            
            if( [i, j] in A)
            {
                p[i, j] <- i;
            } else 
                {
                    p[i, j] <- 0;
                }
        }
    }
    
    for(k = 1, n)
    {
        for(i = 1, n)
        {
            for(j = 1, n)
            {
                if(d[i, j] > d[i, k] + d[k, j] )
                {
                    d[i, j] <- d[i, k] + d[k, j];
                }
            }
        }
    }
}

// at the end
// d[x, y] = distance from x to y (for any [x, y] in A)
// we can use p to determine the path from x to y

------------------------------------------------------------------------------

------ PATH ------
// to determine the path along which node y was wisited we use
    // we recursively call path(starting node, predecessor[y])
    // until we reach node s
    
path(s, x)
{
    if(x == s) // we reached the starting node 
    {
        write s;
    } else if(p[x] == 0) // if(p[x, y] == 0) when using Floyd-Warshall
    // node x has no predecessor 
      {
        write "there is no path from s to x";
      } else
        {
            write y;
            path(s, p[y]); // path(s, p[x, y] ) when using Floyd-Warshall
        }
}

------------------------------------------------------------------------------


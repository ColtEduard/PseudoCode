// N  - all nodes                           -set (multime)-
// A  - all arcs                            -set (multime)-
// a  - an arc
// A' - arcs of the partial tree            -array of sets (vector de multimi)-
// N' - nodes of partial tree               -array of sets (vector de multimi)-

// v[x, x'] - value of the arc [x, x']

// *** Prim specific ***
// e[x'] - minimal cost arc x' we can use to connect to the current tree
// v[x'] - cost of arc e[x']

// *** Kruskal specific ***
// A - all arcs sorted by value

// Generic Algorithm: line 22
// Prim Algorithm: line 54
// Kruskal Algorithm: line 94
// Partial tree algorithm 1: line 118
// Partial tree algorithm 2: line 134

------ GENERIC ALGORITHM ------
genericAlgorithm
{
    // initialization
    for(i=1, n-1)
    {
        N[i] <- i;
        A[i] <- Ø;
    }
    
    for(k=1, n-1)
    {
        
        [ select a tree G[i] = (N[i], A[i]), N[i] ≠ Ø ]
        
        // we are looking for a tree that connects these 2 trees trough a minimal cost arc
        [ select an arc [x, x']  with the property that v[x, x'] = min{ v[y, y'] | v[y, y'] in A, y in N[i], y' in N[i] }
        
        [ select j with the property that x' in N[j] ]
        
        N[i].add( N[j] );
        N[j] <- Ø;
        A[i].add( A[j] );
        A[i].add( [x, x'] );
        
        if(k == n-1)
        A'.add(A);
    }
}

------------------------------------------------------------------------------

------ PRIM ALGORITHM ------

primAlgorithm
{
    
    // initialization
    N[1] <- Ø;
    N'[1].add(N);
    A' <- Ø;
    v[1] <- 0;
    
    for(x = 2, n-1)
    {
        v[i] <- MAX_VALUE;
    }
    
    while(N[1] ≠ N) 
    {
        [ select x in N'[1], with the property that v[x] = min{v[x] | x' in N[1] }
        N[1].add(x);
        N'[1].remove(x);
        
        if(x ≠ 1)
        {
            A'.add(e[x]);
        }
        
        for(x' in v[x] and N'[1])
        {
            if(v[x] > v[x, x'])
            {
                v[x'] <- v[x, x'];
                e[x'] <- [x, x'];
            }
        }
    }   
}

------------------------------------------------------------------------------

------ KRUSKAL ALGORITHM ------

kurskalAlg
{
    // initialization
    A' <- Ø;
   
    // All arcs are sorted by value
    for([x, y] in A)
    {
        if([x, y] forms a cycle with the arcs in A')
        {
            A'.add([x, y]);
        }
        
        if( A'.size() == n-1 )  // if there are n-1 arcs in A' stop
        {
            break;
        }
    } 
}

------------------------------------------------------------------------------

------ PARTIAL TREE ALGORITHM 1 ------

partialTreeAlgorithm
{
    // initialization
    A' <- Ø;
    
    for (i=1, n-1)
    {
        [ select an arc a in A that that forms no cycles with the arcs in A' ]
        A'.add(a);  
    }
}

------------------------------------------------------------------------------

------ PARTIAL TREE ALGORITHM 2 ------

partialTreeAlgorithm
{
    // initialization
    A'.add(A);
    
    for (i=m, n-1)
    {
        [ select an arc a in A that doesn't disconnet the graph A' ]
        A'.remove(a);  
    }
}







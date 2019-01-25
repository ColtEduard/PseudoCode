// u - undiscovered                        -set (multime)-
// v - discovered but not analyzed         -queue (coada)-
// w - discovered and completely analyzed  -queue (coada)-
// N - all nodes                           -set (multime)-
// A - all arcs                            -set (multime)-

// nc - ammount of connect components        
// Nc[nc] - nodes of the nc connect component -array of sets (vector de multimi)-

// p[x] - predecessor of x                    -array-
// l[x] - length of the path                  -array-
// s - starting node

// Breadth First Search: line 19
// Breadth First Complete Search: line 72
// Determine connectivity of a graph: line 127


------ BREADTH FIRST SEARCH ------
// to get as deep as possible
// we always select the oldest discovered node from the queue
// therefore v and w will be queues

BFSAlg
{
    // we discover the starting node
    v.add(s);  
    // all other nodes are undiscovered
    u.add(N);
    u.remove(s);
    
    // initializations
    w <- Ø; 
    t <- 1;
    l[s] <- 0; // we discovered node s at iteration 1
    
    for (x in N) 
        p[x] <- 0;

    for (x in u)
        l[x] <- MAX_VALUE;
    
    
    while ( !v.isEmpty() )
    {
        
        [ select the oldest node x from v ]
        for (y in v)
        {
            if(y in u)
            {
                v.add(y);
                u.remove(y);
                p[y] <- x;
                l[y] <- l[y] + 1;
            }
        }
            
            v.remove(x);
            w.add(x);
    }    
}

// at the end 
// w contains all accesible nodes from s
// p contains predecessors
// l[x] distance from s to node x
// with the help of p, we can draw an arborescence (Breadth First arborescence)

------------------------------------------------------------------------------

------ BREADTH FIRST COMPLETE SEARCH ------

BFCSAlg
{
    // we discover the starting node
    v.add(s);  
    // all other nodes are undiscovered
    u.add(N);
    u.remove(s);
    
    // initializations
    w <- Ø; 
    t <- 1;
    l[s] <- 0; // we discovered node s at iteration 1
    
    for (x in N) 
        p[x] <- 0;

    for (x in u)
        l[x] <- MAX_VALUE;
    
    while (w ≠ N) // while tere are still nodes not completely analyzed
    {
        while ( !v.isEmpty() )
        {
            
            [ select the oldest node x from v ]
            for (y in v)
            {
                if(y in u)
                {
                    v.add(y);
                    u.remove(y);
                    p[y] <- x;
                    l[y] <- l[y] + 1;
                }
            }
                
                v.remove(x);
                w.add(x);
        }   
        
        if( !u.isEmpty ) 
        {
            [ select a new starting node s from u ]
            v.add(s);
            u.remove(s);
            l[s] <- 0;
        }
        
    }
}

------------------------------------------------------------------------------

------ DETERMINE CONNECTIVITY OF A GRAPH ------

BreadthFirstSearchAlg
{
    // we discover the starting node
    v.add(s);  
    // all other nodes are undiscovered
    u.add(N);
    u.remove(s);
    
    // initializations
    w <- Ø; 
    t <- 1;
    nc <- 1; //there is at least 1 connect component
    l[s] <- 0; // we discovered node s at iteration 1
    
    for (x in N) 
        p[x] <- 0;

    for (x in u)
        l[x] <- MAX_VALUE;
    
    while (w ≠ N) // while tere are still nodes not completely analyzed
    {
        while ( !v.isEmpty() )
        {
            
            [ select the oldest node x from v ]
            for (y in v)
            {
                if(y in u)
                {
                    v.add(y);
                    u.remove(y);
                    p[y] <- x;
                    l[y] <- l[y] + 1;
                }
            }
                
                v.remove(x);
                w.add(x);
                Nc[nc].add(x);
        }   
        
        if( !u.isEmpty ) 
        {
            [ select a new starting node s from u ]
            v.add(s);
            u.remove(s);
            l[s] <- 0;
            nc++; // Not all nodes were accesible therefore there is at least one more connected component
        }
        
    }
}

------------------------------------------------------------------------------

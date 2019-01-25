// u - undiscovered                        -set (multime)-
// v - discovered but not analyzed         -stack (stiva)-
// w - discovered and completely analyzed  -stack (stiva)-
// N - all nodes                           -set (multime)-
// A - all arcs                            -set (multime)-

// nc - ammount of connect components        
// Nc[nc] - nodes of the nc connect component -array of sets (vector de multimi)-

// p[x] - predecessor of x                       -array-
// t1[x] - time node x was discovered            -array-
// t2[x] - time node x was completely analyzed   -array-
// s - starting node

// ***** Depth First Search: line 20
// ***** Depth First Complete Search: line 76
// ***** Determine Connectivity of a graph: line 137


------ DEPTH FIRST SEARCH ------
// to get as deep as possible
// we always select the last discovered but unanalyzed node
// therefore v and w will be stacks

DFSAlg
{
    // we discover the starting node
    v.add(s);  
    // all other nodes are undiscovered
    u.add(N);
    u.remove(s);
    
    // initializations
    w <- Ø; 
    t <- 1;
    t1[s] <- 1; // we discovered node s at iteration 1
    
    for (x in N) 
        p[x] <- 0;

    for (x in N)
    {
        t1[x] <- MAX_VALUE;
        t2[x] <- MAX_VALUE;
    }
    
    while ( !v.isEmpty() )
    {
        if( (x,y) in A & y in u )
        {
            [ select the newest node x from v ]
        
            v.add(y);
            u.remove(y);
            p[y] <- x;
            t++;
            t1[y] <- t;   
        } else
            {
                v.remove(x);
                w.add(x);
                t++;
                t2[x] <- t;
            }

    }    
}

// at the end 
// w contains all accesible nodes from s
// p contains predecessors
// with the help of p, we can draw an arborescence (Depth First arborescence)

------------------------------------------------------------------------------

------ DEPTH FIRST COMPLETE SEARCH ------

DFCSAlg
{
    // we discover the starting node
    v.add(s);  
    // all other nodes are undiscovered
    u.add(N);
    u.remove(s);
    
    // initializations
    w <- Ø; 
    t <- 1;
    t1[s] <- 1; // we discovered node s at iteration 1
    
    for (x in N) 
        p[x] <- 0;

    for (x in N)
    {
        t1[x] <- MAX_VALUE;
        t2[x] <- MAX_VALUE;
    }
    
    while (w ≠ N) // while tere are still nodes not completely analyzed
    {
        while ( !v.isEmpty() )
        {
            if( (x,y) in A & y in u )
            {
                [ select the newest node x from v ]
            
                v.add(y);
                u.remove(y);
                p[y] <- x;
                t++;
                t1[y] <- t;   
            } else
                {
                    v.remove(x);
                    w.add(x);
                    t++;
                    t2[x] <- t;
                }
    
        }    
    
        if( !u.isEmpty ) 
        {
            [ select a new starting node s from u ]
            v.add(s);
            u.remove(s);
            t++;
            t1[s] <- t;
        }
    }
}

------------------------------------------------------------------------------


------ DETERMINE CONNECTIVITY OF A GRAPH ------

DepthFirstSearchAlg
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
    t1[s] <- 1; // we discovered node s at iteration 1
    
    for (x in N) 
        p[x] <- 0;

    for (x in N)
    {
        t1[x] <- MAX_VALUE;
        t2[x] <- MAX_VALUE;
    }
    
    while (w ≠ N) // while tere are still nodes not completely analyzed
    {
        while ( !v.isEmpty() )
        {
            if( (x,y) in A & y in u )
            {
                [ select the newest node x from v ]
            
                v.add(y);
                u.remove(y);
                p[y] <- x;
                t++;
                t1[y] <- t;   
            } else
                {
                    v.remove(x);
                    w.add(x);
                    Nc[nc].add(x);
                    t++;
                    t2[x] <- t;
                }
    
        }    
    
        if( !u.isEmpty ) 
        {
            [ select a new starting node s from u ]
            v.add(s);
            u.remove(s);
            t++;
            t1[s] <- t;
            nc++; // Not all nodes were accesible therefore there is at least one more connected component
        }
    }
}


// at the end 
// nc - number of connected compoments
// Nc[nc] - nodes of the nc connect component
// p contains predecessors of each node
// with the help of p, we can draw an arborescence (Depth First arborescence)

------------------------------------------------------------------------------





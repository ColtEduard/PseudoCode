// u - undiscovered                        -set (multime)-
// N - all nodes                           -set (multime)-
// A - all arcs                            -set (multime)-

// nc - ammount of connect components        
// Nc[nc] - nodes of the nc connect component -array of sets (vector de multimi)-

// s - starting node
// p[x] - predecessor of x                       -array-


// *** Breadth First specific ***
// v - discovered but not analyzed         -queue (coada)-
// w - discovered and completely analyzed  -queue (coada)-
// l[x] - length of the path                     -array-


// *** Depth First specific ***
// v - discovered but not analyzed         -stack (stiva)-
// w - discovered and completely analyzed  -stack (stiva)-
// t1[x] - time node x was discovered            -array-
// t2[x] - time node x was completely analyzed   -array-


// *****Breadth First Search: line 29
// *****Depth First Search: line 94


------ DETERMINE CONNECTIVITY OF A GRAPH USING BREADTH FIRST SEARCH ------

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

// at the end 
// nc - number of connected compoments
// Nc[nc] - nodes of the nc connect component
// p contains predecessors of each node
// with the help of p, we can draw an arborescence (Breadth First arborescence)

------------------------------------------------------------------------------


------ DETERMINE CONNECTIVITY OF A GRAPH USING DEPTH FIRST SEARCH ------

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

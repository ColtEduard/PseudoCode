// N - all nodes                           -set (multime)-
// A - all arcs                            -set (multime)-
// r[x, y] - residual capacity of the arc [x, y] 

// Generic Algorithm: line 8


------ GENERIC FLOW INCREASE ALGORITHM ------

genericAlgorithm
{
    f <- f0;
    [ establish the residual flow G(f) = (N, A(f) ]
    
    while(there is a path in the residual flow)
    {
        [ determine a flow increase path D ]
        [ determine residual capacity r[D] = min{r[x,y] | [x, y] in D } ]
        [ increase the flow with r[D] units ]
        [ update the residual flow G(f) = (N, A(f) ]
    } 
}

------------------------------------------------------------------------------
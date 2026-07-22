primitive somma(output z, input rin, input x, input y);
    table 
        // rin  x   y  :  z
           0    0   0  :  0;
           0    0   1  :  1;
           0    1   0  :  1;
           0    1   1  :  0;
           1    0   0  :  1;
           1    0   1  :  0;
           1    1   0  :  0;
           1    1   1  :  1;
    endtable
endprimitive

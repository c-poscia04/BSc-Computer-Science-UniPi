module fa(
    output z,    // Bit di somma
    output rout, // Riporto in uscita
    input x,     // Primo addendo
    input y,     // Secondo addendo
    input rin    // Riporto in ingresso
);

    // Il riporto in uscita e' 1 se almeno due ingressi sono a 1
    assign rout = (x && y) || (x && rin) || (y && rin);
    
    // La somma z segue la logica della parita'
    assign z = (!x && !y && rin) || (!x && y && !rin) || 
               (x && !y && !rin) || (x && y && rin);

endmodule

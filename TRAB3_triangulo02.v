module sign (
    input [11:0] X1, Y1, X2, Y2, X4, Y,
    output sign
);

    wire signed [11:0] Sub1, Sub2, Sub3, Sub4;
    wire signed [22:0] Mult1, Mult2, Sub5;

    assign Sub1 = X4 - Y2;
    assign Sub2 = Y1 - Y2;
    assign Sub3 = Y1 - X2;
    assign Sub4 = Y - Y2;
    assign Mult1 = Sub1 * Sub2;
    assign Mult2 = Sub3 * Sub4;
    assign Sub5 = Mult1 - Mult2;
    assign sign = (Sub5 >= 0) ? 1 : 0;

endmodule

module TestTriangle (
    input [11:0] X1, Y1, X2, Y2, X3, Y3, X4, Y,
    output inside
);

    wire sign1, sign2, sign3;

    assign inside = (sign1 == 1 && sign2 == 1 && sign3 == 1) ? 1:0;

    sign out1(X1, Y1, X2, Y2, X4, Y, sign1);
    sign out2(X2, Y2, X3, Y3, X4, Y, sign2);
    sign out3(X3, Y3, X1, Y1, X4, Y, sign3);

endmodule

module Test;
    reg [11:0] X1, Y1, X2, Y2, X3, Y3, X4, Y;

    wire inside;

    TestTriangle A(X1, Y1, X2, Y2, X3, Y3, X4, Y, inside);

    initial
        begin
           $dumpvars(0,A);
           #1

           X1 <= 10;
           Y1 <= 10;
           X2 <= 30;
           Y2 <= 10;
           X3 <= 20;
           Y3 <= 30;
           X4 <= 15;
           Y <= 15;

           #1
           X4 <= 15;
           Y <= 15;
           #1
           X4 <= 9;
           Y <= 15;
           #1
           X4 <= 10;
           Y <= 11;
           #1
           X4 <= 30;
           Y <= 11;
           #40
           $finish;
        end
endmodule
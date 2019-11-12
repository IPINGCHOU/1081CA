module alu32(
               src1,       //32 bit source 1 (input)
               src2,       //32 bit source 2 (input)
               less,       //1 bit less     (input)
               A_invert,   //1 bit A_invert (input)
               B_invert,   //1 bit B_invert (input)
               cin,        //1 bit carry in (input)
               operation,  //operation      (input)
               result,     //32 bit result   (output)
               cout,       //1 bit carry out (output)
               overflow    //1 bit overflow  (output)
               );


input [32-1:0]  src1, src2;
input 	        cin, less, A_invert, B_invert;
input [2-1:0]   operation;
output 	        cout;
output [32-1:0] result;
output 	        overflow;
wire [4-1:0]    c;
wire [8-1:0]    all_cout;

alu8 b1(
    .src1 (src1[8-1:0]),
    .src2 (src2[8-1:0]),
    .less (less),
    .A_invert (A_invert),
    .B_invert (B_invert),
    .cin (cin),
    .operation (operation),
    .result (result[8-1:0]),
    .cout (c[0]),
    .all_cout ()
);

alu8 b2(
    .src1 (src1[16-1:8]),
    .src2 (src2[16-1:8]),
    .less (1'b0),
    .A_invert (A_invert),
    .B_invert (B_invert),
    .cin (c[0]),
    .operation (operation),
    .result (result[16-1:8]),
    .cout (c[1]),
    .all_cout ()
);

alu8 b3(
    .src1 (src1[24-1:16]),
    .src2 (src2[24-1:16]),
    .less (1'b0),
    .A_invert (A_invert),
    .B_invert (B_invert),
    .cin (c[1]),
    .operation (operation),
    .result (result[24-1:16]),
    .cout (c[2]),
    .all_cout ()
);

alu8 b4(
    .src1 (src1[32-1:24]),
    .src2 (src2[32-1:24]),
    .less (1'b0),
    .A_invert (A_invert),
    .B_invert (B_invert),
    .cin (c[2]),
    .operation (operation),
    .result (result[32-1:24]),
    .cout (c[3]),
    .all_cout (all_cout)
);


assign cout = c[3];
assign overflow = c[3] ^ all_cout[6];

endmodule
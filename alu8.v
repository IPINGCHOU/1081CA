
module alu8(
            src1,       // 8 bit source 1      (input)
            src2,       // 8 bit source 2      (input)
            less,       // 1 bit less          (input)
            A_invert,   // 1 bit A_invert      (input)
            B_invert,   // 1 bit B_invert      (input)
            cin,        // 1 bit carry in      (input)
            operation,  // 2 bit operation     (input)
            result,     // 8 bit result        (output)
            cout,        // 1 bit carry out     (output)
            all_cout    // 8 bit carry out     (output)
            );

input [8-1:0]   src1, src2;
input           less;
input           A_invert;
input           B_invert;
input           cin;
input [2-1:0]   operation;
output          cout;
output [8-1:0]  result;
output [8-1:0]  all_cout;

wire [8-1:0]    res;
wire [8-1:0]    carry;

alu_top a1(
    .src1 (src1[0]),
    .src2 (src2[0]),
    .less (less),
    .A_invert (A_invert),
    .B_invert (B_invert),
    .cin (cin),
    .operation (operation),
    .result (res[0]),
    .cout (carry[0])
);

alu_top a2(
    .src1 (src1[1]),
    .src2 (src2[1]),
    .less (1'b0),
    .A_invert (A_invert),
    .B_invert (B_invert),
    .cin (carry[0]),
    .operation (operation),
    .result (res[1]),
    .cout (carry[1])
);

alu_top a3(
    .src1 (src1[2]),
    .src2 (src2[2]),
    .less (1'b0),
    .A_invert (A_invert),
    .B_invert (B_invert),
    .cin (carry[1]),
    .operation (operation),
    .result (res[2]),
    .cout (carry[2])
);

alu_top a4(
    .src1 (src1[3]),
    .src2 (src2[3]),
    .less (1'b0),
    .A_invert (A_invert),
    .B_invert (B_invert),
    .cin (carry[2]),
    .operation (operation),
    .result (res[3]),
    .cout (carry[3])
);

alu_top a5(
    .src1 (src1[4]),
    .src2 (src2[4]),
    .less (1'b0),
    .A_invert (A_invert),
    .B_invert (B_invert),
    .cin (carry[3]),
    .operation (operation),
    .result (res[4]),
    .cout (carry[4])
);

alu_top a6(
    .src1 (src1[5]),
    .src2 (src2[5]),
    .less (1'b0),
    .A_invert (A_invert),
    .B_invert (B_invert),
    .cin (carry[4]),
    .operation (operation),
    .result (res[5]),
    .cout (carry[5])
);

alu_top a7(
    .src1 (src1[6]),
    .src2 (src2[6]),
    .less (1'b0),
    .A_invert (A_invert),
    .B_invert (B_invert),
    .cin (carry[5]),
    .operation (operation),
    .result (res[6]),
    .cout (carry[6])
);

alu_top a8(
    .src1 (src1[7]),
    .src2 (src2[7]),
    .less (1'b0),
    .A_invert (A_invert),
    .B_invert (B_invert),
    .cin (carry[6]),
    .operation (operation),
    .result (res[7]),
    .cout (carry[7])
);

assign cout = carry[7];
assign result = res;
assign all_cout = carry;

endmodule
module wallace(a,b,o);
input [3:0]a;
input [3:0]b ;
output reg [7:0]o ;
reg [15:0]p;

reg [7:0]w ;
reg [7:0]m ;
reg [7:0]r ;
reg [7:0]s ;



always @(*)
begin

p[3:0]   = {4{b[0]} }& a;
p[7:4]   = {4{b[1]} }& a;
p[11:8]  = {4{b[2]} }& a;
p[15:12] = {4{b[3]} }& a;

w[1:0]= p[1]+p[4] ;  
w[3:2]=p[2]+ p[5]+ p[8] ;
w[5:4]=p[3] +p[6]+p[9];
w[7:6]=p[7]+p[10];

m[1:0]=w[2]+w[1];
m[3:2]=w[4]+w[3];
m[5:4]=w[6]+w[5];
m[7:6]=p[11]+w[7];

r[1:0]=m[2]+m[1];
r[3:2]=m[4]+m[3]+p[12];
r[5:4]=m[6]+m[5]+p[13];
r[7:6]=p[11]+m[7]+p[14];

s[1:0]=r[2]+r[1];
s[3:2]=r[4]+r[3];
s[5:4]=r[6]+r[5];
s[7:6]=p[15]+r[7];

o[0]=p[0];
o[1]=w[0];
o[2]=m[0];
o[3]=r[0];

o[4]=s[0];
o[5]=s[2];
o[6]=r[4];
o[7]=r[6];


end
endmodule


module fa(c,i,x,y,cin);
input x,y,cin;
output c,i;

assign {c,i}=x+y+cin;
endmodule

module ha(c,j,x,y);
input x,y;
output c,j;

assign {c,j}=x+y ;
endmodule
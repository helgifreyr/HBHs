(* ::Package:: *)

(* 25.2.13 *)


 (*<<NumericalMath`ListIntegrate` *)


Off[SetDelayed::"write"]
<<NumericalMath`ListIntegrate`


(* *)


 


Off[General::spell1]
Remove["Global`*"];
Unprotect[In,Out];
Clear[In,Out];

(* 1  2   3   4  5  6   7*)
(* nr,w,alpha,c1,c2,c3,rh*)
conf=ReadList["res.txt",{Number,Number ,Number ,Number ,Number,Number,Number }]

 
nr=conf[[1]][[1]];
rh= conf[[1]][[7]];
alfa= conf[[1]][[3]];
c1= conf[[1]][[4]];
c2= conf[[1]][[5]];
c3= conf[[1]][[6]]; 
w= conf[[1]][[2]]
 

Print["winding number n = ",nr];
Print["rh   = ",rh];
Print["alfa = ",alfa];
Print["c1(Phi^6) = ",c1];
Print["c2(Phi^4) = ",c2];
Print["c3(Phi^2) = ",c3]; 

gr=ReadList["gridx.dat",{Number}];


lgr=Length[gr];
nx=lgr;
Print["nx = ",nx];

listar=Table[gr[[k]][[1]],{k,1,lgr}] ;
listalogr=Table[Log[10,gr[[k]][[1]]],{k,1,lgr}];

 unghi0=ReadList["gridy.dat",{Number}];
ny=Length[unghi0];
Print["ny = ",ny];
unghi=Table[unghi0[[k]][[1]],{k,1,ny}]; 

(*unghi=Table[(k-1)*Pi/2/(ny-1),{k,1,ny}];*)

ntot=nx*ny;

a=ReadList["functf.dat",{Number,Number,Number,Number ,Number   }];


lung1=Length[a];


(*Datele sunt salvate direct cu indexarea globala*)
F1=Table[a[[k]][[1]],{k,1,lung1}];
F2=Table[a[[k]][[2]],{k,1,lung1}];
F0=Table[a[[k]][[3]],{k,1,lung1}];  
Z=Table[a[[k]][[4]],{k,1,lung1}];
W=Table[a[[k]][[5]],{k,1,lung1}]; 
  
(*Se construiesc ny liste pt. marimi de interes la unghiuri fixate *)
(*foarte util in reprezentari grafice *)

Do[

F1u[k]=Table[F1[[i]],{i,(k-1)*nx+1,k*nx}];
F2u[k]=Table[F2[[i]],{i,(k-1)*nx+1,k*nx}];
F0u[k]=Table[F0[[i]],{i,(k-1)*nx+1,k*nx}];  
Zu[k]=Table[Z[[i]],{i,(k-1)*nx+1,k*nx}]; 
Wu[k]=Table[W[[i]],{i,(k-1)*nx+1,k*nx}]; 

,{k,1,ny}];
 
 
as1=2;
as2=IntegerPart[ny/2];
as3=ny-1;

sa1=3;
sa2=IntegerPart[nx/2];
sa3=nx-1;


Print["rmax = ",gr[[nx]][[1]]];


(*%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 here I compute the radius of the ergoregion
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%*)


(*g[4,4]=-E^(2F0[r,t]) r^2/g[r] H[r]+E^(2F2[r,t])g[r]*(Sin[t])^2(W[r,t])^2;*)
(*
H[r_]:=Sqrt[r^2+rh^2]  /(rh+Sqrt[r^2+rh^2]);
g[r_]:=rh^2+r^2;
*)



gtt=Table[-E^(2F0u[ny]) listar^2/(listar^2+rh^2) Sqrt[listar^2+rh^2]  /(rh+Sqrt[listar^2+rh^2]) +E^(2F2u[ny])(listar^2+rh^2)*(Sin[\[Pi]/2])^2(Wu[ny])^2  ];


i=16;
gtt0=-E^(2F0u[ny][[i]]) listar[[i]]^2/(listar[[i]]^2+rh^2) Sqrt[listar[[i]]^2+rh^2]  /(rh+Sqrt[listar[[i]]^2+rh^2]) +E^(2F2u[ny][[i]])(listar[[i]]^2+rh^2)*(Sin[\[Pi]/2])^2(Wu[ny][[i]])^2


listgtt=Table[{listar[[i]],-E^(2F0u[ny][[i]]) listar[[i]]^2/(listar[[i]]^2+rh^2) Sqrt[listar[[i]]^2+rh^2]  /(rh+Sqrt[listar[[i]]^2+rh^2]) +E^(2F2u[ny][[i]])(listar[[i]]^2+rh^2)*(Sin[\[Pi]/2])^2(Wu[ny][[i]])^2 },{i,1,14}];





(*order=2;
igtt=ListInterpolation[gtt,{listar},InterpolationOrder->order];

asa=FindRoot[igtt[x]==0,{x,0.07}]
re= asa[[1]][[2]];
Print["radius ergoregion= ",re]*)


minF0=Min[F0] 
maxF0=Max[ F0 ] 
minF1=Min[F1] 
maxF1=Max[ F1 ] 
minF2=Min[F2] 
maxF2=Max[ F2 ] 
minW=Min[W] 
maxW=Max[ W ] 
maxZ=Max[ Z ] 
minZ=Min[Z] 

f0H=F0u[1][[1]]
f1H=F1u[1][[1]]
f2H=F2u[1][[1]]
ZH=Zu[ny][[1]]

 



n1=nx-123;

as=Table[{  F0u[as3][[i]]},{i,2,n1}] ;
Min[F0]


E^( 2Min[F0]) 


cut=2;


cut1= 2;
ni=200;

cut= 1;
cut

nf=nx- cut;


nf=nx- cut;


ct=1;
cut=1;

ini=5; 

Do[

data=Table[{listar[[i]] ,F0u[k][[i]]   },{i,nx-ini,nx-cut}];
u=Fit[data,{ 1/x ,1/x^2     } ,x];
cf01[k ]=Coefficient[u,1/x ];

data=Table[{listar[[i]] ,F1u[k][[i]]   },{i,nx-ini,nx-cut}];
u=Fit[data,{1/x ,1/x^2       } ,x]; 
cf11[k ]=Coefficient[u,1/x ];


data=Table[{listar[[i]] ,F2u[k][[i]]   },{i,nx-ini,nx-cut}];
u=Fit[data,{1/x ,1/x^2     } ,x];
cf21[k ]=Coefficient[u,1/x];

 data=Table[{listar[[i]] ,Wu[k][[i]]   },{i,nx-ini,nx-cut}];
u=Fit[data,{ 1/x^3,1/x^4     } ,x];
cW[k ]=Coefficient[u,1/x^3];

,{k,1,ny }]

f01=Table[cf01[k],{k,1,ny }] ;
f11=Table[cf11[k],{k,1,ny }] ;
f21=Table[cf21[k],{k,1,ny }] ;
W3=Table[cW[k],{k,1,ny }] ;

 constJINF=Sum[W3[[i]],{i,1,ny}]/ny


1-Max[f01]/Min[f01]
1-Max[f11]/Min[f11]
1-Max[f21]/Min[f21]
1-Max[W3]/Min[W3]


f01
1+(2f01+f11 )/(f21)






(*%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 crucial numerical test 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%*)

test1=1+(2f01+f11 )/(f21);
ListPlot[test1,PlotRange->All, Frame->True,Axes->None,PlotJoined->True];

err1=Max[Abs[test1]]


(*%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
PRELUCRARE  DATA infinity
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%*)


dat=ReadList["fx-inf.txt",{Number,Number ,Number ,Number,Number ,Number  }];
lung1=Length[dat] ;

r=Table[dat[[i]][[1]],{i,1,lung1}];
infF1=Table[dat[[i]][[2]],{i,1,lung1}]
infF2=Table[dat[[i]][[3]],{i,1,lung1}];
infF0=Table[dat[[i]][[4]],{i,1,lung1}]
infZ=Table[dat[[i]][[5]],{i,1,lung1}];



w


constINF=Sum[infF0[[i]],{i,1,ny}]/ny










(*%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
computation Mass from asymptotics
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%*)

(* th result:*) 
(*
Series[-g[4,4],{r,Infinity,1}]
1+(2 const-rh)/r+O[1/r]^2
*)

const=Sum[f01[[i]],{i,1,ny}]/ny;

Mc=  constINF;

MSch=rh/2 ;
Mass=MSch+Mc;

Print["Mass Schw     = ",MSch];
Print["Mass correction= ",Mc];
Print["total Mass     = ",Mass];

(*Print[ MSAdS/Mc ]*)


(* difference mass computed at infinity/mass interpolated *)
1-Abs[const/constINF] 






(*%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
PRELUCRARE  DATA t-0 -- no conical singularities
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%*)


dat=ReadList["f-t0.txt",{Number,Number ,Number ,Number,Number,Number  }];
lung1=Length[dat] 

r=Table[dat[[i]][[1]],{i,1,lung1}];
t0F1=Table[dat[[i]][[2]],{i,1,lung1}];
t0F2=Table[dat[[i]][[3]],{i,1,lung1}];
t0F0=Table[dat[[i]][[4]],{i,1,lung1}];
t0Z=Table[dat[[i]][[5]],{i,1,lung1}];

ratio= t0F2-t0F1;
ListPlot[t0F2]
ListPlot[ratio]
Max[ratio]




(*%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
PRELUCRARE HORIZON DATA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%*)


dat=ReadList["f-0.txt",{Number,Number ,Number ,Number,Number ,Number  }];
lung1=Length[dat] ;

unghi=Table[dat[[i]][[1]],{i,1,lung1}];
hF1=Table[dat[[i]][[2]],{i,1,lung1}]; 
hF2=Table[dat[[i]][[3]],{i,1,lung1}]; 
hF0=Table[dat[[i]][[4]],{i,1,lung1}]; 
hZ=Table[dat[[i]][[5]],{i,1,lung1}]; 
hW=Table[dat[[i]][[6]],{i,1,lung1}]; 


(*%%%%%%% Hawking temperature %%%%%%%%*)
TH0=1/(4 Pi rh) ;

THc=  1/lung1 Sum[ E^( (hF0[[i]]-hF1[[i]])),{i,1,lung1}];(* correction due to the scalar field*)
TH=TH0 THc;
Print["Schw temp. TH0= ",TH0]
Print["correction THc= ",THc]
Print["TH= ",TH]


errTH=1-Abs[Min[hF0-hF1] /Max[hF0-hF1]];
Print["error TH= ",errTH//N]




ListPlot[hF0 ]
ListPlot[hF0-hF1]


(* angular dependence of the entropy corrections *)
 ListPlot[hF1+hF2]


(* angular dependence of the scalar fied on the horizon *)

 ListPlot[hZ,PlotRange->All, Frame->True,Axes->None,PlotJoined->True];






(*%%%%%%% event horizon area %%%%%%%%*)
AH0=4 Pi rh^2;
 iAHc=Table[{unghi[[k]],1/2  Sin[unghi[[k]]] E^((hF1[[k]] +hF2[[k]] )) },{k,1,lung1 }];

(* 2 because I integrate between 0, Pi/2 *)
 AHc= 2Integrate[Interpolation[iAHc,InterpolationOrder->1][x],{x,0,Pi/2}];

AH=AH0 AHc;

Print["Schw area  AH0= ",AH0];
Print["correction AHc= ",AHc];
Print["Event horizon area =",AH];



(*%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
computation Le, Lp -- see MATH code for derivation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%*)

(*Le=2 E^F2[0,\[Pi]/2] \[Pi] rH*)
Le=2 E^hF2[[ny]] \[Pi] rh;
Print["Le = ",Le ];

(*Lp=2 \!\(
\*SubsuperscriptBox[\(\[Integral]\), \(0\), \(\[Pi]\)]\(\(
\*SuperscriptBox[\(E\), \(F1[0, t]\)]\ rH\) \[DifferentialD]t\)\)*)
Lp1= Table[{unghi[[k]],2 rh    E^hF1[[k]]   },{k,1,lung1 }];
Lp=  2ListIntegrate[Lp1,2]//N;(*factor 2: because I integrate [0,pi/2]*) 
Print["Lp = ",Lp ];
Print["  " ];


(* computation MASS from the energy momentum tensor - Smarr relation *)

asa1=2;
asa2=IntegerPart[ny/2];
asa3=ny-1;


 (* ordinea este: {T34,T44,Ttot}  *)
q=ReadList["T44.dat",{Number,Number,Number }];
lungq=Length[q];

diference=lungq-ntot;
Print["It must be zero! ",diference];
 

T34=Table[q[[k]][[1]],{k,1,lungq}]; 
ro=Table[q[[k]][[2]],{k,1,lungq}]; 
 Ttot=Table[q[[k]][[3]],{k,1,lungq}]; 

(*Se construiesc ny liste pt. marimi de interes la unghiuri fixate *)
(*foarte util in reprezentari grafice *)

Do[ 
T34u[k]=Table[T34[[i]],{i,(k-1)*nx+1,k*nx}]; 
rou[k]=Table[ro[[i]],{i,(k-1)*nx+1,k*nx}]; 
Ttotu[k]=Table[Ttot[[i]],{i,(k-1)*nx+1,k*nx}]; 
(*	Print[T44u[k]];*)
,{k,1,ny}]

 
(*%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 now I plot the energy density for three different angles
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%*)

ni=2;
cut=43;

t1=Table[{listar[[i]],-rou[asa1][[i]] },{i,ni,nx-cut}];
t2=Table[{listar[[i]],-rou[asa2][[i]] },{i,ni,nx-cut}];
t3=Table[{listar[[i]],-rou[asa3][[i]] },{i,ni,nx-cut}];
 
g1=ListPlot[t1,PlotRange->All,DisplayFunction->Identity, Frame->True,Axes->None ,PlotJoined->True];
g2=ListPlot[t2,PlotRange->All,DisplayFunction->Identity, Frame->True ,PlotJoined->True, PlotStyle->{RGBColor[1,0,0]}];
g3=ListPlot[t3,PlotRange->All,DisplayFunction->Identity, Frame->True ,PlotJoined->True, PlotStyle->{RGBColor[1,1,0]}];
(* Print["black: theta=0 "];*)


(*%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 now I plot the constraint T34 for three different angles
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%*)
t1=Table[{listar[[i]],T34u[asa1][[i]] },{i,ni,nx-cut}];
t2=Table[{listar[[i]],T34u[asa2][[i]] },{i,ni,nx-cut}];
t3=Table[{listar[[i]],T34u[asa3][[i]] },{i,ni,nx-cut}];	
 
g1=ListPlot[t1,PlotRange->All,DisplayFunction->Identity, Frame->True,Axes->None ,PlotJoined->True,PlotRange->All];
g2=ListPlot[t2,PlotRange->All,DisplayFunction->Identity, Frame->True ,PlotJoined->True, PlotStyle->{RGBColor[1,0,0]}];
g3=ListPlot[t3,PlotRange->All,DisplayFunction->Identity, Frame->True ,PlotJoined->True, PlotStyle->{RGBColor[1,1,0]}];
(* Print["black: theta=0 "];*)



(*%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 now I compute the scalar field contribution to the total mass
& Smarr law
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%*)
(* sqrt = E^(F0[r,t]+2 F1[r,t]+F2[r,t]) r Sqrt[g[r]] Sin[t]*)

(*Se construiesc ny liste pt. integralele marimilor de interes la unghiuri fixate *)

Do[

 Mio2[k]=Table[{listar[[i]], E^(F0u[k][[i]]+2 F1u[k][[i]]+F2u[k][[i]])  listar[[i]]  Sqrt[listar[[i]]^2+rh^2]  Ttotu[k][[i]]},{i,ni,nx-1}];

 Mio3[k]=Table[{listar[[i]], E^(F0u[k][[i]]+2 F1u[k][[i]]+F2u[k][[i]])  listar[[i]]  Sqrt[listar[[i]]^2+rh^2]  T34u[k][[i]]},{i,ni,nx-1}];

,{k,2,ny-1}];



(*Se construiesc ny liste pt. integralele marimilor de interes la unghiuri fixate *)
Do[
Ma2[k]=ListIntegrate[Mio2[k],2]//N;
Ma3[k]=ListIntegrate[Mio3[k],2]//N;
 ,{k,2,ny-1}];

 
Ma2[1]=Ma2[2];
Ma2[ny]=Ma2[ny-1];
 
Ma3[1]=Ma3[2];
Ma3[ny]=Ma3[ny-1];

 Minn2=Table[{unghi[[k]], Sin[unghi[[k]]] Ma2[k]},{k,1,ny}];
  Minn3=Table[{unghi[[k]], Sin[unghi[[k]]] Ma3[k]},{k,1,ny}];

 Mint=ListIntegrate[Minn2,2]//N; 
Jint=ListIntegrate[Minn3,2]//N; 
 Print["Mintegral = ",Mint];  
 Print["Jintegral = ",Jint];  






roH=Table[{unghi[[k]],-rou[k][[2]]},{k,1,ny-1}]; ListPlot[roH,PlotRange->All, Frame->True,Axes->None,PlotJoined->True];


 constJINF/2/Jint


(* Smarr law Schw BH;
MSch-2 TH0 1/4 AH0 
 *)

Print["total mass     = ",Mass];
Print["mass integral  = ",-Mint 1/2 2alfa^2];
Print["TH    = ",TH];
Print["AH     = ",AH];
Print["J     = ",1/2 constJINF];
Print["Q    = ",Jint];

Print["factor TH S    = ",2 TH 1/4 AH];
Print["factor OmegaHJ = ",2  w   (1/2 constJINF -Jint)];

Print[" "];

(* smarr relation *)
errSmarr=1-(Mass-2 TH 1/4 AH+2  w   (1/2 constJINF -Jint) )/(-Mint 1/2 2alfa^2); 

Print[" errSmarr= ",errSmarr]; 






(* difference mass computed at infinity/mass interpolated *)
1-Abs[const/constINF] 





asa= Table[{rh,alfa,c1,c2,c3,Jint,THc,Mc,AHc,err1,minF0,f0H,f1H,f2H,ZH,Mint,Le,Lp,w,constJINF,maxF0,minF1,maxF1,minF2,maxF2,minW,maxW,minZ,maxZ,errSmarr }] 


stmp=OpenAppend["tmp.txt"];
Write[stmp,asa];
Close[stmp] ;
 

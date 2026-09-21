(* ::Package:: *)

(* ::Title:: *)
(*Heine-Stieltjes Polynomial Approach*)


(* ::Text:: *)
(*Authors: *)
(*Xin Guan, Liaoning Normal University; email: ggguanxinnn@163.com*)
(*K. D. Launey, Louisiana State University; email: kristina@baton.phys.lsu.edu*)
(**)
(*(November, 2013)*)


BeginPackage[ "exactPairingHS`"]


(* ::Section:: *)
(*Heine-Stieltjes (HS)*)


Off[FindRoot::lstol];Off[FindRoot::cvmit];Off[FindRoot::jsing];


(* ::Text:: *)
(*EnergiesExactPairingHS calculates pairing energies based on different methods.*)
(**)
(*The following options can be given: *)
(* method	{NR,<iterMC>,<iterNR>}	Uses the Newton - Raphson (NR) method with *)
(* 							iterMC = number of sampling points *)
(* 							 iterNR = number of NR iterations*)
(* 			   		   	     [suitable for many pairs (k) and energy levels (n)];*)
(* 			   		    *)
(* 		{NRgst,<iterMC>,<iterNR>}	Uses the  Newton - Raphson (NR-gst) method with *)
(* 							iterMC = number of sampling points *)
(* 						 	iterNR = number of NR iterations*)
(* 			   		    	     [suitable to find the ground-state energy for many pairs (k) and energy levels (n)];*)
(* 			   		    *)
(*  		 {GB}				Uses the Gr \:0308obner basis (GB) method *)
(*  			  		   	     [suitable for a few pairs (k) and a few energy levels (n)].*)
(*  			  		   	     *)
(*Input: 		g ... pairing strength [energy units]*)
(* 		n ... number of single-particle levels*)
(* 		k ... number of pairs*)
(* 		rho2 ... twice \[Rho] (i.e., degeneracy)*)
(* 		en ... single-particle energies [energy units]*)
(* 		nev  ... number of eigenvalues to be listed in output*)
(* 		precision ... predefined level of precision (in finding a zero of a function)*)
(* 		accuracySingularity ... accuracy in finding BAE singularities*)
(* 		method ... (described above)		*)
(* 	*)
(* Output:	for NR and NRGst:*)
(* 		{# of pairs, runtime [s], list of the lowest <nev> pairing energies [energy units]}*)
(* 		for GB:*)
(* 		{# of pairs, runtime [s], list of the lowest <nev> pairing energies [energy units], {# of non-converged solutions,list of {index,non-converged solution}}}*)
(* 			  		   	     *)


EnergiesExactPairingHS[g_,n_,k_,rho2_,en_,nev_,precision_,accuracySingularity_,method_]:=
Module[{enshift,enwidth,enR,gR,Fv,a,solution,solReduced,iterMC,iterNR,t,output},
 {enshift,enwidth}=EnScale[g,n,k,rho2,en];Do[enR[i]=(en[i]-enshift)/enwidth,{i,1,n}];gR=g/enwidth;
 ConstructF[gR,n,k,rho2,enR,Fv,a];
 Which[
  method[[1]] === NR,iterMC=method[[2]];iterNR=method[[3]];t=Timing[solution=FindRootsHS[gR,n,k,rho2,enR,iterMC,iterNR,Fv,a,precision]],
  method[[1]] === NRgst,iterMC=method[[2]];iterNR=method[[3]];t=Timing[solution=FindRootsHSgst[gR,n,k,rho2,enR,iterMC,iterNR,Fv,a,precision]],
  method[[1]] === GB,t=Timing[solution=NSolveHS[k,Fv,a]],
  True,Print["energiesExactPairingHS::stop : Method not specified. >> method is either 'NR' or 'GB'"];Return[]];
 solReduced=RemoveSingularity[n,k,enR,solution,a,accuracySingularity]; (** removes solutions that yield singularity in BAEs **)
 output={k,t[[1]],Length[solReduced],
         EnExactPairing[k,solReduced,a,{enshift,enwidth}][[1;;Min[nev,Length[solReduced]]]]}; 
 If[method[[1]] === GB,
         AppendTo[output,NonConvergedSoltnsList[n,k,solReduced,Fv,a,{enshift,enwidth},precision]]]; (** lists non-converged NSolve solutions **)
 Return[output]
];


(* ::Text:: *)
(*Implements the variable scaling :*)


EnScale[g_,n_,k_,rho2_,en_]:=
Module[{sumE,numP,listSorted,e0,emax},
 listSorted=Sort[Table[{en[i],-rho2[i]},{i,1,n}]];
 sumE=0;numP=0;
 Do[If[numP<k,sumE+=listSorted[[i]][[1]]*Min[listSorted[[i]][[2]],k-numP];
              numP+=listSorted[[i]][[2]]
    ],{i,1,n}];
 e0=sumE/k-0.25`32*g*(-2*Sum[rho2[i],{i,1,n}]-2k+2);
 emax=Max[Table[(en[i]-e0),{i,1,n}]];
 Return[{e0,emax}]]; (** {shift,width} of energies **)


(* ::Text:: *)
(*Constructs matrices F and P :*)


ConstructF[g_,n_,k_,rho2_,en_,Fv_,a_]:=
Module[{x,y,V,pro,proInv,qq,ss,st,ct,F,P,v,Pv,b,solb,solb0},
 y[x]=Sum[a[i]x^i ,{i,0,k}];
 V[x]=Sum[b[i]x^i,{i,0,n-1}];
 pro=Product[(If[Abs[en[i]]>10^-5,2en[i],0.01`32]),{i,1,n}];
 proInv=If[pro>1,N[1/pro,32],pro=1`32];
  qq=Expand[Simplify[ 
      Product[(x-2en[i]),{i,1,n}]*proInv D[D[y[x],x],x]
      +(Expand[Expand[Sum[rho2[j]Product[(x-2en[i]),{i,1,n}]/(x-2en[j])*proInv,{j,1,n}]]]
        -Product[(x-2en[i]),{i,1,n}]*proInv/g) D[y[x],x]
      -V[x]y[x]]];
  ss[0]=qq/.{x-> 0};
  Do[ss[i]=Coefficient[qq,x^i],{i,1,n+k-1}];
  st=Flatten[Table[ss[i],{i,0,n+k-1}]];
  ct=Flatten[Table[a[i],{i,0,k}]];
  F=Table[Coefficient[ st[[i+1]],ct[[j+1]]],{i,0,k},{j,0,k}] ;
  P=Table[Coefficient[ st[[i+1]],ct[[j+1]]],{i,k+1,n+k-1},{j,0,k}];
  v=Table[a[i],{i,0,k}];
  Pv=P.v;
  solb=Solve[Pv==0,Table[b[i],{i,1,n-1}]];(** results for b[1],b[2],...,b[n-1] **)
  a[k]=1; (** set a[k]=1**)
  Fv=(F/.(Flatten[solb])).v;
  solb0=Solve[Fv[[k+1]]==0,b[0]];(** results for b[0]**)
  Fv=(Fv[[1;;k]]/.Flatten[solb0]) (** in terms of a[0], ..., a[k-1]**)
];


(* ::Text:: *)
(*Provides solutions for the coefficients {a}*)
(*   -- method used: Newton - Raphson method with a Monte Carlo sampling suitable for detecting low - lying states (NR)*)


FindRootsHS[g_,n_,k_,rho2_,en_,iterMC_,iterNR_,Fv_,a_,precision_]:=
 Module[{lim,lim2,xmin,xmax,v,sol,ui,Jmat},
	xmax=2*Max[Table[en[i],{i,1,n}]];
    lim=Table[Binomial[k,i]*(-xmax)^(k-i),{i,0,k-1}];
    v=Table[a[i],{i,0,k-1}];
    Jmat = Outer[D, Fv, v]; 
    sol={};
    Do[
     ui=FindRoot[Fv,
         (** Initial guesses (MC sampling can be adjusted here; current: lower-lying states): **)
         Table[{a[i],RandomReal[{-20*Sign[lim[[i+1]]],1.5*lim[[i+1]]}]},{i,0,k-1}], 
         Jacobian->Jmat,DampingFactor->2,MaxIterations->iterNR];
	 If[Length[Select[(Fv/.ui),Abs[#]>10^-precision&,1]]== 0 (** solution has converged **)
		&& Length[Cases[SetPrecision[(v/.sol),precision],SetPrecision[(v/.ui),precision],{1},1]]==0 (** and is new **)
        ,AppendTo[sol,ui]],
	{iC,1,iterMC}];
    Return[sol]];


(* ::Text:: *)
(*Provides solutions for the coefficients {a}*)
(*   -- method used: Newton - Raphson method with a Monte Carlo sampling suitable for detecting the lowest - lying states (NR - gst)*)


FindRootsHSgst[g_,n_,k_,rho2_,en_,iterMC_,iterNR_,Fv_,a_,precision_]:=
 Module[{xx,lim,lim2,v,sol,ui,Jmat},
    v=Table[a[i],{i,0,k-1}];
    Jmat = Outer[D, Fv, v]; 
    sol={};
    Do[
     ui=FindRoot[Fv,
         (** Initial guesses (MC sampling can be adjusted here; current: lowest-lying states): **)
         Table[{a[i],Binomial[k,i]*(-RandomReal[{-0.5,0.5}])^(k-i)},{i,0,k-1}], 
         Jacobian->Jmat,DampingFactor->2,MaxIterations->iterNR];
	 If[Length[Select[(Fv/.ui),Abs[#]>10^-precision&,1]]== 0 (** solution has converged **)
		&& Length[Cases[SetPrecision[(v/.sol),precision],SetPrecision[(v/.ui),precision],{1},1]]==0 (** and is new **)
        ,AppendTo[sol,ui]],
	{iC,1,iterMC}];
    Return[sol]];


(* ::Text:: *)
(*Provides solutions for the coefficients {a}*)
(*   -- method used: Gr \:0308obner basis (GB) method*)


NSolveHS[k_,Fv_,a_]:= 
Module[{v,sol},
 v=Table[a[i],{i,0,k-1}];
 sol=NSolve[Fv==0,v];
 Return[sol]];


(* ::Text:: *)
(*Calculates pairing energies and spectral parameters x:*)


EnExactPairing[k_,solutiona_,a_,enscale_]:=                             (** calculates the pairing energy given the {a} solutions **)
 Flatten[Sort[((Table[-a[i],{i,0,k-1}]/.solutiona)[[All,k;;k]])enscale[[2]]+2*k*enscale[[1]]]];


Findx[k_,solutiona_,a_,enscale_]:=                                     (** solves for the spectral parameters x **)
Module[{solx,poly,xR,x},solx={};
  poly=(Sum[a[i]*x^i,{i,0,k-1}]+x^k)/.solutiona;
  Do[AppendTo[solx,Table[(xR=Roots[poly[[i]]==0,x])[[j]][[2]],{j,1,k}]], {i, 1, Length[solutiona]}];
  Return[solx*enscale[[2]]+2*enscale[[1]]]]


(* ::Text:: *)
(*Auxiliary functions :*)


RemoveSingularity[n_,k_,en_,solutiona_,a_,accuracy_]:=Module[{x,poly}, (** removes singularities **)
 poly=(Sum[a[i]*x^i,{i,0,k-1}]+x^k)/.solutiona;
 Return[
  Delete[solutiona,Union[
   Cases[Position[poly/.x->Table[2en[i],{i,1,n}],t_/;Abs[t]< 10^-accuracy],t_:> {t[[1]]}]
  ]]]
];


DimSoltns[rho2_,n_,k_]:=                                               (** calculates the total number of solutions **)
 Length[Select[Tuples[Table[Table[jp,{jp,0,Min[k,-rho2[in]]}],{in,1,n}]],Total[#]== k&]]


NonConvergedSoltnsList[n_,k_,solutiona_,Fv_,a_,enscale_,precision_]:=  (** lists non-converged NSolve solutions **)
 Module[{countNc=0,ncList},ncList={};
  Do[ 
   If[Length[Select[(Fv/.solutiona[[iC]]),Abs[#]>10^-precision&,1]]!= 0,
     countNc++;AppendTo[ncList,{iC,(-a[k-1]/.solutiona[[iC]])*enscale[[2]]+2*k*enscale[[1]]}]],
  {iC,1,Length[solutiona]}];
  Return[{countNc,ncList}];
 ]


(* ::Section:: *)
(*Bethe ansatz equations (BAE)*)


FindRootsBAE[g_,n_,k_,rho2_,en_,x_]:=Module[{aa,solx,bae,vx},
 bae=Table[ Sum[2./(x[j]-x[i]),{j,1,i-1}]+Sum[2./(x[j]-x[i]),{j,i+1,k}]+(Sum[-rho2[j]/(x[i]-2en[j]),{j,1,n}]+1./g),{i,1,k}];
 vx=Table[x[i],{i,1,k}];
 solx=NSolve[bae==0,vx];Return[solx];
]


EnExactPairingBAE[g_,n_,k_,rho2_,en_,precision_]:=Module[{solxBAE,solBAE,x},
 solxBAE=FindRootsBAE[g,n,k,rho2,en,x];
 Return[Flatten[Sort[DeleteDuplicates[Re[SetPrecision[Sum[x[i],{i,1,k}]/.solxBAE,precision]]]]]];
 ]


EndPackage[]

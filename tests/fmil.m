function x=fmil(xi,tol)

lambda=0.65;
lambda1=1-lambda;
k=0;
criterio=1;
while(criterio>tol && k<100)
k=k+1
%x=lambda1*xi+lambda*1/log(xi); %s� converge com sub-relaxa��o forte, valor otimo lambda=0.35;
 x=lambda1*xi+lambda*exp(1/xi) %converge sem sub-relaxa��o, valor otimo lambda=0.65
criterio=abs(x-xi)
xi=x;
end

end

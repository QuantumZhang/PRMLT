function [y, sigma, p] = knRegPred(model, Xt, t)
% Prediction for Gaussian Process (kernel) regression model
% Written by Mo Chen (sth4nth@gmail.com).
kn = model.kn;
a = model.a;
X = model.X;
tbar = model.tbar;
y = a'*knCenter(kn,X,X,Xt)+tbar;

if nargout > 1
    beta = model.beta;
    U = model.U;

    sigma = sqrt(knCenter(kn,X,Xt)+1/beta-dot(XU,XU,1));
end

if nargin == 3 && nargout == 3
    p = exp(logGauss(t,y,sigma));
end
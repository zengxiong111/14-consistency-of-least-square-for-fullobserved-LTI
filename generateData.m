function [X_1,X_0,U_0,W_0] = generateData(A,B,cov_intial,cov_input,cov_noise,T)

n = size(A,1);
m = size(B,2);

x0 = mvnrnd(zeros(n,1),cov_intial*eye(n),1);
x0 = x0';

U_0 = mvnrnd(zeros(m,1),cov_input*eye(m),T);
U_0 = U_0';

% cov_noise = 1;
% T=1000;
W_0 = mvnrnd(zeros(n,1),cov_noise*eye(n),T);
W_0 = W_0';
%get bounded noise
% W_0_abs_max = max(abs(W_0),[],"all")
% W_0 = W_0 ./ W_0_abs_max;
% max(abs(W_0),[],"all")
 

X_all = zeros(n,T+1);

X_all(:,1) = x0;
for t =1:T
    X_all(:,t+1) = A * X_all(:,t) + B * U_0(:,t) + W_0(:,t);
end

X_0 = X_all(:,1 : T);
X_1 = X_all(:,2 : T+1);



end
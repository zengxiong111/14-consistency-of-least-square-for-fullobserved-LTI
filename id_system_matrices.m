function [A_hat,B_hat] = id_system_matrices(X_1,X_0,U_0,m)    


B_A_2 = X_1 * pinv([U_0;X_0]);
B_hat = B_A_2(:,1:m);
A_hat = B_A_2(:,m+1:end);

end
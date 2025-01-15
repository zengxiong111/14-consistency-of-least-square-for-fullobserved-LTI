clear

n=3;
m=1; %outout dimension
p=n; %input dimension
h = 2*n;

% noise level and input
sigma_u = 1;
sigma_w = 0.01;
sigma_v = 0.01;

%repeat the experiments to get the Monte Carlo estimation of the
%expectation
num_exp = 10;

r_all = [0.5 1 1.1];
num_r = size(r_all,2);

x1 = 0.1;
 
traj_length_all = 10*(1:15);
num_traj_length = size(traj_length_all,2);

all_loss_A_B_ls = zeros(num_exp, num_traj_length, num_r);

mean_loss_A_B_ls = zeros(num_traj_length, num_r);
var_loss_A_B_ls = zeros(num_traj_length, num_r);


for i = 1:num_r
    [A,B,C,D] = system_generation(r_all(i),m,n,p);
    for j = 1:num_traj_length
        for k = 1:num_exp
            [X_1,X_0,U_0,W_0] = generateData(A,B,x1,sigma_u,sigma_w,traj_length_all(j));
            [A_hat,B_hat] = id_system_matrices(X_1,X_0,U_0,m);
            
            all_loss_A_B_ls(k,j,i) =  norm([B_hat A_hat] - [B A], 'fro')/norm([B A], 'fro');
        end
        mean_loss_A_B_ls(j,i) = mean(all_loss_A_B_ls(:,j,i));
        var_loss_A_B_ls(j,i) = var(all_loss_A_B_ls(:,j,i));
    end
end

figure;
hold on;

errorbar(traj_length_all, mean_loss_A_B_ls(:,1),var_loss_A_B_ls(:,1),'-o','LineWidth',3); 
errorbar(traj_length_all,mean_loss_A_B_ls(:,2),var_loss_A_B_ls(:,2),'-o','LineWidth',3);  
errorbar(traj_length_all,mean_loss_A_B_ls(:,3),var_loss_A_B_ls(:,3),'-o','LineWidth',3);  

 

legend('r=0.5','r=1','r=1.001','Location','best' )
grid on;
ax = gca;
ax.LineWidth = 2;
ax.GridLineStyle = '--';
ax.GridAlpha = 0.8;
lgd.FontSize = 18;
xlabel('N','FontSize',18) ;
ylabel('Relative Error of A and B','FontSize',18) ;
set(gca,'FontSize',20)
  

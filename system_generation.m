function [A,B,C,D] = system_generation(r,m,n,p)

% diagonalizable system

A = zeros(n,n);

B = zeros(n,p);
C = zeros(m,n);

D = zeros(m,p);

B = normrnd(0,1/n,[n,p]);
C = normrnd(0,1/m,[m,n]);

A = rand(n);
A = r * A/vrho(A);

% the size of jodan block of r is equal to 1
% the size of jodan block of 0 is bigger than 1


% v=0.5;
% A = zeros(n,n);
% B = zeros(n,1);
% C = zeros(1,n);
% A(2:n-1,3:n) = v * eye(n-2);
% A(1,1) = r;
% A(1,2) = v;
% B(n,1) = v;
% B(1,1) = 0;
% C(1,1) = 1;
% D = zeros(m,p);

% the size of jodan block of r is bigger than 1

% v=0.5;
% A = zeros(n,n);
% B = zeros(n,1);
% C = zeros(1,n);
% A(2:n-1,3:n) = v * eye(n-2);
% A(1,2) = v;
% B(n,1) = v;
% B(1,1) = 0;
% C(1,1) = 1;
% D = zeros(m,p);
% for i=1:n
%     A(i,i) = r;
% end


% the possibly inconsistent example
% A = r*eye(n);
% B = eye(n);
%  C = zeros(m,n);
% 
% D = zeros(m,p);



 

end
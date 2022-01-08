function [a,c] = strict_part(dim)

a = eye(dim);
b = zeros(dim,1);
c = zeros(dim,2);

for T = 1:dim
    b(T,1) = T;
    head = fliplr(a(1:T,1:T));
    dia = diag(head);
    for j = 1:T
        a(T,j) = sum(dia(1:(T-j),1))+1;

end;
end;
c = [b a(:,1)];

%Visualisation
x = b;
y = a(:,1);
fprintf('Plotting Strict Partitions...\n');

figure
plot(x, y)
hold on
plot(x, y, 'rx', 'MarkerSize', 10)
xlabel('Integer', 'fontsize',20)
ylabel('#Strict Partitions','fontsize',20)
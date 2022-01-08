function [g,s,all] = part(dim)

g = eye(dim);
s = eye(dim);
b = zeros(dim,1);
%c = zeros(dim,2);

for T = 1:dim
    b(T,1) = T;
    if T >= 2
      head1 = fliplr(g(1:T-1,1:T-1));
      dia1 = diag(head1);
    endif
    head2 = fliplr(s(1:(T),1:(T)));
    dia2 = diag(head2);
    for j = 1:T
        if T >= 2
            g(T,j) = sum(dia1(1:(T-j),1))+1;
        endif
        s(T,j) = sum(dia2(1:(T-j),1))+1;

end;
end;

%Visualisation
x = b;
y1 = g(:,1);
y2 = s(:,1);

fprintf('Plotting both General & Strict Partitions...\n');

figure


plot(x, y1)
hold on
plot(x, y2)
hold on

legend('general','strict')

plot(x, y1, 'rx', 'MarkerSize', 10)
hold on
plot(x, y2, 'rx', 'MarkerSize', 10)

xlabel('Integer', 'fontsize',20)
ylabel('#Partitions','fontsize',20)


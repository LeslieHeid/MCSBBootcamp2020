%% Day 3 - 
%% (c) Generate a time series of pops with different starting pop x(1)
initial = linspace(.1,1,10);
len = length(initial);
r = 0.1;
k = 0.6;
figure(); hold on;
for j = 1:len
    x(1) = initial(j);
    N = [1 x(1)]; % initializing array
    for n=1:49
        x(n+1) = x(n) + r*(1 - x(n) / k)*x(n); 
        N = [N; n+1 x(n+1)]; % concatinating another n-x pair onto N
    end
    plot(N(:,1),N(:,2),'DisplayName',sprintf('x(1) = %.1f',x(1)));
    title('r = 0.1 and k = 0.6');
    xlabel('time');ylabel('population');
end
legend();
hold off;
%% (d) Same thing with different r
initial = linspace(.1,.80,5);
len = length(initial);
r = 2.1;
k = 0.6;
for j = 1:len
    x(1) = initial(j);
    N = [1 x(1)]; % initializing array
    for n=1:49
        x(n+1) = x(n) + r*(1 - x(n) / k)*x(n); 
        N = [N; n+1 x(n+1)]; % concatinating another n-x pair onto N
    end
    figure; clf;
    plot(N(:,1),N(:,2));
    title(['r = 2.1, k = 0.6, x(1) = ', num2str(x(1))]);
    xlabel('time');ylabel('population');ylim([0 1])
end
%% (e) Same thing with different r - looking for a 4 cycle
initial = linspace(.1,.80,5);
len = length(initial);
r = 2.5;
k = 0.6;
for j = 1:len
    x(1) = initial(j);
    N = [1 x(1)]; % initializing array
    for n=1:49
        x(n+1) = x(n) + r*(1 - x(n) / k)*x(n); 
        N = [N; n+1 x(n+1)]; % concatinating another n-x pair onto N
    end
    figure; clf;
    plot(N(:,1),N(:,2));
    title(['r = 2.5, k = 0.6, x(1) = ', num2str(x(1))]);
    xlabel('time');ylabel('population');ylim([0 1])
end
%% (f) impossible to find a 3-cycle
%% (g) plotting actual n-cycle values per r
x(1) = 0.4; % pop initial
k = 0.6;
r = linspace(0,3,100);
len = length(r);
N = zeros(len,1);
nmax = 1e4; % running the equation many, many times
for j = 1:len
    for n=1:nmax-1
        x(n+1) = x(n) + r(j)*(1 - x(n) / k)*x(n);
    end
    plot(ones(1,nmax/2)*r(j),x(nmax/2+1:end),'.');
    hold on;
end
hold off;
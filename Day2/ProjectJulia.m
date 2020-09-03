%% Day 2 - Project Julia
%% (a) & (b)
% c = -0.8; d = 0.156;
% c = .95; d = 0.275;
c = -0.8; d = exp(1)/10;
% x(1) = 0.1; y(1) = 0.1;
% 
% for n=1:21
%     x(n+1) = x(n)^2 - y(n)^2 + c;
%     y(n+1) = 2 * x(n) * y(n) + d;
% end
% figure(1);
% plot(1:22,x,'-ob')
% xlabel('n'); ylabel('x')
% %% (c)
% figure(2);
% plot(x,y,'pb')
% xlabel('x'); ylabel('y')
% %% (d)
% NSP = 100; % 100 Starting Points
% a = -2; b = 2;
% xStart = (b-a)*rand(NSP,1) + a; % vector of NSP random #s on [a,b]
% yStart = (b-a)*rand(NSP,1) + a;
% % check = [min(xStart) max(xStart) min(yStart) max(yStart)]
% %% (e)
% figure(3);clf;
% plot(xStart,yStart,'p')
% %% (f)
% kin = 1; kout = 1; % starting 2 vectors who will count who's in/out
% for i = 1:NSP
%     x(1) = xStart(i); y(1) = yStart(i);
%     for n=1:21
%         x(n+1) = x(n)^2 - y(n)^2 + c;
%         y(n+1) = 2 * x(n) * y(n) + d;
%     end
%     if abs(x(22)) < b && abs(y(22)) < b
%         Xin(kin) = x(1);
%         Yin(kin) = y(1);
%         kin = kin + 1;
%     else
%         Xout(kout) = x(1);
%         Yout(kout) = y(1);
%         kout = kout + 1;
%     end
% end
% figure(4);clf;
% plot(Xin,Yin,'pb', 'MarkerFaceColor','b');
% hold on;
% plot(Xout,Yout,'pr','MarkerFaceColor','r');
% hold off;
% %% (g)
% NSP = 1e5; % 100,000 Starting Points
% a = -2; b = 2;
% xStart = (b-a)*rand(NSP,1) + a; % vector of NSP random #s on [a,b]
% yStart = (b-a)*rand(NSP,1) + a;
% kin = 1; kout = 1; % starting 2 vectors who will count who's in/out
% for i = 1:NSP
%     x(1) = xStart(i); y(1) = yStart(i);
%     for n=1:21
%         x(n+1) = x(n)^2 - y(n)^2 + c;
%         y(n+1) = 2 * x(n) * y(n) + d;
%     end
%     if abs(x(22)) < b && abs(y(22)) < b
%         Xin(kin) = x(1);
%         Yin(kin) = y(1);
%         kin = kin + 1;
%     else
%         Xout(kout) = x(1);
%         Yout(kout) = y(1);
%         kout = kout + 1;
%     end
% end
% figure(5);clf;
% plot(Xin,Yin,'.b');
% hold on;
% plot(Xout,Yout,'.r');
% hold off;
%% (i) Bonus
NSP = 1e6; % 1,000,000 Starting Points
a = -2; b = 2;
xStart = (b-a)*rand(NSP,1) + a; % vector of NSP random #s on [a,b]
yStart = (b-a)*rand(NSP,1) + a;
exitTime = zeros(1,NSP);
for i = 1:NSP
    x = zeros(1,22); y = zeros(1,22);
    x(1) = xStart(i); y(1) = yStart(i);
    for n=1:21
        x(n+1) = x(n)^2 - y(n)^2 + c;
        y(n+1) = 2 * x(n) * y(n) + d;
        if abs(x(n+1)) > b || abs(y(n+1)) > b || n == 21
            exitTime(i) = n+1;
            break
        end
    end
end
figure(6);clf; hold on; box on;
scatter(xStart,yStart,10,exitTime);
colormap cool;

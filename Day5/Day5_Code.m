%% (d)

% parameters
Itot = 1;
Ktot = 1;
Ptot = 1;
k_onA = 10;
k_offA = 10;
k_onI = 10;
k_offI = 10;
k_catI = 10;
k_catA = 100;

% model equations
dAdt =@(A,AP,I,IK) (- k_onA * (Ptot - AP) * A) + (k_offA * AP) + (k_catA * IK);
dAPdt =@(A,AP,I,IK) (k_onA * (Ptot - AP) * A) - (k_offA * AP) - (k_catI * AP);
dIdt =@(A,AP,I,IK) (- k_onI * (Ktot - IK) * I) + (k_offI * IK) + (k_catI * AP);
dIKdt =@(A,AP,I,IK) (k_onI * (Ktot - IK) * I) - (k_offI * IK) - (k_catA * IK);

[T,X] = ode23s(@(t,x)[dAdt(x(1),x(2),x(3),x(4));dAPdt(x(1),x(2),x(3),x(4)); ...
    dIdt(x(1),x(2),x(3),x(4));dIKdt(x(1),x(2),x(3),x(4))], [0,1], [0.0,0.0,Itot,0.0] );

figure;
plot(T,X);
ylabel('concentration');
xlabel('t');

%% (e)
% parameters
Itot = 1;
Ktot = logspace(-3,2,50);
Ptot = 1;
k_onA = 10;
k_offA = 10;
k_onI = 10;
k_offI = 10;
k_catI = 10;
k_catA = 100;
A=[];

% model equations
for i=Ktot
    dAdt =@(A,AP,I,IK) (- k_onA * (Ptot - AP) * A) + (k_offA * AP) + (k_catA * IK);
    dAPdt =@(A,AP,I,IK) (k_onA * (Ptot - AP) * A) - (k_offA * AP) - (k_catI * AP);
    dIdt =@(A,AP,I,IK) (- k_onI * (i - IK) * I) + (k_offI * IK) + (k_catI * AP);
    dIKdt =@(A,AP,I,IK) (k_onI * (i - IK) * I) - (k_offI * IK) - (k_catA * IK);

    [T,X] = ode23s(@(t,x)[dAdt(x(1),x(2),x(3),x(4));dAPdt(x(1),x(2),x(3),x(4)); ...
        dIdt(x(1),x(2),x(3),x(4));dIKdt(x(1),x(2),x(3),x(4))], [0,1], [0.0,0.0,Itot,0.0] );

    A = [A, X(end,1)]; %store A
end

figure;
plot(Ktot,A,'+');
ylabel('Activated Protein');
xlabel('log K_{tot}');
set(gca, 'xscale', 'log')
%% (f)
% parameters
Itot = 100;
Ktot = logspace(-3,2,50);
Ptot = 1;
k_onA = 10;
k_offA = 10;
k_onI = 10;
k_offI = 10;
k_catI = 10;
k_catA = 100;
A=[];

% model equations
% for i = length(Ktot)  - do this then make i's below = Ktot(i)
for i=Ktot
    dAdt =@(A,AP,I,IK) (- k_onA * (Ptot - AP) * A) + (k_offA * AP) + (k_catA * IK);
    dAPdt =@(A,AP,I,IK) (k_onA * (Ptot - AP) * A) - (k_offA * AP) - (k_catI * AP);
    dIdt =@(A,AP,I,IK) (- k_onI * (i - IK) * I) + (k_offI * IK) + (k_catI * AP);
    dIKdt =@(A,AP,I,IK) (k_onI * (i - IK) * I) - (k_offI * IK) - (k_catA * IK);

    [T,X] = ode23s(@(t,x)[dAdt(x(1),x(2),x(3),x(4));dAPdt(x(1),x(2),x(3),x(4)); ...
        dIdt(x(1),x(2),x(3),x(4));dIKdt(x(1),x(2),x(3),x(4))], [0,1], [0.0,0.0,Itot,0.0] );

    A = [A, X(end,1)]; % store A
end

figure;
plot(Ktot,A,'+');
ylabel('Activated Protein');
xlabel('log K_{tot}');
set(gca, 'xscale', 'log')
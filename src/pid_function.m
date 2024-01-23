function [e_sum] = pid_function(X)
    Kp =  X(:,1);
    Ti = X(:, 2);
    Td = X(:,3);
    Upp = 0;
    Ypp = 0;
    Umin= -1;
    Umax = 1;
    Tp = 0.5;
    %% Wyznaczone wartości r1,r2,r0;
    r1 = Kp.*((Tp./(2.*Ti)) -2 *(Td./Tp) -1);
    r2 = Kp.*(Td./Tp);
    r0 = Kp.*(1+(Tp./(2*Ti)) + (Td./Tp));
    S = size(X,1);
    %% Inicjalizacja wektorów
    kk=1000;
    alpha1 = -1.489028;
    alpha2 = 0.535261;
    beta1 = 0.012757;
    beta2 = 0.010360;
    u = zeros(S,kk);
    y = zeros(S,kk);
    e = zeros(S,kk);
    x1 = zeros(S,kk);
    x2 = zeros(S,kk);
    yzad = ones(S,kk);
    yzad(:,1:260)=-1.33;
    yzad(:,261:451)= -0.35;
    yzad(:,452:700) = 0.62;
    yzad(:,701:1000) = -0.5;
    e_sum = zeros(S,1);
    for k=6:kk
        g1 = (exp(7.5 * u(:,k-5))-1)./(exp(7.5*u(:,k-5))+1);
        x1(:,k) = -alpha1 * x1(:,k-1) + x2(:,k-1) + beta1 * g1;
        x2(:,k) = -alpha2 * x1(:,k-1) + beta2 *g1;
        g2 = 1.2 * (1 - exp(-1.5 .* x1(:,k)));
        y(:,k) = g2;
        e(:,k)=(yzad(:,k)-y(:,k));
        e_sum =e_sum + e(:,k).^2;
        u(:,k)=r2.*e(:,k-2)+r1.*e(:,k-1)+r0.*e(:,k)+u(:,k-1);
        u(:,k) = max(min(u(:,k),Umax),Umin);
    end
end
clear all
% This program is used for symbolic formula computation
% It defines three DH matrices and corresponding parameters
% It computes DH transformations for a three-link chain and the overall linkage

syms th th1 th2 th3 th4 th5 thd outth al aa dd alp alp1 alp2 alp3 alp4 alp5 thetap alphap;
% Define vector a
l=1;
a = zeros(12, 1);
% Define vector alpha
alpha = [alp1,alp2,alp3,alp4,alp5];
% Define vector d
d = 0 .* ones(12, 1);
% Load symbolic toolbox

% Define parameter array
theta = [th1, th2,th3, th4,th5, th2];

trsum=eye(4);
for i=[1,2,3,4,5]
    trsum=trsum*DH(alpha(i),a(i),d(i),theta(i));
    if i==2
        trsum2=trsum;
    elseif i==3
        trsum3=trsum;
    elseif i==4
        trsum4=trsum;
    elseif i==5
        trsum5=trsum;
    end
end

outalp=trsum2(3,3); 
% For the 6R mechanism, the angle between the first and last axes of one inner 2R set, which serves as alpha of the outer 3R
% subs(outalp,alp,2/3*pi)
dh3=simplify(DH(0,0,0,thd)*DH(al,0,0,outth)*DH(0,0,0,-thd)); % outth corresponds to thetap
inner=solve(dh3(1:3,1:3)==trsum2(1:3,1:3),[thd,outth,al]); % Transform the inner 2R joint angles into the outer variable outth (used as theta for the outer 3R)
simplify(subs(inner.al,[alp1,alp2],[alp,alp]))

% outer=solve(eye(3)==trsum2(1:3,1:3),[th1,th2]) % Solve outer 2R, obtain th as a function of alp
% simplify(subs(trsum2,[th1,th2,alp1,alp2],[thetap,thetap,alphap,alphap])) % p
% simplify(subs(outer.th1,[th1,th2,alp1,alp2],[thetap,thetap,alphap,alphap]))

%outer=solve(eye(3)==trsum3(1:3,1:3),[th1,th2,th3]) % Solve outer 3R, obtain th as a function of alp
%simplify(subs(trsum2,[th1,th2,th3,alp1,alp2,alp3],[thetap,thetap,thetap,alphap,alphap,alphap])) % p
%simplify(subs(outer.th1,[th1,th2,th3,alp1,alp2,alp3],[thetap,thetap,thetap,alphap,alphap,alphap]))

outer=solve(eye(3)==trsum4(1:3,1:3),[th1,th2,th3,th4]) % Solve outer 4R, yielding tan^2(th) = cos(alp)
simplify(subs(trsum4,[th1,th2,th3,th4,alp1,alp2,alp3,alp4],[thetap,thetap,thetap,thetap,alphap,alphap,alphap,alphap])) % p
simplify(subs(outer.th1,[th1,th2,th3,th4,alp1,alp2,alp3,alp4],[thetap,thetap,thetap,thetap,alphap,alphap,alphap,alphap]))

%outer=solve(eye(3)==trsum5(1:3,1:3),[th1,th2,th3,th4,th5])

res=((tan(th1/2) + tan(th2/2) - tan(alp/2)^2*tan(th1/2) + tan(alp/2)^2*tan(th2/2))/(tan(alp/2)^2 + tan(th1/2)*tan(th2/2) + tan(alp/2)^2*tan(th1/2)*tan(th2/2) - 1))^2 - abs(3-2*sin(alp)^2*(1+cos(th2)));
simplify(solve(res==0,[th1]))

% simplify(outer.th1)
% simplify(subs(tan(outer.th1(1)/2)==tan(th/2),[alp,th],[acos(outalp),inner.outth(1)]))
% 
% double(tan(subs(inner.outth(1),[th1,th2,alp],[76.35/180*pi,76.35/180*pi,108/180*pi])/-2)) % tan(theta/2)
% double(subs(outalp,[th1,th2,alp],[76.35/180*pi,76.35/180*pi,108/180*pi]))
% double(2*subs(outalp,[th1,th2,alp],[76.35/180*pi,76.35/180*pi,108/180*pi])+1)


function plot_theta_curve()
    % Define the range of theta2 (in radians)
    theta2_rad = linspace(0, 2*pi, 100);

    % Compute corresponding theta1 (in radians)
    theta1_rad = 2 * atan(sqrt(3/2 * (1 - cos(theta2_rad))));

    % Convert radians to degrees
    theta2_deg = rad2deg(theta2_rad);
    theta1_deg = rad2deg(theta1_rad);

    % Plot the curve
    figure;
    plot(theta2_deg, theta1_deg, 'LineWidth', 1.5);
    xlabel('\theta_2 (deg)');
    ylabel('\theta_1 (deg)');
    title('Curve: \frac{3}{2} (1 - \cos(\theta_2)) = \tan^2 \left( \frac{\theta_1}{2} \right)');
    grid on;
end

function R=Trans(alp,a,th,d)
    Rzd=[rotationMatrix([0,0,1], th),zeros(3,3);
        crossProductMatrix([0,0,d])*rotationMatrix([0,0,1], th), rotationMatrix([0,0,1], th);];
    Rxa=[rotationMatrix([1,0,0], alp),zeros(3,3);
        crossProductMatrix([a,0,0])*rotationMatrix([1,0,0], alp), rotationMatrix([0,0,1], alp);];
    R=Rzd*Rxa;
end

function R = rotationMatrix(v, phi)
    % Input:
    % v: rotation axis vector
    % phi: rotation angle (in radians)
    % Normalize the rotation axis
    v = v / norm(v);
    % Compute rotation matrix components
    R = eye(3) + sin(phi) * crossProductMatrix(v) + (1 - cos(phi)) * crossProductMatrix(v)^2;
end

function A = crossProductMatrix(v)
    % Compute the skew-symmetric matrix of vector v (cross-product matrix)
    A = [0, -v(3), v(2);
         v(3), 0, -v(1);
         -v(2), v(1), 0];
end

function DH_matrix = DH(alpha, a, d, theta)
    % Input: alpha, a, d, theta
    % Generate DH transformation matrix
    DH_matrix = [
        cos(theta),             -sin(theta)*cos(alpha),    sin(theta)*sin(alpha),     a*cos(theta);
        sin(theta),             cos(theta)*cos(alpha),     -cos(theta)*sin(alpha),    a*sin(theta);
        0,                      sin(alpha),                 cos(alpha),                 d;
        0,                      0,                          0,                          1
    ];
end
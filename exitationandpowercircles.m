Vt=input('Vt=');
Ra=input('Ra=');
Xs=input('Xs=');
P=input('P=');
r=Vt/2*Ra;
r
R=sqrt(Vt/(2*Ra)*Vt/(2*Ra)-P/Ra);
R
Zs=sqrt(Xs*Xs+Ra*Ra);
Zs
a=-Vt/(2*Zs);
a
b=sqrt(r*r-Vt/(2*Zs)*Vt/(2*Zs));
b
x=a-R:0.001:a+R;
z=x-a;
y=sqrt(R.*R-z.*z)+b;
subplot(1,2,1);plot(x,y,'g');
hold on;
y=-sqrt(R.*R-z.*z)+b;
subplot(1,2,1);plot(x,y,'g');
grid on
x=a-r:0.001:a+r;
z=x-a;
y=sqrt(r.*r-z.*z)+b;
subplot(1,2,1);plot(x,y,'r');
hold on;
y=-sqrt(r.*r-z.*z)+b;
subplot(1,2,1);plot(x,y,'r');
for i=1:3
    If=r+R-2*R/i;
    x=-If:0.001:If;
    y=sqrt(If.*If-x.*x);
    subplot(1,2,1);plot(x,y);
end
for i=1:3
    If=r-R+2*R/i;
    x=-If:0.001:If;
    y=sqrt(If.*If-x.*x);
    subplot(1,2,1);plot(x,y);
end
If=r-R:0.01:r+R;
A=4.*(a.*a+b.*b);
B=-4.*(If.*If+a.*a+b.*b-R.*R).*a;
w=(If.*If+a.*a+b.*b-R.*R);
C=w.*w-4.*b.*b.*If.*If;
x1=(-B-sqrt(B.*B-4.*A.*C))./(2.*A);
x2=(-B+sqrt(B.*B-4.*A.*C))./(2.*A);
y1=sqrt(If.*If-x1.*x1);
y2=sqrt(If.*If-x2.*x2);
Ia1=sqrt((Vt/Zs+x1).*(Vt/Zs+x1)+y1.*y1);
Ia2=sqrt((Vt/Zs+x2).*(Vt/Zs+x2)+y2.*y2);
subplot(1,2,2);plot(If,Ia1,'g');
hold on
subplot(1,2,2);plot(If,Ia2,'g');
hold on
R=r;
If=r-R:0.01:r+R;
A=4.*(a.*a+b.*b);
B=-4.*(If.*If+a.*a+b.*b-R.*R).*a;
w=(If.*If+a.*a+b.*b-R.*R);
C=w.*w-4.*b.*b.*If.*If;
x1=(-B-sqrt(B.*B-4.*A.*C))./(2.*A);
x2=(-B+sqrt(B.*B-4.*A.*C))./(2.*A);
y1=sqrt(If.*If-x1.*x1);
y2=sqrt(If.*If-x2.*x2);
Ia1=sqrt((Vt/Zs+x1).*(Vt/Zs+x1)+y1.*y1);
Ia2=sqrt((Vt/Zs+x2).*(Vt/Zs+x2)+y2.*y2);
subplot(1,2,2);plot(If,Ia1,'r');
grid on
hold on
subplot(1,2,2);plot(If,Ia2,'r');
hold on


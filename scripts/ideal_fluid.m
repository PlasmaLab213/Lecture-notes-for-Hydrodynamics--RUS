[matX,matY]=meshgrid(-3:.3:3,-3:.3:3);
Z=(matX+1i*matY);
%mass source
V_ms=1./Z;

%point vortex
V_vort=1i./Z;

%cylinder no rotation
V_cyl=1-1./Z.^2;

%cylinder with rotation
circ=[.7 2 4]   
for i=1:3
    V_cylc{i}=1-1./Z.^2+1i*circ(i)./Z;
end

% visualize
figure;
vis(Z,V_ms.*(abs(Z)>1));
vis(Z,V_vort.*(abs(Z)>1));
vis(Z,V_cyl.*(abs(Z)>1));
% drawcircle(center=[0,0],radius=1)

figure;
for i=1:3
   vis(Z,V_cylc{i}.*(abs(Z)>1));
% drawcircle(center=[0,0],radius=1);
end

function vis(Z,V)
    nexttile; 
    p=pcolor(real(Z),imag(Z),abs(V));
    set(p,'LineStyle','none')
    hold on
    quiver(real(Z),imag(Z),real(V),-imag(V));
    set(gca,DataAspectRatio=[1 1 1]);
    colorbar;
    colormap jet;

end




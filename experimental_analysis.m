% Required Data: iout_star, vout, iout, vx, ckt_name

fignum=0;
Rout2 = diff(vout)./diff(iout);
ER = (iout-iout_star)./iout_star;

fignum = fignum+1;
figure(fignum)
plot(vx(2:end),Rout2,'r');
T = sprintf('R_{out} vs V_x - Circuit %s', ckt_name);
title(T, 'FontSize', 18);
xlabel('V_x (Volt)', 'FontSize', 16);
ylabel('R_{out} (K\Omega)', 'FontSize', 16);
set(gca,'fontsize',14)

fignum = fignum+1;
figure(fignum)
plot(vx,ER);
T = sprintf('E_R vs V_x - Circuit %s', ckt_name);
title(T, 'FontSize', 18);
xlabel('V_x (Volt)', 'FontSize', 16);
ylabel('E_R', 'FontSize', 16);
set(gca,'fontsize',14)

fignum = fignum+1;
figure(fignum)
plot(vx,iout);
T = sprintf('i_{out} vs V_x - Circuit %s', ckt_name);
title(T, 'FontSize', 18);
xlabel('V_x (Volt)', 'FontSize', 16);
ylabel('i_{out} (mA)', 'FontSize', 16);
set(gca,'fontsize',14)

fignum = fignum+1;
figure(fignum)
plot(vx,vout);
T = sprintf('V_{out} vs V_x - Circuit %s', ckt_name);
title(T, 'FontSize', 18);
xlabel('V_x (V)', 'FontSize', 16);
ylabel('V_{out} (V)', 'FontSize', 16);
set(gca,'fontsize',14)
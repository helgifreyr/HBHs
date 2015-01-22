from data import *
from pylab import *
import sys
import grapefruit

rc('font', family='serif', size=8)

def plot_BS(c2,r,g,b):
    B_gogn_1st = get_Bstar_data('1.0','*','1st',c2)
    B_gogn_2nd = get_Bstar_data('1.0','*','2nd',c2)
    B_ws_1st = B_gogn_1st[:,1]
    B_Ms_1st = B_gogn_1st[:,5]
    B_ws_2nd = B_gogn_2nd[:,1]
    B_Ms_2nd = B_gogn_2nd[:,5]
    B_ws = concatenate((B_ws_1st[::-1],B_ws_2nd))
    B_Ms = concatenate((B_Ms_1st[::-1],B_Ms_2nd))
    colB = grapefruit.Color.NewFromRgb(r, g, b)
    col = colB.MonochromeScheme()[0]
    # plot(B_ws_1st,B_Ms_1st,B_ws_2nd,B_Ms_2nd,'-',c=colB.html,ms=2.5,label=r'BSs: $c2='+c2+'$')
    plot(B_ws,B_Ms,'-',c=colB.html,ms=2.5,label=r'BSs: $c2='+c2+'$')

plot_BS('50.0',1,0,0)
plot_BS('100.0',0,1,0)
plot_BS('150.0',0,0,1)
plot_BS('200.0',1,1,0)
plot_BS('250.0',0,1,1)
plot_BS('300.0',1,0,1)
plot_BS('350.0',1,0,0.5)
plot_BS('400.0',0.5,0,1)
plot_BS('450.0',0,0.5,1)
plot_BS('500.0',0,0.5,0.5)
plot_BS('550.0',0.5,0.5,0.5)
plot_BS('600.0',0.5,1.0,0.5)
plot_BS('650.0',0.5,1.0,1.0)
plot_BS('700.0',1.0,1,0.5)
plot_BS('750.0',0.5,1,0)
plot_BS('800.0',0.5,1,1)
plot_BS('850.0',1,0.5,1)
plot_BS('900.0',1,1,0.5)
plot_BS('950.0',0.5,0,0.5)


xlabel(r'$w$')
ylabel(r'$M$')
xlim(0.70,1.0)
curve = genfromtxt('zero-mode')
curve_w = curve[:,0]
curve_M = curve[:,1]
plot(curve_w,curve_M,'m')
W = linspace(0.70,1.0,100)
M = lambda w: 1/(2*w)
plot(W,M(W),'k')
# legend(loc=2)
savefig('w-vs-M-BSs.png')

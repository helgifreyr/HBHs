from data import get_data
from pylab import *
import sys

m = sys.argv[1].replace('x','*')
w = sys.argv[2].replace('x','*')
branch = sys.argv[3].replace('x','*')
rh = sys.argv[4].replace('x','*')
c2 = sys.argv[5].replace('x','*')

gogn = get_data(m,w,branch,rh,c2)
rhs = gogn[:,0]
Js = gogn[:,5]
THs = gogn[:,6]
Mcs = gogn[:,7]
AHs = gogn[:,8]
suptitle(r'$m='+m+',w='+w+',rh='+rh+',c2='+c2+'$')
subplot(221)
xlabel(r'$r_H$')
ylabel(r'$J$')
plot(rhs,Js,'.',ms=2.0)
subplot(222)
xlabel(r'$r_H$')
ylabel(r'$T_H$')
plot(rhs,THs,'.',ms=2.0)
subplot(223)
xlabel(r'$r_H$')
ylabel(r'$M$')
plot(rhs,Mcs,'.',ms=2.0)
subplot(224)
xlabel(r'$r_H$')
ylabel(r'$A_H$')
plot(rhs,AHs,'.',ms=2.0)
savefig('m='+m+'-w='+w+'-rh='+rh+'-c2='+c2+'.png')

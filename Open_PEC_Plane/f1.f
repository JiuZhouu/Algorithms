      subroutine f1(n,a0,a1,a2,d0,qxx,qxy,qyy)
      call f2(n,a1,a2,d0,qn)
      call f2(n+2,a1,a2,d0,qn2)
      qxx=qn2*sin(a0)**2+qn*cos(2.*a0)*(n+2)*d0**2/(n+4)+
     &(1./cos(a1)**(n+2)-1./cos(a2)**(n+2))*sin(2.*a0)*d0**(n+4)/
     &(n+2)/(n+4)
      qxy=-qn2*sin(2.*a0)/2.+qn*sin(2.*a0)*(n+2)*d0**2/(n+4)+
     &(1./cos(a2)**(n+2)-1./cos(a1)**(n+2))*cos(2.*a0)*d0**(n+4)/
     &(n+2)/(n+4)
      qyy=qn2*cos(a0)**2-qn*cos(2.*a0)*(n+2)*d0**2/(n+4)+
     &(1./cos(a2)**(n+2)-1./cos(a1)**(n+2))*sin(2.*a0)*d0**(n+4)/
     &(n+2)/(n+4)
      return
      end

      subroutine self(bs,dx,dy,rxx,rxy,ryy)
      parameter (n0=20,ne=4)
      dimension x(ne),y(ne),d0(ne),t0(ne),t10(ne),t20(ne)
      complex i,gg,cn,pxx,pxy,pyy,pp,gxx,gxy,gyy,rxx,rxy,ryy
      i=(0,1)
      pi=3.141592653589793
      x(1)=-dx/2.
      x(2)=dx/2.
      x(3)=dx/2.
      x(4)=-dx/2.
      y(1)=-dy/2.
      y(2)=-dy/2.
      y(3)=dy/2.
      y(4)=dy/2.
      x0=0.
      y0=0.
c---------
      do 1 k=1,ne
        if (k.eq.ne) goto 2
           k1=k+1
        goto 3
 2         k1=1
 3      aa=y(k1)-y(k)
        bb=x(k)-x(k1)
        cc=-bb*y(k)-aa*x(k)
           ra=-(aa*x0+bb*y0+cc)/(aa**2+bb**2)
           xa=x0+aa*ra
           ya=y0+bb*ra
        d0(k)=sqrt((xa-x0)**2+(ya-y0)**2)
        d1=sqrt((x(k)-x0)**2+(y(k)-y0)**2)
        d2=sqrt((x(k1)-x0)**2+(y(k1)-y0)**2)
           if (xa.ge.0.and.ya.ge.0) goto 4
           if (xa.lt.0.and.ya.ge.0) goto 5
           if (xa.lt.0.and.ya.le.0) goto 6
           if (xa.ge.0.and.ya.le.0) goto 7
           goto 10
 4            t0(k)=asin(abs(ya/d0(k)))
           goto 10
 5            t0(k)=pi-asin(abs(ya/d0(k)))
           goto 10
 6            t0(k)=-pi+asin(abs(ya/d0(k)))
           goto 10
 7            t0(k)=-asin(abs(ya/d0(k)))
 10   t10(k)=-acos(d0(k)/d1)
      t20(k)=acos(d0(k)/d2)
 1    continue
c-----------
      gg=0.
      do 8 n=1,n0
         sn=0.
         do 9 k=1,ne
             call f2(n,t10(k),t20(k),d0(k),qn)
             sn=sn+qn
 9       continue
         na=1
         do 12 m=1,n+1
 12            na=na*m
         gg=gg+sn*(i*bs)**(n+1)/na
 8    continue
      ss=0.
      sa=0.
      do 11 k=1,ne
        c1=(1.+sin(t20(k)))*(1.-sin(t10(k)))
        c2=(1.-sin(t20(k)))*(1.+sin(t10(k)))
        ss=ss+d0(k)*log(c1/c2)/2.
        sa=sa+(tan(t20(k))-tan(t10(k)))*d0(k)**2/2.
 11   continue
      gg=gg+ss+i*bs*sa
c------------------------------
      gxx=0.
      gxy=0.
      gyy=0.
      do 20 k=1,ne
            a0=t0(k)
            a1=t10(k)
            a2=t20(k)
      up=log(abs(tan(pi/4.+a2/2.)))
      dw=log(abs(tan(pi/4.+a1/2.)))
        pxx=0.
        pxy=0.
        pyy=0.
           do 21 n=5,n0
                 na=1
              do 19 m=1,n
 19              na=na*m
              cn=(i*bs)**n/na
              call f1(n-5,a0,a1,a2,d0(k),qxx5,qxy5,qyy5)
              call f1(n-4,a0,a1,a2,d0(k),qxx4,qxy4,qyy4)
              call f1(n-3,a0,a1,a2,d0(k),qxx3,qxy3,qyy3)
           pxx=pxx+cn*(3*qxx5-3*i*bs*qxx4-qxx3*bs**2)
           pxy=pxy+cn*(3*qxy5-3*i*bs*qxy4-qxy3*bs**2)
           pyy=pyy+cn*(3*qyy5-3*i*bs*qyy4-qyy3*bs**2)
 21        continue
      call f1(1,a0,a1,a2,d0(k),qxx1,qxy1,qyy1)
      call f1(0,a0,a1,a2,d0(k),qxx0,qxy0,qyy0)
      wxx1=((1.-1.5*sin(a0)**2)*(up-dw)-sin(2.*a0)*(1./cos(a2)-
     &1./cos(a1))+(sin(a2)/cos(a2)**2-sin(a1)/cos(a1)**2)*
     &sin(a0)**2/2.)*d0(k)**3/3.
      wxx3=(sin(a2+2.*a0)-sin(a1+2.*a0)+(up-dw)*sin(a0)**2)*d0(k)
      wxy1=(2.*cos(2.*a0)*(1./cos(a2)-1./cos(a1))+1.5*(up-dw)*
     &sin(2.*a0)-(sin(a2)/cos(a2)**2-sin(a1)/cos(a1)**2)*
     &sin(2.*a0)/2.)*d0(k)**3/6.
      wxy3=-(2.*cos(a2+2.*a0)-2.*cos(a1+2.*a0)+sin(2.*a0)*(up-dw))*
     &d0(k)/2.
      wyy1=((1.-1.5*cos(a0)**2)*(up-dw)+sin(2.*a0)*(1./cos(a2)-
     &1./cos(a1))+(sin(a2)/cos(a2)**2-sin(a1)/cos(a1)**2)*
     &cos(a0)**2/2.)*d0(k)**3/3.
      wyy3=(-sin(a2+2.*a0)+sin(a1+2.*a0)+(up-dw)*cos(a0)**2)*d0(k)
        pxx=pxx-qxx1*bs**6/120.+i*qxx0*bs**5/12.+wxx1*bs**4/8.+
     &wxx3*bs**2/2.
        pxy=pxy-qxy1*bs**6/120.+i*qxy0*bs**5/12.+wxy1*bs**4/8.+
     &wxy3*bs**2/2.
        pyy=pyy-qyy1*bs**6/120.+i*qyy0*bs**5/12.+wyy1*bs**4/8.+
     &wyy3*bs**2/2.
        w61=2.*(cos(a2)**3-cos(a1)**3)/(3.*d0(k))
        w62=2.*(sin(a2)**3-sin(a1)**3)/(3.*d0(k))-(sin(a2)-
     &sin(a1))/d0(k)
        w5=w62*cos(2.*a0)-w61*sin(2.*a0)
           pxx=pxx+1.5*w5-(sin(a2)-sin(a1))/(2.*d0(k))
           pxy=pxy+0.5*(w61*cos(2.*a0)+w62*sin(2.*a0))
           pyy=pyy-1.5*w5-(sin(a2)-sin(a1))/(2.*d0(k))
c--------
           pp=0.
           do 22 n=3,n0
                 na=1
              do 23 m=1,n
 23              na=na*m
              cn=(i*bs)**n/na
              call f2(n-3,a1,a2,d0(k),q3)
              call f2(n-2,a1,a2,d0(k),q2)
              pp=pp+cn*(i*bs*q2-q3)
 22        continue
      pn1=d0(k)*(up-dw)
      sa=(tan(a2)-tan(a1))*d0(k)**2/2.
      pp=pp-i*sa*bs**3/2.-pn1*bs**2/2.
      gxx=gxx+pxx+pp
      gxy=gxy+pxy
      gyy=gyy+pyy+pp
 20   continue
      rxx=gg/(4.*pi)+gxx/(4.*pi*bs**2)
      rxy=gxy/(4.*pi*bs**2)
      ryy=gg/(4.*pi)+gyy/(4.*pi*bs**2)
      return
      end

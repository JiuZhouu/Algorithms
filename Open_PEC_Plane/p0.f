c     This is a main code for scattering by a 2D open PEC plane (zero 
c     thickness) using Nystrom method to solve EFIE.
      parameter (kx=50,ky=50,kt=kx*ky,mx=2*kt,ax=0.15,ay=0.15,bc=1.0)
      dimension x0(kt),y0(kt),ct(mx)
      integer ipiv(mx)
      complex zz(mx,mx),v(mx),i,c0,v0,rxx,rxy,ryy
      open(50,file='ct50a.dat')
      pi=3.141592653589793
      i=(0,1)
      bs=2.0*pi/bc
      c0=i*bs*120.0*pi
      dx=ax/kx
      dy=ay/ky
      do 1 n=1,ky
      do 1 m=1,kx
           nm=(n-1)*kx+m
           x0(nm)=dx/2.0+(m-1)*dx
           y0(nm)=dy/2.0+(n-1)*dy
 1    continue
c-------------------------------
        thi=0.
        phi=0.
        exi=120.0*pi
        eyi=0.
      do 2 m=1,kt
        write(*,*)m
      v0=exp(-i*bs*(x0(m)*sin(thi)*cos(phi)+y0(m)*sin(thi)*sin(phi)))
      v(m)=exi*v0/c0
      v(m+kt)=eyi*v0/c0
         do 3 n=1,kt
      if (x0(m).eq.x0(n).and.y0(m).eq.y0(n)) goto 4
      if (abs(x0(m)-x0(n)).le.ax/2..and.abs(y0(m)-y0(n)).le.
     &ay/2.) goto 6
      call far(bs,x0(m),y0(m),x0(n),y0(n),dx,dy,rxx,rxy,ryy)
            zz(m,n)=rxx
            zz(m,kt+n)=rxy
            zz(kt+m,n)=rxy
            zz(kt+m,kt+n)=ryy
      goto 3
 6    call near(bs,x0(m),y0(m),x0(n),y0(n),dx,dy,rxx,rxy,ryy)
            zz(m,n)=rxx
            zz(m,kt+n)=rxy
            zz(kt+m,n)=rxy
            zz(kt+m,kt+n)=ryy
      goto 3
 4    call self(bs,dx,dy,rxx,rxy,ryy)
            zz(m,n)=rxx
            zz(m,kt+n)=rxy
            zz(kt+m,n)=rxy
            zz(kt+m,kt+n)=ryy
 3       continue
 2       continue
c-----------------------------------------------
      call cgetrf(mx,mx,zz,mx,ipiv,info)
      call cgetrs('N',mx,1,zz,mx,ipiv,v,mx,info)
c-----------------------------------------------
      do 5 k=1,mx
           ct(k)=abs(v(k))
 5    continue
      write(50,*)ct
      end

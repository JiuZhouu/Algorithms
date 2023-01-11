      subroutine far(bs,x0,y0,x1,y1,dx,dy,rxx,rxy,ryy)
      complex i,rxx,rxy,ryy,gg,cc,dd,gxx,gxy,gyy
      pi=3.141592653589793
      i=(0,1)
           sa=dx*dy
           r=sqrt((x0-x1)**2+(y0-y1)**2)
           gg=exp(i*bs*r)/(4*pi*r)
           cc=(i*bs*r-1.)*gg/r**2
           dd=(3.-3.*i*bs*r-(bs*r)**2)*gg/r**2
             gxx=dd*(x0-x1)**2/r**2
             gxy=dd*(x0-x1)*(y0-y1)/r**2
             gyy=dd*(y0-y1)**2/r**2
                   rxx=sa*gg+sa*(gxx+cc)/bs**2
                   rxy=sa*gxy/bs**2
                   ryy=sa*gg+sa*(gyy+cc)/bs**2
       return
       end

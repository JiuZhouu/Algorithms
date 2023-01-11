      subroutine f2(n,a1,a2,d0,qn)
      integer v1,v2,fa,fb,p,q
      pi=3.141592653589793
      if (n.eq.0) goto 1
          if (mod(n+2,2).eq.0) goto 2
              m=(n+2-1)/2
              sm1=0.
              sm2=0.
              do 3 p=1,m-1
                  v1=1
                  v2=1
                  do 4 q=1,p
                      v1=v1*(m-q)
                      v2=v2*(2*m-2*q+1)
 4                continue
                  sm1=sm1+v2/cos(a1)**(2*m-2*p)/(v1*2**p)
                  sm2=sm2+v2/cos(a2)**(2*m-2*p)/(v1*2**p)
 3            continue
              sm1=sm1+1./cos(a1)**(2*m)
              sm2=sm2+1./cos(a2)**(2*m)
                      fa=1
                      fb=1
                      do 5 p=1,m
                          fa=fa*(2*p-1)
                          fb=fb*p
 5                    continue
                      fc=real(fa)/real(fb*2**m)
                      tt=tan(pi/4.+a1/2.)
                  sm1=sm1*sin(a1)/(2*m)+fc*log(tan(pi/4.+a1/2.))
                  sm2=sm2*sin(a2)/(2*m)+fc*log(tan(pi/4.+a2/2.))
              qn=(sm2-sm1)*d0**(n+2)/(n+2)
          goto 10
 2        m=(n+2)/2
              sm1=0.
              sm2=0.
              do 6 p=1,m-1
                  v1=1
                  v2=1
                  do 7 q=1,p
                      v1=v1*(m-q)
                      v2=v2*(2*m-2*q-1)
 7                continue
                  sm1=sm1+v1*2**p/cos(a1)**(2*m-2*p-1)/v2
                  sm2=sm2+v1*2**p/cos(a2)**(2*m-2*p-1)/v2
 6            continue
              sm1=sm1+1./cos(a1)**(2*m-1)
              sm2=sm2+1./cos(a2)**(2*m-1)
                  sm1=sm1*sin(a1)
                  sm2=sm2*sin(a2)
              qn=(sm2-sm1)*d0**(n+2)/(n+2)/(2*m-1)
          goto 10
 1    qn=(tan(a2)-tan(a1))*d0**2/2.0
 10   return
      end

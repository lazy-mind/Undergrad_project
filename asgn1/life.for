C * CSCI3180 Principles of Programming Languages
C *
C * --- Declaration ---
C *
C * I declare that the assignment here submitted is original except for source
C * material explicitly acknowledged. I also acknowledge that I am aware of
C * University policy and regulations on honesty in academic work, and of the
C * disciplinary guidelines and procedures applicable to breaches of such policy
C * and regulations, as contained in the website
C * http://www.cuhk.edu.hk/policy/academichonesty/
C *
C * Assignment 1
C * Name : Mao Yuxuan
C * Student ID : 1155062018
C * Email Addr : yxmao5@cse.cuhk.edu.hk
C */

C basic framework
C ------ start of the program
      program framework
      implicit none
C ------ rest of the program
      integer circle,row,col,still,times,cond1,cond2,a,b,bound,test
      integer nsize,tohere,ostatu
      character single
      character*100 name
      character*100 oname
      character*7 opart
      integer graph(1:102,1:82),turn(1:102,1:82)
      character*82 temp
      character*1000 filename
      test=1
      nsize=0
      a=1
      b=1
      row=100
      col=80
      circle=10
      name='test program'
      oname=''
      opart='for.txt'
      times=0
      still=0
      call getarg(1,filename)
C ------ reading the file
      open(unit=1, file=filename, status='old',
     +iostat=ostatu, action='read')
      if ( ostatu.NE.0 ) goto 888
      read(1,*) name
      read(1,*) circle
      read(1,*) row,col
      bound=col+2
  17  b=1
      read(1,'(A)') temp
  27  if(temp(b:b).EQ.'0') goto 47
      graph(a,b)=1
      goto 37
  47  graph(a,b)=0
  37  single=temp(b:b)
      b=b+1
      if(b.LE.col) goto 27
      a=a+1
      if(a.LE.row) goto 17  
      close(1)
C ------ get the outputfilename
  999 nsize=nsize+1
      single=name(nsize:nsize)
      if (single.NE.'\r') goto 999
      tohere=nsize-1
      oname=opart//oname
      single=name(tohere:tohere)
  995 oname=single//oname
      tohere=tohere-1
      single=name(tohere:tohere)
      if (tohere.GE.1) goto 995
C ------ doing the simulation
  100 cond1=0
      cond2=0
      call birth(graph,row,col,turn,cond1,cond2)
      if(cond1.EQ.0 .AND. cond2.EQ.0) goto 200
      if(times .EQ. circle) goto 201
      call update(graph,row,col,turn)
      times=times+1
      if(times .LE. circle) goto 100
C ------ writing the file part 1
  201 times=times+1
  200 open(UNIT=2,FILE=oname(1:nsize+6))
      a=1
  18  b=1
  28  if(b.LT.col) goto 58
      if(graph(a,b).EQ.0) goto 111
      write(2,45) '*'
      goto 68
 111  write(2,45) '0'
      goto 68
  58  if(graph(a,b).EQ.0) goto 222
      write(2,45) '*'
      goto 68
 222  write(2,45) '0'
      goto 68
  68  b=b+1    
      if(b.LE.col) goto 28
      write(2,15) '\r' 
      a=a+1
      if(a.LE.row) goto 18
C ---- write the output conclusion, part 2
      if(cond1.EQ.0 .AND. cond2.EQ.0) goto 300
      write(2,85) 'It is still not a still life even after '
      if (times-1.LT.10) goto 14
      if (times-1.LT.100) goto 24
      if (times-1.LT.1000) goto 34
      if (times-1.LT.10000) goto 44
      if (times-1.LT.100000) goto 54
  14  write(2,195) times-1
      goto 64
  24  write(2,295) times-1
      goto 64
  34  write(2,395) times-1
      goto 64
  44  write(2,495) times-1
      goto 64
  54  write(2,595) times-1
  64  write(2,85) ' steps.'
      goto 400
  300 if(times.EQ.0) goto 301
      goto 302
  301 write(2,85) 'It is a still life initially.'
      goto 400   
  302 write(2,85) 'It is a still life after '
      if (times.LT.10) goto 16
      if (times.LT.100) goto 26
      if (times.LT.1000) goto 36
      if (times.LT.10000) goto 46
      if (times.LT.100000) goto 56
  16  write(2,195) times
      goto 66
  26  write(2,295) times
      goto 66
  36  write(2,395) times
      goto 66
  46  write(2,495) times
      goto 66
  56  write(2,595) times
  66  write(2,85) ' steps.'
  400 write(2,15) '\r'
      close(2)
      goto 666
  888 print *,'file non-exist'
C ------ format specification
  15  format(A)
  25  format(I)
  35  format(I,X,I)
  45  format(A1,$)
  55  format(A1)
  65  format(I1,$)
  75  format(I1)
  85  format(A,$)
  195 format(I1,$)
  295 format(I2,$)
  395 format(I3,$)
  495 format(I4,$)
  595 format(I5,$)
C ------ end of the program
  666 stop
	    end
C ------
C ------
C ------
C ------ all the subroutine program
C ------ the subroutine program : birth
	  subroutine birth(graph,row,col,turn,cond1,cond2)
	    integer row,col,cond1,cond2
	    integer graph(1:102,1:82),turn(1:102,1:82)
	    integer a,b,count
	    a=1
      b=1
  10  b=1
  30  count=0
  	  if(a.GT.1 .AND. graph(a-1,b).EQ.1) count=count+1
      if(a.GT.1 .AND. b.GT.1 .AND. graph(a-1,b-1).EQ.1)count=count+1
      if(a.GT.1 .AND. b.LT.col.AND.graph(a-1,b+1).EQ.1)count=count+1          
      if(b.GT.1 .AND. graph(a,b-1).EQ.1) count=count+1
      if(b.LT.col .AND. graph(a,b+1).EQ.1) count=count+1
      if(a.LT.row .AND. graph(a+1,b).EQ.1) count=count+1
      if(a.LT.row.AND. b.GT.1 .AND.graph(a+1,b-1).EQ.1)count=count+1
      if(a.LT.row.AND.b.LT.col.AND.graph(a+1,b+1).EQ.1)count=count+1
      if(graph(a,b).EQ.0 .AND. count.EQ.3) goto 20
      if(graph(a,b).EQ.1 .AND. count.NE.3 .AND. count.NE.2) goto 50
      goto 40
  20  turn(a,b)=1
      cond1=1
      goto 40
  50  turn(a,b)=1
      cond2=1
      goto 40
  40  b=b+1
      if(b .LE. col) goto 30
      a=a+1
  	  if(a .LE. row) goto 10
	  return
	  end
C ------ the subroutine program : update
	  subroutine update(graph,row,col,turn)
	    integer row,col
	    integer graph(1:102,1:82),turn(1:102,1:82)
	    integer a,b
	    a=1
      b=1
  12  b=1
  22  if(turn(a,b).EQ.1) goto 32
  	  goto 42
  32  if(graph(a,b).EQ.1) goto 52
      graph(a,b)=1
      goto 42
  52  graph(a,b)=0
  42  turn(a,b)=0
      b=b+1
      if(b .LE. col) goto 22
      a=a+1
      if(a .LE. row) goto 12
	  return
	  end

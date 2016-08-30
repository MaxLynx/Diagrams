Program n1_2;
  uses crt;
  var a:array[1..20,1..20] of integer;
  d, x, s:real;
  error, c, t, n, m, i, j, b, k:integer; f:string; r:char;

begin
   clrscr;
   Writeln;
   writeln('STRINGS AND COLUMNS: WORLD OF PASCAL');
   writeln;
   writeln('Hello. Thanks for using our small game :)');
   writeln('Now only multiplayer is available');
   writeln('Press 1 for classic (3x3) and any other key for extended mode');
   readln(f);
   randomize;
   if f='1' then begin

     n:=3;
     writeln;
     writeln ('Default array:');
        for i:=1 to n do
    begin
     for j:=1 to n do

     write(char(254),'  ');writeln; end;


     k:=1;

     repeat
      c:=random(10);
      WRITELN;
      case c of
      1: writeln('Finish him!');
      2: writeln('Take it easy!');
      3: writeln('You can do it!');
      4: writeln('Cool turn :) Your enemy run away');
      5: writeln('Do it. Simply do it and nobody can stopped you!');
      6: writeln('Hehehey. You are so clever!');
      7: writeln('Ohoho... Happy New Year and Merry Christmas');
      8: writeln('Ya ne ponimayu');
      9: writeln('Mortal tactic!');
      end;
      writeln (((k+1) mod 2)+1,' player turn');
      {$I-}
     write('string = ');
     read(i);
     write('column = ');
     read(j);
          {$I+}
     if (a[i,j]=0) and (i>0) and (j>0) and (i<=n) and (j<=n) and (IOResult=0) then a[i,j]:=((k+1) mod 2)+1 else begin
     repeat begin writeln('Do you know the rules?');
       {$I-}
      write('string = ');
     readln(i);

     write('column = ');
     readln(j);
     {$I+}
    end; until (IOResult=0) and (i>0) and (j>0) and (i<=n) and (j<=n) and (a[i,j]=0);


     a[i,j]:=((k+1) mod 2)+1; end;
      writeln;
      for i:=1 to n do
    begin
     for j:=1 to n do if a[i,j]=0 then write(' ',char(176),' ')
     else if a[i,j]=1  then
     begin textcolor(red); write(' X '); textcolor(white) end
     ELSE begin textcolor(blue); write (' O ');  textcolor(white); end;

     writeln; end;
     writeln;
     s:=1;
     for i:=1 to n do
     for j:=1 to n do
     s:=s*a[i,j];
     if s<>0 then writeln ('GAME IS OVER');

     for i:=1 to n-2 do
     for j:=1 to n do begin

     if (a[i,j]=a[i+1,j]) and (a[i+1,j]=a[i+2,j]) and (a[i,j]<>0) then begin
     if a[i,j]=1 then begin writeln;  writeln ('FIRST PLAYER WIN!!!'); s:=666; end;
     if a[i,j]=2 then begin writeln;  writeln ('SECOND PLAYER WIN!!!'); s:=666; end; end; end;

     for j:=1 to n-2 do
     for i:=1 to n do   begin

     if (a[i,j]=a[i,j+1]) and (a[i,j+1]=a[i,j+2]) and (a[i,j]<>0) then begin
     if a[i,j]=1 then begin writeln;  writeln ('FIRST PLAYER WIN!!!'); s:=666;  end;
     if a[i,j]=2 then begin writeln;  writeln ('SECOND PLAYER WIN!!!');s:=666; end; end; end;

     for i:=1 to n-2 do
     for j:=1 to n-2 do begin

     if (a[i,j]=a[i+1,j+1]) and (a[i+1,j+1]=a[i+2,j+2]) and (a[i,j]<>0) then begin
     if a[i,j]=1 then begin writeln;  writeln ('FIRST PLAYER WIN!!!');  s:=666; end;
     if a[i,j]=2 then begin writeln;  writeln ('SECOND PLAYER WIN!!!'); s:=666; end; end; end;

     for j:=1 to n do
          for i:=1 to n do  begin
     if (a[i,j]=a[i+1,j-1]) and (a[i+1,j-1]=a[i+2,j-2]) and (a[i,j]<>0) then begin
     if a[i,j]=1 then begin writeln;  writeln ('FIRST PLAYER WIN!!!'); s:=666; end;
     if a[i,j]=2 then begin writeln;  writeln ('SECOND PLAYER WIN!!!'); s:=666; end; end; end;


      k:=k+1;

      until s<>0; end

      else
    begin   error:=1;
   {$I-}
   if paramcount<>0 then val(paramstr(1),n,error);

   writeln ('winning combination line - 5 symbols in a row');
      if error<>0 then begin
   writeln ('input size, it should be more then five');
   readln (n);
   {$I+}
   while (IOResult<>0) OR (n<5) do
     begin
     {$I-}
     write('Necorectne znachennya n! n=');
     readln(n);
     {$I+}
     END; end else writeln('n=',n);
     for i:=1 to n do
    begin
     for j:=1 to n do
     a[i,j]:=0;
     end;
     writeln;
     writeln ('Default array:');
        for i:=1 to n do
    begin
     for j:=1 to n do

     write(char(254),'  ');writeln; end;


     k:=1;

     repeat
      c:=random(10);
      WRITELN;
      case c of
      1: writeln('Finish him!');
      2: writeln('The best defence is offence');
      3: writeln('Diagonal rows are very dangerous, because it is hard to recognize them');
      4: writeln('Cool turn :)');
      5: writeln('Here we go!');
      6: writeln('Hehehey. You are so clever!');
      7: writeln('Ohoho... Happy New Year and Merry Christmas');
      8: writeln('Ya ne ponimayu');
      9: writeln('Matan can be dangerous for you mind and soul, innocent child');
      end;
      writeln (((k+1) mod 2)+1,' player turn');
      {$I-}
     write('string = ');
     read(i);
     write('column = ');
     read(j);
          {$I+}
     if (a[i,j]=0) and (i>0) and (j>0) and (i<=n) and (j<=n) and (IOResult=0) then a[i,j]:=((k+1) mod 2)+1 else begin
     repeat begin writeln('Do you know the rules?');
       {$I-}
      write('string = ');
     readln(i);

     write('column = ');
     readln(j);
     {$I+}
    end; until (IOResult=0) and (i>0) and (j>0) and (i<=n) and (j<=n) and (a[i,j]=0);


     a[i,j]:=((k+1) mod 2)+1; end;
      writeln;
      for i:=1 to n do
    begin
     for j:=1 to n do if a[i,j]=0 then write(' ',char(176),' ')
     else if a[i,j]=1 then begin textcolor(red); write(' X '); textcolor(white) end
     ELSE begin textcolor(blue); write (' O ');  textcolor(white); end;

     writeln; end;
     writeln;
     s:=1;
     for i:=1 to n do
     for j:=1 to n do
     s:=s*a[i,j];
     if s<>0 then writeln ('GAME IS OVER');

     for i:=1 to n-2 do
     for j:=1 to n do begin

     if (a[i,j]=a[i+1,j]) and (a[i+1,j]=a[i+2,j]) and (a[i+2,j]=a[i+3,j])
     and (a[i+3,j]=a[i+4,j]) and (a[i,j]<>0) then begin
     if a[i,j]=1 then begin writeln;  writeln ('FIRST PLAYER WIN!!!'); s:=666; end;
     if a[i,j]=2 then begin writeln;  writeln ('SECOND PLAYER WIN!!!'); s:=666; end; end; end;

     for j:=1 to n-2 do
     for i:=1 to n do   begin

     if (a[i,j]=a[i,j+1]) and (a[i,j+1]=a[i,j+2]) and (a[i,j+2]=a[i,j+3])
     and (a[i,j+3]=a[i,j+4]) and (a[i,j]<>0) then begin
     if a[i,j]=1 then begin writeln;  writeln ('FIRST PLAYER WIN!!!'); s:=666;  end;
     if a[i,j]=2 then begin writeln;  writeln ('SECOND PLAYER WIN!!!');s:=666; end; end; end;

     for i:=1 to n-2 do
     for j:=1 to n-2 do begin

     if (a[i,j]=a[i+1,j+1]) and (a[i+1,j+1]=a[i+2,j+2])and (a[i+2,j+2]=a[i+3,j+3])
     and (a[i+3,j+3]=a[i+4,j+4]) and (a[i,j]<>0) then begin
     if a[i,j]=1 then begin writeln;  writeln ('FIRST PLAYER WIN!!!');  s:=666; end;
     if a[i,j]=2 then begin writeln;  writeln ('SECOND PLAYER WIN!!!'); s:=666; end; end; end;

     for j:=1 to n do
          for i:=1 to n do  begin
     if (a[i,j]=a[i+1,j-1]) and (a[i+1,j-1]=a[i+2,j-2])and (a[i+2,j-2]=a[i+3,j-3])
     and (a[i+3,j-3]=a[i+4,j-4]) and (a[i,j]<>0) then begin
     if a[i,j]=1 then begin writeln;  writeln ('FIRST PLAYER WIN!!!'); s:=666; end;
     if a[i,j]=2 then begin writeln;  writeln ('SECOND PLAYER WIN!!!'); s:=666; end; end; end;


      k:=k+1;

      until s<>0;
      end;

      writeln;
      writeln('Press ENTER for exit');
      readln;
      readln;
      end.
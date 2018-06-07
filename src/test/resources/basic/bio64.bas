10 rem*********************************15 rem*                               *20 rem*     b i o r h y t h m u s     *25 rem*                               *30 rem*  programm zur ermittlung des  *35 rem* biorhythmus, des wochentages  *40 rem*  und beliebiger zeitspannen   *45 rem*       (c64 basic 2.0)         *50 rem*  heimo ponnath  hamburg 1987  *55 rem*                               *60 rem*********************************65 poke 53280,0:poke 53281,0:printchr$(30),chr$(14)70 printchr$(147)75 rem ---- variable,konstanten ---80 a$="":t$="":m$="":g$=""85 t=0:t1=0:t2=0:m=0:m1=0:m2=0:g=0:g1=0:g2=0:j=0:j1=0:j2=0:c=0:c1=0:c2=090 k=0:k1=0:k2=0:i=0:f=1:s=1:dz=0:d=0:w=0:yk=0:ys=0:yg=0:ra=0:rb=0:ta=0:tb=095 bb=32:bh=24:xu=1:xo=32:yu=-140:yo=110:x=0:y1=0:y2=0:y3=0:z=0100 ra=bb/(xo-xu):rd=-bh/(yo-yu)105 ta=-bb*xu/(xo-xu)+5:tb=bh*yo/(yo-yu)+1110 def fn x(x)=ra*x+ta115 def fn y(y)=rd*y+tb120 def fn k(x)=int(100*sin(.27318197*x)+.5)122 def fn s(x)=int(100*sin(.224399475*x)+.5)124 def fn g(x)=int(100*sin(.190399555*x)+.5)125 dim m(12),m$(12),t$(6),a(12)130 rem135 data 31,januar,28,februar,31,maerz,30,april,31,mai,30,juni140 data 31,juli,31,august,30,september,31,oktober,30,november,31,dezember145 data samstag,sonntag,montag,dienstag,mittwoch,donnerstag,freitag147 data 0,31,59,90,120,151,181,212,243,273,304,334150 for i=1 to 12155 read m(i),m$(i)160 next i165 for i=0 to 6170 read t$(i)175 next i176 for i=1 to 12177 read a(i)178 next i180 tj=4:mj=10:sj=1582:rem beginn des gregorianischen kalenders290 rem ---- menue 1 ---------------295 printchr$(147)300 printchr$(18)"        b i o r h y t h m u s         "chr$(146)305 print:print:print:print:print:print310 print:printtab(3)"feststellen des wochentages......1"315 print:printtab(3)"zeitdifferenz berechnen..........2"320 print:printtab(3)"biorhythmus bestimmen............3"325 print:printtab(3)"programmende.....................4"330 print:print:printtab(8)"sie haben die wahl !"335 get a$:if val(a$)<1 or val(a$)>4 then 335340 printchr$(147):if val(a$)=4 then end345 on val(a$) gosub 1000,2000,3000350 get a$:if a$="" then 350355 goto 295400 rem --- datumseingabe --------------405 print:input"tag (z.b. 12)        ";t$410 input"monat (z.b. 6)       ";m$415 input"jahr (z.b. 1987)     ";g$420 t=val(t$):m=val(m$):g=val(g$)425 j=val(right$(g$,2)):c=val(left$(g$,2))430 rem pruefen ob gregorianisch oder julianisch435 if g<sj then k=0:goto 470440 if g>sj then k=1:goto 470445 if m<mj then k=0:goto 470450 if m>mj then k=1:goto 470455 if t<=tj then k=0:goto 470457 if t>tj and t<15 then print"bei der kalenderreform folgte auf den 4.10.1582"458 if t>tj and t<15 then print"sofort der 15.10.1582!":goto 405460 k=1465 rem zulaessigkeit pruefen470 if m>12 then f=1:goto 515475 if t<=m(m) then f=0:goto 490480 if t>m(m) and m<>2 then f=1:goto 515485 rem schaltjahr feststellen490 s=g-4*int(g/4)495 if k=0 and s<1e-6 then s=0:rem julianisches schaltjahr500 if k=1 and s<1e-6 and (c-4*int(c/4)<1e-6) then s=0:rem gregorian. schaltj.505 if m=2 and s=0 and t<=29 then return510 if f=0 then return515 print"dieses datum ist falsch!":print"bitte neu eingeben."520 goto 4051000 rem -- feststellen des wochentages --1005 f=11010 gosub 400:rem datumseingabe1015 rem kalenderformeln von zeller1020 if m=1 or m=2 then m=m+12:j=j-1:if j<0 then j=99:c=c-11025 dz=t+int(2.6*(m+1))+j+int(j/4)1030 if k=0 then d=dz+5-c:rem julianischer kalender1035 if k=1 then d=dz+int(c/4)-2*c:rem gregorianischer kalender1040 w=d-7*int(d/7)1045 if m=13 or m=14 then m=m-12:j=j+1:if j=100 then j=0:c=c+11050 print:print"der "t"."m$(m)" "g" ist ein "t$(w)1055 return2000 rem -- zeitdifferenz berechnen --2005 gosub 1000:rem eingabe und wochentag2010 t1=t:m1=m:g1=g:j1=j:c1=c:k1=k:s1=s2015 gosub 1000:rem 2.datum2020 t2=t:m2=m:g2=g:j2=j:c2=c:k2=k:s2=s2025 if k1=0 and k2=0 then 2085:rem nur julianische daten2030 if k1=1 and k2=1 then 2125:rem nur gregorianische daten2035 rem hier datum 1 julianisch,datum 2 gregorianisch2040 t=t1:m=m1:g=g1:s=s12045 gosub 2165:rem julianisch2050 gosub 2195:dz=d2055 t=t2:m=m2:g=g2:s=s22060 gosub 2180:rem gregorianisch2065 d=d+2:rem korrektur2070 gosub 21952075 di=d-dz:goto 22152080 rem nur julianische daten2085 t=t1:m=m1:g=g1:s=s12090 gosub 21652095 gosub 2195:dz=d2100 t=t2:m=m2:g=g2:s=s22105 gosub 21652110 gosub 21952115 di=d-dz:goto 22152120 rem nur gregorianische daten2125 t=t1:m=m1:g=g1:s=s12130 gosub 21802135 gosub 2195:dz=d2140 t=t2:m=m2:g=g2:s=s22145 gosub 21802150 gosub 21952155 di=d-dz:goto 22152160 rem up julianische tagzahl2165 d=a(m)+g*365+int(g/4)+t+12170 return2175 rem up gregorianische tagzahl2180 d=a(m)+g*365+int(g/4)-int(g/100)+int(g/400)+t+12185 return2190 rem up schaltjahrkorrektur2195 if s=0 and m=1 then d=d-12200 if s=0 and m=2 and t<29 then d=d-12205 return2210 rem ausgabe der differenz2215 print:print"dazwischen liegen "di" tage."2220 return3000 rem --- biorhythmus berechnen ----3005 print:print"bitte geben sie ein:"3010 print"1.geburtsdatum und 2.aktuelles datum!"3015 gosub 2005:rem eingabe,pruefen,wochentag,differenz3020 yk=fn k(di):rem koerperkurve3025 ys=fn s(di):rem seelenkurve3030 yg=fn g(di):rem geistkurve3035 print:print"am "t2"."m2"."g2" sind die werte:"3040 print:print"koerperkurve = "yk3045 print"seelenkurve  = "ys3050 print"geistkurve   = "yg3055 get a$:if a$="" then 30553060 rem -- menue 2 -----3065 printchr$(147):print:print:print:print:print:print:print3070 printtab(5)"neues datum.............1"3075 print:printtab(5)"monatsgrafik............2"3080 print:printtab(5)"zurueck zu menue 1......3"3085 get a$:if val(a$)<1 or val(a$)>3 then 30853090 if a$="3" then print:printtab(10)"bitte taste druecken":return3095 on val(a$) gosub 3200,34003100 get a$:if a$="" then 31003105 goto 30653110 rem3200 rem --- biorhythmus neues datum --3205 printchr$(147)3210 print:print"bitte neues aktuelles datum angeben:"3215 gosub 2015:rem eingabe,pruefen,wochentag,differenz3220 gosub 3020:rem neue biorhythmuswerte3225 return3400 rem --- monatsgrafik -------------3402 m=m2:d=di-t23405 printchr$(147)chr$(18)"biorhythmus im "m$(m)g2chr$(146)3410 gosub 3500:rem hintergrund zeichnen3415 d=d+z:rem 0.tag des aktuellen monats3420 l=m(m):if s2=0 and m=2 then l=l+13425 for i=1 to l3430 x=fn x(i): y1=fny(fnk(d+i)):y2=fny(fns(d+i)):y3=fny(fng(d+i))3435 rem c128:printchr$(5);:sys 65520,,y1,x:printchr$(119);3436 printchr$(5);:poke211,x:poke214,y1:sys58640:printchr$(119);3440 rem c128:printchr$(28);:sys65520,,y2,x:printchr$(113);3441 printchr$(28);:poke211,x:poke214,y2:sys58640:printchr$(113);3445 rem c128:printchr$(31);:sys65520,,y3,x:printchr$(118);3446 printchr$(31);:poke211,x:poke214,y3:sys58640:printchr$(118);3450 next i3455 printchr$(30)3460 get a$:if val(a$)<1 or val(a$)>3 then 34603465 printchr$(147):if val(a$)=3 then printchr$(18)" taste druecken! "chr$(146):return3470 if val(a$)=1 then 34853475 z=l:m=m+1:if m=13 then printchr$(18)"bitte taste!"chr$(146):return3480 goto 3405:rem naechster monat3485 m=m-1:if m=0 then printchr$(18)"bitte taste!"chr$(146):return3490 z=-m(m):if s2=0 and m=2 then z=z-13495 goto 3405:rem vormonat3500 rem --- hintergrund zeichnen ----3505 printtab(5)chr$(176);:for i=1 to 30:printchr$(178);:nexti3510 printchr$(174):for l=1 to 9:printtab(5);3515 for i=1 to 32:printchr$(125);3520 next i:printchr$(13)chr$(145):next l3525 printtab(5)chr$(171);:for i=1 to 30:printchr$(123);:next i:printchr$(179)3530 for l=1 to 9:printtab(5);3535 for i=1 to 32:printchr$(125);3540 next i:printchr$(13)chr$(145):next l3545 printtab(5)chr$(171)chr$(177)chr$(177)chr$(177);3550 for i=1 to 5:printchr$(123)chr$(177)chr$(177)chr$(177)chr$(177);:next i3555 printchr$(123)chr$(177)chr$(189)3560 printtab(5)chr$(125)"   ";:for i=0 to 5:printtab(9+5*i)chr$(125);:next i3565 printchr$(13)chr$(145)3570 printtab(4)1tab(8)5tab(13)10tab(18)15tab(23)20tab(28)25tab(33)303575 printchr$(19)chr$(17)" 100":for i=1 to 9:print:next i3580 print"   0":for i=1 to 9:print:next i:print"-100"3585 print:print:print"vormonat (1) nachmonat (2) ende (3)"chr$(19)3590 return
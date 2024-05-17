data date;
datanasc="15SEP2002"D;
oggi=TODAY();
eta= (oggi - datanasc)/365.25;
format datanasc oggi DATE9.;
compl10k= datanasc+10000;
run;

proc print data=date; run;
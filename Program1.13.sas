proc freq data=cr.employee order=freq nlevels;
    tables City Department JobTitle / nocum;
run;

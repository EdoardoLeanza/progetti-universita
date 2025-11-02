/***********************************************/
/* This code sets the PATH macro variable to   */
/* your EPG294/data folder and assigns the     */
/* PG2 library to that path. You must run      */
/* this code each time you start SAS OnDemand  */
/* for Academics to access your practice data  */
/***********************************************/

%let path=~/EPG2V2/data;
libname PG2 "&path";


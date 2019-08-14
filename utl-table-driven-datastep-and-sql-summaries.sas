SAS Forum: How to programatically query SAS tables based on a list within a SAS                                                 
                                                                                                                                
                                                                                                                                
   Two solutions                                                                                                                
         1. Single Datasetp DOSUBL with error checking                                                                          
         2. %array and SQL                                                                                                      
                                                                                                                                
github                                                                                                                          
https://tinyurl.com/y4fjv4a6                                                                                                    
https://github.com/rogerjdeangelis/utl-table-driven-datastep-and-sql-summaries                                                  
                                                                                                                                
SAS Forum                                                                                                                       
https://tinyurl.com/y6e6z7oe                                                                                                    
https://communities.sas.com/t5/SAS-Programming/How-to-programatically-query-SAS-tables-based-on-a-list-within-a/m-p/580662      
                                                                                                                                
*_                   _                                                                                                          
(_)_ __  _ __  _   _| |_                                                                                                        
| | '_ \| '_ \| | | | __|                                                                                                       
| | | | | |_) | |_| | |_                                                                                                        
|_|_| |_| .__/ \__,_|\__|                                                                                                       
        |_|                                                                                                                     
;                                                                                                                               
                                                                                                                                
                                                                                                                                
*List of the above table names;                                                                                                 
data sas_table_names;                                                                                                           
informat tbl_name $char15.;                                                                                                     
format tbl_name $char15.;                                                                                                       
input tbl_name $;                                                                                                               
datalines;                                                                                                                      
TABLE_201901_V3                                                                                                                 
TABLE_201812_V1                                                                                                                 
TABLE_201811_V2                                                                                                                 
TABLE_201709_V1                                                                                                                 
TABLE_201603_V1                                                                                                                 
;                                                                                                                               
                                                                                                                                
data TABLE_201901_V3;                                                                                                           
input store product $ units;                                                                                                    
datalines;                                                                                                                      
1 A 10                                                                                                                          
2 A 20                                                                                                                          
3 A 20                                                                                                                          
;                                                                                                                               
                                                                                                                                
data TABLE_201812_V1;                                                                                                           
input store product $ units;                                                                                                    
datalines;                                                                                                                      
1 A 20                                                                                                                          
2 A 30                                                                                                                          
3 A 22                                                                                                                          
;                                                                                                                               
                                                                                                                                
data TABLE_201811_V2;                                                                                                           
input store product $ units;                                                                                                    
datalines;                                                                                                                      
1 A 30                                                                                                                          
2 A 40                                                                                                                          
3 A 23                                                                                                                          
;                                                                                                                               
                                                                                                                                
data TABLE_201709_V1;                                                                                                           
input store product $ units;                                                                                                    
datalines;                                                                                                                      
1 A 40                                                                                                                          
2 A 50                                                                                                                          
3 A 25                                                                                                                          
;                                                                                                                               
                                                                                                                                
data TABLE_201603_V1;                                                                                                           
input store product $ units;                                                                                                    
datalines;                                                                                                                      
1 A 40                                                                                                                          
2 A 50                                                                                                                          
3 A 25                                                                                                                          
;                                                                                                                               
run;quit;                                                                                                                       
                                                                                                                                
                                                                                                                                
                                                                                                                                
SAS_TABLE_NAMES total obs=5                                                                                                     
                                                                                                                                
Obs       TBL_NAME                                                                                                              
                                                                                                                                
 1     TABLE_201901_V3                                                                                                          
 2     TABLE_201812_V1                                                                                                          
 3     TABLE_201811_V2                                                                                                          
 4     TABLE_201709_V1                                                                                                          
 5     TABLE_201603_V1                                                                                                          
                                                                                                                                
Five Tables                                                                                                                     
                                                                                                                                
    TABLE_201901_V3         TABLE_201812_V1      TABLE_201811_V2       TABLE_201709_V1     TABLE_201603_V1                      
                                                                                                                                
  STORE PRODUCT UNITS    STORE PRODUCT UNITS   STORE PRODUCT UNITS   STORE PRODUCT UNITS  STORE PRODUCT UNITS                   
                                                                                                                                
    1      A      10       1      A      20      1      A      30      1      A      40     1      A      40                    
    2      A      20       2      A      30      2      A      40      2      A      50     2      A      50                    
    3      A      20       3      A      22      3      A      23      3      A      25     3      A      25                    
                                                                                                                                
                                                                                                                                
 *            _               _                                                                                                 
  ___  _   _| |_ _ __  _   _| |_                                                                                                
 / _ \| | | | __| '_ \| | | | __|                                                                                               
| (_) | |_| | |_| |_) | |_| | |_                                                                                                
 \___/ \__,_|\__| .__/ \__,_|\__|                                                                                               
                |_|                                                                                                             
;                                                                                                                               
                                                                                                                                
Up to 40 obs WORK.WANT total obs=5                                                                                              
                                                                                                                                
     TBL_NAME               STATUS          PRODUCT    AVG           |  RULES                                                   
                                                                     |                                                          
  TABLE_201901_V3     SUCCESSFULLY PROCESSED    A       16.666666667 |  (10+20+20)/3                                            
  TABLE_201812_V1     SUCCESSFULLY PROCESSED    A       24           |  (20+30+22)/3                                            
  TABLE_201811_V2     SUCCESSFULLY PROCESSED    A       31           |                                                          
  TABLE_201709_V1     SUCCESSFULLY PROCESSED    A       38.333333333 |                                                          
  TABLE_201603_V1     SUCCESSFULLY PROCESSED    A       45.333333333 |                                                          
                                                                                                                                
                                                                                                                                
*          _       _   _                                                                                                        
 ___  ___ | |_   _| |_(_) ___  _ __  ___                                                                                        
/ __|/ _ \| | | | | __| |/ _ \| '_ \/ __|                                                                                       
\__ \ (_) | | |_| | |_| | (_) | | | \__ \                                                                                       
|___/\___/|_|\__,_|\__|_|\___/|_| |_|___/                                                                                       
                                                                                                                                
;                                                                                                                               
                                                                                                                                
*    _       _            _                                                                                                     
  __| | __ _| |_ __ _ ___| |_ ___ _ __                                                                                          
 / _` |/ _` | __/ _` / __| __/ _ \ '_ \                                                                                         
| (_| | (_| | || (_| \__ \ ||  __/ |_) |                                                                                        
 \__,_|\__,_|\__\__,_|___/\__\___| .__/                                                                                         
                                 |_|                                                                                            
;                                                                                                                               
                                                                                                                                
%symdel tbl cc avg prd / nowarn;                                                                                                
data want;                                                                                                                      
  set sas_table_names ;                                                                                                         
  call symputx("tbl",tbl_name);                                                                                                 
  rc=dosubl('                                                                                                                   
     data tmp;                                                                                                                  
        retain sum 0;                                                                                                           
        set &tbl end=dne;                                                                                                       
        sum=sum(units,sum);                                                                                                     
        putlog sum= _n_=;                                                                                                       
        if dne then do;                                                                                                         
           call symputx("avg",sum/_n_);                                                                                         
           call symputx("prd",product);                                                                                         
        end;                                                                                                                    
     run;quit;                                                                                                                  
     %let cc=&syserr;                                                                                                           
  ');                                                                                                                           
  * error checking;                                                                                                             
  if symgetn('cc') ne 0 then do;                                                                                                
      status   =catx(" ",tbl_name, "ERROR JOB STOPPED");                                                                        
      stop;                                                                                                                     
  end;                                                                                                                          
  else do;                                                                                                                      
     status   =catx(" ",tbl_name, "SUCCESSFULLY PROCESSED");                                                                    
     avg=symget('avg');                                                                                                         
     product=symget('prd');                                                                                                     
  end;                                                                                                                          
  drop rc cc;                                                                                                                   
run;quit;                                                                                                                       
                                                                                                                                
*          _                                                                                                                    
 ___  __ _| |                                                                                                                   
/ __|/ _` | |                                                                                                                   
\__ \ (_| | |                                                                                                                   
|___/\__, |_|                                                                                                                   
        |_|                                                                                                                     
;                                                                                                                               
                                                                                                                                
* does not rquire sorted data;                                                                                                  
                                                                                                                                
* just in case;                                                                                                                 
%symdel tblsn tbls1 / nowarn;                                                                                                   
proc datasets lib=work;                                                                                                         
  delete inr;                                                                                                                   
run;quit;                                                                                                                       
                                                                                                                                
                                                                                                                                
%array(tbls,data=sas_table_names,var=tbl_name);                                                                                 
proc sql;                                                                                                                       
  create                                                                                                                        
      table inr as                                                                                                              
  select                                                                                                                        
      n                                                                                                                         
     ,product                                                                                                                   
     ,mean(units) as avg                                                                                                        
  from                                                                                                                          
    (                                                                                                                           
     %do_over(tbls,phrase=%str(                                                                                                 
     select                                                                                                                     
       "?" as n                                                                                                                 
       ,product                                                                                                                 
       ,units                                                                                                                   
     from                                                                                                                       
        ?)                                                                                                                      
     ,between=union all                                                                                                         
     ))                                                                                                                         
  group                                                                                                                         
     by n, product                                                                                                              
;quit;                                                                                                                          
                                                                                                                                
                                                                                                                                
                                                                                                                                

public class Agregate1 {
   
    /** Write a SOQL query to retrieve sum of all closed Account amount for current fiscal year. Store 
this information in a map with key as year and value as sum of amount. Iterate this map to displ
ay statistics.**/
    public void test1()
   {
    map<Integer, Decimal> map5=new map<Integer, Decimal>();
    AggregateResult[] result = [Select o.StageName, o.Id, o.FiscalYear, sum(o.Amount)s  From Opportunity o where StageName='Closed Won' group by  FiscalYear,StageName,Id];
    for(AggregateResult r : result){
        map5.put((Integer)r.get('FiscalYear'),(Decimal)r.get('s'));
    }
    System.debug(map5);
   }
   
   
   /**2. Find total number of distinct Lead records on basis of 'Lead Source' having greater than 10 leads. 
Print this information.**/

   public void test2()
     {
        AggregateResult[] result = [select status, COUNT_DISTINCT(LEADSOURCE) from Lead group by status having COUNT_DISTINCT(LEADSOURCE) >1];
        for(AggregateResult r : result)
            System.debug(r);
     }
     
     /**3. Write a SOQL query to find total number of Lead records by status by Lead Source. Store this 
information in map 
and display the same.
(Hint: map<string,map<string,integer>>)**/
    
     public void test3()
     {
        map<String, Integer> map1=new map<String, Integer>();
        AggregateResult[] result=[select status,COUNT(Id) total,LEADSOURCE from lead group by status, LEADSOURCE];
        for(AggregateResult r : result)
            map1.put((String)r.get('status'),(Integer)r.get('total'));
        map<String, map<String, Integer>> map2=new map<String, map<String, Integer>>();
        for(AggregateResult r : result)
            map2.put((String)r.get('LEADSOURCE'),map1);
        System.debug(map2);     
     }
}
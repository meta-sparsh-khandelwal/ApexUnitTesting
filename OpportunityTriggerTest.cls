@isTest(SeeAllData=false)
public class OpportunityTriggerTest {
    @isTest
    public static void testOnBeforeUpdateOneOpportunityStageBecomesClosedWonThenCloseDateToday(){
        List<Opportunity> opp = TestDataFactory.insertOpportunity(1);
        opp[0].stageName='Closed Won';
        Test.startTest();
        	update opp[0];
        Test.stopTest();
        Opportunity opportunityQueried = [SELECT Id,CloseDate from Opportunity where Id=:opp[0].Id LIMIT 1];
        System.assertEquals(Date.today(), opportunityQueried.closeDate);
        
    }
        @isTest
    public static void testBulkOnBeforeUpdateOpportunityStageBecomesClosedWonThenCloseDateToday(){
        List<Opportunity> opportunityList = TestDataFactory.insertOpportunity(10);
        Set<Id> oppIdSet = new Set<Id>();
        for(Integer i=0; i<10; i++){
        	opportunityList[i].stageName='Closed Won';
            oppIdSet.add(opportunityList[i].Id);
        }
        Test.startTest();
        	update opportunityList;
        Test.stopTest();
               List<Opportunity> opportunityQueried=[SELECT Id,CloseDate FROM Opportunity WHERE Id=:oppIdSet];
        for(Opportunity opp : opportunityQueried){
        	System.assertEquals(Date.today(), opp.CloseDate); 
        }
    }

    @isTest
    public static void testOnBeforeUpdateOpportunityStageBecomesOtherThenCloseDateNotToday(){
        List<Opportunity> opportunityList = TestDataFactory.insertOpportunity(10);
        Set<Id> oppIdSet = new Set<Id>();
       	for(Integer i=0;i<10;i++){
        	opportunityList[i].stageName='Qualification';
            oppIdSet.add(opportunityList[i].Id);
        }
        Test.startTest();
        	update opportunityList;
        Test.stopTest();
        List<Opportunity> opportunityQueried=[SELECT Id,CloseDate FROM Opportunity WHERE Id=:oppIdSet];
        for(Opportunity opp : opportunityQueried){
        	System.assertNotEquals(Date.today(), opp.closeDate); 
        }
    }
}

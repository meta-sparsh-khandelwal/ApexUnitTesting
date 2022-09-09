@isTest(SeeAllData=false)
public class TeachTriggerTest {
    @isTest 
    public static void testOnBeforeInsertOne() {
        //Test Data using TestDataFactory
        List<Teach__c> teachList=TestDataFactory.createTeachWithHindi(1);
        Test.startTest();
        Database.SaveResult result = Database.insert(teachList[0], false);
        Test.stopTest();
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('Cannot add Teacher teaching Hindi',result.getErrors()[0].getMessage());
    }
    
    @isTest 
    public static void testBulkOnBeforeInsert() {
        //Test Data using TestDataFactory
		List<Teach__c> teachList=TestDataFactory.createTeachWithHindi(10);
	Test.startTest();
        Database.SaveResult[] results = Database.insert(teachList, false);
        Test.stopTest();

        for(Database.SaveResult dr : results) {
            System.assert(!dr.isSuccess());
            System.assert(dr.getErrors().size() > 0);
            System.assertEquals('Cannot add Teacher teaching Hindi',dr.getErrors()[0].getMessage());
        }
    }

    @isTest
    public static void testOnBeforeInsertWhenHindiIsNotSubject(){
        List<Teach__c> teachList=TestDataFactory.createTeachSubjectNotHindi(10);
Test.startTest();
        insert teachList;
Test.stopTest();
        system.assertEquals(10, [Select id FROM Teach__c].size());
    }

    @isTest 
public static void testBulkOnBeforeUpdate(){
        List<Teach__c> teachList=TestDataFactory.updateTeachWithHindi(10);
        for(Integer i=0;i<10;i++){
            teachList[i].subject__c='Hindi';
        }
        Test.startTest();
        	Database.SaveResult[] results = Database.update(teachList, false);
        Test.stopTest();
        for(Database.SaveResult dr : results) {
        	System.assert(!dr.isSuccess());
        	System.assert(dr.getErrors().size() > 0);
        	System.assertEquals('Cannot add Teacher teaching Hindi',dr.getErrors()[0].getMessage());
        }
        
    }
    @isTest 
public static void testOnBeforeUpdateOne(){
        List<Teach__c> teachList=TestDataFactory.updateTeachWithHindi(1);
      teachList[0].subject__c='Hindi';
        Test.startTest();
        Database.SaveResult result = Database.update(teachList[0], false);
        Test.stopTest();
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('Cannot add Teacher teaching Hindi',result.getErrors()[0].getMessage());
        
    }
    @isTest
    public static void testOnBeforeUpdateBulkWhenHindiIsNotSubject(){
        List<Teach__c> teachList=TestDataFactory.updateTeachSubjectNotHindi(10);
        for(Teach__c t:teachList){
            t.subject__c='English;Maths';
        }
        Test.startTest();
        	Database.SaveResult[] results = Database.update(teachList, false);
        Test.stopTest();
        for(Database.SaveResult dr : results) {
            System.assert(dr.isSuccess());
        }
    }
}

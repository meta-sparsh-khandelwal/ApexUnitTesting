@isTest(SeeAllData=false)
public class ClassTriggerTest {
    @isTest 
public static void testOnBeforeDeleteOne() {
        List<Class__c> classList=TestDataFactory.insertClassWithFemaleStudent(1);
         Test.startTest();
        Database.DeleteResult result = Database.delete(classList[0], false);
        Test.stopTest();
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('Cannot delete Class having more than one Female Student!',result.getErrors()[0].getMessage());
    }
    @isTest
    public static void testOnBeforeDeleteBulk() {
        List<Class__c> classList=TestDataFactory.insertClassWithFemaleStudent(10);
         Test.startTest();
        Database.DeleteResult[] result = Database.delete(classList, false);
        Test.stopTest();
        for(Database.DeleteResult dl : result) {
            System.assert(!dl.isSuccess());
            System.assert(dl.getErrors().size() > 0);
            System.assertEquals('Cannot delete Class having more than one Female Student!',dl.getErrors()[0].getMessage());
        }
    }
    @isTest 
   	 public static void testOnBeforeDeleteWhenNoFemaleStudentExist() {
     	List<Class__c> classList=TestDataFactory.insertClassWithOutFemaleStudent(100);
        Test.startTest();
        	Database.DeleteResult[] results = Database.delete(classList, false);
        Test.stopTest();
        for(Database.DeleteResult dr:results){
        	System.assert(dr.isSuccess());
        }
        System.assertEquals(0, [Select id FROM Class__c].size());
        
     }
        @isTest public static void testOnAfterUpdateOneWhenCustomStatusIsReset(){
            List<Class__c> classes=TestDataFactory.insertClassDataWithCustomStatus(100);
           classes[0].custom_status__c='Reset';
           Test.startTest();
               update classes[0];
           Test.stopTest();
           Class__c cls=[Select Id,(Select Id FROM students__r) FROM class__c where Id=:classes[0].Id LIMIT 1];
           system.assertEquals(0, cls.students__r.size());
           
       }
       
         @isTest public static void testBulkOnAfterUpdateWhenCustomStatusIsReset(){
            List<Class__c> classes=TestDataFactory.insertClassDataWithCustomStatus(100);
            List<Id> classId=new List<Id>();
             for(Class__c c:classes){
                 c.custom_status__c='Reset';
                 classId.add(c.id);
             }
           Test.startTest();
               update classes;
           Test.stopTest();
           Class__c[] cls=[Select Id,(Select Id FROM students__r) FROM class__c where Id=:classId LIMIT 1];
             for(class__c c:cls){ 
               system.assertEquals(0, c.students__r.size());
             }
           
       }
       @isTest 
       public static void testOnAfterUpdateWhenCustomStatusIsOpen(){
            List<Class__c> classes=TestDataFactory.insertClassDataWithCustomStatus(100);
            List<Id> classId=new List<Id>();
             for(Class__c c:classes){
                 c.custom_status__c='Open';
                 classId.add(c.id);
             }
           Test.startTest();
               update classes;
           Test.stopTest();
           Class__c[] cls=[Select Id,(Select Id FROM students__r) FROM class__c where Id=:classId LIMIT 1];
           for(class__c c:cls){ 
               system.assertEquals(1, c.students__r.size());
             }
       }
}
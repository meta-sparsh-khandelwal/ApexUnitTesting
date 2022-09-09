@isTest
public with sharing class StudentTriggerTest {
    @isTest 
    public static void testOnAfterInsertOne(){
        List<Student__c> students=TestDataFactory.insertStudentInClass(100);
        Test.startTest();
        	insert students;
        Test.stopTest();
        class__c cls=[SELECT Id,mycount__c FROM class__c WHERE id = :students[0].class__c LIMIT 1 ];
        System.assertEquals(1, cls.MyCount__c);
        system.debug(cls);
      
    }
    @isTest 
    public static void testBulkOnAfterInsert(){
        List<Student__c> students=TestDataFactory.insertStudentInClass(100);
        Test.startTest();
        	insert students;
        Test.stopTest();
        List<Id> classIds=new List<Id>();
        for(Student__c s:students){
            classIds.add(s.class__c);
        }
        List<class__c> cls=[SELECT Id,mycount__c FROM class__c WHERE id = :classIds ];
        for(class__c c:cls){
        	System.assertEquals(1, c.MyCount__c);
        }
      
    }

    @isTest 
    public static void testOnAfterInsertNegative(){
        List<Student__c> students=TestDataFactory.insertStudentInClass(100);
        insert students;
        List<class__c> classes=[Select id FROM Class__c];
        Test.startTest();
        List<Student__c> newStu=new List<Student__c>();
        for(Integer i=0;i<100;i++){
            newStu.add(new Student__c(Name='Student '+i,lastName__c='Student '+i,Sex__c='Female',class__c=classes[i].id));
        }
        insert newStu;
        Test.stopTest();
        
        List<Id> classIds=new List<Id>();
        for(Student__c s:students){
            classIds.add(s.class__c);
        }
        List<class__c> cls=[SELECT Id,mycount__c FROM class__c WHERE id = :classIds ];
        for(class__c c:cls){
        	System.assertNotEquals(1, c.MyCount__c);
        }
    }

}

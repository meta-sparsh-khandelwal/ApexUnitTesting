@isTest(SeeAllData=false)
public class StudentTriggerTest {
    @isTest
    public static void testBulkOnBeforeInsertWhenStudentsCountIsMoreThanSizeOfClass(){
        List<Student__c> studentList = TestDataFactory.insertClassData(10, 1);
        Test.startTest();
        	DataBase.SaveResult[] results = Database.insert(studentList,false);
        Test.stopTest();
        for(Database.SaveResult dr : results) {
            System.assert(!dr.isSuccess());
            System.assert(dr.getErrors().size() > 0);
            System.assertEquals('Cannot insert student as Class is full',dr.getErrors()[0].getMessage());
        }
    }
    @isTest
    public static void testOnBeforeInsertWhenStudentsCountIsLessThanSizeOfClass(){
        List<Student__c> studentList=TestDataFactory.insertClassData(5,10);
        Test.startTest();
        	DataBase.SaveResult[] results= Database.insert(studentList,false);
        Test.stopTest();
        for(Database.SaveResult dr : results) {
            System.assert(dr.isSuccess());
        }
    }

    @isTest 
    public static void testOnAfterInsertGivesCorrectStudentCount(){
        List<Student__c> studentList=TestDataFactory.insertStudentInClass(5,10);
        Test.startTest();
        	Database.SaveResult[] results = Database.insert(studentList,false);
        Test.stopTest();
        List<Class__c> classList = [SELECT Name, MyCount__c FROM Class__c];
        for(Database.SaveResult dr : results) {
            System.assert(dr.isSuccess());
        }
        for(Class__c cl : classList) {
            System.assertEquals(5, cl.MyCount__c);
        }
    }
    @isTest 
    public static void testOnAfterUpdateGivesCorrectStudentCount(){
        Class__c oldClass = new Class__c(Name='OldClassTest', maxSize__c=5);
        insert oldClass;
        List<Student__c> studentList = new List<Student__c>();
        for(Integer i=0; i<4; i++) {
            studentList.add(new Student__c(FirstName__c='StudentFN'+i,lastName__c='StudentLN'+i,Sex__c='Male',Class__c=oldClass.Id));
        }
        insert studentList;
        Class__c newClass = new Class__c(Name='NewClassTest', maxSize__c=5);
        insert newClass;
        for(Student__c st : studentList) {
            st.Class__c = newClass.Id;
        }
        Test.startTest();
            update studentList;
        Test.stopTest();
        Class__c oldClassQueried = [SELECT Name, MyCount__c FROM Class__c WHERE Name = 'OldClassTest'];
        Class__c newClassQueried = [SELECT Name, MyCount__c FROM Class__c WHERE Name = 'NewClassTest'];
        System.assertEquals(0, oldClassQueried.MyCount__c);
        System.assertEquals(4, newClassQueried.MyCount__c);
    }
    @isTest 
    public static void testOnAfterDeleteGivesCorrectStudentCount(){
        Class__c oldClass = new Class__c(Name='OldClassTest', maxSize__c=5);
        insert oldClass;
        List<Student__c> studentList = new List<Student__c>();
        for(Integer i=0; i<4; i++) {
            studentList.add(new Student__c(FirstName__c='StudentFN'+i,lastName__c='StudentLN'+i,Sex__c='Male',Class__c=oldClass.Id));
        }
        insert studentList;
        Test.startTest();
            delete studentList;
        Test.stopTest();
        Class__c oldClassQueried = [SELECT Name, MyCount__c FROM Class__c WHERE Name = 'OldClassTest'];
        System.assertEquals(0, oldClassQueried.MyCount__c);
    }
}

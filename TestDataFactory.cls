public class TestDataFactory {
    public static List<Teach__c> createTeachWithHindi(Integer teachCount){
        List<Contact> teacherList = new List<Contact>();
        List<Teach__c> teachList = new List<Teach__c>();
        List<Class__c> classList = new List<Class__c>();
        for(Integer i=0;i<teachCount;i++){
            Contact t = new Contact(LastName='Test '+i);
            teacherList.add(t);
        }
        insert teacherList;
        for(Integer i=0;i<teachCount;i++){
           Class__c c = new Class__C(Name='Class '+i);
           classList.add(c);
        }
        insert classList;
        for(Integer i=0; i<teachCount; i++){
            Teach__c teach=new Teach__c(Class__c=classList[i].id,Teacher__c=teacherList[i].id,Subject__c='English;Hindi');
            teachList.add(teach);
        }
        return teachList;
    }
    
        public static List<Teach__c> updateTeachWithHindi(Integer teachCount){
        List<Contact> teacherList = new List<Contact>();
        List<Teach__c> teachList = new List<Teach__c>();
        List<Class__c> classList = new List<Class__c>();
        for(Integer i=0;i<teachCount;i++){
            Contact t = new COntact(lastName='Test '+i);
            teacherList.add(t);
        }
        insert teacherList;
        for(Integer i=0;i<teachCount;i++){
           Class__c c = new Class__c(Name='Class '+i);
           classList.add(c);
        }
        insert classList;
        for(Integer i=0;i<teachCount;i++){
            Teach__c teach = new Teach__c(Class__c=classList[i].id,Teacher__c=teacherList[i].id,Subject__c='English');
            teachList.add(teach);
        }
        insert teachList;
        return teachList;
    }
    public static List<Class__c> insertClassWithFemaleStudent(Integer count){
        List<Class__c> classList = new List<Class__c>();
        List<Student__c> studentList=new List<Student__c>();
        for(Integer i=0;i<count;i++){
           Class__c c= new Class__C(Name='Class '+i);
           classList.add(c);
        }
        insert classList;
        for(Integer i=0;i<count;i++){
            studentList.add(new Student__c(FirstName__c='Student '+i,lastName__c='Student '+i,Sex__c='Female',class__c=classList[i].id));
            studentList.add(new Student__c(FirstName__c='Student '+i,lastName__c='Student '+i,Sex__c='Female',class__c=classList[i].id));
        }
        insert studentList;
        return classList;
    }
    public static List<Student__c> insertClassData(Integer count,Integer size){
        List<Class__c> classList = new List<Class__c>();
        List<Student__c> studentList=new List<Student__c>();
        List<Student__c> studentsToInsert=new List<Student__c>();
        for(Integer i=0;i<Count;i++){
           Class__c c=new Class__C(Name='Class '+i,maxsize__c=size);
           classList.add(c);
        }
        insert classList;
        for(Integer i=0;i<count;i++){
            studentList.add(new Student__c(FirstName__c='Student '+i,lastName__c='Student '+i,Sex__c='Female',class__c=classList[i].id));
        }
        insert studentList;
         for(Integer i=0;i<count;i++){
            studentsToInsert.add(new Student__c(FirstName__c='Student '+i,lastName__c='Student '+i,Sex__c='Female',class__c=classList[i].id));
        }
        return studentsToInsert;
    }
    
    public static List<Opportunity> insertOpportunity(Integer count){
        List<Opportunity> opportunityList = new List<Opportunity>();
        for(Integer i=0;i<count;i++){
            opportunityList.add(new Opportunity(Name='Opportunity '+i,CloseDate=Date.newInstance(2022, 10, 20),stageName='Prospecting'));
        }
        insert opportunityList;
        return opportunityList;
    }
    public static List<class__c> insertClassDataWithCustomStatus(Integer count){
        List<Class__c> classList=new List<Class__c>();
        List<Student__c> studentList=new List<Student__c>();
        for(Integer i=0;i<count;i++){
            Class__c c=new Class__C(Name='Class '+i,custom_status__c='New');
           	classList.add(c);
        }
        insert classList;
         for(Integer i=0;i<count;i++){
            studentList.add(new Student__c(FirstName__c='Student '+i,lastName__c='Student '+i,Sex__c='Female',class__c=classList[i].id));
        }
        insert studentList;
        
        return classList;
    }
    public static List<Student__c> insertStudentInClass(Integer count){
        List<class__c> classList=new List<class__c>();
        List<Student__c> studentList=new List<Student__c>();
        for(Integer i=0;i<count;i++){
            Class__c c=new Class__C(Name='Class '+i,maxsize__c=2);
           	classList.add(c);
        }
        insert classList;
        for(Integer i=0;i<count;i++){
            studentList.add(new Student__c(FirstName__c='Student '+i,lastName__c='Student '+i,Sex__c='Female',class__c=classList[i].id));
        }
        return studentList;
    }
    
    public static List<Teach__c> createTeachSubjectNotHindi(Integer count){
        List<Contact> teacherList = new List<Contact>();
        List<Teach__c> teachList = new List<Teach__c>();
        List<Class__c> classList = new List<Class__c>();
        for(Integer i=0;i<Count;i++){
            Contact t = new COntact(lastName='Test '+i);
            teacherList.add(t);
        }
        insert teacherList;
        for(Integer i=0;i<Count;i++){
           Class__c c=new Class__C(Name='Class '+i);
           classList.add(c);
        }
        insert classList;
        for(Integer i=0;i<Count;i++){
            Teach__c teach=new Teach__c(Class__c=classList[i].id,Teacher__c=teacherList[i].id,Subject__c='English');
            teachList.add(teach);
        }
        return teachList;
    }
    
    public static List<Teach__c> updateTeachSubjectNotHindi(Integer count){
        List<Contact> teacherList = new List<Contact>();
        List<Teach__c> teachList = new List<Teach__c>();
        List<Class__c> classList = new List<Class__c>();
        for(Integer i=0;i<Count;i++){
            Contact t = new COntact(lastName='Test '+i);
            teacherList.add(t);
        }
        insert teacherList;
        for(Integer i=0;i<Count;i++){
           Class__c c=new Class__C(Name='Class '+i);
           classList.add(c);
        }
        insert classList;
        for(Integer i=0;i<Count;i++){
            Teach__c teach=new Teach__c(Class__c=classList[i].id,Teacher__c=teacherList[i].id,Subject__c='English');
            teachList.add(teach);
        }
        insert teachList;
        return teachList;
    }
        public static List<Class__c> insertClassWithOutFemaleStudent(Integer count){
        List<Class__c> classList = new List<Class__c>();
        List<Student__c> studentList=new List<Student__c>();
        for(Integer i=0;i<Count;i++){
           Class__c c=new Class__C(Name='Class '+i);
           classList.add(c);
        }
        insert classList;
        for(Integer i=0;i<count;i++){
            studentList.add(new Student__c(FirstName__c='Student '+i,LastName__c='Student '+i,Sex__c='male',class__c=classList[i].id));
            studentList.add(new Student__c(FirstName__c='Student '+i,LastName__c='Student '+i,Sex__c='male',class__c=classList[i].id));
        }
        insert studentList;
        return classList;
    }
}

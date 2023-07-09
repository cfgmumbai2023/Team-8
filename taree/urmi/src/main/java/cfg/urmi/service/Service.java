package cfg.urmi.service;

import cfg.urmi.entity.Report;
import cfg.urmi.entity.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.aggregation.ArrayOperators;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
@org.springframework.stereotype.Service
public class Service {
    private final MongoTemplate mongoTemplate;

    @Autowired
    public Service(MongoTemplate mongoTemplate) {
        this.mongoTemplate = mongoTemplate;
    }
    public List<Integer> getPerStudentReport(String studentId, long startDate, long endDate) {
        Query query = Query.query(Criteria.where("studentId").is(studentId)
                .and("reportGeneratedOn").gte(startDate).lte(endDate));

        List<Report> reports = mongoTemplate.find(query, Report.class);
        int fractionSum=0;
        int additionSum=0;
        int vocabSum=0;
        int familyTreeSum=0;
        int stampDesignSum=0;
        List<Integer> result = new ArrayList<>();
        for(Report report : reports){
            fractionSum+=report.getSubjectFraction();
            additionSum+=report.getSubjectAddition();
            vocabSum+=report.getSubjectVocab();
            familyTreeSum+=report.getSubjectFamilyTree();
            stampDesignSum+=report.getSubjectStampDesign();
        }
        int n = result.size();
        result.add(fractionSum/n);
        result.add(additionSum/n);
        result.add(vocabSum/n);
        result.add(familyTreeSum/n);
        result.add(stampDesignSum/n);

        return result;
    }

    public Report addReportToMongo(Report report) {
        return mongoTemplate.save(report);
    }

    public Object addStudentToMongo(Student student) {
        return mongoTemplate.save(student);
    }

    public List<List<Integer>> getSchoolWiseReport(String schoolId, long startDate, long endDate) {
        Query query = Query.query(Criteria.where("schoolId").is(schoolId)
                .and("reportGeneratedOn").gte(startDate).lte(endDate));

        List<Report> reports = mongoTemplate.find(query, Report.class);
        Collections.sort(reports);
        List<Report> level1 = new ArrayList<>();
        List<Report> level2 = new ArrayList<>();
        List<Report> level0 = new ArrayList<>();
        for(Report report : reports){
            if(report.getLevel()==0) level0.add(report);
            else if(report.getLevel()==1) level1.add(report);
            else if(report.getLevel()==2) level2.add(report);
        }
        List<List<Integer>> answer = new ArrayList<>();

        answer.add(fillResult(level0));
        answer.add(fillResult(level1));
        answer.add(fillResult(level2));
        return answer;


    }

    private List<Integer> fillResult(List<Report> level) {
        List<Integer> result = new ArrayList<>();
        int sub1 = 0,sub2=0,sub3=0,sub4=0,sub5=0;
        for(Report report : level){
            sub1+=report.getSubjectAddition();
            sub2+=report.getSubjectFraction();
            sub3+=report.getSubjectVocab();
            sub4+=report.getSubjectFamilyTree();
            sub5+= report.getSubjectStampDesign();
        }
        int size = level.size();
        result.add(sub1/size);
        result.add(sub2/size);
        result.add(sub3/size);
        result.add(sub4/size);
        result.add(sub5/size);
        return result;
    }
}

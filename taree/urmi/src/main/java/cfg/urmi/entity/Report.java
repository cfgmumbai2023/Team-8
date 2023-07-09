package cfg.urmi.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.aggregation.ArrayOperators;
import org.springframework.data.mongodb.core.mapping.Document;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;

@Document("Reports")
@JsonIgnoreProperties(ignoreUnknown = true)
public class Report implements Comparable<Report> {
    @Id
    private String reportId;
    @JsonProperty("SID")
    private String studentId;
    @JsonProperty("Fraction")
    private int subjectFraction;
    @JsonProperty("Level")
    private int level;
    @JsonProperty("Addation")
    private int subjectAddition;
    @JsonProperty("Vocabulary Building")
    private int subjectVocab;
    @JsonProperty("Family Members & Identification")
    private int subjectFamilyTree;
    @JsonProperty("Stamping the Design")
    private int subjectStampDesign;
    private long reportGeneratedOn=System.currentTimeMillis();
    private String description="random description";
    @JsonProperty("School Name")
    private String schoolId;

    public String getSchoolId() {
        return schoolId;
    }

    public void setSchoolId(String schoolId) {
        this.schoolId = schoolId;
    }

    public Report() {
    }

    @Override
    public String toString() {
        return "Report{" +
                "reportId='" + reportId + '\'' +
                ", studentId='" + studentId + '\'' +
                ", reportGeneratedOn=" + reportGeneratedOn +
                '}';
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public String getReportId() {
        return reportId;
    }

    public void setReportId(String reportId) {
        this.reportId = reportId;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public int getSubjectFraction() {
        return subjectFraction;
    }

    public void setSubjectFraction(int subjectFraction) {
        this.subjectFraction = subjectFraction;
    }

    public int getSubjectAddition() {
        return subjectAddition;
    }

    public void setSubjectAddition(int subjectAddition) {
        this.subjectAddition = subjectAddition;
    }

    public int getSubjectVocab() {
        return subjectVocab;
    }

    public void setSubjectVocab(int subjectVocab) {
        this.subjectVocab = subjectVocab;
    }

    public int getSubjectFamilyTree() {
        return subjectFamilyTree;
    }

    public void setSubjectFamilyTree(int subjectFamilyTree) {
        this.subjectFamilyTree = subjectFamilyTree;
    }

    public int getSubjectStampDesign() {
        return subjectStampDesign;
    }

    public void setSubjectStampDesign(int subjectStampDesign) {
        this.subjectStampDesign = subjectStampDesign;
    }

    public long getReportGeneratedOn() {
        return reportGeneratedOn;
    }

    public void setReportGeneratedOn(long reportGeneratedOn) {
        this.reportGeneratedOn = reportGeneratedOn;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public int compareTo(Report o) {
        return Integer.compare(this.level,o.level);
    }

    public int getAverage() {
        return (subjectAddition+subjectFraction+subjectFamilyTree+subjectVocab+subjectStampDesign)/5;
    }
}

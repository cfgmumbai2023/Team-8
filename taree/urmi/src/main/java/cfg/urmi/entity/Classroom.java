package cfg.urmi.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.util.List;
@Document("Classes")
public class Classroom {
    @Id
    private String classId;
    private String level;
    private List<String> studentIds;

    public Classroom() {
    }

    public Classroom(String classId, String level, List<String> studentIds) {
        this.classId = classId;
        this.level = level;
        this.studentIds = studentIds;
    }

    public String getClassId() {
        return classId;
    }

    public void setClassId(String classId) {
        this.classId = classId;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public List<String> getStudentIds() {
        return studentIds;
    }

    public void setStudentIds(List<String> studentIds) {
        this.studentIds = studentIds;
    }
}

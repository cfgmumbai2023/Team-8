package cfg.urmi.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.util.List;

@Document("Teachers")
public class Teacher {
    @Id
    private String teacherId;
    private List<String> classIds;
    private String name;

    public String getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(String teacherId) {
        this.teacherId = teacherId;
    }

    public List<String> getClassIds() {
        return classIds;
    }

    public void setClassIds(List<String> classIds) {
        this.classIds = classIds;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Teacher() {
    }

    public Teacher(String teacherId, List<String> classIds, String name) {
        this.teacherId = teacherId;
        this.classIds = classIds;
        this.name = name;
    }
}

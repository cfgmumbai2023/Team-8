package cfg.urmi.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.util.List;
@Document("Schools")
public class School {
    @Id
    private String schoolId;
    private List<String> classIds;
    private String Address;

    public String getSchoolId() {
        return schoolId;
    }

    public void setSchoolId(String schoolId) {
        this.schoolId = schoolId;
    }

    public List<String> getClassIds() {
        return classIds;
    }

    public void setClassIds(List<String> classIds) {
        this.classIds = classIds;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String address) {
        Address = address;
    }

    public School() {
    }

    public School(String schoolId, List<String> classIds, String address) {
        this.schoolId = schoolId;
        this.classIds = classIds;
        Address = address;
    }
}

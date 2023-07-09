package cfg.urmi.controller;

import cfg.urmi.entity.Report;
import cfg.urmi.entity.School;
import cfg.urmi.entity.Student;
import cfg.urmi.service.Service;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@org.springframework.web.bind.annotation.RestController
@CrossOrigin
@RequestMapping("urmi")
public class RestController {
    private final Service service;
    @Autowired
    public RestController(Service service) {
        this.service = service;
    }
    @GetMapping("/hi")
    public int hello() {
        return HttpServletResponse.SC_OK;
    }
    @PostMapping("/check")
    public String check(@RequestBody School school){
        return school.toString();
    }
    @PostMapping("/addReport")
    public String addReportToMongo(@RequestBody Report report){
        return service.addReportToMongo(report).toString();
    }@PostMapping("/addStudent")
    public String addReportToMongo(@RequestBody Student student){
        return service.addStudentToMongo(student).toString();
    }
    @PostMapping("perStudentReport/{studentId}/{startDate}/{endDate}")
    public List<Integer> getPerStudentReport(@PathVariable String studentId, @PathVariable long startDate, @PathVariable long endDate ){
        return service.getPerStudentReport(studentId,startDate, endDate);
    }
    @PostMapping("schoolWiseReport/{schoolId}/{startDate}/{endDate}")
    public List<List<Integer>> schoolWiseReport(@PathVariable String schoolId, @PathVariable long startDate, @PathVariable long endDate ){
        return service.getSchoolWiseReport(schoolId,startDate, endDate);
    }
//    @PostMapping("classWiseReport/{classId}/{startDate}/{endDate}")
//    public List<Integer> classWiseReport(@PathVariable String classId, @PathVariable long startDate, @PathVariable long endDate ){
//        return service.getClassWiseReport(classId,startDate, endDate);
//    }
}

package com.qhit.job.controller; 

import com.qhit.job.pojo.Job; 
import com.qhit.job.service.IJobService; 
import org.springframework.web.bind.annotation.RequestMapping; 
import javax.annotation.Resource; 
import java.util.List; 
import org.springframework.web.bind.annotation.RestController; 

 

@RestController 
@RequestMapping("/job") 
public class JobController { 

    @Resource 
    IJobService jobService; 

    @RequestMapping("/insert") 
    public void insert(Job job) { 
        jobService.insert(job); 
    } 

    @RequestMapping("/delete") 
    public void delete(Integer jobId) { 
        jobService.delete(jobId); 
    } 

    @RequestMapping("/update") 
    public void update(Job job) { 
        jobService.update(job); 
    } 

    @RequestMapping("/updateSelective") 
    public void updateSelective(Job job) { 
        jobService.updateSelective(job); 
    } 

    @RequestMapping("/load") 
    public Job load(Integer jobId) { 
        Job job = jobService.findById(jobId); 
        return job; 
    } 

    @RequestMapping("/list") 
    public List<Job> list()  { 
        List<Job> list = jobService.findAll(); 
        return list; 
    } 

    @RequestMapping("/search") 
    public List<Job> search(Job job) { 
        List<Job> list = jobService.search(job); 
        return list; 
    } 
    
    //获取session里用户id
    public String baseUserLogin(HttpSession session) {
        Object baseUserLogin = session.getAttribute("baseUserLogin");
        String s = baseUserLogin.toString();
        JSONObject jsonObject = JSONObject.fromObject(s);
        String userId = jsonObject.getString("userId");
        return userId;
    }

} 

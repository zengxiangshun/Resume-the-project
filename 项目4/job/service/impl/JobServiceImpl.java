package com.qhit.job.service.impl;

import com.qhit.job.service.IJobService;
import java.util.List;
import com.qhit.job.dao.IJobDao;
import com.qhit.job.pojo.Job;
import org.springframework.stereotype.Service;
import javax.annotation.Resource; 

/**
* Created by GeneratorCode on 2019/05/15
*/

@Service 
public class JobServiceImpl  implements IJobService {

    @Resource 
    IJobDao dao;

    @Override 
    public boolean insert(Object object) { 
        return dao.insert(object); 
    } 

    @Override 
    public boolean update(Object object) { 
        return dao.update(object); 
    } 

    @Override 
    public boolean updateSelective(Object object) { 
        return dao.updateSelective(object); 
    } 

    @Override 
    public boolean delete(Object id) { 
        Job job = findById(id); 
        return dao.delete(job); 
    } 

    @Override 
    public List findAll() { 
        return dao.findAll(); 
    } 

    @Override 
    public Job findById(Object id) { 
        List<Job> list = dao.findById(id); 
        return  list.get(0); 
    } 

    @Override 
    public List<Job> search(Job job) { 
        return dao.search(job); 
    } 

}
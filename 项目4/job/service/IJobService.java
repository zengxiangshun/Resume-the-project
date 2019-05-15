package com.qhit.job.service;

import java.util.List;
import com.qhit.job.pojo.Job;
/**
* Created by GeneratorCode on 2019/05/15
*/
public interface IJobService {

    boolean insert(Object object);

    boolean  update(Object object);

    boolean  updateSelective(Object object);

    boolean delete(Object id);

    List findAll();

    Job findById(Object id);

    List<Job> search(Job job);

}
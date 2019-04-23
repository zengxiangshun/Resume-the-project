package com.qhit.inPatient.service.impl;

import com.qhit.inPatient.service.IInPatientService;
import java.util.List;
import com.qhit.inPatient.dao.IInPatientDao;
import com.qhit.inPatient.pojo.InPatient;
import org.springframework.stereotype.Service;
import javax.annotation.Resource; 

/**
* Created by GeneratorCode on 2019/01/15
*/

@Service 
public class InPatientServiceImpl  implements IInPatientService {

    @Resource 
    IInPatientDao dao;

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
        InPatient inPatient = findById(id); 
        return dao.delete(inPatient); 
    } 


    @Override 
    public List findAll() { 
        return dao.findAll(); 
    } 


    @Override 
    public InPatient findById(Object id) { 
        List<InPatient> list = dao.findById(id); 
        return  list.get(0); 
    } 


    @Override 
    public List<InPatient> search(InPatient inPatient) { 
        return dao.search(inPatient); 
    }

    @Override
    public List<InPatient> findAlls() {
        return dao.findAlls();
    }

    @Override
    public List<InPatient> findAllj() {
        return dao.findAllj();
    }

    @Override
    public List<InPatient> findAll1() {
        return dao.findA1();
    }

    @Override
    public List<InPatient> findAll2() {
        return dao.findA2();
    }

    @Override
    public List<InPatient> findAla1() {
        return dao.findAa1();
    }

    @Override
    public List<InPatient> findAla2() {
        return dao.findAa2();
    }


}
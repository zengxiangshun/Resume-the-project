package com.qhit.chargeRecordinfo.service.impl;

import com.qhit.chargeRecordinfo.service.IChargeRecordinfoService;
import java.util.List;
import com.qhit.chargeRecordinfo.dao.IChargeRecordinfoDao;
import com.qhit.chargeRecordinfo.pojo.ChargeRecordinfo;
import org.springframework.stereotype.Service;
import javax.annotation.Resource; 

/**
* Created by GeneratorCode on 2019/01/28
*/

@Service 
public class ChargeRecordinfoServiceImpl  implements IChargeRecordinfoService {

    @Resource 
    IChargeRecordinfoDao dao;

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
        ChargeRecordinfo chargeRecordinfo = findById(id); 
        return dao.delete(chargeRecordinfo); 
    } 


    @Override 
    public List findAll() { 
        return dao.findAll(); 
    } 


    @Override 
    public ChargeRecordinfo findById(Object id) { 
        List<ChargeRecordinfo> list = dao.findById(id); 
        return  list.get(0); 
    } 


    @Override 
    public List<ChargeRecordinfo> search(ChargeRecordinfo chargeRecordinfo) { 
        return dao.search(chargeRecordinfo); 
    } 


}
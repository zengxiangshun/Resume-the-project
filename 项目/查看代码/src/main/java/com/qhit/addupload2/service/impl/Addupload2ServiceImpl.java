package com.qhit.addupload2.service.impl;

import com.qhit.addupload2.service.IAddupload2Service;
import java.util.List;
import com.qhit.addupload2.dao.IAddupload2Dao;
import com.qhit.addupload2.pojo.Addupload2;
import org.springframework.stereotype.Service;
import javax.annotation.Resource; 

/**
* Created by GeneratorCode on 2018/12/25
*/

@Service 
public class Addupload2ServiceImpl  implements IAddupload2Service {

    @Resource 
    IAddupload2Dao dao;

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
        Addupload2 addupload2 = findById(id); 
        return dao.delete(addupload2); 
    } 


    @Override 
    public List findAll() { 
        return dao.findAll(); 
    } 


    @Override 
    public Addupload2 findById(Object id) { 
        List<Addupload2> list = dao.findById(id); 
        return  list.get(0); 
    } 


    @Override 
    public List<Addupload2> search(Addupload2 addupload2) { 
        return dao.search(addupload2); 
    }

    @Override
    public void delBtn(String[] split) {
        dao.deleteBatch(split);
    }


}
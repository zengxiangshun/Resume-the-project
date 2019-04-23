package com.qhit.addupload2.dao;

import org.springframework.stereotype.Repository;
import com.qhit.addupload2.pojo.Addupload2;
import java.util.List;

/**
* Created by GeneratorCode on 2018/12/25
*/

@Repository  
public interface IAddupload2Dao {

    boolean insert(Object object);

    boolean  update(Object object);

    boolean  updateSelective(Object object);

    boolean delete(Object object);

    List findAll();

    List findById(Object id);

    List<Addupload2> search(Addupload2 addupload2);

    List findByName(Object name);

    List findBySize(Object size);

    List findByTodate(Object todate);

    List findByUserId(Object userId);
    void deleteBatch(String[] a);

}
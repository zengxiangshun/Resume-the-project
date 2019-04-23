package com.qhit.addupload2.service;

import java.util.List;
import com.qhit.addupload2.pojo.Addupload2;
/**
* Created by GeneratorCode on 2018/12/25
*/

public interface IAddupload2Service {

    boolean insert(Object object);

    boolean  update(Object object);

    boolean  updateSelective(Object object);

    boolean delete(Object id);

    List findAll();

    Addupload2 findById(Object id);

    List<Addupload2> search(Addupload2 addupload2);

    void delBtn(String[] split);
}
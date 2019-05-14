package com.qhit.baseUser.dao;

import org.apache.ibatis.annotations.Mapper;
import com.qhit.baseUser.pojo.BaseUser;
import java.util.List;

/** 
* Created by GeneratorCode on 2019/05/06
*/

@Mapper  
public interface IBaseUserDao {

    boolean insert(Object object);

    boolean  update(Object object);

    boolean  updateSelective(Object object);

    boolean delete(Object object);

    List freeFind(String sql);

    List findAll();

    List findById(Object id);

    boolean freeUpdate(String sql);

    List<BaseUser> search(BaseUser baseUser);

    List findByUserName(Object userName);

    List findByPassword(Object password);

    List findByName(Object name);

    List findByUserSex(Object userSex);

    List findByUserAge(Object userAge);

    List findByEmail(Object email);

    List findByTelno(Object telno);

    List findByStatusId(Object statusId);

}
package com.qhit.baseChat.dao;

import org.apache.ibatis.annotations.Mapper;
import com.qhit.baseChat.pojo.BaseChat;
import java.util.List;

/** 
* Created by GeneratorCode on 2019/05/14
*/

@Mapper  
public interface IBaseChatDao {

    boolean insert(Object object);

    boolean  update(Object object);

    boolean  updateSelective(Object object);

    boolean delete(Object object);

    List freeFind(String sql);

    List findAll();

    List findById(Object id);

    boolean freeUpdate(String sql);

    List<BaseChat> search(BaseChat baseChat);
    List<BaseChat> searchs(BaseChat baseChat);

    List findByAuId(Object auId);

    List findByBuId(Object buId);

    List findByStatus(Object status);

    List findByMass(Object mass);

}
package com.qhit.friends.dao;

import org.apache.ibatis.annotations.Mapper;
import com.qhit.friends.pojo.Friends;
import java.util.List;

/** 
* Created by GeneratorCode on 2019/05/14
*/

@Mapper  
public interface IFriendsDao {

    boolean insert(Object object);

    boolean  update(Object object);

    boolean  updateSelective(Object object);

    boolean delete(Object object);

    List freeFind(String sql);

    List findAll();

    List findById(Object id);

    boolean freeUpdate(String sql);

    List<Friends> search(Friends friends);

    List findByAuId(Object auId);

    List findByBuId(Object buId);

}
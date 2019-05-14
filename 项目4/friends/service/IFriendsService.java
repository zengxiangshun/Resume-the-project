package com.qhit.friends.service;

import java.util.List;
import com.qhit.friends.pojo.Friends;
/**
* Created by GeneratorCode on 2019/05/14
*/
public interface IFriendsService {

    boolean insert(Object object);

    boolean  update(Object object);

    boolean  updateSelective(Object object);

    boolean delete(Object id);

    List findAll();

    Friends findById(Object id);

    List<Friends> search(Friends friends);

}
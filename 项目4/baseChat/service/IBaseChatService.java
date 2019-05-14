package com.qhit.baseChat.service;

import java.util.List;
import com.qhit.baseChat.pojo.BaseChat;
/**
* Created by GeneratorCode on 2019/05/14
*/
public interface IBaseChatService {

    boolean insert(Object object);

    boolean  update(Object object);

    boolean  updateSelective(Object object);

    boolean delete(Object id);

    List findAll();

    BaseChat findById(Object id);

    List<BaseChat> search(BaseChat baseChat);
    List<BaseChat> searchs(BaseChat baseChat);

}
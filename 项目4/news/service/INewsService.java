package com.qhit.news.service;

import java.util.List;
import com.qhit.news.pojo.News;
/**
* Created by GeneratorCode on 2019/05/08
*/
public interface INewsService {

    boolean insert(Object object);

    boolean  update(Object object);

    boolean  updateSelective(Object object);

    boolean delete(Object id);

    List findAll();

    News findById(Object id);

    List<News> search(News news);

}
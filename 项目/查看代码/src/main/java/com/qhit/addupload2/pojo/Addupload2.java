package com.qhit.addupload2.pojo;


import com.qhit.baseUser.pojo.BaseUser;

/**
* Created by GeneratorCode on 2018/12/25
*/

public class Addupload2 {

    private Integer id;    //文件id
    private String name;    //文件名
    private String size;    //文件大小
    private String todate;    //上传时间
    private Integer userId;    //用户id
    private BaseUser baseUser;

    public BaseUser getBaseUser() {
        return baseUser;
    }

    public void setBaseUser(BaseUser baseUser) {
        this.baseUser = baseUser;
    }

    public Integer getId() {
        return id;
    }
 
    public void setId(Integer id) { 
        this.id = id;
    }
 
    public String getName() { 
        return name;
    }
 
    public void setName(String name) { 
        this.name = name;
    }
 
    public String getSize() { 
        return size;
    }
 
    public void setSize(String size) { 
        this.size = size;
    }
 
    public String getTodate() { 
        return todate;
    }
 
    public void setTodate(String todate) { 
        this.todate = todate;
    }
 
    public Integer getUserId() { 
        return userId;
    }
 
    public void setUserId(Integer userId) { 
        this.userId = userId;
    }
 

 }
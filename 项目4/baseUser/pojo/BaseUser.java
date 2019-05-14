package com.qhit.baseUser.pojo;


/** 
* Created by GeneratorCode on 2019/05/06
*/ 

public class BaseUser { 
    private Integer userId;    //主键 
    private String userName;    //账号 
    private String password;    //密码 
    private String name;    //姓名 
    private Integer userSex;    //1、男  2、女 
    private Integer userAge;    //年龄 
    private String email;    //邮箱 
    private String telno;    //电话 
    private Integer statusId;    //身份id 1——9 

    public Integer getUserId() { 
        return userId;
    }

    public void setUserId(Integer userId) { 
        this.userId = userId;
    } 

    public String getUserName() { 
        return userName;
    }

    public void setUserName(String userName) { 
        this.userName = userName;
    }
    public String getPassword() { 
        return password;
    }

    public void setPassword(String password) { 
        this.password = password;
    }
    public String getName() { 
        return name;
    }

    public void setName(String name) { 
        this.name = name;
    }
    public Integer getUserSex() { 
        return userSex;
    }

    public void setUserSex(Integer userSex) { 
        this.userSex = userSex;
    } 

    public Integer getUserAge() { 
        return userAge;
    }

    public void setUserAge(Integer userAge) { 
        this.userAge = userAge;
    } 

    public String getEmail() { 
        return email;
    }

    public void setEmail(String email) { 
        this.email = email;
    }
    public String getTelno() { 
        return telno;
    }

    public void setTelno(String telno) { 
        this.telno = telno;
    }
    public Integer getStatusId() { 
        return statusId;
    }

    public void setStatusId(Integer statusId) { 
        this.statusId = statusId;
    } 


 }
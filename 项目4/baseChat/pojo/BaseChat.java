package com.qhit.baseChat.pojo;


/** 
* Created by GeneratorCode on 2019/05/14
*/ 

public class BaseChat { 
    private Integer chatId;    //id 
    private Integer auId;    //a用户 
    private Integer buId;    //b用户 
    private Integer status;    //状态 
    private String mass;    //消息 

    public Integer getChatId() { 
        return chatId;
    }

    public void setChatId(Integer chatId) { 
        this.chatId = chatId;
    } 

    public Integer getAuId() { 
        return auId;
    }

    public void setAuId(Integer auId) { 
        this.auId = auId;
    } 

    public Integer getBuId() { 
        return buId;
    }

    public void setBuId(Integer buId) { 
        this.buId = buId;
    } 

    public Integer getStatus() { 
        return status;
    }

    public void setStatus(Integer status) { 
        this.status = status;
    } 

    public String getMass() { 
        return mass;
    }

    public void setMass(String mass) { 
        this.mass = mass;
    }

 }
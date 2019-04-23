package com.qhit.chargeRecord.pojo;


/**
* Created by GeneratorCode on 2019/01/28
*/

public class ChargeRecord {

    private Integer chargeId;    //主键
    private Integer patientId;    //病人
    private Integer doctorId;    //医生
    private Double amount;    //总金额
    private String chargeDate;    //收费日期
    private Integer chargeUser;    //收费人

    public Integer getChargeId() { 
        return chargeId;
    }
 
    public void setChargeId(Integer chargeId) { 
        this.chargeId = chargeId;
    }
 
    public Integer getPatientId() { 
        return patientId;
    }
 
    public void setPatientId(Integer patientId) { 
        this.patientId = patientId;
    }
 
    public Integer getDoctorId() { 
        return doctorId;
    }
 
    public void setDoctorId(Integer doctorId) { 
        this.doctorId = doctorId;
    }
 
    public Double getAmount() { 
        return amount;
    }
 
    public void setAmount(Double amount) { 
        this.amount = amount;
    }
 
    public String getChargeDate() { 
        return chargeDate;
    }
 
    public void setChargeDate(String chargeDate) { 
        this.chargeDate = chargeDate;
    }
 
    public Integer getChargeUser() { 
        return chargeUser;
    }
 
    public void setChargeUser(Integer chargeUser) { 
        this.chargeUser = chargeUser;
    }
 

 }
package com.qhit.chargeRecordinfo.pojo;


/**
* Created by GeneratorCode on 2019/01/28
*/

public class ChargeRecordinfo {

    private Integer chargeInfoid;    //主键
    private Integer chargeId;    //收费记录
    private Integer codeId;    //药品
    private Double unitprc;    //单价
    private Integer amt;    //数量

    public Integer getChargeInfoid() { 
        return chargeInfoid;
    }
 
    public void setChargeInfoid(Integer chargeInfoid) { 
        this.chargeInfoid = chargeInfoid;
    }
 
    public Integer getChargeId() { 
        return chargeId;
    }
 
    public void setChargeId(Integer chargeId) { 
        this.chargeId = chargeId;
    }
 
    public Integer getCodeId() { 
        return codeId;
    }
 
    public void setCodeId(Integer codeId) { 
        this.codeId = codeId;
    }
 
    public Double getUnitprc() { 
        return unitprc;
    }
 
    public void setUnitprc(Double unitprc) { 
        this.unitprc = unitprc;
    }
 
    public Integer getAmt() { 
        return amt;
    }
 
    public void setAmt(Integer amt) { 
        this.amt = amt;
    }
 

 }
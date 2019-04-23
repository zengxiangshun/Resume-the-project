package com.qhit.doctorMenuMedicine.pojo;


import com.sun.org.glassfish.gmbal.Description;

/**
* Created by GeneratorCode on 2018/12/19
*/

public class DoctorMenuMedicine {

    private Integer mdId;    //主键
    private Integer menuId;    //套餐
    private Integer codeId;    //药品
    private Integer amt;    //数量
    @Description("un")
    private String cname;    //药品名
    @Description("un")
    private String cid;    //药品id
    @Description("un")
    private String msamt;    //库存

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getMsamt() {
        return msamt;
    }

    public void setMsamt(String msamt) {
        this.msamt = msamt;
    }

    public Integer getMdId() {
        return mdId;
    }
 
    public void setMdId(Integer mdId) { 
        this.mdId = mdId;
    }
 
    public Integer getMenuId() { 
        return menuId;
    }
 
    public void setMenuId(Integer menuId) { 
        this.menuId = menuId;
    }
 
    public Integer getCodeId() { 
        return codeId;
    }
 
    public void setCodeId(Integer codeId) { 
        this.codeId = codeId;
    }
 
    public Integer getAmt() { 
        return amt;
    }
 
    public void setAmt(Integer amt) { 
        this.amt = amt;
    }
 

 }
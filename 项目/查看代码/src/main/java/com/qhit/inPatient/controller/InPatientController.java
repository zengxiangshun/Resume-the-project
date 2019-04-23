package com.qhit.inPatient.controller; 

import com.qhit.inPatient.A2;
import com.qhit.inPatient.pojo.InPatient;
import com.qhit.inPatient.service.IInPatientService; 
import com.qhit.inPatient.service.impl.InPatientServiceImpl; 
import org.springframework.stereotype.Controller; 
import org.springframework.ui.Model; 
import org.springframework.web.bind.annotation.RequestMapping; 
import javax.annotation.Resource; 
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse; 
import com.alibaba.fastjson.JSON; 
import java.io.IOException; 
import java.util.List; 

/** 
* Created by GeneratorCode on 2019/01/15
*/ 

@Controller 
@RequestMapping("/inPatient") 
public class InPatientController {
    int a = 0;

    @Resource 
    IInPatientService inPatientService; 

    @RequestMapping("/insert") 
    public String insert(InPatient inPatient) { 
        inPatientService.insert(inPatient); 
        return "forward:list.action"; 
    } 
 
    @RequestMapping("/delete") 
    public String delete(Integer patientId, HttpServletResponse response) throws IOException { 
        inPatientService.delete(patientId); 
        return "forward:list.action"; 
    } 
 
    @RequestMapping("/update") 
    public String update(InPatient inPatient) { 
        inPatientService.update(inPatient); 
        return "forward:list.action"; 
    }
    @RequestMapping("/upda")
    public String upda(String a) {
        String substring = a.substring(0, a.length() - 1);
        String[] split = substring.split(",");
        for (int i = 0; i < split.length; i++) {
            String s = split[i];
            InPatient byId = inPatientService.findById(Integer.parseInt(s));
            byId.setStatus(2);
            inPatientService.update(byId);
        }
//        inPatientService.update(inPatient);
        return "forward:list.action";
    }
 
    @RequestMapping("/updateSelective") 
    public String updateSelective(InPatient inPatient) { 
        inPatientService.updateSelective(inPatient); 
        return "forward:list.action"; 
    } 
 
    @RequestMapping("/load") 
    public String load(Integer patientId, Model model) { 
        InPatient inPatient = inPatientService.findById(patientId); 
        model.addAttribute("inPatient",inPatient); 
        return "inPatient/edit"; 
    } 
 
    @RequestMapping("/list") 
    public String list(Model model) throws IOException { 
        List<InPatient> list = inPatientService.findAll(); 
        model.addAttribute("list",list);
        List<InPatient> a1 = inPatientService.findAll1();
        List<InPatient> a2 = inPatientService.findAll2();
        double as1 = 0;
        double as2 = 0;
        for (int i = 0; i <a1.size() ; i++) {
            as1=as1+a1.get(i).getAmount();
        }
        for (int i = 0; i <a2.size() ; i++) {
            as2=as2+a2.get(i).getAmount();
        }
        int ac = (int) as2;
        model.addAttribute("as1",as1);
        model.addAttribute("as2",ac);
        return "inPatient/list";
    }
    @RequestMapping("/xu")
    public String xu(Model model) throws IOException {
        a++;
        List<InPatient> list=null;
        if (a%2==0){
            list = inPatientService.findAllj();
        }else {
            list = inPatientService.findAlls();
        }
        model.addAttribute("list",list);
        return "inPatient/list";
    }
 
    @RequestMapping("/ajaxList") 
    public void ajaxList(HttpServletResponse response) throws IOException { 
        List<InPatient> list = inPatientService.findAll(); 
        String s = JSON.toJSONString(list); 
        response.getWriter().write(s); 
    }
    @RequestMapping("/he")
    public void he(HttpServletResponse response) throws IOException {
        List<InPatient> a1 = inPatientService.findAla1();
        List<InPatient> a2 = inPatientService.findAla2();
        double as1 = 0;
        double as2 = 0;
        for (int i = 0; i <a1.size() ; i++) {
            as1=as1+a1.get(i).getAmount();
        }
        for (int i = 0; i <a2.size() ; i++) {
            as2=as2+a2.get(i).getAmount();
        }
        A2 ac = new A2();

        //电脑d盘中的abc.txt 文档
        String filePath = "D:/abc.txt" ;

        //要写入的内容
        String content = "出院："+as2+";在院："+as1+"" ;
        ac.writeFile( filePath , content  ) ;
    }
 
    @RequestMapping("/search") 
    public String search(InPatient inPatient,Model model) { 
        List<InPatient> list = inPatientService.search(inPatient); 
        model.addAttribute("list",list); 
        model.addAttribute("searchObject",inPatient); 
        return "inPatient/list"; 
    } 
 
} 

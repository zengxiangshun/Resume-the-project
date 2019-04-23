package com.qhit.doctorMenu.controller; 

import com.qhit.baseRole.pojo.BaseRole;
import com.qhit.baseRole.service.IBaseRoleService;
import com.qhit.baseRole.service.impl.BaseRoleServiceImpl;
import com.qhit.baseUser.pojo.BaseUser;
import com.qhit.baseUser.service.IBaseUserService;
import com.qhit.baseUser.service.impl.BaseUserServiceImpl;
import com.qhit.baseUserRole.pojo.BaseUserRole;
import com.qhit.doctorMenu.pojo.DoctorMenu;
import com.qhit.doctorMenu.service.IDoctorMenuService; 
import com.qhit.doctorMenu.service.impl.DoctorMenuServiceImpl; 
import org.springframework.stereotype.Controller; 
import org.springframework.ui.Model; 
import org.springframework.web.bind.annotation.RequestMapping;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSON; 
import java.io.IOException; 
import java.util.List; 

/**
* Created by GeneratorCode on 2018/12/19
*/
@Controller 
@RequestMapping("/doctorMenu") 
public class DoctorMenuController { 

    IDoctorMenuService doctorMenuService = new DoctorMenuServiceImpl();;
    IBaseUserService baseUserService = new BaseUserServiceImpl();
    IBaseRoleService baseRoleService = new BaseRoleServiceImpl();

    @RequestMapping("/insert") 
    public String insert(DoctorMenu doctorMenu) {
        boolean flag = doctorMenuService.findByName(doctorMenu.getMenuName());
        if (flag){
            return "doctorMenu/err";
        }else {
            doctorMenuService.insert(doctorMenu);
            return "forward:list.action";
        }

    } 
 
    @RequestMapping("/delete") 
    public String delete(Integer menuId, HttpServletResponse response,int userId, HttpSession session,Model model) throws IOException {
        BaseUser bucct = (BaseUser) session.getAttribute("bucct");
        BaseUser byId = baseUserService.findById(bucct.getUserId());
        BaseUser byId1 = baseUserService.findById(userId);
        if (byId.getDeptId()==byId1.getDeptId()){
            doctorMenuService.delete(menuId);
            return "forward:list.action";
        }
//        List<BaseRole> list = baseUserService.find(bucct.getUserId());
//        List<BaseRole> list2 = baseUserService.find(userId);
//        for (int i = 0; i < list.size(); i++) {
//            for (int j = 0; j < list2.size(); j++) {
//                Integer rid = list2.get(j).getRid();
//                Integer rid1 = list.get(i).getRid();
//                if (list.get(i).getRid()==list2.get(j).getRid()){
//                    doctorMenuService.delete(menuId);
//                    return "forward:list.action";
//                }
//            }
//        }
        return "doctorMenu/flag";

    }
    @RequestMapping("/deletes")
    public String deletes(Integer menuId, HttpServletResponse response) throws IOException {
        doctorMenuService.delete(menuId);
        return "forward:list.action";
    }
 
    @RequestMapping("/update") 
    public String update(DoctorMenu doctorMenu,HttpSession session) {
        String name = (String) session.getAttribute("flagMenuName");
        if (doctorMenu.getMenuName().equals(name)){
            doctorMenuService.update(doctorMenu);
        }else {
            boolean flag = doctorMenuService.findByName(doctorMenu.getMenuName());
            if (flag){
                return "doctorMenu/err";
            }else {
                doctorMenuService.update(doctorMenu);
                return "forward:list.action";
            }
        }
        return "forward:list.action"; 
    } 
 
    @RequestMapping("/updateSelective") 
    public String updateSelective(DoctorMenu doctorMenu) { 
        doctorMenuService.updateSelective(doctorMenu); 
        return "forward:list.action"; 
    } 
 
    @RequestMapping("/load") 
    public String load(Integer menuId, Model model, HttpSession session) {
        DoctorMenu doctorMenu = doctorMenuService.findById(menuId);
        List all2 = baseUserService.findAll();
        model.addAttribute("bus",all2);
        session.setAttribute("flagMenuName",doctorMenu.getMenuName());
        model.addAttribute("doctorMenu",doctorMenu); 
        return "doctorMenu/edit";
    }
    @RequestMapping("/loads")
    public String loads(Integer menuId, Model model, HttpSession session,int userId) {
        BaseUser bucct = (BaseUser) session.getAttribute("bucct");
        BaseUser byId = baseUserService.findById(bucct.getUserId());
        BaseUser byId1 = baseUserService.findById(userId);
        if (byId.getDeptId()==byId1.getDeptId()){
            DoctorMenu doctorMenu = doctorMenuService.findById(menuId);
            List all2 = baseUserService.findAll();
            model.addAttribute("bus",all2);
            session.setAttribute("flagMenuName",doctorMenu.getMenuName());
            model.addAttribute("doctorMenu",doctorMenu);
            return "doctorMenu/edit";
        }
//        List<BaseRole> list = baseUserService.find(bucct.getUserId());
//        List<BaseRole> list2 = baseUserService.find(userId);
//        for (int i = 0; i < list.size(); i++) {
//            for (int j = 0; j < list2.size(); j++) {
//                Integer rid = list2.get(j).getRid();
//                Integer rid1 = list.get(i).getRid();
//                if (list.get(i).getRid()==list2.get(j).getRid()){
//                    DoctorMenu doctorMenu = doctorMenuService.findById(menuId);
//                    List all2 = baseUserService.findAll();
//                    model.addAttribute("bus",all2);
//                    session.setAttribute("flagMenuName",doctorMenu.getMenuName());
//                    model.addAttribute("doctorMenu",doctorMenu);
//                    return "doctorMenu/edit";
//                }
//            }
//        }
        return "doctorMenu/flag";
    }
 
    @RequestMapping("/list") 
    public String list(Model model) throws IOException { 
        List<DoctorMenu> list = doctorMenuService.findAll();
        List all2 = baseUserService.findAll();
        model.addAttribute("bus",all2);
        model.addAttribute("list",list); 
        return "doctorMenu/list"; 
    } 
 
    @RequestMapping("/ajaxList") 
    public void ajaxList(HttpServletResponse response) throws IOException { 
        List<DoctorMenu> list = doctorMenuService.findAll(); 
        String s = JSON.toJSONString(list); 
        response.getWriter().write(s); 
    } 
 
    @RequestMapping("/search") 
    public String search(DoctorMenu doctorMenu,Model model) { 
        List<DoctorMenu> list = doctorMenuService.search(doctorMenu); 
        model.addAttribute("list",list); 
        model.addAttribute("searchObject",doctorMenu); 
        return "doctorMenu/list"; 
    } 
 
} 

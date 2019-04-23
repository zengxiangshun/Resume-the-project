package com.qhit.baseFunction.controller;

import com.qhit.baseFunction.pojo.BaseFunction;
import com.qhit.baseFunction.service.IBaseFunctionService;
import com.qhit.baseFunction.service.impl.BaseFunctionServiceImpl;
import com.qhit.baseModule.pojo.BaseModule;
import com.qhit.baseUser.pojo.BaseUser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by 16682 on 2018/11/29.
 */
@Controller
@RequestMapping("/baseFunction")
public class BaseFunctionController {
    IBaseFunctionService service = new BaseFunctionServiceImpl();
    @RequestMapping("/list")
    public String list(Model model){
        List all = service.findAll();
        model.addAttribute("list",all);
        return "/baseFunction/list";
    }
    @RequestMapping("/insert")
    public String insert(BaseFunction baseFunction){
       service.insert(baseFunction);
        return "forward:list.action";
    }
    @RequestMapping("/load")
    public String load (BaseFunction baseFunction, Model model){
        BaseFunction byId = service.findById(baseFunction.getFid());
        model.addAttribute("baseFunction",byId);
        return "/baseFunction/edit";
    }
    @RequestMapping("/update")
    public String update (BaseFunction baseFunction){
        service.updateSelective(baseFunction);
        return "forward:list.action";
    }
    @RequestMapping("/delete")
    public String delete (BaseFunction baseFunction){
        service.delete(baseFunction.getFid());
        return "forward:list.action";
    }
    @RequestMapping("/lists")
    public String lists(Model model,BaseFunction baseFunction){
        List all = service.findAlls(baseFunction);
        model.addAttribute("list",all);
        model.addAttribute("searchObject",baseFunction);
        return "/baseFunction/list";
    }
    @RequestMapping("/midlist")
    public String midlist(Model model, BaseModule baseModule, HttpServletRequest request){
        HttpSession session = request.getSession();
        BaseUser bucct = (BaseUser) session.getAttribute("bucct");
        List all = service.findByIds(baseModule.getMid(),bucct.getUserId());
        model.addAttribute("list",all);
        return "/index/left";
    }
}

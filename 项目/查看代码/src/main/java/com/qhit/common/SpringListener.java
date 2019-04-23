//package com.qhit.common; /**
// * Created by 16682 on 2018/12/18.
// */
//
//import org.springframework.stereotype.Component;
//import org.springframework.stereotype.Controller;
//import org.springframework.stereotype.Repository;
//import org.springframework.stereotype.Service;
//
//import javax.servlet.ServletContextEvent;
//import javax.servlet.ServletContextListener;
//import javax.servlet.annotation.WebListener;
//import javax.servlet.http.HttpSessionAttributeListener;
//import javax.servlet.http.HttpSessionEvent;
//import javax.servlet.http.HttpSessionListener;
//import javax.servlet.http.HttpSessionBindingEvent;
//import java.io.File;
//import java.text.Collator;
//import java.util.HashMap;
//import java.util.Map;
//
//@WebListener()
//public class SpringListener implements ServletContextListener,
//        HttpSessionListener, HttpSessionAttributeListener {
//
//    // Public constructor is required by servlet spec
//    static HashMap<String,Object> map ;
//    public SpringListener() {
//       map = new HashMap<>();
//    }
//
//    // -------------------------------------------------------
//    // ServletContextListener implementation
//    // -------------------------------------------------------
//    public void contextInitialized(ServletContextEvent sce) {
//      /* This method is called when the servlet context is
//         initialized(when the Web application is deployed).
//         You can initialize servlet context related data here.
//      */
//      //获取com.qhit的实际路径
//        String path = sce.getServletContext().getRealPath("com/qhit");
//        //创建一个file对象
//        File file = new File(path);
//        //对该文件进行递归处理
//        listFile(file);
//    }
//
//    private void listFile(File file) {
//        //如果是文件夹
//        if (file.isDirectory()){
//            File[] files = file.listFiles();
//            for (File f:files){
//                listFile(f);
//            }
//        }else {
//            String absolutePath = file.getAbsolutePath();
//            String calssPath = absolutePath.substring(absolutePath.indexOf("com\\"), absolutePath.indexOf(".class")).replaceAll("/", ".");
//            try {
//                Class<?> aClass = Class.forName(calssPath);
//                Controller controller = (Controller) aClass.getAnnotation(Controller.class);
//                Service Service = (Service) aClass.getAnnotation(Controller.class);
//                Repository Repository = (Repository) aClass.getAnnotation(Controller.class);
//                Component Component = (Component) aClass.getAnnotation(Controller.class);
//            } catch (ClassNotFoundException e) {
//                e.printStackTrace();
//            }
//        }
//    }
//
//    public void contextDestroyed(ServletContextEvent sce) {
//      /* This method is invoked when the Servlet Context
//         (the Web application) is undeployed or
//         Application Server shuts down.
//      */
//    }
//
//    // -------------------------------------------------------
//    // HttpSessionListener implementation
//    // -------------------------------------------------------
//    public void sessionCreated(HttpSessionEvent se) {
//      /* Session is created. */
//    }
//
//    public void sessionDestroyed(HttpSessionEvent se) {
//      /* Session is destroyed. */
//    }
//
//    // -------------------------------------------------------
//    // HttpSessionAttributeListener implementation
//    // -------------------------------------------------------
//
//    public void attributeAdded(HttpSessionBindingEvent sbe) {
//      /* This method is called when an attribute
//         is added to a session.
//      */
//    }
//
//    public void attributeRemoved(HttpSessionBindingEvent sbe) {
//      /* This method is called when an attribute
//         is removed from a session.
//      */
//    }
//
//    public void attributeReplaced(HttpSessionBindingEvent sbe) {
//      /* This method is invoked when an attibute
//         is replaced in a session.
//      */
//    }
//}

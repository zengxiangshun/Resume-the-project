package com.qhit.common;

import com.qhit.baseUser.pojo.BaseUser;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by 16682 on 2018/12/14.
 */
@Component
@Aspect
public class AuthorityInterceptor {
    @Before("execution(* com.qhit.*.controller.*.*(..))")
    public void before(JoinPoint jp){
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session = request.getSession();
        BaseUser bucct = (BaseUser) session.getAttribute("bucct");

    }
}

package com.qhit.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;

/**
 * Created by 16682 on 2018/12/14.
 */
@Component
@Aspect
public class LogInterceptor {
    @Before("execution(* com.qhit.*.controller.*.*(..))")
    public void before(JoinPoint jp){
        //类名
        String ClassName = jp.getTarget().getClass().getName();
        //方法名
        String name = jp.getSignature().getName();
        //参数信息
        Object[] args = jp.getArgs();
        String s = Arrays.toString(args);
        //时间
        SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");
        String format1 = format.format(new Date());
        System.out.println("开始执行类名："+ClassName+"下的方法："+name+",输出的参数是："+s+",执行时间："+format1);
    }
    @After("execution(* com.qhit.*.controller.*.*(..))")
    public void after(JoinPoint jp){
        System.out.println("结束。。。。");
    }
}

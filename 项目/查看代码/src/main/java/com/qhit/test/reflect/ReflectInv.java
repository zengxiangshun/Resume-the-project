package com.qhit.test.reflect;

import com.qhit.test.Fandian.Xican;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

/**
 * Created by 16682 on 2018/12/6.
 */
public class ReflectInv implements InvocationHandler {

    private Object object;

    public Object bind(Object object) {
        this.object = object;
        return Proxy.newProxyInstance(object.getClass().getClassLoader(),object.getClass().getInterfaces(),this);
    }

//    public static void reflect(Object object) throws InvocationTargetEx ception, IllegalAccessException, NoSuchMethodException {
//        Class aClass = object.getClass();
//        Method info = aClass.getMethod("tigongfancai");
//        info.invoke(object);
//    }
    @Override
    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
        System.out.println("点餐。。。。");
        Object invoke = method.invoke(object, args);
        System.out.println("付款。。。。");
        return invoke;
    }

//    public static void main(String[] args) throws IllegalAccessException, NoSuchMethodException, InvocationTargetException {
//        Xican xican = new Xican();
//        reflect(xican);
//    }
}

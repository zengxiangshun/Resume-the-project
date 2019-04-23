package com.qhit.test.reflect;

import org.springframework.cglib.proxy.Enhancer;
import org.springframework.cglib.proxy.MethodInterceptor;
import org.springframework.cglib.proxy.MethodProxy;

import javax.sound.midi.MetaEventListener;
import java.lang.reflect.Method;

/**
 * Created by 16682 on 2018/12/6.
 */
public class Reflect2 implements MethodInterceptor {

    public Object getIntercept(Object object){
        Enhancer enhancer = new Enhancer();
        enhancer.setSuperclass(object.getClass());
        enhancer.setCallback(this);
        return enhancer.create();
    }
    @Override
    public Object intercept(Object o, Method method, Object[] objects, MethodProxy methodProxy) throws Throwable {
        System.out.println("点餐。。。");
        Object invoke = methodProxy.invokeSuper(o, objects);
        System.out.println("付账。。。");
        return invoke;
    }
}

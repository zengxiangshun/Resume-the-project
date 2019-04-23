package com.qhit.test.Fandian;

import com.qhit.test.reflect.Reflect2;
import com.qhit.test.reflect.ReflectInv;

/**
 * Created by 16682 on 2018/12/6.
 */
public class test {
    public static void main(String[] args) {
        Fandian s = new Xican();
//        ReflectInv reflectInv = new ReflectInv();
//        Fandian bind = (Fandian) reflectInv.bind(s);
//        bind.tigongfancai();
        Reflect2 reflect2 = new Reflect2();
        Xican intercept = (Xican) reflect2.getIntercept(s);
        intercept.tigongfancai();
    }
}

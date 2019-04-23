package com.qhit.test.String;

/**
 * Created by 16682 on 2018/12/18.
 */
public class Indexs {
    public static Integer integer(String a ,String b){
        char[] arra = a.toCharArray();
        char[] arrb = b.toCharArray();
        int count=0;
        for (int i = 0; i < arra.length; i++) {
            count++;
            for (int j = 0; j < arrb.length; j++) {
                if (arra[i]==arrb[j]){
                    return count;
                }
            }
        }

        return -1;
    }
}

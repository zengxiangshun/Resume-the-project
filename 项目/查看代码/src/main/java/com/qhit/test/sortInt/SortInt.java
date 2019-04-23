package com.qhit.test.sortInt;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Random;
import java.util.Set;

/**
 * Created by 16682 on 2018/12/29.
 */
public class SortInt {
    public static void main(String[] args) {
        int[] arr = arr(20, 100);
        System.out.println(Arrays.toString(arr));

    }
    public static int[] arr(int n, int m){
        Set<Integer> integerSet = new HashSet<Integer>();
        Random random = new Random();
        while (integerSet.size()<=n){
            int i = random.nextInt(m);
            integerSet.add(i);
        }
        Object[] objects = integerSet.toArray();
        int[] a = new int[objects.length];
        for (int i = 0; i < objects.length; i++) {
            a[i] = (int) objects[i];
        }

        return a;
    }

    public static int[] paixu(int[] arr){
        for (int i = 0; i < arr.length; i++) {

        }
        return null;
    }
}

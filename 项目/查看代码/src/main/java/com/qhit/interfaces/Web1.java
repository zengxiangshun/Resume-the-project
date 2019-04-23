package com.qhit.interfaces;

import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by Administrator on 2018/5/1 0001.
 */
public class Web1 {
    public static void main(String[] args) {
        Engineer engineer = new EngineerCainiao();
        engineer.judge(12345);
    }

}

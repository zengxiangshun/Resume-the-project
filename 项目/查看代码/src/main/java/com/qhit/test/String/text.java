package com.qhit.test.String;

/**
 * Created by 16682 on 2018/12/18.
 */
public class text {
    static int i=0;
    static int sum=0;
    public static void calcSum(int n){
        if (i<=n){
            sum+=i;
            i++;
            calcSum(n);
        }
    }


    static boolean flag = true;
    static void hui(int n){
        String nn = n+"";
        if (nn.length()>=2){
            if (nn.charAt(0)==nn.charAt(nn.length()-1)){
                nn=nn.substring(1,nn.length()-1);
                if (!nn.equals("")){
                    hui(Integer.parseInt(nn));
                }
            }else {
                flag=false;
                return;
            }
        }else {
            flag=false;
            return;
        }

    }


    static int j = 0;
    static int sum1 = 1;
    static int sums = 0;
    static int sum2 = 0;
    static boolean isFlag = true;
    static void panduan(int n){
        if (isFlag){
            n=n-1;
            if (n==0){
                sum2=1;
                return;
            }
            isFlag=false;
        }
        if (j<=n){
            sums = sum2;
            sum2 = sum1+sum2;
            sum1 = sums;
            j++;
            panduan(n);
        }
    }

    static int ss(int n){
        if (n==1||n==2){
            return 1;
        }
        return ss(n-1)+ss(n-2);
    }

    public static void main(String[] args) {
        Integer integer = Indexs.integer("asddsac", "c");
        System.out.println(integer);
        calcSum(10);
        System.out.println(sum);
        hui(22);
        System.out.println(flag);
        panduan(1);
        System.out.println(sum2);
    }
}

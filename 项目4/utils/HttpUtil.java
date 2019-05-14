package com.qhit.utils;

import org.springframework.cloud.client.ServiceInstance;
import org.springframework.cloud.client.loadbalancer.LoadBalancerClient;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Component
public class HttpUtil {

    @Resource
    LoadBalancerClient loadBalancerClient;

    //服务器名 和 方法
    public Map getForMap(String servername, String mapping){
        ServiceInstance instance = loadBalancerClient.choose(servername);
        String url = "http://"+instance.getHost()+":"+instance.getPort()+"/"+mapping;
        RestTemplate restTemplate = new RestTemplate();
        return restTemplate.getForObject(url, Map.class);
    }
    public List getForList(String servername, String mapping){
        ServiceInstance instance = loadBalancerClient.choose(servername);
        String url = "http://"+instance.getHost()+":"+instance.getPort()+"/"+mapping;
        RestTemplate restTemplate = new RestTemplate();
        return restTemplate.getForObject(url, List.class);
    }
    //传参
    public Map getForMaps(String servername, String mapping,Class clazz,Map map){
        ServiceInstance instance = loadBalancerClient.choose(servername);
        String url = "http://"+instance.getHost()+":"+instance.getPort()+"/"+mapping+"?1=1";
        for(Object key:map.keySet()){
            String value = map.get(key).toString();//
            System.out.println("key:"+key+" vlaue:"+value);
            url += "&"+key+value;
        }
        RestTemplate restTemplate = new RestTemplate();
        return restTemplate.getForObject(url, Map.class);
    }
    public List getForLists(String servername, String mapping,Class clazz,Map map){
        ServiceInstance instance = loadBalancerClient.choose(servername);
        String url = "http://"+instance.getHost()+":"+instance.getPort()+"/"+mapping;
        for(Object key:map.keySet()){
            String value = map.get(key).toString();//
            System.out.println("key:"+key+" vlaue:"+value);
            url += "&"+key+value;
        }
        RestTemplate restTemplate = new RestTemplate();
        return restTemplate.getForObject(url, List.class);
    }

}

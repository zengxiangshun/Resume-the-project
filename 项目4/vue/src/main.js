// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
Vue.use(ElementUI);

Vue.config.productionTip = false


axios.defaults.withCredentials = true
import axios from 'axios'
Vue.prototype.$axios = axios    //把axios挂载到vue的原型中，在vue中每个组件都可以使用axios发送请求
// Vue.prototype.baseUrl = 'http://172.25.20.119:8087'    //设置后端的网址
Vue.prototype.baseUrl = 'http://localhost/zeng'    //设置后端的网址
// Vue.prototype.baseUrl = 'http://172.25.20.115:8790'    //设置后端的网址
import qs from 'qs'
Vue.prototype.$qs = qs;


/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  components: { App },
  template: '<App/>'
})

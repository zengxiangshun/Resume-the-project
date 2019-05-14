import Vue from 'vue'
import Router from 'vue-router'
import HelloWorld from '@/components/HelloWorld'
import news from '@/components/news/news'
import login from '@/components/chat/login'
import chat from '@/components/chat/chat'


Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'HelloWorld',
      component: HelloWorld
    },
		{
			path: '/news',
			name: 'news',
			component: news
		},{
			path: '/login',
			name: 'login',
			component: login
		},{
			path: '/chat',
			name: 'chat',
			component: chat
		}
  ]
})

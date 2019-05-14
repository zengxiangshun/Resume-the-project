<template>
	<div id="app">
		<!-- <div>{{top}}</div>
		<p>{{row}}</p>
		<div>{{reght}}</div> -->
		<div id="left">
			<div id="top">
				<h1>{{top}}</h1>
			</div>
			<!-- <hr id="hr1"> -->
			<div id="bottom"> 
			<p v-for="itm in row">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{itm}}</p>
			</div>
		</div>
		<div id="right1">
			<div class="bock">
				<span id="s1">全部新闻</span>
				<span id="s2">发布时间</span>
			</div>
			
			<!-- <hr id="hr2"> -->
			<div v-for="(tem,index) in reght">
				<div v-if="index<5&&!flags" class="int_con">
					<div class="int_left"><el-link :underline='false' @click='clae(tem.news)'>{{tem.newstheme}}</el-link></div>
					<div class="int_right">{{tem.newstime}}</div>
				</div>
				<div v-if="flags" class="int_con">
					<div class="int_left"><el-link :underline='false' @click='clae(tem.news)'>{{tem.newstheme}}</el-link></div>
					<div class="int_right">{{tem.newstime}}</div>
				</div>
			</div>
			 <el-button :icon="icons" round class='text_icon' @click='icone()'>{{text_elb}}</el-button>
		</div>
	</div>
</template>

<script>
	export default {
		name:'',
		data() {
			return {
				flags:false,
				text_elb:'更多',
				icons:'el-icon-arrow-down',
				
				newsId:'',//新闻id
				list:[],//全部数据
				top:'',//头部标题
				images:[],//图片
				row:[],//左边行
				reght:[]//右边行
			};
		},
		methods:{
			icone(){
				if(this.flags==true){
					this.flags=false
					this.text_elb='更多'
					this.icons='el-icon-arrow-down'
				}else{
					this.flags=true
					this.text_elb='收起'
					this.icons='el-icon-arrow-up'
				}
			},
			search(){
				var url = this.baseUrl+"/news/search"
				var data = {newsId:this.newsId};
				this.$axios.post(url,this.$qs.stringify(data),{
					headers: {
						'Content-Type':'application/x-www-form-urlencoded; charset=UTF-8'
					}
				}).then(res=>{
					this.list = res.data;
					for (var i = 0; i < this.list.length; i++) {
						
						var a = {news:this.list[i].news,newstheme:this.list[i].newsTheme.substring(0,16),newstime:this.list[i].newsTime}
						this.reght.push(a)
						if(i==0){
							this.top = this.list[i].newsTheme
							this.row = this.list[i].newsContent.split("\r\n\r\n")
						}
					}
					console.log(this.list)
				})
			},
			clae(s){
				for (var i = 0; i < this.list.length; i++) {
					if(this.list[i].news==s){
						this.top = this.list[i].newsTheme
					this.row = this.list[i].newsContent.split("\r\n\r\n")
					}
				}
			}
		},
		mounted() {
			this.search();
		}
		
	}
</script>

<style>
#app{
		/* width: 100%;
		height: 100%; */
		/* border: solid 1px #2C3E50; */
		/* margin-top: 200px;
		margin-left: 80px; */
		/* display: inline-block; */
	}
	.text_icon{
		margin-top: 20px;
	}
	.bock{
		height: 2.5rem;
		border-bottom: solid 3px #2C3E50;
	}
	h1{
		margin-bottom: 20px;
		color: red;
	}
	#hr1{
		width: 80%;
	}
	#left{
		margin-left: 100px;
		/* display: inline-block; */
		/* border: solid 1px #2C3E50; */
		width: 60%;
	}
	#top{
		width: 100%;
		height: 20%;
		border-bottom: solid 3px #2C3E50;
	}
	
	#bottom{
		/* width: 650px; */
		vertical-align: top;
		float: left;
		text-align: left;
		height: 100%;
		width: 70%;
		/* border: solid 1px #2C3E50; */
		margin-left: 145px;
		margin-top: 40px;
		/* margin-top: 30px; */
	}
	#bottom span{
		font-size: 18px;
	}
	
	#right1{
		/* display: inline-block; */
		margin-top: -44px;
		/* margin-left: 1300px; */
		margin-right: 40px;
		width: 25%;
		height: 100%;
		/* border: solid 1px #2C3E50; */		
		vertical-align: top;
		float: right;
		
	}
	#s1{
		/* border: solid 1px #2C3E50; */
		float: left;
		font-size: 18px;
		font-weight: 1000;
	}
	#s2{
		/* border: solid 1px #2C3E50; */
		float: right;
		font-size: 18px;
		font-weight: 1000;
	}
	.int_con{
		border-bottom: dashed  1px #2C3E50;
		margin-top: 8px;
		padding: 5px;
		height: 20px;
		font-size: 17px;
		text-align: left;
	}
	.int_left{
		float: left;
	}
	.int_right{
		float: right;
	}
</style>

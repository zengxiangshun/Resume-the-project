<template>
	<div id="app">
		<el-container>
		  <el-aside class="left" width="200px">
			  <div v-for="tem in list" >
			  	<p @click="chats(tem.buId)">{{tem.name}}{{tem.ace}}</p>
			  </div>
		  </el-aside>
		  
		  
		  <el-main class="top">
			  <div v-show="flac">
				<el-main class="top_len">
					<div v-for="tem in chat">
						<p v-if="tem.auId==cat" class="t_right">{{tem.mass}}</p>
						<p v-if="tem.auId!=cat" class="t_left">{{tem.mass}}</p>
					</div>
				</el-main>
			   
				<el-input v-model="input" placeholder="请输入内容" class="inp"></el-input>
				<el-button type="info" class="inpx" @click="butc()">信息按钮</el-button>
			  </div>
			  
		  </el-main>
		</el-container>
	</div>
</template>

<script>
	export default {
		
		name:'',
		data() {
			return {
				flac:false,
				cat:"",//主
				cut:"",//子
				list:[],
				chat:[],
				input:'',
				count:"",
				time: 0,
			};
		},
		methods:{
			search(){
				var url = this.baseUrl+"/friends/search"
				this.$axios.post(url,{
					headers: {
						'Content-Type':'application/x-www-form-urlencoded; charset=UTF-8'
					}
				}).then(res=>{
					this.list = res.data;
					this.cat=this.list[0].auId
				})
			},
			chats(a){
				
				var url = this.baseUrl+"/baseChat/search1"
				if(this.cut!=a){
					this.cut=a
					this.time = setInterval(this.chats1, 1000);
				}
				
				var data = {buId:this.cut};
				this.$axios.post(url,this.$qs.stringify(data),{
					headers: {
						'Content-Type':'application/x-www-form-urlencoded; charset=UTF-8'
					}
				}).then(res=>{
					this.chat = res.data;
					this.flac=true
					this.cut=a
					this.search()
				})
				
			},
			//用来刷新
			chats1(){
				
				var url = this.baseUrl+"/baseChat/search1"
				var data = {buId:this.cut};
				this.$axios.post(url,this.$qs.stringify(data),{
					headers: {
						'Content-Type':'application/x-www-form-urlencoded; charset=UTF-8'
					}
				}).then(res=>{
					this.chat = res.data;
					this.search()
				})
				
			},
			butc(){
				var url = this.baseUrl+"/baseChat/insert"
				var data = {buId:this.cut,auId:this.cat,status:2,mass:this.input};
				this.$axios.post(url,this.$qs.stringify(data),{
					headers: {
						'Content-Type':'application/x-www-form-urlencoded; charset=UTF-8'
					}
				}).then(res=>{
					var url = this.baseUrl+"/baseChat/search"
					var data = {buId:this.cut};
					this.$axios.post(url,this.$qs.stringify(data),{
						headers: {
							'Content-Type':'application/x-www-form-urlencoded; charset=UTF-8'
						}
					}).then(res=>{
						this.chat = res.data;
					})
				})
			},
		},
		mounted(){
			this.search()

			
		}
		
	}
</script>

<style>
	
.left{
	height:500px;
	border:solid #2C3E50;
}
.top{
	border:solid #2C3E50;
	height: 500px;
}
.top_len{
	border:solid #2C3E50;
	height: 400px;
	
}
.t_left{
	text-align: left;
}
.t_right{
	text-align: right;
}
.inp{
	width: 80%;
	float: left;
}
.inpx{
	float: right;
}

</style>

<template>
	<div class="login-wrap">
		<div class="ms-login">
			<div class="ms-title">校园通</div>
			<el-form :model="form"  ref="form" label-width="80px" class="ms-content">
				<el-form-item label="用户名">
					<el-input v-model="form.username" placeholder="请输入用户名">
					</el-input>
				</el-form-item>
				<el-form-item label="密码">
					<el-input type="password" placeholder="请输入密码" v-model="form.password" @keyup.enter.native="submitForm()">
					</el-input>
				</el-form-item>
				<div class="login-btn">
					<el-button type="primary" @click="onSubmit()">登录</el-button>
				</div>
			</el-form>
		</div>
	</div>
</template>

<script>
	export default {
		name:'',
		data() {
			return {
				form: {
					username: 'admin',
					password: '123'
				}
			  }
		},
		methods:{
			onSubmit() {
				// 后端网址
				var url = this.baseUrl+"/baseUser/login"
				// 传递给后端的数据
				var data ={userName:this.form.username,password:this.form.password};
				this.$axios.post(url,this.$qs.stringify(data),{
					headers: {
						'Content-Type':'application/x-www-form-urlencoded; charset=UTF-8'
					}
				}).then(res=>{
					// res是后端的响应
					var obj = res.data;
					
					if(obj){
						// this.$store.state.LoginFlag=true;
						// 跳转到首页
						this.$router.push({name:'chat'});
						// 更改一下登录标记
					}else{
						// 提示用户名或密码不正确
						this.$message("用户名或密码不正确");
					}
				})	
			}
		}
		
	}
</script>

<style>
	.login-wrap{
        position: relative;
        width:100%;
        height:65%;
        /* background-image: url(); */
		/* background: url(../../assets/imgs/bg.jpg) no-repeat -0px -0px;-webkit-background-size: 100% 100%; */
    }
    .ms-title{
        width:100%;
        line-height: 50px;
        text-align: center;
        font-size:20px;
        color: gray;
    }
    .ms-login{
        position: absolute;
        left:50%;
        top:50%;
        width:350px;
        margin:0px 0 0 -175px;
        border-radius: 5px;
        background: rgba(255,255,255, 0.3);
        overflow: hidden;
    }
    .ms-content{
        padding: 30px 30px;
    }
    .login-btn{
        text-align: center;
    }
    .login-btn button{
        width:100%;
        height:36px;
        margin-bottom: 10px;
    }
    .login-tips{
        font-size:12px;
        line-height:30px;
        color:#fff;
    }
</style>

new Vue({
    el: '#login-form',
    data : {
    	form : {
    		email: '',
            password: '',
            captcha: ''
    	},
    	info : ''
    },
    methods : {
    	handleSubmit() {
    		this.form.captcha = grecaptcha.getResponse();
    		axios
    		.post('/project3/admin/api/login', this.form)
    		.then((response) => {
    			console.log(response.data);
    			this.info = response.data;
    			if (this.info.status == 'success')
    				window.location.href = '/project3/admin/dashboard.html';
    		});
    	}
    }
})
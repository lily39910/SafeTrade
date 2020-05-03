jQuery(document).ready(function($){
	var formModal = $('.cd-user-modal'),
		formLogin = formModal.find('#cd-login'),
		formSignup = formModal.find('#cd-signup'),
		formForgotPassword = formModal.find('#cd-reset-password'),
		formModalTab = $('.cd-switcher'),
		tabLogin = formModalTab.children('li').eq(0).children('a'),
		tabSignup = formModalTab.children('li').eq(1).children('a'),
		forgotPasswordLink = formLogin.find('.cd-form-bottom-message a'),
		backToLoginLink = formForgotPassword.find('.cd-form-bottom-message a'),
		mainNav = $('.main-nav');

	//open modal
	mainNav.on('click', function(event){
		$(event.target).is(mainNav) && mainNav.children('ul').toggleClass('is-visible');
	});

	//open sign-up form
	mainNav.on('click', '.cd-signup', signup_selected);
	//open login-form form
	mainNav.on('click', '.cd-signin', login_selected);

	//close modal
	formModal.on('click', function(event){
		if( $(event.target).is(formModal) || $(event.target).is('.cd-close-form') ) {
			formModal.removeClass('is-visible');
		}	
	});
	//close modal when clicking the esc keyboard button
	$(document).keyup(function(event){
    	if(event.which=='27'){
    		formModal.removeClass('is-visible');
	    }
    });

	//switch from a tab to another
	formModalTab.on('click', function(event) {
		event.preventDefault();
		( $(event.target).is( tabLogin ) ) ? login_selected() : signup_selected();
	});

	//hide or show password
	$('.hide-password').on('click', function(){
		var togglePass= $(this),
			passwordField = togglePass.prev('input');
		
		( 'password' == passwordField.attr('type') ) ? passwordField.attr('type', 'text') : passwordField.attr('type', 'password');
		( 'Hide' == togglePass.text() ) ? togglePass.text('Show') : togglePass.text('Hide');
		//focus and move cursor to the end of input field
		passwordField.putCursorAtEnd();
	});

	//show forgot-password form 
	forgotPasswordLink.on('click', function(event){
		event.preventDefault();
		forgot_password_selected();
	});

	//back to login from the forgot-password form
	backToLoginLink.on('click', function(event){
		event.preventDefault();
		login_selected();
	});
	
	
	/*로그인*/
	formLogin.find('#login_btn').on('click', function(event){
		event.preventDefault();
		formLogin.find('#id').removeClass('has-error').next('span').removeClass('is-visible');
		formLogin.find('#pwd').removeClass('has-error').next('a').next('span').removeClass('is-visible');
		
		if($('#id').val() == ''){
			formLogin.find('#id').addClass('has-error').next('span').addClass('is-visible');
			if($('#pwd').val() == ''){
				formLogin.find('#pwd').addClass('has-error').next('a').next('span').addClass('is-visible');				
			}
			$('#id').focus();
		}
		else if($('#pwd').val() == ''){
			formLogin.find('#pwd').addClass('has-error').next('a').next('span').addClass('is-visible');
			$('#pwd').focus();
		}
		else{
			$.ajax({
				url: '/SafeTrade/signin',
				type: 'post',
				dataType: 'text',
				data: $('#login_form').serialize(),
				success: function(data){
					if(data == 1){ //ajax는 숫자로 받기...
						//초기화
						$('#id').val('');
						$('#pwd').val('');
						formModal.removeClass('is-visible');
						location.reload();
					}
					else {
						alert('아이디와 비밀번호가 잘못되었습니다.\n다시 입력해주세요.');
						$('#id').val('');
						$('#pwd').val('');
						$('#id').focus();
					}
				},
				error: function(){
					alert('fail!');
				}
			});		
		}
	});
	
	//아이디 재입력 시 
	$('#signup-userid').keyup(function(){
		$('#write_id_chk').removeClass('is-visible');
		$('#id_chk').removeClass('is-visible');
		$('#id_result').val("");
	});
	
	//아이디 중복 체크
	$('.overlap-id-chk').on('click', function(){
		$('#id_chk').removeClass('is-visible');
		$('#write_id_chk').removeClass('is-visible');
		if($('#signup-userid').val() != '') {
			$.ajax({
				url: '/SafeTrade/overlap_id_chk',
				type: 'post',
				dataType: 'text',
				data: "id="+ $('#signup-userid').val(),
				success: function(data){
					if(data == 0){ //ajax는 숫자로 받기...
						//아이디 사용 가능
						$("#id_result").val("ok");
						alert('사용 가능한 아이디입니다.');
					}
					else {
						alert('이미 존재하는 아이디입니다.\n다른 아이디를 입력해주세요.');
						$("#id_result").val("");
						$('#id_chk').addClass('is-visible');
						$('#signup-userid').focus();
					}
				},
				error: function(){
					alert('fail!');
				}
			});
		}
		else {
			$('#write_id_chk').addClass('is-visible');
		}
	});
	
	/*회원가입 체크*/
	formSignup.find('#join_btn').on('click', function(event){
		event.preventDefault();		
		formSignup.find('*').removeClass('has-error').next('span').removeClass('is-visible');
		formSignup.find('*').removeClass('has-error').next('a').next('span').removeClass('is-visible');
		
		if($('#signup-userid').val() == ''){
			$('#write_id_chk').addClass('is-visible');
			$('#signup-userid').focus();
		}
		else if($('#signup-password').val() == ''){
			formSignup.find('#signup-password').addClass('has-error').next('a').next('span').addClass('is-visible');
			$('#signup-password').focus();
		}
		else if($('#signup-password_chk').val() == ''){
			formSignup.find('#signup-password_chk').addClass('has-error').next('a').next('span').addClass('is-visible');
			$('#signup-password_chk').focus();
		}
		else if($('#signup-password').val() != $('#signup-password_chk').val()){
			alert('입력한 비밀번호와 비밀번호 확인이 일치하지 않습니다.\n다시 입력해주세요.');
			formSignup.find('#signup-password').addClass('has-error').next('a').next('span').addClass('is-visible');
			formSignup.find('#signup-password_chk').addClass('has-error').next('a').next('span').addClass('is-visible');
			$('#signup-password').val('');
			$('#signup-password_chk').val('');
			$('#signup-password').focus();
		}
		else if($('#signup-name').val() == ''){
			formSignup.find('#signup-name').addClass('has-error').next('span').addClass('is-visible');
			$('#signup-name').focus();
		}
		else if($("input:radio[name='gender']").is(":checked") != true){
			formSignup.find('#signup-gender_F').addClass('has-error').next('span').addClass('is-visible');
			$('#gender_p').focus();
		}
		else if($('#signup-tel').val() == ''){
			formSignup.find('#signup-tel').addClass('has-error').next('span').addClass('is-visible');
			$('#signup-tel').focus();
		}
		else if($('#signup-address').val() == ''){
			formSignup.find('#signup-address').addClass('has-error').next('span').addClass('is-visible');
			$('#signup-address').focus();
		}
		else if($('#id_result').val() == '') { //중복체크
			alert('아이디 중복체크를 해주세요');
		}
		else{
			$.ajax({
				url: '/SafeTrade/member_join',
				type: 'post',
				dataType: 'text', //받아오는 값
				data: $('#join_form').serialize(), //넘기는 값
				success: function(data){
					if(data == 1){ //ajax는 숫자로 받기...
						//초기화
						$('#signup-userid').val('');
						$('#signup-password').val('');
						$('#signup-password_chk').val('');
						$('#signup-name').val('');
						$('#signup-tel').val('');
						$('#signup-address').val('');
						formLogin.addClass('is-visible');
						alert('회원가입이 완료되었습니다.\n로그인 페이지로 이동합니다.');
						login_selected();
					}
					else {
						alert('회원가입에 실패했습니다.');
					}
				},
				error: function(){
					alert('fail!');
				}
			});
		}
	});	
	
	function login_selected(){
		mainNav.children('ul').removeClass('is-visible');
		formModal.addClass('is-visible');
		formLogin.addClass('is-selected');
		formSignup.removeClass('is-selected');
		formForgotPassword.removeClass('is-selected');
		tabLogin.addClass('selected');
		tabSignup.removeClass('selected');
	}

	function signup_selected(){
		mainNav.children('ul').removeClass('is-visible');
		formModal.addClass('is-visible');
		formLogin.removeClass('is-selected');
		formSignup.addClass('is-selected');
		formForgotPassword.removeClass('is-selected');
		tabLogin.removeClass('selected');
		tabSignup.addClass('selected');
	}

	function forgot_password_selected(){
		formLogin.removeClass('is-selected');
		formSignup.removeClass('is-selected');
		formForgotPassword.addClass('is-selected');
	}	

	//IE9 placeholder fallback
	//credits http://www.hagenburger.net/BLOG/HTML5-Input-Placeholder-Fix-With-jQuery.html
	if(!Modernizr.input.placeholder){
		$('[placeholder]').focus(function() {
			var input = $(this);
			if (input.val() == input.attr('placeholder')) {
				input.val('');
		  	}
		}).blur(function() {
		 	var input = $(this);
		  	if (input.val() == '' || input.val() == input.attr('placeholder')) {
				input.val(input.attr('placeholder'));
		  	}
		}).blur();
		/*
		$('[placeholder]').parents('form').submit(function() {
		  	$(this).find('[placeholder]').each(function() {
				var input = $(this);
				if (input.val() == input.attr('placeholder')) {
			 		input.val('');
				}
		  	})
		});
		*/
	}
});


//credits http://css-tricks.com/snippets/jquery/move-cursor-to-end-of-textarea-or-input/
jQuery.fn.putCursorAtEnd = function() {
	return this.each(function() {
    	// If this function exists...
    	if (this.setSelectionRange) {
      		// ... then use it (Doesn't work in IE)
      		// Double the length because Opera is inconsistent about whether a carriage return is one character or two. Sigh.
      		var len = $(this).val().length * 2;
      		this.focus();
      		this.setSelectionRange(len, len);
    	} else {
    		// ... otherwise replace the contents with itself
    		// (Doesn't work in Google Chrome)
      		$(this).val($(this).val());
    	}
	});
};







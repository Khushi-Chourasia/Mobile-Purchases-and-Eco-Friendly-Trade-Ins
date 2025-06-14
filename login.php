<style>
    #uni_modal .modal-content>.modal-footer,#uni_modal .modal-content>.modal-header{
        display:none;
    }
</style>
<div class="container-fluid">
    
    <div class="row">
    <h3 class="float-right">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
    </h3>
        <div class="col-lg-12">
            <h3 class="text-center">Login</h3>
            <hr>
            <form action="" id="login-form">
                <div class="form-group">
                    <label for="" class="control-label">Email</label>
                    <input type="email" class="form-control form" name="email" required>
                </div>
                <div class="form-group">
                    <label for="" class="control-label">Password</label>
                    <input type="password" class="form-control form" name="password" required>
                </div>
                <div class="form-group d-flex justify-content-between">
                    <a href="javascript:void()" id="create_account">Create Account</a>
                    <button class="btn btn-primary btn-flat">Login</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    $(function(){
        $('#create_account').click(function(){
            uni_modal("", "registration.php", "mid-large");
        });

        $('#login-form').submit(function(e){
            e.preventDefault();

            // Remove previous error messages
            if($('.err-msg').length > 0)
                $('.err-msg').remove();

            // Client-side validation
            let email = $('[name="email"]').val().trim();
            let password = $('[name="password"]').val().trim();
            let error = '';

            if(email === '' || password === ''){
                error = "Both fields are required.";
            } else if(!validateEmail(email)){
                error = "Please enter a valid email address.";
            } else if(password.length < 6){
                error = "Password must be at least 6 characters.";
            }

            if(error){
                var _err_el = $('<div>')
                    .addClass("alert alert-danger err-msg").text(error);
                $('#login-form').prepend(_err_el);
                return false;
            }

            start_loader();

            $.ajax({
                url: _base_url_ + "classes/Login.php?f=login_user",
                method: "POST",
                data: $(this).serialize(),
                dataType: "json",
                error: err => {
                    console.log(err);
                    alert_toast("An error occurred", 'error');
                    end_loader();
                },
                success: function(resp){
                    if(typeof resp === 'object' && resp.status === 'success'){
                        alert_toast("Login Successfully", 'success');
                        setTimeout(function(){
                            location.reload();
                        }, 2000);
                    } else if(resp.status === 'incorrect'){
                        var _err_el = $('<div>')
                            .addClass("alert alert-danger err-msg").text("Incorrect Credentials.");
                        $('#login-form').prepend(_err_el);
                        end_loader();
                    } else {
                        console.log(resp);
                        alert_toast("An error occurred", 'error');
                        end_loader();
                    }
                }
            });
        });

        function validateEmail(email) {
            const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            return re.test(email);
        }
    });
</script>

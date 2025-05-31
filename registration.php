<style>
    #uni_modal .modal-content>.modal-footer,#uni_modal .modal-content>.modal-header{
        display:none;
    }
</style>
<div class="container-fluid">
    <form action="" id="registration">
        <div class="row">
        
        <h3 class="text-center">Create New Account
            <span class="float-right">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </span>
        </h3>
            <hr>
        </div>
        <div class="row  align-items-center h-100">
            
            <div class="col-lg-5 border-right">
                
                <div class="form-group">
                    <label for="" class="control-label">Firstname</label>
                    <input type="text" class="form-control form-control-sm form" name="firstname" required>
                </div>
                <div class="form-group">
                    <label for="" class="control-label">Lastname</label>
                    <input type="text" class="form-control form-control-sm form" name="lastname" required>
                </div>
                <div class="form-group">
                    <label for="" class="control-label">Contact</label>
                    <input type="text" class="form-control form-control-sm form" name="contact" required>
                </div>
                <div class="form-group">
                    <label for="" class="control-label">Gender</label>
                    <select name="gender" id="" class="custom-select select" required>
                        <option>Male</option>
                        <option>Female</option>
                    </select>
                </div>
            </div>
            <div class="col-lg-7">
                <div class="form-group">
                    <label for="" class="control-label">Default Delivery Address</label>
                    <textarea class="form-control form" rows='3' name="default_delivery_address"></textarea>
                </div>
                <div class="form-group">
                    <label for="" class="control-label">Email</label>
                    <input type="text" class="form-control form-control-sm form" name="email" required>
                </div>
                <div class="form-group">
                    <label for="" class="control-label">Password</label>
                    <input type="password" class="form-control form-control-sm form" name="password" required>
                </div>
                <div class="form-group d-flex justify-content-between">
                    <a href="javascript:void()" id="login-show">Already have an Account</a>
                    <button class="btn btn-primary btn-flat">Register</button>
                </div>
            </div>
        </div>
    </form>

</div>
<script>
    $(function(){
        $('#login-show').click(function(){
            uni_modal("", "login.php");
        });

        $('#registration').submit(function(e){
            e.preventDefault();

            // Remove previous error messages
            $('.err-msg').remove();

            // Get field values
            let contact = $('[name="contact"]').val().trim();
            let email = $('[name="email"]').val().trim();
            let password = $('[name="password"]').val().trim();
            let error = '';

            // Validate contact number
            if(!/^\d{10}$/.test(contact)){
                error = "Contact must be exactly 10 digits.";
                showError('[name="contact"]', error);
                return;
            }

            // Validate email format
            if(!validateEmail(email)){
                error = "Please enter a valid email address.";
                showError('[name="email"]', error);
                return;
            }

            // Validate password complexity
            if(!validatePassword(password)){
                error = "Password must be at least 8 characters long, contain 1 uppercase, 1 lowercase, and 1 number.";
                showError('[name="password"]', error);
                return;
            }

            // Proceed with AJAX if no error
            start_loader();
            $.ajax({
                url: _base_url_ + "classes/Master.php?f=register",
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
                        alert_toast("Account successfully registered", 'success');
                        setTimeout(function(){
                            location.reload();
                        }, 2000);
                    } else if(resp.status === 'failed' && !!resp.msg){
                        var _err_el = $('<div>')
                            .addClass("alert alert-danger err-msg").text(resp.msg);
                        $('[name="password"]').after(_err_el);
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

        function validatePassword(password) {
            const re = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$/;
            return re.test(password);
        }

        function showError(selector, message){
            var _err_el = $('<div>')
                .addClass("alert alert-danger err-msg").text(message);
            $(selector).after(_err_el);
        }
    });
</script>

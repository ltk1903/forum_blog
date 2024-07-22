document.addEventListener('DOMContentLoaded', function() {
    var password = document.getElementById('password');
    var passwordConfirmation = document.getElementById('password_confirmation');
    var signUpButton = document.getElementById('sign_up_button');
    var passwordError = document.getElementById('password_error');
  
    function validatePassword() {
      if (password.value !== passwordConfirmation.value) {
        password.classList.add('error');
        passwordConfirmation.classList.add('error');
        passwordError.style.display = 'block';
        return false;
      } else {
        password.classList.remove('error');
        passwordConfirmation.classList.remove('error');
        passwordError.style.display = 'none';
        return true;
      }
    }
  
    signUpButton.addEventListener('click', function(event) {
      if (!validatePassword()) {
        event.preventDefault();
      }
    });
  });
  
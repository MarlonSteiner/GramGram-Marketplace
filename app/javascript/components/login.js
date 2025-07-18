// Add this to app/assets/javascripts/login.js or in a script tag

document.addEventListener('DOMContentLoaded', function() {
  // Add body class for styling
  document.body.classList.add('devise-sessions');

  // Add interactive effects to form inputs
  const inputs = document.querySelectorAll('.gramgram-login-form .form-control');

  inputs.forEach(input => {
    input.addEventListener('focus', function() {
      this.closest('.form-group').style.transform = 'translateY(-2px)';
    });

    input.addEventListener('blur', function() {
      this.closest('.form-group').style.transform = 'translateY(0)';
    });
  });

  // Add loading state to submit button
  const loginForm = document.querySelector('.gramgram-login-form');
  const submitButton = document.querySelector('.login-button');

  if (loginForm && submitButton) {
    loginForm.addEventListener('submit', function() {
      submitButton.innerHTML = 'Signing In...';
      submitButton.disabled = true;
    });
  }
});

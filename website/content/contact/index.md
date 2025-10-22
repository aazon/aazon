---
title: "Contact"
date: 2023-03-21T15:19:27+01:00
draft: false
description: Fill the form to get in touch with Alex Litvinenko
---

{{< rawhtml >}}
<script src="https://challenges.cloudflare.com/turnstile/v0/api.js?onload=onloadTurnstileCallback" async defer></script>
<style>
/* Liquid Glass Design - Glassmorphism */
#contact_form {
  background: rgba(255, 255, 255, 0.05);
  backdrop-filter: blur(10px);
  -webkit-backdrop-filter: blur(10px);
  border: 1px solid rgba(255, 255, 255, 0.18);
  border-radius: 20px;
  padding: 40px;
  box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.15);
}

.feedback-input {
  font-family: Helvetica, Arial, sans-serif;
  font-weight: 500;
  font-size: 18px;
  border-radius: 15px;
  line-height: 22px;
  background: rgba(255, 255, 255, 0.08);
  backdrop-filter: blur(8px);
  -webkit-backdrop-filter: blur(8px);
  border: 1px solid rgba(170, 187, 232, 0.3);
  transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
  padding: 16px 20px;
  margin-bottom: 20px;
  width: 100%;
  box-sizing: border-box;
  outline: 0;
  box-shadow: 0 4px 15px 0 rgba(31, 38, 135, 0.08);
}

.feedback-input:focus {
  border: 1px solid rgba(170, 187, 232, 0.6);
  background: rgba(255, 255, 255, 0.12);
  box-shadow: 0 8px 25px 0 rgba(170, 187, 232, 0.2);
  transform: translateY(-2px);
}

.feedback-input::placeholder {
  opacity: 0.6;
}

textarea {
  height: 150px;
  line-height: 150%;
  resize: vertical;
}

.cf-turnstile {
  margin-bottom: 20px;
  border-radius: 15px;
  overflow: hidden;
}

[type="submit"] {
  width: 100%;
  background: linear-gradient(135deg, rgba(170, 187, 232, 0.9) 0%, rgba(102, 136, 204, 0.9) 100%);
  backdrop-filter: blur(8px);
  -webkit-backdrop-filter: blur(8px);
  border-radius: 15px;
  border: 1px solid rgba(255, 255, 255, 0.3);
  cursor: pointer;
  color: white;
  font-size: 22px;
  padding: 16px 10px;
  transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
  margin-top: 4px;
  font-weight: 700;
  box-shadow: 0 8px 25px 0 rgba(170, 187, 232, 0.3);
  text-transform: uppercase;
  letter-spacing: 1px;
}

[type="submit"]:hover {
  background: linear-gradient(135deg, rgba(102, 136, 204, 0.95) 0%, rgba(170, 187, 232, 0.95) 100%);
  box-shadow: 0 12px 35px 0 rgba(102, 136, 204, 0.4);
  transform: translateY(-3px);
}

[type="submit"]:active {
  transform: translateY(-1px);
  box-shadow: 0 6px 20px 0 rgba(102, 136, 204, 0.3);
}

/* Glass effect for notices */
.notice {
  background: rgba(255, 255, 255, 0.08);
  backdrop-filter: blur(10px);
  -webkit-backdrop-filter: blur(10px);
  border-radius: 15px;
  border: 1px solid rgba(255, 255, 255, 0.18);
  box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.15);
  margin-top: 20px;
  padding: 20px;
}

.notice.info {
  border-left: 4px solid rgba(170, 187, 232, 0.7);
}

.notice.error {
  border-left: 4px solid rgba(232, 82, 82, 0.7);
}

</style>

<form action="https://usebasin.com/f/0ee280a1849d" method="POST" id="contact_form">      
  <input name="name" type="text" class="feedback-input" placeholder="Name" required />
  <input name="email" type="email" class="feedback-input" placeholder="Email" required />
  <textarea name="message" class="feedback-input" placeholder="Your message" required></textarea>
  <div class="cf-turnstile" data-sitekey="0x4AAAAAAADYOOVP17mTEuKJ"></div>
  <input type="submit" value="SUBMIT"/>
</form>

<div class="notice info" style="display:none" id="contact_form_success">
  <div class="notice-title">
    <i class="fa fa-exclamation-circle" aria-hidden="true"></i>Success
  </div>
  <div class="notice-content">Thanks for your message! I will read it and respond to it asap.</div>
</div>
{{< /rawhtml >}}

{{< rawhtml >}}
<div class="notice error" style="display:none" id="contact_form_error">
  <div class="notice-title">
    <i class="fa fa-times-circle" aria-hidden="true"></i>Error
  </div>
  <div class="notice-content">Something went wrong.</div>
</div>

<script>
var form = document.getElementById("contact_form");

form.onsubmit = function(event) {
    event.preventDefault();

    var formData = new FormData(form);
    var xhr = new XMLHttpRequest();
    xhr.open("POST", form.action, true);
    xhr.send(formData);
    xhr.onload = function(e) {
        var response = JSON.parse(xhr.response);
        if (xhr.status === 200) {
            form.innerHTML = '<h2>Thanks for your message!</h2>';
        } else {
            document.getElementById("contact_form_error").style.display = '';
        }
    };
};

</script>

{{< /rawhtml >}}

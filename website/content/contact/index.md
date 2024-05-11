---
title: "Contact"
date: 2023-03-21T15:19:27+01:00
draft: false
description: Fill the form to get in touch with Alex Litvinenko
---

{{< rawhtml >}}
<script src="https://challenges.cloudflare.com/turnstile/v0/api.js?onload=onloadTurnstileCallback" async defer></script>
<style>
.feedback-input {
  /*color:white;*/
  font-family: Helvetica, Arial, sans-serif;
  font-weight:500;
  font-size: 18px;
  border-radius: 5px;
  line-height: 22px;
  background-color: transparent;
  border:2px solid #aabbe8;
  transition: all 0.3s;
  padding: 13px;
  margin-bottom: 15px;
  width:100%;
  box-sizing: border-box;
  outline:0;
}

.feedback-input:focus { border:2px solid #aabbe8; }

textarea {
  height: 150px;
  line-height: 150%;
  resize:vertical;
}

[type="submit"] {
  /*font-family: 'Montserrat', Arial, Helvetica, sans-serif;*/
  width: 100%;
  background:#aabbe8;
  border-radius:5px;
  border:0;
  cursor:pointer;
  color:white;
  font-size:24px;
  padding-top:10px;
  padding-bottom:10px;
  transition: all 0.3s;
  margin-top:-4px;
  font-weight:700;
}
[type="submit"]:hover { background:#6688cc; }

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

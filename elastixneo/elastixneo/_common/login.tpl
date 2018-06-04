<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
	<title>Elastix - {$PAGE_NAME}</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<!--<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">-->
	<link rel="stylesheet" href="themes/{$THEMENAME}/login_styles.css">
    {$HEADER_LIBS_JQUERY}
  </head>
  <body>
	<form method="POST">
	  <div id="neo-login-box">
		<div id="neo-login-logo">
		  <img src="themes/{$THEMENAME}/images/elastix_logo_mini.png" width="200" height="62" alt="elastix logo" />
		</div>
		<div class="neo-login-line">
		  <div class="neo-login-label">{$USERNAME}:</div>
		  <div class="neo-login-inputbox"><input type="text" id="input_user" name="input_user" class="neo-login-input" /></div>
		</div>
		<div class="neo-login-line">
		  <div class="neo-login-label">{$PASSWORD}:</div>
		  <div class="neo-login-inputbox"><input type="password" name="input_pass" class="neo-login-input" /></div>
		</div>
		<div class="neo-login-line">
		  <div class="neo-login-label"></div>
		  <div class="neo-login-inputbox"><input type="submit" name="submit_login" value="{$SUBMIT}" class="neo-login-submit" /></div>
		</div>
		<div class="neo-footernote"><a href="http://www.elastix.org" style="text-decoration: none;" target='_blank'>Elastix</a> is licensed under <a href="http://www.opensource.org/licenses/gpl-license.php" style="text-decoration: none;" target='_blank'>GPL</a> by <a href="http://www.palosanto.com" style="text-decoration: none;" target='_blank'>PaloSanto Solutions</a>. 2006 - {$currentyear}.</div>
		<br>
        {literal}
		<script type="text/javascript">
            $(document).ready(function() {
                 $("#neo-login-box").draggable();
            });
			document.getElementById("input_user").focus();
		</script>
        {/literal}
	  </div>
	</form>
  </body>
</html>

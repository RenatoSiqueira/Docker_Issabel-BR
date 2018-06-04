<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF8" />
        <title>Elastix</title>
        <link rel="stylesheet" href="themes/{$THEMENAME}/styles.css" />
        <link rel="stylesheet" href="themes/{$THEMENAME}/help.css" />
		<!--<link rel="stylesheet" media="screen" type="text/css" href="themes/{$THEMENAME}/old.theme.elastixwave.styles.css" />-->
		<link rel="stylesheet" media="screen" type="text/css" href="themes/{$THEMENAME}/header.css" />
		<link rel="stylesheet" media="screen" type="text/css" href="themes/{$THEMENAME}/content.css" />
		<link rel="stylesheet" media="screen" type="text/css" href="themes/{$THEMENAME}/applet.css" />
		<link rel="stylesheet" media="screen" type="text/css" href="libs/js/sticky_note/sticky_note.css" />
		<link rel="stylesheet" media="screen" type="text/css" href="themes/{$THEMENAME}/table.css" />

        <!--[if lte IE 8]><link rel="stylesheet" media="screen" type="text/css" href="themes/{$THEMENAME}/ie.css" /><![endif]-->
	{$HEADER_LIBS_JQUERY}
        <script type='text/javascript' src="libs/js/base.js"></script>
        <script type='text/javascript' src="libs/js/sticky_note/sticky_note.js"></script>
        <script type='text/javascript' src="libs/js/iframe.js"></script>
        <script type='text/javascript' src="themes/{$THEMENAME}/js/javascript.js"></script>
        {$HEADER}
	{$HEADER_MODULES}
    </head>
    <body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" class="mainBody" {$BODYPARAMS}>
        {$MENU} <!-- Viene del tpl menu.tlp-->
		{if !empty($mb_message)}
		<br />
	  	<div class="div_msg_errors" id="message_error">
                    <div style="height:24px">
                        <div class="div_msg_errors_title" style="padding-left:5px">
                            <b style="color:red;">&nbsp;{$mb_title}</b>
                        </div>
                        <div class="div_msg_errors_dismiss">
                            <input type="button" onclick="hide_message_error();" value="{$md_message_title}"/>
                        </div>
                    </div>
		    <div style="padding:2px 10px 2px 10px">
			{$mb_message}
		    </div>
		</div>
		{/if}
				{$CONTENT}
			</div>
		    </div>
			{if $isThirdLevel eq 'on'}
				{if $viewMenuTab eq 'true'}
		    <div id="neo-lengueta-minimized"></div>
				{elseif $viewMenuTab eq 'false'}
			<div id="neo-lengueta-minimized" class="neo-display-none"></div>
				{else}
			<div id="neo-lengueta-minimized" class="neo-display-none"></div>
				{/if}
			{else}
			<div id="neo-lengueta-minimized"></div>
			{/if}
		</div>
		<div align="center" id="neo-footerbox"> <!-- mostrando el footer -->
			<a href="http://www.elastix.org" style="color: #444; text-decoration: none;" target='_blank'>Elastix</a> is licensed under <a href="http://www.opensource.org/licenses/gpl-license.php" target='_blank' style="color: #444; text-decoration: none;" >GPL</a> by <a href="http://www.palosanto.com" target='_blank' style="color: #444; text-decoration: none;">PaloSanto Solutions</a>. 2006 - {$currentyear}.
		</div>
		<div id="neo-sticky-note">
		  <div id="neo-sticky-note-text"></div>
		  <div id="neo-sticky-note-text-edit">
			<textarea id="neo-sticky-note-textarea"></textarea>
			<div id="neo-sticky-note-text-char-count"></div>
			<input type="button" value="{$SAVE_NOTE}" id="neo-submit-button" />
			<div id="auto-popup">AutoPopUp <input type="checkbox" id="neo-sticky-note-auto-popup" value="1"></div>
		  </div>
		  <div id="neo-sticky-note-text-edit-delete"></div>
		</div>
{* SE GENERA EL AUTO POPUP SI ESTA ACTIVADO *} 
{if $AUTO_POPUP eq '1'}{literal}
<script type='text/javascript'>
$(document).ready(function(e) {
    $("#neo-sticky-note-auto-popup").prop('checked', true);
    $('#togglestickynote1').click();
});
</script>
{/literal}{/if}
		<!-- Neo Progress Bar -->
		<div class="neo-modal-elastix-popup-box">
			<div class="neo-modal-elastix-popup-title"></div>
			<div class="neo-modal-elastix-popup-close"></div>
			<div class="neo-modal-elastix-popup-content"></div>
		</div>
		<div class="neo-modal-elastix-popup-blockmask"></div>
    </body>
</html>

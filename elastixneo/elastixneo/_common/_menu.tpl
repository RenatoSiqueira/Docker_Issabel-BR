<input type="hidden" id="lblRegisterCm"   value="{$lblRegisterCm}" />
<input type="hidden" id="lblRegisteredCm" value="{$lblRegisteredCm}" />
<input type="hidden" id="userMenuColor" value="{$MENU_COLOR}" />
<input type="hidden" id="lblSending_request" value="{$SEND_REQUEST}" />
<input type="hidden" id="toolTip_addBookmark" value="{$ADD_BOOKMARK}" />
<input type="hidden" id="toolTip_removeBookmark" value="{$REMOVE_BOOKMARK}" />
<input type="hidden" id="toolTip_addingBookmark" value="{$ADDING_BOOKMARK}" />
<input type="hidden" id="toolTip_removingBookmark" value="{$REMOVING_BOOKMARK}" />
<input type="hidden" id="toolTip_hideTab" value="{$HIDE_IZQTAB}" />
<input type="hidden" id="toolTip_showTab" value="{$SHOW_IZQTAB}" />
<input type="hidden" id="toolTip_hidingTab" value="{$HIDING_IZQTAB}" />
<input type="hidden" id="toolTip_showingTab" value="{$SHOWING_IZQTAB}" />
<input type="hidden" id="amount_char_label" value="{$AMOUNT_CHARACTERS}" />
<input type="hidden" id="save_note_label" value="{$MSG_SAVE_NOTE}" />
<input type="hidden" id="get_note_label" value="{$MSG_GET_NOTE}" />
<input type="hidden" id="elastix_theme_name" value="{$THEMENAME}" />
<input type="hidden" id="lbl_no_description" value="{$LBL_NO_STICKY}" />

<div id="neo-headerbox">
	<div id="neo-logobox"><img src="themes/{$THEMENAME}/images/elastix_logo_mini2.png" width="200" height="59" alt="elastix" longdesc="http://www.elastix.org" /></div>
	<div id="neo-mmenubox"> <!-- mostrando contenido del menu principal -->
	  {foreach from=$arrMainMenu key=idMenu item=menu name=menuMain}
		{if $idMenu eq $idMainMenuSelected && $smarty.foreach.menuMain.iteration lt 8}
		  <div class="neo-tabhon"><a class='menutable2' href="index.php?menu={$idMenu}">{$menu.Name}</a></div>
		{elseif $smarty.foreach.menuMain.first}
		  <div class="neo-tabh-lend2"><a class="menutable" href="index.php?menu={$idMenu}">{$menu.Name}</a></div>
		{elseif $smarty.foreach.menuMain.iteration lt 8 && $smarty.foreach.menuMain.last}
		  <div class="neo-tabh-lend3"><a class="menutable" href="index.php?menu={$idMenu}">{$menu.Name}</a></div>
		{elseif $smarty.foreach.menuMain.iteration lt 8}
		  <div class="neo-tabh"><a class="menutable" href="index.php?menu={$idMenu}">{$menu.Name}</a></div>
		{elseif $smarty.foreach.menuMain.iteration eq 8}
		  <div class="neo-tabh-rend"><img src="themes/{$THEMENAME}/images/arrowdown.png" width="17" height="15" alt="arrowdown" /></div>
		  <div id="neo-second-showbox-menu" class="neo-second-showbox-menu neo-display-none">
			<p><a class="menutable" href="index.php?menu={$idMenu}">{$menu.Name}</a></p>
		{elseif $smarty.foreach.menuMain.iteration ge 8}
			<p><a class="menutable" href="index.php?menu={$idMenu}">{$menu.Name}</a></p>
		{/if}
        {if $smarty.foreach.menuMain.iteration ge 8 && $smarty.foreach.menuMain.last}
           </div>
        {/if}
	  {/foreach}

	</div>
	<div id="neo-smenubox"> <!-- mostrando contenido del menu secundario -->
	  <div id="neo-smenubox-innerdiv">
		{foreach from=$arrSubMenu key=idSubMenu item=subMenu}
		  {if $idSubMenu eq $idSubMenuSelected}
			<div class="neo-tabvon"><a href="?menu={$idSubMenu}" class="submenu_on">{$subMenu.Name}</a></div>
		  {else}
			<div class="neo-tabv"><a href="index.php?menu={$idSubMenu}">{$subMenu.Name}</a></div>
		  {/if}
		{/foreach}
	  </div>
	  <div id="neo-smenubox-arrow-more" class="neo-display-none">
		  <img src="themes/{$THEMENAME}/images/icon_arrowleft_no.png" width="15" height="17" alt="arrowleft" class="neo-smenubox-arrow-more-left" style="cursor: pointer;" />
		  <img src="themes/{$THEMENAME}/images/icon_arrowright.png" width="15" height="17" alt="arrowright" class="neo-smenubox-arrow-more-right" style="cursor: pointer;" />
	  </div>
	</div>
	<div id="neo-topbar">
	  <div id="neo-cmenubox">
		<div id="neo-cmenu-cpallet" class="neo-cmenutableft"><img src="themes/{$THEMENAME}/images/cpallet.png" width="19" height="21" alt="color" /></div>
		<div id="neo-cmenu-search" class="neo-cmenutab"><img src="themes/{$THEMENAME}/images/searchw.png" width="19" height="21" alt="user_search" border="0" /></div>
		<div id="neo-cmenu-info" class="neo-cmenutab"><img src="themes/{$THEMENAME}/images/information.png" width="19" height="21" alt="user_info" border="0" /></div>
		<div id="neo-cmenu-addons" class="neo-cmenutab"><a href="index.php?menu=addons"><img src="themes/{$THEMENAME}/images/toolbar_addons.png" width="19" height="21" alt="elastix_addons" border="0" /></a></div>
		<div id="neo-cmenu-user" class="neo-cmenutab"><img src="themes/{$THEMENAME}/images/user.png" width="19" height="21" alt="user" border="0" /></div>
	  </div>
	</div>
	<div id="neo-cmenu-showbox-search" class="neo-cmenu-showbox neo-display-none">
	  <p>{$MODULES_SEARCH}</p>
	  <p><input type="search"  id="search_module_elastix" name="search_module_elastix"  value="" autofocus="autofocus" placeholder="search" /></p>
	</div>
	<div id="neo-cmenu-showbox-info" class="neo-cmenu-showbox neo-display-none">
	  <p><span><a class="register_link" style="color: {$ColorRegister}; cursor: pointer; font-weight: bold; font-size: 13px;" onclick="showPopupCloudLogin('',540,335)">{$Registered}</a></span></p>
	  <p><span><a id="viewDetailsRPMs">{$VersionDetails}</a></span></p>
	  <p><span><a href="http://www.elastix.org" target="_blank">Elastix Website</a></span></p>
	  <p><span><a href="#" id="dialogaboutelastix">{$ABOUT_ELASTIX2}</a></span></p>
	</div>
	<div id="neo-cmenu-showbox-user" class="neo-cmenu-showbox neo-display-none">
	  <p><span><a href="#" class="setadminpassword">{$CHANGE_PASSWORD}</a></span></p>
	  <p><span><a class="logout" href="?logout=yes">{$LOGOUT} (<font style='color:#FFFFFF;font-style:italic'>{$USER_LOGIN}</font>)</a></span></p>
	</div>
</div>
<div id="neo-contentbox">
	{if !empty($idSubMenu2Selected)}
		{if $viewMenuTab eq 'true'}
	<div id="neo-contentbox-leftcolumn" class="neo-contentbox-leftcolumn-minimized">
		{elseif $viewMenuTab eq 'false'}
	<div id="neo-contentbox-leftcolumn">
		{else}
	<div id="neo-contentbox-leftcolumn">
		{/if}
		<div id="neo-3menubox">  <!-- mostrando contenido del menu tercer nivel -->
			{foreach from=$arrSubMenu2 key=idSubMenu2 item=subMenu2}
			  {if $idSubMenu2 eq $idSubMenu2Selected}
				<div class="neo-3mtabon"><a href="index.php?menu={$idSubMenu2}" style="text-decoration: none;">{$subMenu2.Name}</a></div>
			  {else}
				<div class="neo-3mtab"><a href="index.php?menu={$idSubMenu2}" style="text-decoration: none;">{$subMenu2.Name}</a></div>
			  {/if}
			{/foreach}
		</div>
		<div id="neo-historybox">
			{$SHORTCUT}
		</div>
	</div>
		{if $viewMenuTab eq 'true'}
	<div id="neo-contentbox-maincolumn" style="width: 1245px;">
		{else}
	<div id="neo-contentbox-maincolumn" style="width: 1025px;">
		{/if}
	    <div class="neo-module-title"><div class="neo-module-name-left"></div><span class="neo-module-name">
	      {if $icon ne null}
	      <img src="{$icon}" width="22" height="22" align="absmiddle" />
	      {/if}
	      &nbsp;{$title}</span><div class="neo-module-name-right"></div>
	      <div class="neo-module-title-buttonstab-right"></div><span class="neo-module-title-buttonstab">
	      {if $STATUS_STICKY_NOTE eq 'true'}
		  <img src="themes/{$THEMENAME}/images/tab_notes_on.png" width="23" height="21" alt="tabnotes" id="togglestickynote1" class="togglestickynote" style="cursor: pointer;" />
		  {else}
		  <img src="themes/{$THEMENAME}/images/tab_notes.png" width="23" height="21" alt="tabnotes" id="togglestickynote1" class="togglestickynote" style="cursor: pointer;" />
		  {/if}

	      <img
	      {if $viewMenuTab eq 'true'}
	      src="images/expandOut.png" title="{$SHOW_IZQTAB}"
	      {else}
	      src="images/expand.png"  title="{$HIDE_IZQTAB}"
	      {/if}
	      width="24" height="24" alt="expand" id="toggleleftcolumn" class="neo-picker" border="0" />
		  <img src="themes/{$THEMENAME}/images/{$IMG_BOOKMARKS}" width="24" height="24" alt="bookmark" {if $IMG_BOOKMARKS eq 'bookmark.png'}title="{$ADD_BOOKMARK}"{else}title="{$REMOVE_BOOKMARK}"{/if} id="togglebookmark" style="cursor: pointer;" />
	      <a href="javascript:popUp('help/?id_nodo={$idSubMenu2Selected}&amp;name_nodo={$nameSubMenu2Selected}','1000','460')">
	      <img src="images/icon-help.png" width="24" height="24" alt="help" title="{$HELP}" class="neo-picker" border="0"/></a></span><div class="neo-module-title-buttonstab-left"></div></div>
	      <input type="hidden" id="elastix_framework_module_id" value="{$idSubMenu2Selected}" />
	      <div class="neo-module-content">
	{else}
	<div id="neo-contentbox-leftcolumn" class="neo-contentbox-leftcolumn-minimized">
		<div id="neo-historybox">
			{$SHORTCUT}
		</div>
	</div>
	<div id="neo-contentbox-maincolumn" style="width: 1245px;">
	    <div class="neo-module-title"><div class="neo-module-name-left"></div><span class="neo-module-name">
	      {if $icon ne null}
	      <img src="{$icon}" width="22" height="22" align="absmiddle" />
	      {/if}
	      &nbsp;{$title}</span><div class="neo-module-name-right"></div>
	      <div class="neo-module-title-buttonstab-right"></div><span class="neo-module-title-buttonstab">
	      {if $STATUS_STICKY_NOTE eq 'true'}
		  <img src="themes/{$THEMENAME}/images/tab_notes_on.png" width="23" height="21" alt="tabnotes" id="togglestickynote1" style="cursor: pointer;" class="togglestickynote" />
		  {else}
		  <img src="themes/{$THEMENAME}/images/tab_notes.png" width="23" height="21" alt="tabnotes" id="togglestickynote1" style="cursor: pointer;" class="togglestickynote" />
		  {/if}
		  <img src="images/expandOut.png" width="24" height="24" alt="expand" id="toggleleftcolumn" class="neo-picker" border="0"  title="{$SHOW_IZQTAB}" />
          <img src="themes/{$THEMENAME}/images/{$IMG_BOOKMARKS}" width="24" height="24" alt="bookmark" {if $IMG_BOOKMARKS eq 'bookmark.png'}title="{$ADD_BOOKMARK}"{else}title="{$REMOVE_BOOKMARK}"{/if} id="togglebookmark" style="cursor: pointer;" />
	      <a href="javascript:popUp('help/?id_nodo={$idSubMenuSelected}&amp;name_nodo={$nameSubMenuSelected}','1000','460')">
	      <img src="images/icon-help.png" width="24" height="24" alt="help" border="0"/></a></span><div class="neo-module-title-buttonstab-left"></div></div>
          <input type="hidden" id="elastix_framework_module_id" value="{$idSubMenuSelected}" />
	 <div class="neo-module-content">
	{/if}




/*newwwww*/
$(document).ready(function(){
    $(".menutabletaboff").mouseover(function(){
        var source_img = $('#neo-logobox').find('img:first').attr("src");
        var themeName = source_img.split("/",2);
        $(this).css("background-image","url(themes/"+themeName[1]+"/images/fondo_boton_center2.gif)");
        $(this).css("height","47px");
        $(this).find('a:first').css("bottom","6px");
        $(this).parent().find('div:first').css("background-image","url(themes/"+themeName[1]+"/images/fondo_boton_left2.gif)");
        $(this).parent().find('div:last').css("background-image","url(themes/"+themeName[1]+"/images/fondo_boton_right2.gif)");
        $(this).parent().find('div:first').css("height","38px");
        $(this).parent().find('div:last').css("height","38px");
    });

    $(".menutabletaboff").mouseout(function(){
        var source_img = $('#neo-logobox').find('img:first').attr("src");
        var themeName = source_img.split("/",2);
        $(this).css("background-image","url(themes/"+themeName[1]+"/images/fondo_boton_center.gif)");
        $(this).css("height","37px");
        $(this).find('a:first').css("bottom","0px");
        $(this).parent().find('div:first').css("background-image","url(themes/"+themeName[1]+"/images/fondo_boton_left.gif)");
        $(this).parent().find('div:last').css("background-image","url(themes/"+themeName[1]+"/images/fondo_boton_right.gif)");
        $(this).parent().find('div:first').css("height","35px");
        $(this).parent().find('div:last').css("height","35px");
    });

    $("#toggleleftcolumn").click(saveToggleTab);
    $("#toggleleftcolumn, #neo-lengueta-minimized").click(function(){
	    if(!$('#neo-lengueta-minimized').hasClass('neo-display-none')){
		  $("#neo-contentbox-leftcolumn").removeClass("neo-contentbox-leftcolumn-minimized");
		  $("#neo-contentbox-maincolumn").css("width", "1025px");
	      $("#neo-contentbox-leftcolumn").data("neo-contentbox-leftcolum-status", "visible");
		  $("#neo-lengueta-minimized").addClass("neo-display-none");
		  if($('#toggleleftcolumn')){
			  var labeli = $('#toolTip_hideTab').val();
			  $('#toggleleftcolumn').attr('title',labeli);
			  $('#toggleleftcolumn').attr('src',"images/expand.png");
		  }
	    }else{
		  $("#neo-contentbox-leftcolumn").addClass("neo-contentbox-leftcolumn-minimized");
		  $("#neo-contentbox-maincolumn").css("width", "1245px");
		  $("#neo-contentbox-leftcolumn").data("neo-contentbox-leftcolum-status", "hidden");
		  $("#neo-lengueta-minimized").removeClass("neo-display-none");
		  if($('#toggleleftcolumn')){
			  var labeli = $('#toolTip_showTab').val();
			  $('#toggleleftcolumn').attr('title',labeli);
			  $('#toggleleftcolumn').attr('src',"images/expandOut.png");
		  }
		}
	});
	$("#togglebookmark").click(function() {
		addBookmark();		
		
		var source_img = $('#neo-logobox').find('img:first').attr("src");
		var themeName = source_img.split("/",2);
		var imgBookmark = $("#togglebookmark").attr('src');
		if(/bookmarkon.png/.test(imgBookmark)) {
			$("#togglebookmark").attr('src',"themes/"+themeName[1]+"/images/bookmark.png");
		} else {
			$("#togglebookmark").attr('src',"themes/"+themeName[1]+"/images/bookmarkon.png");
		}
	});
	$("#neo-cmenu-cpallet").hover(
	  function () {
		$(this).addClass("neo-cmenutableft-hvr");
		$( "#search_module_elastix" ).autocomplete( "close" );
		$( "#search_module_elastix" ).val("");
	  },
	  function () {
		$(this).removeClass("neo-cmenutableft-hvr");
	  }
	);
	$("#neo-cmenu-search").hover(
	  function () {
		$(this).addClass("neo-cmenutab-hvr");
		$("#neo-cmenu-showbox-search").removeClass("neo-display-none");
		$( "#search_module_elastix" ).autocomplete( "close" );
		$( "#search_module_elastix" ).val("");
	  },
	  function () {
		$(this).removeClass("neo-cmenutab-hvr");
		$("#neo-cmenu-showbox-search").addClass("neo-display-none");
	  }
	);
	$("#neo-cmenu-info").hover(
	  function () {
		$(this).addClass("neo-cmenutab-hvr");
		$("#neo-cmenu-showbox-info").removeClass("neo-display-none");
		$( "#search_module_elastix" ).autocomplete( "close" );
		$( "#search_module_elastix" ).val("");
	  },
	  function () {
		$(this).removeClass("neo-cmenutab-hvr");
		$("#neo-cmenu-showbox-info").addClass("neo-display-none");
	  }
	);
	$("#neo-cmenu-user").hover(
	  function () {
		$(this).addClass("neo-cmenutab-hvr");
		$("#neo-cmenu-showbox-user").removeClass("neo-display-none");
		$( "#search_module_elastix" ).autocomplete( "close" );
		$( "#search_module_elastix" ).val("");
	  },
	  function () {
		$(this).removeClass("neo-cmenutab-hvr");
		$("#neo-cmenu-showbox-user").addClass("neo-display-none");
	  }
	);
    
	$("#neo-cmenu-showbox-search").hover(
	  function() {
		$("#neo-cmenu-showbox-search").removeClass("neo-display-none");
	  },
	  function() {
		$("#neo-cmenu-showbox-search").addClass("neo-display-none");
	  }
	);

	$("#neo-cmenu-showbox-info").hover(
	  function() {
		$("#neo-cmenu-showbox-info").removeClass("neo-display-none");
	  },
	  function() {
		$("#neo-cmenu-showbox-info").addClass("neo-display-none");
	  }
	);
	$("#neo-cmenu-showbox-user").hover(
	  function() {
		$("#neo-cmenu-showbox-user").removeClass("neo-display-none");
	  },
	  function() {
		$("#neo-cmenu-showbox-user").addClass("neo-display-none");
	  }
	);

	$('.neo-tabh-rend').click(function(e) {
		if ($("#neo-second-showbox-menu").hasClass("neo-display-none")) {
			$("#neo-second-showbox-menu").removeClass("neo-display-none");
	        $('body').one('click', function(e) {
	            $("#neo-second-showbox-menu").addClass("neo-display-none");
	        });
            e.stopPropagation();
        }
	});

        $('#neo-cmenu-cpallet').click(function(e){
		if($("#colorpicker_framework").css("display")=="none")
			$("#colorpicker_framework").fadeIn(500);
		else
			$("#colorpicker_framework").fadeOut(500);
		oneClickEvent();
	});

	$('#search_module_elastix').bind('click', function(e) {
		//$( "#search_module_elastix" ).autocomplete( "close" );
		$( "#search_module_elastix" ).val("");
	});

	$("#export_button").hover(
	  function () {
	      $(this).addClass("exportBorder");
	  },
	  function () {
	      $(this).removeClass("exportBorder");
	      $(this).attr("aria-expanded","false");
	      $(this).removeClass("exportBackground");
	      $(".letranodec").css("color","#444444");
	      $("#subMenuExport").addClass("neo-display-none");
	  }
	);
	$("#export_button").click(
	  function () {
	      if($(this).attr("aria-expanded") == "false"){
		  var exportPosition = $('#export_button').position();
		  var top = exportPosition.top + 41;
		  var left = exportPosition.left - 3;
		  $("#subMenuExport").css('top',top+"px");
		  $("#subMenuExport").css('left',left+"px");
		  $(this).attr("aria-expanded","true");
		  $(this).addClass("exportBackground");
		  $(".letranodec").css("color","#FFFFFF");
		  $("#subMenuExport").removeClass("neo-display-none");
	      }
	      else{
		  $(".letranodec").css("color","#444444");
		  $("#subMenuExport").addClass("neo-display-none");
		  $(this).removeClass("exportBackground");
		  $(this).attr("aria-expanded","false");
	      }
	  }
	);
	$(".menuItem").hover(
	  function () {
		if($(this).attr("aria-disabled") == "false")
		    $(this).css("background","#F4FA58");
	  },
	  function () {
		$(this).css("background","");
	  }
	);
	$("#subMenuExport").hover(
	  function () {
		$(this).removeClass("neo-display-none");
		$(".letranodec").css("color","#FFFFFF");
		$("#export_button").attr("aria-expanded","true");
		$("#export_button").addClass("exportBackground");
	  },
	  function () {
		$(this).addClass("neo-display-none");
		$(".letranodec").css("color","#444444");
		$("#export_button").removeClass("exportBackground");
		$("#export_button").attr("aria-expanded","false");
	  }
	);
	$('#neo-cmenu-cpallet').ColorPicker({
		color: '#0000ff',
		onShow: function (colpkr) {
			return false;
		},
		onHide: function (colpkr) {
			changeColorMenu();// lanzar el ajax
			return false;
		},
		onChange: function (hsb, hex, rgb) {
			$('#neo-smenubox').css('backgroundColor', '#' + hex);
			$('.neo-tabhon').css('backgroundColor', '#' + hex);
			$('#userMenuColor').val('#' + hex);
		},
		onSubmit: function(hsb, hex, rgb, el) {
			$('#neo-smenubox').css('backgroundColor', '#' + hex);
			$('.neo-tabhon').css('backgroundColor', '#' + hex);
			$('#userMenuColor').val('#' + hex);
        	        $(el).ColorPickerHide();
			changeColorMenu();// se lanza la peticion ajax
	        },
		id_colorPicker: 'colorpicker_framework'
	});
	var menu_color_user = $('#userMenuColor').val();
	$('#neo-smenubox').css('backgroundColor', menu_color_user);
	$('.neo-tabhon').css('backgroundColor', menu_color_user);
    $('#neo-cmenu-cpallet').ColorPickerSetColor(menu_color_user);

	  // Scroll automático en caso de que el contenido del menú de segundo nivel se reboce
    // ---------------------------------------------------------------------------------
    var smenuoverflow = false; var offsetright = 0; var lastleft = 0; var accumulated_width = 0; var longpaso = 60;
	var move = "";
	$("#neo-smenubox div.neo-tabv,div.neo-tabvon").each(function(index) {
		accumulated_width += $(this).outerWidth();
		// Si el offset.left del elemento anterior es mayor que el actual quiere decir que el elemento
		// actual hizo una especio de retorno de carro
		if(lastleft>$(this).offset().left) smenuoverflow = true;
		lastleft = $(this).offset().left;
		// Si el offset.left+width del elemento actual es mayor al area de neo-smenubox entonces
		// evidentemente se rebozo
		offsetright = $(this).offset().left+$(this).outerWidth();
		if(offsetright>$("#neo-smenubox").outerWidth()) smenuoverflow = true;
	});
	if(smenuoverflow==true) {
	  $("#neo-smenubox-innerdiv").width(accumulated_width+longpaso+"px");
	  $("#neo-smenubox-arrow-more").removeClass("neo-display-none");
	}
	$('.neo-smenubox-arrow-more-right').mouseup(function() {
	  clearInterval(move);
	}).mousedown(function(e) {
	  clearInterval(move);
	  move = setInterval("moveRight()",90);
	});
	$('.neo-smenubox-arrow-more-left').mouseup(function() {
	  clearInterval(move);
	}).mousedown(function(e) {
	  clearInterval(move);
	  move = setInterval("moveLeft()",90);
	});

	$('.neo-historybox-tab,.neo-historybox-tabmid').hover(function() {
	  $(this).find('div').removeClass('neo-display-none');
	}, function() {
	  $(this).find('div').addClass('neo-display-none');
	});
});

function mostrar_Menu(element)
{
    var subMenu;

    var idMenu = document.getElementById("idMenu");
    if(idMenu.value!="")
    {
        subMenu = document.getElementById(idMenu.value);
        subMenu.setAttribute("class", "vertical_menu_oculto");
    }
    if(element != idMenu.value)
    {
        subMenu = document.getElementById(element);
        subMenu.setAttribute("class", "vertical_menu_visible");
        idMenu.setAttribute("value", element);
    }
    else idMenu.setAttribute("value", "");
}

function removeNeoDisplayOnMouseOut(ref){
	$(ref).find('div').addClass('neo-display-none');
}

function removeNeoDisplayOnMouseOver(ref){
	$(ref).find('div').removeClass('neo-display-none');
}

function moveLeft()
{
	var source_img = $('#neo-logobox').find('img:first').attr("src");
	var themeName = source_img.split("/",2);
	var img = $('#neo-smenubox-arrow-more').children(':first-child').attr('src');
	var longpaso = 60;
	var leftvar = $('#neo-smenubox-innerdiv').css("left");
	leftvarArr = leftvar.split("px");
	if($('#neo-smenubox-innerdiv').offset().left<-longpaso && leftvarArr[0] < 0 ) {
		$('#neo-smenubox-innerdiv').animate({left:'+='+longpaso}, 70, function() {});
		$('#neo-smenubox-arrow-more').children(':first-child').attr('src', 'themes/'+themeName[1]+'/images/icon_arrowleft.png');
		$('#neo-smenubox-arrow-more').children(':last-child').attr('src', 'themes/'+themeName[1]+'/images/icon_arrowright.png');
	} else {
		$('#neo-smenubox-innerdiv').css("left", "0px");
		if(/icon_arrowleft.png/.test(img))
			$('#neo-smenubox-arrow-more').children(':first-child').attr('src', 'themes/'+themeName[1]+'/images/icon_arrowleft_no.png');
	}
}

function moveRight()
{
	var source_img = $('#neo-logobox').find('img:first').attr("src");
	var themeName = source_img.split("/",2);
	var img = $('#neo-smenubox-arrow-more').children(':last-child').attr('src');
	var longpaso = 60;
	if(($('#neo-smenubox-innerdiv').offset().left+$('#neo-smenubox-innerdiv').outerWidth()+longpaso)>($("#neo-smenubox").offset().left+$("#neo-smenubox").outerWidth())) {
		$('#neo-smenubox-innerdiv').animate({left:'-='+longpaso}, 70, function() {});
		$('#neo-smenubox-arrow-more').children(':first-child').attr('src', 'themes/'+themeName[1]+'/images/icon_arrowleft.png');
	} else {
		if(/icon_arrowright.png/.test(img))
			$('#neo-smenubox-arrow-more').children(':last-child').attr('src', 'themes/'+themeName[1]+'/images/icon_arrowright_no.png');
	}
}

function oneClickEvent()
{
    $('body').one('click', function(e) {
	var element = e.target;
	var hide = true;
	if($(element).parents('#colorpicker_framework').length > 0)
	    hide = false
	if(hide)
	    $("#colorpicker_framework").fadeOut(500);
	else
	    oneClickEvent();
	e.stopPropagation();
    });
}


function changeColorMenu()
{
	var color = $('#userMenuColor').val();
	if(color == ""){
		color = "#454545";
	}

	request("index.php", {
		menu:	'_elastixutils',
		action:	'changeColorMenu',
		menuColor:	color
	}, false, function(arrData,statusResponse,error) {
		    if(statusResponse == "false") alert(error);
	});
}

function saveToggleTab()
{
	request("index.php", {
		menu:		'_elastixutils',
		id_menu:	getCurrentElastixModule(),
		action:		'saveNeoToggleTab',
		statusTab:	$('#neo-lengueta-minimized').hasClass('neo-display-none') ? 'true' : 'false',
		rawmode:	'yes'
	}, false, function(arrData,statusResponse,error){
		if(statusResponse == "false") {
			if(!$('#neo-lengueta-minimized').hasClass('neo-display-none')){
				  $("#neo-contentbox-leftcolumn").removeClass("neo-contentbox-leftcolumn-minimized");
				  $("#neo-contentbox-maincolumn").css("width", "1025px");
				  $("#neo-contentbox-leftcolumn").data("neo-contentbox-leftcolum-status", "visible");
				  $("#neo-lengueta-minimized").addClass("neo-display-none");
				  if($('#toggleleftcolumn')){
					  var labeli = $('#toolTip_hideTab').val();
					  $('#toggleleftcolumn').attr('title',labeli);
					  $('#toggleleftcolumn').attr('src',"images/expand.png");

				  }
				}else{
				  $("#neo-contentbox-leftcolumn").addClass("neo-contentbox-leftcolumn-minimized");
				  $("#neo-contentbox-maincolumn").css("width", "1245px");
				  $("#neo-contentbox-leftcolumn").data("neo-contentbox-leftcolum-status", "hidden");
				  $("#neo-lengueta-minimized").removeClass("neo-display-none");
				  if($('#toggleleftcolumn')){
					  var labeli = $('#toolTip_showTab').val();
					  $('#toggleleftcolumn').attr('title',labeli);
					  $('#toggleleftcolumn').attr('src',"images/expandOut.png");
				  }
				}
			alert(error);
		}
	});
}

function addBookmark()
{
	var imgBookmark = $("#togglebookmark").attr('src');
	elastix_blockUI((/bookmarkon.png/.test(imgBookmark))
		? $('#toolTip_removingBookmark').val()
		: $('#toolTip_addingBookmark').val());
	request("index.php", {
		menu:		'_elastixutils',
		id_menu:	getCurrentElastixModule(),
		action:		'addBookmark',
		rawmode:	'yes'
	}, false, function(arrData,statusResponse,error) {
		$.unblockUI();
	    if(statusResponse == "false"){
			var source_img = $('#neo-logobox').find('img:first').attr("src");
			var themeName = source_img.split("/",2);
			var imgBookmark = $("#togglebookmark").attr('src');
			if(/bookmarkon.png/.test(imgBookmark)) {
			  var labeli = $("#toolTip_addBookmark").val();
			  $("#togglebookmark").attr('title', labeli);
			  $("#togglebookmark").attr('src',"themes/"+themeName[1]+"/images/bookmark.png");
			} else {
			  var labeli = $("#toolTip_removeBookmark").val();
			  $("#togglebookmark").attr('title', labeli);
			  $("#togglebookmark").attr('src',"themes/"+themeName[1]+"/images/bookmarkon.png");
			}
			alert(error);
		}else{
			var action = arrData['action'];
			var menu   = arrData['menu'];
			var idmenu = arrData['idmenu'];
			var namemenu = arrData['menu_session'];
			if(action == "add"){
				var labeli = $("#toolTip_removeBookmark").val();
				$("#togglebookmark").attr('title', labeli);
				var link = "<div class='neo-historybox-tab' id='menu"+idmenu+"' onMouseOut='removeNeoDisplayOnMouseOut(this);' onMouseOver='removeNeoDisplayOnMouseOver(this);'><a href='index.php?menu="+namemenu+"' >"+menu+"</a><div class='neo-bookmarks-equis neo-display-none' onclick='deleteBookmarkByEquis(this);'></div></div>";
				if($('div[id^=menu]').length == 0){
					$('#neo-bookmarkID').attr("style","");
					link = "<div class='neo-historybox-tabmid' id='menu"+idmenu+"' onMouseOut='removeNeoDisplayOnMouseOut(this);' onMouseOver='removeNeoDisplayOnMouseOver(this);'><a href='index.php?menu="+namemenu+"' >"+menu+"</a><div class='neo-bookmarks-equis neo-display-none' onclick='deleteBookmarkByEquis(this);'></div></div>";
					//$('#neo-historybox').find("br").remove();
				}
				$('#neo-bookmarkID').after(link);
			}
			if(action == "delete"){
				var labeli = $("#toolTip_addBookmark").val();
				$("#togglebookmark").attr('title', labeli);
				// el anterior debe tener la clase neo-historybox-tabmid
				$('#menu'+idmenu).remove();
				if($('div[id^=menu]').length == 0){
					//$('#neo-bookmarkID').after("<br />");
					$('#neo-bookmarkID').attr("style","display:none;");
				}else{
					$('div[id^=menu]').each(function(indice,valor){
						var tam = $('div[id^=menu]').length;
						if(indice == (tam - 1)){
							$(this).removeClass('neo-historybox-tab');
							$(this).addClass('neo-historybox-tabmid');

						}
					});

				}
			}
		}
	});
}

function deleteBookmarkByEquis(ref)
{
	var linkMenu = $(ref).parent().children(':first-child').attr('href');
	var arrLinkMenu = linkMenu.split("menu=",2);
	var id_menu = arrLinkMenu[1];
	elastix_blockUI($('#toolTip_removingBookmark').val());
	request("index.php", {
		menu:		'_elastixutils',
		id_menu:	id_menu,
		action:		'deleteBookmark',
		rawmode:	'yes'
	}, false, function(arrData,statusResponse,error) {
		$.unblockUI();
		var source_img = $('#neo-logobox').find('img:first').attr("src");
		var menu_actual = arrData['menu_url'];
	    if(statusResponse == "false"){
			var menuchanged = arrData['menu_session'];
			var source_img = $('#neo-logobox').find('img:first').attr("src");
			var themeName = source_img.split("/",2);
			alert(error);
		}else{
			var action = arrData['action'];
			var menu   = arrData['menu'];
			var idmenu = arrData['idmenu'];
			var namemenu = arrData['menu_session'];

			if(action == "delete"){
				var imgBookmark = $("#togglebookmark").attr('src');
				// solo hacer esto si el menu actual es el que se esta eliminando
				if(namemenu == menu_actual){
					var themeName = source_img.split("/",2);
					var labeli = $("#toolTip_addBookmark").val();
					$("#togglebookmark").attr('title', labeli);
					$("#togglebookmark").attr('src',"themes/"+themeName[1]+"/images/bookmark.png");
				}

				var labeli = $("#toolTip_addBookmark").val();
				$("#togglebookmark").attr('title', labeli);
				// el anterior debe tener la clase neo-historybox-tabmid
				$('#menu'+idmenu).remove();
				if($('div[id^=menu]').length == 0){
					//$('#neo-bookmarkID').after("<br />");
					$('#neo-bookmarkID').attr("style","display:none;");
				}else{
					$('div[id^=menu]').each(function(indice,valor){
						var tam = $('div[id^=menu]').length;
						if(indice == (tam - 1)){
							$(this).removeClass('neo-historybox-tab');
							$(this).addClass('neo-historybox-tabmid');
						}
					});

				}
			}
		}
	});
}


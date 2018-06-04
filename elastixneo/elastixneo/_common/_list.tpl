<form id="idformgrid" method="POST" style="margin-bottom:0;" action="{$url}">
    <div class="neo-table-header-row">
        {foreach from=$arrActions key=k item=accion name=actions}
            {if $accion.type eq 'link'}
                <a href="{$accion.task}" class="neo-table-action" {if !empty($accion.onclick)} onclick="{$accion.onclick}" {/if} >
                    <div class="neo-table-header-row-filter">
                        {if !empty($accion.icon)}
                            <img border="0" src="{$accion.icon}" align="absmiddle"  />&nbsp;
                        {/if}
                        {$accion.alt}
                    </div>
                </a>
            {elseif $accion.type eq 'button'}
                <div class="neo-table-header-row-filter">
                    {if !empty($accion.icon)}
                        <img border="0" src="{$accion.icon}" align="absmiddle"  />
                    {/if}
                    <input type="button" name="{$accion.task}" value="{$accion.alt}" {if !empty($accion.onclick)} onclick="{$accion.onclick}" {/if} class="neo-table-action" />
                </div>
            {elseif $accion.type eq 'submit'}
                <div class="neo-table-header-row-filter">
                    {if !empty($accion.icon)}
                        <input type="image" src="{$accion.icon}" align="absmiddle" name="{$accion.task}" value="{$accion.alt}" {if !empty($accion.onclick)} onclick="{$accion.onclick}" {/if} class="neo-table-action" />
                    {/if}
                    <input type="submit" name="{$accion.task}" value="{$accion.alt}" {if !empty($accion.onclick)} onclick="{$accion.onclick}" {/if} class="neo-table-action" />
                </div>
            {elseif $accion.type eq 'text'}
                <div class="neo-table-header-row-filter" style="cursor:default">
                    <input type="text"   id="{$accion.name}" name="{$accion.name}" value="{$accion.value}" {if !empty($accion.onkeypress)} onkeypress="{$accion.onkeypress}" {/if} style="height:22px" />
                    <input type="submit" name="{$accion.task}" value="{$accion.alt}" class="neo-table-action" />
                </div>
            {elseif $accion.type eq 'combo'}
                <div class="neo-table-header-row-filter" style="cursor:default">
                    <select name="{$accion.name}" id="{$accion.name}" {if !empty($accion.onchange)} onchange="{$accion.onchange}" {/if}>
                        {if !empty($accion.selected)}
                            {html_options options=$accion.arrOptions selected=$accion.selected}
                        {else}
                            {html_options options=$accion.arrOptions}
                        {/if}
                    </select>
                    {if !empty($accion.task)}
                        <input type="submit" name="{$accion.task}" value="{$accion.alt}" class="neo-table-action" />
                    {/if}
                </div>
            {elseif $accion.type eq 'html'}
                <div class="neo-table-header-row-filter">
                    {$accion.html}
                </div>
            {/if}
        {/foreach}

        {if !empty($contentFilter)}
            <div class="neo-table-header-row-filter" id="neo-tabla-header-row-filter-1">
                {if $AS_OPTION eq 0} <img src="images/filter.png" align="absmiddle" /> {/if}
                <label id="neo-table-label-filter" style="cursor:pointer">{if $AS_OPTION} {$MORE_OPTIONS} {else} {$FILTER_GRID_SHOW} {/if}</label>
                <img src="images/icon_arrowdown2.png" align="absmiddle" id="neo-tabla-img-arrow" />
            </div>
        {/if}

        {if $enableExport==true}
            <div class="neo-table-header-row-filter" id="export_button" role="button" act="10" tabindex="0" class="exportButton exportShadow" aria-expanded="false" aria-haspopup="true" aria-activedescendant="" >
                <img src="images/download2.png" align="absmiddle" /> {$DOWNLOAD_GRID} <img src="images/icon_arrowdown2.png" align="absmiddle" />
            </div>
            <div id="subMenuExport" class="subMenu neo-display-none" role="menu" aria-haspopup="true" aria-activedescendant="">
                 <div class="items">
                    <a href="{$url}&exportcsv=yes&rawmode=yes">
			<div class="menuItem" role="menuitem" id="CSV" aria-disabled="false">
			    <div>
				<img src="images/csv.gif" border="0" align="absmiddle" title="CSV" />&nbsp;&nbsp;CSV
			    </div>
			</div>
		    </a>
		    <a href="{$url}&exportspreadsheet=yes&rawmode=yes">
			<div class="menuItem" role="menuitem" id="Spread_Sheet" aria-disabled="false">
			    <div>
				<img src="images/spreadsheet.gif" border="0" align="absmiddle" title="SPREAD SHEET" />&nbsp;&nbsp;Spreadsheet
			    </div>
			</div>
		    </a>
		    <a href="{$url}&exportpdf=yes&rawmode=yes">
			<div class="menuItem" role="menuitem" id="PDF" aria-disabled="false">
			    <div>
				<img src="images/pdf.png" border="0" align="absmiddle" title="PDF" />&nbsp;&nbsp;PDF
			    </div>
			</div>
		    </a>
                </div>
            </div>
        {/if}

        <div class="neo-table-header-row-navigation">
            {if $pagingShow}
                {if $start<=1}
                    <img src='images/table-arrow-first.gif' alt='{$lblStart}' align='absmiddle' border='0' width="16" height="16" style="opacity: 0.3;" />
                    <img src='images/table-arrow-previous.gif' alt='{$lblPrevious}' align='absmiddle' border='0' width="16" height="16" style="opacity: 0.3;" />
                {else}
                    <a href="{$url}&nav=start&start={$start}"><img src='images/table-arrow-first.gif' alt='{$lblStart}' align='absmiddle' border='0' width='16' height='16' style="cursor: pointer;" /></a>
                    <a href="{$url}&nav=previous&start={$start}"><img src='images/table-arrow-previous.gif' alt='{$lblPrevious}' align='absmiddle' border='0' width='16' height='16' style="cursor: pointer;" /></a>
                {/if}
                &nbsp;{$lblPage}&nbsp;
                <input type="text"  value="{$currentPage}" size="2" align="absmiddle" name="page" id="pageup" />&nbsp;{$lblof}&nbsp;{$numPage}
                <input type="hidden" value="bypage" name="nav" />
                {if $end==$total}
                    <img src='images/table-arrow-next.gif' alt='{$lblNext}' align='absmiddle' border='0' width="16" height="16" style="opacity: 0.3;" />
                    <img src='images/table-arrow-last.gif' alt='{$lblEnd}' align='absmiddle' border='0' width='16' height='16' style="opacity: 0.3;" />
                {else}
                    <a href="{$url}&nav=next&start={$start}"><img src='images/table-arrow-next.gif' alt='{$lblNext}' align='absmiddle' border='0' width='16' height='16' style="cursor: pointer;" /></a>
                    <a href="{$url}&nav=end&start={$start}"><img src='images/table-arrow-last.gif' alt='{$lblEnd}' align='absmiddle' border='0' width='16' height='16' style="cursor: pointer;" /></a>
                {/if}
            {/if}
        </div>
    </div>

    {if !empty($contentFilter)}
        <div id="neo-table-header-filterrow" class="neo-display-none">
            {$contentFilter}
        </div>
    {/if}

    {if !empty($arrFiltersControl)}
        <div class="neo-table-filter-controls">
            {foreach from=$arrFiltersControl key=k item=filterc name=filtersctrl}
                <div class="neo-filter-control">{$filterc.msg}&nbsp;
				{if $filterc.defaultFilter eq no}
					<a href="{$url}&name_delete_filters={$filterc.filters}"><img src='images/bookmarks_equis.png' width="18" height="16" align='absmiddle' border="0" /></a>
				{/if}
				</div>
            {/foreach}
        </div>
    {/if}

    <div id="neo-table-ref-table">
        <table align="center" cellspacing="0" cellpadding="0" width="100%" id="neo-table1" >
            <tr class="neo-table-title-row">
                {section name=columnNum loop=$numColumns start=0 step=1}
                    {if $smarty.section.columnNum.first}
                        <td class="neo-table-title-row" style="background:none;">{$header[$smarty.section.columnNum.index].name}&nbsp;</td>
                    {else}
                        <td class="neo-table-title-row">{$header[$smarty.section.columnNum.index].name}&nbsp;</td>
                    {/if}
                {/section}
            </tr>
            {if $numData > 0}
                {foreach from=$arrData key=k item=data name=filas}
                {if $data.ctrl eq 'separator_line'}
                    <tr class="neo-table-data-row">
                        {if $data.start > 0}
                            <td class="neo-table-data-row" colspan="{$data.start}"></td>
                        {/if}
                        {assign var="data_start" value="`$data.start`"}
                        <td class="neo-table-data-row" colspan="{$numColumns-$data.start}" style='background-color:#AAAAAA;height:1px;'></td>
                    </tr>
                {else}
                    <tr class="neo-table-data-row">
                        {if $smarty.foreach.filas.last}
                            {section name=columnNum loop=$numColumns start=0 step=1}
                                <td class="neo-table-data-row table_data_last_row">{if $data[$smarty.section.columnNum.index] eq ''}&nbsp;{/if}{$data[$smarty.section.columnNum.index]}</td>
                            {/section}
                        {else}
                            {section name=columnNum loop=$numColumns start=0 step=1}
                                <td class="neo-table-data-row table_data">{if $data[$smarty.section.columnNum.index] eq ''}&nbsp;{/if}{$data[$smarty.section.columnNum.index]}</td>
                            {/section}
                        {/if}
                    </tr>
                {/if}
                {/foreach}
            {else}
                <tr class="neo-table-data-row">
                    <td class="neo-table-data-row table_data" colspan="{$numColumns}" align="center">{$NO_DATA_FOUND}</td>
                </tr>
            {/if}
            {if $numData > 3}
                <tr class="neo-table-title-row">
                    {section name=columnNum loop=$numColumns start=0 step=1}
                        {if $smarty.section.columnNum.first}
                            <td class="neo-table-title-row" style="background:none;">{$header[$smarty.section.columnNum.index].name}&nbsp;</td>
                        {else}
                            <td class="neo-table-title-row">{$header[$smarty.section.columnNum.index].name}&nbsp;</td>
                        {/if}
                    {/section}
                </tr>
            {/if}
        </table>
    </div>

    {if $numData > 3}
        <div class="neo-table-footer-row">
            <div class="neo-table-header-row-navigation">
                {if $pagingShow}
                    {if $start<=1}
                        <img src='images/table-arrow-first.gif' alt='{$lblStart}' align='absmiddle' border='0' width="16" height="16" style="opacity: 0.3;" />
                        <img src='images/table-arrow-previous.gif' alt='{$lblPrevious}' align='absmiddle' border='0' width="16" height="16" style="opacity: 0.3;" />
                    {else}
                        <a href="{$url}&nav=start&start={$start}"><img src='images/table-arrow-first.gif' alt='{$lblStart}' align='absmiddle' border='0' width='16' height='16' style="cursor: pointer" /></a>
                        <a href="{$url}&nav=previous&start={$start}"><img src='images/table-arrow-previous.gif' alt='{$lblPrevious}' align='absmiddle' border='0' width='16' height='16' style="cursor: pointer" /></a>
                    {/if}
                    &nbsp;{$lblPage}&nbsp;
                    <input  type=text  value="{$currentPage}" size="2" align="absmiddle" name="page" id="pagedown" />&nbsp;{$lblof}&nbsp;{$numPage}&nbsp;({$total}&nbsp;{$lblrecords})
                    {if $end==$total}
                        <img src='images/table-arrow-next.gif' alt='{$lblNext}' align='absmiddle' border='0' width="16" height="16" style="opacity: 0.3;" />
                        <img src='images/table-arrow-last.gif' alt='{$lblEnd}' align='absmiddle' border='0' width='16' height='16' style="opacity: 0.3;" />
                    {else}
                        <a href="{$url}&nav=next&start={$start}"><img src='images/table-arrow-next.gif' alt='{$lblNext}' align='absmiddle' border='0' width='16' height='16' style="cursor: pointer" /></a>
                        <a href="{$url}&nav=end&start={$start}"><img src='images/table-arrow-last.gif' alt='{$lblEnd}' align='absmiddle' border='0' width='16' height='16' style="cursor: pointer" /></a>
                    {/if}
                {/if}
            </div>
        </div>
    {/if}
</form>

{literal}
<script type="text/Javascript">
    $(function(){
        $("#neo-table1").colResizable({
            liveDrag:true,
            marginLeft:"1px",
            onDrag: onDrag
        });
    });

    var onDrag = function(){

    }

    $("[id^=page]").keyup(function(event) {
        var id  = $(this).attr("id");
        var val = $(this).val();

        if(id == "pageup")
            $("#pagedown").val(val);
        else if(id == "pagedown")
            $("#pageup").val(val);
    });

    $("#neo-tabla-header-row-filter-1").click(function() {
{/literal}
    {if $AS_OPTION}
        var filter_show = "{$MORE_OPTIONS}";
        var filter_hide = "{$MORE_OPTIONS}";
    {else}
        var filter_show = "{$FILTER_GRID_SHOW}";
        var filter_hide = "{$FILTER_GRID_HIDE}";
    {/if}
{literal}

        if($("#neo-table-header-filterrow").data("neo-table-header-filterrow-status")=="visible") {
            $("#neo-table-header-filterrow").addClass("neo-display-none");
            $("#neo-tabla-img-arrow").attr("src","images/icon_arrowdown2.png");
            $("#neo-table-label-filter").text(filter_show);
            $("#neo-table-header-filterrow").data("neo-table-header-filterrow-status", "hidden");
            $("#neo-tabla-header-row-filter-1").removeClass("exportBackground");
        } else {
            $("#neo-table-header-filterrow").removeClass("neo-display-none");
            $("#neo-tabla-img-arrow").attr("src","images/icon_arrowup2.png");
            $("#neo-table-label-filter").text(filter_hide);
            $("#neo-table-header-filterrow").data("neo-table-header-filterrow-status", "visible");
            $("#neo-tabla-header-row-filter-1").addClass("exportBackground");
        }
    });
</script>
{/literal}

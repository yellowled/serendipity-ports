{serendipity_hookPlugin hook="entries_header"}
<div class="post wide">
<h1 class="title">{$CONST.ARCHIVES}</h1>
{foreach from=$archives item="archive"}
<table class="archives_listing" cellspacing="4" cellpadding="4" border="0">
    <tr class="archives_header">
        <td class="archives_header" colspan="4"><h2>{$archive.year}</h2></td>
    </tr>
    {foreach from=$archive.months item="month"}
    <tr class="archives_row">
        <td class="archives_date">{$month.date|@formatTime:"%B"}</td>
        <td class="archives_count">&bull; {$month.entry_count} {$CONST.ENTRIES}</td>
        <td class="archives_count_link">&bull; {if $month.entry_count}<a href="{$month.link}">{/if}{$CONST.VIEW_FULL}{if $month.entry_count}</a>{/if}</td>
        <td class="archives_link">&bull; {if $month.entry_count}<a href="{$month.link_summary}">{/if}{$CONST.VIEW_TOPICS}{if $month.entry_count}</a>{/if}</td>
    </tr>
    {/foreach}
</table>
{/foreach}

<div class="serendipity_pageFooter" style="text-align: center">
{serendipity_hookPlugin hook="entries_footer"}
</div>

<div class="bgbottom" style="clear: both;"></div>
</div><!-- /.post .wide -->

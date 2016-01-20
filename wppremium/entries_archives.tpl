{serendipity_hookPlugin hook="entries_header"}

<h1 class="btmspace">{$CONST.ARCHIVES}</h1>

{foreach from=$archives item="archive"}
<h2 class="archives_header">{$archive.year}</h2>

<table id="archives_listing" cellspacing="4" cellpadding="4" border="0">
    {foreach from=$archive.months item="month"}
    <tr class="archives_row">
        <td class="archives_date">{$month.date|@formatTime:"%B"}</td>
        <td class="archives_count">{$month.entry_count} {$CONST.ENTRIES}</td>
        <td class="archives_count_link">({if $month.entry_count}<a href="{$month.link}">{/if}{$CONST.VIEW_FULL}{if $month.entry_count}</a>{/if})</td>
        <td class="archives_link">({if $month.entry_count}<a href="{$month.link_summary}">{/if}{$CONST.VIEW_TOPICS}{if $month.entry_count}</a>{/if})</td>
    </tr>
    {/foreach}
</table>
{/foreach}

<div class="page-nav">
{serendipity_hookPlugin hook="entries_footer"}
</div>

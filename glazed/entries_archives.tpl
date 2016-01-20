{serendipity_hookPlugin hook="entries_header"}
<h2 class="title">{$CONST.ARCHIVES}</h2>
{foreach from=$archives item="archive"}
    <h3 class="title">{$archive.year}</h3>
    {foreach from=$archive.months item="month"}
    <dl class="archives_row">
        <dt class="archives_date">{$month.date|@formatTime:"%B"}</dt>
        <dd class="archives_count">{$CONST.ENTRIES}: {$month.entry_count}</dd>
        <dd class="archives_count_link">{if $month.entry_count}<a href="{$month.link}">{/if}{$CONST.VIEW_FULL}{if $month.entry_count}</a>{/if}</dd>
        <dd class="archives_link">{if $month.entry_count}<a href="{$month.link_summary}">{/if}{$CONST.VIEW_TOPICS}{if $month.entry_count}</a>{/if}</dd>
    </dl>
    {/foreach}
{/foreach}
<div class="serendipity_pageFooter" style="text-align: center">
{serendipity_hookPlugin hook="entries_footer"}
</div>

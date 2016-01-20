{serendipity_hookPlugin hook="entries_header"}

<h3 class="cathead">{$CONST.ARCHIVES}</h3>

{foreach from=$archives item="archive"}
<h2>{$archive.year}</h2>

<ul class="plainList clearfix grid_7">
  {foreach from=$archive.months item="month"}
   <li><span class="grid_2 alpha ofhidden">{$month.date|@formatTime:"%B"}: {$month.entry_count} {$CONST.ENTRIES}</span><span class="grid_2">({if $month.entry_count}<a href="{$month.link}">{/if}{$CONST.VIEW_FULL}{if $month.entry_count}</a>{/if})</span><span class="grid_3 omega">({if $month.entry_count}<a href="{$month.link_summary}">{/if}{$CONST.VIEW_TOPICS}{if $month.entry_count}</a>{/if})</span></li>
  {/foreach}
</ul>
{/foreach}

<div class="serendipity_pageFooter" style="text-align: center">
{serendipity_hookPlugin hook="entries_footer"}
</div>

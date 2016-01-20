{serendipity_hookPlugin hook="entries_header"}

<h3 class="cathead">{$CONST.TOPICS_OF} {$dateRange.0|@formatTime:"%B, %Y"}</h3>

<ul class="plainList clearfix grid_7">
{foreach from=$entries item="entries"}
  {foreach from=$entries.entries item="entry"}
    <li><span class="grid_3 alpha ofhidden"><a href="{$entry.link}">{$entry.title}</a></span><span class="grid_2"><a href="{$entry.link_author}">{$entry.author}</a></span><span class="grid_2 omega">{$entry.timestamp|@formatTime:'%d %B %Y'}</span></li>
  {/foreach}
{/foreach}
</ul>

<div class="serendipity_entryFooter" style="text-align: center">
{serendipity_hookPlugin hook="entries_footer"}
</div>

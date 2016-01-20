{serendipity_hookPlugin hook="entries_header"}
<h2>{$CONST.TOPICS_OF} {$dateRange.0|@formatTime:"%B %Y"}</h2>
<ul class="entries_summary">
{foreach from=$entries item="entries"}
  {foreach from=$entries.entries item="entry"}
   <li><a id="{$entry.id}" href="{$entry.link}" rel="bookmark" title="Permanent Link: {$entry.title}"><h3>{$entry.title}</h3></a>
       <div class="metadata">{$entry.timestamp|@formatTime:DATE_FORMAT_ENTRY}{if $entry.categories} | {foreach from=$entry.categories item="entry_category" name="categories"}<a href="{$entry_category.category_link}">{$entry_category.category_name|@escape}</a>{if not $smarty.foreach.categories.last}, {/if}{/foreach}{/if}</div></li>
  {/foreach}
{/foreach}
</ul>
<div class="serendipity_pageFooter" style="text-align: center">
{serendipity_hookPlugin hook="entries_footer"}
</div>

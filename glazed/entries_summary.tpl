{serendipity_hookPlugin hook="entries_header"}
<h2 class="title">{$CONST.TOPICS_OF} {$dateRange.0|@formatTime:"%B, %Y"}</h2>

<div class="post">
{foreach from=$entries item="entries"}
    {foreach from=$entries.entries item="entry"}
    <dl class="entry">
       <dt><a href="{$entry.link}">{$entry.title}</a></dt>
       <dd class="byline"><small>{$CONST.POSTED_BY} <span class="posted_by_author">{$entry.author}</span> {$CONST.ON} <span class="posted_by_date">{$entry.timestamp|@formatTime:DATE_FORMAT_ENTRY}</span></small></dd>
    </dl>
    {/foreach}
{/foreach}
</div>

<div class="serendipity_pageFooter" style="text-align: center">
{serendipity_hookPlugin hook="entries_footer"}
</div>

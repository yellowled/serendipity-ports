{serendipity_hookPlugin hook="entries_header"}
<div class="post">
<h1 class="title">{$CONST.TOPICS_OF} {$dateRange.0|@formatTime:"%B, %Y"}</h1>

<ul>
{foreach from=$entries item="entries"}
{foreach from=$entries.entries item="entry"}
   <li><a href="{$entry.link}">{$entry.title}</a>
       <div class="summary_posted_by">{$CONST.POSTED_BY} <span class="posted_by_author">{$entry.author}</span> {$CONST.ON} <span class="posted_by_date">{$entry.timestamp|@formatTime:DATE_FORMAT_ENTRY}</span></div></li>
{/foreach}
{/foreach}
</ul>
</div><!-- /.post -->

<div class='serendipity_entryFooter' style="text-align: center">
{serendipity_hookPlugin hook="entries_footer"}
</div>

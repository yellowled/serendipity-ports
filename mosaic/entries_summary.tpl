{serendipity_hookPlugin hook="entries_header"}
<div class="post wide">
    <h1 class="title">{$CONST.TOPICS_OF} {$dateRange.0|@formatTime:"%B, %Y"}</h1>

    <div class="entry">
        <ul class="posts">
    {foreach from=$entries item="entries"}
        {foreach from=$entries.entries item="entry"}
           <li><h2><a rel="bookmark" href="{$entry.link}" title="Permanent link: {$entry.title}">{$entry.title}</a></h2>
               <p><small>{$CONST.POSTED_BY} <span class="posted_by_author">{$entry.author}</span> {$CONST.ON} <span class="posted_by_date">{$entry.timestamp|@formatTime:DATE_FORMAT_ENTRY}</span></small></p></li>
        {/foreach}
    {/foreach}
        </ul>
    </div>

<div class='serendipity_entryFooter' style="text-align: center">
{serendipity_hookPlugin hook="entries_footer"}
</div>

<div class="bgbottom" style="clear: both;"></div>
</div><!-- /.post .wide -->

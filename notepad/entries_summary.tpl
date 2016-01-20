{serendipity_hookPlugin hook="entries_header"}
<h3>{$CONST.TOPICS_OF} {$dateRange.0|@formatTime:"%B %Y"}</h3>

<div class="post">
{foreach from=$entries item="entries"}
    {foreach from=$entries.entries item="entry"}
    <div class="title">
        <div class="post-tape png"></div>
        <div class="tit">
            <h1><a href="{$entry.link}" rel="bookmark">{$entry.title}</a></h1>
            <span class="author">{$CONST.POSTED_BY} <a href="{$entry.link_author}">{$entry.author}</a></span>
            {if $entry.categories}
                <span class="categories">{$CONST.IN} {foreach from=$entry.categories item="entry_category" name="categories"}<a href="{$entry_category.category_link}">{$entry_category.category_name|@escape}</a>{if not $smarty.foreach.categories.last}, {/if}{/foreach}
                </span>
            {/if}
            <div class="date">
                {$entry.timestamp|@formatTime:'%e'}
                <div class="month">{$entry.timestamp|@formatTime:'%b'}</div>
            </div>
        </div>
   </div>
   {/foreach}
{/foreach}
</div>

<div class="serendipity_pageFooter" style="text-align: center">
{serendipity_hookPlugin hook="entries_footer"}
</div>

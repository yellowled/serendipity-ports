{serendipity_hookPlugin hook="entries_header"}

<div class="postWrapper">
    <div class="postmetadata">
        <p class="meta-date"><span class="date-day">{$dateRange.0|@formatTime:"%B"}</span></p>
    </div>

    <div class="post">
        <h1>{$CONST.TOPICS_OF} {$dateRange.0|@formatTime:"%B %Y"}</h1>

        <ul class="plainList">
        {foreach from=$entries item="entries"}
          {foreach from=$entries.entries item="entry"}
           <li><a href="{$entry.link}">{$entry.title}</a> <img src="{$serendipityBaseURL}templates/{$template}/img/ul-post-arrow.jpg" alt="" /> {$entry.author} <img src="{$serendipityBaseURL}templates/{$template}/img/ul-post-arrow.jpg" alt="" /> {$entry.timestamp|@formatTime:'%e %b %Y'}</li>
          {/foreach}
        {/foreach}
        </ul>
    </div>
</div>

<div class="serendipity_pageFooter" style="text-align: center">
{serendipity_hookPlugin hook="entries_footer"}
</div>

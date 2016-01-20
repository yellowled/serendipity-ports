{serendipity_hookPlugin hook="entries_header"}

{foreach from=$archives item="archive"}
<div class="postWrapper">
    <div class="postmetadata">
        <p class="meta-date"><span class="date-day">{$archive.year}</span></p>
    </div>
    <div class="post">
        <h1>{$CONST.ENTRIES} {$CONST.IN} {$archive.year}</h1>
        <ul class="plainList">
        {foreach from=$archive.months item="month"}
           <li>{$month.date|@formatTime:"%B"}: {$month.entry_count} {$CONST.ENTRIES}
           {if $month.entry_count != "0"}
               <br />
               <img src="{$serendipityBaseURL}templates/{$template}/img/ul-post-arrow.jpg" alt="" /> {if $month.entry_count}<a href="{$month.link}">{/if}{$CONST.VIEW_FULL}{if $month.entry_count}</a>{/if} <img src="{$serendipityBaseURL}templates/{$template}/img/ul-post-arrow.jpg" alt="" /> {if $month.entry_count}<a href="{$month.link_summary}">{/if}{$CONST.VIEW_TOPICS}{if $month.entry_count}</a>{/if}
           {/if}
           </li>
        {/foreach}
        </ul>
    </div>
</div>
{/foreach}

<div class="serendipity_pageFooter" style="text-align: center">
{serendipity_hookPlugin hook="entries_footer"}
</div>

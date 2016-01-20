<div class="post">
   <h1>{$CONST.STATICPAGE_SEARCHRESULTS|sprintf:$staticpage_searchresults}</h1>

    {if $staticpage_results}
    <ul class="plainList">
       {foreach from=$staticpage_results item="result"}
       <li><strong><a href="{$result.permalink|@escape}" title="{$result.pagetitle|@escape}">{$result.headline}</a></strong> ({$result.realname})<br />
           {$result.content|@strip_tags|@strip|@truncate:200:" ... "}</li>
       {/foreach}
    </ul>
    {else}
    <p>{$CONST.NO_ENTRIES_TO_PRINT}</p>
    {/if}
</div>

<div class="clear"></div>

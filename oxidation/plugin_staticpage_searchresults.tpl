<div class="staticpage_results post">
    <h1 class="title">{$CONST.STATICPAGE_SEARCHRESULTS|sprintf:$staticpage_searchresults}</h1>

{if $staticpage_results}
    <ul class="staticpage_result">
{foreach from=$staticpage_results item="result"}
       <li><strong><a href="{$result.permalink|@escape}" title="{$result.pagetitle|@escape}">{$result.headline}</a></strong> ({$result.realname})<br />
       {$result.content|@escape:htmlall|@truncate:200:" ... "}</li>
{/foreach}
   </ul>
{/if}
</div>

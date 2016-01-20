<ol class="commentlist">
{foreach from=$trackbacks item=trackback}
   <li id="trackback-{$trackback.id}">
        <a id="c{$trackback.id}"></a>
        <a href="{$trackback.url|@strip_tags}" {'blank'|@xhtml_target}>{$trackback.title}</a><br />
        {$trackback.body|@strip_tags|@escape:all}<br />
        <b>Weblog:</b> {$trackback.author|@default:$CONST.ANONYMOUS}<br />
        <b>{$CONST.TRACKED}:</b> {$trackback.timestamp|@formatTime:'%b %d, %H:%M'}
        {if $entry.is_entry_owner}
            <br />(<a href="{$serendipityBaseURL}comment.php?serendipity[delete]={$trackback.id}&amp;serendipity[entry]={$trackback.entry_id}&amp;serendipity[type]=trackbacks">{$CONST.DELETE}</a>)
        {/if}
   </li>
{foreachelse}
    <li>{$CONST.NO_TRACKBACKS}</li>
{/foreach}
</ol>
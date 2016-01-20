<ol class="commentlist">
{foreach from=$trackbacks item=trackback}
    <li id="trackback-{$trackback.id}" class="{cycle values="alt, even"}">
       <a id="c{$trackback.id}"></a>
       <strong>{$trackback.author|@default:$CONST.ANONYMOUS}: <a href="{$trackback.url|@strip_tags}" {'blank'|@xhtml_target}>{$trackback.title}</a></strong> | <small class="commentmetadata">{$trackback.timestamp|@formatTime:'%d. %B %Y, %H:%M'}{if $entry.is_entry_owner} | <a href="{$serendipityBaseURL}comment.php?serendipity[delete]={$trackback.id}&amp;serendipity[entry]={$trackback.entry_id}&amp;serendipity[type]=trackbacks">{$CONST.DELETE}</a>{/if}</small>
       <br />
       {$trackback.body|@strip_tags|@escape:all}
    </li>
{foreachelse}
    <li>{$CONST.NO_TRACKBACKS}</li>
{/foreach}
</ol>
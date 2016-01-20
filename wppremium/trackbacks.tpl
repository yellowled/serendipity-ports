<div id="trackbacklist">
{foreach from=$trackbacks item=trackback}
    <a id="c{$trackback.id}"></a>

    <div class="comment-metadata">
        <span class="comment-author"><a href="{$trackback.url|@strip_tags}" {'blank'|@xhtml_target}>{$trackback.title}</a> | <strong>{$trackback.author|@default:$CONST.ANONYMOUS}</strong></span> | 
        <span class="comment-timestamp">{$trackback.timestamp|@formatTime:'%d %b, %H:%M'}</span>
        {if $entry.is_entry_owner} | <a href="{$serendipityBaseURL}comment.php?serendipity[delete]={$trackback.id}&amp;serendipity[entry]={$trackback.entry_id}&amp;serendipity[type]=trackbacks">{$CONST.DELETE}</a> {/if}
    </div>

    <div class="comment-body">{$trackback.body|@strip_tags|@escape:all}</div>
{foreachelse}
    <p class="serendipity_center">{$CONST.NO_TRACKBACKS}</p>
{/foreach}
</div>
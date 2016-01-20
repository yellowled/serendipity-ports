{foreach from=$trackbacks item=trackback}
    <div class="serendipity_comment">
        <a id="c{$trackback.id}"></a>
        <div class="entry">
            <a href="{$trackback.url|@strip_tags}" {'blank'|@xhtml_target}>{$trackback.title}</a><br />
            {$trackback.body|@strip_tags|@escape:all}
        </div>
        <p class="byline">
            <small><b>Weblog:</b> {$trackback.author|@default:$CONST.ANONYMOUS}&nbsp;|&nbsp;<b>{$CONST.TRACKED}:</b> {$trackback.timestamp|@formatTime:'%b %d, %H:%M'}
{if $entry.is_entry_owner}
            &nbsp;|&nbsp;<a href="{$serendipityBaseURL}comment.php?serendipity[delete]={$trackback.id}&amp;serendipity[entry]={$trackback.entry_id}&amp;serendipity[type]=trackbacks">{$CONST.DELETE}</a>
{/if}
        </small>
        </p>
    </div>
{foreachelse}
    <div class="serendipity_center">{$CONST.NO_TRACKBACKS}</div>
{/foreach}

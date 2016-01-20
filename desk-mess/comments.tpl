<div class="commentlist">
{foreach from=$comments item=comment name="comments"}
    <a id="c{$comment.id}"></a>

    <div id="comment-{$comment.id}" class="item {if $entry.author == $comment.author}administrator{/if} {cycle values="alt, alt2"}">
        <div class="comment-meta">
            <div class="comment-author">
                {if $comment.url}<a class="comment_source_url" href="{$comment.url}" title="{$comment.url|@escape}">{/if}{$comment.author|@default:$CONST.ANONYMOUS}{if $comment.url}</a>{/if}
                <br />
                <div class="comment-date">{$comment.timestamp|@formatTime:$CONST.DATE_FORMAT_SHORT}</div>
            </div>
        </div>
        <br />

        {if $comment.body == 'COMMENT_DELETED'}
            <p>{$CONST.COMMENT_IS_DELETED}</p>
        {else}
            {$comment.body}
        {/if}

        {if $entry.allow_comments AND $comment.body != 'COMMENT_DELETED'}
            (<a class="comment_reply" href="#serendipity_CommentForm" id="serendipity_reply_{$comment.id}" onclick="document.getElementById('serendipity_replyTo').value='{$comment.id}'; {$comment_onchange}">{$CONST.REPLY}</a>)
            <div id="serendipity_replyform_{$comment.id}"></div>
        {/if}

        <div class="clear"><br /></div>
    </div>

    <div style="height:1px; overflow:hidden;">&nbsp;</div>
{foreachelse}
    <div class="serendipity_center nocomments">{$CONST.NO_COMMENTS}</div>
{/foreach}
</div>

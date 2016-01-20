{foreach from=$comments item=comment name="comments"}
    <a id="c{$comment.id}"></a>
    <div id="comment-{$comment.id}" class="comment">
        <div class="comment-data">
            <cite class="comment-by"><span class="comment-number"><a href="#c{$comment.id}">#{$comment.trace}</a>.&nbsp;&nbsp;</span>{if $comment.url}<a class="comment_source_url" href="{$comment.url}" title="{$comment.url|@escape}">{/if}{$comment.author|@default:$CONST.ANONYMOUS}{if $comment.url}</a>{/if}{if $entry.allow_comments AND $comment.body != 'COMMENT_DELETED'} <span class="comment-number">(<a class="comment_reply" href="#serendipity_CommentForm" id="serendipity_reply_{$comment.id}" onclick="document.getElementById('serendipity_replyTo').value='{$comment.id}'; {$comment_onchange}">{$CONST.REPLY}</a>)</span> <div id="serendipity_replyform_{$comment.id}"></div>{/if}</cite>
            <div class="comment-time">{if $entry.is_entry_owner}<span class="edit-comm"><a href="{$comment.link_delete}" onclick="return confirm('{$CONST.COMMENT_DELETE_CONFIRM|@sprintf:$comment.id:$comment.author}');">{$CONST.DELETE}</a></span>{/if} {$CONST.ON} {$comment.timestamp|@formatTime:$CONST.DATE_FORMAT_SHORT}</div>
        </div>

        <div class="comment-entry {if $entry.author == $comment.author}admin{else}oddcomment{/if}">
        {if $comment.avatar}
            <div class="avatar-place">{$comment.avatar}</div>
        {/if}
        {if $comment.body == 'COMMENT_DELETED'}
            {$CONST.COMMENT_IS_DELETED}
        {else}
            {$comment.body}
        {/if}
        </div>
    </div>
{foreachelse}
    <div class="comment">{$CONST.NO_COMMENTS}</div>
{/foreach}

<div id="commentlist">
{foreach from=$comments item=comment name="comments"}
    <a id="c{$comment.id}"></a>

    <div class="comment-metadata">
        <span class="comment-author"><strong>{if $comment.url}<a class="comment_source_url" href="{$comment.url}" title="{$comment.url|@escape}">{/if}{$comment.author|@default:$CONST.ANONYMOUS}{if $comment.url}</a>{/if}</strong></span> <span class="comment-timestamp">{$CONST.ON} {$comment.timestamp|@formatTime:$CONST.DATE_FORMAT_SHORT}</span>{if $entry.is_entry_owner} | <a class="comment_source_ownerlink" href="{$comment.link_delete}" onclick="return confirm('{$CONST.COMMENT_DELETE_CONFIRM|@sprintf:$comment.id:$comment.author}');">{$CONST.DELETE}</a>{/if}{if $entry.allow_comments AND $comment.body != 'COMMENT_DELETED'} | <a class="comment_reply" href="#serendipity_CommentForm" id="serendipity_reply_{$comment.id}" onclick="document.getElementById('serendipity_replyTo').value='{$comment.id}'; {$comment_onchange}">{$CONST.REPLY}</a><div id="serendipity_replyform_{$comment.id}"></div>{/if}
    </div>

{if $comment.body == 'COMMENT_DELETED'}
    <p>{$CONST.COMMENT_IS_DELETED}</p>
{else}
    <div class="comment-body">{$comment.body}</div>
{/if}
{foreachelse}
    <p class="serendipity_center nocomments">{$CONST.NO_COMMENTS}</p>
{/foreach}
</div>
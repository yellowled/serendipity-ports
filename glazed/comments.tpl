{foreach from=$comments item=comment name="comments"}
    <a id="c{$comment.id}"></a>
    <div id="serendipity_comment_{$comment.id}" class="serendipity_comment {cycle values="comment_oddbox, comment_evenbox"}" style="padding-left: {$comment.depth*10}px">
        <div class="entry">
        {if $comment.body == 'COMMENT_DELETED'}
            {$CONST.COMMENT_IS_DELETED}
        {else}
            {$comment.body}
        {/if}
        </div>
        <p class="byline"><small>
            <a class="comment_source_trace" href="#c{$comment.id}">#{$comment.trace}</a>
            <span class="comment_source_author">
            {if $comment.email}
                <a href="mailto:{$comment.email}">{$comment.author|@default:$CONST.ANONYMOUS}</a>
            {else}
                {$comment.author|@default:$CONST.ANONYMOUS}
            {/if}
            </span>
            {if $comment.url}
                (<a class="comment_source_url" href="{$comment.url}" title="{$comment.url|@escape}">{$CONST.HOMEPAGE}</a>)
            {/if}
            {$CONST.ON}
            <span class="comment_source_date">{$comment.timestamp|@formatTime:$CONST.DATE_FORMAT_SHORT}</span>

            {if $entry.is_entry_owner}
                (<a class="comment_source_ownerlink" href="{$comment.link_delete}" onclick="return confirm('{$CONST.COMMENT_DELETE_CONFIRM|@sprintf:$comment.id:$comment.author}');">{$CONST.DELETE}</a>)
            {/if}
            {if $entry.allow_comments AND $comment.body != 'COMMENT_DELETED'}
                (<a class="comment_reply" href="#serendipity_CommentForm" id="serendipity_reply_{$comment.id}" onclick="document.getElementById('serendipity_replyTo').value='{$comment.id}'; {$comment_onchange}">{$CONST.REPLY}</a>)
                <div id="serendipity_replyform_{$comment.id}"></div>
            {/if}
        </small>
        </p>
    </div>
{foreachelse}
    <div class="serendipity_center nocomments">{$CONST.NO_COMMENTS}</div>
{/foreach}

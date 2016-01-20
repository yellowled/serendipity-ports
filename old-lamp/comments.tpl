<ol class="commentlist">
{foreach from=$comments item=comment name="comments"}
    <li id="comment-{$comment.id}" class="{cycle values="alt, even"}" style="padding-left: {$comment.depth*20}px">
       <a id="c{$comment.id}"></a>
       <strong>{if $comment.url}<a class="comment_source_url" href="{$comment.url}" title="{$comment.url|@escape}">{/if}{$comment.author|@default:$CONST.ANONYMOUS}{if $comment.url}</a>{/if}</strong> | <small class="commentmeta">{$comment.timestamp|@formatTime:'%d. %B %Y, %H:%M'}{if $entry.is_entry_owner} | <a class="comment_source_ownerlink" href="{$comment.link_delete}" onclick="return confirm('{$CONST.COMMENT_DELETE_CONFIRM|@sprintf:$comment.id:$comment.author}');">{$CONST.DELETE}</a>{/if}</small>
       <br />
       {if $comment.body == 'COMMENT_DELETED'}
           {$CONST.COMMENT_IS_DELETED}
       {else}
           {$comment.body}
       {/if}
       <br />
       <a class="comment_source_trace" href="#c{$comment.id}">#{$comment.trace}</a>{if $entry.allow_comments AND $comment.body != 'COMMENT_DELETED'} | <a class="comment_reply" href="#serendipity_CommentForm" id="serendipity_reply_{$comment.id}" onclick="document.getElementById('serendipity_replyTo').value='{$comment.id}'; {$comment_onchange}">{$CONST.REPLY}</a> <div id="serendipity_replyform_{$comment.id}"></div>{/if}
    </li>
{foreachelse}
    <li>{$CONST.NO_COMMENTS}</li>
{/foreach}
</ol>
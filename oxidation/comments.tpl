<ol class="commentlist">
{foreach from=$comments item=comment name="comments"}
    <li id="comment-{$comment.id}" class="{cycle values="odd, alt"}">
       <a id="c{$comment.id}"></a>

       <cite>{if $comment.email}<a href="mailto:{$comment.email}">{$comment.author|@default:$CONST.ANONYMOUS}</a>{else}{$comment.author|@default:$CONST.ANONYMOUS}{/if}{if $comment.url} (<a class="comment_source_url" href="{$comment.url}" title="{$comment.url|@escape}">{$CONST.HOMEPAGE}</a>){/if}</cite>:
       <br />

       <small class="commentmetadata"><a class="comment_source_trace" href="#c{$comment.id}">{$comment.timestamp|@formatTime:$CONST.DATE_FORMAT_SHORT}</a>{if $entry.is_entry_owner} <a class="comment_source_ownerlink" href="{$comment.link_delete}" onclick="return confirm('{$CONST.COMMENT_DELETE_CONFIRM|@sprintf:$comment.id:$comment.author}');">{$CONST.DELETE}</a>){/if}</small>

       {if $entry.allow_comments AND $comment.body != 'COMMENT_DELETED'}
       (<a class="comment_reply" href="#serendipity_CommentForm" id="serendipity_reply_{$comment.id}" onclick="document.getElementById('serendipity_replyTo').value='{$comment.id}'; {$comment_onchange}">{$CONST.REPLY}</a>)
       <div id="serendipity_replyform_{$comment.id}"></div>
       {/if}

       {if $comment.body == 'COMMENT_DELETED'}
           {$CONST.COMMENT_IS_DELETED}
       {else}
           {$comment.body}
       {/if}
    </li>
{foreachelse}
    <li>{$CONST.NO_COMMENTS}</li>
{/foreach}
</ol>
<ul class="commentlist">
{foreach from=$comments item=comment name="comments"}
   <li id="c{$comment.id}" class="comment {cycle values="odd, even"}">
       <div class="left-sidebar">
       {if $comment.avatar}
           {$comment.avatar}
       {/if}
           <p><b>{if $comment.url}<a href="{$comment.url}" title="{$comment.url|@escape}">{/if}{$comment.author|@default:$CONST.ANONYMOUS}{if $comment.url}</a>{/if}</b><br />
              {$comment.timestamp|@formatTime:'%e %b %Y'}{if $entry.is_entry_owner} [<a href="{$comment.link_delete}" onclick="return confirm('{$CONST.COMMENT_DELETE_CONFIRM|@sprintf:$comment.id:$comment.author}');">{$CONST.DELETE}</a>]{/if}  
           </p>
       </div>

       <div class="comment-content">
       {if $comment.body == 'COMMENT_DELETED'}
           <p>{$CONST.COMMENT_IS_DELETED}</p>
       {else}
           {$comment.body}
       {/if}
           <div class="reply">
                <a class="comment_source_trace" href="#c{$comment.id}">#{$comment.trace}</a>
           {if $entry.allow_comments AND $comment.body != 'COMMENT_DELETED'}
                &nbsp;<a class="comment_reply" href="#serendipity_CommentForm" id="serendipity_reply_{$comment.id}" onclick="document.getElementById('serendipity_replyTo').value='{$comment.id}'; {$comment_onchange}">{$CONST.REPLY}</a>
                <div id="serendipity_replyform_{$comment.id}"></div>
           {/if}
           </div>
       </div>
   </li>
{foreachelse}
   <li class="comment"><div class="left-sidebar"></div>
       <div class="comment-content">{$CONST.NO_COMMENTS}</div></li>
{/foreach}
</ul>

<ol>
{foreach from=$comments item=comment name="comments"}
   <li id="c{$comment.id}" class="ComListLi">
      <div class="ComListLiTop">
          <big>{if $comment.url}<a rel="external nofollow" href="{$comment.url}" title="{$comment.url|@escape}">{/if}{$comment.author|@default:$CONST.ANONYMOUS}{if $comment.url}</a>{/if}</big>
          <small>{$comment.timestamp|@formatTime:$CONST.DATE_FORMAT_SHORT}{if $entry.is_entry_owner}&nbsp;&nbsp;<strong><a href="{$comment.link_delete}" onclick="return confirm('{$CONST.COMMENT_DELETE_CONFIRM|@sprintf:$comment.id:$comment.author}');">{$CONST.DELETE}</a></strong>{/if}</small>
          <span class="ListNr">{$comment.trace}</span>
      </div>
      <span class="ListContent">
      {if $comment.body == 'COMMENT_DELETED'}
          {$CONST.COMMENT_IS_DELETED}
      {else}
          {$comment.body}
      {/if}
      </span>
   </li>
{foreachelse}
    <div class="serendipity_center nocomments">{$CONST.NO_COMMENTS}</div>
{/foreach}
</ol>
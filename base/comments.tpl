<ol class="commentlist">
{foreach from=$comments item=comment name="comments"}
   <li id="c{$comment.id}" class="{cycle values="alt, nonalt"} {if $entry.author == $comment.author}authorcomment{/if}">
      <div class="commentmeta clearfix">
        {if $comment.avatar}
          <div class="gravatar">
          {$comment.avatar}
          </div><!-- /gravatar -->
        {/if}
          <span class="commentauthor">{if $comment.url}<a class="comment_source_url" href="{$comment.url}" title="{$comment.url|@escape}">{/if}{$comment.author|@default:$CONST.ANONYMOUS}{if $comment.url}</a>{/if}</span><br />
          <span class="commentdate">{$comment.timestamp|@formatTime:'%d/%m/%Y'} {$CONST.AT} {$comment.timestamp|@formatTime:'%H:%M'}</span>
          <span class="commentpermalink"><a href="#c{$comment.id}">Permalink</a></span>
          {if $entry.is_entry_owner}&nbsp;<a class="comment_source_ownerlink" href="{$comment.link_delete}" onclick="return confirm('{$CONST.COMMENT_DELETE_CONFIRM|@sprintf:$comment.id:$comment.author}');">{$CONST.DELETE}</a>{/if}
      </div><!-- /commentmeta -->

      <div class="commententry">
      {if $comment.body == 'COMMENT_DELETED'}
          {$CONST.COMMENT_IS_DELETED}
      {else}
          {$comment.body}
      {/if}
      {if $entry.allow_comments AND $comment.body != 'COMMENT_DELETED'}
          <p><a class="comment_reply" href="#serendipity_CommentForm" id="serendipity_reply_{$comment.id}" onclick="document.getElementById('serendipity_replyTo').value='{$comment.id}'; {$comment_onchange}">{$CONST.REPLY}</a></p>
          <div id="serendipity_replyform_{$comment.id}"></div>
      {/if}
      </div><!-- /commententry -->
   </li>
{foreachelse}
    <li>{$CONST.NO_COMMENTS}</li>
{/foreach}
</ol>
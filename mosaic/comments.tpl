<div class="entry">
    <ol class="commentlist">
{foreach from=$comments item=comment name="comments"}
        <a id="c{$comment.id}"></a>
        <li id="comment-{$comment.id}" class="{cycle values="alt, even"}">
            <div class="commentmeta">
                <cite>{if $comment.email}<a href="mailto:{$comment.email}">{$comment.author|@default:$CONST.ANONYMOUS}</a>{else}{$comment.author|@default:$CONST.ANONYMOUS}{/if}</cite>
                <br /><br />
                <small>
                       {$CONST.ON} <span class="comment_source_date">{$comment.timestamp|@formatTime:$CONST.DATE_FORMAT_SHORT}</span><br />
                       {if $comment.url}<a class="comment_source_url" href="{$comment.url}" title="{$comment.url|@escape}">{$CONST.HOMEPAGE}</a><br />{/if}
                       {if $entry.is_entry_owner}<br /><a class="comment_source_ownerlink" href="{$comment.link_delete}" onclick="return confirm('{$CONST.COMMENT_DELETE_CONFIRM|@sprintf:$comment.id:$comment.author}');">{$CONST.DELETE}</a>{/if}
                </small>
            </div>
            <div class="comment">
            {if $comment.body == 'COMMENT_DELETED'}
                <p><em>{$CONST.COMMENT_IS_DELETED}</em></p>
            {else}
                {$comment.body}
            {/if}
            </div>
        </li>
{foreachelse}
    <li class="alt">{$CONST.NO_COMMENTS}</li>
{/foreach}
    </ol>
</div>
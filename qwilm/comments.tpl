{assign var="said" value=$CONST.QW_SAID}
{foreach from=$comments item=comment name="comments"}
    <div id="comment-{$comment.id}" class="comentarios">
        <a id="c{$comment.id}"></a>
        <h3 class="comentariostitulo">{if $comment.url}<a href="{$comment.url}" title="{$comment.url|@escape}">{/if}{$comment.author|@default:$CONST.ANONYMOUS}{if $comment.url}</a>{/if} {$said}:</h3>

        <p class="comentariosmeta">
            {$comment.timestamp|@formatTime:'%x'} 
            @ <a href="#c{$comment.id}">{$comment.timestamp|@formatTime:'%H:%M'}</a>
            {if $entry.is_entry_owner}(<a class="comment_source_ownerlink" href="{$comment.link_delete}" onclick="return confirm('{$CONST.COMMENT_DELETE_CONFIRM|@sprintf:$comment.id:$comment.author}');">{$CONST.DELETE}</a>){/if}
        </p>

        {if $comment.body == 'COMMENT_DELETED'}
            <p>{$CONST.COMMENT_IS_DELETED}</p>
        {else}
            {$comment.body}
        {/if}
    </div><!-- ./comentarios -->
{foreachelse}
    <div class="serendipity_center nocomments">{$CONST.NO_COMMENTS}</div>
{/foreach}

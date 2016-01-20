<div class="entry">
    <ol class="commentlist">
{foreach from=$trackbacks item=trackback}
       <a id="c{$trackback.id}"></a>
       <li id="{$trackback.id}" class="{cycle values="alt, even"}">
           <div class="commentmeta">
               <cite>{$trackback.author|@default:$CONST.ANONYMOUS}</cite>
               <br /><br />
               <small>{$trackback.timestamp|@formatTime:'%b %d, %H:%M'}<br /><br />
                      {if $entry.is_entry_owner}<a href="{$serendipityBaseURL}comment.php?serendipity[delete]={$trackback.id}&amp;serendipity[entry]={$trackback.entry_id}&amp;serendipity[type]=trackbacks">{$CONST.DELETE}</a>{/if}
               </small>
           </div>
           <div class="comment">
               <a href="{$trackback.url|@strip_tags}" {'blank'|@xhtml_target}>{$trackback.title}</a><br />
               {$trackback.body|@strip_tags|@escape:all}
           </div>
       </li>
{foreachelse}
        <li class="alt">{$CONST.NO_TRACKBACKS}</li>
{/foreach}
    </ol>
</div>

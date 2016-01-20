<ol>
{foreach from=$trackbacks item=trackback}
   <li id="c{$trackback.id}" class="trackback">
       <div class="commentmeta">
           <span class="commentauthor"><a title="{$trackback.title}" href="{$trackback.url|@strip_tags}" {'blank'|@xhtml_target}>{$trackback.author|@default:$CONST.ANONYMOUS}</a></span>
           <span class="commentdate">{$trackback.timestamp|@formatTime:'%d/%m/%Y'} {$CONST.AT} {$trackback.timestamp|@formatTime:'%H:%M'}</span>
           {if $entry.is_entry_owner} <a href="{$serendipityBaseURL}comment.php?serendipity[delete]={$trackback.id}&amp;serendipity[entry]={$trackback.entry_id}&amp;serendipity[type]=trackbacks">{$CONST.DELETE}</a>{/if}
       </div><!-- /commentmeta -->
       
       <div class="commententry">{$trackback.body|@strip_tags|@escape:all}</div><!-- /commententry -->
   </li>
{foreachelse}
    <li>{$CONST.NO_TRACKBACKS}</li>
{/foreach}
</ol>
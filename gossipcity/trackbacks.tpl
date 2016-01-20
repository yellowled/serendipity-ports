<ol>
{foreach from=$trackbacks item=trackback}
    <li id="c{$trackback.id}" class="ComListLi">
       <div class="ComListLiTop">
           <big><a href="{$trackback.url|@strip_tags}" rel="external nofollow" {'blank'|@xhtml_target}>{$trackback.author|@default:$CONST.ANONYMOUS}</a></big>
           <small>{$trackback.timestamp|@formatTime:'%b %d, %H:%M'}</small>
       </div>
       <span class="ListContent">
           {$trackback.title}<br />
           {$trackback.body|@strip_tags|@escape:all}
       {if $entry.is_entry_owner}
           <br /><a href="{$serendipityBaseURL}comment.php?serendipity[delete]={$trackback.id}&amp;serendipity[entry]={$trackback.entry_id}&amp;serendipity[type]=trackbacks">{$CONST.DELETE}</a>
       {/if}
       </span>
    </li>
{foreachelse}
    <li>{$CONST.NO_TRACKBACKS}</li>
{/foreach}
</ol>

<ul>
{foreach from=$trackbacks item=trackback}
   <li id="c{$trackback.id}"><b><a class="url" rel="extenal nofollow" href="{$trackback.url|@strip_tags}" {'blank'|@xhtml_target}>{$trackback.title} &raquo; {$trackback.author|@default:$CONST.ANONYMOUS}</a></b> {$trackback.timestamp|@formatTime:'%e %b %Y'}{if $entry.is_entry_owner} (<a href="{$serendipityBaseURL}comment.php?serendipity[delete]={$trackback.id}&amp;serendipity[entry]={$trackback.entry_id}&amp;serendipity[type]=trackbacks">{$CONST.DELETE}</a>){/if}</li>
{foreachelse}
   <li>{$CONST.NO_TRACKBACKS}</li>
{/foreach}
</ul>
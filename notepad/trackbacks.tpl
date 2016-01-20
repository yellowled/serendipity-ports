<ol class="comment">
{foreach from=$trackbacks item=trackback}
   <li class="{cycle values="oddcomment, alt"} ping">
       <a id="c{$trackback.id}"></a>
       <cite>
           <span class="author b"><b>Weblog:</b> {$trackback.author|@default:$CONST.ANONYMOUS}&nbsp;&nbsp;&nbsp;</span>
           <span class="date">{$trackback.timestamp|@formatTime:$CONST.DATE_FORMAT_SHORT}:</span>
       </cite>
       <div class="tb-text">
           <a href="{$trackback.url|@strip_tags}" {'blank'|@xhtml_target}>{$trackback.title}</a><br />
           {$trackback.body|@strip_tags|@escape:all}
       </div>
   </li>
{foreachelse}
   <li class="oddcomment ping">{$CONST.NO_TRACKBACKS}</li>
{/foreach}
</ol>
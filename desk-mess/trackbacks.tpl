<div class="commentlist">
{foreach from=$trackbacks item=trackback}
    <a id="c{$trackback.id}"></a>
    <div id="trackback-{$trackback.id}" class="item {cycle values="alt, alt2"}">
        <div class="comment-meta">
            <div class="comment-author">
                <a href="{$trackback.url|@strip_tags}" {'blank'|@xhtml_target}>{$trackback.title}</a>
                <br />
                <div class="comment-date">{$trackback.timestamp|@formatTime:'%b %d, %H:%M'}</div>
            </div>
        </div>
        <br />
        {$trackback.body|@strip_tags|@escape:all}
        <div class="clear"><br /></div>
    </div>

    <div style="height:1px; overflow:hidden;">&nbsp;</div>
{foreachelse}
    <div class="serendipity_center">{$CONST.NO_TRACKBACKS}</div>
{/foreach}
</div>

{if $is_raw_mode}
<div id="serendipity{$pluginside}SideBar">
{/if}
<ul>
{foreach from=$plugindata item=item}
    <li>{if $item.title != ""}<h2>{$item.title}</h2>{/if}
        <div class="sbcontent {$item.class}">{$item.content}</div></li>
{/foreach}
</ul>
{if $is_raw_mode}
</div>
{/if}

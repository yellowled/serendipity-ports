{if $is_raw_mode}
<div id="serendipity{$pluginside}SideBar">
{/if}
<ul>
{foreach from=$plugindata item=item}
    <li id="{$item.class}">
        {if $item.title != ""}<h2>{$item.title}</h2>{/if}
        <div class="sidebarcontent">{$item.content}</div>
    </li>
{/foreach}
</ul>
{if $is_raw_mode}
</div>
{/if}

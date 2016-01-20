{if $is_raw_mode}
<div id="serendipity{$pluginside}SideBar">
{/if}
{foreach from=$plugindata item=item}
    <div id="{$item.class}" class="boxed">
        <h2>{$item.title}</h2>
        <div class="content">{$item.content}</div>
    </div>
{/foreach}
{if $is_raw_mode}
</div>
{/if}

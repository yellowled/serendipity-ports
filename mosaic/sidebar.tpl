{if $is_raw_mode}
<div id="serendipity{$pluginside}SideBar">
{/if}
<ul>
{foreach from=$plugindata item=item}
    {if $item.class == "serendipity_quicksearch_plugin"}
    {else}
    <li id="{if $item.class == 'serendipity_calendar_plugin'}calendar{else}{$item.class}{/if}" class="widget">
        {if $item.title != ""}<h2 class="widgettitle">{$item.title}</h2>{/if}
        {if $item.class == 'serendipity_calendar_plugin'}
        {$item.content}
        {else}
        <div class="sidebarcontent">{$item.content}</div>
        {/if}
    </li>
    {/if}
{/foreach}
</ul>
{if $is_raw_mode}
</div>
{/if}

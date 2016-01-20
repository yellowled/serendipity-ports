{if $is_raw_mode}
<div id="serendipity{$pluginside}SideBar">
{/if}
<ul>
{foreach from=$plugindata item=item}
   {if $item.class == "serendipity_quicksearch_plugin"}
   {else}
    <li class="serendipitySideBarItem container_{$item.class}">
        {if $item.title != ""}<h2 class="{$item.class}">{$item.title}</h2>{/if}
        <div class="serendipitySideBarContent">{$item.content}</div>
    </li>
    {/if}
{/foreach}
</ul>
{if $is_raw_mode}
</div>
{/if}

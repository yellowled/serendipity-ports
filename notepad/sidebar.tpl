{if $is_raw_mode}
<div id="serendipity{$pluginside}SideBar">
{/if}
{foreach from=$plugindata item=item}
{if $item.class == "serendipity_quicksearch_plugin"}
{else}
    <div class="widget">
        {if $item.title != ""}<h2>{$item.title}</h2>{/if}
        <div class="widget-entry">
            {$item.content}
        </div>
    </div>
{/if}
{/foreach}
{if $is_raw_mode}
</div>
{/if}

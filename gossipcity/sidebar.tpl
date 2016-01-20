{if $is_raw_mode}
<div id="serendipity{$pluginside}SideBar">
{/if}
{foreach from=$plugindata item=item}
{if $item.class == "serendipity_quicksearch_plugin"}
{else}
    <div class="{if $pluginside == 'Right'}Cols {/if}{$item.class}"{if $pluginside == 'Right'} style="margin: 5px;"{/if}>
        {if $item.title != ""}<h3>{$item.title}</h3>{/if}
        <div class="sbcontent">{$item.content}</div>
    </div>
    {if $pluginside == 'Left'}<br />{/if}
{/if}
{/foreach}
{if $is_raw_mode}
</div>
{/if}


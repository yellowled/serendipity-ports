{if $is_raw_mode}
<div id="serendipity{$pluginside}SideBar">
{/if}
{foreach from=$plugindata item=item}
   {if $item.class == "serendipity_quicksearch_plugin"}
   {else}
       {if $item.title != ""}<h3 class="title {$item.class}">{$item.title}</h3>{/if}
       <div class="aside-padding box">{$item.content}</div>
   {/if}
{/foreach}
{if $is_raw_mode}
</div>
{/if}

{if $is_raw_mode}
<div id="serendipity{$pluginside}SideBar">
{/if}
<ul>
{foreach from=$plugindata item=item}
   {if $item.class == "serendipity_quicksearch_plugin"}
   {else}
    <li {if $item.class=="serendipity_calendar_plugin"}id="calendar"{else}id="{$item.class}{/if}">
       {if $item.title != ""}<h2>{$item.title}</h2>{/if}
       {$item.content}
    </li>
   {/if}
{/foreach}
</ul>
{if $is_raw_mode}
</div>
{/if}

{if $is_raw_mode}
<div id="serendipity{$pluginside}SideBar">
{/if}
<ul>
{foreach from=$plugindata item=item}
   {if $item.class == "serendipity_quicksearch_plugin"}
   {else}
   <li id="{if $item.class == 'serendipity_calendar_plugin'}calendar{else}{$item.class}{/if}">
       {if $item.title != ""}<h2>{$item.title}</h2>{/if}
       {if $item.class != 'serendipity_calendar_plugin'}<div class="sidebarcontent">{$item.content}</div>{else}{$item.content}{/if}
   </li>
   {/if}
{/foreach}
</ul>
{if $is_raw_mode}
</div>
{/if}

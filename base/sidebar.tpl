{foreach from=$plugindata item=item}
  {if $item.class == "serendipity_quicksearch_plugin"}
  {else}
    <div class="widget container_{$item.class}">
    {if $item.title != ""}
        <h3>{$item.title}</h3>
    {/if}
        {$item.content}
    </div>
  {/if}
{/foreach}

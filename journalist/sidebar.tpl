{foreach from=$plugindata item=item}
  {if $item.class == "serendipity_quicksearch_plugin"}
  {else}
    <div class="sbitem container_{$item.class}">
    {if $item.title != ""}
        <h3>{$item.title}</h3>
    {/if}
        <div class="sbcontent">{$item.content}</div>
    </div>
  {/if}
{/foreach}

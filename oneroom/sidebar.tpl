{foreach from=$plugindata item=item}
<li class="container_{$item.class}">
  {if $item.title != ""}
   <h2>{$item.title}</h2>
  {/if}
  <div class="serendipitySideBarContent">{$item.content}</div>
</li>
{/foreach}

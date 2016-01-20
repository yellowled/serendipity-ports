<ul class="tablist">
{foreach from=$categories item="plugin_category"}
   <li class="cat-item cat-item-{$plugin_category.categoryid}"><a href="{$plugin_category.categoryURL}" title="{$plugin_category.category_description|escape}">{$plugin_category.category_name|escape}</a></li>
{/foreach}
</ul>

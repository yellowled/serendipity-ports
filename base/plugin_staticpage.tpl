<div id="staticpage_{$staticpage_pagetitle|@makeFilename}" class="post">
    <h2 class="title">{if $staticpage_articleformat}{$staticpage_articleformattitle|@escape}{else}{$staticpage_headline|@escape}{/if}</h2>

{if $staticpage_navigation AND $staticpage_shownavi}
    <ul class="staticpage_navigation">
      <li class="staticpage_navigation_left"><a href="{$staticpage_navigation.prev.link}" title="prev">{$staticpage_navigation.prev.name|@escape}</a></li>
      <li class="staticpage_navigation_center"><a href="{$staticpage_navigation.top.link}" title="top">{$staticpage_navigation.top.name|@escape}</a></li>
      <li class="staticpage_navigation_right"><a href="{$staticpage_navigation.next.link}" title="next">{$staticpage_navigation.next.name|@escape}</a></li>
    </ul>

    <div class="staticpage_navigation_center">
      {foreach name="crumbs" from=$staticpage_navigation.crumbs item="crumb"}
      {if !$smarty.foreach.crumbs.first}&#187;{/if}<a href="{$crumb.link}">{$crumb.name|@escape}</a>
      {/foreach}
    </div>
{/if}

{if $staticpage_pass AND $staticpage_form_pass != $staticpage_pass}
    <h3>{$CONST.STATICPAGE_PASSWORD_NOTICE}</h3>

    <form class="staticpage_password_form" action="{$staticpage_form_url}" method="post">
    <div>
        <input type="password" name="serendipity[pass]" value="" />
        <input type="submit" name="submit" value="{$CONST.GO}" />
    </div>
    </form>
{else}
    <div class="entry">{$staticpage_precontent}</div>

  {if is_array($staticpage_childpages)}
    <ul id="staticpage_childpages">
    {foreach from=$staticpage_childpages item="childpage"}
       <li><a href="{$childpage.permalink|@escape}" title="{$childpage.pagetitle|@escape}">{$childpage.pagetitle|@escape}</a></li>
    {/foreach}
    </ul>
  {/if}

    <div class="entry">{$staticpage_content}</div>
{/if}
</div>

<div id="staticpage_{$staticpage_pagetitle|@makeFilename}" class="post">
{if $staticpage_articleformat}
    <h1>{$staticpage_articleformattitle|@escape}</h1>
{else}
    <h1>{$staticpage_headline|@escape}</h1>
{/if}

{if $staticpage_navigation AND $staticpage_shownavi}
    <table border="0" cellpadding="2" cellspacing="2" width="100%" class="staticpage_navigation">
        <tr>
            <td class="staticpage_navigation_left"   style="width: 20%"><a href="{$staticpage_navigation.prev.link}" title="prev">{$staticpage_navigation.prev.name|@escape}</a></td>
            <td class="staticpage_navigation_center" style="width: 60%; text-align: center"><a href="{$staticpage_navigation.top.link}" title="top">{$staticpage_navigation.top.name|@escape}</a></td>
            <td class="staticpage_navigation_right"  style="width: 20%; text-align: right"><a href="{$staticpage_navigation.next.link}" title="next">{$staticpage_navigation.next.name|@escape}</a></td>
        </tr>
	<tr>
	    <td class="staticpage_navigation_center">
	    {foreach name="crumbs" from=$staticpage_navigation.crumbs item="crumb"}
	        {if !$smarty.foreach.crumbs.first}&raquo;{/if}<a href="{$crumb.link}">{$crumb.name|@escape}</a>
	    {/foreach}
	    </td>
	</tr>
    </table>
{/if}

{if $staticpage_pass AND $staticpage_form_pass != $staticpage_pass}
        <div class="staticpage_password">{$CONST.STATICPAGE_PASSWORD_NOTICE}</div>
        <form class="staticpage_password_form" action="{$staticpage_form_url}" method="post">
            <div>
                <input type="password" name="serendipity[pass]" value="" />
                <input type="submit" name="submit" value="{$CONST.GO}" />
             </div>
        </form>
{else}
        <div class="staticpage_precontent">{$staticpage_precontent}</div>
        {if is_array($staticpage_childpages)}
        <ul id="staticpage_childpages">
            {foreach from=$staticpage_childpages item="childpage"}
            <li><a href="{$childpage.permalink|@escape}" title="{$childpage.pagetitle|@escape}">{$childpage.pagetitle|@escape}</a></li>
            {/foreach}
        </ul>
        {/if}
        <div class="staticpage_content">{$staticpage_content}</div>
{/if}
</div>

{assign var="orby" value=$CONST.OR_BY}
<div class="postWrapper">
    <div class="postmetadata">
        <p class="meta-date">
            <span class="date-day">{$staticpage_lastchange|date_format:"%e"}</span>
            <span class="date-month">{$staticpage_lastchange|date_format:"%b"}</span>
            <span class="date-year">{$staticpage_lastchange|date_format:"%Y"}</span>
        </p>
        <p class="meta-author">{$orby} {$staticpage_author|@escape}</p>
        {if $staticpage_adminlink AND $staticpage_adminlink.page_user}
            <p class="meta-edit"><a class="staticpage_metainfo_editlink" href="{$staticpage_adminlink.link_edit}">{$staticpage_adminlink.link_name|@escape}</a></p>
        {/if}
    </div>

    <div id="staticpage_{$staticpage_pagetitle|@makeFilename}" class="post">
    {if $staticpage_articleformattitle}
        <h1>{$staticpage_articleformattitle|@escape}</h1>
    {else}
        <h1>{$staticpage_headline|@escape}</h1>
    {/if}
        <div class="entry">
        {if $staticpage_pass AND $staticpage_form_pass != $staticpage_pass}
            <h2>{$CONST.STATICPAGE_PASSWORD_NOTICE}</h2>

            <form class="staticpage_password_form" action="{$staticpage_form_url}" method="post">
            <fieldset>
                <input type="password" name="serendipity[pass]" value="" />
                <input type="submit" name="submit" value="{$CONST.GO}" />
            </fieldset>
            </form>
        {else}
            <div class="staticpage_precontent">
            {$staticpage_precontent}
            </div>
          {if is_array($staticpage_childpages)}
            <ul id="staticpage_childpages">
               {foreach from=$staticpage_childpages item="childpage"}
               <li><a href="{$childpage.permalink|@escape}" title="{$childpage.pagetitle|@escape}">{$childpage.pagetitle|@escape}</a></li>
               {/foreach}
            </ul>
          {/if}
            <div class="staticpage_content">
            {$staticpage_content}
            </div>
        {/if}
        </div>
    </div>
    {if $staticpage_navigation AND $staticpage_shownavi}
        <div class="nav nav-padding">
            <div class="alignleft">
                <p><a href="{$staticpage_navigation.prev.link}" title="prev">{$staticpage_navigation.prev.name|@escape}</a></p>
            </div>

            <div class="alignright">
                <p><a href="{$staticpage_navigation.next.link}" title="next">{$staticpage_navigation.next.name|@escape}</a></p>
            </div>
          
            <div class="clear"></div>

            <div class="alignleft">
                <p><a href="{$staticpage_navigation.top.link}" title="top">{$staticpage_navigation.top.name|@escape}</a></p>
            </div>

            <div class="alignright">
                <p>{foreach name="crumbs" from=$staticpage_navigation.crumbs item="crumb"}{if !$smarty.foreach.crumbs.first} &raquo; {/if}<a href="{$crumb.link}">{$crumb.name|@escape}</a>{/foreach}</p>
            </div>

            <div class="clear"></div>
        </div>
    {/if}
</div>

<div class="clear"></div>

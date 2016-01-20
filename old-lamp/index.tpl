{if $is_embedded != true}
{if $is_xhtml}
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
           "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
{else}
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
           "http://www.w3.org/TR/html4/loose.dtd">
{/if}

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{$lang}" lang="{$lang}">
<head>
    <title>{$head_title|@default:$blogTitle} {if $head_subtitle} - {$head_subtitle}{/if}</title>
    <meta http-equiv="Content-Type" content="text/html; charset={$head_charset}" />
    <meta http-equiv="Content-Script-Type" content="text/javascript" />
    <meta http-equiv="Content-Style-Type" content="text/css" />
    <meta name="Powered-By" content="Serendipity v.{$head_version}" />
    <link rel="stylesheet" type="text/css" href="{$head_link_stylesheet}" />
    <link rel="stylesheet" type="text/css" href="{serendipity_getFile file="s9y.css"}" />
    <link rel="alternate"  type="application/rss+xml" title="{$blogTitle} RSS feed" href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/index.rss2" />
    <link rel="alternate"  type="application/x.atom+xml"  title="{$blogTitle} Atom feed"  href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/atom.xml" />
{if $entry_id}
    <link rel="pingback" href="{$serendipityBaseURL}comment.php?type=pingback&amp;entry_id={$entry_id}" />
{/if}

{serendipity_hookPlugin hook="frontend_header"}
</head>

<body>
{else}
{serendipity_hookPlugin hook="frontend_header"}
{/if}

{if $is_raw_mode != true}
<div id="main">
    <div id="logo">
        <h1><a href="{$serendipityBaseURL}">{$blogTitle}</a><span class="blue"></span></h1>
    </div>

    <ul id="menu">
    {foreach from=$navlinks item="navlink" name=navbar}
       <li{if $currpage==$navlink.href} class="current_page_item"{/if}><a href="{$navlink.href}" title="{$navlink.title}">{$navlink.title}</a></li>
    {/foreach}
    </ul>

    <div id="intro_left">
        <p>{$template_option.intro_left}</p>
    </div>

    <div id="intro_right">
        <p class="white">{$blogTitle}</p>
        <h1>{$blogDescription}</h1>
        <p>{$template_option.intro_right}</p>
    </div>

    <ul id="menu_left">
       <li><a href="{$serendipityBaseURL}">{$CONST.HOMEPAGE}</a></li>
       <li><a href="{$template_option.contact}">{$CONST.EMAIL}</a></li>
       <li><a href="{$template_option.archive}">{$CONST.ARCHIVES}</a></li>
    </ul>

    <div id="right">
        <div class="leftcol">	
        {$CONTENT}
        </div>

        <div class="special">
            <p>{$template_option.special}</p>	
        </div>
    </div>

    <div id="sidebar">
    {if $leftSidebarElements > 0}
        {serendipity_printSidebar side="left"}
    {/if}
        <div class="note">
    {assign var="subscribe" value=$CONST.OL_SUBSCRIBE}
            <p>{$blogTitle}<br /><a href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/index.rss2">{$subscribe}</a></p>
        </div>
    {if $rightSidebarElements > 0}
        {serendipity_printSidebar side="right"}
    {/if}
    </div>

    <div id="footer">
        <p><strong>&copy; <a href="{$serendipityBaseURL}">{$blogTitle}</a> &middot; <a href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/index.rss2">RSS Feed</a></strong><br />
           Design by <a href="http://thewordpresspro.net/">WordPress Pro</a> For <a href="http://fairwindsweb.com/">International Reputation Management</a>
           Ported to <a href="http://www.s9y.org">Serendipity</a> by <a href="http://yellowled.de/s9y.html">YellowLed</a></p>
    </div>
</div>
{/if}

{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
</body>
</html>
{/if}

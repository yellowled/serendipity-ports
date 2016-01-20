{if $is_embedded != true}
{if $is_xhtml}
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
           "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
{else}
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
           "http://www.w3.org/TR/html4/loose.dtd">
{/if}

<html{if $is_xhtml} xmlns="http://www.w3.org/1999/xhtml" xml:lang="{$lang}" lang="{$lang}"{/if}>
<head>
    <title>{$head_title|@default:$blogTitle} {if $head_subtitle} - {$head_subtitle}{/if}</title>
    <meta http-equiv="Content-Type" content="text/html; charset={$head_charset}" />
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
<div id="header">
    <div id="logo">
        <h1><a href="{$serendipityBaseURL}" title="{$head_title|@default:$blogTitle}">{$head_title|@default:$blogTitle|truncate:8}</a></h1>
        <h2><a href="{$serendipityBaseURL}" title="{$head_subtitle|@default:$blogDescription}">{$head_subtitle|@default:$blogDescription|truncate:20}</a></h2>
    </div><!-- /#logo -->

    <div id="menu">
        <ul>
{foreach from=$navlinks item="navlink" name=navbar}
           <li{if $currpage==$navlink.href} class="active"{/if}><a href="{$navlink.href}" title="{$navlink.title}">{$navlink.title}</a></li>
{/foreach}
        </ul>
    </div><!-- /#menu -->
</div><!-- /#header -->

<div id="content">
    <div id="posts">
        {$CONTENT}
    </div><!-- /#posts -->

    <div id="sidebar">
{if $leftSidebarElements > 0}
        {serendipity_printSidebar side="left"}
{/if}
{if $rightSidebarElements > 0}
        {serendipity_printSidebar side="right"}
{/if}
    </div><!-- /#sidebar -->
</div><!-- /#content -->

<div id="footer">
    <p id="copy">&copy;{$date|@formatTime:'%Y'} {$blogTitle}<br />Designed by <a href="#">Free CSS Templates</a><br />Ported to <a href="http://www.s9y.org">s9y</a> by <a href="http://yellowled.de/s9y.html">YellowLed</p>
    <p id="feed"><a href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/index.rss2" id="rss">RSS Feed</a></p>
</div>

{/if}

{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
</body>
</html>
{/if}

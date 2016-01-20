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
        <h1><a class="homelink1" href="{$serendipityBaseURL}">{$head_title|@default:$blogTitle}</a></h1>
        <h2><a class="homelink2" href="{$serendipityBaseURL}">{$head_subtitle|@default:$blogDescription}</a></h2>
    </div><!-- /#logo -->

    <div id="search">
        <form id="searchform" method="get" action="{$serendipityBaseURL}">
        <fieldset>
            <input type="hidden" name="serendipity[action]" value="search" />
            <input type="text" value="" name="serendipity[searchTerm]" id="searchquery" size="25" />
            <input type="submit" id="searchsubmit" value="{$CONST.QUICKSEARCH}" name="serendipity[searchButton]" />
        </fieldset>
        </form>
        {serendipity_hookPlugin hook="quicksearch_plugin" hookAll="true"}
    </div><!-- /#search -->
</div><!-- /#header -->

<div id="menu">
    <ul>
{foreach from=$navlinks item="navlink" name=navbar}
       <li><a href="{$navlink.href}">{$navlink.title}</a></li>
{/foreach}
    </ul>
</div><!-- /#menu -->

<hr />

<div id="page">
    <div id="content">
{if $view == "start" }
        <div id="latest-post" class="post">
        {serendipity_fetchPrintEntries full=true fetchDrafts=false noSticky=true limit="0,1" use_hooks=true template="oxlatest.tpl"}
        </div><!-- /#latest-post -->
        <div id="recent-posts" class="posts">
        {serendipity_fetchPrintEntries full=true fetchDrafts=false noSticky=true limit="1,3" template="oxrecent.tpl"}
        </div><!-- /#recent-posts -->
{else}
        {$CONTENT}
{/if}
    </div><!-- /#content -->

    <div id="sidebar">
{if $leftSidebarElements > 0}
    {serendipity_printSidebar side="left"}
{/if}
{if $rightSidebarElements > 0}
    {serendipity_printSidebar side="right"}
{/if}
    </div><!-- /#sidebar -->

    <div style="clear: both;">&nbsp;</div>
</div><!-- /#page -->

<hr />

<div id="footer">
    <p class="legal">&copy;{$date|@formatTime:'%Y'} All Rights Reserved.</p>
    <p class="credit">Design by <a href="http://www.freecsstemplates.org/">Free CSS Templates</a>. Ported to <a href="http://www.s9y.org">s9y</a> by <a href="http://yellowled.de/s9y.html">YellowLed</a>.</p>
</div><!-- /#footer -->
{/if}

{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
</body>
</html>
{/if}

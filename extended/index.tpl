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
        <h1>{$head_title|@default:$blogTitle}</h1>
        <p>{$head_subtitle|@default:$blogDescription}</p>
    </div><!-- /#logo -->

    <div id="search">
        <form action="{$serendipityHTTPPath}{$serendipityIndexFile}" method="get">
        <fieldset>
            <input type="hidden" name="serendipity[action]" value="search" />
            <input alt="{$CONST.QUICKSEARCH}" type="text" id="s" name="serendipity[searchTerm]" value="{$CONST.QUICKSEARCH}..." onfocus="if(this.value=='{$CONST.QUICKSEARCH}...')value=''" onblur="if(this.value=='')value='{$CONST.QUICKSEARCH}...';" />
            <input id="x" type="submit" value="{$CONST.QUICKSEARCH}" alt="{$CONST.QUICKSEARCH}" name="serendipity[searchButton]" title="{$CONST.GO}" />
            <div id="LSResult" style="display: none;"><div id="LSShadow"></div></div>
        </fieldset>
        </form>
        {serendipity_hookPlugin hook="quicksearch_plugin" hookAll="true"}
    </div><!-- /#search -->
</div><!-- /#header -->

<div id="menu">
    <ul>
{foreach from=$navlinks item="navlink" name=navbar}
       <li{if $currpage==$navlink.href} class="current_page_item"{/if}><a href="{$navlink.href}" title="{$navlink.title}">{$navlink.title}</a></li>
{/foreach}
    </ul>
</div><!-- /#menu -->

<div id="page">
    <div id="content">
        <h1 class="pagetitle">{$CONST.RECENT}</h1>
        <a href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/index.rss2" id="rss-posts">{$CONST.SYNDICATION_PLUGIN_20}</a>
        {$CONTENT}
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

<div id="footer">
    <p>Design by <a href="http://www.freecsstemplates.org/">Free CSS Templates</a> &nbsp;&bull;&nbsp; Icons by <a href="http://www.famfamfam.com/">FAMFAMFAM</a>. &nbsp;&bull;&nbsp; Ported to <a href="http://www.s9y.org">s9y</a> by <a href="http://yellowled.de">YellowLed</a>.</p>
</div><!-- /#footer -->
{/if}

{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
</body>
</html>
{/if}

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
        <h1><a href="{$serendipityBaseURL}">{$head_title|@default:$blogTitle}</a></h1>
{if $template_option.mosheaderdesc == 'true'}
        <p><a href="{$serendipityBaseURL}">{$head_subtitle|@default:$blogDescription}</a></p>
{/if}
    </div><!-- /#logo -->

    <div id="menu">
        <ul>
{foreach from=$navlinks item="navlink" name=navbar}
           <li{if $currpage==$navlink.href} class="current_page_item"{/if}><a href="{$navlink.href}" title="{$navlink.title}">{$navlink.title}</a></li>
{/foreach}
        </ul>
    </div><!-- /#menu -->
</div><!-- /#header -->

<hr />

<div id="page">
    <div id="content">
<!-- TODO: display only most recent entry on start page -->
        {$CONTENT}

        <div class="bgbottom" style="clear: both;"></div>

        <div id="contentbar"></div><!-- /#contentbar -->
    </div><!-- /#content -->

    <div id="sidebar">
        <ul>
           <li id="search" class="widget widget_search">
               <form id="searchform" method="get" action="{$serendipityHTTPPath}{$serendipityIndexFile}">
               <div>
                   <input type="hidden" name="serendipity[action]" value="search" />
                   <input type="text" name="serendipity[searchTerm]" id="s" size="15" value="" />
                   <br />
                   <input type="submit" value="{$CONST.QUICKSEARCH}" name="serendipity[searchButton]" />
                   <div id="LSResult" style="display: none;"><div id="LSShadow"></div></div>
               </div>
               </form>
               {serendipity_hookPlugin hook="quicksearch_plugin" hookAll="true"}
           </li>
        </ul>
        {if $leftSidebarElements > 0}{serendipity_printSidebar side="left"}{/if}
        {if $rightSidebarElements > 0}{serendipity_printSidebar side="right"}{/if}
    </div><!-- /#sidebar -->
</div><!-- /#page -->

<hr />

<div id="footer">
    <p>&copy;{$date|@formatTime:'%Y'} All Rights Reserved. &nbsp;&bull;&nbsp; Design by <a href="http://www.freecsstemplates.org/">Free CSS Templates</a></p>
    <p id="ported">Ported to <a href="http://www.s9y.org">s9y</a> by <a href="http://yellowled.de/s9y.html">YellowLed</a> &nbsp;&bull;&nbsp; RSS icon by <a href="http://customize.org/icons/55872">FrankaKo</a></p>
</div><!-- /#footer -->

{/if}

{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
</body>
</html>
{/if}

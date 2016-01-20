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
    <meta name="Powered-By" content="Serendipity v.{$head_version}" />
    <link rel="stylesheet" type="text/css" href="{$head_link_stylesheet}" media="screen" />
    <link rel="stylesheet" href="{serendipity_getFile file="s9y.css"}" type="text/css" media="screen" />
<!--[if IE 6]>
    <link rel="stylesheet" href="{serendipity_getFile file="ie60.css"}" type="text/css" media="screen" />
<![endif]-->
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
<div id="mainwrap">
    <div id="header-container">
        <div id="header">
            <div id="cup"></div>

            <div id="logo">
                <h2>{$blogTitle}</h2>
                <p>{$blogDescription}</p>
            </div><!-- /#logo -->

            <div id="headerright"></div>

            <ul id="menu">
                <li><a href="{$serendipityBaseURL}"{if $currpage==$serendipityBaseURL} class="active"{/if}>Home</a></li>
            {foreach from=$navlinks item="navlink" name=navbar}
                <li><a href="{$navlink.href}"{if $currpage==$navlink.href} class="active"{/if}>{$navlink.title}</a></li>
            {/foreach}
            </ul>
        </div><!-- /#header -->
    </div><!-- /#header-container -->

    <div id="maintop">
        <div id="maintopimg"></div>
    </div><!-- /#maintop -->

    <div id="wrapper">
        <div id="content">
            <div id="main-blog">
            {$CONTENT}
            </div><!-- /#main-blog -->

            <div id="sidebar">
                <div id="sidebar-top"></div>

                <div id="sidebar-content">
                    <div id="subcolumn">
                        <div id="search">
                            <form id="searchform" method="get" action="{$serendipityHTTPPath}{$serendipityIndexFile}">
                            <input type="hidden" name="serendipity[action]" value="search" />
                            <div>
                                <input type="text" name="serendipity[searchTerm]" id="s" value="" size="35" class="form-input" />
                                <input name="serendipity[searchButton]" type="submit" value="Search" class="search-submit" />
                            </div>
                            </form>
                            {serendipity_hookPlugin hook="quicksearch_plugin" hookAll="true"}
                        </div><!-- /#search -->

                        {if $leftSidebarElements > 0}{serendipity_printSidebar side="left"}{/if}
                        {if $rightSidebarElements > 0}{serendipity_printSidebar side="right"}{/if}
                    </div><!-- /#subcolumn -->
                </div><!-- /#sidebar-content -->

                <div id="sidebar-bottom"></div>
            </div><!-- /#sidebar -->

            <div class="clear"></div>
        </div><!-- /#content -->
    </div><!-- /#wrapper -->

    <div id="bottom">
        <p style="padding-top:110px; clear:both;">Copyright &copy; {$date|@formatTime:'%Y'} <strong>{$blogTitle}</strong> All rights reserved. Theme by <a style="text-decoration:none; color: #635537;" href="http://www.geekwithlaptop.com" title="Geek with Laptop">Laptop Geek</a>.<br /> Ported to <a style="text-decoration:none; color: #635537;" href="http://www.s9y.org">Serendipity</a> by <a style="text-decoration:none; color: #635537;" href="http://yellowled.de">YellowLed</a>.</p>
    </div><!-- /#bottom -->
</div><!-- /#mainwrap -->
{/if}

{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
</body>
</html>
{/if}

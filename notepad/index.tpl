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
    <link rel="stylesheet" type="text/css" href="{serendipity_getFile file="s9y.css"}" media="screen" />
    <link rel="stylesheet" type="text/css" href="{serendipity_getFile file="print.css"}" media="print" />
    <link rel="alternate"  type="application/rss+xml" title="{$blogTitle} RSS feed" href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/index.rss2" />
    <link rel="alternate"  type="application/x.atom+xml"  title="{$blogTitle} Atom feed"  href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/atom.xml" />
{if $entry_id}
    <link rel="pingback" href="{$serendipityBaseURL}comment.php?type=pingback&amp;entry_id={$entry_id}" />
{/if}
    <script type="text/javascript" src="{$serendipityHTTPPath}templates/{$template}/javascript/jquery.min.js"></script>
    <script type="text/javascript" src="{$serendipityHTTPPath}templates/{$template}/javascript/global.js"></script>
<!--[if IE 6]>
    <script type="text/javascript">
//<![CDATA[
if (document.all && document.styleSheets && document.styleSheets[0] && document.styleSheets[0].addRule)
{ldelim}
// Feel free to add rules for specific tags only, you just have to call it several times.
 document.styleSheets[0].addRule('.png', 'behavior: url({$serendipityHTTPPath}templates/{$template}/iepngfix.htc)');
{rdelim}
//]]>
</script>
<![endif]-->
<script type="text/javascript">//<![CDATA[
jQuery.noConflict();
jQuery(document).ready(function($){ldelim}

	$("#menu").find("li").each(function(i) {ldelim}
		var count = i + 1;
		if (count < 6 ) {ldelim}
			$(this).addClass( "menu_i" + count );
		{rdelim} else {ldelim}
			count = i - 4;
			$(this).addClass( "menu_i" + count );
		{rdelim};
    {rdelim});
{rdelim});
//]]></script>
    {serendipity_hookPlugin hook="frontend_header"}
</head>

<body>
{else}
{serendipity_hookPlugin hook="frontend_header"}
{/if}

{if $is_raw_mode != true}
<div class="all-bg">
<div class="all-bot">
<div class="all-top">
<div class="site">
<div class="site-wrap">
    <div id="head">
        <div class="logo">
            <h1 id="logo"><a href="{$serendipityBaseURL}">{$blogTitle}</a></h1>
            <div class="description">{$blogDescription}</div>
        </div>

        <div class="searchbox">
            <form id="searchform" action="{$serendipityHTTPPath}{$serendipityIndexFile}" method="get">
                <input type="hidden" name="serendipity[action]" value="search" />
                <div class="label">{$CONST.QUICKSEARCH}</div>
                <div class="search">
                    <input type="text" id="s" name="serendipity[searchTerm]" value="" />
                </div>
                <div>
                    <input type="submit" id="searchsubmit" class="submit png" value=" " name="serendipity[searchButton]" />
                </div>
            </form>
            {serendipity_hookPlugin hook="quicksearch_plugin" hookAll="true"}
        </div>
    </div><!-- /#head -->

    <div class="sheet-shadow png">
    <div class="sheet">
    <div class="sheet-top-grad">
    <div id="menu">
        <del class="container">
        <ul>
           <li class="home{if $currpage==$serendipityBaseURL} class="current_page_item"{/if}"><a href="{$serendipityBaseURL}" title="{$CONST.HOMEPAGE}">Home</a></li>
{foreach from=$navlinks item="navlink" name=navbar}
           <li{if $currpage==$navlink.href} class="current_page_item"{/if}><a href="{$navlink.href}">{$navlink.title}</a></li>
{/foreach}
        </ul>
        </del>
    </div><!-- /#menu -->

    <div id="content">
        <div class="main" id="top">
        {$CONTENT}
        </div><!-- /#top -->
    </div><!-- /#content -->
    </div>
    </div>
    </div>
    <div class="sheet-bottom png"></div>

    <div id="sidebars">
    <div class="sidebar-bottom">
    <div class="sidebar-top">
    <div class="sb-wrap">
        <div id="sidebar-left">
    {if $leftSidebarElements > 0}
        {serendipity_printSidebar side="left"}
    {/if}
        </div>
        <div id="sidebar-right">
    {if $rightSidebarElements > 0}
        {serendipity_printSidebar side="right"}
    {/if}
        </div>
        <div class="clear"></div>
    </div>
    </div>
    </div>
    </div>

</div>
</div>
</div>
</div>
</div>

<div id="footer">
    <div class="copy">
        Copyright &copy; {$date|@formatTime:'%Y'} - {$blogTitle} - is proudly powered by <a href="http://www.s9y.org">Serendipity</a><br />
        <a href="http://www.infocreek.com">Website Design</a> by InfoCreek | NotePad <a href="http://www.infocreek.com/webdesign/freewordpressthemes">Wordpress Themes</a><br />
        Ported to <abbr title="Serendipity">s9y</abbr> by <a href="http://yellowled.de/s9y.html">YellowLed</a>
    </div>

    <div class="valid">
        Valid <a href="http://validator.w3.org/check?uri=referer">XHTML</a> &amp; <a href="http://jigsaw.w3.org/css-validator/validator?uri={$head_link_stylesheet}">CSS</a>
    </div>
</div><!-- /#footer -->
{/if}

{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
</body>
</html>
{/if}

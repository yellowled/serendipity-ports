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
    <title>{$head_title|@default:$blogTitle}{if $head_subtitle} &raquo; {$head_subtitle}{/if}</title>
    <meta http-equiv="Content-Type" content="text/html; charset={$head_charset}" />
    <meta name="Powered-By" content="Serendipity v.{$head_version}" />
    <link rel="stylesheet" type="text/css" href="{serendipity_getFile file="960gs/960.css"}" />
    <link rel="stylesheet" type="text/css" href="{$head_link_stylesheet}" />
    <link rel="stylesheet" type="text/css" href="{serendipity_getFile file="s9y.css"}" />
{if $template_option.feedburner != ''}
    <link rel="alternate"  type="application/rss+xml" title="{$blogTitle} RSS feed" href="{$template_option.feedburner}" />
{else}
    <link rel="alternate"  type="application/rss+xml" title="{$blogTitle} RSS feed" href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/index.rss2" />
{/if}
    <link rel="alternate"  type="application/x.atom+xml"  title="{$blogTitle} Atom feed"  href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/atom.xml" />
{if $entry_id}
    <link rel="pingback" href="{$serendipityBaseURL}comment.php?type=pingback&amp;entry_id={$entry_id}" />
<!--[if lte IE 6]>
    <script defer type="text/javascript" src="{$serendipityHTTPPath}templates/{$template}/js/pngfix.js"></script>
<![endif]-->
{/if}

{serendipity_hookPlugin hook="frontend_header"}
</head>

<body>
{else}
{serendipity_hookPlugin hook="frontend_header"}
{/if}

{if $is_raw_mode != true}
<div class="container_12">
    <div id="header" class="fullcolumn">
        <h1{if $template_option.base_logo_use == 'true'} class="hide"{/if}><a href="{$serendipityBaseURL}" title="{$blogTitle}">{$blogTitle}</a></h1>
        <p{if $template_option.base_logo_use == 'true'} class="hide"{/if}>{$blogDescription}</p>
        {if $template_option.base_logo_use == 'true'}
        <a href="{$serendipityBaseURL}" title="{$blogTitle}"><img style="margin-top: {$template_option.base_logo_topspace}px; margin-left: {$template_option.base_logo_leftspace}px;" src="{$template_option.base_logo_img}" alt="{$blogTitle} Logo" /></a>
        {/if}
    </div><!-- /header -->

    <div id="nav" class="fullcolumn">
        <ul>
        {foreach from=$navlinks item="navlink" name=navbar}
           <li{if $currpage==$navlink.href} class="current_page_item"{/if}><a href="{$navlink.href}" title="{$navlink.title}">{$navlink.title}</a></li>
        {/foreach}
        </ul>
    </div><!-- /nav -->

    <div id="main" class="clearfix">
        <div id="content" class="grid_7">
        {$CONTENT}
        </div><!-- content -->

        <div id="sidebar" class="grid_4 prefix_1">
            {assign var="subscribe_1" value=$CONST.BASE_SUBSCRIBE_1}
            {assign var="subscribe_2" value=$CONST.BASE_SUBSCRIBE_2}
            {assign var="subscribe_3" value=$CONST.BASE_SUBSCRIBE_3}
            <div id="subscribe">
                <h2>{$subscribe_1}</h2>

                <a class="posts" href="{if $template_option.feedburner != ''}{$template_option.feedburner}{else}{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/index.rss2{/if}" title="{$CONST.ENTRIES} RSS">{$subscribe_2}</a>
                <br />
                <a class="comments" href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/comments.rss2" title="{$CONST.COMMENTS} RSS">{$subscribe_3}</a>
            </div><!-- /subscribe -->

            <div id="search">
                <h2>{$CONST.QUICKSEARCH}</h2>

                <form id="searchform" name="searchform" action="{$serendipityHTTPPath}{$serendipityIndexFile}" method="get">
                    <input type="hidden" name="serendipity[action]" value="search" />
                    <input class="text" type="text" name="serendipity[searchTerm]" id="serendipityQuickSearchTermField" value="" />
                    <input class="submit" type="image" name="serendipity[searchButton]" src="{$serendipityHTTPPath}templates/{$template}/img/icons/search.gif" value="{$CONST.QUICKSEARCH}" />
                </form>
                {serendipity_hookPlugin hook="quicksearch_plugin" hookAll="true"}
            </div><!-- /search -->

            <div id="widgets">
            {if $leftSidebarElements > 0}{serendipity_printSidebar side="left"}{/if}
            {if $rightSidebarElements > 0}{serendipity_printSidebar side="right"}{/if}
            </div>
        </div><!-- /sidebar -->
    </div><!-- /main -->

    <div id="footer" class="clearfix fullcolumn">
        <p class="floatl">{$blogTitle} | {$blogDescription} &copy; {$date|@formatTime:'%Y'}</p>

        <p class="floatr">Designed by <a href="http://fresh01.co.za" title="FRESH01">FRESH01</a>. Powered by <a href="http://www.s9y.org" title="Serendipity" rel="nofollow">Serendipity</a>. Ported by <a href="http://yellowled.de">YellowLed</a>.</p>
    </div><!-- /footer -->
</div><!-- /container -->
{/if}

{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
</body>
</html>
{/if}

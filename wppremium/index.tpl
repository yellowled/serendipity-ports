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
    <link rel="stylesheet" type="text/css" href="{$head_link_stylesheet}" />
{if $template_option.wppcolset == 'black'}
    <link rel="stylesheet" type="text/css" href="{serendipity_getFile file="style-black.css"}" />
{elseif $template_option.wppcolset == 'brown'}
    <link rel="stylesheet" type="text/css" href="{serendipity_getFile file="style-brown.css"}" />
{elseif $template_option.wppcolset == 'red'}
    <link rel="stylesheet" type="text/css" href="{serendipity_getFile file="style-red.css"}" />
{else}
    <link rel="stylesheet" type="text/css" href="{serendipity_getFile file="style-red.css"}" />
{/if}
    <link rel="stylesheet" type="text/css" href="{serendipity_getFile file="s9y.css"}" />
    <link rel="alternate"  type="application/rss+xml" title="{$blogTitle} RSS feed" href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/index.rss2" />
    <link rel="alternate"  type="application/x.atom+xml"  title="{$blogTitle} Atom feed"  href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/atom.xml" />
{if $entry_id}
    <link rel="pingback" href="{$serendipityBaseURL}comment.php?type=pingback&amp;entry_id={$entry_id}" />
{/if}
<script type="text/javascript" src="{$serendipityHTTPPath}templates/{$template}/taber.js"></script>
{* <script type="text/javascript">document.write('<style type="text/css">.tabber{display:none;}<\/style>');</script> *}
<script type="text/javascript" src="{$serendipityHTTPPath}templates/{$template}/hover.js"></script>

{serendipity_hookPlugin hook="frontend_header"}
</head>

<body>
{else}
{serendipity_hookPlugin hook="frontend_header"}
{/if}

{if $is_raw_mode != true}
<div id="header">
    <div id="header-in">
        <p class="title"><a href="{$serendipityBaseURL}" title="{$blogTitle} - {$blogDescription}">{$blogTitle}</a></p>
        <p class="description">{$blogDescription}</p>

        <div id="nav">
            <ul>
        {foreach from=$navlinks item="navlink" name=navbar}
               <li{if $currpage==$navlink.href} class="current_page_item"{/if}><a href="{$navlink.href}" title="{$navlink.title}">{$navlink.title}</a></li>
        {/foreach}
            </ul>
        </div><!-- /#nav -->
	
        <div class="subscribe">
            <span class="rss"><a href="{if $template_option.wppfburl != ''}{$template_option.wppfburl}{else}{$serendipityBaseURL}feeds/index.rss2{/if}"><img src="{$serendipityBaseURL}templates/{$template}/img/rss.gif"></img></a></span> 
		 
        {if $template_option.wppfbemail == 'true'}
        {assign var="wppsubscribe" value=$CONST.WPP_SUBSCRIBE}
            <div class="subscribeform">
                <p><a href="http://www.feedburner.com/fb/a/emailverifySubmit?feedId={$template_option.wppfbid}&amp;loc=en_US">{$wppsubscribe}</a></p>
            </div>
        {/if}

        </div><!-- /.subscribe -->
    </div><!-- /#header-in -->
</div><!-- /#header -->

<div class="container-top"></div>

<div id="container">
    <div id="content">
        {$CONTENT}
    </div><!-- /#content -->

    <div id="sidebar" class="clearfix">
        <div id="xsnazzy">
            <b class="xtop">
                <b class="xb1"></b>
                <b class="xb2"></b>
                <b class="xb3"></b>
                <b class="xb4"></b>
            </b>

            <div class="xboxcontent">
                <div class="tabber">
                    <div class="tabbertab{if $template_option.wppdeftab == 'quicksearch'} tabbertabdefault{/if}">
                        <h2>{$CONST.QUICKSEARCH}</h2>
                        <div class="searchform">
                            <form id="searchform" action="{$serendipityHTTPPath}{$serendipityIndexFile}" method="get">
                                <input type="hidden" name="serendipity[action]" value="search" />
                                <input alt="{$CONST.QUICKSEARCH}" type="text" class="s" id="serendipityQuickSearchTermField" name="serendipity[searchTerm]" value="{$CONST.QUICKSEARCH}..." onfocus="if(this.value=='{$CONST.QUICKSEARCH}...')value=''" onblur="if(this.value=='')value='{$CONST.QUICKSEARCH}...';" />
                                <input type="image" class="button" alt="{$CONST.QUICKSEARCH}" name="serendipity[searchButton]" title="{$CONST.GO}" src="{$serendipityHTTPPath}templates/{$template}/img/button-submit.gif" />
                                <div id="LSResult" style="display: none;"><div id="LSShadow"></div></div>
                            </form>
                            {serendipity_hookPlugin hook="quicksearch_plugin" hookAll="true"}
                        </div><!-- /.seachform -->
                    </div>
                    <div class="tabbertab{if $template_option.wppdeftab == 'archives'} tabbertabdefault{/if}">
                        <h2>{$CONST.ARCHIVES}</h2>
                        {serendipity_showPlugin class="serendipity_archives_plugin"}
                    </div>
                    <div class="tabbertab{if $template_option.wppdeftab == 'categories'} tabbertabdefault{/if}">
                        <h2>{$CONST.CATEGORIES}</h2>
                        {serendipity_showPlugin class="serendipity_categories_plugin"}
                    </div>
                </div><!-- /.tabber -->
            </div><!-- /.xboxcontent -->

            <b class="xbottom">
                <b class="xb4"></b>
                <b class="xb3"></b>
                <b class="xb2"></b>
                <b class="xb1"></b>
            </b>
        </div><!-- /#xsnazzy -->

    {if $template_option.wppadvertise == 'true'}
        <div class="advertise">
            <a href="{$template_option.wppaduri1}"><img src="{$serendipityBaseURL}templates/{$template}/img/thumb1.gif"></img></a>
            <a href="{$template_option.wppaduri2}"><img src="{$serendipityBaseURL}templates/{$template}/img/thumb2.gif"></a>
            <a href="{$template_option.wppaduri3}"><img src="{$serendipityBaseURL}templates/{$template}/img/thumb3.gif"></img></a>
        </div><!-- /.advertise -->
    {/if}

        <div id="sidebarwrap" class="clearfix">
            <div id="pxsnazzy">
                <b class="pxtop">
                    <b class="pxb1"></b>
                    <b class="pxb2"></b>
                    <b class="pxb3"></b>
                    <b class="pxb4"></b>
                </b>

                <div class="pxboxcontent">
                    <div id="popular">
                        {serendipity_showPlugin class="serendipity_plugin_recententries"}</li>
                    <div id="popular-bottom"></div>
                    </div><!-- /#popular -->
                </div><!-- /.pxboxcontent -->

                <b class="pxbottom">
                    <b class="pxb4"></b>
                    <b class="pxb3"></b>
                    <b class="pxb2"></b>
                    <b class="pxb1"></b>
                </b>
            </div><!-- /#pxsnazzy -->

            <div id="l_sidebar" class="clearfix">
            {if $leftSidebarElements > 0}{serendipity_printSidebar side="left"}{/if}
            </div><!-- /#l_sidebar -->

            <div id="r_sidebar" class="clearfix">
            {if $rightSidebarElements > 0}{serendipity_printSidebar side="right"}{/if}
            </div><!-- /#r_sidebar -->
        </div><!-- /#sidebarwrap -->
    </div><!-- /#sidebar -->

    <div class="clearfix"></div>
</div><!-- /#container -->

<div class="container-bottom"></div>

<div id="footer">
    <div id="footer-wrap">
        <p class="copyright">Powered by <a href="http://www.s9y.org/">Serendipity</a> | <a href="http://cssace.com/free-wp-premium-theme-is-here/">WP Premium</a> theme by <a href="http://wpremix.com/">WP Remix</a> | Ported to s9y by <a href="http://yellowled.de/s9y.html">YellowLed</a> <br /> Copyright {$date|@formatTime:'%Y'}. {$blogTitle}. All rights reserved</p>

        <ul id="nav-footer">
        {foreach from=$navlinks item="navlink" name=navbar}
           <li{if $currpage==$navlink.href} class="current_page_item"{/if}><a href="{$navlink.href}" title="{$navlink.title}">{$navlink.title}</a></li>
        {/foreach}
        </ul>
    </div><!-- /#footer-wrap -->
</div><!-- /#footer -->
{/if}

{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
</body>
</html>
{/if}

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
    <link rel="stylesheet" type="text/css" href="{$head_link_stylesheet}" media="screen,projection" />
    <!--[if lte IE 6]><link rel="stylesheet" type="text/css" href="{serendipity_getFile file="main-msie.css"}" /><![endif]-->
    <link rel="stylesheet" media="screen,projection" type="text/css" href="{serendipity_getFile file="scheme.css"}" />
    <link rel="stylesheet" media="screen, projection" type="text/css" href="{serendipity_getFile file="s9y.css"}" />
    <link rel="stylesheet" media="print" type="text/css" href="{serendipity_getFile file="print.css"}" />
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
<div id="header" class="box">
    <div class="main">
        <h1 id="logo"><a href="{$serendipityBaseURL}" title="{$CONST.HOMEPAGE}">{$blogTitle}<span>{$blogDescription}</span></a></h1>

        <hr class="noscreen" />

        <p class="noscreen noprint"><em>Quick links: <a href="#content">content</a>, <a href="#nav">navigation</a>, <a href="#search">search</a>.</em></p>
        
        <fieldset id="search">
            <form action="{$serendipityBaseURL}" method="get">
                <div>
                    <span class="noscreen">{$CONST.QUICKSEARCH}</span>
                    <div id="search-input">
                        <input type="hidden" name="serendipity[action]" value="search" />
                        <input type="text" size="30" name="serendipity[searchTerm]" />
                    </div>
                    <input type="image" src="{$serendipityHTTPPath}templates/{$template}/img/inp-search-submit.gif" value="{$CONST.QUICKSEARCH}" name="serendipity[searchButton]" id="search-submit" />
                </div>
            </form>
        </fieldset>
    </div><!-- /.main -->
</div><!-- /#header -->

<div class="main bg box">
    <div id="nav" class="box">
        <h3 class="noscreen">Navigation</h3>

        <ul>
{foreach from=$navlinks item="navlink" name=navbar}
           <li{if $currpage==$navlink.href} id="nav-active"{/if}><a href="{$navlink.href}">{$navlink.title}</a></li>
{/foreach}
        </ul>

        <hr class="noscreen" />
    </div><!-- /#nav -->

    <div class="box">
        <div id="content">
        {$CONTENT}
        </div><!-- /#content -->

        <hr class="noscreen" />

        <div id="aside">
{if $template_option.s03_aboutme == 'true'}
            <h3 class="title">{$template_option.s03_amtitle}</h3>
           
            <div class="aside-padding smaller box">
            
                <p><img src="{$template_option.s03_amimg}" class="f-left" />
                   <strong>{$template_option.s03_amname}</strong><br />
                   {$template_option.s03_amshort}<br />
                   <strong><a href="{$template_option.s03_amuri}" class="high">{$template_option.s03_ammore}</a></strong></p>
            
            </div> <!-- /.smaller .box -->
{/if}
{if $leftSidebarElements > 0}
        {serendipity_printSidebar side="left"}
{/if}
{if $rightSidebarElements > 0}
        {serendipity_printSidebar side="right"}
{/if}
        </div><!-- /#aside -->
    </div> <!-- /.box -->

    <hr class="noscreen" />

    <div id="footer" class="box">
        <p class="f-right"><a href="http://www.nuviotemplates.com/">Free web templates</a> by <a href="http://www.nuvio.cz/">Nuvio</a>, <a href="http://www.cssrevue.com/">CSS Gallery</a>, ported to <a href="http://www.s9y.org">s9y</a> by <a href="http://yellowled.de/s9y.html">YellowLed</a></p>
        
        <p>&copy;&nbsp;{$date|@formatTime:'%Y'} <a href="{$serendipityBaseURL}">{$blogTitle}</a></p>
    </div> <!-- /#footer -->
</div> <!-- /.main -->
{/if}

{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
</body>
</html>
{/if}

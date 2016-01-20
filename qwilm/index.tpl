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
<div id="mini-nav">
<!-- TODO: fix these -->
    <a href="{$serendipityBaseURL}"><img src="{$serendipityHTTPPath}templates/{$template}/img/home_icon.gif" alt="Home" /></a>
    <a href="{$template_option.contact}"><img src="{$serendipityHTTPPath}templates/{$template}/img/email_icon.gif" alt="Email" /></a>
    <a href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/index.rss2"><img src="{$serendipityHTTPPath}templates/{$template}/img/xml.gif" alt="RSS" /></a>
</div><!-- /#mini-nav -->

<div id="wrapper">
    <div id="content">
    {$CONTENT}
    </div><!-- /#content -->

    <div id="sidebar-1" class="sidebar">
    {if $leftSidebarElements > 0}{serendipity_printSidebar side="left"}{/if}
    {if $rightSidebarElements > 0}{serendipity_printSidebar side="right"}{/if}
    </div><!-- /#sidebar-1 -->

    <div id="sidebar-2" class="sidebar">
        <ul>
           <li><h2>{$blogTitle}</h2>
               <p>{$blogDescription}</p>
           </li>
           <li><h2>Meta</h2>
               <ul>
                  <li><a href="{$serendipityBaseURL}{$serendipityRewritePrefix}serendipity_admin.php">{$CONST.LOGIN}</a></li>
                  <li><a href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/index.rss2">{$CONST.ENTRIES} <abbr title="Really Simple Syndication">RSS</abbr></a></li>
                  <li><a href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/comments.rss2">{$CONST.COMMENTS} <abbr title="Really Simple Syndication">RSS</abbr></a></li>
                  <li><a href="http://www.s9y.org">Serendipity</a></li>
               </ul>
           </li>
           <li><h2>Credits</h2>
               <p>Powered by <a href="http://www.s9y.org">s9y</a> and <a href="http://oriol.f2o.org" title="Qwilm!">Qwilm!</a> theme. Ported to s9y by <a href="http://yellowled.de/s9y.html">YellowLed</a></p>
           </li>
        </ul>
    </div><!-- /#sidebar-2 -->

    <div id="logo" class="sidebar">
        <div align="center"><a href="{$serendipityBaseURL}"><img src="{$template_option.logo}" alt="Quilm!" /></a></div>
    </div><!-- /#logo -->
</div><!-- /#wrapper -->
{/if}

{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
</body>
</html>
{/if}

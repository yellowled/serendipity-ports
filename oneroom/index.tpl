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
    <title>{$head_title|@default:$blogTitle} {if $head_subtitle} &raquo; {$head_subtitle}{/if}</title>
    <meta http-equiv="Content-Type" content="text/html; charset={$head_charset}" />
    <meta name="Powered-By" content="Serendipity v.{$head_version}" />
    <link rel="stylesheet" type="text/css" href="{$head_link_stylesheet}" media="screen" />
    <link rel="stylesheet" type="text/css" href="{serendipity_getFile file="s9y.css"}" media="screen" />
<!--[if IE 6]>
<style type="text/css">
.comment-form {ldelim}margin-bottom: -3px; {rdelim}
</style>
<![endif]-->
    <link rel="alternate"  type="application/rss+xml" title="{$blogTitle} RSS feed" href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/index.rss2" />
    <link rel="alternate"  type="application/x.atom+xml"  title="{$blogTitle} Atom feed"  href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/atom.xml" />
{if $entry_id}
    <link rel="pingback" href="{$serendipityBaseURL}comment.php?type=pingback&amp;entry_id={$entry_id}" />
{/if}

{serendipity_hookPlugin hook="frontend_header"}
</head>

<body id="top">
{else}
{serendipity_hookPlugin hook="frontend_header"}
{/if}

{if $is_raw_mode != true}
<div id="container">
    <div id="wrapper">
        <div id="header">
            <div id="logo">
                {assign var="shortblogtitle"  value=$blogTitle|@truncate:14:''}
                <h1><a href="{$serendipityBaseURL}" title="{$blogTitle}">{$shortblogtitle}</a></h1>
            </div><!-- /#logo -->

        {if $template_option.showAdminNav == 'true'}
            <ul id="navAdmin">
            {if $is_logged_in}
               <li><a href="{$serendipityBaseURL}{$serendipityRewritePrefix}admin/">{$CONST.SUPERUSER_OPEN_ADMIN}</a></li>
               <li><a href="{$serendipityBaseURL}{$serendipityRewritePrefix}serendipity_admin.php?serendipity[adminModule]=logout">{$CONST.LOGOUT}</a></li>
            {else}
               <li><a href="{$serendipityBaseURL}{$serendipityRewritePrefix}admin/">{$CONST.LOGIN}</a></li>
            {/if}
            </ul><!-- /#navAdmin -->
        {/if}

            <div class="menu">
                <ul>
                {foreach from=$navlinks item="navlink" name=navbar}
                   <li{if $currpage == $navlink.href or $currpage2 == $navlink.href} class="current_page_item"{/if}><a href="{$navlink.href}">{$navlink.title}</a></li>
                {/foreach}
                </ul>
            </div><!-- /.menu -->

        {if $template_option.showRssAdd == 'true'}
            {assign var="orsubscribe" value=$CONST.OR_SUBSCRIBE}
            <a id="rss" href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/index.rss2" title="{$CONST.SYNDICATE_THIS_BLOG}">{$orsubscribe}</a>
        {/if}
        </div><!-- /#header -->

        <div id="pageWrapper">
            <div id="content">
                <div id="intro">
                {if $view == 'search'}
                    <h2 class="pagetitle">{$content_message}</h2>
                {elseif $view == 'archive' or $view == 'archives'}
                    <h2 class="pagetitle">{$blogTitle}: <a href="{$serendipityArchiveURL}">{$CONST.ARCHIVES}</a></h2>
                {elseif $view == '404'}
                    {assign var="or404h" value=$CONST.OR_404H}
                    {assign var="or404s" value=$CONST.OR_404S}
                    {assign var="or404m" value=$CONST.OR_404M}
                    <h2 class="pagetitle">{$or404h} - <span>{$or404s}</span></h2>

                    <p>{$or404m}</p>
                {else}
                    <p><a href="{$serendipityBaseURL}"><b>{$blogTitle}</b></a>: {$blogDescription}</p>
                {/if}
                </div><!-- /#intro -->
                
                {if $view == '404'}
                <div class="postWrapper">
                    <div class="post">
                        <div class="entry">
                            <ul>
                               <li><a href="{$serendipityBaseURL}">{$CONST.HOMEPAGE}</a></li>
                               <li><a href="{$serendipityArchiveURL}">{$CONST.ARCHIVES}</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                {else}
                {$CONTENT}
                {/if}
            </div><!-- /#content -->

            <div id="sidebar">
                <ul>
                   <li class="nobackground">
                       <form id="searchform" action="{$serendipityHTTPPath}{$serendipityIndexFile}" method="get">
                           <input type="hidden" name="serendipity[action]" value="search" />
                           <div>
                               <input id="s" class="search-field" type="text" name="serendipity[searchTerm]" value="{$CONST.QUICKSEARCH} ..." onfocus="if(this.value=='{$CONST.QUICKSEARCH} ...')value=''" onblur="if(this.value=='')value='{$CONST.QUICKSEARCH} ...';" />
                               <input type="submit" class="search-submit" value="" name="serendipity[searchButton]" />
                               <div id="LSResult" style="display: none;"><div id="LSShadow"></div></div>
                           </div>
                       </form>
                       {serendipity_hookPlugin hook="quicksearch_plugin" hookAll="true"}
                   </li>
                {if $template_option.showAboutBox == 'true'}
                   {assign var="orauthor" value=$CONST.OR_AUTHOR}
                   <li>
                       <h2>{$orauthor}</h2>

                       <p><img class="alignleft" {if $template_option.aboutimg != ''}src="{$template_option.aboutimg}"{else}src="{$serendipityBaseURL}templates/{$template}/img/about.jpg"{/if} alt="About Me" /> {$template_option.abouttxt}</p>
                   </li>
                {/if}
                {if $template_option.showAdBox == 'true'}
                   {assign var="orsponsors" value=$CONST.OR_SPONSORS}
                   <li class="ads clearfix">
                       <h2>{$orsponsors}</h2>

                       <a class="ad-left" href="{$template_option.adlinkleft}" title="{$template_option.adnameleft}"><img {if $template_option.adimgleft != ''}src="{$template_option.adimgleft}"{else}src="{$serendipityBaseURL}templates/{$template}/img/ad.jpg"{/if} alt="{$template_option.adnameleft}" /></a>

                       <a class="ad-right" href="{$template_option.adlinkright}" title="{$template_option.adnameright}"><img {if $template_option.adimgright != ''}src="{$template_option.adimgright}"{else}src="{$serendipityBaseURL}templates/{$template}/img/ad.jpg"{/if} alt="{$template_option.adnameright}" /></a>
                   </li>
                {/if}
                {if $leftSidebarElements > 0}{serendipity_printSidebar side="left"}{/if}
                {if $rightSidebarElements > 0}{serendipity_printSidebar side="right"}{/if}
                </ul>
            </div>

            <div class="clear"></div>
        </div><!-- / #pageWrapper -->

        <div id="footer">
            <div class="foot_l">&nbsp;</div>

            <div class="foot_content">
                <div>
                    <ul>
                    {foreach from=$navlinks item="navlink" name=navbar}
                       <li{if $currpage == $navlink.href or $currpage2 == $navlink.href} class="current_page_item"{/if}><a href="{$navlink.href}">- {$navlink.title}</a></li>
                    {/foreach}
                    </ul>
                </div>

                <p>All contents copyright &copy; <a href="{$serendipityBaseURL}">{$blogInfo}</a>. All rights reserved. Theme design by <a href="http://web-kreation.com">Web-Kreation</a>. Ported to <a href="http://www.s9y.org">s9y</a> by <a href="http://yellowled.de">YellowLed</a>.</p>
            </div>

            <div class="foot_r">&nbsp;</div>

            <a href="#top" id="toTop">&nbsp;</a>
        </div><!-- / footer -->
    </div><!-- / Wrapper -->
</div><!-- / container -->
{/if}

{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
</body>
</html>
{/if}

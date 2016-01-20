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
    <link rel="stylesheet" href="{serendipity_getFile file="s9y.css"}" type="text/css" />
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
<div id="container" class="group">
    <h1><a href="{$serendipityBaseURL}">{$blogTitle}</a></h1>

  {if $template_option.bubble == 'true'}
    <div id="bubble">
        <p>{$blogDescription}</p>
    </div> <!-- /#bubble -->
  {/if}

    <div id="content" class="group">
    {$CONTENT}
    </div><!-- /#content -->

    <div id="sidebar">
        <div id="pages">
           <h3>{$template_option.menutitle}</h3>

           <ul>
           {foreach from=$navlinks item="navlink" name=navbar}
              <li><a href="{$navlink.href}" title="{$navlink.title}">{$navlink.title}</a></li>
           {/foreach}
           </ul>
        </div>

        <h3>{$CONST.QUICKSEARCH}</h3>

        {assign var="jsinfo" value=$CONST.J_SEARCHINFO}
        <p class="searchinfo">{$jsinfo}</p>

        <div id="search">
            {assign var="jfield" value=$CONST.J_SEARCHFIELD}
            {assign var="jsubtext" value=$CONST.J_SUBMITTEXT}
            {assign var="jsubalt" value=$CONST.J_SUBMITALT}
            <div id="search_area">
                <form id="searchform" method="get" action="{$serendipityHTTPPath}{$serendipityIndexFile}">
                    <input type="hidden" name="serendipity[action]" value="search" />
                    <div>
                        <input class="searchfield" type="text" name="serendipity[searchTerm]" id="s" value="" title="{$jfield}" />
                        <input class="submit" type="submit" value="{$jsubtext}" name="serendipity[searchButton]" title="{$jsubalt}" />
                    </div>
                </form>
                {serendipity_hookPlugin hook="quicksearch_plugin" hookAll="true"}
            </div><!-- /#search_area -->
       </div><!-- /#search -->

    {if $leftSidebarElements > 0}
        {serendipity_printSidebar side="left"}
    {/if}
    {if $rightSidebarElements > 0}
        {serendipity_printSidebar side="right"}
    {/if}
    </div><!-- /#sidebar -->
</div><!-- /#container -->

<div id="footer">
    <p>The Journalist template by <a href="http://lucianmarin.com/" rel="designer">Lucian E. Marin</a> &mdash; Built for <a href="http://wordpress.org/">WordPress</a></p>
    <p>Ported to <a href="http://www.s9y.org">Serendipity</a> by <a href="http://yellowled.de">YellowLed</a></p>
</div>
{/if}

{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
</body>
</html>
{/if}

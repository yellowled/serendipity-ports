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
<div class="HBG">
    <div class="Header">
        <div class="Stars"></div>

        <div class="LogoText">
            <h1><a class="homelink1" href="{$serendipityBaseURL}">{$blogTitle}</a></h1>
        </div>

        <p class="Desc">{$blogDescription}</p>
    </div>

    <div class="SUBH">
        <div class="Menu">
            <ul>
        {foreach from=$navlinks item="navlink" name=navbar}
               <li{if $currpage==$navlink.href} class="on"{/if}><a href="{$navlink.href}" title="{$navlink.title}">{if $currpage==$navlink.href}<span>{/if}{$navlink.title}{if $currpage==$navlink.href}</span>{/if}</a></li>
        {/foreach}
            </ul> 
        </div>

        <div class="Search">
            <form action="{$serendipityHTTPPath}{$serendipityIndexFile}" method="get">
                <input type="hidden" name="serendipity[action]" value="search" />
                <input type="text" name="serendipity[searchTerm]" class="keyword" />
                <div class="bt">
                    <input type="image" class="search" title="{$CONST.QUICKSEARCH}" name="serendipity[searchButton]" src="{$serendipityBaseURL}templates/{$template}/img/ButtonTransparent.png" alt="{$CONST.QUICKSEARCH}" />
                </div>
            </form>
            {serendipity_hookPlugin hook="quicksearch_plugin" hookAll="true"}
        </div>

        <div class="Syn">
            <ul>
               <li><a href="{$serendipityBaseURL}feeds/index.rss2">{$CONST.ENTRIES}</a> (RSS)</li>
               <li><a href="{$serendipityBaseURL}feeds/comments.rss2">{$CONST.COMMENTS}</a> (RSS)</li>
            </ul>
        </div>
    </div>
</div>

<div class="CONBG">
    <div class="CON">
        <div id="mainpane" class="SC">
        {$CONTENT}
        </div>

        <div class="SR">
            <div class="SRL">
        {if $leftSidebarElements > 0}
            {serendipity_printSidebar side="left"}
        {/if}
            </div>
            <div class="SRR">
            {if $template_option.googleads == 'true'}
            {assign var="gcadspace" value=$CONST.GC_ADSPACE}
                <h3>{$gcadspace}</h3>
                <br />
                {$template_option.googleadcode}
            {/if}
            </div>
        </div>
    </div>
</div>

{if $rightSidebarElements > 0}
<div class="EBG">
    <div class="Extra">
    {serendipity_printSidebar side="right"}
    </div>
</div>
{/if}

<div class="FBG">
    <div class="Footer">
        <p><strong>Copyright &copy; {$date|@formatTime:'%Y'} - {$blogTitle} - is proudly powered by <a style="text-decoration: none;" href="http://www.s9y.org/">Serendipity</a></strong> <br />
           Gossip City Theme is created by: <a href="http://www.designdisease.com/" title="Professional Blog Design">Design Disease</a> brought to you by <a href="http://www.celebrific.com/" title="Celebrity Gossip">Celebrific.</a> <br />
           Ported to s9y by <a href="http://yellowled.de">YellowLed</a></p> 
    </div>
</div>
{/if}

{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
</body>
</html>
{/if}

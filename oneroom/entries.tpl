{assign var="orby" value=$CONST.OR_BY}
{assign var="orfor" value=$CONST.OR_FOR}
{assign var="ormore" value=$CONST.OR_MORE}
{assign var="ornotfound" value=$CONST.OR_NOTFOUND}
{assign var="orforthisentry" value=$CONST.OR_FORTHISENTRY}
<!-- ENTRIES START -->
{serendipity_hookPlugin hook="entries_header" addData="$entry_id"}

{foreach from=$entries item="dategroup"}
  {foreach from=$dategroup.entries item="entry"}
  {assign var="entry" value=$entry scope="parent"}
    <div class="postWrapper">
        <div class="postmetadata">
            <p class="meta-date">
                <span class="date-day">{$entry.timestamp|@formatTime:'%e'}</span>
                <span class="date-month">{$entry.timestamp|@formatTime:'%b'}</span>
                <span class="date-year">{$entry.timestamp|@formatTime:'%Y'}</span>
            </p>

            <p class="meta-author">{$orby} {$entry.author}</p>
        {if $entry.is_entry_owner and not $is_preview}
            <p class="meta-edit"><a href="{$entry.link_edit}">{$CONST.EDIT_ENTRY}</a></p>
        {/if}
        {if $entry.has_comments}
          {if $use_popups}
            <a class="meta-comments" title="{$CONST.COMMENTS} {$orfor} {$entry.title}" href="{$entry.link_popup_comments}" onclick="window.open(this.href, 'comments', 'width=480,height=480,scrollbars=yes'); return false;">{$entry.comments} {$entry.label_comments}</a>
          {else}
            <a class="meta-comments" title="{$CONST.COMMENTS} {$orfor} {$entry.title}" href="{$entry.link}#comments">{$entry.comments} {$entry.label_comments}</a>
          {/if}
        {/if}
        {if $entry.categories}
            <p class="meta-categories">{foreach from=$entry.categories item="entry_category" name="categories"}<a href="{$entry_category.category_link}">{$entry_category.category_name|@escape}</a>{if not $smarty.foreach.categories.last}, {/if}{/foreach}</p>
        {/if}
            {$entry.freetag}
        </div>

        <div class="post" id="post-{$entry.id}">
            <h1><a href="{$entry.link}" rel="bookmark" title="Permalink {$orfor} {$entry.title}">{$entry.title}</a>{if $dategroup.is_sticky} ({$CONST.STICKY_POSTINGS}){/if}</h1>

            <div class="entry">
                {$entry.body}
            {if $entry.is_extended}
                <div id="extended">{$entry.extended}</div>
            {/if}
            {if $entry.has_extended and not $is_single_entry and not $entry.is_extended}
                <a href="{$entry.link}#extended"><span class="more">{$ormore} &raquo;</span></a>
            {/if}
                <div class="serendipity_entryFooter">
                {$entry.add_footer}
                {$entry.plugin_display_dat}
                </div>
            </div>
        </div>
    </div>

    <div class="clear"></div>

    <!--
    <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
             xmlns:trackback="http://madskills.com/public/xml/rss/module/trackback/"
             xmlns:dc="http://purl.org/dc/elements/1.1/">
    <rdf:Description
             rdf:about="{$entry.link_rdf}"
             trackback:ping="{$entry.link_trackback}"
             dc:title="{$entry.title_rdf|@default:$entry.title}"
             dc:identifier="{$entry.rdf_ident}" />
    </rdf:RDF>
    -->

  {if $is_single_entry and not $use_popups and not $is_preview}
    <div class="nav nav-padding">
        <div class="alignleft">
            <a rel="nofollow" href="{$entry.link_trackback}" onclick="alert('{$CONST.TRACKBACK_SPECIFIC_ON_CLICK|@escape:html}'); return false;" title="{$CONST.TRACKBACK_SPECIFIC_ON_CLICK|@escape}">{$CONST.TRACKBACK_SPECIFIC}</a>
        </div>
        <div class="alignright">
        {if $CONST.DATA_UNSUBSCRIBED}
            <p class="serendipity_msg_notice">{$CONST.DATA_UNSUBSCRIBED|@sprintf:$CONST.UNSUBSCRIBE_OK}</p>
        {/if}
        {if $CONST.DATA_TRACKBACK_DELETED}
            <p class="serendipity_msg_notice">{$CONST.DATA_TRACKBACK_DELETED|@sprintf:$CONST.TRACKBACK_DELETED}</p>
        {/if}
        {if $CONST.DATA_TRACKBACK_APPROVED}
            <p class="serendipity_msg_notice">{$CONST.DATA_TRACKBACK_APPROVED|@sprintf:$CONST.TRACKBACK_APPROVED}</p>
        {/if}
        {if $CONST.DATA_COMMENT_DELETED}
            <p class="serendipity_msg_notice">{$CONST.DATA_COMMENT_DELETED|@sprintf:$CONST.COMMENT_DELETED}</p>
        {/if}
        {if $CONST.DATA_COMMENT_APPROVED}
            <p class="serendipity_msg_notice">{$CONST.DATA_COMMENT_APPROVED|@sprintf:$CONST.COMMENT_APPROVED}</p>
        {/if}
        </div>
    </div>
  {/if}

  {if $is_single_entry and not $is_preview}
    <div class="left-sidebar">
        <h3 id="comments">{$entry.comments} {$entry.label_comments}</h3>
    </div>

    <div class="nav nav-padding">
        <div class="alignleft">
            <p>{$CONST.DISPLAY_COMMENTS_AS} {if $entry.viewmode eq $CONST.VIEWMODE_LINEAR}({$CONST.COMMENTS_VIEWMODE_LINEAR} | <a href="{$entry.link_viewmode_threaded}#comments" rel="nofollow">{$CONST.COMMENTS_VIEWMODE_THREADED}</a>){else}(<a rel="nofollow" href="{$entry.link_viewmode_linear}#comments">{$CONST.COMMENTS_VIEWMODE_LINEAR}</a> | {$CONST.COMMENTS_VIEWMODE_THREADED}){/if}</p>
        </div>
        <div class="alignright">
            <p><a href="{$serendipityBaseURL}rss.php?version=2.0&amp;type=comments&amp;cid={$entry.id}">RSS 2.0</a> Feed ({$CONST.COMMENTS}) {$orforthisentry}</p>
        {if $entry.is_entry_owner}
          {if $entry.allow_comments}
            <p>(<a href="{$entry.link_deny_comments}">{$CONST.COMMENTS_DISABLE}</a>)</p>
          {else}
            <p>(<a href="{$entry.link_allow_comments}">{$CONST.COMMENTS_ENABLE}</a>)</p>
          {/if}
        {/if}
        </div>
    </div>

    {serendipity_printComments entry=$entry.id mode=$entry.viewmode}

    <a id="feedback"></a>

    <div class="nav nav-padding">
        <div class="alignleft">
        {foreach from=$comments_messagestack item="message"}
            <p class="serendipity_msg_important">{$message}</p>
        {/foreach}
        </div>
        <div class="alignright">&nbsp;</div>
    </div>

    {if $is_comment_added}
    <p class="nav nav-padding serendipity_msg_notice">{$CONST.COMMENT_ADDED}</p>
    {elseif $is_comment_moderate}
    <p class="nav nav-padding serendipity_msg_notice">{$CONST.COMMENT_ADDED}: {$CONST.THIS_COMMENT_NEEDS_REVIEW}</p>
    {elseif not $entry.allow_comments}
    <p class="nav nav-padding serendipity_msg_important">{$CONST.COMMENTS_CLOSED}</p>
    {else}
    <div id="respond">{$COMMENTFORM}</div><!-- /#respond -->

    <div class="clear"></div>
    {/if}
  {/if}

{if $is_single_entry and not $use_popups and not $is_preview}
<div class="post">
    <h3 style="margin: 0px;">{$CONST.TRACKBACKS} / Pingbacks</h3>

    {serendipity_printTrackbacks entry=$entry.id}
</div>
{/if}

  {$entry.backend_preview}
{/foreach}
{foreachelse}
  {if not $plugin_clean_page}
    <h2 class="center">{$ornotfound}</h2>

    <p class="center">{$CONST.NO_ENTRIES_TO_PRINT}</p>
  {/if}
{/foreach}

{if $footer_prev_page or $footer_next_page}
<div class="nav nav-border-bottom">
{if $footer_prev_page}
    <div class="alignleft"><a href="{$footer_prev_page}">&laquo; {$CONST.PREVIOUS_PAGE}</a>&nbsp;</div>
{/if}
{if $footer_next_page}
    <div class="alignright">&nbsp;<a href="{$footer_next_page}">{$CONST.NEXT_PAGE} &raquo;</a></div>
{/if}
</div>
{/if}
{serendipity_hookPlugin hook="entries_footer"}
<!-- ENTRIES END -->

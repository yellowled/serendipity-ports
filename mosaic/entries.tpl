<!-- ENTRIES START -->
    {serendipity_hookPlugin hook="entries_header" addData="$entry_id"}
    {foreach from=$entries item="dategroup"}
    {foreach from=$dategroup.entries item="entry"}
    {assign var="entry" value=$entry scope="parent"}
        <div class="post">
            <p class="meta"><span class="date"> <span class="d">{$entry.timestamp|@formatTime:'%e'}</span> <span class="m">{$entry.timestamp|@formatTime:'%B'}</span> </span> &nbsp;&nbsp;&nbsp; {if $entry.has_comments}<a href="{$entry.link}#comments" class="comments"> <span class="c">{$entry.comments}</span> {$entry.label_comments} </a>{/if}</p>

            <h1 class="title"><a href="{$entry.link}">{$entry.title}</a></h1>

            <div class="entry">
                {$entry.body}
                {if $entry.is_extended}
                <div class="serendipity_entry_extended"><a id="extended"></a>{$entry.extended}</div>
                {/if}
                {if $entry.has_extended and not $is_single_entry and not $entry.is_extended}
                <p><a href="{$entry.link}#extended">{$CONST.VIEW_EXTENDED_ENTRY|@sprintf:$entry.title}</a></p>
                {/if}
                {$entry.plugin_display_dat}
                {$entry.add_footer}
            </div><!-- /.entry -->

            <div class="bgbottom" style="clear: both;"></div>
        </div><!-- /.post -->

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
        <div id="trackbacks" class="post wide">
            {if $CONST.DATA_UNSUBSCRIBED}
                <div class="serendipity_center serendipity_msg_notice">{$CONST.DATA_UNSUBSCRIBED|@sprintf:$CONST.UNSUBSCRIBE_OK}</div>
            {/if}

            {if $CONST.DATA_TRACKBACK_DELETED}
                <div class="serendipity_center serendipity_msg_notice">{$CONST.DATA_TRACKBACK_DELETED|@sprintf:$CONST.TRACKBACK_DELETED}</div>
            {/if}

            {if $CONST.DATA_TRACKBACK_APPROVED}
                <div class="serendipity_center serendipity_msg_notice">{$CONST.DATA_TRACKBACK_APPROVED|@sprintf:$CONST.TRACKBACK_APPROVED}</div>
            {/if}

            {if $CONST.DATA_COMMENT_DELETED}
                <div class="serendipity_center serendipity_msg_notice">{$CONST.DATA_COMMENT_DELETED|@sprintf:$CONST.COMMENT_DELETED}</div>
            {/if}

            {if $CONST.DATA_COMMENT_APPROVED}
                <div class="serendipity_center serendipity_msg_notice">{$CONST.DATA_COMMENT_APPROVED|@sprintf:$CONST.COMMENT_APPROVED}</div>
            {/if}

                <a id="trackbacks"></a>
                <h2 class="title">{$entry.trackbacks} {$CONST.TRACKBACKS}</h2>

                <div class="serendipity_center"><a rel="nofollow" style="font-weight: normal" href="{$entry.link_trackback}" onclick="alert('{$CONST.TRACKBACK_SPECIFIC_ON_CLICK|@escape:html}'); return false;" title="{$CONST.TRACKBACK_SPECIFIC_ON_CLICK|@escape}">{$CONST.TRACKBACK_SPECIFIC}</a></div>

                {serendipity_printTrackbacks entry=$entry.id}

                <div class="bgbottom" style="height: 0;"></div>
        </div><!-- /#trackbacks -->
        {/if}

        {if $is_single_entry and not $is_preview}
        <div id="comments" class="post wide">
            <a id="comments"></a>
            <h2 class="title">{$entry.comments} {$CONST.COMMENTS}</h2>

            <div class="serendipity_center">{$CONST.DISPLAY_COMMENTS_AS}
                {if $entry.viewmode eq $CONST.VIEWMODE_LINEAR}
                    ({$CONST.COMMENTS_VIEWMODE_LINEAR} | <a href="{$entry.link_viewmode_threaded}#comments" rel="nofollow">{$CONST.COMMENTS_VIEWMODE_THREADED}</a>)
                {else}
                    (<a rel="nofollow" href="{$entry.link_viewmode_linear}#comments">{$CONST.COMMENTS_VIEWMODE_LINEAR}</a> | {$CONST.COMMENTS_VIEWMODE_THREADED})
                {/if}
            </div>

            {serendipity_printComments entry=$entry.id mode=$entry.viewmode}

            {if $entry.is_entry_owner}
                {if $entry.allow_comments}
                <div class="serendipity_center">(<a href="{$entry.link_deny_comments}">{$CONST.COMMENTS_DISABLE}</a>)</div>
                {else}
                <div class="serendipity_center">(<a href="{$entry.link_allow_comments}">{$CONST.COMMENTS_ENABLE}</a>)</div>
                {/if}
            {/if}
            <div class="bgbottom" style="height: 0;"></div>
        </div><!-- #comments -->

        <div>&nbsp;</div>

        <div id="respond" class="post wide">
            <a id="feedback"></a>

            {foreach from=$comments_messagestack item="message"}
            <div class="serendipity_center serendipity_msg_important">{$message}</div>
            {/foreach}

            {if $is_comment_added}
            <div class="serendipity_center serendipity_msg_notice">{$CONST.COMMENT_ADDED}</div>
            {elseif $is_comment_moderate}
            <div class="serendipity_center serendipity_msg_notice">{$CONST.COMMENT_ADDED}<br />{$CONST.THIS_COMMENT_NEEDS_REVIEW}</div>
            {elseif not $entry.allow_comments}
            <div class="serendipity_center serendipity_msg_important">{$CONST.COMMENTS_CLOSED}</div>
            {else}
            <h2 class="title">{$CONST.ADD_COMMENT}</h2>
            {$COMMENTFORM}
            {/if}

            {$entry.backend_preview}

            <div class="bgbottom" style="height: 0;"></div>
        </div><!-- /#respond -->
        {/if}
        {/foreach}
    {foreachelse}
    {if not $plugin_clean_page}
        {$CONST.NO_ENTRIES_TO_PRINT}
    {/if}
    {/foreach}

    <div class="serendipity_pageFooter" style="text-align: center">
    {if $footer_prev_page}
        <a href="{$footer_prev_page}">&laquo; {$CONST.PREVIOUS_PAGE}</a>&#160;&#160;
    {/if}
    {if $footer_info}
        ({$footer_info})
    {/if}
    {if $footer_next_page}
        &#160;&#160;<a href="{$footer_next_page}">{$CONST.NEXT_PAGE} &raquo;</a>
    {/if}
    {serendipity_hookPlugin hook="entries_footer"}
    </div>
<!-- ENTRIES END -->

<!-- ENTRIES START -->
    {serendipity_hookPlugin hook="entries_header" addData="$entry_id"}
    {foreach from=$entries item="dategroup"}
    {foreach from=$dategroup.entries item="entry"}
    {assign var="entry" value=$entry scope="parent"}
    <div class="post">
        <h1 class="title"><a href="{$entry.link}" rel="bookmark">{$entry.title}</a>{if $dategroup.is_sticky} ({$CONST.STICKY_POSTINGS}){/if}</h1>

        <p class="meta"><small class="author">{$CONST.POSTED_BY} <a href="{$entry.link_author}">{$entry.author}</a></small> <small class="date">{$entry.timestamp|@formatTime:DATE_FORMAT_ENTRY}</small></p>

        <div class="entry">
            {$entry.body}
        {if $entry.is_extended}
            <div class="serendipity_entry_extended"><a id="extended"></a>{$entry.extended}</div>
        {/if}
        {if $entry.has_extended and not $is_single_entry and not $entry.is_extended}
            <p><a href="{$entry.link}#extended">{$CONST.VIEW_EXTENDED_ENTRY|@sprintf:$entry.title}</a></p>
        {/if}
        </div>

        <p class="links">{if $entry.categories}{$CONST.IN} {foreach from=$entry.categories item="entry_category" name="categories"}<a href="{$entry_category.category_link}">{$entry_category.category_name|@escape}</a>{if not $smarty.foreach.categories.last}, {/if}{/foreach}{/if}{if $entry.is_entry_owner and not $is_preview} &nbsp;&nbsp;|&nbsp;&nbsp; <a href="{$entry.link_edit}">{$CONST.EDIT_ENTRY}</a>{/if}{if $entry.has_comments}{if $use_popups} &nbsp;&nbsp;|&nbsp;&nbsp; <a href="{$entry.link_popup_comments}" onclick="window.open(this.href, 'comments', 'width=480,height=480,scrollbars=yes'); return false;">{$entry.comments}&nbsp;{$entry.label_comments}</a>{else} &nbsp;&nbsp;|&nbsp;&nbsp; <a href="{$entry.link}#comments">{$entry.comments}&nbsp;{$entry.label_comments}</a>{/if}{/if}</p>

        <!-- TODO: how to use this: <p class="tags"></p> -->

        {$entry.add_footer}

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
        {$entry.plugin_display_dat}

        {if $is_single_entry and not $use_popups and not $is_preview}
            {if $CONST.DATA_UNSUBSCRIBED}
                <br /><div class="serendipity_center serendipity_msg_notice">{$CONST.DATA_UNSUBSCRIBED|@sprintf:$CONST.UNSUBSCRIBE_OK}</div><br />
            {/if}

            {if $CONST.DATA_TRACKBACK_DELETED}
                <br /><div class="serendipity_center serendipity_msg_notice">{$CONST.DATA_TRACKBACK_DELETED|@sprintf:$CONST.TRACKBACK_DELETED}</div><br />
            {/if}

            {if $CONST.DATA_TRACKBACK_APPROVED}
                <br /><div class="serendipity_center serendipity_msg_notice">{$CONST.DATA_TRACKBACK_APPROVED|@sprintf:$CONST.TRACKBACK_APPROVED}</div><br />
            {/if}

            {if $CONST.DATA_COMMENT_DELETED}
                <br /><div class="serendipity_center serendipity_msg_notice">{$CONST.DATA_COMMENT_DELETED|@sprintf:$CONST.COMMENT_DELETED}</div><br />
            {/if}

            {if $CONST.DATA_COMMENT_APPROVED}
                <br /><div class="serendipity_center serendipity_msg_notice">{$CONST.DATA_COMMENT_APPROVED|@sprintf:$CONST.COMMENT_APPROVED}</div><br />
            {/if}

            <div class="serendipity_comments serendipity_section_trackbacks">
                <br />
                <a id="trackbacks"></a>
                <h3 id="trackbacks">{$entry.trackbacks} {$CONST.TRACKBACKS}</h3>
                    <div class="serendipity_center">
                        <a rel="nofollow" style="font-weight: normal" href="{$entry.link_trackback}" onclick="alert('{$CONST.TRACKBACK_SPECIFIC_ON_CLICK|@escape:html}'); return false;" title="{$CONST.TRACKBACK_SPECIFIC_ON_CLICK|@escape}">{$CONST.TRACKBACK_SPECIFIC}</a>
                    </div>
                    <br />
                        {serendipity_printTrackbacks entry=$entry.id}
            </div>
        {/if}

        {if $is_single_entry and not $is_preview}
            <div class="serendipity_comments serendipity_section_comments">
                <br />
                <a id="comments"></a>
                <h3 id="comments">{$entry.comments} {$CONST.COMMENTS}</h3>
                <div class="serendipity_center">{$CONST.DISPLAY_COMMENTS_AS}
                {if $entry.viewmode eq $CONST.VIEWMODE_LINEAR}
                    ({$CONST.COMMENTS_VIEWMODE_LINEAR} | <a href="{$entry.link_viewmode_threaded}#comments" rel="nofollow">{$CONST.COMMENTS_VIEWMODE_THREADED}</a>)
                {else}
                    (<a rel="nofollow" href="{$entry.link_viewmode_linear}#comments">{$CONST.COMMENTS_VIEWMODE_LINEAR}</a> | {$CONST.COMMENTS_VIEWMODE_THREADED})
                {/if}
                </div>
                <br />
                    {serendipity_printComments entry=$entry.id mode=$entry.viewmode}

                {if $entry.is_entry_owner}
                    {if $entry.allow_comments}
                    <div class="serendipity_center">(<a href="{$entry.link_deny_comments}">{$CONST.COMMENTS_DISABLE}</a>)</div>
                    {else}
                    <div class="serendipity_center">(<a href="{$entry.link_allow_comments}">{$CONST.COMMENTS_ENABLE}</a>)</div>
                    {/if}
                {/if}
                <a id="feedback"></a>

                {foreach from=$comments_messagestack item="message"}
                <div class="serendipity_center serendipity_msg_important">{$message}</div>
                {/foreach}

                {if $is_comment_added}

                <br />
                <div class="serendipity_center serendipity_msg_notice">{$CONST.COMMENT_ADDED}</div>

                {elseif $is_comment_moderate}

                <br />
                <div class="serendipity_center serendipity_msg_notice">{$CONST.COMMENT_ADDED}<br />{$CONST.THIS_COMMENT_NEEDS_REVIEW}</div>

                {elseif not $entry.allow_comments}

                <br />
                <div class="serendipity_center serendipity_msg_important">{$CONST.COMMENTS_CLOSED}</div>

                {else}

                <br />
                <div class="serendipity_section_commentform">
	                <h3 id="commentform">{$CONST.ADD_COMMENT}</h3>
	                {$COMMENTFORM}
		</div>

                {/if}
            </div>
        {/if}

        {$entry.backend_preview}
    </div><!-- /.post -->
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
        <a href="{$footer_next_page}">&raquo; {$CONST.NEXT_PAGE}</a>
    {/if}

    {serendipity_hookPlugin hook="entries_footer"}
    </div>
<!-- ENTRIES END -->

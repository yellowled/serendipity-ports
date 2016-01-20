<!-- ENTRIES START -->
    {serendipity_hookPlugin hook="entries_header" addData="$entry_id"}
    {foreach from=$entries item="dategroup"}
    {foreach from=$dategroup.entries item="entry"}
    {assign var="entry" value=$entry scope="parent"}

        <div class="clearboth"></div>

    {if $entry.has_comments}
	<div class="comm"><span>{if $use_popups}<a href="{$entry.link_popup_comments}" onclick="window.open(this.href, 'comments', 'width=480,height=480,scrollbars=yes'); return false;">{$entry.comments}</a>{else}<a href="{$entry.link}#comments">{$entry.comments}</a>{/if}</span></div>
    {/if}

        <h3 class="h1" id="post-{$entry.id}"><a href="{$entry.link}" rel="bookmark" title="Permanent Link to {$entry.title}">{$entry.title}</a></h3>

        <div class="post-meta-top">
            <div class="auth"><span>{$CONST.POSTED_BY} <strong><a href="{$entry.link_author}">{$entry.author}</a></strong></span></div>
            <div class="date"><span> {$CONST.ON} <strong>{$entry.timestamp|@formatTime:DATE_FORMAT_ENTRY}</strong></span></div>
        </div><!-- /.post-meta-top -->

        <div class="clearboth"></div>

        {$entry.body}

    {if $entry.is_extended}
        <div class="serendipity_entry_extended"><a id="extended"></a>{$entry.extended}</div>
    {/if}

    {if $entry.has_extended and not $is_single_entry and not $entry.is_extended}
        <br /><a href="{$entry.link}#extended">{$CONST.VIEW_EXTENDED_ENTRY|@sprintf:$entry.title} &raquo;</a><br /><br />
    {/if}

        <div class="post-bottom">
            {$entry.add_footer}
            {$entry.plugin_display_dat}
    {if $entry.categories}
            <div class="cat"><span>{foreach from=$entry.categories item="entry_category" name="categories"}<a href="{$entry_category.category_link}">{$entry_category.category_name|@escape}</a>{if not $smarty.foreach.categories.last}, {/if}{/foreach}</span></div>
    {/if}
            <div class="clearfix"></div>
        </div><!-- /.post-bottom -->

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

        <div id="comments-wrap">
        {if $is_single_entry and not $use_popups and not $is_preview}
            {if $CONST.DATA_UNSUBSCRIBED}
                <p class="serendipity_center serendipity_msg_notice">{$CONST.DATA_UNSUBSCRIBED|@sprintf:$CONST.UNSUBSCRIBE_OK}</p>
            {/if}

            {if $CONST.DATA_TRACKBACK_DELETED}
                <p class="serendipity_center serendipity_msg_notice">{$CONST.DATA_TRACKBACK_DELETED|@sprintf:$CONST.TRACKBACK_DELETED}</p>
            {/if}

            {if $CONST.DATA_TRACKBACK_APPROVED}
                <p class="serendipity_center serendipity_msg_notice">{$CONST.DATA_TRACKBACK_APPROVED|@sprintf:$CONST.TRACKBACK_APPROVED}</p>
            {/if}

            {if $CONST.DATA_COMMENT_DELETED}
                <p class="serendipity_center serendipity_msg_notice">{$CONST.DATA_COMMENT_DELETED|@sprintf:$CONST.COMMENT_DELETED}</p>
            {/if}

            {if $CONST.DATA_COMMENT_APPROVED}
                <p class="serendipity_center serendipity_msg_notice">{$CONST.DATA_COMMENT_APPROVED|@sprintf:$CONST.COMMENT_APPROVED}</p>
            {/if}

            <div class="serendipity_section_trackbacks">
                <a id="trackbacks"></a>

                <h6 class="comments">{$CONST.TRACKBACKS}</h6>
                <p class="serendipity_center"><a rel="nofollow" style="font-weight: normal" href="{$entry.link_trackback}" onclick="alert('{$CONST.TRACKBACK_SPECIFIC_ON_CLICK|@escape:html}'); return false;" title="{$CONST.TRACKBACK_SPECIFIC_ON_CLICK|@escape}">{$CONST.TRACKBACK_SPECIFIC}</a></p>

                {serendipity_printTrackbacks entry=$entry.id}
            </div>
        {/if}

        {if $is_single_entry and not $is_preview}
            <div class="serendipity_section_comments">
                <a id="comments"></a>

                <h6 class="comments">{$CONST.COMMENTS}</h6>

                {serendipity_printComments entry=$entry.id mode=$entry.viewmode}

                {if $entry.is_entry_owner}
                    {if $entry.allow_comments}
                    <p class="serendipity_center"><a href="{$entry.link_deny_comments}">{$CONST.COMMENTS_DISABLE}</a></p>
                    {else}
                    <p class="serendipity_center"><a href="{$entry.link_allow_comments}">{$CONST.COMMENTS_ENABLE}</a></p>
                    {/if}
                {/if}

                <a id="feedback"></a>

                {foreach from=$comments_messagestack item="message"}
                <p class="serendipity_center serendipity_msg_important">{$message}</p>
                {/foreach}

                {if $is_comment_added}
                <p class="serendipity_center serendipity_msg_notice">{$CONST.COMMENT_ADDED}</p>
                {elseif $is_comment_moderate}
                <p class="serendipity_center serendipity_msg_notice">{$CONST.COMMENT_ADDED}<br />{$CONST.THIS_COMMENT_NEEDS_REVIEW}</p>
                {elseif not $entry.allow_comments}
                <p class="serendipity_center serendipity_msg_important">{$CONST.COMMENTS_CLOSED}</p>
                {else}
                <div class="serendipity_section_commentform">
                    <h6 class="postcomment">{$CONST.ADD_COMMENT}</h6>
                    {$COMMENTFORM}
                </div>
                {/if}
            </div>
        {/if}
        </div><!-- /#comments-wrap -->
        {$entry.backend_preview}
        {/foreach}
    {foreachelse}
    {if not $plugin_clean_page}
        {$CONST.NO_ENTRIES_TO_PRINT}
    {/if}
    {/foreach}

    <div class="page-nav">
        <div class="nav-previous">{if $footer_prev_page}<a href="{$footer_prev_page}">{$CONST.PREVIOUS_PAGE}</a>{/if}</div>
        <div class="nav-next">{if $footer_next_page}<a href="{$footer_next_page}">{$CONST.NEXT_PAGE}</a>{/if}</div>
    {serendipity_hookPlugin hook="entries_footer"}
    </div><!-- /.page-nav -->
<!-- ENTRIES END -->

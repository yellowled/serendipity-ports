<!-- ENTRIES START -->
    {serendipity_hookPlugin hook="entries_header" addData="$entry_id"}

    {foreach from=$entries item="dategroup"}
    {foreach from=$dategroup.entries item="entry"}
    {assign var="entry" value=$entry scope="parent"}
        <div class="post" id="post-{$entry.id}">
            <h2 class="title"><a href="{$entry.link}#content" title="{$entry.title}">{$entry.title}</a></h2>

            <p class="meta">
                <span class="author"><a href="{$entry.link_author}">{$entry.author}</a> &raquo; </span>
                <span class="date">{if $dategroup.is_sticky}{$CONST.STICKY_POSTINGS}{else}{$entry.timestamp|@formatTime:'%d %B %Y'}{/if} &raquo; </span>
                {if $entry.categories}<span class="category">{$CONST.IN} {foreach from=$entry.categories item="entry_category" name="categories"}<a href="{$entry_category.category_link}">{$entry_category.category_name|@escape}</a>{if not $smarty.foreach.categories.last}, {/if}{/foreach}  &raquo; </span>{/if}
                {if $entry.has_comments}<span class="comments">{if $use_popups}<a href="{$entry.link_popup_comments}" onclick="window.open(this.href, 'comments', 'width=480,height=480,scrollbars=yes'); return false;">{$entry.comments} {$entry.label_comments}</a>{else}<a href="{$entry.link}#comments">{$entry.comments} {$entry.label_comments}</a>{/if}</span>{/if}
                {if $entry.is_entry_owner and not $is_preview} &#124; <a href="{$entry.link_edit}">{$CONST.EDIT_ENTRY}</a>{/if}
            </p>

            <div class="entry clearfix">
                {$entry.body}
              {if $entry.is_extended}
                <div class="serendipity_entry_extended">
                    <a id="extended"></a>
                    {$entry.extended}
                </div>
              {/if}
            </div>

            {if $entry.has_extended and not $is_single_entry and not $entry.is_extended}
            <p class="more alignr"><a href="{$entry.link}#extended">{$CONST.VIEW_EXTENDED_ENTRY|@sprintf:$entry.title}</a></p>
            {/if}

            {$entry.add_footer}
            {$entry.plugin_display_dat}

            {if $is_single_entry}
            <p class="trackback"><a rel="nofollow" style="font-weight: normal" href="{$entry.link_trackback}" onclick="alert('{$CONST.TRACKBACK_SPECIFIC_ON_CLICK|@escape:html}'); return false;" title="{$CONST.TRACKBACK_SPECIFIC_ON_CLICK|@escape}">{$CONST.TRACKBACK_SPECIFIC}</a></p>
            {/if}
        </div>

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
        {/if}

        {if $is_single_entry and not $is_preview}
            {assign var="to" value=$CONST.BASE_TO}
            <div id="comments">
                <h3><strong>{$entry.comments} {$entry.label_comments}</strong> {$to} &quot;{$entry.title}&quot;</h3>
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

                <h3><strong>{$entry.trackbacks} {$entry.label_trackbacks}</strong> {$to} &quot;{$entry.title}&quot;</h3>
                {serendipity_printTrackbacks entry=$entry.id}

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
                <div id="formsblock" class="clearfix">
                    <h3 class="hi">{$CONST.ADD_COMMENT}</h3>
                    {$COMMENTFORM}
                </div>
                {/if}
            </div>
        {/if}
        {$entry.backend_preview}
        {/foreach}
    {foreachelse}
    {if not $plugin_clean_page}
        <p>{$CONST.NO_ENTRIES_TO_PRINT}</p>
    {/if}
    {/foreach}

    <div class="serendipity_entryFooter clearfix" style="text-align: center">
    {if $footer_info}
        ({$footer_info})
    {/if}
    {if $footer_prev_page}
        <a href="{$footer_prev_page}" class="floatl">&laquo; {$CONST.PREVIOUS_PAGE}</a>
    {/if}
    {if $footer_next_page}
        <a href="{$footer_next_page}" class="floatr">{$CONST.NEXT_PAGE} &raquo;</a>
    {/if}

    {serendipity_hookPlugin hook="entries_footer"}
    </div>
<!-- ENTRIES END -->

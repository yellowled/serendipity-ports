<!-- ENTRIES START -->
    {serendipity_hookPlugin hook="entries_header" addData="$entry_id"}
    {assign var="jwith" value=$CONST.J_WITH}
    {assign var="jwout" value=$CONST.J_WITHOUT}
    {assign var="jpost" value=$CONST.J_POSTED}
    {assign var="jcomm" value=$CONST.J_COMMTS}
    {assign var="jto" value=$CONST.J_TO}
    {foreach from=$entries item="dategroup"}
    {foreach from=$dategroup.entries item="entry"}
    {assign var="entry" value=$entry scope="parent"}
        <h2 id="post-{$entry.id}"><a href="{$entry.link}" rel="bookmark">{$entry.title}</a>{if $dategroup.is_sticky} ({$CONST.STICKY_POSTINGS}){/if}</h2>

      {if $entry.has_comments}
        <p class="comments">
        {if $use_popups}
            <a href="{$entry.link_popup_comments}" onclick="window.open(this.href, 'comments', 'width=480,height=480,scrollbars=yes'); return false;">{if $entry.comments == 0}{$jwout} {else}{$jwith} {$entry.comments} {/if}{if $entry.comments > 1}{$jcomm}{else}{$entry.label_comments}{/if}</a>
        {else}
            <a href="{$entry.link}#comments">{if $entry.comments == 0}{$jwout} {else}{$jwith} {$entry.comments} {/if}{if $entry.comments > 1}{$jcomm}{else}{$entry.label_comments}{/if}</a>
        {/if}
        </p>
      {/if}

        <div class="main">
        {$entry.body}
      {if $entry.is_extended}
        <a id="extended"></a>
        {$entry.extended}
      {/if}
      {if $entry.has_extended and not $is_single_entry and not $entry.is_extended}
         <p><a href="{$entry.link}#extended">{$CONST.VIEW_EXTENDED_ENTRY|@sprintf:$entry.title} &raquo;</a></p>
      {/if}
        </div>

        <div class="meta group">
            <div class="signature">
                <p>{$CONST.POSTED_BY} {$entry.author} {if $entry.is_entry_owner and not $is_preview}<span class="edit"><a href="{$entry.link_edit}">Edit</a></span>{/if}</p>
                <p>{$entry.timestamp|@formatTime:'%x'} {$CONST.AT} {$entry.timestamp|@formatTime:'%X'}</p>
            </div>
            <div class="tags">
            {if $entry.categories}
                <p>{$jpost} {$CONST.IN} {foreach from=$entry.categories item="entry_category" name="categories"}<a href="{$entry_category.category_link}">{$entry_category.category_name|@escape}</a>{if not $smarty.foreach.categories.last}, {/if}{/foreach}</p>
            {/if}
            {$entry.freetag}
            {$entry.add_footer}
            </div>
        </div>

        <div class="addfooter"></div>

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
            <h3 class="reply">{$entry.trackbacks} {$entry.label_trackbacks} {$jto} {$entry.title}</h3>

            <p class="comment_meta"><a rel="nofollow" style="font-weight: normal" href="{$entry.link_trackback}" onclick="alert('{$CONST.TRACKBACK_SPECIFIC_ON_CLICK|@escape:html}'); return false;" title="{$CONST.TRACKBACK_SPECIFIC_ON_CLICK|@escape}">{$CONST.TRACKBACK_SPECIFIC}</a></p>

            {serendipity_printTrackbacks entry=$entry.id}
        {/if}

        {if $is_single_entry and not $is_preview}
            <a id="comments"></a>
            <h3 class="reply">{$entry.comments} {$entry.label_comments} {$jto} {$entry.title}</h3>

            {serendipity_printComments entry=$entry.id mode=$entry.viewmode}

          {if $entry.is_entry_owner}
            {if $entry.allow_comments}
            <p class="comment_meta"><a href="{$entry.link_deny_comments}">{$CONST.COMMENTS_DISABLE}</a></p>
            {else}
            <p class="comment_meta"><a href="{$entry.link_allow_comments}">{$CONST.COMMENTS_ENABLE}</a></p>
            {/if}
          {/if}

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
            <h3 class="reply">{$CONST.ADD_COMMENT}</h3>
            {$COMMENTFORM}
          {/if}
        {/if}
        {$entry.backend_preview}
        {/foreach}
    {foreachelse}
    {if not $plugin_clean_page}
        <div class="warning"><p>{$CONST.NO_ENTRIES_TO_PRINT}</p></div>
    {/if}
    {/foreach}

    <div class="navigation group">
        <div class="alignleft">{if $footer_prev_page}<a href="{$footer_prev_page}">&laquo; {$CONST.PREVIOUS_PAGE}</a>{/if}</div>
        <div class="alignright">{if $footer_next_page}<a href="{$footer_next_page}">{$CONST.NEXT_PAGE} &raquo;</a>{/if}</div>
    {serendipity_hookPlugin hook="entries_footer"}
    </div>
<!-- ENTRIES END -->

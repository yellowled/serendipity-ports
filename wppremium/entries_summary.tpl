{serendipity_hookPlugin hook="entries_header"}

<h1 class="btmspace">{$CONST.TOPICS_OF} {$dateRange.0|@formatTime:"%B %Y"}</h1>

{foreach from=$entries item="entries"}
    {foreach from=$entries.entries item="entry"}
    {if $entry.has_comments}
	<div class="comm"><span>{if $use_popups}<a href="{$entry.link_popup_comments}" onclick="window.open(this.href, 'comments', 'width=480,height=480,scrollbars=yes'); return false;">{$entry.comments}</a>{else}<a href="{$entry.link}#comments">{$entry.comments}</a>{/if}</span></div>
    {/if}

        <h3 class="h1" id="post-{$entry.id}"><a href="{$entry.link}" rel="bookmark" title="Permanent Link to {$entry.title}">{$entry.title}</a></h3>

        <div class="post-meta-top">
            <div class="auth">{$CONST.POSTED_BY} <span><strong><a href="{$entry.link_author}">{$entry.author}</a></strong></span></div>
            <div class="date"><span> {$CONST.ON} <strong>{$entry.timestamp|@formatTime:DATE_FORMAT_ENTRY}</strong></span></div>
        </div><!-- /.post-meta-top -->

        <div class="clearboth"></div>

	<hr />		
    {/foreach}
{/foreach}

<div class="page-nav">
{serendipity_hookPlugin hook="entries_footer"}
</div>

<!-- LATEST START -->
{serendipity_hookPlugin hook="entries_header" addData="$entry_id"}
{foreach from=$entries item="dategroup"}
{foreach from=$dategroup.entries item="entry"}
    <h1 class="title"><a href="{$entry.link}" rel="bookmark">{$entry.title}</a>{if $dategroup.is_sticky} ({$CONST.STICKY_POSTINGS}){/if}</h1>

    <p class="meta"><small class="author">{$CONST.POSTED_BY} <a href="{$entry.link_author}">{$entry.author}</a></small> <small class="date">{$entry.timestamp|@formatTime:DATE_FORMAT_ENTRY}</small></p>

    <div class="entry">
        {$entry.body}
    {if $entry.has_extended and not $is_single_entry and not $entry.is_extended}
        <p><a href="{$entry.link}#extended">{$CONST.VIEW_EXTENDED_ENTRY|@sprintf:$entry.title}</a></p>
    {/if}
    </div>

    {$entry.add_footer}
    {$entry.plugin_display_dat}

    <p class="links">{if $entry.categories}{$CONST.IN} {foreach from=$entry.categories item="entry_category" name="categories"}<a href="{$entry_category.category_link}">{$entry_category.category_name|@escape}</a>{if not $smarty.foreach.categories.last}, {/if}{/foreach}{/if}{if $entry.is_entry_owner and not $is_preview} &nbsp;&nbsp;|&nbsp;&nbsp; <a href="{$entry.link_edit}">{$CONST.EDIT_ENTRY}</a>{/if}{if $entry.has_comments}{if $use_popups} &nbsp;&nbsp;|&nbsp;&nbsp; <a href="{$entry.link_popup_comments}" onclick="window.open(this.href, 'comments', 'width=480,height=480,scrollbars=yes'); return false;">{$entry.comments}&nbsp;{$entry.label_comments}</a>{else} &nbsp;&nbsp;|&nbsp;&nbsp; <a href="{$entry.link}#comments">{$entry.comments}&nbsp;{$entry.label_comments}</a>{/if}{/if}</p>
{/foreach}
{/foreach}
{serendipity_hookPlugin hook="entries_footer"}
<!-- LATEST END -->
